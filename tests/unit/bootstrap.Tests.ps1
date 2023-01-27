BeforeAll {
    $Bootware = "$PSScriptRoot/../../bootware.ps1"
    . "$Bootware"

    Mock FindConfigPath {
        $Global:RetVal = 'C:\Users\Administrator\.bootware\config.yaml'
    }
    Mock FindRelativeIP { Write-Output '192.48.16.0' }
    Mock Setup { }

    # Flatten array logic taken from https://stackoverflow.com/a/712205.
    If (Get-Command wsl -ErrorAction SilentlyContinue) {
        Mock wsl { Write-Output "wsl $($Args | ForEach-Object {$_})" }
    }
    Else {
        Function wsl() {
            Write-Output "wsl $($Args | ForEach-Object {$_})"
        }
    }
}

Describe 'Bootstrap' {
    It 'Subcommand finds first task associated with role' {
        $Env:BOOTWARE_NOLOG = 1
        $Playbook = "$(Get-Location)\playbook.yaml"
        $Expected = 'wsl bootware bootstrap --windows --config ' `
            + '/mnt/c/Users/Administrator/.bootware/config.yaml --inventory ' `
            + "192.48.16.0, --playbook $(WSLPath $Playbook) " `
            + "--private-key `$HOME/.ssh/bootware --skip none " `
            + "--ssh-extra-args '-o StrictHostKeyChecking=no' " `
            + "--tags desktop --user $Env:UserName " `
            + '--start-at-task Install Deno for FreeBSD'

        $Actual = "$(& "$Bootware" bootstrap --start-at-role deno --playbook "$Playbook")"
        $Actual | Should -Be $Expected
    }

    It 'Subcommand passes default arguments to WSL copy of Bootware' {
        $Env:BOOTWARE_NOLOG = 1
        $Expected = 'wsl bootware bootstrap --windows --config ' `
            + '/mnt/c/Users/Administrator/.bootware/config.yaml --inventory ' `
            + '192.48.16.0, --playbook /mnt/c/Fake/path/repo/playbook.yaml ' `
            + "--private-key `$HOME/.ssh/bootware --skip none " `
            + "--ssh-extra-args '-o StrictHostKeyChecking=no' --tags desktop " `
            + "--user $Env:UserName"

        $Actual = "$(& "$Bootware" bootstrap --playbook C:/Fake\path/repo/playbook.yaml)"
        $Actual | Should -Be $Expected
    }

    It 'Subcommand passes debug argument to WSL copy of Bootware' {
        $Env:BOOTWARE_NOLOG = 1
        $Expected = 'wsl bootware bootstrap --windows --config ' `
            + '/mnt/c/Users/Administrator/.bootware/config.yaml --inventory ' `
            + '192.48.16.0, --playbook /mnt/c/Fake/path/repo/playbook.yaml ' `
            + "--private-key `$HOME/.ssh/bootware --skip python,rust " `
            + "--ssh-extra-args '-o StrictHostKeyChecking=no' " `
            + "--tags fd,go --user $Env:UserName --debug"

        $Actual = "$(& "$Bootware" bootstrap --debug --playbook `
            C:/Fake\path/repo/playbook.yaml --skip python,rust --tags fd,go)"
        $Actual | Should -Be $Expected
    }

    It 'Subcommand passes list arguments to WSL copy of Bootware' {
        $Env:BOOTWARE_NOLOG = 1
        $Expected = 'wsl bootware bootstrap --windows --config ' `
            + '/mnt/c/Users/Administrator/.bootware/config.yaml --inventory ' `
            + '192.48.16.0, --playbook /mnt/c/Fake/path/repo/playbook.yaml ' `
            + "--private-key `$HOME/.ssh/bootware --skip python,rust " `
            + "--ssh-extra-args '-o StrictHostKeyChecking=no' " `
            + "--tags fd,go --user $Env:UserName"

        $Actual = "$(& "$Bootware" bootstrap --playbook `
            C:/Fake\path/repo/playbook.yaml --skip python,rust --tags fd,go)"
        $Actual | Should -Be $Expected
    }

    It 'Subcommand passes extra arguments to WSL copy of Bootware' {
        $Env:BOOTWARE_NOLOG = 1
        $Expected = 'wsl bootware bootstrap --windows --config ' `
            + '/mnt/c/Users/Administrator/.bootware/config.yaml --inventory ' `
            + '192.48.16.0, --playbook /mnt/c/Fake/path/repo/playbook.yaml ' `
            + "--private-key `$HOME/.ssh/bootware --skip python,rust " `
            + "--ssh-extra-args '-o StrictHostKeyChecking=no' " `
            + "--tags fd,go --user $Env:UserName --timeout 60"

        $Actual = "$(& "$Bootware" bootstrap --playbook `
            C:/Fake\path/repo/playbook.yaml --skip python,rust --timeout 60 `
            --tags fd,go)"
        $Actual | Should -Be $Expected
    }
}

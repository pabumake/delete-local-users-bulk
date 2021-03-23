# Specifiy Usernames without DOMAIN\ or LOCALCOMPUTER\

$userlist = @('User1','User2')

foreach ($user in $userlist) 
{
    Invoke-Command -ScriptBlock {
        param($user)
        $localpath = 'c:\users\' + $user
        Get-WmiObject -Class Win32_UserProfile | Where-Object {$_.LocalPath -eq $localpath} | 
        Remove-WmiObject
    } -ArgumentList $user
}


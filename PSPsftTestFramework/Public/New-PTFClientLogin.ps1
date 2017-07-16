Function New-PTFClientLogin {
    
   <#
    .SYNOPSIS
        Returns new PTF client login object

    .DESCRIPTION
        Returns new PTF client login object

    .PARAMETER ClientPath
        TODO
		
    .PARAMETER Server
        TODO
        
    .PARAMETER Node
        TODO
        
    .PARAMETER User
        TODO
        
    .PARAMETER Password
        TODO
			
    .FUNCTIONALITY
        Returns new PTF client login object
        
    .EXAMPLE
        $login = New-PTFClientLogin -Server 'server.com:9000' -Node 'PT_LOCAL' -User 'PS' -Password 'PS'

        # Minimal mandatory paramerters using default client installation path
        
    .EXAMPLE
        $login = New-PTFClientLogin -ClientPath = 'C:\Program Files\PeopleSoft\PeopleSoft Test Framework' -Server 'server.com:9000' -Node 'PT_LOCAL' -User 'PS' -Password 'PS'
        
	.LINK
        http://github.com/TODO

	.LINK
        http://docs.oracle.com/cd/E66686_01/pt855pbr1/eng/pt/tptf/task_ExecutingTests-ea7f8b.html#u0e197265-aed9-4c89-b83e-956480dd8a2c
        
	.LINK
        https://goo.gl/BrltgI
		
    .LINK
        Start-PTFRun

    .LINK
        New-PTFClientLogin

    #>
    [cmdletbinding()]
    param(
        [parameter(ValueFromPipelineByPropertyName = $True)]
        [string]$ClientPath = 'C:\Program Files\PeopleSoft\PeopleSoft Test Framework',
        [parameter(ValueFromPipelineByPropertyName = $True, Mandatory=$true)]
        [string]$Server, 
        [parameter(ValueFromPipelineByPropertyName = $True, Mandatory=$true)]
        [string]$Node, 
        [parameter(ValueFromPipelineByPropertyName = $True, Mandatory=$true)]
        [string]$User, 
        [parameter(ValueFromPipelineByPropertyName = $True, Mandatory=$true)]
        [string]$Password
    )
    Begin
    {}
    Process
    {
        Write-Debug ( "Running $($MyInvocation.MyCommand).`n" +
                        "PSBoundParameters:`n$($PSBoundParameters | Format-List | Out-String)" +
                        "Get-SEObject parameters:`n$($GSOParams | Format-List | Out-String)" )

        Try
        {
            $properties = @{'ClientPath'=$ClientPath;
                            'Server'=$Server;
                            'Node'=$Node;
                            'User'=$User;
                            'Password'=$Password}
            $object = New-Object –TypeName PSObject –Prop $properties            
            $object.PSObject.TypeNames.Insert(0, "PTFClientLogin")

            return $object
        }
        Catch
        {
            Throw $_
        }
    }
    End
    {}
}
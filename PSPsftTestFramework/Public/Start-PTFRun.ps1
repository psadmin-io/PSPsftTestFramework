Function Start-PTFRun {
    <#
    .SYNOPSIS
        Start a PTF run

    .DESCRIPTION
        Start a PTF run

    .PARAMETER ClientLogin
        ClientLogin variable that holds PTF client login parameters
		
    .PARAMETER Two
        PTFRun variable that holds PTF run parameters
			
    .FUNCTIONALITY
        Used to start a PTF run

    .EXAMPLE
        Start-PTFRun -ClientLogin $login -Run $run
	
	.EXAMPLE
        $runs | Start-PTFRun -ClientLogin $login 
        
	.LINK
        http://github.com/TODO

	.LINK
        http://docs.oracle.com/cd/E66686_01/pt855pbr1/eng/pt/tptf/task_ExecutingTests-ea7f8b.html#u0e197265-aed9-4c89-b83e-956480dd8a2c
        
	.LINK
        https://goo.gl/BrltgI
		
    .LINK
        New-PTFRun

    .LINK
        New-PTFClientLogin

    #>
    [cmdletbinding()]
    param(
        [parameter( ValueFromPipelineByPropertyName = $True,
                    Mandatory=$true)]
        [PSObject]$ClientLogin,
        [parameter(
                    ValueFromPipeline = $True,
                    ValueFromPipelineByPropertyName = $True,
                    Mandatory=$true)]
        [PSObject]$Run
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
			$return = Start-Process -FilePath "$($ClientLogin.ClientPath)\PsTestFw" -ArgumentList "-CS=$($ClientLogin.Server) -CNO=$($ClientLogin.Node) -CO=$($ClientLogin.User) -CP=$($ClientLogin.Password) -TST=$($Run.Test) -TC=$($Run.TestCase) -EXO=$($Run.ExecutionOptions) -LOG=$($Run.Log) -PFX=$($Run.Prefix)" -NoNewWindow -Wait
			$properties = @{'Text'="Started $($Run.Test) $($Run.TestCase) $($Run.Prefix)";
                        'ReturnCode'=$return}
            $output = New-Object –TypeName PSObject –Prop $properties
            
            Write-Output $output
        }
        Catch
        {
            Throw $_
        }
    }
    End
    {}
}
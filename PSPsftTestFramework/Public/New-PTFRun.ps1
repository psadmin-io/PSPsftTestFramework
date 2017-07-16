Function New-PTFRun {
   <#
    .SYNOPSIS
        Returns new PTF run object

    .DESCRIPTION
        Returns new PTF run object

    .PARAMETER ExecutionOptions
        TODO
		
    .PARAMETER Test
        TODO
        
    .PARAMETER TestCase
        TODO
        
    .PARAMETER Prefix
        TODO
        
    .PARAMETER Log
        TODO
			
    .FUNCTIONALITY
        Returns new PTF run object
        
    .EXAMPLE
        $run = New-PTFRun -ExecutionOptions 'TEST_Verbose' -Test 'TEST_123'

        # Minimal mandatory paramerters with defaults
        # TestCase = 'DEFAULT'
        # Log = "$Test-$TestCase"

    .EXAMPLE
        $run = New-PTFRun -ExecutionOptions 'TEST_Verbose' -Test 'TEST_123' -TestCase 'NOT_DEFAULT' -Prefix 'MYRUN' -Log 'LOGNAME'
        
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
        [parameter(ValueFromPipelineByPropertyName = $True, Mandatory=$true)]
        [string]$ExecutionOptions,
        [parameter(ValueFromPipelineByPropertyName = $True, Mandatory=$true)]
        [string]$Test, 
        [parameter(ValueFromPipelineByPropertyName = $True)]
        [string]$TestCase = 'DEFAULT',
        [parameter(ValueFromPipelineByPropertyName = $True)]
        [string]$Prefix,   
        [parameter(ValueFromPipelineByPropertyName = $True)]
        [string]$Log = "$Test-$TestCase"
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
            $properties = @{'Name'=$Name;
                            'ExecutionOptions'=$ExecutionOptions;
                            'Test'=$Test;
                            'TestCase'=$TestCase;
                            'Prefix'=$Prefix;
                            'Log'=$Log}
            $object = New-Object –TypeName PSObject –Prop $properties
            $object.PSObject.TypeNames.Insert(0, "PTFRun")

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
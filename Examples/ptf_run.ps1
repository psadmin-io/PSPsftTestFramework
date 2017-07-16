# PTF Run
# Source properties
. $PSScriptRoot\ptf_props.ps1

# Process tests
 foreach ($testProps in $tests) {
	$test = $testProps[0]
	$case = $testProps[1]
	$prefix = $testProps[2]
	$log = "$test-$case"
	
	Write-Host "Starting $test $case $prefix " -NoNewLine
	$return = Start-Process -FilePath "$ptf_path\PsTestFw" -ArgumentList "-CS=$server -CNO=$node -CO=$user -CP=$pass -TST=$test -TC=$case -EXO=$exeopt -LOG=$log -PFX=$prefix"  -NoNewWindow -Wait
	Write-Host "   $return" -NoNewLine 
	Write-Host "          [ Done ]" -foreground "green"
 }
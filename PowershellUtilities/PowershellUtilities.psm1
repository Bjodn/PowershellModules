function openPsProfiles {
	code $PROFILE
}


# Takes a functionname as a argument and print the definiton/contain of it
function printFunction {
	(Get-Command $args[0]).Definition
}


function overwriteFileWithBackup {
	$input = Get-Content $args[0];
	$fileToOverwriteWithPath = $args[1];
	$fileToOverwrite = Get-ChildItem $fileToOverwriteWithPath;
	$path = Split-Path $fileToOverwriteWithPath;

	Copy-Item $fileToOverwrite "$($path)\BACKUP-$($fileToOverwrite.name)";
	$input | Set-Content $fileToOverwrite;
}

#Has to be at bottom?
function overwriteAndReloadProfile {
	# TODO abort if arg is null or empty
	overwriteFileWithBackup $args[0] $profile;
}




Export-ModuleMember -Function "openPsProfiles"
Export-ModuleMember -Function "printFunction"
Export-ModuleMember -Function "mainTestFunction"



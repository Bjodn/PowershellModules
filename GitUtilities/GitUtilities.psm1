
function gitCommitAndPush ($gitComment) {
	if ($null -eq $gitComment -or $gitComment -eq "") {
		Write-Output "Git comment is missing"
		return
	}

	Write-Output "Commiting with comment: $($gitComment)" 
	git commit -m $args[0];
	Write-Output "Pushing commit"
	git push;	
}

function gitCommitAmendAndForcePush ($gitComment) {

	$prompt = Read-Host -Prompt "Ammend commit and force push? (y/n)";
	if ($prompt -ne "y" -and $prompt -ne "yes") {
		return;
	}

	if($gitComment) {
		Write-Output "Ammending commit with new comment: $($gitComment)" 
		git commit --amend -m $gitComment;
	}else {
		Write-Output "Ammending commit without editing git comment" 
		git commit --amend --no-edit;
	}
	Write-Output "Force pushing commit"
	git push -f;	
}


Export-ModuleMember -Function "gitCommitAndPush"
Export-ModuleMember -Function "gitCommitAmendAndForcePush"

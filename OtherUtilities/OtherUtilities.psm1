

function sublime {
	Write-Output "Opening Sublime Text"
	& 'C:\Program Files\Sublime Text 3\subl.exe' $args[0]
}


function npmRunScript {
	npm run-script $args[0]
}


Export-ModuleMember -Function "sublime"
Export-ModuleMember -Function "npmRunScript"

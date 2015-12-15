This is the beginning of some documentation on how to handle these datasets in git.

#Format for saving files#
The files are CSV (comma-separated values) files. This means they are text files, which is important
because it simplifies both git's tracking of them and easy import into statistical software. 

Most people will probably want to work on the files in excel. Other spreadsheet software (e.g. Open 
Office, Libre Office, Numbers) was found to be very slow when working with files of this size. When 
working on the files in Excel however it is important that you save them using this specific protocol:

1) File > Save as....
2) choose "Windows Comma Separated" as the format. WARNING: This is not the same as "Comma Separated Values."

The reason we need to do it this is way is that the default CSV format in excel on Mac uses the wrong 
end of line encodings (\r) which basically confuse the hell out of git.  

Also, remember not to save it as an excel file. If you do, git will ignore it and you won't be able to commit
your changes. If you accidently do this, just open up the excel file and resave it asa Windows Comma 
Separated file. 

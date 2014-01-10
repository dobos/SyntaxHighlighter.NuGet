@echo off
@echo Downloading package

wget.exe -O syntaxhighlighter_3.0.83.zip http://alexgorbatchev.com/SyntaxHighlighter/download/download.php?sh_current

@echo Uncompressing package

7z x -y syntaxhighlighter_3.0.83.zip

@echo Building NuGet package
mkdir pkg\lib
mkdir pkg\tools
mkdir pkg\content
mkdir pkg\content\Scripts
mkdir pkg\content\Scripts\SyntaxHighlighter
mkdir pkg\content\Scripts\SyntaxHighlighter\scripts
mkdir pkg\content\Scripts\SyntaxHighlighter\styles

xcopy /E /R /Y syntaxhighlighter_3.0.83\scripts pkg\content\Scripts\SyntaxHighlighter\scripts
xcopy /E /R /Y syntaxhighlighter_3.0.83\styles pkg\content\Scripts\SyntaxHighlighter\styles

nuget pack pkg\SyntaxHighlighter.NuGet.nuspec


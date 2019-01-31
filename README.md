# Copyright Notice Attacher
Shell script for adding BSD-3 copyright notices to source files. 

Open source projects at Indiana University [must show the BSD-3 copyright notice at the top of each source file](https://indiana-university.github.io/).

## Usage

The `add-copyright.sh` shell script looks through the current directory and all subdirectories for source files associated with the following languages:

- C
- C++
- C#
- Clojure
- Common Lisp
- F#
- Haskell
- HTML
- Java
- JavaScript
- Matlab
- Python
- R
- Ruby
- SQL
- TypeScript
- XML

For each source file the script finds, it attaches the required BSD-3 copyright notice if the source file doesn't already have one. The script attaches the copyright notice to the top of the file using the comment syntax appropriate for the language.
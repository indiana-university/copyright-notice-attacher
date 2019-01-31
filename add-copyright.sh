#!/bin/bash

# Copyright (C) 2019 The Trustees of Indiana University
# SPDX-License-Identifier: BSD-3-Clause

add_copyright()
{
  FILE=$1
  NOTICE=$2

  if ! grep -q SPDX-License-Identifier $FILE
  then
    cat $NOTICE $FILE > $FILE.new && mv $FILE.new $FILE
  fi
}

add_copyright_php()
{
  # This alternate function is needed for PHP, since it has opening tags 
  # and comments can't be placed before them.
  
  FILE=$1
  FIND="<?php[ ]\{0,\}"
  REPLACE=""
  
  if ! grep -q SPDX-License-Identifier $FILE
  then
    sed -i '' "s/$FIND/$REPLACE/g" $FILE
    cat notices/php.txt $FILE > $FILE.new && mv $FILE.new $FILE
  fi
}

# C, C++, C#, Java, JavaScript, TypeScript
for i in $(find . -name '*.c' -o \
                  -name '*.cpp' -o \
                  -name '*.h' -o \
                  -name '*.cs' -o \
                  -name '*.java' -o \
                  -name '*.js' -o \
                  -name '*.ts' -o \
                  -name '*.tsx')
do
  add_copyright $i notices/c-js-java.txt
done

# F#
for i in $(find . -name '*.fs')
do
  add_copyright $i notices/fsharp.txt
done

# Haskell
for i in $(find . -name '*.hs')
do
  add_copyright $i notices/haskell.txt
done

# HTML, XML
for i in $(find . -name '*.html' -o \
                  -name '*.xml')
do
  add_copyright $i notices/html-xml.txt
done

# Clojure, Common Lisp
for i in $(find . -name '*.clj' -o \
                  -name '*.cljs' -o \
                  -name '*.cl' -o \
                  -name '*.lisp')
do
  add_copyright $i notices/lisp.txt
done

# Matlab
for i in $(find . -name '*.m')
do
  add_copyright $i notices/matlab.txt
done

# PHP
for i in $(find . -name '*.php')
do
  add_copyright_php $i
done

# Python, R, Ruby
for i in $(find . -name '*.py' -o \
                  -name '*.r' -o \
                  -name '*.rb')
do
  add_copyright $i notices/python-r-ruby.txt
done

# SQL
for i in $(find . -name '*.sql')
do
  add_copyright $i notices/sql.txt
done

echo "Copyright notices added to source files."
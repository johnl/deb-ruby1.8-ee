=begin
= NAME

ri1.8 - Ruby Information at your fingertips

= SYNOPSIS

ri1.8 [options] [names...]

= DESCRIPTION

((*ri1.8*)) displaies information on Ruby classes, modules, and methods.
You can give the names of classes or methods to see their documentation.
Partial names may be given: if the names match more than
one entity, a list will be shown, otherwise details on
that entity will be displayed.

Nested classes and modules can be specified using the normal
Name::Name notation, and instance methods can be distinguished
from class methods using "." (or "#") instead of "::".

For example:

  ri1.8 File
  ri1.8 File.new
  ri1.8 F.n
  ri1.8 zip

Note that shell quoting may be required for method names
containing punctuation:

  ri1.8 'Array.[]'
  ri1.8 compact\!

= OPTIONS

: --classes, -c
  Display the names of classes and modules we know about.

: --doc-dir, -d ((|dirname|))
  A directory to search for documentation. If not specified, we search the
  standard rdoc/ri directories.

: --format, -f ((|name|))
  Format to use when displaying output: ansi, bs, html, plain, simple.  Use
  'bs' (backspace) with most pager programs.  To use ANSI, either also use
  the -T option, or tell your pager to allow control characters.  (for
  example using the -R option to less.)

: --list-names, -l
  List all the names known to RDoc, one per line.

: --no-pager, -T
  Send output directly to stdout.

: --width, -w ((|width|))
  Set the width of the output.

: --version, -v
  Display the version of ri1.8.

: --help, -h
  Display help.

Options may also be passed in the 'RI' environment variable


=end

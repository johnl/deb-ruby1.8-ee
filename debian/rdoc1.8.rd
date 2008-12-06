=begin
= NAME

rdoc1.8 - Generate documentation from Ruby script files

= SYNOPSIS

  rdoc1.8 [options]  [names...]

= DESCRIPTION

Files are parsed, and the information they contain collected, before any
output is produced. This allows cross references between all files to be
resolved. If a name is a directory, it is traversed. If no names are
specified, all Ruby files in the current directory (and subdirectories) are
processed.

Available output formatters: chm, html, ri, xml

For information on where the output goes, use:

   rdoc --help-output

= OPTIONS

: --accessor, -A ((|accessorname[,..]|))
  comma separated list of additional class methods that should be treated
  like 'attr_reader' and friends. Option may be repeated. Each accessorname
  may have '=text' appended, in which case that text appears where the
  r/w/rw appears for normal accessors.

: --all, -a
  include all methods (not just public) in the output.

: --charset, -c ((|charset|))
  specifies HTML character-set

: --debug, -D
  displays lots on internal stuff

: --diagram, -d
  generate diagrams showing modules and classes.  You need dot V1.8.6 or
  later to use the --diagram option correctly. Dot is available from
  ((<URL:http://www.research.att.com/sw/tools/graphviz/>)).

: --exclude, -x ((|pattern|))
  do not process files or directories matching pattern. Files given
  explicitly on the command line will never be excluded.

: --extension, -E ((|new|))=((|old|))
  treat files ending with .new as if they ended with .old. Using '-E cgi=rb'
  will cause xxx.cgi to be parsed as a Ruby file

: --fileboxes, -F
  classes are put in boxes which represents files, where these classes
  reside. Classes shared between more than one file are shown with list of
  files that sharing them.  Silently discarded if --diagram is not given
  Experimental.

: --fmt, -f ((|formatname|))
  set the output formatter (see below).

: --help, -h
  print usage.

: --help-output, -O
  explain the various output options.

: --image-format, -I ((|(('gif|png|jpg|jpeg'))|))
  sets output image format for diagrams. Can be png, gif, jpeg, jpg. If this
  option is omitted, png is used. Requires --diagram.

: --include, -i ((|dir[,dir...]|))
  set (or add to) the list of directories to be searched when satisfying
  ((':include:')) requests. Can be used more than once.

: --inline-source, -S
  show method source code inline, rather than via a popup link.

: --line-numbers, -N
  include line numbers in the source code

: --main, -m ((|name|))
  ((|name|)) will be the initial page displayed.

: --merge, -M
  when creating ri output, merge processed classes into previously
  documented classes of the name name.

: --one-file, -1
  put all the output into a single file.

: --op, -o ((|dir|))
  set the output directory.

: --opname, -n ((|name|))
  set the ((|name|)) of the output. Has no effect for HTML.

: --promiscuous, -p
  When documenting a file that contains a module or class also defined in
  other files, show all stuff for that module/class in each files page. By
  default, only show stuff defined in that particular file.

: --quiet, -q
  don't show progress as we parse.

: --ri, -r
  generate output for use by 'ri.' The files are stored in the '.rdoc'
  directory under your home directory unless overridden by a subsequent --op
  parameter, so no special privileges are needed.

: --ri-site, -R
  generate output for use by 'ri.' The files are stored in a site-wide
  directory, making them accessible to others, so special privileges are
  needed.

: --ri-system, -Y
  generate output for use by 'ri.' The files are stored in a system-level
  directory, making them accessible to others, so special privileges are
  needed. This option is intended to be used during Ruby installations.

: --show-hash, -H
  a name of the form #name in a comment is a possible hyperlink to an
  instance method name. When displayed, the '#' is removed unless this
  option is specified.

: --style, -s ((|stylesheet-url|))
  specifies the URL of a separate stylesheet.

: --tab-width, -w ((|n|))
  set the width of tab characters (default 8).

: --template, -T ((|template-name|))
  set the template used when generating output.

: --title, -t ((|text|))
  set ((|text|)) as the title for the output.

: --version, -v
  display  RDoc's version.

: --webcvs, -W ((|url|))
  specify a URL for linking to a web frontend to CVS. If the URL contains a
  '%s', the name of the current file will be substituted; if the URL doesn't
  contain a '%s', the filename will be appended to it.

=end

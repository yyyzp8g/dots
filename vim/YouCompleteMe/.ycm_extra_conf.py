import os
import ycm_core

flags = [
        '-Wall',                    # enable warning
        '-Wextra',                  # some extra warning
        '-Werror',                  # make all warnings into errors
        '-Wno-long-long',           # no warn for long long
        '-Wno-variadic-macros',     # no variadic macro warn
        '-std=c++17',               # c++11 std
        '-x', 'c++',                # c++ lang
        '-I', os.path.abspath('.')  # current include dir
        ]

# current project include
if os.path.exists('./include'):
    flags.append("-I")
    flags.append(os.path.abspath('./include'))

# current project src include
if os.path.exists('./src') and os.path.exists('./src/include'):
    flags.append("-I")
    flags.append(os.path.abspath('./src/include'))

# append MYCPATH
mycpath = os.getenv("MYCPATH")
if mycpath:
    for cpath in mycpath.split(":"):
        flags.append("-I")
        flags.append(cpath)

compilation_database_folder = ''

if os.path.exists( compilation_database_folder ):
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]

def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )


def IsHeaderFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.h', '.hxx', '.hpp', '.hh' ]


def GetCompilationInfoForFile( filename ):
  if IsHeaderFile( filename ):
    basename = os.path.splitext( filename )[ 0 ]
    for extension in SOURCE_EXTENSIONS:
      replacement_file = basename + extension
      if os.path.exists( replacement_file ):
        compilation_info = database.GetCompilationInfoForFile(
          replacement_file )
        if compilation_info.compiler_flags_:
          return compilation_info
    return None
  return database.GetCompilationInfoForFile( filename )


def FlagsForFile( filename, **kwargs ):
  if not database:
    return {
      'flags': flags,
      'include_paths_relative_to_dir': DirectoryOfThisScript()
    }

  compilation_info = GetCompilationInfoForFile( filename )
  if not compilation_info:
    return None

  final_flags = list( compilation_info.compiler_flags_ )

  try:
    final_flags.remove( '-stdlib=libc++' )
  except ValueError:
    pass

  return {
    'flags': final_flags,
    'include_paths_relative_to_dir': compilation_info.compiler_working_dir_
  }

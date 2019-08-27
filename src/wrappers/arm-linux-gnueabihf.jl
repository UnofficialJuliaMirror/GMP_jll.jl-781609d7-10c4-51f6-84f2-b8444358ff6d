# Autogenerated wrapper script for GMP_jll for arm-linux-gnueabihf
export libgmp

## Global variables
const PATH_list = String[]
const LIBPATH_list = String[]
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libgmp`
const libgmp_splitpath = ["lib", "libgmp.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libgmp_path = ""

# libgmp-specific global declaration
# This will be filled out by __init__()
libgmp_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libgmp = "libgmp.so.10"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list

    global libgmp_path = abspath(joinpath(artifact"GMP", libgmp_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libgmp_handle = dlopen(libgmp_path)
    push!(LIBPATH_list, dirname(libgmp_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()


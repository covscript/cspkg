# Covariant Script Package Manager

## Dependency
+ [Covariant Script Interpreter](https://github.com/covscript/covscript): v3.3.5(STD210401) or newer version
+ [CovScript Process](https://github.com/covscript/covscript-process)
+ [CovScript Regex](https://github.com/covscript/covscript-regex)
+ [CovScript Codec](https://github.com/covscript/covscript-codec)
+ [CovScript cURL](https://github.com/covscript/covscript-curl)

## Usage
```
Usage: cspkg <commands> ... [options] ...

Commands:
    install   | -i  <Package>...  Install packages from remote source
    remove    | -r  <Package>...  Remove packages
    config    | -c  <Key>         Manage local configuration
    upgrade   | -u                Upgrade local packages
    list      | -l                List current packages
    help      | -h                Show help information
    version   | -v                Show version information

Options:
    --import                      scanning local CovScript packages
    --set     <Value>             Set a configuration key
    --unset                       Restore a configuration key to default
    --yes                         Cancel the prompt
```

## Build your package

### Step 1: Write your Package Description File
#### Package Description File Template:
```json
{
    "Name": "test",
    "Info": "Test Package",
    "Author": "Anonymous",
    "Version": "1.0.0",
    "Target": "URL to your package",
    "Dependencies": []
}

```
+ `Name` is the unique identifier of the package and cannot be repeated.
+ `Info` is the description of your package, should be short in one sentence.
+ `Author` is the name of the package author.
+ `Version` is the version of your package, which will be sorted in lexicographical order.
+ `Target` is the URL of your file(`.cse` or `.csp`), you can use GitHub as your server.
+ `Dependencies` is an array of package names you depend on.

#### Example:
```json
{
    "Name": "csdbc_mysql",
    "Info": "CSDBC MySQL Driver",
    "Author": "CovScript Organization",
    "Version": "1.0.0",
    "Target": "http://mirrors.covariant.cn/covscript/cspkg/universal/csdbc_mysql.csp",
    "Dependencies": [
        "database",
        "codec",
        "csdbc",
        "regex"
    ]
}
```
### Step 2: Upload your Package Description File
You can:
+ Upload with your project file to GitHub or other VCS (Recommended!!!)
+ Upload to dedicated server(mostly for releasing purpose)

### Step 3: Building your package
If your package is written in Covariant Script, there's no need for extra building. But if you are written and Covariant Script Extension, please follow [CSBuild Instruction](https://github.com/covscript/csbuild)(*under construction*).

### Step 4: Submit your Package to CSPKG Source
1. Fork [CSPKG Source GitHub Repository](https://github.com/covscript/cspkg-sources)
2. Fill the URL of your Package Description File to CSPKG Index File
    + Universal Package(No platform dependency): cspkg/universal.json
    + Platform Specified Package: cspkg/OS_Architectural.json
3. Create new pull request
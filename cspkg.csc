import sqlite
system.out.println("Covariant Script Package Manager")
var path=runtime.get_import_path().split({system.path.delimiter}).back()
if system.args.size()<2
    system.out.println("Error: No command.")
    system.out.println("Enter \"--help\" to view help.")
    system.exit(-1)
end
function get_file_name(path)
    var pos=path.rfind(to_string(system.path.separator),-1)
    if pos!=-1
        return path.substr(pos+1,path.size()-pos-1)
    else
        return path
    end
end
switch system.args.at(1)
    case "--help"
@begin
system.out.print("
    --install <name> Install a CovScript Package/Extension\n
    --uninstall <name> Uninstall a CovScript Package/Extension\n
    --list List Installed CovScript Package/Extension\n
    --help Print help infomation.\n
    --version Print version info.\n
")
@end
    end
    case "--version"
        system.out.println("cspkg v1.0.0")
    end
    case "--install"
        if system.args.size()!=3
            system.out.println("Wrong syntax.")
            system.exit(-1)
        end
        var file_name=get_file_name(clone(system.args.at(2)))
        if system.file.exists(path+system.path.separator+file_name)
            system.out.print("Target exists.Overrite?(y/n)")
        end
    end
end
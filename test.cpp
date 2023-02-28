#include <covscript/dll.hpp>
#include <covscript/cni.hpp>
#include <iostream>

CNI_ROOT_NAMESPACE
{
    void hello()
    {
        std::cout << "Hello, CovScript!" << std::endl;
    }
    CNI(hello)
}
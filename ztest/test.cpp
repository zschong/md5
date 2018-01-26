/**
 * @file test.cpp
 * @The test file of md5.
 * @author Jiewei Wei
 * @mail weijieweijerry@163.com
 * @github https://github.com/JieweiWei
 * @data Oct 19 2014
 *
 */

#include <time.h>
#include <stdio.h>
#include <iostream>
#include "../src/md5.h"

using std::cout;
using std::endl;

void printMD5(const string& message)
{
    cout << "md5(\"" << message << "\") = "
         << MD5(message).toStr() << endl;
}

int main()
{
    char buf[512];

    printMD5("");
    printMD5("a");
    printMD5("abc");
    printMD5("123456");
    printMD5("abcdefghijklmnopqrstuvwxyz");
    printMD5("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");

    snprintf(buf, sizeof(buf), "192.168.1.200:%u", time(0));
    printf("md5(%s)=[%s]\n", buf, MD5(string(buf)).toStr().data());

    return 0;
}

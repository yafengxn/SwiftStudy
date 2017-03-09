//: Playground - noun: a place where people can play

import UIKit

////////////////////访问控制

/*
 * * private -> internal -> public 范围依次扩大
 * * 一个app是一个App bundle 所以 大多数情况下，我们不需要明确地设置实体的访问级别
 * * Framework 向外公开的必须是public， 默认是Internal
 */

// 访问修饰符写在最前面
public class SomePublicClass {
    public var somePublicProperty = 0   // 显示的public类成员
    var someInternalProperty = 0        // 隐式的internal类成员
    private func comePrivateMethod() {}      // 显示的private类成员
}

internal class SomeInternalClass {
    var someInternalProperty = 0        // 隐式的internal类成员
    private func somePrivateMethod() {} // 显示的private 类成员
}

private class SomePrivateClass {
    var somePrivateProperty = 0     // 隐式的private 类成员
    func somePrivateMethod(){}
}

public var somePublicVariable = 0
internal let someInternalConstant = 0
private func somePrivateFunction() {}


// 元组的访问权限是根据最小的那个范围来定的，根据包含是变量的自动推断而来
//let someInternalClass = SomeInternalClass()
//let somePrivateClass = SomePrivateClass()
//private func someFunction() -> (SomeInternalClass, SomePrivateClass) {}   //方法返回元组，访问级别最低为private 所以，方法前必须加private 否则编译不通过

public class A {
    fileprivate func someMethod() {}
}

public class B: A {
    override internal func someMethod() {}  // 将只能在当前文件中访问的someMethod的访问范围扩大到当前模块； 还可以通过子类作为桥梁来访问父类的方法
}

public class C {
    fileprivate func someMethod() {}
}
internal class D: C {
    override internal func someMethod() {
        super.someMethod()
    }
}
private var privateInstance = SomePrivateClass()

struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1  // 用来记录被修改的次数
        }
    }
}
var stringToEdit = TrackedString()
stringToEdit.value = "hello"
stringToEdit.value += "world"
stringToEdit.value += "hahaha"
print("\(stringToEdit.numberOfEdits)")







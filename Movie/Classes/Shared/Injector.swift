import Swinject

final class Injector {

    static let shared = Injector.resolved()

    private static func resolved() -> Resolver {
        let assembler = Assembler()
        assembler.apply(assemblies: [
            HomeConfigurator()
        ])

        return assembler.resolver
    }
}

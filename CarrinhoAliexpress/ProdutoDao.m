
#import "ProdutoDao.h"
#import "DBManager.h"

@interface ProdutoDao()

@property NSMutableArray *produtos;
@property DBManager *dbManager;

@end

@implementation ProdutoDao

static ProdutoDao *instancia = nil;

+(ProdutoDao*) produtoDaoInstance {
    if (!instancia) {
        instancia = [ProdutoDao new];
    }
    
    return instancia;
}

-(id) init {
    self = [super init];
    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename: @"carrinho_aliexpres.sql"];
    [self carregaProdutos];
    
    return self;
}

-(void) carregaProdutos {
    NSString *query = @"SELECT * FROM produto";
    NSArray *rows = [self.dbManager loadDataFromDB: query];
    
    self.produtos = [NSMutableArray new];
    
    for (NSArray *row in rows) {
        Produto *prod = [Produto new];
        
        prod.codigo = [ row[0] integerValue ];
        prod.nome = row[1];
        prod.descricao = row[2];
        prod.valor = [ row[3] doubleValue ];
        
        [self.produtos addObject: prod];
    }
}
-(int) size{
    return [_produtos count];
}
-(Produto*) produtoNaLinha:(NSInteger)linha{
    return [_produtos objectAtIndex:linha];
}

@end

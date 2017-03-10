
#import <Foundation/Foundation.h>
#import "Produto.h"
#import "DBManager.h"

@interface ProdutoDao : NSObject

+(ProdutoDao*) produtoDaoInstance;

-(int) size;

-(Produto*) produtoNaLinha:(NSInteger) linha;

@end

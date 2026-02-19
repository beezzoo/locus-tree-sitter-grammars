#ifndef TREE_SITTER_TreeSitterGo_H_
#define TREE_SITTER_TreeSitterGo_H_

#include <stdlib.h>

typedef struct TSLanguage TSLanguage;

#ifdef __cplusplus
extern "C" {
#endif

const TSLanguage *tree_sitter_go(void);

#ifdef __cplusplus
}
#endif

#endif // TREE_SITTER_TreeSitterGo_H_

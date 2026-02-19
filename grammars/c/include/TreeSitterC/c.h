#ifndef TREE_SITTER_TreeSitterC_H_
#define TREE_SITTER_TreeSitterC_H_

#include <stdlib.h>

typedef struct TSLanguage TSLanguage;

#ifdef __cplusplus
extern "C" {
#endif

const TSLanguage *tree_sitter_c(void);

#ifdef __cplusplus
}
#endif

#endif // TREE_SITTER_TreeSitterC_H_

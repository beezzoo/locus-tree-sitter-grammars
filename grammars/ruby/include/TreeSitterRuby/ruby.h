#ifndef TREE_SITTER_TreeSitterRuby_H_
#define TREE_SITTER_TreeSitterRuby_H_

#include <stdlib.h>

typedef struct TSLanguage TSLanguage;

#ifdef __cplusplus
extern "C" {
#endif

const TSLanguage *tree_sitter_ruby(void);

#ifdef __cplusplus
}
#endif

#endif // TREE_SITTER_TreeSitterRuby_H_

#ifndef TREE_SITTER_TreeSitterJava_H_
#define TREE_SITTER_TreeSitterJava_H_

#include <stdlib.h>

typedef struct TSLanguage TSLanguage;

#ifdef __cplusplus
extern "C" {
#endif

const TSLanguage *tree_sitter_java(void);

#ifdef __cplusplus
}
#endif

#endif // TREE_SITTER_TreeSitterJava_H_

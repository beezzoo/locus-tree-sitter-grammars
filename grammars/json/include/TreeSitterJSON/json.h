#ifndef TREE_SITTER_TreeSitterJSON_H_
#define TREE_SITTER_TreeSitterJSON_H_

#include <stdlib.h>

typedef struct TSLanguage TSLanguage;

#ifdef __cplusplus
extern "C" {
#endif

const TSLanguage *tree_sitter_json(void);

#ifdef __cplusplus
}
#endif

#endif // TREE_SITTER_TreeSitterJSON_H_

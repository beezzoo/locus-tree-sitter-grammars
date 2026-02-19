#ifndef TREE_SITTER_TreeSitterMarkdown_H_
#define TREE_SITTER_TreeSitterMarkdown_H_

#include <stdlib.h>

typedef struct TSLanguage TSLanguage;

#ifdef __cplusplus
extern "C" {
#endif

const TSLanguage *tree_sitter_markdown(void);

#ifdef __cplusplus
}
#endif

#endif // TREE_SITTER_TreeSitterMarkdown_H_

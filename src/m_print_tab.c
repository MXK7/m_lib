#include "m.h"

void	m_print_tab(char **tab)
{
	int	i;

	i = -1;
	while (tab[i++])
		printf("TABLEAU [%d]: %s\n", i, tab[i]);
}
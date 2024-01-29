#include "m.h"

void	m_error(char *str)
{
	int	i;

	i = 0;
	while (str[i] != '\0')
		i++;
	write(M_ERR_FILENO, str, i);
	write(M_ERR_FILENO, "\n", 1);
	exit(M_EXIT_FAILURE);
}

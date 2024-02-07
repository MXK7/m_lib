#include "m.h"

char	**m_strdup_tab(char **tab)
{
	char	**dest;
	size_t	dest_len;
	size_t	i;

	dest_len = m_strlen_tab(tab);
	dest = malloc((dest_len + 1) * sizeof(char *));
	if (!dest)
		return (NULL);
	i = 0;
	while (i < dest_len)
	{
		dest[i] = ft_strdup(tab[i]);
		if (!dest[i])
		{
			m_free_tab(dest);
			return (NULL);
		}
		i++;
	}
	dest[i] = NULL;
	return (dest);
}

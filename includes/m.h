#ifndef M_H
# define M_H

# include <stdlib.h>
# include <unistd.h>

# define M_IN_FILENO 0  /* Standard input.  */
# define M_OUT_FILENO 1 /* Standard output.  */
# define M_ERR_FILENO 2 /* Standard error output.  */

# define M_EXIT_FAILURE 1 /* Failing exit status.  */
# define M_EXIT_SUCCESS 0 /* Successful exit status.  */

void	m_error(char *str);

#endif
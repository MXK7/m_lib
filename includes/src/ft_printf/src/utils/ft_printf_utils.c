/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf_utils.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mpoussie <mpoussie@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/21 09:00:13 by mpoussie          #+#    #+#             */
/*   Updated: 2024/02/07 22:00:22 by mpoussie         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

void	ft_put_str(char *str)
{
	int	i;

	i = 0;
	while (str[i])
	{
		write(1, &str[i], 1);
		i++;
	}
}

int	ft_printf_len(unsigned long int nbr)
{
	int	len;

	len = 0;
	while (nbr != 0)
	{
		len++;
		nbr /= 16;
	}
	return (len);
}

void	ft_put_ptr(unsigned long int nbr)
{
	if (nbr >= 16)
	{
		ft_put_ptr(nbr / 16);
		ft_put_ptr(nbr % 16);
	}
	else
	{
		if (nbr <= 9)
			ft_print_char(nbr + '0');
		else
			ft_print_char(nbr - 10 + 'a');
	}
}

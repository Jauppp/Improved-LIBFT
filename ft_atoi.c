/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cdomet-d <cdomet-d@student.42lyon.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/08 09:46:06 by cdomet-d          #+#    #+#             */
/*   Updated: 2023/11/23 17:13:22 by cdomet-d         ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static size_t	ft_isspace(const char *str)
{
	size_t	i;

	i = 0;
	while ((str[i] && str[i] >= '\t' && str[i] <= '\r') || (str[i] == ' '))
		i++;
	return (i);
}

static int	ft_issign(const char *str, int i)
{
	int	sign;

	sign = 1;
	if (str[i] == '-')
		return (-sign);
	else
		return (sign);
}

int	ft_atoi(const char *nptr)
{
	size_t		i;
	int			sign;
	long		nbr;

	nbr = 0;
	if (!nptr)
		return (1);
	i = ft_isspace(nptr);
	sign = ft_issign(nptr, i);
	if (nptr[i] == '+' || nptr[i] == '-')
		i++;
	while (ft_isdigit(nptr[i]))
	{
		if (((nbr * 10 + nptr[i] - '0') / 10 != nbr))
		{
			if (sign < 0)
				return ((int)LONG_MIN);
			else
				return ((int)LONG_MAX);
		}
		nbr = nbr * 10 + nptr[i] - '0';
		i++;
	}
	return (nbr * sign);
}

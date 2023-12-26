# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cdomet-d <cdomet-d@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/07 10:23:52 by cdomet-d          #+#    #+#              #
#    Updated: 2023/12/26 13:26:22 by cdomet-d         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

CC = gcc
CFLAGS = -Werror -Wextra -Wall
CPPFLAGS = -MMD -MP

DIR_BUILD := .BUILD_DIR
SRCS := ft_atoi.c \
		ft_bzero.c \
		ft_calloc.c \
		ft_isalnum.c \
		ft_isalpha.c \
		ft_isascii.c \
		ft_isdigit.c \
		ft_isprint.c \
		ft_itoa.c \
		ft_memchr.c \
		ft_memcmp.c \
		ft_memcpy.c \
		ft_memmove.c \
		ft_memset.c \
		ft_putchar_fd.c \
		ft_putendl_fd.c \
		ft_putnbr_fd.c \
		ft_putstr_fd.c \
		ft_split.c \
		ft_strchr.c \
		ft_strdup.c \
		ft_striteri.c \
		ft_strjoin.c \
		ft_strlcat.c \
		ft_strlcpy.c \
		ft_strlen.c \
		ft_strmapi.c \
		ft_strncmp.c \
		ft_strnstr.c \
		ft_strrchr.c \
		ft_strtrim.c \
		ft_substr.c \
		ft_tolower.c \
		ft_toupper.c \
		ft_putnbrs.c \
		ft_printf.c \
		ft_print_chars.c \
		ft_print_nums.c \
		ft_lstadd_back_bonus.c \
		ft_lstclear_bonus.c \
		ft_lstdelone_bonus.c \
		ft_lstiter_bonus.c \
		ft_lstnew_bonus.c \
		ft_lstmap_bonus.c \
 		ft_lstadd_front_bonus.c \
 		ft_lstlast_bonus.c \
 		ft_lstsize_bonus.c \
		get_next_line.c \
		get_next_line_utils.c \
		
OBJS := $(SRCS:%.c=$(DIR_BUILD)/%.o)
				
DEPS := $(OBJS:%.o=%.d)
RM := rm -rf

all: $(NAME)

$(NAME): $(OBJS) 
	ar -rcs $(NAME) $(OBJS) 

$(DIR_BUILD)/%.o:%.c
	@mkdir -p $(DIR_BUILD)
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ -c $<

-include $(DEPS)

clean: 
	$(RM) $(DIR_BUILD)
fclean: clean
	$(RM) $(NAME)
re: fclean all

.PHONY : clean fclean all re so bonus
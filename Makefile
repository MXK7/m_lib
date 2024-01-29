# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mpoussie <mpoussie@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/23 10:23:14 by mpoussie          #+#    #+#              #
#    Updated: 2024/01/29 18:42:59 by mpoussie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME        = m_lib
INCLUDES    = includes/
SRC_DIR     = src/
OBJ_DIR     = obj/

CC          = gcc
CFLAGS      = -Wall -Wextra -Werror -g3
PRFLAGS     = -lreadline
RM          = rm -rf

SRC_FILES  += m_error

SRC         = $(addprefix $(SRC_DIR), $(addsuffix .c, $(SRC_FILES)))
OBJ         = $(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRC_FILES)))

OBJ_CACHE   = .cache_exists

###

all: 			$(NAME)

$(NAME): 		$(OBJ)
					$(CC) $(CFLAGS) $(OBJ) $(PRFLAGS) -o $(NAME)
					@echo "\033[0;32m$(shell echo $(NAME) | tr '[:lower:]' '[:upper:]') : COMPILED\033[0m"

$(OBJ_DIR)%.o:	$(SRC_DIR)%.c | $(OBJ_CACHE)
					@echo "Compiling $<"
					@$(CC) $(CFLAGS) -I$(INCLUDES) -c $< -o $@

$(OBJ_CACHE):
					@mkdir -p $(OBJ_DIR)

clean:
					$(RM) $(OBJ_DIR)
					$(RM) $(OBJ_CACHE)
					@echo "m_lib and libs object files cleaned!"

fclean: 		clean
					$(RM) $(NAME)
					@echo "m_lib and libs executable files cleaned!"

re: 			fclean all
					@echo "Cleaned and rebuilt everything for m_lib!"

.PHONY:			all clean fclean re

.SILENT:

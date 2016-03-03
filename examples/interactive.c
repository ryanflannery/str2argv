/*
 * Copyright (c) 2010, 2011 Ryan Flannery <ryan.flannery@gmail.com>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

#include "str2argv.h"

#define UNUSED    __attribute__((__unused__))

int
main(int argc UNUSED, char *argv[] UNUSED)
{
   char  s[255];
   int   i;

   const char *errmsg;
   char **margv;
   int    margc;
   char  *untoked;

   printf("Enter strings to have them parsed into argc/argv structures\n");

   while (fgets(s, sizeof(s), stdin) != NULL) {

      /* clean-out last '\n' */
      if (s[strlen(s) - 1] == '\n')
         s[strlen(s) - 1] = '\0';

      printf("parsing...\n");
      fflush(stdout);

      if (str2argv(s, &margc, &margv, &errmsg) == 0) {
         for (i = 0; i < margc; i++)
            printf("\tmargv[%d] = '%s'\n", i, margv[i]); fflush(stdout);

         untoked = argv2str(margc, margv);
         printf("un-toked string: \"%s\"\n", untoked);
         argv_free(&margc, &margv);
         free(untoked);
      } else {
         printf("parse error: %s\n", errmsg);
      }
   }

   return 0;
}


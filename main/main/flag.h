#ifndef _FLAG_H_
#define _FLAG_H_
#define MAX_FLAG_SIZE 255
int print_flag();
int print_flag()
{
	FILE *fp = NULL;
	char buff[MAX_FLAG_SIZE] = {0};
	
	fp = fopen("/flag", "r");
	if (fp == NULL)
	{
		printf("Error: Cannot open the flag file!!!\n");
		return 1;
	}
	fread(buff, MAX_FLAG_SIZE - 2, 1, fp);
	printf("The flag is: %s\n", buff);
	fclose(fp);
	return 0;
}
#endif
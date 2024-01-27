#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

/**
  * infinite_while - Run an infinite while loop.
  *
  * Return: Always 0.
  */
int infinite_while(void)
{
		while (1)
		{
				sleep(1);
		}
		return (0);
}

/**
  * main - Creates five zombie processes.
  *
  * Return: Always 0.
  */
int main(void)
{
		pid_t zombie;
		int i;

		for (i = 0; i < 5; i++)
		{
				zombie = fork();
				if (zombie == 0)
						exit(0);
				else if (zombie < 0)
				{
						perror("fork");
						return (1);
				}
				else
					printf("Zombie process crested, PID: %d\n", zombie);
		}
		infinite_while();
		return (0);
}

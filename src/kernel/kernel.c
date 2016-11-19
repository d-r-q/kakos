
static char *video_memory = (char*) 0xb8000;

// void clearScreen() {
//   *video_memory = 'A';
// }

// void main() {
//   extern char* video_memory;
//   clearScreen();
//   //char* video_memory = (char*) 0xb8000;
//   video_memory += 2;
//   *video_memory  = 'B';
// }
void main() {
	char* video_memory = (char*) 0xb8000;
	*video_memory = 'X';
}

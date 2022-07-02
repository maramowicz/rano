# rano
rano is nano rust helper, and its use nano :)
#### why do I create it? what is its purpose?
So when trying to write something in rust, using my favourite editor for it (no lie, I know you still can't get out of vim) I noticed that every time, every time I exited nano I had to click through the commands looking for these 2 commands:...
``` 
rustc wtcoode.rs
./wtcoode
```
...and I thought to myself:
> "Am I somehow able to automate this? Maybe if my program could loop so that with one click I could test the code as well as one click back to the editor?"

And yes, im do it. But now i want **more!**

Ok, so what's is done?
* You can create helloworld.rs
* You can edit it, and it auto recompile and run after close editor
* You can... Why im writing You can??? 
* After close program, **You can** back to the editor or close rano
* If your code cannot compile, **YOU*** can write number of error and rano open file on problematic line.

Ok, what's not working?
* You cannot write to other files except helloworld.rs (yes, thats not a bug, thats a temportary feature ;).

And what I want to add?
* Of course possibility to write other names of files
* Integration with [fff](https://github.com/dylanaraps/fff) for selecting files to edit
* Integration with [cargo](https://github.com/rust-lang/cargo) for support generating new projects, version control, libraries etc.
* *Maybe* Integration with git, but idk. for now.

Needed depences: nano and rustc.
Thats all for now.


*(???YHW ?siht etirw ot evah I od yhw ,yhw)

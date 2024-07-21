struct file_operations evo_sys_calls = {
    .owner = THIS_MODULE,
    .read = evo_sys_read,
    .write = evo_sys_write,
    .open = evo_sys_open,
    .release = evo_sys_release,
};

struct file_system_type evo_fs_type = {
    .owner = THIS_MODULE,
    .name = 'evo_fs',
    .mount = evo_fs_mount,
    .kill_sb = kill_block_super,
    .fs_flags = FS_REQUIRES_DEV,
};
static struct file_operations evo_file_ops = {
    .read = evo_fs_read,
    .write = evo_fs_write,
    .open = evo_fs_open,
    .release = evo_fs_release,
};
static int __init evo_fs_init(void) {
    return register_filesystem(&evo_fs_type);
}
static void __exit evo_fs_exit(void) {
    unregister_filesystem(&evo_fs_type);
}
module_init(evo_fs_init);
module_exit(evo_fs_exit);

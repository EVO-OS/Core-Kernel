struct device_driver evo_device_driver = {
    .name = 'evo_device',
    .bus = &evo_bus_type,
    .probe = evo_device_probe,
    .remove = evo_device_remove,
    .shutdown = evo_device_shutdown,
    .suspend = evo_device_suspend,
    .resume = evo_device_resume,
};

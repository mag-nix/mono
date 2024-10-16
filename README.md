# NixOS ROS Mono Repository

## Learning Goals

- Rediscover aspects from the previous examples

- Change a package and deploy the system to your VM

## Integration of all previous examples

- [x] GitHub - mag-nix/ros-basic
- [x] GitHub - mag-nix/ros-mono
- [x] GitHub - mag-nix/ros-systemd
- [x] GitHub - mag-nix/ros-rollback

## Additionally added aspects

- [x] Continuous Integration
- [x] Custom Binary Caching (Cachix.org)
- [x] Add multiple releases
- [x] Jumping back in time

## Potentially added

- [ ] Usage of `direnv`
- [ ] Insights: "What version of a lib am I currently using?"
- [ ] Reproduce failed CI build locally (hint: --pure)
- [ ] Additional target systems (ARM / RasPi, ..?)

## Open Points

- Integration of ros-nix-overlay and *local packages* should be smoother
- *Local packages* should be able to replace a package of ros-nix-overlay for everything present in ros-nix-overlay

## Usage of QEMU

### Build image

``` bash
nix build .#qemu
```

### Make it writable

``` bash
cp result/nixos.qcow2 .
chmod +w nixos.qcow2
```

### Import the image

``` bash
virt-install --name nixos --ram 2048 --disk nixos.qcow2 --import --nographics --os-type=generic
```

### Directly access VM

``` bash
virsh console nixos
```

### ssh into vm

``` bash
ssh robotix@192.168.122.11
```

### deploy to vm

``` bash
nix develop .#deploy
# virtual box
deploy .#local-vm
# qemu
deploy .#local-qemu
```

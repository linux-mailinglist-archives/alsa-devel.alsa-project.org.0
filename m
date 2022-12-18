Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A822564FEEA
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Dec 2022 14:03:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D6E7265D;
	Sun, 18 Dec 2022 14:02:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D6E7265D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671368616;
	bh=1xEIkli5HP/qoM10BY7TpJay5UfwBhxpsQgO+lKnnmQ=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gZ5BdrCKMROK6ZmywpjqdDKJyWP5UP8y1HVVMuLWrymq1UQGBOSDrDinM/8sYY4Bp
	 IS89Xwbhg0C+H2j3xagv8EGa3gay5SJsv07t/NJL3ytB555NOttR9g4Szxmw+m0NCw
	 Y8aWrH0xKQaCf6ok5cQalkvbsihHTVEwTWBqjAvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A17C7F8032B;
	Sun, 18 Dec 2022 14:02:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85B79F8010B; Sun, 18 Dec 2022 14:02:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from disco.pogo.org.uk (disco.pogo.org.uk [93.93.128.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D4D1F8010B
 for <alsa-devel@alsa-project.org>; Sun, 18 Dec 2022 14:02:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D4D1F8010B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=xwax.org header.i=@xwax.org header.a=rsa-sha256
 header.s=swing header.b=j0KkggfI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xwax.org;
 s=swing; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:
 Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=itPBEGdtb6iJHec8UWmq7lpBKfuqYtKGTOj1yD4+pE4=; b=j0KkggfICObYxYoYClRNZuEPpN
 aWeunxx7KIpQQjYD58123ysUiTcEex9vvt2uEyr2E05c3FDIFEJ5ynjvetGKgTszmXqWve67Aa5Bu
 KUU8vnAunDAplhC2L8n8uSJ1/WnAOqewT6HJ/5kU3+LHnebBAEWbz5ndf3xi4Cx+eQSo=;
Received: from [2001:470:1d21:0:428d:5cff:fe1b:f3e5] (helo=stax)
 by disco.pogo.org.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95 (FreeBSD)) (envelope-from <mark@xwax.org>)
 id 1p6tJF-000G4u-7v for alsa-devel@alsa-project.org;
 Sun, 18 Dec 2022 13:02:29 +0000
Received: from localhost (stax.localdomain [local])
 by stax.localdomain (OpenSMTPD) with ESMTPA id 0d5d0112
 for <alsa-devel@alsa-project.org>;
 Sun, 18 Dec 2022 13:02:26 +0000 (UTC)
Date: Sun, 18 Dec 2022 13:02:26 +0000 (GMT)
From: Mark Hills <mark@xwax.org>
To: alsa-devel@alsa-project.org
Subject: rt5650 on HP Chromebook G5 Setzer faults
Message-ID: <2212181230200.24243@stax.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

HP Chromebook (11a, G5 "Setzer") uses snd_soc_sst_cht_bsw_rt5645 module 
and presents a device "rt5650".

Audio works briefly, until after about 30 seconds it's interrupted by a 
square wave or short buffer cycling.

With no clear fault in dmesg when the audio goes bad, I'm not sure 
where to turn next.

Removing PulseAudio etc., I'm able to confirm the problem exists close to 
the ALSA driver:

  $ aplay -D plughw:rt5650,0,0 mixdownfinal.wav 
  Playing WAVE 'mixdownfinal.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo

Once gone bad, it can still be interrupted:

  ^CAborted by signal Interrupt...
  aplay: pcm_write:2127: write error: Interrupted system call

I did once hear playback recover and continue, too.

When it happens with eg. YouTube + Firefox + PulseAudio, the video halts. 
So it seems like the clock has gone awry.

At the time it happens, the status is stuck (see below)

dmesg shows some faults on startup (see below), but they seem to relate to 
alsactl, however I thought they should be reported.

It doesn't help that I'm not familiar with these SOC devices or have a dev 
environment in XUbuntu.

It's easy to reproduce though, so is there any reasonable step to get 
closer to a fix to make this system usable?

Many thanks

-- 
Mark


/proc/asound/rt5650/pcm0p/sub0$ cat status 
state: RUNNING
owner_pid   : 11666
trigger_time: 177701.111960109
tstamp      : 0.000000000
delay       : 16384
avail       : 0
avail_max   : 0
-----
hw_ptr      : 7102464
appl_ptr    : 7118848


$ uname -a
Linux wren 5.19.0-26-generic #27-Ubuntu SMP PREEMPT_DYNAMIC Wed Nov 23 20:44:15 UTC 2022 x86_64 x86_64 x86_64 GNU/Linux


# Intel PCH card seems to be the HDMI output
$ cat /proc/asound/cards 
 0 [rt5650         ]: SOF - sof-bytcht rt5650
                      GOOGLE-Setzer-1.0
 1 [PCH            ]: HDA-Intel - HDA Intel PCH
                      HDA Intel PCH at 0x91314000 irq 316


$ lsb_release  -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 22.10
Release:	22.10
Codename:	kinetic


$ dmesg
[    0.000000] Linux version 5.19.0-26-generic (buildd@lcy02-amd64-064) (x86_64-linux-gnu-gcc-12 (Ubuntu 12.2.0-3ubuntu1) 12.2.0, GNU ld (GNU Binutils for Ubuntu) 2.39) #27-Ubuntu SMP PREEMPT_DYNAMIC Wed Nov 23 20:44:15 UTC 2022 (Ubuntu 5.19.0-26.27-generic 5.19.7)
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-5.19.0-26-generic root=UUID=f3696ad1-610d-47df-af28-f4fc95355175 ro quiet splash vt.handoff=7
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Hygon HygonGenuine
[    0.000000]   Centaur CentaurHauls
[    0.000000]   zhaoxin   Shanghai  
[    0.000000] x86/fpu: x87 FPU will use FXSAVE
[    0.000000] signal: max sigframe size: 1440
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x0000000000000fff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000001000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000001ec4afff] usable
[    0.000000] BIOS-e820: [mem 0x000000001ec4b000-0x000000001ec4bfff] ACPI data
[    0.000000] BIOS-e820: [mem 0x000000001ec4c000-0x000000001fc91fff] usable
[    0.000000] BIOS-e820: [mem 0x000000001fc92000-0x000000001fc94fff] ACPI data
[    0.000000] BIOS-e820: [mem 0x000000001fc95000-0x000000001fca8fff] usable
[    0.000000] BIOS-e820: [mem 0x000000001fca9000-0x000000001fcabfff] ACPI data
[    0.000000] BIOS-e820: [mem 0x000000001fcac000-0x000000001feaefff] usable
[    0.000000] BIOS-e820: [mem 0x000000001feaf000-0x000000001fff2fff] reserved
[    0.000000] BIOS-e820: [mem 0x000000001fff3000-0x000000001fff6fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000001fff7000-0x000000001fffefff] ACPI data
[    0.000000] BIOS-e820: [mem 0x000000001ffff000-0x000000001fffffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000020000000-0x00000000201fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000020200000-0x000000007cccdfff] usable
[    0.000000] BIOS-e820: [mem 0x000000007ccce000-0x000000007fffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ffdc0000-0x00000000ffdfffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000017fffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] efi: EFI v2.70 by EDK II
[    0.000000] efi: SMBIOS=0x1ffd6000 SMBIOS 3.0=0x1ffd4000 ACPI=0x1fffe000 ACPI 2.0=0x1fffe014 MEMATTR=0x1e78f398 MOKvar=0x1ec37000 
[    0.000000] secureboot: Secure boot disabled
[    0.000000] SMBIOS 3.0.0 present.
[    0.000000] DMI: GOOGLE Setzer/Setzer, BIOS MrChromebox-4.18.2 11/29/2022
[    0.000000] tsc: Detected 1600.000 MHz processor
[    0.000029] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.000036] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000052] last_pfn = 0x180000 max_arch_pfn = 0x400000000
[    0.000124] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.000401] last_pfn = 0x7ccce max_arch_pfn = 0x400000000
[    0.005769] e820: update [mem 0x1ec37000-0x1ec37fff] usable ==> reserved
[    0.007683] secureboot: Secure boot disabled
[    0.007685] RAMDISK: [mem 0x1a0a7000-0x1e237fff]
[    0.007700] ACPI: Early table checksum verification disabled
[    0.007708] ACPI: RSDP 0x000000001FFFE014 000024 (v02 COREv4)
[    0.007717] ACPI: XSDT 0x000000001FFFD0E8 00005C (v01 COREv4 COREBOOT 00000000      01000013)
[    0.007730] ACPI: FACP 0x000000001FFFC000 000114 (v06 COREv4 COREBOOT 00000000 CORE 20220331)
[    0.007744] ACPI: DSDT 0x000000001FFF7000 0044F5 (v02 COREv4 COREBOOT 20110725 INTL 20220331)
[    0.007753] ACPI: FACS 0x000000007CCE6240 000040
[    0.007761] ACPI: SSDT 0x000000001FCAA000 001094 (v02 COREv4 COREBOOT 0000002A CORE 20220331)
[    0.007769] ACPI: MCFG 0x000000001FCA9000 00003C (v01 COREv4 COREBOOT 00000000 CORE 20220331)
[    0.007777] ACPI: TCPA 0x000000001FC94000 000032 (v02 COREv4 COREBOOT 00000000 CORE 20220331)
[    0.007785] ACPI: APIC 0x000000001FC93000 00005C (v03 COREv4 COREBOOT 00000000 CORE 20220331)
[    0.007793] ACPI: HPET 0x000000001FC92000 000038 (v01 COREv4 COREBOOT 00000000 CORE 20220331)
[    0.007801] ACPI: BGRT 0x000000001EC4B000 000038 (v01 INTEL  EDK2     00000002      01000013)
[    0.007808] ACPI: Reserving FACP table memory at [mem 0x1fffc000-0x1fffc113]
[    0.007812] ACPI: Reserving DSDT table memory at [mem 0x1fff7000-0x1fffb4f4]
[    0.007814] ACPI: Reserving FACS table memory at [mem 0x7cce6240-0x7cce627f]
[    0.007817] ACPI: Reserving SSDT table memory at [mem 0x1fcaa000-0x1fcab093]
[    0.007819] ACPI: Reserving MCFG table memory at [mem 0x1fca9000-0x1fca903b]
[    0.007822] ACPI: Reserving TCPA table memory at [mem 0x1fc94000-0x1fc94031]
[    0.007824] ACPI: Reserving APIC table memory at [mem 0x1fc93000-0x1fc9305b]
[    0.007826] ACPI: Reserving HPET table memory at [mem 0x1fc92000-0x1fc92037]
[    0.007829] ACPI: Reserving BGRT table memory at [mem 0x1ec4b000-0x1ec4b037]
[    0.008098] No NUMA configuration found
[    0.008101] Faking a node at [mem 0x0000000000000000-0x000000017fffffff]
[    0.008118] NODE_DATA(0) allocated [mem 0x17ffd4000-0x17fffefff]
[    0.008889] Zone ranges:
[    0.008891]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.008895]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.008899]   Normal   [mem 0x0000000100000000-0x000000017fffffff]
[    0.008902]   Device   empty
[    0.008904] Movable zone start for each node
[    0.008909] Early memory node ranges
[    0.008910]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.008913]   node   0: [mem 0x0000000000100000-0x000000001ec4afff]
[    0.008916]   node   0: [mem 0x000000001ec4c000-0x000000001fc91fff]
[    0.008918]   node   0: [mem 0x000000001fc95000-0x000000001fca8fff]
[    0.008920]   node   0: [mem 0x000000001fcac000-0x000000001feaefff]
[    0.008923]   node   0: [mem 0x000000001ffff000-0x000000001fffffff]
[    0.008925]   node   0: [mem 0x0000000020200000-0x000000007cccdfff]
[    0.008928]   node   0: [mem 0x0000000100000000-0x000000017fffffff]
[    0.008931] Initmem setup node 0 [mem 0x0000000000001000-0x000000017fffffff]
[    0.008944] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.009013] On node 0, zone DMA: 96 pages in unavailable ranges
[    0.011504] On node 0, zone DMA32: 1 pages in unavailable ranges
[    0.011508] On node 0, zone DMA32: 3 pages in unavailable ranges
[    0.011521] On node 0, zone DMA32: 3 pages in unavailable ranges
[    0.011532] On node 0, zone DMA32: 336 pages in unavailable ranges
[    0.019163] On node 0, zone DMA32: 512 pages in unavailable ranges
[    0.030033] On node 0, zone Normal: 13106 pages in unavailable ranges
[    0.030054] Reserving Intel graphics memory at [mem 0x7e000000-0x7fffffff]
[    0.030229] ACPI: PM-Timer IO Port: 0x408
[    0.030268] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-114
[    0.030278] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.030284] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.030293] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.030296] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.030318] e820: update [mem 0x1e74c000-0x1e770fff] usable ==> reserved
[    0.030343] TSC deadline timer available
[    0.030346] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
[    0.030390] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.030396] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000fffff]
[    0.030400] PM: hibernation: Registered nosave memory: [mem 0x1e74c000-0x1e770fff]
[    0.030404] PM: hibernation: Registered nosave memory: [mem 0x1ec37000-0x1ec37fff]
[    0.030408] PM: hibernation: Registered nosave memory: [mem 0x1ec4b000-0x1ec4bfff]
[    0.030412] PM: hibernation: Registered nosave memory: [mem 0x1fc92000-0x1fc94fff]
[    0.030416] PM: hibernation: Registered nosave memory: [mem 0x1fca9000-0x1fcabfff]
[    0.030420] PM: hibernation: Registered nosave memory: [mem 0x1feaf000-0x1fff2fff]
[    0.030422] PM: hibernation: Registered nosave memory: [mem 0x1fff3000-0x1fff6fff]
[    0.030424] PM: hibernation: Registered nosave memory: [mem 0x1fff7000-0x1fffefff]
[    0.030428] PM: hibernation: Registered nosave memory: [mem 0x20000000-0x201fffff]
[    0.030432] PM: hibernation: Registered nosave memory: [mem 0x7ccce000-0x7fffffff]
[    0.030434] PM: hibernation: Registered nosave memory: [mem 0x80000000-0xffdbffff]
[    0.030436] PM: hibernation: Registered nosave memory: [mem 0xffdc0000-0xffdfffff]
[    0.030438] PM: hibernation: Registered nosave memory: [mem 0xffe00000-0xffffffff]
[    0.030442] [mem 0x80000000-0xffdbffff] available for PCI devices
[    0.030445] Booting paravirtualized kernel on bare hardware
[    0.030450] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.030468] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:2 nr_cpu_ids:2 nr_node_ids:1
[    0.031317] percpu: Embedded 61 pages/cpu s212992 r8192 d28672 u1048576
[    0.031338] pcpu-alloc: s212992 r8192 d28672 u1048576 alloc=1*2097152
[    0.031346] pcpu-alloc: [0] 0 1 
[    0.031420] Fallback order for Node 0: 0 
[    0.031430] Built 1 zonelists, mobility grouping on.  Total pages: 1016769
[    0.031433] Policy zone: Normal
[    0.031437] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-5.19.0-26-generic root=UUID=f3696ad1-610d-47df-af28-f4fc95355175 ro quiet splash vt.handoff=7
[    0.031588] Unknown kernel command line parameters "splash BOOT_IMAGE=/boot/vmlinuz-5.19.0-26-generic", will be passed to user space.
[    0.032846] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[    0.033503] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.033569] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.103799] Memory: 3857072K/4138072K available (18440K kernel code, 4054K rwdata, 11244K rodata, 3148K init, 4924K bss, 280740K reserved, 0K cma-reserved)
[    0.104833] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.104887] Kernel/User page tables isolation: enabled
[    0.104926] ftrace: allocating 51983 entries in 204 pages
[    0.116119] ftrace: allocated 204 pages with 4 groups
[    0.117340] Dynamic Preempt: voluntary
[    0.117456] rcu: Preemptible hierarchical RCU implementation.
[    0.117459] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=2.
[    0.117462] 	Trampoline variant of Tasks RCU enabled.
[    0.117464] 	Rude variant of Tasks RCU enabled.
[    0.117465] 	Tracing variant of Tasks RCU enabled.
[    0.117467] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.117469] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[    0.128183] NR_IRQS: 524544, nr_irqs: 512, preallocated irqs: 16
[    0.128455] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.128534] random: crng init done
[    0.128600] Console: colour dummy device 80x25
[    0.128641] printk: console [tty0] enabled
[    0.128692] ACPI: Core revision 20220331
[    0.128828] hpet: HPET dysfunctional in PC10. Force disabled.
[    0.128832] APIC: Switch to symmetric I/O mode setup
[    0.130360] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x171024fa93b, max_idle_ns: 440795253189 ns
[    0.130373] Calibrating delay loop (skipped), value calculated using timer frequency.. 3200.00 BogoMIPS (lpj=6400000)
[    0.130380] pid_max: default: 32768 minimum: 301
[    0.132857] LSM: Security Framework initializing
[    0.132890] landlock: Up and running.
[    0.132893] Yama: becoming mindful.
[    0.132963] AppArmor: AppArmor initialized
[    0.133068] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.133094] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.133615] CPU0: Thermal monitoring enabled (TM1)
[    0.133657] process: using mwait in idle threads
[    0.133665] Last level iTLB entries: 4KB 48, 2MB 0, 4MB 0
[    0.133668] Last level dTLB entries: 4KB 256, 2MB 16, 4MB 16, 1GB 0
[    0.133681] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.133687] Spectre V2 : Mitigation: Retpolines
[    0.133689] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.133691] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
[    0.133692] Spectre V2 : Enabling Restricted Speculation for firmware calls
[    0.133696] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.133702] MDS: Mitigation: Clear CPU buffers
[    0.133704] MMIO Stale Data: Unknown: No mitigations
[    0.134369] Freeing SMP alternatives memory: 44K
[    0.134369] smpboot: CPU0: Intel(R) Celeron(R) CPU  N3060  @ 1.60GHz (family: 0x6, model: 0x4c, stepping: 0x4)
[    0.134369] cblist_init_generic: Setting adjustable number of callback queues.
[    0.134369] cblist_init_generic: Setting shift to 1 and lim to 1.
[    0.134369] cblist_init_generic: Setting shift to 1 and lim to 1.
[    0.134369] cblist_init_generic: Setting shift to 1 and lim to 1.
[    0.134369] Performance Events: PEBS fmt2+, 8-deep LBR, Silvermont events, 8-deep LBR, full-width counters, Intel PMU driver.
[    0.134369] ... version:                3
[    0.134369] ... bit width:              40
[    0.134369] ... generic registers:      2
[    0.134369] ... value mask:             000000ffffffffff
[    0.134369] ... max period:             0000007fffffffff
[    0.134369] ... fixed-purpose events:   3
[    0.134369] ... event mask:             0000000700000003
[    0.134369] Estimated ratio of average max frequency by base frequency (times 1024): 1587
[    0.134369] rcu: Hierarchical SRCU implementation.
[    0.134369] rcu: 	Max phase no-delay instances is 1000.
[    0.134369] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.134369] smp: Bringing up secondary CPUs ...
[    0.134369] x86: Booting SMP configuration:
[    0.134369] .... node  #0, CPUs:      #1
[    0.134749] smp: Brought up 1 node, 2 CPUs
[    0.134749] smpboot: Max logical packages: 1
[    0.134749] smpboot: Total of 2 processors activated (6400.00 BogoMIPS)
[    0.135208] devtmpfs: initialized
[    0.135208] x86/mm: Memory block size: 128MB
[    0.135700] ACPI: PM: Registering ACPI NVS region [mem 0x1fff3000-0x1fff6fff] (16384 bytes)
[    0.135791] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.135810] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.135933] pinctrl core: initialized pinctrl subsystem
[    0.136181] PM: RTC time: 11:04:10, date: 2022-12-16
[    0.138887] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.139255] DMA: preallocated 512 KiB GFP_KERNEL pool for atomic allocations
[    0.139421] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.139608] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.139654] audit: initializing netlink subsys (disabled)
[    0.139840] audit: type=2000 audit(1671188650.008:1): state=initialized audit_enabled=0 res=1
[    0.140158] thermal_sys: Registered thermal governor 'fair_share'
[    0.140165] thermal_sys: Registered thermal governor 'bang_bang'
[    0.140169] thermal_sys: Registered thermal governor 'step_wise'
[    0.140171] thermal_sys: Registered thermal governor 'user_space'
[    0.140173] thermal_sys: Registered thermal governor 'power_allocator'
[    0.140193] EISA bus registered
[    0.140223] cpuidle: using governor ladder
[    0.140236] cpuidle: using governor menu
[    0.140349] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.140505] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.140519] PCI: not using MMCONFIG
[    0.140528] PCI: Using configuration type 1 for base access
[    0.140748] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    0.144193] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.175620] HugeTLB: can optimize 7 vmemmap pages for hugepages-2048kB
[    0.175620] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.175620] ACPI: Added _OSI(Module Device)
[    0.175620] ACPI: Added _OSI(Processor Device)
[    0.175620] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.175620] ACPI: Added _OSI(Processor Aggregator Device)
[    0.175620] ACPI: Added _OSI(Linux-Dell-Video)
[    0.175620] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.175620] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.186294] ACPI: 2 ACPI AML tables successfully acquired and loaded
[    0.188470] ACPI: EC: EC started
[    0.188475] ACPI: EC: interrupt blocked
[    0.190416] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.190423] ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC used to handle transactions
[    0.190428] ACPI: Interpreter enabled
[    0.190468] ACPI: PM: (supports S0 S3 S4 S5)
[    0.190473] ACPI: Using IOAPIC for interrupt routing
[    0.190529] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
[    0.191150] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in ACPI motherboard resources
[    0.191192] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.191196] PCI: Using E820 reservations for host bridge windows
[    0.203140] ACPI: PM: Power Resource [PLPE]
[    0.206136] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.206155] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
[    0.206261] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHotplug PME AER PCIeCapability LTR DPC]
[    0.206942] PCI host bridge to bus 0000:00
[    0.206948] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.206953] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.206957] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000fffff window]
[    0.206961] pci_bus 0000:00: root bus resource [mem 0x20000000-0x201fffff window]
[    0.206965] pci_bus 0000:00: root bus resource [mem 0x80000000-0xdfffffff window]
[    0.206968] pci_bus 0000:00: root bus resource [mem 0xfed40000-0xfed44fff window]
[    0.206973] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.207008] pci 0000:00:00.0: [8086:2280] type 00 class 0x060000
[    0.207139] pci 0000:00:02.0: [8086:22b1] type 00 class 0x030000
[    0.207159] pci 0000:00:02.0: reg 0x10: [mem 0x90000000-0x90ffffff 64bit]
[    0.207172] pci 0000:00:02.0: reg 0x18: [mem 0x80000000-0x8fffffff 64bit pref]
[    0.207181] pci 0000:00:02.0: reg 0x20: [io  0x1000-0x103f]
[    0.207207] pci 0000:00:02.0: BAR 2: assigned to efifb
[    0.207215] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[    0.207397] pci 0000:00:0b.0: [8086:22dc] type 00 class 0x118000
[    0.207416] pci 0000:00:0b.0: reg 0x10: [mem 0x00000000-0x00000fff 64bit]
[    0.207621] pci 0000:00:10.0: [8086:2294] type 00 class 0x080501
[    0.207643] pci 0000:00:10.0: reg 0x10: [mem 0x9131c000-0x9131cfff]
[    0.207733] pci 0000:00:10.0: PME# supported from D0 D3hot
[    0.207894] pci 0000:00:12.0: [8086:2296] type 00 class 0x080501
[    0.207916] pci 0000:00:12.0: reg 0x10: [mem 0x9131d000-0x9131dfff]
[    0.208007] pci 0000:00:12.0: PME# supported from D0 D3hot
[    0.208090] pci 0000:00:14.0: [8086:22b5] type 00 class 0x0c0330
[    0.208114] pci 0000:00:14.0: reg 0x10: [mem 0x91300000-0x9130ffff 64bit]
[    0.208187] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.208343] pci 0000:00:1b.0: [8086:2284] type 00 class 0x040300
[    0.208370] pci 0000:00:1b.0: reg 0x10: [mem 0x91314000-0x91317fff 64bit]
[    0.208456] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.208702] pci 0000:00:1c.0: [8086:22c8] type 01 class 0x060400
[    0.209601] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.210100] pci 0000:00:1c.2: [8086:22cc] type 01 class 0x060400
[    0.211001] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[    0.211416] pci 0000:00:1f.0: [8086:229c] type 00 class 0x060100
[    0.211923] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.212663] pci 0000:02:00.0: [8086:095a] type 00 class 0x028000
[    0.212887] pci 0000:02:00.0: reg 0x10: [mem 0x91200000-0x91201fff 64bit]
[    0.213557] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
[    0.214911] pci 0000:00:1c.2: PCI bridge to [bus 02]
[    0.214967] pci 0000:00:1c.2:   bridge window [mem 0x91200000-0x912fffff]
[    0.215432] ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    0.215437] ACPI: PCI: Interrupt link LNKA disabled
[    0.215631] ACPI: PCI: Interrupt link LNKB configured for IRQ 0
[    0.215636] ACPI: PCI: Interrupt link LNKB disabled
[    0.215837] ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    0.215842] ACPI: PCI: Interrupt link LNKC disabled
[    0.216035] ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    0.216040] ACPI: PCI: Interrupt link LNKD disabled
[    0.216235] ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.216239] ACPI: PCI: Interrupt link LNKE disabled
[    0.216434] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.216438] ACPI: PCI: Interrupt link LNKF disabled
[    0.216632] ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.216636] ACPI: PCI: Interrupt link LNKG disabled
[    0.216829] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    0.216834] ACPI: PCI: Interrupt link LNKH disabled
[    0.227347] ACPI: EC: interrupt unblocked
[    0.227357] ACPI: EC: event unblocked
[    0.227364] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.227367] ACPI: EC: GPE=0x10
[    0.227371] ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC initialization complete
[    0.227377] ACPI: \_SB_.PCI0.LPCB.EC0_: EC: Used to handle transactions and events
[    0.227524] iommu: Default domain type: Translated 
[    0.227524] iommu: DMA domain TLB invalidation policy: lazy mode 
[    0.227524] SCSI subsystem initialized
[    0.227524] libata version 3.00 loaded.
[    0.227524] ACPI: bus type USB registered
[    0.227524] usbcore: registered new interface driver usbfs
[    0.227524] usbcore: registered new interface driver hub
[    0.227524] usbcore: registered new device driver usb
[    0.301846] pps_core: LinuxPPS API ver. 1 registered
[    0.301855] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.301864] PTP clock support registered
[    0.301906] EDAC MC: Ver: 3.0.0
[    0.302470] Registered efivars operations
[    0.302775] NetLabel: Initializing
[    0.302779] NetLabel:  domain hash size = 128
[    0.302781] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.302816] NetLabel:  unlabeled traffic allowed by default
[    0.302862] mctp: management component transport protocol core
[    0.302862] NET: Registered PF_MCTP protocol family
[    0.302862] PCI: Using ACPI for IRQ routing
[    0.311294] PCI: pci_cache_line_size set to 64 bytes
[    0.311747] e820: reserve RAM buffer [mem 0x1e74c000-0x1fffffff]
[    0.311752] e820: reserve RAM buffer [mem 0x1ec37000-0x1fffffff]
[    0.311756] e820: reserve RAM buffer [mem 0x1ec4b000-0x1fffffff]
[    0.311759] e820: reserve RAM buffer [mem 0x1fc92000-0x1fffffff]
[    0.311762] e820: reserve RAM buffer [mem 0x1fca9000-0x1fffffff]
[    0.311764] e820: reserve RAM buffer [mem 0x1feaf000-0x1fffffff]
[    0.311767] e820: reserve RAM buffer [mem 0x7ccce000-0x7fffffff]
[    0.311799] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.311799] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.311799] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[    0.311799] vgaarb: loaded
[    0.312430] clocksource: Switched to clocksource tsc-early
[    0.335628] VFS: Disk quotas dquot_6.6.0
[    0.335675] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.335958] AppArmor: AppArmor Filesystem Enabled
[    0.336008] pnp: PnP ACPI init
[    0.336236] system 00:00: [mem 0xfeb00000-0xfebfffff] has been reserved
[    0.336245] system 00:00: [mem 0xe0000000-0xefffffff] has been reserved
[    0.336255] system 00:00: [mem 0xfed03000-0xfed033ff] has been reserved
[    0.336260] system 00:00: [mem 0xfed08000-0xfed09fff] has been reserved
[    0.336264] system 00:00: [mem 0xfed01000-0xfed013ff] has been reserved
[    0.336268] system 00:00: [mem 0xfea00000-0xfeafffff] has been reserved
[    0.336272] system 00:00: [mem 0xfed06000-0xfed067ff] has been reserved
[    0.336276] system 00:00: [mem 0xfed1c000-0xfed1c3ff] has been reserved
[    0.350569] system 00:01: [mem 0xfed00000-0xfed003ff] has been reserved
[    0.350681] system 00:02: [io  0x0400-0x047f] has been reserved
[    0.350688] system 00:02: [io  0x0500-0x05fe] has been reserved
[    0.350841] system 00:04: [io  0x0900-0x09fe] has been reserved
[    0.350944] system 00:05: [io  0x0200] has been reserved
[    0.350950] system 00:05: [io  0x0204] has been reserved
[    0.350955] system 00:05: [io  0x0800-0x087f] has been reserved
[    0.350959] system 00:05: [io  0x0880-0x08ff] has been reserved
[    0.352379] pnp: PnP ACPI: found 8 devices
[    0.360575] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.360728] NET: Registered PF_INET protocol family
[    0.360931] IP idents hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.364234] tcp_listen_portaddr_hash hash table entries: 2048 (order: 3, 32768 bytes, linear)
[    0.364335] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.364415] TCP established hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.364638] TCP bind hash table entries: 32768 (order: 7, 524288 bytes, linear)
[    0.364764] TCP: Hash tables configured (established 32768 bind 32768)
[    0.364981] MPTCP token hash table entries: 4096 (order: 4, 98304 bytes, linear)
[    0.365058] UDP hash table entries: 2048 (order: 4, 65536 bytes, linear)
[    0.365108] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes, linear)
[    0.365220] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.365234] NET: Registered PF_XDP protocol family
[    0.365253] pci 0000:00:1c.0: bridge window [io  0x1000-0x0fff] to [bus 01] add_size 1000
[    0.365263] pci 0000:00:1c.0: bridge window [mem 0x00100000-0x000fffff 64bit pref] to [bus 01] add_size 200000 add_align 100000
[    0.365269] pci 0000:00:1c.0: bridge window [mem 0x00100000-0x000fffff] to [bus 01] add_size 200000 add_align 100000
[    0.365287] clipped [mem size 0x00050000] to [mem size 0xffffffffffff0000] for e820 entry [mem 0x000a0000-0x000fffff]
[    0.365294] clipped [mem size 0x00200000] to [mem size 0x00000000] for e820 entry [mem 0x20000000-0x201fffff]
[    0.365302] pci 0000:00:1c.0: BAR 14: assigned [mem 0x91400000-0x915fffff]
[    0.365311] clipped [mem size 0x00050000 64bit pref] to [mem size 0xffffffffffff0000 64bit pref] for e820 entry [mem 0x000a0000-0x000fffff]
[    0.365316] clipped [mem size 0x00200000 64bit pref] to [mem size 0x00000000 64bit pref] for e820 entry [mem 0x20000000-0x201fffff]
[    0.365323] pci 0000:00:1c.0: BAR 15: assigned [mem 0x91600000-0x917fffff 64bit pref]
[    0.365330] clipped [mem size 0x00050000 64bit] to [mem size 0xffffffffffff0000 64bit] for e820 entry [mem 0x000a0000-0x000fffff]
[    0.365335] clipped [mem size 0x00200000 64bit] to [mem size 0x00000000 64bit] for e820 entry [mem 0x20000000-0x201fffff]
[    0.365341] pci 0000:00:0b.0: BAR 0: assigned [mem 0x91311000-0x91311fff 64bit]
[    0.365358] pci 0000:00:1c.0: BAR 13: assigned [io  0x2000-0x2fff]
[    0.365366] pci 0000:00:1c.0: PCI bridge to [bus 01]
[    0.365391] pci 0000:00:1c.0:   bridge window [io  0x2000-0x2fff]
[    0.365434] pci 0000:00:1c.0:   bridge window [mem 0x91400000-0x915fffff]
[    0.365468] pci 0000:00:1c.0:   bridge window [mem 0x91600000-0x917fffff 64bit pref]
[    0.365523] pci 0000:00:1c.2: PCI bridge to [bus 02]
[    0.365566] pci 0000:00:1c.2:   bridge window [mem 0x91200000-0x912fffff]
[    0.365641] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.365645] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.365649] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000fffff window]
[    0.365652] pci_bus 0000:00: resource 7 [mem 0x20000000-0x201fffff window]
[    0.365656] pci_bus 0000:00: resource 8 [mem 0x80000000-0xdfffffff window]
[    0.365660] pci_bus 0000:00: resource 9 [mem 0xfed40000-0xfed44fff window]
[    0.365664] pci_bus 0000:01: resource 0 [io  0x2000-0x2fff]
[    0.365667] pci_bus 0000:01: resource 1 [mem 0x91400000-0x915fffff]
[    0.365671] pci_bus 0000:01: resource 2 [mem 0x91600000-0x917fffff 64bit pref]
[    0.365675] pci_bus 0000:02: resource 1 [mem 0x91200000-0x912fffff]
[    0.367667] PCI: CLS 64 bytes, default 64
[    0.367687] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.367690] software IO TLB: mapped [mem 0x0000000078cce000-0x000000007ccce000] (64MB)
[    0.367829] Trying to unpack rootfs image as initramfs...
[    0.368018] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x171024fa93b, max_idle_ns: 440795253189 ns
[    0.368059] clocksource: Switched to clocksource tsc
[    0.368873] Initialise system trusted keyrings
[    0.368902] Key type blacklist registered
[    0.369052] workingset: timestamp_bits=36 max_order=20 bucket_order=0
[    0.371642] zbud: loaded
[    0.372310] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.372737] fuse: init (API version 7.36)
[    0.373074] integrity: Platform Keyring initialized
[    0.373084] integrity: Machine keyring initialized
[    0.386098] Key type asymmetric registered
[    0.386103] Asymmetric key parser 'x509' registered
[    1.414827] Freeing initrd memory: 67140K
[    1.424528] alg: self-tests for CTR-KDF (hmac(sha256)) passed
[    1.424594] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 243)
[    1.424684] io scheduler mq-deadline registered
[    1.442960] pcieport 0000:00:1c.0: PME: Signaling with IRQ 310
[    1.443114] pcieport 0000:00:1c.0: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    1.444990] pcieport 0000:00:1c.2: PME: Signaling with IRQ 311
[    1.445492] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    1.459670] ACPI: AC: AC Adapter [AC] (on-line)
[    1.459911] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:00/PNP0C09:00/PNP0C0D:00/input/input0
[    1.459988] ACPI: button: Lid Switch [LID0]
[    1.460109] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
[    1.460868] ACPI: button: Power Button [PWRF]
[    1.465668] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    1.486295] serial8250: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    1.489959] hpet_acpi_add: no address or irqs in _CRS
[    1.490004] Linux agpgart interface v0.103
[    1.494109] tpm_tis 00:07: 1.2 TPM (device-id 0xB, rev-id 16)
[    1.526942] loop: module loaded
[    1.527579] tun: Universal TUN/TAP device driver, 1.6
[    1.527651] PPP generic driver version 2.4.2
[    1.527785] VFIO - User Level meta-driver version: 0.3
[    1.528426] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.528451] ehci-pci: EHCI PCI platform driver
[    1.528472] ehci-platform: EHCI generic platform driver
[    1.528490] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.528497] ohci-pci: OHCI PCI platform driver
[    1.528514] ohci-platform: OHCI generic platform driver
[    1.528537] uhci_hcd: USB Universal Host Controller Interface driver
[    1.528659] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 182
[    1.528664] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
[    1.533075] i8042: Warning: Keylock active
[    1.533393] serio: i8042 KBD port at 0x60,0x64 irq 182
[    1.533610] mousedev: PS/2 mouse device common for all mice
[    1.533898] rtc_cmos 00:03: RTC can wake from S4
[    1.534255] rtc_cmos 00:03: registered as rtc0
[    1.534300] rtc_cmos 00:03: setting system clock to 2022-12-16T11:04:11 UTC (1671188651)
[    1.534339] rtc_cmos 00:03: alarms up to one month, y3k, 242 bytes nvram
[    1.534361] i2c_dev: i2c /dev entries driver
[    1.534845] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
[    1.534929] device-mapper: uevent: version 1.0.3
[    1.535087] device-mapper: ioctl: 4.47.0-ioctl (2022-07-28) initialised: dm-devel@redhat.com
[    1.535157] platform eisa.0: Probing EISA bus 0
[    1.535165] platform eisa.0: EISA: Cannot allocate resource for mainboard
[    1.535169] platform eisa.0: Cannot allocate resource for EISA slot 1
[    1.535172] platform eisa.0: Cannot allocate resource for EISA slot 2
[    1.535176] platform eisa.0: Cannot allocate resource for EISA slot 3
[    1.535179] platform eisa.0: Cannot allocate resource for EISA slot 4
[    1.535182] platform eisa.0: Cannot allocate resource for EISA slot 5
[    1.535185] platform eisa.0: Cannot allocate resource for EISA slot 6
[    1.535188] platform eisa.0: Cannot allocate resource for EISA slot 7
[    1.535191] platform eisa.0: Cannot allocate resource for EISA slot 8
[    1.535194] platform eisa.0: EISA: Detected 0 cards
[    1.535204] intel_pstate: Intel P-state driver initializing
[    1.536630] ledtrig-cpu: registered to indicate activity on CPUs
[    1.536721] efifb: probing for efifb
[    1.536779] efifb: showing boot graphics
[    1.539558] efifb: framebuffer at 0x80000000, using 4128k, total 4128k
[    1.539564] efifb: mode is 1366x768x32, linelength=5504, pages=1
[    1.539567] efifb: scrolling: redraw
[    1.539569] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    1.539672] fbcon: Deferring console take-over
[    1.539676] fb0: EFI VGA frame buffer device
[    1.539695] EFI Variables Facility v0.08 2004-May-17
[    1.540979] drop_monitor: Initializing network drop monitor service
[    1.545153] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input2
[    1.567360] NET: Registered PF_INET6 protocol family
[    1.583135] Segment Routing with IPv6
[    1.583180] In-situ OAM (IOAM) with IPv6
[    1.583257] NET: Registered PF_PACKET protocol family
[    1.584623] Key type dns_resolver registered
[    1.586178] microcode: sig=0x406c4, pf=0x1, revision=0x411
[    1.586200] microcode: Microcode Update Driver: v2.2.
[    1.586216] IPI shorthand broadcast: enabled
[    1.586263] sched_clock: Marking stable (1583656212, 1883100)->(1624829613, -39290301)
[    1.586583] registered taskstats version 1
[    1.586707] Loading compiled-in X.509 certificates
[    1.591183] Loaded X.509 cert 'Build time autogenerated kernel key: f9e2a7b4bb7c8535a4f1629cbe7dbe9ae9388590'
[    1.592671] Loaded X.509 cert 'Canonical Ltd. Live Patch Signing: 14df34d1a87cf37625abec039ef2bf521249b969'
[    1.594147] Loaded X.509 cert 'Canonical Ltd. Kernel Module Signing: 88f752e560a1e0737e31163a466ad7b70a850c19'
[    1.594152] blacklist: Loading compiled-in revocation X.509 certificates
[    1.594198] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing: 61482aa2830d0ab2ad5af10b7250da9033ddcef0'
[    1.595521] zswap: loaded using pool lzo/zbud
[    1.597372] Key type ._fscrypt registered
[    1.597384] Key type .fscrypt registered
[    1.597388] Key type fscrypt-provisioning registered
[    1.597831] Key type trusted registered
[    1.609484] Key type encrypted registered
[    1.609501] AppArmor: AppArmor sha1 policy hashing enabled
[    1.610112] Loading compiled-in module X.509 certificates
[    1.611664] Loaded X.509 cert 'Build time autogenerated kernel key: f9e2a7b4bb7c8535a4f1629cbe7dbe9ae9388590'
[    1.611671] ima: Allocated hash algorithm: sha1
[    1.655620] ima: No architecture policies found
[    1.655674] evm: Initialising EVM extended attributes:
[    1.655679] evm: security.selinux
[    1.655683] evm: security.SMACK64
[    1.655687] evm: security.SMACK64EXEC
[    1.655689] evm: security.SMACK64TRANSMUTE
[    1.655692] evm: security.SMACK64MMAP
[    1.655694] evm: security.apparmor
[    1.655697] evm: security.ima
[    1.655699] evm: security.capability
[    1.655702] evm: HMAC attrs: 0x1
[    1.674791] PM:   Magic number: 2:917:74
[    1.675577] RAS: Correctable Errors collector initialized.
[    1.733102] ACPI: battery: Slot [BAT0] (battery present)
[    1.750787] Freeing unused decrypted memory: 2036K
[    1.752556] Freeing unused kernel image (initmem) memory: 3148K
[    1.752872] Write protecting the kernel read-only data: 32768k
[    1.754655] Freeing unused kernel image (text/rodata gap) memory: 2036K
[    1.755508] Freeing unused kernel image (rodata/data gap) memory: 1044K
[    1.824937] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.825148] x86/mm: Checking user space page tables
[    1.891999] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.892014] Run /init as init process
[    1.892017]   with arguments:
[    1.892020]     /init
[    1.892022]     splash
[    1.892024]   with environment:
[    1.892026]     HOME=/
[    1.892028]     TERM=linux
[    1.892030]     BOOT_IMAGE=/boot/vmlinuz-5.19.0-26-generic
[    2.340912] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    2.340933] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
[    2.342036] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x100 quirks 0x0000000081509810
[    2.346952] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    2.346968] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
[    2.346980] xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
[    2.347095] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 5.19
[    2.347102] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.347106] usb usb1: Product: xHCI Host Controller
[    2.347109] usb usb1: Manufacturer: Linux 5.19.0-26-generic xhci-hcd
[    2.347112] usb usb1: SerialNumber: 0000:00:14.0
[    2.347356] hub 1-0:1.0: USB hub found
[    2.347385] hub 1-0:1.0: 7 ports detected
[    2.350624] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 5.19
[    2.350636] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.350641] usb usb2: Product: xHCI Host Controller
[    2.350644] usb usb2: Manufacturer: Linux 5.19.0-26-generic xhci-hcd
[    2.350647] usb usb2: SerialNumber: 0000:00:14.0
[    2.352408] hub 2-0:1.0: USB hub found
[    2.353633] hub 2-0:1.0: 6 ports detected
[    2.377837] sdhci: Secure Digital Host Controller Interface driver
[    2.377846] sdhci: Copyright(c) Pierre Ossman
[    2.402835] dw_dmac INTL9C60:00: DesignWare DMA Controller, 8 channels
[    2.434470] hid: raw HID events driver (C) Jiri Kosina
[    2.442904] dw_dmac INTL9C60:01: DesignWare DMA Controller, 8 channels
[    2.443032] sdhci-pci 0000:00:10.0: SDHCI controller found [8086:2294] (rev 35)
[    2.468381] cros_ec_lpcs GOOG0004:00: Chrome EC device registered
[    2.500575] mmc0: SDHCI controller on PCI [0000:00:10.0] using ADMA
[    2.500716] sdhci-pci 0000:00:12.0: SDHCI controller found [8086:2296] (rev 35)
[    2.501796] ACPI: \: failed to evaluate _DSM a53ec1f6-cd65-1f46-ab7a-29f7e8d5bd61 (0x1001)
[    2.501837] sdhci-pci 0000:00:12.0: failed to setup card detect gpio
[    2.503887] mmc1: SDHCI controller on PCI [0000:00:12.0] using ADMA
[    2.602431] usb 1-4: new high-speed USB device number 2 using xhci_hcd
[    2.675518] mmc0: new HS200 MMC card at address 0001
[    2.685188] mmcblk0: mmc0:0001 016G72 14.7 GiB 
[    2.689998]  mmcblk0: p1 p2
[    2.690600] mmcblk0boot0: mmc0:0001 016G72 4.00 MiB 
[    2.691560] mmcblk0boot1: mmc0:0001 016G72 4.00 MiB 
[    2.692437] mmcblk0rpmb: mmc0:0001 016G72 4.00 MiB, chardev (238:0)
[    2.780030] usb 1-4: New USB device found, idVendor=0bda, idProduct=57c4, bcdDevice= 0.03
[    2.780048] usb 1-4: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[    2.780054] usb 1-4: Product: HP Truevision HD
[    2.780059] usb 1-4: Manufacturer: Generic
[    2.780064] usb 1-4: SerialNumber: \x07DETGB019IAI5L5
[    2.910837] usb 1-5: new full-speed USB device number 3 using xhci_hcd
[    3.068094] usb 1-5: New USB device found, idVendor=8087, idProduct=0a2a, bcdDevice= 0.03
[    3.068137] usb 1-5: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    3.254135] fbcon: Taking over console
[    3.254332] Console: switching to colour frame buffer device 170x48
[    3.271156] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. Quota mode: none.
[    3.649170] systemd[1]: Inserted module 'autofs4'
[    3.696574] systemd[1]: systemd 251.4-1ubuntu7 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY -P11KIT -QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=unified)
[    3.696598] systemd[1]: Detected architecture x86-64.
[    3.698185] systemd[1]: Hostname set to <wren>.
[    5.295496] systemd[1]: Queued start job for default target Graphical Interface.
[    5.299184] systemd[1]: Created slice Slice /system/modprobe.
[    5.300534] systemd[1]: Created slice Slice /system/postfix.
[    5.301578] systemd[1]: Created slice Slice /system/systemd-fsck.
[    5.302424] systemd[1]: Created slice User and Session Slice.
[    5.302712] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[    5.303315] systemd[1]: Set up automount Arbitrary Executable File Formats File System Automount Point.
[    5.303456] systemd[1]: Reached target Local Integrity Protected Volumes.
[    5.303548] systemd[1]: Reached target User and Group Name Lookups.
[    5.303594] systemd[1]: Reached target Remote File Systems.
[    5.303640] systemd[1]: Reached target Slice Units.
[    5.303732] systemd[1]: Reached target Local Verity Protected Volumes.
[    5.304241] systemd[1]: Listening on Syslog Socket.
[    5.304572] systemd[1]: Listening on fsck to fsckd communication Socket.
[    5.304772] systemd[1]: Listening on initctl Compatibility Named Pipe.
[    5.305468] systemd[1]: Listening on Journal Audit Socket.
[    5.305839] systemd[1]: Listening on Journal Socket (/dev/log).
[    5.306281] systemd[1]: Listening on Journal Socket.
[    5.307783] systemd[1]: Listening on udev Control Socket.
[    5.308179] systemd[1]: Listening on udev Kernel Socket.
[    5.310780] systemd[1]: Mounting Huge Pages File System...
[    5.313843] systemd[1]: Mounting POSIX Message Queue File System...
[    5.317364] systemd[1]: Mounting Kernel Debug File System...
[    5.320621] systemd[1]: Mounting Kernel Trace File System...
[    5.325886] systemd[1]: Starting Journal Service...
[    5.330368] systemd[1]: Starting Set the console keyboard layout...
[    5.337810] systemd[1]: Starting Create List of Static Device Nodes...
[    5.345311] systemd[1]: Starting Load Kernel Module chromeos_pstore...
[    5.352307] systemd[1]: Starting Load Kernel Module configfs...
[    5.358529] systemd[1]: Starting Load Kernel Module drm...
[    5.368693] systemd[1]: Starting Load Kernel Module efi_pstore...
[    5.372075] systemd[1]: Starting Load Kernel Module fuse...
[    5.382540] systemd[1]: Starting Load Kernel Module pstore_blk...
[    5.389013] pstore: Using crash dump compression: deflate
[    5.389034] pstore: Registered efi as persistent store backend
[    5.390249] systemd[1]: Starting Load Kernel Module pstore_zone...
[    5.401112] systemd[1]: Starting Load Kernel Module ramoops...
[    5.401616] systemd[1]: File System Check on Root Device was skipped because of a failed condition check (ConditionPathExists=!/run/initramfs/fsck-root).
[    5.417262] systemd[1]: Starting Load Kernel Modules...
[    5.420280] systemd[1]: Starting Remount Root and Kernel File Systems...
[    5.420572] systemd[1]: Repartition Root Disk was skipped because all trigger condition checks failed.
[    5.425261] systemd[1]: Starting Coldplug All udev Devices...
[    5.475263] ACPI: bus type drm_connector registered
[    5.497434] systemd[1]: Mounted Huge Pages File System.
[    5.497810] systemd[1]: Mounted POSIX Message Queue File System.
[    5.498116] systemd[1]: Mounted Kernel Debug File System.
[    5.498521] EXT4-fs (mmcblk0p2): re-mounted. Quota mode: none.
[    5.519772] systemd[1]: Mounted Kernel Trace File System.
[    5.520525] systemd[1]: Finished Create List of Static Device Nodes.
[    5.522235] systemd[1]: modprobe@chromeos_pstore.service: Deactivated successfully.
[    5.526526] systemd[1]: Finished Load Kernel Module chromeos_pstore.
[    5.527576] systemd[1]: modprobe@configfs.service: Deactivated successfully.
[    5.534558] systemd[1]: Finished Load Kernel Module configfs.
[    5.535670] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    5.538509] systemd[1]: Finished Load Kernel Module drm.
[    5.539572] systemd[1]: modprobe@efi_pstore.service: Deactivated successfully.
[    5.542238] lp: driver loaded but no devices found
[    5.543362] systemd[1]: Finished Load Kernel Module efi_pstore.
[    5.547538] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    5.554545] systemd[1]: Finished Load Kernel Module fuse.
[    5.555623] systemd[1]: modprobe@pstore_blk.service: Deactivated successfully.
[    5.558799] systemd[1]: Finished Load Kernel Module pstore_blk.
[    5.559385] ppdev: user-space parallel port driver
[    5.560493] systemd[1]: modprobe@pstore_zone.service: Deactivated successfully.
[    5.561431] systemd[1]: Finished Load Kernel Module pstore_zone.
[    5.575494] systemd[1]: modprobe@ramoops.service: Deactivated successfully.
[    5.576375] systemd[1]: Finished Load Kernel Module ramoops.
[    5.580274] systemd[1]: Finished Remount Root and Kernel File Systems.
[    5.588145] systemd[1]: Activating swap /swapfile...
[    5.600259] Adding 1607676k swap on /swapfile.  Priority:-2 extents:7 across:8699900k SSFS
[    5.600516] systemd[1]: Mounting FUSE Control File System...
[    5.611314] systemd[1]: Mounting Kernel Configuration File System...
[    5.611581] systemd[1]: Platform Persistent Storage Archival was skipped because of a failed condition check (ConditionDirectoryNotEmpty=/sys/fs/pstore).
[    5.642749] systemd[1]: Starting Load/Save Random Seed...
[    5.653723] systemd[1]: Starting Create System Users...
[    5.654170] systemd[1]: Activated swap /swapfile.
[    5.668179] systemd[1]: Finished Load Kernel Modules.
[    5.669206] systemd[1]: Mounted FUSE Control File System.
[    5.683974] systemd[1]: Mounted Kernel Configuration File System.
[    5.690500] systemd[1]: Finished Load/Save Random Seed.
[    5.691314] systemd[1]: First Boot Complete was skipped because of a failed condition check (ConditionFirstBoot=yes).
[    5.691371] systemd[1]: Reached target Swaps.
[    5.694469] systemd[1]: Starting Apply Kernel Variables...
[    5.718998] systemd[1]: Finished Create System Users.
[    5.722865] systemd[1]: Starting Create Static Device Nodes in /dev...
[    5.737270] systemd[1]: Finished Apply Kernel Variables.
[    5.766204] systemd[1]: Finished Create Static Device Nodes in /dev.
[    5.771106] systemd[1]: Starting Rule-based Manager for Device Events and Files...
[    5.783966] systemd[1]: Finished Set the console keyboard layout.
[    5.784457] systemd[1]: Reached target Preparation for Local File Systems.
[    5.788902] systemd[1]: Mounting Mount unit for bare, revision 5...
[    5.796708] systemd[1]: Mounting Mount unit for core20, revision 1623...
[    5.810144] systemd[1]: Mounting Mount unit for core20, revision 1738...
[    5.815480] loop0: detected capacity change from 0 to 8
[    5.816912] systemd[1]: Mounting Mount unit for firefox, revision 1969...
[    5.818539] Dev loop0: unable to read RDB block 8
[    5.818597]  loop0: unable to read partition table
[    5.818611] loop0: partition table beyond EOD, truncated
[    5.821755] loop1: detected capacity change from 0 to 129496
[    5.826709] systemd[1]: Mounting Mount unit for firefox, revision 2154...
[    5.835106] loop2: detected capacity change from 0 to 129480
[    5.842728] systemd[1]: Mounting Mount unit for gnome-3-38-2004, revision 119...
[    5.852115] loop3: detected capacity change from 0 to 488424
[    5.852727] systemd[1]: Mounting Mount unit for gtk-common-themes, revision 1535...
[    5.857542] loop4: detected capacity change from 0 to 486424
[    5.864528] loop5: detected capacity change from 0 to 709280
[    5.870703] systemd[1]: Mounting Mount unit for snapd, revision 17883...
[    5.882935] loop6: detected capacity change from 0 to 187776
[    5.883635] systemd[1]: Mounting Mount unit for firefox, revision 1969 via mount-control...
[    5.902337] systemd[1]: Started Journal Service.
[    5.902665] loop7: detected capacity change from 0 to 101624
[    5.953129] systemd-journald[244]: Received client request to flush runtime journal.
[    7.050902] audit: type=1400 audit(1671188657.016:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=341 comm="apparmor_parser"
[    7.068971] audit: type=1400 audit(1671188657.032:3): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session" pid=340 comm="apparmor_parser"
[    7.068997] audit: type=1400 audit(1671188657.032:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/lightdm/lightdm-guest-session//chromium" pid=340 comm="apparmor_parser"
[    7.078690] audit: type=1400 audit(1671188657.044:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe" pid=342 comm="apparmor_parser"
[    7.078707] audit: type=1400 audit(1671188657.044:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod" pid=342 comm="apparmor_parser"
[    7.090675] audit: type=1400 audit(1671188657.056:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=343 comm="apparmor_parser"
[    7.090697] audit: type=1400 audit(1671188657.056:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/NetworkManager/nm-dhcp-helper" pid=343 comm="apparmor_parser"
[    7.090707] audit: type=1400 audit(1671188657.056:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/lib/connman/scripts/dhclient-script" pid=343 comm="apparmor_parser"
[    7.090716] audit: type=1400 audit(1671188657.056:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/{,usr/}sbin/dhclient" pid=343 comm="apparmor_parser"
[    7.104236] audit: type=1400 audit(1671188657.068:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="/usr/bin/man" pid=344 comm="apparmor_parser"
[    7.845728] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    7.848620] cfg80211: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    7.869625] Consider using thermal netlink events interface
[    8.142616] proc_thermal 0000:00:0b.0: can't derive routing for PCI INT A
[    8.142629] proc_thermal 0000:00:0b.0: PCI INT A: not connected
[    8.166680] elan_i2c i2c-ELAN0000:00: supply vcc not found, using dummy regulator
[    8.284165] elan_i2c i2c-ELAN0000:00: Elan Touchpad: Module ID: 0x007b, Firmware: 0x0003, Sample: 0x0007, IAP: 0x000d
[    8.311290] input: Elan Touchpad as /devices/pci0000:00/808622C1:05/i2c-2/i2c-ELAN0000:00/input/input3
[    8.552837] Bluetooth: Core ver 2.22
[    8.552944] NET: Registered PF_BLUETOOTH protocol family
[    8.552949] Bluetooth: HCI device and connection manager initialized
[    8.553187] Bluetooth: HCI socket layer initialized
[    8.553194] Bluetooth: L2CAP socket layer initialized
[    8.553205] Bluetooth: SCO socket layer initialized
[    9.388104] Bluetooth: hci0: Legacy ROM 2.x revision 5.0 build 25 week 20 2015
[    9.393723] Bluetooth: hci0: Intel Bluetooth firmware file: intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq
[    9.426486] usbcore: registered new interface driver btusb
[    9.669799] Console: switching to colour dummy device 80x25
[    9.669874] i915 0000:00:02.0: vgaarb: deactivate vga console
[    9.674122] Intel(R) Wireless WiFi driver for Linux
[    9.775205] Bluetooth: hci0: Intel BT fw patch 0x43 completed & activated
[    9.815942] mc: Linux media interface: v0.10
[    9.817112] spi-nor spi0.0: w25q64dw (8192 Kbytes)
[    9.901940] iwlwifi 0000:02:00.0: Found debug destination: EXTERNAL_DRAM
[    9.901954] iwlwifi 0000:02:00.0: Found debug configuration: 0
[    9.903069] iwlwifi 0000:02:00.0: loaded firmware version 29.4063824552.0 7265D-29.ucode op_mode iwlmvm
[    9.953541] Creating 1 MTD partitions on "intel-spi":
[    9.953556] 0x000000000000-0x000000800000 : "BIOS"
[   10.137012] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on minor 0
[   10.227097] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
[   10.227448] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input4
[   10.490768] cros-ec-sensorhub cros-ec-sensorhub.3.auto: no info for EC sensor 0 : -22/3
[   10.492210] cros-ec-sensorhub cros-ec-sensorhub.3.auto: no info for EC sensor 1 : -22/3
[   10.843112] videodev: Linux video capture interface: v2.00
[   10.848142] fbcon: i915drmfb (fb0) is primary device
[   11.072678] cryptd: max_cpu_qlen set to 1000
[   11.105581] intel_rapl_common: Found RAPL domain package
[   11.105588] intel_rapl_common: Found RAPL domain core
[   11.593502] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   11.593511] Bluetooth: BNEP filters: protocol multicast
[   11.593520] Bluetooth: BNEP socket layer initialized
[   12.096881] Console: switching to colour frame buffer device 170x48
[   12.125606] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
[   12.191524] NET: Registered PF_ALG protocol family
[   12.217110] iwlwifi 0000:02:00.0: Detected Intel(R) Dual Band Wireless AC 7265, REV=0x210
[   12.217267] thermal thermal_zone7: failed to read out thermal zone (-61)
[   12.232155] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[   12.234923] iwlwifi 0000:02:00.0: Allocated 0x00400000 bytes for firmware monitor.
[   12.252693] iwlwifi 0000:02:00.0: base HW address: 14:4f:8a:5c:18:8b, OTP minor version: 0x0
[   12.255467] SSE version of gcm_enc/dec engaged.
[   12.271741] rt5640 i2c-10EC5650:00: Device with ID register 0x6419 is not rt5640/39
[   12.284810] rt5645 i2c-10EC5650:00: Detected Google Chrome platform
[   12.284829] rt5645 i2c-10EC5650:00: supply avdd not found, using dummy regulator
[   12.284923] rt5645 i2c-10EC5650:00: supply cpvdd not found, using dummy regulator
[   12.314889] ieee80211 phy0: Selected rate control algorithm 'iwl-mvm-rs'
[   12.658858] iwlwifi 0000:02:00.0 wlp2s0: renamed from wlan0
[   12.701141] usb 1-4: Found UVC 1.00 device HP Truevision HD (0bda:57c4)
[   12.712974] sof-audio-acpi-intel-byt 808622A8:00: Firmware info: version 2:1:1-3964a
[   12.712986] sof-audio-acpi-intel-byt 808622A8:00: Firmware: ABI 3:21:0 Kernel ABI 3:21:0
[   12.713006] sof-audio-acpi-intel-byt 808622A8:00: unknown sof_ext_man header type 3 size 0x30
[   12.736727] sof-audio-acpi-intel-byt 808622A8:00: Firmware info: version 2:1:1-3964a
[   12.736739] sof-audio-acpi-intel-byt 808622A8:00: Firmware: ABI 3:21:0 Kernel ABI 3:21:0
[   12.802246] input: HP Truevision HD: HP Truevision as /devices/pci0000:00/0000:00:14.0/usb1/1-4/1-4:1.0/input/input5
[   12.802850] usbcore: registered new interface driver uvcvideo
[   12.807098] loop8: detected capacity change from 0 to 8
[   12.809772] Dev loop8: unable to read RDB block 8
[   12.809791]  loop8: unable to read partition table
[   12.809803] loop8: partition table beyond EOD, truncated
[   12.842252] cht-bsw-rt5645 cht-bsw-rt5645: quirk PMC_PLT_CLK_0 enabled
[   12.903744] sof-audio-acpi-intel-byt 808622A8:00: Topology: ABI 3:21:0 Kernel ABI 3:21:0
[   12.905121] cht-bsw-rt5645 cht-bsw-rt5645: ASoC: Parent card not yet available, widget card binding deferred
[   13.084774] ================================================================================
[   13.084781] UBSAN: shift-out-of-bounds in /build/linux-ke3rPq/linux-5.19.0/sound/soc/soc-dapm.c:815:15
[   13.084788] shift exponent 16384 is too large for 32-bit type 'unsigned int'
[   13.084792] CPU: 0 PID: 294 Comm: systemd-udevd Not tainted 5.19.0-26-generic #27-Ubuntu
[   13.084797] Hardware name: GOOGLE Setzer/Setzer, BIOS MrChromebox-4.18.2 11/29/2022
[   13.084799] Call Trace:
[   13.084803]  <TASK>
[   13.084808]  show_stack+0x4e/0x61
[   13.084820]  dump_stack_lvl+0x4a/0x6d
[   13.084826]  dump_stack+0x10/0x18
[   13.084830]  ubsan_epilogue+0x9/0x43
[   13.084834]  __ubsan_handle_shift_out_of_bounds.cold+0x61/0xef
[   13.084842]  snd_soc_dapm_add_path.cold+0x67/0x12a [snd_soc_core]
[   13.084897]  snd_soc_dapm_add_route+0x120/0x330 [snd_soc_core]
[   13.084938]  snd_soc_dapm_add_routes+0x4c/0xa0 [snd_soc_core]
[   13.084975]  soc_probe_component+0x21c/0x2a0 [snd_soc_core]
[   13.085011]  snd_soc_bind_card+0x2e3/0x730 [snd_soc_core]
[   13.085046]  ? devm_snd_soc_register_card+0x38/0xb0 [snd_soc_core]
[   13.085087]  snd_soc_register_card+0x145/0x170 [snd_soc_core]
[   13.085122]  devm_snd_soc_register_card+0x48/0xb0 [snd_soc_core]
[   13.085162]  snd_cht_mc_probe+0x49e/0x6b0 [snd_soc_sst_cht_bsw_rt5645]
[   13.085171]  ? kernfs_create_link+0x66/0xe0
[   13.085176]  ? acpi_dev_pm_attach+0x25/0x120
[   13.085182]  platform_probe+0x48/0xe0
[   13.085189]  really_probe+0x1df/0x3b0
[   13.085193]  __driver_probe_device+0x12c/0x1b0
[   13.085197]  driver_probe_device+0x24/0xd0
[   13.085201]  __driver_attach+0xe0/0x210
[   13.085205]  ? __device_attach_driver+0x130/0x130
[   13.085208]  bus_for_each_dev+0x90/0xe0
[   13.085213]  driver_attach+0x1e/0x30
[   13.085216]  bus_add_driver+0x187/0x230
[   13.085220]  driver_register+0x8f/0x100
[   13.085224]  ? 0xffffffffc0cca000
[   13.085228]  __platform_driver_register+0x1e/0x30
[   13.085232]  snd_cht_mc_driver_init+0x1c/0x1000 [snd_soc_sst_cht_bsw_rt5645]
[   13.085238]  do_one_initcall+0x5e/0x240
[   13.085245]  do_init_module+0x50/0x210
[   13.085250]  load_module+0xb7d/0xcd0
[   13.085257]  __do_sys_finit_module+0xc4/0x140
[   13.085260]  ? __do_sys_finit_module+0xc4/0x140
[   13.085266]  __x64_sys_finit_module+0x18/0x30
[   13.085269]  do_syscall_64+0x5b/0x90
[   13.085273]  ? exit_to_user_mode_prepare+0x30/0xb0
[   13.085278]  ? syscall_exit_to_user_mode+0x26/0x50
[   13.085282]  ? __x64_sys_mmap+0x33/0x70
[   13.085286]  ? do_syscall_64+0x67/0x90
[   13.085289]  ? do_syscall_64+0x67/0x90
[   13.085292]  ? do_syscall_64+0x67/0x90
[   13.085295]  ? sysvec_apic_timer_interrupt+0x4b/0xd0
[   13.085298]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   13.085303] RIP: 0033:0x7f285cd16c4d
[   13.085309] Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 83 f1 0d 00 f7 d8 64 89 01 48
[   13.085312] RSP: 002b:00007ffe75652028 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   13.085318] RAX: ffffffffffffffda RBX: 000055abf33f9f50 RCX: 00007f285cd16c4d
[   13.085320] RDX: 0000000000000000 RSI: 00007f285cfc4458 RDI: 0000000000000006
[   13.085323] RBP: 00007f285cfc4458 R08: 0000000000000000 R09: 00007ffe75652150
[   13.085325] R10: 0000000000000006 R11: 0000000000000246 R12: 0000000000020000
[   13.085327] R13: 000055abf33f69b0 R14: 0000000000000000 R15: 000055abf33f6660
[   13.085332]  </TASK>
[   13.085333] ================================================================================
[   13.112949] snd_hda_intel 0000:00:1b.0: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[   13.151710] input: sof-bytcht rt5650 Headset as /devices/pci0000:00/808622A8:00/cht-bsw-rt5645/sound/card0/input6
[   13.186899] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[   13.251449] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1b.0/sound/card1/input7
[   13.251587] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1b.0/sound/card1/input8
[   13.251701] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1b.0/sound/card1/input9
[   13.285015] iwlwifi 0000:02:00.0: Applying debug destination EXTERNAL_DRAM
[   13.287519] iwlwifi 0000:02:00.0: FW already configured (0) - re-configuring
[   13.912231] ================================================================================
[   13.912248] UBSAN: shift-out-of-bounds in /build/linux-ke3rPq/linux-5.19.0/sound/soc/soc-dapm.c:3420:13
[   13.912256] shift exponent 16384 is too large for 32-bit type 'unsigned int'
[   13.912261] CPU: 0 PID: 750 Comm: alsactl Not tainted 5.19.0-26-generic #27-Ubuntu
[   13.912266] Hardware name: GOOGLE Setzer/Setzer, BIOS MrChromebox-4.18.2 11/29/2022
[   13.912270] Call Trace:
[   13.912274]  <TASK>
[   13.912280]  show_stack+0x4e/0x61
[   13.912291]  dump_stack_lvl+0x4a/0x6d
[   13.912303]  dump_stack+0x10/0x18
[   13.912307]  ubsan_epilogue+0x9/0x43
[   13.912312]  __ubsan_handle_shift_out_of_bounds.cold+0x61/0xef
[   13.912320]  snd_soc_dapm_put_volsw.cold+0x60/0x2be [snd_soc_core]
[   13.912376]  snd_ctl_elem_write+0x115/0x200 [snd]
[   13.912396]  snd_ctl_ioctl+0x12e/0x690 [snd]
[   13.912414]  __x64_sys_ioctl+0xa0/0xe0
[   13.912420]  do_syscall_64+0x5b/0x90
[   13.912425]  ? do_syscall_64+0x67/0x90
[   13.912429]  ? syscall_exit_to_user_mode+0x26/0x50
[   13.912434]  ? do_syscall_64+0x67/0x90
[   13.912437]  ? do_syscall_64+0x67/0x90
[   13.912441]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   13.912447] RIP: 0033:0x7f5d6c512d8f
[   13.912453] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[   13.912457] RSP: 002b:00007ffcc29180e0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   13.912462] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f5d6c512d8f
[   13.912465] RDX: 00007ffcc2918270 RSI: 00000000c4c85513 RDI: 0000000000000003
[   13.912468] RBP: 00007ffcc2918810 R08: 0000000000000001 R09: 000055dbbd456116
[   13.912471] R10: fffffffffffff725 R11: 0000000000000246 R12: 0000000000000082
[   13.912473] R13: 0000000000000001 R14: 0000000000000001 R15: 00007ffcc2918160
[   13.912479]  </TASK>
[   13.912497] ================================================================================
[   13.912502] ================================================================================
[   13.912505] UBSAN: shift-out-of-bounds in /build/linux-ke3rPq/linux-5.19.0/sound/soc/soc-dapm.c:3421:15
[   13.912510] shift exponent 16384 is too large for 32-bit type 'unsigned int'
[   13.912514] CPU: 0 PID: 750 Comm: alsactl Not tainted 5.19.0-26-generic #27-Ubuntu
[   13.912518] Hardware name: GOOGLE Setzer/Setzer, BIOS MrChromebox-4.18.2 11/29/2022
[   13.912520] Call Trace:
[   13.912523]  <TASK>
[   13.912525]  show_stack+0x4e/0x61
[   13.912531]  dump_stack_lvl+0x4a/0x6d
[   13.912537]  dump_stack+0x10/0x18
[   13.912542]  ubsan_epilogue+0x9/0x43
[   13.912546]  __ubsan_handle_shift_out_of_bounds.cold+0x61/0xef
[   13.912553]  snd_soc_dapm_put_volsw.cold+0x205/0x2be [snd_soc_core]
[   13.912597]  snd_ctl_elem_write+0x115/0x200 [snd]
[   13.912614]  snd_ctl_ioctl+0x12e/0x690 [snd]
[   13.912631]  __x64_sys_ioctl+0xa0/0xe0
[   13.912636]  do_syscall_64+0x5b/0x90
[   13.912639]  ? do_syscall_64+0x67/0x90
[   13.912643]  ? syscall_exit_to_user_mode+0x26/0x50
[   13.912648]  ? do_syscall_64+0x67/0x90
[   13.912651]  ? do_syscall_64+0x67/0x90
[   13.912655]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   13.912660] RIP: 0033:0x7f5d6c512d8f
[   13.912664] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[   13.912667] RSP: 002b:00007ffcc29180e0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   13.912672] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f5d6c512d8f
[   13.912675] RDX: 00007ffcc2918270 RSI: 00000000c4c85513 RDI: 0000000000000003
[   13.912677] RBP: 00007ffcc2918810 R08: 0000000000000001 R09: 000055dbbd456116
[   13.912680] R10: fffffffffffff725 R11: 0000000000000246 R12: 0000000000000082
[   13.912682] R13: 0000000000000001 R14: 0000000000000001 R15: 00007ffcc2918160
[   13.912688]  </TASK>
[   13.912690] ================================================================================
[   13.912693] ================================================================================
[   13.912695] UBSAN: shift-out-of-bounds in /build/linux-ke3rPq/linux-5.19.0/sound/soc/soc-dapm.c:3423:51
[   13.912700] shift exponent 16384 is too large for 32-bit type 'unsigned int'
[   13.912703] CPU: 0 PID: 750 Comm: alsactl Not tainted 5.19.0-26-generic #27-Ubuntu
[   13.912707] Hardware name: GOOGLE Setzer/Setzer, BIOS MrChromebox-4.18.2 11/29/2022
[   13.912709] Call Trace:
[   13.912711]  <TASK>
[   13.912713]  show_stack+0x4e/0x61
[   13.912719]  dump_stack_lvl+0x4a/0x6d
[   13.912724]  dump_stack+0x10/0x18
[   13.912729]  ubsan_epilogue+0x9/0x43
[   13.912733]  __ubsan_handle_shift_out_of_bounds.cold+0x61/0xef
[   13.912740]  snd_soc_dapm_put_volsw.cold+0x97/0x2be [snd_soc_core]
[   13.912784]  snd_ctl_elem_write+0x115/0x200 [snd]
[   13.912800]  snd_ctl_ioctl+0x12e/0x690 [snd]
[   13.912818]  __x64_sys_ioctl+0xa0/0xe0
[   13.912822]  do_syscall_64+0x5b/0x90
[   13.912826]  ? do_syscall_64+0x67/0x90
[   13.912830]  ? syscall_exit_to_user_mode+0x26/0x50
[   13.912834]  ? do_syscall_64+0x67/0x90
[   13.912838]  ? do_syscall_64+0x67/0x90
[   13.912842]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   13.912846] RIP: 0033:0x7f5d6c512d8f
[   13.912850] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[   13.912854] RSP: 002b:00007ffcc29180e0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   13.912858] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f5d6c512d8f
[   13.912861] RDX: 00007ffcc2918270 RSI: 00000000c4c85513 RDI: 0000000000000003
[   13.912863] RBP: 00007ffcc2918810 R08: 0000000000000001 R09: 000055dbbd456116
[   13.912866] R10: fffffffffffff725 R11: 0000000000000246 R12: 0000000000000082
[   13.912868] R13: 0000000000000001 R14: 0000000000000001 R15: 00007ffcc2918160
[   13.912874]  </TASK>
[   13.912875] ================================================================================
[   13.913215] ================================================================================
[   13.913224] UBSAN: shift-out-of-bounds in /build/linux-ke3rPq/linux-5.19.0/sound/soc/soc-dapm.c:3441:23
[   13.913230] shift exponent 16384 is too large for 32-bit type 'unsigned int'
[   13.913235] CPU: 0 PID: 750 Comm: alsactl Not tainted 5.19.0-26-generic #27-Ubuntu
[   13.913239] Hardware name: GOOGLE Setzer/Setzer, BIOS MrChromebox-4.18.2 11/29/2022
[   13.913242] Call Trace:
[   13.913245]  <TASK>
[   13.913249]  show_stack+0x4e/0x61
[   13.913258]  dump_stack_lvl+0x4a/0x6d
[   13.913267]  dump_stack+0x10/0x18
[   13.913272]  ubsan_epilogue+0x9/0x43
[   13.913276]  __ubsan_handle_shift_out_of_bounds.cold+0x61/0xef
[   13.913284]  snd_soc_dapm_put_volsw.cold+0x2b5/0x2be [snd_soc_core]
[   13.913337]  snd_ctl_elem_write+0x115/0x200 [snd]
[   13.913356]  snd_ctl_ioctl+0x12e/0x690 [snd]
[   13.913373]  __x64_sys_ioctl+0xa0/0xe0
[   13.913380]  do_syscall_64+0x5b/0x90
[   13.913384]  ? do_syscall_64+0x67/0x90
[   13.913388]  ? syscall_exit_to_user_mode+0x26/0x50
[   13.913393]  ? do_syscall_64+0x67/0x90
[   13.913396]  ? do_syscall_64+0x67/0x90
[   13.913400]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   13.913406] RIP: 0033:0x7f5d6c512d8f
[   13.913412] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[   13.913415] RSP: 002b:00007ffcc29180e0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[   13.913420] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f5d6c512d8f
[   13.913423] RDX: 00007ffcc2918270 RSI: 00000000c4c85513 RDI: 0000000000000003
[   13.913425] RBP: 00007ffcc2918810 R08: 0000000000000001 R09: 000055dbbd456116
[   13.913428] R10: fffffffffffff725 R11: 0000000000000246 R12: 0000000000000082
[   13.913430] R13: 0000000000000001 R14: 0000000000000001 R15: 00007ffcc2918160
[   13.913436]  </TASK>
[   13.913438] ================================================================================
[   17.172434] wlp2s0: authenticate with 00:18:0a:d8:7d:12
[   17.172483] wlp2s0: bad VHT capabilities, disabling VHT
[   17.180519] wlp2s0: send auth to 00:18:0a:d8:7d:12 (try 1/3)
[   17.183085] wlp2s0: authenticated
[   17.183797] wlp2s0: VHT capa missing/short, disabling VHT/HE/EHT
[   17.186440] wlp2s0: associate with 00:18:0a:d8:7d:12 (try 1/3)
[   17.188389] wlp2s0: RX AssocResp from 00:18:0a:d8:7d:12 (capab=0x11 status=0 aid=1)
[   17.199694] wlp2s0: associated
[   17.351258] IPv6: ADDRCONF(NETDEV_CHANGE): wlp2s0: link becomes ready
[   17.377833]  SSP2-Codec: dpcm_be_connect: FE is nonatomic but BE is not, forcing BE as nonatomic
[   18.115144] Bluetooth: RFCOMM TTY layer initialized
[   18.115165] Bluetooth: RFCOMM socket layer initialized
[   18.115184] Bluetooth: RFCOMM ver 1.11


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C39C12C2E36
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 18:16:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71D6A17ED;
	Tue, 24 Nov 2020 18:15:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71D6A17ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606238208;
	bh=zXmelwvX6k1kmZ1fgaSVCN2ycnUoLxMjDZTcPA1LZ6Y=;
	h=Subject:From:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fq7fntdMNNXFETXGFDKRpyXElFsa61Cru6PMvtXPEUOXiw4ffR8ORliq+GXqvkgBo
	 9qT/DjiAjaPRKQPATd596BQRmJEDFS1n2E+ubly/WBhbULMTS1Y7t04ptzb+JF4XGM
	 5f7QXsz22kZsDMFhuOA+zdJD76QG6Ji9IKZHYeWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B248F80610;
	Tue, 24 Nov 2020 17:58:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E7FBF80255; Mon, 23 Nov 2020 18:01:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13, RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B8A0F80113
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 18:01:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B8A0F80113
Received: from [192.168.2.105] ([93.225.124.23]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MrhDg-1jvnXB2bLQ-00nlFD for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020
 18:01:53 +0100
Message-ID: <f7053c2bcfc6698b693102f632daa24795b6fdfa.camel@e-mail.de>
Subject: Help me debug snd_emu10k1 - Sound Blaster Audigy Series only
 working in 50% of the boots
From: Micha <debian@e-mail.de>
To: alsa-devel@alsa-project.org
Date: Mon, 23 Nov 2020 18:01:53 +0100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:V9lxafBgCJbF7opZ442+RUyyKp0BRwDlgxcbengaaFqZRi+cO/H
 fuQg4ipA5o9gbqM5jzpbXMwHrIDZzvWgDkKIzU87Dx2DJ3WU2m71LFevUregKhxHkUO0pyH
 Rc2KJuNbYt7hxgThO2I868t2v9+o4+osJwF34vPUjJxCt9awAHOjgBmPNUI3i4dzGAQ/fJ0
 XyLP4I7FlPQvHloaKObzw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8HbiWZ7BZAE=:gsVZHhzK7oLvtyBPBZuT2Z
 zS+TOf7+0ZdRHyIhkqI/PLgPFkXXZ5uM95oE/d90cgeANAI8c+oE3pMn5BC2+obv6VJbT92+F
 MetpNnH3nsY2G7lHhKUFhe0f8NuK4B2IfT8SA4YQlYpRSe/8M8rARYoASP+GU89Ba9QN00WzL
 uskdBwwM+vemnRmTrhAKhKcyzB77KNa++5fL2qNQAVD62QcJg0OX2biONzu+M+FEu7mBb7k4d
 uOZ1lUweGmgsfkRTdjIV4kJlhCAqtCwHc5dCp97isMtUoG1K6V69+QcRWJYi57rH5B444JVU5
 DVrTrq1KnXZWjnJYHPPNVvsVYM14VoFMA0eMwJxL0k3vmk2LZnrhG9Z/CdpFiur/TXiL/FEi1
 CRFPALe49JDbUCio0zAbU4b1l+k8j0ONPw7O7lQS60cIxxXHij9MnBTlp348A8y5xKZck8WNR
 9jNbEvhm2bfwdVWODmez+1nzzaGWNPvvXQzVWlfUbyqNjEC6fjB7
X-Mailman-Approved-At: Tue, 24 Nov 2020 17:58:07 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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

Hi there,

my soundcard works only in 50% of the boots. 


❯ hwinfo --sound
19: PCI a00.0: 0401 Multimedia audio controller                 
  [Created at pci.386]
  Unique ID: cuhJ.Rgto84+swI4
  Parent ID: x1VA.RTygCxq_rO0
  SysFS ID: /devices/pci0000:00/0000:00:1c.6/0000:09:00.0/0000:0a:00.0
  SysFS BusID: 0000:0a:00.0
  Hardware Class: sound
  Model: "Creative SB1550 Audigy 5/Rx"
  Vendor: pci 0x1102 "Creative Labs"
  Device: pci 0x0008 "CA0108/CA10300 [Sound Blaster Audigy Series]"
  SubVendor: pci 0x1102 "Creative Labs"
  SubDevice: pci 0x1024 "SB1550 Audigy 5/Rx"
  I/O Ports: 0xd000-0xd03f (rw)
  IRQ: 18 (no events)
  Module Alias: "pci:v00001102d00000008sv00001102sd00001024bc04sc01i00"
  Driver Info #0:
    Driver Status: snd_emu10k1 is active
    Driver Activation Cmd: "modprobe snd_emu10k1"
  Config Status: cfg=new, avail=yes, need=no, active=unknown
  Attached to: #10 (PCI bridge)

If the card is recognised well the card works out of the box, but in
half of all boots the card is not recognised. For some reasons the card
didn't get an interrupt and then the card is not available in
/proc/asound/cards


working state:

File: /proc/interrupts
───────┼───────────────────────────────────────────────────────────────

───────────────────────────────────────────────────────────────────────

────────────────────────────
1 │ CPU0 CPU1 CPU2 CPU3
2 │ 0: 8 0 0 0 IO-APIC 2-edge timer
3 │ 8: 0 0 0 1 IO-APIC 8-edge rtc0
4 │ 9: 0 0 0 0 IO-APIC 9-fasteoi acpi
5 │ 16: 0 0 4 0 IO-APIC 16-fasteoi i801_smbus
6 │ 18: 0 21 0 0 IO-APIC 18-fasteoi snd_emu10k1


In the not working state the cards get no interrupt, but the interrupt
above ( 18) in not given to another card or something


442368-edge      aerdrv
journald meldet dann:
✦ ❯ journalctl -b -g snd_emu10k1
-- Logs begin at Mon 2020-06-29 17:38:04 CEST, end at Mon 2020-11-02
20:30:00 CET. --
Nov 02 18:03:14 sysiphus kernel: snd_emu10k1 0000:0a:00.0: enabling
device (0000 -> 0001)
Nov 02 18:03:14 sysiphus kernel: snd_emu10k1 0000:0a:00.0: Audigy2
value: Special config.
Nov 02 18:03:15 sysiphus kernel: snd_emu10k1 0000:0a:00.0: AC'97 0 does
not respond - RESET
Nov 02 18:03:15 sysiphus kernel: snd_emu10k1 0000:0a:00.0: AC'97 0
access is not valid [0x0], removing mixer.
Nov 02 18:03:15 sysiphus kernel: snd_emu10k1: probe of 0000:0a:00.0
failed with error -5

Debian Sid
✦ ❯ uname -a
Linux sysiphus 5.9.0-2-amd64 #1 SMP Debian 5.9.6-1 (2020-11-08) x86_64
GNU/Linux

Board is an Asus PRIME Z270-K with bios 1207.

I have tested the card in another pci port and also have changed the
card to a new one, both without success.

Can you please help me to debug this further? When you need additional
information, please ask and I will provide it.

I have tested the card with a friend of mine in another pc without
problems, so it is save that the card works.

After asking in forums and alsa user mailing list, I don't know how
further. So I have try to debug this on my own.



Since this is the first time in my life, that I try to debug the
kernel. So I really would appreciate advice.

 ❯ cat /lib/modules/5.9.0-2-amd64/build/.config|grep CONFIG_DYNAMIC
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_DYNAMIC_EVENTS=y

It seems that my kernel support debugging.
So I set:

echo "module snd_* +p" > /sys/kernel/debug/dynamic_debug/control
echo 8 > /proc/sys/kernel/printk

boot options
/proc/cmdline
BOOT_IMAGE=/rootfs/boot/vmlinuz-5.9.0-3-amd64 root=UUID=540aa15f-af6b-
45ff-b6ad-37181400efc9 ro rootflags=subvol=rootfs
rootflags=subvol=rootfs quiet net.ifnames=0 biosdevname=0
log_buf_len=1M printk.devkmsg=on debug

After the boot the soundcard is not working, so I removed the 
rmmod -vf snd_emu10k1 modul and tried reloading it.

Sorry, the output is very large and long. Is my way correct?
Or should I do something diffferent? I think better would be to
generate the debug output directly at boot, since I can't say if
removing the module causes this messages.

Please add some light to me and help me to get know whats wrong and
also please add me to CC, since I'm not subscribed to the list.

Thanks Micha


Output
==========================
[  232.428668] snd_emu10k1 0000:0a:00.0: Audigy2 value: Special config.
[  233.444961] snd_emu10k1 0000:0a:00.0: AC'97 0 does not respond -
RESET
[  233.444977] snd_emu10k1 0000:0a:00.0: AC'97 0 access is not valid
[0x0], removing mixer.
[  233.446714] snd_emu10k1: probe of 0000:0a:00.0 failed with error -5
[  943.295169] BUG: kernel NULL pointer dereference, address:
0000000000000000
[  943.295176] #PF: supervisor instruction fetch in kernel mode
[  943.295179] #PF: error_code(0x0010) - not-present page
[  943.295181] PGD 0 P4D 0 
[  943.295187] Oops: 0010 [#1] SMP PTI
[  943.295193] CPU: 1 PID: 7669 Comm: grep Not tainted 5.9.0-2-amd64 #1
Debian 5.9.6-1
[  943.295196] Hardware name: System manufacturer System Product
Name/PRIME Z270-K, BIOS 1207 06/22/2018
[  943.295201] RIP: 0010:0x0
[  943.295206] Code: Unable to access opcode bytes at RIP
0xffffffffffffffd6.
[  943.295209] RSP: 0018:ffffb76ac8f0fe40 EFLAGS: 00010203
[  943.295213] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000030
[  943.295216] RDX: fffffffffffecde8 RSI: 0000000000000001 RDI:
ffff97b0d3b23348
[  943.295218] RBP: ffffb76ac8f0ff10 R08: fffffffffffecde8 R09:
ffffffffffffffff
[  943.295221] R10: fffffffffffecde8 R11: 0000000000000000 R12:
0000000000000001
[  943.295223] R13: ffff97b0d3b23370 R14: ffff97b0d3b23348 R15:
ffff97b0d3b23380
[  943.295227] FS:  00007f9abbdc4b80(0000) GS:ffff97b226c80000(0000)
knlGS:0000000000000000
[  943.295230] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  943.295233] CR2: ffffffffffffffd6 CR3: 000000028e3a6003 CR4:
00000000003706e0
[  943.295236] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  943.295238] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[  943.295240] Call Trace:
[  943.295251]  seq_read+0xb4/0x460
[  943.295258]  full_proxy_read+0x53/0x80
[  943.295264]  vfs_read+0x9c/0x180
[  943.295270]  ksys_read+0x5f/0xe0
[  943.295277]  do_syscall_64+0x33/0x80
[  943.295284]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  943.295288] RIP: 0033:0x7f9abbed6dee
[  943.295293] Code: c0 e9 b6 fe ff ff 50 48 8d 3d ee 18 0a 00 e8 b9 e7
01 00 66 0f 1f 84 00 00 00 00 00 64 8b 04 25 18 00 00 00 85 c0 75 14 0f
05 <48> 3d 00 f0 ff ff 77 5a c3 66 0f 1f 84 00 00 00 00 00 48 83 ec 28
[  943.295296] RSP: 002b:00007ffde3d51648 EFLAGS: 00000246 ORIG_RAX:
0000000000000000
[  943.295300] RAX: ffffffffffffffda RBX: 0000000000018000 RCX:
00007f9abbed6dee
[  943.295302] RDX: 0000000000018000 RSI: 000055f62a470000 RDI:
0000000000000003
[  943.295305] RBP: 000055f62a470000 R08: 000055f62a470000 R09:
0000000000019008
[  943.295307] R10: 0000000000000000 R11: 0000000000000246 R12:
00007ffde3d51720
[  943.295309] R13: 0000000000000003 R14: 0000000000000000 R15:
0000000000000003
[  943.295315] Modules linked in: snd_emu10k1 dm_crypt dm_mod
intel_rapl_msr intel_rapl_common uinput binfmt_misc nls_ascii
snd_hda_codec_realtek nls_cp437 snd_hda_codec_generic vfat
ledtrig_audio fat snd_hda_codec_hdmi snd_hda_intel snd_util_mem
snd_intel_dspcfg amdgpu x86_pkg_temp_thermal snd_ac97_codec
snd_hda_codec intel_powerclamp iTCO_wdt eeepc_wmi ac97_bus snd_hda_core
gpu_sched asus_wmi rapl intel_pmc_bxt snd_rawmidi battery ttm
efi_pstore snd_hwdep intel_cstate snd_seq_device sparse_keymap
iTCO_vendor_support intel_uncore joydev evdev rfkill snd_pcm_oss
drm_kms_helper efivars watchdog pcspkr wmi_bmof mxm_wmi snd_mixer_oss
snd_pcm cec snd_timer snd i2c_algo_bit sg soundcore mei_me mei
intel_pmc_core acpi_pad button coretemp parport_pc nfsd ppdev
auth_rpcgss nfs_acl lockd grace lp drm sunrpc parport efivarfs
ip_tables x_tables autofs4 btrfs blake2b_generic xor zstd_compress
raid6_pq libcrc32c crc32c_generic hid_generic usbhid hid sd_mod
crc32_pclmul crc32c_intel ghash_clmulni_intel
[  943.295371]  aesni_intel e1000e libaes crypto_simd cryptd nvme
glue_helper i2c_i801 ahci libahci xhci_pci nvme_core xhci_hcd t10_pi
crc_t10dif i2c_smbus crct10dif_generic libata usbcore ptp
crct10dif_pclmul crct10dif_common pps_core scsi_mod usb_common fan wmi
video [last unloaded: snd_emu10k1]
[  943.295394] CR2: 0000000000000000
[  943.295398] ---[ end trace aab4b8c15ef39264 ]---
[  943.379629] RIP: 0010:0x0
[  943.379632] Code: Unable to access opcode bytes at RIP
0xffffffffffffffd6.
[  943.379632] RSP: 0018:ffffb76ac8f0fe40 EFLAGS: 00010203
[  943.379633] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000030
[  943.379634] RDX: fffffffffffecde8 RSI: 0000000000000001 RDI:
ffff97b0d3b23348
[  943.379634] RBP: ffffb76ac8f0ff10 R08: fffffffffffecde8 R09:
ffffffffffffffff
[  943.379635] R10: fffffffffffecde8 R11: 0000000000000000 R12:
0000000000000001
[  943.379635] R13: ffff97b0d3b23370 R14: ffff97b0d3b23348 R15:
ffff97b0d3b23380
[  943.379636] FS:  00007f9abbdc4b80(0000) GS:ffff97b226c80000(0000)
knlGS:0000000000000000
[  943.379637] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  943.379637] CR2: ffffffffffffffd6 CR3: 000000028e3a6003 CR4:
00000000003706e0
[  943.379638] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  943.379639] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[  947.219665] BUG: kernel NULL pointer dereference, address:
0000000000000000
[  947.219670] #PF: supervisor instruction fetch in kernel mode
[  947.219672] #PF: error_code(0x0010) - not-present page
[  947.219674] PGD 0 P4D 0 
[  947.219678] Oops: 0010 [#2] SMP PTI
[  947.219682] CPU: 3 PID: 7698 Comm: grep Tainted:
G      D           5.9.0-2-amd64 #1 Debian 5.9.6-1
[  947.219684] Hardware name: System manufacturer System Product
Name/PRIME Z270-K, BIOS 1207 06/22/2018
[  947.219688] RIP: 0010:0x0
[  947.219692] Code: Unable to access opcode bytes at RIP
0xffffffffffffffd6.
[  947.219694] RSP: 0018:ffffb76ac8f3fe40 EFLAGS: 00010203
[  947.219697] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000030
[  947.219699] RDX: ffffffffffff04f8 RSI: 0000000000000001 RDI:
ffff97b0d3b73078
[  947.219701] RBP: ffffb76ac8f3ff10 R08: ffffffffffff04f8 R09:
ffffffffffffffff
[  947.219702] R10: ffffffffffff04f8 R11: 0000000000000000 R12:
0000000000000001
[  947.219704] R13: ffff97b0d3b730a0 R14: ffff97b0d3b73078 R15:
ffff97b0d3b730b0
[  947.219707] FS:  00007fa17e74cb80(0000) GS:ffff97b226d80000(0000)
knlGS:0000000000000000
[  947.219709] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  947.219711] CR2: ffffffffffffffd6 CR3: 000000028e21e001 CR4:
00000000003706e0
[  947.219713] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  947.219714] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[  947.219716] Call Trace:
[  947.219723]  seq_read+0xb4/0x460
[  947.219729]  full_proxy_read+0x53/0x80
[  947.219734]  vfs_read+0x9c/0x180
[  947.219738]  ksys_read+0x5f/0xe0
[  947.219742]  do_syscall_64+0x33/0x80
[  947.219748]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  947.219750] RIP: 0033:0x7fa17e85edee
[  947.219754] Code: c0 e9 b6 fe ff ff 50 48 8d 3d ee 18 0a 00 e8 b9 e7
01 00 66 0f 1f 84 00 00 00 00 00 64 8b 04 25 18 00 00 00 85 c0 75 14 0f
05 <48> 3d 00 f0 ff ff 77 5a c3 66 0f 1f 84 00 00 00 00 00 48 83 ec 28
[  947.219756] RSP: 002b:00007fff0d33dcc8 EFLAGS: 00000246 ORIG_RAX:
0000000000000000
[  947.219759] RAX: ffffffffffffffda RBX: 0000000000018000 RCX:
00007fa17e85edee
[  947.219760] RDX: 0000000000018000 RSI: 0000562d879a8000 RDI:
0000000000000003
[  947.219762] RBP: 0000562d879a8000 R08: 0000562d879a8000 R09:
0000000000019008
[  947.219764] R10: 0000000000000000 R11: 0000000000000246 R12:
00007fff0d33dda0
[  947.219765] R13: 0000000000000003 R14: 0000000000000000 R15:
0000000000000003
[  947.219769] Modules linked in: snd_emu10k1 dm_crypt dm_mod
intel_rapl_msr intel_rapl_common uinput binfmt_misc nls_ascii
snd_hda_codec_realtek nls_cp437 snd_hda_codec_generic vfat
ledtrig_audio fat snd_hda_codec_hdmi snd_hda_intel snd_util_mem
snd_intel_dspcfg amdgpu x86_pkg_temp_thermal snd_ac97_codec
snd_hda_codec intel_powerclamp iTCO_wdt eeepc_wmi ac97_bus snd_hda_core
gpu_sched asus_wmi rapl intel_pmc_bxt snd_rawmidi battery ttm
efi_pstore snd_hwdep intel_cstate snd_seq_device sparse_keymap
iTCO_vendor_support intel_uncore joydev evdev rfkill snd_pcm_oss
drm_kms_helper efivars watchdog pcspkr wmi_bmof mxm_wmi snd_mixer_oss
snd_pcm cec snd_timer snd i2c_algo_bit sg soundcore mei_me mei
intel_pmc_core acpi_pad button coretemp parport_pc nfsd ppdev
auth_rpcgss nfs_acl lockd grace lp drm sunrpc parport efivarfs
ip_tables x_tables autofs4 btrfs blake2b_generic xor zstd_compress
raid6_pq libcrc32c crc32c_generic hid_generic usbhid hid sd_mod
crc32_pclmul crc32c_intel ghash_clmulni_intel
[  947.219812]  aesni_intel e1000e libaes crypto_simd cryptd nvme
glue_helper i2c_i801 ahci libahci xhci_pci nvme_core xhci_hcd t10_pi
crc_t10dif i2c_smbus crct10dif_generic libata usbcore ptp
crct10dif_pclmul crct10dif_common pps_core scsi_mod usb_common fan wmi
video [last unloaded: snd_emu10k1]
[  947.219828] CR2: 0000000000000000
[  947.219832] ---[ end trace aab4b8c15ef39265 ]---
[  947.304400] RIP: 0010:0x0
[  947.304402] Code: Unable to access opcode bytes at RIP
0xffffffffffffffd6.
[  947.304403] RSP: 0018:ffffb76ac8f0fe40 EFLAGS: 00010203
[  947.304404] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000030
[  947.304404] RDX: fffffffffffecde8 RSI: 0000000000000001 RDI:
ffff97b0d3b23348
[  947.304405] RBP: ffffb76ac8f0ff10 R08: fffffffffffecde8 R09:
ffffffffffffffff
[  947.304406] R10: fffffffffffecde8 R11: 0000000000000000 R12:
0000000000000001
[  947.304406] R13: ffff97b0d3b23370 R14: ffff97b0d3b23348 R15:
ffff97b0d3b23380
[  947.304407] FS:  00007fa17e74cb80(0000) GS:ffff97b226d80000(0000)
knlGS:0000000000000000
[  947.304408] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  947.304408] CR2: ffffffffffffffd6 CR3: 000000028e21e001 CR4:
00000000003706e0
[  947.304409] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[  947.304409] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[ 1555.062215] dyndbg: bad flag-op \x1b, at start of \x1b[?1049h\x1b[22
[ 1555.062222] dyndbg: flags parse failed
[ 1555.062225] dyndbg: bad flag-op 0, at start of 0
[ 1555.062226] dyndbg: flags parse failed
[ 1555.062229] dyndbg: bad flag-op 0, at start of 0t\x1b[1
[ 1555.062231] dyndbg: flags parse failed
[ 1555.062233] dyndbg: bad flag-op 5, at start of
51r\x1b(B\x1b[m\x1b[4l\x1b[?7h\x1b[?1h\x1b=
[ 1555.062235] dyndbg: flags parse failed
[ 1555.062962] dyndbg: bad flag-op \x1b, at start of \x1b[39
[ 1555.062965] dyndbg: flags parse failed
[ 1555.062967] dyndbg: bad flag-op 4, at start of 49m\x1b[39
[ 1555.062969] dyndbg: flags parse failed
[ 1555.062972] dyndbg: bad flag-op 4, at start of
49m\x1b(B\x1b[m\x1b[H\x1b[2J\x1b[4
[ 1555.062973] dyndbg: flags parse failed
[ 1555.062975] dyndbg: bad flag-op 2, at start of 2H
[ 1555.062977] dyndbg: flags parse failed
[ 1555.063001] dyndbg: bad flag-op \x1b, at start of \x1b[5d
[ 1555.063003] dyndbg: flags parse failed
[ 1555.063022] dyndbg: bad flag-op \x1b, at start of \x1b[6d
[ 1555.063023] dyndbg: flags parse failed
[ 1555.063042] dyndbg: bad flag-op g, at start of gs\x1b[7d\x08\x08
[ 1555.063044] dyndbg: flags parse failed
[ 1555.063063] dyndbg: bad flag-op \x1b, at start of \x1b[8d
[ 1555.063064] dyndbg: flags parse failed
[ 1555.063085] dyndbg: bad flag-op \x1b, at start of \x1b[9d
[ 1555.063087] dyndbg: flags parse failed
[ 1555.063106] dyndbg: bad flag-op \x1b, at start of \x1b[10d
[ 1555.063108] dyndbg: flags parse failed
[ 1555.063126] dyndbg: bad flag-op \x1b, at start of \x1b[11d
[ 1555.063128] dyndbg: flags parse failed
[ 1555.063146] dyndbg: bad flag-op \x1b, at start of \x1b[12d
[ 1555.063147] dyndbg: flags parse failed
[ 1555.063165] dyndbg: bad flag-op \x1b, at start of \x1b[13d
[ 1555.063167] dyndbg: flags parse failed
[ 1555.063186] dyndbg: bad flag-op \x1b, at start of \x1b[14d
[ 1555.063187] dyndbg: flags parse failed
[ 1555.063207] dyndbg: bad flag-op \x1b, at start of \x1b[15d
[ 1555.063208] dyndbg: flags parse failed
[ 1555.063228] dyndbg: bad flag-op \x1b, at start of \x1b[16d
[ 1555.063229] dyndbg: flags parse failed
[ 1555.063247] dyndbg: bad flag-op \x1b, at start of \x1b[17d
[ 1555.063249] dyndbg: flags parse failed
[ 1555.063269] dyndbg: bad flag-op \x1b, at start of \x1b[18d
[ 1555.063271] dyndbg: flags parse failed
[ 1555.063290] dyndbg: bad flag-op \x1b, at start of \x1b[19d
[ 1555.063292] dyndbg: flags parse failed
[ 1555.063313] dyndbg: bad flag-op \x1b, at start of \x1b[20d
[ 1555.063315] dyndbg: flags parse failed
[ 1555.063334] dyndbg: bad flag-op \x1b, at start of \x1b[21d
[ 1555.063336] dyndbg: flags parse failed
[ 1555.063354] dyndbg: bad flag-op \x1b, at start of \x1b[22d
[ 1555.063356] dyndbg: flags parse failed
[ 1555.063375] dyndbg: bad flag-op \x1b, at start of \x1b[23d
[ 1555.063377] dyndbg: flags parse failed
[ 1555.063397] dyndbg: bad flag-op \x1b, at start of \x1b[24d
[ 1555.063398] dyndbg: flags parse failed
[ 1555.063417] dyndbg: bad flag-op \x1b, at start of \x1b[25d
[ 1555.063419] dyndbg: flags parse failed
[ 1555.063437] dyndbg: bad flag-op \x1b, at start of \x1b[26d
[ 1555.063439] dyndbg: flags parse failed
[ 1555.063457] dyndbg: bad flag-op \x1b, at start of \x1b[27d
[ 1555.063459] dyndbg: flags parse failed
[ 1555.063480] dyndbg: bad flag-op \x1b, at start of \x1b[28d
[ 1555.063482] dyndbg: flags parse failed
[ 1555.063500] dyndbg: bad flag-op \x1b, at start of \x1b[29d
[ 1555.063502] dyndbg: flags parse failed
[ 1555.063520] dyndbg: bad flag-op \x1b, at start of \x1b[30d
[ 1555.063522] dyndbg: flags parse failed
[ 1555.063540] dyndbg: bad flag-op \x1b, at start of \x1b[31d
[ 1555.063542] dyndbg: flags parse failed
[ 1555.063563] dyndbg: bad flag-op \x1b, at start of \x1b[32d
[ 1555.063565] dyndbg: flags parse failed
[ 1555.063586] dyndbg: bad flag-op \x1b, at start of \x1b[33d
[ 1555.063588] dyndbg: flags parse failed
[ 1555.063610] dyndbg: bad flag-op \x1b, at start of \x1b[34d
[ 1555.063612] dyndbg: flags parse failed
[ 1555.063631] dyndbg: bad flag-op \x1b, at start of \x1b[35d
[ 1555.063633] dyndbg: flags parse failed
[ 1555.063654] dyndbg: bad flag-op \x1b, at start of \x1b[36d
[ 1555.063656] dyndbg: flags parse failed
[ 1555.063675] dyndbg: bad flag-op \x1b, at start of \x1b[37d
[ 1555.063677] dyndbg: flags parse failed
[ 1555.063696] dyndbg: bad flag-op \x1b, at start of \x1b[38d
[ 1555.063697] dyndbg: flags parse failed
[ 1555.063715] dyndbg: bad flag-op \x1b, at start of \x1b[39d
[ 1555.063717] dyndbg: flags parse failed
[ 1555.063737] dyndbg: bad flag-op \x1b, at start of \x1b[40d
[ 1555.063739] dyndbg: flags parse failed
[ 1555.063760] dyndbg: bad flag-op \x1b, at start of \x1b[41d
[ 1555.063762] dyndbg: flags parse failed
[ 1555.063781] dyndbg: bad flag-op \x1b, at start of \x1b[42d
[ 1555.063783] dyndbg: flags parse failed
[ 1555.063803] dyndbg: bad flag-op \x1b, at start of \x1b[43d
[ 1555.063804] dyndbg: flags parse failed
[ 1555.063823] dyndbg: bad flag-op \x1b, at start of \x1b[44d
[ 1555.063825] dyndbg: flags parse failed
[ 1555.063844] dyndbg: bad flag-op \x1b, at start of \x1b[45d
[ 1555.063845] dyndbg: flags parse failed
[ 1555.063865] dyndbg: bad flag-op \x1b, at start of \x1b[46d
[ 1555.063866] dyndbg: flags parse failed
[ 1555.063886] dyndbg: bad flag-op \x1b, at start of \x1b[47d
[ 1555.063888] dyndbg: flags parse failed
[ 1555.063909] dyndbg: bad flag-op \x1b, at start of \x1b[48d
[ 1555.063911] dyndbg: flags parse failed
[ 1555.063931] dyndbg: bad flag-op \x1b, at start of \x1b[49d
[ 1555.063933] dyndbg: flags parse failed
[ 1555.063952] dyndbg: bad flag-op \x1b, at start of \x1b[50d
[ 1555.063954] dyndbg: flags parse failed
[ 1555.063973] dyndbg: bad flag-op \x1b, at start of \x1b[51d
[ 1555.063975] dyndbg: flags parse failed
[ 1555.063984] dyndbg: bad flag-op b, at start of backup
[ 1555.063986] dyndbg: flags parse failed
[ 1555.063992] dyndbg: bad flag-op \x1b, at start of \x1b(B\x1b[m
[ 1555.063993] dyndbg: flags parse failed
[ 1555.064120] dyndbg: bad flag-op \x1b, at start of \x1b[2d
[ 1555.064122] dyndbg: flags parse failed
[ 1555.064138] dyndbg: too many words, legal max <=9
[ 1555.064140] dyndbg: tokenize failed
[ 1555.064242] dyndbg: bad flag-op \x1b, at start of \x1b[3d
[ 1555.064244] dyndbg: flags parse failed
[ 1555.064274] dyndbg: bad flag-op \x1b, at start of \x1b(B\x1b[0
[ 1555.064275] dyndbg: flags parse failed
[ 1555.064278] dyndbg: bad flag-op 1, at start of 1
[ 1555.064279] dyndbg: flags parse failed
[ 1555.064285] dyndbg: too many words, legal max <=9
[ 1555.064286] dyndbg: tokenize failed
[ 1555.064288] dyndbg: bad flag-op 1, at start of 1H
[ 1555.064290] dyndbg: flags parse failed
[ 1555.064295] dyndbg: bad flag-op \x1b, at start of \x1b(B\x1b[m
[ 1555.064297] dyndbg: flags parse failed
[ 1555.064421] dyndbg: bad flag-op \x1b, at start of \x1b[H
[ 1555.064424] dyndbg: flags parse failed
[ 1555.064443] dyndbg: bad flag-op \x1b, at start of \x1b(B\x1b[0
[ 1555.064446] dyndbg: flags parse failed
[ 1555.064448] dyndbg: bad flag-op 1, at start of 1m\x1b[
34mmdomann@sysiphus$
[ 1555.064450] dyndbg: flags parse failed
[ 1555.064456] dyndbg: bad flag-op \x1b, at start of
\x1b[39m\x1b(B\x1b[m
[ 1555.064457] dyndbg: flags parse failed
[ 1555.067947] dyndbg: bad flag-op \x1b, at start of \x1b(B\x1b[0
[ 1555.067950] dyndbg: flags parse failed
[ 1555.067953] dyndbg: bad flag-op \x1b, at start of \x1b[4
[ 1555.067955] dyndbg: flags parse failed
[ 1555.067957] dyndbg: bad flag-op 2, at start of 2H
[ 1555.067958] dyndbg: flags parse failed
[ 1555.067999] dyndbg: bad flag-op \x1b, at start of \x1b(B\x1b[0
[ 1555.068001] dyndbg: flags parse failed
[ 1555.068004] dyndbg: bad flag-op \x1b, at start of \x1b(B\x1b[0
[ 1555.068006] dyndbg: flags parse failed
[ 1555.068008] dyndbg: bad flag-op \x1b, at start of \x1b(B\x1b[0
[ 1555.068010] dyndbg: flags parse failed
[ 1555.068013] dyndbg: bad flag-op /, at start of
/sys/kernel/debug/dynamic_debug/control\x1b[5
[ 1555.068015] dyndbg: flags parse failed
[ 1555.068017] dyndbg: bad flag-op 2, at start of 2H
[ 1555.068018] dyndbg: flags parse failed
[ 1555.068038] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[6d
[ 1555.068040] dyndbg: flags parse failed
[ 1555.068058] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[7d
[ 1555.068060] dyndbg: flags parse failed
[ 1555.068081] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[8d
[ 1555.068085] dyndbg: flags parse failed
[ 1555.068102] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[9d
[ 1555.068104] dyndbg: flags parse failed
[ 1555.068122] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[10d
[ 1555.068124] dyndbg: flags parse failed
[ 1555.068141] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[11d
[ 1555.068143] dyndbg: flags parse failed
[ 1555.068160] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[12d
[ 1555.068162] dyndbg: flags parse failed
[ 1555.068182] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[13d
[ 1555.068184] dyndbg: flags parse failed
[ 1555.068201] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[14d
[ 1555.068203] dyndbg: flags parse failed
[ 1555.068221] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[15d
[ 1555.068223] dyndbg: flags parse failed
[ 1555.068240] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[16d
[ 1555.068242] dyndbg: flags parse failed
[ 1555.068259] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[17d
[ 1555.068261] dyndbg: flags parse failed
[ 1555.068283] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[18d
[ 1555.068285] dyndbg: flags parse failed
[ 1555.068302] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[19d
[ 1555.068304] dyndbg: flags parse failed
[ 1555.068321] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[20d
[ 1555.068323] dyndbg: flags parse failed
[ 1555.068340] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[21d
[ 1555.068353] dyndbg: flags parse failed
[ 1555.068372] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[22d
[ 1555.068374] dyndbg: flags parse failed
[ 1555.068395] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[23d
[ 1555.068397] dyndbg: flags parse failed
[ 1555.068414] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[24d
[ 1555.068416] dyndbg: flags parse failed
[ 1555.068433] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[25d
[ 1555.068435] dyndbg: flags parse failed
[ 1555.068452] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[26d
[ 1555.068454] dyndbg: flags parse failed
[ 1555.068471] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[27d
[ 1555.068473] dyndbg: flags parse failed
[ 1555.068493] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[28d
[ 1555.068495] dyndbg: flags parse failed
[ 1555.068512] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[29d
[ 1555.068514] dyndbg: flags parse failed
[ 1555.068531] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[30d
[ 1555.068533] dyndbg: flags parse failed
[ 1555.068550] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[31d
[ 1555.068552] dyndbg: flags parse failed
[ 1555.068569] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[32d
[ 1555.068571] dyndbg: flags parse failed
[ 1555.068591] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[33d
[ 1555.068593] dyndbg: flags parse failed
[ 1555.068610] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[34d
[ 1555.068612] dyndbg: flags parse failed
[ 1555.068629] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[35d
[ 1555.068631] dyndbg: flags parse failed
[ 1555.068648] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[36d
[ 1555.068650] dyndbg: flags parse failed
[ 1555.068667] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[37d
[ 1555.068669] dyndbg: flags parse failed
[ 1555.068689] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[38d
[ 1555.068691] dyndbg: flags parse failed
[ 1555.068708] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[39d
[ 1555.068710] dyndbg: flags parse failed
[ 1555.068727] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[40d
[ 1555.068729] dyndbg: flags parse failed
[ 1555.068746] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[41d
[ 1555.068748] dyndbg: flags parse failed
[ 1555.068765] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[42d
[ 1555.068767] dyndbg: flags parse failed
[ 1555.068787] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[43d
[ 1555.068789] dyndbg: flags parse failed
[ 1555.068806] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[44d
[ 1555.068808] dyndbg: flags parse failed
[ 1555.068826] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[45d
[ 1555.068828] dyndbg: flags parse failed
[ 1555.068845] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[46d
[ 1555.068846] dyndbg: flags parse failed
[ 1555.068863] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[47d
[ 1555.068865] dyndbg: flags parse failed
[ 1555.068885] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[48d
[ 1555.068887] dyndbg: flags parse failed
[ 1555.068904] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[49d
[ 1555.068906] dyndbg: flags parse failed
[ 1555.068923] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[50d
[ 1555.068925] dyndbg: flags parse failed
[ 1555.068942] dyndbg: bad flag-op \x1b, at start of \x1b[K\x1b[51d
[ 1555.068944] dyndbg: flags parse failed
[ 1555.068951] dyndbg: bad flag-op \x1b, at start of \x1b[K
[ 1555.068955] dyndbg: flags parse failed
[ 1555.068978] dyndbg: bad flag-op \x1b, at start of \x1b[1
[ 1555.068980] dyndbg: flags parse failed
[ 1555.068982] dyndbg: bad flag-op 4, at start of 41H
[ 1555.068984] dyndbg: flags parse failed
[ 1558.734175] dyndbg: bad flag-op \x1b, at start of \x1b[2
[ 1558.734181] dyndbg: flags parse failed
[ 1558.734184] dyndbg: bad flag-op 8, at start of 87H
[ 1558.734185] dyndbg: flags parse failed
[ 1558.737777] dyndbg: bad flag-op \x1b, at start of \x1b[1
[ 1558.737780] dyndbg: flags parse failed
[ 1558.737783] dyndbg: bad flag-op 4, at start of 41H
[ 1558.737785] dyndbg: flags parse failed
[ 1558.737816] dyndbg: bad flag-op \x1b, at start of \x1b(B\x1b[0
[ 1558.737818] dyndbg: flags parse failed
[ 1558.737820] dyndbg: bad flag-op 1, at start of 1me\x1b[4
[ 1558.737822] dyndbg: flags parse failed
[ 1558.737824] dyndbg: bad flag-op 2, at start of 2H
[ 1558.737825] dyndbg: flags parse failed
[ 1558.737843] dyndbg: bad flag-op \x1b, at start of
\x1b(B\x1b[m\x1b[K\x1b[51d
[ 1558.737845] dyndbg: flags parse failed
[ 1558.737866] dyndbg: bad flag-op \x1b, at start of \x1b[1
[ 1558.737868] dyndbg: flags parse failed
[ 1558.737870] dyndbg: bad flag-op 4, at start of 42H
[ 1558.737871] dyndbg: flags parse failed
[ 1558.943399] dyndbg: bad flag-op \x1b, at start of \x1b(B\x1b[0
[ 1558.943401] dyndbg: flags parse failed
[ 1558.943403] dyndbg: bad flag-op 1, at start of 1mc\x1b[51
[ 1558.943403] dyndbg: flags parse failed
[ 1558.943404] dyndbg: bad flag-op 2, at start of 2H
[ 1558.943405] dyndbg: flags parse failed
[ 1558.943409] dyndbg: bad flag-op \x1b, at start of \x1b(B\x1b[m
[ 1558.943410] dyndbg: flags parse failed
[ 1558.943419] dyndbg: bad flag-op \x1b, at start of \x1b[1
[ 1558.943420] dyndbg: flags parse failed
[ 1558.943421] dyndbg: bad flag-op 4, at start of 43H
[ 1558.943422] dyndbg: flags parse failed
[ 1559.121702] dyndbg: bad flag-op \x1b, at start of \x1b(B\x1b[0
[ 1559.121708] dyndbg: flags parse failed
[ 1559.121711] dyndbg: bad flag-op 1, at start of 1mh\x1b[51
[ 1559.121713] dyndbg: flags parse failed
[ 1559.121715] dyndbg: bad flag-op 2, at start of 2H
[ 1559.121717] dyndbg: flags parse failed
[ 1559.121725] dyndbg: bad flag-op \x1b, at start of \x1b(B\x1b[m
[ 1559.121727] dyndbg: flags parse failed
[ 1559.121749] dyndbg: bad flag-op \x1b, at start of \x1b[1
[ 1559.121751] dyndbg: flags parse failed
[ 1559.121753] dyndbg: bad flag-op 4, at start of 44H
[ 1559.121755] dyndbg: flags parse failed
[ 1559.338363] dyndbg: bad flag-op \x1b, at start of \x1b(B\x1b[0
[ 1559.338369] dyndbg: flags parse failed
[ 1559.338373] dyndbg: bad flag-op 1, at start of 1mi\x1b[51
[ 1559.338375] dyndbg: flags parse failed
[ 1559.338377] dyndbg: bad flag-op 2, at start of 2H
[ 1559.338379] dyndbg: flags parse failed
[ 1559.338387] dyndbg: bad flag-op \x1b, at start of \x1b(B\x1b[m
[ 1559.338389] dyndbg: flags parse failed
[ 1559.338407] dyndbg: bad flag-op \x1b, at start of \x1b[1
[ 1559.338409] dyndbg: flags parse failed
[ 1559.338411] dyndbg: bad flag-op 4, at start of 45H
[ 1559.338413] dyndbg: flags parse failed
[ 1559.342626] dyndbg: bad flag-op \x1b, at start of \x1b(B\x1b[0
[ 1559.342629] dyndbg: flags parse failed
[ 1559.342632] dyndbg: bad flag-op 1, at start of 1mo\x1b[51
[ 1559.342634] dyndbg: flags parse failed
[ 1559.342636] dyndbg: bad flag-op 2, at start of 2H
[ 1559.342638] dyndbg: flags parse failed
[ 1559.342644] dyndbg: bad flag-op \x1b, at start of \x1b(B\x1b[m
[ 1559.342646] dyndbg: flags parse failed
[ 1559.342667] dyndbg: bad flag-op \x1b, at start of \x1b[1
[ 1559.342669] dyndbg: flags parse failed
[ 1559.342671] dyndbg: bad flag-op 4, at start of 46H
[ 1559.342673] dyndbg: flags parse failed
[ 1561.230741] dyndbg: bad flag-op \x1b, at start of \x1b[H\x1b[2J
[ 1561.230746] dyndbg: flags parse failed
[ 1561.230924] dyndbg: bad flag-op \x1b, at start of \x1b[51
[ 1561.230926] dyndbg: flags parse failed
[ 1561.230929] dyndbg: bad flag-op 1, at start of 1H\x1b[?1049l\x1b[23
[ 1561.230931] dyndbg: flags parse failed
[ 1561.230933] dyndbg: bad flag-op 0, at start of 0
[ 1561.230934] dyndbg: flags parse failed
[ 1561.230937] dyndbg: bad flag-op \x1b, at start of \x1b[?1l\x1b>
[ 1561.230938] dyndbg: flags parse failed





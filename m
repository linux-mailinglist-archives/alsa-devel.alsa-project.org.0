Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D869206E52
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 09:55:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 163A442;
	Wed, 24 Jun 2020 09:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 163A442
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592985329;
	bh=NVWMWvAoOO6YBx+YhJeYqKDvKwbdwf2nhURd9uK4Mdo=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iupOa2d2IfX/eSDw700v+gSzCvi8YnwLEjlGeGrbnym3rT3r3QztTBvJx/VT6JEY/
	 P4b4FJma3wmiItCVdMKH+Dp7hLhvkYU+6EzrLZqsVT7r7HQUYjJPM67UkNhi2cZeh4
	 ZNMS5e932p41XhyB+2tjZStIi2dAHBiqyYncM1mQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EA40F80304;
	Wed, 24 Jun 2020 09:49:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B617F8015B; Mon, 22 Jun 2020 07:26:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30984F80157
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 07:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30984F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oYMH8fzh"
Received: by mail-io1-xd44.google.com with SMTP id s18so18138567ioe.2
 for <alsa-devel@alsa-project.org>; Sun, 21 Jun 2020 22:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ZVr+kr5aPEjx6Npw7yjfK1tPKuWVmOT6gEGNYB7VNrA=;
 b=oYMH8fzhBDhGezaTM7HcTcKGOu1hlV/Wa0dvpqCFbR9dh5bahFVUoKGxT6AsPq4FTW
 uOlgBM5SZO6XaTCmkmUvf/iGrXY+2qtXlBz+XSJja49XhdAmAxvMTKsllftvhIsuiusQ
 rKcIEbS336prVxBG5TJZ4SdTaSbcQ9WT6CUZ2htITeR3Ok8TAhTjaY5LBmDqk9yj2nvQ
 GkvpySGDT33p1SN43wQ7V+Lx9PJkg41Ox8955T/0+djd0JITZ/W6jf7SgPGPvlvfYnT2
 JnZYXFIL4uniEoRl7soYYd+oBsPmRB6i8oFzonhJUFDs04bv60Kpw/UMO419QKrtLU53
 TrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ZVr+kr5aPEjx6Npw7yjfK1tPKuWVmOT6gEGNYB7VNrA=;
 b=l2Dnnc8Be1HSLeIl3ArzR6sMBMtKxQH2rM3j5BvM5pxOUzF00X6JuORv8TziSBb9iq
 NNoo+FlJU2cA3sSx4XzlPReywnM6ZK4XJqEQSFYbymIU0X25/XEW+Dc1rb3ZGvZgOR6G
 zzSeN/gW8MMKODP3YgVKEOceHqr2IgDY0FRhAW5FA8Ro24DmpIS3aoe2qe8attYSKB9w
 mwtgQ3AUgu6Vd+8Xkh6DJGoFF7BZ7uHmJvah/1Vv1Pae8kXaV8BV5UB7aLDTZ4re7Rja
 gMy0nFFN5388/ZI1NtBnCWjIGcCM2eCrP+E77V9O1WqES9MEmsyADBrrLx7FlxT7dQ87
 Vg3w==
X-Gm-Message-State: AOAM533pdk+iIJwfAI6jDheTNvCzCdPS1ohlao35rCkYfh7kMOo8f9RJ
 P5SFtCKuRGF0me4Z/JTCVhFByArVmRbJPinvZKE=
X-Google-Smtp-Source: ABdhPJwk3NB4NMUIlQAycdGvuvCGWsjaJr8+k0f6AkYAOnbvhTZ8BsIvlXNtiQV7Dh5sCvhXdwd9P2nv4GPQzaZu0ho=
X-Received: by 2002:a6b:b5d1:: with SMTP id
 e200mr17709974iof.191.1592803582521; 
 Sun, 21 Jun 2020 22:26:22 -0700 (PDT)
MIME-Version: 1.0
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Mon, 22 Jun 2020 10:26:11 +0500
Message-ID: <CABXGCsM+SccvqTBR68b_a=a__BPN2+XCqjCGSCoGBKGqRZLV5Q@mail.gmail.com>
Subject: [snd_pcm] [5.8RC1] kernel BUG at mm/huge_memory.c:2613! (system
 stopped playing sound)
To: Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 24 Jun 2020 09:49:30 +0200
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

Hi folks.
After upgrade kernel to 5.8RC1 (git69119673bd50) my system stopped
playing sound.
In the kernel log, I see the message 'invalid opcode: 0000 [#1] SMP
NOPTI' which probably related to this issue.

[   19.076508] page:ffffeb1b1dc14b00 refcount:1 mapcount:0
mapping:0000000000000000 index:0x0 head:ffffeb1b1dc14b00 order:2
compound_mapcount:0 compound_pincount:0
[   19.076515] flags: 0x17ffffc0010000(head)
[   19.076520] raw: 0017ffffc0010000 dead000000000100 dead000000000122
0000000000000000
[   19.076524] raw: 0000000000000000 0000000000000000 00000001ffffffff
0000000000000000
[   19.076527] page dumped because: VM_BUG_ON_PAGE(!PageLocked(head))
[   19.076561] ------------[ cut here ]------------
[   19.076562] kernel BUG at mm/huge_memory.c:2613!
[   19.076581] invalid opcode: 0000 [#1] SMP NOPTI
[   19.076584] CPU: 12 PID: 1787 Comm: pulseaudio Not tainted
5.8.0-0.rc1.20200617git69119673bd50.1.fc33.x86_64 #1
[   19.076586] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-I GAMING, BIOS 1407 04/02/2020
[   19.076592] RIP: 0010:split_huge_page_to_list+0x86a/0xd90
[   19.076596] Code: 48 c7 c6 c0 d5 38 9c 48 8d 50 ff a8 01 48 0f 45
da 48 89 df e8 b7 d0 f8 ff 0f 0b 48 c7 c6 88 f1 3b 9c 48 89 df e8 a6
d0 f8 ff <0f> 0b 48 8b 07 f6 c4 04 0f 84 b4 f9 ff ff 48 89 df e8 f0 59
fc ff
[   19.076599] RSP: 0018:ffffb580c249fad8 EFLAGS: 00010296
[   19.076601] RAX: 0000000000000000 RBX: ffffeb1b1dc14b00 RCX: ffff93f1fbbdb5f8
[   19.076603] RDX: 00000000ffffffd8 RSI: 0000000000000000 RDI: ffff93f1fbbdb5f0
[   19.076605] RBP: ffff93f21e2ff688 R08: 0000000000000000 R09: 0000000000000000
[   19.076606] R10: 0000000000000001 R11: 0000000000000000 R12: ffff93f21e2d5000
[   19.076608] R13: ffffeb1b1dc14b00 R14: 0000000000000007 R15: ffffeb1b1dc14b00
[   19.076610] FS:  00007f6f4e421880(0000) GS:ffff93f1fba00000(0000)
knlGS:0000000000000000
[   19.076612] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   19.076613] CR2: 00007f6f3ceab000 CR3: 0000000779996000 CR4: 00000000003406e0
[   19.076615] Call Trace:
[   19.076622]  ? rcu_read_lock_sched_held+0x3f/0x80
[   19.076626]  ? __alloc_pages_nodemask+0x3df/0x450
[   19.076631]  iommu_dma_alloc+0x316/0x580
[   19.076637]  dma_alloc_attrs+0x86/0x90
[   19.076645]  snd_dma_alloc_pages+0xdf/0x160 [snd_pcm]
[   19.076651]  snd_dma_alloc_pages_fallback+0x5d/0x80 [snd_pcm]
[   19.076657]  snd_malloc_sgbuf_pages+0x166/0x380 [snd_pcm]
[   19.076665]  ? trace_kmalloc+0xf2/0x120
[   19.076670]  snd_dma_alloc_pages+0x64/0x160 [snd_pcm]
[   19.076676]  do_alloc_pages+0x3c/0x90 [snd_pcm]
[   19.076683]  snd_pcm_lib_malloc_pages+0x115/0x1a0 [snd_pcm]
[   19.076690]  snd_pcm_hw_params+0x4de/0x5b0 [snd_pcm]
[   19.076694]  ? _copy_from_user+0x6b/0xb0
[   19.076700]  snd_pcm_common_ioctl+0x209/0x1340 [snd_pcm]
[   19.076703]  ? selinux_file_ioctl+0x132/0x1e0
[   19.076711]  snd_pcm_ioctl+0x23/0x30 [snd_pcm]
[   19.076715]  ksys_ioctl+0x82/0xc0
[   19.076718]  __x64_sys_ioctl+0x16/0x20
[   19.076722]  do_syscall_64+0x52/0xb0
[   19.076724]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   19.076727] RIP: 0033:0x7f6f4ed53e9b
[   19.076728] Code: Bad RIP value.
[   19.076730] RSP: 002b:00007ffe556b7e18 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[   19.076732] RAX: ffffffffffffffda RBX: 00007ffe556b8020 RCX: 00007f6f4ed53e9b
[   19.076733] RDX: 00007ffe556b8020 RSI: 00000000c2604111 RDI: 0000000000000016
[   19.076735] RBP: 00005562734fdfa0 R08: 0000000000000000 R09: 0000000000000000
[   19.076737] R10: 0000000000000004 R11: 0000000000000246 R12: 00005562734fdf20
[   19.076738] R13: 00007ffe556b7e54 R14: 0000000000000000 R15: 00007ffe556b8020
[   19.076743] Modules linked in: xt_CHECKSUM xt_MASQUERADE
xt_conntrack ipt_REJECT nf_nat_tftp nf_conntrack_tftp tun bridge stp
llc nft_objref nf_conntrack_netbios_ns nf_conntrack_broadcast
nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat
ip6table_nat ip6table_mangle ip6table_raw ip6table_security
iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
libcrc32c iptable_mangle iptable_raw iptable_security ip_set nf_tables
nfnetlink ip6table_filter ip6_tables iptable_filter cmac bnep sunrpc
vfat fat hid_logitech_hidpp joydev hid_logitech_dj mt76x2u
mt76x2_common mt76x02_usb mt76_usb mt76x02_lib mt76 edac_mce_amd
amd_energy kvm_amd kvm gspca_zc3xx gspca_main irqbypass eeepc_wmi
asus_wmi btusb sparse_keymap btrtl video wmi_bmof btbcm btintel
bluetooth ecdh_generic uvcvideo ecc videobuf2_vmalloc videobuf2_memops
videobuf2_v4l2 snd_usb_audio videobuf2_common snd_usbmidi_lib videodev
snd_rawmidi pcspkr iwlmvm mc
[   19.076777]  mac80211 snd_hda_codec_realtek snd_hda_codec_generic
ledtrig_audio libarc4 snd_hda_codec_hdmi iwlwifi snd_hda_intel
snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep cfg80211 snd_seq
snd_seq_device rfkill snd_pcm snd_timer snd soundcore k10temp
sp5100_tco i2c_piix4 acpi_cpufreq binfmt_misc ip_tables amdgpu
iommu_v2 gpu_sched ttm crct10dif_pclmul drm_kms_helper crc32_pclmul
crc32c_intel cec drm ghash_clmulni_intel ccp igb nvme nvme_core
xhci_pci dca xhci_pci_renesas i2c_algo_bit wmi pinctrl_amd fuse
[   19.076798] ---[ end trace 14b750353357325c ]---
[   19.076801] RIP: 0010:split_huge_page_to_list+0x86a/0xd90
[   19.076804] Code: 48 c7 c6 c0 d5 38 9c 48 8d 50 ff a8 01 48 0f 45
da 48 89 df e8 b7 d0 f8 ff 0f 0b 48 c7 c6 88 f1 3b 9c 48 89 df e8 a6
d0 f8 ff <0f> 0b 48 8b 07 f6 c4 04 0f 84 b4 f9 ff ff 48 89 df e8 f0 59
fc ff
[   19.076806] RSP: 0018:ffffb580c249fad8 EFLAGS: 00010296
[   19.076808] RAX: 0000000000000000 RBX: ffffeb1b1dc14b00 RCX: ffff93f1fbbdb5f8
[   19.076809] RDX: 00000000ffffffd8 RSI: 0000000000000000 RDI: ffff93f1fbbdb5f0
[   19.076811] RBP: ffff93f21e2ff688 R08: 0000000000000000 R09: 0000000000000000
[   19.076812] R10: 0000000000000001 R11: 0000000000000000 R12: ffff93f21e2d5000
[   19.076814] R13: ffffeb1b1dc14b00 R14: 0000000000000007 R15: ffffeb1b1dc14b00
[   19.076816] FS:  00007f6f4e421880(0000) GS:ffff93f1fba00000(0000)
knlGS:0000000000000000
[   19.076817] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   19.076819] CR2: 00007f6f3ceab000 CR3: 0000000779996000 CR4: 00000000003406e0
[   26.761111] logitech-hidpp-device 0003:046D:4087.000B: HID++ 4.2
device connected.
[   37.568414] rfkill: input handler enabled
[   43.157188] page:ffffeb1b1daca200 refcount:1 mapcount:0
mapping:0000000000000000 index:0x0 head:ffffeb1b1daca200 order:2
compound_mapcount:0 compound_pincount:0
[   43.157192] flags: 0x17ffffc0010000(head)
[   43.157195] raw: 0017ffffc0010000 dead000000000100 dead000000000122
0000000000000000
[   43.157197] raw: 0000000000000000 0000000000000000 00000001ffffffff
0000000000000000
[   43.157198] page dumped because: VM_BUG_ON_PAGE(!PageLocked(head))
[   43.157209] ------------[ cut here ]------------


I would be happy to test any patch which fixes it.

--
Best Regards,
Mike Gavrilov.

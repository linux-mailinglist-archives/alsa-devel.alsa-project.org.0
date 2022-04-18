Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E21D506B7B
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:53:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03FE617E5;
	Tue, 19 Apr 2022 13:53:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03FE617E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369234;
	bh=XXUnh6QBBj/gCu/mUxV7aU6hPyvMtaIxJ53JaCjRYJg=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lupgE3gZQuYPpSJWVqwU4IFhSFA9jzaNUqsjps+paB1RNRLmmC2PhvIwl/mzS+i6o
	 cGJ9c6YNbJ9BCDolcmScF4PjpbpbyMZgFw6VdJnz/Q/olsQYz8RJD/jJ/fj3KpkkEh
	 cClUhFhjMONgZslwQxhI/ztJu9xAuQTON1KLSV6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A46AF804F1;
	Tue, 19 Apr 2022 13:52:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A20C8F800D8; Mon, 18 Apr 2022 12:12:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FA8AF800D8
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 12:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FA8AF800D8
Received: by mail-il1-f200.google.com with SMTP id
 r20-20020a056e02109400b002cc174742c9so1775423ilj.5
 for <alsa-devel@alsa-project.org>; Mon, 18 Apr 2022 03:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=b3gHZlywNI1/W84NKsMn8/CEmdK4U5QuxkrPxRysdcM=;
 b=5SyqqoJBWkP2evOIK7h0X/Z+CgHrb57BHMTliHrujefAfvvstSfi8vDpHS/U73HpvC
 dsH/w4jkaPPmPCSH8AiKUfFegKUz5eZ2fvzFBojE0nxeOBL0v9Eh3rL3oK3VM2Xc06uO
 uIX9Nr0auiMzhj8MQNU0PdA94SJDVyliszotxXAb66pcl7PO9E6uPuJkRB5brE1jWluF
 ldtj0Y3MYyv5rJskXrKMe49lGU6/iBG9T5wJ5CEBeOrMWNC6XmYIf138QvLNuB7amlL2
 Vumnq+dv4Q3X8y9zBIZNs93GjYgPRun6joxqWmFDPYYfwgXFWR+1l0XxEQnUeOW7xubi
 PaeA==
X-Gm-Message-State: AOAM532pikeXR1w1ViaDJ84+iGYi52BWvZQ6K+CNcjk0tHGG6dhNMJ2q
 m3fGJg14bJioj3YQzesBQOVLQK+paq9zZPC6tVQQ6YV27KX0
X-Google-Smtp-Source: ABdhPJxUtJ19U32+3b1m1d/bYpjAejY2WcJpArwXMKR0aDB95BmPsDzddNd55pkaLueE5/brSM5yIzgKQiX6YnLOKPFZLIeIoymc
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1485:b0:2cb:d7ce:bf36 with SMTP id
 n5-20020a056e02148500b002cbd7cebf36mr4263955ilk.255.1650276743335; Mon, 18
 Apr 2022 03:12:23 -0700 (PDT)
Date: Mon, 18 Apr 2022 03:12:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000011555605dceaff03@google.com>
Subject: [syzbot] KASAN: use-after-free Read in __snd_rawmidi_transmit_peek
From: syzbot <syzbot+70e777a39907d6d5fd0a@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, coding@diwic.se, colin.king@intel.com, 
 linux-kernel@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:22 +0200
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

Hello,

syzbot found the following issue on:

HEAD commit:    a19944809fe9 Merge tag 'hardening-v5.18-rc3' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16a40ae0f00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=eb177500e563582f
dashboard link: https://syzkaller.appspot.com/bug?extid=70e777a39907d6d5fd0a
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1590dfa8f00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+70e777a39907d6d5fd0a@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in __snd_rawmidi_transmit_peek+0x261/0x360 sound/core/rawmidi.c:1286
Read of size 1 at addr ffff88807eac2072 by task kworker/1:1H/51

CPU: 1 PID: 51 Comm: kworker/1:1H Not tainted 5.18.0-rc2-syzkaller-00050-ga19944809fe9 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events_highpri snd_usbmidi_out_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0xeb/0x495 mm/kasan/report.c:313
 print_report mm/kasan/report.c:429 [inline]
 kasan_report.cold+0xf4/0x1c6 mm/kasan/report.c:491
 __snd_rawmidi_transmit_peek+0x261/0x360 sound/core/rawmidi.c:1286
 snd_rawmidi_transmit+0x8d/0xf0 sound/core/rawmidi.c:1411
 snd_usbmidi_standard_output+0x264/0xc10 sound/usb/midi.c:650
 snd_usbmidi_do_output+0x200/0x510 sound/usb/midi.c:311
 process_one_work+0x996/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e9/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:298
 </TASK>

Allocated by task 5812:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:45 [inline]
 set_alloc_info mm/kasan/common.c:436 [inline]
 ____kasan_kmalloc mm/kasan/common.c:515 [inline]
 ____kasan_kmalloc mm/kasan/common.c:474 [inline]
 __kasan_kmalloc+0xa9/0xd0 mm/kasan/common.c:524
 kmalloc_node include/linux/slab.h:604 [inline]
 kvmalloc_node+0x3e/0x130 mm/util.c:580
 kvmalloc include/linux/slab.h:731 [inline]
 kvzalloc include/linux/slab.h:739 [inline]
 snd_rawmidi_runtime_create sound/core/rawmidi.c:162 [inline]
 open_substream+0x340/0x8b0 sound/core/rawmidi.c:306
 rawmidi_open_priv+0x591/0x6f0 sound/core/rawmidi.c:357
 snd_rawmidi_kernel_open+0x1b5/0x270 sound/core/rawmidi.c:392
 midisynth_use+0xee/0x270 sound/core/seq/seq_midi.c:215
 subscribe_port sound/core/seq/seq_ports.c:412 [inline]
 check_and_subscribe_port+0x89a/0xb80 sound/core/seq/seq_ports.c:495
 snd_seq_port_connect+0x382/0x540 sound/core/seq/seq_ports.c:581
 snd_seq_ioctl_subscribe_port+0x1fc/0x400 sound/core/seq/seq_clientmgr.c:1492
 snd_seq_kernel_client_ctl+0x102/0x1e0 sound/core/seq/seq_clientmgr.c:2369
 snd_seq_oss_midi_open+0x582/0x6e0 sound/core/seq/oss/seq_oss_midi.c:359
 snd_seq_oss_synth_setup_midi+0x12d/0x530 sound/core/seq/oss/seq_oss_synth.c:269
 snd_seq_oss_open+0x8c3/0xa80 sound/core/seq/oss/seq_oss_init.c:260
 odev_open+0x6c/0x90 sound/core/seq/oss/seq_oss.c:128
 soundcore_open+0x44e/0x620 sound/sound_core.c:593
 chrdev_open+0x266/0x770 fs/char_dev.c:414
 do_dentry_open+0x4a1/0x11e0 fs/open.c:824
 do_open fs/namei.c:3476 [inline]
 path_openat+0x1c71/0x2910 fs/namei.c:3609
 do_filp_open+0x1aa/0x400 fs/namei.c:3636
 do_sys_openat2+0x16d/0x4c0 fs/open.c:1213
 do_sys_open fs/open.c:1229 [inline]
 __do_sys_openat fs/open.c:1245 [inline]
 __se_sys_openat fs/open.c:1240 [inline]
 __x64_sys_openat+0x13f/0x1f0 fs/open.c:1240
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Freed by task 5811:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track+0x21/0x30 mm/kasan/common.c:45
 kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:370
 ____kasan_slab_free mm/kasan/common.c:366 [inline]
 ____kasan_slab_free+0x166/0x1a0 mm/kasan/common.c:328
 kasan_slab_free include/linux/kasan.h:200 [inline]
 slab_free_hook mm/slub.c:1728 [inline]
 slab_free_freelist_hook+0x8b/0x1c0 mm/slub.c:1754
 slab_free mm/slub.c:3510 [inline]
 kfree+0xd6/0x4d0 mm/slub.c:4552
 kvfree+0x42/0x50 mm/util.c:615
 snd_rawmidi_runtime_free sound/core/rawmidi.c:176 [inline]
 close_substream.part.0+0x185/0x720 sound/core/rawmidi.c:528
 close_substream sound/core/rawmidi.c:507 [inline]
 rawmidi_release_priv+0x192/0x270 sound/core/rawmidi.c:547
 snd_rawmidi_kernel_release+0x39/0xd0 sound/core/rawmidi.c:564
 midisynth_unuse+0x45/0x80 sound/core/seq/seq_midi.c:244
 unsubscribe_port sound/core/seq/seq_ports.c:437 [inline]
 __delete_and_unsubscribe_port+0x270/0x4c0 sound/core/seq/seq_ports.c:537
 snd_seq_port_disconnect+0x41c/0x5d0 sound/core/seq/seq_ports.c:616
 snd_seq_ioctl_unsubscribe_port+0x1fc/0x400 sound/core/seq/seq_clientmgr.c:1537
 snd_seq_kernel_client_ctl+0x102/0x1e0 sound/core/seq/seq_clientmgr.c:2369
 snd_seq_oss_midi_close+0x44f/0x4d0 sound/core/seq/oss/seq_oss_midi.c:404
 snd_seq_oss_synth_reset+0x422/0x880 sound/core/seq/oss/seq_oss_synth.c:406
 snd_seq_oss_reset+0x6f/0x290 sound/core/seq/oss/seq_oss_init.c:435
 snd_seq_oss_release+0x78/0x1a0 sound/core/seq/oss/seq_oss_init.c:412
 odev_release+0x4f/0x70 sound/core/seq/oss/seq_oss.c:144
 __fput+0x277/0x9d0 fs/file_table.c:317
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:169 [inline]
 exit_to_user_mode_prepare+0x23c/0x250 kernel/entry/common.c:201
 __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
 syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:294
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x44/0xae

The buggy address belongs to the object at ffff88807eac2000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 114 bytes inside of
 4096-byte region [ffff88807eac2000, ffff88807eac3000)

The buggy address belongs to the physical page:
page:ffffea0001fab000 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7eac0
head:ffffea0001fab000 order:3 compound_mapcount:0 compound_pincount:0
flags: 0xfff00000010200(slab|head|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000010200 ffffea0001d2a000 dead000000000002 ffff888010c42140
raw: 0000000000000000 0000000000040004 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 3703, tgid 3703 (syz-executor.4), ts 1615766892626, free_ts 34515408626
 prep_new_page mm/page_alloc.c:2441 [inline]
 get_page_from_freelist+0xba2/0x3e00 mm/page_alloc.c:4182
 __alloc_pages+0x1b2/0x500 mm/page_alloc.c:5408
 alloc_pages+0x1aa/0x310 mm/mempolicy.c:2272
 alloc_slab_page mm/slub.c:1799 [inline]
 allocate_slab+0x26c/0x3c0 mm/slub.c:1944
 new_slab mm/slub.c:2004 [inline]
 ___slab_alloc+0x8df/0xf20 mm/slub.c:3005
 __slab_alloc.constprop.0+0x4d/0xa0 mm/slub.c:3092
 slab_alloc_node mm/slub.c:3183 [inline]
 slab_alloc mm/slub.c:3225 [inline]
 kmem_cache_alloc_trace+0x310/0x3f0 mm/slub.c:3256
 kmalloc include/linux/slab.h:581 [inline]
 kzalloc include/linux/slab.h:714 [inline]
 kobject_uevent_env+0x235/0x1660 lib/kobject_uevent.c:524
 device_add+0xb20/0x1e20 drivers/base/core.c:3386
 netdev_register_kobject+0x181/0x430 net/core/net-sysfs.c:2008
 register_netdevice+0xd9d/0x15b0 net/core/dev.c:9961
 __rtnl_newlink+0x1555/0x1760 net/core/rtnetlink.c:3485
 rtnl_newlink+0x64/0xa0 net/core/rtnetlink.c:3531
 rtnetlink_rcv_msg+0x413/0xb80 net/core/rtnetlink.c:5990
 netlink_rcv_skb+0x153/0x420 net/netlink/af_netlink.c:2496
 netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
 netlink_unicast+0x543/0x7f0 net/netlink/af_netlink.c:1345
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1356 [inline]
 free_pcp_prepare+0x549/0xd20 mm/page_alloc.c:1406
 free_unref_page_prepare mm/page_alloc.c:3328 [inline]
 free_unref_page+0x19/0x6a0 mm/page_alloc.c:3423
 qlink_free mm/kasan/quarantine.c:157 [inline]
 qlist_free_all+0x6a/0x170 mm/kasan/quarantine.c:176
 kasan_quarantine_reduce+0x180/0x200 mm/kasan/quarantine.c:283
 __kasan_slab_alloc+0xa2/0xc0 mm/kasan/common.c:446
 kasan_slab_alloc include/linux/kasan.h:224 [inline]
 slab_post_alloc_hook mm/slab.h:749 [inline]
 slab_alloc_node mm/slub.c:3217 [inline]
 kmem_cache_alloc_node+0x255/0x3f0 mm/slub.c:3267
 __alloc_skb+0x215/0x340 net/core/skbuff.c:414
 alloc_skb include/linux/skbuff.h:1300 [inline]
 alloc_skb_with_frags+0x93/0x730 net/core/skbuff.c:5995
 sock_alloc_send_pskb+0x793/0x920 net/core/sock.c:2600
 unix_dgram_sendmsg+0x414/0x1a90 net/unix/af_unix.c:1896
 sock_sendmsg_nosec net/socket.c:705 [inline]
 sock_sendmsg+0xcf/0x120 net/socket.c:725
 __sys_sendto+0x216/0x310 net/socket.c:2040
 __do_sys_sendto net/socket.c:2052 [inline]
 __se_sys_sendto net/socket.c:2048 [inline]
 __x64_sys_sendto+0xdd/0x1b0 net/socket.c:2048
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Memory state around the buggy address:
 ffff88807eac1f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88807eac1f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88807eac2000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                             ^
 ffff88807eac2080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88807eac2100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

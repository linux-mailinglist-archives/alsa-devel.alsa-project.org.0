Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D02533EE3
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 16:12:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 389D816C2;
	Wed, 25 May 2022 16:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 389D816C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653487923;
	bh=cGcV0BCtjxtdpLNsQkW5Dr74Bm/m/2pSvrOjYZXfHAs=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nZC4O2YE7lvnGunRw/ux1lUyyJD2/AI0FUHOJLNBIYl4v/kMeISHQyIUsfEtltYIb
	 95pcYYlt2QBpaE7GLTCV1gyuvYbELeFfBsmOGYR85NVMdWZIe8C+KwI5Hw2uncEFeL
	 LwNidrBTmyoHrwwmxWxB0eiQeZR9Yd11rQmIWnJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0230F8053D;
	Wed, 25 May 2022 16:08:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB530F8016D; Wed, 25 May 2022 08:50:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AFC2F80100
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 08:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AFC2F80100
Received: by mail-io1-f71.google.com with SMTP id
 k17-20020a5d9d51000000b006653f2bc513so3942418iok.10
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 23:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=Rio2J0uzt02nmiyUruJe4hrtTcsPQzLoIt5Nw1re4R4=;
 b=izx/5Tl2WpZt1ow9tMU9e8gdHjwJHem+NkORqYuWa/fCjO/exnv0L9rj5t9hpSCbp9
 nftVVt/Z2HRtfcgkaxGiXWuUyCI2Bawj2+iLBt+RCjG/Ksz2JAcJdu+EntC3u1G90UTK
 E2xkKyG0GPkKEtQF8tnY6c9RDgGnQ5NudaEJGcr30by7FNvj2papzStHAU6hktTjzw3p
 aUkLbB/M5HeMOWGDwtuMg5Zs4u8ojav0Z17F9ERiU/DRc+nafwc826N/Dox/b5HsGoNY
 CKvNenTtj3kP3uopkXhtRfh7IFyv8DO6ogVBG472yYOPQ0tNCOyVqqpBQFHQ5MU0ORiZ
 agJQ==
X-Gm-Message-State: AOAM531n+7WT6gSuLin1VCMTVKFp3LW4HeoSgQ3/g1+vdl+podM1RxXd
 +KzTdx3wUQUvaCUnWdGzcNYMWkg69NNklmYBdJ4CD7LJAEF5
X-Google-Smtp-Source: ABdhPJywlBTcsLbcIj/mf7X8nu9gGSyp1TjIertxedtbbDkevoWdAwPuoke7KNgWsc0785j1+FOKh73cmpOMuiRX7CUsM/YSdbbi
MIME-Version: 1.0
X-Received: by 2002:a05:6638:35a1:b0:330:a6c5:bf97 with SMTP id
 v33-20020a05663835a100b00330a6c5bf97mr1102645jal.250.1653461425315; Tue, 24
 May 2022 23:50:25 -0700 (PDT)
Date: Tue, 24 May 2022 23:50:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e7e75005dfd07cf6@google.com>
Subject: [syzbot] KASAN: use-after-free Read in __snd_rawmidi_transmit_ack
From: syzbot <syzbot+6912c9592caca7ca0e7d@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 25 May 2022 16:08:39 +0200
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

HEAD commit:    3b5e1590a267 Merge tag 'gpio-fixes-for-v5.18' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1195135ef00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=902c5209311d387c
dashboard link: https://syzkaller.appspot.com/bug?extid=6912c9592caca7ca0e7d
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6912c9592caca7ca0e7d@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in __snd_rawmidi_transmit_ack+0x2cd/0x2f0 sound/core/rawmidi.c:1348
Read of size 8 at addr ffff888078b36410 by task kworker/1:1H/754

CPU: 1 PID: 754 Comm: kworker/1:1H Not tainted 5.18.0-rc7-syzkaller-00136-g3b5e1590a267 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events_highpri snd_usbmidi_out_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0xeb/0x495 mm/kasan/report.c:313
 print_report mm/kasan/report.c:429 [inline]
 kasan_report.cold+0xf4/0x1c6 mm/kasan/report.c:491
 __snd_rawmidi_transmit_ack+0x2cd/0x2f0 sound/core/rawmidi.c:1348
 snd_rawmidi_transmit+0xae/0xf0 sound/core/rawmidi.c:1415
 snd_usbmidi_standard_output+0x264/0xc10 sound/usb/midi.c:650
 snd_usbmidi_do_output+0x200/0x510 sound/usb/midi.c:311
 process_one_work+0x996/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e9/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:298
 </TASK>

Allocated by task 9345:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:45 [inline]
 set_alloc_info mm/kasan/common.c:436 [inline]
 ____kasan_kmalloc mm/kasan/common.c:515 [inline]
 ____kasan_kmalloc mm/kasan/common.c:474 [inline]
 __kasan_kmalloc+0xa9/0xd0 mm/kasan/common.c:524
 kmalloc include/linux/slab.h:581 [inline]
 kzalloc include/linux/slab.h:714 [inline]
 snd_rawmidi_runtime_create sound/core/rawmidi.c:148 [inline]
 open_substream+0xe9/0x8b0 sound/core/rawmidi.c:306
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

Freed by task 9345:
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
 snd_rawmidi_runtime_free sound/core/rawmidi.c:177 [inline]
 close_substream.part.0+0x18d/0x720 sound/core/rawmidi.c:528
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
 get_signal+0x1c5/0x24c0 kernel/signal.c:2641
 arch_do_signal_or_restart+0x82/0x20f0 arch/x86/kernel/signal.c:867
 exit_to_user_mode_loop kernel/entry/common.c:166 [inline]
 exit_to_user_mode_prepare+0x15f/0x250 kernel/entry/common.c:201
 __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
 syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:294
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x44/0xae

The buggy address belongs to the object at ffff888078b36400
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 16 bytes inside of
 512-byte region [ffff888078b36400, ffff888078b36600)

The buggy address belongs to the physical page:
page:ffffea0001e2cd00 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x78b34
head:ffffea0001e2cd00 order:2 compound_mapcount:0 compound_pincount:0
flags: 0xfff00000010200(slab|head|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000010200 dead000000000100 dead000000000122 ffff888010c41c80
raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 2967, tgid 2967 (udevadm), ts 15461279103, free_ts 12532036824
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
 __kmalloc_node_track_caller+0x2cb/0x360 mm/slub.c:4947
 kmalloc_reserve net/core/skbuff.c:354 [inline]
 __alloc_skb+0xde/0x340 net/core/skbuff.c:426
 alloc_skb include/linux/skbuff.h:1300 [inline]
 alloc_uevent_skb+0x7b/0x210 lib/kobject_uevent.c:290
 uevent_net_broadcast_untagged lib/kobject_uevent.c:326 [inline]
 kobject_uevent_net_broadcast lib/kobject_uevent.c:409 [inline]
 kobject_uevent_env+0xc42/0x1660 lib/kobject_uevent.c:593
 kobject_synth_uevent+0x701/0x850 lib/kobject_uevent.c:208
 store_uevent+0x12/0x20 kernel/module.c:1166
 module_attr_store+0x50/0x80 kernel/params.c:919
 sysfs_kf_write+0x110/0x160 fs/sysfs/file.c:136
 kernfs_fop_write_iter+0x3f8/0x610 fs/kernfs/file.c:291
 call_write_iter include/linux/fs.h:2050 [inline]
 new_sync_write+0x38a/0x560 fs/read_write.c:504
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1356 [inline]
 free_pcp_prepare+0x549/0xd20 mm/page_alloc.c:1406
 free_unref_page_prepare mm/page_alloc.c:3328 [inline]
 free_unref_page+0x19/0x6a0 mm/page_alloc.c:3423
 free_contig_range+0xb1/0x180 mm/page_alloc.c:9418
 destroy_args+0xa8/0x646 mm/debug_vm_pgtable.c:1018
 debug_vm_pgtable+0x2a51/0x2ae3 mm/debug_vm_pgtable.c:1332
 do_one_initcall+0x103/0x650 init/main.c:1298
 do_initcall_level init/main.c:1371 [inline]
 do_initcalls init/main.c:1387 [inline]
 do_basic_setup init/main.c:1406 [inline]
 kernel_init_freeable+0x6b1/0x73a init/main.c:1613
 kernel_init+0x1a/0x1d0 init/main.c:1502
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:298

Memory state around the buggy address:
 ffff888078b36300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888078b36380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888078b36400: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff888078b36480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888078b36500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

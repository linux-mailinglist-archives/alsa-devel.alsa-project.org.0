Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9826466AFBC
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Jan 2023 08:49:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9079AC8B;
	Sun, 15 Jan 2023 08:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9079AC8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673768987;
	bh=DlA6X3Ynblj5vzGd90yoauEZMiLJ/ahbpP9RvHJmwL8=;
	h=Date:In-Reply-To:Subject:From:To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qpXjr9s619srFkQCTMuuIaoYQMXAeIXHYEB9tRYIAcwQajhWj/6Lig2VZZZCnbkdP
	 S4Zg7dehMeAbzi/yI3zUl2OM9DOZ6nmMw/78fOFRAMDA/9jw2PLXTItF92mTgsyoeo
	 R5kFNm7/ZK/rklztpLk3J73128MH+t4wu+qi7hwM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D0C3F80506;
	Sun, 15 Jan 2023 08:48:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1678F804CA; Thu, 12 Jan 2023 21:56:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 653C1F804BD
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 21:56:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 653C1F804BD
Received: by mail-il1-f199.google.com with SMTP id
 l13-20020a056e021c0d00b003034e24b866so14575165ilh.22
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 12:56:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gM+TCMdssC5AP1w3tSB0QawlpFzYuYVK2tHIdTgodI8=;
 b=vs8Vyh3Sjlwnhae3xm5+tu8ZgKIvQDIlRSpKd4+12XOE/EEJmUCKfgU7BMFC2I43qC
 5YKZKOHek1j0G/0/sGQ3FZzprjnvVALW7yXrU5U9uD9WbDKgiebAbgzwndBxoQH8vNcv
 ueokhIzFyzhY2JSdFXqNcfAtPo8V9i56RGXQNHdAUAG6AHW19f1aWnJbg+TZJLX7QzgM
 erqLUllzJMQPrisG4SG4iBu8pVSSxPVLOF9edGl8XHz9oHK1sWbMS6Vy7YovxrhTg/QK
 7aKK37Sjx6dIF0mrf+sOUoF1BEpE1hTEfsm8q2Cnl2n6e6nd7p8lOA6Kcji8JUYIePaA
 cKJQ==
X-Gm-Message-State: AFqh2kp7o4rG8O3TBk01UkGylDK1HDh2e0jRbdiQd+sWctX/Lj42btMg
 1wc6dVipjVzRlWto/eD1FCkpCOZJRMHdy9oXDMjEZF0sgqOP
X-Google-Smtp-Source: AMrXdXuA0IoSrhUfCnpR4Z1YG7+n3qOwIuUKerEf5XT8ivyKTn+0W9AQTAZvEFWTjOiohI+LbqFUolkk7sh5C7vuR8/MAARBfF85
MIME-Version: 1.0
X-Received: by 2002:a02:a0c1:0:b0:3a0:6dcf:ed6b with SMTP id
 i1-20020a02a0c1000000b003a06dcfed6bmr48392jah.236.1673556997415; Thu, 12 Jan
 2023 12:56:37 -0800 (PST)
Date: Thu, 12 Jan 2023 12:56:37 -0800
In-Reply-To: <000000000000f1068105f20e5e8f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000057ab2c05f2175af1@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in snd_pcm_oss_poll
From: syzbot <syzbot+ee73befabe68e7907adf@syzkaller.appspotmail.com>
To: alsa-devel-owner@alsa-project.org, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 15 Jan 2023 08:48:19 +0100
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    0a093b2893c7 Add linux-next specific files for 20230112
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=13948291480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=835f3591019836d5
dashboard link: https://syzkaller.appspot.com/bug?extid=ee73befabe68e7907adf
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=142c4d16480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10129b5a480000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8111a570d6cb/disk-0a093b28.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ecc135b7fc9a/vmlinux-0a093b28.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ca8d73b446ea/bzImage-0a093b28.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ee73befabe68e7907adf@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in snd_pcm_oss_poll+0x91c/0xab0 sound/core/oss/pcm_oss.c:2849
Read of size 8 at addr ffff88801c509840 by task syz-executor364/5089

CPU: 0 PID: 5089 Comm: syz-executor364 Not tainted 6.2.0-rc3-next-20230112-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd1/0x138 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:306 [inline]
 print_report+0x15e/0x45d mm/kasan/report.c:417
 kasan_report+0xc0/0xf0 mm/kasan/report.c:517
 snd_pcm_oss_poll+0x91c/0xab0 sound/core/oss/pcm_oss.c:2849
 vfs_poll include/linux/poll.h:88 [inline]
 io_poll_check_events io_uring/poll.c:279 [inline]
 io_poll_task_func+0x3a6/0x1220 io_uring/poll.c:327
 handle_tw_list+0xa8/0x460 io_uring/io_uring.c:1169
 tctx_task_work+0x12e/0x530 io_uring/io_uring.c:1224
 task_work_run+0x16f/0x270 kernel/task_work.c:179
 get_signal+0x1c7/0x24f0 kernel/signal.c:2635
 arch_do_signal_or_restart+0x79/0x5c0 arch/x86/kernel/signal.c:306
 exit_to_user_mode_loop kernel/entry/common.c:168 [inline]
 exit_to_user_mode_prepare+0x11f/0x240 kernel/entry/common.c:204
 __syscall_exit_to_user_mode_work kernel/entry/common.c:286 [inline]
 syscall_exit_to_user_mode+0x1d/0x50 kernel/entry/common.c:297
 do_syscall_64+0x46/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f4b05dee34b
Code: 0f 05 48 3d 00 f0 ff ff 77 45 c3 0f 1f 40 00 48 83 ec 18 89 7c 24 0c e8 63 fc ff ff 8b 7c 24 0c 41 89 c0 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 35 44 89 c7 89 44 24 0c e8 a1 fc ff ff 8b 44
RSP: 002b:00007ffc30175fb0 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: fffffffffffffff7 RBX: 000000000000000c RCX: 00007f4b05dee34b
RDX: ffffffffffffffb8 RSI: 000000000000450e RDI: 000000000000000b
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000293 R12: 00007ffc30175fe8
R13: 00007f4b05eb7508 R14: 00007ffc30176000 R15: 0000000000000000
 </TASK>

Allocated by task 5089:
 kasan_save_stack+0x22/0x40 mm/kasan/common.c:45
 kasan_set_track+0x25/0x30 mm/kasan/common.c:52
 ____kasan_kmalloc mm/kasan/common.c:371 [inline]
 ____kasan_kmalloc mm/kasan/common.c:330 [inline]
 __kasan_kmalloc+0xa2/0xb0 mm/kasan/common.c:380
 kmalloc include/linux/slab.h:580 [inline]
 kzalloc include/linux/slab.h:720 [inline]
 snd_pcm_oss_open_file sound/core/oss/pcm_oss.c:2433 [inline]
 snd_pcm_oss_open.part.0+0x558/0x1330 sound/core/oss/pcm_oss.c:2535
 snd_pcm_oss_open+0x44/0x60 sound/core/oss/pcm_oss.c:2499
 soundcore_open+0x452/0x620 sound/sound_core.c:593
 chrdev_open+0x26a/0x770 fs/char_dev.c:414
 do_dentry_open+0x6cc/0x13f0 fs/open.c:883
 do_open fs/namei.c:3558 [inline]
 path_openat+0x1bc1/0x2b40 fs/namei.c:3715
 do_filp_open+0x1ba/0x410 fs/namei.c:3742
 do_sys_openat2+0x16d/0x4c0 fs/open.c:1311
 do_sys_open fs/open.c:1327 [inline]
 __do_sys_openat fs/open.c:1343 [inline]
 __se_sys_openat fs/open.c:1338 [inline]
 __x64_sys_openat+0x143/0x1f0 fs/open.c:1338
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Freed by task 5089:
 kasan_save_stack+0x22/0x40 mm/kasan/common.c:45
 kasan_set_track+0x25/0x30 mm/kasan/common.c:52
 kasan_save_free_info+0x2e/0x40 mm/kasan/generic.c:518
 ____kasan_slab_free mm/kasan/common.c:236 [inline]
 ____kasan_slab_free+0x160/0x1c0 mm/kasan/common.c:200
 kasan_slab_free include/linux/kasan.h:162 [inline]
 slab_free_hook mm/slub.c:1781 [inline]
 slab_free_freelist_hook+0x8b/0x1c0 mm/slub.c:1807
 slab_free mm/slub.c:3787 [inline]
 __kmem_cache_free+0xaf/0x2d0 mm/slub.c:3800
 snd_pcm_oss_release_file sound/core/oss/pcm_oss.c:2415 [inline]
 snd_pcm_oss_release_file sound/core/oss/pcm_oss.c:2405 [inline]
 snd_pcm_oss_release+0x182/0x300 sound/core/oss/pcm_oss.c:2592
 __fput+0x27c/0xa90 fs/file_table.c:321
 task_work_run+0x16f/0x270 kernel/task_work.c:179
 get_signal+0x1c7/0x24f0 kernel/signal.c:2635
 arch_do_signal_or_restart+0x79/0x5c0 arch/x86/kernel/signal.c:306
 exit_to_user_mode_loop kernel/entry/common.c:168 [inline]
 exit_to_user_mode_prepare+0x11f/0x240 kernel/entry/common.c:204
 __syscall_exit_to_user_mode_work kernel/entry/common.c:286 [inline]
 syscall_exit_to_user_mode+0x1d/0x50 kernel/entry/common.c:297
 do_syscall_64+0x46/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

The buggy address belongs to the object at ffff88801c509840
 which belongs to the cache kmalloc-16 of size 16
The buggy address is located 0 bytes inside of
 16-byte region [ffff88801c509840, ffff88801c509850)

The buggy address belongs to the physical page:
page:ffffea0000714240 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1c509
flags: 0xfff00000000200(slab|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000200 ffff8880124413c0 dead000000000100 dead000000000122
raw: 0000000000000000 0000000080800080 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x12cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY), pid 1, tgid 1 (swapper/0), ts 12562219376, free_ts 12549200446
 prep_new_page mm/page_alloc.c:2549 [inline]
 get_page_from_freelist+0x11bb/0x2d50 mm/page_alloc.c:4324
 __alloc_pages+0x1cb/0x5c0 mm/page_alloc.c:5590
 alloc_page_interleave+0x1e/0x200 mm/mempolicy.c:2114
 alloc_pages+0x233/0x270 mm/mempolicy.c:2276
 alloc_slab_page mm/slub.c:1851 [inline]
 allocate_slab+0x25f/0x350 mm/slub.c:1998
 new_slab mm/slub.c:2051 [inline]
 ___slab_alloc+0xa91/0x1400 mm/slub.c:3193
 __slab_alloc.constprop.0+0x56/0xa0 mm/slub.c:3292
 __slab_alloc_node mm/slub.c:3345 [inline]
 slab_alloc_node mm/slub.c:3442 [inline]
 __kmem_cache_alloc_node+0x136/0x330 mm/slub.c:3491
 __do_kmalloc_node mm/slab_common.c:966 [inline]
 __kmalloc+0x4a/0xd0 mm/slab_common.c:980
 kmalloc include/linux/slab.h:584 [inline]
 kzalloc include/linux/slab.h:720 [inline]
 kobject_get_path+0xc2/0x230 lib/kobject.c:147
 kobject_uevent_env+0x257/0x1620 lib/kobject_uevent.c:529
 kernel_add_sysfs_param kernel/params.c:816 [inline]
 param_sysfs_builtin kernel/params.c:851 [inline]
 param_sysfs_builtin_init+0x321/0x3fd kernel/params.c:985
 do_one_initcall+0x141/0x7d0 init/main.c:1306
 do_initcall_level init/main.c:1379 [inline]
 do_initcalls init/main.c:1395 [inline]
 do_basic_setup init/main.c:1414 [inline]
 kernel_init_freeable+0x6f9/0x782 init/main.c:1634
 kernel_init+0x1e/0x1d0 init/main.c:1522
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1451 [inline]
 free_pcp_prepare+0x4d0/0x910 mm/page_alloc.c:1501
 free_unref_page_prepare mm/page_alloc.c:3387 [inline]
 free_unref_page+0x1d/0x490 mm/page_alloc.c:3482
 kasan_depopulate_vmalloc_pte+0x60/0x80 mm/kasan/shadow.c:372
 apply_to_pte_range mm/memory.c:2575 [inline]
 apply_to_pmd_range mm/memory.c:2619 [inline]
 apply_to_pud_range mm/memory.c:2655 [inline]
 apply_to_p4d_range mm/memory.c:2691 [inline]
 __apply_to_page_range+0x68c/0x1030 mm/memory.c:2725
 kasan_release_vmalloc+0xab/0xc0 mm/kasan/shadow.c:486
 __purge_vmap_area_lazy+0x897/0x1fa0 mm/vmalloc.c:1776
 drain_vmap_area_work+0x56/0xe0 mm/vmalloc.c:1809
 process_one_work+0x9bf/0x1750 kernel/workqueue.c:2293
 worker_thread+0x669/0x1090 kernel/workqueue.c:2440
 kthread+0x2e8/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308

Memory state around the buggy address:
 ffff88801c509700: 00 03 fc fc 00 00 fc fc 00 03 fc fc 00 03 fc fc
 ffff88801c509780: 00 00 fc fc fb fb fc fc fb fb fc fc fb fb fc fc
>ffff88801c509800: 00 01 fc fc 00 01 fc fc fa fb fc fc 00 03 fc fc
                                           ^
 ffff88801c509880: 00 03 fc fc fa fb fc fc 00 00 fc fc 00 00 fc fc
 ffff88801c509900: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
==================================================================


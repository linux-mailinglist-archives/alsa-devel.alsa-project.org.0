Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FE4141CCE
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jan 2020 08:18:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 627C916B6;
	Sun, 19 Jan 2020 08:17:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 627C916B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579418321;
	bh=vu8FVj9xkC9gl+suUCRzy4v5Uc7pSdf0matzy1F6SwQ=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HBPZj5JKGR5Afw2YlZ9+DJzAZabUlLBdE1bcCW6etV+LGOipIdrpDr2Rm1I0h9Jln
	 iuOFwZUu3018Q6mCWYCAxuMuRa+XTaydIbuTXC80B9iPwyLjJlAVhpoeDzQsT/7F2S
	 XAXIWZxWh/Rk9Kee8YP9iKhed7GhagEhdI23+GdI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 083D1F8028B;
	Sun, 19 Jan 2020 08:14:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5A82F801F8; Wed, 15 Jan 2020 18:16:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B03AFF800E9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 18:16:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B03AFF800E9
Received: by mail-io1-f69.google.com with SMTP id c23so10781424ioi.12
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 09:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=O3YbhnbyZQorKGlqJaF7WScrngDyTF1HNDIoMCSO20A=;
 b=pt+t5Pwnt97w/Eypw91uZ32+Lgu2tYC8OYBay8Lms3ROOnxog9QmM/TkgU05GBEgOD
 KCq0P8CAqZkeuj3S/QvONyWOFItCzKIXM3ibUarJDNdRHgdDDOfwMppleN0wGhFRJTmT
 eXM4KOJuAW2dQBz6VvYsnjqHRTTeLLFxuGT+e77Xmu1bWP6JX73N5TIsfb3zrYmyLO+j
 lSlPLicywBxDaeZvlVnqoL+IVKXBY/QKvFR2+D62t3VEN+ALJm8xLQVinfCKIAhZ4sgA
 CS1Gx9wKD+ENeyzjlSPaTUe3sdYqlbPkcCH5/snIV7bbWnfWvmIdaHrWFe3aSjQVv8QD
 GNvQ==
X-Gm-Message-State: APjAAAX90qmmeZkLu+8P5S071NYVUEoPnoTTp+pOOcBXqGddHe8J+/S3
 PM6k8wkNMCxuheU4f6/fe09x393o1w+LV/JEmHyPkdGutdXg
X-Google-Smtp-Source: APXvYqwOsrIOXD4CEiMYP1hgJ3K2TIfgF7CXZJ/y1TnXfL6D5RtnB3/ct/weWXrmcmAmuvc5UhoxCKBFCHJfE0S+ReBYLhVTgGQH
MIME-Version: 1.0
X-Received: by 2002:a02:7f54:: with SMTP id r81mr25309079jac.121.1579108571189; 
 Wed, 15 Jan 2020 09:16:11 -0800 (PST)
Date: Wed, 15 Jan 2020 09:16:11 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000729d74059c30ddff@google.com>
From: syzbot <syzbot+2b2ef983f973e5c40943@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com
X-Mailman-Approved-At: Sun, 19 Jan 2020 08:13:54 +0100
Subject: [alsa-devel] KASAN: use-after-free Read in snd_timer_resolution
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,

syzbot found the following crash on:

HEAD commit:    e033e7d4 Merge branch 'dhowells' (patches from DavidH)
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12f2bb25e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d9290aeb7e6cf1c4
dashboard link: https://syzkaller.appspot.com/bug?extid=2b2ef983f973e5c40943
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
userspace arch: i386

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+2b2ef983f973e5c40943@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in snd_timer_resolution+0xf1/0x110  
sound/core/timer.c:441
Read of size 8 at addr ffff888094155800 by task syz-executor.0/18632

CPU: 1 PID: 18632 Comm: syz-executor.0 Not tainted 5.5.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x197/0x210 lib/dump_stack.c:118
  print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
  __kasan_report.cold+0x1b/0x41 mm/kasan/report.c:506
  kasan_report+0x12/0x20 mm/kasan/common.c:639
  __asan_report_load8_noabort+0x14/0x20 mm/kasan/generic_report.c:135
  snd_timer_resolution+0xf1/0x110 sound/core/timer.c:441
  snd_seq_info_timer_read+0x95/0x2f1 sound/core/seq/seq_timer.c:480
  snd_info_seq_show+0xcb/0x120 sound/core/info.c:363
  seq_read+0x4ca/0x1170 fs/seq_file.c:229
  proc_reg_read+0x1fc/0x2c0 fs/proc/inode.c:223
  do_loop_readv_writev fs/read_write.c:714 [inline]
  do_loop_readv_writev fs/read_write.c:701 [inline]
  do_iter_read+0x4a4/0x660 fs/read_write.c:935
  compat_readv+0x187/0x1f0 fs/read_write.c:1186
  do_compat_preadv64+0x190/0x1c0 fs/read_write.c:1235
  __do_compat_sys_preadv fs/read_write.c:1255 [inline]
  __se_compat_sys_preadv fs/read_write.c:1249 [inline]
  __ia32_compat_sys_preadv+0xc7/0x140 fs/read_write.c:1249
  do_syscall_32_irqs_on arch/x86/entry/common.c:337 [inline]
  do_fast_syscall_32+0x27b/0xe16 arch/x86/entry/common.c:408
  entry_SYSENTER_compat+0x70/0x7f arch/x86/entry/entry_64_compat.S:139
RIP: 0023:0xf7f6da39
Code: 00 00 00 89 d3 5b 5e 5f 5d c3 b8 80 96 98 00 eb c4 8b 04 24 c3 8b 1c  
24 c3 8b 34 24 c3 8b 3c 24 c3 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90  
90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 002b:00000000f5d690cc EFLAGS: 00000296 ORIG_RAX: 000000000000014d
RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00000000200017c0
RDX: 00000000000003da RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 18631:
  save_stack+0x23/0x90 mm/kasan/common.c:72
  set_track mm/kasan/common.c:80 [inline]
  __kasan_kmalloc mm/kasan/common.c:513 [inline]
  __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:486
  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:527
  kmem_cache_alloc_trace+0x158/0x790 mm/slab.c:3551
  kmalloc include/linux/slab.h:556 [inline]
  kzalloc include/linux/slab.h:670 [inline]
  snd_timer_instance_new+0x4a/0x300 sound/core/timer.c:96
  snd_seq_timer_open+0x1c0/0x590 sound/core/seq/seq_timer.c:275
  queue_use+0xf1/0x270 sound/core/seq/seq_queue.c:489
  snd_seq_queue_alloc+0x2c5/0x4d0 sound/core/seq/seq_queue.c:176
  snd_seq_ioctl_create_queue+0xb0/0x330 sound/core/seq/seq_clientmgr.c:1548
  snd_seq_kernel_client_ctl+0xf8/0x140 sound/core/seq/seq_clientmgr.c:2353
  alloc_seq_queue.isra.0+0xdc/0x180 sound/core/seq/oss/seq_oss_init.c:357
  snd_seq_oss_open+0x2ff/0x960 sound/core/seq/oss/seq_oss_init.c:215
  odev_open+0x70/0x90 sound/core/seq/oss/seq_oss.c:125
  soundcore_open+0x453/0x610 sound/sound_core.c:593
  chrdev_open+0x245/0x6b0 fs/char_dev.c:414
  do_dentry_open+0x4e6/0x1380 fs/open.c:797
  vfs_open+0xa0/0xd0 fs/open.c:914
  do_last fs/namei.c:3420 [inline]
  path_openat+0x10df/0x4500 fs/namei.c:3537
  do_filp_open+0x1a1/0x280 fs/namei.c:3567
  do_sys_open+0x3fe/0x5d0 fs/open.c:1097
  __do_compat_sys_openat fs/open.c:1143 [inline]
  __se_compat_sys_openat fs/open.c:1141 [inline]
  __ia32_compat_sys_openat+0x98/0xf0 fs/open.c:1141
  do_syscall_32_irqs_on arch/x86/entry/common.c:337 [inline]
  do_fast_syscall_32+0x27b/0xe16 arch/x86/entry/common.c:408
  entry_SYSENTER_compat+0x70/0x7f arch/x86/entry/entry_64_compat.S:139

Freed by task 18630:
  save_stack+0x23/0x90 mm/kasan/common.c:72
  set_track mm/kasan/common.c:80 [inline]
  kasan_set_free_info mm/kasan/common.c:335 [inline]
  __kasan_slab_free+0x102/0x150 mm/kasan/common.c:474
  kasan_slab_free+0xe/0x10 mm/kasan/common.c:483
  __cache_free mm/slab.c:3426 [inline]
  kfree+0x10a/0x2c0 mm/slab.c:3757
  snd_timer_instance_free sound/core/timer.c:120 [inline]
  snd_timer_instance_free+0x7c/0xa0 sound/core/timer.c:114
  snd_seq_timer_close+0x99/0xe0 sound/core/seq/seq_timer.c:319
  queue_delete+0x52/0xb0 sound/core/seq/seq_queue.c:134
  snd_seq_queue_delete+0x4e/0x70 sound/core/seq/seq_queue.c:196
  snd_seq_ioctl_delete_queue+0x6a/0x90 sound/core/seq/seq_clientmgr.c:1570
  snd_seq_kernel_client_ctl+0xf8/0x140 sound/core/seq/seq_clientmgr.c:2353
  delete_seq_queue.part.0+0xb6/0x120 sound/core/seq/oss/seq_oss_init.c:376
  delete_seq_queue sound/core/seq/oss/seq_oss_init.c:372 [inline]
  snd_seq_oss_release+0x116/0x150 sound/core/seq/oss/seq_oss_init.c:421
  odev_release+0x54/0x80 sound/core/seq/oss/seq_oss.c:140
  __fput+0x2ff/0x890 fs/file_table.c:280
  ____fput+0x16/0x20 fs/file_table.c:313
  task_work_run+0x145/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x316/0x380 arch/x86/entry/common.c:164
  prepare_exit_to_usermode arch/x86/entry/common.c:195 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:278 [inline]
  do_syscall_32_irqs_on arch/x86/entry/common.c:352 [inline]
  do_fast_syscall_32+0xbbd/0xe16 arch/x86/entry/common.c:408
  entry_SYSENTER_compat+0x70/0x7f arch/x86/entry/entry_64_compat.S:139

The buggy address belongs to the object at ffff888094155800
  which belongs to the cache kmalloc-256 of size 256
The buggy address is located 0 bytes inside of
  256-byte region [ffff888094155800, ffff888094155900)
The buggy address belongs to the page:
page:ffffea0002505540 refcount:1 mapcount:0 mapping:ffff8880aa4008c0  
index:0x0
raw: 00fffe0000000200 ffffea00024df348 ffffea00024af508 ffff8880aa4008c0
raw: 0000000000000000 ffff888094155000 0000000100000008 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff888094155700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff888094155780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ffff888094155800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                    ^
  ffff888094155880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff888094155900: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

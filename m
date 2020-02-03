Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 222A3150189
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 06:53:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9409168B;
	Mon,  3 Feb 2020 06:52:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9409168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580709225;
	bh=57tdo2HaBWIiJ1QGlbmw/sH9wHu1+8nrSfMpsm+7ytg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lgr1vw3onn4QzTXiT1IP65PXpTMe2GZ5PsCDYH5jKAjpCCvW+fW/uWGTrAAruM1uQ
	 mmU5sziYiV4MGPjdCc2DfBkCpHDt22zqyePZ9HO60WRn6tpL2M8wwN1MX2SouQ0ymw
	 rPo4bgJp5/IA/sIaPFFkZXIx7FLz3Eq5GDO/jYa8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8211F80148;
	Mon,  3 Feb 2020 06:52:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B33EDF80148; Mon,  3 Feb 2020 06:52:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FROM,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from r3-17.sinamail.sina.com.cn (r3-17.sinamail.sina.com.cn
 [202.108.3.17]) by alsa1.perex.cz (Postfix) with SMTP id 52D79F800B8
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 06:51:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52D79F800B8
Received: from unknown (HELO localhost.localdomain)([114.246.227.35])
 by sina.com with ESMTP
 id 5E37B4E40000992A; Mon, 3 Feb 2020 13:51:43 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 24462249283572
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+2b2ef983f973e5c40943@syzkaller.appspotmail.com>
Date: Mon,  3 Feb 2020 13:51:22 +0800
Message-Id: <20200203055122.18020-1-hdanton@sina.com>
In-Reply-To: <000000000000729d74059c30ddff@google.com>
References: 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, arnd@arndb.de, baolin.wang@linaro.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, tiwai@suse.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 alsa-devel-owner@alsa-project.org, stable@vger.kernel.org,
 stable-commits@vger.kernel.org, Hillf Danton <hdanton@sina.com>
Subject: Re: [alsa-devel] KASAN: use-after-free Read in snd_timer_resolution
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Sun, 02 Feb 2020 04:56:10 -0800 (PST)
> syzbot has found a reproducer for the following crash on:
> 
> HEAD commit:    2747d5fd Add linux-next specific files for 20200116
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=1147e101e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=22f506e7a3a37fe2
> dashboard link: https://syzkaller.appspot.com/bug?extid=2b2ef983f973e5c40943
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10c0864ee00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14738df1e00000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+2b2ef983f973e5c40943@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: use-after-free in snd_timer_resolution+0xf1/0x110 sound/core/timer.c:487
> Read of size 8 at addr ffff88809e0f5a00 by task syz-executor911/9849
> 
> CPU: 1 PID: 9849 Comm: syz-executor911 Not tainted 5.5.0-rc6-next-20200116-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x197/0x210 lib/dump_stack.c:118
>  print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
>  __kasan_report.cold+0x1b/0x32 mm/kasan/report.c:506
>  kasan_report+0x12/0x20 mm/kasan/common.c:641
>  __asan_report_load8_noabort+0x14/0x20 mm/kasan/generic_report.c:135
>  snd_timer_resolution+0xf1/0x110 sound/core/timer.c:487
>  snd_seq_info_timer_read+0x95/0x2f1 sound/core/seq/seq_timer.c:480
>  snd_info_seq_show+0xcb/0x120 sound/core/info.c:362
>  seq_read+0x4ca/0x1170 fs/seq_file.c:229
>  proc_reg_read+0x1f8/0x2b0 fs/proc/inode.c:223
>  do_loop_readv_writev fs/read_write.c:714 [inline]
>  do_loop_readv_writev fs/read_write.c:701 [inline]
>  do_iter_read+0x4a4/0x660 fs/read_write.c:935
>  vfs_readv+0xf0/0x160 fs/read_write.c:997
>  do_preadv+0x1c4/0x280 fs/read_write.c:1089
>  __do_sys_preadv fs/read_write.c:1139 [inline]
>  __se_sys_preadv fs/read_write.c:1134 [inline]
>  __x64_sys_preadv+0x9a/0xf0 fs/read_write.c:1134
>  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x441389
> Code: e8 ac e8 ff ff 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 eb 08 fc ff c3 66 2e 0f 1f 84 00 00 00 00
> RSP: 002b:00007ffc8aa7ce38 EFLAGS: 00000246 ORIG_RAX: 0000000000000127
> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000441389
> RDX: 0000000000000227 RSI: 00000000200017c0 RDI: 0000000000000004
> RBP: 00007ffc8aa7ce50 R08: 000000000000000f R09: 00000000000000c2
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000402100
> R13: 0000000000402190 R14: 0000000000000000 R15: 0000000000000000
> 
> Allocated by task 9852:
>  save_stack+0x23/0x90 mm/kasan/common.c:72
>  set_track mm/kasan/common.c:80 [inline]
>  __kasan_kmalloc mm/kasan/common.c:515 [inline]
>  __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:488
>  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:529
>  kmem_cache_alloc_trace+0x158/0x790 mm/slab.c:3551
>  kmalloc include/linux/slab.h:555 [inline]
>  kzalloc include/linux/slab.h:669 [inline]
>  snd_timer_instance_new+0x4a/0x300 sound/core/timer.c:142
>  snd_seq_timer_open+0x1c0/0x590 sound/core/seq/seq_timer.c:275
>  queue_use+0xf1/0x270 sound/core/seq/seq_queue.c:489
>  snd_seq_queue_alloc+0x2c5/0x4d0 sound/core/seq/seq_queue.c:176
>  snd_seq_ioctl_create_queue+0xb0/0x330 sound/core/seq/seq_clientmgr.c:1548
>  snd_seq_kernel_client_ctl+0xf8/0x140 sound/core/seq/seq_clientmgr.c:2353
>  alloc_seq_queue.isra.0+0xdc/0x180 sound/core/seq/oss/seq_oss_init.c:357
>  snd_seq_oss_open+0x2ff/0x960 sound/core/seq/oss/seq_oss_init.c:215
>  odev_open+0x70/0x90 sound/core/seq/oss/seq_oss.c:125
>  soundcore_open+0x453/0x610 sound/sound_core.c:593
>  chrdev_open+0x245/0x6b0 fs/char_dev.c:414
>  do_dentry_open+0x4ca/0x1350 fs/open.c:797
>  vfs_open+0xa0/0xd0 fs/open.c:914
>  do_last fs/namei.c:3487 [inline]
>  path_openat+0x12fd/0x34d0 fs/namei.c:3604
>  do_filp_open+0x192/0x260 fs/namei.c:3634
>  do_sys_openat2+0x633/0x840 fs/open.c:1151
>  do_sys_open+0xfc/0x190 fs/open.c:1167
>  __do_sys_openat fs/open.c:1181 [inline]
>  __se_sys_openat fs/open.c:1176 [inline]
>  __x64_sys_openat+0x9d/0x100 fs/open.c:1176
>  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> 
> Freed by task 9852:
>  save_stack+0x23/0x90 mm/kasan/common.c:72
>  set_track mm/kasan/common.c:80 [inline]
>  kasan_set_free_info mm/kasan/common.c:337 [inline]
>  __kasan_slab_free+0x102/0x150 mm/kasan/common.c:476
>  kasan_slab_free+0xe/0x10 mm/kasan/common.c:485
>  __cache_free mm/slab.c:3426 [inline]
>  kfree+0x10a/0x2c0 mm/slab.c:3757
>  snd_timer_instance_free sound/core/timer.c:166 [inline]
>  snd_timer_instance_free+0x7c/0xa0 sound/core/timer.c:160
>  snd_seq_timer_close+0x99/0xe0 sound/core/seq/seq_timer.c:319
>  queue_delete+0x52/0xb0 sound/core/seq/seq_queue.c:134
>  snd_seq_queue_delete+0x4e/0x70 sound/core/seq/seq_queue.c:196
>  snd_seq_ioctl_delete_queue+0x6a/0x90 sound/core/seq/seq_clientmgr.c:1570
>  snd_seq_kernel_client_ctl+0xf8/0x140 sound/core/seq/seq_clientmgr.c:2353
>  delete_seq_queue.part.0+0xb6/0x120 sound/core/seq/oss/seq_oss_init.c:376
>  delete_seq_queue sound/core/seq/oss/seq_oss_init.c:372 [inline]
>  snd_seq_oss_release+0x116/0x150 sound/core/seq/oss/seq_oss_init.c:421
>  odev_release+0x54/0x80 sound/core/seq/oss/seq_oss.c:140
>  __fput+0x2ff/0x890 fs/file_table.c:280
>  ____fput+0x16/0x20 fs/file_table.c:313
>  task_work_run+0x145/0x1c0 kernel/task_work.c:113
>  exit_task_work include/linux/task_work.h:22 [inline]
>  do_exit+0xbcb/0x2f80 kernel/exit.c:801
>  do_group_exit+0x135/0x360 kernel/exit.c:899
>  __do_sys_exit_group kernel/exit.c:910 [inline]
>  __se_sys_exit_group kernel/exit.c:908 [inline]
>  __x64_sys_exit_group+0x44/0x50 kernel/exit.c:908
>  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> 
> The buggy address belongs to the object at ffff88809e0f5a00
>  which belongs to the cache kmalloc-256 of size 256
> The buggy address is located 0 bytes inside of
>  256-byte region [ffff88809e0f5a00, ffff88809e0f5b00)
> The buggy address belongs to the page:
> page:ffffea0002783d40 refcount:1 mapcount:0 mapping:ffff8880aa4008c0 index:0x0
> flags: 0xfffe0000000200(slab)
> raw: 00fffe0000000200 ffffea0002783948 ffffea00027872c8 ffff8880aa4008c0
> raw: 0000000000000000 ffff88809e0f5000 0000000100000008 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>  ffff88809e0f5900: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>  ffff88809e0f5980: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >ffff88809e0f5a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                    ^
>  ffff88809e0f5a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ffff88809e0f5b00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ==================================================================

Release resources after all users of queue go home.

--- a/sound/core/seq/seq_queue.c
+++ b/sound/core/seq/seq_queue.c
@@ -128,13 +128,15 @@ static struct snd_seq_queue *queue_new(i
 /* delete queue (destructor) */
 static void queue_delete(struct snd_seq_queue *q)
 {
+	/* wait until access free */
+	snd_use_lock_sync(&q->use_lock);
+
 	/* stop and release the timer */
 	mutex_lock(&q->timer_mutex);
 	snd_seq_timer_stop(q->timer);
 	snd_seq_timer_close(q);
 	mutex_unlock(&q->timer_mutex);
-	/* wait until access free */
-	snd_use_lock_sync(&q->use_lock);
+
 	/* release resources... */
 	snd_seq_prioq_delete(&q->tickq);
 	snd_seq_prioq_delete(&q->timeq);

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

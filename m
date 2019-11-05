Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0EDF1180
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 09:55:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8837916B6;
	Wed,  6 Nov 2019 09:54:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8837916B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573030510;
	bh=UetSH+QP9yQ412LMShYrATcuc8MSKC7B30X47WHyBJY=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GnTRlstpwnSrbejdkI4Tg7RPZnqGCOuGrs2y3AIOhEUYVbxu5SlVHfaE4xSJrWivi
	 hekmNpsFwTyoFZiVfogC44t2a+RMFsp9AcXavUTZfHWdokWxXC9RPOMsQ5AM5EazQL
	 CnR7290ee2wiMRN3YfvkQvWLOlYHoXf0xSjz4IhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DB63F805FB;
	Wed,  6 Nov 2019 09:52:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A283F80446; Tue,  5 Nov 2019 18:52:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADC03F800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 18:52:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADC03F800F3
Received: by mail-io1-f71.google.com with SMTP id 125so16077141iou.7
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 09:52:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=r1mtx4bkt5guUlQgDERVHnJyVOFj9ynotZ50MWdOw5A=;
 b=jVxhvYjOFSCRq26/pckug7kZw7fXkEY8qdkzaFFb28xUSWIrFeh/VJ0U7QgnKjA/An
 y1/rxtuH00a4ho7xRO+mtXtB1sDa/34+nlGwR9VdI0bIyNn8SsksAR/LFOef2nC0GGnK
 3C7xzvRgyw8y7PaG9TzznPV4d3xAmXsD73ZbJyzQjt4JGVfAt3m2I+pPsgbCRMl1t93a
 SiMwB7QnVdQRW0nP9qYrUTCncH6r2rBfE8173ij3sW1WYnG4LnmVRz79G9KvNELnscs/
 OnA7R4beJNqyEMk8W5Xc/+KTaAKjt9dDMBhihKvqoUtk/1FP0aljzQ4cHILOMOfJ0Rdy
 D7Ug==
X-Gm-Message-State: APjAAAX2T5rId7eZ7g6PG07NYYsm2D1JYKRbCnvuaEP/rkyUoC6QSSif
 ZJ7vE3mmpJDQ9q9pGT2FcIFSFv2PioZtDw9qnHJ1WvikMBsx
X-Google-Smtp-Source: APXvYqxc9CwFNE5+3IXXys03v5pOGPeVF6uV63KJ45fDZRnp26YZpnv8FmaMZiUf/eMXh17rS2RsHWYG4eK5swv5zvqdATuFP3Wj
MIME-Version: 1.0
X-Received: by 2002:a5e:8c0d:: with SMTP id n13mr17699949ioj.258.1572976328565; 
 Tue, 05 Nov 2019 09:52:08 -0800 (PST)
Date: Tue, 05 Nov 2019 09:52:08 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004dfaf005969d1755@google.com>
From: syzbot <syzbot+f1048ebddb93befb085f@syzkaller.appspotmail.com>
To: alexandre.belloni@bootlin.com, alsa-devel@alsa-project.org, 
 bhelgaas@google.com, kirr@nexedi.com, linux-kernel@vger.kernel.org, 
 lkundrak@v3.sk, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
 tglx@linutronix.de, tiwai@suse.com
X-Mailman-Approved-At: Wed, 06 Nov 2019 09:52:36 +0100
Subject: [alsa-devel] INFO: task hung in snd_timer_close
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

HEAD commit:    a99d8080 Linux 5.4-rc6
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10afae68e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5e2eca3f31f9bf
dashboard link: https://syzkaller.appspot.com/bug?extid=f1048ebddb93befb085f
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=126bc658e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+f1048ebddb93befb085f@syzkaller.appspotmail.com

INFO: task syz-executor.0:12251 blocked for more than 143 seconds.
       Not tainted 5.4.0-rc6 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.0  D28160 12251   8868 0x00000004
Call Trace:
  context_switch kernel/sched/core.c:3384 [inline]
  __schedule+0x94f/0x1e70 kernel/sched/core.c:4069
  schedule+0xd9/0x260 kernel/sched/core.c:4136
  schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4195
  __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
  __mutex_lock+0x7b0/0x13c0 kernel/locking/mutex.c:1103
  mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
  snd_timer_close+0x7e/0x100 sound/core/timer.c:422
  snd_timer_user_release+0x98/0x130 sound/core/timer.c:1478
  __fput+0x2ff/0x890 fs/file_table.c:280
  ____fput+0x16/0x20 fs/file_table.c:313
  task_work_run+0x145/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x316/0x380 arch/x86/entry/common.c:163
  prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
  do_syscall_64+0x65f/0x760 arch/x86/entry/common.c:300
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x413db1
Code: c0 c3 0f 1f 80 00 00 00 00 c7 07 00 00 00 00 31 c0 c3 0f 1f 80 00 00  
00 00 31 c0 c3 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 b8 <2d> f8 ff ff c3  
66 2e 0f 1f 84 00 00 00 00 00 31 c0 c3 66 66 66 66
RSP: 002b:00007ffdda4a34b0 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000004 RCX: 0000000000413db1
RDX: 0000001b2dd20000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 0000000000000001 R08: ffffffffffffffff R09: ffffffffffffffff
R10: 00007ffdda4a3590 R11: 0000000000000293 R12: 000000000075c9a0
R13: 000000000075c9a0 R14: 0000000000760a90 R15: 000000000075bf2c
INFO: task syz-executor.2:12256 blocked for more than 143 seconds.
       Not tainted 5.4.0-rc6 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.2  D28160 12256   8864 0x00000004
Call Trace:
  context_switch kernel/sched/core.c:3384 [inline]
  __schedule+0x94f/0x1e70 kernel/sched/core.c:4069
  schedule+0xd9/0x260 kernel/sched/core.c:4136
  schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4195
  __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
  __mutex_lock+0x7b0/0x13c0 kernel/locking/mutex.c:1103
  mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
  snd_timer_close+0x7e/0x100 sound/core/timer.c:422
  snd_timer_user_release+0x98/0x130 sound/core/timer.c:1478
  __fput+0x2ff/0x890 fs/file_table.c:280
  ____fput+0x16/0x20 fs/file_table.c:313
  task_work_run+0x145/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x316/0x380 arch/x86/entry/common.c:163
  prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
  do_syscall_64+0x65f/0x760 arch/x86/entry/common.c:300
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x413db1
Code: c0 c3 0f 1f 80 00 00 00 00 c7 07 00 00 00 00 31 c0 c3 0f 1f 80 00 00  
00 00 31 c0 c3 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 b8 <2d> f8 ff ff c3  
66 2e 0f 1f 84 00 00 00 00 00 31 c0 c3 66 66 66 66
RSP: 002b:00007ffe078ed7d0 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000004 RCX: 0000000000413db1
RDX: 0000001b2da20000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 0000000000000001 R08: ffffffffffffffff R09: ffffffffffffffff
R10: 00007ffe078ed8b0 R11: 0000000000000293 R12: 000000000075c9a0
R13: 000000000075c9a0 R14: 0000000000760a90 R15: 000000000075bf2c
INFO: task syz-executor.4:12266 blocked for more than 144 seconds.
       Not tainted 5.4.0-rc6 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.4  D28480 12266   8871 0x00000004
Call Trace:
  context_switch kernel/sched/core.c:3384 [inline]
  __schedule+0x94f/0x1e70 kernel/sched/core.c:4069
  schedule+0xd9/0x260 kernel/sched/core.c:4136
  schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4195
  __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
  __mutex_lock+0x7b0/0x13c0 kernel/locking/mutex.c:1103
  mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
  snd_timer_open+0x98/0x1860 sound/core/timer.c:245
  snd_timer_user_tselect sound/core/timer.c:1728 [inline]
  __snd_timer_user_ioctl.isra.0+0x68b/0x1fd0 sound/core/timer.c:2003
  snd_timer_user_ioctl+0x7a/0xa7 sound/core/timer.c:2033
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xdb6/0x13e0 fs/ioctl.c:696
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:718
  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45a219
Code: Bad RIP value.
RSP: 002b:00007f2806975c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 000000000045a219
RDX: 0000000020029fcc RSI: 0000000040345410 RDI: 0000000000000003
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f28069766d4
R13: 00000000004cf428 R14: 00000000004d9760 R15: 00000000ffffffff
INFO: task syz-executor.4:12269 blocked for more than 144 seconds.
       Not tainted 5.4.0-rc6 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.4  D29712 12269   8871 0x00000004
Call Trace:
  context_switch kernel/sched/core.c:3384 [inline]
  __schedule+0x94f/0x1e70 kernel/sched/core.c:4069
  schedule+0xd9/0x260 kernel/sched/core.c:4136
  schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4195
  __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
  __mutex_lock+0x7b0/0x13c0 kernel/locking/mutex.c:1103
  mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
  snd_timer_user_ioctl+0x51/0xa7 sound/core/timer.c:2032
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xdb6/0x13e0 fs/ioctl.c:696
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:718
  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45a219
Code: Bad RIP value.
RSP: 002b:00007f2806954c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 000000000045a219
RDX: 0000000000000000 RSI: 00000000000054a0 RDI: 0000000000000003
RBP: 000000000075bfc8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f28069556d4
R13: 00000000004c4ae8 R14: 00000000004d9778 R15: 00000000ffffffff
INFO: task syz-executor.4:12271 blocked for more than 144 seconds.
       Not tainted 5.4.0-rc6 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.4  D28000 12271   8871 0x00000004
Call Trace:
  context_switch kernel/sched/core.c:3384 [inline]
  __schedule+0x94f/0x1e70 kernel/sched/core.c:4069
  schedule+0xd9/0x260 kernel/sched/core.c:4136
  schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4195
  __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
  __mutex_lock+0x7b0/0x13c0 kernel/locking/mutex.c:1103
  mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
  snd_timer_open+0x98/0x1860 sound/core/timer.c:245
  snd_seq_timer_open+0x240/0x590 sound/core/seq/seq_timer.c:275
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
  do_last fs/namei.c:3408 [inline]
  path_openat+0x10e9/0x46d0 fs/namei.c:3525
  do_filp_open+0x1a1/0x280 fs/namei.c:3555
  do_sys_open+0x3fe/0x5d0 fs/open.c:1097
  __do_sys_openat fs/open.c:1124 [inline]
  __se_sys_openat fs/open.c:1118 [inline]
  __x64_sys_openat+0x9d/0x100 fs/open.c:1118
  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45a219
Code: Bad RIP value.
RSP: 002b:00007f2806933c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 000000000045a219
RDX: 0000000000000001 RSI: 0000000020000000 RDI: ffffffffffffff9c
RBP: 000000000075c070 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f28069346d4
R13: 00000000004c734a R14: 00000000004dcf88 R15: 00000000ffffffff
INFO: task syz-executor.4:12273 blocked for more than 145 seconds.
       Not tainted 5.4.0-rc6 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.4  D28552 12273   8871 0x00000004
Call Trace:
  context_switch kernel/sched/core.c:3384 [inline]
  __schedule+0x94f/0x1e70 kernel/sched/core.c:4069
  schedule+0xd9/0x260 kernel/sched/core.c:4136
  schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4195
  __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
  __mutex_lock+0x7b0/0x13c0 kernel/locking/mutex.c:1103
  mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
  snd_timer_user_ioctl+0x51/0xa7 sound/core/timer.c:2032
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xdb6/0x13e0 fs/ioctl.c:696
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:718
  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45a219
Code: Bad RIP value.
RSP: 002b:00007f2806912c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 000000000045a219
RDX: 0000000000000000 RSI: 00000000000054a0 RDI: 0000000000000003
RBP: 000000000075c118 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f28069136d4
R13: 00000000004c4ae8 R14: 00000000004d9778 R15: 00000000ffffffff
INFO: task syz-executor.4:12275 blocked for more than 145 seconds.
       Not tainted 5.4.0-rc6 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.4  D29312 12275   8871 0x00004004
Call Trace:
  context_switch kernel/sched/core.c:3384 [inline]
  __schedule+0x94f/0x1e70 kernel/sched/core.c:4069
  schedule+0xd9/0x260 kernel/sched/core.c:4136
  schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4195
  __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
  __mutex_lock+0x7b0/0x13c0 kernel/locking/mutex.c:1103
  mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
  snd_timer_open+0x98/0x1860 sound/core/timer.c:245
  snd_timer_user_tselect sound/core/timer.c:1728 [inline]
  __snd_timer_user_ioctl.isra.0+0x68b/0x1fd0 sound/core/timer.c:2003
  snd_timer_user_ioctl+0x7a/0xa7 sound/core/timer.c:2033
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xdb6/0x13e0 fs/ioctl.c:696
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:718
  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45a219
Code: Bad RIP value.
RSP: 002b:00007f28068f1c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 000000000045a219
RDX: 0000000020029fcc RSI: 0000000040345410 RDI: 0000000000000003
RBP: 000000000075c1c0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f28068f26d4
R13: 00000000004cf428 R14: 00000000004d9760 R15: 00000000ffffffff
INFO: task syz-executor.4:12276 blocked for more than 146 seconds.
       Not tainted 5.4.0-rc6 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.4  D28536 12276   8871 0x00004004
Call Trace:
  context_switch kernel/sched/core.c:3384 [inline]
  __schedule+0x94f/0x1e70 kernel/sched/core.c:4069
  schedule+0xd9/0x260 kernel/sched/core.c:4136
  schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4195
  __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
  __mutex_lock+0x7b0/0x13c0 kernel/locking/mutex.c:1103
  mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
  odev_open+0x5f/0x90 sound/core/seq/oss/seq_oss.c:124
  soundcore_open+0x453/0x610 sound/sound_core.c:593
  chrdev_open+0x245/0x6b0 fs/char_dev.c:414
  do_dentry_open+0x4e6/0x1380 fs/open.c:797
  vfs_open+0xa0/0xd0 fs/open.c:914
  do_last fs/namei.c:3408 [inline]
  path_openat+0x10e9/0x46d0 fs/namei.c:3525
  do_filp_open+0x1a1/0x280 fs/namei.c:3555
  do_sys_open+0x3fe/0x5d0 fs/open.c:1097
  __do_sys_openat fs/open.c:1124 [inline]
  __se_sys_openat fs/open.c:1118 [inline]
  __x64_sys_openat+0x9d/0x100 fs/open.c:1118
  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45a219
Code: Bad RIP value.
RSP: 002b:00007f28068d0c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 000000000045a219
RDX: 0000000000000001 RSI: 0000000020000000 RDI: ffffffffffffff9c
RBP: 000000000075c268 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f28068d16d4
R13: 00000000004c734a R14: 00000000004dcf88 R15: 00000000ffffffff
INFO: task syz-executor.1:12261 blocked for more than 146 seconds.
       Not tainted 5.4.0-rc6 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.1  D28160 12261   8866 0x00000004
Call Trace:
  context_switch kernel/sched/core.c:3384 [inline]
  __schedule+0x94f/0x1e70 kernel/sched/core.c:4069
  schedule+0xd9/0x260 kernel/sched/core.c:4136
  schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4195
  __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
  __mutex_lock+0x7b0/0x13c0 kernel/locking/mutex.c:1103
  mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
  snd_timer_close+0x7e/0x100 sound/core/timer.c:422
  snd_timer_user_release+0x98/0x130 sound/core/timer.c:1478
  __fput+0x2ff/0x890 fs/file_table.c:280
  ____fput+0x16/0x20 fs/file_table.c:313
  task_work_run+0x145/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x316/0x380 arch/x86/entry/common.c:163
  prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
  do_syscall_64+0x65f/0x760 arch/x86/entry/common.c:300
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x413db1
Code: c0 c3 0f 1f 80 00 00 00 00 c7 07 00 00 00 00 31 c0 c3 0f 1f 80 00 00  
00 00 31 c0 c3 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 b8 <2d> f8 ff ff c3  
66 2e 0f 1f 84 00 00 00 00 00 31 c0 c3 66 66 66 66
RSP: 002b:00007ffe3503b380 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000004 RCX: 0000000000413db1
RDX: 0000001b2db20000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 0000000000000001 R08: ffffffffffffffff R09: ffffffffffffffff
R10: 00007ffe3503b460 R11: 0000000000000293 R12: 000000000075c9a0
R13: 000000000075c9a0 R14: 0000000000760a90 R15: 000000000075bf2c
INFO: task syz-executor.5:12267 blocked for more than 147 seconds.
       Not tainted 5.4.0-rc6 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.5  D28552 12267   8870 0x00000004
Call Trace:
  context_switch kernel/sched/core.c:3384 [inline]
  __schedule+0x94f/0x1e70 kernel/sched/core.c:4069
  schedule+0xd9/0x260 kernel/sched/core.c:4136
  schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:4195
  __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
  __mutex_lock+0x7b0/0x13c0 kernel/locking/mutex.c:1103
  mutex_lock_nested+0x16/0x20 kernel/locking/mutex.c:1118
  snd_timer_open+0x98/0x1860 sound/core/timer.c:245
  snd_timer_user_tselect sound/core/timer.c:1728 [inline]
  __snd_timer_user_ioctl.isra.0+0x68b/0x1fd0 sound/core/timer.c:2003
  snd_timer_user_ioctl+0x7a/0xa7 sound/core/timer.c:2033
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xdb6/0x13e0 fs/ioctl.c:696
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:718
  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45a219
Code: Bad RIP value.
RSP: 002b:00007ff76c742c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 000000000045a219
RDX: 0000000020029fcc RSI: 0000000040345410 RDI: 0000000000000003
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ff76c7436d4
R13: 00000000004cf428 R14: 00000000004d9760 R15: 00000000ffffffff

Showing all locks held in the system:
1 lock held by khungtaskd/1070:
  #0: ffffffff88fab340 (rcu_read_lock){....}, at:  
debug_show_all_locks+0x5f/0x27e kernel/locking/lockdep.c:5337
1 lock held by rsyslogd/8724:
  #0: ffff88809ae4bd60 (&f->f_pos_lock){+.+.}, at: __fdget_pos+0xee/0x110  
fs/file.c:801
2 locks held by getty/8813:
  #0: ffff8880a459b090 (&tty->ldisc_sem){++++}, at:  
ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
  #1: ffffc90005f152e0 (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x232/0x1c10 drivers/tty/n_tty.c:2156
2 locks held by getty/8814:
  #0: ffff8880a9021090 (&tty->ldisc_sem){++++}, at:  
ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
  #1: ffffc90005f212e0 (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x232/0x1c10 drivers/tty/n_tty.c:2156
2 locks held by getty/8815:
  #0: ffff8880a818a090 (&tty->ldisc_sem){++++}, at:  
ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
  #1: ffffc90005f192e0 (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x232/0x1c10 drivers/tty/n_tty.c:2156
2 locks held by getty/8816:
  #0: ffff8880a843a090 (&tty->ldisc_sem){++++}, at:  
ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
  #1: ffffc90005f1d2e0 (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x232/0x1c10 drivers/tty/n_tty.c:2156
2 locks held by getty/8817:
  #0: ffff8880a2834090 (&tty->ldisc_sem){++++}, at:  
ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
  #1: ffffc90005f252e0 (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x232/0x1c10 drivers/tty/n_tty.c:2156
2 locks held by getty/8818:
  #0: ffff88809aafe090 (&tty->ldisc_sem){++++}, at:  
ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
  #1: ffffc90005f292e0 (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x232/0x1c10 drivers/tty/n_tty.c:2156
2 locks held by getty/8819:
  #0: ffff8880a514a090 (&tty->ldisc_sem){++++}, at:  
ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
  #1: ffffc90005ef12e0 (&ldata->atomic_read_lock){+.+.}, at:  
n_tty_read+0x232/0x1c10 drivers/tty/n_tty.c:2156
2 locks held by syz-executor.3/12245:
2 locks held by syz-executor.0/12251:
  #0: ffff888082e84550 (&tu->ioctl_lock){+.+.}, at:  
snd_timer_user_release+0x67/0x130 sound/core/timer.c:1476
  #1: ffffffff89914b00 (register_mutex){+.+.}, at:  
snd_timer_close+0x7e/0x100 sound/core/timer.c:422
2 locks held by syz-executor.2/12256:
  #0: ffff88809c005150 (&tu->ioctl_lock){+.+.}, at:  
snd_timer_user_release+0x67/0x130 sound/core/timer.c:1476
  #1: ffffffff89914b00 (register_mutex){+.+.}, at:  
snd_timer_close+0x7e/0x100 sound/core/timer.c:422
2 locks held by syz-executor.4/12266:
  #0: ffff8880a9b93950 (&tu->ioctl_lock){+.+.}, at:  
snd_timer_user_ioctl+0x51/0xa7 sound/core/timer.c:2032
  #1: ffffffff89914b00 (register_mutex){+.+.}, at:  
snd_timer_open+0x98/0x1860 sound/core/timer.c:245
1 lock held by syz-executor.4/12269:
  #0: ffff8880a9b93950 (&tu->ioctl_lock){+.+.}, at:  
snd_timer_user_ioctl+0x51/0xa7 sound/core/timer.c:2032
2 locks held by syz-executor.4/12271:
  #0: ffffffff89924320 (register_mutex#4){+.+.}, at: odev_open+0x5f/0x90  
sound/core/seq/oss/seq_oss.c:124
  #1: ffffffff89914b00 (register_mutex){+.+.}, at:  
snd_timer_open+0x98/0x1860 sound/core/timer.c:245
1 lock held by syz-executor.4/12273:
  #0: ffff888096c8d550 (&tu->ioctl_lock){+.+.}, at:  
snd_timer_user_ioctl+0x51/0xa7 sound/core/timer.c:2032
2 locks held by syz-executor.4/12275:
  #0: ffff888096c8d550 (&tu->ioctl_lock){+.+.}, at:  
snd_timer_user_ioctl+0x51/0xa7 sound/core/timer.c:2032
  #1: ffffffff89914b00 (register_mutex){+.+.}, at:  
snd_timer_open+0x98/0x1860 sound/core/timer.c:245
1 lock held by syz-executor.4/12276:
  #0: ffffffff89924320 (register_mutex#4){+.+.}, at: odev_open+0x5f/0x90  
sound/core/seq/oss/seq_oss.c:124
2 locks held by syz-executor.1/12261:
  #0: ffff88809a826950 (&tu->ioctl_lock){+.+.}, at:  
snd_timer_user_release+0x67/0x130 sound/core/timer.c:1476
  #1: ffffffff89914b00 (register_mutex){+.+.}, at:  
snd_timer_close+0x7e/0x100 sound/core/timer.c:422
2 locks held by syz-executor.5/12267:
  #0: ffff8880970f0950 (&tu->ioctl_lock){+.+.}, at:  
snd_timer_user_ioctl+0x51/0xa7 sound/core/timer.c:2032
  #1: ffffffff89914b00 (register_mutex){+.+.}, at:  
snd_timer_open+0x98/0x1860 sound/core/timer.c:245
1 lock held by syz-executor.5/12270:
  #0: ffff8880970f0950 (&tu->ioctl_lock){+.+.}, at:  
snd_timer_user_ioctl+0x51/0xa7 sound/core/timer.c:2032
1 lock held by syz-executor.5/12272:
  #0: ffffffff89924320 (register_mutex#4){+.+.}, at: odev_open+0x5f/0x90  
sound/core/seq/oss/seq_oss.c:124
1 lock held by syz-executor.5/12274:
  #0: ffff8880a0113d50 (&tu->ioctl_lock){+.+.}, at:  
snd_timer_user_ioctl+0x51/0xa7 sound/core/timer.c:2032
2 locks held by syz-executor.5/12277:
  #0: ffff8880a0113d50 (&tu->ioctl_lock){+.+.}, at:  
snd_timer_user_ioctl+0x51/0xa7 sound/core/timer.c:2032
  #1: ffffffff89914b00 (register_mutex){+.+.}, at:  
snd_timer_open+0x98/0x1860 sound/core/timer.c:245
1 lock held by syz-executor.5/12279:
  #0: ffffffff89924320 (register_mutex#4){+.+.}, at: odev_open+0x5f/0x90  
sound/core/seq/oss/seq_oss.c:124

=============================================

NMI backtrace for cpu 1
CPU: 1 PID: 1070 Comm: khungtaskd Not tainted 5.4.0-rc6 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x172/0x1f0 lib/dump_stack.c:113
  nmi_cpu_backtrace.cold+0x70/0xb2 lib/nmi_backtrace.c:101
  nmi_trigger_cpumask_backtrace+0x23b/0x28b lib/nmi_backtrace.c:62
  arch_trigger_cpumask_backtrace+0x14/0x20 arch/x86/kernel/apic/hw_nmi.c:38
  trigger_all_cpu_backtrace include/linux/nmi.h:146 [inline]
  check_hung_uninterruptible_tasks kernel/hung_task.c:205 [inline]
  watchdog+0x9d0/0xef0 kernel/hung_task.c:289
  kthread+0x361/0x430 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 PID: 12245 Comm: syz-executor.3 Not tainted 5.4.0-rc6 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:rdtsc_ordered arch/x86/include/asm/msr.h:236 [inline]
RIP: 0010:delay_tsc+0x4a/0xc0 arch/x86/lib/delay.c:61
Code: 0f 01 f9 66 90 48 c1 e2 20 48 09 c2 49 89 d4 eb 16 f3 90 bf 01 00 00  
00 e8 03 c2 01 fa e8 de cd f9 fb 44 39 e8 75 36 0f 01 f9 <66> 90 48 c1 e2  
20 48 89 d3 48 09 c3 48 89 d8 4c 29 e0 4c 39 f0 73
RSP: 0018:ffff88808034fc70 EFLAGS: 00000246
RAX: 000000004e0d2263 RBX: 000002d24e0d2178 RCX: 0000000000000000
RDX: 00000000000002d2 RSI: ffffffff8347345c RDI: 0000000000000005
RBP: ffff88808034fc90 R08: ffff8880998302c0 R09: fffffbfff14efd42
R10: fffffbfff14efd41 R11: ffffffff8a77ea0f R12: 000002d24e0d173d
R13: 0000000000000000 R14: 00000000000059d9 R15: ffff88809ccb0108
FS:  0000000000fa4940(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffff600400 CR3: 0000000095a99000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  __delay arch/x86/lib/delay.c:161 [inline]
  __const_udelay+0x59/0x80 arch/x86/lib/delay.c:175
  snd_timer_close_locked+0x22a/0xda0 sound/core/timer.c:369
  snd_timer_close+0x8a/0x100 sound/core/timer.c:423
  snd_timer_user_release+0x98/0x130 sound/core/timer.c:1478
  __fput+0x2ff/0x890 fs/file_table.c:280
  ____fput+0x16/0x20 fs/file_table.c:313
  task_work_run+0x145/0x1c0 kernel/task_work.c:113
  tracehook_notify_resume include/linux/tracehook.h:188 [inline]
  exit_to_usermode_loop+0x316/0x380 arch/x86/entry/common.c:163
  prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
  syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
  do_syscall_64+0x65f/0x760 arch/x86/entry/common.c:300
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x413db1
Code: 75 14 b8 03 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 04 1b 00 00 c3 48  
83 ec 08 e8 0a fc ff ff 48 89 04 24 b8 03 00 00 00 0f 05 <48> 8b 3c 24 48  
89 c2 e8 53 fc ff ff 48 89 d0 48 83 c4 08 48 3d 01
RSP: 002b:00007fff58da8ec0 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000004 RCX: 0000000000413db1
RDX: 0000000000000000 RSI: 0000000000000081 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000760a88 R09: ffffffffffffffff
R10: 00007fff58da8f90 R11: 0000000000000293 R12: 000000000075bf20
R13: 0000000000000003 R14: 0000000000760a90 R15: 000000000075bf2c


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

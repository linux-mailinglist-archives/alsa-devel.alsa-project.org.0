Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C14182E7F8E
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Dec 2020 12:04:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 580901702;
	Thu, 31 Dec 2020 12:03:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 580901702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609412646;
	bh=21//JS6pCWwSJnicHuiX3wP0IP3tcXINj1N2dTfI6Mo=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rjgQjQHCESOVS5Oassezn7Cw8EO6cGXRkZ2W0wlHxiYQ01bPsHu/YBvYCY5xd8jrZ
	 PffQN56cnUAMAStecSgqxruKSL/tz9gmD3AodfERxfJmYUQ/PqkPuZCowJ7RONG8av
	 8jhvK1DZoc/X/tAe7m/hHyzpbSerwz7+X+jqnBsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48F83F804C1;
	Thu, 31 Dec 2020 12:01:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 307C0F8020B; Mon, 28 Dec 2020 19:30:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AD63F80169
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 19:30:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AD63F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="m8sSdmqN"
Received: by mail-wr1-x434.google.com with SMTP id t16so12168083wra.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 10:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=a4dU+e47OqnAVwqK+t6ILXqnpJQPUv0noo041C+YvnQ=;
 b=m8sSdmqNNa4WfSOQy8rip57LDbd/UbB68stEmXNfUEf9EwrEpb0MF5bcu+fdp1CrjB
 vXKRocVdk+3Gdd39gXtZ5oMnsxfPcly1hBpf+z9wvsQMwnAGltjj22ocs/Hjo/1CRxcs
 70BY6lCMYsqxJnqRSsA07P1IbZhFl7RqP1FgXaqr7tp+mtkGaXcZz9KJcKZfPWVBxR4K
 19GqDbFeLvnztL4l/3UPTossUii4xGtxRAJJcmDioGyKFpJgxib0truz7QK6jqYxKbze
 XCrU3D1g8TMf+pift3lpsIBurKX4W49Z5/OclniqTDAZquKvJ9Sp4FAU8kKX7dZNJxCe
 TczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=a4dU+e47OqnAVwqK+t6ILXqnpJQPUv0noo041C+YvnQ=;
 b=ATiudF9JKzcW5kDcFeAQ8tKsa5/Y4TgwgqpEu/OiZMxjGL4CbK5YTsqp/9Ifjg5uE5
 L2ezRdWoiq9cJW9NuDteVxGUH8NDQxCW+e93xpijUuI8qpcEsQeYVGp+H6s8dL0s0y0g
 yvtUYkl94vaOf38dUWRx5Ci/iYZ5P9zxKwogc6NGttf73gj0oRSNNj46I6u7aEyDbC1L
 vPCkwsBx0VCaucuxqdV356BOCChhThculff4yI0wJKJhEAO4UUE99OV4qKPZS4gHz2qA
 64QqqiCvN997rw8DixOzAUySYnH7+YiQW8cF19KbN9Yj/4c4S9DL7Oz3dlhyqiC4v1UJ
 Hw4A==
X-Gm-Message-State: AOAM532Ij6YRuW9YYuUo4hYhf88JuCifgKdssz9nOGaM7YD96L1cExMH
 zAxzb5m146Eq+A4ZG+PVBSiTRHAplw==
X-Google-Smtp-Source: ABdhPJy+Lg7ZeXrqo3OByJeXGn43qJ7wh1KEHeX+MoKV5htO9bDB/Fr+d/Ec6PRUzgxhXlGbtmoMAQ==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr26244223wrr.319.1609180237644; 
 Mon, 28 Dec 2020 10:30:37 -0800 (PST)
Received: from localhost.localdomain ([46.53.251.87])
 by smtp.gmail.com with ESMTPSA id v20sm150200wml.34.2020.12.28.10.30.36
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Dec 2020 10:30:36 -0800 (PST)
Date: Mon, 28 Dec 2020 21:30:35 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [syzbot+7b8f7100327c574c016f@syzkaller.appspotmail.com: INFO: task
 hung in remove_proc_subtree]
Message-ID: <20201228183035.GB38914@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 31 Dec 2020 12:01:40 +0100
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

----- Forwarded message from syzbot <syzbot+7b8f7100327c574c016f@syzkaller.appspotmail.com> -----

From: syzbot <syzbot+7b8f7100327c574c016f@syzkaller.appspotmail.com>
Subject: INFO: task hung in remove_proc_subtree
To: adobriyan@gmail.com, akpm@linux-foundation.org, ebiederm@xmission.com, gladkov.alexey@gmail.com, keescook@chromium.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Date: Wed, 16 Dec 2020 09:54:09 -0800

Hello,

syzbot found the following issue on:

HEAD commit:    7f376f19 Merge tag 'mtd/fixes-for-5.10-rc8' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=102ac937500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3416bb960d5c705d
dashboard link: https://syzkaller.appspot.com/bug?extid=7b8f7100327c574c016f
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=166e240f500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=147eddef500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7b8f7100327c574c016f@syzkaller.appspotmail.com

INFO: task kworker/1:2:8489 blocked for more than 143 seconds.
      Not tainted 5.10.0-rc7-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:2     state:D stack:24264 pid: 8489 ppid:     2 flags:0x00004000
Workqueue: usb_hub_wq hub_event
Call Trace:
 context_switch kernel/sched/core.c:3779 [inline]
 __schedule+0x893/0x2130 kernel/sched/core.c:4528
 schedule+0xcf/0x270 kernel/sched/core.c:4606
 schedule_timeout+0x1d8/0x250 kernel/time/timer.c:1847
 do_wait_for_common kernel/sched/completion.c:85 [inline]
 __wait_for_common kernel/sched/completion.c:106 [inline]
 wait_for_common kernel/sched/completion.c:117 [inline]
 wait_for_completion+0x163/0x260 kernel/sched/completion.c:138
 proc_entry_rundown+0x1a1/0x1d0 fs/proc/inode.c:262
 remove_proc_subtree+0x26f/0x520 fs/proc/generic.c:752
 proc_remove fs/proc/generic.c:775 [inline]
 proc_remove+0x66/0x90 fs/proc/generic.c:772
 snd_info_disconnect+0x946/0xc20 sound/core/info.c:757
 snd_info_disconnect sound/core/info.c:756 [inline]
 snd_info_card_disconnect+0x134/0x230 sound/core/info.c:577
 snd_card_disconnect+0x2be/0x510 sound/core/init.c:421
 usb_audio_disconnect+0x2c4/0x7f0 sound/usb/card.c:877
 usb_unbind_interface+0x1d8/0x8d0 drivers/usb/core/driver.c:458
 __device_release_driver+0x3bd/0x6f0 drivers/base/dd.c:1154
 device_release_driver_internal drivers/base/dd.c:1185 [inline]
 device_release_driver+0x26/0x40 drivers/base/dd.c:1208
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x502/0xec0 drivers/base/core.c:3115
 usb_disable_device+0x35b/0x7b0 drivers/usb/core/message.c:1410
 usb_disconnect.cold+0x27d/0x780 drivers/usb/core/hub.c:2217
 hub_port_connect drivers/usb/core/hub.c:5073 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5362 [inline]
 port_event drivers/usb/core/hub.c:5508 [inline]
 hub_event+0x1c8a/0x42d0 drivers/usb/core/hub.c:5590
 process_one_work+0x933/0x15a0 kernel/workqueue.c:2272
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2418
 kthread+0x3b1/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
INFO: task syz-executor488:14592 blocked for more than 143 seconds.
      Not tainted 5.10.0-rc7-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor488 state:D stack:28144 pid:14592 ppid:  8497 flags:0x00000004
Call Trace:
 context_switch kernel/sched/core.c:3779 [inline]
 __schedule+0x893/0x2130 kernel/sched/core.c:4528
 schedule+0xcf/0x270 kernel/sched/core.c:4606
 schedule_preempt_disabled+0xf/0x20 kernel/sched/core.c:4665
 __mutex_lock_common kernel/locking/mutex.c:1033 [inline]
 __mutex_lock+0x3e2/0x10e0 kernel/locking/mutex.c:1103
 snd_info_text_entry_open+0x80/0x2e0 sound/core/info.c:373
 proc_reg_open+0x25d/0x620 fs/proc/inode.c:538
 do_dentry_open+0x4b9/0x11b0 fs/open.c:817
 do_open fs/namei.c:3252 [inline]
 path_openat+0x1b9a/0x2730 fs/namei.c:3369
 do_filp_open+0x17e/0x3c0 fs/namei.c:3396
 do_sys_openat2+0x16d/0x420 fs/open.c:1168
 do_sys_open fs/open.c:1184 [inline]
 __do_sys_openat fs/open.c:1200 [inline]
 __se_sys_openat fs/open.c:1195 [inline]
 __x64_sys_openat+0x13f/0x1f0 fs/open.c:1195
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x450739
RSP: 002b:00007f4a57aefce8 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 0000000000700028 RCX: 0000000000450739
RDX: 0000000000000001 RSI: 00000000200001c0 RDI: ffffffffffffff9c
RBP: 0000000000700020 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000070002c
R13: 000000000080fbcf R14: 00007f4a57af09c0 R15: 0000000000000000

Showing all locks held in the system:
1 lock held by khungtaskd/1654:
 #0: ffffffff8b3378e0 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x53/0x260 kernel/locking/lockdep.c:6254
1 lock held by in:imklog/8177:
 #0: ffff888012ef1270 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0xe9/0x100 fs/file.c:932
7 locks held by kworker/1:2/8489:
 #0: ffff888014c3fd38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff888014c3fd38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic64_set include/asm-generic/atomic-instrumented.h:856 [inline]
 #0: ffff888014c3fd38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: atomic_long_set include/asm-generic/atomic-long.h:41 [inline]
 #0: ffff888014c3fd38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:616 [inline]
 #0: ffff888014c3fd38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:643 [inline]
 #0: ffff888014c3fd38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x821/0x15a0 kernel/workqueue.c:2243
 #1: ffffc90000e9fda8 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x854/0x15a0 kernel/workqueue.c:2247
 #2: ffff88801c28a218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:731 [inline]
 #2: ffff88801c28a218 (&dev->mutex){....}-{3:3}, at: hub_event+0x1c5/0x42d0 drivers/usb/core/hub.c:5536
 #3: ffff888022bc8218 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:731 [inline]
 #3: ffff888022bc8218 (&dev->mutex){....}-{3:3}, at: usb_disconnect.cold+0x43/0x780 drivers/usb/core/hub.c:2208
 #4: ffff888018ea21a8 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:731 [inline]
 #4: ffff888018ea21a8 (&dev->mutex){....}-{3:3}, at: __device_driver_lock drivers/base/dd.c:975 [inline]
 #4: ffff888018ea21a8 (&dev->mutex){....}-{3:3}, at: device_release_driver_internal drivers/base/dd.c:1182 [inline]
 #4: ffff888018ea21a8 (&dev->mutex){....}-{3:3}, at: device_release_driver+0x1c/0x40 drivers/base/dd.c:1208
 #5: ffffffff8c8ae5e8 (register_mutex#6){+.+.}-{3:3}, at: usb_audio_disconnect+0xe4/0x7f0 sound/usb/card.c:866
 #6: ffffffff8c838028 (info_mutex){+.+.}-{3:3}, at: snd_info_card_disconnect+0x33/0x230 sound/core/info.c:573
1 lock held by syz-executor488/14592:
 #0: ffffffff8c838028 (info_mutex){+.+.}-{3:3}, at: snd_info_text_entry_open+0x80/0x2e0 sound/core/info.c:373

=============================================

NMI backtrace for cpu 1
CPU: 1 PID: 1654 Comm: khungtaskd Not tainted 5.10.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:118
 nmi_cpu_backtrace.cold+0x44/0xd7 lib/nmi_backtrace.c:105
 nmi_trigger_cpumask_backtrace+0x1b3/0x230 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:146 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:209 [inline]
 watchdog+0xd43/0xfa0 kernel/hung_task.c:294
 kthread+0x3b1/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 PID: 27 Comm: kworker/u4:2 Not tainted 5.10.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: phy3 ieee80211_iface_work
RIP: 0010:__lock_acquire+0x372/0x5500 kernel/locking/lockdep.c:4770
Code: ed 44 09 e8 41 81 e7 00 00 03 00 41 c1 e1 13 41 09 c7 89 d8 48 c1 ea 03 c1 e0 12 25 00 00 04 00 41 09 c7 8b 84 24 38 01 00 00 <45> 09 f9 c1 e0 14 41 09 c1 41 8b 44 24 20 25 ff 1f 00 00 41 09 c1
RSP: 0018:ffffc90000e1f890 EFLAGS: 00000006
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 1ffff110021e47c6 RSI: 0000000000000004 RDI: ffff888010f23e34
RBP: ffff888010f23480 R08: 0000000000000001 R09: 0000000000080000
R10: 0000000000000078 R11: 0000000000000000 R12: ffff888010f23e10
R13: 0000000000000000 R14: ffffffff8b3378e0 R15: 0000000000020000
FS:  0000000000000000(0000) GS:ffff8880b9e00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa2708ab000 CR3: 0000000025718000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 lock_acquire kernel/locking/lockdep.c:5437 [inline]
 lock_acquire+0x29d/0x740 kernel/locking/lockdep.c:5402
 rcu_lock_acquire include/linux/rcupdate.h:248 [inline]
 rcu_read_lock include/linux/rcupdate.h:641 [inline]
 cgroup_account_cputime include/linux/cgroup.h:781 [inline]
 update_curr+0x311/0x840 kernel/sched/fair.c:870
 enqueue_entity+0x435/0x2080 kernel/sched/fair.c:4206
 enqueue_task_fair+0x1d8/0x1a70 kernel/sched/fair.c:5502
 enqueue_task kernel/sched/core.c:1572 [inline]
 activate_task kernel/sched/core.c:1591 [inline]
 ttwu_do_activate+0x17f/0x660 kernel/sched/core.c:2511
 ttwu_queue kernel/sched/core.c:2701 [inline]
 try_to_wake_up+0x54c/0x1330 kernel/sched/core.c:2979
 wake_up_worker kernel/workqueue.c:837 [inline]
 process_one_work+0x75a/0x15a0 kernel/workqueue.c:2235
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2418
 kthread+0x3b1/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

----- End forwarded message -----

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A73794EBC96
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 10:20:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46705172C;
	Wed, 30 Mar 2022 10:19:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46705172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648628426;
	bh=fUq/+mmOZNsOhjWjD6SV2wyRpW7Zyntm220DZjq2RWA=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vLj8bJGbmSyH4VQtR4lZg6ExS+7OFWsRLzoZGtcpSToq21wcrX4TJXND2DSow5ENV
	 E8+0bVMIDFggPCzYg6PeCOuzqew8tF3PGEim3C3k8TNO+0rAX9ZrvkNsII9zSqsPgO
	 NrMF7ZqEo3c4xNBK2gxmTw76zXRV4lCRfJ705C0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C40FEF80155;
	Wed, 30 Mar 2022 10:19:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC3C5F80311; Tue, 29 Mar 2022 23:32:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88C73F80121
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 23:32:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88C73F80121
Received: by mail-io1-f70.google.com with SMTP id
 x16-20020a6bfe10000000b006409f03e39eso13234571ioh.7
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 14:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=4j9loJ8jXD5s4BseQWf/XFh+Tz/eRvsXUWIRrC1ynWA=;
 b=ndkIdy6Kmn8Y8F8XycbNEicY9H8B5lwSLXrFBskeY+D3+UjBW9UaCOsgIFRvm9INe7
 yTRw+er3EK3CSPPqowBvnpqbvsAzjiSEe5MZ88tCC6T7zry0FK1vWvsoTi7RLEmWgMyM
 c6Q03e5kpWl4+FjqvY34lIeWGweyBanLA65U3Krq526gj/HSZDKlulozAlLAMAngbKb9
 UJzJvA/MuIXUvxQ6xeAZU/T8D2ttydwxonjjFXsJ0kb/hiA7AT5f41lgV0UH2kPrpj5V
 dchA3CXoLoe9TmeKiJJcaxGzpeOjgmhDmFwAe9w7mR4y/m1kRd5dUwuPoQukJzK19ImH
 YQpA==
X-Gm-Message-State: AOAM531vK3apu7is5tvSWkPZzX2EnjD3cYReiAQfD/5hXZCVEFZZYYan
 Wc0eP3AhhH6lctCazeairByG1AVYxJae19kMVMjVoepYyhnP
X-Google-Smtp-Source: ABdhPJwA9z8yz7Z4VmwcO76rO08RJtbkUuULyVgOjYx4gvUcJq/6SLWyqlcObmLA75sYqPTirf5OtbDlU279s/JBAv0DxsxlVjld
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1945:b0:2c9:90c0:5f42 with SMTP id
 x5-20020a056e02194500b002c990c05f42mr10030408ilu.150.1648589545149; Tue, 29
 Mar 2022 14:32:25 -0700 (PDT)
Date: Tue, 29 Mar 2022 14:32:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000381a0d05db622a81@google.com>
Subject: [syzbot] possible deadlock in __snd_pcm_lib_xfer
From: syzbot <syzbot+6e5c88838328e99c7e1c@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, 
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org, 
 o-takashi@sakamocchi.jp, perex@perex.cz, pierre-louis.bossart@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, syzkaller-bugs@googlegroups.com, 
 tiwai@suse.com, zsm@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 30 Mar 2022 10:19:17 +0200
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

HEAD commit:    8515d05bf6bc Add linux-next specific files for 20220328
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=15c0acc7700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=530c68bef4e2b8a8
dashboard link: https://syzkaller.appspot.com/bug?extid=6e5c88838328e99c7e1c
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14433ca5700000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=163bb77d700000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6e5c88838328e99c7e1c@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
5.17.0-next-20220328-syzkaller #0 Not tainted
------------------------------------------------------
syz-executor329/3588 is trying to acquire lock:
ffff8880243c1d28 (&mm->mmap_lock#2){++++}-{3:3}, at: __might_fault+0xa1/0x170 mm/memory.c:5300

but task is already holding lock:
ffff88801afef230 (&runtime->buffer_mutex){+.+.}-{3:3}, at: wait_for_avail sound/core/pcm_lib.c:1913 [inline]
ffff88801afef230 (&runtime->buffer_mutex){+.+.}-{3:3}, at: __snd_pcm_lib_xfer+0xbca/0x1e20 sound/core/pcm_lib.c:2263

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&runtime->buffer_mutex){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:600 [inline]
       __mutex_lock+0x12f/0x12f0 kernel/locking/mutex.c:733
       snd_pcm_hw_params+0xc9/0x18a0 sound/core/pcm_native.c:705
       snd_pcm_kernel_ioctl+0x164/0x310 sound/core/pcm_native.c:3410
       snd_pcm_oss_change_params_locked+0x14e2/0x3a70 sound/core/oss/pcm_oss.c:976
       snd_pcm_oss_change_params sound/core/oss/pcm_oss.c:1116 [inline]
       snd_pcm_oss_mmap+0x442/0x550 sound/core/oss/pcm_oss.c:2929
       call_mmap include/linux/fs.h:2085 [inline]
       mmap_region+0xba5/0x14a0 mm/mmap.c:1791
       do_mmap+0x863/0xfa0 mm/mmap.c:1582
       vm_mmap_pgoff+0x1b7/0x290 mm/util.c:519
       ksys_mmap_pgoff+0x40d/0x5a0 mm/mmap.c:1628
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x35/0x80 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x44/0xae

-> #0 (&mm->mmap_lock#2){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3096 [inline]
       check_prevs_add kernel/locking/lockdep.c:3219 [inline]
       validate_chain kernel/locking/lockdep.c:3834 [inline]
       __lock_acquire+0x2ac6/0x56c0 kernel/locking/lockdep.c:5060
       lock_acquire kernel/locking/lockdep.c:5672 [inline]
       lock_acquire+0x1ab/0x510 kernel/locking/lockdep.c:5637
       __might_fault mm/memory.c:5301 [inline]
       __might_fault+0x104/0x170 mm/memory.c:5294
       _copy_to_user+0x25/0x140 lib/usercopy.c:28
       copy_to_user include/linux/uaccess.h:160 [inline]
       default_read_copy+0x10f/0x180 sound/core/pcm_lib.c:2013
       __snd_pcm_lib_xfer+0x1517/0x1e20 sound/core/pcm_lib.c:2282
       snd_pcm_oss_read3+0x1c4/0x400 sound/core/oss/pcm_oss.c:1292
       snd_pcm_oss_read2+0x300/0x3f0 sound/core/oss/pcm_oss.c:1503
       snd_pcm_oss_read1 sound/core/oss/pcm_oss.c:1550 [inline]
       snd_pcm_oss_read+0x620/0x7a0 sound/core/oss/pcm_oss.c:2788
       vfs_read+0x1ef/0x5d0 fs/read_write.c:480
       ksys_read+0x127/0x250 fs/read_write.c:620
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x35/0x80 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x44/0xae

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&runtime->buffer_mutex);
                               lock(&mm->mmap_lock#2);
                               lock(&runtime->buffer_mutex);
  lock(&mm->mmap_lock#2);

 *** DEADLOCK ***

1 lock held by syz-executor329/3588:
 #0: ffff88801afef230 (&runtime->buffer_mutex){+.+.}-{3:3}, at: wait_for_avail sound/core/pcm_lib.c:1913 [inline]
 #0: ffff88801afef230 (&runtime->buffer_mutex){+.+.}-{3:3}, at: __snd_pcm_lib_xfer+0xbca/0x1e20 sound/core/pcm_lib.c:2263

stack backtrace:
CPU: 0 PID: 3588 Comm: syz-executor329 Not tainted 5.17.0-next-20220328-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 check_noncircular+0x25f/0x2e0 kernel/locking/lockdep.c:2176
 check_prev_add kernel/locking/lockdep.c:3096 [inline]
 check_prevs_add kernel/locking/lockdep.c:3219 [inline]
 validate_chain kernel/locking/lockdep.c:3834 [inline]
 __lock_acquire+0x2ac6/0x56c0 kernel/locking/lockdep.c:5060
 lock_acquire kernel/locking/lockdep.c:5672 [inline]
 lock_acquire+0x1ab/0x510 kernel/locking/lockdep.c:5637
 __might_fault mm/memory.c:5301 [inline]
 __might_fault+0x104/0x170 mm/memory.c:5294
 _copy_to_user+0x25/0x140 lib/usercopy.c:28
 copy_to_user include/linux/uaccess.h:160 [inline]
 default_read_copy+0x10f/0x180 sound/core/pcm_lib.c:2013
 __snd_pcm_lib_xfer+0x1517/0x1e20 sound/core/pcm_lib.c:2282
 snd_pcm_oss_read3+0x1c4/0x400 sound/core/oss/pcm_oss.c:1292
 snd_pcm_oss_read2+0x300/0x3f0 sound/core/oss/pcm_oss.c:1503
 snd_pcm_oss_read1 sound/core/oss/pcm_oss.c:1550 [inline]
 snd_pcm_oss_read+0x620/0x7a0 sound/core/oss/pcm_oss.c:2788
 vfs_read+0x1ef/0x5d0 fs/read_write.c:480
 ksys_read+0x127/0x250 fs/read_write.c:620
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0x80 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f72068ad0f9
Code: 28 c3 e8 2a 14 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff51e1f1c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f72068ad0f9
RDX: 0000000000000ff2 RSI: 0000000020000780 RDI: 0000000000000004
RBP: 00007f72068710e0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f7206871170
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E0B233F47
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 08:43:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E627E16A9;
	Fri, 31 Jul 2020 08:42:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E627E16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596177826;
	bh=UG9pM/ayo82wuykM1Sn7aY8b01ACCHfoAdDBt6MhylE=;
	h=Date:In-Reply-To:Subject:From:To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sxNUHOYmNSkwYpmqmlLgtFAqOoKFJCQ4gSGUDFtSaqyT+sYrUFDJaRDG8metzM0UE
	 h4d52hmPgn6laQGOohpiYgmupIMADMPB+FO89yXZaU7KV6OK7h/kuFCke4UHPP1AD5
	 vLYdNdVHB8xTmAUK0gINZMp3PWAfis7tTY0qWWZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74037F801D9;
	Fri, 31 Jul 2020 08:41:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA001F8021E; Thu, 30 Jul 2020 05:33:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BC12F8021C
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 05:33:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BC12F8021C
Received: by mail-il1-f198.google.com with SMTP id i78so12977340ill.22
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 20:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=KbGip1BHgD9XLq6bPYmHHar/K64RAZLSHOX1nZvHPZI=;
 b=kJ7MVBcBQ8ZpSntlZ1YE5Ss/usyUBPUAeaRRkLLfHUHXjY+tLNkawVom79swjHebdG
 44JgS8CL+7tDCZt954agPT0FNpr3g/7TlnMFiZHj1SEUivfREPIWiNQTLIlbWP/8f6mB
 LVMpvnUyJ8jw9hLQUKaufbwl9VA+seHbdqVwm+UQaForjT4AJjRGeXuTpOKRUQYUEaoU
 r/246UqpMCGT6dfqBE0yGjLbizjtLrDKQJE8edquSFlRtK7dcHygRGrUEWpntBzfNd1m
 8y4RDIZIuHG67zBEsnKUHXApMXgzrXaX7lwdNAG04fI9hJ1pMze5It+GhQGvZR5OqTYE
 e2gQ==
X-Gm-Message-State: AOAM533R5ML3088hSTpmui7kJ0FgzNBcQj9jL/HjyKG09CiVBHwImLch
 BMwSe+UtIzHw7/FkmW97NETUsLY9SGUk3PvVrFnPlUdM+QHO
X-Google-Smtp-Source: ABdhPJxsZ73DIwsc67on870nIB+pLwRUJ5itTK/M3JCTBlu9PKybLM5mpmhh68mH0jLGe8IgvJEJosVadHUhTONaX5jXgnJQvG09
MIME-Version: 1.0
X-Received: by 2002:a02:820b:: with SMTP id o11mr76134jag.136.1596079994705;
 Wed, 29 Jul 2020 20:33:14 -0700 (PDT)
Date: Wed, 29 Jul 2020 20:33:14 -0700
In-Reply-To: <0000000000007cad8705a9fe70b6@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001e1bcc05aba055d8@google.com>
Subject: Re: KASAN: use-after-free Read in delete_and_unsubscribe_port (2)
From: syzbot <syzbot+1a54a94bd32716796edd@syzkaller.appspotmail.com>
To: alsa-devel-owner@alsa-project.org, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 31 Jul 2020 08:41:06 +0200
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    d3590ebf Merge tag 'audit-pr-20200729' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1207e0b8900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=812bbfcb6ae2cd60
dashboard link: https://syzkaller.appspot.com/bug?extid=1a54a94bd32716796edd
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11b227f8900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1a54a94bd32716796edd@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in list_empty include/linux/list.h:282 [inline]
BUG: KASAN: use-after-free in delete_and_unsubscribe_port+0x8b/0x450 sound/core/seq/seq_ports.c:530
Read of size 8 at addr ffff888098523060 by task syz-executor.0/7202

CPU: 1 PID: 7202 Comm: syz-executor.0 Not tainted 5.8.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1f0/0x31e lib/dump_stack.c:118
 print_address_description+0x66/0x5a0 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report+0x132/0x1d0 mm/kasan/report.c:530
 list_empty include/linux/list.h:282 [inline]
 delete_and_unsubscribe_port+0x8b/0x450 sound/core/seq/seq_ports.c:530
 snd_seq_port_disconnect+0x568/0x610 sound/core/seq/seq_ports.c:612
 snd_seq_ioctl_unsubscribe_port+0x349/0x6c0 sound/core/seq/seq_clientmgr.c:1525
 snd_seq_oss_midi_close+0x397/0x620 sound/core/seq/oss/seq_oss_midi.c:405
 snd_seq_oss_synth_reset+0x335/0x8b0 sound/core/seq/oss/seq_oss_synth.c:406
 snd_seq_oss_reset+0x5b/0x250 sound/core/seq/oss/seq_oss_init.c:435
 snd_seq_oss_ioctl+0x5c2/0x1090 sound/core/seq/oss/seq_oss_ioctl.c:93
 odev_ioctl+0x51/0x70 sound/core/seq/oss/seq_oss.c:174
 vfs_ioctl fs/ioctl.c:48 [inline]
 ksys_ioctl fs/ioctl.c:753 [inline]
 __do_sys_ioctl fs/ioctl.c:762 [inline]
 __se_sys_ioctl+0xf9/0x160 fs/ioctl.c:760
 do_syscall_64+0x73/0xe0 arch/x86/entry/common.c:384
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x45c429
Code: 8d b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 5b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f6e48930c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00000000000154c0 RCX: 000000000045c429
RDX: 0000000000000000 RSI: 0000000000005100 RDI: 0000000000000003
RBP: 000000000078bf38 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000078bf0c
R13: 00007ffe51b9d10f R14: 00007f6e489319c0 R15: 000000000078bf0c

Allocated by task 7202:
 save_stack mm/kasan/common.c:48 [inline]
 set_track mm/kasan/common.c:56 [inline]
 __kasan_kmalloc+0x103/0x140 mm/kasan/common.c:494
 kmem_cache_alloc_trace+0x234/0x300 mm/slab.c:3551
 kmalloc include/linux/slab.h:555 [inline]
 kzalloc include/linux/slab.h:669 [inline]
 snd_seq_port_connect+0x66/0x460 sound/core/seq/seq_ports.c:553
 snd_seq_ioctl_subscribe_port+0x349/0x6c0 sound/core/seq/seq_clientmgr.c:1484
 snd_seq_oss_midi_open+0x4db/0x830 sound/core/seq/oss/seq_oss_midi.c:364
 snd_seq_oss_synth_setup_midi+0x108/0x510 sound/core/seq/oss/seq_oss_synth.c:269
 snd_seq_oss_open+0x899/0xe90 sound/core/seq/oss/seq_oss_init.c:261
 odev_open+0x5e/0x90 sound/core/seq/oss/seq_oss.c:125
 chrdev_open+0x498/0x580 fs/char_dev.c:414
 do_dentry_open+0x813/0x1070 fs/open.c:828
 do_open fs/namei.c:3243 [inline]
 path_openat+0x278d/0x37f0 fs/namei.c:3360
 do_filp_open+0x191/0x3a0 fs/namei.c:3387
 do_sys_openat2+0x463/0x770 fs/open.c:1179
 do_sys_open fs/open.c:1195 [inline]
 __do_sys_openat fs/open.c:1209 [inline]
 __se_sys_openat fs/open.c:1204 [inline]
 __x64_sys_openat+0x1c8/0x1f0 fs/open.c:1204
 do_syscall_64+0x73/0xe0 arch/x86/entry/common.c:384
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Freed by task 7203:
 save_stack mm/kasan/common.c:48 [inline]
 set_track mm/kasan/common.c:56 [inline]
 kasan_set_free_info mm/kasan/common.c:316 [inline]
 __kasan_slab_free+0x114/0x170 mm/kasan/common.c:455
 __cache_free mm/slab.c:3426 [inline]
 kfree+0x10a/0x220 mm/slab.c:3757
 snd_seq_port_disconnect+0x570/0x610 sound/core/seq/seq_ports.c:614
 snd_seq_ioctl_unsubscribe_port+0x349/0x6c0 sound/core/seq/seq_clientmgr.c:1525
 snd_seq_oss_midi_close+0x397/0x620 sound/core/seq/oss/seq_oss_midi.c:405
 snd_seq_oss_synth_reset+0x335/0x8b0 sound/core/seq/oss/seq_oss_synth.c:406
 snd_seq_oss_reset+0x5b/0x250 sound/core/seq/oss/seq_oss_init.c:435
 snd_seq_oss_ioctl+0x5c2/0x1090 sound/core/seq/oss/seq_oss_ioctl.c:93
 odev_ioctl+0x51/0x70 sound/core/seq/oss/seq_oss.c:174
 vfs_ioctl fs/ioctl.c:48 [inline]
 ksys_ioctl fs/ioctl.c:753 [inline]
 __do_sys_ioctl fs/ioctl.c:762 [inline]
 __se_sys_ioctl+0xf9/0x160 fs/ioctl.c:760
 do_syscall_64+0x73/0xe0 arch/x86/entry/common.c:384
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

The buggy address belongs to the object at ffff888098523000
 which belongs to the cache kmalloc-128 of size 128
The buggy address is located 96 bytes inside of
 128-byte region [ffff888098523000, ffff888098523080)
The buggy address belongs to the page:
page:ffffea00026148c0 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0
flags: 0xfffe0000000200(slab)
raw: 00fffe0000000200 ffffea0002613988 ffffea000262c648 ffff8880aa400700
raw: 0000000000000000 ffff888098523000 0000000100000010 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888098522f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888098522f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff888098523000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                       ^
 ffff888098523080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888098523100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


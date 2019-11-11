Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BA3F8C9A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 11:16:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB4EA1670;
	Tue, 12 Nov 2019 11:16:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB4EA1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573553818;
	bh=vII8m13ie2oJ4YQN3WD/oD9Mxp2y6WKSI8+yUrC97pA=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pvZU5MhZKIph2B86WwLXwjC0fsgYq2ci3gaSvrzUHZekF8R+ahTFdmPa1ylf429Ol
	 e/XHbsutGpR1Hsx/uqWONKvbENhYcd+5D+KyJ3nUDGcKZ5bXyIc/6SKn1b/RZNr7Tr
	 bkx+FAnEhVwnST9K6Yrf2aKrWZtgUbFwPYXXhS+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E0C0F805FC;
	Tue, 12 Nov 2019 11:14:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1C8FF804FF; Mon, 11 Nov 2019 17:34:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC894F80275
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 17:34:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC894F80275
Received: by mail-il1-f198.google.com with SMTP id w69so17429587ilk.2
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 08:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=ooaEEcjQYZQ9BsrWRW1Khz9xViSSf6YQxzsWFMf6WQU=;
 b=IF45AcU9MWkKMwpyarAxJ93f7pp04Z2B+7X2LU/bgwV/1gFJ3+FMizcEQGMALHqBf7
 faj0nRtxbLWg7APHiuirkWe0gEuRUJBU3k5qQl1PQFaF/wlJ20jGo0kRU0CVm2vV7z9g
 NaxH3Fvt4yhk9GmUBp6Cwi9rSMVCrF4V6f+R6NzIkemXa9D13oWneF2lAkRQU6b/ZPMJ
 7qC7Dnk+YwNoJoJpmKXcXzUn/3X9O09+12sspYH2yjYVj8bHZ3DaQEOmx90zFs9ryyCy
 +hygMFgqxsST+XXPYDBz8mv4qOE44JXdMGut0thMfz+3FvtjZZ+1+yK307/jDmXv/Zzr
 jmDA==
X-Gm-Message-State: APjAAAVtH/VqHNPWRqaTrarDFsBcxnpTjw0ifOnKmqcG/KuNeWtmIWZM
 y/tePz1Exy/rpP9L5VoP3CdSqTP+yU1oObMq9lnw8rImr6c4
X-Google-Smtp-Source: APXvYqyoarDaLS6lJ4bI+TURCZBTw5+IRtgnAdvuq/tSHY2RA9V8+HS/vn1F0lbwGtcBgApOIN9onlL6p3dp6i4kGQcKbNFxJNm7
MIME-Version: 1.0
X-Received: by 2002:a5e:9706:: with SMTP id w6mr2987651ioj.252.1573490050160; 
 Mon, 11 Nov 2019 08:34:10 -0800 (PST)
Date: Mon, 11 Nov 2019 08:34:10 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007f69a2059714b34d@google.com>
From: syzbot <syzbot+4476917c053f60112c99@syzkaller.appspotmail.com>
To: alexandre.belloni@bootlin.com, allison@lohutok.net, 
 alsa-devel@alsa-project.org, kirr@nexedi.com, linux-kernel@vger.kernel.org, 
 logang@deltatee.com, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
 tglx@linutronix.de, tiwai@suse.com
X-Mailman-Approved-At: Tue, 12 Nov 2019 11:14:25 +0100
Subject: [alsa-devel] KASAN: use-after-free Read in snd_timer_open
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

HEAD commit:    6980b7f6 Add linux-next specific files for 20191111
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=101679e6e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2af7db1972ec750e
dashboard link: https://syzkaller.appspot.com/bug?extid=4476917c053f60112c99
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=108fbfece00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1055d5aae00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+4476917c053f60112c99@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in __list_add_valid+0x9a/0xa0 lib/list_debug.c:26
Read of size 8 at addr ffff88809fccee78 by task syz-executor075/8825

CPU: 0 PID: 8825 Comm: syz-executor075 Not tainted 5.4.0-rc6-next-20191111  
#0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x197/0x210 lib/dump_stack.c:118
  print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
  __kasan_report.cold+0x1b/0x41 mm/kasan/report.c:506
  kasan_report+0x12/0x20 mm/kasan/common.c:634
  __asan_report_load8_noabort+0x14/0x20 mm/kasan/generic_report.c:132
  __list_add_valid+0x9a/0xa0 lib/list_debug.c:26
  __list_add include/linux/list.h:60 [inline]
  list_add_tail include/linux/list.h:93 [inline]
  snd_timer_open+0x245/0x1150 sound/core/timer.c:268
  snd_timer_user_tselect sound/core/timer.c:1738 [inline]
  __snd_timer_user_ioctl.isra.0+0x7ed/0x2070 sound/core/timer.c:2008
  snd_timer_user_ioctl+0x7a/0xa7 sound/core/timer.c:2038
  vfs_ioctl fs/ioctl.c:47 [inline]
  file_ioctl fs/ioctl.c:545 [inline]
  do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
  __do_sys_ioctl fs/ioctl.c:756 [inline]
  __se_sys_ioctl fs/ioctl.c:754 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x444f39
Code: e8 fc ab 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 bb cd fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007ffd1d1e3c98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000444f39
RDX: 0000000020029fcc RSI: 0000000040345410 RDI: 0000000000000003
RBP: 00000000000102a7 R08: 0000000000000004 R09: 00000000004002e0
R10: 000000000000000f R11: 0000000000000246 R12: 0000000000402180
R13: 0000000000402210 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 8824:
  save_stack+0x23/0x90 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:510 [inline]
  __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:483
  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:524
  kmem_cache_alloc_trace+0x158/0x790 mm/slab.c:3551
  kmalloc include/linux/slab.h:556 [inline]
  kzalloc include/linux/slab.h:670 [inline]
  snd_timer_instance_new+0x4a/0x300 sound/core/timer.c:96
  snd_timer_user_tselect sound/core/timer.c:1725 [inline]
  __snd_timer_user_ioctl.isra.0+0x665/0x2070 sound/core/timer.c:2008
  snd_timer_user_ioctl+0x7a/0xa7 sound/core/timer.c:2038
  vfs_ioctl fs/ioctl.c:47 [inline]
  file_ioctl fs/ioctl.c:545 [inline]
  do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
  __do_sys_ioctl fs/ioctl.c:756 [inline]
  __se_sys_ioctl fs/ioctl.c:754 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 8824:
  save_stack+0x23/0x90 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  kasan_set_free_info mm/kasan/common.c:332 [inline]
  __kasan_slab_free+0x102/0x150 mm/kasan/common.c:471
  kasan_slab_free+0xe/0x10 mm/kasan/common.c:480
  __cache_free mm/slab.c:3426 [inline]
  kfree+0x10a/0x2c0 mm/slab.c:3757
  snd_timer_instance_free sound/core/timer.c:120 [inline]
  snd_timer_instance_free+0x7c/0xa0 sound/core/timer.c:114
  snd_timer_user_tselect sound/core/timer.c:1740 [inline]
  __snd_timer_user_ioctl.isra.0+0x160d/0x2070 sound/core/timer.c:2008
  snd_timer_user_ioctl+0x7a/0xa7 sound/core/timer.c:2038
  vfs_ioctl fs/ioctl.c:47 [inline]
  file_ioctl fs/ioctl.c:545 [inline]
  do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
  __do_sys_ioctl fs/ioctl.c:756 [inline]
  __se_sys_ioctl fs/ioctl.c:754 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff88809fccee00
  which belongs to the cache kmalloc-256 of size 256
The buggy address is located 120 bytes inside of
  256-byte region [ffff88809fccee00, ffff88809fccef00)
The buggy address belongs to the page:
page:ffffea00027f3380 refcount:1 mapcount:0 mapping:ffff8880aa4008c0  
index:0x0
flags: 0x1fffc0000000200(slab)
raw: 01fffc0000000200 ffffea00027f2e08 ffff8880aa401648 ffff8880aa4008c0
raw: 0000000000000000 ffff88809fcce000 0000000100000008 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff88809fcced00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff88809fcced80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ffff88809fccee00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                                 ^
  ffff88809fccee80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff88809fccef00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


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

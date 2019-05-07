Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6458170A8
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 08:03:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38CC4181A;
	Wed,  8 May 2019 08:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38CC4181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557295423;
	bh=7njmyQ+PkpUT7GZ6wKyEVI4gjDxzlMWnPr130aYf+bE=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CI9O8fpofwhr7FjvXr4MRpTDWxNxGJvNWZ2S4laMe1pgPezxapPKgpnUbQsVJe57z
	 OLPF4/RJ1C8O+mOA6tfhmuj4AIKL04sOWbZZt/MEiOfP24hMVu/m6+ixlUmAm9sOZe
	 MRIlKyQGV8PLAOxVyjb88KlMoOoVJdnZDMjPlwuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD9C7F896FF;
	Wed,  8 May 2019 08:01:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57AC9F89674; Tue,  7 May 2019 11:42:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-it1-f199.google.com (mail-it1-f199.google.com
 [209.85.166.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B61CBF89671
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 11:42:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B61CBF89671
Received: by mail-it1-f199.google.com with SMTP id y62so14135550itd.6
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 02:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=1kVNvqakmicf7aNhAvhZA1wt0SIlOobV5WRUyLotBRI=;
 b=pVzLjdyhlTRvqJV+EjwMQabm2J9RRZIQZHRF0GHIXwzECfT1C5NKHYB9rEHIyi5BEq
 bPFg8HgL81XDx+k7IxihTCafoUoBJVA/hkdWyfY1Qxxc08oVWKYKnCLRfa5o3F+7my6o
 oWgVpnsIu7zP0Y7Ul7PWi6aDtac6qbhJf58R0BJsx9v2D+aKTv+oVnxZRL3pSD/lF2ch
 vjkFyfLPR0TcEiYa0plXtbTW7+F0B5t0BmvRy1C55CBLCMKBIqiKAfvlrZSFzE+iXAts
 vMX+SEn5FJnA7UQPwQbSwOZe/0hXM+4ndiCCgkWxA8a7FRVZPyrubxJJTxm6iXY0lNKv
 htbw==
X-Gm-Message-State: APjAAAV6TvyLKfGHBsOQXBDBk+Y+AX8VF9NdKw/cnfR8P7noXViDmeOU
 vZXbhvlhqB0tLeW7Rlj5h51webvPXhMChjinE7/R1VlQ+328
X-Google-Smtp-Source: APXvYqz7jnXKDGwwNP7mFFwyRYlU5bTL7KRJHg86d2aVwxwMVJ1zdvvmfFO8Oa41yobcBbvdBiQAMaQlTr5i51dp4kJE3Dg6zGDJ
MIME-Version: 1.0
X-Received: by 2002:a05:660c:ac6:: with SMTP id
 k6mr20929488itl.59.1557222124088; 
 Tue, 07 May 2019 02:42:04 -0700 (PDT)
Date: Tue, 07 May 2019 02:42:04 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008af53105884907e9@google.com>
From: syzbot <syzbot+20ab495fadf081e8a2b0@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, colin.king@canonical.com, 
 linux-kernel@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
 tiwai@suse.com
X-Mailman-Approved-At: Wed, 08 May 2019 08:01:56 +0200
Subject: [alsa-devel] KASAN: use-after-free Write in check_and_subscribe_port
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

HEAD commit:    bf3bd966 Merge tag 'usb-5.1-rc8' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1431a0e0a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ef1b87b455c397cf
dashboard link: https://syzkaller.appspot.com/bug?extid=20ab495fadf081e8a2b0
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+20ab495fadf081e8a2b0@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in __list_add include/linux/list.h:64 [inline]
BUG: KASAN: use-after-free in list_add_tail include/linux/list.h:93 [inline]
BUG: KASAN: use-after-free in check_and_subscribe_port+0x7bd/0x860  
sound/core/seq/seq_ports.c:524
Write of size 8 at addr ffff88809587bba0 by task syz-executor.2/19168

CPU: 0 PID: 19168 Comm: syz-executor.2 Not tainted 5.1.0-rc7+ #95
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x172/0x1f0 lib/dump_stack.c:113
  print_address_description.cold+0x7c/0x20d mm/kasan/report.c:187
  kasan_report.cold+0x1b/0x40 mm/kasan/report.c:317
  __asan_report_store8_noabort+0x17/0x20 mm/kasan/generic_report.c:137
  __list_add include/linux/list.h:64 [inline]
  list_add_tail include/linux/list.h:93 [inline]
  check_and_subscribe_port+0x7bd/0x860 sound/core/seq/seq_ports.c:524
  snd_seq_port_connect+0x388/0x510 sound/core/seq/seq_ports.c:587
  snd_seq_ioctl_subscribe_port+0x1e5/0x310  
sound/core/seq/seq_clientmgr.c:1458
  snd_seq_ioctl+0x224/0x3e0 sound/core/seq/seq_clientmgr.c:2138
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xd6e/0x1390 fs/ioctl.c:696
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:718
  do_syscall_64+0x103/0x610 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x458da9
Code: ad b8 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 7b b8 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f6a5c605c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000458da9
RDX: 0000000020000000 RSI: 0000000040505330 RDI: 0000000000000003
RBP: 000000000073bf00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f6a5c6066d4
R13: 00000000004cc598 R14: 00000000004d5ee8 R15: 00000000ffffffff

Allocated by task 19168:
  save_stack+0x45/0xd0 mm/kasan/common.c:75
  set_track mm/kasan/common.c:87 [inline]
  __kasan_kmalloc mm/kasan/common.c:497 [inline]
  __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:470
  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:511
  kmem_cache_alloc_trace+0x151/0x760 mm/slab.c:3622
  kmalloc include/linux/slab.h:547 [inline]
  kzalloc include/linux/slab.h:742 [inline]
  snd_seq_port_connect+0x60/0x510 sound/core/seq/seq_ports.c:571
  snd_seq_ioctl_subscribe_port+0x1e5/0x310  
sound/core/seq/seq_clientmgr.c:1458
  snd_seq_ioctl+0x224/0x3e0 sound/core/seq/seq_clientmgr.c:2138
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xd6e/0x1390 fs/ioctl.c:696
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:718
  do_syscall_64+0x103/0x610 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 19167:
  save_stack+0x45/0xd0 mm/kasan/common.c:75
  set_track mm/kasan/common.c:87 [inline]
  __kasan_slab_free+0x102/0x150 mm/kasan/common.c:459
  kasan_slab_free+0xe/0x10 mm/kasan/common.c:467
  __cache_free mm/slab.c:3499 [inline]
  kfree+0xcf/0x230 mm/slab.c:3822
  snd_seq_port_disconnect+0x209/0x280 sound/core/seq/seq_ports.c:632
  snd_seq_ioctl_unsubscribe_port+0x1e5/0x310  
sound/core/seq/seq_clientmgr.c:1499
  snd_seq_ioctl+0x224/0x3e0 sound/core/seq/seq_clientmgr.c:2138
  vfs_ioctl fs/ioctl.c:46 [inline]
  file_ioctl fs/ioctl.c:509 [inline]
  do_vfs_ioctl+0xd6e/0x1390 fs/ioctl.c:696
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:713
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:718
  do_syscall_64+0x103/0x610 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff88809587bb40
  which belongs to the cache kmalloc-128 of size 128
The buggy address is located 96 bytes inside of
  128-byte region [ffff88809587bb40, ffff88809587bbc0)
The buggy address belongs to the page:
page:ffffea0002561ec0 count:1 mapcount:0 mapping:ffff8880aa400640  
index:0xffff88809587bd80
flags: 0x1fffc0000000200(slab)
raw: 01fffc0000000200 ffffea0002949788 ffffea0002906888 ffff8880aa400640
raw: ffff88809587bd80 ffff88809587b000 000000010000000f 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff88809587ba80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff88809587bb00: fc fc fc fc fc fc fc fc fb fb fb fb fb fb fb fb
> ffff88809587bb80: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
                                ^
  ffff88809587bc00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff88809587bc80: fc fc fc fc fc fc fc fc 00 00 00 00 00 00 00 00
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

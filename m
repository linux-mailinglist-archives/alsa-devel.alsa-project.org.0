Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B14259C256
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Aug 2019 08:37:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39FCA165F;
	Sun, 25 Aug 2019 08:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39FCA165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566715059;
	bh=UWX+IRxeNK8jdVvhTqVtFbQ0OLbKzfT5Ft/iygpN7aM=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gnrBT/h1xRd5BKJbYo4ELIepwYuO9E+goV8ix0tgk553XMyy9INCAQN30zTw40i3Q
	 cklagcS4wQ17hw+7M1jk9vfxzizsyGidYWfdFsW0RrSMy/3UuUaexJjaR/p7mV6YIn
	 dk4VaZEU5c75ehxEAtmp8hsnCMmdugsZUDL/4Dp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F5A2F805F7;
	Sun, 25 Aug 2019 08:34:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A251F8036E; Thu, 22 Aug 2019 16:53:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AD9CF80112
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 16:53:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AD9CF80112
Received: by mail-io1-f69.google.com with SMTP id q5so6599286iof.19
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 07:53:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=irkebm6L+5PI3JbBiKOkvsnKr96VeZDlVJCniMf5v5Y=;
 b=LD0cKx1Nb2fJJCmYiUAr6d6fvS1GZC7lmZmSrbbUAdBAj5EFSRMJ54cagVaoWDcVEB
 k4soDFQco+1ikmFSmagpiN3XQqd9V+KmY4yXMOjoqSlVWmny7i5aAqcNPLBx+iaEpBHn
 fZ6bicBjpBbT/YKm+pLotmQyBnp7UAFio3bGYzGCyKL11/DMT1ZAIF3SG8sfIMJog28b
 wCR2130qL9+BO1Nyf88OcfIeuR6BxzaNWWR43dlW3ND6lTMxvq/CdIbvWZxdOoZpVApG
 5ZH59bh/gJasT8g7CYnguEiRcRlHdmlxjHzpQHFi1kbVns2PDLklLQLqIIEZ4RPE/8WH
 Z30w==
X-Gm-Message-State: APjAAAX4DWgZ9JuwUNVhBxgGtz1Wq3g1FCKxwjBz8U0albgJQqXzT+Qt
 QYycp4WA8naPkbr8mfIoGeSjmABVNraozdtjuny5OQgHLnf3
X-Google-Smtp-Source: APXvYqz40yLJ32U7FQDXz7vR4WMu40pvb3Wkavt+rlvYvu6Nve6858+HlRd3PrfpCRa4yuA3RK4ABcj6MK1Ab1R+g85VCtyjfMsy
MIME-Version: 1.0
X-Received: by 2002:a6b:7009:: with SMTP id l9mr74713ioc.160.1566485585762;
 Thu, 22 Aug 2019 07:53:05 -0700 (PDT)
Date: Thu, 22 Aug 2019 07:53:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e2a2ac0590b5d81f@google.com>
From: syzbot <syzbot+4a75454b9ca2777f35c7@syzkaller.appspotmail.com>
To: alexandre.belloni@bootlin.com, alsa-devel@alsa-project.org, 
 bhelgaas@google.com, kirr@nexedi.com, linux-kernel@vger.kernel.org, 
 linux@roeck-us.net, logang@deltatee.com, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tglx@linutronix.de, tiwai@suse.com, 
 zsm@chromium.org
X-Mailman-Approved-At: Sun, 25 Aug 2019 08:34:15 +0200
Subject: [alsa-devel] KASAN: use-after-free Read in
	snd_seq_ioctl_get_client_pool
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

HEAD commit:    d1abaeb3 Linux 5.3-rc5
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15b5add2600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f7242b2607d5d53a
dashboard link: https://syzkaller.appspot.com/bug?extid=4a75454b9ca2777f35c7
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+4a75454b9ca2777f35c7@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in atomic_read  
include/asm-generic/atomic-instrumented.h:26 [inline]
BUG: KASAN: use-after-free in snd_seq_unused_cells  
sound/core/seq/seq_memory.h:60 [inline]
BUG: KASAN: use-after-free in snd_seq_ioctl_get_client_pool+0x2e0/0x680  
sound/core/seq/seq_clientmgr.c:1839
Read of size 4 at addr ffff8880a8e27b14 by task syz-executor.5/31741

CPU: 0 PID: 31741 Comm: syz-executor.5 Not tainted 5.3.0-rc5 #82
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x1d8/0x2f8 lib/dump_stack.c:113
  print_address_description+0x75/0x5b0 mm/kasan/report.c:351
  __kasan_report+0x14b/0x1c0 mm/kasan/report.c:482
  kasan_report+0x26/0x50 mm/kasan/common.c:612
  check_memory_region_inline mm/kasan/generic.c:182 [inline]
  check_memory_region+0x2cf/0x2e0 mm/kasan/generic.c:192
  __kasan_check_read+0x11/0x20 mm/kasan/common.c:92
  atomic_read include/asm-generic/atomic-instrumented.h:26 [inline]
  snd_seq_unused_cells sound/core/seq/seq_memory.h:60 [inline]
  snd_seq_ioctl_get_client_pool+0x2e0/0x680  
sound/core/seq/seq_clientmgr.c:1839
  snd_seq_ioctl+0x1d1/0x340 sound/core/seq/seq_clientmgr.c:2158
  do_vfs_ioctl+0x744/0x1730 fs/ioctl.c:46
  ksys_ioctl fs/ioctl.c:713 [inline]
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0xe3/0x120 fs/ioctl.c:718
  do_syscall_64+0xfe/0x140 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x459829
Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007faf5e0c4c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459829
RDX: 00000000200003c0 RSI: 00000000c058534b RDI: 0000000000000003
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007faf5e0c56d4
R13: 00000000004cdc18 R14: 00000000004d7ba8 R15: 00000000ffffffff

Allocated by task 31737:
  save_stack mm/kasan/common.c:69 [inline]
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc+0x11c/0x1b0 mm/kasan/common.c:487
  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:501
  kmem_cache_alloc_trace+0x221/0x2f0 mm/slab.c:3550
  kmalloc include/linux/slab.h:552 [inline]
  kzalloc include/linux/slab.h:748 [inline]
  snd_seq_pool_new+0x53/0x1b0 sound/core/seq/seq_memory.c:459
  snd_seq_fifo_new+0x72/0x1c0 sound/core/seq/seq_fifo.c:26
  snd_seq_open+0x1e4/0x470 sound/core/seq/seq_clientmgr.c:350
  snd_open+0x313/0x380 sound/core/sound.c:163
  chrdev_open+0x509/0x590 fs/char_dev.c:414
  do_dentry_open+0x73b/0xf90 fs/open.c:797
  vfs_open+0x73/0x80 fs/open.c:906
  do_last fs/namei.c:3416 [inline]
  path_openat+0x1397/0x4460 fs/namei.c:3533
  do_filp_open+0x192/0x3d0 fs/namei.c:3563
  do_sys_open+0x29f/0x560 fs/open.c:1089
  __do_sys_open fs/open.c:1107 [inline]
  __se_sys_open fs/open.c:1102 [inline]
  __x64_sys_open+0x87/0x90 fs/open.c:1102
  do_syscall_64+0xfe/0x140 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 31737:
  save_stack mm/kasan/common.c:69 [inline]
  set_track mm/kasan/common.c:77 [inline]
  __kasan_slab_free+0x12a/0x1e0 mm/kasan/common.c:449
  kasan_slab_free+0xe/0x10 mm/kasan/common.c:457
  __cache_free mm/slab.c:3425 [inline]
  kfree+0x115/0x200 mm/slab.c:3756
  snd_seq_pool_delete+0x9e/0xd0 sound/core/seq/seq_memory.c:487
  snd_seq_fifo_resize+0x1de/0x250 sound/core/seq/seq_fifo.c:262
  snd_seq_ioctl_set_client_pool+0x3c4/0x740  
sound/core/seq/seq_clientmgr.c:1880
  snd_seq_ioctl+0x1d1/0x340 sound/core/seq/seq_clientmgr.c:2158
  do_vfs_ioctl+0x744/0x1730 fs/ioctl.c:46
  ksys_ioctl fs/ioctl.c:713 [inline]
  __do_sys_ioctl fs/ioctl.c:720 [inline]
  __se_sys_ioctl fs/ioctl.c:718 [inline]
  __x64_sys_ioctl+0xe3/0x120 fs/ioctl.c:718
  do_syscall_64+0xfe/0x140 arch/x86/entry/common.c:296
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

The buggy address belongs to the object at ffff8880a8e27b00
  which belongs to the cache kmalloc-192 of size 192
The buggy address is located 20 bytes inside of
  192-byte region [ffff8880a8e27b00, ffff8880a8e27bc0)
The buggy address belongs to the page:
page:ffffea0002a389c0 refcount:1 mapcount:0 mapping:ffff8880aa400000  
index:0x0
flags: 0x1fffc0000000200(slab)
raw: 01fffc0000000200 ffffea00026d1008 ffffea0002870048 ffff8880aa400000
raw: 0000000000000000 ffff8880a8e27000 0000000100000010 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8880a8e27a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8880a8e27a80: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
> ffff8880a8e27b00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                          ^
  ffff8880a8e27b80: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
  ffff8880a8e27c00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

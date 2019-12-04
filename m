Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FC71126FB
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 10:20:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41AC81660;
	Wed,  4 Dec 2019 10:20:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41AC81660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575451251;
	bh=V4AM30eYQkECE2YTAyh1aLSN42dv118jfeIU7RHWVl4=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sk70/+c2FLLhCDr05eqig71mGT/8aTgYi8u4D9wDbwyxjyLl2AZ5ydXJaTXvBDSuI
	 /KcSOTHROXKUcXzGlsoY+HmeWM1QvtOBdMaxMP/JmhQuVyNXnZQPqX6sxlYPpzv4tM
	 qNYz8H3QSbvcYM5yJx41r0CEeexkA2xqcOmkA5Ro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08527F801D9;
	Wed,  4 Dec 2019 10:19:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 534C7F801EC; Wed,  4 Dec 2019 09:25:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C523BF8010F
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 09:25:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C523BF8010F
Received: by mail-il1-f198.google.com with SMTP id l13so5309142ils.1
 for <alsa-devel@alsa-project.org>; Wed, 04 Dec 2019 00:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=xR5WgA40E8BOPKf4qd5fJUmP6cRoyoo4UJ5r6074hn8=;
 b=owrRil7ko1OJ3lOb7eRsvQHU9FgLXRcQvxGV5Sd0ih+bIR+8MQW9pqRa6EmIdFPHmD
 uzjLkI0mq5+ohmgRdi9GXS3/xy9GJ4r/VN+hLTZC++g8s6UZOjKcr5dLsrVbdQC4MuLp
 VRHQ1HvqUQfnB+4NSYpX3QjYiFZ0onXvFd0RuMfI5AFC+JY9E9OY+n5ytPU2SEoF+V6v
 cDIzsD6ebv1ugILxC+lfT6aV5hrhw0hlTsdF9yWgwLkT73w/8ziHRhcUMuHnnFK6VZh3
 qoEcx9VNBTWpa9QuSeJP8D4Ky3+UgaJGB5sAfyNNpWfp2Ry3yVkDn704mkqQQ25LdE9h
 oztg==
X-Gm-Message-State: APjAAAV+yEXUCprwEZxP740WGr3voZQ6IOqeqm6xFNIxER3qkcZGiu7n
 7Kduo70cyDSafX4u2rtaY0MENDNQwHGB31RRb0jTwqPkVde2
X-Google-Smtp-Source: APXvYqyOc6oa87Us5ks53P3kXDpiYH+nWSitUPPB+dpT3Y/Gn//ub3pWsT526I8W2a+JsOvnHH3OLLBOojLC8RoVYpUIr5K4N+IX
MIME-Version: 1.0
X-Received: by 2002:a02:5489:: with SMTP id t131mr1905663jaa.40.1575447909716; 
 Wed, 04 Dec 2019 00:25:09 -0800 (PST)
Date: Wed, 04 Dec 2019 00:25:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000055ac40598dc8d46@google.com>
From: syzbot <syzbot+f153bde47a62e0b05f83@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com, tiwai@suse.de
X-Mailman-Approved-At: Wed, 04 Dec 2019 10:19:06 +0100
Subject: [alsa-devel] KASAN: slab-out-of-bounds Read in linear_transfer (3)
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

HEAD commit:    76bb8b05 Merge tag 'kbuild-v5.5' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1416a90ee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dd226651cb0f364b
dashboard link: https://syzkaller.appspot.com/bug?extid=f153bde47a62e0b05f83
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10fe9e41e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1522042ae00000

The bug was bisected to:

commit 65766ee0bf7fe8b3be80e2e1c3ef54ad59b29476
Author: Takashi Iwai <tiwai@suse.de>
Date:   Fri Nov 9 10:59:45 2018 +0000

     ALSA: oss: Use kvzalloc() for local buffer allocations

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1727742ae00000
final crash:    https://syzkaller.appspot.com/x/report.txt?x=14a7742ae00000
console output: https://syzkaller.appspot.com/x/log.txt?x=10a7742ae00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+f153bde47a62e0b05f83@syzkaller.appspotmail.com
Fixes: 65766ee0bf7f ("ALSA: oss: Use kvzalloc() for local buffer  
allocations")

==================================================================
BUG: KASAN: slab-out-of-bounds in memcpy include/linux/string.h:380 [inline]
BUG: KASAN: slab-out-of-bounds in do_convert sound/core/oss/linear.c:48  
[inline]
BUG: KASAN: slab-out-of-bounds in convert sound/core/oss/linear.c:81  
[inline]
BUG: KASAN: slab-out-of-bounds in linear_transfer  
sound/core/oss/linear.c:110 [inline]
BUG: KASAN: slab-out-of-bounds in linear_transfer+0x6de/0x970  
sound/core/oss/linear.c:88
Read of size 1 at addr ffff8880a3eb5540 by task syz-executor567/8984

CPU: 0 PID: 8984 Comm: syz-executor567 Not tainted 5.4.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x197/0x210 lib/dump_stack.c:118
  print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
  __kasan_report.cold+0x1b/0x41 mm/kasan/report.c:506
  kasan_report+0x12/0x20 mm/kasan/common.c:638
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x134/0x1a0 mm/kasan/generic.c:192
  memcpy+0x24/0x50 mm/kasan/common.c:124
  memcpy include/linux/string.h:380 [inline]
  do_convert sound/core/oss/linear.c:48 [inline]
  convert sound/core/oss/linear.c:81 [inline]
  linear_transfer sound/core/oss/linear.c:110 [inline]
  linear_transfer+0x6de/0x970 sound/core/oss/linear.c:88
  snd_pcm_plug_read_transfer+0x197/0x2e0 sound/core/oss/pcm_plugin.c:651
  snd_pcm_oss_read2+0x1f0/0x3f0 sound/core/oss/pcm_oss.c:1460
  snd_pcm_oss_read1 sound/core/oss/pcm_oss.c:1517 [inline]
  snd_pcm_oss_read+0x548/0x6a0 sound/core/oss/pcm_oss.c:2741
  __vfs_read+0x8a/0x110 fs/read_write.c:425
  vfs_read+0x1f0/0x440 fs/read_write.c:461
  ksys_read+0x14f/0x290 fs/read_write.c:587
  __do_sys_read fs/read_write.c:597 [inline]
  __se_sys_read fs/read_write.c:595 [inline]
  __x64_sys_read+0x73/0xb0 fs/read_write.c:595
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x445a99
Code: e8 dc bd 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 cb 11 fc ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f2955880ce8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 00000000006dbc28 RCX: 0000000000445a99
RDX: 0000000000001000 RSI: 0000000020000380 RDI: 0000000000000003
RBP: 00000000006dbc20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006dbc2c
R13: 00007ffd9643eb4f R14: 00007f29558819c0 R15: 20c49ba5e353f7cf

Allocated by task 8984:
  save_stack+0x23/0x90 mm/kasan/common.c:71
  set_track mm/kasan/common.c:79 [inline]
  __kasan_kmalloc mm/kasan/common.c:512 [inline]
  __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:485
  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:526
  __do_kmalloc_node mm/slab.c:3616 [inline]
  __kmalloc_node+0x4e/0x70 mm/slab.c:3623
  kmalloc_node include/linux/slab.h:579 [inline]
  kvmalloc_node+0x68/0x100 mm/util.c:574
  kvmalloc include/linux/mm.h:655 [inline]
  kvzalloc include/linux/mm.h:663 [inline]
  snd_pcm_plugin_alloc+0x585/0x770 sound/core/oss/pcm_plugin.c:70
  snd_pcm_plug_alloc+0x146/0x330 sound/core/oss/pcm_plugin.c:129
  snd_pcm_oss_change_params_locked+0x210f/0x3750  
sound/core/oss/pcm_oss.c:1024
  snd_pcm_oss_change_params+0x7b/0xd0 sound/core/oss/pcm_oss.c:1087
  snd_pcm_oss_get_active_substream+0x136/0x190 sound/core/oss/pcm_oss.c:1104
  snd_pcm_oss_get_rate sound/core/oss/pcm_oss.c:1754 [inline]
  snd_pcm_oss_set_rate sound/core/oss/pcm_oss.c:1746 [inline]
  snd_pcm_oss_ioctl+0x1794/0x33a0 sound/core/oss/pcm_oss.c:2593
  vfs_ioctl fs/ioctl.c:47 [inline]
  file_ioctl fs/ioctl.c:545 [inline]
  do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
  __do_sys_ioctl fs/ioctl.c:756 [inline]
  __se_sys_ioctl fs/ioctl.c:754 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
  entry_SYSCALL_64_after_hwframe+0x49/0xbe

Freed by task 0:
(stack is not available)

The buggy address belongs to the object at ffff8880a3eb5500
  which belongs to the cache kmalloc-64 of size 64
The buggy address is located 0 bytes to the right of
  64-byte region [ffff8880a3eb5500, ffff8880a3eb5540)
The buggy address belongs to the page:
page:ffffea00028fad40 refcount:1 mapcount:0 mapping:ffff8880aa400380  
index:0x0
raw: 00fffe0000000200 ffffea00027da7c8 ffff8880aa401348 ffff8880aa400380
raw: 0000000000000000 ffff8880a3eb5000 0000000100000020 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8880a3eb5400: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
  ffff8880a3eb5480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> ffff8880a3eb5500: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
                                            ^
  ffff8880a3eb5580: 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc
  ffff8880a3eb5600: 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

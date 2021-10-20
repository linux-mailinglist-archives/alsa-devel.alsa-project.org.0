Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6C94350B2
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 18:52:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D537F15DC;
	Wed, 20 Oct 2021 18:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D537F15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634748741;
	bh=NxXC9339z/oc56Eqa6t+1g9jJjO++dHBGmOPvx3Z4Jo=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EH0DiQplHmrCxaPqH5KhA1Wj0yMWdw8/GYyiH0Likvh0p4HgP/QpoUv9Duc4Xlag0
	 2c3ECvlcNfj3lKA3xEowOYx08ovrlpsZUUkjq1aB+oH/vn6VGTLqmjtfQk+Cg+Psbg
	 pzdZr/FHVGKxYsQpOAcKHnY11Ryf7bmUZQC7QyPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D25DF80519;
	Wed, 20 Oct 2021 18:48:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A770BF80229; Wed, 20 Oct 2021 17:38:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A8AAF800ED
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 17:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A8AAF800ED
Received: by mail-io1-f71.google.com with SMTP id
 s18-20020a5d9a12000000b005ddc91c47f4so16037373iol.14
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 08:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=op9MbT3atFRk1mMIWPoA4/rkkY0cGk9as5oHsMvR6d8=;
 b=soruwlKensnsVZ28vGrH/BZbyPMNAi4iVcsf5eLxfWKst9/XqlPYDsAvtbTw/HSecB
 vYiVpjcemPoB5fbWjGC3MoM3sLnquZfbuL80hjwktbs5JSd8bIZwnqvL9IQefHGk1RIu
 /S/6oO5c09kq+b8DUXNQND8KmKrpA6cgWjHV9GMxWswM/DIhAgF8JFnskDmraz76LGme
 XlDwOnv2ihw09fPDBXPR/Q/xREdEaON/TfJZPGIORa5X4rDzQwvpDB78Vfu6smAlwyAZ
 8Q6kB3p/N+4rHBWKj0vN9HQrL/YND/q1rgD1AXLzohwTSV0wKK58K8Hiy4TLITjwbxB6
 oHjw==
X-Gm-Message-State: AOAM530+WqzIe+nDNRTkXAOlVHI+zZ2OQMCnK0PFdHc6b7y/aq7sGjj4
 4cplUd3Vd0EXTEVNAxqMk6DqqP39TiBHUPyDlv7+E1oN7Zlb
X-Google-Smtp-Source: ABdhPJz1+BVgVYWzVQHgg9r5K2xCenviEGLTT1ONr2O2JwUlKmJDvrma81u3XljGdanL/+J1gihFbq9PX9ve0JX9nHAJDPyeqJYd
MIME-Version: 1.0
X-Received: by 2002:a05:6602:1651:: with SMTP id
 y17mr379810iow.114.1634744298546; 
 Wed, 20 Oct 2021 08:38:18 -0700 (PDT)
Date: Wed, 20 Oct 2021 08:38:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000036adc005ceca9175@google.com>
Subject: [syzbot] KASAN: use-after-free Read in snd_mixer_oss_get_volume1
From: syzbot <syzbot+9988f17cf72a1045a189@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, joe@perches.com, 
 lars@metafoo.de, linux-kernel@vger.kernel.org, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 20 Oct 2021 18:48:06 +0200
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

HEAD commit:    8fe31e0995f0 Merge tag 'gpio-fixes-for-v5.15-rc6' of git:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16a58d94b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bab9d35f204746a7
dashboard link: https://syzkaller.appspot.com/bug?extid=9988f17cf72a1045a189
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10251d58b00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17039278b00000

Bisection is inconclusive: the issue happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=167855f4b00000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=157855f4b00000
console output: https://syzkaller.appspot.com/x/log.txt?x=117855f4b00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9988f17cf72a1045a189@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: use-after-free in snd_mixer_oss_get_volume1+0x574/0x610 sound/core/oss/mixer_oss.c:600
Read of size 4 at addr ffff888070afc984 by task syz-executor166/6533

CPU: 0 PID: 6533 Comm: syz-executor166 Not tainted 5.15.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0x6c/0x309 mm/kasan/report.c:256
 __kasan_report mm/kasan/report.c:442 [inline]
 kasan_report.cold+0x83/0xdf mm/kasan/report.c:459
 snd_mixer_oss_get_volume1+0x574/0x610 sound/core/oss/mixer_oss.c:600
 snd_mixer_oss_get_volume sound/core/oss/mixer_oss.c:258 [inline]
 snd_mixer_oss_ioctl1+0x249/0x1880 sound/core/oss/mixer_oss.c:358
 snd_mixer_oss_ioctl_compat+0x45/0x60 sound/core/oss/mixer_oss.c:391
 __do_compat_sys_ioctl+0x1c7/0x290 fs/ioctl.c:972
 do_syscall_32_irqs_on arch/x86/entry/common.c:112 [inline]
 __do_fast_syscall_32+0x65/0xf0 arch/x86/entry/common.c:178
 do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:203
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
RIP: 0023:0xf7f42549
Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
RSP: 002b:00000000ffa708bc EFLAGS: 00000246 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000080254d18
RDX: 0000000000000000 RSI: 0000000003700000 RDI: 0000000001000000
RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000

Allocated by task 6526:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:46 [inline]
 set_alloc_info mm/kasan/common.c:434 [inline]
 ____kasan_kmalloc mm/kasan/common.c:513 [inline]
 ____kasan_kmalloc mm/kasan/common.c:472 [inline]
 __kasan_kmalloc+0xa4/0xd0 mm/kasan/common.c:522
 kmalloc include/linux/slab.h:591 [inline]
 snd_mixer_oss_build_input+0x656/0xe30 sound/core/oss/mixer_oss.c:1093
 snd_mixer_oss_proc_write+0x384/0x5c0 sound/core/oss/mixer_oss.c:1233
 snd_info_text_entry_release+0xfa/0x260 sound/core/info.c:408
 close_pdeo.part.0+0xdc/0x2e0 fs/proc/inode.c:244
 close_pdeo fs/proc/inode.c:563 [inline]
 proc_reg_release+0x2e9/0x360 fs/proc/inode.c:562
 __fput+0x288/0x9f0 fs/file_table.c:280
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 exit_task_work include/linux/task_work.h:32 [inline]
 do_exit+0xbae/0x2a30 kernel/exit.c:825
 do_group_exit+0x125/0x310 kernel/exit.c:922
 __do_sys_exit_group kernel/exit.c:933 [inline]
 __se_sys_exit_group kernel/exit.c:931 [inline]
 __ia32_sys_exit_group+0x3a/0x50 kernel/exit.c:931
 do_syscall_32_irqs_on arch/x86/entry/common.c:112 [inline]
 __do_fast_syscall_32+0x65/0xf0 arch/x86/entry/common.c:178
 do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:203
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c

Freed by task 6531:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
 kasan_set_track+0x1c/0x30 mm/kasan/common.c:46
 kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:360
 ____kasan_slab_free mm/kasan/common.c:366 [inline]
 ____kasan_slab_free mm/kasan/common.c:328 [inline]
 __kasan_slab_free+0xff/0x130 mm/kasan/common.c:374
 kasan_slab_free include/linux/kasan.h:230 [inline]
 slab_free_hook mm/slub.c:1700 [inline]
 slab_free_freelist_hook+0x81/0x190 mm/slub.c:1725
 slab_free mm/slub.c:3483 [inline]
 kfree+0xe4/0x530 mm/slub.c:4543
 snd_mixer_oss_slot_free+0xf3/0x130 sound/core/oss/mixer_oss.c:951
 mixer_slot_clear+0x5a/0xb0 sound/core/oss/mixer_oss.c:959
 snd_mixer_oss_build_input+0x7f0/0xe30 sound/core/oss/mixer_oss.c:1101
 snd_mixer_oss_proc_write+0x384/0x5c0 sound/core/oss/mixer_oss.c:1233
 snd_info_text_entry_release+0xfa/0x260 sound/core/info.c:408
 close_pdeo.part.0+0xdc/0x2e0 fs/proc/inode.c:244
 close_pdeo fs/proc/inode.c:563 [inline]
 proc_reg_release+0x2e9/0x360 fs/proc/inode.c:562
 __fput+0x288/0x9f0 fs/file_table.c:280
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 exit_task_work include/linux/task_work.h:32 [inline]
 do_exit+0xbae/0x2a30 kernel/exit.c:825
 do_group_exit+0x125/0x310 kernel/exit.c:922
 __do_sys_exit_group kernel/exit.c:933 [inline]
 __se_sys_exit_group kernel/exit.c:931 [inline]
 __ia32_sys_exit_group+0x3a/0x50 kernel/exit.c:931
 do_syscall_32_irqs_on arch/x86/entry/common.c:112 [inline]
 __do_fast_syscall_32+0x65/0xf0 arch/x86/entry/common.c:178
 do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:203
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c

The buggy address belongs to the object at ffff888070afc980
 which belongs to the cache kmalloc-96 of size 96
The buggy address is located 4 bytes inside of
 96-byte region [ffff888070afc980, ffff888070afc9e0)
The buggy address belongs to the page:
page:ffffea0001c2bf00 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x70afc
flags: 0xfff00000000200(slab|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000200 ffffea0000725740 0000000700000007 ffff888010c41780
raw: 0000000000000000 0000000000200020 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x12c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY), pid 4486, ts 39889903663, free_ts 39887746705
 prep_new_page mm/page_alloc.c:2424 [inline]
 get_page_from_freelist+0xa72/0x2f80 mm/page_alloc.c:4153
 __alloc_pages+0x1b2/0x500 mm/page_alloc.c:5375
 alloc_pages+0x1a7/0x300 mm/mempolicy.c:2197
 alloc_slab_page mm/slub.c:1763 [inline]
 allocate_slab mm/slub.c:1900 [inline]
 new_slab+0x319/0x490 mm/slub.c:1963
 ___slab_alloc+0x921/0xfe0 mm/slub.c:2994
 __slab_alloc.constprop.0+0x4d/0xa0 mm/slub.c:3081
 slab_alloc_node mm/slub.c:3172 [inline]
 slab_alloc mm/slub.c:3214 [inline]
 __kmalloc+0x305/0x320 mm/slub.c:4387
 kmalloc include/linux/slab.h:596 [inline]
 kzalloc include/linux/slab.h:721 [inline]
 tomoyo_encode2.part.0+0xe9/0x3a0 security/tomoyo/realpath.c:45
 tomoyo_encode2 security/tomoyo/realpath.c:31 [inline]
 tomoyo_encode+0x28/0x50 security/tomoyo/realpath.c:80
 tomoyo_realpath_from_path+0x186/0x620 security/tomoyo/realpath.c:288
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_check_open_permission+0x272/0x380 security/tomoyo/file.c:771
 tomoyo_file_open security/tomoyo/tomoyo.c:311 [inline]
 tomoyo_file_open+0xa3/0xd0 security/tomoyo/tomoyo.c:306
 security_file_open+0x45/0xb0 security/security.c:1634
 do_dentry_open+0x353/0x11d0 fs/open.c:809
 do_open fs/namei.c:3428 [inline]
 path_openat+0x1c9a/0x2740 fs/namei.c:3561
 do_filp_open+0x1aa/0x400 fs/namei.c:3588
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1338 [inline]
 free_pcp_prepare+0x2c5/0x780 mm/page_alloc.c:1389
 free_unref_page_prepare mm/page_alloc.c:3315 [inline]
 free_unref_page+0x19/0x690 mm/page_alloc.c:3394
 __vunmap+0x783/0xb70 mm/vmalloc.c:2621
 free_work+0x58/0x70 mm/vmalloc.c:95
 process_one_work+0x9bf/0x16b0 kernel/workqueue.c:2297
 worker_thread+0x658/0x11f0 kernel/workqueue.c:2444
 kthread+0x3e5/0x4d0 kernel/kthread.c:319
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295

Memory state around the buggy address:
 ffff888070afc880: 00 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc
 ffff888070afc900: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
>ffff888070afc980: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
                   ^
 ffff888070afca00: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
 ffff888070afca80: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
==================================================================
----------------
Code disassembly (best guess):
   0:	03 74 c0 01          	add    0x1(%rax,%rax,8),%esi
   4:	10 05 03 74 b8 01    	adc    %al,0x1b87403(%rip)        # 0x1b8740d
   a:	10 06                	adc    %al,(%rsi)
   c:	03 74 b4 01          	add    0x1(%rsp,%rsi,4),%esi
  10:	10 07                	adc    %al,(%rdi)
  12:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
  16:	10 08                	adc    %cl,(%rax)
  18:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
  1c:	00 00                	add    %al,(%rax)
  1e:	00 00                	add    %al,(%rax)
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:	89 e5                	mov    %esp,%ebp
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
* 2a:	5d                   	pop    %rbp <-- trapping instruction
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	retq
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  39:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D459545C63
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 08:39:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AE361ED8;
	Fri, 10 Jun 2022 08:38:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AE361ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654843152;
	bh=+ypjvZOPotp6hezxmvssRtsqI+MeHvwDESXRTNXznRQ=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dXGxKWyI1DMVp6TPFF43FVGc3OdP4ALWZHvGnZeLaP21AjhaX8Dd5j/N0SNlbSgab
	 9cF/l7PEc98ALa6czKlEef+f0PfARLaCue4yLJdrBryBdBn1DeSCDv8+ejvBCAeidA
	 /StmGylVq2go80MdGfCe+ZBdUns2pJ2tvVA8aWrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F072F804DA;
	Fri, 10 Jun 2022 08:37:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E396F80159; Tue,  7 Jun 2022 18:02:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6BD2F80109
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 18:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6BD2F80109
Received: by mail-il1-f198.google.com with SMTP id
 e4-20020a056e020b2400b002d5509de6f3so2411057ilu.6
 for <alsa-devel@alsa-project.org>; Tue, 07 Jun 2022 09:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=IEUba6C2Ihq/2Tns72RO0/Y4e5C0VkJ5Wuu4phMe/Nw=;
 b=rK41BwueNM8C0q73iwbGj86hXYM22Fz4aQXvRdDQd/lOWaBkOjiBNjM2J0sfQ3yFeK
 +e1R6qwGKJm9CKSfBf2tf7qIyXOzdnZOX8/xUCVxR/pn57vRqVbnLfRNtsDX66LN2xnv
 a6DoUeOG1v7Zm7lNACF0GgPmsrNci+0kcC9U8L8xItl4t26joMtYW3D/ySDrq3p96ms4
 Qlfsuy3udZ0CW2VpD6Qzc0xTSX4mquHGMjec+YYvfinKjg9DkFC0hEPyld5HW+NLFwHe
 FTh5uS0UTJySp28Ox/IjD2RoUzcPO9NlYjV/BTqNej556E7aaY9gIszwaREBXtbpUccj
 NggA==
X-Gm-Message-State: AOAM5301xsL4BiyFuN/u8D2bki/ui0cVhrdh0+WSMDkrj9h0fsSAqjuB
 LXoz5huJQVsWqXJjUoveCdQ9GRn9/ezLDk72ygyVNSz3DXD8
X-Google-Smtp-Source: ABdhPJy5q1ACsUxN+sdx4Eb9gEMdW3zjZTzhvZMXea2Sf3wytVE74zPN96EV78BQ+p3a4t17eqDpDHpSGVvE9P5soTX7jePvhTws
MIME-Version: 1.0
X-Received: by 2002:a92:ca0e:0:b0:2d3:dc52:35e9 with SMTP id
 j14-20020a92ca0e000000b002d3dc5235e9mr16719697ils.44.1654617747402; Tue, 07
 Jun 2022 09:02:27 -0700 (PDT)
Date: Tue, 07 Jun 2022 09:02:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000012b9cf05e0ddb75f@google.com>
Subject: [syzbot] KASAN: use-after-free Write in snd_rawmidi_kernel_write1
From: syzbot <syzbot+8569b906285a4215278d@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 10 Jun 2022 08:37:38 +0200
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

HEAD commit:    952923ddc011 Merge tag 'pull-18-rc1-work.namei' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=158076dbf00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3096247591885bfa
dashboard link: https://syzkaller.appspot.com/bug?extid=8569b906285a4215278d
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8569b906285a4215278d@syzkaller.appspotmail.com

==================================================================
==================================================================
BUG: KASAN: use-after-free in instrument_copy_from_user include/linux/instrumented.h:135 [inline]
BUG: KASAN: use-after-free in _copy_from_user+0x12a/0x170 lib/usercopy.c:15
Write of size 4096 at addr ffff8880280e2000 by task syz-executor.2/8284

CPU: 1 PID: 8284 Comm: syz-executor.2 Not tainted 5.18.0-syzkaller-13842-g952923ddc011 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_address_description.constprop.0.cold+0xeb/0x495 mm/kasan/report.c:313
 print_report mm/kasan/report.c:429 [inline]
 kasan_report.cold+0xf4/0x1c6 mm/kasan/report.c:491
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0x13d/0x180 mm/kasan/generic.c:189
 instrument_copy_from_user include/linux/instrumented.h:135 [inline]
 _copy_from_user+0x12a/0x170 lib/usercopy.c:15
 copy_from_user include/linux/uaccess.h:152 [inline]
 snd_rawmidi_kernel_write1+0x361/0x870 sound/core/rawmidi.c:1486
 snd_rawmidi_write+0x273/0xb90 sound/core/rawmidi.c:1555
 vfs_write+0x269/0xac0 fs/read_write.c:589
 ksys_write+0x1e8/0x250 fs/read_write.c:644
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x46/0xb0
RIP: 0033:0x7fe46fa89109
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fe470c0a168 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fe46fb9bf60 RCX: 00007fe46fa89109
RDX: 00000000fffffd2c RSI: 0000000020000000 RDI: 0000000000000004
RBP: 00007fe46fae308d R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fe4700cfb1f R14: 00007fe470c0a300 R15: 0000000000022000
 </TASK>

Allocated by task 8284:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:45 [inline]
 set_alloc_info mm/kasan/common.c:436 [inline]
 ____kasan_kmalloc mm/kasan/common.c:515 [inline]
 ____kasan_kmalloc mm/kasan/common.c:474 [inline]
 __kasan_kmalloc+0xa9/0xd0 mm/kasan/common.c:524
 kmalloc_node include/linux/slab.h:623 [inline]
 kvmalloc_node+0x3e/0x190 mm/util.c:613
 kvmalloc include/linux/slab.h:750 [inline]
 kvzalloc include/linux/slab.h:758 [inline]
 snd_rawmidi_runtime_create sound/core/rawmidi.c:162 [inline]
 open_substream+0x340/0x8b0 sound/core/rawmidi.c:306
 rawmidi_open_priv+0x591/0x6f0 sound/core/rawmidi.c:357
 snd_rawmidi_open+0x49f/0xb60 sound/core/rawmidi.c:455
 snd_open+0x21f/0x460 sound/core/sound.c:169
 chrdev_open+0x266/0x770 fs/char_dev.c:414
 do_dentry_open+0x4a1/0x11f0 fs/open.c:848
 do_open fs/namei.c:3520 [inline]
 path_openat+0x1c71/0x2910 fs/namei.c:3653
 do_filp_open+0x1aa/0x400 fs/namei.c:3680
 do_sys_openat2+0x16d/0x4c0 fs/open.c:1278
 do_sys_open fs/open.c:1294 [inline]
 __do_sys_openat fs/open.c:1310 [inline]
 __se_sys_openat fs/open.c:1305 [inline]
 __x64_sys_openat+0x13f/0x1f0 fs/open.c:1305
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x46/0xb0

Freed by task 8283:
 kasan_save_stack+0x1e/0x40 mm/kasan/common.c:38
 kasan_set_track+0x21/0x30 mm/kasan/common.c:45
 kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:370
 ____kasan_slab_free mm/kasan/common.c:366 [inline]
 ____kasan_slab_free+0x166/0x1a0 mm/kasan/common.c:328
 kasan_slab_free include/linux/kasan.h:200 [inline]
 slab_free_hook mm/slub.c:1727 [inline]
 slab_free_freelist_hook+0x8b/0x1c0 mm/slub.c:1753
 slab_free mm/slub.c:3507 [inline]
 kfree+0xd6/0x4d0 mm/slub.c:4555
 kvfree+0x42/0x50 mm/util.c:655
 snd_rawmidi_runtime_free sound/core/rawmidi.c:176 [inline]
 close_substream.part.0+0x185/0x720 sound/core/rawmidi.c:528
 close_substream sound/core/rawmidi.c:507 [inline]
 rawmidi_release_priv+0x192/0x270 sound/core/rawmidi.c:547
 snd_rawmidi_release+0x5e/0xf0 sound/core/rawmidi.c:578
 __fput+0x277/0x9d0 fs/file_table.c:317
 task_work_run+0xdd/0x1a0 kernel/task_work.c:177
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:169 [inline]
 exit_to_user_mode_prepare+0x23c/0x250 kernel/entry/common.c:201
 __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
 syscall_exit_to_user_mode+0x19/0x50 kernel/entry/common.c:294
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x46/0xb0

The buggy address belongs to the object at ffff8880280e2000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 0 bytes inside of
 4096-byte region [ffff8880280e2000, ffff8880280e3000)

The buggy address belongs to the physical page:
page:ffffea0000a03800 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x280e0
head:ffffea0000a03800 order:3 compound_mapcount:0 compound_pincount:0
flags: 0xfff00000010200(slab|head|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000010200 dead000000000100 dead000000000122 ffff888011842140
raw: 0000000000000000 0000000000040004 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0x1d2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC|__GFP_HARDWALL), pid 3912, tgid 3912 (udevd), ts 388242276639, free_ts 388232231340
 prep_new_page mm/page_alloc.c:2456 [inline]
 get_page_from_freelist+0x1290/0x3b70 mm/page_alloc.c:4198
 __alloc_pages+0x1c7/0x510 mm/page_alloc.c:5426
 alloc_pages+0x1aa/0x310 mm/mempolicy.c:2272
 alloc_slab_page mm/slub.c:1797 [inline]
 allocate_slab+0x26c/0x3c0 mm/slub.c:1942
 new_slab mm/slub.c:2002 [inline]
 ___slab_alloc+0x985/0xd90 mm/slub.c:3002
 __slab_alloc.constprop.0+0x4d/0xa0 mm/slub.c:3089
 slab_alloc_node mm/slub.c:3180 [inline]
 slab_alloc mm/slub.c:3222 [inline]
 __kmalloc+0x318/0x350 mm/slub.c:4413
 kmalloc include/linux/slab.h:605 [inline]
 tomoyo_realpath_from_path+0xc3/0x620 security/tomoyo/realpath.c:254
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_check_open_permission+0x272/0x380 security/tomoyo/file.c:771
 tomoyo_file_open security/tomoyo/tomoyo.c:320 [inline]
 tomoyo_file_open+0x9d/0xc0 security/tomoyo/tomoyo.c:315
 security_file_open+0x45/0xb0 security/security.c:1645
 do_dentry_open+0x349/0x11f0 fs/open.c:835
 do_open fs/namei.c:3520 [inline]
 path_openat+0x1c71/0x2910 fs/namei.c:3653
 do_filp_open+0x1aa/0x400 fs/namei.c:3680
 do_sys_openat2+0x16d/0x4c0 fs/open.c:1278
 do_sys_open fs/open.c:1294 [inline]
 __do_sys_openat fs/open.c:1310 [inline]
 __se_sys_openat fs/open.c:1305 [inline]
 __x64_sys_openat+0x13f/0x1f0 fs/open.c:1305
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1371 [inline]
 free_pcp_prepare+0x549/0xd20 mm/page_alloc.c:1421
 free_unref_page_prepare mm/page_alloc.c:3343 [inline]
 free_unref_page+0x19/0x6a0 mm/page_alloc.c:3438
 __unfreeze_partials+0x17c/0x1a0 mm/slub.c:2521
 qlink_free mm/kasan/quarantine.c:168 [inline]
 qlist_free_all+0x6a/0x170 mm/kasan/quarantine.c:187
 kasan_quarantine_reduce+0x180/0x200 mm/kasan/quarantine.c:294
 __kasan_slab_alloc+0xa2/0xc0 mm/kasan/common.c:446
 kasan_slab_alloc include/linux/kasan.h:224 [inline]
 slab_post_alloc_hook mm/slab.h:750 [inline]
 slab_alloc_node mm/slub.c:3214 [inline]
 slab_alloc mm/slub.c:3222 [inline]
 __kmalloc+0x200/0x350 mm/slub.c:4413
 kmalloc include/linux/slab.h:605 [inline]
 kzalloc include/linux/slab.h:733 [inline]
 tomoyo_encode2.part.0+0xe9/0x3a0 security/tomoyo/realpath.c:45
 tomoyo_encode2 security/tomoyo/realpath.c:31 [inline]
 tomoyo_encode+0x28/0x50 security/tomoyo/realpath.c:80
 tomoyo_realpath_from_path+0x186/0x620 security/tomoyo/realpath.c:288
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_check_open_permission+0x272/0x380 security/tomoyo/file.c:771
 tomoyo_file_open security/tomoyo/tomoyo.c:320 [inline]
 tomoyo_file_open+0x9d/0xc0 security/tomoyo/tomoyo.c:315
 security_file_open+0x45/0xb0 security/security.c:1645
 do_dentry_open+0x349/0x11f0 fs/open.c:835
 do_open fs/namei.c:3520 [inline]
 path_openat+0x1c71/0x2910 fs/namei.c:3653
 do_filp_open+0x1aa/0x400 fs/namei.c:3680

Memory state around the buggy address:
 ffff8880280e1f00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880280e1f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff8880280e2000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff8880280e2080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880280e2100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

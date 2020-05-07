Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE0E1C859C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 11:25:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE47517F5;
	Thu,  7 May 2020 11:24:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE47517F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588843501;
	bh=/m93O0NLOn+0BX1suSqPt2PpXTI/oRlya560DYBKHUg=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QE39vHz1Zp7TXu9jODolQsQl9NfljwVZQksWrqI9MyYyi639ajxqygJEM9Wrh729s
	 s0ZcXDh72uYTNbimNeUcl2g/vsYv0mCKVgPPpBHLnDwDNvK35/FtDfGQEQo98POtKp
	 g1L4W7Kp1ddMZHZuQuNmCc4q1x9ZTHqPO/M4tXm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3071F8015B;
	Thu,  7 May 2020 11:23:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52695F8015F; Thu,  7 May 2020 09:54:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 690B8F800AD
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 09:54:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 690B8F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SgpmOrWI"
Received: by mail-lj1-x242.google.com with SMTP id b2so5260104ljp.4
 for <alsa-devel@alsa-project.org>; Thu, 07 May 2020 00:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Te5QH27IDLyZGryYdrTT/REPxDH93svTizKDW5PkKH4=;
 b=SgpmOrWI/7YXJOegjqyG4yyYJDYE1CCc5hYJpBwA9qk7FwSib04VyHQXx1cjuKxMrZ
 WsGQq0pNSclIlnk0Fg37OqMQ4V76IS+iZLlVORCYmMHLOo5pzWnPJ+7cCaYCBXuuFIlK
 +hHHndfcutLr0dbgXHsQkOKwZEwEZZnO8LnvgA+oF0zplfRi7QoZC/GDygZAE0VmAPrE
 uTdtbA1eMMmQObeUeZGX09uYSe4JdWjB2rpAiVE1jVXqYZZmc52olEIT5TbmfqUoHltT
 YclHk4kc20nhZvE9TCONMPZi9IAhVMhfLzV8u1gwWL1wnEDL+Na1WmMvDxoF8hEOVFcs
 VmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Te5QH27IDLyZGryYdrTT/REPxDH93svTizKDW5PkKH4=;
 b=HZ03ZFX+R2aeyWV1Q4Ozjdd97hFJ6H23K25ps3oC4sQlDTxvS1Z+Ap2IbV5CkCf7n+
 A3Qb2NIEX2HRMUYynwfy8mYIZqz5FootTkyaLiM9LqxKnStEOuOXbIu91pkIr0XkGiwr
 L8Z5RM9KM74WAKIto6F3ElKMMZVxc4BbL8umxJNGoq9usy7VB30xu6960ZD3x7wu9IcF
 ZKGELiwl4tSrvb00Waxry8QwYgNgKpTYgCrEMvH922kRVfdgrnWdzXAmyJRuxffe3JAu
 9VkZ3OLNZHQNEaylCPdsJR0YL3+plt9MMD5BtHzu3IiAK9zlIMCmqKMoyFJT+K6m3qsA
 jhLA==
X-Gm-Message-State: AGi0Pua6NYYe7Bji62XpY/9ePugt72W4De65ksK5opNeEMfxWipi2Hug
 pbu6qJFIrqoOy0wYHsiJ2cTKAmZ2zMFcEigpfFY=
X-Google-Smtp-Source: APiQypJWAxrgsb2y9fpR/ieEuCXUPX20OATjLg/RiHudQfbtW/vblaujs4aDWtLH/3o1uLiZ+l/QIoR0R7HxeEF51A8=
X-Received: by 2002:a2e:3c10:: with SMTP id j16mr7455037lja.2.1588838085043;
 Thu, 07 May 2020 00:54:45 -0700 (PDT)
MIME-Version: 1.0
From: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Date: Thu, 7 May 2020 15:54:34 +0800
Message-ID: <CAFcO6XMWpUVK_yzzCpp8_XP7+=oUpQvuBeCbMffEDkpe8jWrfg@mail.gmail.com>
Subject: KASAN: use-after-free Write in snd_rawmidi_kernel_write1
To: security@kernel.org
X-Mailman-Approved-At: Thu, 07 May 2020 11:23:17 +0200
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org, syzkaller <syzkaller@googlegroups.com>,
 tiwai@suse.com, linux-kernel@vger.kernel.org
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

I report a bug (in linux-5.7-rc1) found by syzkaller.

kernel config:
https://github.com/butterflyhack/syzkaller-fuzz/blob/master/v5.7.0-rc1.config
reproducer:
https://github.com/butterflyhack/syzkaller-fuzz/blob/master/repro.cprog

I test the reproducer in linux-5.7-rc4 and crash too.

crash log:
==================================================================
BUG: KASAN: use-after-free in _copy_from_user+0x113/0x1a0 lib/usercopy.c:13
Write of size 1 at addr ffff888069da43ca by task syz-executor611/6797

CPU: 0 PID: 6797 Comm: syz-executor611 Not tainted 5.7.0-rc1 #3
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1ubuntu1
04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x188/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x347 mm/kasan/report.c:382
 __kasan_report.cold+0x35/0x4d mm/kasan/report.c:511
 kasan_report+0x33/0x50 mm/kasan/common.c:625
 check_memory_region_inline mm/kasan/generic.c:187 [inline]
 check_memory_region+0x141/0x190 mm/kasan/generic.c:193
 _copy_from_user+0x113/0x1a0 lib/usercopy.c:13
 copy_from_user include/linux/uaccess.h:144 [inline]
 snd_rawmidi_kernel_write1+0x320/0x6f0 sound/core/rawmidi.c:1363
 snd_rawmidi_write+0x2e4/0xb80 sound/core/rawmidi.c:1429
 __vfs_write+0x76/0x100 fs/read_write.c:495
 vfs_write+0x268/0x5d0 fs/read_write.c:559
 ksys_write+0x1ee/0x250 fs/read_write.c:612
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3
RIP: 0033:0x4553a9
Code: 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff
ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f556b7f5cc8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00000000006d9588 RCX: 00000000004553a9
RDX: 00000000fffffc85 RSI: 0000000020000040 RDI: 0000000000000004
RBP: 00000000006d9580 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000006d958c
R13: 0000000000000000 R14: 00000000006d9580 R15: 00007fff34bcb390

Allocated by task 6797:
 save_stack+0x1b/0x40 mm/kasan/common.c:49
 set_track mm/kasan/common.c:57 [inline]
 __kasan_kmalloc mm/kasan/common.c:495 [inline]
 __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:468
 kmalloc_node include/linux/slab.h:578 [inline]
 kvmalloc_node+0x61/0xf0 mm/util.c:574
 kvmalloc include/linux/mm.h:757 [inline]
 kvzalloc include/linux/mm.h:765 [inline]
 snd_rawmidi_runtime_create sound/core/rawmidi.c:141 [inline]
 open_substream+0x33d/0x880 sound/core/rawmidi.c:285
 rawmidi_open_priv+0x58e/0x6e0 sound/core/rawmidi.c:336
 snd_rawmidi_open+0x455/0xb20 sound/core/rawmidi.c:433
 snd_open+0x212/0x3d0 sound/core/sound.c:163
 chrdev_open+0x219/0x5c0 fs/char_dev.c:414
 do_dentry_open+0x4ba/0x1290 fs/open.c:797
 do_open fs/namei.c:3229 [inline]
 path_openat+0x1e59/0x27d0 fs/namei.c:3346
 do_filp_open+0x192/0x260 fs/namei.c:3373
 do_sys_openat2+0x585/0x7d0 fs/open.c:1148
 do_sys_open+0xc3/0x140 fs/open.c:1164
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3

Freed by task 6798:
 save_stack+0x1b/0x40 mm/kasan/common.c:49
 set_track mm/kasan/common.c:57 [inline]
 kasan_set_free_info mm/kasan/common.c:317 [inline]
 __kasan_slab_free+0x126/0x170 mm/kasan/common.c:456
 slab_free_hook mm/slub.c:1445 [inline]
 slab_free_freelist_hook+0xc4/0x1c0 mm/slub.c:1478
 slab_free mm/slub.c:3035 [inline]
 kfree+0xd8/0x330 mm/slub.c:4003
 kvfree+0x42/0x50 mm/util.c:603
 resize_runtime_buffer+0x29e/0x370 sound/core/rawmidi.c:677
 snd_rawmidi_output_params+0x128/0x170 sound/core/rawmidi.c:690
 snd_rawmidi_ioctl+0x544/0x5b0 sound/core/rawmidi.c:841
 vfs_ioctl fs/ioctl.c:47 [inline]
 ksys_ioctl+0x11a/0x180 fs/ioctl.c:763
 __do_sys_ioctl fs/ioctl.c:772 [inline]
 __se_sys_ioctl fs/ioctl.c:770 [inline]
 __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:770
 do_syscall_64+0xf6/0x7d0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3

The buggy address belongs to the object at ffff888069da4000
 which belongs to the cache kmalloc-4k of size 4096
The buggy address is located 970 bytes inside of
 4096-byte region [ffff888069da4000, ffff888069da5000)
The buggy address belongs to the page:
page:ffffea0001a76800 refcount:1 mapcount:0 mapping:00000000c136e8e7
index:0x0 head:ffffea0001a76800 order:3 compound_mapcount:0
compound_pincount:0
flags: 0xfffe0000010200(slab|head)
raw: 00fffe0000010200 dead000000000100 dead000000000122 ffff88806bc0c280
raw: 0000000000000000 0000000080040004 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888069da4280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888069da4300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888069da4380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                              ^
 ffff888069da4400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888069da4480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================

Regards,
   butt3rflyh4ck

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2182B6A195E
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 11:02:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 158FC82B;
	Fri, 24 Feb 2023 11:01:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 158FC82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677232935;
	bh=VwfKSeFIkeFcqNh7PHZP+Prwek31m9Idb1O4s83BLqA=;
	h=Date:Subject:From:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DTnXff7b9qDBcZs6jNdnnCGO3IDBU6mOsdExM3j7RUIexA49BaFcoSlf1EXANwNtW
	 fEuaGTFvyqmKln6SOlkYhEGvhlgbhhHTzZpV7B1IdECZNeAoVqhgxOPmzqCTQ85aof
	 uTl7TelDtRL2Iy38p/JN4oaZdTl6oVG8Ay17bXG8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E86E4F80529;
	Fri, 24 Feb 2023 11:00:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7ABADF80496; Thu, 23 Feb 2023 15:48:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com
 [209.85.166.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75662F800BA
	for <alsa-devel@alsa-project.org>; Thu, 23 Feb 2023 15:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75662F800BA
Received: by mail-io1-f77.google.com with SMTP id
 u25-20020a5ec019000000b00733ef3dabe3so6730601iol.14
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Feb 2023 06:48:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=COE5VwF/vvKFFOC9oJDqmFgQgL4RUw4zQOyKGtZlhGs=;
        b=BapsqKsfJHg/n/ruEHw5tGoH3awH49qjek7IXItGpfau59TTewH1EwV8S0BfecA20F
         7HkTCm2YV4AVcHh4CvOZ4tWvkXqIhbuu4luS8Z0vVLBdQBZHwO0K37nV0PsgmIsVL6eC
         0gz2s3dZPifTN2ZSSXfP9lYDsfkvwDmdZWO/l30sn8ZpsSi3pKHEgxK70i28PzXXVu38
         mWAtkfIg+Eb/Dcn2FqS0Y1U8NaSWxcWl4TJJF8Tu/mxQrqkOiro7UpCANKiL6cJHlHrn
         a4ZJ0629lBapl+dztvNGdVRAljvSDaoLaOPf7l1Cn27Lhh+sxMZ0q0YiypeQj8chmp74
         t38Q==
X-Gm-Message-State: AO0yUKX5y+TVjS480mLfecCNGuxR+/0DvqMI1frNXyeLINSkFlB9ouF/
	vtIMppqO0wAGVOoAHyJiSXdbDxIQ8PXsw16drxcAvQSncqK3xIQVhw==
X-Google-Smtp-Source: 
 AK7set+cp4vBf5gxEHJljUKC6PZeXjk8NWZOZ5TMcY6Ftg14mLXfwKYV0YCZhraunCEp7iYnXqBCba60JPUBW0xphAepjsQl/b4R
MIME-Version: 1.0
X-Received: by 2002:a05:6638:cd0:b0:3c4:88de:524 with SMTP id
 e16-20020a0566380cd000b003c488de0524mr5019123jak.3.1677163714245; Thu, 23 Feb
 2023 06:48:34 -0800 (PST)
Date: Thu, 23 Feb 2023 06:48:34 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006afabd05f55f1b51@google.com>
Subject: [syzbot] [alsa?] kernel BUG in __vunmap
From: syzbot <syzbot+656c0cde55a9d107a76f@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz,
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: 
 3wnz3YwkbAL8x34pfqqjwfuuni.lttlqjzxjwhtsyjsy.htr@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WLFVDZFGR3TGREFGEIKIYLJZXFDSONKV
X-Message-ID-Hash: WLFVDZFGR3TGREFGEIKIYLJZXFDSONKV
X-Mailman-Approved-At: Fri, 24 Feb 2023 10:00:14 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WLFVDZFGR3TGREFGEIKIYLJZXFDSONKV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

syzbot found the following issue on:

HEAD commit:    a5541c0811a0 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=12b4018b880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cbd4e584773e9397
dashboard link: https://syzkaller.appspot.com/bug?extid=656c0cde55a9d107a76f
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4b7702208fb9/disk-a5541c08.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9ec0153ec051/vmlinux-a5541c08.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6f8725ad290a/Image-a5541c08.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+656c0cde55a9d107a76f@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at mm/vmalloc.c:2707!
Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
Modules linked in:
CPU: 1 PID: 9210 Comm: syz-executor.0 Not tainted 6.1.0-rc8-syzkaller-33330-ga5541c0811a0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : __vunmap+0x488/0x4cc mm/vmalloc.c:2707
lr : __vunmap+0x488/0x4cc mm/vmalloc.c:2707
sp : ffff800013d73ba0
x29: ffff800013d73bb0 x28: 00000000000c0002 x27: 0000000000002000
x26: ffff0000c5a44d68 x25: ffff0000c6a14080 x24: ffff00012b5ed000
x23: 0000000000000001 x22: 0000000000000200 x21: 0000000000000000
x20: ffff80000cbdd3b4 x19: ffff0001268cfa00 x18: 0000000000000000
x17: 0000000000000000 x16: ffff80000dbe6158 x15: ffff000114e01a40
x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
x11: ff808000084b647c x10: 0000000000000000 x9 : ffff8000084b647c
x8 : ffff000114e01a40 x7 : ffff8000084bf4d4 x6 : 0000000000000000
x5 : 0000000000000080 x4 : 0000000000000000 x3 : 0000000000000000
x2 : 0000000000000000 x1 : ffff80000cbaae40 x0 : 0000000000000000
Call trace:
 __vunmap+0x488/0x4cc mm/vmalloc.c:2707
 __vfree mm/vmalloc.c:2761 [inline]
 vfree+0xb0/0xfc mm/vmalloc.c:2792
 snd_dma_vmalloc_free+0x20/0x30 sound/core/memalloc.c:356
 snd_dma_free_pages+0x84/0xc0 sound/core/memalloc.c:127
 do_free_pages sound/core/pcm_memory.c:65 [inline]
 snd_pcm_lib_free_pages+0xa0/0x12c sound/core/pcm_memory.c:471
 do_hw_free sound/core/pcm_native.c:876 [inline]
 snd_pcm_release_substream+0x15c/0x1dc sound/core/pcm_native.c:2705
 snd_pcm_oss_release_file sound/core/oss/pcm_oss.c:2413 [inline]
 snd_pcm_oss_release+0x98/0x130 sound/core/oss/pcm_oss.c:2592
 __fput+0x198/0x3e4 fs/file_table.c:320
 ____fput+0x20/0x30 fs/file_table.c:348
 task_work_run+0x100/0x148 kernel/task_work.c:179
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 do_notify_resume+0x174/0x1f0 arch/arm64/kernel/signal.c:1132
 prepare_exit_to_user_mode arch/arm64/kernel/entry-common.c:137 [inline]
 exit_to_user_mode arch/arm64/kernel/entry-common.c:142 [inline]
 el0_svc+0x9c/0x150 arch/arm64/kernel/entry-common.c:638
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584
Code: 17ffff1f 97f7c16d 17ffff18 97f7c16b (d4210000) 
---[ end trace 0000000000000000 ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

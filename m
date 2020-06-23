Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5976C206EB6
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 10:10:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED2C717CE;
	Wed, 24 Jun 2020 10:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED2C717CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592986240;
	bh=mEBuL1qI7v2oN4tDrbJZDW/UTkBKrmZOl0RLoc+mSjk=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C6zxfM915+bCTeJvqfHamzbdu9nozPyL3mVa5GPpFLQLLH8FZZY7c/anEcEBWmMlN
	 T86QAhyk1HaR8J5a9k8NMSWpvsqEegqx41LR2+KkZoS5KQFswHSu5tfvshwiRhYJy9
	 kNjvNutNrHDHi6fBaULnh4ogPOVwk4fR0k96m8l4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D80D5F8045E;
	Wed, 24 Jun 2020 09:50:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8D13F80234; Tue, 23 Jun 2020 21:47:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FROM_LOCAL_DIGITS,
 FROM_LOCAL_HEX, HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9555AF8010E
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 21:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9555AF8010E
Received: by mail-io1-f69.google.com with SMTP id x22so862525ion.18
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 12:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=KCtwlgZ+RKZk2rijKadVPUxLfAiSocZDUn+/oj8K6OM=;
 b=lsREqs3sL2jT4AOqJNFLHR4fhwcj4IJpNrD0HZ70IIM6ZiBOWBN5gAMianPoqjsTcV
 ciDUND6wNmiJErsQnJ6rgOWyBKOt8FSLFKFs4xBg/58OANR7fjpDPq2w5PqyR4mWa5ax
 u+rk5T+gh7D+gEGZKXXyOVFHbG31qOJDgQ5pLUmgfMtqs7w+LrBFjh22UlniX1HuvmBJ
 Epjc3HO0KXVD1hXbdfyniO5SCKdcIkoyYH/ByhwMrKSedIu03CP4djftf9knz4inj6fn
 4287KkSOQ/Bk+gvjlEtuFk7Viist8zdWZ2uvDUIeoEXa21wgRJzenr0K3B10LOzB7AcE
 jMMA==
X-Gm-Message-State: AOAM533NZk79iDJ86ujHJG9akkVqxV2dbBWJrIYIqCxMKTU4/lVdUnWv
 x0+31yU/nn1CnFILHY7JtLr05uj8yMe4fCTfPQWhDdZGAEQk
X-Google-Smtp-Source: ABdhPJxWbF/JdduAtICGRLIrD7B2M74O58yKMzgV1pFof1zqa1ZQrLCp5Xyp58BB+mzyuCSmcZA4j3aEPLRx4Sl8c5fDsij5hO4W
MIME-Version: 1.0
X-Received: by 2002:a92:c643:: with SMTP id 3mr25846387ill.229.1592941634164; 
 Tue, 23 Jun 2020 12:47:14 -0700 (PDT)
Date: Tue, 23 Jun 2020 12:47:14 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000040aa7e05a8c5a02c@google.com>
Subject: KASAN: slab-out-of-bounds Write in snd_usb_mixer_notify_id
From: syzbot <syzbot+fb14314433463ad51625@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 24 Jun 2020 09:49:30 +0200
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

syzbot found the following crash on:

HEAD commit:    7ae77150 Merge tag 'powerpc-5.8-1' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14a0b46e100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d195fe572fb15312
dashboard link: https://syzkaller.appspot.com/bug?extid=fb14314433463ad51625
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11bb9d35100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1309c569100000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+fb14314433463ad51625@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in snd_usb_mixer_notify_id+0x219/0x2a0 sound/usb/mixer.c:3240
Write of size 4 at addr ffff888095d78ce0 by task swapper/1/0

CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.7.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x188/0x20d lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xd3/0x413 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 snd_usb_mixer_notify_id+0x219/0x2a0 sound/usb/mixer.c:3240
 snd_usb_mixer_interrupt+0x416/0x980 sound/usb/mixer.c:3379
 __usb_hcd_giveback_urb+0x2af/0x4b0 drivers/usb/core/hcd.c:1650
 usb_hcd_giveback_urb+0x368/0x420 drivers/usb/core/hcd.c:1716
 __skb_queue_head_init include/linux/skbuff.h:1854 [inline]
 skbpoolfree drivers/block/aoe/aoedev.c:435 [inline]
 freedev drivers/block/aoe/aoedev.c:290 [inline]
 dummy_timer+0x1243/0x2fe1 drivers/block/aoe/aoedev.c:366
 call_timer_fn+0x1ac/0x780 kernel/time/timer.c:1404
 expire_timers kernel/time/timer.c:1449 [inline]
 __run_timers kernel/time/timer.c:1773 [inline]
 __run_timers kernel/time/timer.c:1740 [inline]
 run_timer_softirq+0x623/0x1600 kernel/time/timer.c:1786


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 064682E2027
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 18:50:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B09617FC;
	Wed, 23 Dec 2020 18:49:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B09617FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608745831;
	bh=lI+BS2HFamQJLIRRZRbM0DMK7ZnhJOh7ZDFdLHtHvq0=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X5zES3EJ5oEkYnpMYfZLeRohmkyl/arv4TU8zreDA4idg5SMztRmeilu8QtotdqWO
	 g5XL7O9NDw3XpdYfB0JP1ALOCOa0/Bin5bm8PTwShF+c6n4O+SpezrpC/WgPg0zlH9
	 4S6LE7gubP2Q7n+Y/cGSw1Bzjzu2Bhvq/dR4e+Ro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FF29F80116;
	Wed, 23 Dec 2020 18:45:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B7B8F80224; Tue, 22 Dec 2020 23:38:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E01C8F800BC
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 23:38:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E01C8F800BC
Received: by mail-il1-f200.google.com with SMTP id x10so12897813ilq.12
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 14:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=phZcz8GHgDbMEr4XKo0BIqA5dWEQGOsnMVPYM3W1vas=;
 b=m8tRKUcyArsX4EYWmJ51Jjmu++6ETKcVyL5Xfry5yykHYupT2Vq+uP2ixr9tnlDnTG
 CeuqvWHBZIgF+cTrynZj0c06JouOy8atXiBEk1gKVI4JmteZqh0/lqkWpufMhnYzp3aQ
 6GzRz6xQa7IQrbqXh53WOuU9oDNAkCDBoAR5eagRu721zZYfZaC3JCZ++v7FqPic8ZeL
 5WHVwpupkXOZ2u3tEYV9REP7YJ8Bjo3sUMbRJwC1O1WJVSGlrA+4PtYdYdzxSSPQkd+i
 ao+jI9Dp7MlV6dm0UuAXB3IpFDqpBOAlKLu485OjvYnnGwtWqoSbrguKUVGl1HEFZCRX
 diRw==
X-Gm-Message-State: AOAM533zmrt7TPRhloLY1bT57x30Q1eVU4439lBNW4/DgBzQqonk8yTY
 2jPADwBYqCfR1Qt7DCVyhYKJmrs2pPLfLzymSQCOXLxGKj/Z
X-Google-Smtp-Source: ABdhPJyzjApcIzyu+k2K45bHD2KJm7nZ64jl/4wd4RpcvpOn88al+Y1kV/d84Xc7zi+ObDycuo8uB5ddCijryWgpoBms91IDki9i
MIME-Version: 1.0
X-Received: by 2002:a92:bf09:: with SMTP id z9mr22316997ilh.194.1608676695952; 
 Tue, 22 Dec 2020 14:38:15 -0800 (PST)
Date: Tue, 22 Dec 2020 14:38:15 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000555a005b7153b7a@google.com>
Subject: UBSAN: shift-out-of-bounds in snd_usbmidi_get_ms_info
From: syzbot <syzbot+92e45ae45543f89e8c88@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, clemens@ladisch.de, 
 linux-kernel@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 23 Dec 2020 18:45:49 +0100
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

HEAD commit:    8653b778 Merge tag 'clk-for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=109531a3500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=98408202fed1f636
dashboard link: https://syzkaller.appspot.com/bug?extid=92e45ae45543f89e8c88
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1421ec47500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12bfa077500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+92e45ae45543f89e8c88@syzkaller.appspotmail.com

usb 1-1: config 0 interface 0 altsetting 0 bulk endpoint 0x8A has invalid maxpacket 31
usb 1-1: New USB device found, idVendor=324b, idProduct=5963, bcdDevice= 0.d2
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
usb 1-1: MIDIStreaming interface descriptor not found
================================================================================
UBSAN: shift-out-of-bounds in sound/usb/midi.c:1928:8
shift exponent 244 is too large for 32-bit type 'int'
CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.10.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
 __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x181 lib/ubsan.c:395
 snd_usbmidi_get_ms_info.cold+0x83/0xd4 sound/usb/midi.c:1928
 __snd_usbmidi_create+0x380/0x2320 sound/usb/midi.c:2404
 snd_usb_create_quirk+0xa5/0xe0 sound/usb/quirks.c:562
 usb_audio_probe+0x623/0x2ab0 sound/usb/card.c:795


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

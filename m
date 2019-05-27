Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA552BEF3
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 08:04:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEF2917CB;
	Tue, 28 May 2019 08:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEF2917CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559023473;
	bh=6XG0TSdeOtmRGnWbH23ikk1QESkVyeHcNGe75YoQRbM=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tw4MsUCDeshfffLOGJ6vq1dI6SzYOoBflZGFvLbQ8ej8As2d6kN72GyqPjzjaVDEI
	 D8atBxcBBy8yUIzPVt3xK+irRvTDSNiDkHABvdS+CxG3VjndAEive8MC8Qsfn7TpWD
	 D3bk04MYRUXEhZSMUl91aGU4ugYzAvuN+dYAq9SI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8DF2F89728;
	Tue, 28 May 2019 08:02:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6745FF896E4; Mon, 27 May 2019 17:28:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10000F8072E
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 17:28:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10000F8072E
Received: by mail-io1-f71.google.com with SMTP id b197so1476393iof.12
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 08:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=gsOsI1+w66XacgBQHklfTvf3k1T3GWu7vTDh59E4hxc=;
 b=XPsK4qWDdDWSJ61DKQZi8CLnI7zVrRaWd674q1s8PfX13YDukisz19AjeA4JdmOSH7
 QaIAiqs5ggReGqA6P4esbdtHPzIlzNGFmJCJaCDsv4CARkZOd7oqAuDEqfoa6yLsuPJ8
 cWQlfpS5L+WOmIzlw+Hi/rXKV502PWG/cKmI+/quK2/xYS5qQqwpJcAQy5StLuv1nl2u
 lLfYMUTO95YKRv9cq3h7SJKJ3qE5EkOgmwwvtjQrEd2grCgGjvq2It/bSXjk58g0l69h
 KwVfyXsbON1M+nCWJTC/BXvyGo9rBKvkderVycu0BtIDHIQwYW5CIfod8AyZV71nt/rB
 9+Tw==
X-Gm-Message-State: APjAAAVumbdyl7wT9IszaoWUiEhCfrM7RCz81UIKLk5yDuZSMne/8R54
 tHK8+mPPZKK7VYoEXerhUfVdqAzlw9938pDn1bf5mGGuCzgl
X-Google-Smtp-Source: APXvYqzrZ/O/RowFsG6ZfOGxTVMSpJEnTdIdvqo9mh8nH/jskALOZBEWIe3src5ReKrEgvJD6nnuwT0sQ2VSJ8lyZ9gIqurU+nPY
MIME-Version: 1.0
X-Received: by 2002:a24:81d4:: with SMTP id q203mr28497223itd.55.1558970885496; 
 Mon, 27 May 2019 08:28:05 -0700 (PDT)
Date: Mon, 27 May 2019 08:28:05 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d865de0589e0311f@google.com>
From: syzbot <syzbot+5255458d5e0a2b10bbb9@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, andreyknvl@google.com, keescook@chromium.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com
X-Mailman-Approved-At: Tue, 28 May 2019 08:02:07 +0200
Subject: [alsa-devel] KASAN: null-ptr-deref Write in submit_audio_out_urb
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

HEAD commit:    69bbe8c7 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=118b0aa2a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c309d28e15db39c5
dashboard link: https://syzkaller.appspot.com/bug?extid=5255458d5e0a2b10bbb9
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11f4064ca00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14d51982a00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+5255458d5e0a2b10bbb9@syzkaller.appspotmail.com

snd_usb_toneport 1-1:0.0: read request failed (error -110)
snd_usb_toneport 1-1:0.0: read request failed (error -110)
snd_usb_toneport 1-1:0.0: write request failed (error -110)
usb 1-1: send failed (error -110)
usb 1-1: send failed (error -110)
snd_usb_toneport 1-1:0.0: Line 6 POD Studio UX2 now attached
==================================================================
BUG: KASAN: null-ptr-deref in memset include/linux/string.h:344 [inline]
BUG: KASAN: null-ptr-deref in submit_audio_out_urb+0x919/0x1780  
sound/usb/line6/playback.c:246
Write of size 20 at addr 0000000000000010 by task kworker/1:2/2466

CPU: 1 PID: 2466 Comm: kworker/1:2 Not tainted 5.2.0-rc1+ #9
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: events toneport_start_pcm
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  __kasan_report.cold+0x5/0x32 mm/kasan/report.c:321
  kasan_report+0xe/0x20 mm/kasan/common.c:614
  memset+0x20/0x40 mm/kasan/common.c:107
  memset include/linux/string.h:344 [inline]
  submit_audio_out_urb+0x919/0x1780 sound/usb/line6/playback.c:246
  line6_submit_audio_out_all_urbs+0xc9/0x120 sound/usb/line6/playback.c:295
  line6_stream_start+0x156/0x1f0 sound/usb/line6/pcm.c:199
  line6_pcm_acquire+0x134/0x210 sound/usb/line6/pcm.c:322
  process_one_work+0x90a/0x1580 kernel/workqueue.c:2268
  worker_thread+0x96/0xe20 kernel/workqueue.c:2414
  kthread+0x30e/0x420 kernel/kthread.c:254
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
==================================================================
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 2466 Comm: kworker/1:2 Tainted: G    B             5.2.0-rc1+ #9
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: events toneport_start_pcm
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  panic+0x292/0x6df kernel/panic.c:218
  end_report+0x43/0x49 mm/kasan/report.c:95
  __kasan_report.cold+0xd/0x32 mm/kasan/report.c:324
  kasan_report+0xe/0x20 mm/kasan/common.c:614
  memset+0x20/0x40 mm/kasan/common.c:107
  memset include/linux/string.h:344 [inline]
  submit_audio_out_urb+0x919/0x1780 sound/usb/line6/playback.c:246
  line6_submit_audio_out_all_urbs+0xc9/0x120 sound/usb/line6/playback.c:295
  line6_stream_start+0x156/0x1f0 sound/usb/line6/pcm.c:199
  line6_pcm_acquire+0x134/0x210 sound/usb/line6/pcm.c:322
  process_one_work+0x90a/0x1580 kernel/workqueue.c:2268
  worker_thread+0x96/0xe20 kernel/workqueue.c:2414
  kthread+0x30e/0x420 kernel/kthread.c:254
  ret_from_fork+0x3a/0x50 arch/x86/entry/entry_64.S:352
Kernel Offset: disabled
Rebooting in 86400 seconds..


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

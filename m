Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6254B4FD36E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 11:53:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1C0917A8;
	Tue, 12 Apr 2022 11:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1C0917A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649757198;
	bh=npI3eDpaL7dRAWWTlC+G7T8vTVC5Xg+dka3X+J+XbT4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SniBDOIPWD8cdfEBK9MgD4LiU4Lye4S2JwoNkakB6QIvFLUHeoTwGHrB/axL3GiTN
	 VwpFWrS8NLYe2RLzXncxssytbCUD76JOiZd5ttjg8Tj16mBjjJTAOUZRhvDVm4F54E
	 h1Knebm25gjJ6LhWoWoLE4anEO2bRWvvGaZ8iEIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA130F80506;
	Tue, 12 Apr 2022 11:51:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47F7FF8014E; Sat,  9 Apr 2022 02:41:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82887F80128
 for <alsa-devel@alsa-project.org>; Sat,  9 Apr 2022 02:41:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82887F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d3uC8hXw"
Received: by mail-ej1-x634.google.com with SMTP id dr20so20228033ejc.6
 for <alsa-devel@alsa-project.org>; Fri, 08 Apr 2022 17:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i4viXU341zw5uhZBWqAUdlrrXjczKy3fJ8dlKQXYSdw=;
 b=d3uC8hXwTeSWR613kgs675SF4j6XAHsUEDcEqvmGXPNadrGEEdG4vJWPx3WA9Lgc6M
 NcZ6TDea1zl26kxYexGUxdNGpiEExJwcSBWGKIOAFbDHPRTc26jCtfXJt8B53kTUVYPY
 icxoeJ1oBXUJ1hZJTKfNo9dHqTMvtGwjyHJ9WNk1AXhSmtcth20WL4057u7JiSwP3k/a
 vpu2EAHcO9ca3uOGC2KYxW4wK5NMXlEefQCLcrpE7Z8Xjxx6eLaOBbIYgsJHC5ZpUsXo
 Ny46JZb/qFepjl3ltZrBkPR8jHuceBAmrybamggvWfd+GyDSWdliiW00JC4KsCqmXGjL
 9mhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i4viXU341zw5uhZBWqAUdlrrXjczKy3fJ8dlKQXYSdw=;
 b=q/onUstaGjLjtjXsk1NeDBdpyQzKtRRIPsqm85ZHHnj6g4RPuQtOgymlzTG7LezdO5
 G+cBDOs5C7GGjJZAbv1lmI8sH92tvl9bdE/NOkplZQxgnXpwOrTkh0HMxWyeAY5eDBVy
 6LO3CnwWEtPtyXCf00yWFMBnERqcy5/pfBx1AuRS7auzhOkY4V1CJqMC+pBOm1VXhIss
 qn7qnvKx7GfnDX7MSXrA9Dd07k0TndJm6fuM/jQ3B3jTOw2K7KxBj/ZATBsudaeUU5GH
 23JCIpWOIeNM3kqvjyeDxXX9eAd1nv9gxzzAPKM4naUb7AMRxdu3qfI3qgrqFOAoXGky
 Is2g==
X-Gm-Message-State: AOAM533h8ozEb0wDiFPebBogbWM1rxw/RnBoCivJzmguzBj/VZvWpD2C
 KjrqFX1Zpw+p12UhGuy2Ow2S6HnEVpE=
X-Google-Smtp-Source: ABdhPJwAZwmKpd8B+JKs5Nny4Muxuojr8cjAy2bujuuASE8bgIIAlU2MeUbNxWXTpMJB64doFItH8g==
X-Received: by 2002:a17:907:6e88:b0:6da:8f01:7a8f with SMTP id
 sh8-20020a1709076e8800b006da8f017a8fmr21121719ejc.619.1649464910352; 
 Fri, 08 Apr 2022 17:41:50 -0700 (PDT)
Received: from leap.localnet (host-87-4-4-217.retail.telecomitalia.it.
 [87.4.4.217]) by smtp.gmail.com with ESMTPSA id
 q7-20020a170906540700b006d5eca5c9cfsm9183350ejo.191.2022.04.08.17.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:41:49 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz,
 syzkaller-bugs@googlegroups.com, tiwai@suse.com
Subject: Re: [syzbot] KASAN: null-ptr-deref Write in snd_pcm_format_set_silence
Date: Sat, 09 Apr 2022 02:41:47 +0200
Message-ID: <4181875.ejJDZkT8p0@leap>
In-Reply-To: <000000000000d188ef05dc2c7279@google.com>
References: <000000000000d188ef05dc2c7279@google.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart2109924.Mh6RI2rZIc"
Content-Transfer-Encoding: 7Bit
X-Mailman-Approved-At: Tue, 12 Apr 2022 11:51:33 +0200
Cc: syzbot <syzbot+205eb15961852c2c5974@syzkaller.appspotmail.com>
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

This is a multi-part message in MIME format.

--nextPart2109924.Mh6RI2rZIc
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"

On sabato 9 aprile 2022 00:52:26 CEST syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    312310928417 Linux 5.18-rc1
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=16f30a90f00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=595bcd2109a73f9c
> dashboard link: https://syzkaller.appspot.com/bug?extid=205eb15961852c2c5974
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1798df4f700000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12981dbf700000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+205eb15961852c2c5974@syzkaller.appspotmail.com
> 
> ==================================================================
> BUG: KASAN: null-ptr-deref in snd_pcm_format_set_silence sound/core/pcm_misc.c:441 [inline]
> BUG: KASAN: null-ptr-deref in snd_pcm_format_set_silence+0x215/0x350 sound/core/pcm_misc.c:424
> Write of size 16383 at addr 0000000000000001 by task syz-executor156/3605
> 
> CPU: 0 PID: 3605 Comm: syz-executor156 Not tainted 5.18.0-rc1-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
>  print_report mm/kasan/report.c:432 [inline]
>  kasan_report.cold+0x61/0x1c6 mm/kasan/report.c:491
>  check_region_inline mm/kasan/generic.c:183 [inline]
>  kasan_check_range+0x13d/0x180 mm/kasan/generic.c:189
>  memset+0x20/0x40 mm/kasan/shadow.c:44
>  snd_pcm_format_set_silence sound/core/pcm_misc.c:441 [inline]
>  snd_pcm_format_set_silence+0x215/0x350 sound/core/pcm_misc.c:424
>  snd_pcm_oss_sync+0x60e/0x800 sound/core/oss/pcm_oss.c:1690
>  snd_pcm_oss_ioctl+0x208c/0x3430 sound/core/oss/pcm_oss.c:2634
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:870 [inline]
>  __se_sys_ioctl fs/ioctl.c:856 [inline]
>  __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:856
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x35/0x80 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> RIP: 0033:0x7f0846a59e69
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 c1 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f0846c74318 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f0846af0028 RCX: 00007f0846a59e69
> RDX: 0000000000000000 RSI: 0000000000005001 RDI: 0000000000000003
> RBP: 00007f0846af0020 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 6475612f7665642f
> R13: 00007f0846bffd8f R14: 00007f0846c74400 R15: 0000000000022000
>  </TASK>
> ==================================================================
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this issue, for details see:
> https://goo.gl/tpsmEJ#testing-patches
> 
> -- 
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/000000000000d188ef05dc2c7279%40google.com.
> 
Let's try and check if "pat" is valid...

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Fabio M. De Francesco

P.S.: I'm sorry, in my previous email I forgot to Cc all people and lists.

--nextPart2109924.Mh6RI2rZIc
Content-Disposition: attachment; filename="snd_pcm_format_set_silence.diff"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="snd_pcm_format_set_silence.diff"

diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
index 4866aed97aac..5588b6a1ee8b 100644
--- a/sound/core/pcm_misc.c
+++ b/sound/core/pcm_misc.c
@@ -433,7 +433,7 @@ int snd_pcm_format_set_silence(snd_pcm_format_t format, void *data, unsigned int
 		return 0;
 	width = pcm_formats[(INT)format].phys; /* physical width */
 	pat = pcm_formats[(INT)format].silence;
-	if (! width)
+	if (!width || !pat)
 		return -EINVAL;
 	/* signed or 1 byte data */
 	if (pcm_formats[(INT)format].signd == 1 || width <= 8) {

--nextPart2109924.Mh6RI2rZIc--




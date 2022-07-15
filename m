Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F285758FB
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 03:06:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECA4016B2;
	Fri, 15 Jul 2022 03:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECA4016B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657847201;
	bh=VRrW4oLF4NkK0onXfyD9WpjLReLYrqiTglDvADCiLRw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fGEWCLY5KO8L4G+BzlSU1+v4Dv4qyt4H5mHvtr6j/6fsbOAetsrJ1y+tYUgk2McAt
	 uoSNv1SPmbCnNe+2/bmyI++F0qGoowTh0pUi9RxSw6FY7qtgPKmqSNmVUcSrCmpuhq
	 A894JggfD0Ht8/LhzTBbJ50qfOoKOYNC9TlYhas4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58F84F8016E;
	Fri, 15 Jul 2022 03:05:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBFC6F80165; Fri, 15 Jul 2022 03:05:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75AC8F800B0
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 03:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75AC8F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bLRYriYf"
Received: by mail-pj1-x1036.google.com with SMTP id
 v4-20020a17090abb8400b001ef966652a3so10142040pjr.4
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 18:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bMOaZjPOn7LiquFMJQ2CXw2tm+jQRrs558CGBk7ulfo=;
 b=bLRYriYf5s7UQ/7X05zIPibEf2AowOD7S1AeGIFEUYUiontcazQytHEDFm5AMwD7Jd
 VtCJdkBFLj+RTUVp7AqOSB0b0QRlkGLXysDfwIxtNa4cwB7U/hm4G0FmLnXCTRfoa1H3
 5gj6tuT3/ndw0w0YmLzxWkHImdMAct6eqdJvvfU59ObMTJk1vitayP1ItkBy/LvLJDqu
 p5AlTMyKgRVRyqNpIfOMb/fEFhmDLtTTVcKH/9geUYOGgVtpe914ygD0UTdqEsiSoSxT
 qr4aHnwd2R36jao2d0xJgODe1MqDVmtlWV39NwR6A+K8PsZjeDIOSVY2Yy8uaVgnJWtp
 yV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bMOaZjPOn7LiquFMJQ2CXw2tm+jQRrs558CGBk7ulfo=;
 b=sF4c5G/HvXIecan+qK8KZ0P5jHiIjeY14HGzx5ivS3QNmlsSil1s/CUoRNrpAQfCM6
 tZARecDfsMImHfw17tqkZ/Dej2f9YEZUeBtSkZbWmyFxHJK21gGJtra3LzeNZQ+thNwx
 eFnKmmbI8mTGMVME2Kd6Ihu2aWhThR9Ys3uAJZPTuH8+wZm1aROCjKjWNan7onFhpKRH
 DV7dt5kd9G1pgaYwC2+HqBwXE3lZcW8ms9PCoptULdmB8fAZGodaRJws1FzJsor0Olgu
 9UBg5eLEEXfLLa4IzPn9ES3BJGKU1dG8KRDd8PAJnfMm/FBfokOG2w4lIKqgwyXusvu8
 EBjg==
X-Gm-Message-State: AJIora+ceYhCB4wTTJxdjgrnD3kVBnLWlY8HJNy3192eERUxmZoWDbO+
 ib7Btd5kEOFJwItAVxuc2w==
X-Google-Smtp-Source: AGRyM1twV7U8txW9uqIswjHAUWHS1tkOsGchB7TYe8k6E3/W/dwm7czkvcZjMOj1Yu40M1A57av/HQ==
X-Received: by 2002:a17:90b:4a83:b0:1ef:de4c:660f with SMTP id
 lp3-20020a17090b4a8300b001efde4c660fmr12412585pjb.213.1657847127947; 
 Thu, 14 Jul 2022 18:05:27 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170903110d00b0016c27561454sm2163541plh.283.2022.07.14.18.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 18:05:27 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: bcd2000: Fix a UAF bug on the error path of probing
Date: Fri, 15 Jul 2022 09:05:15 +0800
Message-Id: <20220715010515.2087925-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Zheyu Ma <zheyuma97@gmail.com>,
 linux-kernel@vger.kernel.org
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

When the driver fails in snd_card_register() at probe time, it will free
the 'bcd2k->midi_out_urb' before killing it, which may cause a UAF bug.

The following log can reveal it:

[   50.727020] BUG: KASAN: use-after-free in bcd2000_input_complete+0x1f1/0x2e0 [snd_bcd2000]
[   50.727623] Read of size 8 at addr ffff88810fab0e88 by task swapper/4/0
[   50.729530] Call Trace:
[   50.732899]  bcd2000_input_complete+0x1f1/0x2e0 [snd_bcd2000]

Fix this by adding usb_kill_urb() before usb_free_urb().

Fixes: b47a22290d58 ("ALSA: MIDI driver for Behringer BCD2000 USB device")
Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 sound/usb/bcd2000/bcd2000.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/usb/bcd2000/bcd2000.c b/sound/usb/bcd2000/bcd2000.c
index cd4a0bc6d278..7aec0a95c609 100644
--- a/sound/usb/bcd2000/bcd2000.c
+++ b/sound/usb/bcd2000/bcd2000.c
@@ -348,7 +348,8 @@ static int bcd2000_init_midi(struct bcd2000 *bcd2k)
 static void bcd2000_free_usb_related_resources(struct bcd2000 *bcd2k,
 						struct usb_interface *interface)
 {
-	/* usb_kill_urb not necessary, urb is aborted automatically */
+	usb_kill_urb(bcd2k->midi_out_urb);
+	usb_kill_urb(bcd2k->midi_in_urb);
 
 	usb_free_urb(bcd2k->midi_out_urb);
 	usb_free_urb(bcd2k->midi_in_urb);
-- 
2.25.1


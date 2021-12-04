Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDA0468726
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 19:53:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E7D02450;
	Sat,  4 Dec 2021 19:53:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E7D02450
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638644031;
	bh=OhUVC/6En8DHKBE8MnkyM4/MCDU0kewcomzKvVU2maU=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dpdycd1Tu/4/xQvNSS2mJCTXnuCOl26pI0cWWIN90tYTHvhdq87krj7t3QHBdIWr3
	 2JFXsxmVMLt3DWGOlMAITud9j3DAggXUMguDWYnqFd4iZT4WKmV9zEM1u/KpVmluH7
	 NPGLuMBLsNgaHwqgq/rSSdLopYSPYIOFLTkpzeN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9259F800D3;
	Sat,  4 Dec 2021 19:52:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 585F4F8023B; Sat,  4 Dec 2021 19:52:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45AA4F800D3
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 19:52:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45AA4F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YrjxUIwi"
Received: by mail-ua1-x92b.google.com with SMTP id az37so11782960uab.13
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 10:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=tjENhdxsZ3UkaXAmK6rG5EvggoLhRmEOVwokmWvOiAg=;
 b=YrjxUIwiwxjjvAAE+3o/HS2JBOEvUbUfGrdpRW30W6DWDSfuPoa7HUjGIZw6kN8Rch
 d0WpOkiySS9FbRvBCYW2EouQcgIntssHXa877hQrJZJxb3a4/CxgqeM2UWNca4SfpsZA
 XEzQR03MI9URKfCyhF/flkSgnJUjDX1drbzt4QH0BWP/c6u06RWKU6CAUCutmRf3Dkzf
 puaiQ7aX+jFPp/IhbFrbEsMjweKIEkAFaN4h4an33yOnP/3/WsuXXx8K2+7lSXFIP45o
 Yno7kkaOEslC90/gadBspXv7Pqbc3a3xgT1M60EsizT7I+8nTBB05UcvAIWNaLcEO/Yr
 32Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=tjENhdxsZ3UkaXAmK6rG5EvggoLhRmEOVwokmWvOiAg=;
 b=Odu6Vqp5jJwIgulJoamf+MErKL2wBKVEjU+d1FB9h7nmlXuInA1SHSS54BsnE3lyIl
 oMgQg9lIQk5nQEyVjJxMzfqWJ5vrWye1kCbwzVtMoXaqep+F4KfWRrn9pYwiqAl5TysN
 taQdmtLVLdUXXX2n9sP23m/UH0KLAmTzE9ltnVgmF+dlHzUDJC58U0J7sEqL6dNlnL0n
 KiSc2zS9ke12UGOTmB4UE4j9VC+NFqsZ/XHzSnJYmiU+8VylEvvo+/m3W1CofH2iLucL
 jkA0bCk7BNZhEH12r7ZEyzx6ZZBN1nnti0LTPxEshgRA1liRgoAjmKckhKoCFXRqKk41
 PFaQ==
X-Gm-Message-State: AOAM530y+avc5/CQnUYyU7RI7HGPEmj/OBHPlfksq4uXr1fcL8Al5CVv
 pM0072PQxDWnmtN4PkCxH9ZQypbY+OA=
X-Google-Smtp-Source: ABdhPJwJMD5oV/Kzvz6EYjzIWveixHFzBp7cYb9Mr3lfx0rOCbH8txWKd9cdMb/hdjvplhFW3G30sg==
X-Received: by 2002:a9f:2d8c:: with SMTP id v12mr30349851uaj.25.1638643941637; 
 Sat, 04 Dec 2021 10:52:21 -0800 (PST)
Received: from geday ([2804:7f2:8002:7bf1:59c9:7624:9b4a:10d2])
 by smtp.gmail.com with ESMTPSA id m15sm1359435vkl.40.2021.12.04.10.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 10:52:21 -0800 (PST)
Date: Sat, 4 Dec 2021 15:52:24 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2] ALSA: usb-audio: Reorder snd_djm_devices[] entries
Message-ID: <Yau46FDzoql0SNnW@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: William Overton <willovertonuk@gmail.com>,
 ALSA-devel <alsa-devel@alsa-project.org>, Olivia Mackintosh <livvy@base.nu>
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

Olivia Mackintosh has posted to alsa-devel reporting that
there's a potential bug that could break mixer quirks for Pioneer
devices introduced by 6d27788160362a7ee6c0d317636fe4b1ddbe59a7
"ALSA: usb-audio: Add support for the Pioneer DJM 750MK2
Mixer/Soundcard".

This happened because the DJM 750 MK2 was added last to the Pioneer DJM
device table index and defined as 0x4 but was added to snd_djm_devices[]
just after the DJM 750 (MK1) entry instead of last, after the DJM 900
NXS2. This escaped review.

To prevent that from ever happening again, Takashi Iwai suggested to use
C99 array designators in snd_djm_devices[] instead of simply reordering
the entries.

Reported-by: Olivia Mackintosh <livvy@base.nu>
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>

---

V1 -> V2: added C99 array designators to prevent the order of entries
ever being an issue again.

---

Hi Takashi,

First, thanks for the suggestion regarding C99 array designators. This
will serve us well. As I said before, I don't own any DJM mixers to test
this, and although it's a simple change, I'm always for testing.

Thanks,
Geraldo Nascimento

---

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index d489c1de3bae..823b6b8de942 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3016,11 +3016,11 @@ static const struct snd_djm_ctl snd_djm_ctls_750mk2[] = {
 
 
 static const struct snd_djm_device snd_djm_devices[] = {
-	SND_DJM_DEVICE(250mk2),
-	SND_DJM_DEVICE(750),
-	SND_DJM_DEVICE(750mk2),
-	SND_DJM_DEVICE(850),
-	SND_DJM_DEVICE(900nxs2)
+	[SND_DJM_250MK2_IDX] = SND_DJM_DEVICE(250mk2),
+	[SND_DJM_750_IDX] = SND_DJM_DEVICE(750),
+	[SND_DJM_850_IDX] = SND_DJM_DEVICE(850),
+	[SND_DJM_900NXS2_IDX] = SND_DJM_DEVICE(900nxs2),
+	[SND_DJM_750MK2_IDX] = SND_DJM_DEVICE(750mk2),
 };

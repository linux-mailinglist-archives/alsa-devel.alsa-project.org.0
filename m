Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6D036B268
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 13:39:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ED3A1687;
	Mon, 26 Apr 2021 13:38:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ED3A1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619437146;
	bh=7Rg76zFYt8KwIsnq7KgdnsmHRkp6x9EVtmxSgkQL8gk=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Oge/e1jei/WYkZqexmgOgMC7cBKGnI/CM9fXUM1A+77LhG2AsB0fWswna+oMl6UsN
	 /pgnUG7EB6J+UyMbMNOJjkDg/XQCTpjJuljLMT0w5JY6Whk0UUdMvq3f1S0LydDcL7
	 Ltf5jvaNBijDe9JwWUJy4cEpRFcIMzws7q5D72Zs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C78CF80165;
	Mon, 26 Apr 2021 13:37:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4138F80086; Sun, 25 Apr 2021 22:37:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6A37F80086
 for <alsa-devel@alsa-project.org>; Sun, 25 Apr 2021 22:37:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6A37F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=loone-fi.20150623.gappssmtp.com
 header.i=@loone-fi.20150623.gappssmtp.com header.b="h7hvYKqN"
Received: by mail-ej1-x635.google.com with SMTP id g5so74608107ejx.0
 for <alsa-devel@alsa-project.org>; Sun, 25 Apr 2021 13:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=loone-fi.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=BEz5wvJTVuQoYJeT0qrPRhgosT4Kh2gQQHHuTYqZiRA=;
 b=h7hvYKqNT5Aungizh5vXJsGoL7zOnGwqw8XaLijRZPzWKBkFzaTHEpUm5XmKXLvPlM
 tXErsyT/mkG9lbZvFwh+hC8nwLqHzBOC4dkeC4res8zmOj/yqo+aFEoqt2zBJ1bR06FV
 uHrDx06oIYk/oynTEMT1q33FImeXqUx/quWJsP6e6/vKp3mALPQDPzQSZHY4WZfdYa66
 KfTkRmXlDtNZ1soqWOGTN9imL7+5k2marsASzVk51Sc7DFpNqDKX+bps/V99PYt20WQv
 +yk7ezDGrDzaBKDpicAUZmkmE4VJ49fBnAo1LzRD8SWVl++gn/NTt7+MDRBBVuHD+SsQ
 y/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=BEz5wvJTVuQoYJeT0qrPRhgosT4Kh2gQQHHuTYqZiRA=;
 b=GemxZ9SVq7RPYBU6ylvbgwwLblpOBI5YrgL1orCGYdcM8DMN3a2sYMWSdUkf5PNucI
 ivrxB26zE2za5ew7ZEppAYGU4g14Ltt6Ak6AOCwP6MHiUOApWELI2x4MxtDuOiDV2wDQ
 kEJo0DFjQehsLgceW2EGrkL302byDaVVEsTMh63wvdecWe6flM0enQyDpKWDouMI0l5i
 NeM0jCsUa4Y/HrC1MbNycR59idd75PvAzAcQvMh/ChrEv/O9y8kjdoGn4ikBdH6QJOmv
 rB3VemZI9JoZouCkNMCIAgAoc2127eqIckxOmKpb0OQ7LxvVGUYvPKl90jMqjQ3pwSQi
 kM8A==
X-Gm-Message-State: AOAM533C61tx90PinJCPWNt3v93epxQvD0+WhLWoJpg9v449RJakeAET
 p4U+3+CXEah5bJJwZaALgaIYIiY11z2EqA==
X-Google-Smtp-Source: ABdhPJyTVi4CCdcFxPUWfmzBmmBRQTo5SJPC508CRyKb5N6k3uJX+Eeu+K6hB7m06G19zYzAl97Qkw==
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr7089720ejb.382.1619383034362; 
 Sun, 25 Apr 2021 13:37:14 -0700 (PDT)
Received: from yoga
 (2001-1c03-5b17-8e00-b60e-deff-fe15-4d5c.cable.dynamic.v6.ziggo.nl.
 [2001:1c03:5b17:8e00:b60e:deff:fe15:4d5c])
 by smtp.gmail.com with ESMTPSA id c22sm863161eja.2.2021.04.25.13.37.13
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 13:37:13 -0700 (PDT)
Date: Sun, 25 Apr 2021 22:37:12 +0200
From: Sami Loone <sami@loone.fi>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: fix static noise on ALC285 Lenovo laptops
Message-ID: <YIXS+GT/dGI/LtK6@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 26 Apr 2021 13:37:35 +0200
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

Remove a duplicate vendor+subvendor pin fixup entry as one is masking
the other and making it unreachable. Consider the more specific newcomer
as a second chance instead.

The generic entry is made less strict to also match for laptops with
slightly different 0x12 pin configuration. Tested on Lenovo Yoga 6 (AMD)
where 0x12 is 0x40000000.

Fixes: 607184cb1635 ("ALSA: hda/realtek - Add supported for more Lenovo ALC285 Headset Button")
Signed-off-by: Sami Loone <sami@loone.fi>
---
 sound/pci/hda/patch_realtek.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a7544b77d3f7..98a53c94ca48 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8733,12 +8733,7 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
 		{0x12, 0x90a60130},
 		{0x19, 0x03a11020},
 		{0x21, 0x0321101f}),
-	SND_HDA_PIN_QUIRK(0x10ec0285, 0x17aa, "Lenovo", ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK,
-		{0x14, 0x90170110},
-		{0x19, 0x04a11040},
-		{0x21, 0x04211020}),
 	SND_HDA_PIN_QUIRK(0x10ec0285, 0x17aa, "Lenovo", ALC285_FIXUP_LENOVO_PC_BEEP_IN_NOISE,
-		{0x12, 0x90a60130},
 		{0x14, 0x90170110},
 		{0x19, 0x04a11040},
 		{0x21, 0x04211020}),
@@ -8909,6 +8904,10 @@ static const struct snd_hda_pin_quirk alc269_fallback_pin_fixup_tbl[] = {
 	SND_HDA_PIN_QUIRK(0x10ec0274, 0x1028, "Dell", ALC274_FIXUP_DELL_AIO_LINEOUT_VERB,
 		{0x19, 0x40000000},
 		{0x1a, 0x40000000}),
+	SND_HDA_PIN_QUIRK(0x10ec0285, 0x17aa, "Lenovo", ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK,
+		{0x14, 0x90170110},
+		{0x19, 0x04a11040},
+		{0x21, 0x04211020}),
 	{}
 };
 
-- 
2.31.1


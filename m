Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EBF3706C4
	for <lists+alsa-devel@lfdr.de>; Sat,  1 May 2021 12:09:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79D8C16B6;
	Sat,  1 May 2021 12:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79D8C16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619863778;
	bh=g1uUpuZyZRlPmf5El/UjH7X4R3Ql35/aDj5C0xCVJM8=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kRHl0YuMVtZyHXbrIxPIxZ6djFgZp27xgDNTVva38JgjcReIN2g2GI7ea99efl8XM
	 UqSpCZkx+fUCeBJGKM+TjCp9Tz2KkV7AAbiPmx60KYCQ0ExZqslBo/aPMRqMxdVT8r
	 lPbf+IrZd9qW5eEqhjh4UJNiByJ+mXHfuUCunIEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2D24F801D8;
	Sat,  1 May 2021 12:08:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DB2FF801EC; Sat,  1 May 2021 12:08:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 749A4F800D3
 for <alsa-devel@alsa-project.org>; Sat,  1 May 2021 12:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 749A4F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=loone-fi.20150623.gappssmtp.com
 header.i=@loone-fi.20150623.gappssmtp.com header.b="G3k8JQsF"
Received: by mail-ed1-x52f.google.com with SMTP id y26so895671eds.4
 for <alsa-devel@alsa-project.org>; Sat, 01 May 2021 03:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=loone-fi.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=4WQL7VODP4Nl10hD9qOgU+J2c4Wg0/b1TkUMZULzw9o=;
 b=G3k8JQsFibUgdhs1UpSSRphey7hJoyIznL2fRuZ88QDroHwU5sttw2DXluuM8VMbQp
 jxFFYXzn0b9m4SoENha+zz79kucxXtShFCRztSyOMWutR9+jOy0hCQqlMiciPpcjcCLb
 Ch6oGM6K20U26dSFoJXQ+VcUQE4xVa1l05z0Vxr+LXEDZG+NlHYxMCRswmKGNyZ2RJnI
 Jq9XXid8YEJyLbosaJYLFjDlJ4dZib00J+1SDmzesmwIEh9dBBX4lfbZ6WZ2ZIXMq1BK
 6STNsxLX2wpeccdIMGx7VpAZ6LDrMoIpBtdMgCZFoq/1GK5omxJG2I8eCiMZGZOaycer
 IWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=4WQL7VODP4Nl10hD9qOgU+J2c4Wg0/b1TkUMZULzw9o=;
 b=fZ17TPpz0mzsjFj1ejmRAP/z/lBYbMBObLtH0GOl83vwhv5yUKbjH/ABXZctzag5RS
 n4PuC3hHNHuAxccOE8D8U1cvQ1uK8hj3mwNNGwE48+lNQJHJyUeYKgGAgis8bBED4Foe
 sjsmCu1bp8F//45WvrFj3fO4OxQdJPcVg5dgqLXUCEfH0OdgJOX75DsVLhCQQlU6cdHz
 f1TEBi85JvYDCp6s3ZD562EfzsNAFI3/7hA0GTDD99YwPCxYvrwrgAoUzOnvq8WHtYus
 8Igi9MRvUKtAauxneF6hPa9W1R18OORyPZ2pe3Ph1qY3m34xSGs4OIIe3ma4y6+DmBf1
 dYbw==
X-Gm-Message-State: AOAM533Wv7rJRatCv1xU3VmOf0N3dM0/5DH+9ZkBfztb/DNjxVZjUx/b
 3O7uIlPyht6jFt5026VshFJB80q5TqN/GA==
X-Google-Smtp-Source: ABdhPJy5+e18Xtsgu4gYlDIpcvqImEiI6KZ4+WWx+gpORsSi3mqVD7SmKgzwIH285KwwZ19Hw4s5IQ==
X-Received: by 2002:aa7:dc0b:: with SMTP id b11mr10850687edu.124.1619863675349; 
 Sat, 01 May 2021 03:07:55 -0700 (PDT)
Received: from yoga
 (2001-1c03-5b17-8e00-b60e-deff-fe15-4d5c.cable.dynamic.v6.ziggo.nl.
 [2001:1c03:5b17:8e00:b60e:deff:fe15:4d5c])
 by smtp.gmail.com with ESMTPSA id o8sm4739718ejm.18.2021.05.01.03.07.54
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 03:07:54 -0700 (PDT)
Date: Sat, 1 May 2021 12:07:53 +0200
From: Sami Loone <sami@loone.fi>
To: Alsa-devel <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: hda/realtek: ALC285 Thinkpad jack pin quirk is
 unreachable
Message-ID: <YI0oefvTYn8URYDb@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

In 07d9e69cf34a ("ALSA: hda/realtek: fix static noise on ALC285 Lenovo
laptops") an existing Lenovo quirk was made more generic by removing a
0x12 pin requirement from the entry. This made the second chance table
Thinkpad jack entry unreachable as the pin configurations became
identical.

Revert the 0x12 pin requirement removal and move Thinkpad jack pin quirk
back to the primary pin table as they can co-exist when more specific
configurations come first.

Add a more targeted pin quirk for Lenovo devices that have 0x12 as
0x40000000.

Tested on Yoga 6 (AMD) laptop.

Fixes: 07d9e69cf34a ("ALSA: hda/realtek: fix static noise on ALC285 Lenovo laptops")
Signed-off-by: Sami Loone <sami@loone.fi>
---
 sound/pci/hda/patch_realtek.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index bd7bfd7c9ee7..a0fa99a31c23 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8801,6 +8801,16 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
 		{0x19, 0x03a11020},
 		{0x21, 0x0321101f}),
 	SND_HDA_PIN_QUIRK(0x10ec0285, 0x17aa, "Lenovo", ALC285_FIXUP_LENOVO_PC_BEEP_IN_NOISE,
+		{0x12, 0x90a60130},
+		{0x14, 0x90170110},
+		{0x19, 0x04a11040},
+		{0x21, 0x04211020}),
+	SND_HDA_PIN_QUIRK(0x10ec0285, 0x17aa, "Lenovo", ALC285_FIXUP_LENOVO_PC_BEEP_IN_NOISE,
+		{0x14, 0x90170110},
+		{0x19, 0x04a11040},
+		{0x1d, 0x40600001},
+		{0x21, 0x04211020}),
+	SND_HDA_PIN_QUIRK(0x10ec0285, 0x17aa, "Lenovo", ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK,
 		{0x14, 0x90170110},
 		{0x19, 0x04a11040},
 		{0x21, 0x04211020}),
@@ -8971,10 +8981,6 @@ static const struct snd_hda_pin_quirk alc269_fallback_pin_fixup_tbl[] = {
 	SND_HDA_PIN_QUIRK(0x10ec0274, 0x1028, "Dell", ALC274_FIXUP_DELL_AIO_LINEOUT_VERB,
 		{0x19, 0x40000000},
 		{0x1a, 0x40000000}),
-	SND_HDA_PIN_QUIRK(0x10ec0285, 0x17aa, "Lenovo", ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK,
-		{0x14, 0x90170110},
-		{0x19, 0x04a11040},
-		{0x21, 0x04211020}),
 	{}
 };
 
-- 
2.31.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D594187B4F
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 09:31:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 053841836;
	Tue, 17 Mar 2020 09:30:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 053841836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584433896;
	bh=Au090xoaPxCIy2lf2OXFiWY6l33FNRXByzu3AoiXUOE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e5caOUUM5O1kFazlKIXXDiupIEITR8B4GPspJOcwUySCfp+LZEHNdhDR2BEMqLTd6
	 gphunIZr0+U8l+kJgFtwnkm3tFxz8RYZ51aLPGwpyoyb+xKA0kpN2LxQ8jH0bkf8ki
	 4CRi6dwPXwS4g2TnBSj4wdQy+MTjuHvEFxc2gR1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2963EF8023E;
	Tue, 17 Mar 2020 09:30:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97753F8023E; Tue, 17 Mar 2020 09:30:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA897F80217
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 09:30:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA897F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="kqYfXL1I"
Received: by mail-pf1-x444.google.com with SMTP id z65so11530594pfz.8
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 01:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gZuIwtZ+2hf7pTqEUWqw1JVhU89MyFlE8Sqn8Fq++lU=;
 b=kqYfXL1Ip04HSNa8KkPDkDcYn9wmErZYNjZYbNvEgOyOvNcKeM6PnUSsd63PcWQ4cE
 ffmMU1uEnPka286OXda1tk8F4bTmOJTGkxiSkayEbrknb1/F1jxXabXASpWuC1zXLvHk
 lUiAfATamDJucgdSejqSv2xOcEeuROXpdQBR5g2y6Sx/xsMOoWMvt7sXCWmgFI0PncXD
 T/XHlwOeZHYjHem5INobJ54nKD/SllrBAwAJGQTzEqz7z7SG61QQA0Yd7Mux51uw5lGO
 6YS4qXeFVzCFAxBO89ViyIi9uXKzUbXAf3YBI4lnzPkA/2TzGG0H9IUq6Zt1Xr6XyoIB
 TdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gZuIwtZ+2hf7pTqEUWqw1JVhU89MyFlE8Sqn8Fq++lU=;
 b=lkqzxmYOu5WrSxHncIsF6yja/KreD3U+MSkmjMDYfDAj2RpKo3iDd+58xyb59OD5mh
 9aACJjtWBD2f05aTkmsMQIJ5YYH0gULwZ0QdogXtfnznmB8RPGqyrz0O6VcT0+JOXMf5
 t2yUBUTR3+i/X+erqUAiQoOIVyp9GBXczuLXFyK8wThLhxfZq8IUXM00BdDbPJ0OwHPd
 j0lDdhbBVP7SgwCt0lHe/8pjSartKa4pop1JC88AYe9nFiFFgzCGz+nbzh/3BZWHoaXX
 1AwC6hgcBdAeVSN0Ku0IlHJcEhgOx9GPlaQz9q4I+MObdBG0Pw6K+Js6XAmK0OIJHCrA
 cEBQ==
X-Gm-Message-State: ANhLgQ2Sntgf59PyQsLdkGudl08XNRDL60nt2DTdMVB5/GQXbbtpCSdM
 r9RrnSpHjfO82GNLydEopCLEXg==
X-Google-Smtp-Source: ADFU+vuuKNJsNdUjh+PEtFFc4KNbme2kHZkfB9E0YtDtV8C5w+Ed+TLaDuX5RWPZPS0rV5JHuMXVIg==
X-Received: by 2002:a63:e053:: with SMTP id n19mr4100628pgj.64.1584433799881; 
 Tue, 17 Mar 2020 01:29:59 -0700 (PDT)
Received: from starnight.local ([150.116.255.181])
 by smtp.googlemail.com with ESMTPSA id m68sm21095679pjb.0.2020.03.17.01.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 01:29:59 -0700 (PDT)
From: Jian-Hong Pan <jian-hong@endlessm.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] ALSA: hda/realtek - Enable headset mic of Acer X2660G
 with ALC662
Date: Tue, 17 Mar 2020 16:28:07 +0800
Message-Id: <20200317082806.73194-2-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317082806.73194-1-jian-hong@endlessm.com>
References: <20200317082806.73194-1-jian-hong@endlessm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jian-Hong Pan <jian-hong@endlessm.com>, alsa-devel@alsa-project.org,
 Kailang Yang <kailang@realtek.com>, linux@endlessm.com,
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

The Acer desktop X2660G with ALC662 can't detect the headset microphone
until ALC662_FIXUP_ACER_X2660G_HEADSET_MODE quirk applied.

Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
---
 sound/pci/hda/patch_realtek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 0ac06ff1a17c..bb29c25f4567 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8610,6 +8610,7 @@ enum {
 	ALC669_FIXUP_ACER_ASPIRE_ETHOS,
 	ALC669_FIXUP_ACER_ASPIRE_ETHOS_HEADSET,
 	ALC671_FIXUP_HP_HEADSET_MIC2,
+	ALC662_FIXUP_ACER_X2660G_HEADSET_MODE,
 };
 
 static const struct hda_fixup alc662_fixups[] = {
@@ -8955,6 +8956,15 @@ static const struct hda_fixup alc662_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc671_fixup_hp_headset_mic2,
 	},
+	[ALC662_FIXUP_ACER_X2660G_HEADSET_MODE] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x1a, 0x02a1113c }, /* use as headset mic, without its own jack detect */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC662_FIXUP_USI_FUNC
+	},
 };
 
 static const struct snd_pci_quirk alc662_fixup_tbl[] = {
@@ -8966,6 +8976,7 @@ static const struct snd_pci_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x0349, "eMachines eM250", ALC662_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x1025, 0x034a, "Gateway LT27", ALC662_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x1025, 0x038b, "Acer Aspire 8943G", ALC662_FIXUP_ASPIRE),
+	SND_PCI_QUIRK(0x1025, 0x124e, "Acer 2660G", ALC662_FIXUP_ACER_X2660G_HEADSET_MODE),
 	SND_PCI_QUIRK(0x1028, 0x05d8, "Dell", ALC668_FIXUP_DELL_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x05db, "Dell", ALC668_FIXUP_DELL_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x05fe, "Dell XPS 15", ALC668_FIXUP_DELL_XPS13),
-- 
2.25.1


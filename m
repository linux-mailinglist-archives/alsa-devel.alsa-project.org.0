Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F744E4294
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 16:12:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 975CE16C6;
	Tue, 22 Mar 2022 16:11:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 975CE16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647961946;
	bh=vhc7kUu16ZrQCTC1+cys0nZ9ltSOwDUnSD4PgVoaKJY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZXYKj7ua2wJhRUtNHhDVLhp/H2+jRjwgDKrmGTeCyrovPIiB460/wulVka36krIP/
	 lPcpo5QO1+LTuoPgDTBTYnynB0ujXmKY8zSWQMgpNktQObcbUaeS5lrkZvwKH8DNxj
	 23I/BVK4hjyQ4h7k6/tLbkd4Gvcdj3ky9mcNpe6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2295EF8051F;
	Tue, 22 Mar 2022 16:10:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE936F80236; Sat, 19 Mar 2022 06:36:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13A34F80118
 for <alsa-devel@alsa-project.org>; Sat, 19 Mar 2022 06:35:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13A34F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="l3hkbqhu"
Received: by mail-pg1-x535.google.com with SMTP id o23so6494263pgk.13
 for <alsa-devel@alsa-project.org>; Fri, 18 Mar 2022 22:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gNnxz05ITktCjr1nYOEiyW+BK+GTcat0PUQxbZJOt2I=;
 b=l3hkbqhu00/1TQ7/VnwTvO2aKIAzpckQRCH3U+7Q2ltAMwmJtVQ4xT6V6ZrWN89Py6
 nbdSAeiDHlctj9zVzgwUUS+uMyuaYxjSu1I6UPf+SiPtqu0iaieKA6tbfdgg2HmGM6MF
 kcPFk3owJGu/NIv++zAnih6cCYXPWewWboHyOqOoTt6nQhjo8+DS0M7TD5oRZ8rN7tJ1
 iXXqobTALor8My722QrQOxt15JjA/2lehJP3nUvezcp4i4UsFoSdRWvk8ejpKdAeQIbG
 1olXLuSSpTqs4pHFoXZq5PZiBUznjbiaLbpB0cb81hIWYSj45QJ3HD+qX1320nVkzneE
 iPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gNnxz05ITktCjr1nYOEiyW+BK+GTcat0PUQxbZJOt2I=;
 b=zrqxjpiPG3b9WBN1lQpt0O2DP8NotxIakl+y5rCyvpS8R9XM0MaWtdpPj3RK7No7Yb
 5PNna4TCvpgoEOg9ET2TiRff2DYcvWmnuNJIS1ezk97wkuv+pyFIb6wqTm4HcW/FrluX
 RkA2Ot8No3wJyb37XlXY4QWN1XRSU9PxL9bRIg4NGuVrixywEVef9jxofC/f5173qSxu
 fP8e6zpqbkY/Co/l8fMLIX3+8Wm0lQdwZV3oYFrwsnO93tKbOYAx4BUM8A8bGZgv9DWm
 4j1vP1/zd2PtfCce+HqaareiWHBbCHGtgNDVOv+LTOIiqibWpvJlTog83z3Kd+1/FFD1
 aH4g==
X-Gm-Message-State: AOAM531GvEM5ZCGMSVH1nDijC82y5LV18car4gr5mXdcmsUA1oVp6mXW
 wUZa9BUl96L1jSZm77plJua297Er00ciOg==
X-Google-Smtp-Source: ABdhPJyUaPDPr2dFQS5ebn4dg4UbnIc9Gz7XDAuNLmSWgquL2gsHXWRYdyX4bhTaCxCqeTpwXzC1Bw==
X-Received: by 2002:a05:6a00:1312:b0:4e1:58c4:ddfd with SMTP id
 j18-20020a056a00131200b004e158c4ddfdmr13642450pfu.65.1647668156469; 
 Fri, 18 Mar 2022 22:35:56 -0700 (PDT)
Received: from linus.localnet (135-180-48-111.fiber.dynamic.sonic.net.
 [135.180.48.111]) by smtp.gmail.com with ESMTPSA id
 a38-20020a056a001d2600b004f70d5e92basm11396352pfx.34.2022.03.18.22.35.56
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 22:35:56 -0700 (PDT)
From: Matt Kramer <mccleetus@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add alc256-samsung-headphone fixup
Date: Fri, 18 Mar 2022 22:35:55 -0700
Message-ID: <4701574.GXAFRqVoOG@linus>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailman-Approved-At: Tue, 22 Mar 2022 16:10:01 +0100
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

This fixes the near-silence of the headphone jack on the ALC256-based Samsung 
Galaxy Book Flex Alpha (NP730QCJ). The magic verbs were found through trial 
and error, using known ALC298 hacks as inspiration. The fixup is auto-enabled 
only when the NP730QCJ is detected. It can be manually enabled using 
model=alc256-samsung-headphone.

Signed-off-by: Matt Kramer <mccleetus at gmail.com>
---
 Documentation/sound/hd-audio/models.rst |  4 ++++
 sound/pci/hda/patch_realtek.c           | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/sound/hd-audio/models.rst b/Documentation/sound/hd-
audio/models.rst
index d25335993e55..9b52f50a6854 100644
--- a/Documentation/sound/hd-audio/models.rst
+++ b/Documentation/sound/hd-audio/models.rst
@@ -261,6 +261,10 @@ alc-sense-combo
 huawei-mbx-stereo
     Enable initialization verbs for Huawei MBX stereo speakers;
     might be risky, try this at your own risk
+alc298-samsung-headphone
+    Samsung laptops with ALC298
+alc256-samsung-headphone
+    Samsung laptops with ALC256
 
 ALC66x/67x/892
 ==============
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1d14be4ee31d..f6ee67f41c45 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6958,6 +6958,7 @@ enum {
 	ALC236_FIXUP_HP_MUTE_LED,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF,
 	ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET,
+	ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET,
 	ALC295_FIXUP_ASUS_MIC_NO_PRESENCE,
 	ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS,
 	ALC269VC_FIXUP_ACER_HEADSET_MIC,
@@ -8286,6 +8287,14 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		},
 	},
+	[ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x08},
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x2fcf},
+			{ }
+		},
+	},
 	[ALC295_FIXUP_ASUS_MIC_NO_PRESENCE] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -9099,6 +9108,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc740, "Samsung Ativ book 8 (NP870Z5G)", 
ALC269_FIXUP_ATIV_BOOK_8),
 	SND_PCI_QUIRK(0x144d, 0xc812, "Samsung Notebook Pen S (NT950SBE-
X58)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x144d, 0xc830, "Samsung Galaxy Book Ion (NT950XCJ-
X716A)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
+	SND_PCI_QUIRK(0x144d, 0xc832, "Samsung Galaxy Book Flex Alpha 
(NP730QCJ)", ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", 
ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", 
ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", 
ALC283_FIXUP_HEADSET_MIC),
@@ -9445,6 +9455,7 @@ static const struct hda_model_fixup 
alc269_fixup_models[] = {
 	{.id = ALC298_FIXUP_HUAWEI_MBX_STEREO, .name = "huawei-mbx-stereo"},
 	{.id = ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE, .name = "alc256-
medion-headset"},
 	{.id = ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET, .name = "alc298-
samsung-headphone"},
+	{.id = ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET, .name = "alc256-
samsung-headphone"},
 	{.id = ALC255_FIXUP_XIAOMI_HEADSET_MIC, .name = "alc255-xiaomi-
headset"},
 	{.id = ALC274_FIXUP_HP_MIC, .name = "alc274-hp-mic-detect"},
 	{.id = ALC245_FIXUP_HP_X360_AMP, .name = "alc245-hp-x360-amp"},
-- 
2.35.1




Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0364E47C1
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 21:49:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ECB3176B;
	Tue, 22 Mar 2022 21:48:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ECB3176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647982177;
	bh=U9kimm/NwRGubBuwAtFsPe/OLEF2kdNfdjQFOm+mba8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q5JJkMWbbe9ez2Qi94To5GTzpgeK316nDs78ykZ3E/MQC+RZ0y3fSoIYkEZ3K3Jke
	 5CGZ9u5YqBClF40kMQZhiNmSnF1yFDdmF5kBAlvxshiN6bF6eG1f19ma9ASXDfrJfb
	 r1LgrbWtK5bhz2XpdU5222C+J+AAbJYx+dhvguYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CC25F8032D;
	Tue, 22 Mar 2022 21:48:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E98F5F8016C; Tue, 22 Mar 2022 21:48:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8068EF800FD
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 21:48:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8068EF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="So0L1CUN"
Received: by mail-pl1-x62a.google.com with SMTP id n18so16502494plg.5
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 13:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W8Tu+Zzf1uqfdccj10u5Suz0tB5byzepGopo7S6Ri+0=;
 b=So0L1CUN0LQQHhyccxi7/8gGUktWkRQDJZpSGxDIfyMijcGmXAcjxR430sDHFBl810
 OpuI0YPSxI7ZUENc8AK2nkABnbi25WJepRR8uFl6fef7VJTDw4lXTgs/uQYe7b2WPRgb
 I0hZH98tVn+nl1R2dnaIUw3DYn01dCD5wkox3A3DzDUEIbKrVqegOeJA8IYWjNBzMHi8
 bI43YAK7AxuFrFb+wGh+u6CPKWbY8OrQmqv5KlIJdvLLJqXLFm0VAECFtAvV7tHMaIVe
 aH+06MXBTu+HNqJ5i6UQKS4Uy4pRttxCmg7DLLoYL1I0AVBO+Mq+RB4+Z8I6kzFhWgZP
 fkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W8Tu+Zzf1uqfdccj10u5Suz0tB5byzepGopo7S6Ri+0=;
 b=WI9gN2NVTM8mB7V4Ag2RfUL4oIN2MYKknT910IFViJ9d6L0SPeAbq5c0XbQcME6WYh
 oWb7NO3pDaskrcDL8vT9bITzT55EheqRq1fZv7H/WuMmqfSPXk95FQHa+fS4bZFoaEwf
 0si2OISUF1W7Y0x69WynBLQcRTIQo3qNj2cDa6/j3kjJ4+/exuHhJ74zG01XHqqebBnV
 xRKUOhIQWaJX9Y+xfyDW66SkKP3wzMXqTGXNgTgFZtTxlHQk+R6LmlHV0bwIycL50ISv
 kiLbaqnFfcmu8+BnmAX5yEOC+PgExT/FP5M1k/J2sB1ONW8yHlZPBBUDawMUD5VfHYXn
 Z1Xw==
X-Gm-Message-State: AOAM533EU4G98zgpm5whu251g8r/oEDJk7Hmf9qO9VpAUjjrOOpZ8wES
 7aFsPTGEl20o+pRnzT6GzjSM0GZSLLIxmg==
X-Google-Smtp-Source: ABdhPJyYfYBkE3Ocor3IPPs1zB24uSESdhtMokOqAqbdAt1pcz/oRKMZvf6o6prLtsi3sWqJJRJ2GQ==
X-Received: by 2002:a17:902:6941:b0:14c:b815:6d45 with SMTP id
 k1-20020a170902694100b0014cb8156d45mr20119777plt.49.1647982098655; 
 Tue, 22 Mar 2022 13:48:18 -0700 (PDT)
Received: from linus.localnet (135-180-48-111.fiber.dynamic.sonic.net.
 [135.180.48.111]) by smtp.gmail.com with ESMTPSA id
 n3-20020a056a0007c300b004fa3e9f59cdsm18496269pfu.39.2022.03.22.13.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 13:48:18 -0700 (PDT)
From: Matt Kramer <mccleetus@gmail.com>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add alc256-samsung-headphone fixup
Date: Tue, 22 Mar 2022 13:48:17 -0700
Message-ID: <3168355.aeNJFYEL58@linus>
In-Reply-To: <s5hpmmdwyfm.wl-tiwai@suse.de>
References: <4394215.LvFx2qVVIh@linus> <s5hpmmdwyfm.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Takashi Iwai <tiwai@suse.de>
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

Sorry! Third time is the charm!

Signed-off-by: Matt Kramer <mccleetus@gmail.com>
---
 Documentation/sound/hd-audio/models.rst |  4 ++++
 sound/pci/hda/patch_realtek.c           | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/Documentation/sound/hd-audio/models.rst b/Documentation/sound/hd-audio/models.rst
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
 	SND_PCI_QUIRK(0x144d, 0xc740, "Samsung Ativ book 8 (NP870Z5G)", ALC269_FIXUP_ATIV_BOOK_8),
 	SND_PCI_QUIRK(0x144d, 0xc812, "Samsung Notebook Pen S (NT950SBE-X58)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x144d, 0xc830, "Samsung Galaxy Book Ion (NT950XCJ-X716A)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
+	SND_PCI_QUIRK(0x144d, 0xc832, "Samsung Galaxy Book Flex Alpha (NP730QCJ)", ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
 	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
@@ -9445,6 +9455,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC298_FIXUP_HUAWEI_MBX_STEREO, .name = "huawei-mbx-stereo"},
 	{.id = ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE, .name = "alc256-medion-headset"},
 	{.id = ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET, .name = "alc298-samsung-headphone"},
+	{.id = ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET, .name = "alc256-samsung-headphone"},
 	{.id = ALC255_FIXUP_XIAOMI_HEADSET_MIC, .name = "alc255-xiaomi-headset"},
 	{.id = ALC274_FIXUP_HP_MIC, .name = "alc274-hp-mic-detect"},
 	{.id = ALC245_FIXUP_HP_X360_AMP, .name = "alc245-hp-x360-amp"},
-- 
2.35.1





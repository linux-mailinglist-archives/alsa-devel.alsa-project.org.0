Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BDA4E47C7
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 21:52:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CC4E173E;
	Tue, 22 Mar 2022 21:51:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CC4E173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647982327;
	bh=/NazOwFbchx6JYuRGnSlnbJKBzUrZGUdCvhSBI8VW8c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mg6lsW00SWlCHTcvX+fyZe8L+rFngcjNbb0iyjMCZ/uFiZM8xpvG+1PsRjiz64WIX
	 ZNrTgvQpoiLRNDaGvN60QflBBBh6WdyeyLImqYRvNyO02p4n8xmOCn5KVMd7W09Ttv
	 GjIu9+ATIqfMyAATB3Fr8N4/vUmB3+qrPVpREB2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85653F8032D;
	Tue, 22 Mar 2022 21:51:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9DCAF8016C; Tue, 22 Mar 2022 21:50:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 093F4F80116
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 21:50:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 093F4F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ftknUWAF"
Received: by mail-pj1-x1031.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so3225500pjl.4
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 13:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Ihqf4fqdljZn9mRJSt/wSMKvUHZMOghrieKXp0pkqI=;
 b=ftknUWAFJCXoBlBuC3pWdVbyD2OM8aC3ecxEdeHkJ4tcmZNXELWIrkjlyeRvE1u4Aj
 vZqh3OfytjkVesqdHJjXQffea7zPZQ0er6gfWPk2IFoXURSu35kXMsnHVhqRfiVtdtWg
 W/0PuDO0v6WVeBf9BdvtePjOQsDwp/n0s8MmHKwjyaPjQWkdOpY2eBs49m2Yu6icoKmv
 6qG3QJnFdzAN+mX3Vo5alkYh5IYjM3cYdxnsgCHMOPkoVJqEsSEAvOS7cmMh85QtNBFz
 reF3+dG0PdDPIKFgedbPNvXQauek0R1kmTfrz8vDUojPJjYjGibylKtNfygfMqJ1kc4Z
 y2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Ihqf4fqdljZn9mRJSt/wSMKvUHZMOghrieKXp0pkqI=;
 b=UOuBVh9CMeTStF+PF5s7sC/oh1qCQCB8vv/lszzZMaFPlFIQEl+6AbBZa285skCOem
 U77C84F5BNhuUZgFEGrgjKlxWCgi/WUYnjPIxnz7mC9NoGsqIZp2LjwDoCWrjYSsfsUk
 lazUOI0Y9zCznDLWrkzieiqH88tvzWKElNu8rHLP12BzJ7fDOPc/t5kHjs4m5GLE1F2q
 +T4IC4qGAcLWjMPRiRz1GSVnGsQj2Yf34WTFSj9cnyLPcbPdS3Q4oReILAbqm76RblBE
 XYLJMSrMmGkJpbe+e4UwBvAywT4FRZp5b2gJ+lYVC0H986ipkVkuoR6n6YQO8K/IHJp9
 dEyQ==
X-Gm-Message-State: AOAM531NB95hbolgMGMnS5K/sw3qD7B4BvZ2dKxt6uf4u2FVox2UG7oc
 PzyCLFjAsqSJNKwM5CSFKnUPEJMTTlOIAA==
X-Google-Smtp-Source: ABdhPJy/BDz3XggDbtWQjp8JrP5QPpmcMmOvbBVr9liWl61/HPgld6M/hZN+yMHp+gu9z/ESmVLxow==
X-Received: by 2002:a17:90a:880e:b0:1bc:650b:6be5 with SMTP id
 s14-20020a17090a880e00b001bc650b6be5mr7327230pjn.34.1647982250918; 
 Tue, 22 Mar 2022 13:50:50 -0700 (PDT)
Received: from linus.localnet (135-180-48-111.fiber.dynamic.sonic.net.
 [135.180.48.111]) by smtp.gmail.com with ESMTPSA id
 p12-20020a63ab0c000000b00381f7577a5csm16254983pgf.17.2022.03.22.13.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 13:50:50 -0700 (PDT)
From: Matt Kramer <mccleetus@gmail.com>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add alc256-samsung-headphone fixup
Date: Tue, 22 Mar 2022 13:50:49 -0700
Message-ID: <8050239.T7Z3S40VBb@linus>
In-Reply-To: <3168355.aeNJFYEL58@linus>
References: <4394215.LvFx2qVVIh@linus> <s5hpmmdwyfm.wl-tiwai@suse.de>
 <3168355.aeNJFYEL58@linus>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart10059974.nUPlyArG6x"
Content-Transfer-Encoding: 7Bit
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

This is a multi-part message in MIME format.

--nextPart10059974.nUPlyArG6x
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

OK, sorry again, I am attaching it. My MUA is silently converting tabs it seems.
--nextPart10059974.nUPlyArG6x
Content-Disposition: attachment; filename="0001-ALSA-hda-realtek-Add-alc256-samsung-headphone-fixup.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0001-ALSA-hda-realtek-Add-alc256-samsung-headphone-fixup.patch"

From 1397e7fd6f8aee2ca32cac7f36e2e3472703129b Mon Sep 17 00:00:00 2001
From: Matt Kramer <matt314159@gmail.com>
Date: Thu, 16 Dec 2021 21:39:29 -0800
Subject: ALSA: hda/realtek: Add alc256-samsung-headphone fixup

Also enable the fixup automatically when the Galaxy Book Flex
Alpha (NP730QCJ) is detected. Document both the alc298 and alc256
Samsung headphone fixups.
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


--nextPart10059974.nUPlyArG6x--




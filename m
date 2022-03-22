Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0DC4E4667
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 20:01:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2004826;
	Tue, 22 Mar 2022 20:00:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2004826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647975695;
	bh=bxt99hdQ8xsfrDZg/OO4XP4Wdb0Gcd6mxSy1kFf6rVQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e+89JsYJkLt8UiXsa/+OmX0uE3rMW5rJmO0oixvjG/Qr3S9MZ6jjk99eooJ2j+tjE
	 6LXAsv9x2IvnHfViA+oduauCmq3y1QezDNyevKg/mGOUk8T32f537R0BScc3Khl3K5
	 juC9IJIICBtpNcj/y89BZk2KBK7cUGSOW5E03+XE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30F35F8032D;
	Tue, 22 Mar 2022 20:00:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06A50F8016C; Tue, 22 Mar 2022 20:00:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C5AEF80116
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 20:00:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C5AEF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="N327duTu"
Received: by mail-pf1-x431.google.com with SMTP id d19so18936024pfv.7
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 12:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YHl+ifj4xbRI5JUHZfiaxwHAjRrVEcxVQSBlzmD8zUw=;
 b=N327duTu9QOZnRG7WnnOMeQWddsv+hhiiN15nXYK8d53pya2ftQjxWgzvTPdCXvdD8
 SSJ7kGCwHj783Styr+bntqkbu9bMjGx97EDomUtBMohusUR9n/gTPBVIsXJ2UyKaCut/
 mlRULs1USzspMTB8svoSDrcYQKRnR/mPwzs9vJc/loi+RVLMM758tLwmcdDc9iBVePe+
 oqol0txP8ShJxlg2zrxHQAlQooNtCQO5VFMjLCZ0zD0y+9/TSgrKg7udlc28pzee3kCw
 TKpeKlnx4kfLen+hbCYca1n52moP/oSlciEBvltvu5KhCQ2FgmAfyjfYyc38fpsqQXcK
 0QqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YHl+ifj4xbRI5JUHZfiaxwHAjRrVEcxVQSBlzmD8zUw=;
 b=C+53Y0v+9ENrVtUsQA0/px8B6fhjFUt7WTQmc886XUYamLsrEWqpJSMoCMz7SHL9Up
 pMug42RXTNLQgg7yIPEJtYqtILyGclKdtwXlruF6fkI4+Zk3ZissG62r0Ku/6778ma2b
 XTHr7na3SdrvXQ0ZJsaaAiGME3Mv32RLENou6NYop1qr8D1Zk5XYDpaKETT+kG3/5pUK
 qekMZPaCf/wwMLSZEi53O66vB8zBH+GaVQuMV7UpV6abdGgVbMzDyqRdDUGSvfEw1VPp
 jzyONKY+otXVx+XesUk9iJsgJFH3/HX5DPP6QeyuBnsm9ksXQgAuGKfMBrF5ApV1SlVl
 gAGw==
X-Gm-Message-State: AOAM532OJBahBLIYAZUVWGPs8bOhoATiVeJetOtnM3B/FVS+LrkenD7U
 9/fu22aRV6BI8Axl7dsHn+pQW9xUqM34Yw==
X-Google-Smtp-Source: ABdhPJxgllvMaQ9iOoGnRz0C+CgoKRchCl+3BqZusU/5MrnIicvU6VIjyudtffVbJVF2lM6HRc96zA==
X-Received: by 2002:a05:6a00:80f:b0:4fa:9bd6:1cd3 with SMTP id
 m15-20020a056a00080f00b004fa9bd61cd3mr12534220pfk.57.1647975621379; 
 Tue, 22 Mar 2022 12:00:21 -0700 (PDT)
Received: from linus.localnet (135-180-48-111.fiber.dynamic.sonic.net.
 [135.180.48.111]) by smtp.gmail.com with ESMTPSA id
 m11-20020a056a00080b00b004f791d0115esm25695559pfk.171.2022.03.22.12.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 12:00:21 -0700 (PDT)
From: Matt Kramer <mccleetus@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: hda/realtek: Add alc256-samsung-headphone fixup
Date: Tue, 22 Mar 2022 12:00:20 -0700
Message-ID: <4394215.LvFx2qVVIh@linus>
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

Changes since v1: Formatting (forgot to disable word-wrap, sorry).

This fixes the near-silence of the headphone jack on the ALC256-based Samsung Galaxy Book Flex Alpha (NP730QCJ). The magic verbs were found through trial and error, using known ALC298 hacks as inspiration. The fixup is auto-enabled only when the NP730QCJ is detected. It can be manually enabled using model=alc256-samsung-headphone.

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
+       ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET,
        ALC295_FIXUP_ASUS_MIC_NO_PRESENCE,
        ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS,
        ALC269VC_FIXUP_ACER_HEADSET_MIC,
@@ -8286,6 +8287,14 @@ static const struct hda_fixup alc269_fixups[] = {
                        { }
                },
        },
+       [ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET] = {
+               .type = HDA_FIXUP_VERBS,
+               .v.verbs = (const struct hda_verb[]) {
+                       { 0x20, AC_VERB_SET_COEF_INDEX, 0x08},
+                       { 0x20, AC_VERB_SET_PROC_COEF, 0x2fcf},
+                       { }
+               },
+       },
        [ALC295_FIXUP_ASUS_MIC_NO_PRESENCE] = {
                .type = HDA_FIXUP_PINS,
                .v.pins = (const struct hda_pintbl[]) {
@@ -9099,6 +9108,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
        SND_PCI_QUIRK(0x144d, 0xc740, "Samsung Ativ book 8 (NP870Z5G)", ALC269_FIXUP_ATIV_BOOK_8),
        SND_PCI_QUIRK(0x144d, 0xc812, "Samsung Notebook Pen S (NT950SBE-X58)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
        SND_PCI_QUIRK(0x144d, 0xc830, "Samsung Galaxy Book Ion (NT950XCJ-X716A)", ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
+       SND_PCI_QUIRK(0x144d, 0xc832, "Samsung Galaxy Book Flex Alpha (NP730QCJ)", ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET),
        SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
        SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
        SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
@@ -9445,6 +9455,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
        {.id = ALC298_FIXUP_HUAWEI_MBX_STEREO, .name = "huawei-mbx-stereo"},
        {.id = ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE, .name = "alc256-medion-headset"},
        {.id = ALC298_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET, .name = "alc298-samsung-headphone"},
+       {.id = ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET, .name = "alc256-samsung-headphone"},
        {.id = ALC255_FIXUP_XIAOMI_HEADSET_MIC, .name = "alc255-xiaomi-headset"},
        {.id = ALC274_FIXUP_HP_MIC, .name = "alc274-hp-mic-detect"},
        {.id = ALC245_FIXUP_HP_X360_AMP, .name = "alc245-hp-x360-amp"},
-- 
2.35.1




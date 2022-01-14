Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 189BB48EEA4
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 17:46:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF5671FD0;
	Fri, 14 Jan 2022 17:45:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF5671FD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642178783;
	bh=0waDoQbv5mKzAM1K3zBUGeO/uCd4wcc/cuUPDKP8g4s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AtDtyfvkrYkKh60mAt24q/bHPh9/F6hisDaKCSszLBb/ng8dkaiC6inQfJUiCDRSy
	 SVf1E+RqQ/GdIzsjJI+3YwICXG3+zPRgijwGU40Zjvyev3Agf3PdwYeUNBQGVsjtWP
	 SLIFAAUQRCasxBouHmAGfQaOvFfwh/HPKt2vovb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 105A2F800CE;
	Fri, 14 Jan 2022 17:45:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8ED8AF8030F; Fri, 14 Jan 2022 17:45:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D2BEF800CE
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 17:45:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D2BEF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="K8NvBUy5"
Received: by mail-lf1-x134.google.com with SMTP id d3so31939269lfv.13
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 08:45:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:user-agent:references
 :mime-version:content-disposition:in-reply-to;
 bh=+Ewl4Z1YzYAlBkYJHiGEEyV0oXVxsjSkcQKpSsXudmY=;
 b=K8NvBUy53fi8ana5vroczUiRdXFyT9R9/wAmRZbCSLWgnGiBWEUE3075TJh3ghWG5+
 fjSl0jcQiC0R/5QGoXS6RFG3daJ+Kx7EP7RFy69O+5tAoQMUc6GTcZ1XEvBEidwxzVFD
 s2SDusPeQjW4xPLzvB0Br+OO95QyMO0JESSCqVwodvlIokcT07ZGw7GXe/trOQcNCp6I
 hzRAbVPtpRDY6qmtGCys2wgFKO/BaDqXhG1Bs5HWHyu/SzB6mU7M7z6tV99RWipo76og
 TCkWyudx5nKk9zmncKJ+YL30yF9kAZlMGS98JfjixvvgRWcIJ8H179AUVw3YEk+biUMq
 LkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:user-agent
 :references:mime-version:content-disposition:in-reply-to;
 bh=+Ewl4Z1YzYAlBkYJHiGEEyV0oXVxsjSkcQKpSsXudmY=;
 b=lJVUyvozMpQZTbMJaLMFG3UCOfMAC2Ry7lI8pUyD9J9F6F9lWVRyf87ejaizfnHavS
 QvzdNI5UIIJ5oqAQS2Sg0YEEVYI+20i8mWWgxUqpX5Bu9GsZKLn5MFUBaGWmK+s9WBok
 p3svMr3cBy+zrt1/s4KYj55hNfGCd+olts33gpDX/uLdPOiHeEpx53QlB4+bYKUOcGUV
 QpBN9UWd5Uuh7gm+44mH+1QHotFeRe3kbXEMfunhr83oozWhBs86Hk/8ge0dh2MO5pDM
 Sm8suXDr29CkDGd3H6MgqWByXbIxrlN8h+Kk/roC3ys4Lv+VBXmawjN35g0H0zxALCw8
 hA2w==
X-Gm-Message-State: AOAM5333sEyEdyYxQEjpGmGygLYydydu7f0bscnxOE70ylwXr71HTjpP
 GsGM+6SpFAuvr9EvARd8YbM=
X-Google-Smtp-Source: ABdhPJy52fzrZR4GVtyxgjM2bL1dY3ywuTuj1Hr/avoeO6sl7A+zqJ/FvElf9ZvHWvkt6QdLDbuDsQ==
X-Received: by 2002:ac2:4d4c:: with SMTP id 12mr7774929lfp.554.1642178709529; 
 Fri, 14 Jan 2022 08:45:09 -0800 (PST)
Received: from localhost.localdomain (ntd06459.static.corbina.ru.
 [95.31.14.149])
 by smtp.gmail.com with ESMTPSA id d6sm631744lfn.149.2022.01.14.08.45.08
 (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
 Fri, 14 Jan 2022 08:45:09 -0800 (PST)
Date: Fri, 14 Jan 2022 19:50:50 +0300
From: Alexander Sergeyev <sergeev917@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jeremy Szu <jeremy.szu@canonical.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Hui Wang <hui.wang@canonical.com>, Cameron Berkenpas <cam@neo-zeon.de>,
 Kailang Yang <kailang@realtek.com>, Sami Loone <sami@loone.fi>,
 Elia Devito <eliadevito@gmail.com>
Subject: [PATCH v2 1/1] ALSA: hda/realtek: fix speakers and micmute on HP 855
 G8
Message-ID: <20220114165050.ouw2nknuspclynro@localhost.localdomain>
User-Agent: mtt
References: <20220114164904.lgj7yimbei6fmloe@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220114164904.lgj7yimbei6fmloe@localhost.localdomain>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

There are several PCI ids associated with HP EliteBook 855 G8 Notebook
PC. Commit 0e68c4b11f1e6 ("ALSA: hda/realtek: fix mute/micmute LEDs for
HP 855 G8") covers 0x103c:0x8896, while this commit covers 0x103c:0x8895
which needs some additional work on top of the quirk from 0e68c4b11f1e6.

Note that the device can boot up with working speakers and micmute LED
without this patch, but the success rate would be quite low (order of
16 working boots across 709 boots) at least for the built-in drivers
scenario. This also means that there are some timing issues during early
boot and this patch is a workaround.

With this patch applied speakers and headphones are consistenly working,
as well as mute/micmute LEDs and the internal microphone.

Signed-off-by: Alexander Sergeyev <sergeev917@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index eef973661b0a..668274e52674 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6948,6 +6948,7 @@ enum {
 	ALC285_FIXUP_LEGION_Y9000X_AUTOMUTE,
 	ALC287_FIXUP_LEGION_16ACHG6,
 	ALC287_FIXUP_CS35L41_I2C_2,
+	ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8698,6 +8699,16 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cs35l41_fixup_i2c_two,
 	},
+	[ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			 { 0x20, AC_VERB_SET_COEF_INDEX, 0x19 },
+			 { 0x20, AC_VERB_SET_PROC_COEF, 0x8e11 },
+			 { }
+		},
+		.chained = true,
+		.chain_id = ALC285_FIXUP_HP_MUTE_LED,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -8911,6 +8922,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8870, "HP ZBook Fury 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8873, "HP ZBook Studio 15.6 Inch G8 Mobile Workstation PC", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x888d, "HP ZBook Power 15.6 inch G8 Mobile Workstation PC", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8895, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8896, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8898, "HP EliteBook 845 G8 Notebook PC", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x103c, 0x88d0, "HP Pavilion 15-eh1xxx (mainboard 88D0)", ALC287_FIXUP_HP_GPIO_LED),
-- 
2.34.1


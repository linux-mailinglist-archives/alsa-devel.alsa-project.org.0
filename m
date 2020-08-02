Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C62ED23561F
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Aug 2020 11:26:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B0B316CD;
	Sun,  2 Aug 2020 11:25:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B0B316CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596360362;
	bh=ceviDbJZWQ0AWkgpcPH93/YZ0YYiMa7izRcN09qJ5so=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eRLJNwp0niEb8vohUHc31ZcZSfolW0VBxweIdo2tgdxvpKobeZu3p00/hvwa0198L
	 MYnL3VDIOOugrI6ugmggpAT2nHrOnAf3tqD2z7VEWdySiOfwwo7f7jko81D3Lv2jH3
	 CXJmZT8egnFgxn+DF2Ybm4actJe1Mvi8IIBFfj8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82FEBF8014C;
	Sun,  2 Aug 2020 11:24:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C100AF8011C; Sun,  2 Aug 2020 11:24:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D402F8011C
 for <alsa-devel@alsa-project.org>; Sun,  2 Aug 2020 11:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D402F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="KMg9EsEl"
Received: by mail-pf1-x441.google.com with SMTP id 74so8371645pfx.13
 for <alsa-devel@alsa-project.org>; Sun, 02 Aug 2020 02:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=v7ALYAkLUWompM8naTRHeAKE1kf70JToiGEcNFmDAfs=;
 b=KMg9EsEl36z1V0jHsiMS0N/TnXImOz6wNO2eMx1EkZOOfYHi4a3/sKtoRfuGFtir0s
 xTwpgN0WpcPMABuws8F5rxX0K2RZeCieogfPxCT+QYnR3eK+qB4sTAj8vwXwOFR8xlot
 YKNT7iCCFYZGS0i430vTh4JkDiei7xmxYdcQnuJje6IgAbdDmXdnnmkoPOjRxerQxFEp
 71yRkNrN5ES1aanvIk/8h/Cmc72XvUI3tE3uwCJG5tRUwFtiI6v+AQDzntfVcY+NzILq
 MATc6SEsx42t41/u1MPAXZEwP7KspDggiKcr+L3A5AkV9bZi9mk9hb724BqOXVzIhFCq
 npYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=v7ALYAkLUWompM8naTRHeAKE1kf70JToiGEcNFmDAfs=;
 b=p2139JOi4caaVqnehYQ/5+BY2DZ2CJVvYkRNhJoqhXWUEbOprooAV8clWPklgKsYjR
 DI5ZdQqDqfPgrty8f4/E7zqUeVX275vdIiC7VlBjRyu5izvz14fwTTNk31w/yXdYUhnU
 g/LaTZtRS+DCyMkzNLkgu1+uykvT6CJlplqoOa1josRsz0P0bCicA/jy+kPMFldbcB0g
 HdsFqIyn1VpuOX3+/SRjCft7+XVMQfHg568pCRtqSOvXPwi2gAzoR5xCKeF3FWi9VT7K
 VOrIzxEb7V11janEK0ojONvh3ymjqor2Z0TSqN8SsD/qA0sUTGAtCM/4UpXZ2BeqQsXK
 eBXw==
X-Gm-Message-State: AOAM530MOObYrUjkOk7IMXmwgdCyVuZw7fvzetIY1RpecW7Nb0D4UxFt
 GKhkBZjQSDhxVg8a4/YD75k=
X-Google-Smtp-Source: ABdhPJx9dywdbpgc7vKV+2z79acuF8MyZzeYgzKQfB5qzsE9HhnSUip7yedSjEWHjC2lgzTOndhRFw==
X-Received: by 2002:a62:cf04:: with SMTP id b4mr10507310pfg.84.1596360242676; 
 Sun, 02 Aug 2020 02:24:02 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com.
 [34.92.144.28])
 by smtp.gmail.com with ESMTPSA id z8sm16334710pgz.7.2020.08.02.02.23.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Aug 2020 02:24:02 -0700 (PDT)
From: Huacai Chen <chenhc@lemote.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH] ALSA: hda/realtek: Add alc269/alc662 pin-tables for
 Loongson-3 laptops
Date: Sun,  2 Aug 2020 17:26:40 +0800
Message-Id: <1596360400-32425-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Cc: Huacai Chen <chenhuacai@gmail.com>, Huacai Chen <chenhc@lemote.com>,
 alsa-devel@alsa-project.org
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

There are several Loongson-3 based laptops produced by CZC or Lemote,
they use alc269/alc662 codecs and need specific pin-tables, this patch
add their pin-tables.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 sound/pci/hda/patch_realtek.c | 114 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 29f5878..65c75c6 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6166,6 +6166,11 @@ enum {
 	ALC289_FIXUP_ASUS_GA502,
 	ALC256_FIXUP_ACER_MIC_NO_PRESENCE,
 	ALC285_FIXUP_HP_GPIO_AMP_INIT,
+	ALC269_FIXUP_CZC_B20,
+	ALC269_FIXUP_CZC_TMI,
+	ALC269_FIXUP_CZC_L101,
+	ALC269_FIXUP_LEMOTE_A1802,
+	ALC269_FIXUP_LEMOTE_A190X,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7404,6 +7409,89 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_HP_GPIO_LED
 	},
+	[ALC269_FIXUP_CZC_B20] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x12, 0x411111f0 },
+			{ 0x14, 0x90170110 }, /* speaker */
+			{ 0x15, 0x032f1020 }, /* HP out */
+			{ 0x17, 0x411111f0 },
+			{ 0x18, 0x03ab1040 }, /* mic */
+			{ 0x19, 0xb7a7013f },
+			{ 0x1a, 0x0181305f },
+			{ 0x1b, 0x411111f0 },
+			{ 0x1d, 0x411111f0 },
+			{ 0x1e, 0x411111f0 },
+			{ }
+		},
+		.chain_id = ALC269_FIXUP_DMIC,
+	},
+	[ALC269_FIXUP_CZC_TMI] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x12, 0x4000c000 },
+			{ 0x14, 0x90170110 }, /* speaker */
+			{ 0x15, 0x0421401f }, /* HP out */
+			{ 0x17, 0x411111f0 },
+			{ 0x18, 0x04a19020 }, /* mic */
+			{ 0x19, 0x411111f0 },
+			{ 0x1a, 0x411111f0 },
+			{ 0x1b, 0x411111f0 },
+			{ 0x1d, 0x40448505 },
+			{ 0x1e, 0x411111f0 },
+			{ 0x20, 0x8000ffff },
+			{ }
+		},
+		.chain_id =ALC269_FIXUP_DMIC,
+	},
+	[ALC269_FIXUP_CZC_L101] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x12, 0x40000000 },
+			{ 0x14, 0x01014010 }, /* speaker */
+			{ 0x15, 0x411111f0 }, /* HP out */
+			{ 0x16, 0x411111f0 },
+			{ 0x18, 0x01a19020 }, /* mic */
+			{ 0x19, 0x02a19021 },
+			{ 0x1a, 0x0181302f },
+			{ 0x1b, 0x0221401f },
+			{ 0x1c, 0x411111f0 },
+			{ 0x1d, 0x4044c601 },
+			{ 0x1e, 0x411111f0 },
+			{ }
+		},
+		.chain_id =ALC269_FIXUP_DMIC,
+	},
+	[ALC269_FIXUP_LEMOTE_A1802] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x12, 0x40000000 },
+			{ 0x14, 0x90170110 }, /* speaker */
+			{ 0x17, 0x411111f0 },
+			{ 0x18, 0x03a19040 }, /* mic1 */
+			{ 0x19, 0x90a70130 }, /* mic2 */
+			{ 0x1a, 0x411111f0 },
+			{ 0x1b, 0x411111f0 },
+			{ 0x1d, 0x40489d2d },
+			{ 0x1e, 0x411111f0 },
+			{ 0x20, 0x0003ffff },
+			{ 0x21, 0x03214020 },
+			{ }
+		},
+		.chain_id = ALC269_FIXUP_DMIC,
+	},
+	[ALC269_FIXUP_LEMOTE_A190X] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x14, 0x99130110 }, /* speaker */
+			{ 0x15, 0x0121401f }, /* HP out */
+			{ 0x18, 0x01a19c20 }, /* rear  mic */
+			{ 0x19, 0x99a3092f }, /* front mic */
+			{ 0x1b, 0x0201401f }, /* front lineout */
+			{ }
+		},
+		.chain_id = ALC269_FIXUP_DMIC,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7693,9 +7781,14 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Quanta FL1", ALC269_FIXUP_PCM_44K),
 	SND_PCI_QUIRK(0x17aa, 0x9e54, "LENOVO NB", ALC269_FIXUP_LENOVO_EAPD),
 	SND_PCI_QUIRK(0x19e5, 0x3204, "Huawei MACH-WX9", ALC256_FIXUP_HUAWEI_MACH_WX9_PINS),
+	SND_PCI_QUIRK(0x1b35, 0x1235, "CZC B20", ALC269_FIXUP_CZC_B20),
+	SND_PCI_QUIRK(0x1b35, 0x1236, "CZC TMI", ALC269_FIXUP_CZC_TMI),
+	SND_PCI_QUIRK(0x1b35, 0x1237, "CZC L101", ALC269_FIXUP_CZC_L101),
 	SND_PCI_QUIRK(0x1b7d, 0xa831, "Ordissimo EVE2 ", ALC269VB_FIXUP_ORDISSIMO_EVE2), /* Also known as Malata PC-B1303 */
 	SND_PCI_QUIRK(0x1d72, 0x1901, "RedmiBook 14", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x10ec, 0x118c, "Medion EE4254 MD62100", ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1c06, 0x2013, "Lemote A1802", ALC269_FIXUP_LEMOTE_A1802),
+	SND_PCI_QUIRK(0x1c06, 0x2015, "Lemote A190X", ALC269_FIXUP_LEMOTE_A190X),
 
 #if 0
 	/* Below is a quirk table taken from the old code.
@@ -8951,6 +9044,7 @@ enum {
 	ALC662_FIXUP_LED_GPIO1,
 	ALC662_FIXUP_IDEAPAD,
 	ALC272_FIXUP_MARIO,
+	ALC662_FIXUP_CZC_ET26,
 	ALC662_FIXUP_CZC_P10T,
 	ALC662_FIXUP_SKU_IGNORE,
 	ALC662_FIXUP_HP_RP5800,
@@ -9020,6 +9114,25 @@ static const struct hda_fixup alc662_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc272_fixup_mario,
 	},
+	[ALC662_FIXUP_CZC_ET26] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{0x12, 0x403cc000},
+			{0x14, 0x90170110}, /* speaker */
+			{0x15, 0x411111f0},
+			{0x16, 0x411111f0},
+			{0x18, 0x01a19030}, /* mic */
+			{0x19, 0x90a7013f}, /* int-mic */
+			{0x1a, 0x01014020},
+			{0x1b, 0x0121401f},
+			{0x1c, 0x411111f0},
+			{0x1d, 0x411111f0},
+			{0x1e, 0x40478e35},
+			{}
+		},
+		.chained = true,
+		.chain_id = ALC662_FIXUP_SKU_IGNORE
+	},
 	[ALC662_FIXUP_CZC_P10T] = {
 		.type = HDA_FIXUP_VERBS,
 		.v.verbs = (const struct hda_verb[]) {
@@ -9403,6 +9516,7 @@ static const struct snd_pci_quirk alc662_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1849, 0x5892, "ASRock B150M", ALC892_FIXUP_ASROCK_MOBO),
 	SND_PCI_QUIRK(0x19da, 0xa130, "Zotac Z68", ALC662_FIXUP_ZOTAC_Z68),
 	SND_PCI_QUIRK(0x1b0a, 0x01b8, "ACER Veriton", ALC662_FIXUP_ACER_VERITON),
+	SND_PCI_QUIRK(0x1b35, 0x1234, "CZC ET26", ALC662_FIXUP_CZC_ET26),
 	SND_PCI_QUIRK(0x1b35, 0x2206, "CZC P10T", ALC662_FIXUP_CZC_P10T),
 	SND_PCI_QUIRK(0x1025, 0x0566, "Acer Aspire Ethos 8951G", ALC669_FIXUP_ACER_ASPIRE_ETHOS),
 
-- 
2.7.0


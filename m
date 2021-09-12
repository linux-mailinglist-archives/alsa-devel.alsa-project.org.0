Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B764408249
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 01:16:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C8C783B;
	Mon, 13 Sep 2021 01:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C8C783B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631488595;
	bh=a1lb6h5ysuEhV5ufhFExrBbOjIJLJMRPl3KOBsKLayo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YfoHRwwiCaoCl2a2outosFVf9jHPtSu1W3kAQtGZbie7rCfBXQOrO73CJI0u8q3gZ
	 5Q50YiAwDzgwqDOFtfLA61i9ZVEn9LN7Hu3GZ2sw4g5kxCpSsiptFe1RDQvD+FwjFY
	 Kxw2pFvITB009BjR9xQ7JG3OnMj/opNHY+KrGFLk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8E4FF80143;
	Mon, 13 Sep 2021 01:15:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E46DF8025E; Mon, 13 Sep 2021 01:15:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from neo-zeon.de (neo-zeon.de [70.229.12.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 828EAF80143
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 01:15:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 828EAF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=neo-zeon.de header.i=@neo-zeon.de
 header.b="NDAyYuo8"
Received: from neo-zeon.de (localhost [127.0.0.1])
 by neo-zeon.de (OpenSMTPD) with ESMTP id 40a82549;
 Sun, 12 Sep 2021 16:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=neo-zeon.de; h=from:to:cc
 :subject:date:message-id:mime-version:content-transfer-encoding;
 s=1; bh=1Zqly45Kdc+qa2qUMlEPexe8ae0=; b=NDAyYuo8CLYybe5zt/g/N0K
 FpWpRE5oLqoA6ElLg8e+ImCNtMTJG7CiwVmR+dMeBZGa5dex5AZpTtOlfebW6gvk
 0bzfLCy43JtmZ1yIiy2ELQVqv64thDf8Uk32bEyZ05RrdFoAyUmG7WWN+did3v1x
 RsUV+WtYUUpy4fh1naQ0=
Received: by neo-zeon.de (OpenSMTPD) with ESMTPSA id 17eff5ae
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sun, 12 Sep 2021 16:08:26 -0700 (PDT)
From: Cameron Berkenpas <cam@neo-zeon.de>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda/realtek: Quirks to enable speaker output for Lenovo
 Legion 7i 15IMHG05, Yoga 7i 14ITL5/15ITL5, and 13s Gen2 laptops.
Date: Sun, 12 Sep 2021 16:07:16 -0700
Message-Id: <20210912230715.156221-1-cam@neo-zeon.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cameron Berkenpas <cam@neo-zeon.de>
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

This patch initializes and enables speaker output on the Lenovo Legion 7i
15IMHG05, Yoga 7i 14ITL5/15ITL5, and 13s Gen2 series of laptops using the
HDA verb sequence specific to each model.

Speaker automute is disabled for the Lenovo Legion 7i 15IMHG05 to avoid
breaking speaker output on resume and when devices are unplugged from its
headphone jack.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=208555
Signed-off-by: Cameron Berkenpas <cam@neo-zeon.de>
---
 sound/pci/hda/patch_realtek.c | 129 ++++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8b7a389b6aed..7e94107e8e59 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6429,6 +6429,20 @@ static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
 	hda_fixup_thinkpad_acpi(codec, fix, action);
 }
 
+/* Fixup for Lenovo Legion 15IMHg05 speaker output on headset removal. */
+static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
+						  const struct hda_fixup *fix,
+						  int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_INIT:
+		spec->gen.automute_speaker = 0;
+		break;
+	}
+}
+
 /* for alc295_fixup_hp_top_speakers */
 #include "hp_x360_helper.c"
 
@@ -6646,6 +6660,10 @@ enum {
 	ALC623_FIXUP_LENOVO_THINKSTATION_P340,
 	ALC255_FIXUP_ACER_HEADPHONE_AND_MIC,
 	ALC236_FIXUP_HP_LIMIT_INT_MIC_BOOST,
+	ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS,
+	ALC287_FIXUP_LEGION_15IMHG05_AUTOMUTE,
+	ALC287_FIXUP_YOGA7_14ITL_SPEAKERS,
+	ALC287_FIXUP_13S_GEN2_SPEAKERS
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8236,6 +8254,113 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF,
 	},
+	[ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS] = {
+		.type = HDA_FIXUP_VERBS,
+		//.v.verbs = legion_15imhg05_coefs,
+		.v.verbs = (const struct hda_verb[]) {
+			 // set left speaker Legion 7i.
+			 {0x20, AC_VERB_SET_COEF_INDEX, 0x24 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x41 },
+
+			 {0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0xc },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x1a },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+
+			 {0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x2 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+
+			 // set right speaker Legion 7i.
+			 {0x20, AC_VERB_SET_COEF_INDEX, 0x24 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x42 },
+
+			 {0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0xc },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x2a },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+
+			 {0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x2 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+			 {}
+		},
+		.chained = true,
+		.chain_id = ALC287_FIXUP_LEGION_15IMHG05_AUTOMUTE,
+	},
+	[ALC287_FIXUP_LEGION_15IMHG05_AUTOMUTE] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc287_fixup_legion_15imhg05_speakers,
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE,
+	},
+	[ALC287_FIXUP_YOGA7_14ITL_SPEAKERS] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			 // set left speaker Yoga 7i.
+			 {0x20, AC_VERB_SET_COEF_INDEX, 0x24 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x41 },
+
+			 {0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0xc },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x1a },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+
+			 {0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x2 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+
+			 // set right speaker Yoga 7i.
+			 {0x20, AC_VERB_SET_COEF_INDEX, 0x24 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x46 },
+
+			 {0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0xc },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x2a },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+
+			 {0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x2 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+			 {}
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE,
+	},
+	[ALC287_FIXUP_13S_GEN2_SPEAKERS] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+		         {0x20, AC_VERB_SET_COEF_INDEX, 0x24 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x41 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x2 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+			 {0x20, AC_VERB_SET_COEF_INDEX, 0x24 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x42 },
+			 {0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x2 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			 {0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+			 {}
+		},
+		.chained = true,
+		.chain_id = ALC269_FIXUP_HEADSET_MODE,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -8630,6 +8755,10 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940", ALC298_FIXUP_LENOVO_SPK_VOLUME),
 	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
 	SND_PCI_QUIRK(0x17aa, 0x3843, "Yoga 9i", ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP),
+	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
+	SND_PCI_QUIRK(0x17aa, 0x3852, "Lenovo Yoga 7 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
+	SND_PCI_QUIRK(0x17aa, 0x3853, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
+	SND_PCI_QUIRK(0x17aa, 0x3819, "Lenovo 13s Gen2 ITL", ALC287_FIXUP_13S_GEN2_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
 	SND_PCI_QUIRK(0x17aa, 0x3977, "IdeaPad S210", ALC283_FIXUP_INT_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo B50-70", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
-- 
2.30.2


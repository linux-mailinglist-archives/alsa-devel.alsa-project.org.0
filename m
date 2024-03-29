Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E41488917C1
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 12:29:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA87C2CA4;
	Fri, 29 Mar 2024 12:28:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA87C2CA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711711747;
	bh=ke/VUwIe1OO+bDbORJF1f8ePxj8H2rnfKHFV6nTnzfU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gmwxsWeUHWk46LiOkVF9/J4SfFDoQieyGcPjjso7a+0FSdEpu/KuQOXPvhR90YI06
	 joB5T7rMMrJhZw3Jps6sbSnY/3ph9kKh5uKWTvmgs3javRHDvcw5ry9m83z15KSzRl
	 X9PxueBL0AaENeOJRBZZ76KdBkYsxG9zr8eCI6sQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94A1BF805AB; Fri, 29 Mar 2024 12:28:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 303A5F805A9;
	Fri, 29 Mar 2024 12:28:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DA9FF8025F; Fri, 29 Mar 2024 12:28:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE4A0F80093
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 12:28:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE4A0F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=pKCCSMsO
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42TAeera029260;
	Fri, 29 Mar 2024 06:28:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=x
	SAFwG9CV4jLKTWXRdMat2YE8sxtFXXlUQvX5gSJWrE=; b=pKCCSMsO5/3Q/mXoh
	BEPWhekyK5nrt/7Gm345mCDgUaeVw/uu9B5fDPInsELDjkZdZ75r6mzVWvbbMgbU
	sUt/GhLa+Yj3z+XA6R1c9/NfTae0L2AlO6JIasOkPVtdeB4M2j9ZKcWGQJFXygbn
	Dbjwo4bSHZOZ3e/UJlPc87yCT2l07ZWAoM55oKiJRBjUno5xJrNbMMCmKA7nQdg9
	xDrIXfLniEW92Kpo1fTu9HtYjpykMcNU/ekBy0v9kT9y+YtcfaTffHe10KAaQXfs
	ysgnh4EXZ3VxnfyXtn7E+ZWjevye1/J/2JO/sMFUTCPi9mpdnn/orIZ+wBLMy5uU
	lEEPw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3x4et84ev4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 06:28:12 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 29 Mar
 2024 11:28:10 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Fri, 29 Mar 2024 11:28:10 +0000
Received: from EDIN6ZZ2FY3.ad.cirrus.com (EDIN6ZZ2FY3.ad.cirrus.com
 [198.61.64.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3174F820244;
	Fri, 29 Mar 2024 11:28:10 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirks for ASUS Laptops using CS35L56
Date: Fri, 29 Mar 2024 11:28:03 +0000
Message-ID: <20240329112803.23897-1-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7OkJ-kNs1QpHM4pRLS9A68IjO_-xygUH
X-Proofpoint-ORIG-GUID: 7OkJ-kNs1QpHM4pRLS9A68IjO_-xygUH
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: CDLCYUVXEFCIY5E7UL62CZO2DBBBG7UV
X-Message-ID-Hash: CDLCYUVXEFCIY5E7UL62CZO2DBBBG7UV
X-MailFrom: prvs=181876d548=simont@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CDLCYUVXEFCIY5E7UL62CZO2DBBBG7UV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These ASUS laptops use the Realtek HDA codec combined with a number of
CS35L56 amplifiers.

The SSID of the GA403U matches a previous ASUS laptop - we can tell them
apart because they use different codecs.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 53 ++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a17c36a36aa5..7d229f4a8aa6 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6875,11 +6875,38 @@ static void alc287_fixup_legion_16ithg6_speakers(struct hda_codec *cdc, const st
 	comp_generic_fixup(cdc, action, "i2c", "CLSA0101", "-%s:00-cs35l41-hda.%d", 2);
 }
 
+static void cs35l56_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
+{
+	comp_generic_fixup(cdc, action, "i2c", "CSC3556", "-%s:00-cs35l56-hda.%d", 2);
+}
+
+static void cs35l56_fixup_i2c_four(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
+{
+	comp_generic_fixup(cdc, action, "i2c", "CSC3556", "-%s:00-cs35l56-hda.%d", 4);
+}
+
+static void cs35l56_fixup_spi_two(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
+{
+	comp_generic_fixup(cdc, action, "spi", "CSC3556", "-%s:00-cs35l56-hda.%d", 2);
+}
+
 static void cs35l56_fixup_spi_four(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
 {
 	comp_generic_fixup(cdc, action, "spi", "CSC3556", "-%s:00-cs35l56-hda.%d", 4);
 }
 
+static void alc285_fixup_asus_ga403u(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
+{
+	/*
+	 * The same SSID has been re-used in different hardware, they have
+	 * different codecs and the newer GA403U has a ALC285.
+	 */
+	if (cdc->core.vendor_id == 0x10ec0285)
+		cs35l56_fixup_i2c_two(cdc, fix, action);
+	else
+		alc_fixup_inv_dmic(cdc, fix, action);
+}
+
 static void tas2781_fixup_i2c(struct hda_codec *cdc,
 	const struct hda_fixup *fix, int action)
 {
@@ -7436,6 +7463,10 @@ enum {
 	ALC256_FIXUP_ACER_SFG16_MICMUTE_LED,
 	ALC256_FIXUP_HEADPHONE_AMP_VOL,
 	ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX,
+	ALC285_FIXUP_CS35L56_SPI_2,
+	ALC285_FIXUP_CS35L56_I2C_2,
+	ALC285_FIXUP_CS35L56_I2C_4,
+	ALC285_FIXUP_ASUS_GA403U,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9643,6 +9674,22 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc245_fixup_hp_spectre_x360_eu0xxx,
 	},
+	[ALC285_FIXUP_CS35L56_SPI_2] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs35l56_fixup_spi_two,
+	},
+	[ALC285_FIXUP_CS35L56_I2C_2] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs35l56_fixup_i2c_two,
+	},
+	[ALC285_FIXUP_CS35L56_I2C_4] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs35l56_fixup_i2c_four,
+	},
+	[ALC285_FIXUP_ASUS_GA403U] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc285_fixup_asus_ga403u,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -10096,7 +10143,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1a83, "ASUS UM5302LA", ALC294_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1a8f, "ASUS UX582ZS", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1b11, "ASUS UX431DA", ALC294_FIXUP_ASUS_COEF_1B),
-	SND_PCI_QUIRK(0x1043, 0x1b13, "Asus U41SV", ALC269_FIXUP_INV_DMIC),
+	SND_PCI_QUIRK(0x1043, 0x1b13, "ASUS U41SV/GA403U", ALC285_FIXUP_ASUS_GA403U),
 	SND_PCI_QUIRK(0x1043, 0x1b93, "ASUS G614JVR/JIR", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1bbd, "ASUS Z550MA", ALC255_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1c03, "ASUS UM3406HA", ALC287_FIXUP_CS35L41_I2C_2),
@@ -10104,6 +10151,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1c33, "ASUS UX5304MA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1c43, "ASUS UX8406MA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1c62, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
+	SND_PCI_QUIRK(0x1043, 0x1c63, "ASUS GU605M", ALC285_FIXUP_CS35L56_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1c92, "ASUS ROG Strix G15", ALC285_FIXUP_ASUS_G533Z_PINS),
 	SND_PCI_QUIRK(0x1043, 0x1c9f, "ASUS G614JU/JV/JI", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1caf, "ASUS G634JY/JZ/JI/JG", ALC285_FIXUP_ASUS_SPI_REAR_SPEAKERS),
@@ -10115,11 +10163,14 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1d42, "ASUS Zephyrus G14 2022", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1d4e, "ASUS TM420", ALC256_FIXUP_ASUS_HPE),
 	SND_PCI_QUIRK(0x1043, 0x1da2, "ASUS UP6502ZA/ZD", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1043, 0x1df3, "ASUS UM5606", ALC285_FIXUP_CS35L56_I2C_4),
 	SND_PCI_QUIRK(0x1043, 0x1e02, "ASUS UX3402ZA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x1e11, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA502),
 	SND_PCI_QUIRK(0x1043, 0x1e12, "ASUS UM3402", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1e51, "ASUS Zephyrus M15", ALC294_FIXUP_ASUS_GU502_PINS),
 	SND_PCI_QUIRK(0x1043, 0x1e5e, "ASUS ROG Strix G513", ALC294_FIXUP_ASUS_G513_PINS),
+	SND_PCI_QUIRK(0x1043, 0x1e63, "ASUS H7606W", ALC285_FIXUP_CS35L56_I2C_2),
+	SND_PCI_QUIRK(0x1043, 0x1e83, "ASUS GA605W", ALC285_FIXUP_CS35L56_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1e8e, "ASUS Zephyrus G15", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1ee2, "ASUS UM6702RA/RC", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x1c52, "ASUS Zephyrus G15 2022", ALC289_FIXUP_ASUS_GA401),
-- 
2.34.1


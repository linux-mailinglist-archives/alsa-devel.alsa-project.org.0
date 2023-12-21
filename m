Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF54381B790
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 14:26:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12A60DF5;
	Thu, 21 Dec 2023 14:26:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12A60DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703165217;
	bh=3iCnLuSfqJXWDHb+2L16l8d9Kbwcym8ojufuCZPBC74=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G8Hp07IRmh1L8LeEUJPmES0epi8OXiMofmeSEQJTTYyjtM/rwJm8zChQ3xoip1dVj
	 6vqxLvyYAnCx4WP8Z5PwC5aXXnEftOWmOVWaDYpBuSg0vtvT7snHg9TtP+9e7b3Zp8
	 Mw4wuXmd0GflkBtqtOLxy8ZAPRdeSj1t3Nrb9L14=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46797F8061F; Thu, 21 Dec 2023 14:25:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A4B5F80570;
	Thu, 21 Dec 2023 14:25:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46E9FF8057E; Thu, 21 Dec 2023 14:25:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3C09F80212
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 14:25:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3C09F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=MWGZo/HI
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BL5NG1K008651;
	Thu, 21 Dec 2023 07:25:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=EajC2Y+U3XPz4VNfit3GQaEJJ7g/+QfS/Agkz4pZems=; b=
	MWGZo/HIfJX+/pI/DcaTrbvCXaLylkr1/sO2uQrOkFevqlCBga+O3UhOSel2U9jc
	EiV223KoGXALMiWDO33cPeTwqjx59yMBJC3WIFtGweOraKzcBuGvsoFk837i4wCV
	tZPl22NNb0TNJXpO71xv4BoINT/mFGR2CLLvUCqO/n9S9jPTjFdie9lcQsWjRFbr
	XCCPIoGACYzSeMkB23umuRljd1YFVbMM5rVwZ+p1Te59IaD4jopNv9ODOL3YN92V
	+dNZ+A32Il1wNNYeu6gMDHhdXAxUxT/PQ9V5yufFRSBXzp8rbboY4gEqBgxiyRBf
	PByYmP3Y9rStMOzx0ZkUJw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3v196nfar8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Dec 2023 07:25:27 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Dec
 2023 13:25:25 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Thu, 21 Dec 2023 13:25:25 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.77])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 857EF11CC;
	Thu, 21 Dec 2023 13:25:25 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 3/3] ALSA: hda/realtek: Add quirks for Dell models
Date: Thu, 21 Dec 2023 13:25:18 +0000
Message-ID: <20231221132518.3213-4-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221132518.3213-1-sbinding@opensource.cirrus.com>
References: <20231221132518.3213-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: DE60y9DnppAR2lFR6S8g7xba5pYcHkZR
X-Proofpoint-GUID: DE60y9DnppAR2lFR6S8g7xba5pYcHkZR
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: CCJBW2VSO4KD6BLF3OSYIB5VOOBN5VWO
X-Message-ID-Hash: CCJBW2VSO4KD6BLF3OSYIB5VOOBN5VWO
X-MailFrom: prvs=7719b567d4=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CCJBW2VSO4KD6BLF3OSYIB5VOOBN5VWO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These models use 2 or 4 CS35L41 amps with HDA using SPI and I2C.
Models use internal and external boost.
All models require DSD support to be added inside
cs35l41_hda_property.c

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index c3a756528886..19040887ff67 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6956,6 +6956,11 @@ static void cs35l41_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup
 	cs35l41_generic_fixup(cdc, action, "i2c", "CSC3551", 2);
 }
 
+static void cs35l41_fixup_i2c_four(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
+{
+	cs35l41_generic_fixup(cdc, action, "i2c", "CSC3551", 4);
+}
+
 static void cs35l41_fixup_spi_two(struct hda_codec *codec, const struct hda_fixup *fix, int action)
 {
 	cs35l41_generic_fixup(codec, action, "spi", "CSC3551", 2);
@@ -7441,6 +7446,7 @@ enum {
 	ALC287_FIXUP_LEGION_16ACHG6,
 	ALC287_FIXUP_CS35L41_I2C_2,
 	ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED,
+	ALC287_FIXUP_CS35L41_I2C_4,
 	ALC245_FIXUP_CS35L41_SPI_2,
 	ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED,
 	ALC245_FIXUP_CS35L41_SPI_4,
@@ -9427,6 +9433,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_HP_MUTE_LED,
 	},
+	[ALC287_FIXUP_CS35L41_I2C_4] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs35l41_fixup_i2c_four,
+	},
 	[ALC245_FIXUP_CS35L41_SPI_2] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cs35l41_fixup_spi_two,
@@ -9703,6 +9713,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0a9e, "Dell Latitude 5430", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0b19, "Dell XPS 15 9520", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0b1a, "Dell Precision 5570", ALC289_FIXUP_DUAL_SPK),
+	SND_PCI_QUIRK(0x1028, 0x0b27, "Dell", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x1028, 0x0b28, "Dell", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1028, 0x0b37, "Dell Inspiron 16 Plus 7620 2-in-1", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
 	SND_PCI_QUIRK(0x1028, 0x0b71, "Dell Inspiron 16 Plus 7620", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
 	SND_PCI_QUIRK(0x1028, 0x0beb, "Dell XPS 15 9530 (2023)", ALC289_FIXUP_DELL_CS35L41_SPI_2),
@@ -9713,6 +9725,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0c1c, "Dell Precision 3540", ALC236_FIXUP_DELL_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1028, 0x0c1d, "Dell Precision 3440", ALC236_FIXUP_DELL_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1028, 0x0c1e, "Dell Precision 3540", ALC236_FIXUP_DELL_DUAL_CODECS),
+	SND_PCI_QUIRK(0x1028, 0x0c4d, "Dell", ALC287_FIXUP_CS35L41_I2C_4),
 	SND_PCI_QUIRK(0x1028, 0x0cbd, "Dell Oasis 13 CS MTL-U", ALC289_FIXUP_DELL_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1028, 0x0cbe, "Dell Oasis 13 2-IN-1 MTL-U", ALC289_FIXUP_DELL_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1028, 0x0cbf, "Dell Oasis 13 Low Weight MTU-L", ALC289_FIXUP_DELL_CS35L41_SPI_2),
-- 
2.34.1


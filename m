Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7374D496135
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 15:36:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00DBB2B81;
	Fri, 21 Jan 2022 15:36:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00DBB2B81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642775812;
	bh=NV5BQh80hY3TGQMbGUrbcBePpqQSBblYGnRw/siAFPc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DStvH+uaFMzEoF2fAvO6If/3zPGMG8AlaibOnunVGgPE5ocBo+JgYnsuZI8VDePoQ
	 UqMN9sHqGDdAjyvY8OHSO98UOxm9ZYLk5M+jMzgy4YlddSTgV+Qf0RFvxRGjSCIM48
	 vlONCfS6Rv0S/UpFdDqEq2+fpWPMorHB+14YjLBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15C10F8054A;
	Fri, 21 Jan 2022 15:33:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51FC6F8051F; Fri, 21 Jan 2022 15:33:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EB5FF80515
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 15:33:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EB5FF80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MOI6EtNB"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20LDS7PL017315;
 Fri, 21 Jan 2022 08:33:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=rEn0h8SRiY2No5hBRUCbDy0KDS79Bfzu7iJq6A2CKhc=;
 b=MOI6EtNBj//9slHrxPiAZVK494+JxskwmKMCeh109K0ve1L2Vi1z+hXPDd/18dCAsXoF
 PVuuCJ/P6IDpXIHWFRe/m4AYYicS4M2qG40gQKWjG3zkrN1TYjYlunq9NEni4bnMoToQ
 zWrEMTp9n8uxgvf/nMAAWFwpbMOdAvyifkNOpFuh5929+5kE4hK4yo42BrOA0ZLtLEvA
 /59JIGHgQYG9n05MR17lcKkIuYABLVNsUaS+fD2RiVU9ByZYbnh3UWwtdiL8CPG+JvtW
 ZdMoK9fkwuFT9nSRe5S/iROY973qKLKMgtkI2I1hBi4Cktx/L+VyOTE+C4+hcsoku1xO gw== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3dqhyq0up1-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 21 Jan 2022 08:33:02 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 21 Jan
 2022 14:33:00 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 21 Jan 2022 14:33:00 +0000
Received: from LONN2DGDQ73.ad.cirrus.com (unknown [198.90.238.138])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A281845D;
 Fri, 21 Jan 2022 14:32:59 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Len Brown <lenb@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v5 8/9] ALSA: hda/realtek: Add support for HP Laptops
Date: Fri, 21 Jan 2022 14:32:53 +0000
Message-ID: <20220121143254.6432-9-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121143254.6432-1-sbinding@opensource.cirrus.com>
References: <20220121143254.6432-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: P6PNFL1HqGz3IEJORufkOZbe5lobq6Er
X-Proofpoint-ORIG-GUID: P6PNFL1HqGz3IEJORufkOZbe5lobq6Er
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>, linux-spi@vger.kernel.org
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

From: Lucas Tanure <tanureal@opensource.cirrus.com>

Add support for two and four CS35L41 using the component
binding method

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 43 ++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 668274e52674..b4fde8f603b1 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6611,6 +6611,16 @@ static void cs35l41_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup
 	cs35l41_generic_fixup(cdc, action, "i2c", "CSC3551", 2);
 }
 
+static void cs35l41_fixup_spi_two(struct hda_codec *codec, const struct hda_fixup *fix, int action)
+{
+	cs35l41_generic_fixup(codec, action, "spi0", "CSC3551", 2);
+}
+
+static void cs35l41_fixup_spi_four(struct hda_codec *codec, const struct hda_fixup *fix, int action)
+{
+	cs35l41_generic_fixup(codec, action, "spi0", "CSC3551", 4);
+}
+
 static void alc287_legion_16achg6_playback_hook(struct hda_pcm_stream *hinfo, struct hda_codec *cdc,
 						struct snd_pcm_substream *sub, int action)
 {
@@ -6948,6 +6958,9 @@ enum {
 	ALC285_FIXUP_LEGION_Y9000X_AUTOMUTE,
 	ALC287_FIXUP_LEGION_16ACHG6,
 	ALC287_FIXUP_CS35L41_I2C_2,
+	ALC245_FIXUP_CS35L41_SPI_2,
+	ALC245_FIXUP_CS35L41_SPI_4,
+	ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED,
 	ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED,
 };
 
@@ -8699,6 +8712,20 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cs35l41_fixup_i2c_two,
 	},
+	[ALC245_FIXUP_CS35L41_SPI_2] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs35l41_fixup_spi_two,
+	},
+	[ALC245_FIXUP_CS35L41_SPI_4] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs35l41_fixup_spi_four,
+	},
+	[ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc245_fixup_hp_gpio_led,
+		.chained = true,
+		.chain_id = ALC245_FIXUP_CS35L41_SPI_4,
+	},
 	[ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED] = {
 		.type = HDA_FIXUP_VERBS,
 		.v.verbs = (const struct hda_verb[]) {
@@ -8926,7 +8953,21 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8896, "HP EliteBook 855 G8 Notebook PC", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8898, "HP EliteBook 845 G8 Notebook PC", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x103c, 0x88d0, "HP Pavilion 15-eh1xxx (mainboard 88D0)", ALC287_FIXUP_HP_GPIO_LED),
-	SND_PCI_QUIRK(0x103c, 0x89c3, "HP", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x896E, "HP EliteBook x360 830 G9", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x103c, 0x8971, "HP EliteBook 830 G9", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x103c, 0x8972, "HP EliteBook 840 G9", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x103c, 0x8973, "HP EliteBook 860 G9", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x103c, 0x8974, "HP EliteBook 840 Aero G9", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x103c, 0x8975, "HP EliteBook x360 840 Aero G9", ALC245_FIXUP_CS35L41_SPI_2),
+	SND_PCI_QUIRK(0x103c, 0x8981, "HP Elite Dragonfly G3", ALC245_FIXUP_CS35L41_SPI_4),
+	SND_PCI_QUIRK(0x103c, 0x898E, "HP EliteBook 835 G9", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x898F, "HP EliteBook 835 G9", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8991, "HP EliteBook 845 G9", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8992, "HP EliteBook 845 G9", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8994, "HP EliteBook 855 G9", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8995, "HP EliteBook 855 G9", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x89C3, "Zbook Studio G9", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x89C6, "Zbook Fury 17 G9", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x103c, 0x89ca, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C96EF42689E
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 13:20:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61A9F166F;
	Fri,  8 Oct 2021 13:19:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61A9F166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633692036;
	bh=NZPra+RMJBqOdxSaGHCrHzwrlGN1EHnpQthQXW7H2Mw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qnZCRcgksgzeUmg7OajVJZJVJB4eYo+w8iA8tcUrj+MT2cXz/M7lklIuBcnlwJV/I
	 QpIKBwv6iRTz6AYKcqtqw0hOlLUgZgK39jNbxpKHCM4Eu1S0UkisPw1hSg7XNYthFx
	 nGZTTBLPuiJgZ98/vW59QRrAym8GGq4H9/LTLbL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFCF5F80249;
	Fri,  8 Oct 2021 13:19:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09D1BF80246; Fri,  8 Oct 2021 13:19:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF59EF800F0
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 13:19:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF59EF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="mAw/FoL1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1984fFPx019558; 
 Fri, 8 Oct 2021 06:19:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=p2mC168Nmq+RGJAWci6fjWJobSCzU2hErXu4tRaAm4I=;
 b=mAw/FoL1dt1K+cx4bieSb+LUrPN1jy5UjFuM5WD9kJUuuwBBNXO+6JXxWwDOJukz3UwM
 IEJ6tyDOgFB+b5N+o8IL3eZFLpel4BTTRkiGO9/HJ65I+pWa2547HFsW9Ac4ndubd+sr
 XgrUrarJmHqu7etkS9owNksmNTzf/dLJwmRrqNuY8x3y0os0qW/4W+wrOFKFmci0l5D7
 Q+pVRUKp+/kLtssFIMYWfKy4bJBZX5GqpqU9TGJw3KXo2tAhE8RHiknIcFMRz328ySQd
 mHfYeM05uKpJtG+j5Ln/iR8wkOjIKHl0SaOXiBXB67jvfkFSiGrl21rf5yyImvDUhrFU QQ== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3bj86n0s44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 08 Oct 2021 06:19:06 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 8 Oct
 2021 12:19:04 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Fri, 8 Oct 2021 12:19:04 +0100
Received: from aryzen.ad.cirrus.com (unknown [198.61.64.75])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DE205B16;
 Fri,  8 Oct 2021 11:19:03 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Len Brown <lenb@kernel.org>, David Rhodes
 <david.rhodes@cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>
Subject: [RFC] sound: cs35l41: Add support for Legion 7 16ACHg6 laptop
Date: Fri, 8 Oct 2021 12:19:02 +0100
Message-ID: <20211008111902.103473-1-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ken982eHloxDiQpnc9y5wBw9E1Ta-NDV
X-Proofpoint-ORIG-GUID: ken982eHloxDiQpnc9y5wBw9E1Ta-NDV
X-Proofpoint-Spam-Reason: safe
Cc: linux-acpi@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com
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

Hi,

I would like to get some guidance about this solution to
support the 16ACHg6 laptop.

Hardware:
 - The 16ACHg6 laptop has two CS35L41 amplifiers, connected
to Realtek ALC287 by an I2S bus and by and direct I2C to the CPU.
 - The ALC287 codec is connected to the CPU by an HDA bus.
 - The CS35L41 has a DSP which will require firmware to be loaded.

Architecture:
 - To load the firmware for CS35L41, this solution will require
the wm_adsp library, which requires regmap, header definitions and
register tables.
 - To minimize the duplication of the code, the HDA functions will
be placed inside the ASoC CS35L41 driver.
 - Finally, HDA patch_realtek will access exposed functions from
ASoC CS35L41 driver to initialize the amplifiers, start and stop
streams and load firmware.

Notes:
 - This is a work in progress, so the code is not functional, its
only intent is to demonstrate the overall solution
 - If accepted, this will be split into a couple of patches for
a new patch chain

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 drivers/acpi/scan.c                          |  1 +
 drivers/platform/x86/i2c-multi-instantiate.c |  7 ++
 include/sound/cs35l41.h                      |  4 ++
 sound/pci/hda/Kconfig                        |  1 +
 sound/pci/hda/patch_realtek.c                | 21 +++++-
 sound/soc/codecs/cs35l41.c                   | 75 ++++++++++++++++----
 6 files changed, 95 insertions(+), 14 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 5b54c80b9d32..c1c27a408420 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1703,6 +1703,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 		{"BSG2150", },
 		{"INT33FE", },
 		{"INT3515", },
+		{"CLSA0100", },
 		{}
 	};
 
diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
index a50153ecd560..b61f7e30d42a 100644
--- a/drivers/platform/x86/i2c-multi-instantiate.c
+++ b/drivers/platform/x86/i2c-multi-instantiate.c
@@ -139,6 +139,12 @@ static const struct i2c_inst_data bsg2150_data[]  = {
 	{}
 };
 
+static const struct i2c_inst_data clsa0100_data[]  = {
+	{ "cs35l41", IRQ_RESOURCE_GPIO, 0 },
+	{ "cs35l41", IRQ_RESOURCE_GPIO, 0 },
+	{}
+};
+
 /*
  * Device with _HID INT3515 (TI PD controllers) has some unresolved interrupt
  * issues. The most common problem seen is interrupt flood.
@@ -170,6 +176,7 @@ static const struct i2c_inst_data bsg2150_data[]  = {
 static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
 	{ "BSG1160", (unsigned long)bsg1160_data },
 	{ "BSG2150", (unsigned long)bsg2150_data },
+	{ "CLSA0100", (unsigned long)clsa0100_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
diff --git a/include/sound/cs35l41.h b/include/sound/cs35l41.h
index 1f1e3c6c9be1..4d665b7dbfdf 100644
--- a/include/sound/cs35l41.h
+++ b/include/sound/cs35l41.h
@@ -23,6 +23,8 @@ struct cs35l41_irq_cfg {
 };
 
 struct cs35l41_platform_data {
+	bool no_bst;
+	bool hda;
 	int bst_ind;
 	int bst_ipk;
 	int bst_cap;
@@ -31,4 +33,6 @@ struct cs35l41_platform_data {
 	struct cs35l41_irq_cfg irq_config2;
 };
 
+void cs35l41_hda_init(void);
+
 #endif /* __CS35L41_H */
diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index ab9d2746e804..37202466f033 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -95,6 +95,7 @@ config SND_HDA_CODEC_REALTEK
 	tristate "Build Realtek HD-audio codec support"
 	select SND_HDA_GENERIC
 	select SND_HDA_GENERIC_LEDS
+	select SND_SOC_CS35L41_I2C
 	help
 	  Say Y or M here to include Realtek HD-audio codec support in
 	  snd-hda-intel driver, such as ALC880.
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4407f7da57c4..2a0ac9a1b613 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -21,6 +21,7 @@
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/hda_codec.h>
+#include <sound/cs35l41.h>
 #include "hda_local.h"
 #include "hda_auto_parser.h"
 #include "hda_jack.h"
@@ -6443,6 +6444,18 @@ static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
 	}
 }
 
+static void alc287_fixup_lenovo_y760(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
+{
+	if (action == HDA_FIXUP_ACT_PROBE) {
+		codec_info(cdc, "HDA_FIXUP_ACT_PROBE\n");
+		cs35l41_hda_init();
+	} else if (action == HDA_FIXUP_ACT_INIT) {
+		codec_info(cdc, "HDA_FIXUP_ACT_INIT\n");
+	} else if (action == HDA_FIXUP_ACT_FREE) {
+		codec_info(cdc, "HDA_FIXUP_ACT_FREE\n");
+	}
+}
+
 /* for alc295_fixup_hp_top_speakers */
 #include "hp_x360_helper.c"
 
@@ -6663,7 +6676,8 @@ enum {
 	ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS,
 	ALC287_FIXUP_LEGION_15IMHG05_AUTOMUTE,
 	ALC287_FIXUP_YOGA7_14ITL_SPEAKERS,
-	ALC287_FIXUP_13S_GEN2_SPEAKERS
+	ALC287_FIXUP_13S_GEN2_SPEAKERS,
+	ALC287_FIXUP_LENOVO_Y760
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -8361,6 +8375,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE,
 	},
+	[ALC287_FIXUP_LENOVO_Y760] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc287_fixup_lenovo_y760,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -8755,6 +8773,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940", ALC298_FIXUP_LENOVO_SPK_VOLUME),
 	SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPAD_S740_COEF),
 	SND_PCI_QUIRK(0x17aa, 0x3843, "Yoga 9i", ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP),
+	SND_PCI_QUIRK(0x17aa, 0x3847, "Legion Y760", ALC287_FIXUP_LENOVO_Y760),
 	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3852, "Lenovo Yoga 7 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3853, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index b16eb6610c0e..f643ed1b48c0 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -21,9 +21,17 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/tlv.h>
+#include <linux/acpi.h>
 
 #include "cs35l41.h"
 
+static struct list_head *cs35l41_hda_lst;
+
+struct cs35l41_hda_node {
+	struct list_head node;
+	struct cs35l41_private *cs35l41;
+};
+
 static const char * const cs35l41_supplies[CS35L41_NUM_SUPPLIES] = {
 	"VA",
 	"VP",
@@ -1039,9 +1047,7 @@ static int cs35l41_set_pdata(struct cs35l41_private *cs35l41)
 {
 	int ret;
 
-	/* Set Platform Data */
-	/* Required */
-	if (cs35l41->pdata.bst_ipk &&
+	if (!cs35l41->pdata.no_bst && cs35l41->pdata.bst_ipk &&
 	    cs35l41->pdata.bst_ind && cs35l41->pdata.bst_cap) {
 		ret = cs35l41_boost_config(cs35l41, cs35l41->pdata.bst_ind,
 					   cs35l41->pdata.bst_cap,
@@ -1051,8 +1057,7 @@ static int cs35l41_set_pdata(struct cs35l41_private *cs35l41)
 			return ret;
 		}
 	} else {
-		dev_err(cs35l41->dev, "Incomplete Boost component DT config\n");
-		return -EINVAL;
+		dev_info(cs35l41->dev, "Boost disabled\n");
 	}
 
 	/* Optional */
@@ -1148,9 +1153,31 @@ static int cs35l41_handle_pdata(struct device *dev,
 {
 	struct cs35l41_irq_cfg *irq_gpio1_config = &pdata->irq_config1;
 	struct cs35l41_irq_cfg *irq_gpio2_config = &pdata->irq_config2;
+	struct acpi_device *adev;
+	struct device *phys_dev;
 	unsigned int val;
 	int ret;
 
+	if (memcmp(dev_name(cs35l41->dev), "i2c-CLSA0100", 12) == 0) {
+		pdata->no_bst = true;
+		pdata->hda = true;
+		adev = acpi_dev_get_first_match_dev("CLSA0100", "1", -1);
+		if (!adev) {
+			dev_err(dev, "Failed to find an ACPI device\n");
+			return -ENODEV;
+		}
+
+		phys_dev = get_device(acpi_get_first_physical_node(adev));
+		acpi_dev_put(adev);
+
+		if (!phys_dev) {
+			dev_err(dev, "Failed to find a physical device\n");
+			return -ENODEV;
+		}
+		cs35l41->reset_gpio = gpiod_get_index(phys_dev, NULL, 0, GPIOD_ASIS);
+		return 0;
+	}
+
 	ret = device_property_read_u32(dev, "cirrus,boost-peak-milliamp", &val);
 	if (ret >= 0)
 		pdata->bst_ipk = val;
@@ -1237,10 +1264,22 @@ static const struct reg_sequence cs35l41_revb2_errata_patch[] = {
 	{ 0x00000040,			 0x00003333 },
 };
 
+void cs35l41_hda_init(void)
+{
+	struct list_head *p;
+	int i = 0;
+
+	list_for_each(p, cs35l41_hda_lst) {
+		pr_info("%s %d\n", __func__, i++);
+	}
+}
+EXPORT_SYMBOL_GPL(cs35l41_hda_init);
+
 int cs35l41_probe(struct cs35l41_private *cs35l41,
 		  struct cs35l41_platform_data *pdata)
 {
 	u32 regid, reg_revid, i, mtl_revid, int_status, chipid_match;
+	struct cs35l41_hda_node *cs35l41_hda;
 	int irq_pol = 0;
 	int ret;
 
@@ -1269,8 +1308,8 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 	}
 
 	/* returning NULL can be an option if in stereo mode */
-	cs35l41->reset_gpio = devm_gpiod_get_optional(cs35l41->dev, "reset",
-						      GPIOD_OUT_LOW);
+	if (!cs35l41->reset_gpio)
+		cs35l41->reset_gpio = devm_gpiod_get_optional(cs35l41->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(cs35l41->reset_gpio)) {
 		ret = PTR_ERR(cs35l41->reset_gpio);
 		cs35l41->reset_gpio = NULL;
@@ -1413,12 +1452,22 @@ int cs35l41_probe(struct cs35l41_private *cs35l41,
 		goto err;
 	}
 
-	ret = devm_snd_soc_register_component(cs35l41->dev,
-					      &soc_component_dev_cs35l41,
-					      cs35l41_dai, ARRAY_SIZE(cs35l41_dai));
-	if (ret < 0) {
-		dev_err(cs35l41->dev, "Register codec failed: %d\n", ret);
-		goto err;
+	if (!cs35l41->pdata.hda) {
+		ret = devm_snd_soc_register_component(cs35l41->dev,
+						      &soc_component_dev_cs35l41,
+						      cs35l41_dai, ARRAY_SIZE(cs35l41_dai));
+		if (ret < 0) {
+			dev_err(cs35l41->dev, "Register codec failed: %d\n", ret);
+			goto err;
+		}
+	} else {
+		if (!cs35l41_hda_lst) {
+			cs35l41_hda_lst = devm_kzalloc(cs35l41->dev, sizeof(*cs35l41_hda_lst),
+						       GFP_KERNEL);
+			INIT_LIST_HEAD(cs35l41_hda_lst);
+		}
+		cs35l41_hda = devm_kzalloc(cs35l41->dev, sizeof(*cs35l41_hda), GFP_KERNEL);
+		list_add(&cs35l41_hda->node, cs35l41_hda_lst);
 	}
 
 	dev_info(cs35l41->dev, "Cirrus Logic CS35L41 (%x), Revision: %02X\n",
-- 
2.33.0


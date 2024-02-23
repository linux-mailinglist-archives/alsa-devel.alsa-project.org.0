Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D5F861612
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 16:41:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67501822;
	Fri, 23 Feb 2024 16:41:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67501822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708702885;
	bh=AyhWYPSqg+SbEKRLSFfHUk7zH/sfDacTTWQa5bUQwDU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qOU9I6wbsjokC0VNmjINEOnMAVGoi/zcIW1zjL8mY168VfpG5E1gfDEJKhnScaoMW
	 5Ea7eU8Yh3MKyLczkdWyxG6VogUxmJXQVEnMEjvrl/rS44MIRP6Pm1Wnf2Dnaqgszq
	 HdHRTxRHwgwsGnO18WbDQyHLUBlE8R9HdcqudC7I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71D7AF80678; Fri, 23 Feb 2024 16:39:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7B8EF80675;
	Fri, 23 Feb 2024 16:39:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF2D7F80601; Fri, 23 Feb 2024 16:39:35 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A7C16F804CC
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 16:39:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7C16F804CC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=RFyRNNCO
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41N8gUBU005505;
	Fri, 23 Feb 2024 09:39:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=vizjXmHcd079C2mw5k4d+8ZahdNc9pZNwCbEzx/xBg8=; b=
	RFyRNNCOsXkt6ZNQR4Y9sdMfFmWO448DqcO0T4YlByVfGscVeGeVODo0Iq4XwkeR
	MHYw4uutrILYRZZwTdznxzHIaT4SLQ9lrKFMW15YJW0Sc1iqGPdLjdhC8t462uiO
	JP7qUVSz6dGJXNqf8pBQoPvmuHDZZfrJkVj+jhsbnQTmwMtGNlhodaP8PiUj1oBa
	dSHY3aHb0zPI42tbxIKnrvkcjJbJkC3N9eRSJiADyOGpYlECsNpgz3+TO/CTE2Kj
	gcuK2aeNDcXLAr7oQBSgMWGn/hT4dGkSRa+bEj13tJgrOaCnXfNYFMG/rW7DXnBD
	ockbt8C4Xk+1QET9/16UnQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wd205m5pe-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 09:39:13 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 23 Feb
 2024 15:39:10 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Fri, 23 Feb 2024 15:39:10 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6C05382024D;
	Fri, 23 Feb 2024 15:39:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH v2 3/6] ASoC: cs35l56: Add helper functions for amp
 calibration
Date: Fri, 23 Feb 2024 15:39:07 +0000
Message-ID: <20240223153910.2063698-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240223153910.2063698-1-rf@opensource.cirrus.com>
References: <20240223153910.2063698-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: JFWIkNrrD6umswLLx3p8xM8XQGDQlDEn
X-Proofpoint-GUID: JFWIkNrrD6umswLLx3p8xM8XQGDQlDEn
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: XXDMY3H637HNMX2HB3WU2M57AAY5DZH6
X-Message-ID-Hash: XXDMY3H637HNMX2HB3WU2M57AAY5DZH6
X-MailFrom: prvs=97835e8ec7=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XXDMY3H637HNMX2HB3WU2M57AAY5DZH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adds some helper functions and data for applying amp calibration.

1. cs35l56_read_silicon_uid() to get the silicon ID that is used to
   search for the correct calibration data entry.

2. Add the registers for the silicon ID to the readable registers.

3. cs35l56_get_calibration() wrapper around
   cs_amp_get_efi_calibration_data()

4. cs35l56_calibration_controls() table of the firmware controls
   for calibration data.

5. Added members to struct cs35l56_base to store the calibration
   data.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h           | 10 ++++
 sound/soc/codecs/Kconfig          |  1 +
 sound/soc/codecs/cs35l56-shared.c | 83 +++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index b24716ab2750..4014ed7097b3 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -12,6 +12,7 @@
 #include <linux/firmware/cirrus/cs_dsp.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
+#include <sound/cs-amp-lib.h>
 
 #define CS35L56_DEVID					0x0000000
 #define CS35L56_REVID					0x0000004
@@ -23,6 +24,9 @@
 #define CS35L56_BLOCK_ENABLES2				0x000201C
 #define CS35L56_REFCLK_INPUT				0x0002C04
 #define CS35L56_GLOBAL_SAMPLE_RATE			0x0002C0C
+#define CS35L56_OTP_MEM_53				0x00300D4
+#define CS35L56_OTP_MEM_54				0x00300D8
+#define CS35L56_OTP_MEM_55				0x00300DC
 #define CS35L56_ASP1_ENABLES1				0x0004800
 #define CS35L56_ASP1_CONTROL1				0x0004804
 #define CS35L56_ASP1_CONTROL2				0x0004808
@@ -262,6 +266,9 @@ struct cs35l56_base {
 	bool fw_patched;
 	bool secured;
 	bool can_hibernate;
+	bool cal_data_valid;
+	s8 cal_index;
+	struct cirrus_amp_cal_data cal_data;
 	struct gpio_desc *reset_gpio;
 };
 
@@ -269,6 +276,8 @@ extern struct regmap_config cs35l56_regmap_i2c;
 extern struct regmap_config cs35l56_regmap_spi;
 extern struct regmap_config cs35l56_regmap_sdw;
 
+extern const struct cirrus_amp_cal_controls cs35l56_calibration_controls;
+
 extern const char * const cs35l56_tx_input_texts[CS35L56_NUM_INPUT_SRC];
 extern const unsigned int cs35l56_tx_input_values[CS35L56_NUM_INPUT_SRC];
 
@@ -286,6 +295,7 @@ int cs35l56_is_fw_reload_needed(struct cs35l56_base *cs35l56_base);
 int cs35l56_runtime_suspend_common(struct cs35l56_base *cs35l56_base);
 int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_soundwire);
 void cs35l56_init_cs_dsp(struct cs35l56_base *cs35l56_base, struct cs_dsp *cs_dsp);
+int cs35l56_get_calibration(struct cs35l56_base *cs35l56_base);
 int cs35l56_read_prot_status(struct cs35l56_base *cs35l56_base,
 			     bool *fw_missing, unsigned int *fw_version);
 int cs35l56_hw_init(struct cs35l56_base *cs35l56_base);
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 8356bd1256d8..15f287784d8b 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -800,6 +800,7 @@ config SND_SOC_CS35L56
 	tristate
 
 config SND_SOC_CS35L56_SHARED
+	select SND_SOC_CS_AMP_LIB
 	tristate
 
 config SND_SOC_CS35L56_I2C
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index cb4e83126b08..20b6dbd3fbab 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -5,10 +5,12 @@
 // Copyright (C) 2023 Cirrus Logic, Inc. and
 //                    Cirrus Logic International Semiconductor Ltd.
 
+#include <linux/firmware/cirrus/wmfw.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/types.h>
+#include <sound/cs-amp-lib.h>
 
 #include "cs35l56.h"
 
@@ -36,6 +38,8 @@ int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
 EXPORT_SYMBOL_NS_GPL(cs35l56_set_patch, SND_SOC_CS35L56_SHARED);
 
 static const struct reg_default cs35l56_reg_defaults[] = {
+	/* no defaults for OTP_MEM - first read populates cache */
+
 	{ CS35L56_ASP1_ENABLES1,		0x00000000 },
 	{ CS35L56_ASP1_CONTROL1,		0x00000028 },
 	{ CS35L56_ASP1_CONTROL2,		0x18180200 },
@@ -91,6 +95,9 @@ static bool cs35l56_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L56_BLOCK_ENABLES2:
 	case CS35L56_REFCLK_INPUT:
 	case CS35L56_GLOBAL_SAMPLE_RATE:
+	case CS35L56_OTP_MEM_53:
+	case CS35L56_OTP_MEM_54:
+	case CS35L56_OTP_MEM_55:
 	case CS35L56_ASP1_ENABLES1:
 	case CS35L56_ASP1_CONTROL1:
 	case CS35L56_ASP1_CONTROL2:
@@ -629,6 +636,81 @@ void cs35l56_init_cs_dsp(struct cs35l56_base *cs35l56_base, struct cs_dsp *cs_ds
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_init_cs_dsp, SND_SOC_CS35L56_SHARED);
 
+struct cs35l56_pte {
+	u8 x;
+	u8 wafer_id;
+	u8 pte[2];
+	u8 lot[3];
+	u8 y;
+	u8 unused[3];
+	u8 dvs;
+} __packed;
+static_assert((sizeof(struct cs35l56_pte) % sizeof(u32)) == 0);
+
+static int cs35l56_read_silicon_uid(struct cs35l56_base *cs35l56_base, u64 *uid)
+{
+	struct cs35l56_pte pte;
+	u64 unique_id;
+	int ret;
+
+	ret = regmap_raw_read(cs35l56_base->regmap, CS35L56_OTP_MEM_53, &pte, sizeof(pte));
+	if (ret) {
+		dev_err(cs35l56_base->dev, "Failed to read OTP: %d\n", ret);
+		return ret;
+	}
+
+	unique_id = pte.lot[2] | (pte.lot[1] << 8) | (pte.lot[0] << 16);
+	unique_id <<= 32;
+	unique_id |= pte.x | (pte.y << 8) | (pte.wafer_id << 16) | (pte.dvs << 24);
+
+	dev_dbg(cs35l56_base->dev, "UniqueID = %#llx\n", unique_id);
+
+	*uid = unique_id;
+
+	return 0;
+}
+
+/* Firmware calibration controls */
+const struct cirrus_amp_cal_controls cs35l56_calibration_controls = {
+	.alg_id =	0x9f210,
+	.mem_region =	WMFW_ADSP2_YM,
+	.ambient =	"CAL_AMBIENT",
+	.calr =		"CAL_R",
+	.status =	"CAL_STATUS",
+	.checksum =	"CAL_CHECKSUM",
+};
+EXPORT_SYMBOL_NS_GPL(cs35l56_calibration_controls, SND_SOC_CS35L56_SHARED);
+
+int cs35l56_get_calibration(struct cs35l56_base *cs35l56_base)
+{
+	u64 silicon_uid;
+	int ret;
+
+	/* Driver can't apply calibration to a secured part, so skip */
+	if (cs35l56_base->secured)
+		return 0;
+
+	ret = cs35l56_read_silicon_uid(cs35l56_base, &silicon_uid);
+	if (ret < 0)
+		return ret;
+
+	ret = cs_amp_get_efi_calibration_data(cs35l56_base->dev, silicon_uid,
+					      cs35l56_base->cal_index,
+					      &cs35l56_base->cal_data);
+
+	/* Only return an error status if probe should be aborted */
+	if ((ret == -ENOENT) || (ret == -EOVERFLOW))
+		return 0;
+
+	if (ret < 0)
+		return ret;
+
+	cs35l56_base->cal_data_valid = true;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_get_calibration, SND_SOC_CS35L56_SHARED);
+
 int cs35l56_read_prot_status(struct cs35l56_base *cs35l56_base,
 			     bool *fw_missing, unsigned int *fw_version)
 {
@@ -923,3 +1005,4 @@ MODULE_DESCRIPTION("ASoC CS35L56 Shared");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(SND_SOC_CS_AMP_LIB);
-- 
2.30.2


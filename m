Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5F9B201BF
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Aug 2025 10:25:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 599D160233;
	Mon, 11 Aug 2025 10:25:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 599D160233
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754900720;
	bh=ET0+czvOcBGIPv1oN4tF/4+koCfDWg2L9pGf7sYN32Y=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lFsNsLo4W+Aw7NtHL3pR0uf85VJqqvDt8kU6kK86l46HbXg0B955YArnzXNEN2/Mg
	 UuzNqPYbvvBBh1gvVeNkMs7QM1xTnqMAPA6nng8ypJfRPJUX3/o9mVBbdhtteoe4GC
	 Af5zSmHbsbmdcqi4fpo2/SCzKne6x4pxyDplFld0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDBE7F80254; Mon, 11 Aug 2025 10:24:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5DCEF805CA;
	Mon, 11 Aug 2025 10:24:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10614F80272; Sun, 10 Aug 2025 14:24:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6376DF80093
	for <alsa-devel@alsa-project.org>; Sun, 10 Aug 2025 14:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6376DF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=vvPMIwWD
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57ACOVBQ1403893;
	Sun, 10 Aug 2025 07:24:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754828671;
	bh=JCahSTLS70Y/bivmeHHiaq1vE9DBlhV3k6nliVfmw3U=;
	h=From:To:CC:Subject:Date;
	b=vvPMIwWDUqRKL6awmEHV1/R5zUs+KbZ2323yFroxHDxInVHdeIicVjwcHdIovbKp8
	 ebu0pAfhzB4SD9/okFJti7hfksbWTFJgwKkNF8lXcEOf8n3589YBXqfabPt9Akt2Q1
	 YPFUwqADEWFToKZvN46eNbELiIW4qP/eZnxLV6WM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57ACOUjA2964899
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sun, 10 Aug 2025 07:24:30 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sun, 10
 Aug 2025 07:24:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sun, 10 Aug 2025 07:24:30 -0500
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57ACOP741321164;
	Sun, 10 Aug 2025 07:24:26 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>,
        <13916275206@139.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <baojun.xu@ti.com>
Subject: [PATCH v1] ALSA: hda: Add TAS5825 support
Date: Sun, 10 Aug 2025 20:23:58 +0800
Message-ID: <20250810122358.1575-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LYPR2PYUUMLNWZC6TL5EMR7OSZ6YKPHD
X-Message-ID-Hash: LYPR2PYUUMLNWZC6TL5EMR7OSZ6YKPHD
X-Mailman-Approved-At: Mon, 11 Aug 2025 08:24:36 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYPR2PYUUMLNWZC6TL5EMR7OSZ6YKPHD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add TAS5825 support in TI's HDA driver.
TAS5825 is an on-chip DSP, but no calibration is required,
and no global address support smart amplifier devices.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 include/sound/tas2781-dsp.h                   |  3 +
 include/sound/tas2781.h                       |  4 +-
 include/sound/tas5825-tlv.h                   | 24 +++++++
 .../hda/codecs/side-codecs/tas2781_hda_i2c.c  | 28 ++++++++
 sound/soc/codecs/tas2781-fmwlib.c             | 67 ++++++++++++++++++-
 5 files changed, 121 insertions(+), 5 deletions(-)
 create mode 100644 include/sound/tas5825-tlv.h

diff --git a/include/sound/tas2781-dsp.h b/include/sound/tas2781-dsp.h
index c3a9efa73d5d..49bbf24d6559 100644
--- a/include/sound/tas2781-dsp.h
+++ b/include/sound/tas2781-dsp.h
@@ -34,6 +34,7 @@
 #define PPC3_VERSION_TAS2781_BASIC_MIN		0x14600
 #define PPC3_VERSION_TAS2781_ALPHA_MIN		0x4a00
 #define PPC3_VERSION_TAS2781_BETA_MIN		0x19400
+#define PPC3_VERSION_TAS5825_BASE		0x114200
 #define TASDEVICE_DEVICE_SUM			8
 #define TASDEVICE_CONFIG_SUM			64
 
@@ -53,6 +54,8 @@ enum tasdevice_dsp_dev_idx {
 	TASDEVICE_DSP_TAS_2781_DUAL_MONO,
 	TASDEVICE_DSP_TAS_2781_21,
 	TASDEVICE_DSP_TAS_2781_QUAD,
+	TASDEVICE_DSP_TAS_5825_MONO,
+	TASDEVICE_DSP_TAS_5825_DUAL,
 	TASDEVICE_DSP_TAS_MAX_DEVICE
 };
 
diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 3875e92f1ec5..f0aefc04a957 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -49,9 +49,9 @@
 #define TASDEVICE_REG(book, page, reg)	(((book * 256 * 128) + \
 					(page * 128)) + reg)
 
-/* Software Reset */
+/* Software Reset, compatble with new device (TAS5825). */
 #define TASDEVICE_REG_SWRESET		TASDEVICE_REG(0x0, 0x0, 0x01)
-#define TASDEVICE_REG_SWRESET_RESET	BIT(0)
+#define TASDEVICE_REG_SWRESET_RESET	(BIT(0) | BIT(4))
 
 /* Checksum */
 #define TASDEVICE_CHECKSUM_REG		TASDEVICE_REG(0x0, 0x0, 0x7e)
diff --git a/include/sound/tas5825-tlv.h b/include/sound/tas5825-tlv.h
new file mode 100644
index 000000000000..95f2d3fad120
--- /dev/null
+++ b/include/sound/tas5825-tlv.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+//
+// ALSA SoC Texas Instruments TAS5825 Audio Smart Amplifier
+//
+// Copyright (C) 2025 Texas Instruments Incorporated
+// https://www.ti.com
+//
+// The TAS5825 hda driver implements for one or two TAS5825 chips.
+//
+// Author: Baojun Xu <baojun.xu@ti.com>
+//
+
+#ifndef __TAS5825_TLV_H__
+#define __TAS5825_TLV_H__
+
+#define TAS5825_DVC_LEVEL		TASDEVICE_REG(0x0, 0x0, 0x4c)
+#define TAS5825_AMP_LEVEL		TASDEVICE_REG(0x0, 0x0, 0x54)
+
+static const __maybe_unused DECLARE_TLV_DB_SCALE(
+		tas5825_dvc_tlv, -10300, 50, 0);
+static const __maybe_unused DECLARE_TLV_DB_SCALE(
+		tas5825_amp_tlv, -1550, 50, 0);
+
+#endif
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 45ac5e41bd4f..71ee946eb748 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -26,6 +26,7 @@
 #include <sound/tlv.h>
 #include <sound/tas2770-tlv.h>
 #include <sound/tas2781-tlv.h>
+#include <sound/tas5825-tlv.h>
 
 #include "hda_local.h"
 #include "hda_auto_parser.h"
@@ -50,6 +51,7 @@ enum device_chip_id {
 	HDA_TAS2563,
 	HDA_TAS2770,
 	HDA_TAS2781,
+	HDA_TAS5825,
 	HDA_OTHERS
 };
 
@@ -272,6 +274,17 @@ static const struct snd_kcontrol_new tas2781_snd_controls[] = {
 		tas2781_force_fwload_get, tas2781_force_fwload_put),
 };
 
+static const struct snd_kcontrol_new tas5825_snd_controls[] = {
+	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Volume", TAS5825_AMP_LEVEL,
+		0, 0, 31, 1, tas2781_amp_getvol,
+		tas2781_amp_putvol, tas5825_amp_tlv),
+	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Digital Volume", TAS5825_DVC_LEVEL,
+		0, 0, 254, 1, tas2781_amp_getvol,
+		tas2781_amp_putvol, tas5825_dvc_tlv),
+	ACARD_SINGLE_BOOL_EXT("Speaker Force Firmware Load", 0,
+		tas2781_force_fwload_get, tas2781_force_fwload_put),
+};
+
 static const struct snd_kcontrol_new tasdevice_prof_ctrl = {
 	.name = "Speaker Profile Id",
 	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
@@ -501,6 +514,12 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 				     ARRAY_SIZE(tas2781_snd_controls));
 		tasdevice_dspfw_init(context);
 		break;
+	case HDA_TAS5825:
+		tasdev_add_kcontrols(tas_priv, hda_priv->snd_ctls, codec,
+				     &tas5825_snd_controls[0],
+				     ARRAY_SIZE(tas5825_snd_controls));
+		tasdevice_dspfw_init(context);
+		break;
 	case HDA_TAS2563:
 		tasdevice_dspfw_init(context);
 		break;
@@ -628,6 +647,7 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 	} else if (strstarts(dev_name(&clt->dev),
 			     "i2c-TXNW2781:00-tas2781-hda.0")) {
 		device_name = "TXNW2781";
+		hda_priv->hda_chip_id = HDA_TAS2781;
 		hda_priv->save_calibration = tas2781_save_calibration;
 		tas_hda->priv->global_addr = TAS2781_GLOBAL_ADDR;
 	} else if (strstr(dev_name(&clt->dev), "INT8866")) {
@@ -639,6 +659,13 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 		hda_priv->hda_chip_id = HDA_TAS2563;
 		hda_priv->save_calibration = tas2563_save_calibration;
 		tas_hda->priv->global_addr = TAS2563_GLOBAL_ADDR;
+	} else if (strstarts(dev_name(&clt->dev), "i2c-TXNW5825")) {
+		/*
+		 * TAS5825, integrated on-chip DSP without
+		 * global I2C address and calibration supported.
+		 */
+		device_name = "TXNW5825";
+		hda_priv->hda_chip_id = HDA_TAS5825;
 	} else {
 		return -ENODEV;
 	}
@@ -775,6 +802,7 @@ static const struct acpi_device_id tas2781_acpi_hda_match[] = {
 	{"TIAS2781", 0 },
 	{"TXNW2770", 0 },
 	{"TXNW2781", 0 },
+	{"TXNW5825", 0 },
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, tas2781_acpi_hda_match);
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index c9c1e608ddb7..d69faef8a4d7 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -91,7 +91,7 @@ struct blktyp_devidx_map {
 };
 
 static const char deviceNumber[TASDEVICE_DSP_TAS_MAX_DEVICE] = {
-	1, 2, 1, 2, 1, 1, 0, 2, 4, 3, 1, 2, 3, 4
+	1, 2, 1, 2, 1, 1, 0, 2, 4, 3, 1, 2, 3, 4, 1, 2
 };
 
 /* fixed m68k compiling issue: mapping table can save code field */
@@ -509,6 +509,56 @@ static int fw_parse_data_kernel(struct tasdevice_fw *tas_fmw,
 	return offset;
 }
 
+static int fw_parse_tas5825_program_data_kernel(
+	struct tasdevice_priv *tas_priv, struct tasdevice_fw *tas_fmw,
+	const struct firmware *fmw, int offset)
+{
+	struct tasdevice_prog *program;
+	unsigned int i;
+
+	for (i = 0; i < tas_fmw->nr_programs; i++) {
+		program = &(tas_fmw->programs[i]);
+		if (offset + 72 > fmw->size) {
+			dev_err(tas_priv->dev, "%s: mpName error\n", __func__);
+			return -EINVAL;
+		}
+		/* Skip 65 unused byts*/
+		offset += 65;
+		offset = fw_parse_data_kernel(tas_fmw, &(program->dev_data),
+			fmw, offset);
+		if (offset < 0)
+			return offset;
+	}
+
+	return offset;
+}
+
+static int fw_parse_tas5825_configuration_data_kernel(
+	struct tasdevice_priv *tas_priv,
+	struct tasdevice_fw *tas_fmw, const struct firmware *fmw, int offset)
+{
+	const unsigned char *data = fmw->data;
+	struct tasdevice_config *config;
+	unsigned int i;
+
+	for (i = 0; i < tas_fmw->nr_configurations; i++) {
+		config = &(tas_fmw->configs[i]);
+		if (offset + 80 > fmw->size) {
+			dev_err(tas_priv->dev, "%s: mpName error\n", __func__);
+			return -EINVAL;
+		}
+		memcpy(config->name, &data[offset], 64);
+		/* Skip extra 8 bytes*/
+		offset += 72;
+		offset = fw_parse_data_kernel(tas_fmw, &(config->dev_data),
+			fmw, offset);
+		if (offset < 0)
+			return offset;
+	}
+
+	return offset;
+}
+
 static int fw_parse_program_data_kernel(
 	struct tasdevice_priv *tas_priv, struct tasdevice_fw *tas_fmw,
 	const struct firmware *fmw, int offset)
@@ -1826,7 +1876,8 @@ static void dspbin_type_check(struct tasdevice_priv *tas_priv,
 		else
 			tas_priv->dspbin_typ = TASDEV_ALPHA;
 	}
-	if (tas_priv->dspbin_typ != TASDEV_BASIC)
+	if ((tas_priv->dspbin_typ != TASDEV_BASIC) &&
+		(ppcver < PPC3_VERSION_TAS5825_BASE))
 		tas_priv->fw_parse_fct_param_address =
 			fw_parse_fct_param_address;
 }
@@ -1837,7 +1888,17 @@ static int dspfw_default_callback(struct tasdevice_priv *tas_priv,
 	int rc = 0;
 
 	if (drv_ver == 0x100) {
-		if (ppcver >= PPC3_VERSION_BASE) {
+		if (ppcver >= PPC3_VERSION_TAS5825_BASE) {
+			tas_priv->fw_parse_variable_header =
+				fw_parse_variable_header_kernel;
+			tas_priv->fw_parse_program_data =
+				fw_parse_tas5825_program_data_kernel;
+			tas_priv->fw_parse_configuration_data =
+				fw_parse_tas5825_configuration_data_kernel;
+			tas_priv->tasdevice_load_block =
+				tasdevice_load_block_kernel;
+			dspbin_type_check(tas_priv, ppcver);
+		} else if (ppcver >= PPC3_VERSION_BASE) {
 			tas_priv->fw_parse_variable_header =
 				fw_parse_variable_header_kernel;
 			tas_priv->fw_parse_program_data =
-- 
2.43.0


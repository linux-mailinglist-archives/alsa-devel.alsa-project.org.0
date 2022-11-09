Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAE8622685
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 10:14:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 352953E;
	Wed,  9 Nov 2022 10:13:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 352953E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667985286;
	bh=S/lDGZDMAmw/U1TzZm4fehkZVs+Iz91Zg3J8ojUGIlw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eZaUw0OSqFA6D3RRMnDOFjKfZbIRviC6YF9m9RQX9UI6utOWSYdLC7Z/+0xrcmZDl
	 YQ/jO2wmQ+yFZIqnTmR7715ZEHFYcv9rvuh8gePGNYYzhBADU8+FjZo5c2N0T+qte0
	 6tFbM/TnbFnFsA6LpYg4HGak0vtSZpzlzVDE9RQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8987F80568;
	Wed,  9 Nov 2022 10:13:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D274BF80567; Wed,  9 Nov 2022 10:13:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id 40F57F80217
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 10:13:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40F57F80217
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 2A99CW2t8022117,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 2A99CW2t8022117
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Wed, 9 Nov 2022 17:12:32 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Wed, 9 Nov 2022 17:13:11 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 9 Nov 2022 17:13:10 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 3/4] ASoC: Intel: sof_sdw_rt1308: add BQ params for the Dell
 models
Date: Wed, 9 Nov 2022 17:13:06 +0800
Message-ID: <20221109091306.17221-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/09/2022 08:52:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzExLzkgpFekyCAwNzoxNTowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, jauliang@realtek.com, derek.fang@realtek.com,
 Shuming Fan <shumingf@realtek.com>, jfmiranda@gmail.com, flove@realtek.com,
 pierre-louis.bossart@intel.com
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

From: Shuming Fan <shumingf@realtek.com>

The Dell SKU 0A5D/0A5E/0990/098F model needs the BQ params for the tweeter/woofer.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Pierre-Louis Bossart pierre-louis.bossart@linux.intel.com
---
 sound/soc/intel/boards/sof_sdw.c              |   1 +
 .../intel/boards/sof_sdw_amp_coeff_tables.h   | 162 ++++++++++++++++++
 sound/soc/intel/boards/sof_sdw_common.h       |   2 +
 sound/soc/intel/boards/sof_sdw_rt1308.c       | 120 +++++++++++++
 4 files changed, 285 insertions(+)
 create mode 100644 sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index ee9857dc3135..a3bbdc261a4a 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -510,6 +510,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.dai_name = "rt1308-aif",
 		.ops = &sof_sdw_rt1308_i2s_ops,
 		.init = sof_sdw_rt1308_init,
+		.exit = sof_sdw_rt1308_exit,
 		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
diff --git a/sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h b/sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h
new file mode 100644
index 000000000000..bb90a5922fd2
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h
@@ -0,0 +1,162 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ */
+
+/*
+ *  sof_sdw_amp_coeff_tables.h - related coefficients for amplifier parameters
+ */
+
+#ifndef SND_SOC_SOF_SDW_AMP_COEFF_H
+#define SND_SOC_SOF_SDW_AMP_COEFF_H
+
+#define RT1308_MAX_BQ_REG 480
+
+static const u8 dell_0a5d_bq_params[] = {
+	0xb0, 0xc5, 0x00,  /* address: 0xc5b0; data: 0x00 */
+	0xb1, 0xc5, 0x32,
+	0xb2, 0xc5, 0x44,
+	0xb3, 0xc5, 0x19,
+	0xc0, 0xc5, 0x04,
+	0xc1, 0xc5, 0x00,
+	0xc2, 0xc5, 0x00,
+	0xc3, 0xc5, 0x00,
+	0xd0, 0xc5, 0x02,
+	0xd1, 0xc5, 0x00,
+	0xd2, 0xc5, 0x00,
+	0xd3, 0xc5, 0x00,
+	0xe0, 0xc5, 0x01,
+	0xe1, 0xc5, 0xe8,
+	0xe2, 0xc5, 0x5f,
+	0xe3, 0xc5, 0x8a,
+	0xf0, 0xc5, 0x1f,
+	0xf1, 0xc5, 0x4e,
+	0xf2, 0xc5, 0x90,
+	0xf3, 0xc5, 0x11,
+	0x50, 0xc6, 0x01,
+	0x51, 0xc6, 0xff,
+	0x52, 0xc6, 0x45,
+	0x53, 0xc6, 0x41,
+	0x60, 0xc6, 0x1c,
+	0x61, 0xc6, 0x00,
+	0x62, 0xc6, 0x00,
+	0x63, 0xc6, 0x00,
+	0x70, 0xc6, 0x02,
+	0x71, 0xc6, 0x00,
+	0x72, 0xc6, 0x00,
+	0x73, 0xc6, 0x00,
+	0x80, 0xc6, 0x03,
+	0x81, 0xc6, 0xfe,
+	0x82, 0xc6, 0x89,
+	0x83, 0xc6, 0xfa,
+	0x90, 0xc6, 0x1e,
+	0x91, 0xc6, 0x01,
+	0x92, 0xc6, 0x74,
+	0x93, 0xc6, 0xf6,
+	0x00, 0xc6, 0x01,
+	0x01, 0xc6, 0xd9,
+	0x02, 0xc6, 0xfb,
+	0x03, 0xc6, 0xc4,
+	0x10, 0xc6, 0x1c,
+	0x11, 0xc6, 0x00,
+	0x12, 0xc6, 0x00,
+	0x13, 0xc6, 0x00,
+	0x20, 0xc6, 0x02,
+	0x21, 0xc6, 0x00,
+	0x22, 0xc6, 0x00,
+	0x23, 0xc6, 0x00,
+	0x30, 0xc6, 0x03,
+	0x31, 0xc6, 0xaf,
+	0x32, 0xc6, 0x23,
+	0x33, 0xc6, 0xcb,
+	0x40, 0xc6, 0x1e,
+	0x41, 0xc6, 0x47,
+	0x42, 0xc6, 0x34,
+	0x43, 0xc6, 0xba,
+	0xa0, 0xc6, 0x01,
+	0xa1, 0xc6, 0xff,
+	0xa2, 0xc6, 0x45,
+	0xa3, 0xc6, 0x41,
+	0xb0, 0xc6, 0x1c,
+	0xb1, 0xc6, 0x00,
+	0xb2, 0xc6, 0x00,
+	0xb3, 0xc6, 0x00,
+	0xc0, 0xc6, 0x02,
+	0xc1, 0xc6, 0x00,
+	0xc2, 0xc6, 0x00,
+	0xc3, 0xc6, 0x00,
+	0xd0, 0xc6, 0x03,
+	0xd1, 0xc6, 0xfe,
+	0xd2, 0xc6, 0x89,
+	0xd3, 0xc6, 0xfa,
+	0xe0, 0xc6, 0x1e,
+	0xe1, 0xc6, 0x01,
+	0xe2, 0xc6, 0x74,
+	0xe3, 0xc6, 0xf6,
+	0x40, 0xc5, 0x0d,
+	0x30, 0xc7, 0x15,
+	0x31, 0xc7, 0x7c,
+	0x32, 0xc7, 0x0f,
+	0x33, 0xc7, 0xa0,
+	0x40, 0xc7, 0x00,
+	0x41, 0xc7, 0x00,
+	0x42, 0xc7, 0xf8,
+	0x43, 0xc7, 0xf8,
+	0x50, 0xc7, 0x00,
+	0x51, 0xc7, 0x00,
+	0x52, 0xc7, 0x00,
+	0x53, 0xc7, 0x01,
+	0x90, 0xc7, 0x00,
+	0x91, 0xc7, 0x14,
+	0x92, 0xc7, 0x00,
+	0x93, 0xc7, 0x14,
+	0xa0, 0xc7, 0x00,
+	0xa1, 0xc7, 0x00,
+	0xa2, 0xc7, 0xf8,
+	0xa3, 0xc7, 0xf8,
+	0xb0, 0xc7, 0x00,
+	0xb1, 0xc7, 0x00,
+	0xb2, 0xc7, 0x00,
+	0xb3, 0xc7, 0x00,
+	0x60, 0xc7, 0x03,
+	0x61, 0xc7, 0xe8,
+	0x62, 0xc7, 0x03,
+	0x63, 0xc7, 0xb6,
+	0x70, 0xc7, 0x00,
+	0x71, 0xc7, 0x00,
+	0x72, 0xc7, 0xf8,
+	0x73, 0xc7, 0xf8,
+	0x80, 0xc7, 0x00,
+	0x81, 0xc7, 0x00,
+	0x82, 0xc7, 0x00,
+	0x83, 0xc7, 0x00,
+	0xc0, 0xc7, 0x00,
+	0xc1, 0xc7, 0x14,
+	0xc2, 0xc7, 0x00,
+	0xc3, 0xc7, 0x14,
+	0xd0, 0xc7, 0x00,
+	0xd1, 0xc7, 0x00,
+	0xd2, 0xc7, 0xf8,
+	0xd3, 0xc7, 0xf8,
+	0xe0, 0xc7, 0x00,
+	0xe1, 0xc7, 0x00,
+	0xe2, 0xc7, 0x00,
+	0xe3, 0xc7, 0x00,
+	0x60, 0xc5, 0x02,
+	0x61, 0xc5, 0x00,
+	0x62, 0xc5, 0x00,
+	0x63, 0xc5, 0x00,
+	0x70, 0xc5, 0x02,
+	0x71, 0xc5, 0x00,
+	0x72, 0xc5, 0x00,
+	0x73, 0xc5, 0x00,
+	0x80, 0xc5, 0x02,
+	0x81, 0xc5, 0x00,
+	0x82, 0xc5, 0x00,
+	0x83, 0xc5, 0x00,
+	0x90, 0xc5, 0x02,
+	0x91, 0xc5, 0x00,
+	0x92, 0xc5, 0x00,
+	0x93, 0xc5, 0x00,
+	0x50, 0xc5, 0x01,
+};
+
+#endif
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index e2457738a332..772af23e7497 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -83,6 +83,7 @@ struct mc_private {
 	bool idisp_codec;
 	struct snd_soc_jack sdw_headset;
 	struct device *headset_codec_dev; /* only one headset per card */
+	struct device *amp_dev1, *amp_dev2;
 };
 
 extern unsigned long sof_sdw_quirk;
@@ -132,6 +133,7 @@ int sof_sdw_rt1308_init(struct snd_soc_card *card,
 			struct snd_soc_dai_link *dai_links,
 			struct sof_sdw_codec_info *info,
 			bool playback);
+int sof_sdw_rt1308_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
 /* RT1316 support */
 int sof_sdw_rt1316_init(struct snd_soc_card *card,
diff --git a/sound/soc/intel/boards/sof_sdw_rt1308.c b/sound/soc/intel/boards/sof_sdw_rt1308.c
index f078fb1aad02..a19b055b9c6f 100644
--- a/sound/soc/intel/boards/sof_sdw_rt1308.c
+++ b/sound/soc/intel/boards/sof_sdw_rt1308.c
@@ -11,9 +11,86 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <linux/dmi.h>
 #include "sof_sdw_common.h"
+#include "sof_sdw_amp_coeff_tables.h"
 #include "../../codecs/rt1308.h"
 
+struct rt1308_platform_data {
+	const unsigned char *bq_params;
+	const unsigned int bq_params_cnt;
+};
+
+static const struct rt1308_platform_data dell_0a5d_platform_data = {
+	.bq_params = dell_0a5d_bq_params,
+	.bq_params_cnt = ARRAY_SIZE(dell_0a5d_bq_params),
+};
+
+static const struct dmi_system_id dmi_platform_data[] = {
+	/* CometLake devices */
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0990")
+		},
+		.driver_data = (void *)&dell_0a5d_platform_data,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "098F")
+		},
+		.driver_data = (void *)&dell_0a5d_platform_data,
+	},
+	/* TigerLake devices */
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A5D")
+		},
+		.driver_data = (void *)&dell_0a5d_platform_data,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A5E")
+		},
+		.driver_data = (void *)&dell_0a5d_platform_data,
+	},
+};
+
+static int rt1308_add_device_props(struct device *sdw_dev)
+{
+	struct property_entry props[3] = {};
+	struct fwnode_handle *fwnode;
+	const struct dmi_system_id *dmi_data;
+	const struct rt1308_platform_data *pdata;
+	unsigned char params[RT1308_MAX_BQ_REG];
+	int ret;
+
+	dmi_data = dmi_first_match(dmi_platform_data);
+	if (!dmi_data)
+		return 0;
+
+	pdata = dmi_data->driver_data;
+	memcpy(&params, pdata->bq_params, sizeof(unsigned char) * pdata->bq_params_cnt);
+
+	props[0] = PROPERTY_ENTRY_U8_ARRAY("realtek,bq-params", params);
+	props[1] = PROPERTY_ENTRY_U32("realtek,bq-params-cnt", pdata->bq_params_cnt);
+
+	fwnode = fwnode_create_software_node(props, NULL);
+	if (IS_ERR(fwnode))
+		return PTR_ERR(fwnode);
+
+	ret = device_add_software_node(sdw_dev, to_software_node(fwnode));
+
+	fwnode_handle_put(fwnode);
+
+	return ret;
+}
+
 static const struct snd_soc_dapm_widget rt1308_widgets[] = {
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
@@ -127,12 +204,33 @@ struct snd_soc_ops sof_sdw_rt1308_i2s_ops = {
 	.hw_params = rt1308_i2s_hw_params,
 };
 
+int sof_sdw_rt1308_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
+{
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+
+	if (ctx->amp_dev1) {
+		device_remove_software_node(ctx->amp_dev1);
+		put_device(ctx->amp_dev1);
+	}
+
+	if (ctx->amp_dev2) {
+		device_remove_software_node(ctx->amp_dev2);
+		put_device(ctx->amp_dev2);
+	}
+
+	return 0;
+}
+
 int sof_sdw_rt1308_init(struct snd_soc_card *card,
 			const struct snd_soc_acpi_link_adr *link,
 			struct snd_soc_dai_link *dai_links,
 			struct sof_sdw_codec_info *info,
 			bool playback)
 {
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct device *sdw_dev1, *sdw_dev2;
+	int ret;
+
 	/* Count amp number and do init on playback link only. */
 	if (!playback)
 		return 0;
@@ -142,6 +240,28 @@ int sof_sdw_rt1308_init(struct snd_soc_card *card,
 		dai_links->init = first_spk_init;
 
 	if (info->amp_num == 2) {
+		sdw_dev1 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[0].name);
+		if (!sdw_dev1)
+			return -EPROBE_DEFER;
+
+		ret = rt1308_add_device_props(sdw_dev1);
+		if (ret < 0) {
+			put_device(sdw_dev1);
+			return ret;
+		}
+		ctx->amp_dev1 = sdw_dev1;
+
+		sdw_dev2 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[1].name);
+		if (!sdw_dev2)
+			return -EPROBE_DEFER;
+
+		ret = rt1308_add_device_props(sdw_dev2);
+		if (ret < 0) {
+			put_device(sdw_dev2);
+			return ret;
+		}
+		ctx->amp_dev2 = sdw_dev2;
+
 		/*
 		 * if two 1308s are in one dai link, the init function
 		 * in this dai link will be first set for the first speaker,
-- 
2.38.1


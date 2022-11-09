Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3D762268A
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 10:15:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00867AE8;
	Wed,  9 Nov 2022 10:14:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00867AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667985301;
	bh=DdXf4ND2zZG94HjYB0q70JMmD2ViZomb04jMy8G5jGw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I2kBuYvIbqzqziXiBSft42MdhUupUoDB79pttRwAkPCJrmLoB6Q8aIwYCPKoRGtMK
	 H+K+sNx766PksiLFqcvW5HuPiTdRthO/3A41pd9rch3qeXhSGPTFk7p4HFC02naBZU
	 9uh6SmdviqGctRVK7Z6LKv54EgAqIsqRmaggpJ9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4184DF80571;
	Wed,  9 Nov 2022 10:13:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46971F80570; Wed,  9 Nov 2022 10:13:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id 93E77F80563
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 10:13:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93E77F80563
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 2A99ChvyE022196,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 2A99ChvyE022196
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Wed, 9 Nov 2022 17:12:43 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 9 Nov 2022 17:13:21 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 9 Nov 2022 17:13:21 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 4/4] ASoC: Intel: sof_sdw_rt1316: add BQ params for the Dell
 models
Date: Wed, 9 Nov 2022 17:13:17 +0800
Message-ID: <20221109091317.17240-1-shumingf@realtek.com>
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
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
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

The Dell SKU 0B00/0B01/0AFE/0AFF model needs the BQ params for the tweeter/woofer.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Pierre-Louis Bossart pierre-louis.bossart@linux.intel.com
---
 sound/soc/intel/boards/sof_sdw.c              |   1 +
 .../intel/boards/sof_sdw_amp_coeff_tables.h   | 138 ++++++++++++++++++
 sound/soc/intel/boards/sof_sdw_common.h       |   1 +
 sound/soc/intel/boards/sof_sdw_rt1316.c       | 119 +++++++++++++++
 4 files changed, 259 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index a3bbdc261a4a..949adfdd0e3c 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -518,6 +518,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.direction = {true, true},
 		.dai_name = "rt1316-aif",
 		.init = sof_sdw_rt1316_init,
+		.exit = sof_sdw_rt1316_exit,
 		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
diff --git a/sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h b/sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h
index bb90a5922fd2..82230fbb5b05 100644
--- a/sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h
+++ b/sound/soc/intel/boards/sof_sdw_amp_coeff_tables.h
@@ -9,6 +9,7 @@
 #define SND_SOC_SOF_SDW_AMP_COEFF_H
 
 #define RT1308_MAX_BQ_REG 480
+#define RT1316_MAX_BQ_REG 580
 
 static const u8 dell_0a5d_bq_params[] = {
 	0xb0, 0xc5, 0x00,  /* address: 0xc5b0; data: 0x00 */
@@ -159,4 +160,141 @@ static const u8 dell_0a5d_bq_params[] = {
 	0x50, 0xc5, 0x01,
 };
 
+static const u8 dell_0b00_bq_params[] = {
+	0x03, 0xc2, 0x00,
+	0x04, 0xc2, 0xb2,
+	0x05, 0xc2, 0xe0,
+	0x06, 0xc2, 0x3a,
+	0x07, 0xc2, 0x01,
+	0x08, 0xc2, 0x65,
+	0x09, 0xc2, 0xc0,
+	0x0a, 0xc2, 0x75,
+	0x0b, 0xc2, 0x00,
+	0x0c, 0xc2, 0xb2,
+	0x0d, 0xc2, 0xe0,
+	0x0e, 0xc2, 0x3a,
+	0x0f, 0xc2, 0xf7,
+	0x10, 0xc2, 0x4d,
+	0x11, 0xc2, 0x5b,
+	0x12, 0xc2, 0xe9,
+	0x13, 0xc2, 0x03,
+	0x14, 0xc2, 0x7e,
+	0x15, 0xc2, 0x25,
+	0x16, 0xc2, 0x01,
+	0x17, 0xc2, 0x07,
+	0x18, 0xc2, 0xfd,
+	0x19, 0xc2, 0x15,
+	0x1a, 0xc2, 0x04,
+	0x1b, 0xc2, 0xf0,
+	0x1c, 0xc2, 0x05,
+	0x1d, 0xc2, 0xd5,
+	0x1e, 0xc2, 0xf7,
+	0x1f, 0xc2, 0x07,
+	0x20, 0xc2, 0xfd,
+	0x21, 0xc2, 0x15,
+	0x22, 0xc2, 0x04,
+	0x23, 0xc2, 0xf0,
+	0x24, 0xc2, 0x05,
+	0x25, 0xc2, 0xd8,
+	0x26, 0xc2, 0x17,
+	0x27, 0xc2, 0x07,
+	0x28, 0xc2, 0xfa,
+	0x29, 0xc2, 0x2c,
+	0x2a, 0xc2, 0x29,
+	0x2b, 0xc2, 0x07,
+	0x2c, 0xc2, 0x74,
+	0x2d, 0xc2, 0xe0,
+	0x2e, 0xc2, 0x33,
+	0x2f, 0xc2, 0xf1,
+	0x30, 0xc2, 0x16,
+	0x31, 0xc2, 0x3f,
+	0x32, 0xc2, 0x9b,
+	0x33, 0xc2, 0x07,
+	0x34, 0xc2, 0x74,
+	0x35, 0xc2, 0xe0,
+	0x36, 0xc2, 0x33,
+	0x37, 0xc2, 0xf1,
+	0x38, 0xc2, 0x29,
+	0x39, 0xc2, 0xb0,
+	0x3a, 0xc2, 0x4d,
+	0x3b, 0xc2, 0x06,
+	0x3c, 0xc2, 0xfd,
+	0x3d, 0xc2, 0x31,
+	0x3e, 0xc2, 0x18,
+	0x3f, 0xc2, 0x07,
+	0x40, 0xc2, 0xfd,
+	0x41, 0xc2, 0x15,
+	0x42, 0xc2, 0x04,
+	0x43, 0xc2, 0xf0,
+	0x44, 0xc2, 0x05,
+	0x45, 0xc2, 0xd5,
+	0x46, 0xc2, 0xf7,
+	0x47, 0xc2, 0x07,
+	0x48, 0xc2, 0xfd,
+	0x49, 0xc2, 0x15,
+	0x4a, 0xc2, 0x04,
+	0x4b, 0xc2, 0xf0,
+	0x4c, 0xc2, 0x05,
+	0x4d, 0xc2, 0xd8,
+	0x4e, 0xc2, 0x17,
+	0x4f, 0xc2, 0x07,
+	0x50, 0xc2, 0xfa,
+	0x51, 0xc2, 0x2c,
+	0x52, 0xc2, 0x29,
+	0x0b, 0xc0, 0x30,
+	0x80, 0xc3, 0x13,
+	0x81, 0xc3, 0x88,
+	0x82, 0xc3, 0x17,
+	0x83, 0xc3, 0x70,
+	0x84, 0xc3, 0x00,
+	0x85, 0xc3, 0x00,
+	0x86, 0xc3, 0xff,
+	0x87, 0xc3, 0xee,
+	0x88, 0xc3, 0x02,
+	0x92, 0xc3, 0x00,
+	0x93, 0xc3, 0x14,
+	0x94, 0xc3, 0x00,
+	0x95, 0xc3, 0x14,
+	0x96, 0xc3, 0x00,
+	0x97, 0xc3, 0x00,
+	0x98, 0xc3, 0x00,
+	0x99, 0xc3, 0x00,
+	0x9a, 0xc3, 0x01,
+	0x89, 0xc3, 0x03,
+	0x8a, 0xc3, 0xe8,
+	0x8b, 0xc3, 0x03,
+	0x8c, 0xc3, 0xb6,
+	0x8d, 0xc3, 0x00,
+	0x8e, 0xc3, 0x00,
+	0x8f, 0xc3, 0xff,
+	0x90, 0xc3, 0xee,
+	0x91, 0xc3, 0x01,
+	0x9b, 0xc3, 0x00,
+	0x9c, 0xc3, 0x14,
+	0x9d, 0xc3, 0x00,
+	0x9e, 0xc3, 0x14,
+	0x9f, 0xc3, 0x00,
+	0xa0, 0xc3, 0x00,
+	0xa1, 0xc3, 0x00,
+	0xa2, 0xc3, 0x00,
+	0xa3, 0xc3, 0x01,
+	0x61, 0xc2, 0x08,
+	0x62, 0xc2, 0x00,
+	0x63, 0xc2, 0x00,
+	0x64, 0xc2, 0x00,
+	0x65, 0xc2, 0x08,
+	0x66, 0xc2, 0x00,
+	0x67, 0xc2, 0x00,
+	0x68, 0xc2, 0x00,
+	0x69, 0xc2, 0x08,
+	0x6a, 0xc2, 0x00,
+	0x6b, 0xc2, 0x00,
+	0x6c, 0xc2, 0x00,
+	0x6d, 0xc2, 0x08,
+	0x6e, 0xc2, 0x00,
+	0x6f, 0xc2, 0x00,
+	0x70, 0xc2, 0x00,
+	0x00, 0xc2, 0xc0,
+};
+
 #endif
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 772af23e7497..bac93fdc8d82 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -141,6 +141,7 @@ int sof_sdw_rt1316_init(struct snd_soc_card *card,
 			struct snd_soc_dai_link *dai_links,
 			struct sof_sdw_codec_info *info,
 			bool playback);
+int sof_sdw_rt1316_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
 /* RT715 support */
 int sof_sdw_rt715_init(struct snd_soc_card *card,
diff --git a/sound/soc/intel/boards/sof_sdw_rt1316.c b/sound/soc/intel/boards/sof_sdw_rt1316.c
index 58194b380232..f6bbea0d3810 100644
--- a/sound/soc/intel/boards/sof_sdw_rt1316.c
+++ b/sound/soc/intel/boards/sof_sdw_rt1316.c
@@ -11,7 +11,83 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-dapm.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <linux/dmi.h>
 #include "sof_sdw_common.h"
+#include "sof_sdw_amp_coeff_tables.h"
+
+struct rt1316_platform_data {
+	const unsigned char *bq_params;
+	const unsigned int bq_params_cnt;
+};
+
+static const struct rt1316_platform_data dell_0b00_platform_data = {
+	.bq_params = dell_0b00_bq_params,
+	.bq_params_cnt = ARRAY_SIZE(dell_0b00_bq_params),
+};
+
+static const struct dmi_system_id dmi_platform_data[] = {
+	/* AlderLake devices */
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B00")
+		},
+		.driver_data = (void *)&dell_0b00_platform_data,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B01")
+		},
+		.driver_data = (void *)&dell_0b00_platform_data,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0AFF")
+		},
+		.driver_data = (void *)&dell_0b00_platform_data,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0AFE")
+		},
+		.driver_data = (void *)&dell_0b00_platform_data,
+	},
+};
+
+static int rt1316_add_device_props(struct device *sdw_dev)
+{
+	struct property_entry props[3] = {};
+	struct fwnode_handle *fwnode;
+	const struct dmi_system_id *dmi_data;
+	const struct rt1316_platform_data *pdata;
+	unsigned char params[RT1316_MAX_BQ_REG];
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
 
 static const struct snd_soc_dapm_widget rt1316_widgets[] = {
 	SND_SOC_DAPM_SPK("Speaker", NULL),
@@ -89,12 +165,33 @@ static int all_spk_init(struct snd_soc_pcm_runtime *rtd)
 	return second_spk_init(rtd);
 }
 
+int sof_sdw_rt1316_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
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
 int sof_sdw_rt1316_init(struct snd_soc_card *card,
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
@@ -104,6 +201,28 @@ int sof_sdw_rt1316_init(struct snd_soc_card *card,
 		dai_links->init = first_spk_init;
 
 	if (info->amp_num == 2) {
+		sdw_dev1 = bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs[0].name);
+		if (!sdw_dev1)
+			return -EPROBE_DEFER;
+
+		ret = rt1316_add_device_props(sdw_dev1);
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
+		ret = rt1316_add_device_props(sdw_dev2);
+		if (ret < 0) {
+			put_device(sdw_dev2);
+			return ret;
+		}
+		ctx->amp_dev2 = sdw_dev2;
+
 		/*
 		 * if two 1316s are in one dai link, the init function
 		 * in this dai link will be first set for the first speaker,
-- 
2.38.1


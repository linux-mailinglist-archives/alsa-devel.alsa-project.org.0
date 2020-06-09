Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E111B1F4251
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 19:31:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 778321666;
	Tue,  9 Jun 2020 19:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 778321666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591723885;
	bh=OM9dP4xNtJ/+s1ivpdsWXBQVH4b8RvbpoydYtKV8Zgk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vWBKueXQHyGd+hkY4OxCMwjikXfm2zpaS71Zc0ZPDmPEB1Av54eqvzFnjnBrHLojN
	 4z/b32f6rYjl/lHzyu0QDjiSdJwX4PxdNyrADYpKzihblmGU55fHFiD8y+yBi7rKu8
	 AN/4xNvRJCBrmQoECr1JyeT9WOI5+Fwj/zVh4eh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D92ABF8029A;
	Tue,  9 Jun 2020 19:28:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17EEDF80088; Tue,  9 Jun 2020 19:28:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E454AF80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 19:28:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E454AF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uoh9CWMl"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 059HShli044899;
 Tue, 9 Jun 2020 12:28:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591723723;
 bh=2//qtpmlxjGLMRuFj0uPyCpsSXWRFXLDncN6IdvKdvA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=uoh9CWMlQ8pIpoz6QFOR7AQaCJkF0HBQ4O6DTPS4FHMAEolBTLmY0Xlz1UgY8iof6
 Ty49mNw+U7tOq6TaXtikobj20L22W5jaei5pNAL8sqIaO5IV+vHniJfgOptP+4/Qom
 +7GeSWooF/kqieHVjIEYf4+CE8M67BJSr/sAmcEc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 059HShEl130138
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Jun 2020 12:28:43 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Jun
 2020 12:28:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Jun 2020 12:28:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 059HSgc5018552;
 Tue, 9 Jun 2020 12:28:42 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <robh@kernel.org>
Subject: [RFC PATCH 2/2] ASoc: tas2563: DSP Firmware loading support
Date: Tue, 9 Jun 2020 12:28:41 -0500
Message-ID: <20200609172841.22541-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200609172841.22541-1-dmurphy@ti.com>
References: <20200609172841.22541-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
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

The TAS2563 device has a DSP that can run firmware.
The firmware can contain up to 5 programs and 10 configurations to
support alternate audio processing.

Firmware loading is done dymacally and the program and configuration
selection is done by the user.

The binary itself contains a list of instructions for either a single
mode write or a burst write.  The single mode write is list of register
writes to different books and pages within the register map.
The burst writes is a block of data that is written to a specific
location in memory.

The firmware loader must parse and load the blocks in real time as the
binary may contain different audio profiles.

If the DSP is not needed to do audio preocessing then the DSP program
can be turned off and the device will effectively turn off the DSP.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/Makefile             |   2 +-
 sound/soc/codecs/tas2562.c            |  48 ++--
 sound/soc/codecs/tas2562.h            |  25 ++
 sound/soc/codecs/tas25xx_dsp_loader.c | 377 ++++++++++++++++++++++++++
 sound/soc/codecs/tas25xx_dsp_loader.h |  93 +++++++
 5 files changed, 526 insertions(+), 19 deletions(-)
 create mode 100644 sound/soc/codecs/tas25xx_dsp_loader.c
 create mode 100644 sound/soc/codecs/tas25xx_dsp_loader.h

diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 47ae3cebb61e..c7a4e567b623 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -298,7 +298,7 @@ snd-soc-max98504-objs := max98504.o
 snd-soc-simple-amplifier-objs := simple-amplifier.o
 snd-soc-tpa6130a2-objs := tpa6130a2.o
 snd-soc-tas2552-objs := tas2552.o
-snd-soc-tas2562-objs := tas2562.o
+snd-soc-tas2562-objs := tas2562.o tas25xx_dsp_loader.o
 
 obj-$(CONFIG_SND_SOC_88PM860X)	+= snd-soc-88pm860x.o
 obj-$(CONFIG_SND_SOC_AB8500_CODEC)	+= snd-soc-ab8500-codec.o
diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 7fae88655a0f..3e60fdec4cfd 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/errno.h>
 #include <linux/device.h>
+#include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -22,6 +23,7 @@
 #include <sound/tlv.h>
 
 #include "tas2562.h"
+#include "tas25xx_dsp_loader.h"
 
 #define TAS2562_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |\
 			 SNDRV_PCM_FORMAT_S32_LE)
@@ -44,22 +46,6 @@ static const unsigned int float_vol_db_lookup[] = {
 0x197a967f, 0x2013739e, 0x28619ae9, 0x32d64617, 0x40000000
 };
 
-struct tas2562_data {
-	struct snd_soc_component *component;
-	struct gpio_desc *sdz_gpio;
-	struct regmap *regmap;
-	struct device *dev;
-	struct i2c_client *client;
-	int v_sense_slot;
-	int i_sense_slot;
-	int volume_lvl;
-};
-
-enum tas256x_model {
-	TAS2562,
-	TAS2563,
-};
-
 static int tas2562_set_bias_level(struct snd_soc_component *component,
 				 enum snd_soc_bias_level level)
 {
@@ -343,6 +329,17 @@ static int tas2562_mute(struct snd_soc_dai *dai, int mute)
 					     mute ? TAS2562_MUTE : 0);
 }
 
+static void tas2562_fw_loaded(const struct firmware *fw, void *context)
+{
+	struct snd_soc_component *component = context;
+	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	ret = tas25xx_init_fw(tas2562, fw);
+	if (ret)
+		dev_err(tas2562->dev, "Firmware failed to initialize\n");
+}
+
 static int tas2562_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(component);
@@ -358,6 +355,12 @@ static int tas2562_codec_probe(struct snd_soc_component *component)
 	if (ret < 0)
 		return ret;
 
+	if (tas2562->load_firmware == 0 && tas2562->model_id == TAS2563)
+		request_firmware_nowait(THIS_MODULE, FW_ACTION_HOTPLUG,
+					tas2562->firmware_name, component->dev,
+					GFP_KERNEL, component,
+					tas2562_fw_loaded);
+
 	return 0;
 }
 
@@ -580,7 +583,7 @@ static struct snd_soc_dai_driver tas2562_dai[] = {
 static const struct regmap_range_cfg tas2562_ranges[] = {
 	{
 		.range_min = 0,
-		.range_max = 5 * 128,
+		.range_max = 255 * 128,
 		.selector_reg = TAS2562_PAGE_CTRL,
 		.selector_mask = 0xff,
 		.selector_shift = 0,
@@ -606,7 +609,7 @@ static const struct regmap_config tas2562_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 
-	.max_register = 5 * 128,
+	.max_register = 255 * 128,
 	.cache_type = REGCACHE_RBTREE,
 	.reg_defaults = tas2562_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(tas2562_reg_defaults),
@@ -634,6 +637,14 @@ static int tas2562_parse_dt(struct tas2562_data *tas2562)
 		dev_err(dev, "Looking up %s property failed %d\n",
 			"ti,imon-slot-no", ret);
 
+	if (tas2562->model_id != TAS2562) {
+		tas2562->load_firmware = fwnode_property_read_string(dev->fwnode,
+							"firmware-name",
+						       &tas2562->firmware_name);
+		if (tas2562->load_firmware)
+			dev_info(dev, "No firmware file to request\n");
+	}
+
 	return ret;
 }
 
@@ -650,6 +661,7 @@ static int tas2562_probe(struct i2c_client *client,
 
 	data->client = client;
 	data->dev = &client->dev;
+	data->model_id = id->driver_data;
 
 	tas2562_parse_dt(data);
 
diff --git a/sound/soc/codecs/tas2562.h b/sound/soc/codecs/tas2562.h
index 28e75fc431d0..66c15b05cd35 100644
--- a/sound/soc/codecs/tas2562.h
+++ b/sound/soc/codecs/tas2562.h
@@ -11,6 +11,7 @@
 #define __TAS2562_H__
 
 #define TAS2562_PAGE_CTRL	0x00
+#define TAS2562_BOOK_CTRL	0x7f
 
 #define TAS2562_REG(page, reg)	((page * 128) + reg)
 
@@ -40,6 +41,8 @@
 #define TAS2562_DVC_CFG3	TAS2562_REG(2, 0x0e)
 #define TAS2562_DVC_CFG4	TAS2562_REG(2, 0x0f)
 
+#define TAS25XX_DSP_MODE	TAS2562_REG(1, 2)
+
 #define TAS2562_RESET	BIT(0)
 
 #define TAS2562_MODE_MASK	GENMASK(1,0)
@@ -84,4 +87,26 @@
 #define TAS2562_TDM_CFG6_ISNS_EN	BIT(6)
 #define TAS2562_TDM_CFG6_ISNS_SLOT_MASK	GENMASK(5, 0)
 
+#define TAS2563_FW_HDR_OFFSET		134
+
+struct tas2562_data {
+	struct snd_soc_component *component;
+	struct gpio_desc *sdz_gpio;
+	struct regmap *regmap;
+	struct device *dev;
+	struct i2c_client *client;
+	struct tas25xx_fw_data *fw_data;
+	const char *firmware_name;
+	int load_firmware;
+	int model_id;
+	int v_sense_slot;
+	int i_sense_slot;
+	int volume_lvl;
+};
+
+enum tas2562_id {
+	TAS2562,
+	TAS2563,
+};
+
 #endif /* __TAS2562_H__ */
diff --git a/sound/soc/codecs/tas25xx_dsp_loader.c b/sound/soc/codecs/tas25xx_dsp_loader.c
new file mode 100644
index 000000000000..45cc5a253898
--- /dev/null
+++ b/sound/soc/codecs/tas25xx_dsp_loader.c
@@ -0,0 +1,377 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Firmware loader for the Texas Instruments TAS25XX DSP
+// Copyright (C) 2020 Texas Instruments Inc.
+
+#include <linux/module.h>
+#include <linux/errno.h>
+#include <linux/device.h>
+#include <linux/firmware.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
+
+#include "tas25xx_dsp_loader.h"
+
+static void tas25xx_process_fw_delay(struct tas2562_data *tas2562, u8 *fw_out)
+{
+	u16 fw_delay = fw_out[2] << 8 | fw_out[3];
+
+	mdelay(fw_delay);
+}
+
+static int tas25xx_process_fw_single(struct tas2562_data *tas2562,
+				     struct tas25xx_cmd_data *cmd_data,
+				     u8 *fw_out)
+{
+	int num_writes = cpu_to_be16(cmd_data->length);
+	int i;
+	int ret;
+	int offset = 4;
+	int reg_data, write_reg;
+
+	for (i = 0; i < num_writes; i++) {
+		/* Reset Page to 0 */
+		ret = regmap_write(tas2562->regmap, TAS2562_PAGE_CTRL, 0);
+		if (ret)
+			return ret;
+
+		cmd_data->book = fw_out[offset];
+		cmd_data->page = fw_out[offset + 1];
+		cmd_data->offset = fw_out[offset + 2];
+		reg_data = fw_out[offset + 3];
+		offset += 4;
+
+		ret = regmap_write(tas2562->regmap, TAS2562_BOOK_CTRL,
+				   cmd_data->book);
+		if (ret)
+			return ret;
+
+		write_reg = TAS2562_REG(cmd_data->page, cmd_data->offset);
+		ret = regmap_write(tas2562->regmap, write_reg, reg_data);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int tas25xx_process_fw_burst(struct tas2562_data *tas2562,
+				    struct tas25xx_cmd_data *cmd_data,
+				    u8 *fw_out, int size)
+{
+	int hdr_size = sizeof(struct tas25xx_cmd_data);
+	u8 *data = &fw_out[hdr_size];
+	int ret;
+	int reg_data = TAS2562_REG(cmd_data->page, cmd_data->offset);
+
+	/* Reset Page to 0 */
+	ret = regmap_write(tas2562->regmap, TAS2562_PAGE_CTRL, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(tas2562->regmap, TAS2562_BOOK_CTRL, cmd_data->book);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_write(tas2562->regmap, reg_data, data,
+				cpu_to_be16(cmd_data->length));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int tas25xx_process_block(struct tas2562_data *tas2562, u8 *data)
+{
+	struct tas25xx_cmd_data *cmd_data = (struct tas25xx_cmd_data *)data;
+	int ret;
+	int total_written;
+	int hdr_size = sizeof(struct tas25xx_cmd_data);
+
+	switch (cpu_to_be16(cmd_data->cmd_type)) {
+	case TAS25XX_CMD_SING_W:
+		ret = tas25xx_process_fw_single(tas2562, cmd_data, data);
+		if (ret) {
+			dev_err(tas2562->dev,
+				"Failed to process single write %d\n", ret);
+			return ret;
+		}
+
+		hdr_size -= 4;
+		total_written = cpu_to_be16(cmd_data->length) * 4 + hdr_size;
+		break;
+	case TAS25XX_CMD_BURST:
+		ret = tas25xx_process_fw_burst(tas2562, cmd_data, data,
+					       cpu_to_be16(cmd_data->length));
+		if (ret) {
+			dev_err(tas2562->dev,
+				"Failed to process burst write %d\n", ret);
+			return ret;
+		}
+		total_written = cpu_to_be16(cmd_data->length) + hdr_size;
+		break;
+	case TAS25XX_CMD_DELAY:
+		tas25xx_process_fw_delay(tas2562, data);
+		total_written = 4;
+		break;
+	default:
+		total_written = 0;
+		break;
+	};
+
+	return total_written;
+}
+
+
+static int tas25xx_write_program(struct tas2562_data *tas2562, int prog_num)
+{
+	struct tas25xx_fw_hdr *fw_hdr = tas2562->fw_data->fw_hdr;
+	struct tas25xx_program_info *prog_info;
+	int offset = sizeof(struct tas25xx_program_info);
+	int prog_offset = 0;
+	int i;
+	int length = 0;
+
+	if (prog_num > fw_hdr->num_programs)
+		return -EINVAL;
+
+	if (prog_num) {
+		for (i = 0; i < prog_num; i++)
+			prog_offset += cpu_to_be32(fw_hdr->prog_size[i]);
+	}
+
+	offset += prog_offset;
+	prog_info = (struct tas25xx_program_info *)&tas2562->fw_data->prog_info[prog_offset];
+
+	for (i = 0; i < cpu_to_be32(prog_info->blk_data.num_subblocks); i++) {
+		length = tas25xx_process_block(tas2562,
+					  &tas2562->fw_data->prog_info[offset]);
+		if (length < 0)
+			return length;
+
+		offset += length;
+	}
+
+	/* Reset Book to 0 */
+	regmap_write(tas2562->regmap, TAS2562_BOOK_CTRL, 0);
+
+	return 0;
+}
+
+static int tas25xx_write_config(struct tas2562_data *tas2562, int config_num)
+{
+	struct tas25xx_fw_hdr *fw_hdr = tas2562->fw_data->fw_hdr;
+	struct tas25xx_config_info *cfg_info;
+	int config_offset = 0;
+	int i;
+	int offset = sizeof(struct tas25xx_config_info);
+	int length = 0;
+
+	if (config_num > fw_hdr->num_configs)
+		return -EINVAL;
+
+	if (config_num)
+		for (i = 0; i < config_num; i++)
+			config_offset += cpu_to_be32(fw_hdr->config_size[i]);
+
+	cfg_info = (struct tas25xx_config_info *)&tas2562->fw_data->config_info[config_offset];
+	offset += config_offset;
+
+	for (i = 0; i < cpu_to_be32(cfg_info->blk_data.num_subblocks); i++) {
+		length = tas25xx_process_block(tas2562,
+					&tas2562->fw_data->config_info[offset]);
+		if (length < 0)
+			return length;
+
+		offset += length;
+	}
+
+	/* Reset Book to 0 */
+	regmap_write(tas2562->regmap, TAS2562_BOOK_CTRL, 0);
+
+	return 0;
+}
+
+static ssize_t write_config_store(struct device *dev,
+				struct device_attribute *tas25xx_attr,
+				const char *buf, size_t size)
+{
+	struct tas2562_data *tas25xx = dev_get_drvdata(dev);
+	struct tas25xx_fw_hdr *fw_hdr = tas25xx->fw_data->fw_hdr;
+	long configs;
+	int ret;
+
+	ret = kstrtol(buf, 10, &configs);
+	if (ret != 0)
+		return ret;
+
+	if (configs < 1 || configs > cpu_to_be32(fw_hdr->num_configs))
+		return -EINVAL;
+
+	configs--;
+	ret =  tas25xx_write_config(tas25xx, configs);
+	if (!ret)
+		ret = size;
+
+	return ret;
+}
+static DEVICE_ATTR_WO(write_config);
+
+static ssize_t write_program_store(struct device *dev,
+				struct device_attribute *tas25xx_attr,
+				const char *buf, size_t size)
+{
+	struct tas2562_data *tas25xx = dev_get_drvdata(dev);
+	struct tas25xx_fw_hdr *fw_hdr = tas25xx->fw_data->fw_hdr;
+	long program;
+	int ret;
+
+	ret = kstrtol(buf, 10, &program);
+	if (ret != 0)
+		return ret;
+
+	if (program < 1 || program > cpu_to_be32(fw_hdr->num_programs))
+		return -EINVAL;
+
+	program--;
+	ret =  tas25xx_write_program(tas25xx, program);
+	if (!ret)
+		ret = size;
+
+	return ret;
+}
+static DEVICE_ATTR_WO(write_program);
+
+static ssize_t enable_program_show(struct device *dev,
+			      struct device_attribute *tas25xx_attr,
+			      char *buf)
+{
+	struct tas2562_data *tas25xx = dev_get_drvdata(dev);
+	int mode;
+
+	regmap_read(tas25xx->regmap, TAS25XX_DSP_MODE, &mode);
+
+	return sprintf(buf, "0x%X\n", mode);
+}
+
+static ssize_t enable_program_store(struct device *dev,
+				struct device_attribute *tas25xx_attr,
+				const char *buf, size_t size)
+{
+	struct tas2562_data *tas25xx = dev_get_drvdata(dev);
+	long mode;
+	int ret;
+
+	ret = kstrtol(buf, 10, &mode);
+	if (ret != 0)
+		return ret;
+
+	if (mode)
+		ret = regmap_write(tas25xx->regmap, TAS25XX_DSP_MODE, mode);
+	else
+		ret = regmap_write(tas25xx->regmap, TAS25XX_DSP_MODE, 0);
+
+	if (!ret)
+		ret = size;
+
+	return ret;
+
+}
+static DEVICE_ATTR_RW(enable_program);
+
+static ssize_t num_configs_show(struct device *dev,
+			      struct device_attribute *tas25xx_attr,
+			      char *buf)
+{
+	struct tas2562_data *tas25xx = dev_get_drvdata(dev);
+	struct tas25xx_fw_hdr *fw_hdr = tas25xx->fw_data->fw_hdr;
+
+	return sprintf(buf, "%d\n", cpu_to_be32(fw_hdr->num_configs));
+}
+static DEVICE_ATTR_RO(num_configs);
+
+static ssize_t num_programs_show(struct device *dev,
+			      struct device_attribute *tas25xx_attr,
+			      char *buf)
+{
+	struct tas2562_data *tas25xx = dev_get_drvdata(dev);
+	struct tas25xx_fw_hdr *fw_hdr = tas25xx->fw_data->fw_hdr;
+
+	return sprintf(buf, "%d\n", cpu_to_be32(fw_hdr->num_programs));
+}
+static DEVICE_ATTR_RO(num_programs);
+
+static struct attribute *tas25xx_fw_attrs[] = {
+	&dev_attr_num_programs.attr,
+	&dev_attr_num_configs.attr,
+	&dev_attr_write_config.attr,
+	&dev_attr_write_program.attr,
+	&dev_attr_enable_program.attr,
+	NULL,
+};
+
+static const struct attribute_group tas25xx_fw_attr_group = {
+	.attrs	= tas25xx_fw_attrs,
+};
+
+int tas25xx_init_fw(struct tas2562_data *tas2562, const struct firmware *fw)
+{
+	u32 total_prog_sz = 0;
+	u32 total_config_sz = 0;
+	int hdr_size = sizeof(struct tas25xx_fw_hdr);
+	int i;
+	u8 *out;
+	int ret;
+
+	if (!fw->size)
+		return -ENODATA;
+
+	out = devm_kzalloc(tas2562->dev, fw->size, GFP_KERNEL);
+	if (!out)
+		return -ENOMEM;
+
+	memcpy(out, &fw->data[0], fw->size);
+	tas2562->fw_data = (struct tas25xx_fw_data *)out;
+
+	tas2562->fw_data->fw_hdr = devm_kzalloc(tas2562->dev, hdr_size,
+						GFP_KERNEL);
+	if (!tas2562->fw_data->fw_hdr)
+		return -ENOMEM;
+
+	memcpy(tas2562->fw_data->fw_hdr, &fw->data[0], hdr_size);
+
+	for (i = 0; i < cpu_to_be32(tas2562->fw_data->fw_hdr->num_programs); i++)
+		total_prog_sz += cpu_to_be32(tas2562->fw_data->fw_hdr->prog_size[i]);
+
+	for (i = 0; i < cpu_to_be32(tas2562->fw_data->fw_hdr->num_configs); i++)
+		total_config_sz += cpu_to_be32(tas2562->fw_data->fw_hdr->config_size[i]);
+
+	tas2562->fw_data->prog_info = devm_kzalloc(tas2562->dev, total_prog_sz,
+						   GFP_KERNEL);
+	if (!tas2562->fw_data->prog_info)
+		return -ENOMEM;
+
+	memcpy(tas2562->fw_data->prog_info, &fw->data[hdr_size], total_prog_sz);
+
+	tas2562->fw_data->config_info = devm_kzalloc(tas2562->dev,
+						     total_config_sz,
+						     GFP_KERNEL);
+	if (!tas2562->fw_data->config_info)
+		return -ENOMEM;
+
+	hdr_size += total_prog_sz;
+	memcpy(tas2562->fw_data->config_info, &fw->data[hdr_size],
+	       total_config_sz);
+
+	/* Create SysFS files */
+	ret = device_add_group(tas2562->dev, &tas25xx_fw_attr_group);
+	if (ret)
+		dev_info(tas2562->dev, "error creating sysfs files\n");
+
+	release_firmware(fw);
+
+	return 0;
+}
+
diff --git a/sound/soc/codecs/tas25xx_dsp_loader.h b/sound/soc/codecs/tas25xx_dsp_loader.h
new file mode 100644
index 000000000000..01d002da928f
--- /dev/null
+++ b/sound/soc/codecs/tas25xx_dsp_loader.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tas25xx_dsp_loader.h - Texas Instruments TAS25xx Mono Audio Amplifier
+ *
+ * Copyright (C) 2020 Texas Instruments Incorporated -  http://www.ti.com
+ *
+ * Author: Dan Murphy <dmurphy@ti.com>
+ */
+
+#ifndef _TAS25XX_DSP_LOADER_H
+#define _TAS25XX_DSP_LOADER_H
+
+#include "tas2562.h"
+
+#define TAS25XX_NAME_SIZE	64
+#define TAS25XX_PROG_SIZE	5
+#define TAS25XX_CONFIG_SIZE	10
+
+#define TAS25XX_SINGLE_COMMAND	0x7f
+#define TAS25XX_OFFSET_SHIFT	3
+
+#define TAS25XX_BLK_HDR_SZ	4
+
+#define TAS25XX_CMD_SING_W	0x1
+#define TAS25XX_CMD_BURST	0x2
+#define TAS25XX_CMD_DELAY	0x3
+
+struct tas25xx_cmd_data {
+	u16 cmd_type;
+	u16 length;
+	u8 book;
+	u8 page;
+	u8 offset;
+};
+
+struct tas25xx_block_data {
+	u32 block_type;
+	u16 pram_checksum;
+	u16 yram_checksum;
+	u32 block_size;
+	u32 num_subblocks;
+};
+
+struct tas25xx_program_info {
+	char name[TAS25XX_NAME_SIZE];
+	u8 app_mode;
+	u8 pdm_i2s_mode;
+	u8 isns_pd;
+	u8 vsns_pd;
+	u8 reserved_1;
+	u16 reserved_2;
+	u8 ldg_power_up;
+	struct tas25xx_block_data blk_data;
+};
+
+struct tas25xx_config_info {
+	char name[TAS25XX_NAME_SIZE];
+	u16 devices;
+	u16 program;
+	u32 samp_rate;
+	u16 clk_src;
+	u16 sbclk_fs_ratio;
+	u32 clk_freq;
+	u32 num_blocks;
+	struct tas25xx_block_data blk_data;
+};
+
+struct tas25xx_fw_hdr {
+	u32 magic_num;
+	u32 image_size;
+	u32 checksum;
+	u32 version_num;
+	u32 dsp_version;
+	u32 drv_fw_version;
+	u32 timestamp;
+	char firmware_name[TAS25XX_NAME_SIZE];
+	u16 dev_family;
+	u16 dev_subfamily;
+	u32 num_programs;
+	u32 prog_size[TAS25XX_PROG_SIZE];
+	u32 num_configs;
+	u32 config_size[TAS25XX_CONFIG_SIZE];
+};
+
+struct tas25xx_fw_data {
+	struct tas25xx_fw_hdr *fw_hdr;
+	u8 *config_info;
+	u8 *prog_info;
+};
+
+int tas25xx_init_fw(struct tas2562_data *tas2562, const struct firmware *fw);
+
+#endif /* _TAS25XX_DSP_LOADER_H */
-- 
2.26.2


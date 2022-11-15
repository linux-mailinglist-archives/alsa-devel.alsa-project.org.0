Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4842C628FE6
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 03:27:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D66DA15DC;
	Tue, 15 Nov 2022 03:26:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D66DA15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668479257;
	bh=o1+br9Xw0ZBGmhFwQ+/Og1X1PSbwRCIPnRPqk72kxb4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z0F7KQnAdBqDv44RcF3/x8KiYPisHMmPMQpvNkIRkNRf3KeWEuZHDdl4Ohi0GT0wI
	 dIacZwPkJcRQFHxi/z73jxMStr6QXY6Lhnz2V5fFq/Vf+g6ygLzE+qHs6VBYCXxmNe
	 eLZSA8BsiKdMwR5HDOqLzcepWuH00cOlvGZYQH64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6821CF805A9;
	Tue, 15 Nov 2022 03:25:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4A87F805A8; Tue, 15 Nov 2022 03:25:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_ZEN_BLOCKED_OPENDNS, 
 SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE, UNPARSEABLE_RELAY,
 URIBL_BLOCKED, 
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from out29-76.mail.aliyun.com (out29-76.mail.aliyun.com
 [115.124.29.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C9F5F8058C
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 03:25:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C9F5F8058C
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1;
 BR=01201311R171S61rulernew998_84748_2000303; CH=blue; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0212211-8.03337e-05-0.978699;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047192; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.Q7RJgpf_1668479074; 
Received: from localhost.localdomain(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Q7RJgpf_1668479074) by smtp.aliyun-inc.com;
 Tue, 15 Nov 2022 10:24:35 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org, perex@perex.cz, alsa-devel@alsa-project.org,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 quic_potturu@quicinc.com, pierre-louis.bossart@linux.intel.com,
 cy_huang@richtek.com
Subject: [PATCH V4 1/6] ASoC: codecs: Add i2c and codec registration for
 aw883xx and their associated operation functions
Date: Tue, 15 Nov 2022 10:24:18 +0800
Message-Id: <20221115022423.6437-2-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115022423.6437-1-wangweidong.a@awinic.com>
References: <1668165992-6493-2-git-send-email-wangweidong.a@awinic.com>
 <20221115022423.6437-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: duanyibo@awinic.com, Weidong Wang <wangweidong.a@awinic.com>,
 zhaolei@awinic.com, liweilei@awinic.com, yijiangtao@awinic.com,
 zhangjianming@awinic.com
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

From: Weidong Wang <wangweidong.a@awinic.com>

The Awinic AW883XX is an I2S/TDM input, high efficiency
digital Smart K audio amplifier with an integrated 10.25V
smart boost convert

Signed-off-by: Nick Li <liweilei@awinic.com>
Signed-off-by: Bruce zhao <zhaolei@awinic.com>
Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 sound/soc/codecs/aw883xx/aw883xx.c | 1803 ++++++++++++++++++++++++++++
 sound/soc/codecs/aw883xx/aw883xx.h |  155 +++
 2 files changed, 1958 insertions(+)
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx.h

diff --git a/sound/soc/codecs/aw883xx/aw883xx.c b/sound/soc/codecs/aw883xx/aw883xx.c
new file mode 100644
index 000000000000..b22ec3419e9e
--- /dev/null
+++ b/sound/soc/codecs/aw883xx/aw883xx.c
@@ -0,0 +1,1803 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * aw883xx.c --  ALSA Soc AW883XX codec support
+ *
+ * Copyright (c) 2022 AWINIC Technology CO., LTD
+ *
+ * Author: Bruce zhao <zhaolei@awinic.com>
+ */
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/debugfs.h>
+#include <linux/firmware.h>
+#include <linux/hrtimer.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <linux/regmap.h>
+#include <linux/syscalls.h>
+#include <linux/timer.h>
+#include <linux/uaccess.h>
+#include <linux/version.h>
+#include <linux/vmalloc.h>
+#include <linux/workqueue.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+#include "aw883xx_pid_2049_reg.h"
+#include "aw883xx.h"
+#include "aw883xx_bin_parse.h"
+#include "aw883xx_device.h"
+
+/*
+ * Marco
+ */
+#define AW883XX_I2C_NAME "aw883xx_smartpa"
+
+#define AW883XX_RATES (SNDRV_PCM_RATE_8000_48000 | \
+			SNDRV_PCM_RATE_96000)
+#define AW883XX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
+			SNDRV_PCM_FMTBIT_S24_LE | \
+			SNDRV_PCM_FMTBIT_S32_LE)
+#define AW883XX_ACF_FILE	"aw883xx_acf.bin"
+#define AW_REQUEST_FW_RETRIES		5	/* 5 times */
+#define AW_SYNC_LOAD
+
+#define FADE_TIME_MAX 1000000
+#define FADE_TIME_MIN 0
+
+static DEFINE_MUTEX(g_aw883xx_lock);
+
+static const struct regmap_config aw883xx_remap_config = {
+	.val_bits = 16,
+	.reg_bits = 8,
+	.max_register = AW_PID_2049_REG_MAX - 1,
+};
+
+/*
+ * aw883xx distinguish between codecs and components by version
+ */
+static struct aw_componet_codec_ops aw_componet_codec_ops = {
+	.kcontrol_codec = snd_soc_kcontrol_component,
+	.codec_get_drvdata = snd_soc_component_get_drvdata,
+	.add_codec_controls = snd_soc_add_component_controls,
+	.unregister_codec = snd_soc_unregister_component,
+	.register_codec = snd_soc_register_component,
+};
+
+/*
+ * aw883xx dsp write/read
+ */
+static int aw883xx_dsp_write_16bit(struct aw883xx *aw883xx,
+		uint16_t dsp_addr, uint32_t dsp_data)
+{
+	int ret;
+	struct aw_dsp_mem_desc *desc = &aw883xx->aw_pa->dsp_mem_desc;
+
+	ret = regmap_write(aw883xx->regmap, desc->dsp_madd_reg, dsp_addr);
+	if (ret < 0) {
+		dev_err(aw883xx->dev, "%s error, ret=%d", __func__, ret);
+		return ret;
+	}
+
+	ret = regmap_write(aw883xx->regmap, desc->dsp_mdat_reg, (uint16_t)dsp_data);
+	if (ret < 0) {
+		dev_err(aw883xx->dev, "%s error, ret=%d", __func__, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int aw883xx_dsp_write_32bit(struct aw883xx *aw883xx,
+		uint16_t dsp_addr, uint32_t dsp_data)
+{
+	int ret;
+	uint16_t temp_data = 0;
+	struct aw_dsp_mem_desc *desc = &aw883xx->aw_pa->dsp_mem_desc;
+
+	ret = regmap_write(aw883xx->regmap, desc->dsp_madd_reg, dsp_addr);
+	if (ret < 0) {
+		dev_err(aw883xx->dev, "%s error, ret=%d", __func__, ret);
+		return ret;
+	}
+
+	temp_data = dsp_data & AW883XX_DSP_16_DATA_MASK;
+	ret = regmap_write(aw883xx->regmap, desc->dsp_mdat_reg, temp_data);
+	if (ret < 0) {
+		dev_err(aw883xx->dev, "%s error, ret=%d", __func__, ret);
+		return ret;
+	}
+
+	temp_data = dsp_data >> 16;
+	ret = regmap_write(aw883xx->regmap, desc->dsp_mdat_reg, temp_data);
+	if (ret < 0) {
+		dev_err(aw883xx->dev, "%s error, ret=%d", __func__, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * aw883xx clear dsp chip select state
+ */
+static void aw883xx_clear_dsp_sel_st(struct aw883xx *aw883xx)
+{
+	unsigned int reg_value;
+	uint8_t reg = aw883xx->aw_pa->soft_rst.reg;
+
+	regmap_read(aw883xx->regmap, reg, &reg_value);
+}
+
+int aw883xx_dsp_write(struct aw883xx *aw883xx,
+		uint16_t dsp_addr, uint32_t dsp_data, uint8_t data_type)
+{
+	int ret = -1;
+
+	mutex_lock(&aw883xx->dsp_lock);
+	if (data_type == AW_DSP_16_DATA) {
+		ret = aw883xx_dsp_write_16bit(aw883xx, dsp_addr, dsp_data);
+		if (ret < 0)
+			dev_err(aw883xx->dev, "write dsp_addr[0x%04x] 16 bit dsp_data[%04x] failed",
+					(uint32_t)dsp_addr, dsp_data);
+
+	} else if (data_type == AW_DSP_32_DATA) {
+		ret =  aw883xx_dsp_write_32bit(aw883xx, dsp_addr, dsp_data);
+		if (ret < 0)
+			dev_err(aw883xx->dev, "write dsp_addr[0x%04x] 32 bit dsp_data[%08x] failed",
+					(uint32_t)dsp_addr, dsp_data);
+	} else {
+		dev_err(aw883xx->dev, "data type[%d] unsupported", data_type);
+		ret = -EINVAL;
+	}
+
+	aw883xx_clear_dsp_sel_st(aw883xx);
+	mutex_unlock(&aw883xx->dsp_lock);
+	return ret;
+}
+
+static int aw883xx_dsp_read_16bit(struct aw883xx *aw883xx,
+		uint16_t dsp_addr, uint32_t *dsp_data)
+{
+	int ret;
+	unsigned int temp_data = 0;
+	struct aw_dsp_mem_desc *desc = &aw883xx->aw_pa->dsp_mem_desc;
+
+	ret = regmap_write(aw883xx->regmap, desc->dsp_madd_reg, dsp_addr);
+	if (ret < 0) {
+		dev_err(aw883xx->dev, "i2c write error, ret=%d", ret);
+		return ret;
+	}
+
+	ret = regmap_read(aw883xx->regmap, desc->dsp_mdat_reg, &temp_data);
+	if (ret < 0) {
+		dev_err(aw883xx->dev, "i2c write error, ret=%d", ret);
+		return ret;
+	}
+
+	*dsp_data = temp_data;
+
+	return 0;
+}
+
+static int aw883xx_dsp_read_32bit(struct aw883xx *aw883xx,
+		uint16_t dsp_addr, uint32_t *dsp_data)
+{
+	int ret;
+	unsigned int temp_data = 0;
+	struct aw_dsp_mem_desc *desc = &aw883xx->aw_pa->dsp_mem_desc;
+
+	/*write dsp addr*/
+	ret = regmap_write(aw883xx->regmap, desc->dsp_madd_reg, dsp_addr);
+	if (ret < 0) {
+		dev_err(aw883xx->dev, "i2c write error, ret=%d", ret);
+		return ret;
+	}
+
+	/*get Low 16 bit data*/
+	ret = regmap_read(aw883xx->regmap, desc->dsp_mdat_reg, &temp_data);
+	if (ret < 0) {
+		dev_err(aw883xx->dev, "i2c read error, ret=%d", ret);
+		return ret;
+	}
+
+	*dsp_data = temp_data;
+
+	/*get high 16 bit data*/
+	ret = regmap_read(aw883xx->regmap, desc->dsp_mdat_reg, &temp_data);
+	if (ret < 0) {
+		dev_err(aw883xx->dev, "i2c read error, ret=%d", ret);
+		return ret;
+	}
+	*dsp_data |= (temp_data << 16);
+
+	return 0;
+}
+
+int aw883xx_dsp_read(struct aw883xx *aw883xx,
+		uint16_t dsp_addr, uint32_t *dsp_data, uint8_t data_type)
+{
+	int ret = -1;
+
+	mutex_lock(&aw883xx->dsp_lock);
+	if (data_type == AW_DSP_16_DATA) {
+		ret = aw883xx_dsp_read_16bit(aw883xx, dsp_addr, dsp_data);
+		if (ret < 0)
+			dev_err(aw883xx->dev, "read dsp_addr[0x%04x] 16 bit dsp_data[%04x] failed",
+					(uint32_t)dsp_addr, *dsp_data);
+
+	} else if (data_type == AW_DSP_32_DATA) {
+		ret = aw883xx_dsp_read_32bit(aw883xx, dsp_addr, dsp_data);
+		if (ret < 0)
+			dev_err(aw883xx->dev, "read dsp_addr[0x%04x] 32 bit dsp_data[%08x] failed",
+					(uint32_t)dsp_addr, *dsp_data);
+	} else {
+		dev_err(aw883xx->dev, "data type[%d] unsupported", data_type);
+		ret = -EINVAL;
+	}
+
+	aw883xx_clear_dsp_sel_st(aw883xx);
+	mutex_unlock(&aw883xx->dsp_lock);
+	return ret;
+}
+
+static void aw883xx_start_pa(struct aw883xx *aw883xx)
+{
+	int ret, i;
+
+	if (!aw883xx->allow_pw) {
+		dev_info(aw883xx->dev, "%s:dev can not allow power", __func__);
+		return;
+	}
+
+	if (aw883xx->pstream == AW883XX_STREAM_CLOSE) {
+		dev_info(aw883xx->dev, "%s:pstream is close", __func__);
+		return;
+	}
+
+	for (i = 0; i < AW_START_RETRIES; i++) {
+		ret = aw883xx_device_start(aw883xx->aw_pa);
+		if (ret) {
+			dev_err(aw883xx->dev, "aw883xx device start failed. retry = %d", i);
+			ret = aw883xx_dev_fw_update(aw883xx->aw_pa, AW_DSP_FW_UPDATE_ON, true);
+			if (ret < 0) {
+				dev_err(aw883xx->dev, "fw update failed");
+				continue;
+			}
+		} else {
+			dev_info(aw883xx->dev, "start success\n");
+			break;
+		}
+	}
+}
+
+static void aw883xx_startup_work(struct work_struct *work)
+{
+	struct aw883xx *aw883xx =
+		container_of(work, struct aw883xx, start_work.work);
+
+	mutex_lock(&aw883xx->lock);
+	aw883xx_start_pa(aw883xx);
+	mutex_unlock(&aw883xx->lock);
+}
+
+static void aw883xx_start(struct aw883xx *aw883xx, bool sync_start)
+{
+	int ret;
+	int i;
+
+	if (aw883xx->aw_pa->fw_status == AW_DEV_FW_OK) {
+		if (!aw883xx->allow_pw) {
+			dev_info(aw883xx->dev, "%s:dev can not allow power", __func__);
+			return;
+		}
+
+		if (aw883xx->aw_pa->status == AW_DEV_PW_ON)
+			return;
+
+		for (i = 0; i < AW_START_RETRIES; i++) {
+			ret = aw883xx_dev_fw_update(aw883xx->aw_pa, AW_DSP_FW_UPDATE_OFF,
+						aw883xx->phase_sync);
+			if (ret < 0) {
+				dev_err(aw883xx->dev, "fw update failed. retry = %d", i);
+				continue;
+			} else {
+				/*firmware update success*/
+				if (sync_start == AW_SYNC_START)
+					aw883xx_start_pa(aw883xx);
+				else
+					queue_delayed_work(aw883xx->work_queue,
+						&aw883xx->start_work,
+						AW883XX_START_WORK_DELAY_MS);
+
+				return;
+			}
+		}
+	}
+}
+
+/*
+ * Digital Audio Interface
+ */
+static int aw883xx_startup(struct snd_pcm_substream *substream,
+			struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *codec = dai->component;
+	struct aw883xx *aw883xx =
+		aw_componet_codec_ops.codec_get_drvdata(codec);
+
+	aw883xx->pstream = AW883XX_STREAM_OPEN;
+
+	mutex_lock(&aw883xx->lock);
+	aw883xx_start(aw883xx, AW_ASYNC_START);
+	mutex_unlock(&aw883xx->lock);
+
+	return 0;
+}
+
+static void aw883xx_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *codec = dai->component;
+	struct aw883xx *aw883xx =
+		aw_componet_codec_ops.codec_get_drvdata(codec);
+
+	aw883xx->pstream = AW883XX_STREAM_CLOSE;
+	cancel_delayed_work_sync(&aw883xx->start_work);
+	mutex_lock(&aw883xx->lock);
+	aw883xx_device_stop(aw883xx->aw_pa);
+	mutex_unlock(&aw883xx->lock);
+
+}
+
+static const struct snd_soc_dai_ops aw883xx_dai_ops = {
+	.startup = aw883xx_startup,
+	.shutdown = aw883xx_shutdown,
+};
+
+static struct snd_soc_dai_driver aw883xx_dai[] = {
+	{
+	.name = "aw883xx-aif",
+	.id = 1,
+	.playback = {
+		.stream_name = "Speaker_Playback",
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = AW883XX_RATES,
+		.formats = AW883XX_FORMATS,
+		},
+	.capture = {
+		.stream_name = "Speaker_Capture",
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = AW883XX_RATES,
+		.formats = AW883XX_FORMATS,
+		},
+	.ops = &aw883xx_dai_ops,
+	/*.symmetric_rates = 1,*/
+	},
+};
+
+static int aw883xx_fade_time_info(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_info *uinfo)
+{
+	/* set kcontrol info */
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1000000;
+
+	return 0;
+}
+
+/*
+ * codec driver
+ */
+static int aw883xx_get_fade_in_time(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	unsigned int time;
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(component);
+	struct aw_device *aw_dev = aw883xx->aw_pa;
+
+	aw883xx_dev_get_fade_time(&time, true, aw_dev);
+	ucontrol->value.integer.value[0] = time;
+
+	pr_debug("step time %ld", ucontrol->value.integer.value[0]);
+
+	return 0;
+
+}
+
+static int aw883xx_set_fade_in_time(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(component);
+	struct aw_device *aw_dev = aw883xx->aw_pa;
+
+	if ((ucontrol->value.integer.value[0] > FADE_TIME_MAX) ||
+		(ucontrol->value.integer.value[0] < FADE_TIME_MIN)) {
+		pr_debug("set val %ld overflow %d or  less than :%d",
+			ucontrol->value.integer.value[0], FADE_TIME_MAX, FADE_TIME_MAX);
+		return 0;
+	}
+
+	aw883xx_dev_set_fade_time(ucontrol->value.integer.value[0], true, aw_dev);
+
+	pr_debug("step time %ld", ucontrol->value.integer.value[0]);
+	return 1;
+}
+
+static int aw883xx_get_fade_out_time(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	unsigned int time;
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(component);
+	struct aw_device *aw_dev = aw883xx->aw_pa;
+
+	aw883xx_dev_get_fade_time(&time, false, aw_dev);
+	ucontrol->value.integer.value[0] = time;
+
+	pr_debug("step time %ld", ucontrol->value.integer.value[0]);
+
+	return 0;
+}
+
+static int aw883xx_set_fade_out_time(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(component);
+	struct aw_device *aw_dev = aw883xx->aw_pa;
+
+	if ((ucontrol->value.integer.value[0] > FADE_TIME_MAX) ||
+		(ucontrol->value.integer.value[0] < FADE_TIME_MIN)) {
+		pr_err("set val %ld overflow %d or  less than :%d",
+			ucontrol->value.integer.value[0], FADE_TIME_MAX, FADE_TIME_MIN);
+		return 0;
+	}
+
+	aw883xx_dev_set_fade_time(ucontrol->value.integer.value[0], false, aw_dev);
+
+	pr_debug("step time %ld", ucontrol->value.integer.value[0]);
+
+	return 1;
+}
+
+static int aw883xx_profile_info(struct snd_kcontrol *kcontrol,
+			 struct snd_ctl_elem_info *uinfo)
+{
+	int count;
+	char *name = NULL;
+	const char *prof_name = NULL;
+	struct snd_soc_component *codec =
+		aw_componet_codec_ops.kcontrol_codec(kcontrol);
+	struct aw883xx *aw883xx =
+		aw_componet_codec_ops.codec_get_drvdata(codec);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
+	uinfo->count = 1;
+
+	count = aw883xx_dev_get_profile_count(aw883xx->aw_pa);
+	if (count <= 0) {
+		uinfo->value.enumerated.items = 0;
+		dev_err(aw883xx->dev, "get count[%d] failed", count);
+		return 0;
+	}
+
+	uinfo->value.enumerated.items = count;
+
+	if (uinfo->value.enumerated.item >= count)
+		uinfo->value.enumerated.item = count - 1;
+
+	name = uinfo->value.enumerated.name;
+	count = uinfo->value.enumerated.item;
+
+	prof_name = aw_dev_get_prof_name(aw883xx->aw_pa, count);
+	if (!prof_name) {
+		strscpy(uinfo->value.enumerated.name, "null",
+						strlen("null") + 1);
+		return 0;
+	}
+
+	strscpy(name, prof_name, sizeof(uinfo->value.enumerated.name));
+
+	return 0;
+}
+
+static int aw883xx_profile_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec =
+		aw_componet_codec_ops.kcontrol_codec(kcontrol);
+	struct aw883xx *aw883xx =
+		aw_componet_codec_ops.codec_get_drvdata(codec);
+
+	ucontrol->value.integer.value[0] = aw883xx_dev_get_profile_index(aw883xx->aw_pa);
+	dev_dbg(codec->dev, "profile index [%d]",
+			aw883xx_dev_get_profile_index(aw883xx->aw_pa));
+	return 0;
+
+}
+
+static int aw883xx_profile_set(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec =
+		aw_componet_codec_ops.kcontrol_codec(kcontrol);
+	struct aw883xx *aw883xx =
+		aw_componet_codec_ops.codec_get_drvdata(codec);
+	int ret;
+	int cur_index;
+
+	if (!aw883xx->dbg_en_prof) {
+		dev_info(codec->dev, "profile close");
+		return 0;
+	}
+
+	/* check value valid */
+	ret = aw883xx_dev_check_profile_index(aw883xx->aw_pa, ucontrol->value.integer.value[0]);
+	if (ret) {
+		dev_warn(codec->dev, "unsupported index %ld",
+					ucontrol->value.integer.value[0]);
+		return 0;
+	}
+
+	/*check cur_index == set value*/
+	cur_index = aw883xx_dev_get_profile_index(aw883xx->aw_pa);
+	if (cur_index == ucontrol->value.integer.value[0]) {
+		dev_info(codec->dev, "index no change");
+		return 0;
+	}
+
+	/*pa stop or stopping just set profile*/
+	mutex_lock(&aw883xx->lock);
+	aw883xx_dev_set_profile_index(aw883xx->aw_pa, ucontrol->value.integer.value[0]);
+
+	if (aw883xx->pstream) {
+		aw883xx_device_stop(aw883xx->aw_pa);
+		aw883xx_start(aw883xx, AW_SYNC_START);
+	}
+
+	mutex_unlock(&aw883xx->lock);
+
+	dev_dbg(codec->dev, "profile id %ld", ucontrol->value.integer.value[0]);
+	return 1;
+}
+
+static int aw883xx_switch_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec =
+		aw_componet_codec_ops.kcontrol_codec(kcontrol);
+	struct aw883xx *aw883xx =
+		aw_componet_codec_ops.codec_get_drvdata(codec);
+
+	ucontrol->value.integer.value[0] = aw883xx->allow_pw;
+
+	return 0;
+}
+
+static int aw883xx_switch_set(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec =
+		aw_componet_codec_ops.kcontrol_codec(kcontrol);
+	struct aw883xx *aw883xx =
+		aw_componet_codec_ops.codec_get_drvdata(codec);
+
+	dev_dbg(codec->dev, "set value:%ld", ucontrol->value.integer.value[0]);
+
+	if (ucontrol->value.integer.value[0] == aw883xx->allow_pw) {
+		dev_info(aw883xx->dev, "PA switch not change");
+		return 0;
+	}
+
+	if (aw883xx->pstream) {
+		if (ucontrol->value.integer.value[0] == 0) {
+			cancel_delayed_work_sync(&aw883xx->start_work);
+			mutex_lock(&aw883xx->lock);
+			aw883xx_device_stop(aw883xx->aw_pa);
+			aw883xx->allow_pw = false;
+			mutex_unlock(&aw883xx->lock);
+		} else {
+			cancel_delayed_work_sync(&aw883xx->start_work);
+			mutex_lock(&aw883xx->lock);
+			aw883xx->allow_pw = true;
+			aw883xx_start(aw883xx, AW_SYNC_START);
+			mutex_unlock(&aw883xx->lock);
+		}
+	} else {
+		mutex_lock(&aw883xx->lock);
+		if (ucontrol->value.integer.value[0] == 0)
+			aw883xx->allow_pw = false;
+		else
+			aw883xx->allow_pw = true;
+		mutex_unlock(&aw883xx->lock);
+	}
+
+	return 1;
+}
+
+static int aw883xx_volume_info(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_info *uinfo)
+{
+	struct snd_soc_component *codec =
+		aw_componet_codec_ops.kcontrol_codec(kcontrol);
+	struct aw883xx *aw883xx =
+		aw_componet_codec_ops.codec_get_drvdata(codec);
+	struct aw_volume_desc *vol_desc = &aw883xx->aw_pa->volume_desc;
+
+	/* set kcontrol info */
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = vol_desc->mute_volume;
+
+	return 0;
+}
+
+static int aw883xx_volume_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec =
+		aw_componet_codec_ops.kcontrol_codec(kcontrol);
+	struct aw883xx *aw883xx =
+		aw_componet_codec_ops.codec_get_drvdata(codec);
+	struct aw_volume_desc *vol_desc = &aw883xx->aw_pa->volume_desc;
+
+	ucontrol->value.integer.value[0] = vol_desc->ctl_volume;
+
+	dev_dbg(aw883xx->dev, "ucontrol->value.integer.value[0]=%d",
+		vol_desc->ctl_volume);
+
+	return 0;
+}
+
+static int aw883xx_volume_set(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	uint16_t value = 0;
+	uint16_t compared_vol = 0;
+	struct snd_soc_component *codec =
+		aw_componet_codec_ops.kcontrol_codec(kcontrol);
+	struct aw883xx *aw883xx =
+		aw_componet_codec_ops.codec_get_drvdata(codec);
+	struct aw_volume_desc *vol_desc = &aw883xx->aw_pa->volume_desc;
+
+	value = (uint16_t)ucontrol->value.integer.value[0];
+	if (value > vol_desc->mute_volume) {
+		dev_err(aw883xx->dev, "value over range\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(aw883xx->dev, "ucontrol->value.integer.value[0]=%d", value);
+
+	vol_desc->ctl_volume = value;
+
+	/*get smaller dB*/
+	compared_vol = AW_GET_MAX_VALUE(vol_desc->ctl_volume,
+		vol_desc->monitor_volume);
+
+	aw883xx_dev_set_volume(aw883xx->aw_pa, compared_vol);
+
+	return 1;
+}
+
+static int aw883xx_dynamic_create_controls(struct aw883xx *aw883xx)
+{
+	struct snd_kcontrol_new *aw883xx_dev_control = NULL;
+	char *kctl_name = NULL;
+
+	aw883xx_dev_control = devm_kzalloc(aw883xx->codec->dev,
+			sizeof(struct snd_kcontrol_new) * AW_KCONTROL_NUM, GFP_KERNEL);
+	if (!aw883xx_dev_control)
+		return -ENOMEM;
+
+	kctl_name = devm_kzalloc(aw883xx->codec->dev, AW_NAME_BUF_MAX, GFP_KERNEL);
+	if (!kctl_name)
+		return -ENOMEM;
+
+	snprintf(kctl_name, AW_NAME_BUF_MAX, "aw_dev_%u_prof",
+		aw883xx->aw_pa->channel);
+
+	aw883xx_dev_control[0].name = kctl_name;
+	aw883xx_dev_control[0].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	aw883xx_dev_control[0].info = aw883xx_profile_info;
+	aw883xx_dev_control[0].get = aw883xx_profile_get;
+	aw883xx_dev_control[0].put = aw883xx_profile_set;
+
+	kctl_name = devm_kzalloc(aw883xx->codec->dev, AW_NAME_BUF_MAX, GFP_KERNEL);
+	if (!kctl_name)
+		return -ENOMEM;
+
+	snprintf(kctl_name, AW_NAME_BUF_MAX, "aw_dev_%u_switch", aw883xx->aw_pa->channel);
+
+	aw883xx_dev_control[1].name = kctl_name;
+	aw883xx_dev_control[1].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	aw883xx_dev_control[1].info = snd_soc_info_bool_ext;
+	aw883xx_dev_control[1].get = aw883xx_switch_get;
+	aw883xx_dev_control[1].put = aw883xx_switch_set;
+
+	kctl_name = devm_kzalloc(aw883xx->codec->dev, AW_NAME_BUF_MAX, GFP_KERNEL);
+	if (!kctl_name)
+		return -ENOMEM;
+
+	snprintf(kctl_name, AW_NAME_BUF_MAX, "aw_dev_%d_rx_volume", aw883xx->aw_pa->channel);
+
+	aw883xx_dev_control[2].name = kctl_name;
+	aw883xx_dev_control[2].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	aw883xx_dev_control[2].info = aw883xx_volume_info;
+	aw883xx_dev_control[2].get = aw883xx_volume_get;
+	aw883xx_dev_control[2].put = aw883xx_volume_set;
+
+	kctl_name = devm_kzalloc(aw883xx->codec->dev, AW_NAME_BUF_MAX, GFP_KERNEL);
+	if (!kctl_name)
+		return -ENOMEM;
+
+	snprintf(kctl_name, AW_NAME_BUF_MAX, "aw_dev_%d_fadeout_us", aw883xx->aw_pa->channel);
+
+	aw883xx_dev_control[3].name = kctl_name;
+	aw883xx_dev_control[3].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	aw883xx_dev_control[3].info = aw883xx_fade_time_info;
+	aw883xx_dev_control[3].get = aw883xx_get_fade_out_time;
+	aw883xx_dev_control[3].put = aw883xx_set_fade_out_time;
+
+	kctl_name = devm_kzalloc(aw883xx->codec->dev, AW_NAME_BUF_MAX, GFP_KERNEL);
+	if (!kctl_name)
+		return -ENOMEM;
+
+	snprintf(kctl_name, AW_NAME_BUF_MAX, "aw_dev_%d_fadein_us", aw883xx->aw_pa->channel);
+
+	aw883xx_dev_control[4].name = kctl_name;
+	aw883xx_dev_control[4].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	aw883xx_dev_control[4].info = aw883xx_fade_time_info;
+	aw883xx_dev_control[4].get = aw883xx_get_fade_in_time;
+	aw883xx_dev_control[4].put = aw883xx_set_fade_in_time;
+
+	aw_componet_codec_ops.add_codec_controls(aw883xx->codec,
+						aw883xx_dev_control, AW_KCONTROL_NUM);
+
+	return 0;
+}
+
+static int aw883xx_request_firmware_file(struct aw883xx *aw883xx)
+{
+	const struct firmware *cont = NULL;
+	int ret = -1;
+
+	aw883xx->aw_pa->fw_status = AW_DEV_FW_FAILED;
+
+	ret = request_firmware(&cont, AW883XX_ACF_FILE, aw883xx->dev);
+	if ((ret < 0) || (!cont)) {
+		dev_err(aw883xx->dev, "load [%s] failed!", AW883XX_ACF_FILE);
+		return ret;
+	}
+
+	dev_info(aw883xx->dev, "loaded %s - size: %zu",
+		AW883XX_ACF_FILE, cont ? cont->size : 0);
+
+	aw883xx->aw_cfg = vzalloc(cont->size + sizeof(int));
+	if (!aw883xx->aw_cfg) {
+		release_firmware(cont);
+		return -ENOMEM;
+	}
+	aw883xx->aw_cfg->len = (int)cont->size;
+	memcpy(aw883xx->aw_cfg->data, cont->data, cont->size);
+	ret = aw883xx_dev_load_acf_check(aw883xx->aw_cfg);
+	if (ret < 0) {
+		dev_err(aw883xx->dev, "Load [%s] failed ....!", AW883XX_ACF_FILE);
+		vfree(aw883xx->aw_cfg);
+		aw883xx->aw_cfg = NULL;
+		release_firmware(cont);
+		return ret;
+	}
+	release_firmware(cont);
+
+	mutex_lock(&aw883xx->lock);
+	/*aw device init*/
+	ret = aw883xx_device_init(aw883xx->aw_pa, aw883xx->aw_cfg);
+	if (ret < 0) {
+		dev_info(aw883xx->dev, "dev init failed");
+		mutex_unlock(&aw883xx->lock);
+		return ret;
+	}
+
+	aw883xx_dynamic_create_controls(aw883xx);
+
+	mutex_unlock(&aw883xx->lock);
+
+	return 0;
+}
+
+static void aw883xx_fw_wrok(struct work_struct *work)
+{
+	struct aw883xx *aw883xx = container_of(work,
+				struct aw883xx, acf_work.work);
+	int ret;
+
+	ret = aw883xx_request_firmware_file(aw883xx);
+	if (ret < 0)
+		dev_err(aw883xx->dev, "load profile failed");
+}
+
+static void aw883xx_load_fw(struct aw883xx *aw883xx)
+{
+#ifdef AW_SYNC_LOAD
+		/*sync loading*/
+		aw883xx_request_firmware_file(aw883xx);
+#else
+		/*async loading*/
+		queue_delayed_work(aw883xx->work_queue,
+				&aw883xx->acf_work,
+				msecs_to_jiffies(AW883XX_LOAD_FW_DELAY_TIME));
+
+#endif
+}
+
+static const struct snd_soc_dapm_widget aw883xx_dapm_widgets[] = {
+	 /* playback */
+	SND_SOC_DAPM_AIF_IN("AIF_RX", "Speaker_Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_OUTPUT("audio_out"),
+	/* capture */
+	SND_SOC_DAPM_AIF_OUT("AIF_TX", "Speaker_Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_INPUT("iv_in"),
+};
+
+static const struct snd_soc_dapm_route aw883xx_audio_map[] = {
+	{"audio_out", NULL, "AIF_RX"},
+	{"AIF_TX", NULL, "iv_in"},
+};
+
+static int aw883xx_add_widgets(struct aw883xx *aw883xx)
+{
+	struct snd_soc_dapm_widget *aw_widgets = NULL;
+	struct snd_soc_dapm_route *aw_route = NULL;
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(aw883xx->codec);
+
+	/*add widgets*/
+	aw_widgets = devm_kzalloc(aw883xx->dev,
+				sizeof(struct snd_soc_dapm_widget) *
+				ARRAY_SIZE(aw883xx_dapm_widgets),
+				GFP_KERNEL);
+	if (!aw_widgets)
+		return -ENOMEM;
+
+	memcpy(aw_widgets, aw883xx_dapm_widgets,
+			sizeof(struct snd_soc_dapm_widget) * ARRAY_SIZE(aw883xx_dapm_widgets));
+
+	snd_soc_dapm_new_controls(dapm, aw_widgets, ARRAY_SIZE(aw883xx_dapm_widgets));
+
+	/*add route*/
+	aw_route = devm_kzalloc(aw883xx->dev,
+				sizeof(struct snd_soc_dapm_route) * ARRAY_SIZE(aw883xx_audio_map),
+				GFP_KERNEL);
+	if (!aw_route)
+		return -ENOMEM;
+
+	memcpy(aw_route, aw883xx_audio_map,
+		sizeof(struct snd_soc_dapm_route) * ARRAY_SIZE(aw883xx_audio_map));
+
+	snd_soc_dapm_add_routes(dapm, aw_route, ARRAY_SIZE(aw883xx_audio_map));
+
+	return 0;
+}
+
+static int aw883xx_codec_probe(struct snd_soc_component *aw_codec)
+{
+	struct aw883xx *aw883xx =
+		aw_componet_codec_ops.codec_get_drvdata(aw_codec);
+
+	/*destroy_workqueue(struct workqueue_struct *wq)*/
+	aw883xx->work_queue = create_singlethread_workqueue("aw883xx");
+	if (!aw883xx->work_queue) {
+		dev_err(aw883xx->dev, "create workqueue failed !");
+		return -EINVAL;
+	}
+
+	INIT_DELAYED_WORK(&aw883xx->start_work, aw883xx_startup_work);
+
+	INIT_DELAYED_WORK(&aw883xx->acf_work, aw883xx_fw_wrok);
+
+	aw883xx->codec = aw_codec;
+
+	aw883xx_add_widgets(aw883xx);
+
+	aw883xx_load_fw(aw883xx);
+
+	return 0;
+}
+
+static void aw883xx_codec_remove(struct snd_soc_component *aw_codec)
+{
+	struct aw883xx *aw883xx =
+		aw_componet_codec_ops.codec_get_drvdata(aw_codec);
+
+	cancel_delayed_work_sync(&aw883xx->acf_work);
+	cancel_delayed_work_sync(&aw883xx->start_work);
+
+	if (aw883xx->work_queue)
+		destroy_workqueue(aw883xx->work_queue);
+
+	aw883xx_dev_deinit(aw883xx->aw_pa);
+}
+
+static const struct snd_soc_component_driver soc_codec_dev_aw883xx = {
+	.probe = aw883xx_codec_probe,
+	.remove = aw883xx_codec_remove,
+};
+
+static int aw883xx_componet_codec_register(struct aw883xx *aw883xx)
+{
+	struct snd_soc_dai_driver *dai_drv = NULL;
+	int ret;
+
+	dai_drv = devm_kzalloc(aw883xx->dev, sizeof(aw883xx_dai), GFP_KERNEL);
+	if (!dai_drv)
+		return -ENOMEM;
+
+	memcpy(dai_drv, aw883xx_dai, sizeof(aw883xx_dai));
+
+	ret = aw883xx->codec_ops->register_codec(aw883xx->dev,
+			&soc_codec_dev_aw883xx,
+			dai_drv, ARRAY_SIZE(aw883xx_dai));
+	if (ret < 0) {
+		dev_err(aw883xx->dev, "failed to register aw883xx: %d", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct aw883xx *aw883xx_malloc_init(struct i2c_client *i2c)
+{
+	struct aw883xx *aw883xx = devm_kzalloc(&i2c->dev,
+			sizeof(struct aw883xx), GFP_KERNEL);
+	if (!aw883xx)
+		return NULL;
+
+	aw883xx->dev = &i2c->dev;
+	aw883xx->i2c = i2c;
+	aw883xx->aw_pa = NULL;
+	aw883xx->codec = NULL;
+	aw883xx->codec_ops = &aw_componet_codec_ops;
+	aw883xx->dbg_en_prof = true;
+	aw883xx->allow_pw = true;
+	aw883xx->work_queue = NULL;
+	mutex_init(&aw883xx->lock);
+	mutex_init(&aw883xx->dsp_lock);
+
+	return aw883xx;
+}
+
+static int aw883xx_gpio_request(struct aw883xx *aw883xx)
+{
+	int ret = 0;
+
+	if (gpio_is_valid(aw883xx->reset_gpio)) {
+		ret = devm_gpio_request_one(aw883xx->dev, aw883xx->reset_gpio,
+			GPIOF_OUT_INIT_LOW, "aw883xx_rst");
+		if (ret) {
+			dev_err(aw883xx->dev, "rst request failed");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * device tree
+ */
+static int aw883xx_parse_gpio_dt(struct aw883xx *aw883xx)
+{
+	struct device_node *np = aw883xx->dev->of_node;
+
+	aw883xx->reset_gpio = of_get_named_gpio(np, "reset-gpio", 0);
+	if (aw883xx->reset_gpio < 0)
+		dev_err(aw883xx->dev, "no reset gpio provided, will not hw reset");
+	else
+		dev_dbg(aw883xx->dev, "reset gpio provided ok");
+
+	return 0;
+}
+
+static void aw883xx_parse_sync_flag_dt(struct aw883xx *aw883xx)
+{
+	int ret;
+	int32_t sync_enable = 0;
+	struct device_node *np = aw883xx->dev->of_node;
+
+	ret = of_property_read_u32(np, "sync-flag", &sync_enable);
+	if (ret < 0) {
+		dev_dbg(aw883xx->dev,
+			"read sync flag failed,default phase sync off");
+		sync_enable = false;
+	} else {
+		dev_dbg(aw883xx->dev,
+			"sync flag is %d", sync_enable);
+	}
+
+	aw883xx->phase_sync = sync_enable;
+}
+
+static int aw883xx_parse_dt(struct aw883xx *aw883xx)
+{
+	aw883xx_parse_sync_flag_dt(aw883xx);
+	return aw883xx_parse_gpio_dt(aw883xx);
+}
+
+static int aw883xx_hw_reset(struct aw883xx *aw883xx)
+{
+	if (gpio_is_valid(aw883xx->reset_gpio)) {
+		gpio_set_value_cansleep(aw883xx->reset_gpio, 0);
+		usleep_range(AW_1000_US, AW_1000_US + 10);
+		gpio_set_value_cansleep(aw883xx->reset_gpio, 1);
+		usleep_range(AW_1000_US, AW_1000_US + 10);
+	} else {
+		dev_err(aw883xx->dev, "%s failed", __func__);
+	}
+	return 0;
+}
+
+static int aw883xx_read_chipid(struct aw883xx *aw883xx)
+{
+	int ret = -1;
+	int reg_val = 0;
+
+	ret = regmap_read(aw883xx->regmap, AW883XX_CHIP_ID_REG, &reg_val);
+	if (ret)
+		return -EIO;
+
+	dev_info(aw883xx->dev, "chip id = %x\n", reg_val);
+	aw883xx->chip_id = reg_val;
+
+	return 0;
+}
+
+/*
+ * sys group attribute: reg
+ */
+static ssize_t reg_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+	int reg_num = aw883xx->aw_pa->ops.aw_get_reg_num();
+	ssize_t len = 0;
+	uint8_t i = 0;
+	unsigned int reg_val = 0;
+
+	for (i = 0; i < reg_num; i++) {
+		if (aw883xx->aw_pa->ops.aw_check_rd_access(i)) {
+			regmap_read(aw883xx->regmap, i, &reg_val);
+			len += snprintf(buf + len, PAGE_SIZE - len,
+					"reg:0x%02x=0x%04x\n", i, reg_val);
+		}
+	}
+
+	return len;
+}
+
+static ssize_t reg_store(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t count)
+{
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+	unsigned int databuf[2] = { 0 };
+
+	if (sscanf(buf, "%x %x", &databuf[0], &databuf[1]) == 2)
+		regmap_write(aw883xx->regmap, databuf[0], databuf[1]);
+
+	return count;
+}
+
+static ssize_t rw_store(struct device *dev,
+				struct device_attribute *attr, const char *buf,
+				size_t count)
+{
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+	unsigned int databuf[2] = { 0 };
+
+	if (sscanf(buf, "%x %x", &databuf[0], &databuf[1]) == 2) {
+		aw883xx->reg_addr = (uint8_t)databuf[0];
+		if (aw883xx->aw_pa->ops.aw_check_rd_access(databuf[0]))
+			regmap_write(aw883xx->regmap, databuf[0], databuf[1]);
+	} else if (sscanf(buf, "%x", &databuf[0]) == 1) {
+		aw883xx->reg_addr = (uint8_t)databuf[0];
+	}
+
+	return count;
+}
+
+static ssize_t rw_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+	ssize_t len = 0;
+	unsigned int reg_val = 0;
+
+	if (aw883xx->aw_pa->ops.aw_check_rd_access(aw883xx->reg_addr)) {
+		regmap_read(aw883xx->regmap, aw883xx->reg_addr, &reg_val);
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"reg:0x%02x=0x%04x\n", aw883xx->reg_addr,
+				reg_val);
+	}
+
+	return len;
+}
+
+static ssize_t dsp_rw_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+	ssize_t len = 0;
+	unsigned int reg_val = 0;
+
+	mutex_lock(&aw883xx->dsp_lock);
+	regmap_write(aw883xx->regmap, aw883xx->aw_pa->dsp_mem_desc.dsp_madd_reg, aw883xx->dsp_addr);
+	regmap_read(aw883xx->regmap, aw883xx->aw_pa->dsp_mem_desc.dsp_mdat_reg, &reg_val);
+	len += snprintf(buf + len, PAGE_SIZE - len,
+			"dsp:0x%04x=0x%04x\n", aw883xx->dsp_addr, reg_val);
+	regmap_read(aw883xx->regmap, aw883xx->aw_pa->dsp_mem_desc.dsp_mdat_reg, &reg_val);
+	len += snprintf(buf + len, PAGE_SIZE - len,
+			"dsp:0x%04x=0x%04x\n", aw883xx->dsp_addr + 1, reg_val);
+	aw883xx_clear_dsp_sel_st(aw883xx);
+	mutex_unlock(&aw883xx->dsp_lock);
+
+	return len;
+}
+
+static ssize_t dsp_rw_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+	unsigned int databuf[2] = { 0 };
+
+	if (sscanf(buf, "%x %x", &databuf[0], &databuf[1]) == 2) {
+		aw883xx->dsp_addr = (unsigned int)databuf[0];
+		aw883xx_dsp_write(aw883xx, databuf[0], databuf[1], AW_DSP_16_DATA);
+		dev_dbg(aw883xx->dev, "get param: %x %x",
+			databuf[0], databuf[1]);
+	} else if (sscanf(buf, "%x", &databuf[0]) == 1) {
+		aw883xx->dsp_addr = (unsigned int)databuf[0];
+		dev_dbg(aw883xx->dev, "get param: %x",
+			databuf[0]);
+	}
+	aw883xx_clear_dsp_sel_st(aw883xx);
+
+	return count;
+}
+
+static int aw883xx_awrw_write(struct aw883xx *aw883xx, const char *buf, size_t count)
+{
+	int  i, ret;
+	char *data_buf = NULL;
+	int str_len, data_len, temp_data;
+	struct aw883xx_i2c_packet *packet = &aw883xx->i2c_packet;
+	uint32_t dsp_addr_h = 0, dsp_addr_l = 0;
+
+	if (!buf) {
+		dev_err(aw883xx->dev, "awrw buf is NULL");
+		return -EINVAL;
+	}
+
+	data_len = AWRW_DATA_BYTES * packet->reg_num;
+
+	str_len = count - AWRW_HDR_LEN - 1;
+	if ((data_len * 5 - 1) > str_len) {
+		dev_err(aw883xx->dev, "data_str_len [%d], requeset len [%d]",
+					str_len, (data_len * 5 - 1));
+		return -EINVAL;
+	}
+
+	if (packet->reg_addr == aw883xx->aw_pa->dsp_mem_desc.dsp_madd_reg) {
+		if (sscanf(buf + AWRW_HDR_LEN + 1,
+					"0x%02x 0x%02x", &dsp_addr_h,
+					&dsp_addr_l) == 2) {
+			packet->dsp_addr = (dsp_addr_h << 8) | dsp_addr_l;
+			      packet->dsp_status = AWRW_DSP_READY;
+			dev_dbg(aw883xx->dev, "write:reg_addr[0x%02x], dsp_base_addr:[0x%02x]",
+							packet->reg_addr, packet->dsp_addr);
+		} else {
+			dev_err(aw883xx->dev, "get reg 0x%x data failed", packet->reg_addr);
+			return -EINVAL;
+		}
+		return 0;
+	}
+
+	mutex_lock(&aw883xx->dsp_lock);
+	if (packet->reg_addr == aw883xx->aw_pa->dsp_mem_desc.dsp_mdat_reg) {
+		if (packet->dsp_status != AWRW_DSP_READY) {
+			dev_err(aw883xx->dev, "please write reg[0x40] first");
+			ret = -EINVAL;
+			goto exit;
+		}
+		regmap_write(aw883xx->regmap,
+			aw883xx->aw_pa->dsp_mem_desc.dsp_madd_reg,
+			packet->dsp_addr);
+		packet->dsp_status = AWRW_DSP_ST_NONE;
+	}
+
+	dev_info(aw883xx->dev, "write:reg_addr[0x%02x], reg_num[%d]",
+			packet->reg_addr, packet->reg_num);
+
+	data_buf = devm_kzalloc(aw883xx->dev, data_len, GFP_KERNEL);
+	if (!data_buf) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	for (i = 0; i < data_len; i++) {
+		if (sscanf(buf + AWRW_HDR_LEN + 1 + i * 5, "0x%02x", &temp_data) == 1)
+			data_buf[i] = temp_data;
+	}
+
+	ret = regmap_raw_write(aw883xx->regmap, packet->reg_addr, data_buf, data_len);
+	if (ret < 0) {
+		dev_err(aw883xx->dev, "write failed");
+		devm_kfree(aw883xx->dev, data_buf);
+		data_buf = NULL;
+		goto exit;
+	}
+
+	devm_kfree(aw883xx->dev, data_buf);
+	data_buf = NULL;
+exit:
+	mutex_unlock(&aw883xx->dsp_lock);
+	return ret;
+}
+
+static int aw883xx_awrw_data_check(struct aw883xx *aw883xx, int *data)
+{
+	if ((data[AWRW_HDR_ADDR_BYTES] != AWRW_ADDR_BYTES) ||
+			(data[AWRW_HDR_DATA_BYTES] != AWRW_DATA_BYTES)) {
+		dev_err(aw883xx->dev, "addr_bytes [%d] or data_bytes [%d] unsupport",
+				data[AWRW_HDR_ADDR_BYTES], data[AWRW_HDR_DATA_BYTES]);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/* flag addr_bytes data_bytes reg_num reg_addr*/
+static int aw883xx_awrw_parse_buf(struct aw883xx *aw883xx, const char *buf, size_t count)
+{
+	int data[AWRW_HDR_MAX] = { 0 };
+	struct aw883xx_i2c_packet *packet = &aw883xx->i2c_packet;
+	int ret;
+
+	if (sscanf(buf, "0x%02x 0x%02x 0x%02x 0x%02x 0x%02x",
+		&data[AWRW_HDR_WR_FLAG], &data[AWRW_HDR_ADDR_BYTES], &data[AWRW_HDR_DATA_BYTES],
+		&data[AWRW_HDR_REG_NUM], &data[AWRW_HDR_REG_ADDR]) == 5) {
+
+		ret = aw883xx_awrw_data_check(aw883xx, data);
+		if (ret < 0)
+			return ret;
+
+		packet->reg_addr = data[AWRW_HDR_REG_ADDR];
+		packet->reg_num = data[AWRW_HDR_REG_NUM];
+
+		if (data[AWRW_HDR_WR_FLAG] == AWRW_FLAG_WRITE) {
+			return aw883xx_awrw_write(aw883xx, buf, count);
+		} else if (data[AWRW_HDR_WR_FLAG] == AWRW_FLAG_READ) {
+			packet->i2c_status = AWRW_I2C_ST_READ;
+			dev_info(aw883xx->dev, "read_cmd:reg_addr[0x%02x], reg_num[%d]",
+					packet->reg_addr, packet->reg_num);
+
+		} else {
+			dev_err(aw883xx->dev,
+				"please check str format, unsupport flag %d",
+				data[AWRW_HDR_WR_FLAG]);
+			return -EINVAL;
+		}
+	} else {
+		dev_err(aw883xx->dev, "can not parse string");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static ssize_t awrw_store(struct device *dev,
+	struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+	int ret;
+
+	if (count < AWRW_HDR_LEN) {
+		dev_err(dev, "data count too smaller, please check write format");
+		dev_err(dev, "string %s", buf);
+		return -EINVAL;
+	}
+
+	ret = aw883xx_awrw_parse_buf(aw883xx, buf, count);
+	if (ret)
+		return -EINVAL;
+
+
+	return count;
+}
+
+static ssize_t awrw_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+	struct aw883xx_i2c_packet *packet = &aw883xx->i2c_packet;
+	int data_len, len = 0;
+	int ret, i;
+	char *reg_data = NULL;
+
+	if (packet->i2c_status != AWRW_I2C_ST_READ) {
+		dev_err(aw883xx->dev, "please write read cmd first");
+		return -EINVAL;
+	}
+
+	mutex_lock(&aw883xx->dsp_lock);
+	if (packet->reg_addr == aw883xx->aw_pa->dsp_mem_desc.dsp_mdat_reg) {
+		if (packet->dsp_status != AWRW_DSP_READY) {
+			dev_err(aw883xx->dev, "please write reg[0x40] first");
+			mutex_unlock(&aw883xx->dsp_lock);
+			return -EINVAL;
+		}
+		ret = regmap_write(aw883xx->regmap,
+				aw883xx->aw_pa->dsp_mem_desc.dsp_madd_reg,
+				packet->dsp_addr);
+		if (ret < 0) {
+			mutex_unlock(&aw883xx->dsp_lock);
+			return ret;
+		}
+		packet->dsp_status = AWRW_DSP_ST_NONE;
+	}
+
+	data_len = AWRW_DATA_BYTES * packet->reg_num;
+	reg_data = devm_kzalloc(dev, data_len, GFP_KERNEL);
+	if (!reg_data) {
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	ret = regmap_raw_read(aw883xx->regmap, packet->reg_addr, (void *)reg_data, data_len);
+	if (ret < 0) {
+		ret = -EFAULT;
+		goto exit;
+	}
+
+	dev_info(aw883xx->dev, "reg_addr 0x%02x, reg_num %d",
+			packet->reg_addr, packet->reg_num);
+
+	for (i = 0; i < data_len; i++) {
+		len += snprintf(buf + len, PAGE_SIZE - len,
+			"0x%02x,", reg_data[i]);
+
+	}
+	ret = len;
+
+exit:
+	if (reg_data) {
+		devm_kfree(dev, reg_data);
+		reg_data = NULL;
+	}
+	mutex_unlock(&aw883xx->dsp_lock);
+	packet->i2c_status = AWRW_I2C_ST_NONE;
+	return ret;
+}
+
+static ssize_t fade_step_store(struct device *dev,
+	struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+	unsigned int databuf = 0;
+	int ret = 0;
+
+	ret = kstrtoint(buf, 0, &databuf);
+	if (ret == 0) {
+		if (databuf > (aw883xx->aw_pa->volume_desc.mute_volume)) {
+			dev_info(aw883xx->dev, "step overflow %d Db", databuf);
+			return count;
+		}
+		aw883xx_dev_set_fade_vol_step(aw883xx->aw_pa, databuf);
+	}
+
+	dev_info(aw883xx->dev, "set step %d DB Done", databuf);
+
+	return count;
+}
+
+static ssize_t fade_step_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	ssize_t len = 0;
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+
+	len += snprintf(buf+len, PAGE_SIZE-len,
+		"step: %d\n", aw883xx_dev_get_fade_vol_step(aw883xx->aw_pa));
+
+	return len;
+}
+
+static ssize_t dbg_prof_store(struct device *dev,
+	struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+	unsigned int databuf = 0;
+	int ret = 0;
+
+	ret = kstrtoint(buf, 0, &databuf);
+	if (ret == 0) {
+		if (databuf)
+			aw883xx->dbg_en_prof = true;
+		else
+			aw883xx->dbg_en_prof = false;
+	}
+
+	dev_info(aw883xx->dev, "en_prof %d  Done", databuf);
+
+	return count;
+}
+
+static ssize_t dbg_prof_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+	ssize_t len = 0;
+
+	len += snprintf(buf+len, PAGE_SIZE-len,
+		" %d\n", aw883xx->dbg_en_prof);
+
+	return len;
+}
+
+static ssize_t phase_sync_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+	unsigned int flag = 0;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &flag);
+	if (ret < 0)
+		return ret;
+
+	flag = ((flag == false) ? false : true);
+
+	dev_info(aw883xx->dev, "set phase sync flag : [%d]", flag);
+
+	aw883xx->phase_sync = flag;
+
+	return count;
+}
+
+static ssize_t phase_sync_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+	ssize_t len = 0;
+
+	len += snprintf(buf + len, PAGE_SIZE - len,
+				"sync flag : %d\n", aw883xx->phase_sync);
+
+	return len;
+}
+
+static ssize_t fade_enable_store(struct device *dev,
+	struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+	uint32_t fade_en = 0;
+	int ret = 0;
+
+	ret = kstrtouint(buf, 0, &fade_en);
+	if (ret == 0)
+		aw883xx->aw_pa->fade_en = fade_en;
+
+	dev_info(aw883xx->dev, "set fade_en %d", aw883xx->aw_pa->fade_en);
+
+	return count;
+}
+
+static ssize_t fade_enable_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+	ssize_t len = 0;
+
+	len += snprintf(buf+len, PAGE_SIZE-len,
+		"fade_en: %d\n", aw883xx->aw_pa->fade_en);
+
+	return len;
+}
+
+static int aw883xx_dsp_log_info(struct aw883xx *aw883xx, unsigned int base_addr,
+				uint32_t data_len, char *format)
+{
+	unsigned int reg_val = 0;
+	char *dsp_reg_info = NULL;
+	ssize_t dsp_info_len = 0;
+	int i;
+
+	dsp_reg_info = devm_kzalloc(aw883xx->dev, AW_NAME_BUF_MAX, GFP_KERNEL);
+	if (!dsp_reg_info)
+		return -ENOMEM;
+
+	mutex_lock(&aw883xx->dsp_lock);
+	regmap_write(aw883xx->regmap, aw883xx->aw_pa->dsp_mem_desc.dsp_madd_reg, base_addr);
+
+	for (i = 0; i < data_len; i += 2) {
+		regmap_read(aw883xx->regmap, aw883xx->aw_pa->dsp_mem_desc.dsp_mdat_reg, &reg_val);
+		dsp_info_len += snprintf(dsp_reg_info + dsp_info_len,
+			AW_NAME_BUF_MAX - dsp_info_len,
+			"%02x,%02x,", (reg_val >> 0) & 0xff,
+			(reg_val >> 8) & 0xff);
+		if ((i / 2 + 1) % 8 == 0) {
+			dev_info(aw883xx->dev, "%s: %s", format, dsp_reg_info);
+			dsp_info_len = 0;
+			memset(dsp_reg_info, 0, AW_NAME_BUF_MAX);
+		}
+
+		if (((data_len) % 8 != 0) &&
+			(i == (data_len - 2))) {
+			dev_info(aw883xx->dev, "%s: %s", format, dsp_reg_info);
+			dsp_info_len = 0;
+			memset(dsp_reg_info, 0, AW_NAME_BUF_MAX);
+		}
+	}
+
+	dsp_info_len = 0;
+	memset(dsp_reg_info, 0, AW_NAME_BUF_MAX);
+	devm_kfree(aw883xx->dev, dsp_reg_info);
+	dsp_reg_info = NULL;
+	mutex_unlock(&aw883xx->dsp_lock);
+
+	return 0;
+}
+
+static ssize_t dsp_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+	ssize_t len = 0;
+	int ret = -1;
+	uint32_t data_len;
+
+	if (aw883xx->aw_pa->dsp_cfg == AW_DEV_DSP_BYPASS) {
+		len += snprintf((char *)(buf + len), PAGE_SIZE - len,
+				"%s: dsp bypass\n", __func__);
+	} else {
+		len += snprintf((char *)(buf + len), PAGE_SIZE - len,
+				"%s: dsp working\n", __func__);
+		ret = aw883xx_dev_get_iis_status(aw883xx->aw_pa);
+		if (ret < 0) {
+			len += snprintf((char *)(buf + len),
+					PAGE_SIZE - len,
+					"%s: no iis signal\n",
+					__func__);
+			dev_err(aw883xx->dev, "no iis signal, dsp show failed");
+			return len;
+		}
+
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"dsp firmware and config info is displayed in the kernel log\n");
+
+		dev_dbg(aw883xx->dev, "dsp_firmware_len:%d", aw883xx->aw_pa->dsp_fw_len);
+		ret = aw883xx_dsp_log_info(aw883xx, aw883xx->aw_pa->dsp_mem_desc.dsp_fw_base_addr,
+			aw883xx->aw_pa->dsp_fw_len, "dsp_fw");
+		if (ret < 0) {
+			dev_err(aw883xx->dev, "dsp_fw display failed");
+			return len;
+		}
+
+		dev_dbg(aw883xx->dev, "dsp_config_len:%d", aw883xx->aw_pa->dsp_cfg_len);
+		ret = aw883xx_dsp_log_info(aw883xx, aw883xx->aw_pa->dsp_mem_desc.dsp_cfg_base_addr,
+			aw883xx->aw_pa->dsp_cfg_len, "dsp_config");
+		if (ret < 0) {
+			dev_err(aw883xx->dev, "dsp_config display failed");
+			return len;
+		}
+
+		dev_dbg(aw883xx->dev, "dsp_config:0x8180-0x83fc");
+		data_len = 2 * (aw883xx->aw_pa->dsp_st_desc.dsp_reg_e1 -
+			aw883xx->aw_pa->dsp_st_desc.dsp_reg_s1);
+		ret = aw883xx_dsp_log_info(aw883xx, aw883xx->aw_pa->dsp_st_desc.dsp_reg_s1,
+			data_len, "dsp_st");
+		if (ret < 0) {
+			dev_err(aw883xx->dev, "dsp_config:0x8180-0x83fc failed");
+			return len;
+		}
+
+		dev_dbg(aw883xx->dev, "dsp_config:0x9c00-0x9c5c");
+		data_len = 2 * (aw883xx->aw_pa->dsp_st_desc.dsp_reg_e2 -
+			aw883xx->aw_pa->dsp_st_desc.dsp_reg_s2);
+		ret = aw883xx_dsp_log_info(aw883xx, aw883xx->aw_pa->dsp_st_desc.dsp_reg_s2,
+			data_len, "dsp_st");
+		if (ret < 0) {
+			dev_err(aw883xx->dev, "dsp_config:0x9c00-0x9c5c display failed");
+			return len;
+		}
+	}
+
+	return len;
+}
+
+static ssize_t re_store(struct device *dev,
+	struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+	unsigned int databuf = 0;
+	int ret = 0;
+
+	ret = kstrtoint(buf, 0, &databuf);
+	if (ret == 0)
+		aw883xx_dev_set_cali_re(aw883xx->aw_pa, databuf);
+
+	dev_info(aw883xx->dev, "set cali_re %d mohm Done", databuf);
+
+	return count;
+}
+
+static ssize_t re_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	ssize_t len = 0;
+	struct aw883xx *aw883xx = dev_get_drvdata(dev);
+
+	len += snprintf(buf+len, PAGE_SIZE-len,
+		"cali_re: %d mohm\n", aw883xx_dev_get_cali_re(aw883xx->aw_pa));
+
+	return len;
+}
+
+static DEVICE_ATTR_RW(reg);
+static DEVICE_ATTR_RW(rw);
+static DEVICE_ATTR_RW(dsp_rw);
+static DEVICE_ATTR_RW(awrw);
+static DEVICE_ATTR_RW(fade_step);
+static DEVICE_ATTR_RW(dbg_prof);
+static DEVICE_ATTR_RW(phase_sync);
+static DEVICE_ATTR_RW(fade_enable);
+static DEVICE_ATTR_RO(dsp);
+static DEVICE_ATTR_RW(re);
+
+static struct attribute *aw883xx_attributes[] = {
+	&dev_attr_reg.attr,
+	&dev_attr_rw.attr,
+	&dev_attr_dsp_rw.attr,
+	&dev_attr_awrw.attr,
+	&dev_attr_fade_step.attr,
+	&dev_attr_dbg_prof.attr,
+	&dev_attr_phase_sync.attr,
+	&dev_attr_fade_enable.attr,
+	&dev_attr_dsp.attr,
+	&dev_attr_re.attr,
+	NULL
+};
+
+static struct attribute_group aw883xx_attribute_group = {
+	.attrs = aw883xx_attributes
+};
+
+/*
+ * i2c driver
+ */
+static int aw883xx_i2c_probe(struct i2c_client *i2c,
+				const struct i2c_device_id *id)
+{
+	struct aw883xx *aw883xx = NULL;
+	int ret = -1;
+
+	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C)) {
+		dev_err(&i2c->dev, "check_functionality failed");
+		return -EIO;
+	}
+
+	aw883xx = aw883xx_malloc_init(i2c);
+	if (!aw883xx) {
+		dev_err(&i2c->dev, "malloc aw883xx failed");
+		return -ENOMEM;
+	}
+	i2c_set_clientdata(i2c, aw883xx);
+
+	ret = aw883xx_parse_dt(aw883xx);
+	if (ret < 0) {
+		dev_err(&i2c->dev, "parse dts failed");
+		return ret;
+	}
+
+	/*get gpio resource*/
+	ret = aw883xx_gpio_request(aw883xx);
+	if (ret)
+		return ret;
+
+	/* hardware reset */
+	aw883xx_hw_reset(aw883xx);
+
+	aw883xx->regmap = devm_regmap_init_i2c(i2c, &aw883xx_remap_config);
+	if (IS_ERR(aw883xx->regmap)) {
+		ret = PTR_ERR(aw883xx->regmap);
+		dev_err(&i2c->dev, "Failed to init regmap: %d\n", ret);
+		return ret;
+	}
+
+	/* aw883xx chip id */
+	ret = aw883xx_read_chipid(aw883xx);
+	if (ret < 0) {
+		dev_err(&i2c->dev, "aw883xx_read_chipid failed ret=%d", ret);
+		return ret;
+	}
+
+	/*aw pa init*/
+	ret = aw883xx_init(aw883xx);
+	if (ret < 0)
+		return ret;
+
+	ret = aw883xx_componet_codec_register(aw883xx);
+	if (ret) {
+		dev_err(&i2c->dev, "codec register failed");
+		return ret;
+	}
+
+	ret = sysfs_create_group(&i2c->dev.kobj, &aw883xx_attribute_group);
+	if (ret < 0) {
+		dev_err(&i2c->dev, "error creating sysfs attr files");
+		goto err_sysfs;
+	}
+
+	dev_set_drvdata(&i2c->dev, aw883xx);
+
+	return 0;
+
+err_sysfs:
+	aw_componet_codec_ops.unregister_codec(&i2c->dev);
+	return ret;
+}
+
+static void aw883xx_i2c_remove(struct i2c_client *i2c)
+{
+	struct aw883xx *aw883xx = i2c_get_clientdata(i2c);
+
+	sysfs_remove_group(&aw883xx->dev->kobj,
+			&aw883xx_attribute_group);
+
+	/*free device resource */
+	aw883xx_device_remove(aw883xx->aw_pa);
+
+	aw_componet_codec_ops.unregister_codec(&i2c->dev);
+	vfree(aw883xx->aw_cfg);
+	aw883xx->aw_cfg = NULL;
+}
+
+static const struct i2c_device_id aw883xx_i2c_id[] = {
+	{AW883XX_I2C_NAME, 0},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, aw883xx_i2c_id);
+
+static const struct of_device_id aw883xx_dt_match[] = {
+	{.compatible = "awinic,aw883xx_smartpa"},
+	{},
+};
+
+static struct i2c_driver aw883xx_i2c_driver = {
+	.driver = {
+		.name = AW883XX_I2C_NAME,
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(aw883xx_dt_match),
+	},
+	.probe = aw883xx_i2c_probe,
+	.remove = aw883xx_i2c_remove,
+	.id_table = aw883xx_i2c_id,
+};
+module_i2c_driver(aw883xx_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC AW883XX Smart PA Driver");
+MODULE_LICENSE("GPL v2");
+
diff --git a/sound/soc/codecs/aw883xx/aw883xx.h b/sound/soc/codecs/aw883xx/aw883xx.h
new file mode 100644
index 000000000000..f128296767ab
--- /dev/null
+++ b/sound/soc/codecs/aw883xx/aw883xx.h
@@ -0,0 +1,155 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * aw883xx.c --  ALSA Soc AW883XX codec support
+ *
+ * Copyright (c) 2022 AWINIC Technology CO., LTD
+ *
+ * Author: Bruce zhao <zhaolei@awinic.com>
+ */
+
+#ifndef __AW883XX_H__
+#define __AW883XX_H__
+
+#include <linux/version.h>
+#include <sound/control.h>
+#include <sound/soc.h>
+#include "aw883xx_device.h"
+
+#define AW883XX_CHIP_ID_REG	(0x00)
+
+/*
+ * i2c transaction on Linux limited to 64k
+ * (See Linux kernel documentation: Documentation/i2c/writing-clients)
+ */
+#define MAX_I2C_BUFFER_SIZE		(65536)
+#define AW883XX_READ_MSG_NUM		(2)
+
+#define AW_I2C_RETRIES			(5)
+#define AW_I2C_RETRY_DELAY		(5)/* 5ms */
+
+#define AW_READ_CHIPID_RETRY_DELAY	(5)/* 5ms */
+#define AW_START_RETRIES		(5)
+
+#define AW883XX_FLAG_START_ON_MUTE	(1 << 0)
+#define AW883XX_FLAG_SKIP_INTERRUPTS	(1 << 1)
+
+#define AW883XX_I2S_CHECK_MAX		(5)
+
+#define AW883XX_SYSST_CHECK_MAX		(10)
+
+#define AW883XX_BIN_TYPE_NUM		(3)
+#define AW883XX_LOAD_FW_DELAY_TIME	(3000)
+#define AW883XX_START_WORK_DELAY_MS	(0)
+
+
+#define AW883XX_DSP_16_DATA_MASK	(0x0000ffff)
+
+#define AW_GET_IV_CNT_MAX		(6)
+#define AW_KCONTROL_NUM			(5)
+#define AW_HW_MONITOR_DELAY		(1000)
+
+enum {
+	AWRW_I2C_ST_NONE = 0,
+	AWRW_I2C_ST_READ,
+	AWRW_I2C_ST_WRITE,
+};
+
+enum {
+	AWRW_DSP_ST_NONE = 0,
+	AWRW_DSP_READY,
+};
+
+enum {
+	AW_SYNC_START = 0,
+	AW_ASYNC_START,
+};
+
+
+#define AWRW_ADDR_BYTES (1)
+#define AWRW_DATA_BYTES (2)
+#define AWRW_HDR_LEN (24)
+
+enum {
+	AWRW_FLAG_WRITE = 0,
+	AWRW_FLAG_READ,
+};
+
+enum {
+	AWRW_HDR_WR_FLAG = 0,
+	AWRW_HDR_ADDR_BYTES,
+	AWRW_HDR_DATA_BYTES,
+	AWRW_HDR_REG_NUM,
+	AWRW_HDR_REG_ADDR,
+	AWRW_HDR_MAX,
+};
+
+struct aw883xx_i2c_packet {
+	unsigned char i2c_status;
+	unsigned char dsp_status;
+	unsigned int reg_num;
+	unsigned int reg_addr;
+	unsigned int dsp_addr;
+	char *reg_data;
+};
+
+enum {
+	AW883XX_STREAM_CLOSE = 0,
+	AW883XX_STREAM_OPEN,
+};
+
+/*
+ * Compatible with codec and component
+ */
+
+struct aw_componet_codec_ops {
+	struct snd_soc_component *(*kcontrol_codec)(struct snd_kcontrol *kcontrol);
+	void *(*codec_get_drvdata)(struct snd_soc_component *codec);
+	int (*add_codec_controls)(struct snd_soc_component *codec,
+		const struct snd_kcontrol_new *controls, unsigned int num_controls);
+	void (*unregister_codec)(struct device *dev);
+	int (*register_codec)(struct device *dev,
+			const struct snd_soc_component_driver *codec_drv,
+			struct snd_soc_dai_driver *dai_drv,
+			int num_dai);
+};
+
+struct aw883xx {
+	struct i2c_client *i2c;
+	struct device *dev;
+	struct mutex lock;
+	struct mutex dsp_lock;
+	struct snd_soc_component *codec;
+	struct aw_componet_codec_ops *codec_ops;
+	struct aw_device *aw_pa;
+
+	int sysclk;
+	int reset_gpio;
+
+	unsigned char phase_sync;	/*phase sync*/
+	uint32_t allow_pw;
+	uint8_t pstream;
+	unsigned char fw_retry_cnt;
+
+	uint8_t dbg_en_prof;
+
+	struct workqueue_struct *work_queue;
+	struct delayed_work start_work;
+	struct delayed_work acf_work;
+
+	uint8_t reg_addr;
+	uint16_t dsp_addr;
+	uint16_t chip_id;
+	struct aw883xx_i2c_packet i2c_packet;
+
+	struct regmap *regmap;
+	struct aw_container *aw_cfg;
+};
+
+int aw883xx_init(struct aw883xx *aw883xx);
+
+int aw883xx_dsp_write(struct aw883xx *aw883xx,
+		uint16_t dsp_addr, uint32_t dsp_data, uint8_t data_type);
+int aw883xx_dsp_read(struct aw883xx *aw883xx,
+		uint16_t dsp_addr, uint32_t *dsp_data, uint8_t data_type);
+
+#endif
-- 
2.38.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6A1646F8B
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 13:25:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D400B18D5;
	Thu,  8 Dec 2022 13:24:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D400B18D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670502303;
	bh=EM926ALgsLWcE13LfMnNSuoQw20a+Ny8j7N8gxPxRO0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eu+hwqGnSsKA9wCdYbULU9pmuX0xhcBco8GjouV9lFhgclH98FN6UKocSbBNGuilQ
	 IorIERGdihHBSG3g8zgs7lFmX3PQGuhVJeKxPdntlzG6R56nsBLd8UojOgitN7Dj5A
	 dk4BLycXqkKR/hBGm3TZHWXDRVXgHcIH82AgZp3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECED6F8055C;
	Thu,  8 Dec 2022 13:23:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53B8DF8055B; Thu,  8 Dec 2022 13:23:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_ZEN_BLOCKED_OPENDNS, 
 SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE, UNPARSEABLE_RELAY,
 URIBL_BLOCKED, 
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from out29-82.mail.aliyun.com (out29-82.mail.aliyun.com
 [115.124.29.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 401BAF8020D
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 13:23:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 401BAF8020D
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436261|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00975171-0.000561269-0.989687;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=wangweidong.a@awinic.com; NM=0;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.QRKcQry_1670502204; 
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.QRKcQry_1670502204) by smtp.aliyun-inc.com;
 Thu, 08 Dec 2022 20:23:25 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org, perex@perex.cz, alsa-devel@alsa-project.org,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 quic_potturu@quicinc.com, pierre-louis.bossart@linux.intel.com,
 cy_huang@richtek.com
Subject: [PATCH V6 1/5] ASoC: codecs: Add i2c and codec registration for
 aw883xx and their associated operation functions
Date: Thu,  8 Dec 2022 20:23:09 +0800
Message-Id: <20221208122313.55118-2-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208122313.55118-1-wangweidong.a@awinic.com>
References: <20221208122313.55118-1-wangweidong.a@awinic.com>
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
 sound/soc/codecs/aw883xx/aw883xx.c | 909 +++++++++++++++++++++++++++++
 sound/soc/codecs/aw883xx/aw883xx.h |  81 +++
 2 files changed, 990 insertions(+)
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx.h

diff --git a/sound/soc/codecs/aw883xx/aw883xx.c b/sound/soc/codecs/aw883xx/aw883xx.c
new file mode 100644
index 000000000000..f82e6d8c71a7
--- /dev/null
+++ b/sound/soc/codecs/aw883xx/aw883xx.c
@@ -0,0 +1,909 @@
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
+static const struct regmap_config aw883xx_remap_config = {
+	.val_bits = 16,
+	.reg_bits = 8,
+	.max_register = AW_PID_2049_REG_MAX - 1,
+};
+
+/*
+ * aw883xx dsp write/read
+ */
+static int aw883xx_dsp_write_16bit(struct aw883xx *aw883xx,
+		unsigned short dsp_addr, unsigned int dsp_data)
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
+	ret = regmap_write(aw883xx->regmap, desc->dsp_mdat_reg, (u16)dsp_data);
+	if (ret < 0) {
+		dev_err(aw883xx->dev, "%s error, ret=%d", __func__, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int aw883xx_dsp_write_32bit(struct aw883xx *aw883xx,
+		unsigned short dsp_addr, unsigned int dsp_data)
+{
+	int ret;
+	u16 temp_data = 0;
+	struct aw_dsp_mem_desc *desc = &aw883xx->aw_pa->dsp_mem_desc;
+
+	ret = regmap_write(aw883xx->regmap, desc->dsp_madd_reg, dsp_addr);
+	if (ret < 0) {
+		dev_err(aw883xx->dev, "%s error, ret=%d", __func__, ret);
+		return ret;
+	}
+
+	temp_data = dsp_data & AW_DSP_16_DATA_MASK;
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
+	u8 reg = aw883xx->aw_pa->soft_rst.reg;
+
+	regmap_read(aw883xx->regmap, reg, &reg_value);
+}
+
+int aw883xx_dsp_write(struct aw883xx *aw883xx,
+		unsigned short dsp_addr, unsigned int dsp_data, unsigned char data_type)
+{
+	int ret = -1;
+
+	mutex_lock(&aw883xx->dsp_lock);
+	switch (data_type) {
+	case AW_DSP_16_DATA:
+		ret = aw883xx_dsp_write_16bit(aw883xx, dsp_addr, dsp_data);
+		if (ret < 0)
+			dev_err(aw883xx->dev, "write dsp_addr[0x%04x] 16 bit dsp_data[%04x] failed",
+					(u32)dsp_addr, dsp_data);
+		break;
+	case AW_DSP_32_DATA:
+		ret =  aw883xx_dsp_write_32bit(aw883xx, dsp_addr, dsp_data);
+		if (ret < 0)
+			dev_err(aw883xx->dev, "write dsp_addr[0x%04x] 32 bit dsp_data[%08x] failed",
+					(u32)dsp_addr, dsp_data);
+		break;
+	default:
+		dev_err(aw883xx->dev, "data type[%d] unsupported", data_type);
+		ret = -EINVAL;
+		break;
+	}
+
+	aw883xx_clear_dsp_sel_st(aw883xx);
+	mutex_unlock(&aw883xx->dsp_lock);
+	return ret;
+}
+
+static int aw883xx_dsp_read_16bit(struct aw883xx *aw883xx,
+		unsigned short dsp_addr, unsigned int *dsp_data)
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
+		unsigned short dsp_addr, unsigned int *dsp_data)
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
+		unsigned short dsp_addr, unsigned int *dsp_data, unsigned char data_type)
+{
+	int ret = -1;
+
+	mutex_lock(&aw883xx->dsp_lock);
+	switch (data_type) {
+	case AW_DSP_16_DATA:
+		ret = aw883xx_dsp_read_16bit(aw883xx, dsp_addr, dsp_data);
+		if (ret < 0)
+			dev_err(aw883xx->dev, "read dsp_addr[0x%04x] 16 bit dsp_data[%04x] failed",
+					(u32)dsp_addr, *dsp_data);
+		break;
+	case AW_DSP_32_DATA:
+		ret = aw883xx_dsp_read_32bit(aw883xx, dsp_addr, dsp_data);
+		if (ret < 0)
+			dev_err(aw883xx->dev, "read dsp_addr[0x%04x] 32 bit dsp_data[%08x] failed",
+					(u32)dsp_addr, *dsp_data);
+		break;
+	default:
+		dev_err(aw883xx->dev, "data type[%d] unsupported", data_type);
+		ret = -EINVAL;
+		break;
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
+	if (aw883xx->aw_pa->fw_status != AW_DEV_FW_OK)
+		return;
+
+	if (!aw883xx->allow_pw) {
+		dev_info(aw883xx->dev, "%s:dev can not allow power", __func__);
+		return;
+	}
+
+	if (aw883xx->aw_pa->status == AW_DEV_PW_ON)
+		return;
+
+	for (i = 0; i < AW_START_RETRIES; i++) {
+		ret = aw883xx_dev_fw_update(aw883xx->aw_pa, AW_DSP_FW_UPDATE_OFF,
+					aw883xx->phase_sync);
+		if (ret < 0) {
+			dev_err(aw883xx->dev, "fw update failed. retry = %d", i);
+			continue;
+		} else {
+			/*firmware update success*/
+			if (sync_start == AW_SYNC_START)
+				aw883xx_start_pa(aw883xx);
+			else
+				queue_delayed_work(aw883xx->work_queue,
+					&aw883xx->start_work,
+					AW_START_WORK_DELAY_MS);
+			return;
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
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(codec);
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
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(codec);
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
+		.name = "aw883xx-aif",
+		.id = 1,
+		.playback = {
+			.stream_name = "Speaker_Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = AW_RATES,
+			.formats = AW_FORMATS,
+		},
+		.capture = {
+			.stream_name = "Speaker_Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = AW_RATES,
+			.formats = AW_FORMATS,
+		},
+		.ops = &aw883xx_dai_ops,
+	},
+};
+
+/*
+ * codec driver
+ */
+static int aw883xx_get_fade_in_time(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(component);
+	struct aw_device *aw_dev = aw883xx->aw_pa;
+
+	ucontrol->value.integer.value[0] = aw_dev->fade_in_time;
+
+	return 0;
+
+}
+
+static int aw883xx_set_fade_in_time(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	unsigned int time = 0;
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(component);
+	struct aw_device *aw_dev = aw883xx->aw_pa;
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+
+	time = ucontrol->value.integer.value[0];
+
+	if (time < mc->min || time > mc->max)
+		return 0;
+
+	if (time != aw_dev->fade_in_time) {
+		aw_dev->fade_in_time = time;
+		return 1;
+	}
+
+	return 0;
+}
+
+static int aw883xx_get_fade_out_time(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(component);
+	struct aw_device *aw_dev = aw883xx->aw_pa;
+
+	ucontrol->value.integer.value[0] = aw_dev->fade_out_time;
+
+	return 0;
+}
+
+static int aw883xx_set_fade_out_time(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(component);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct aw_device *aw_dev = aw883xx->aw_pa;
+	unsigned int time = 0;
+
+	time = ucontrol->value.integer.value[0];
+	if (time < mc->min || time > mc->max)
+		return 0;
+
+	if (time != aw_dev->fade_out_time) {
+		aw_dev->fade_out_time = time;
+		return 1;
+	}
+
+	return 0;
+}
+
+static int aw883xx_profile_info(struct snd_kcontrol *kcontrol,
+			 struct snd_ctl_elem_info *uinfo)
+{
+	int count;
+	char *name = NULL;
+	const char *prof_name = NULL;
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(codec);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
+	uinfo->count = 1;
+
+	count = aw883xx_dev_get_profile_count(aw883xx->aw_pa);
+	if (count <= 0) {
+		uinfo->value.enumerated.items = 0;
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
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(codec);
+
+	ucontrol->value.integer.value[0] = aw883xx_dev_get_profile_index(aw883xx->aw_pa);
+
+	return 0;
+}
+
+static int aw883xx_profile_set(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(codec);
+	int ret;
+	int cur_index;
+
+	/* check value valid */
+	ret = aw883xx_dev_check_profile_index(aw883xx->aw_pa, ucontrol->value.integer.value[0]);
+	if (ret)
+		return 0;
+
+	/*check cur_index == set value*/
+	cur_index = aw883xx_dev_get_profile_index(aw883xx->aw_pa);
+	if (cur_index == ucontrol->value.integer.value[0]) {
+		dev_dbg(codec->dev, "index no change");
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
+	return 1;
+}
+
+static int aw883xx_switch_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(codec);
+
+	ucontrol->value.integer.value[0] = aw883xx->allow_pw;
+
+	return 0;
+}
+
+static int aw883xx_switch_set(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(codec);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	unsigned int value = 0;
+
+	value = ucontrol->value.integer.value[0];
+	if (value < mc->min || value > mc->max)
+		return 0;
+
+	if (value == aw883xx->allow_pw) {
+		dev_dbg(aw883xx->dev, "PA switch not change");
+		return 0;
+	}
+	aw883xx->allow_pw = value;
+
+	if (aw883xx->pstream) {
+		if (!aw883xx->allow_pw) {
+			cancel_delayed_work_sync(&aw883xx->start_work);
+			mutex_lock(&aw883xx->lock);
+			aw883xx_device_stop(aw883xx->aw_pa);
+			mutex_unlock(&aw883xx->lock);
+		} else {
+			cancel_delayed_work_sync(&aw883xx->start_work);
+			mutex_lock(&aw883xx->lock);
+			aw883xx_start(aw883xx, AW_SYNC_START);
+			mutex_unlock(&aw883xx->lock);
+		}
+	}
+
+	return 1;
+}
+
+static int aw883xx_volume_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(codec);
+	struct aw_volume_desc *vol_desc = &aw883xx->aw_pa->volume_desc;
+
+	ucontrol->value.integer.value[0] = vol_desc->ctl_volume;
+
+	return 0;
+}
+
+static int aw883xx_volume_set(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	int value = 0;
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(codec);
+	struct aw_volume_desc *vol_desc = &aw883xx->aw_pa->volume_desc;
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+
+	value = ucontrol->value.integer.value[0];
+	if (value < mc->min || value > mc->max)
+		return 0;
+
+	if (vol_desc->ctl_volume != value) {
+		vol_desc->ctl_volume = value;
+		aw883xx_dev_set_volume(aw883xx->aw_pa, vol_desc->ctl_volume);
+
+		return 1;
+	}
+
+	return 0;
+}
+
+static int aw883xx_get_fade_step(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(codec);
+
+	ucontrol->value.integer.value[0] = aw883xx->aw_pa->fade_step;
+
+	return 0;
+}
+static int aw883xx_set_fade_step(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	unsigned int value = 0;
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(codec);
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+
+	value = ucontrol->value.integer.value[0];
+	if (value < mc->min || value > mc->max)
+		return 0;
+
+	if (aw883xx->aw_pa->fade_step != value) {
+		aw883xx->aw_pa->fade_step = value;
+		return 1;
+	}
+
+	return 0;
+}
+static int aw883xx_re_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(codec);
+	struct aw_device *aw_dev = aw883xx->aw_pa;
+
+	ucontrol->value.integer.value[0] = aw_dev->cali_desc.cali_re;
+
+	return 0;
+}
+
+static int aw883xx_re_set(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	int value = 0;
+	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(codec);
+	struct aw_device *aw_dev = aw883xx->aw_pa;
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+
+	value = ucontrol->value.integer.value[0];
+	if (value < mc->min || value > mc->max)
+		return 0;
+
+	if (aw_dev->cali_desc.cali_re != value) {
+		aw_dev->cali_desc.cali_re = value;
+		return 1;
+	}
+
+	return 0;
+}
+static const struct snd_kcontrol_new aw883xx_controls[] = {
+	SOC_SINGLE_EXT("PCM Playback Switch", SND_SOC_NOPM, 0, 1, 0,
+				aw883xx_switch_get, aw883xx_switch_set),
+	SOC_SINGLE_EXT("PCM Playback Volume", AW_PID_2049_SYSCTRL2_REG,
+		6, AW_PID_2049_MUTE_VOL, 0, aw883xx_volume_get,
+		aw883xx_volume_set),
+	SOC_SINGLE_EXT("Fade Step", 0, 0, AW_PID_2049_MUTE_VOL, 0,
+		aw883xx_get_fade_step, aw883xx_set_fade_step),
+	SOC_SINGLE_EXT("Volume Ramp Up Step", 0, 0, FADE_TIME_MAX, FADE_TIME_MIN,
+		aw883xx_get_fade_in_time, aw883xx_set_fade_in_time),
+	SOC_SINGLE_EXT("Volume Ramp Down Step", 0, 0, FADE_TIME_MAX, FADE_TIME_MIN,
+		aw883xx_get_fade_out_time, aw883xx_set_fade_out_time),
+	SOC_SINGLE_EXT("Calib", 0, 0, 100, 0,
+		aw883xx_re_get, aw883xx_re_set),
+	AW_PROFILE_EXT("Profile Set", aw883xx_profile_info,
+		aw883xx_profile_get, aw883xx_profile_set),
+};
+
+static const struct snd_soc_dapm_widget aw883xx_dapm_widgets[] = {
+	 /* playback */
+	SND_SOC_DAPM_AIF_IN("AIF_RX", "Speaker_Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_OUTPUT("DAC Output"),
+	/* capture */
+	SND_SOC_DAPM_AIF_OUT("AIF_TX", "Speaker_Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_INPUT("ADC Input"),
+};
+
+static const struct snd_soc_dapm_route aw883xx_audio_map[] = {
+	{"DAC Output", NULL, "AIF_RX"},
+	{"AIF_TX", NULL, "ADC Input"},
+};
+
+static int aw883xx_codec_probe(struct snd_soc_component *component)
+{
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	int ret = 0;
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
+	/*add widgets*/
+	ret = snd_soc_dapm_new_controls(dapm, aw883xx_dapm_widgets,
+							ARRAY_SIZE(aw883xx_dapm_widgets));
+	if (ret < 0)
+		return ret;
+
+	/*add route*/
+	ret = snd_soc_dapm_add_routes(dapm, aw883xx_audio_map,
+							ARRAY_SIZE(aw883xx_audio_map));
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_add_component_controls(component, aw883xx_controls,
+							ARRAY_SIZE(aw883xx_controls));
+	if (ret < 0)
+		return ret;
+
+	return ret;
+}
+
+static void aw883xx_codec_remove(struct snd_soc_component *aw_codec)
+{
+	struct aw883xx *aw883xx = snd_soc_component_get_drvdata(aw_codec);
+
+	cancel_delayed_work_sync(&aw883xx->start_work);
+
+	if (aw883xx->work_queue)
+		destroy_workqueue(aw883xx->work_queue);
+
+}
+
+static const struct snd_soc_component_driver soc_codec_dev_aw883xx = {
+	.probe = aw883xx_codec_probe,
+	.remove = aw883xx_codec_remove,
+};
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
+	aw883xx->allow_pw = true;
+	aw883xx->work_queue = NULL;
+	mutex_init(&aw883xx->lock);
+	mutex_init(&aw883xx->dsp_lock);
+
+	return aw883xx;
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
+static void aw883xx_hw_reset(struct aw883xx *aw883xx)
+{
+	if (aw883xx->reset_gpio) {
+		gpiod_set_value_cansleep(aw883xx->reset_gpio, 0);
+		usleep_range(AW_1000_US, AW_1000_US + 10);
+		gpiod_set_value_cansleep(aw883xx->reset_gpio, 1);
+		usleep_range(AW_1000_US, AW_1000_US + 10);
+	} else {
+		dev_err(aw883xx->dev, "%s failed", __func__);
+	}
+}
+
+static int aw883xx_read_chipid(struct aw883xx *aw883xx)
+{
+	int ret = -1;
+	int reg_val = 0;
+
+	ret = regmap_read(aw883xx->regmap, AW_CHIP_ID_REG, &reg_val);
+	if (ret)
+		return -EIO;
+
+	dev_info(aw883xx->dev, "chip id = %x\n", reg_val);
+	aw883xx->chip_id = reg_val;
+
+	return 0;
+}
+
+static void aw883xx_parse_dt(struct aw883xx *aw883xx)
+{
+	aw883xx_parse_sync_flag_dt(aw883xx);
+
+	aw883xx->reset_gpio = devm_gpiod_get_optional(aw883xx->dev,
+								"reset", GPIOD_OUT_LOW);
+	if (IS_ERR(aw883xx->reset_gpio))
+		dev_info(aw883xx->dev, "reset gpio not defined\n");
+}
+/*
+ * i2c driver
+ */
+static int aw883xx_i2c_probe(struct i2c_client *i2c)
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
+	aw883xx_parse_dt(aw883xx);
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
+	ret = aw883xx_request_firmware_file(aw883xx);
+	if (ret < 0) {
+		dev_err(aw883xx->dev, "%s failed\n", __func__);
+		return ret;
+	}
+
+	ret = snd_soc_register_component(aw883xx->dev,
+			&soc_codec_dev_aw883xx,
+			aw883xx_dai, ARRAY_SIZE(aw883xx_dai));
+	if (ret < 0) {
+		dev_err(aw883xx->dev, "failed to register aw883xx: %d", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void aw883xx_i2c_remove(struct i2c_client *i2c)
+{
+	struct aw883xx *aw883xx = i2c_get_clientdata(i2c);
+
+	aw883xx_dev_deinit(aw883xx->aw_pa);
+	snd_soc_unregister_component(&i2c->dev);
+
+	if (aw883xx->aw_cfg) {
+		vfree(aw883xx->aw_cfg);
+		aw883xx->aw_cfg = NULL;
+	}
+}
+
+static const struct i2c_device_id aw883xx_i2c_id[] = {
+	{ AW_I2C_NAME, 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, aw883xx_i2c_id);
+
+static struct i2c_driver aw883xx_i2c_driver = {
+	.driver = {
+		.name = AW_I2C_NAME,
+		.owner = THIS_MODULE,
+	},
+	.probe_new = aw883xx_i2c_probe,
+	.remove = aw883xx_i2c_remove,
+	.id_table = aw883xx_i2c_id,
+};
+module_i2c_driver(aw883xx_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC AW883XX Smart PA Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/aw883xx/aw883xx.h b/sound/soc/codecs/aw883xx/aw883xx.h
new file mode 100644
index 000000000000..209851cae7ef
--- /dev/null
+++ b/sound/soc/codecs/aw883xx/aw883xx.h
@@ -0,0 +1,81 @@
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
+#include "aw883xx_data_type.h"
+
+#define AW_CHIP_ID_REG			(0x00)
+#define AW_START_RETRIES			(5)
+#define AW_START_WORK_DELAY_MS	(0)
+
+#define AW_DSP_16_DATA_MASK	(0x0000ffff)
+
+#define AW_I2C_NAME "aw883xx_smartpa"
+
+#define AW_RATES (SNDRV_PCM_RATE_8000_48000 | \
+			SNDRV_PCM_RATE_96000)
+#define AW_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
+			SNDRV_PCM_FMTBIT_S24_LE | \
+			SNDRV_PCM_FMTBIT_S32_LE)
+#define AW_REQUEST_FW_RETRIES		5	/* 5 times */
+#define AW_SYNC_LOAD
+
+#define FADE_TIME_MAX 100000
+#define FADE_TIME_MIN 0
+
+#define AW_PROFILE_EXT(xname, profile_info, profile_get, profile_set) \
+{ \
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, \
+	.name = xname, \
+	.info = profile_info, \
+	.get = profile_get, \
+	.put = profile_set, \
+}
+
+enum {
+	AW_SYNC_START = 0,
+	AW_ASYNC_START,
+};
+
+enum {
+	AW883XX_STREAM_CLOSE = 0,
+	AW883XX_STREAM_OPEN,
+};
+
+struct aw883xx {
+	struct i2c_client *i2c;
+	struct device *dev;
+	struct mutex lock;
+	struct mutex dsp_lock;
+	struct snd_soc_component *codec;
+	struct aw_device *aw_pa;
+	struct gpio_desc *reset_gpio;
+	unsigned char phase_sync;	/*phase sync*/
+	bool allow_pw;
+	u8 pstream;
+	struct workqueue_struct *work_queue;
+	struct delayed_work start_work;
+	u16 chip_id;
+	struct regmap *regmap;
+	struct aw_container *aw_cfg;
+};
+
+int aw883xx_init(struct aw883xx *aw883xx);
+
+int aw883xx_dsp_write(struct aw883xx *aw883xx,
+		unsigned short dsp_addr, unsigned int dsp_data, unsigned char data_type);
+int aw883xx_dsp_read(struct aw883xx *aw883xx,
+		unsigned short dsp_addr, unsigned int *dsp_data, unsigned char data_type);
+
+#endif
-- 
2.38.1


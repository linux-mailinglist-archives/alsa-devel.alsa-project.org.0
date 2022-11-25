Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BDD638650
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 10:30:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93DD91722;
	Fri, 25 Nov 2022 10:29:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93DD91722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669368612;
	bh=gLuhJj9UsQF1uw0+HjhTrcNosaKOAmtA7Uy2z99t6a4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DZSbHUCtjIgCDOA5gr4UGqukVFzX62+//L19PbgwiSrjgeyIN3EqRMJw+y1W2e+tE
	 Dkr2h6feQORJvEeNMsRk3wbA7CUvu0tHELLgWyKcAavoEJkd7RKd/JEny8IcngFRFX
	 YEpQdY8SSLLs4jOe2gbm2lsUu65YnlvyNl9dmrwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15B97F8056F;
	Fri, 25 Nov 2022 10:28:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C82FF8055B; Fri, 25 Nov 2022 10:28:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from out28-148.mail.aliyun.com (out28-148.mail.aliyun.com
 [115.124.28.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CDFBF80533
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 10:27:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CDFBF80533
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_enroll_verification|0.00581476-0.00810506-0.98608;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.QGdOLH6_1669368465; 
Received: from shaoer-VirtualBox.mshome.net(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.QGdOLH6_1669368465) by smtp.aliyun-inc.com;
 Fri, 25 Nov 2022 17:27:47 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org, perex@perex.cz, alsa-devel@alsa-project.org,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 quic_potturu@quicinc.com, pierre-louis.bossart@linux.intel.com,
 cy_huang@richtek.com
Subject: [patch v5 3/5] ASoC: codecs: aw883xx chip control logic,
 such as power on and off
Date: Fri, 25 Nov 2022 17:27:25 +0800
Message-Id: <20221125092727.17414-4-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125092727.17414-1-wangweidong.a@awinic.com>
References: <20221115022423.6437-2-wangweidong.a@awinic.com>
 <20221125092727.17414-1-wangweidong.a@awinic.com>
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
 sound/soc/codecs/aw883xx/aw883xx_device.c | 1629 +++++++++++++++++++++
 sound/soc/codecs/aw883xx/aw883xx_device.h |  543 +++++++
 2 files changed, 2172 insertions(+)
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_device.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_device.h

diff --git a/sound/soc/codecs/aw883xx/aw883xx_device.c b/sound/soc/codecs/aw883xx/aw883xx_device.c
new file mode 100644
index 000000000000..4a6f3c1073a9
--- /dev/null
+++ b/sound/soc/codecs/aw883xx/aw883xx_device.c
@@ -0,0 +1,1629 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * aw883xx.c --  ALSA Soc AW883XX codec support
+ *
+ * Copyright (c) 2022 AWINIC Technology CO., LTD
+ *
+ * Author: Bruce zhao <zhaolei@awinic.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/debugfs.h>
+#include <linux/firmware.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <linux/syscalls.h>
+#include <linux/version.h>
+#include <linux/uaccess.h>
+#include <linux/workqueue.h>
+#include <sound/core.h>
+#include <sound/control.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include "aw883xx_data_type.h"
+#include "aw883xx_device.h"
+#include "aw883xx_bin_parse.h"
+#include "aw883xx.h"
+
+#define AW_DEV_SYSST_CHECK_MAX   (10)
+
+enum {
+	AW_EXT_DSP_WRITE_NONE = 0,
+	AW_EXT_DSP_WRITE,
+};
+
+static int aw_dev_reg_dump(struct aw_device *aw_dev)
+{
+	int reg_num = aw_dev->ops.aw_get_reg_num();
+	int i = 0;
+	unsigned int reg_val = 0;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	for (i = 0; i < reg_num; i++) {
+		if (aw_dev->ops.aw_check_rd_access(i)) {
+			aw_dev->ops.aw_reg_read(aw883xx->regmap, i, &reg_val);
+			dev_dbg(aw_dev->dev, "read: reg = 0x%02x, val = 0x%04x",
+				i, reg_val);
+		}
+	}
+
+	return 0;
+}
+
+int aw883xx_dev_set_volume(struct aw_device *aw_dev, uint16_t set_vol)
+{
+	uint16_t hw_vol = 0;
+	int ret = -1;
+	struct aw_volume_desc *vol_desc = &aw_dev->volume_desc;
+
+	hw_vol = set_vol + vol_desc->init_volume;
+
+	ret = aw_dev->ops.aw_set_hw_volume(aw_dev, hw_vol);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "set volume failed");
+		return ret;
+	}
+
+	return 0;
+}
+
+int aw883xx_dev_get_volume(struct aw_device *aw_dev, uint16_t *get_vol)
+{
+	int ret = -1;
+	uint16_t hw_vol = 0;
+	struct aw_volume_desc *vol_desc = &aw_dev->volume_desc;
+
+	ret = aw_dev->ops.aw_get_hw_volume(aw_dev, &hw_vol);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "read volume failed");
+		return ret;
+	}
+
+	*get_vol = hw_vol - vol_desc->init_volume;
+
+	return 0;
+}
+
+static void aw_dev_fade_in(struct aw_device *aw_dev)
+{
+	int i = 0;
+	struct aw_volume_desc *desc = &aw_dev->volume_desc;
+	int fade_step = aw_dev->fade_step;
+	uint16_t fade_in_vol = desc->ctl_volume;
+
+	if (!aw_dev->fade_en)
+		return;
+
+	if (fade_step == 0 || aw_dev->fade_in_time == 0) {
+		aw883xx_dev_set_volume(aw_dev, fade_in_vol);
+		return;
+	}
+	/*volume up*/
+	for (i = desc->mute_volume; i >= fade_in_vol; i -= fade_step) {
+		aw883xx_dev_set_volume(aw_dev, i);
+		usleep_range(aw_dev->fade_in_time, aw_dev->fade_in_time + 10);
+	}
+	if (i != fade_in_vol)
+		aw883xx_dev_set_volume(aw_dev, fade_in_vol);
+
+}
+
+static void aw_dev_fade_out(struct aw_device *aw_dev)
+{
+	int i = 0;
+	struct aw_volume_desc *desc = &aw_dev->volume_desc;
+	int fade_step = aw_dev->fade_step;
+
+	if (!aw_dev->fade_en)
+		return;
+
+	if (fade_step == 0 || aw_dev->fade_out_time == 0) {
+		aw883xx_dev_set_volume(aw_dev, desc->mute_volume);
+		return;
+	}
+
+	for (i = desc->ctl_volume; i <= desc->mute_volume; i += fade_step) {
+		aw883xx_dev_set_volume(aw_dev, i);
+		usleep_range(aw_dev->fade_out_time, aw_dev->fade_out_time + 10);
+	}
+	if (i != desc->mute_volume) {
+		aw883xx_dev_set_volume(aw_dev, desc->mute_volume);
+		usleep_range(aw_dev->fade_out_time, aw_dev->fade_out_time + 10);
+	}
+}
+
+int aw883xx_dev_get_fade_vol_step(struct aw_device *aw_dev)
+{
+	return aw_dev->fade_step;
+}
+
+void aw883xx_dev_set_fade_vol_step(struct aw_device *aw_dev, unsigned int step)
+{
+	aw_dev->fade_step = step;
+}
+
+void aw883xx_dev_get_fade_time(unsigned int *time, bool fade_in, struct aw_device *aw_dev)
+{
+	if (fade_in)
+		*time = aw_dev->fade_in_time;
+	else
+		*time = aw_dev->fade_out_time;
+}
+
+void aw883xx_dev_set_fade_time(unsigned int time, bool fade_in, struct aw_device *aw_dev)
+{
+	if (fade_in)
+		aw_dev->fade_in_time = time;
+	else
+		aw_dev->fade_out_time = time;
+}
+
+int aw883xx_dev_get_cali_re(struct aw_device *aw_dev)
+{
+	return aw_dev->cali_desc.cali_re;
+}
+
+void aw883xx_dev_set_cali_re(struct aw_device *aw_dev, uint32_t cali_re)
+{
+	aw_dev->cali_desc.cali_re = cali_re;
+}
+
+static uint64_t aw_dev_dsp_crc32_reflect(uint64_t ref, uint8_t ch)
+{
+	int i;
+	uint64_t value = 0;
+
+	for (i = 1; i < (ch + 1); i++) {
+		if (ref & 1)
+			value |= 1 << (ch - i);
+
+		ref >>= 1;
+	}
+
+	return value;
+}
+
+static uint32_t aw_dev_calc_dsp_cfg_crc32(uint8_t *buf, uint32_t len)
+{
+	uint8_t i;
+	uint32_t crc = 0xffffffff;
+
+	while (len--) {
+		for (i = 1; i != 0; i <<= 1) {
+			if ((crc & 0x80000000) != 0) {
+				crc <<= 1;
+				crc ^= 0x1EDC6F41;
+			} else {
+				crc <<= 1;
+			}
+
+			if ((*buf & i) != 0)
+				crc ^= 0x1EDC6F41;
+		}
+		buf++;
+	}
+
+	return (aw_dev_dsp_crc32_reflect(crc, 32)^0xffffffff);
+}
+
+static int aw_dev_set_dsp_crc32(struct aw_device *aw_dev)
+{
+	uint32_t crc_value = 0;
+	uint32_t crc_data_len = 0;
+	int ret = -1;
+	struct aw_sec_data_desc *crc_dsp_cfg = &aw_dev->crc_dsp_cfg;
+	struct aw_dsp_crc_desc *desc = &aw_dev->dsp_crc_desc;
+
+	/*get crc data len*/
+	crc_data_len = (desc->dsp_reg - aw_dev->dsp_mem_desc.dsp_cfg_base_addr) * 2;
+	if (crc_data_len > crc_dsp_cfg->len) {
+		dev_err(aw_dev->dev, "crc data len :%d > cfg_data len:%d",
+			crc_data_len, crc_dsp_cfg->len);
+		return -EINVAL;
+	}
+
+	if (crc_data_len % 4 != 0) {
+		dev_err(aw_dev->dev, "The crc data len :%d unsupport", crc_data_len);
+		return -EINVAL;
+	}
+
+	crc_value = aw_dev_calc_dsp_cfg_crc32(crc_dsp_cfg->data, crc_data_len);
+
+	dev_dbg(aw_dev->dev, "crc_value:0x%x", crc_value);
+	ret = aw_dev->ops.aw_dsp_write(aw_dev, desc->dsp_reg, crc_value,
+						desc->data_type);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "set dsp crc value failed");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int aw_dev_dsp_crc_check_enable(struct aw_device *aw_dev, bool flag)
+{
+	struct aw_dsp_crc_desc *dsp_crc_desc = &aw_dev->dsp_crc_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+	int ret;
+
+	if (flag) {
+		ret = aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, dsp_crc_desc->ctl_reg,
+				~dsp_crc_desc->ctl_mask, dsp_crc_desc->ctl_enable);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "enable dsp crc failed");
+			return ret;
+		}
+	} else {
+		ret = aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, dsp_crc_desc->ctl_reg,
+				~dsp_crc_desc->ctl_mask, dsp_crc_desc->ctl_disable);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "close dsp crc failed");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int aw_dev_dsp_st_check(struct aw_device *aw_dev)
+{
+	struct aw_sysst_desc *desc = &aw_dev->sysst_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+	int ret = -1;
+	unsigned int reg_val = 0;
+	int i;
+
+	for (i = 0; i < AW_DSP_ST_CHECK_MAX; i++) {
+		ret = aw_dev->ops.aw_reg_read(aw883xx->regmap, desc->reg, &reg_val);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "read reg0x%x failed", desc->reg);
+			continue;
+		}
+
+		if ((reg_val & (~desc->dsp_mask)) != desc->dsp_check) {
+			dev_err(aw_dev->dev, "check dsp st fail,reg_val:0x%04x", reg_val);
+			ret = -EINVAL;
+			continue;
+		} else {
+			dev_dbg(aw_dev->dev, "dsp st check ok, reg_val:0x%04x", reg_val);
+			return 0;
+		}
+	}
+
+	return ret;
+}
+
+static int aw_dev_dsp_crc32_check(struct aw_device *aw_dev)
+{
+	int ret;
+
+	if (aw_dev->dsp_cfg == AW_DEV_DSP_BYPASS) {
+		dev_info(aw_dev->dev, "dsp bypass");
+		return 0;
+	}
+
+	ret = aw_dev_set_dsp_crc32(aw_dev);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "set dsp crc32 failed");
+		return ret;
+	}
+
+	aw_dev_dsp_crc_check_enable(aw_dev, true);
+
+	/*dsp enable*/
+	aw883xx_dev_dsp_enable(aw_dev, true);
+	usleep_range(AW_5000_US, AW_5000_US + 100);
+
+	ret = aw_dev_dsp_st_check(aw_dev);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "check crc32 fail");
+		return ret;
+	}
+
+	aw_dev_dsp_crc_check_enable(aw_dev, false);
+	aw_dev->dsp_crc_st = AW_DSP_CRC_OK;
+	return 0;
+}
+
+static void aw_dev_pwd(struct aw_device *aw_dev, bool pwd)
+{
+	struct aw_pwd_desc *pwd_desc = &aw_dev->pwd_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	if (pwd) {
+		aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, pwd_desc->reg,
+				~pwd_desc->mask,
+				pwd_desc->enable);
+	} else {
+		aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, pwd_desc->reg,
+				~pwd_desc->mask,
+				pwd_desc->disable);
+	}
+}
+
+static void aw_dev_amppd(struct aw_device *aw_dev, bool amppd)
+{
+	struct aw_amppd_desc *amppd_desc = &aw_dev->amppd_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	if (amppd) {
+		aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, amppd_desc->reg,
+				~amppd_desc->mask,
+				amppd_desc->enable);
+	} else {
+		aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, amppd_desc->reg,
+				~amppd_desc->mask,
+				amppd_desc->disable);
+	}
+}
+
+void aw883xx_dev_mute(struct aw_device *aw_dev, bool mute)
+{
+	struct aw_mute_desc *mute_desc = &aw_dev->mute_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	if (mute) {
+		aw_dev_fade_out(aw_dev);
+		aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, mute_desc->reg,
+				~mute_desc->mask, mute_desc->enable);
+	} else {
+		aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, mute_desc->reg,
+				~mute_desc->mask, mute_desc->disable);
+		aw_dev_fade_in(aw_dev);
+	}
+}
+
+int aw883xx_dev_get_hmute(struct aw_device *aw_dev)
+{
+	unsigned int reg_val = 0;
+	int ret;
+	struct aw_mute_desc *desc = &aw_dev->mute_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	ret = aw_dev->ops.aw_reg_read(aw883xx->regmap, desc->reg, &reg_val);
+	if (ret < 0)
+		return ret;
+
+	if (reg_val & (~desc->mask))
+		ret = 1;
+	else
+		ret = 0;
+
+	return ret;
+}
+
+static int aw_dev_get_icalk(struct aw_device *aw_dev, int16_t *icalk)
+{
+	int ret = -1;
+	unsigned int reg_val = 0;
+	uint16_t reg_icalk = 0;
+	struct aw_vcalb_desc *desc = &aw_dev->vcalb_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	ret = aw_dev->ops.aw_reg_read(aw883xx->regmap, desc->icalk_reg, &reg_val);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "reg read failed");
+		return ret;
+	}
+
+	reg_icalk = reg_val & (~desc->icalk_reg_mask);
+
+	if (reg_icalk & (~desc->icalk_sign_mask))
+		reg_icalk = reg_icalk | desc->icalk_neg_mask;
+
+	*icalk = (int16_t)reg_icalk;
+
+	return 0;
+}
+
+static int aw_dev_get_vcalk(struct aw_device *aw_dev, int16_t *vcalk)
+{
+	int ret = -1;
+	unsigned int reg_val = 0;
+	uint16_t reg_vcalk = 0;
+	struct aw_vcalb_desc *desc = &aw_dev->vcalb_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	ret = aw_dev->ops.aw_reg_read(aw883xx->regmap, desc->vcalk_reg, &reg_val);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "reg read failed");
+		return ret;
+	}
+
+	reg_val = reg_val >> desc->vcalk_shift;
+
+	reg_vcalk = (uint16_t)reg_val & (~desc->vcalk_reg_mask);
+
+	if (reg_vcalk & (~desc->vcalk_sign_mask))
+		reg_vcalk = reg_vcalk | desc->vcalk_neg_mask;
+
+	*vcalk = (int16_t)reg_vcalk;
+
+	return 0;
+}
+
+static int aw_dev_get_vcalk_dac(struct aw_device *aw_dev, int16_t *vcalk)
+{
+	int ret = -1;
+	unsigned int reg_val = 0;
+	uint16_t reg_vcalk = 0;
+	struct aw_vcalb_desc *desc = &aw_dev->vcalb_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	ret = aw_dev->ops.aw_reg_read(aw883xx->regmap, desc->icalk_reg, &reg_val);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "reg read failed");
+		return ret;
+	}
+
+	reg_vcalk = reg_val >> desc->vcalk_dac_shift;
+
+	if (reg_vcalk & desc->vcalk_dac_mask)
+		reg_vcalk = reg_vcalk | desc->vcalk_dac_neg_mask;
+
+	*vcalk = (int16_t)reg_vcalk;
+
+	return 0;
+}
+
+int aw883xx_dev_modify_dsp_cfg(struct aw_device *aw_dev,
+			unsigned int addr, uint32_t dsp_data, unsigned char data_type)
+{
+	uint32_t addr_offset = 0;
+	int len = 0;
+	uint8_t temp_data[4] = { 0 };
+	struct aw_sec_data_desc *crc_dsp_cfg = &aw_dev->crc_dsp_cfg;
+
+	dev_dbg(aw_dev->dev, "addr:0x%x, dsp_data:0x%x", addr, dsp_data);
+
+	switch (data_type) {
+	case AW_DSP_16_DATA:
+		temp_data[0] = (uint8_t)(dsp_data & 0x00ff);
+		temp_data[1] = (uint8_t)((dsp_data & 0xff00) >> 8);
+		len = 2;
+		break;
+	case AW_DSP_32_DATA:
+		temp_data[0] = (uint8_t)(dsp_data & 0x000000ff);
+		temp_data[1] = (uint8_t)((dsp_data & 0x0000ff00) >> 8);
+		temp_data[2] = (uint8_t)((dsp_data & 0x00ff0000) >> 16);
+		temp_data[3] = (uint8_t)((dsp_data & 0xff000000) >> 24);
+		len = 4;
+		break;
+	default:
+		dev_err(aw_dev->dev, "data type[%d] unsupported", data_type);
+		return -EINVAL;
+	}
+
+	addr_offset = (addr - aw_dev->dsp_mem_desc.dsp_cfg_base_addr) * 2;
+	if (addr_offset > crc_dsp_cfg->len) {
+		dev_err(aw_dev->dev, "addr_offset[%d] > crc_dsp_cfg->len[%d]",
+				addr_offset, crc_dsp_cfg->len);
+		return -EINVAL;
+	}
+
+	memcpy(crc_dsp_cfg->data + addr_offset, temp_data, len);
+	return 0;
+}
+
+static int aw_dev_vsense_select(struct aw_device *aw_dev, int *vsense_select)
+{
+	int ret = -1;
+	struct aw_vcalb_desc *desc = &aw_dev->vcalb_desc;
+	unsigned int vsense_reg_val;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	ret = aw_dev->ops.aw_reg_read(aw883xx->regmap, desc->vcalb_vsense_reg, &vsense_reg_val);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "read vsense_reg_val failed");
+		return ret;
+	}
+	dev_dbg(aw_dev->dev, "vsense_reg = 0x%x", vsense_reg_val);
+
+	if (vsense_reg_val & (~desc->vcalk_vdsel_mask)) {
+		*vsense_select = AW_DEV_VDSEL_VSENSE;
+		dev_dbg(aw_dev->dev, "vsense outside");
+		return 0;
+	}
+
+	*vsense_select = AW_DEV_VDSEL_DAC;
+	dev_dbg(aw_dev->dev, "vsense inside");
+	return 0;
+}
+
+static int aw_dev_set_vcalb(struct aw_device *aw_dev)
+{
+	int ret = -1;
+	uint32_t reg_val = 0;
+	int vcalb;
+	int icalk;
+	int vcalk;
+	int16_t icalk_val = 0;
+	int16_t vcalk_val = 0;
+	struct aw_vcalb_desc *desc = &aw_dev->vcalb_desc;
+	uint32_t vcalb_adj;
+	int vsense_select = -1;
+
+	ret = aw_dev->ops.aw_dsp_read(aw_dev, desc->vcalb_dsp_reg, &vcalb_adj, desc->data_type);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "read vcalb_adj failed");
+		return ret;
+	}
+
+	ret = aw_dev_vsense_select(aw_dev, &vsense_select);
+	if (ret < 0)
+		return ret;
+	dev_dbg(aw_dev->dev, "vsense_select = %d", vsense_select);
+
+	ret = aw_dev_get_icalk(aw_dev, &icalk_val);
+	if (ret < 0)
+		return ret;
+	icalk = desc->cabl_base_value + desc->icalk_value_factor * icalk_val;
+
+	switch (vsense_select) {
+	case AW_DEV_VDSEL_VSENSE:
+		ret = aw_dev_get_vcalk(aw_dev, &vcalk_val);
+		if (ret < 0)
+			return ret;
+		vcalk = desc->cabl_base_value + desc->vcalk_value_factor * vcalk_val;
+		vcalb = desc->vcal_factor * desc->vscal_factor /
+			desc->iscal_factor * icalk / vcalk * vcalb_adj;
+
+		dev_dbg(aw_dev->dev, "vcalk_factor=%d, vscal_factor=%d, icalk=%d, vcalk=%d",
+				desc->vcalk_value_factor, desc->vscal_factor, icalk, vcalk);
+		break;
+	case AW_DEV_VDSEL_DAC:
+		ret = aw_dev_get_vcalk_dac(aw_dev, &vcalk_val);
+		if (ret < 0)
+			return ret;
+		vcalk = desc->cabl_base_value + desc->vcalk_value_factor_vsense_in * vcalk_val;
+		vcalb = desc->vcal_factor * desc->vscal_factor_vsense_in /
+			desc->iscal_factor * icalk / vcalk * vcalb_adj;
+
+		dev_dbg(aw_dev->dev, "vcalk_dac_factor=%d, vscal_dac_factor=%d, icalk=%d, vcalk=%d",
+				desc->vcalk_value_factor_vsense_in,
+				desc->vscal_factor_vsense_in, icalk, vcalk);
+		break;
+	default:
+		dev_err(aw_dev->dev, "unsupport vsense status");
+		return -EINVAL;
+	}
+
+	if ((vcalk == 0) || (desc->iscal_factor == 0)) {
+		dev_err(aw_dev->dev, "vcalk:%d or desc->iscal_factor:%d unsupported",
+			vcalk, desc->iscal_factor);
+		return -EINVAL;
+	}
+
+	vcalb = vcalb >> aw_dev->vcalb_desc.vcalb_adj_shift;
+	reg_val = (uint32_t)vcalb;
+
+	dev_dbg(aw_dev->dev, "vcalb=%d, reg_val=0x%x, vcalb_adj =0x%x",
+				vcalb, reg_val, vcalb_adj);
+
+	ret = aw_dev->ops.aw_dsp_write(aw_dev, desc->vcalb_dsp_reg, reg_val, desc->data_type);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "write vcalb failed");
+		return ret;
+	}
+
+	ret = aw883xx_dev_modify_dsp_cfg(aw_dev, desc->vcalb_dsp_reg,
+					(uint32_t)reg_val, desc->data_type);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "modify dsp cfg failed");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int aw_dev_get_cali_f0_delay(struct aw_device *aw_dev)
+{
+	struct aw_cali_delay_desc *desc = &aw_dev->cali_delay_desc;
+	uint32_t cali_delay = 0;
+	int ret = -1;
+
+	ret = aw_dev->ops.aw_dsp_read(aw_dev,
+			desc->dsp_reg, &cali_delay, desc->data_type);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "read cali delay failed, ret=%d", ret);
+		return ret;
+	}
+
+	desc->delay = AW_CALI_DELAY_CACL(cali_delay);
+	dev_dbg(aw_dev->dev, "read cali delay: %d ms", desc->delay);
+
+	return 0;
+}
+
+static int aw883xx_dev_get_int_status(struct aw_device *aw_dev, uint16_t *int_status)
+{
+	int ret = -1;
+	unsigned int reg_val = 0;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	ret = aw_dev->ops.aw_reg_read(aw883xx->regmap, aw_dev->int_desc.st_reg, &reg_val);
+	if (ret < 0)
+		dev_err(aw_dev->dev, "read interrupt reg fail, ret=%d", ret);
+	else
+		*int_status = reg_val;
+
+	dev_dbg(aw_dev->dev, "read interrupt reg = 0x%04x", *int_status);
+	return ret;
+}
+
+static void aw883xx_dev_clear_int_status(struct aw_device *aw_dev)
+{
+	uint16_t int_status = 0;
+
+	/*read int status and clear*/
+	aw883xx_dev_get_int_status(aw_dev, &int_status);
+	/*make sure int status is clear*/
+	aw883xx_dev_get_int_status(aw_dev, &int_status);
+}
+
+int aw883xx_dev_get_iis_status(struct aw_device *aw_dev)
+{
+	int ret = -1;
+	unsigned int reg_val = 0;
+	struct aw_sysst_desc *desc = &aw_dev->sysst_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	aw_dev->ops.aw_reg_read(aw883xx->regmap, desc->reg, &reg_val);
+	if ((reg_val & desc->pll_check) == desc->pll_check)
+		ret = 0;
+	else
+		dev_err(aw_dev->dev, "check pll lock fail,reg_val:0x%04x", reg_val);
+
+	return ret;
+}
+
+static int aw_dev_mode1_pll_check(struct aw_device *aw_dev)
+{
+	int ret = -1;
+	uint16_t i = 0;
+
+	for (i = 0; i < AW_DEV_SYSST_CHECK_MAX; i++) {
+		ret = aw883xx_dev_get_iis_status(aw_dev);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "mode1 iis signal check error");
+			usleep_range(AW_2000_US, AW_2000_US + 10);
+		} else {
+			return 0;
+		}
+	}
+
+	return ret;
+}
+
+static int aw_dev_mode2_pll_check(struct aw_device *aw_dev)
+{
+	int ret = -1;
+	uint16_t i = 0;
+	unsigned int reg_val = 0;
+	struct aw_cco_mux_desc *cco_mux_desc = &aw_dev->cco_mux_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	aw_dev->ops.aw_reg_read(aw883xx->regmap, cco_mux_desc->reg, &reg_val);
+	reg_val &= (~cco_mux_desc->mask);
+	if (reg_val == cco_mux_desc->divider) {
+		dev_dbg(aw_dev->dev, "CCO_MUX is already divider");
+		return ret;
+	}
+
+	/* change mode2 */
+	aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, cco_mux_desc->reg,
+		~cco_mux_desc->mask, cco_mux_desc->divider);
+
+	for (i = 0; i < AW_DEV_SYSST_CHECK_MAX; i++) {
+		ret = aw883xx_dev_get_iis_status(aw_dev);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "mode2 iis signal check error");
+			usleep_range(AW_2000_US, AW_2000_US + 10);
+		} else {
+			break;
+		}
+	}
+
+	/* change mode1*/
+	aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, cco_mux_desc->reg,
+		~cco_mux_desc->mask, cco_mux_desc->bypass);
+
+	if (ret == 0) {
+		usleep_range(AW_2000_US, AW_2000_US + 10);
+		for (i = 0; i < AW_DEV_SYSST_CHECK_MAX; i++) {
+			ret = aw_dev_mode1_pll_check(aw_dev);
+			if (ret < 0) {
+				dev_err(aw_dev->dev, "mode2 switch to mode1, iis signal check error");
+				usleep_range(AW_2000_US, AW_2000_US + 10);
+			} else {
+				break;
+			}
+		}
+	}
+
+	return ret;
+}
+
+int aw883xx_dev_syspll_check(struct aw_device *aw_dev)
+{
+	int ret = -1;
+
+	ret = aw_dev_mode1_pll_check(aw_dev);
+	if (ret < 0) {
+		dev_dbg(aw_dev->dev, "mode1 check iis failed try switch to mode2 check");
+		ret = aw_dev_mode2_pll_check(aw_dev);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "mode2 check iis failed");
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+int aw883xx_dev_sysst_check(struct aw_device *aw_dev)
+{
+	int ret = -1;
+	unsigned char i;
+	unsigned int reg_val = 0;
+	struct aw_sysst_desc *desc = &aw_dev->sysst_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	for (i = 0; i < AW_DEV_SYSST_CHECK_MAX; i++) {
+		aw_dev->ops.aw_reg_read(aw883xx->regmap, desc->reg, &reg_val);
+		if (((reg_val & (~desc->st_mask)) & desc->st_check) != desc->st_check) {
+			dev_dbg(aw_dev->dev, "check fail, cnt=%d, reg_val=0x%04x",
+				i, reg_val);
+			usleep_range(AW_2000_US, AW_2000_US + 10);
+		} else {
+			ret = 0;
+			break;
+		}
+	}
+	if (ret < 0)
+		dev_err(aw_dev->dev, "check fail");
+
+	return ret;
+}
+
+static int aw_dev_sysint_check(struct aw_device *aw_dev)
+{
+	int ret = 0;
+	uint16_t reg_val = 0;
+	struct aw_int_desc *desc = &aw_dev->int_desc;
+
+	aw883xx_dev_get_int_status(aw_dev, &reg_val);
+
+	if (reg_val & (desc->intst_mask)) {
+		dev_err(aw_dev->dev, "pa stop check fail:0x%04x", reg_val);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static void aw_dev_get_cur_mode_st(struct aw_device *aw_dev)
+{
+	unsigned int reg_val;
+	struct aw_profctrl_desc *profctrl_desc = &aw_dev->profctrl_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	aw_dev->ops.aw_reg_read(aw883xx->regmap, aw_dev->pwd_desc.reg, &reg_val);
+	if ((reg_val & (~profctrl_desc->mask)) == profctrl_desc->rcv_mode_val)
+		profctrl_desc->cur_mode = AW_RCV_MODE;
+	else
+		profctrl_desc->cur_mode = AW_NOT_RCV_MODE;
+}
+
+void aw883xx_dev_dsp_enable(struct aw_device *aw_dev, bool dsp)
+{
+	int ret = -1;
+	struct aw_dsp_en_desc *desc = &aw_dev->dsp_en_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	if (dsp) {
+		ret = aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, desc->reg,
+					~desc->mask, desc->enable);
+		if (ret < 0)
+			dev_err(aw_dev->dev, "enable dsp failed");
+	} else {
+		ret = aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, desc->reg,
+					~desc->mask, desc->disable);
+		if (ret < 0)
+			dev_err(aw_dev->dev, "disable dsp failed");
+	}
+}
+
+static int aw_dev_get_dsp_config(struct aw_device *aw_dev, unsigned char *dsp_cfg)
+{
+	int ret = -1;
+	unsigned int reg_val = 0;
+	struct aw_dsp_en_desc *desc = &aw_dev->dsp_en_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	ret = aw_dev->ops.aw_reg_read(aw883xx->regmap, desc->reg, &reg_val);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "reg read failed");
+		return ret;
+	}
+
+	if (reg_val & (~desc->mask))
+		*dsp_cfg = AW_DEV_DSP_BYPASS;
+	else
+		*dsp_cfg = AW_DEV_DSP_WORK;
+
+	return 0;
+}
+
+void aw883xx_dev_memclk_select(struct aw_device *aw_dev, unsigned char flag)
+{
+	struct aw_memclk_desc *desc = &aw_dev->memclk_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+	int ret = -1;
+
+	switch (flag) {
+	case AW_DEV_MEMCLK_PLL:
+		ret = aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, desc->reg,
+					~desc->mask, desc->mcu_hclk);
+		if (ret < 0)
+			dev_err(aw_dev->dev, "memclk select pll failed");
+		break;
+	case AW_DEV_MEMCLK_OSC:
+		ret = aw_dev->ops.aw_reg_write_bits(aw883xx->regmap, desc->reg,
+					~desc->mask, desc->osc_clk);
+		if (ret < 0)
+			dev_err(aw_dev->dev, "memclk select OSC failed");
+		break;
+	default:
+		dev_err(aw_dev->dev, "unknown memclk config, flag=0x%x", flag);
+		break;
+	}
+}
+
+int aw883xx_dev_get_dsp_status(struct aw_device *aw_dev)
+{
+	int ret = -1;
+	unsigned int reg_val = 0;
+	struct aw_watch_dog_desc *desc = &aw_dev->watch_dog_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	aw_dev->ops.aw_reg_read(aw883xx->regmap, desc->reg, &reg_val);
+	if (reg_val & (~desc->mask))
+		ret = 0;
+
+	return ret;
+}
+
+static int aw_dev_get_vmax(struct aw_device *aw_dev, unsigned int *vmax)
+{
+	int ret = -1;
+	struct aw_vmax_desc *desc = &aw_dev->vmax_desc;
+
+	ret = aw_dev->ops.aw_dsp_read(aw_dev, desc->dsp_reg, vmax, desc->data_type);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "get vmax failed");
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * aw_dev update cfg
+ */
+static int aw_dev_reg_container_update(struct aw_device *aw_dev,
+				uint8_t *data, uint32_t len)
+{
+	int i, ret;
+	uint8_t reg_addr = 0;
+	uint16_t reg_val = 0;
+	unsigned int read_val = 0;
+	uint16_t read_vol = 0;
+	struct aw_volume_desc *vol_desc = &aw_dev->volume_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+	int16_t *reg_data = NULL;
+	int data_len;
+
+	reg_data = (int16_t *)data;
+	data_len = len >> 1;
+
+	if (data_len % 2 != 0) {
+		dev_err(aw_dev->dev, "data len:%d unsupported",
+				data_len);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < data_len; i += 2) {
+		reg_addr = reg_data[i];
+		reg_val = reg_data[i + 1];
+		dev_dbg(aw_dev->dev, "reg = 0x%02x, val = 0x%04x",
+				reg_addr, reg_val);
+		if (reg_addr == aw_dev->mute_desc.reg) {
+			aw_dev->ops.aw_reg_read(aw883xx->regmap, reg_addr, &read_val);
+			read_val &= (~aw_dev->mute_desc.mask);
+			reg_val &= aw_dev->mute_desc.mask;
+			reg_val |= read_val;
+		}
+		if (reg_addr == aw_dev->dsp_crc_desc.ctl_reg)
+			reg_val &= aw_dev->dsp_crc_desc.ctl_mask;
+
+		if (reg_addr == aw_dev->chansel_desc.txchan_reg) {
+			/*close tx*/
+			reg_val &= aw_dev->tx_en_desc.tx_en_mask;
+			reg_val |= aw_dev->tx_en_desc.tx_disable;
+		}
+
+		if (reg_addr == aw_dev->volume_desc.reg) {
+			read_vol = (reg_val & (~aw_dev->volume_desc.mask)) >>
+				aw_dev->volume_desc.shift;
+			aw_dev->volume_desc.init_volume =
+				aw_dev->ops.aw_reg_val_to_db(read_vol);
+		}
+		ret = aw_dev->ops.aw_reg_write(aw883xx->regmap, reg_addr, reg_val);
+		if (ret < 0)
+			break;
+
+	}
+
+	aw_dev_get_cur_mode_st(aw_dev);
+
+	if (aw_dev->cur_prof != aw_dev->set_prof) {
+		/*clear control volume when PA change profile*/
+		vol_desc->ctl_volume = 0;
+	} else {
+		/*keep control volume when PA start with sync mode*/
+		aw883xx_dev_set_volume(aw_dev, vol_desc->ctl_volume);
+	}
+
+	/*keep min volume*/
+	if (aw_dev->fade_en)
+		aw883xx_dev_set_volume(aw_dev, vol_desc->mute_volume);
+
+	aw_dev_get_dsp_config(aw_dev, &aw_dev->dsp_cfg);
+
+	dev_dbg(aw_dev->dev, "exit");
+
+	return ret;
+}
+
+static int aw_dev_reg_update(struct aw_device *aw_dev,
+					uint8_t *data, uint32_t len)
+{
+
+	dev_dbg(aw_dev->dev, "reg len:%d", len);
+
+	if (len && (data != NULL)) {
+		aw_dev_reg_container_update(aw_dev, data, len);
+	} else {
+		dev_err(aw_dev->dev, "reg data is null or len is 0");
+		return -EPERM;
+	}
+
+	return 0;
+}
+
+static int aw_dev_get_ra(struct aw_cali_desc *cali_desc)
+{
+	int ret;
+	uint32_t dsp_ra;
+	struct aw_device *aw_dev =
+		container_of(cali_desc, struct aw_device, cali_desc);
+	struct aw_ra_desc *desc = &aw_dev->ra_desc;
+
+	ret = aw_dev->ops.aw_dsp_read(aw_dev, desc->dsp_reg,
+				&dsp_ra, desc->data_type);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "read ra error");
+		return ret;
+	}
+
+	cali_desc->ra = AW_DSP_RE_TO_SHOW_RE(dsp_ra,
+					aw_dev->adpz_re_desc.shift);
+	dev_dbg(aw_dev->dev, "get ra:%d", cali_desc->ra);
+	return 0;
+}
+
+static int aw_dev_dsp_container_update(struct aw_device *aw_dev,
+			uint8_t *data, uint32_t len, uint16_t base)
+{
+	int i;
+	struct aw_dsp_mem_desc *dsp_mem_desc = &aw_dev->dsp_mem_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+#ifdef AW_DSP_I2C_WRITES
+	uint32_t tmp_len = 0;
+#else
+	uint16_t reg_val = 0;
+#endif
+
+	mutex_lock(aw_dev->dsp_lock);
+#ifdef AW_DSP_I2C_WRITES
+	/* i2c writes */
+	aw_dev->ops.aw_i2c_write(aw883xx->regmap, dsp_mem_desc->dsp_madd_reg, base);
+
+	for (i = 0; i < len; i += AW_MAX_RAM_WRITE_BYTE_SIZE) {
+		if ((len - i) < AW_MAX_RAM_WRITE_BYTE_SIZE)
+			tmp_len = len - i;
+		else
+			tmp_len = AW_MAX_RAM_WRITE_BYTE_SIZE;
+		aw_dev->ops.aw_i2c_writes(aw883xx->regmap, dsp_mem_desc->dsp_mdat_reg,
+					&data[i], tmp_len);
+	}
+
+#else
+	/* i2c write */
+	aw_dev->ops.aw_i2c_write(aw883xx->regmap, dsp_mem_desc->dsp_madd_reg, base);
+	for (i = 0; i < len; i += 2) {
+		reg_val = (data[i] << 8) + data[i + 1];
+		aw_dev->ops.aw_i2c_write(aw883xx->regmap, dsp_mem_desc->dsp_mdat_reg,
+					reg_val);
+	}
+#endif
+	mutex_unlock(aw_dev->dsp_lock);
+	dev_dbg(aw_dev->dev, "exit");
+
+	return 0;
+}
+
+static int aw_dev_dsp_fw_update(struct aw_device *aw_dev,
+			uint8_t *data, uint32_t len)
+{
+	struct aw_dsp_mem_desc *dsp_mem_desc = &aw_dev->dsp_mem_desc;
+
+	dev_dbg(aw_dev->dev, "dsp firmware len:%d", len);
+
+	if (len && (data != NULL)) {
+		aw_dev_dsp_container_update(aw_dev,
+			data, len, dsp_mem_desc->dsp_fw_base_addr);
+		aw_dev->dsp_fw_len = len;
+	} else {
+		dev_err(aw_dev->dev, "dsp firmware data is null or len is 0");
+		return -EPERM;
+	}
+
+	return 0;
+}
+
+static int aw_dev_copy_to_crc_dsp_cfg(struct aw_device *aw_dev,
+			uint8_t *data, uint32_t size)
+{
+	struct aw_sec_data_desc *crc_dsp_cfg = &aw_dev->crc_dsp_cfg;
+	int ret;
+
+	if (!crc_dsp_cfg->data) {
+		crc_dsp_cfg->data = devm_kzalloc(aw_dev->dev, size, GFP_KERNEL);
+		if (!crc_dsp_cfg->data)
+			return -ENOMEM;
+		crc_dsp_cfg->len = size;
+	} else if (crc_dsp_cfg->len < size) {
+		devm_kfree(aw_dev->dev, crc_dsp_cfg->data);
+		crc_dsp_cfg->data = NULL;
+		crc_dsp_cfg->data = devm_kzalloc(aw_dev->dev, size, GFP_KERNEL);
+		if (!crc_dsp_cfg->data) {
+			dev_err(aw_dev->dev, "error allocating memory");
+			return -ENOMEM;
+		}
+		crc_dsp_cfg->len = size;
+	}
+	memcpy(crc_dsp_cfg->data, data, size);
+	ret = aw883xx_dev_dsp_data_order(aw_dev, crc_dsp_cfg->data, size);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+int aw883xx_dev_dsp_cfg_update(struct aw_device *aw_dev,
+			uint8_t *data, uint32_t len)
+{
+	struct aw_dsp_mem_desc *dsp_mem_desc = &aw_dev->dsp_mem_desc;
+	int ret;
+
+	dev_dbg(aw_dev->dev, "dsp config len:%d", len);
+
+	if (len && (data != NULL)) {
+		aw_dev_dsp_container_update(aw_dev,
+			data, len, dsp_mem_desc->dsp_cfg_base_addr);
+		aw_dev->dsp_cfg_len = len;
+
+		ret = aw_dev_copy_to_crc_dsp_cfg(aw_dev, data, len);
+		if (ret < 0)
+			return ret;
+
+		aw_dev_set_vcalb(aw_dev);
+		aw_dev_get_ra(&aw_dev->cali_desc);
+		aw_dev_get_cali_f0_delay(aw_dev);
+
+		ret = aw_dev_get_vmax(aw_dev, &aw_dev->vmax_desc.init_vmax);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "get vmax failed");
+			return ret;
+		}
+		dev_dbg(aw_dev->dev, "get init vmax:0x%x",
+						aw_dev->vmax_desc.init_vmax);
+		aw_dev->dsp_crc_st = AW_DSP_CRC_NA;
+	} else {
+		dev_err(aw_dev->dev, "dsp config data is null or len is 0");
+		return -EPERM;
+	}
+
+	return 0;
+}
+
+static int aw_dev_sram_check(struct aw_device *aw_dev)
+{
+	int ret = -1;
+	unsigned int reg_val = 0;
+	struct aw_dsp_mem_desc *dsp_mem_desc = &aw_dev->dsp_mem_desc;
+	struct aw883xx *aw883xx = aw_dev->private_data;
+
+	mutex_lock(aw_dev->dsp_lock);
+	/*check the odd bits of reg 0x40*/
+	aw_dev->ops.aw_i2c_write(aw883xx->regmap, dsp_mem_desc->dsp_madd_reg,
+					AW_DSP_ODD_NUM_BIT_TEST);
+	aw_dev->ops.aw_i2c_read(aw883xx->regmap, dsp_mem_desc->dsp_madd_reg, &reg_val);
+	if (reg_val != AW_DSP_ODD_NUM_BIT_TEST) {
+		dev_err(aw_dev->dev, "check reg 0x40 odd bit failed, read[0x%x] does not match write[0x%x]",
+				reg_val, AW_DSP_ODD_NUM_BIT_TEST);
+		goto error;
+	}
+
+	/*check the even bits of reg 0x40*/
+	aw_dev->ops.aw_i2c_write(aw883xx->regmap, dsp_mem_desc->dsp_madd_reg,
+					AW_DSP_EVEN_NUM_BIT_TEST);
+	aw_dev->ops.aw_i2c_read(aw883xx->regmap, dsp_mem_desc->dsp_madd_reg, &reg_val);
+	if (reg_val != AW_DSP_EVEN_NUM_BIT_TEST) {
+		dev_err(aw_dev->dev, "check reg 0x40 even bit failed, read[0x%x] does not match write[0x%x]",
+				reg_val, AW_DSP_EVEN_NUM_BIT_TEST);
+		goto error;
+	}
+
+	/*check dsp_fw_base_addr*/
+	aw_dev->ops.aw_i2c_write(aw883xx->regmap, dsp_mem_desc->dsp_madd_reg,
+					dsp_mem_desc->dsp_fw_base_addr);
+	aw_dev->ops.aw_i2c_write(aw883xx->regmap, dsp_mem_desc->dsp_mdat_reg,
+					AW_DSP_EVEN_NUM_BIT_TEST);
+
+	aw_dev->ops.aw_i2c_write(aw883xx->regmap, dsp_mem_desc->dsp_madd_reg,
+					dsp_mem_desc->dsp_fw_base_addr);
+	aw_dev->ops.aw_i2c_read(aw883xx->regmap, dsp_mem_desc->dsp_mdat_reg, &reg_val);
+	if (reg_val != AW_DSP_EVEN_NUM_BIT_TEST) {
+		dev_err(aw_dev->dev, "check dsp fw addr failed, read[0x%x] does not match write[0x%x]",
+						reg_val, AW_DSP_EVEN_NUM_BIT_TEST);
+		goto error;
+	}
+
+	/*check dsp_cfg_base_addr*/
+	aw_dev->ops.aw_i2c_write(aw883xx->regmap, dsp_mem_desc->dsp_madd_reg,
+					dsp_mem_desc->dsp_cfg_base_addr);
+	aw_dev->ops.aw_i2c_write(aw883xx->regmap, dsp_mem_desc->dsp_mdat_reg,
+					AW_DSP_ODD_NUM_BIT_TEST);
+
+	aw_dev->ops.aw_i2c_write(aw883xx->regmap, dsp_mem_desc->dsp_madd_reg,
+					dsp_mem_desc->dsp_cfg_base_addr);
+	aw_dev->ops.aw_i2c_read(aw883xx->regmap, dsp_mem_desc->dsp_mdat_reg, &reg_val);
+	if (reg_val != AW_DSP_ODD_NUM_BIT_TEST) {
+		dev_err(aw_dev->dev, "check dsp cfg failed, read[0x%x] does not match write[0x%x]",
+						reg_val, AW_DSP_ODD_NUM_BIT_TEST);
+		goto error;
+	}
+
+	mutex_unlock(aw_dev->dsp_lock);
+	return 0;
+
+error:
+	mutex_unlock(aw_dev->dsp_lock);
+	return ret;
+}
+
+int aw883xx_dev_fw_update(struct aw_device *aw_dev, bool up_dsp_fw_en, bool force_up_en)
+{
+	int ret = -1;
+	struct aw_prof_desc *set_prof_desc = NULL;
+	struct aw_sec_data_desc *sec_desc = NULL;
+	char *prof_name = NULL;
+
+	if ((aw_dev->cur_prof == aw_dev->set_prof) &&
+			(force_up_en == AW_FORCE_UPDATE_OFF)) {
+		dev_dbg(aw_dev->dev, "scene no change, not update");
+		return 0;
+	}
+
+	if (aw_dev->fw_status == AW_DEV_FW_FAILED) {
+		dev_err(aw_dev->dev, "fw status[%d] error", aw_dev->fw_status);
+		return -EPERM;
+	}
+
+	prof_name = aw_dev_get_prof_name(aw_dev, aw_dev->set_prof);
+	if (!prof_name)
+		return -ENOMEM;
+
+	dev_dbg(aw_dev->dev, "start update %s", prof_name);
+
+	ret = aw883xx_dev_get_prof_data(aw_dev, aw_dev->set_prof, &set_prof_desc);
+	if (ret < 0)
+		return ret;
+
+	/*update reg*/
+	sec_desc = set_prof_desc->sec_desc;
+	ret = aw_dev_reg_update(aw_dev, sec_desc[AW_DATA_TYPE_REG].data,
+					sec_desc[AW_DATA_TYPE_REG].len);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "update reg failed");
+		return ret;
+	}
+
+	aw883xx_dev_mute(aw_dev, true);
+
+	if (aw_dev->dsp_cfg == AW_DEV_DSP_WORK)
+		aw883xx_dev_dsp_enable(aw_dev, false);
+
+	aw883xx_dev_memclk_select(aw_dev, AW_DEV_MEMCLK_OSC);
+
+	if (up_dsp_fw_en) {
+		ret = aw_dev_sram_check(aw_dev);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "check sram failed");
+			goto error;
+		}
+
+		/*update dsp firmware*/
+		dev_dbg(aw_dev->dev, "fw_ver: [%x]", set_prof_desc->fw_ver);
+		ret = aw_dev_dsp_fw_update(aw_dev, sec_desc[AW_DATA_TYPE_DSP_FW].data,
+					sec_desc[AW_DATA_TYPE_DSP_FW].len);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "update dsp fw failed");
+			goto error;
+		}
+	}
+
+	/*update dsp config*/
+	ret = aw883xx_dev_dsp_cfg_update(aw_dev, sec_desc[AW_DATA_TYPE_DSP_CFG].data,
+					sec_desc[AW_DATA_TYPE_DSP_CFG].len);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "update dsp cfg failed");
+		goto error;
+	}
+
+	aw883xx_dev_memclk_select(aw_dev, AW_DEV_MEMCLK_PLL);
+
+	aw_dev->cur_prof = aw_dev->set_prof;
+
+	return 0;
+
+error:
+	aw883xx_dev_memclk_select(aw_dev, AW_DEV_MEMCLK_PLL);
+
+	return ret;
+}
+
+int aw883xx_dev_dsp_check(struct aw_device *aw_dev)
+{
+	int ret = -1;
+	uint16_t i = 0;
+
+	switch (aw_dev->dsp_cfg) {
+	case AW_DEV_DSP_BYPASS:
+		dev_dbg(aw_dev->dev, "dsp bypass");
+		ret = 0;
+		break;
+	case AW_DEV_DSP_WORK:
+		aw883xx_dev_dsp_enable(aw_dev, false);
+		aw883xx_dev_dsp_enable(aw_dev, true);
+		usleep_range(AW_1000_US, AW_1000_US + 10);
+		for (i = 0; i < AW_DEV_DSP_CHECK_MAX; i++) {
+			ret = aw883xx_dev_get_dsp_status(aw_dev);
+			if (ret < 0) {
+				dev_err(aw_dev->dev, "dsp wdt status error=%d", ret);
+				usleep_range(AW_2000_US, AW_2000_US + 10);
+			}
+		}
+		break;
+	default:
+		dev_err(aw_dev->dev, "unknown dsp cfg=%d", aw_dev->dsp_cfg);
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int aw_dev_set_cfg_f0_fs(struct aw_device *aw_dev)
+{
+	uint32_t f0_fs = 0;
+	struct aw_cfgf0_fs_desc *cfgf0_fs_desc = &aw_dev->cfgf0_fs_desc;
+	int ret;
+
+	if (aw_dev->ops.aw_set_cfg_f0_fs) {
+		aw_dev->ops.aw_set_cfg_f0_fs(aw_dev, &f0_fs);
+		ret = aw883xx_dev_modify_dsp_cfg(aw_dev, cfgf0_fs_desc->dsp_reg,
+					f0_fs, cfgf0_fs_desc->data_type);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "modify dsp cfg failed");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void aw_dev_cali_re_update(struct aw_cali_desc *cali_desc)
+{
+	int ret = 0;
+	struct aw_device *aw_dev =
+		container_of(cali_desc, struct aw_device, cali_desc);
+
+	if (aw_dev->cali_desc.cali_re < AW_CALI_RE_MAX &&
+		aw_dev->cali_desc.cali_re > AW_CALI_RE_MIN) {
+		if (aw_dev->ops.aw_set_cali_re) {
+			ret = aw_dev->ops.aw_set_cali_re(aw_dev);
+			if (ret < 0)
+				dev_err(aw_dev->dev, "set cali re failed");
+		} else {
+			dev_err(aw_dev->dev, "cali_re:%d out of range, no set",
+				aw_dev->cali_desc.cali_re);
+		}
+	}
+}
+
+int aw883xx_device_start(struct aw_device *aw_dev)
+{
+	int ret = -1;
+
+	if (aw_dev->status == AW_DEV_PW_ON) {
+		dev_info(aw_dev->dev, "already power on");
+		return 0;
+	}
+
+	/*power on*/
+	aw_dev_pwd(aw_dev, false);
+	usleep_range(AW_2000_US, AW_2000_US + 10);
+
+	ret = aw883xx_dev_syspll_check(aw_dev);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "pll check failed cannot start");
+		aw_dev_reg_dump(aw_dev);
+		goto pll_check_fail;
+	}
+
+	/*amppd on*/
+	aw_dev_amppd(aw_dev, false);
+	usleep_range(AW_1000_US, AW_1000_US + 50);
+
+	/*check i2s status*/
+	ret = aw883xx_dev_sysst_check(aw_dev);
+	if (ret < 0) {
+		/*check failed*/
+		aw_dev_reg_dump(aw_dev);
+		goto sysst_check_fail;
+	}
+
+	if (aw_dev->dsp_cfg == AW_DEV_DSP_WORK) {
+		/*dsp bypass*/
+		aw883xx_dev_dsp_enable(aw_dev, false);
+		if (aw_dev->ops.aw_dsp_fw_check) {
+			ret = aw_dev->ops.aw_dsp_fw_check(aw_dev);
+			if (ret < 0) {
+				aw_dev_reg_dump(aw_dev);
+				goto dsp_fw_check_fail;
+			}
+		}
+		aw_dev_set_cfg_f0_fs(aw_dev);
+
+		aw_dev_cali_re_update(&aw_dev->cali_desc);
+
+		if (aw_dev->dsp_crc_st != AW_DSP_CRC_OK) {
+			ret = aw_dev_dsp_crc32_check(aw_dev);
+			if (ret < 0) {
+				dev_err(aw_dev->dev, "dsp crc check failed");
+				aw_dev_reg_dump(aw_dev);
+				goto crc_check_fail;
+			}
+		}
+
+		ret = aw883xx_dev_dsp_check(aw_dev);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "check dsp status failed");
+			aw_dev_reg_dump(aw_dev);
+			goto dsp_check_fail;
+		}
+	} else {
+		dev_dbg(aw_dev->dev, "start pa with dsp bypass");
+	}
+
+	/*enable tx feedback*/
+	if (aw_dev->ops.aw_i2s_tx_enable)
+		aw_dev->ops.aw_i2s_tx_enable(aw_dev, true);
+
+	/*close mute*/
+	aw883xx_dev_mute(aw_dev, false);
+	/*clear inturrupt*/
+	aw883xx_dev_clear_int_status(aw_dev);
+	aw_dev->status = AW_DEV_PW_ON;
+
+	return 0;
+
+dsp_check_fail:
+crc_check_fail:
+	aw883xx_dev_dsp_enable(aw_dev, false);
+dsp_fw_check_fail:
+sysst_check_fail:
+	aw883xx_dev_clear_int_status(aw_dev);
+	aw_dev_amppd(aw_dev, true);
+pll_check_fail:
+	aw_dev_pwd(aw_dev, true);
+	aw_dev->status = AW_DEV_PW_OFF;
+	return ret;
+}
+
+int aw883xx_device_stop(struct aw_device *aw_dev)
+{
+	struct aw_sec_data_desc *dsp_cfg =
+		&aw_dev->prof_info.prof_desc[aw_dev->cur_prof].sec_desc[AW_DATA_TYPE_DSP_CFG];
+	struct aw_sec_data_desc *dsp_fw =
+		&aw_dev->prof_info.prof_desc[aw_dev->cur_prof].sec_desc[AW_DATA_TYPE_DSP_FW];
+	int int_st = 0;
+
+	if (aw_dev->status == AW_DEV_PW_OFF) {
+		dev_info(aw_dev->dev, "already power off");
+		return 0;
+	}
+
+	aw_dev->status = AW_DEV_PW_OFF;
+
+	/*set mute*/
+	aw883xx_dev_mute(aw_dev, true);
+	usleep_range(AW_4000_US, AW_4000_US + 100);
+
+	/*close tx feedback*/
+	if (aw_dev->ops.aw_i2s_tx_enable)
+		aw_dev->ops.aw_i2s_tx_enable(aw_dev, false);
+	usleep_range(AW_1000_US, AW_1000_US + 100);
+
+	/*check sysint state*/
+	int_st = aw_dev_sysint_check(aw_dev);
+
+	/*close dsp*/
+	aw883xx_dev_dsp_enable(aw_dev, false);
+
+	/*enable amppd*/
+	aw_dev_amppd(aw_dev, true);
+
+	if (int_st < 0) {
+		/*system status anomaly*/
+		aw883xx_dev_memclk_select(aw_dev, AW_DEV_MEMCLK_OSC);
+		aw_dev_dsp_fw_update(aw_dev, dsp_fw->data, dsp_fw->len);
+		aw883xx_dev_dsp_cfg_update(aw_dev, dsp_cfg->data, dsp_cfg->len);
+		aw883xx_dev_memclk_select(aw_dev, AW_DEV_MEMCLK_PLL);
+	}
+
+	/*set power down*/
+	aw_dev_pwd(aw_dev, true);
+
+	return 0;
+}
+
+/*deinit aw_device*/
+void aw883xx_dev_deinit(struct aw_device *aw_dev)
+{
+	if (!aw_dev)
+		return;
+
+	if (aw_dev->prof_info.prof_desc) {
+		devm_kfree(aw_dev->dev, aw_dev->prof_info.prof_desc);
+		aw_dev->prof_info.prof_desc = NULL;
+	}
+	aw_dev->prof_info.count = 0;
+
+	if (aw_dev->crc_dsp_cfg.data) {
+		aw_dev->crc_dsp_cfg.len = 0;
+		devm_kfree(aw_dev->dev, aw_dev->crc_dsp_cfg.data);
+		aw_dev->crc_dsp_cfg.data = NULL;
+	}
+
+}
+
+/*init aw_device*/
+int aw883xx_device_init(struct aw_device *aw_dev, struct aw_container *aw_cfg)
+{
+	int ret;
+
+	if ((!aw_dev) || (!aw_cfg)) {
+		pr_err("aw_dev is NULL or aw_cfg is NULL");
+		return -ENOMEM;
+	}
+
+	ret = aw883xx_dev_cfg_load(aw_dev, aw_cfg);
+	if (ret < 0) {
+		aw883xx_dev_deinit(aw_dev);
+		dev_err(aw_dev->dev, "aw_dev acf parse failed");
+		return -EINVAL;
+	}
+	aw_dev->fade_in_time = AW_1000_US / 10;
+	aw_dev->fade_out_time = AW_1000_US >> 1;
+
+	aw_dev->cur_prof = aw_dev->prof_info.prof_desc[0].id;
+	aw_dev->set_prof = aw_dev->prof_info.prof_desc[0].id;
+	ret = aw883xx_dev_fw_update(aw_dev, AW_FORCE_UPDATE_ON,
+			AW_DSP_FW_UPDATE_ON);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "fw update failed");
+		return ret;
+	}
+
+	/*set mute*/
+	aw883xx_dev_mute(aw_dev, true);
+	usleep_range(AW_4000_US, AW_4000_US + 100);
+
+	/*close tx feedback*/
+	if (aw_dev->ops.aw_i2s_tx_enable)
+		aw_dev->ops.aw_i2s_tx_enable(aw_dev, false);
+	usleep_range(AW_1000_US, AW_1000_US + 100);
+
+	/*close dsp*/
+	aw883xx_dev_dsp_enable(aw_dev, false);
+	/*enable amppd*/
+	aw_dev_amppd(aw_dev, true);
+	/*set power down*/
+	aw_dev_pwd(aw_dev, true);
+
+	return 0;
+}
+
+static void aw883xx_parse_channel_dt(struct aw_device *aw_dev)
+{
+	int ret;
+	uint32_t channel_value;
+	struct device_node *np = aw_dev->dev->of_node;
+
+	ret = of_property_read_u32(np, "sound-channel", &channel_value);
+	if (ret < 0) {
+		dev_dbg(aw_dev->dev,
+			"read sound-channel failed,use default 0");
+		aw_dev->channel = AW_DEV_DEFAULT_CH;
+		return;
+	}
+
+	dev_dbg(aw_dev->dev, "read sound-channel value is: %d",
+			channel_value);
+	aw_dev->channel = channel_value;
+}
+
+static void aw883xx_parse_fade_enable_dt(struct aw_device *aw_dev)
+{
+	int ret = -1;
+	struct device_node *np = aw_dev->dev->of_node;
+	uint32_t fade_en;
+
+	ret = of_property_read_u32(np, "fade-enable", &fade_en);
+	if (ret < 0) {
+		dev_dbg(aw_dev->dev,
+			"read fade-enable failed, close fade_in_out");
+		fade_en = AW_FADE_IN_OUT_DEFAULT;
+	} else {
+		dev_dbg(aw_dev->dev, "read fade-enable value is: %d", fade_en);
+	}
+
+	aw_dev->fade_en = fade_en;
+}
+
+static void aw_device_parse_dt(struct aw_device *aw_dev)
+{
+	aw883xx_parse_channel_dt(aw_dev);
+	aw883xx_parse_fade_enable_dt(aw_dev);
+}
+
+int aw883xx_device_probe(struct aw_device *aw_dev)
+{
+	aw_device_parse_dt(aw_dev);
+
+	return 0;
+}
+
+int aw883xx_device_remove(struct aw_device *aw_dev)
+{
+	return 0;
+}
+
diff --git a/sound/soc/codecs/aw883xx/aw883xx_device.h b/sound/soc/codecs/aw883xx/aw883xx_device.h
new file mode 100644
index 000000000000..77bf0b04a363
--- /dev/null
+++ b/sound/soc/codecs/aw883xx/aw883xx_device.h
@@ -0,0 +1,543 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * aw883xx.c --  ALSA Soc AW883XX codec support
+ *
+ * Copyright (c) 2022 AWINIC Technology CO., LTD
+ *
+ * Author: Bruce zhao <zhaolei@awinic.com>
+ */
+
+#ifndef __AW883XX_DEVICE_FILE_H__
+#define __AW883XX_DEVICE_FILE_H__
+
+#include "aw883xx_data_type.h"
+
+
+#define AW_DEV_DEFAULT_CH	(0)
+#define AW_DEV_I2S_CHECK_MAX	(5)
+#define AW_DEV_DSP_CHECK_MAX	(5)
+
+/*
+ * DSP I2C WRITES
+ */
+#define AW_DSP_I2C_WRITES
+#define AW_MAX_RAM_WRITE_BYTE_SIZE	(128)
+#define AW_DSP_ODD_NUM_BIT_TEST		(0x5555)
+#define AW_DSP_EVEN_NUM_BIT_TEST	(0xAAAA)
+#define AW_DSP_ST_CHECK_MAX		(2)
+#define AW_FADE_IN_OUT_DEFAULT		(0)
+#define AW_CALI_DELAY_CACL(value) ((value * 32) / 48)
+#define AW_CALI_RE_MAX (15000)
+#define AW_CALI_RE_MIN (4000)
+
+#define AW_GET_MIN_VALUE(value1, value2) \
+	((value1) > (value2) ? (value2) : (value1))
+
+#define AW_GET_MAX_VALUE(value1, value2) \
+	((value1) > (value2) ? (value1) : (value2))
+
+#define AW_DSP_RE_TO_SHOW_RE(re, shift) (((re) * (1000)) >> (shift))
+#define AW_SHOW_RE_TO_DSP_RE(re, shift)  (((re) << shift) / (1000))
+
+struct aw_device;
+
+enum {
+	AW_DEV_VDSEL_DAC = 0,
+	AW_DEV_VDSEL_VSENSE = 1,
+};
+
+enum {
+	AW_DSP_CRC_NA = 0,
+	AW_DSP_CRC_OK = 1,
+};
+
+enum {
+	AW_DSP_CRC_DISABLE = 0,
+	AW_DSP_CRC_ENABLE = 1,
+};
+
+enum {
+	AW_DSP_FW_UPDATE_OFF = 0,
+	AW_DSP_FW_UPDATE_ON = 1,
+};
+
+enum {
+	AW_FORCE_UPDATE_OFF = 0,
+	AW_FORCE_UPDATE_ON = 1,
+};
+
+enum {
+	AW_1000_US = 1000,
+	AW_2000_US = 2000,
+	AW_3000_US = 3000,
+	AW_4000_US = 4000,
+	AW_5000_US = 5000,
+	AW_10000_US = 10000,
+	AW_100000_US = 100000,
+};
+
+enum {
+	AW_DEV_TYPE_OK = 0,
+	AW_DEV_TYPE_NONE = 1,
+};
+
+
+enum AW_DEV_STATUS {
+	AW_DEV_PW_OFF = 0,
+	AW_DEV_PW_ON,
+};
+
+enum AW_DEV_FW_STATUS {
+	AW_DEV_FW_FAILED = 0,
+	AW_DEV_FW_OK,
+};
+
+enum AW_DEV_MEMCLK {
+	AW_DEV_MEMCLK_OSC = 0,
+	AW_DEV_MEMCLK_PLL = 1,
+};
+
+enum AW_DEV_DSP_CFG {
+	AW_DEV_DSP_WORK = 0,
+	AW_DEV_DSP_BYPASS = 1,
+};
+
+enum {
+	AW_DSP_16_DATA = 0,
+	AW_DSP_32_DATA = 1,
+};
+
+enum {
+	AW_NOT_RCV_MODE = 0,
+	AW_RCV_MODE = 1,
+};
+
+struct aw_device_ops {
+	int (*aw_i2c_writes)(struct regmap *map, unsigned int reg_addr,
+								const void *val, size_t val_len);
+	int (*aw_i2c_write)(struct regmap *map, unsigned int reg, unsigned int val);
+	int (*aw_i2c_read)(struct regmap *map, unsigned int reg, unsigned int *val);
+
+	int (*aw_reg_write)(struct regmap *map, unsigned int reg, unsigned int val);
+	int (*aw_reg_read)(struct regmap *map, unsigned int reg, unsigned int *val);
+	int (*aw_reg_write_bits)(struct regmap *map, unsigned int reg,
+						unsigned int mask, unsigned int val);
+
+	int (*aw_dsp_write)(struct aw_device *aw_dev,
+						uint16_t dsp_addr,
+						uint32_t reg_data,
+						uint8_t data_type);
+	int (*aw_dsp_read)(struct aw_device *aw_dev,
+						uint16_t dsp_addr,
+						uint32_t *dsp_data,
+						uint8_t data_type);
+	int (*aw_dsp_write_bits)(struct aw_device *aw_dev, uint16_t dsp_addr,
+								uint16_t mask, uint16_t dsp_data);
+
+	int (*aw_set_hw_volume)(struct aw_device *aw_dev, uint16_t value);
+	int (*aw_get_hw_volume)(struct aw_device *aw_dev, uint16_t *value);
+	unsigned int (*aw_reg_val_to_db)(unsigned int value);
+
+	void (*aw_i2s_tx_enable)(struct aw_device *aw_dev, bool flag);
+
+	bool (*aw_check_wr_access)(int reg);
+	bool (*aw_check_rd_access)(int reg);
+	int (*aw_get_reg_num)(void);
+	int (*aw_get_version)(char *buf, int size);
+	int (*aw_read_dsp_pid)(struct aw_device *aw_dev);
+	void (*aw_set_cfg_f0_fs)(struct aw_device *aw_dev, uint32_t *f0_fs);
+	int (*aw_dsp_fw_check)(struct aw_device *aw_dev);
+	int (*aw_set_cali_re)(struct aw_device *aw_dev);
+};
+
+struct aw_int_desc {
+	unsigned int mask_reg;			/*interrupt mask reg*/
+	unsigned int st_reg;			/*interrupt status reg*/
+	unsigned int mask_default;		/*default mask close all*/
+	unsigned int int_mask;			/*set mask*/
+	unsigned int intst_mask;		/*interrupt check mask*/
+	uint16_t sysint_st;			/*interrupt reg status*/
+};
+
+struct aw_pwd_desc {
+	unsigned int reg;
+	unsigned int mask;
+	unsigned int enable;
+	unsigned int disable;
+};
+
+struct aw_vcalb_desc {
+	unsigned int icalk_reg;
+	unsigned int icalk_reg_mask;
+	unsigned int icalk_sign_mask;
+	unsigned int icalk_neg_mask;
+	int icalk_value_factor;
+
+	unsigned int vcalk_reg;
+	unsigned int vcalk_reg_mask;
+	unsigned int vcalk_sign_mask;
+	unsigned int vcalk_neg_mask;
+	unsigned int vcalk_shift;
+	int vcalk_value_factor;
+
+	unsigned int vcalb_dsp_reg;
+	unsigned char data_type;
+	int cabl_base_value;
+	int vcal_factor;
+	int vscal_factor;
+	int iscal_factor;
+
+	unsigned int vcalb_adj_shift;
+
+	unsigned int vcalb_vsense_reg;
+	int vscal_factor_vsense_in;
+	int vcalk_value_factor_vsense_in;
+	unsigned int vcalk_dac_shift;
+	unsigned int vcalk_dac_mask;
+	unsigned int vcalk_dac_neg_mask;
+	unsigned int vcalk_vdsel_mask;
+};
+
+struct aw_mute_desc {
+	unsigned int reg;
+	unsigned int mask;
+	unsigned int enable;
+	unsigned int disable;
+};
+
+struct aw_sysst_desc {
+	unsigned int reg;
+	unsigned int st_check;
+	unsigned int st_mask;
+	unsigned int pll_check;
+	unsigned int dsp_check;
+	unsigned int dsp_mask;
+};
+
+struct aw_profctrl_desc {
+	unsigned int reg;
+	unsigned int mask;
+	unsigned int rcv_mode_val;
+	unsigned int cur_mode;
+};
+
+struct aw_volume_desc {
+	unsigned int reg;
+	unsigned int mask;
+	unsigned int shift;
+	unsigned int init_volume;
+	unsigned int mute_volume;
+	unsigned int ctl_volume;
+	unsigned int max_volume;
+};
+
+struct aw_dsp_en_desc {
+	unsigned int reg;
+	unsigned int mask;
+	unsigned int enable;
+	unsigned int disable;
+};
+
+struct aw_memclk_desc {
+	unsigned int reg;
+	unsigned int mask;
+	unsigned int mcu_hclk;
+	unsigned int osc_clk;
+};
+
+struct aw_watch_dog_desc {
+	unsigned int reg;
+	unsigned int mask;
+};
+
+struct aw_dsp_mem_desc {
+	unsigned int dsp_madd_reg;
+	unsigned int dsp_mdat_reg;
+	unsigned int dsp_fw_base_addr;
+	unsigned int dsp_cfg_base_addr;
+};
+
+struct aw_voltage_desc {
+	unsigned int reg;
+	unsigned int vbat_range;
+	unsigned int int_bit;
+};
+
+struct aw_temperature_desc {
+	unsigned int reg;
+	unsigned int sign_mask;
+	unsigned int neg_mask;
+};
+
+struct aw_ipeak_desc {
+	unsigned int reg;
+	unsigned int mask;
+};
+
+struct aw_vmax_desc {
+	unsigned int dsp_reg;
+	unsigned char data_type;
+	unsigned int init_vmax;
+};
+
+struct aw_soft_rst {
+	uint8_t reg;
+	uint16_t reg_value;
+};
+
+struct aw_cali_cfg_desc {
+	unsigned int actampth_reg;
+	unsigned char actampth_data_type;
+
+	unsigned int noiseampth_reg;
+	unsigned char noiseampth_data_type;
+
+	unsigned int ustepn_reg;
+	unsigned char ustepn_data_type;
+
+	unsigned int alphan_reg;
+	unsigned int alphan_data_type;
+};
+
+struct aw_dsp_vol_desc {
+	unsigned int reg;
+	unsigned int mute_st;
+	unsigned int noise_st;
+	unsigned int mask;
+};
+
+struct aw_amppd_desc {
+	unsigned int reg;
+	unsigned int mask;
+	unsigned int enable;
+	unsigned int disable;
+};
+
+struct aw_f0_desc {
+	unsigned int dsp_reg;
+	unsigned char data_type;
+	unsigned int shift;
+};
+
+struct aw_cfgf0_fs_desc {
+	unsigned int dsp_reg;
+	unsigned char data_type;
+};
+
+struct aw_q_desc {
+	unsigned int dsp_reg;
+	unsigned char data_type;
+	unsigned int shift;
+};
+
+struct aw_ra_desc {
+	unsigned int dsp_reg;
+	unsigned char data_type;
+};
+
+struct aw_noise_desc {
+	unsigned int dsp_reg;
+	unsigned char data_type;
+	unsigned int mask;
+};
+
+struct aw_ste_re_desc {
+	unsigned int dsp_reg;
+	unsigned char data_type;
+	unsigned int shift;
+};
+
+struct aw_adpz_re_desc {
+	unsigned int dsp_reg;
+	unsigned char data_type;
+	unsigned int shift;
+};
+
+struct aw_adpz_t0_desc {
+	unsigned int dsp_reg;
+	unsigned char data_type;
+	uint16_t coilalpha_reg;
+	unsigned char coil_type;
+};
+
+struct aw_spkr_temp_desc {
+	unsigned int reg;
+};
+
+struct aw_dsp_crc_desc {
+	unsigned int ctl_reg;
+	unsigned int ctl_mask;
+	unsigned int ctl_enable;
+	unsigned int ctl_disable;
+
+	unsigned int dsp_reg;
+	unsigned char data_type;
+};
+
+struct aw_cco_mux_desc {
+	unsigned int reg;
+	unsigned int mask;
+	unsigned int divider;
+	unsigned int bypass;
+};
+
+struct aw_hw_temp_desc {
+	unsigned int dsp_reg;
+	unsigned char data_type;
+};
+
+struct aw_cali_delay_desc {
+	unsigned int dsp_reg;
+	unsigned char data_type;
+	unsigned int delay;
+};
+
+struct aw_chansel_desc {
+	unsigned int rxchan_reg;
+	unsigned int rxchan_mask;
+	unsigned int txchan_reg;
+	unsigned int txchan_mask;
+
+	unsigned int rx_left;
+	unsigned int rx_right;
+	unsigned int tx_left;
+	unsigned int tx_right;
+};
+
+struct aw_tx_en_desc {
+	unsigned int tx_en_mask;
+	unsigned int tx_disable;
+};
+
+struct aw_dsp_st {
+	unsigned int dsp_reg_s1;
+	unsigned int dsp_reg_e1;
+
+	unsigned int dsp_reg_s2;
+	unsigned int dsp_reg_e2;
+};
+
+struct aw_cali_desc {
+	uint32_t cali_re;	/*cali value*/
+	uint32_t ra;
+};
+
+struct aw_container {
+	int len;
+	uint8_t data[];
+};
+
+struct aw_device {
+	int status;
+	struct mutex *dsp_lock;
+
+	unsigned char cur_prof;	/*current profile index*/
+	unsigned char set_prof;	/*set profile index*/
+	unsigned char dsp_crc_st;
+	uint16_t chip_id;
+
+	unsigned int channel;	/*pa channel select*/
+	unsigned int fade_step;
+
+	struct i2c_client *i2c;
+	struct device *dev;
+	char *acf;
+	void *private_data;
+
+	uint32_t fade_en;
+	unsigned char dsp_cfg;
+
+	uint32_t dsp_fw_len;
+	uint32_t dsp_cfg_len;
+	uint8_t platform;
+	uint8_t fw_status;	/*load cfg status*/
+
+	unsigned int fade_in_time;
+	unsigned int fade_out_time;
+
+	struct aw_prof_info prof_info;
+	struct aw_sec_data_desc crc_dsp_cfg;
+	struct aw_int_desc int_desc;
+	struct aw_pwd_desc pwd_desc;
+	struct aw_mute_desc mute_desc;
+	struct aw_vcalb_desc vcalb_desc;
+	struct aw_sysst_desc sysst_desc;
+	struct aw_profctrl_desc profctrl_desc;
+	struct aw_volume_desc volume_desc;
+	struct aw_dsp_en_desc dsp_en_desc;
+	struct aw_memclk_desc memclk_desc;
+	struct aw_watch_dog_desc watch_dog_desc;
+	struct aw_dsp_mem_desc dsp_mem_desc;
+	struct aw_voltage_desc voltage_desc;
+	struct aw_temperature_desc temp_desc;
+	struct aw_vmax_desc vmax_desc;
+	struct aw_ipeak_desc ipeak_desc;
+	struct aw_soft_rst soft_rst;
+	struct aw_cali_cfg_desc cali_cfg_desc;
+	struct aw_ra_desc ra_desc;
+	struct aw_dsp_vol_desc dsp_vol_desc;
+	struct aw_noise_desc noise_desc;
+	struct aw_f0_desc f0_desc;
+	struct aw_cfgf0_fs_desc cfgf0_fs_desc;
+	struct aw_q_desc q_desc;
+	struct aw_ste_re_desc ste_re_desc;
+	struct aw_adpz_re_desc adpz_re_desc;
+	struct aw_adpz_t0_desc t0_desc;
+	struct aw_amppd_desc amppd_desc;
+	struct aw_spkr_temp_desc spkr_temp_desc;
+	struct aw_dsp_crc_desc dsp_crc_desc;
+	struct aw_cco_mux_desc cco_mux_desc;
+	struct aw_hw_temp_desc hw_temp_desc;
+
+	struct aw_chansel_desc chansel_desc;
+	struct aw_tx_en_desc tx_en_desc;
+	struct aw_cali_delay_desc cali_delay_desc;
+	struct aw_dsp_st dsp_st_desc;
+	struct aw_cali_desc cali_desc;
+
+	struct aw_device_ops ops;
+};
+
+void aw883xx_dev_deinit(struct aw_device *aw_dev);
+int aw883xx_device_init(struct aw_device *aw_dev, struct aw_container *aw_prof);
+int aw883xx_device_start(struct aw_device *aw_dev);
+int aw883xx_device_stop(struct aw_device *aw_dev);
+
+int aw883xx_dev_fw_update(struct aw_device *aw_dev, bool up_dsp_fw_en, bool force_up_en);
+
+int aw883xx_device_probe(struct aw_device *aw_dev);
+int aw883xx_device_remove(struct aw_device *aw_dev);
+int aw883xx_dev_syspll_check(struct aw_device *aw_dev);
+int aw883xx_dev_get_dsp_status(struct aw_device *aw_dev);
+
+void aw883xx_dev_set_fade_vol_step(struct aw_device *aw_dev, unsigned int step);
+int aw883xx_dev_get_fade_vol_step(struct aw_device *aw_dev);
+void aw883xx_dev_get_fade_time(unsigned int *time, bool fade_in, struct aw_device *aw_dev);
+void aw883xx_dev_set_fade_time(unsigned int time, bool fade_in, struct aw_device *aw_dev);
+
+int aw883xx_dev_get_cali_re(struct aw_device *aw_dev);
+void aw883xx_dev_set_cali_re(struct aw_device *aw_dev, uint32_t cali_re);
+
+
+int aw883xx_dev_get_hmute(struct aw_device *aw_dev);
+int aw883xx_dev_sysst_check(struct aw_device *aw_dev);
+
+int aw883xx_dev_dsp_check(struct aw_device *aw_dev);
+void aw883xx_dev_memclk_select(struct aw_device *aw_dev, unsigned char flag);
+
+void aw883xx_dev_dsp_enable(struct aw_device *aw_dev, bool dsp);
+
+void aw883xx_dev_mute(struct aw_device *aw_dev, bool mute);
+int aw883xx_dev_dsp_fw_update(struct aw_device *aw_dev,
+			uint8_t *data, uint32_t len);
+int aw883xx_dev_dsp_cfg_update(struct aw_device *aw_dev,
+			uint8_t *data, uint32_t len);
+int aw883xx_dev_modify_dsp_cfg(struct aw_device *aw_dev,
+			unsigned int addr, uint32_t dsp_data, unsigned char data_type);
+int aw883xx_dev_get_iis_status(struct aw_device *aw_dev);
+
+int aw883xx_dev_set_volume(struct aw_device *aw_dev, uint16_t set_vol);
+int aw883xx_dev_get_volume(struct aw_device *aw_dev, uint16_t *get_vol);
+
+#endif
+
-- 
2.38.1


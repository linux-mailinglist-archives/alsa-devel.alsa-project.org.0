Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3FB756239
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 14:01:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 271DEDFA;
	Mon, 17 Jul 2023 14:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 271DEDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689595261;
	bh=iDltDvcUGMlcz8He1+xwfZ5MtBjUEqQtsI45HsE5L/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lt3WwHYA4eeJlAWY4TsCWGWdRdd9+zGVGs4UgFZGUXO6SvUNI+vmT0DQpk7QpON/2
	 oo3e7f+eUmmJi0x+wuRXk480ShrsIGsMnRPcW8cQecAoJQXO3CPmmiqahK8M5Rv5KU
	 u2LKPiA3H2lbGSobB4C220dM4azkInOUDkeCv4vU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB799F80580; Mon, 17 Jul 2023 13:59:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EB84F80520;
	Mon, 17 Jul 2023 13:59:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E1CAF80567; Mon, 17 Jul 2023 13:59:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out28-73.mail.aliyun.com (out28-73.mail.aliyun.com
 [115.124.28.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B276F80494
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 13:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B276F80494
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.06712908|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.00527513-0.00234748-0.992377;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047187;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=25;RT=25;SR=0;TI=SMTPD_---.TvogKvv_1689595129;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.TvogKvv_1689595129)
          by smtp.aliyun-inc.com;
          Mon, 17 Jul 2023 19:58:50 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.co,
	wangweidong.a@awinic.com,
	shumingf@realtek.com,
	herve.codina@bootlin.com,
	flatmax@flatmax.com,
	ckeepax@opensource.cirrus.com,
	doug@schmorgal.com,
	fido_max@inbox.ru,
	pierre-louis.bossart@linux.intel.com,
	kiseok.jo@irondevice.com,
	liweilei@awinic.com,
	colin.i.king@gmail.com,
	trix@redhat.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: yijiangtao@awinic.com,
	zhangjianming@awinic.com
Subject: [PATCH V1 2/5] ASoC: codecs: aw88261 function for ALSA Audio Driver
Date: Mon, 17 Jul 2023 19:58:42 +0800
Message-ID: <20230717115845.297991-3-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717115845.297991-1-wangweidong.a@awinic.com>
References: <20230717115845.297991-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: S5RASUVHI6GWQ4L2J2NZD3PRY5UG6HCJ
X-Message-ID-Hash: S5RASUVHI6GWQ4L2J2NZD3PRY5UG6HCJ
X-MailFrom: wangweidong.a@awinic.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S5RASUVHI6GWQ4L2J2NZD3PRY5UG6HCJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

The AW88261 is an I2S/TDM input, high efficiency
digital Smart K audio amplifier with an integrated 10.25V
smart boost convert

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 sound/soc/codecs/aw88261/aw88261_device.c | 959 ++++++++++++++++++++++
 sound/soc/codecs/aw88261/aw88261_device.h | 114 +++
 2 files changed, 1073 insertions(+)
 create mode 100644 sound/soc/codecs/aw88261/aw88261_device.c
 create mode 100644 sound/soc/codecs/aw88261/aw88261_device.h

diff --git a/sound/soc/codecs/aw88261/aw88261_device.c b/sound/soc/codecs/aw88261/aw88261_device.c
new file mode 100644
index 000000000000..855aba8a6364
--- /dev/null
+++ b/sound/soc/codecs/aw88261/aw88261_device.c
@@ -0,0 +1,959 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// aw88261_device.c --  AW88261 function for ALSA Audio Driver
+//
+// Copyright (c) 2023 awinic Technology CO., LTD
+//
+// Author: Jimmy Zhang <zhangjianming@awinic.com>
+// Author: Weidong Wang <wangweidong.a@awinic.com>
+//
+
+#include <linux/crc32.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include "aw88261_device.h"
+#include "aw88261_reg.h"
+
+static int aw_dev_read_chipid(struct aw_device *aw_dev, u16 *chip_id)
+{
+	int reg_val;
+	int ret;
+
+	ret = regmap_read(aw_dev->regmap, AW88261_CHIP_ID_REG, &reg_val);
+	if (ret) {
+		dev_err(aw_dev->dev, "%s read chipid error. ret = %d", __func__, ret);
+		return ret;
+	}
+
+	dev_info(aw_dev->dev, "chip id = %x\n", reg_val);
+	*chip_id = reg_val;
+
+	return ret;
+}
+
+static unsigned int reg_val_to_db(unsigned int value)
+{
+	return (((value >> AW88261_VOL_6DB_START) *
+				AW88261_VOLUME_STEP_DB) + (value & AW88261_REG_TO_DB));
+}
+
+static unsigned short db_to_reg_val(unsigned short value)
+{
+	return (((value / AW88261_VOLUME_STEP_DB) << AW88261_VOL_6DB_START) +
+			(value % AW88261_VOLUME_STEP_DB));
+}
+
+static int aw_dev_set_volume(struct aw_device *aw_dev, unsigned int value)
+{
+	struct aw_volume_desc *vol_desc = &aw_dev->volume_desc;
+	unsigned int reg_value;
+	u16 real_value, volume;
+	int ret;
+
+	volume = min((value + vol_desc->init_volume), (unsigned int)AW88261_MUTE_VOL);
+	real_value = db_to_reg_val(volume);
+
+	/* cal real value */
+	ret = regmap_read(aw_dev->regmap, AW88261_SYSCTRL2_REG, &reg_value);
+	if (ret)
+		return ret;
+
+	real_value = (real_value << AW88261_VOL_START_BIT) | (reg_value & AW88261_VOL_START_MASK);
+
+	dev_dbg(aw_dev->dev, "value 0x%x , real_value:0x%x", value, real_value);
+
+	/* write value */
+	ret = regmap_write(aw_dev->regmap, AW88261_SYSCTRL2_REG, real_value);
+
+	return ret;
+}
+
+void aw88261_dev_set_volume(struct aw_device *aw_dev, unsigned short set_vol)
+{
+	int ret;
+
+	ret = aw_dev_set_volume(aw_dev, set_vol);
+	if (ret)
+		dev_dbg(aw_dev->dev, "set volume failed");
+}
+EXPORT_SYMBOL_GPL(aw88261_dev_set_volume);
+
+static void aw_dev_fade_in(struct aw_device *aw_dev)
+{
+	struct aw_volume_desc *desc = &aw_dev->volume_desc;
+	u16 fade_in_vol = desc->ctl_volume;
+	int fade_step = aw_dev->fade_step;
+	int i;
+
+	if (fade_step == 0 || aw_dev->fade_in_time == 0) {
+		aw_dev_set_volume(aw_dev, fade_in_vol);
+		return;
+	}
+
+	for (i = AW88261_MUTE_VOL; i >= fade_in_vol; i -= fade_step) {
+		aw_dev_set_volume(aw_dev, i);
+		usleep_range(aw_dev->fade_in_time, aw_dev->fade_in_time + 10);
+	}
+
+	if (i != fade_in_vol)
+		aw_dev_set_volume(aw_dev, fade_in_vol);
+}
+
+static void aw_dev_fade_out(struct aw_device *aw_dev)
+{
+	struct aw_volume_desc *desc = &aw_dev->volume_desc;
+	int fade_step = aw_dev->fade_step;
+	int i;
+
+	if (fade_step == 0 || aw_dev->fade_out_time == 0) {
+		aw_dev_set_volume(aw_dev, AW88261_MUTE_VOL);
+		return;
+	}
+
+	for (i = desc->ctl_volume; i <= AW88261_MUTE_VOL; i += fade_step) {
+		aw_dev_set_volume(aw_dev, i);
+		usleep_range(aw_dev->fade_out_time, aw_dev->fade_out_time + 10);
+	}
+
+	if (i != AW88261_MUTE_VOL) {
+		aw_dev_set_volume(aw_dev, AW88261_MUTE_VOL);
+		usleep_range(aw_dev->fade_out_time, aw_dev->fade_out_time + 10);
+	}
+}
+
+static void aw_dev_i2s_tx_enable(struct aw_device *aw_dev, bool flag)
+{
+	int ret;
+
+	if (flag) {
+		ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCFG1_REG,
+			~AW88261_I2STXEN_MASK, AW88261_I2STXEN_ENABLE_VALUE);
+	} else {
+		ret = regmap_update_bits(aw_dev->regmap, AW88261_I2SCFG1_REG,
+			~AW88261_I2STXEN_MASK, AW88261_I2STXEN_DISABLE_VALUE);
+	}
+	if (ret)
+		dev_dbg(aw_dev->dev, "%s failed", __func__);
+}
+
+static void aw_dev_pwd(struct aw_device *aw_dev, bool pwd)
+{
+	int ret;
+
+	if (pwd) {
+		ret = regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL_REG,
+				~AW88261_PWDN_MASK,	AW88261_PWDN_POWER_DOWN_VALUE);
+	} else {
+		ret = regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL_REG,
+				~AW88261_PWDN_MASK,	AW88261_PWDN_WORKING_VALUE);
+	}
+	if (ret)
+		dev_dbg(aw_dev->dev, "%s failed", __func__);
+}
+
+static void aw_dev_amppd(struct aw_device *aw_dev, bool amppd)
+{
+	int ret;
+
+	if (amppd) {
+		ret = regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL_REG,
+				~AW88261_AMPPD_MASK, AW88261_AMPPD_POWER_DOWN_VALUE);
+	} else {
+		ret = regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL_REG,
+				~AW88261_AMPPD_MASK, AW88261_AMPPD_WORKING_VALUE);
+	}
+	if (ret)
+		dev_dbg(aw_dev->dev, "%s failed", __func__);
+}
+
+void aw88261_dev_mute(struct aw_device *aw_dev, bool is_mute)
+{
+	int ret;
+
+	if (is_mute) {
+		aw_dev_fade_out(aw_dev);
+		ret = regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL_REG,
+				~AW88261_HMUTE_MASK, AW88261_HMUTE_ENABLE_VALUE);
+	} else {
+		ret = regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL_REG,
+				~AW88261_HMUTE_MASK, AW88261_HMUTE_DISABLE_VALUE);
+		aw_dev_fade_in(aw_dev);
+	}
+	if (ret)
+		dev_dbg(aw_dev->dev, "%s failed", __func__);
+}
+EXPORT_SYMBOL_GPL(aw88261_dev_mute);
+
+static void aw88261_dev_uls_hmute(struct aw_device *aw_dev, bool uls_hmute)
+{
+	int ret;
+
+	if (uls_hmute) {
+		ret = regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL_REG,
+				~AW88261_ULS_HMUTE_MASK,
+				AW88261_ULS_HMUTE_ENABLE_VALUE);
+	} else {
+		ret = regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL_REG,
+				~AW88261_ULS_HMUTE_MASK,
+				AW88261_ULS_HMUTE_DISABLE_VALUE);
+	}
+	if (ret)
+		dev_dbg(aw_dev->dev, "%s failed", __func__);
+}
+
+static int aw_dev_get_icalk(struct aw_device *aw_dev, int16_t *icalk)
+{
+	u16 reg_icalk, reg_icalkl;
+	unsigned int reg_val;
+	int ret;
+
+	ret = regmap_read(aw_dev->regmap, AW88261_EFRH4_REG, &reg_val);
+	if (ret)
+		return ret;
+
+	reg_icalk = reg_val & (~AW88261_EF_ISN_GESLP_H_MASK);
+
+	ret = regmap_read(aw_dev->regmap, AW88261_EFRL4_REG, &reg_val);
+	if (ret)
+		return ret;
+
+	reg_icalkl = reg_val & (~AW88261_EF_ISN_GESLP_L_MASK);
+
+	reg_icalk = (reg_icalk >> AW88261_ICALK_SHIFT) & (reg_icalkl >> AW88261_ICALKL_SHIFT);
+
+	if (reg_icalk & (~AW88261_EF_ISN_GESLP_SIGN_MASK))
+		reg_icalk = reg_icalk | ~AW88261_EF_ISN_GESLP_NEG;
+
+	*icalk = (int16_t)reg_icalk;
+
+	return ret;
+}
+
+static int aw_dev_get_vcalk(struct aw_device *aw_dev, int16_t *vcalk)
+{
+	u16 reg_vcalk, reg_vcalkl;
+	unsigned int reg_val;
+	int ret;
+
+	ret = regmap_read(aw_dev->regmap, AW88261_EFRH3_REG, &reg_val);
+	if (ret)
+		return ret;
+
+	reg_vcalk = (u16)reg_val & (~AW88261_EF_VSN_GESLP_H_MASK);
+
+	ret = regmap_read(aw_dev->regmap, AW88261_EFRL3_REG, &reg_val);
+	if (ret)
+		return ret;
+
+	reg_vcalkl = (u16)reg_val & (~AW88261_EF_VSN_GESLP_L_MASK);
+
+	reg_vcalk = (reg_vcalk >> AW88261_VCALK_SHIFT) & (reg_vcalkl >> AW88261_VCALKL_SHIFT);
+
+	if (reg_vcalk & AW88261_EF_VSN_GESLP_SIGN_MASK)
+		reg_vcalk = reg_vcalk | (~AW88261_EF_VSN_GESLP_NEG);
+	*vcalk = (int16_t)reg_vcalk;
+
+	return ret;
+}
+
+static int aw_dev_set_vcalb(struct aw_device *aw_dev)
+{
+	int16_t icalk_val, vcalk_val;
+	int icalk, vcalk, vcalb;
+	u32 reg_val;
+	int ret;
+
+	ret = aw_dev_get_icalk(aw_dev, &icalk_val);
+	if (ret) {
+		dev_err(aw_dev->dev, "%s:get icalk failed\n", __func__);
+		return ret;
+	}
+
+	ret = aw_dev_get_vcalk(aw_dev, &vcalk_val);
+	if (ret) {
+		dev_err(aw_dev->dev, "%s:get vcalk failed\n", __func__);
+		return ret;
+	}
+
+	icalk = AW88261_CABL_BASE_VALUE + AW88261_ICABLK_FACTOR * icalk_val;
+	vcalk = AW88261_CABL_BASE_VALUE + AW88261_VCABLK_FACTOR * vcalk_val;
+	if (!vcalk) {
+		dev_err(aw_dev->dev, "vcalk is 0");
+		return -EINVAL;
+	}
+
+	vcalb = AW88261_VCAL_FACTOR * icalk / vcalk;
+	reg_val = (unsigned int)vcalb;
+
+	dev_dbg(aw_dev->dev, "icalk=%d, vcalk=%d, vcalb=%d, reg_val=0x%04x",
+			icalk, vcalk, vcalb, reg_val);
+	ret = regmap_write(aw_dev->regmap, AW88261_VSNTM1_REG, reg_val);
+
+	return ret;
+}
+
+static void aw_dev_get_int_status(struct aw_device *aw_dev, unsigned short *int_status)
+{
+	unsigned int reg_val;
+	int ret;
+
+	ret = regmap_read(aw_dev->regmap, AW88261_SYSINT_REG, &reg_val);
+	if (ret)
+		dev_err(aw_dev->dev, "read interrupt reg fail, ret=%d", ret);
+	else
+		*int_status = reg_val;
+
+	dev_dbg(aw_dev->dev, "read interrupt reg = 0x%04x", *int_status);
+}
+
+static void aw_dev_clear_int_status(struct aw_device *aw_dev)
+{
+	u16 int_status;
+
+	/* read int status and clear */
+	aw_dev_get_int_status(aw_dev, &int_status);
+	/* make sure int status is clear */
+	aw_dev_get_int_status(aw_dev, &int_status);
+}
+
+static int aw_dev_get_iis_status(struct aw_device *aw_dev)
+{
+	unsigned int reg_val;
+	int ret;
+
+	ret = regmap_read(aw_dev->regmap, AW88261_SYSST_REG, &reg_val);
+	if (ret)
+		return -EIO;
+	if ((reg_val & AW88261_BIT_PLL_CHECK) != AW88261_BIT_PLL_CHECK) {
+		dev_err(aw_dev->dev, "check pll lock fail,reg_val:0x%04x", reg_val);
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static int aw_dev_check_mode1_pll(struct aw_device *aw_dev)
+{
+	int ret, i;
+
+	for (i = 0; i < AW88261_DEV_SYSST_CHECK_MAX; i++) {
+		ret = aw_dev_get_iis_status(aw_dev);
+		if (ret < 0) {
+			dev_err(aw_dev->dev, "mode1 iis signal check error");
+			usleep_range(AW88261_2000_US, AW88261_2000_US + 10);
+		} else {
+			return ret;
+		}
+	}
+
+	return -EPERM;
+}
+
+static int aw_dev_check_mode2_pll(struct aw_device *aw_dev)
+{
+	unsigned int reg_val;
+	int ret, i;
+
+	ret = regmap_read(aw_dev->regmap, AW88261_PLLCTRL1_REG, &reg_val);
+	if (ret)
+		return ret;
+
+	reg_val &= (~AW88261_CCO_MUX_MASK);
+	if (reg_val == AW88261_CCO_MUX_DIVIDED_VALUE) {
+		dev_dbg(aw_dev->dev, "CCO_MUX is already divider");
+		return -EPERM;
+	}
+
+	/* change mode2 */
+	ret = regmap_update_bits(aw_dev->regmap, AW88261_PLLCTRL1_REG,
+			~AW88261_CCO_MUX_MASK, AW88261_CCO_MUX_DIVIDED_VALUE);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < AW88261_DEV_SYSST_CHECK_MAX; i++) {
+		ret = aw_dev_get_iis_status(aw_dev);
+		if (ret) {
+			dev_err(aw_dev->dev, "mode2 iis signal check error");
+			usleep_range(AW88261_2000_US, AW88261_2000_US + 10);
+		} else {
+			break;
+		}
+	}
+
+	/* change mode1 */
+	ret = regmap_update_bits(aw_dev->regmap, AW88261_PLLCTRL1_REG,
+			~AW88261_CCO_MUX_MASK, AW88261_CCO_MUX_BYPASS_VALUE);
+	if (ret == 0) {
+		usleep_range(AW88261_2000_US, AW88261_2000_US + 10);
+		for (i = 0; i < AW88261_DEV_SYSST_CHECK_MAX; i++) {
+			ret = aw_dev_check_mode1_pll(aw_dev);
+			if (ret < 0) {
+				dev_err(aw_dev->dev, "mode2 switch to mode1, iis signal check error");
+				usleep_range(AW88261_2000_US, AW88261_2000_US + 10);
+			} else {
+				break;
+			}
+		}
+	}
+
+	return ret;
+}
+
+static int aw_dev_check_syspll(struct aw_device *aw_dev)
+{
+	int ret;
+
+	ret = aw_dev_check_mode1_pll(aw_dev);
+	if (ret) {
+		dev_dbg(aw_dev->dev, "mode1 check iis failed try switch to mode2 check");
+		ret = aw_dev_check_mode2_pll(aw_dev);
+		if (ret) {
+			dev_err(aw_dev->dev, "mode2 check iis failed");
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+static int aw_dev_check_sysst(struct aw_device *aw_dev)
+{
+	unsigned int check_val;
+	unsigned int reg_val;
+	int ret, i;
+
+	for (i = 0; i < AW88261_DEV_SYSST_CHECK_MAX; i++) {
+		ret = regmap_read(aw_dev->regmap, AW88261_SYSST_REG, &reg_val);
+		if (ret)
+			return ret;
+
+		check_val = reg_val & (~AW88261_BIT_SYSST_CHECK_MASK)
+							& AW88261_BIT_SYSST_CHECK;
+		if (check_val != AW88261_BIT_SYSST_CHECK) {
+			dev_err(aw_dev->dev, "check sysst fail, cnt=%d, reg_val=0x%04x, check:0x%x",
+				i, reg_val, AW88261_BIT_SYSST_CHECK);
+			usleep_range(AW88261_2000_US, AW88261_2000_US + 10);
+		} else {
+			return 0;
+		}
+	}
+
+	return -EPERM;
+}
+
+static int aw_dev_update_reg_container(struct aw_device *aw_dev,
+				unsigned char *data, unsigned int len)
+{
+	struct aw_volume_desc *vol_desc = &aw_dev->volume_desc;
+	unsigned int read_val, efcheck_val;
+	int16_t *reg_data;
+	int data_len;
+	u16 read_vol;
+	u16 reg_val;
+	u8 reg_addr;
+	int i, ret;
+
+	reg_data = (int16_t *)data;
+	data_len = len >> 1;
+
+	if (data_len & 0x1) {
+		dev_err(aw_dev->dev, "data len:%d unsupported",	data_len);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < data_len; i += 2) {
+		reg_addr = reg_data[i];
+		reg_val = reg_data[i + 1];
+
+		if (reg_addr == AW88261_SYSCTRL_REG) {
+			aw_dev->amppd_st = reg_val & (~AW88261_AMPPD_MASK);
+			ret = regmap_read(aw_dev->regmap, reg_addr, &read_val);
+			if (ret)
+				break;
+
+			read_val &= (~AW88261_AMPPD_MASK) | (~AW88261_PWDN_MASK) |
+								(~AW88261_HMUTE_MASK);
+			reg_val &= (AW88261_AMPPD_MASK | AW88261_PWDN_MASK | AW88261_HMUTE_MASK);
+			reg_val |= read_val;
+
+			/* enable uls hmute */
+			reg_val &= AW88261_ULS_HMUTE_MASK;
+			reg_val |= AW88261_ULS_HMUTE_ENABLE_VALUE;
+		}
+
+		if (reg_addr == AW88261_DBGCTRL_REG) {
+			efcheck_val = reg_val & (~AW88261_EF_DBMD_MASK);
+			if (efcheck_val == AW88261_OR_VALUE)
+				aw_dev->efuse_check = AW_EF_OR_CHECK;
+			else
+				aw_dev->efuse_check = AW_EF_AND_CHECK;
+
+		}
+
+		/* i2stxen */
+		if (reg_addr == AW88261_I2SCTRL3_REG) {
+			/* close tx */
+			reg_val &= AW88261_I2STXEN_MASK;
+			reg_val |= AW88261_I2STXEN_DISABLE_VALUE;
+		}
+
+		if (reg_addr == AW88261_SYSCTRL2_REG) {
+			read_vol = (reg_val & (~AW88261_VOL_MASK)) >>
+				AW88261_VOL_START_BIT;
+			aw_dev->volume_desc.init_volume =
+				reg_val_to_db(read_vol);
+		}
+
+		if (reg_addr == AW88261_VSNTM1_REG)
+			continue;
+
+		dev_dbg(aw_dev->dev, "reg=0x%04x, val = 0x%04x",
+				(uint16_t)reg_addr, (uint16_t)reg_val);
+
+		ret = regmap_write(aw_dev->regmap, reg_addr, reg_val);
+		if (ret)
+			break;
+
+	}
+
+	ret = aw_dev_set_vcalb(aw_dev);
+	if (ret)
+		return ret;
+
+	if (aw_dev->prof_cur != aw_dev->prof_index)
+		vol_desc->ctl_volume = 0;
+
+	/* keep min volume */
+	aw_dev_set_volume(aw_dev, vol_desc->mute_volume);
+
+	return ret;
+}
+
+static int aw_dev_reg_update(struct aw_device *aw_dev,
+					unsigned char *data, unsigned int len)
+{
+	int ret;
+
+	if (!len || !data) {
+		dev_err(aw_dev->dev, "reg data is null or len is 0");
+		return -EINVAL;
+	}
+
+	ret = aw_dev_update_reg_container(aw_dev, data, len);
+	if (ret)
+		dev_err(aw_dev->dev, "reg update failed");
+
+	return ret;
+}
+
+static void aw88261_dev_soft_reset(struct aw_device *aw_dev)
+{
+	int ret;
+
+	ret = regmap_write(aw_dev->regmap, AW88261_ID_REG, AW88261_SOFT_RESET_VALUE);
+	if (ret)
+		dev_dbg(aw_dev->dev, "%s failed\n", __func__);
+}
+
+static int aw_frcset_check(struct aw_device *aw_dev)
+{
+	unsigned int reg_val, ret;
+	u16 temh, teml, tem;
+
+	ret = regmap_read(aw_dev->regmap, AW88261_EFRH3_REG, &reg_val);
+	if (ret)
+		return ret;
+	temh = ((u16)reg_val & (~AW88261_TEMH_MASK));
+
+	ret = regmap_read(aw_dev->regmap, AW88261_EFRL3_REG, &reg_val);
+	if (ret)
+		return ret;
+	teml = ((u16)reg_val & (~AW88261_TEML_MASK));
+
+	if (aw_dev->efuse_check == AW_EF_OR_CHECK)
+		tem = (temh | teml);
+	else
+		tem = (temh & teml);
+
+	if (tem == AW88261_DEFAULT_CFG)
+		aw_dev->frcset_en = AW_FRCSET_ENABLE;
+	else
+		aw_dev->frcset_en = AW_FRCSET_DISABLE;
+
+	dev_dbg(aw_dev->dev, "tem is 0x%04x, frcset_en is %d",
+						tem, aw_dev->frcset_en);
+
+	return ret;
+}
+
+static void aw88261_reg_force_set(struct aw_device *aw_dev)
+{
+
+	if (aw_dev->frcset_en == AW_FRCSET_ENABLE) {
+		/* set FORCE_PWM */
+		regmap_update_bits(aw_dev->regmap, AW88261_BSTCTRL3_REG,
+				AW88261_FORCE_PWM_MASK, AW88261_FORCE_PWM_FORCEMINUS_PWM_VALUE);
+		/* set BOOST_OS_WIDTH */
+		regmap_update_bits(aw_dev->regmap, AW88261_BSTCTRL5_REG,
+				AW88261_BST_OS_WIDTH_MASK, AW88261_BST_OS_WIDTH_50NS_VALUE);
+		/* set BURST_LOOPR */
+		regmap_update_bits(aw_dev->regmap, AW88261_BSTCTRL6_REG,
+				AW88261_BST_LOOPR_MASK, AW88261_BST_LOOPR_340K_VALUE);
+		/* set RSQN_DLY */
+		regmap_update_bits(aw_dev->regmap, AW88261_BSTCTRL7_REG,
+				AW88261_RSQN_DLY_MASK, AW88261_RSQN_DLY_35NS_VALUE);
+		/* set BURST_SSMODE */
+		regmap_update_bits(aw_dev->regmap, AW88261_BSTCTRL8_REG,
+				AW88261_BURST_SSMODE_MASK, AW88261_BURST_SSMODE_FAST_VALUE);
+		/* set BST_BURST */
+		regmap_update_bits(aw_dev->regmap, AW88261_BSTCTRL9_REG,
+				AW88261_BST_BURST_MASK, AW88261_BST_BURST_30MA_VALUE);
+	} else {
+		dev_dbg(aw_dev->dev, "needn't set reg value");
+	}
+}
+
+int aw88261_dev_fw_update(struct aw_device *aw_dev)
+{
+	struct aw_prof_desc *prof_index_desc;
+	struct aw_sec_data_desc *sec_desc;
+	char *prof_name;
+	int ret;
+
+	prof_name = aw88261_dev_get_prof_name(aw_dev, aw_dev->prof_index);
+	if (!prof_name) {
+		dev_err(aw_dev->dev, "get prof name failed");
+		return -EINVAL;
+	}
+
+	dev_dbg(aw_dev->dev, "start update %s", prof_name);
+
+	ret = aw88261_dev_get_prof_data(aw_dev, aw_dev->prof_index, &prof_index_desc);
+	if (ret)
+		return ret;
+
+	/* update reg */
+	sec_desc = prof_index_desc->sec_desc;
+	ret = aw_dev_reg_update(aw_dev, sec_desc[AW88261_DATA_TYPE_REG].data,
+					sec_desc[AW88261_DATA_TYPE_REG].len);
+	if (ret) {
+		dev_err(aw_dev->dev, "update reg failed");
+		return ret;
+	}
+
+	aw_dev->prof_cur = aw_dev->prof_index;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(aw88261_dev_fw_update);
+
+int aw88261_dev_reg_update(struct aw_device *aw_dev, bool force)
+{
+	int ret;
+
+	if (force) {
+		aw88261_dev_soft_reset(aw_dev);
+		ret = aw88261_dev_fw_update(aw_dev);
+		if (ret < 0)
+			return ret;
+	} else {
+		if (aw_dev->prof_cur != aw_dev->prof_index) {
+			ret = aw88261_dev_fw_update(aw_dev);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	aw_dev->prof_cur = aw_dev->prof_index;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(aw88261_dev_reg_update);
+
+int aw88261_dev_start(struct aw_device *aw_dev)
+{
+	int ret;
+
+	if (aw_dev->status == AW88261_DEV_PW_ON) {
+		dev_info(aw_dev->dev, "already power on");
+		return 0;
+	}
+
+	/* power on */
+	aw_dev_pwd(aw_dev, false);
+	usleep_range(AW88261_2000_US, AW88261_2000_US + 10);
+
+	ret = aw_dev_check_syspll(aw_dev);
+	if (ret) {
+		dev_err(aw_dev->dev, "pll check failed cannot start");
+		goto pll_check_fail;
+	}
+
+	/* amppd on */
+	aw_dev_amppd(aw_dev, false);
+	usleep_range(AW88261_1000_US, AW88261_1000_US + 50);
+
+	/* check i2s status */
+	ret = aw_dev_check_sysst(aw_dev);
+	if (ret) {
+		dev_err(aw_dev->dev, "sysst check failed");
+		goto sysst_check_fail;
+	}
+
+	/* enable tx feedback */
+	aw_dev_i2s_tx_enable(aw_dev, true);
+
+	if (aw_dev->amppd_st)
+		aw_dev_amppd(aw_dev, true);
+
+	aw88261_reg_force_set(aw_dev);
+
+	/* close uls mute */
+	aw88261_dev_uls_hmute(aw_dev, false);
+
+	/* close mute */
+	if (!aw_dev->mute_st)
+		aw88261_dev_mute(aw_dev, false);
+
+	/* clear inturrupt */
+	aw_dev_clear_int_status(aw_dev);
+	aw_dev->status = AW88261_DEV_PW_ON;
+
+	return 0;
+
+sysst_check_fail:
+	aw_dev_i2s_tx_enable(aw_dev, false);
+	aw_dev_clear_int_status(aw_dev);
+	aw_dev_amppd(aw_dev, true);
+pll_check_fail:
+	aw_dev_pwd(aw_dev, true);
+	aw_dev->status = AW88261_DEV_PW_OFF;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(aw88261_dev_start);
+
+int aw88261_dev_stop(struct aw_device *aw_dev)
+{
+	if (aw_dev->status == AW88261_DEV_PW_OFF) {
+		dev_info(aw_dev->dev, "already power off");
+		return 0;
+	}
+
+	aw_dev->status = AW88261_DEV_PW_OFF;
+
+	/* clear inturrupt */
+	aw_dev_clear_int_status(aw_dev);
+
+	aw88261_dev_uls_hmute(aw_dev, true);
+	/* set mute */
+	aw88261_dev_mute(aw_dev, true);
+
+	/* close tx feedback */
+	aw_dev_i2s_tx_enable(aw_dev, false);
+	usleep_range(AW88261_1000_US, AW88261_1000_US + 100);
+
+	/* enable amppd */
+	aw_dev_amppd(aw_dev, true);
+
+	/* set power down */
+	aw_dev_pwd(aw_dev, true);
+
+	dev_dbg(aw_dev->dev, "pa stop success\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(aw88261_dev_stop);
+
+int aw88261_dev_init(struct aw_device *aw_dev, struct aw_container *aw_cfg)
+{
+	int ret;
+
+	if ((!aw_dev) || (!aw_cfg)) {
+		pr_err("aw_dev is NULL or aw_cfg is NULL");
+		return -ENOMEM;
+	}
+	ret = aw88261_dev_cfg_load(aw_dev, aw_cfg);
+	if (ret) {
+		dev_err(aw_dev->dev, "aw_dev acf parse failed");
+		return -EINVAL;
+	}
+
+	aw88261_dev_soft_reset(aw_dev);
+	aw_dev->fade_in_time = AW88261_1000_US / 10;
+	aw_dev->fade_out_time = AW88261_1000_US >> 1;
+	aw_dev->prof_cur = AW_INIT_PROFILE;
+	aw_dev->prof_index = AW_INIT_PROFILE;
+
+	ret = aw88261_dev_fw_update(aw_dev);
+	if (ret) {
+		dev_err(aw_dev->dev, "fw update failed ret = %d\n", ret);
+		return ret;
+	}
+
+	ret = aw_frcset_check(aw_dev);
+	if (ret) {
+		dev_err(aw_dev->dev, "aw_frcset_check ret = %d\n", ret);
+		return ret;
+	}
+
+	aw_dev_clear_int_status(aw_dev);
+
+	aw88261_dev_uls_hmute(aw_dev, true);
+
+	aw88261_dev_mute(aw_dev, true);
+
+	aw_dev_i2s_tx_enable(aw_dev, false);
+
+	usleep_range(AW88261_1000_US, AW88261_1000_US + 100);
+
+	aw_dev_amppd(aw_dev, true);
+
+	aw_dev_pwd(aw_dev, true);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(aw88261_dev_init);
+
+static void aw_parse_channel_dt(struct aw_device *aw_dev)
+{
+	struct device_node *np = aw_dev->dev->of_node;
+	u32 channel_value;
+	u32 sync_enable;
+	int ret;
+
+	ret = of_property_read_u32(np, "sound-channel", &channel_value);
+	if (ret)
+		channel_value = AW88261_DEV_DEFAULT_CH;
+
+	ret = of_property_read_u32(np, "sync-flag", &sync_enable);
+	if (ret)
+		sync_enable = false;
+
+	dev_dbg(aw_dev->dev,  "sync flag is %d", sync_enable);
+	dev_dbg(aw_dev->dev, "read sound-channel value is: %d", channel_value);
+
+	aw_dev->channel = channel_value;
+	aw_dev->phase_sync = sync_enable;
+}
+
+static int aw_dev_init(struct aw_device *aw_dev)
+{
+	aw_dev->chip_id = AW88261_CHIP_ID;
+	/* call aw device init func */
+	aw_dev->acf = NULL;
+	aw_dev->prof_info.prof_desc = NULL;
+	aw_dev->prof_info.count = 0;
+	aw_dev->prof_info.prof_type = AW88261_DEV_NONE_TYPE_ID;
+	aw_dev->channel = 0;
+	aw_dev->fw_status = AW88261_DEV_FW_FAILED;
+
+	aw_dev->fade_step = AW88261_VOLUME_STEP_DB;
+	aw_dev->volume_desc.ctl_volume = AW88261_VOL_DEFAULT_VALUE;
+	aw_dev->volume_desc.mute_volume = AW88261_MUTE_VOL;
+	aw_parse_channel_dt(aw_dev);
+
+	return 0;
+}
+
+int aw88261_dev_get_profile_count(struct aw_device *aw_dev)
+{
+	return aw_dev->prof_info.count;
+}
+EXPORT_SYMBOL_GPL(aw88261_dev_get_profile_count);
+
+int aw88261_dev_get_profile_index(struct aw_device *aw_dev)
+{
+	return aw_dev->prof_index;
+}
+EXPORT_SYMBOL_GPL(aw88261_dev_get_profile_index);
+
+int aw88261_dev_set_profile_index(struct aw_device *aw_dev, int index)
+{
+	/* check the index whether is valid */
+	if ((index >= aw_dev->prof_info.count) || (index < 0))
+		return -EINVAL;
+	/* check the index whether change */
+	if (aw_dev->prof_index == index)
+		return -EINVAL;
+
+	aw_dev->prof_index = index;
+	dev_dbg(aw_dev->dev, "set prof[%s]",
+		aw_dev->prof_info.prof_name_list[aw_dev->prof_info.prof_desc[index].id]);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(aw88261_dev_set_profile_index);
+
+char *aw88261_dev_get_prof_name(struct aw_device *aw_dev, int index)
+{
+	struct aw_prof_info *prof_info = &aw_dev->prof_info;
+	struct aw_prof_desc *prof_desc;
+
+	if ((index >= aw_dev->prof_info.count) || (index < 0)) {
+		dev_err(aw_dev->dev, "index[%d] overflow count[%d]",
+			index, aw_dev->prof_info.count);
+		return NULL;
+	}
+
+	prof_desc = &aw_dev->prof_info.prof_desc[index];
+
+	return prof_info->prof_name_list[prof_desc->id];
+}
+EXPORT_SYMBOL_GPL(aw88261_dev_get_prof_name);
+
+int aw88261_dev_get_prof_data(struct aw_device *aw_dev, int index,
+			struct aw_prof_desc **prof_desc)
+{
+	if ((index >= aw_dev->prof_info.count) || (index < 0)) {
+		dev_err(aw_dev->dev, "%s: index[%d] overflow count[%d]\n",
+				__func__, index, aw_dev->prof_info.count);
+		return -EINVAL;
+	}
+
+	*prof_desc = &aw_dev->prof_info.prof_desc[index];
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(aw88261_dev_get_prof_data);
+
+int aw88261_init(struct aw_device **aw_dev, struct i2c_client *i2c, struct regmap *regmap)
+{
+	u16 chip_id;
+	int ret;
+
+	if (*aw_dev) {
+		dev_info(&i2c->dev, "it should be initialized here.\n");
+	} else {
+		*aw_dev = devm_kzalloc(&i2c->dev, sizeof(struct aw_device), GFP_KERNEL);
+		if (!(*aw_dev))
+			return -ENOMEM;
+	}
+
+	(*aw_dev)->i2c = i2c;
+	(*aw_dev)->dev = &i2c->dev;
+	(*aw_dev)->regmap = regmap;
+
+	/* read chip id */
+	ret = aw_dev_read_chipid((*aw_dev), &chip_id);
+	if (ret) {
+		dev_err(&i2c->dev, "dev_read_chipid failed ret=%d", ret);
+		return ret;
+	}
+
+	switch (chip_id) {
+	case AW88261_CHIP_ID:
+		ret = aw_dev_init((*aw_dev));
+		break;
+	default:
+		ret = -EINVAL;
+		dev_err((*aw_dev)->dev, "unsupported device");
+		break;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(aw88261_init);
+
+MODULE_DESCRIPTION("AW88261 device lib");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/aw88261/aw88261_device.h b/sound/soc/codecs/aw88261/aw88261_device.h
new file mode 100644
index 000000000000..56baccd1764f
--- /dev/null
+++ b/sound/soc/codecs/aw88261/aw88261_device.h
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// aw88261_device.h --  AW88261 function for ALSA Audio Driver
+//
+// Copyright (c) 2023 awinic Technology CO., LTD
+//
+// Author: Jimmy Zhang <zhangjianming@awinic.com>
+// Author: Weidong Wang <wangweidong.a@awinic.com>
+//
+
+#ifndef __AW88261_DEVICE_FILE_H__
+#define __AW88261_DEVICE_FILE_H__
+
+#include "aw88261.h"
+#include "aw88261_data_type.h"
+#include "aw88261_lib.h"
+
+#define AW88261_DEV_DEFAULT_CH				(0)
+#define AW88261_ACF_FILE				"aw88261_acf.bin"
+#define AW88261_DEV_SYSST_CHECK_MAX			(10)
+#define AW88261_SOFT_RESET_VALUE			(0x55aa)
+#define AW88261_REG_TO_DB				(0x3f)
+#define AW88261_VOL_START_MASK				(0xfc00)
+
+enum {
+	AW88261_1000_US = 1000,
+	AW88261_2000_US = 2000,
+	AW88261_3000_US = 3000,
+	AW88261_4000_US = 4000,
+	AW88261_5000_US = 5000,
+	AW88261_10000_US = 10000,
+	AW88261_100000_US = 100000,
+};
+
+enum {
+	AW88261_DEV_TYPE_OK = 0,
+	AW88261_DEV_TYPE_NONE = 1,
+};
+
+
+enum AW88261_DEV_STATUS {
+	AW88261_DEV_PW_OFF = 0,
+	AW88261_DEV_PW_ON,
+};
+
+enum AW88261_DEV_FW_STATUS {
+	AW88261_DEV_FW_FAILED = 0,
+	AW88261_DEV_FW_OK,
+};
+
+enum {
+	AW_EF_AND_CHECK = 0,
+	AW_EF_OR_CHECK,
+};
+
+enum {
+	AW_FRCSET_DISABLE = 0,
+	AW_FRCSET_ENABLE,
+};
+
+struct aw_volume_desc {
+	unsigned int init_volume;
+	unsigned int mute_volume;
+	unsigned int ctl_volume;
+	unsigned int max_volume;
+};
+
+struct aw_container {
+	int len;
+	u8 data[];
+};
+
+struct aw_device {
+	u8 fw_status;
+	unsigned char prof_cur;
+	unsigned char prof_index;
+	unsigned char phase_sync;
+	u16 chip_id;
+
+	char *acf;
+	int status;
+	int efuse_check;
+	int frcset_en;
+	unsigned int mute_st;
+	unsigned int amppd_st;
+	unsigned int channel;
+	unsigned int fade_step;
+	unsigned int fade_in_time;
+	unsigned int fade_out_time;
+
+	struct i2c_client *i2c;
+	struct device *dev;
+	struct regmap *regmap;
+	struct aw_prof_info prof_info;
+	struct aw_volume_desc volume_desc;
+};
+
+int aw88261_init(struct aw_device **aw_dev, struct i2c_client *i2c, struct regmap *regmap);
+int aw88261_dev_init(struct aw_device *aw_dev, struct aw_container *aw_cfg);
+int aw88261_dev_start(struct aw_device *aw_dev);
+int aw88261_dev_stop(struct aw_device *aw_dev);
+int aw88261_dev_fw_update(struct aw_device *aw_dev);
+int aw88261_dev_reg_update(struct aw_device *aw_dev, bool force);
+void aw88261_dev_set_volume(struct aw_device *aw_dev, unsigned short set_vol);
+int aw88261_dev_get_prof_data(struct aw_device *aw_dev, int index,
+			struct aw_prof_desc **prof_desc);
+char *aw88261_dev_get_prof_name(struct aw_device *aw_dev, int index);
+int aw88261_dev_set_profile_index(struct aw_device *aw_dev, int index);
+int aw88261_dev_get_profile_index(struct aw_device *aw_dev);
+int aw88261_dev_get_profile_count(struct aw_device *aw_dev);
+int aw88261_dev_load_acf_check(struct aw_device *aw_dev, struct aw_container *aw_cfg);
+int aw88261_dev_cfg_load(struct aw_device *aw_dev, struct aw_container *aw_cfg);
+void aw88261_dev_mute(struct aw_device *aw_dev, bool is_mute);
+#endif
-- 
2.41.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 180E4625960
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 12:29:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EE02166C;
	Fri, 11 Nov 2022 12:28:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EE02166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668166163;
	bh=vwQYap2bYoMdWtLW4Lry7h/ALB2G7qTa+6fI7i6oME0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cC5Ju10oC9xCBVYCZchJpGzXagzPqMz6LcODWhYkECOsGTrmgFa0q1lnHezksXsQq
	 iJbQfHXNIiR8csdw2TPDteVIeb19A9uM0bepYzEPhnzufZhTMaRBg7NSAQgGrO8x0v
	 AexZXPbWRTOuECBHW+3DWvbK4VR+HpCq7CPESlYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96236F800CC;
	Fri, 11 Nov 2022 12:27:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2D17F80587; Fri, 11 Nov 2022 12:27:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE, UNPARSEABLE_RELAY,
 UPPERCASE_50_75, 
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from out29-50.mail.aliyun.com (out29-50.mail.aliyun.com
 [115.124.29.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0819BF804AB
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 12:27:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0819BF804AB
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436282|-1;
 BR=01201311R211S77rulernew998_84748_2000303; CH=blue; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0122612-0.00162934-0.986109;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047212; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.Q5.SfWr_1668166022; 
Received: from localhost.localdomain(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Q5.SfWr_1668166022) by smtp.aliyun-inc.com;
 Fri, 11 Nov 2022 19:27:04 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org, perex@perex.cz, alsa-devel@alsa-project.org,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 quic_potturu@quicinc.com, pierre-louis.bossart@linux.intel.com,
 cy_huang@richtek.com
Subject: [PATCH V3 4/6] ASoC: codecs: Realize aw883xx register configuration
Date: Fri, 11 Nov 2022 19:26:30 +0800
Message-Id: <1668165992-6493-5-git-send-email-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1668165992-6493-1-git-send-email-wangweidong.a@awinic.com>
References: <000701d8e7521f78bc05e6a340awinic.com>
 <1668165992-6493-1-git-send-email-wangweidong.a@awinic.com>
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
 sound/soc/codecs/aw883xx/aw883xx_data_type.h    |  148 ++
 sound/soc/codecs/aw883xx/aw883xx_init.c         |  549 ++++++
 sound/soc/codecs/aw883xx/aw883xx_pid_2049_reg.h | 2387 +++++++++++++++++++++++
 3 files changed, 3084 insertions(+)
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_data_type.h
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_init.c
 create mode 100644 sound/soc/codecs/aw883xx/aw883xx_pid_2049_reg.h

diff --git a/sound/soc/codecs/aw883xx/aw883xx_data_type.h b/sound/soc/codecs/aw883xx/aw883xx_data_type.h
new file mode 100644
index 0000000..a72d2d5
--- /dev/null
+++ b/sound/soc/codecs/aw883xx/aw883xx_data_type.h
@@ -0,0 +1,148 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * aw883xx.c --  ALSA Soc AW883XX codec support
+ *
+ * Copyright (c) 2022 AWINIC Technology CO., LTD
+ *
+ * Author: Bruce zhao <zhaolei@awinic.com>
+ */
+
+#ifndef __AW883XX_DATA_TYPE_H__
+#define __AW883XX_DATA_TYPE_H__
+
+#define AW_NAME_BUF_MAX (50)
+
+/*
+ * aw profile
+ */
+#define PROJECT_NAME_MAX (24)
+#define CUSTOMER_NAME_MAX (16)
+#define CFG_VERSION_MAX (4)
+#define DEV_NAME_MAX (16)
+#define PROFILE_STR_MAX (32)
+
+#define ACF_FILE_ID (0xa15f908)
+
+enum aw_cfg_hdr_version {
+	AW_CFG_HDR_VER_0_0_0_1 = 0x00000001,
+	AW_CFG_HDR_VER_1_0_0_0 = 0x01000000,
+};
+
+enum aw_cfg_dde_type {
+	AW_DEV_NONE_TYPE_ID = 0xFFFFFFFF,
+	AW_DEV_TYPE_ID = 0x00000000,
+	AW_SKT_TYPE_ID = 0x00000001,
+	AW_DEV_DEFAULT_TYPE_ID = 0x00000002,
+};
+
+enum aw_sec_type {
+	ACF_SEC_TYPE_REG = 0,
+	ACF_SEC_TYPE_DSP,
+	ACF_SEC_TYPE_DSP_CFG,
+	ACF_SEC_TYPE_DSP_FW,
+	ACF_SEC_TYPE_HDR_REG,
+	ACF_SEC_TYPE_HDR_DSP_CFG,
+	ACF_SEC_TYPE_HDR_DSP_FW,
+	ACF_SEC_TYPE_MUTLBIN,
+	ACF_SEC_TYPE_SKT_PROJECT,
+	ACF_SEC_TYPE_DSP_PROJECT,
+	ACF_SEC_TYPE_MONITOR,
+	ACF_SEC_TYPE_MAX,
+};
+
+enum profile_data_type {
+	AW_DATA_TYPE_REG = 0,
+	AW_DATA_TYPE_DSP_CFG,
+	AW_DATA_TYPE_DSP_FW,
+	AW_DATA_TYPE_MAX,
+};
+
+enum aw_prof_type {
+	AW_PROFILE_MUSIC = 0,
+	AW_PROFILE_VOICE,
+	AW_PROFILE_VOIP,
+	AW_PROFILE_RINGTONE,
+	AW_PROFILE_RINGTONE_HS,
+	AW_PROFILE_LOWPOWER,
+	AW_PROFILE_BYPASS,
+	AW_PROFILE_MMI,
+	AW_PROFILE_FM,
+	AW_PROFILE_NOTIFICATION,
+	AW_PROFILE_RECEIVER,
+	AW_PROFILE_MAX,
+};
+
+enum aw_profile_status {
+	AW_PROFILE_WAIT = 0,
+	AW_PROFILE_OK,
+};
+
+struct aw_cfg_hdr {
+	uint32_t a_id;					/*acf file ID 0xa15f908*/
+	char a_project[PROJECT_NAME_MAX];		/*project name*/
+	char a_custom[CUSTOMER_NAME_MAX];		/*custom name :huawei xiaomi vivo oppo*/
+	char a_version[CFG_VERSION_MAX];		/*author update version*/
+	uint32_t a_author_id;				/*author id*/
+	uint32_t a_ddt_size;				/*sub section table entry size*/
+	uint32_t a_ddt_num;				/*sub section table entry num*/
+	uint32_t a_hdr_offset;				/*sub section table offset in file*/
+	uint32_t a_hdr_version;				/*sub section table version*/
+	uint32_t reserve[3];
+};
+
+struct aw_cfg_dde {
+	uint32_t type;					/*DDE type id*/
+	char dev_name[DEV_NAME_MAX];
+	uint16_t dev_index;				/*dev id*/
+	uint16_t dev_bus;				/*dev bus id*/
+	uint16_t dev_addr;				/*dev addr id*/
+	uint16_t dev_profile;				/*dev profile id*/
+	uint32_t data_type;				/*data type id*/
+	uint32_t data_size;
+	uint32_t data_offset;
+	uint32_t data_crc;
+	uint32_t reserve[5];
+};
+
+struct aw_cfg_dde_v_1_0_0_0 {
+	uint32_t type;					/*DDE type id*/
+	char dev_name[DEV_NAME_MAX];
+	uint16_t dev_index;				/*dev id*/
+	uint16_t dev_bus;				/*dev bus id*/
+	uint16_t dev_addr;				/*dev addr id*/
+	uint16_t dev_profile;				/*dev profile id*/
+	uint32_t data_type;				/*data type id*/
+	uint32_t data_size;
+	uint32_t data_offset;
+	uint32_t data_crc;
+	char dev_profile_str[PROFILE_STR_MAX];
+	uint32_t chip_id;
+	uint32_t reserve[4];
+};
+
+struct aw_sec_data_desc {
+	uint32_t len;
+	unsigned char *data;
+};
+
+struct aw_prof_desc {
+	uint32_t id;
+	uint32_t prof_st;
+	char *prf_str;
+	uint32_t fw_ver;
+	struct aw_sec_data_desc sec_desc[AW_DATA_TYPE_MAX];
+};
+
+struct aw_all_prof_info {
+	struct aw_prof_desc prof_desc[AW_PROFILE_MAX];
+};
+
+struct aw_prof_info {
+	int count;
+	int prof_type;
+	char **prof_name_list;
+	struct aw_prof_desc *prof_desc;
+};
+
+#endif
+
diff --git a/sound/soc/codecs/aw883xx/aw883xx_init.c b/sound/soc/codecs/aw883xx/aw883xx_init.c
new file mode 100644
index 0000000..29362ff
--- /dev/null
+++ b/sound/soc/codecs/aw883xx/aw883xx_init.c
@@ -0,0 +1,549 @@
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
+#include <linux/firmware.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <linux/regmap.h>
+#include <linux/syscalls.h>
+#include <linux/uaccess.h>
+#include <linux/version.h>
+#include <linux/workqueue.h>
+#include <sound/control.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include "aw883xx.h"
+#include "aw883xx_bin_parse.h"
+#include "aw883xx_pid_2049_reg.h"
+
+#define AW_FW_CHECK_PART		(10)
+#define AW_GET_32_DATA(w, x, y, z) \
+		((uint32_t)((((uint8_t)w) << 24) | (((uint8_t)x) << 16) | \
+		(((uint8_t)y) << 8) | ((uint8_t)z)))
+#define AW_GET_16_DATA(x, y) \
+		((uint16_t)((((uint8_t)x) << 8) | (uint8_t)y))
+
+static int aw883xx_dev_dsp_write(struct aw_device *aw_dev,
+			uint16_t dsp_addr, uint32_t dsp_data, uint8_t data_type)
+{
+	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
+
+	return aw883xx_dsp_write(aw883xx, dsp_addr, dsp_data, data_type);
+}
+
+static int aw883xx_dev_dsp_read(struct aw_device *aw_dev,
+			uint16_t dsp_addr, uint32_t *dsp_data, uint8_t data_type)
+{
+	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
+
+	return aw883xx_dsp_read(aw883xx, dsp_addr, dsp_data, data_type);
+}
+
+/*
+ * aw883xx i2c write/read
+ */
+/*[9 : 6]: -6DB ; [5 : 0]: -0.125DB  real_value = value * 8 : 0.125db --> 1*/
+static unsigned int aw_pid_2049_reg_val_to_db(unsigned int value)
+{
+	return (((value >> AW_PID_2049_VOL_6DB_START) * AW_PID_2049_VOLUME_STEP_DB) +
+			((value & 0x3f) % AW_PID_2049_VOLUME_STEP_DB));
+}
+
+/*[9 : 6]: -6DB ; [5 : 0]: -0.125DB reg_value = value / step << 6 + value % step ; step = 6 * 8*/
+static uint16_t aw_pid_2049_db_val_to_reg(uint16_t value)
+{
+	return (((value / AW_PID_2049_VOLUME_STEP_DB) << AW_PID_2049_VOL_6DB_START) +
+			(value % AW_PID_2049_VOLUME_STEP_DB));
+}
+
+static int aw883xx_set_volume(struct aw883xx *aw883xx, uint16_t value)
+{
+	unsigned int reg_value = 0;
+	uint16_t real_value = 0;
+	uint16_t volume = 0;
+	struct aw_volume_desc *vol_desc = &aw883xx->aw_pa->volume_desc;
+
+	volume = AW_GET_MIN_VALUE(value, vol_desc->mute_volume);
+	real_value = aw_pid_2049_db_val_to_reg(volume);
+
+	/* cal real value */
+	regmap_read(aw883xx->regmap, AW_PID_2049_SYSCTRL2_REG, &reg_value);
+
+	dev_dbg(aw883xx->dev, "value 0x%x , reg:0x%x", value, real_value);
+
+	/*[15 : 6] volume*/
+	real_value = (real_value << AW_PID_2049_VOL_START_BIT) | (reg_value & AW_PID_2049_VOL_MASK);
+
+	/* write value */
+	regmap_write(aw883xx->regmap, AW_PID_2049_SYSCTRL2_REG, real_value);
+
+	return 0;
+}
+
+static int aw883xx_get_volume(struct aw883xx *aw883xx, uint16_t *value)
+{
+	unsigned int reg_value = 0;
+	uint16_t real_value = 0;
+
+	/* read value */
+	regmap_read(aw883xx->regmap, AW_PID_2049_SYSCTRL2_REG, &reg_value);
+
+	/*[15 : 6] volume*/
+	real_value = reg_value >> AW_PID_2049_VOL_START_BIT;
+
+	real_value = aw_pid_2049_reg_val_to_db(real_value);
+
+	*value = real_value;
+
+	return 0;
+}
+
+static int aw_pid_2049_set_volume(struct aw_device *aw_dev, uint16_t value)
+{
+	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
+
+	return aw883xx_set_volume(aw883xx, value);
+}
+
+static int aw_pid_2049_get_volume(struct aw_device *aw_dev, uint16_t *value)
+{
+	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
+
+	return aw883xx_get_volume(aw883xx, value);
+}
+
+static void aw_pid_2049_i2s_tx_enable(struct aw_device *aw_dev, bool flag)
+{
+	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
+
+	if (flag) {
+		regmap_update_bits(aw883xx->regmap, AW_PID_2049_I2SCFG1_REG,
+				~AW_PID_2049_I2STXEN_MASK,
+				AW_PID_2049_I2STXEN_ENABLE_VALUE);
+	} else {;
+		regmap_update_bits(aw883xx->regmap, AW_PID_2049_I2SCFG1_REG,
+				~AW_PID_2049_I2STXEN_MASK,
+				AW_PID_2049_I2STXEN_DISABLE_VALUE);
+	}
+}
+
+static void aw_pid_2049_set_cfg_f0_fs(struct aw_device *aw_dev, uint32_t *f0_fs)
+{
+	unsigned int rate_data = 0;
+	uint32_t fs = 0;
+	struct aw883xx *aw883xx = (struct aw883xx *)aw_dev->private_data;
+
+	regmap_read(aw883xx->regmap, AW_PID_2049_I2SCTRL_REG, &rate_data);
+
+	switch (rate_data & (~AW_PID_2049_I2SSR_MASK)) {
+	case AW_PID_2049_I2SSR_8_KHZ_VALUE:
+		fs = 8000;
+		break;
+	case AW_PID_2049_I2SSR_16_KHZ_VALUE:
+		fs = 16000;
+		break;
+	case AW_PID_2049_I2SSR_32_KHZ_VALUE:
+		fs = 32000;
+		break;
+	case AW_PID_2049_I2SSR_44_KHZ_VALUE:
+		fs = 44000;
+		break;
+	case AW_PID_2049_I2SSR_48_KHZ_VALUE:
+		fs = 48000;
+		break;
+	case AW_PID_2049_I2SSR_96_KHZ_VALUE:
+		fs = 96000;
+		break;
+	case AW_PID_2049_I2SSR_192KHZ_VALUE:
+		fs = 192000;
+		break;
+	default:
+		fs = 48000;
+		dev_err(aw883xx->dev,
+			"rate can not support, use default 48k");
+		break;
+	}
+
+	dev_dbg(aw883xx->dev, "get i2s fs:%d", fs);
+	*f0_fs = fs / 8;
+
+	aw883xx_dsp_write(aw883xx,
+		AW_PID_2049_DSP_REG_CFGF0_FS, *f0_fs, AW_DSP_32_DATA);
+}
+
+static bool aw_pid_2049_check_rd_access(int reg)
+{
+	if (reg >= AW_PID_2049_REG_MAX)
+		return false;
+
+	if (aw_pid_2049_reg_access[reg] & REG_RD_ACCESS)
+		return true;
+	else
+		return false;
+}
+
+static bool aw_pid_2049_check_wr_access(int reg)
+{
+	if (reg >= AW_PID_2049_REG_MAX)
+		return false;
+
+	if (aw_pid_2049_reg_access[reg] & REG_WR_ACCESS)
+		return true;
+	else
+		return false;
+}
+
+static int aw_pid_2049_get_reg_num(void)
+{
+	return AW_PID_2049_REG_MAX;
+}
+
+static int aw_pid_2049_dsp_fw_check(struct aw_device *aw_dev)
+{
+	struct aw_prof_desc *set_prof_desc = NULL;
+	struct aw_sec_data_desc *dsp_fw_desc = NULL;
+	uint16_t base_addr = AW_PID_2049_DSP_FW_ADDR;
+	uint16_t addr = base_addr;
+	int ret, i;
+	uint32_t dsp_val;
+	uint16_t bin_val;
+
+	ret = aw883xx_dev_get_prof_data(aw_dev, aw_dev->cur_prof, &set_prof_desc);
+	if (ret < 0)
+		return ret;
+
+	/*update reg*/
+	dsp_fw_desc = &set_prof_desc->sec_desc[AW_DATA_TYPE_DSP_FW];
+
+	for (i = 0; i < AW_FW_CHECK_PART; i++) {
+		ret = aw883xx_dev_dsp_read(aw_dev, addr, &dsp_val, AW_DSP_16_DATA);
+		if (ret  < 0) {
+			dev_err(aw_dev->dev, "dsp read failed");
+			return ret;
+		}
+
+		bin_val = AW_GET_16_DATA(dsp_fw_desc->data[2 * (addr - base_addr)],
+					dsp_fw_desc->data[2 * (addr - base_addr) + 1]);
+
+		if (dsp_val != bin_val) {
+			dev_err(aw_dev->dev, "check failed, addr[0x%x], read[0x%x] != bindata[0x%x]",
+					addr, dsp_val, bin_val);
+			return -EINVAL;
+		}
+
+		addr += (dsp_fw_desc->len / 2) / AW_FW_CHECK_PART;
+		if ((addr - base_addr) > dsp_fw_desc->len) {
+			dev_err(aw_dev->dev, "check failed, addr[0x%x] too large", addr);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int aw_pid_2049_set_cali_re_to_dsp(struct aw_device *aw_dev)
+{
+	struct aw_adpz_re_desc *adpz_re_desc = &aw_dev->adpz_re_desc;
+	uint32_t cali_re = 0;
+	int ret = 0;
+
+	cali_re = AW_SHOW_RE_TO_DSP_RE((aw_dev->cali_desc.cali_re +
+		aw_dev->cali_desc.ra), adpz_re_desc->shift);
+
+	/* set cali re to aw883xx */
+	ret = aw_dev->ops.aw_dsp_write(aw_dev,
+			adpz_re_desc->dsp_reg, cali_re, adpz_re_desc->data_type);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "set cali re error");
+		return ret;
+	}
+
+	ret = aw883xx_dev_modify_dsp_cfg(aw_dev, adpz_re_desc->dsp_reg,
+				cali_re, adpz_re_desc->data_type);
+	if (ret < 0) {
+		dev_err(aw_dev->dev, "modify dsp cfg failed");
+		return ret;
+	}
+
+	return ret;
+
+}
+
+static int aw883xx_pid_2049_dev_init(struct aw883xx *aw883xx)
+{
+	struct aw_device *aw_pa = NULL;
+
+	aw_pa = devm_kzalloc(aw883xx->dev, sizeof(struct aw_device), GFP_KERNEL);
+	if (!aw_pa)
+		return -ENOMEM;
+
+	/*call aw device init func*/
+	aw_pa->acf = NULL;
+	aw_pa->prof_info.prof_desc = NULL;
+	aw_pa->prof_info.count = 0;
+	aw_pa->prof_info.prof_type = AW_DEV_NONE_TYPE_ID;
+	aw_pa->channel = 0;
+	aw_pa->dsp_lock = &aw883xx->dsp_lock;
+	aw_pa->i2c = aw883xx->i2c;
+	aw_pa->fw_status = AW_DEV_FW_FAILED;
+	aw_pa->fade_step = AW_PID_2049_VOLUME_STEP_DB;
+
+	aw_pa->chip_id = aw883xx->chip_id;
+	aw_pa->private_data = (void *)aw883xx;
+	aw_pa->dev = aw883xx->dev;
+	aw_pa->ops.aw_i2c_writes = regmap_raw_write;
+	aw_pa->ops.aw_i2c_write = regmap_write;
+	aw_pa->ops.aw_reg_write = regmap_write;
+	aw_pa->ops.aw_reg_write_bits = regmap_update_bits;
+	aw_pa->ops.aw_i2c_read = regmap_read;
+	aw_pa->ops.aw_reg_read = regmap_read;
+	aw_pa->ops.aw_dsp_read = aw883xx_dev_dsp_read;
+	aw_pa->ops.aw_dsp_write = aw883xx_dev_dsp_write;
+
+	aw_pa->ops.aw_get_hw_volume = aw_pid_2049_get_volume;
+	aw_pa->ops.aw_set_hw_volume = aw_pid_2049_set_volume;
+	aw_pa->ops.aw_reg_val_to_db = aw_pid_2049_reg_val_to_db;
+
+	aw_pa->ops.aw_check_rd_access = aw_pid_2049_check_rd_access;
+	aw_pa->ops.aw_check_wr_access = aw_pid_2049_check_wr_access;
+	aw_pa->ops.aw_get_reg_num = aw_pid_2049_get_reg_num;
+
+	aw_pa->ops.aw_i2s_tx_enable = aw_pid_2049_i2s_tx_enable;
+
+	aw_pa->ops.aw_set_cfg_f0_fs = aw_pid_2049_set_cfg_f0_fs;
+	aw_pa->ops.aw_dsp_fw_check = aw_pid_2049_dsp_fw_check;
+
+	aw_pa->ops.aw_set_cali_re = aw_pid_2049_set_cali_re_to_dsp;
+
+	aw_pa->int_desc.mask_reg = AW_PID_2049_SYSINTM_REG;
+	aw_pa->int_desc.mask_default = AW_PID_2049_SYSINTM_DEFAULT;
+	aw_pa->int_desc.int_mask = AW_PID_2049_SYSINTM_DEFAULT;
+	aw_pa->int_desc.st_reg = AW_PID_2049_SYSINT_REG;
+	aw_pa->int_desc.intst_mask = AW_PID_2049_BIT_SYSINT_CHECK;
+
+	aw_pa->pwd_desc.reg = AW_PID_2049_SYSCTRL_REG;
+	aw_pa->pwd_desc.mask = AW_PID_2049_PWDN_MASK;
+	aw_pa->pwd_desc.enable = AW_PID_2049_PWDN_POWER_DOWN_VALUE;
+	aw_pa->pwd_desc.disable = AW_PID_2049_PWDN_WORKING_VALUE;
+
+	aw_pa->mute_desc.reg = AW_PID_2049_SYSCTRL_REG;
+	aw_pa->mute_desc.mask = AW_PID_2049_HMUTE_MASK;
+	aw_pa->mute_desc.enable = AW_PID_2049_HMUTE_ENABLE_VALUE;
+	aw_pa->mute_desc.disable = AW_PID_2049_HMUTE_DISABLE_VALUE;
+
+	aw_pa->vcalb_desc.vcalb_dsp_reg = AW_PID_2049_DSP_REG_VCALB;
+	aw_pa->vcalb_desc.data_type = AW_DSP_16_DATA;
+	aw_pa->vcalb_desc.vcal_factor = AW_PID_2049_VCAL_FACTOR;
+	aw_pa->vcalb_desc.cabl_base_value = AW_PID_2049_CABL_BASE_VALUE;
+	aw_pa->vcalb_desc.vscal_factor = AW_PID_2049_VSCAL_FACTOR;
+	aw_pa->vcalb_desc.iscal_factor = AW_PID_2049_ISCAL_FACTOR;
+
+	aw_pa->vcalb_desc.vcalb_adj_shift = AW_PID_2049_VCALB_ADJ_FACTOR;
+
+	aw_pa->vcalb_desc.icalk_value_factor = AW_PID_2049_ICABLK_FACTOR;
+	aw_pa->vcalb_desc.icalk_reg = AW_PID_2049_EFRM2_REG;
+	aw_pa->vcalb_desc.icalk_reg_mask = AW_PID_2049_EF_ISN_GESLP_MASK;
+	aw_pa->vcalb_desc.icalk_sign_mask = AW_PID_2049_EF_ISN_GESLP_SIGN_MASK;
+	aw_pa->vcalb_desc.icalk_neg_mask = AW_PID_2049_EF_ISN_GESLP_SIGN_NEG;
+
+	aw_pa->vcalb_desc.vcalk_reg = AW_PID_2049_EFRH_REG;
+	aw_pa->vcalb_desc.vcalk_reg_mask = AW_PID_2049_EF_VSN_GESLP_MASK;
+	aw_pa->vcalb_desc.vcalk_sign_mask = AW_PID_2049_EF_VSN_GESLP_SIGN_MASK;
+	aw_pa->vcalb_desc.vcalk_neg_mask = AW_PID_2049_EF_VSN_GESLP_SIGN_NEG;
+	aw_pa->vcalb_desc.vcalk_value_factor = AW_PID_2049_VCABLK_FACTOR;
+	aw_pa->vcalb_desc.vcalk_shift = AW_PID_2049_EF_VSENSE_GAIN_SHIFT;
+
+	aw_pa->vcalb_desc.vcalb_vsense_reg = AW_PID_2049_I2SCFG3_REG;
+	aw_pa->vcalb_desc.vcalk_vdsel_mask = AW_PID_2049_VDSEL_MASK;
+	aw_pa->vcalb_desc.vcalk_value_factor_vsense_in = AW_PID_2049_VCABLK_FACTOR_DAC;
+	aw_pa->vcalb_desc.vscal_factor_vsense_in = AW_PID_2049_VSCAL_FACTOR_DAC;
+	aw_pa->vcalb_desc.vcalk_dac_shift = AW_PID_2049_EF_DAC_GESLP_SHIFT;
+	aw_pa->vcalb_desc.vcalk_dac_mask = AW_PID_2049_EF_DAC_GESLP_SIGN_MASK;
+	aw_pa->vcalb_desc.vcalk_dac_neg_mask = AW_PID_2049_EF_DAC_GESLP_SIGN_NEG;
+
+	aw_pa->sysst_desc.reg = AW_PID_2049_SYSST_REG;
+	aw_pa->sysst_desc.st_check = AW_PID_2049_BIT_SYSST_CHECK;
+	aw_pa->sysst_desc.st_mask = AW_PID_2049_BIT_SYSST_CHECK_MASK;
+	aw_pa->sysst_desc.pll_check = AW_PID_2049_BIT_PLL_CHECK;
+	aw_pa->sysst_desc.dsp_check = AW_PID_2049_DSPS_NORMAL_VALUE;
+	aw_pa->sysst_desc.dsp_mask = AW_PID_2049_DSPS_MASK;
+
+	aw_pa->profctrl_desc.reg = AW_PID_2049_SYSCTRL_REG;
+	aw_pa->profctrl_desc.mask = AW_PID_2049_RCV_MODE_MASK;
+	aw_pa->profctrl_desc.rcv_mode_val = AW_PID_2049_RCV_MODE_RECEIVER_VALUE;
+
+	aw_pa->volume_desc.reg = AW_PID_2049_SYSCTRL2_REG;
+	aw_pa->volume_desc.mask = AW_PID_2049_VOL_MASK;
+	aw_pa->volume_desc.shift = AW_PID_2049_VOL_START_BIT;
+	aw_pa->volume_desc.mute_volume = AW_PID_2049_MUTE_VOL;
+	aw_pa->volume_desc.max_volume = AW_PID_2049_VOL_DEFAULT_VALUE;
+	aw_pa->volume_desc.ctl_volume = AW_PID_2049_VOL_DEFAULT_VALUE;
+
+	aw_pa->dsp_en_desc.reg = AW_PID_2049_SYSCTRL_REG;
+	aw_pa->dsp_en_desc.mask = AW_PID_2049_DSPBY_MASK;
+	aw_pa->dsp_en_desc.enable = AW_PID_2049_DSPBY_WORKING_VALUE;
+	aw_pa->dsp_en_desc.disable = AW_PID_2049_DSPBY_BYPASS_VALUE;
+
+	aw_pa->memclk_desc.reg = AW_PID_2049_DBGCTRL_REG;
+	aw_pa->memclk_desc.mask = AW_PID_2049_MEM_CLKSEL_MASK;
+	aw_pa->memclk_desc.mcu_hclk = AW_PID_2049_MEM_CLKSEL_DAP_HCLK_VALUE;
+	aw_pa->memclk_desc.osc_clk = AW_PID_2049_MEM_CLKSEL_OSC_CLK_VALUE;
+
+	aw_pa->watch_dog_desc.reg = AW_PID_2049_WDT_REG;
+	aw_pa->watch_dog_desc.mask = AW_PID_2049_WDT_CNT_MASK;
+
+	aw_pa->dsp_mem_desc.dsp_madd_reg = AW_PID_2049_DSPMADD_REG;
+	aw_pa->dsp_mem_desc.dsp_mdat_reg = AW_PID_2049_DSPMDAT_REG;
+	aw_pa->dsp_mem_desc.dsp_cfg_base_addr = AW_PID_2049_DSP_CFG_ADDR;
+	aw_pa->dsp_mem_desc.dsp_fw_base_addr = AW_PID_2049_DSP_FW_ADDR;
+
+	aw_pa->voltage_desc.reg = AW_PID_2049_VBAT_REG;
+	aw_pa->voltage_desc.vbat_range = AW_PID_2049_VBAT_RANGE;
+	aw_pa->voltage_desc.int_bit = AW_PID_2049_INT_10BIT;
+
+	aw_pa->temp_desc.reg = AW_PID_2049_TEMP_REG;
+	aw_pa->temp_desc.sign_mask = AW_PID_2049_TEMP_SIGN_MASK;
+	aw_pa->temp_desc.neg_mask = AW_PID_2049_TEMP_NEG_MASK;
+
+	aw_pa->vmax_desc.dsp_reg = AW_PID_2049_DSP_REG_VMAX;
+	aw_pa->vmax_desc.data_type = AW_DSP_16_DATA;
+
+	aw_pa->ipeak_desc.reg = AW_PID_2049_SYSCTRL2_REG;
+	aw_pa->ipeak_desc.mask = AW_PID_2049_BST_IPEAK_MASK;
+
+	aw_pa->soft_rst.reg = AW_PID_2049_ID_REG;
+	aw_pa->soft_rst.reg_value = AW_PID_2049_SOFT_RESET_VALUE;
+
+	aw_pa->dsp_vol_desc.reg = AW_PID_2049_DSPCFG_REG;
+	aw_pa->dsp_vol_desc.mask = AW_PID_2049_DSP_VOL_MASK;
+	aw_pa->dsp_vol_desc.mute_st = AW_PID_2049_DSP_VOL_MUTE;
+	aw_pa->dsp_vol_desc.noise_st = AW_PID_2049_DSP_VOL_NOISE_ST;
+
+	aw_pa->amppd_desc.reg = AW_PID_2049_SYSCTRL_REG;
+	aw_pa->amppd_desc.mask = AW_PID_2049_AMPPD_MASK;
+	aw_pa->amppd_desc.enable = AW_PID_2049_AMPPD_POWER_DOWN_VALUE;
+	aw_pa->amppd_desc.disable = AW_PID_2049_AMPPD_WORKING_VALUE;
+
+	aw_pa->spkr_temp_desc.reg = AW_PID_2049_ASR2_REG;
+
+	/*32-bit data types need bypass dsp*/
+	aw_pa->ra_desc.dsp_reg = AW_PID_2049_DSP_REG_CFG_ADPZ_RA;
+	aw_pa->ra_desc.data_type = AW_DSP_32_DATA;
+
+	/*32-bit data types need bypass dsp*/
+	aw_pa->cali_cfg_desc.actampth_reg = AW_PID_2049_DSP_REG_CFG_MBMEC_ACTAMPTH;
+	aw_pa->cali_cfg_desc.actampth_data_type = AW_DSP_32_DATA;
+
+	/*32-bit data types need bypass dsp*/
+	aw_pa->cali_cfg_desc.noiseampth_reg = AW_PID_2049_DSP_REG_CFG_MBMEC_NOISEAMPTH;
+	aw_pa->cali_cfg_desc.noiseampth_data_type = AW_DSP_32_DATA;
+
+	aw_pa->cali_cfg_desc.ustepn_reg = AW_PID_2049_DSP_REG_CFG_ADPZ_USTEPN;
+	aw_pa->cali_cfg_desc.ustepn_data_type = AW_DSP_16_DATA;
+
+	aw_pa->cali_cfg_desc.alphan_reg = AW_PID_2049_DSP_REG_CFG_RE_ALPHA;
+	aw_pa->cali_cfg_desc.alphan_data_type = AW_DSP_16_DATA;
+
+	/*32-bit data types need bypass dsp*/
+	aw_pa->adpz_re_desc.dsp_reg = AW_PID_2049_DSP_REG_CFG_ADPZ_RE;
+	aw_pa->adpz_re_desc.data_type = AW_DSP_32_DATA;
+	aw_pa->adpz_re_desc.shift = AW_PID_2049_DSP_RE_SHIFT;
+
+	aw_pa->t0_desc.dsp_reg = AW_PID_2049_DSP_CFG_ADPZ_T0;
+	aw_pa->t0_desc.data_type = AW_DSP_16_DATA;
+	aw_pa->t0_desc.coilalpha_reg = AW_PID_2049_DSP_CFG_ADPZ_COILALPHA;
+	aw_pa->t0_desc.coil_type = AW_DSP_16_DATA;
+
+	aw_pa->ste_re_desc.shift = AW_PID_2049_DSP_REG_CALRE_SHIFT;
+	aw_pa->ste_re_desc.dsp_reg = AW_PID_2049_DSP_REG_CALRE;
+	aw_pa->ste_re_desc.data_type = AW_DSP_16_DATA;
+
+	aw_pa->noise_desc.dsp_reg = AW_PID_2049_DSP_REG_CFG_MBMEC_GLBCFG;
+	aw_pa->noise_desc.data_type = AW_DSP_16_DATA;
+	aw_pa->noise_desc.mask = AW_PID_2049_DSP_REG_NOISE_MASK;
+
+	aw_pa->f0_desc.dsp_reg = AW_PID_2049_DSP_REG_RESULT_F0;
+	aw_pa->f0_desc.shift = AW_PID_2049_DSP_F0_SHIFT;
+	aw_pa->f0_desc.data_type = AW_DSP_16_DATA;
+
+	/*32-bit data types need bypass dsp*/
+	aw_pa->cfgf0_fs_desc.dsp_reg = AW_PID_2049_DSP_REG_CFGF0_FS;
+	aw_pa->cfgf0_fs_desc.data_type = AW_DSP_32_DATA;
+
+	aw_pa->q_desc.dsp_reg = AW_PID_2049_DSP_REG_RESULT_Q;
+	aw_pa->q_desc.shift = AW_PID_2049_DSP_Q_SHIFT;
+	aw_pa->q_desc.data_type = AW_DSP_16_DATA;
+
+	/*32-bit data types need bypass dsp*/
+	aw_pa->dsp_crc_desc.dsp_reg = AW_PID_2049_DSP_REG_CRC_ADDR;
+	aw_pa->dsp_crc_desc.data_type = AW_DSP_32_DATA;
+
+	aw_pa->dsp_crc_desc.ctl_reg = AW_PID_2049_HAGCCFG7_REG;
+	aw_pa->dsp_crc_desc.ctl_mask = AW_PID_2049_AGC_DSP_CTL_MASK;
+	aw_pa->dsp_crc_desc.ctl_enable = AW_PID_2049_AGC_DSP_CTL_ENABLE_VALUE;
+	aw_pa->dsp_crc_desc.ctl_disable = AW_PID_2049_AGC_DSP_CTL_DISABLE_VALUE;
+
+	aw_pa->cco_mux_desc.reg = AW_PID_2049_PLLCTRL1_REG;
+	aw_pa->cco_mux_desc.mask = AW_PID_2049_CCO_MUX_MASK;
+	aw_pa->cco_mux_desc.divider = AW_PID_2049_CCO_MUX_DIVIDED_VALUE;
+	aw_pa->cco_mux_desc.bypass = AW_PID_2049_CCO_MUX_BYPASS_VALUE;
+
+	/*hw monitor temp reg*/
+	aw_pa->hw_temp_desc.dsp_reg = AW_PID_2049_DSP_REG_TEMP_ADDR;
+	aw_pa->hw_temp_desc.data_type = AW_DSP_16_DATA;
+
+	aw_pa->chansel_desc.rxchan_reg = AW_PID_2049_I2SCTRL_REG;
+	aw_pa->chansel_desc.rxchan_mask = AW_PID_2049_CHSEL_MASK;
+	aw_pa->chansel_desc.txchan_reg = AW_PID_2049_I2SCFG1_REG;
+	aw_pa->chansel_desc.txchan_mask = AW_PID_2049_I2SCHS_MASK;
+
+	aw_pa->chansel_desc.rx_left = AW_PID_2049_CHSEL_LEFT_VALUE;
+	aw_pa->chansel_desc.rx_right = AW_PID_2049_CHSEL_RIGHT_VALUE;
+	aw_pa->chansel_desc.tx_left = AW_PID_2049_I2SCHS_LEFT_VALUE;
+	aw_pa->chansel_desc.tx_right = AW_PID_2049_I2SCHS_RIGHT_VALUE;
+
+	aw_pa->tx_en_desc.tx_en_mask = AW_PID_2049_I2STXEN_MASK;
+	aw_pa->tx_en_desc.tx_disable = AW_PID_2049_I2STXEN_DISABLE_VALUE;
+
+	aw_pa->cali_delay_desc.dsp_reg = AW_PID_2049_DSP_CALI_F0_DELAY;
+	aw_pa->cali_delay_desc.data_type = AW_DSP_16_DATA;
+
+	aw_pa->dsp_st_desc.dsp_reg_s1 = AW_PID_2049_DSP_ST_S1;
+	aw_pa->dsp_st_desc.dsp_reg_e1 = AW_PID_2049_DSP_ST_E1;
+	aw_pa->dsp_st_desc.dsp_reg_s2 = AW_PID_2049_DSP_ST_S2;
+	aw_pa->dsp_st_desc.dsp_reg_e2 = AW_PID_2049_DSP_ST_E2;
+
+	aw883xx_device_probe(aw_pa);
+
+	aw883xx->aw_pa = aw_pa;
+
+	return 0;
+}
+
+int aw883xx_init(struct aw883xx *aw883xx)
+{
+	int ret = 0;
+
+	switch (aw883xx->chip_id) {
+	case AW883XX_PID_2049:
+		ret = aw883xx_pid_2049_dev_init(aw883xx);
+		break;
+	default:
+		ret = -EINVAL;
+		dev_err(aw883xx->dev, "unsupported device");
+		break;
+	}
+	return ret;
+}
+
diff --git a/sound/soc/codecs/aw883xx/aw883xx_pid_2049_reg.h b/sound/soc/codecs/aw883xx/aw883xx_pid_2049_reg.h
new file mode 100644
index 0000000..9b08d53
--- /dev/null
+++ b/sound/soc/codecs/aw883xx/aw883xx_pid_2049_reg.h
@@ -0,0 +1,2387 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * aw883xx.c --  ALSA Soc AW883XX codec support
+ *
+ * Copyright (c) 2022 AWINIC Technology CO., LTD
+ *
+ * Author: Bruce zhao <zhaolei@awinic.com>
+ */
+
+#ifndef __AW883XX_PID_2049_REG_H__
+#define __AW883XX_PID_2049_REG_H__
+
+#define AW_PID_2049_ID_REG				(0x00)
+#define AW_PID_2049_SYSST_REG			(0x01)
+#define AW_PID_2049_SYSINT_REG			(0x02)
+#define AW_PID_2049_SYSINTM_REG			(0x03)
+#define AW_PID_2049_SYSCTRL_REG			(0x04)
+#define AW_PID_2049_SYSCTRL2_REG		(0x05)
+#define AW_PID_2049_I2SCTRL_REG			(0x06)
+#define AW_PID_2049_I2SCFG1_REG			(0x07)
+#define AW_PID_2049_I2SCFG2_REG			(0x08)
+#define AW_PID_2049_HAGCCFG1_REG		(0x09)
+#define AW_PID_2049_HAGCCFG2_REG		(0x0A)
+#define AW_PID_2049_HAGCCFG3_REG		(0x0B)
+#define AW_PID_2049_HAGCCFG4_REG		(0x0C)
+#define AW_PID_2049_HAGCCFG5_REG		(0x0D)
+#define AW_PID_2049_HAGCCFG6_REG		(0x0E)
+#define AW_PID_2049_HAGCCFG7_REG		(0x0F)
+#define AW_PID_2049_MPDCFG_REG			(0x10)
+#define AW_PID_2049_PWMCTRL_REG			(0x11)
+#define AW_PID_2049_I2SCFG3_REG			(0x12)
+#define AW_PID_2049_DBGCTRL_REG			(0x13)
+#define AW_PID_2049_HAGCST_REG			(0x20)
+#define AW_PID_2049_VBAT_REG			(0x21)
+#define AW_PID_2049_TEMP_REG			(0x22)
+#define AW_PID_2049_PVDD_REG			(0x23)
+#define AW_PID_2049_ISNDAT_REG			(0x24)
+#define AW_PID_2049_VSNDAT_REG			(0x25)
+#define AW_PID_2049_I2SINT_REG			(0x26)
+#define AW_PID_2049_I2SCAPCNT_REG		(0x27)
+#define AW_PID_2049_ANASTA1_REG			(0x28)
+#define AW_PID_2049_ANASTA2_REG			(0x29)
+#define AW_PID_2049_ANASTA3_REG			(0x2A)
+#define AW_PID_2049_ANASTA4_REG			(0x2B)
+#define AW_PID_2049_TESTDET_REG			(0x2C)
+#define AW_PID_2049_TESTIN_REG			(0x38)
+#define AW_PID_2049_TESTOUT_REG			(0x39)
+#define AW_PID_2049_DSPMADD_REG			(0x40)
+#define AW_PID_2049_DSPMDAT_REG			(0x41)
+#define AW_PID_2049_WDT_REG				(0x42)
+#define AW_PID_2049_ACR1_REG			(0x43)
+#define AW_PID_2049_ACR2_REG			(0x44)
+#define AW_PID_2049_ASR1_REG			(0x45)
+#define AW_PID_2049_ASR2_REG			(0x46)
+#define AW_PID_2049_DSPCFG_REG			(0x47)
+#define AW_PID_2049_ASR3_REG			(0x48)
+#define AW_PID_2049_ASR4_REG			(0x49)
+#define AW_PID_2049_VSNCTRL1_REG		(0x50)
+#define AW_PID_2049_ISNCTRL1_REG		(0x51)
+#define AW_PID_2049_PLLCTRL1_REG		(0x52)
+#define AW_PID_2049_PLLCTRL2_REG		(0x53)
+#define AW_PID_2049_PLLCTRL3_REG		(0x54)
+#define AW_PID_2049_CDACTRL1_REG		(0x55)
+#define AW_PID_2049_CDACTRL2_REG		(0x56)
+#define AW_PID_2049_SADCCTRL1_REG		(0x57)
+#define AW_PID_2049_SADCCTRL2_REG		(0x58)
+#define AW_PID_2049_CPCTRL1_REG			(0x59)
+#define AW_PID_2049_BSTCTRL1_REG		(0x60)
+#define AW_PID_2049_BSTCTRL2_REG		(0x61)
+#define AW_PID_2049_BSTCTRL3_REG		(0x62)
+#define AW_PID_2049_BSTCTRL4_REG		(0x63)
+#define AW_PID_2049_BSTCTRL5_REG		(0x64)
+#define AW_PID_2049_BSTCTRL6_REG		(0x65)
+#define AW_PID_2049_BSTCTRL7_REG		(0x66)
+#define AW_PID_2049_DSMCFG1_REG			(0x67)
+#define AW_PID_2049_DSMCFG2_REG			(0x68)
+#define AW_PID_2049_DSMCFG3_REG			(0x69)
+#define AW_PID_2049_DSMCFG4_REG			(0x6A)
+#define AW_PID_2049_DSMCFG5_REG			(0x6B)
+#define AW_PID_2049_DSMCFG6_REG			(0x6C)
+#define AW_PID_2049_DSMCFG7_REG			(0x6D)
+#define AW_PID_2049_DSMCFG8_REG			(0x6E)
+#define AW_PID_2049_TESTCTRL1_REG		(0x70)
+#define AW_PID_2049_TESTCTRL2_REG		(0x71)
+#define AW_PID_2049_EFCTRL1_REG			(0x72)
+#define AW_PID_2049_EFCTRL2_REG			(0x73)
+#define AW_PID_2049_EFWH_REG			(0x74)
+#define AW_PID_2049_EFWM2_REG			(0x75)
+#define AW_PID_2049_EFWM1_REG			(0x76)
+#define AW_PID_2049_EFWL_REG			(0x77)
+#define AW_PID_2049_EFRH_REG			(0x78)
+#define AW_PID_2049_EFRM2_REG			(0x79)
+#define AW_PID_2049_EFRM1_REG			(0x7A)
+#define AW_PID_2049_EFRL_REG			(0x7B)
+#define AW_PID_2049_TM_REG				(0x7C)
+
+/*
+ * Register Access
+ */
+enum aw883xx_id {
+	AW883XX_PID_2049 = 0x2049,
+};
+
+#define AW_PID_2049_REG_MAX				(0x7D)
+
+#define REG_NONE_ACCESS					(0)
+#define REG_RD_ACCESS					(1 << 0)
+#define REG_WR_ACCESS					(1 << 1)
+
+static const unsigned char aw_pid_2049_reg_access[AW_PID_2049_REG_MAX] = {
+	[AW_PID_2049_ID_REG]		= (REG_RD_ACCESS),
+	[AW_PID_2049_SYSST_REG]		= (REG_RD_ACCESS),
+	[AW_PID_2049_SYSINT_REG]	= (REG_RD_ACCESS),
+	[AW_PID_2049_SYSINTM_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_SYSCTRL_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_SYSCTRL2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_I2SCTRL_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_I2SCFG1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_I2SCFG2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_HAGCCFG1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_HAGCCFG2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_HAGCCFG3_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_HAGCCFG4_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_HAGCCFG5_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_HAGCCFG6_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_HAGCCFG7_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_MPDCFG_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_PWMCTRL_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_I2SCFG3_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_DBGCTRL_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_HAGCST_REG]	= (REG_RD_ACCESS),
+	[AW_PID_2049_VBAT_REG]		= (REG_RD_ACCESS),
+	[AW_PID_2049_TEMP_REG]		= (REG_RD_ACCESS),
+	[AW_PID_2049_PVDD_REG]		= (REG_RD_ACCESS),
+	[AW_PID_2049_ISNDAT_REG]	= (REG_RD_ACCESS),
+	[AW_PID_2049_VSNDAT_REG]	= (REG_RD_ACCESS),
+	[AW_PID_2049_I2SINT_REG]	= (REG_RD_ACCESS),
+	[AW_PID_2049_I2SCAPCNT_REG]	= (REG_RD_ACCESS),
+	[AW_PID_2049_ANASTA1_REG]	= (REG_RD_ACCESS),
+	[AW_PID_2049_ANASTA2_REG]	= (REG_RD_ACCESS),
+	[AW_PID_2049_ANASTA3_REG]	= (REG_RD_ACCESS),
+	[AW_PID_2049_ANASTA4_REG]	= (REG_RD_ACCESS),
+	[AW_PID_2049_TESTDET_REG]	= (REG_RD_ACCESS),
+	[AW_PID_2049_TESTIN_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_TESTOUT_REG]	= (REG_RD_ACCESS),
+	[AW_PID_2049_DSPMADD_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_DSPMDAT_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_WDT_REG]		= (REG_RD_ACCESS),
+	[AW_PID_2049_ACR1_REG]		= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_ACR2_REG]		= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_ASR1_REG]		= (REG_RD_ACCESS),
+	[AW_PID_2049_ASR2_REG]		= (REG_RD_ACCESS),
+	[AW_PID_2049_DSPCFG_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_ASR3_REG]		= (REG_RD_ACCESS),
+	[AW_PID_2049_ASR4_REG]		= (REG_RD_ACCESS),
+	[AW_PID_2049_VSNCTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_ISNCTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_PLLCTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_PLLCTRL2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_PLLCTRL3_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_CDACTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_CDACTRL2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_SADCCTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_SADCCTRL2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_CPCTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_BSTCTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_BSTCTRL2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_BSTCTRL3_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_BSTCTRL4_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_BSTCTRL5_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_BSTCTRL6_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_BSTCTRL7_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_DSMCFG1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_DSMCFG2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_DSMCFG3_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_DSMCFG4_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_DSMCFG5_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_DSMCFG6_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_DSMCFG7_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_DSMCFG8_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_TESTCTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_TESTCTRL2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_EFCTRL1_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_EFCTRL2_REG]	= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_EFWH_REG]		= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_EFWM2_REG]		= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_EFWM1_REG]		= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_EFWL_REG]		= (REG_RD_ACCESS | REG_WR_ACCESS),
+	[AW_PID_2049_EFRH_REG]		= (REG_RD_ACCESS),
+	[AW_PID_2049_EFRM2_REG]		= (REG_RD_ACCESS),
+	[AW_PID_2049_EFRM1_REG]		= (REG_RD_ACCESS),
+	[AW_PID_2049_EFRL_REG]		= (REG_RD_ACCESS),
+	[AW_PID_2049_TM_REG]		= (REG_NONE_ACCESS),
+};
+
+#define AW_PID_2049_VOLUME_STEP_DB	(6 * 8)
+
+
+/* detail information of registers begin */
+/* ID (0x00) detail */
+/* IDCODE bit 15:0 (ID 0x00) */
+#define AW_PID_2049_IDCODE_START_BIT	(0)
+#define AW_PID_2049_IDCODE_BITS_LEN		(16)
+#define AW_PID_2049_IDCODE_MASK			\
+	(~(((1<<AW_PID_2049_IDCODE_BITS_LEN)-1) << AW_PID_2049_IDCODE_START_BIT))
+
+#define AW_PID_2049_IDCODE_DEFAULT_VALUE	(0x2049)
+#define AW_PID_2049_IDCODE_DEFAULT		\
+	(AW_PID_2049_IDCODE_DEFAULT_VALUE << AW_PID_2049_IDCODE_START_BIT)
+
+#define AW_PID_2049_SOFT_RESET_VALUE	(0x55aa)
+
+/* default value of ID (0x00) */
+/* #define AW_PID_2049_ID_DEFAULT		(0x2049) */
+
+/* SYSST (0x01) detail */
+/* OVP2S bit 15 (SYSST 0x01) */
+#define AW_PID_2049_OVP2S_START_BIT		(15)
+#define AW_PID_2049_OVP2S_BITS_LEN		(1)
+#define AW_PID_2049_OVP2S_MASK			\
+	(~(((1<<AW_PID_2049_OVP2S_BITS_LEN)-1) << AW_PID_2049_OVP2S_START_BIT))
+
+#define AW_PID_2049_OVP2S_NORMAL		(0)
+#define AW_PID_2049_OVP2S_NORMAL_VALUE	\
+	(AW_PID_2049_OVP2S_NORMAL << AW_PID_2049_OVP2S_START_BIT)
+
+#define AW_PID_2049_OVP2S_OVP			(1)
+#define AW_PID_2049_OVP2S_OVP_VALUE		\
+	(AW_PID_2049_OVP2S_OVP << AW_PID_2049_OVP2S_START_BIT)
+
+#define AW_PID_2049_OVP2S_DEFAULT_VALUE	(0)
+#define AW_PID_2049_OVP2S_DEFAULT		\
+	(AW_PID_2049_OVP2S_DEFAULT_VALUE << AW_PID_2049_OVP2S_START_BIT)
+
+/* UVLS bit 14 (SYSST 0x01) */
+#define AW_PID_2049_UVLS_START_BIT		(14)
+#define AW_PID_2049_UVLS_BITS_LEN		(1)
+#define AW_PID_2049_UVLS_MASK			\
+	(~(((1<<AW_PID_2049_UVLS_BITS_LEN)-1) << AW_PID_2049_UVLS_START_BIT))
+
+#define AW_PID_2049_UVLS_NORMAL			(0)
+#define AW_PID_2049_UVLS_NORMAL_VALUE	\
+	(AW_PID_2049_UVLS_NORMAL << AW_PID_2049_UVLS_START_BIT)
+
+#define AW_PID_2049_UVLS_UVLO			(1)
+#define AW_PID_2049_UVLS_UVLO_VALUE		\
+	(AW_PID_2049_UVLS_UVLO << AW_PID_2049_UVLS_START_BIT)
+
+#define AW_PID_2049_UVLS_DEFAULT_VALUE	(0)
+#define AW_PID_2049_UVLS_DEFAULT		\
+	(AW_PID_2049_UVLS_DEFAULT_VALUE << AW_PID_2049_UVLS_START_BIT)
+
+/* ADPS bit 13 (SYSST 0x01) */
+#define AW_PID_2049_ADPS_START_BIT		(13)
+#define AW_PID_2049_ADPS_BITS_LEN		(1)
+#define AW_PID_2049_ADPS_MASK			\
+	(~(((1<<AW_PID_2049_ADPS_BITS_LEN)-1) << AW_PID_2049_ADPS_START_BIT))
+
+#define AW_PID_2049_ADPS_TRANSPARENT	(0)
+#define AW_PID_2049_ADPS_TRANSPARENT_VALUE	\
+	(AW_PID_2049_ADPS_TRANSPARENT << AW_PID_2049_ADPS_START_BIT)
+
+#define AW_PID_2049_ADPS_BOOST			(1)
+#define AW_PID_2049_ADPS_BOOST_VALUE	\
+	(AW_PID_2049_ADPS_BOOST << AW_PID_2049_ADPS_START_BIT)
+
+#define AW_PID_2049_ADPS_DEFAULT_VALUE	(0)
+#define AW_PID_2049_ADPS_DEFAULT		\
+	(AW_PID_2049_ADPS_DEFAULT_VALUE << AW_PID_2049_ADPS_START_BIT)
+
+/* DSPS bit 12 (SYSST 0x01) */
+#define AW_PID_2049_DSPS_START_BIT		(12)
+#define AW_PID_2049_DSPS_BITS_LEN		(1)
+#define AW_PID_2049_DSPS_MASK			\
+	(~(((1<<AW_PID_2049_DSPS_BITS_LEN)-1) << AW_PID_2049_DSPS_START_BIT))
+
+#define AW_PID_2049_DSPS_NORMAL			(0)
+#define AW_PID_2049_DSPS_NORMAL_VALUE	\
+	(AW_PID_2049_DSPS_NORMAL << AW_PID_2049_DSPS_START_BIT)
+
+#define AW_PID_2049_DSPS_DSP_STABLE		(1)
+#define AW_PID_2049_DSPS_DSP_STABLE_VALUE	\
+	(AW_PID_2049_DSPS_DSP_STABLE << AW_PID_2049_DSPS_START_BIT)
+
+#define AW_PID_2049_DSPS_DEFAULT_VALUE	(0)
+#define AW_PID_2049_DSPS_DEFAULT		\
+	(AW_PID_2049_DSPS_DEFAULT_VALUE << AW_PID_2049_DSPS_START_BIT)
+
+/* BSTOCS bit 11 (SYSST 0x01) */
+#define AW_PID_2049_BSTOCS_START_BIT	(11)
+#define AW_PID_2049_BSTOCS_BITS_LEN		(1)
+#define AW_PID_2049_BSTOCS_MASK			\
+	(~(((1<<AW_PID_2049_BSTOCS_BITS_LEN)-1) << AW_PID_2049_BSTOCS_START_BIT))
+
+#define AW_PID_2049_BSTOCS_NORMAL		(0)
+#define AW_PID_2049_BSTOCS_NORMAL_VALUE	\
+	(AW_PID_2049_BSTOCS_NORMAL << AW_PID_2049_BSTOCS_START_BIT)
+
+#define AW_PID_2049_BSTOCS_OVER_CURRENT	(1)
+#define AW_PID_2049_BSTOCS_OVER_CURRENT_VALUE	\
+	(AW_PID_2049_BSTOCS_OVER_CURRENT << AW_PID_2049_BSTOCS_START_BIT)
+
+#define AW_PID_2049_BSTOCS_DEFAULT_VALUE	(0)
+#define AW_PID_2049_BSTOCS_DEFAULT		\
+	(AW_PID_2049_BSTOCS_DEFAULT_VALUE << AW_PID_2049_BSTOCS_START_BIT)
+
+/* OVPS bit 10 (SYSST 0x01) */
+#define AW_PID_2049_OVPS_START_BIT		(10)
+#define AW_PID_2049_OVPS_BITS_LEN		(1)
+#define AW_PID_2049_OVPS_MASK			\
+	(~(((1<<AW_PID_2049_OVPS_BITS_LEN)-1) << AW_PID_2049_OVPS_START_BIT))
+
+#define AW_PID_2049_OVPS_NORMAL			(0)
+#define AW_PID_2049_OVPS_NORMAL_VALUE	\
+	(AW_PID_2049_OVPS_NORMAL << AW_PID_2049_OVPS_START_BIT)
+
+#define AW_PID_2049_OVPS_OVP			(1)
+#define AW_PID_2049_OVPS_OVP_VALUE		\
+	(AW_PID_2049_OVPS_OVP << AW_PID_2049_OVPS_START_BIT)
+
+#define AW_PID_2049_OVPS_DEFAULT_VALUE	(0)
+#define AW_PID_2049_OVPS_DEFAULT		\
+	(AW_PID_2049_OVPS_DEFAULT_VALUE << AW_PID_2049_OVPS_START_BIT)
+
+/* BSTS bit 9 (SYSST 0x01) */
+#define AW_PID_2049_BSTS_START_BIT		(9)
+#define AW_PID_2049_BSTS_BITS_LEN		(1)
+#define AW_PID_2049_BSTS_MASK			\
+	(~(((1<<AW_PID_2049_BSTS_BITS_LEN)-1) << AW_PID_2049_BSTS_START_BIT))
+
+#define AW_PID_2049_BSTS_NOT_FINISHED	(0)
+#define AW_PID_2049_BSTS_NOT_FINISHED_VALUE	\
+	(AW_PID_2049_BSTS_NOT_FINISHED << AW_PID_2049_BSTS_START_BIT)
+
+#define AW_PID_2049_BSTS_FINISHED		(1)
+#define AW_PID_2049_BSTS_FINISHED_VALUE	\
+	(AW_PID_2049_BSTS_FINISHED << AW_PID_2049_BSTS_START_BIT)
+
+#define AW_PID_2049_BSTS_DEFAULT_VALUE	(0)
+#define AW_PID_2049_BSTS_DEFAULT		\
+	(AW_PID_2049_BSTS_DEFAULT_VALUE << AW_PID_2049_BSTS_START_BIT)
+
+/* SWS bit 8 (SYSST 0x01) */
+#define AW_PID_2049_SWS_START_BIT		(8)
+#define AW_PID_2049_SWS_BITS_LEN		(1)
+#define AW_PID_2049_SWS_MASK			\
+	(~(((1<<AW_PID_2049_SWS_BITS_LEN)-1) << AW_PID_2049_SWS_START_BIT))
+
+#define AW_PID_2049_SWS_NOT_SWITCHING	(0)
+#define AW_PID_2049_SWS_NOT_SWITCHING_VALUE	\
+	(AW_PID_2049_SWS_NOT_SWITCHING << AW_PID_2049_SWS_START_BIT)
+
+#define AW_PID_2049_SWS_SWITCHING		(1)
+#define AW_PID_2049_SWS_SWITCHING_VALUE	\
+	(AW_PID_2049_SWS_SWITCHING << AW_PID_2049_SWS_START_BIT)
+
+#define AW_PID_2049_SWS_DEFAULT_VALUE	(0)
+#define AW_PID_2049_SWS_DEFAULT			\
+	(AW_PID_2049_SWS_DEFAULT_VALUE << AW_PID_2049_SWS_START_BIT)
+
+/* CLIPS bit 7 (SYSST 0x01) */
+#define AW_PID_2049_CLIPS_START_BIT		(7)
+#define AW_PID_2049_CLIPS_BITS_LEN		(1)
+#define AW_PID_2049_CLIPS_MASK			\
+	(~(((1<<AW_PID_2049_CLIPS_BITS_LEN)-1) << AW_PID_2049_CLIPS_START_BIT))
+
+#define AW_PID_2049_CLIPS_NOT_CLIPPING	(0)
+#define AW_PID_2049_CLIPS_NOT_CLIPPING_VALUE	\
+	(AW_PID_2049_CLIPS_NOT_CLIPPING << AW_PID_2049_CLIPS_START_BIT)
+
+#define AW_PID_2049_CLIPS_CLIPPING		(1)
+#define AW_PID_2049_CLIPS_CLIPPING_VALUE	\
+	(AW_PID_2049_CLIPS_CLIPPING << AW_PID_2049_CLIPS_START_BIT)
+
+#define AW_PID_2049_CLIPS_DEFAULT_VALUE	(0)
+#define AW_PID_2049_CLIPS_DEFAULT		\
+	(AW_PID_2049_CLIPS_DEFAULT_VALUE << AW_PID_2049_CLIPS_START_BIT)
+
+/* WDS bit 6 (SYSST 0x01) */
+#define AW_PID_2049_WDS_START_BIT		(6)
+#define AW_PID_2049_WDS_BITS_LEN		(1)
+#define AW_PID_2049_WDS_MASK			\
+	(~(((1<<AW_PID_2049_WDS_BITS_LEN)-1) << AW_PID_2049_WDS_START_BIT))
+
+#define AW_PID_2049_WDS_NORMAL			(0)
+#define AW_PID_2049_WDS_NORMAL_VALUE	\
+	(AW_PID_2049_WDS_NORMAL << AW_PID_2049_WDS_START_BIT)
+
+#define AW_PID_2049_WDS_ABNORMAL		(1)
+#define AW_PID_2049_WDS_ABNORMAL_VALUE	\
+	(AW_PID_2049_WDS_ABNORMAL << AW_PID_2049_WDS_START_BIT)
+
+#define AW_PID_2049_WDS_DEFAULT_VALUE	(0)
+#define AW_PID_2049_WDS_DEFAULT			\
+	(AW_PID_2049_WDS_DEFAULT_VALUE << AW_PID_2049_WDS_START_BIT)
+
+/* NOCLKS bit 5 (SYSST 0x01) */
+#define AW_PID_2049_NOCLKS_START_BIT	(5)
+#define AW_PID_2049_NOCLKS_BITS_LEN		(1)
+#define AW_PID_2049_NOCLKS_MASK			\
+	(~(((1<<AW_PID_2049_NOCLKS_BITS_LEN)-1) << AW_PID_2049_NOCLKS_START_BIT))
+
+#define AW_PID_2049_NOCLKS_CLOCK_OK		(0)
+#define AW_PID_2049_NOCLKS_CLOCK_OK_VALUE	\
+	(AW_PID_2049_NOCLKS_CLOCK_OK << AW_PID_2049_NOCLKS_START_BIT)
+
+#define AW_PID_2049_NOCLKS_NO_CLOCK		(1)
+#define AW_PID_2049_NOCLKS_NO_CLOCK_VALUE	\
+	(AW_PID_2049_NOCLKS_NO_CLOCK << AW_PID_2049_NOCLKS_START_BIT)
+
+#define AW_PID_2049_NOCLKS_DEFAULT_VALUE	(0)
+#define AW_PID_2049_NOCLKS_DEFAULT		\
+	(AW_PID_2049_NOCLKS_DEFAULT_VALUE << AW_PID_2049_NOCLKS_START_BIT)
+
+/* CLKS bit 4 (SYSST 0x01) */
+#define AW_PID_2049_CLKS_START_BIT		(4)
+#define AW_PID_2049_CLKS_BITS_LEN		(1)
+#define AW_PID_2049_CLKS_MASK			\
+	(~(((1<<AW_PID_2049_CLKS_BITS_LEN)-1) << AW_PID_2049_CLKS_START_BIT))
+
+#define AW_PID_2049_CLKS_NOT_STABLE		(0)
+#define AW_PID_2049_CLKS_NOT_STABLE_VALUE	\
+	(AW_PID_2049_CLKS_NOT_STABLE << AW_PID_2049_CLKS_START_BIT)
+
+#define AW_PID_2049_CLKS_STABLE			(1)
+#define AW_PID_2049_CLKS_STABLE_VALUE	\
+	(AW_PID_2049_CLKS_STABLE << AW_PID_2049_CLKS_START_BIT)
+
+#define AW_PID_2049_CLKS_DEFAULT_VALUE	(0)
+#define AW_PID_2049_CLKS_DEFAULT		\
+	(AW_PID_2049_CLKS_DEFAULT_VALUE << AW_PID_2049_CLKS_START_BIT)
+
+/* OCDS bit 3 (SYSST 0x01) */
+#define AW_PID_2049_OCDS_START_BIT		(3)
+#define AW_PID_2049_OCDS_BITS_LEN		(1)
+#define AW_PID_2049_OCDS_MASK			\
+	(~(((1<<AW_PID_2049_OCDS_BITS_LEN)-1) << AW_PID_2049_OCDS_START_BIT))
+
+#define AW_PID_2049_OCDS_NORAML			(0)
+#define AW_PID_2049_OCDS_NORAML_VALUE	\
+	(AW_PID_2049_OCDS_NORAML << AW_PID_2049_OCDS_START_BIT)
+
+#define AW_PID_2049_OCDS_OC				(1)
+#define AW_PID_2049_OCDS_OC_VALUE		\
+	(AW_PID_2049_OCDS_OC << AW_PID_2049_OCDS_START_BIT)
+
+#define AW_PID_2049_OCDS_DEFAULT_VALUE	(0)
+#define AW_PID_2049_OCDS_DEFAULT		\
+	(AW_PID_2049_OCDS_DEFAULT_VALUE << AW_PID_2049_OCDS_START_BIT)
+
+/* CLIP_PRES bit 2 (SYSST 0x01) */
+#define AW_PID_2049_CLIP_PRES_START_BIT	(2)
+#define AW_PID_2049_CLIP_PRES_BITS_LEN	(1)
+#define AW_PID_2049_CLIP_PRES_MASK		\
+	(~(((1<<AW_PID_2049_CLIP_PRES_BITS_LEN)-1) << AW_PID_2049_CLIP_PRES_START_BIT))
+
+#define AW_PID_2049_CLIP_PRES_NOT_CLIPPING	(0)
+#define AW_PID_2049_CLIP_PRES_NOT_CLIPPING_VALUE	\
+	(AW_PID_2049_CLIP_PRES_NOT_CLIPPING << AW_PID_2049_CLIP_PRES_START_BIT)
+
+#define AW_PID_2049_CLIP_PRES_CLIPPING	(1)
+#define AW_PID_2049_CLIP_PRES_CLIPPING_VALUE	\
+	(AW_PID_2049_CLIP_PRES_CLIPPING << AW_PID_2049_CLIP_PRES_START_BIT)
+
+#define AW_PID_2049_CLIP_PRES_DEFAULT_VALUE	(0)
+#define AW_PID_2049_CLIP_PRES_DEFAULT	\
+	(AW_PID_2049_CLIP_PRES_DEFAULT_VALUE << AW_PID_2049_CLIP_PRES_START_BIT)
+
+/* OTHS bit 1 (SYSST 0x01) */
+#define AW_PID_2049_OTHS_START_BIT		(1)
+#define AW_PID_2049_OTHS_BITS_LEN		(1)
+#define AW_PID_2049_OTHS_MASK			\
+	(~(((1<<AW_PID_2049_OTHS_BITS_LEN)-1) << AW_PID_2049_OTHS_START_BIT))
+
+#define AW_PID_2049_OTHS_NORMAL			(0)
+#define AW_PID_2049_OTHS_NORMAL_VALUE	\
+	(AW_PID_2049_OTHS_NORMAL << AW_PID_2049_OTHS_START_BIT)
+
+#define AW_PID_2049_OTHS_OT				(1)
+#define AW_PID_2049_OTHS_OT_VALUE		\
+	(AW_PID_2049_OTHS_OT << AW_PID_2049_OTHS_START_BIT)
+
+#define AW_PID_2049_OTHS_DEFAULT_VALUE	(0)
+#define AW_PID_2049_OTHS_DEFAULT		\
+	(AW_PID_2049_OTHS_DEFAULT_VALUE << AW_PID_2049_OTHS_START_BIT)
+
+/* PLLS bit 0 (SYSST 0x01) */
+#define AW_PID_2049_PLLS_START_BIT		(0)
+#define AW_PID_2049_PLLS_BITS_LEN		(1)
+#define AW_PID_2049_PLLS_MASK			\
+	(~(((1<<AW_PID_2049_PLLS_BITS_LEN)-1) << AW_PID_2049_PLLS_START_BIT))
+
+#define AW_PID_2049_PLLS_UNLOCKED		(0)
+#define AW_PID_2049_PLLS_UNLOCKED_VALUE	\
+	(AW_PID_2049_PLLS_UNLOCKED << AW_PID_2049_PLLS_START_BIT)
+
+#define AW_PID_2049_PLLS_LOCKED			(1)
+#define AW_PID_2049_PLLS_LOCKED_VALUE	\
+	(AW_PID_2049_PLLS_LOCKED << AW_PID_2049_PLLS_START_BIT)
+
+#define AW_PID_2049_PLLS_DEFAULT_VALUE	(0)
+#define AW_PID_2049_PLLS_DEFAULT		\
+	(AW_PID_2049_PLLS_DEFAULT_VALUE << AW_PID_2049_PLLS_START_BIT)
+
+
+
+#define AW_PID_2049_BIT_PLL_CHECK \
+		(AW_PID_2049_CLKS_STABLE_VALUE | \
+		AW_PID_2049_PLLS_LOCKED_VALUE)
+
+
+#define AW_PID_2049_BIT_SYSST_CHECK_MASK \
+		(~(AW_PID_2049_UVLS_NORMAL_VALUE | \
+		AW_PID_2049_BSTOCS_OVER_CURRENT_VALUE | \
+		AW_PID_2049_BSTS_FINISHED_VALUE | \
+		AW_PID_2049_SWS_SWITCHING_VALUE | \
+		AW_PID_2049_NOCLKS_NO_CLOCK_VALUE | \
+		AW_PID_2049_CLKS_STABLE_VALUE | \
+		AW_PID_2049_OCDS_OC_VALUE | \
+		AW_PID_2049_OTHS_OT_VALUE | \
+		AW_PID_2049_PLLS_LOCKED_VALUE))
+
+#define AW_PID_2049_BIT_SYSST_CHECK \
+		(AW_PID_2049_BSTS_FINISHED_VALUE | \
+		AW_PID_2049_SWS_SWITCHING_VALUE | \
+		AW_PID_2049_CLKS_STABLE_VALUE | \
+		AW_PID_2049_PLLS_LOCKED_VALUE)
+
+/* default value of SYSST (0x01) */
+/* #define AW_PID_2049_SYSST_DEFAULT		(0x0000) */
+
+/* SYSINT (0x02) detail */
+/* OVP2I bit 15 (SYSINT 0x02) */
+#define AW_PID_2049_OVP2I_START_BIT		(15)
+#define AW_PID_2049_OVP2I_BITS_LEN		(1)
+#define AW_PID_2049_OVP2I_MASK			\
+	(~(((1<<AW_PID_2049_OVP2I_BITS_LEN)-1) << AW_PID_2049_OVP2I_START_BIT))
+
+#define AW_PID_2049_OVP2I_DEFAULT_VALUE	(0)
+#define AW_PID_2049_OVP2I_DEFAULT		\
+	(AW_PID_2049_OVP2I_DEFAULT_VALUE << AW_PID_2049_OVP2I_START_BIT)
+
+/* UVLI bit 14 (SYSINT 0x02) */
+#define AW_PID_2049_UVLI_START_BIT		(14)
+#define AW_PID_2049_UVLI_BITS_LEN		(1)
+#define AW_PID_2049_UVLI_MASK			\
+	(~(((1<<AW_PID_2049_UVLI_BITS_LEN)-1) << AW_PID_2049_UVLI_START_BIT))
+
+#define AW_PID_2049_UVLI_DEFAULT_VALUE	(0)
+#define AW_PID_2049_UVLI_DEFAULT		\
+	(AW_PID_2049_UVLI_DEFAULT_VALUE << AW_PID_2049_UVLI_START_BIT)
+
+/* ADPI bit 13 (SYSINT 0x02) */
+#define AW_PID_2049_ADPI_START_BIT		(13)
+#define AW_PID_2049_ADPI_BITS_LEN		(1)
+#define AW_PID_2049_ADPI_MASK			\
+	(~(((1<<AW_PID_2049_ADPI_BITS_LEN)-1) << AW_PID_2049_ADPI_START_BIT))
+
+#define AW_PID_2049_ADPI_DEFAULT_VALUE	(0)
+#define AW_PID_2049_ADPI_DEFAULT		\
+	(AW_PID_2049_ADPI_DEFAULT_VALUE << AW_PID_2049_ADPI_START_BIT)
+
+/* DSPI bit 12 (SYSINT 0x02) */
+#define AW_PID_2049_DSPI_START_BIT		(12)
+#define AW_PID_2049_DSPI_BITS_LEN		(1)
+#define AW_PID_2049_DSPI_MASK			\
+	(~(((1<<AW_PID_2049_DSPI_BITS_LEN)-1) << AW_PID_2049_DSPI_START_BIT))
+
+#define AW_PID_2049_DSPI_DEFAULT_VALUE	(0)
+#define AW_PID_2049_DSPI_DEFAULT		\
+	(AW_PID_2049_DSPI_DEFAULT_VALUE << AW_PID_2049_DSPI_START_BIT)
+
+/* BSTOCI bit 11 (SYSINT 0x02) */
+#define AW_PID_2049_BSTOCI_START_BIT	(11)
+#define AW_PID_2049_BSTOCI_BITS_LEN		(1)
+#define AW_PID_2049_BSTOCI_MASK			\
+	(~(((1<<AW_PID_2049_BSTOCI_BITS_LEN)-1) << AW_PID_2049_BSTOCI_START_BIT))
+
+#define AW_PID_2049_BSTOCI_DEFAULT_VALUE	(0)
+#define AW_PID_2049_BSTOCI_DEFAULT		\
+	(AW_PID_2049_BSTOCI_DEFAULT_VALUE << AW_PID_2049_BSTOCI_START_BIT)
+
+/* OVPI bit 10 (SYSINT 0x02) */
+#define AW_PID_2049_OVPI_START_BIT		(10)
+#define AW_PID_2049_OVPI_BITS_LEN		(1)
+#define AW_PID_2049_OVPI_MASK			\
+	(~(((1<<AW_PID_2049_OVPI_BITS_LEN)-1) << AW_PID_2049_OVPI_START_BIT))
+
+#define AW_PID_2049_OVPI_DEFAULT_VALUE	(0)
+#define AW_PID_2049_OVPI_DEFAULT		\
+	(AW_PID_2049_OVPI_DEFAULT_VALUE << AW_PID_2049_OVPI_START_BIT)
+
+/* BSTI bit 9 (SYSINT 0x02) */
+#define AW_PID_2049_BSTI_START_BIT		(9)
+#define AW_PID_2049_BSTI_BITS_LEN		(1)
+#define AW_PID_2049_BSTI_MASK			\
+	(~(((1<<AW_PID_2049_BSTI_BITS_LEN)-1) << AW_PID_2049_BSTI_START_BIT))
+
+#define AW_PID_2049_BSTI_DEFAULT_VALUE	(0)
+#define AW_PID_2049_BSTI_DEFAULT		\
+	(AW_PID_2049_BSTI_DEFAULT_VALUE << AW_PID_2049_BSTI_START_BIT)
+
+/* SWI bit 8 (SYSINT 0x02) */
+#define AW_PID_2049_SWI_START_BIT		(8)
+#define AW_PID_2049_SWI_BITS_LEN		(1)
+#define AW_PID_2049_SWI_MASK			\
+	(~(((1<<AW_PID_2049_SWI_BITS_LEN)-1) << AW_PID_2049_SWI_START_BIT))
+
+#define AW_PID_2049_SWI_DEFAULT_VALUE	(0)
+#define AW_PID_2049_SWI_DEFAULT			\
+	(AW_PID_2049_SWI_DEFAULT_VALUE << AW_PID_2049_SWI_START_BIT)
+
+/* CLIPI bit 7 (SYSINT 0x02) */
+#define AW_PID_2049_CLIPI_START_BIT		(7)
+#define AW_PID_2049_CLIPI_BITS_LEN		(1)
+#define AW_PID_2049_CLIPI_MASK			\
+	(~(((1<<AW_PID_2049_CLIPI_BITS_LEN)-1) << AW_PID_2049_CLIPI_START_BIT))
+
+#define AW_PID_2049_CLIPI_DEFAULT_VALUE	(0)
+#define AW_PID_2049_CLIPI_DEFAULT		\
+	(AW_PID_2049_CLIPI_DEFAULT_VALUE << AW_PID_2049_CLIPI_START_BIT)
+
+/* WDI bit 6 (SYSINT 0x02) */
+#define AW_PID_2049_WDI_START_BIT		(6)
+#define AW_PID_2049_WDI_BITS_LEN		(1)
+#define AW_PID_2049_WDI_MASK			\
+	(~(((1<<AW_PID_2049_WDI_BITS_LEN)-1) << AW_PID_2049_WDI_START_BIT))
+
+#define AW_PID_2049_WDI_DEFAULT_VALUE	(0)
+#define AW_PID_2049_WDI_INT_VALUE	(1)
+#define AW_PID_2049_WDI_DEFAULT			\
+	(AW_PID_2049_WDI_DEFAULT_VALUE << AW_PID_2049_WDI_START_BIT)
+#define AW_PID_2049_WDI_INTERRUPT		\
+	(AW_PID_2049_WDI_INT_VALUE << AW_PID_2049_WDI_START_BIT)
+
+/* NOCLKI bit 5 (SYSINT 0x02) */
+#define AW_PID_2049_NOCLKI_START_BIT	(5)
+#define AW_PID_2049_NOCLKI_BITS_LEN		(1)
+#define AW_PID_2049_NOCLKI_MASK			\
+	(~(((1<<AW_PID_2049_NOCLKI_BITS_LEN)-1) << AW_PID_2049_NOCLKI_START_BIT))
+
+#define AW_PID_2049_NOCLKI_DEFAULT_VALUE	(0)
+#define AW_PID_2049_NOCLKI_INT_VALUE	(1)
+#define AW_PID_2049_NOCLKI_DEFAULT		\
+	(AW_PID_2049_NOCLKI_DEFAULT_VALUE << AW_PID_2049_NOCLKI_START_BIT)
+#define AW_PID_2049_NOCLKI_INTERRUPT		\
+	(AW_PID_2049_NOCLKI_INT_VALUE << AW_PID_2049_NOCLKI_START_BIT)
+
+/* CLKI bit 4 (SYSINT 0x02) */
+#define AW_PID_2049_CLKI_START_BIT		(4)
+#define AW_PID_2049_CLKI_BITS_LEN		(1)
+#define AW_PID_2049_CLKI_MASK			\
+	(~(((1<<AW_PID_2049_CLKI_BITS_LEN)-1) << AW_PID_2049_CLKI_START_BIT))
+
+#define AW_PID_2049_CLKI_DEFAULT_VALUE	(0)
+#define AW_PID_2049_CLKI_INT_VALUE	(1)
+#define AW_PID_2049_CLKI_DEFAULT		\
+	(AW_PID_2049_CLKI_DEFAULT_VALUE << AW_PID_2049_CLKI_START_BIT)
+#define AW_PID_2049_CLKI_INTERRUPT		\
+	(AW_PID_2049_CLKI_INT_VALUE << AW_PID_2049_CLKI_START_BIT)
+
+/* OCDI bit 3 (SYSINT 0x02) */
+#define AW_PID_2049_OCDI_START_BIT		(3)
+#define AW_PID_2049_OCDI_BITS_LEN		(1)
+#define AW_PID_2049_OCDI_MASK			\
+	(~(((1<<AW_PID_2049_OCDI_BITS_LEN)-1) << AW_PID_2049_OCDI_START_BIT))
+
+#define AW_PID_2049_OCDI_DEFAULT_VALUE	(0)
+#define AW_PID_2049_OCDI_DEFAULT		\
+	(AW_PID_2049_OCDI_DEFAULT_VALUE << AW_PID_2049_OCDI_START_BIT)
+
+/* CLIP_PREI bit 2 (SYSINT 0x02) */
+#define AW_PID_2049_CLIP_PREI_START_BIT	(2)
+#define AW_PID_2049_CLIP_PREI_BITS_LEN	(1)
+#define AW_PID_2049_CLIP_PREI_MASK		\
+	(~(((1<<AW_PID_2049_CLIP_PREI_BITS_LEN)-1) << AW_PID_2049_CLIP_PREI_START_BIT))
+
+#define AW_PID_2049_CLIP_PREI_DEFAULT_VALUE	(0)
+#define AW_PID_2049_CLIP_PREI_DEFAULT	\
+	(AW_PID_2049_CLIP_PREI_DEFAULT_VALUE << AW_PID_2049_CLIP_PREI_START_BIT)
+
+/* OTHI bit 1 (SYSINT 0x02) */
+#define AW_PID_2049_OTHI_START_BIT		(1)
+#define AW_PID_2049_OTHI_BITS_LEN		(1)
+#define AW_PID_2049_OTHI_MASK			\
+	(~(((1<<AW_PID_2049_OTHI_BITS_LEN)-1) << AW_PID_2049_OTHI_START_BIT))
+
+#define AW_PID_2049_OTHI_DEFAULT_VALUE	(0)
+#define AW_PID_2049_OTHI_DEFAULT		\
+	(AW_PID_2049_OTHI_DEFAULT_VALUE << AW_PID_2049_OTHI_START_BIT)
+
+/* PLLI bit 0 (SYSINT 0x02) */
+#define AW_PID_2049_PLLI_START_BIT		(0)
+#define AW_PID_2049_PLLI_BITS_LEN		(1)
+#define AW_PID_2049_PLLI_MASK			\
+	(~(((1<<AW_PID_2049_PLLI_BITS_LEN)-1) << AW_PID_2049_PLLI_START_BIT))
+
+#define AW_PID_2049_PLLI_DEFAULT_VALUE	(0)
+#define AW_PID_2049_PLLI_INT_VALUE	(1)
+#define AW_PID_2049_PLLI_DEFAULT		\
+	(AW_PID_2049_PLLI_DEFAULT_VALUE << AW_PID_2049_PLLI_START_BIT)
+#define AW_PID_2049_PLLI_INTERRUPT		\
+	(AW_PID_2049_PLLI_INT_VALUE << AW_PID_2049_PLLI_START_BIT)
+
+/* default value of SYSINT (0x02) */
+/* #define AW_PID_2049_SYSINT_DEFAULT		(0x0000) */
+
+#define AW_PID_2049_BIT_SYSINT_CHECK \
+		(AW_PID_2049_WDI_INTERRUPT | \
+		AW_PID_2049_CLKI_INTERRUPT | \
+		AW_PID_2049_NOCLKI_INTERRUPT | \
+		AW_PID_2049_PLLI_INTERRUPT)
+
+/* SYSINTM (0x03) detail */
+/* OVP2M bit 15 (SYSINTM 0x03) */
+#define AW_PID_2049_OVP2M_START_BIT		(15)
+#define AW_PID_2049_OVP2M_BITS_LEN		(1)
+#define AW_PID_2049_OVP2M_MASK			\
+	(~(((1<<AW_PID_2049_OVP2M_BITS_LEN)-1) << AW_PID_2049_OVP2M_START_BIT))
+
+#define AW_PID_2049_OVP2M_DEFAULT_VALUE	(1)
+#define AW_PID_2049_OVP2M_DEFAULT		\
+	(AW_PID_2049_OVP2M_DEFAULT_VALUE << AW_PID_2049_OVP2M_START_BIT)
+
+/* UVLM bit 14 (SYSINTM 0x03) */
+#define AW_PID_2049_UVLM_START_BIT		(14)
+#define AW_PID_2049_UVLM_BITS_LEN		(1)
+#define AW_PID_2049_UVLM_MASK			\
+	(~(((1<<AW_PID_2049_UVLM_BITS_LEN)-1) << AW_PID_2049_UVLM_START_BIT))
+
+#define AW_PID_2049_UVLM_DEFAULT_VALUE	(1)
+#define AW_PID_2049_UVLM_DEFAULT		\
+	(AW_PID_2049_UVLM_DEFAULT_VALUE << AW_PID_2049_UVLM_START_BIT)
+
+/* ADPM bit 13 (SYSINTM 0x03) */
+#define AW_PID_2049_ADPM_START_BIT		(13)
+#define AW_PID_2049_ADPM_BITS_LEN		(1)
+#define AW_PID_2049_ADPM_MASK			\
+	(~(((1<<AW_PID_2049_ADPM_BITS_LEN)-1) << AW_PID_2049_ADPM_START_BIT))
+
+#define AW_PID_2049_ADPM_DEFAULT_VALUE	(1)
+#define AW_PID_2049_ADPM_DEFAULT		\
+	(AW_PID_2049_ADPM_DEFAULT_VALUE << AW_PID_2049_ADPM_START_BIT)
+
+/* DSPM bit 12 (SYSINTM 0x03) */
+#define AW_PID_2049_DSPM_START_BIT		(12)
+#define AW_PID_2049_DSPM_BITS_LEN		(1)
+#define AW_PID_2049_DSPM_MASK			\
+	(~(((1<<AW_PID_2049_DSPM_BITS_LEN)-1) << AW_PID_2049_DSPM_START_BIT))
+
+#define AW_PID_2049_DSPM_DEFAULT_VALUE	(1)
+#define AW_PID_2049_DSPM_DEFAULT		\
+	(AW_PID_2049_DSPM_DEFAULT_VALUE << AW_PID_2049_DSPM_START_BIT)
+
+/* BSTOCM bit 11 (SYSINTM 0x03) */
+#define AW_PID_2049_BSTOCM_START_BIT	(11)
+#define AW_PID_2049_BSTOCM_BITS_LEN		(1)
+#define AW_PID_2049_BSTOCM_MASK			\
+	(~(((1<<AW_PID_2049_BSTOCM_BITS_LEN)-1) << AW_PID_2049_BSTOCM_START_BIT))
+
+#define AW_PID_2049_BSTOCM_DEFAULT_VALUE	(1)
+#define AW_PID_2049_BSTOCM_DEFAULT		\
+	(AW_PID_2049_BSTOCM_DEFAULT_VALUE << AW_PID_2049_BSTOCM_START_BIT)
+
+/* OVPM bit 10 (SYSINTM 0x03) */
+#define AW_PID_2049_OVPM_START_BIT		(10)
+#define AW_PID_2049_OVPM_BITS_LEN		(1)
+#define AW_PID_2049_OVPM_MASK			\
+	(~(((1<<AW_PID_2049_OVPM_BITS_LEN)-1) << AW_PID_2049_OVPM_START_BIT))
+
+#define AW_PID_2049_OVPM_DEFAULT_VALUE	(1)
+#define AW_PID_2049_OVPM_DEFAULT		\
+	(AW_PID_2049_OVPM_DEFAULT_VALUE << AW_PID_2049_OVPM_START_BIT)
+
+/* BSTM bit 9 (SYSINTM 0x03) */
+#define AW_PID_2049_BSTM_START_BIT		(9)
+#define AW_PID_2049_BSTM_BITS_LEN		(1)
+#define AW_PID_2049_BSTM_MASK			\
+	(~(((1<<AW_PID_2049_BSTM_BITS_LEN)-1) << AW_PID_2049_BSTM_START_BIT))
+
+#define AW_PID_2049_BSTM_DEFAULT_VALUE	(1)
+#define AW_PID_2049_BSTM_DEFAULT		\
+	(AW_PID_2049_BSTM_DEFAULT_VALUE << AW_PID_2049_BSTM_START_BIT)
+
+/* SWM bit 8 (SYSINTM 0x03) */
+#define AW_PID_2049_SWM_START_BIT		(8)
+#define AW_PID_2049_SWM_BITS_LEN		(1)
+#define AW_PID_2049_SWM_MASK			\
+	(~(((1<<AW_PID_2049_SWM_BITS_LEN)-1) << AW_PID_2049_SWM_START_BIT))
+
+#define AW_PID_2049_SWM_DEFAULT_VALUE	(1)
+#define AW_PID_2049_SWM_DEFAULT			\
+	(AW_PID_2049_SWM_DEFAULT_VALUE << AW_PID_2049_SWM_START_BIT)
+
+/* CLIPM bit 7 (SYSINTM 0x03) */
+#define AW_PID_2049_CLIPM_START_BIT		(7)
+#define AW_PID_2049_CLIPM_BITS_LEN		(1)
+#define AW_PID_2049_CLIPM_MASK			\
+	(~(((1<<AW_PID_2049_CLIPM_BITS_LEN)-1) << AW_PID_2049_CLIPM_START_BIT))
+
+#define AW_PID_2049_CLIPM_DEFAULT_VALUE	(1)
+#define AW_PID_2049_CLIPM_DEFAULT		\
+	(AW_PID_2049_CLIPM_DEFAULT_VALUE << AW_PID_2049_CLIPM_START_BIT)
+
+/* WDM bit 6 (SYSINTM 0x03) */
+#define AW_PID_2049_WDM_START_BIT		(6)
+#define AW_PID_2049_WDM_BITS_LEN		(1)
+#define AW_PID_2049_WDM_MASK			\
+	(~(((1<<AW_PID_2049_WDM_BITS_LEN)-1) << AW_PID_2049_WDM_START_BIT))
+
+#define AW_PID_2049_WDM_DEFAULT_VALUE	(1)
+#define AW_PID_2049_WDM_DEFAULT			\
+	(AW_PID_2049_WDM_DEFAULT_VALUE << AW_PID_2049_WDM_START_BIT)
+
+/* NOCLKM bit 5 (SYSINTM 0x03) */
+#define AW_PID_2049_NOCLKM_START_BIT	(5)
+#define AW_PID_2049_NOCLKM_BITS_LEN		(1)
+#define AW_PID_2049_NOCLKM_MASK			\
+	(~(((1<<AW_PID_2049_NOCLKM_BITS_LEN)-1) << AW_PID_2049_NOCLKM_START_BIT))
+
+#define AW_PID_2049_NOCLKM_DEFAULT_VALUE	(1)
+#define AW_PID_2049_NOCLKM_DEFAULT		\
+	(AW_PID_2049_NOCLKM_DEFAULT_VALUE << AW_PID_2049_NOCLKM_START_BIT)
+
+/* CLKM bit 4 (SYSINTM 0x03) */
+#define AW_PID_2049_CLKM_START_BIT		(4)
+#define AW_PID_2049_CLKM_BITS_LEN		(1)
+#define AW_PID_2049_CLKM_MASK			\
+	(~(((1<<AW_PID_2049_CLKM_BITS_LEN)-1) << AW_PID_2049_CLKM_START_BIT))
+
+#define AW_PID_2049_CLKM_DEFAULT_VALUE	(1)
+#define AW_PID_2049_CLKM_DEFAULT		\
+	(AW_PID_2049_CLKM_DEFAULT_VALUE << AW_PID_2049_CLKM_START_BIT)
+
+/* OCDM bit 3 (SYSINTM 0x03) */
+#define AW_PID_2049_OCDM_START_BIT		(3)
+#define AW_PID_2049_OCDM_BITS_LEN		(1)
+#define AW_PID_2049_OCDM_MASK			\
+	(~(((1<<AW_PID_2049_OCDM_BITS_LEN)-1) << AW_PID_2049_OCDM_START_BIT))
+
+#define AW_PID_2049_OCDM_DEFAULT_VALUE	(1)
+#define AW_PID_2049_OCDM_DEFAULT		\
+	(AW_PID_2049_OCDM_DEFAULT_VALUE << AW_PID_2049_OCDM_START_BIT)
+
+/* CLIP_PREM bit 2 (SYSINTM 0x03) */
+#define AW_PID_2049_CLIP_PREM_START_BIT	(2)
+#define AW_PID_2049_CLIP_PREM_BITS_LEN	(1)
+#define AW_PID_2049_CLIP_PREM_MASK		\
+	(~(((1<<AW_PID_2049_CLIP_PREM_BITS_LEN)-1) << AW_PID_2049_CLIP_PREM_START_BIT))
+
+#define AW_PID_2049_CLIP_PREM_DEFAULT_VALUE	(1)
+#define AW_PID_2049_CLIP_PREM_DEFAULT	\
+	(AW_PID_2049_CLIP_PREM_DEFAULT_VALUE << AW_PID_2049_CLIP_PREM_START_BIT)
+
+/* OTHM bit 1 (SYSINTM 0x03) */
+#define AW_PID_2049_OTHM_START_BIT		(1)
+#define AW_PID_2049_OTHM_BITS_LEN		(1)
+#define AW_PID_2049_OTHM_MASK			\
+	(~(((1<<AW_PID_2049_OTHM_BITS_LEN)-1) << AW_PID_2049_OTHM_START_BIT))
+
+#define AW_PID_2049_OTHM_DEFAULT_VALUE	(1)
+#define AW_PID_2049_OTHM_DEFAULT		\
+	(AW_PID_2049_OTHM_DEFAULT_VALUE << AW_PID_2049_OTHM_START_BIT)
+
+/* PLLM bit 0 (SYSINTM 0x03) */
+#define AW_PID_2049_PLLM_START_BIT		(0)
+#define AW_PID_2049_PLLM_BITS_LEN		(1)
+#define AW_PID_2049_PLLM_MASK			\
+	(~(((1<<AW_PID_2049_PLLM_BITS_LEN)-1) << AW_PID_2049_PLLM_START_BIT))
+
+#define AW_PID_2049_PLLM_DEFAULT_VALUE	(1)
+#define AW_PID_2049_PLLM_DEFAULT		\
+	(AW_PID_2049_PLLM_DEFAULT_VALUE << AW_PID_2049_PLLM_START_BIT)
+
+/* default value of SYSINTM (0x03) */
+#define AW_PID_2049_SYSINTM_DEFAULT		(0xFFFF)
+
+/* SYSCTRL (0x04) detail */
+/* SPK_GAIN bit 14:12 (SYSCTRL 0x04) */
+#define AW_PID_2049_SPK_GAIN_START_BIT	(12)
+#define AW_PID_2049_SPK_GAIN_BITS_LEN	(3)
+#define AW_PID_2049_SPK_GAIN_MASK		\
+	(~(((1<<AW_PID_2049_SPK_GAIN_BITS_LEN)-1) << AW_PID_2049_SPK_GAIN_START_BIT))
+
+#define AW_PID_2049_SPK_GAIN_4_AV		(0)
+#define AW_PID_2049_SPK_GAIN_4_AV_VALUE	\
+	(AW_PID_2049_SPK_GAIN_4_AV << AW_PID_2049_SPK_GAIN_START_BIT)
+
+#define AW_PID_2049_SPK_GAIN_4P67_AV	(1)
+#define AW_PID_2049_SPK_GAIN_4P67_AV_VALUE	\
+	(AW_PID_2049_SPK_GAIN_4P67_AV << AW_PID_2049_SPK_GAIN_START_BIT)
+
+#define AW_PID_2049_SPK_GAIN_6_AV		(2)
+#define AW_PID_2049_SPK_GAIN_6_AV_VALUE	\
+	(AW_PID_2049_SPK_GAIN_6_AV << AW_PID_2049_SPK_GAIN_START_BIT)
+
+#define AW_PID_2049_SPK_GAIN_7_AV		(3)
+#define AW_PID_2049_SPK_GAIN_7_AV_VALUE	\
+	(AW_PID_2049_SPK_GAIN_7_AV << AW_PID_2049_SPK_GAIN_START_BIT)
+
+#define AW_PID_2049_SPK_GAIN_12_AV		(4)
+#define AW_PID_2049_SPK_GAIN_12_AV_VALUE	\
+	(AW_PID_2049_SPK_GAIN_12_AV << AW_PID_2049_SPK_GAIN_START_BIT)
+
+#define AW_PID_2049_SPK_GAIN_14_AV		(5)
+#define AW_PID_2049_SPK_GAIN_14_AV_VALUE	\
+	(AW_PID_2049_SPK_GAIN_14_AV << AW_PID_2049_SPK_GAIN_START_BIT)
+
+#define AW_PID_2049_SPK_GAIN_DEFAULT_VALUE	(0x5)
+#define AW_PID_2049_SPK_GAIN_DEFAULT	\
+	(AW_PID_2049_SPK_GAIN_DEFAULT_VALUE << AW_PID_2049_SPK_GAIN_START_BIT)
+
+/* RMSE bit 11 (SYSCTRL 0x04) */
+#define AW_PID_2049_RMSE_START_BIT		(11)
+#define AW_PID_2049_RMSE_BITS_LEN		(1)
+#define AW_PID_2049_RMSE_MASK			\
+	(~(((1<<AW_PID_2049_RMSE_BITS_LEN)-1) << AW_PID_2049_RMSE_START_BIT))
+
+#define AW_PID_2049_RMSE_PEAK_AGC		(0)
+#define AW_PID_2049_RMSE_PEAK_AGC_VALUE	\
+	(AW_PID_2049_RMSE_PEAK_AGC << AW_PID_2049_RMSE_START_BIT)
+
+#define AW_PID_2049_RMSE_RMS_AGC		(1)
+#define AW_PID_2049_RMSE_RMS_AGC_VALUE	\
+	(AW_PID_2049_RMSE_RMS_AGC << AW_PID_2049_RMSE_START_BIT)
+
+#define AW_PID_2049_RMSE_DEFAULT_VALUE	(0)
+#define AW_PID_2049_RMSE_DEFAULT		\
+	(AW_PID_2049_RMSE_DEFAULT_VALUE << AW_PID_2049_RMSE_START_BIT)
+
+/* HAGCE bit 10 (SYSCTRL 0x04) */
+#define AW_PID_2049_HAGCE_START_BIT		(10)
+#define AW_PID_2049_HAGCE_BITS_LEN		(1)
+#define AW_PID_2049_HAGCE_MASK			\
+	(~(((1<<AW_PID_2049_HAGCE_BITS_LEN)-1) << AW_PID_2049_HAGCE_START_BIT))
+
+#define AW_PID_2049_HAGCE_DISABLE		(0)
+#define AW_PID_2049_HAGCE_DISABLE_VALUE	\
+	(AW_PID_2049_HAGCE_DISABLE << AW_PID_2049_HAGCE_START_BIT)
+
+#define AW_PID_2049_HAGCE_ENABLE		(1)
+#define AW_PID_2049_HAGCE_ENABLE_VALUE	\
+	(AW_PID_2049_HAGCE_ENABLE << AW_PID_2049_HAGCE_START_BIT)
+
+#define AW_PID_2049_HAGCE_DEFAULT_VALUE	(0)
+#define AW_PID_2049_HAGCE_DEFAULT		\
+	(AW_PID_2049_HAGCE_DEFAULT_VALUE << AW_PID_2049_HAGCE_START_BIT)
+
+/* HDCCE bit 9 (SYSCTRL 0x04) */
+#define AW_PID_2049_HDCCE_START_BIT		(9)
+#define AW_PID_2049_HDCCE_BITS_LEN		(1)
+#define AW_PID_2049_HDCCE_MASK			\
+	(~(((1<<AW_PID_2049_HDCCE_BITS_LEN)-1) << AW_PID_2049_HDCCE_START_BIT))
+
+#define AW_PID_2049_HDCCE_DISABLE		(0)
+#define AW_PID_2049_HDCCE_DISABLE_VALUE	\
+	(AW_PID_2049_HDCCE_DISABLE << AW_PID_2049_HDCCE_START_BIT)
+
+#define AW_PID_2049_HDCCE_ENABLE		(1)
+#define AW_PID_2049_HDCCE_ENABLE_VALUE	\
+	(AW_PID_2049_HDCCE_ENABLE << AW_PID_2049_HDCCE_START_BIT)
+
+#define AW_PID_2049_HDCCE_DEFAULT_VALUE	(1)
+#define AW_PID_2049_HDCCE_DEFAULT		\
+	(AW_PID_2049_HDCCE_DEFAULT_VALUE << AW_PID_2049_HDCCE_START_BIT)
+
+/* HMUTE bit 8 (SYSCTRL 0x04) */
+#define AW_PID_2049_HMUTE_START_BIT		(8)
+#define AW_PID_2049_HMUTE_BITS_LEN		(1)
+#define AW_PID_2049_HMUTE_MASK			\
+	(~(((1<<AW_PID_2049_HMUTE_BITS_LEN)-1) << AW_PID_2049_HMUTE_START_BIT))
+
+#define AW_PID_2049_HMUTE_DISABLE		(0)
+#define AW_PID_2049_HMUTE_DISABLE_VALUE	\
+	(AW_PID_2049_HMUTE_DISABLE << AW_PID_2049_HMUTE_START_BIT)
+
+#define AW_PID_2049_HMUTE_ENABLE		(1)
+#define AW_PID_2049_HMUTE_ENABLE_VALUE	\
+	(AW_PID_2049_HMUTE_ENABLE << AW_PID_2049_HMUTE_START_BIT)
+
+#define AW_PID_2049_HMUTE_DEFAULT_VALUE	(1)
+#define AW_PID_2049_HMUTE_DEFAULT		\
+	(AW_PID_2049_HMUTE_DEFAULT_VALUE << AW_PID_2049_HMUTE_START_BIT)
+
+/* RCV_MODE bit 7 (SYSCTRL 0x04) */
+#define AW_PID_2049_RCV_MODE_START_BIT	(7)
+#define AW_PID_2049_RCV_MODE_BITS_LEN	(1)
+#define AW_PID_2049_RCV_MODE_MASK		\
+	(~(((1<<AW_PID_2049_RCV_MODE_BITS_LEN)-1) << AW_PID_2049_RCV_MODE_START_BIT))
+
+#define AW_PID_2049_RCV_MODE_SPEAKER	(0)
+#define AW_PID_2049_RCV_MODE_SPEAKER_VALUE	\
+	(AW_PID_2049_RCV_MODE_SPEAKER << AW_PID_2049_RCV_MODE_START_BIT)
+
+#define AW_PID_2049_RCV_MODE_RECEIVER	(1)
+#define AW_PID_2049_RCV_MODE_RECEIVER_VALUE	\
+	(AW_PID_2049_RCV_MODE_RECEIVER << AW_PID_2049_RCV_MODE_START_BIT)
+
+#define AW_PID_2049_RCV_MODE_DEFAULT_VALUE	(0)
+#define AW_PID_2049_RCV_MODE_DEFAULT	\
+	(AW_PID_2049_RCV_MODE_DEFAULT_VALUE << AW_PID_2049_RCV_MODE_START_BIT)
+
+/* I2SEN bit 6 (SYSCTRL 0x04) */
+#define AW_PID_2049_I2SEN_START_BIT		(6)
+#define AW_PID_2049_I2SEN_BITS_LEN		(1)
+#define AW_PID_2049_I2SEN_MASK			\
+	(~(((1<<AW_PID_2049_I2SEN_BITS_LEN)-1) << AW_PID_2049_I2SEN_START_BIT))
+
+#define AW_PID_2049_I2SEN_DISABLE		(0)
+#define AW_PID_2049_I2SEN_DISABLE_VALUE	\
+	(AW_PID_2049_I2SEN_DISABLE << AW_PID_2049_I2SEN_START_BIT)
+
+#define AW_PID_2049_I2SEN_ENABLE		(1)
+#define AW_PID_2049_I2SEN_ENABLE_VALUE	\
+	(AW_PID_2049_I2SEN_ENABLE << AW_PID_2049_I2SEN_START_BIT)
+
+#define AW_PID_2049_I2SEN_DEFAULT_VALUE	(0)
+#define AW_PID_2049_I2SEN_DEFAULT		\
+	(AW_PID_2049_I2SEN_DEFAULT_VALUE << AW_PID_2049_I2SEN_START_BIT)
+
+/* WSINV bit 5 (SYSCTRL 0x04) */
+#define AW_PID_2049_WSINV_START_BIT		(5)
+#define AW_PID_2049_WSINV_BITS_LEN		(1)
+#define AW_PID_2049_WSINV_MASK			\
+	(~(((1<<AW_PID_2049_WSINV_BITS_LEN)-1) << AW_PID_2049_WSINV_START_BIT))
+
+#define AW_PID_2049_WSINV_NOT_SWITCH	(0)
+#define AW_PID_2049_WSINV_NOT_SWITCH_VALUE	\
+	(AW_PID_2049_WSINV_NOT_SWITCH << AW_PID_2049_WSINV_START_BIT)
+
+#define AW_PID_2049_WSINV_SWITCH		(1)
+#define AW_PID_2049_WSINV_SWITCH_VALUE	\
+	(AW_PID_2049_WSINV_SWITCH << AW_PID_2049_WSINV_START_BIT)
+
+#define AW_PID_2049_WSINV_DEFAULT_VALUE	(0)
+#define AW_PID_2049_WSINV_DEFAULT		\
+	(AW_PID_2049_WSINV_DEFAULT_VALUE << AW_PID_2049_WSINV_START_BIT)
+
+/* BCKINV bit 4 (SYSCTRL 0x04) */
+#define AW_PID_2049_BCKINV_START_BIT	(4)
+#define AW_PID_2049_BCKINV_BITS_LEN		(1)
+#define AW_PID_2049_BCKINV_MASK			\
+	(~(((1<<AW_PID_2049_BCKINV_BITS_LEN)-1) << AW_PID_2049_BCKINV_START_BIT))
+
+#define AW_PID_2049_BCKINV_NOT_INVERT	(0)
+#define AW_PID_2049_BCKINV_NOT_INVERT_VALUE	\
+	(AW_PID_2049_BCKINV_NOT_INVERT << AW_PID_2049_BCKINV_START_BIT)
+
+#define AW_PID_2049_BCKINV_INVERTED		(1)
+#define AW_PID_2049_BCKINV_INVERTED_VALUE	\
+	(AW_PID_2049_BCKINV_INVERTED << AW_PID_2049_BCKINV_START_BIT)
+
+#define AW_PID_2049_BCKINV_DEFAULT_VALUE	(0)
+#define AW_PID_2049_BCKINV_DEFAULT		\
+	(AW_PID_2049_BCKINV_DEFAULT_VALUE << AW_PID_2049_BCKINV_START_BIT)
+
+/* IPLL bit 3 (SYSCTRL 0x04) */
+#define AW_PID_2049_IPLL_START_BIT		(3)
+#define AW_PID_2049_IPLL_BITS_LEN		(1)
+#define AW_PID_2049_IPLL_MASK			\
+	(~(((1<<AW_PID_2049_IPLL_BITS_LEN)-1) << AW_PID_2049_IPLL_START_BIT))
+
+#define AW_PID_2049_IPLL_BCK			(0)
+#define AW_PID_2049_IPLL_BCK_VALUE		\
+	(AW_PID_2049_IPLL_BCK << AW_PID_2049_IPLL_START_BIT)
+
+#define AW_PID_2049_IPLL_WCK			(1)
+#define AW_PID_2049_IPLL_WCK_VALUE		\
+	(AW_PID_2049_IPLL_WCK << AW_PID_2049_IPLL_START_BIT)
+
+#define AW_PID_2049_IPLL_DEFAULT_VALUE	(0)
+#define AW_PID_2049_IPLL_DEFAULT		\
+	(AW_PID_2049_IPLL_DEFAULT_VALUE << AW_PID_2049_IPLL_START_BIT)
+
+/* DSPBY bit 2 (SYSCTRL 0x04) */
+#define AW_PID_2049_DSPBY_START_BIT		(2)
+#define AW_PID_2049_DSPBY_BITS_LEN		(1)
+#define AW_PID_2049_DSPBY_MASK			\
+	(~(((1<<AW_PID_2049_DSPBY_BITS_LEN)-1) << AW_PID_2049_DSPBY_START_BIT))
+
+#define AW_PID_2049_DSPBY_WORKING		(0)
+#define AW_PID_2049_DSPBY_WORKING_VALUE	\
+	(AW_PID_2049_DSPBY_WORKING << AW_PID_2049_DSPBY_START_BIT)
+
+#define AW_PID_2049_DSPBY_BYPASS		(1)
+#define AW_PID_2049_DSPBY_BYPASS_VALUE	\
+	(AW_PID_2049_DSPBY_BYPASS << AW_PID_2049_DSPBY_START_BIT)
+
+#define AW_PID_2049_DSPBY_DEFAULT_VALUE	(1)
+#define AW_PID_2049_DSPBY_DEFAULT		\
+	(AW_PID_2049_DSPBY_DEFAULT_VALUE << AW_PID_2049_DSPBY_START_BIT)
+
+/* AMPPD bit 1 (SYSCTRL 0x04) */
+#define AW_PID_2049_AMPPD_START_BIT		(1)
+#define AW_PID_2049_AMPPD_BITS_LEN		(1)
+#define AW_PID_2049_AMPPD_MASK			\
+	(~(((1<<AW_PID_2049_AMPPD_BITS_LEN)-1) << AW_PID_2049_AMPPD_START_BIT))
+
+#define AW_PID_2049_AMPPD_WORKING		(0)
+#define AW_PID_2049_AMPPD_WORKING_VALUE	\
+	(AW_PID_2049_AMPPD_WORKING << AW_PID_2049_AMPPD_START_BIT)
+
+#define AW_PID_2049_AMPPD_POWER_DOWN	(1)
+#define AW_PID_2049_AMPPD_POWER_DOWN_VALUE	\
+	(AW_PID_2049_AMPPD_POWER_DOWN << AW_PID_2049_AMPPD_START_BIT)
+
+#define AW_PID_2049_AMPPD_DEFAULT_VALUE	(1)
+#define AW_PID_2049_AMPPD_DEFAULT		\
+	(AW_PID_2049_AMPPD_DEFAULT_VALUE << AW_PID_2049_AMPPD_START_BIT)
+
+/* PWDN bit 0 (SYSCTRL 0x04) */
+#define AW_PID_2049_PWDN_START_BIT		(0)
+#define AW_PID_2049_PWDN_BITS_LEN		(1)
+#define AW_PID_2049_PWDN_MASK			\
+	(~(((1<<AW_PID_2049_PWDN_BITS_LEN)-1) << AW_PID_2049_PWDN_START_BIT))
+
+#define AW_PID_2049_PWDN_WORKING		(0)
+#define AW_PID_2049_PWDN_WORKING_VALUE	\
+	(AW_PID_2049_PWDN_WORKING << AW_PID_2049_PWDN_START_BIT)
+
+#define AW_PID_2049_PWDN_POWER_DOWN		(1)
+#define AW_PID_2049_PWDN_POWER_DOWN_VALUE	\
+	(AW_PID_2049_PWDN_POWER_DOWN << AW_PID_2049_PWDN_START_BIT)
+
+#define AW_PID_2049_PWDN_DEFAULT_VALUE	(1)
+#define AW_PID_2049_PWDN_DEFAULT		\
+	(AW_PID_2049_PWDN_DEFAULT_VALUE << AW_PID_2049_PWDN_START_BIT)
+
+/* default value of SYSCTRL (0x04) */
+/* #define AW_PID_2049_SYSCTRL_DEFAULT		(0x5307) */
+
+/* SYSCTRL2 (0x05) detail */
+/* VOL bit 15:6 (SYSCTRL2 0x05) */
+#define AW_PID_2049_MUTE_VOL		(90 * 8)
+#define AW_PID_2049_VOLUME_STEP_DB		(6 * 8)
+
+#define AW_PID_2049_VOL_6DB_START				(6)
+#define AW_PID_2049_VOL_START_BIT		(6)
+#define AW_PID_2049_VOL_BITS_LEN		(10)
+#define AW_PID_2049_VOL_MASK			\
+	(~(((1<<AW_PID_2049_VOL_BITS_LEN)-1) << AW_PID_2049_VOL_START_BIT))
+
+#define AW_PID_2049_VOL_DEFAULT_VALUE	(0)
+#define AW_PID_2049_VOL_DEFAULT			\
+	(AW_PID_2049_VOL_DEFAULT_VALUE << AW_PID_2049_VOL_START_BIT)
+
+/* INTMODE bit 5 (SYSCTRL2 0x05) */
+#define AW_PID_2049_INTMODE_START_BIT	(5)
+#define AW_PID_2049_INTMODE_BITS_LEN	(1)
+#define AW_PID_2049_INTMODE_MASK		\
+	(~(((1<<AW_PID_2049_INTMODE_BITS_LEN)-1) << AW_PID_2049_INTMODE_START_BIT))
+
+#define AW_PID_2049_INTMODE_OPENMINUS_DRAIN	(0)
+#define AW_PID_2049_INTMODE_OPENMINUS_DRAIN_VALUE	\
+	(AW_PID_2049_INTMODE_OPENMINUS_DRAIN << AW_PID_2049_INTMODE_START_BIT)
+
+#define AW_PID_2049_INTMODE_PUSHPULL	(1)
+#define AW_PID_2049_INTMODE_PUSHPULL_VALUE	\
+	(AW_PID_2049_INTMODE_PUSHPULL << AW_PID_2049_INTMODE_START_BIT)
+
+#define AW_PID_2049_INTMODE_DEFAULT_VALUE	(0)
+#define AW_PID_2049_INTMODE_DEFAULT		\
+	(AW_PID_2049_INTMODE_DEFAULT_VALUE << AW_PID_2049_INTMODE_START_BIT)
+
+/* INTN bit 4 (SYSCTRL2 0x05) */
+#define AW_PID_2049_INTN_START_BIT		(4)
+#define AW_PID_2049_INTN_BITS_LEN		(1)
+#define AW_PID_2049_INTN_MASK			\
+	(~(((1<<AW_PID_2049_INTN_BITS_LEN)-1) << AW_PID_2049_INTN_START_BIT))
+
+#define AW_PID_2049_INTN_SYSINT			(0)
+#define AW_PID_2049_INTN_SYSINT_VALUE	\
+	(AW_PID_2049_INTN_SYSINT << AW_PID_2049_INTN_START_BIT)
+
+#define AW_PID_2049_INTN_SYSST			(1)
+#define AW_PID_2049_INTN_SYSST_VALUE	\
+	(AW_PID_2049_INTN_SYSST << AW_PID_2049_INTN_START_BIT)
+
+#define AW_PID_2049_INTN_DEFAULT_VALUE	(0)
+#define AW_PID_2049_INTN_DEFAULT		\
+	(AW_PID_2049_INTN_DEFAULT_VALUE << AW_PID_2049_INTN_START_BIT)
+
+/* BST_IPEAK bit 3:0 (SYSCTRL2 0x05) */
+#define AW_PID_2049_BST_IPEAK_START_BIT	(0)
+#define AW_PID_2049_BST_IPEAK_BITS_LEN	(4)
+#define AW_PID_2049_BST_IPEAK_MASK		\
+	(~(((1<<AW_PID_2049_BST_IPEAK_BITS_LEN)-1) << AW_PID_2049_BST_IPEAK_START_BIT))
+
+#define AW_PID_2049_BST_IPEAK_1P50A		(0)
+#define AW_PID_2049_BST_IPEAK_1P50A_VALUE	\
+	(AW_PID_2049_BST_IPEAK_1P50A << AW_PID_2049_BST_IPEAK_START_BIT)
+
+#define AW_PID_2049_BST_IPEAK_1P75A		(1)
+#define AW_PID_2049_BST_IPEAK_1P75A_VALUE	\
+	(AW_PID_2049_BST_IPEAK_1P75A << AW_PID_2049_BST_IPEAK_START_BIT)
+
+#define AW_PID_2049_BST_IPEAK_2P00A		(2)
+#define AW_PID_2049_BST_IPEAK_2P00A_VALUE	\
+	(AW_PID_2049_BST_IPEAK_2P00A << AW_PID_2049_BST_IPEAK_START_BIT)
+
+#define AW_PID_2049_BST_IPEAK_2P25A		(3)
+#define AW_PID_2049_BST_IPEAK_2P25A_VALUE	\
+	(AW_PID_2049_BST_IPEAK_2P25A << AW_PID_2049_BST_IPEAK_START_BIT)
+
+#define AW_PID_2049_BST_IPEAK_2P50A		(4)
+#define AW_PID_2049_BST_IPEAK_2P50A_VALUE	\
+	(AW_PID_2049_BST_IPEAK_2P50A << AW_PID_2049_BST_IPEAK_START_BIT)
+
+#define AW_PID_2049_BST_IPEAK_2P75A		(5)
+#define AW_PID_2049_BST_IPEAK_2P75A_VALUE	\
+	(AW_PID_2049_BST_IPEAK_2P75A << AW_PID_2049_BST_IPEAK_START_BIT)
+
+#define AW_PID_2049_BST_IPEAK_3P00A		(6)
+#define AW_PID_2049_BST_IPEAK_3P00A_VALUE	\
+	(AW_PID_2049_BST_IPEAK_3P00A << AW_PID_2049_BST_IPEAK_START_BIT)
+
+#define AW_PID_2049_BST_IPEAK_3P25A		(7)
+#define AW_PID_2049_BST_IPEAK_3P25A_VALUE	\
+	(AW_PID_2049_BST_IPEAK_3P25A << AW_PID_2049_BST_IPEAK_START_BIT)
+
+#define AW_PID_2049_BST_IPEAK_3P50A		(8)
+#define AW_PID_2049_BST_IPEAK_3P50A_VALUE	\
+	(AW_PID_2049_BST_IPEAK_3P50A << AW_PID_2049_BST_IPEAK_START_BIT)
+
+#define AW_PID_2049_BST_IPEAK_3P75A		(9)
+#define AW_PID_2049_BST_IPEAK_3P75A_VALUE	\
+	(AW_PID_2049_BST_IPEAK_3P75A << AW_PID_2049_BST_IPEAK_START_BIT)
+
+#define AW_PID_2049_BST_IPEAK_4P00A		(10)
+#define AW_PID_2049_BST_IPEAK_4P00A_VALUE	\
+	(AW_PID_2049_BST_IPEAK_4P00A << AW_PID_2049_BST_IPEAK_START_BIT)
+
+#define AW_PID_2049_BST_IPEAK_4P25A		(11)
+#define AW_PID_2049_BST_IPEAK_4P25A_VALUE	\
+	(AW_PID_2049_BST_IPEAK_4P25A << AW_PID_2049_BST_IPEAK_START_BIT)
+
+#define AW_PID_2049_BST_IPEAK_4P50A		(12)
+#define AW_PID_2049_BST_IPEAK_4P50A_VALUE	\
+	(AW_PID_2049_BST_IPEAK_4P50A << AW_PID_2049_BST_IPEAK_START_BIT)
+
+#define AW_PID_2049_BST_IPEAK_DEFAULT_VALUE	(9)
+#define AW_PID_2049_BST_IPEAK_DEFAULT	\
+	(AW_PID_2049_BST_IPEAK_DEFAULT_VALUE << AW_PID_2049_BST_IPEAK_START_BIT)
+
+/* default value of SYSCTRL2 (0x05) */
+/* #define AW_PID_2049_SYSCTRL2_DEFAULT		(0x0009) */
+
+/* I2SCTRL (0x06) detail */
+/* SLOT_NUM bit 14:12 (I2SCTRL 0x06) */
+#define AW_PID_2049_SLOT_NUM_START_BIT	(12)
+#define AW_PID_2049_SLOT_NUM_BITS_LEN	(3)
+#define AW_PID_2049_SLOT_NUM_MASK		\
+	(~(((1<<AW_PID_2049_SLOT_NUM_BITS_LEN)-1) << AW_PID_2049_SLOT_NUM_START_BIT))
+
+#define AW_PID_2049_SLOT_NUM_I2S_MODE	(0)
+#define AW_PID_2049_SLOT_NUM_I2S_MODE_VALUE	\
+	(AW_PID_2049_SLOT_NUM_I2S_MODE << AW_PID_2049_SLOT_NUM_START_BIT)
+
+#define AW_PID_2049_SLOT_NUM_TDM1S		(1)
+#define AW_PID_2049_SLOT_NUM_TDM1S_VALUE	\
+	(AW_PID_2049_SLOT_NUM_TDM1S << AW_PID_2049_SLOT_NUM_START_BIT)
+
+#define AW_PID_2049_SLOT_NUM_TDM2S		(2)
+#define AW_PID_2049_SLOT_NUM_TDM2S_VALUE	\
+	(AW_PID_2049_SLOT_NUM_TDM2S << AW_PID_2049_SLOT_NUM_START_BIT)
+
+#define AW_PID_2049_SLOT_NUM_TDM4S		(3)
+#define AW_PID_2049_SLOT_NUM_TDM4S_VALUE	\
+	(AW_PID_2049_SLOT_NUM_TDM4S << AW_PID_2049_SLOT_NUM_START_BIT)
+
+#define AW_PID_2049_SLOT_NUM_TDM6S		(4)
+#define AW_PID_2049_SLOT_NUM_TDM6S_VALUE	\
+	(AW_PID_2049_SLOT_NUM_TDM6S << AW_PID_2049_SLOT_NUM_START_BIT)
+
+#define AW_PID_2049_SLOT_NUM_TDM8S		(5)
+#define AW_PID_2049_SLOT_NUM_TDM8S_VALUE	\
+	(AW_PID_2049_SLOT_NUM_TDM8S << AW_PID_2049_SLOT_NUM_START_BIT)
+
+#define AW_PID_2049_SLOT_NUM_TDM16S		(6)
+#define AW_PID_2049_SLOT_NUM_TDM16S_VALUE	\
+	(AW_PID_2049_SLOT_NUM_TDM16S << AW_PID_2049_SLOT_NUM_START_BIT)
+
+#define AW_PID_2049_SLOT_NUM_RESERVED	(7)
+#define AW_PID_2049_SLOT_NUM_RESERVED_VALUE	\
+	(AW_PID_2049_SLOT_NUM_RESERVED << AW_PID_2049_SLOT_NUM_START_BIT)
+
+#define AW_PID_2049_SLOT_NUM_DEFAULT_VALUE	(0)
+#define AW_PID_2049_SLOT_NUM_DEFAULT	\
+	(AW_PID_2049_SLOT_NUM_DEFAULT_VALUE << AW_PID_2049_SLOT_NUM_START_BIT)
+
+/* CHSEL bit 11:10 (I2SCTRL 0x06) */
+#define AW_PID_2049_CHSEL_START_BIT		(10)
+#define AW_PID_2049_CHSEL_BITS_LEN		(2)
+#define AW_PID_2049_CHSEL_MASK			\
+	(~(((1<<AW_PID_2049_CHSEL_BITS_LEN)-1) << AW_PID_2049_CHSEL_START_BIT))
+
+#define AW_PID_2049_CHSEL_RESERVED		(0)
+#define AW_PID_2049_CHSEL_RESERVED_VALUE	\
+	(AW_PID_2049_CHSEL_RESERVED << AW_PID_2049_CHSEL_START_BIT)
+
+#define AW_PID_2049_CHSEL_LEFT			(1)
+#define AW_PID_2049_CHSEL_LEFT_VALUE	\
+	(AW_PID_2049_CHSEL_LEFT << AW_PID_2049_CHSEL_START_BIT)
+
+#define AW_PID_2049_CHSEL_RIGHT			(2)
+#define AW_PID_2049_CHSEL_RIGHT_VALUE	\
+	(AW_PID_2049_CHSEL_RIGHT << AW_PID_2049_CHSEL_START_BIT)
+
+#define AW_PID_2049_CHSEL_MONO			(3)
+#define AW_PID_2049_CHSEL_MONO_VALUE	\
+	(AW_PID_2049_CHSEL_MONO << AW_PID_2049_CHSEL_START_BIT)
+
+#define AW_PID_2049_CHSEL_DEFAULT_VALUE	(1)
+#define AW_PID_2049_CHSEL_DEFAULT		\
+	(AW_PID_2049_CHSEL_DEFAULT_VALUE << AW_PID_2049_CHSEL_START_BIT)
+
+/* I2SMD bit 9:8 (I2SCTRL 0x06) */
+#define AW_PID_2049_I2SMD_START_BIT		(8)
+#define AW_PID_2049_I2SMD_BITS_LEN		(2)
+#define AW_PID_2049_I2SMD_MASK			\
+	(~(((1<<AW_PID_2049_I2SMD_BITS_LEN)-1) << AW_PID_2049_I2SMD_START_BIT))
+
+#define AW_PID_2049_I2SMD_PHILIP_STANDARD	(0)
+#define AW_PID_2049_I2SMD_PHILIP_STANDARD_VALUE	\
+	(AW_PID_2049_I2SMD_PHILIP_STANDARD << AW_PID_2049_I2SMD_START_BIT)
+
+#define AW_PID_2049_I2SMD_MSB_JUSTIFIED	(1)
+#define AW_PID_2049_I2SMD_MSB_JUSTIFIED_VALUE	\
+	(AW_PID_2049_I2SMD_MSB_JUSTIFIED << AW_PID_2049_I2SMD_START_BIT)
+
+#define AW_PID_2049_I2SMD_LSB_JUSTIFIED	(2)
+#define AW_PID_2049_I2SMD_LSB_JUSTIFIED_VALUE	\
+	(AW_PID_2049_I2SMD_LSB_JUSTIFIED << AW_PID_2049_I2SMD_START_BIT)
+
+#define AW_PID_2049_I2SMD_RESERVED		(3)
+#define AW_PID_2049_I2SMD_RESERVED_VALUE	\
+	(AW_PID_2049_I2SMD_RESERVED << AW_PID_2049_I2SMD_START_BIT)
+
+#define AW_PID_2049_I2SMD_DEFAULT_VALUE	(0)
+#define AW_PID_2049_I2SMD_DEFAULT		\
+	(AW_PID_2049_I2SMD_DEFAULT_VALUE << AW_PID_2049_I2SMD_START_BIT)
+
+/* I2SFS bit 7:6 (I2SCTRL 0x06) */
+#define AW_PID_2049_I2SFS_START_BIT		(6)
+#define AW_PID_2049_I2SFS_BITS_LEN		(2)
+#define AW_PID_2049_I2SFS_MASK			\
+	(~(((1<<AW_PID_2049_I2SFS_BITS_LEN)-1) << AW_PID_2049_I2SFS_START_BIT))
+
+#define AW_PID_2049_I2SFS_16_BITS		(0)
+#define AW_PID_2049_I2SFS_16_BITS_VALUE	\
+	(AW_PID_2049_I2SFS_16_BITS << AW_PID_2049_I2SFS_START_BIT)
+
+#define AW_PID_2049_I2SFS_20_BITS		(1)
+#define AW_PID_2049_I2SFS_20_BITS_VALUE	\
+	(AW_PID_2049_I2SFS_20_BITS << AW_PID_2049_I2SFS_START_BIT)
+
+#define AW_PID_2049_I2SFS_24_BITS		(2)
+#define AW_PID_2049_I2SFS_24_BITS_VALUE	\
+	(AW_PID_2049_I2SFS_24_BITS << AW_PID_2049_I2SFS_START_BIT)
+
+#define AW_PID_2049_I2SFS_32_BITS		(3)
+#define AW_PID_2049_I2SFS_32_BITS_VALUE	\
+	(AW_PID_2049_I2SFS_32_BITS << AW_PID_2049_I2SFS_START_BIT)
+
+#define AW_PID_2049_I2SFS_DEFAULT_VALUE	(3)
+#define AW_PID_2049_I2SFS_DEFAULT		\
+	(AW_PID_2049_I2SFS_DEFAULT_VALUE << AW_PID_2049_I2SFS_START_BIT)
+
+/* I2SBCK bit 5:4 (I2SCTRL 0x06) */
+#define AW_PID_2049_I2SBCK_START_BIT	(4)
+#define AW_PID_2049_I2SBCK_BITS_LEN		(2)
+#define AW_PID_2049_I2SBCK_MASK			\
+	(~(((1<<AW_PID_2049_I2SBCK_BITS_LEN)-1) << AW_PID_2049_I2SBCK_START_BIT))
+
+#define AW_PID_2049_I2SBCK_32FS			(0)
+#define AW_PID_2049_I2SBCK_32FS_VALUE	\
+	(AW_PID_2049_I2SBCK_32FS << AW_PID_2049_I2SBCK_START_BIT)
+
+#define AW_PID_2049_I2SBCK_48FS			(1)
+#define AW_PID_2049_I2SBCK_48FS_VALUE	\
+	(AW_PID_2049_I2SBCK_48FS << AW_PID_2049_I2SBCK_START_BIT)
+
+#define AW_PID_2049_I2SBCK_64FS			(2)
+#define AW_PID_2049_I2SBCK_64FS_VALUE	\
+	(AW_PID_2049_I2SBCK_64FS << AW_PID_2049_I2SBCK_START_BIT)
+
+#define AW_PID_2049_I2SBCK_RESERVED		(3)
+#define AW_PID_2049_I2SBCK_RESERVED_VALUE	\
+	(AW_PID_2049_I2SBCK_RESERVED << AW_PID_2049_I2SBCK_START_BIT)
+
+#define AW_PID_2049_I2SBCK_DEFAULT_VALUE	(2)
+#define AW_PID_2049_I2SBCK_DEFAULT		\
+	(AW_PID_2049_I2SBCK_DEFAULT_VALUE << AW_PID_2049_I2SBCK_START_BIT)
+
+/* I2SSR bit 3:0 (I2SCTRL 0x06) */
+#define AW_PID_2049_I2SSR_START_BIT		(0)
+#define AW_PID_2049_I2SSR_BITS_LEN		(4)
+#define AW_PID_2049_I2SSR_MASK			\
+	(~(((1<<AW_PID_2049_I2SSR_BITS_LEN)-1) << AW_PID_2049_I2SSR_START_BIT))
+
+#define AW_PID_2049_I2SSR_8_KHZ			(0)
+#define AW_PID_2049_I2SSR_8_KHZ_VALUE	\
+	(AW_PID_2049_I2SSR_8_KHZ << AW_PID_2049_I2SSR_START_BIT)
+
+#define AW_PID_2049_I2SSR_11_KHZ		(1)
+#define AW_PID_2049_I2SSR_11_KHZ_VALUE	\
+	(AW_PID_2049_I2SSR_11_KHZ << AW_PID_2049_I2SSR_START_BIT)
+
+#define AW_PID_2049_I2SSR_12_KHZ		(2)
+#define AW_PID_2049_I2SSR_12_KHZ_VALUE	\
+	(AW_PID_2049_I2SSR_12_KHZ << AW_PID_2049_I2SSR_START_BIT)
+
+#define AW_PID_2049_I2SSR_16_KHZ		(3)
+#define AW_PID_2049_I2SSR_16_KHZ_VALUE	\
+	(AW_PID_2049_I2SSR_16_KHZ << AW_PID_2049_I2SSR_START_BIT)
+
+#define AW_PID_2049_I2SSR_22_KHZ		(4)
+#define AW_PID_2049_I2SSR_22_KHZ_VALUE	\
+	(AW_PID_2049_I2SSR_22_KHZ << AW_PID_2049_I2SSR_START_BIT)
+
+#define AW_PID_2049_I2SSR_24_KHZ		(5)
+#define AW_PID_2049_I2SSR_24_KHZ_VALUE	\
+	(AW_PID_2049_I2SSR_24_KHZ << AW_PID_2049_I2SSR_START_BIT)
+
+#define AW_PID_2049_I2SSR_32_KHZ		(6)
+#define AW_PID_2049_I2SSR_32_KHZ_VALUE	\
+	(AW_PID_2049_I2SSR_32_KHZ << AW_PID_2049_I2SSR_START_BIT)
+
+#define AW_PID_2049_I2SSR_44_KHZ		(7)
+#define AW_PID_2049_I2SSR_44_KHZ_VALUE	\
+	(AW_PID_2049_I2SSR_44_KHZ << AW_PID_2049_I2SSR_START_BIT)
+
+#define AW_PID_2049_I2SSR_48_KHZ		(8)
+#define AW_PID_2049_I2SSR_48_KHZ_VALUE	\
+	(AW_PID_2049_I2SSR_48_KHZ << AW_PID_2049_I2SSR_START_BIT)
+
+#define AW_PID_2049_I2SSR_96_KHZ		(9)
+#define AW_PID_2049_I2SSR_96_KHZ_VALUE	\
+	(AW_PID_2049_I2SSR_96_KHZ << AW_PID_2049_I2SSR_START_BIT)
+
+#define AW_PID_2049_I2SSR_192KHZ		(10)
+#define AW_PID_2049_I2SSR_192KHZ_VALUE	\
+	(AW_PID_2049_I2SSR_192KHZ << AW_PID_2049_I2SSR_START_BIT)
+
+#define AW_PID_2049_I2SSR_DEFAULT_VALUE	(8)
+#define AW_PID_2049_I2SSR_DEFAULT		\
+	(AW_PID_2049_I2SSR_DEFAULT_VALUE << AW_PID_2049_I2SSR_START_BIT)
+
+/* default value of I2SCTRL (0x06) */
+/* #define AW_PID_2049_I2SCTRL_DEFAULT		(0x04E8) */
+
+/* I2SCFG1 (0x07) detail */
+/* I2S_RXL_SLOTVLD bit 15:12 (I2SCFG1 0x07) */
+#define AW_PID_2049_I2S_RXL_SLOTVLD_START_BIT	(12)
+#define AW_PID_2049_I2S_RXL_SLOTVLD_BITS_LEN	(4)
+#define AW_PID_2049_I2S_RXL_SLOTVLD_MASK	\
+	(~(((1<<AW_PID_2049_I2S_RXL_SLOTVLD_BITS_LEN)-1) << AW_PID_2049_I2S_RXL_SLOTVLD_START_BIT))
+
+#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_0	(0)
+#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_0_VALUE	\
+	(AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_0 << AW_PID_2049_I2S_RXL_SLOTVLD_START_BIT)
+
+#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_1	(1)
+#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_1_VALUE	\
+	(AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_1 << AW_PID_2049_I2S_RXL_SLOTVLD_START_BIT)
+
+#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_2	(2)
+#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_2_VALUE	\
+	(AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_2 << AW_PID_2049_I2S_RXL_SLOTVLD_START_BIT)
+
+#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_3	(3)
+#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_3_VALUE	\
+	(AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_3 << AW_PID_2049_I2S_RXL_SLOTVLD_START_BIT)
+
+#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_15	(15)
+#define AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_15_VALUE	\
+	(AW_PID_2049_I2S_RXL_SLOTVLD_SLOT_15 << AW_PID_2049_I2S_RXL_SLOTVLD_START_BIT)
+
+#define AW_PID_2049_I2S_RXL_SLOTVLD_DEFAULT_VALUE	(0)
+#define AW_PID_2049_I2S_RXL_SLOTVLD_DEFAULT	\
+	(AW_PID_2049_I2S_RXL_SLOTVLD_DEFAULT_VALUE << AW_PID_2049_I2S_RXL_SLOTVLD_START_BIT)
+
+/* I2S_RXR_SLOTVLD bit 11:8 (I2SCFG1 0x07) */
+#define AW_PID_2049_I2S_RXR_SLOTVLD_START_BIT	(8)
+#define AW_PID_2049_I2S_RXR_SLOTVLD_BITS_LEN	(4)
+#define AW_PID_2049_I2S_RXR_SLOTVLD_MASK	\
+	(~(((1<<AW_PID_2049_I2S_RXR_SLOTVLD_BITS_LEN)-1) << AW_PID_2049_I2S_RXR_SLOTVLD_START_BIT))
+
+#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_0	(0)
+#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_0_VALUE	\
+	(AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_0 << AW_PID_2049_I2S_RXR_SLOTVLD_START_BIT)
+
+#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_1	(1)
+#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_1_VALUE	\
+	(AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_1 << AW_PID_2049_I2S_RXR_SLOTVLD_START_BIT)
+
+#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_2	(2)
+#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_2_VALUE	\
+	(AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_2 << AW_PID_2049_I2S_RXR_SLOTVLD_START_BIT)
+
+#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_3	(3)
+#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_3_VALUE	\
+	(AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_3 << AW_PID_2049_I2S_RXR_SLOTVLD_START_BIT)
+
+#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_15	(15)
+#define AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_15_VALUE	\
+	(AW_PID_2049_I2S_RXR_SLOTVLD_SLOT_15 << AW_PID_2049_I2S_RXR_SLOTVLD_START_BIT)
+
+#define AW_PID_2049_I2S_RXR_SLOTVLD_DEFAULT_VALUE	(1)
+#define AW_PID_2049_I2S_RXR_SLOTVLD_DEFAULT	\
+	(AW_PID_2049_I2S_RXR_SLOTVLD_DEFAULT_VALUE << AW_PID_2049_I2S_RXR_SLOTVLD_START_BIT)
+
+/* I2S_TX_SLOTVLD bit 7:4 (I2SCFG1 0x07) */
+#define AW_PID_2049_I2S_TX_SLOTVLD_START_BIT	(4)
+#define AW_PID_2049_I2S_TX_SLOTVLD_BITS_LEN	(4)
+#define AW_PID_2049_I2S_TX_SLOTVLD_MASK	\
+	(~(((1<<AW_PID_2049_I2S_TX_SLOTVLD_BITS_LEN)-1) << AW_PID_2049_I2S_TX_SLOTVLD_START_BIT))
+
+#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_0	(0)
+#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_0_VALUE	\
+	(AW_PID_2049_I2S_TX_SLOTVLD_SLOT_0 << AW_PID_2049_I2S_TX_SLOTVLD_START_BIT)
+
+#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_1	(1)
+#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_1_VALUE	\
+	(AW_PID_2049_I2S_TX_SLOTVLD_SLOT_1 << AW_PID_2049_I2S_TX_SLOTVLD_START_BIT)
+
+#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_2	(2)
+#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_2_VALUE	\
+	(AW_PID_2049_I2S_TX_SLOTVLD_SLOT_2 << AW_PID_2049_I2S_TX_SLOTVLD_START_BIT)
+
+#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_3	(3)
+#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_3_VALUE	\
+	(AW_PID_2049_I2S_TX_SLOTVLD_SLOT_3 << AW_PID_2049_I2S_TX_SLOTVLD_START_BIT)
+
+#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_15	(15)
+#define AW_PID_2049_I2S_TX_SLOTVLD_SLOT_15_VALUE	\
+	(AW_PID_2049_I2S_TX_SLOTVLD_SLOT_15 << AW_PID_2049_I2S_TX_SLOTVLD_START_BIT)
+
+#define AW_PID_2049_I2S_TX_SLOTVLD_DEFAULT_VALUE	(0)
+#define AW_PID_2049_I2S_TX_SLOTVLD_DEFAULT	\
+	(AW_PID_2049_I2S_TX_SLOTVLD_DEFAULT_VALUE << AW_PID_2049_I2S_TX_SLOTVLD_START_BIT)
+
+/* FSYNC_TYPE bit 3 (I2SCFG1 0x07) */
+#define AW_PID_2049_FSYNC_TYPE_START_BIT	(3)
+#define AW_PID_2049_FSYNC_TYPE_BITS_LEN	(1)
+#define AW_PID_2049_FSYNC_TYPE_MASK		\
+	(~(((1<<AW_PID_2049_FSYNC_TYPE_BITS_LEN)-1) << AW_PID_2049_FSYNC_TYPE_START_BIT))
+
+#define AW_PID_2049_FSYNC_TYPE_ONEMINUS_SLOT	(0)
+#define AW_PID_2049_FSYNC_TYPE_ONEMINUS_SLOT_VALUE	\
+	(AW_PID_2049_FSYNC_TYPE_ONEMINUS_SLOT << AW_PID_2049_FSYNC_TYPE_START_BIT)
+
+#define AW_PID_2049_FSYNC_TYPE_ONEMINUS_BCK	(1)
+#define AW_PID_2049_FSYNC_TYPE_ONEMINUS_BCK_VALUE	\
+	(AW_PID_2049_FSYNC_TYPE_ONEMINUS_BCK << AW_PID_2049_FSYNC_TYPE_START_BIT)
+
+#define AW_PID_2049_FSYNC_TYPE_DEFAULT_VALUE	(0)
+#define AW_PID_2049_FSYNC_TYPE_DEFAULT	\
+	(AW_PID_2049_FSYNC_TYPE_DEFAULT_VALUE << AW_PID_2049_FSYNC_TYPE_START_BIT)
+
+/* I2SCHS bit 2 (I2SCFG1 0x07) */
+#define AW_PID_2049_I2SCHS_START_BIT	(2)
+#define AW_PID_2049_I2SCHS_BITS_LEN		(1)
+#define AW_PID_2049_I2SCHS_MASK			\
+	(~(((1<<AW_PID_2049_I2SCHS_BITS_LEN)-1) << AW_PID_2049_I2SCHS_START_BIT))
+
+#define AW_PID_2049_I2SCHS_LEFT			(0)
+#define AW_PID_2049_I2SCHS_LEFT_VALUE	\
+	(AW_PID_2049_I2SCHS_LEFT << AW_PID_2049_I2SCHS_START_BIT)
+
+#define AW_PID_2049_I2SCHS_RIGHT		(1)
+#define AW_PID_2049_I2SCHS_RIGHT_VALUE	\
+	(AW_PID_2049_I2SCHS_RIGHT << AW_PID_2049_I2SCHS_START_BIT)
+
+#define AW_PID_2049_I2SCHS_DEFAULT_VALUE	(0)
+#define AW_PID_2049_I2SCHS_DEFAULT		\
+	(AW_PID_2049_I2SCHS_DEFAULT_VALUE << AW_PID_2049_I2SCHS_START_BIT)
+
+/* I2SRXEN bit 1 (I2SCFG1 0x07) */
+#define AW_PID_2049_I2SRXEN_START_BIT	(1)
+#define AW_PID_2049_I2SRXEN_BITS_LEN	(1)
+#define AW_PID_2049_I2SRXEN_MASK		\
+	(~(((1<<AW_PID_2049_I2SRXEN_BITS_LEN)-1) << AW_PID_2049_I2SRXEN_START_BIT))
+
+#define AW_PID_2049_I2SRXEN_DISABLE		(0)
+#define AW_PID_2049_I2SRXEN_DISABLE_VALUE	\
+	(AW_PID_2049_I2SRXEN_DISABLE << AW_PID_2049_I2SRXEN_START_BIT)
+
+#define AW_PID_2049_I2SRXEN_ENABLE		(1)
+#define AW_PID_2049_I2SRXEN_ENABLE_VALUE	\
+	(AW_PID_2049_I2SRXEN_ENABLE << AW_PID_2049_I2SRXEN_START_BIT)
+
+#define AW_PID_2049_I2SRXEN_DEFAULT_VALUE	(1)
+#define AW_PID_2049_I2SRXEN_DEFAULT		\
+	(AW_PID_2049_I2SRXEN_DEFAULT_VALUE << AW_PID_2049_I2SRXEN_START_BIT)
+
+/* I2STXEN bit 0 (I2SCFG1 0x07) */
+#define AW_PID_2049_I2STXEN_START_BIT	(0)
+#define AW_PID_2049_I2STXEN_BITS_LEN	(1)
+#define AW_PID_2049_I2STXEN_MASK		\
+	(~(((1<<AW_PID_2049_I2STXEN_BITS_LEN)-1) << AW_PID_2049_I2STXEN_START_BIT))
+
+#define AW_PID_2049_I2STXEN_DISABLE		(0)
+#define AW_PID_2049_I2STXEN_DISABLE_VALUE	\
+	(AW_PID_2049_I2STXEN_DISABLE << AW_PID_2049_I2STXEN_START_BIT)
+
+#define AW_PID_2049_I2STXEN_ENABLE		(1)
+#define AW_PID_2049_I2STXEN_ENABLE_VALUE	\
+	(AW_PID_2049_I2STXEN_ENABLE << AW_PID_2049_I2STXEN_START_BIT)
+
+#define AW_PID_2049_I2STXEN_DEFAULT_VALUE	(0)
+#define AW_PID_2049_I2STXEN_DEFAULT		\
+	(AW_PID_2049_I2STXEN_DEFAULT_VALUE << AW_PID_2049_I2STXEN_START_BIT)
+
+/* default value of I2SCFG1 (0x07) */
+/* #define AW_PID_2049_I2SCFG1_DEFAULT		(0x0102) */
+
+/* I2SCFG2 (0x08) detail */
+/* ULS_FIR_MD bit 14 (I2SCFG2 0x08) */
+#define AW_PID_2049_ULS_FIR_MD_START_BIT	(14)
+#define AW_PID_2049_ULS_FIR_MD_BITS_LEN	(1)
+#define AW_PID_2049_ULS_FIR_MD_MASK		\
+	(~(((1<<AW_PID_2049_ULS_FIR_MD_BITS_LEN)-1) << AW_PID_2049_ULS_FIR_MD_START_BIT))
+
+#define AW_PID_2049_ULS_FIR_MD_NOTMINUS_USED	(0)
+#define AW_PID_2049_ULS_FIR_MD_NOTMINUS_USED_VALUE	\
+	(AW_PID_2049_ULS_FIR_MD_NOTMINUS_USED << AW_PID_2049_ULS_FIR_MD_START_BIT)
+
+#define AW_PID_2049_ULS_FIR_MD_USED		(1)
+#define AW_PID_2049_ULS_FIR_MD_USED_VALUE	\
+	(AW_PID_2049_ULS_FIR_MD_USED << AW_PID_2049_ULS_FIR_MD_START_BIT)
+
+#define AW_PID_2049_ULS_FIR_MD_DEFAULT_VALUE	(0)
+#define AW_PID_2049_ULS_FIR_MD_DEFAULT	\
+	(AW_PID_2049_ULS_FIR_MD_DEFAULT_VALUE << AW_PID_2049_ULS_FIR_MD_START_BIT)
+
+/* ULS_MODE bit 13 (I2SCFG2 0x08) */
+#define AW_PID_2049_ULS_MODE_START_BIT	(13)
+#define AW_PID_2049_ULS_MODE_BITS_LEN	(1)
+#define AW_PID_2049_ULS_MODE_MASK		\
+	(~(((1<<AW_PID_2049_ULS_MODE_BITS_LEN)-1) << AW_PID_2049_ULS_MODE_START_BIT))
+
+#define AW_PID_2049_ULS_MODE_LOWPASS	(0)
+#define AW_PID_2049_ULS_MODE_LOWPASS_VALUE	\
+	(AW_PID_2049_ULS_MODE_LOWPASS << AW_PID_2049_ULS_MODE_START_BIT)
+
+#define AW_PID_2049_ULS_MODE_TDM		(1)
+#define AW_PID_2049_ULS_MODE_TDM_VALUE	\
+	(AW_PID_2049_ULS_MODE_TDM << AW_PID_2049_ULS_MODE_START_BIT)
+
+#define AW_PID_2049_ULS_MODE_DEFAULT_VALUE	(0)
+#define AW_PID_2049_ULS_MODE_DEFAULT	\
+	(AW_PID_2049_ULS_MODE_DEFAULT_VALUE << AW_PID_2049_ULS_MODE_START_BIT)
+
+/* ULS_EN bit 12 (I2SCFG2 0x08) */
+#define AW_PID_2049_ULS_EN_START_BIT	(12)
+#define AW_PID_2049_ULS_EN_BITS_LEN		(1)
+#define AW_PID_2049_ULS_EN_MASK			\
+	(~(((1<<AW_PID_2049_ULS_EN_BITS_LEN)-1) << AW_PID_2049_ULS_EN_START_BIT))
+
+#define AW_PID_2049_ULS_EN_DISABLE		(0)
+#define AW_PID_2049_ULS_EN_DISABLE_VALUE	\
+	(AW_PID_2049_ULS_EN_DISABLE << AW_PID_2049_ULS_EN_START_BIT)
+
+#define AW_PID_2049_ULS_EN_ENABLE		(1)
+#define AW_PID_2049_ULS_EN_ENABLE_VALUE	\
+	(AW_PID_2049_ULS_EN_ENABLE << AW_PID_2049_ULS_EN_START_BIT)
+
+#define AW_PID_2049_ULS_EN_DEFAULT_VALUE	(0)
+#define AW_PID_2049_ULS_EN_DEFAULT		\
+	(AW_PID_2049_ULS_EN_DEFAULT_VALUE << AW_PID_2049_ULS_EN_START_BIT)
+
+/* IV2CH bit 9 (I2SCFG2 0x08) */
+#define AW_PID_2049_IV2CH_START_BIT		(9)
+#define AW_PID_2049_IV2CH_BITS_LEN		(1)
+#define AW_PID_2049_IV2CH_MASK			\
+	(~(((1<<AW_PID_2049_IV2CH_BITS_LEN)-1) << AW_PID_2049_IV2CH_START_BIT))
+
+#define AW_PID_2049_IV2CH_LEGACY		(0)
+#define AW_PID_2049_IV2CH_LEGACY_VALUE	\
+	(AW_PID_2049_IV2CH_LEGACY << AW_PID_2049_IV2CH_START_BIT)
+
+#define AW_PID_2049_IV2CH_SPECIAL		(1)
+#define AW_PID_2049_IV2CH_SPECIAL_VALUE	\
+	(AW_PID_2049_IV2CH_SPECIAL << AW_PID_2049_IV2CH_START_BIT)
+
+#define AW_PID_2049_IV2CH_DEFAULT_VALUE	(0)
+#define AW_PID_2049_IV2CH_DEFAULT		\
+	(AW_PID_2049_IV2CH_DEFAULT_VALUE << AW_PID_2049_IV2CH_START_BIT)
+
+/* I2S_TXEDGE bit 8 (I2SCFG2 0x08) */
+#define AW_PID_2049_I2S_TXEDGE_START_BIT	(8)
+#define AW_PID_2049_I2S_TXEDGE_BITS_LEN	(1)
+#define AW_PID_2049_I2S_TXEDGE_MASK		\
+	(~(((1<<AW_PID_2049_I2S_TXEDGE_BITS_LEN)-1) << AW_PID_2049_I2S_TXEDGE_START_BIT))
+
+#define AW_PID_2049_I2S_TXEDGE_NEGEDGE	(0)
+#define AW_PID_2049_I2S_TXEDGE_NEGEDGE_VALUE	\
+	(AW_PID_2049_I2S_TXEDGE_NEGEDGE << AW_PID_2049_I2S_TXEDGE_START_BIT)
+
+#define AW_PID_2049_I2S_TXEDGE_POSEDGE	(1)
+#define AW_PID_2049_I2S_TXEDGE_POSEDGE_VALUE	\
+	(AW_PID_2049_I2S_TXEDGE_POSEDGE << AW_PID_2049_I2S_TXEDGE_START_BIT)
+
+#define AW_PID_2049_I2S_TXEDGE_DEFAULT_VALUE	(0)
+#define AW_PID_2049_I2S_TXEDGE_DEFAULT	\
+	(AW_PID_2049_I2S_TXEDGE_DEFAULT_VALUE << AW_PID_2049_I2S_TXEDGE_START_BIT)
+
+/* I2SDOSEL bit 7 (I2SCFG2 0x08) */
+#define AW_PID_2049_I2SDOSEL_START_BIT	(7)
+#define AW_PID_2049_I2SDOSEL_BITS_LEN	(1)
+#define AW_PID_2049_I2SDOSEL_MASK		\
+	(~(((1<<AW_PID_2049_I2SDOSEL_BITS_LEN)-1) << AW_PID_2049_I2SDOSEL_START_BIT))
+
+#define AW_PID_2049_I2SDOSEL_ZEROS		(0)
+#define AW_PID_2049_I2SDOSEL_ZEROS_VALUE	\
+	(AW_PID_2049_I2SDOSEL_ZEROS << AW_PID_2049_I2SDOSEL_START_BIT)
+
+#define AW_PID_2049_I2SDOSEL_TXDATA		(1)
+#define AW_PID_2049_I2SDOSEL_TXDATA_VALUE	\
+	(AW_PID_2049_I2SDOSEL_TXDATA << AW_PID_2049_I2SDOSEL_START_BIT)
+
+#define AW_PID_2049_I2SDOSEL_DEFAULT_VALUE	(0)
+#define AW_PID_2049_I2SDOSEL_DEFAULT	\
+	(AW_PID_2049_I2SDOSEL_DEFAULT_VALUE << AW_PID_2049_I2SDOSEL_START_BIT)
+
+/* DOHZ bit 6 (I2SCFG2 0x08) */
+#define AW_PID_2049_DOHZ_START_BIT		(6)
+#define AW_PID_2049_DOHZ_BITS_LEN		(1)
+#define AW_PID_2049_DOHZ_MASK			\
+	(~(((1<<AW_PID_2049_DOHZ_BITS_LEN)-1) << AW_PID_2049_DOHZ_START_BIT))
+
+#define AW_PID_2049_DOHZ_ALL			(0)
+#define AW_PID_2049_DOHZ_ALL_VALUE		\
+	(AW_PID_2049_DOHZ_ALL << AW_PID_2049_DOHZ_START_BIT)
+
+#define AW_PID_2049_DOHZ_HIZ			(1)
+#define AW_PID_2049_DOHZ_HIZ_VALUE		\
+	(AW_PID_2049_DOHZ_HIZ << AW_PID_2049_DOHZ_START_BIT)
+
+#define AW_PID_2049_DOHZ_DEFAULT_VALUE	(1)
+#define AW_PID_2049_DOHZ_DEFAULT		\
+	(AW_PID_2049_DOHZ_DEFAULT_VALUE << AW_PID_2049_DOHZ_START_BIT)
+
+/* DRVSTREN bit 5 (I2SCFG2 0x08) */
+#define AW_PID_2049_DRVSTREN_START_BIT	(5)
+#define AW_PID_2049_DRVSTREN_BITS_LEN	(1)
+#define AW_PID_2049_DRVSTREN_MASK		\
+	(~(((1<<AW_PID_2049_DRVSTREN_BITS_LEN)-1) << AW_PID_2049_DRVSTREN_START_BIT))
+
+#define AW_PID_2049_DRVSTREN_4MA		(0)
+#define AW_PID_2049_DRVSTREN_4MA_VALUE	\
+	(AW_PID_2049_DRVSTREN_4MA << AW_PID_2049_DRVSTREN_START_BIT)
+
+#define AW_PID_2049_DRVSTREN_12MA		(1)
+#define AW_PID_2049_DRVSTREN_12MA_VALUE	\
+	(AW_PID_2049_DRVSTREN_12MA << AW_PID_2049_DRVSTREN_START_BIT)
+
+#define AW_PID_2049_DRVSTREN_DEFAULT_VALUE	(1)
+#define AW_PID_2049_DRVSTREN_DEFAULT	\
+	(AW_PID_2049_DRVSTREN_DEFAULT_VALUE << AW_PID_2049_DRVSTREN_START_BIT)
+
+/* INPLEV bit 4 (I2SCFG2 0x08) */
+#define AW_PID_2049_INPLEV_START_BIT	(4)
+#define AW_PID_2049_INPLEV_BITS_LEN		(1)
+#define AW_PID_2049_INPLEV_MASK			\
+	(~(((1<<AW_PID_2049_INPLEV_BITS_LEN)-1) << AW_PID_2049_INPLEV_START_BIT))
+
+#define AW_PID_2049_INPLEV_NOT_ATTENUATED	(0)
+#define AW_PID_2049_INPLEV_NOT_ATTENUATED_VALUE	\
+	(AW_PID_2049_INPLEV_NOT_ATTENUATED << AW_PID_2049_INPLEV_START_BIT)
+
+#define AW_PID_2049_INPLEV_ATTENUATED	(1)
+#define AW_PID_2049_INPLEV_ATTENUATED_VALUE	\
+	(AW_PID_2049_INPLEV_ATTENUATED << AW_PID_2049_INPLEV_START_BIT)
+
+#define AW_PID_2049_INPLEV_DEFAULT_VALUE	(0)
+#define AW_PID_2049_INPLEV_DEFAULT		\
+	(AW_PID_2049_INPLEV_DEFAULT_VALUE << AW_PID_2049_INPLEV_START_BIT)
+
+/* CFSEL bit 2:0 (I2SCFG2 0x08) */
+#define AW_PID_2049_CFSEL_START_BIT		(0)
+#define AW_PID_2049_CFSEL_BITS_LEN		(3)
+#define AW_PID_2049_CFSEL_MASK			\
+	(~(((1<<AW_PID_2049_CFSEL_BITS_LEN)-1) << AW_PID_2049_CFSEL_START_BIT))
+
+#define AW_PID_2049_CFSEL_HAGC			(0)
+#define AW_PID_2049_CFSEL_HAGC_VALUE	\
+	(AW_PID_2049_CFSEL_HAGC << AW_PID_2049_CFSEL_START_BIT)
+
+#define AW_PID_2049_CFSEL_DFIFO			(1)
+#define AW_PID_2049_CFSEL_DFIFO_VALUE	\
+	(AW_PID_2049_CFSEL_DFIFO << AW_PID_2049_CFSEL_START_BIT)
+
+#define AW_PID_2049_CFSEL_ULS			(2)
+#define AW_PID_2049_CFSEL_ULS_VALUE		\
+	(AW_PID_2049_CFSEL_ULS << AW_PID_2049_CFSEL_START_BIT)
+
+#define AW_PID_2049_CFSEL_IVT_FS		(3)
+#define AW_PID_2049_CFSEL_IVT_FS_VALUE	\
+	(AW_PID_2049_CFSEL_IVT_FS << AW_PID_2049_CFSEL_START_BIT)
+
+#define AW_PID_2049_CFSEL_IVT_IPVT		(4)
+#define AW_PID_2049_CFSEL_IVT_IPVT_VALUE	\
+	(AW_PID_2049_CFSEL_IVT_IPVT << AW_PID_2049_CFSEL_START_BIT)
+
+#define AW_PID_2049_CFSEL_DEFAULT_VALUE	(0)
+#define AW_PID_2049_CFSEL_DEFAULT		\
+	(AW_PID_2049_CFSEL_DEFAULT_VALUE << AW_PID_2049_CFSEL_START_BIT)
+
+/* default value of I2SCFG2 (0x08) */
+/* #define AW_PID_2049_I2SCFG2_DEFAULT		(0x0060) */
+
+/* HAGCCFG1 (0x09) detail */
+/* RVTH bit 15:8 (HAGCCFG1 0x09) */
+#define AW_PID_2049_RVTH_START_BIT		(8)
+#define AW_PID_2049_RVTH_BITS_LEN		(8)
+#define AW_PID_2049_RVTH_MASK			\
+	(~(((1<<AW_PID_2049_RVTH_BITS_LEN)-1) << AW_PID_2049_RVTH_START_BIT))
+
+#define AW_PID_2049_RVTH_DEFAULT_VALUE	(0x39)
+#define AW_PID_2049_RVTH_DEFAULT		\
+	(AW_PID_2049_RVTH_DEFAULT_VALUE << AW_PID_2049_RVTH_START_BIT)
+
+/* AVTH bit 7:0 (HAGCCFG1 0x09) */
+#define AW_PID_2049_AVTH_START_BIT		(0)
+#define AW_PID_2049_AVTH_BITS_LEN		(8)
+#define AW_PID_2049_AVTH_MASK			\
+	(~(((1<<AW_PID_2049_AVTH_BITS_LEN)-1) << AW_PID_2049_AVTH_START_BIT))
+
+#define AW_PID_2049_AVTH_DEFAULT_VALUE	(0x40)
+#define AW_PID_2049_AVTH_DEFAULT		\
+	(AW_PID_2049_AVTH_DEFAULT_VALUE << AW_PID_2049_AVTH_START_BIT)
+
+/* default value of HAGCCFG1 (0x09) */
+/* #define AW_PID_2049_HAGCCFG1_DEFAULT		(0x3940) */
+
+/* HAGCCFG2 (0x0A) detail */
+/* ATTH bit 15:0 (HAGCCFG2 0x0A) */
+#define AW_PID_2049_ATTH_START_BIT		(0)
+#define AW_PID_2049_ATTH_BITS_LEN		(16)
+#define AW_PID_2049_ATTH_MASK			\
+	(~(((1<<AW_PID_2049_ATTH_BITS_LEN)-1) << AW_PID_2049_ATTH_START_BIT))
+
+#define AW_PID_2049_ATTH_RESERVED		(0)
+#define AW_PID_2049_ATTH_RESERVED_VALUE	\
+	(AW_PID_2049_ATTH_RESERVED << AW_PID_2049_ATTH_START_BIT)
+
+#define AW_PID_2049_ATTH_DEFAULT_VALUE	(0x0030)
+#define AW_PID_2049_ATTH_DEFAULT		\
+	(AW_PID_2049_ATTH_DEFAULT_VALUE << AW_PID_2049_ATTH_START_BIT)
+
+/* default value of HAGCCFG2 (0x0A) */
+/* #define AW_PID_2049_HAGCCFG2_DEFAULT		(0x0030) */
+
+/* HAGCCFG3 (0x0B) detail */
+/* RTTH bit 15:0 (HAGCCFG3 0x0B) */
+#define AW_PID_2049_RTTH_START_BIT		(0)
+#define AW_PID_2049_RTTH_BITS_LEN		(16)
+#define AW_PID_2049_RTTH_MASK			\
+	(~(((1<<AW_PID_2049_RTTH_BITS_LEN)-1) << AW_PID_2049_RTTH_START_BIT))
+
+#define AW_PID_2049_RTTH_RESERVED		(0)
+#define AW_PID_2049_RTTH_RESERVED_VALUE	\
+	(AW_PID_2049_RTTH_RESERVED << AW_PID_2049_RTTH_START_BIT)
+
+#define AW_PID_2049_RTTH_DEFAULT_VALUE	(0x01E0)
+#define AW_PID_2049_RTTH_DEFAULT		\
+	(AW_PID_2049_RTTH_DEFAULT_VALUE << AW_PID_2049_RTTH_START_BIT)
+
+/* default value of HAGCCFG3 (0x0B) */
+/* #define AW_PID_2049_HAGCCFG3_DEFAULT		(0x01E0) */
+
+/* HAGCCFG4 (0x0C) detail */
+/* IIC_GEN_ADDR bit 15:9 (HAGCCFG4 0x0C) */
+#define AW_PID_2049_IIC_GEN_ADDR_START_BIT	(9)
+#define AW_PID_2049_IIC_GEN_ADDR_BITS_LEN	(7)
+#define AW_PID_2049_IIC_GEN_ADDR_MASK	\
+	(~(((1<<AW_PID_2049_IIC_GEN_ADDR_BITS_LEN)-1) << AW_PID_2049_IIC_GEN_ADDR_START_BIT))
+
+#define AW_PID_2049_IIC_GEN_ADDR_DEFAULT_VALUE	(0x0E)
+#define AW_PID_2049_IIC_GEN_ADDR_DEFAULT	\
+	(AW_PID_2049_IIC_GEN_ADDR_DEFAULT_VALUE << AW_PID_2049_IIC_GEN_ADDR_START_BIT)
+
+/* IIC_GEN_EN bit 8 (HAGCCFG4 0x0C) */
+#define AW_PID_2049_IIC_GEN_EN_START_BIT	(8)
+#define AW_PID_2049_IIC_GEN_EN_BITS_LEN	(1)
+#define AW_PID_2049_IIC_GEN_EN_MASK		\
+	(~(((1<<AW_PID_2049_IIC_GEN_EN_BITS_LEN)-1) << AW_PID_2049_IIC_GEN_EN_START_BIT))
+
+#define AW_PID_2049_IIC_GEN_EN_DISABLE	(0)
+#define AW_PID_2049_IIC_GEN_EN_DISABLE_VALUE	\
+	(AW_PID_2049_IIC_GEN_EN_DISABLE << AW_PID_2049_IIC_GEN_EN_START_BIT)
+
+#define AW_PID_2049_IIC_GEN_EN_ENABLE	(1)
+#define AW_PID_2049_IIC_GEN_EN_ENABLE_VALUE	\
+	(AW_PID_2049_IIC_GEN_EN_ENABLE << AW_PID_2049_IIC_GEN_EN_START_BIT)
+
+#define AW_PID_2049_IIC_GEN_EN_DEFAULT_VALUE	(0)
+#define AW_PID_2049_IIC_GEN_EN_DEFAULT	\
+	(AW_PID_2049_IIC_GEN_EN_DEFAULT_VALUE << AW_PID_2049_IIC_GEN_EN_START_BIT)
+
+/* HOLDTH bit 7:0 (HAGCCFG4 0x0C) */
+#define AW_PID_2049_HOLDTH_START_BIT	(0)
+#define AW_PID_2049_HOLDTH_BITS_LEN		(8)
+#define AW_PID_2049_HOLDTH_MASK			\
+	(~(((1<<AW_PID_2049_HOLDTH_BITS_LEN)-1) << AW_PID_2049_HOLDTH_START_BIT))
+
+#define AW_PID_2049_HOLDTH_RESERVED		(0)
+#define AW_PID_2049_HOLDTH_RESERVED_VALUE	\
+	(AW_PID_2049_HOLDTH_RESERVED << AW_PID_2049_HOLDTH_START_BIT)
+
+#define AW_PID_2049_HOLDTH_DEFAULT_VALUE	(0x64)
+#define AW_PID_2049_HOLDTH_DEFAULT		\
+	(AW_PID_2049_HOLDTH_DEFAULT_VALUE << AW_PID_2049_HOLDTH_START_BIT)
+
+/* default value of HAGCCFG4 (0x0C) */
+/* #define AW_PID_2049_HAGCCFG4_DEFAULT		(0x1C64) */
+
+/* AGC_DSP_CTL bit 15 (HAGCCFG7 0x0F) */
+#define AW_PID_2049_AGC_DSP_CTL_START_BIT	(15)
+#define AW_PID_2049_AGC_DSP_CTL_BITS_LEN	(1)
+#define AW_PID_2049_AGC_DSP_CTL_MASK	\
+	(~(((1<<AW_PID_2049_AGC_DSP_CTL_BITS_LEN)-1) << AW_PID_2049_AGC_DSP_CTL_START_BIT))
+
+#define AW_PID_2049_AGC_DSP_CTL_DISABLE	(0)
+#define AW_PID_2049_AGC_DSP_CTL_DISABLE_VALUE	\
+	(AW_PID_2049_AGC_DSP_CTL_DISABLE << AW_PID_2049_AGC_DSP_CTL_START_BIT)
+
+#define AW_PID_2049_AGC_DSP_CTL_ENABLE	(1)
+#define AW_PID_2049_AGC_DSP_CTL_ENABLE_VALUE	\
+	(AW_PID_2049_AGC_DSP_CTL_ENABLE << AW_PID_2049_AGC_DSP_CTL_START_BIT)
+/* VDSEL bit 0 (I2SCFG3 0x12) */
+#define AW_PID_2049_VDSEL_START_BIT		(0)
+#define AW_PID_2049_VDSEL_BITS_LEN		(1)
+#define AW_PID_2049_VDSEL_MASK			\
+	(~(((1<<AW_PID_2049_VDSEL_BITS_LEN)-1) << AW_PID_2049_VDSEL_START_BIT))
+
+/* MEM_CLKSEL bit 3 (DBGCTRL 0x13) */
+#define AW_PID_2049_MEM_CLKSEL_START_BIT	(3)
+#define AW_PID_2049_MEM_CLKSEL_BITS_LEN	(1)
+#define AW_PID_2049_MEM_CLKSEL_MASK		\
+	(~(((1<<AW_PID_2049_MEM_CLKSEL_BITS_LEN)-1) << AW_PID_2049_MEM_CLKSEL_START_BIT))
+
+#define AW_PID_2049_MEM_CLKSEL_OSC_CLK	(0)
+#define AW_PID_2049_MEM_CLKSEL_OSC_CLK_VALUE	\
+	(AW_PID_2049_MEM_CLKSEL_OSC_CLK << AW_PID_2049_MEM_CLKSEL_START_BIT)
+
+#define AW_PID_2049_MEM_CLKSEL_DAP_HCLK	(1)
+#define AW_PID_2049_MEM_CLKSEL_DAP_HCLK_VALUE	\
+	(AW_PID_2049_MEM_CLKSEL_DAP_HCLK << AW_PID_2049_MEM_CLKSEL_START_BIT)
+
+/* HAGCST (0x20) detail */
+/* SPK_GAIN_ST bit 10:8 (HAGCST 0x20) */
+#define AW_PID_2049_SPK_GAIN_ST_START_BIT	(8)
+#define AW_PID_2049_SPK_GAIN_ST_BITS_LEN	(3)
+#define AW_PID_2049_SPK_GAIN_ST_MASK	\
+	(~(((1<<AW_PID_2049_SPK_GAIN_ST_BITS_LEN)-1) << AW_PID_2049_SPK_GAIN_ST_START_BIT))
+
+#define AW_PID_2049_SPK_GAIN_ST_4_AV	(0)
+#define AW_PID_2049_SPK_GAIN_ST_4_AV_VALUE	\
+	(AW_PID_2049_SPK_GAIN_ST_4_AV << AW_PID_2049_SPK_GAIN_ST_START_BIT)
+
+#define AW_PID_2049_SPK_GAIN_ST_4P67_AV	(1)
+#define AW_PID_2049_SPK_GAIN_ST_4P67_AV_VALUE	\
+	(AW_PID_2049_SPK_GAIN_ST_4P67_AV << AW_PID_2049_SPK_GAIN_ST_START_BIT)
+
+#define AW_PID_2049_SPK_GAIN_ST_6_AV	(2)
+#define AW_PID_2049_SPK_GAIN_ST_6_AV_VALUE	\
+	(AW_PID_2049_SPK_GAIN_ST_6_AV << AW_PID_2049_SPK_GAIN_ST_START_BIT)
+
+#define AW_PID_2049_SPK_GAIN_ST_7_AV	(3)
+#define AW_PID_2049_SPK_GAIN_ST_7_AV_VALUE	\
+	(AW_PID_2049_SPK_GAIN_ST_7_AV << AW_PID_2049_SPK_GAIN_ST_START_BIT)
+
+#define AW_PID_2049_SPK_GAIN_ST_12_AV	(4)
+#define AW_PID_2049_SPK_GAIN_ST_12_AV_VALUE	\
+	(AW_PID_2049_SPK_GAIN_ST_12_AV << AW_PID_2049_SPK_GAIN_ST_START_BIT)
+
+#define AW_PID_2049_SPK_GAIN_ST_14_AV	(5)
+#define AW_PID_2049_SPK_GAIN_ST_14_AV_VALUE	\
+	(AW_PID_2049_SPK_GAIN_ST_14_AV << AW_PID_2049_SPK_GAIN_ST_START_BIT)
+
+#define AW_PID_2049_SPK_GAIN_ST_DEFAULT_VALUE	(5)
+#define AW_PID_2049_SPK_GAIN_ST_DEFAULT	\
+	(AW_PID_2049_SPK_GAIN_ST_DEFAULT_VALUE << AW_PID_2049_SPK_GAIN_ST_START_BIT)
+
+/* BSTVOUT_ST bit 5:0 (HAGCST 0x20) */
+#define AW_PID_2049_BSTVOUT_ST_START_BIT	(0)
+#define AW_PID_2049_BSTVOUT_ST_BITS_LEN	(6)
+#define AW_PID_2049_BSTVOUT_ST_MASK		\
+	(~(((1<<AW_PID_2049_BSTVOUT_ST_BITS_LEN)-1) << AW_PID_2049_BSTVOUT_ST_START_BIT))
+
+#define AW_PID_2049_BSTVOUT_ST_3P125V	(0)
+#define AW_PID_2049_BSTVOUT_ST_3P125V_VALUE	\
+	(AW_PID_2049_BSTVOUT_ST_3P125V << AW_PID_2049_BSTVOUT_ST_START_BIT)
+
+#define AW_PID_2049_BSTVOUT_ST_3P250V	(1)
+#define AW_PID_2049_BSTVOUT_ST_3P250V_VALUE	\
+	(AW_PID_2049_BSTVOUT_ST_3P250V << AW_PID_2049_BSTVOUT_ST_START_BIT)
+
+#define AW_PID_2049_BSTVOUT_ST_3P375V	(2)
+#define AW_PID_2049_BSTVOUT_ST_3P375V_VALUE	\
+	(AW_PID_2049_BSTVOUT_ST_3P375V << AW_PID_2049_BSTVOUT_ST_START_BIT)
+
+#define AW_PID_2049_BSTVOUT_ST_3P500V	(3)
+#define AW_PID_2049_BSTVOUT_ST_3P500V_VALUE	\
+	(AW_PID_2049_BSTVOUT_ST_3P500V << AW_PID_2049_BSTVOUT_ST_START_BIT)
+
+#define AW_PID_2049_BSTVOUT_ST_3P625V	(4)
+#define AW_PID_2049_BSTVOUT_ST_3P625V_VALUE	\
+	(AW_PID_2049_BSTVOUT_ST_3P625V << AW_PID_2049_BSTVOUT_ST_START_BIT)
+
+#define AW_PID_2049_BSTVOUT_ST_3P750V	(5)
+#define AW_PID_2049_BSTVOUT_ST_3P750V_VALUE	\
+	(AW_PID_2049_BSTVOUT_ST_3P750V << AW_PID_2049_BSTVOUT_ST_START_BIT)
+
+#define AW_PID_2049_BSTVOUT_ST_11P000V	(63)
+#define AW_PID_2049_BSTVOUT_ST_11P000V_VALUE	\
+	(AW_PID_2049_BSTVOUT_ST_11P000V << AW_PID_2049_BSTVOUT_ST_START_BIT)
+
+#define AW_PID_2049_BSTVOUT_ST_DEFAULT_VALUE	(0)
+#define AW_PID_2049_BSTVOUT_ST_DEFAULT	\
+	(AW_PID_2049_BSTVOUT_ST_DEFAULT_VALUE << AW_PID_2049_BSTVOUT_ST_START_BIT)
+
+/* default value of HAGCST (0x20) */
+/* #define AW_PID_2049_HAGCST_DEFAULT		(0x0500) */
+
+/* VBAT (0x21) detail */
+/* VBAT_DET bit 9:0 (VBAT 0x21) */
+#define AW_PID_2049_VBAT_DET_START_BIT	(0)
+#define AW_PID_2049_VBAT_DET_BITS_LEN	(10)
+#define AW_PID_2049_VBAT_DET_MASK		\
+	(~(((1<<AW_PID_2049_VBAT_DET_BITS_LEN)-1) << AW_PID_2049_VBAT_DET_START_BIT))
+
+#define AW_PID_2049_VBAT_DET_DEFAULT_VALUE	(0x263)
+#define AW_PID_2049_VBAT_DET_DEFAULT	\
+	(AW_PID_2049_VBAT_DET_DEFAULT_VALUE << AW_PID_2049_VBAT_DET_START_BIT)
+
+#define AW_PID_2049_VBAT_RANGE	(6025)
+#define AW_PID_2049_INT_10BIT	(1023)
+/* default value of VBAT (0x21) */
+/* #define AW_PID_2049_VBAT_DEFAULT		(0x0263) */
+
+/* TEMP (0x22) detail */
+/* TEMP_DET bit 9:0 (TEMP 0x22) */
+#define AW_PID_2049_TEMP_DET_START_BIT	(0)
+#define AW_PID_2049_TEMP_DET_BITS_LEN	(10)
+#define AW_PID_2049_TEMP_DET_MASK		\
+	(~(((1<<AW_PID_2049_TEMP_DET_BITS_LEN)-1) << AW_PID_2049_TEMP_DET_START_BIT))
+
+#define AW_PID_2049_TEMP_DET_MINUS_40	(0x3D8)
+#define AW_PID_2049_TEMP_DET_MINUS_40_VALUE	\
+	(AW_PID_2049_TEMP_DET_MINUS_40 << AW_PID_2049_TEMP_DET_START_BIT)
+
+#define AW_PID_2049_TEMP_DET_0			(0x00)
+#define AW_PID_2049_TEMP_DET_0_VALUE	\
+	(AW_PID_2049_TEMP_DET_0 << AW_PID_2049_TEMP_DET_START_BIT)
+
+#define AW_PID_2049_TEMP_DET_1			(0x01)
+#define AW_PID_2049_TEMP_DET_1_VALUE	\
+	(AW_PID_2049_TEMP_DET_1 << AW_PID_2049_TEMP_DET_START_BIT)
+
+#define AW_PID_2049_TEMP_DET_25			(0x19)
+#define AW_PID_2049_TEMP_DET_25_VALUE	\
+	(AW_PID_2049_TEMP_DET_25 << AW_PID_2049_TEMP_DET_START_BIT)
+
+#define AW_PID_2049_TEMP_DET_55			(0x37)
+#define AW_PID_2049_TEMP_DET_55_VALUE	\
+	(AW_PID_2049_TEMP_DET_55 << AW_PID_2049_TEMP_DET_START_BIT)
+
+#define AW_PID_2049_TEMP_DET_DEFAULT_VALUE	(0x019)
+#define AW_PID_2049_TEMP_DET_DEFAULT	\
+	(AW_PID_2049_TEMP_DET_DEFAULT_VALUE << AW_PID_2049_TEMP_DET_START_BIT)
+#define AW_PID_2049_TEMP_SIGN_MASK	(~(1 << 9))
+#define AW_PID_2049_TEMP_NEG_MASK	(0XFC00)
+
+/* default value of TEMP (0x22) */
+/* #define AW_PID_2049_TEMP_DEFAULT		(0x0019) */
+
+/* PVDD (0x23) detail */
+/* PVDD_DET bit 9:0 (PVDD 0x23) */
+#define AW_PID_2049_PVDD_DET_START_BIT	(0)
+#define AW_PID_2049_PVDD_DET_BITS_LEN	(10)
+#define AW_PID_2049_PVDD_DET_MASK		\
+	(~(((1<<AW_PID_2049_PVDD_DET_BITS_LEN)-1) << AW_PID_2049_PVDD_DET_START_BIT))
+
+#define AW_PID_2049_PVDD_DET_DEFAULT_VALUE	(0x263)
+#define AW_PID_2049_PVDD_DET_DEFAULT	\
+	(AW_PID_2049_PVDD_DET_DEFAULT_VALUE << AW_PID_2049_PVDD_DET_START_BIT)
+
+/* default value of PVDD (0x23) */
+/* #define AW_PID_2049_PVDD_DEFAULT		(0x0263) */
+
+/* BSTCTRL1 (0x60) detail */
+/* BST_RTH bit 13:8 (BSTCTRL1 0x60) */
+#define AW_PID_2049_BST_RTH_START_BIT	(8)
+#define AW_PID_2049_BST_RTH_BITS_LEN	(6)
+#define AW_PID_2049_BST_RTH_MASK		\
+	(~(((1<<AW_PID_2049_BST_RTH_BITS_LEN)-1) << AW_PID_2049_BST_RTH_START_BIT))
+
+#define AW_PID_2049_BST_RTH_DEFAULT_VALUE	(4)
+#define AW_PID_2049_BST_RTH_DEFAULT		\
+	(AW_PID_2049_BST_RTH_DEFAULT_VALUE << AW_PID_2049_BST_RTH_START_BIT)
+
+/* BST_ATH bit 5:0 (BSTCTRL1 0x60) */
+#define AW_PID_2049_BST_ATH_START_BIT	(0)
+#define AW_PID_2049_BST_ATH_BITS_LEN	(6)
+#define AW_PID_2049_BST_ATH_MASK		\
+	(~(((1<<AW_PID_2049_BST_ATH_BITS_LEN)-1) << AW_PID_2049_BST_ATH_START_BIT))
+
+#define AW_PID_2049_BST_ATH_DEFAULT_VALUE	(2)
+#define AW_PID_2049_BST_ATH_DEFAULT		\
+	(AW_PID_2049_BST_ATH_DEFAULT_VALUE << AW_PID_2049_BST_ATH_START_BIT)
+
+/* default value of BSTCTRL1 (0x60) */
+/* #define AW_PID_2049_BSTCTRL1_DEFAULT		(0x0402) */
+
+/* BSTCTRL2 (0x61) detail */
+/* BST_MODE bit 14:12 (BSTCTRL2 0x61) */
+#define AW_PID_2049_BST_MODE_START_BIT	(12)
+#define AW_PID_2049_BST_MODE_BITS_LEN	(3)
+#define AW_PID_2049_BST_MODE_MASK		\
+	(~(((1<<AW_PID_2049_BST_MODE_BITS_LEN)-1) << AW_PID_2049_BST_MODE_START_BIT))
+
+#define AW_PID_2049_BST_MODE_TRANSPARENT	(0)
+#define AW_PID_2049_BST_MODE_TRANSPARENT_VALUE	\
+	(AW_PID_2049_BST_MODE_TRANSPARENT << AW_PID_2049_BST_MODE_START_BIT)
+
+#define AW_PID_2049_BST_MODE_FORCE_BOOST	(1)
+#define AW_PID_2049_BST_MODE_FORCE_BOOST_VALUE	\
+	(AW_PID_2049_BST_MODE_FORCE_BOOST << AW_PID_2049_BST_MODE_START_BIT)
+
+#define AW_PID_2049_BST_MODE_SMART_BOOST1	(5)
+#define AW_PID_2049_BST_MODE_SMART_BOOST1_VALUE	\
+	(AW_PID_2049_BST_MODE_SMART_BOOST1 << AW_PID_2049_BST_MODE_START_BIT)
+
+#define AW_PID_2049_BST_MODE_SMART_BOOST2	(6)
+#define AW_PID_2049_BST_MODE_SMART_BOOST2_VALUE	\
+	(AW_PID_2049_BST_MODE_SMART_BOOST2 << AW_PID_2049_BST_MODE_START_BIT)
+
+#define AW_PID_2049_BST_MODE_DEFAULT_VALUE	(0x6)
+#define AW_PID_2049_BST_MODE_DEFAULT	\
+	(AW_PID_2049_BST_MODE_DEFAULT_VALUE << AW_PID_2049_BST_MODE_START_BIT)
+
+/* WDT_CNT bit 7:0 (WDT 0x42) */
+#define AW_PID_2049_WDT_CNT_START_BIT	(0)
+#define AW_PID_2049_WDT_CNT_BITS_LEN	(8)
+#define AW_PID_2049_WDT_CNT_MASK		\
+	(~(((1<<AW_PID_2049_WDT_CNT_BITS_LEN)-1) << AW_PID_2049_WDT_CNT_START_BIT))
+
+/* BST_TDEG bit 11:8 (BSTCTRL2 0x61) */
+#define AW_PID_2049_BST_TDEG_START_BIT	(8)
+#define AW_PID_2049_BST_TDEG_BITS_LEN	(4)
+#define AW_PID_2049_BST_TDEG_MASK		\
+	(~(((1<<AW_PID_2049_BST_TDEG_BITS_LEN)-1) << AW_PID_2049_BST_TDEG_START_BIT))
+
+#define AW_PID_2049_BST_TDEG_0P50_MS	(0)
+#define AW_PID_2049_BST_TDEG_0P50_MS_VALUE	\
+	(AW_PID_2049_BST_TDEG_0P50_MS << AW_PID_2049_BST_TDEG_START_BIT)
+
+#define AW_PID_2049_BST_TDEG_1P00_MS	(1)
+#define AW_PID_2049_BST_TDEG_1P00_MS_VALUE	\
+	(AW_PID_2049_BST_TDEG_1P00_MS << AW_PID_2049_BST_TDEG_START_BIT)
+
+#define AW_PID_2049_BST_TDEG_2P00_MS	(2)
+#define AW_PID_2049_BST_TDEG_2P00_MS_VALUE	\
+	(AW_PID_2049_BST_TDEG_2P00_MS << AW_PID_2049_BST_TDEG_START_BIT)
+
+#define AW_PID_2049_BST_TDEG_4P00_MS	(3)
+#define AW_PID_2049_BST_TDEG_4P00_MS_VALUE	\
+	(AW_PID_2049_BST_TDEG_4P00_MS << AW_PID_2049_BST_TDEG_START_BIT)
+
+#define AW_PID_2049_BST_TDEG_8P00_MS	(4)
+#define AW_PID_2049_BST_TDEG_8P00_MS_VALUE	\
+	(AW_PID_2049_BST_TDEG_8P00_MS << AW_PID_2049_BST_TDEG_START_BIT)
+
+#define AW_PID_2049_BST_TDEG_10P7_MS	(5)
+#define AW_PID_2049_BST_TDEG_10P7_MS_VALUE	\
+	(AW_PID_2049_BST_TDEG_10P7_MS << AW_PID_2049_BST_TDEG_START_BIT)
+
+/* ReAbs bit 3 (ASR1 0x45) */
+#define AW_PID_2049_ReAbs_START_BIT		(3)
+#define AW_PID_2049_ReAbs_BITS_LEN		(1)
+#define AW_PID_2049_ReAbs_MASK			\
+	(~(((1<<AW_PID_2049_ReAbs_BITS_LEN)-1) << AW_PID_2049_ReAbs_START_BIT))
+
+#define AW_PID_2049_BST_TDEG_13P3_MS	(6)
+#define AW_PID_2049_BST_TDEG_13P3_MS_VALUE	\
+	(AW_PID_2049_BST_TDEG_13P3_MS << AW_PID_2049_BST_TDEG_START_BIT)
+
+/* DSP_VOL bit 15:8 (DSPCFG 0x47) */
+#define AW_PID_2049_DSP_VOL_START_BIT	(8)
+#define AW_PID_2049_DSP_VOL_BITS_LEN	(8)
+#define AW_PID_2049_DSP_VOL_MASK		\
+	(~(((1<<AW_PID_2049_DSP_VOL_BITS_LEN)-1) << AW_PID_2049_DSP_VOL_START_BIT))
+
+#define AW_PID_2049_DSP_VOL_MUTE			(0XFF00)
+#define AW_PID_2049_DSP_VOL_NOISE_ST		(0X1800)
+
+#define AW_PID_2049_BST_TDEG_16P0_MS	(7)
+#define AW_PID_2049_BST_TDEG_16P0_MS_VALUE	\
+	(AW_PID_2049_BST_TDEG_16P0_MS << AW_PID_2049_BST_TDEG_START_BIT)
+
+#define AW_PID_2049_BST_TDEG_18P6_MS	(8)
+#define AW_PID_2049_BST_TDEG_18P6_MS_VALUE	\
+	(AW_PID_2049_BST_TDEG_18P6_MS << AW_PID_2049_BST_TDEG_START_BIT)
+
+#define AW_PID_2049_BST_TDEG_21P3_MS	(9)
+#define AW_PID_2049_BST_TDEG_21P3_MS_VALUE	\
+	(AW_PID_2049_BST_TDEG_21P3_MS << AW_PID_2049_BST_TDEG_START_BIT)
+
+#define AW_PID_2049_BST_TDEG_24P0_MS	(10)
+#define AW_PID_2049_BST_TDEG_24P0_MS_VALUE	\
+	(AW_PID_2049_BST_TDEG_24P0_MS << AW_PID_2049_BST_TDEG_START_BIT)
+
+#define AW_PID_2049_BST_TDEG_32P0_MS	(11)
+#define AW_PID_2049_BST_TDEG_32P0_MS_VALUE	\
+	(AW_PID_2049_BST_TDEG_32P0_MS << AW_PID_2049_BST_TDEG_START_BIT)
+
+#define AW_PID_2049_BST_TDEG_64P0_MS	(12)
+#define AW_PID_2049_BST_TDEG_64P0_MS_VALUE	\
+	(AW_PID_2049_BST_TDEG_64P0_MS << AW_PID_2049_BST_TDEG_START_BIT)
+
+#define AW_PID_2049_BST_TDEG_128_MS		(13)
+#define AW_PID_2049_BST_TDEG_128_MS_VALUE	\
+	(AW_PID_2049_BST_TDEG_128_MS << AW_PID_2049_BST_TDEG_START_BIT)
+
+#define AW_PID_2049_BST_TDEG_256_MS		(14)
+#define AW_PID_2049_BST_TDEG_256_MS_VALUE	\
+	(AW_PID_2049_BST_TDEG_256_MS << AW_PID_2049_BST_TDEG_START_BIT)
+
+#define AW_PID_2049_BST_TDEG_1200_MS	(15)
+#define AW_PID_2049_BST_TDEG_1200_MS_VALUE	\
+	(AW_PID_2049_BST_TDEG_1200_MS << AW_PID_2049_BST_TDEG_START_BIT)
+
+#define AW_PID_2049_BST_TDEG_DEFAULT_VALUE	(11)
+#define AW_PID_2049_BST_TDEG_DEFAULT	\
+	(AW_PID_2049_BST_TDEG_DEFAULT_VALUE << AW_PID_2049_BST_TDEG_START_BIT)
+
+/* VOUT_VREFSET bit 5:0 (BSTCTRL2 0x61) */
+/* CCO_MUX bit 14 (PLLCTRL1 0x52) */
+#define AW_PID_2049_CCO_MUX_START_BIT	(14)
+#define AW_PID_2049_CCO_MUX_BITS_LEN	(1)
+#define AW_PID_2049_CCO_MUX_MASK		\
+	(~(((1<<AW_PID_2049_CCO_MUX_BITS_LEN)-1) << AW_PID_2049_CCO_MUX_START_BIT))
+
+#define AW_PID_2049_CCO_MUX_DIVIDED		(0)
+#define AW_PID_2049_CCO_MUX_DIVIDED_VALUE	\
+	(AW_PID_2049_CCO_MUX_DIVIDED << AW_PID_2049_CCO_MUX_START_BIT)
+
+#define AW_PID_2049_CCO_MUX_BYPASS		(1)
+#define AW_PID_2049_CCO_MUX_BYPASS_VALUE	\
+	(AW_PID_2049_CCO_MUX_BYPASS << AW_PID_2049_CCO_MUX_START_BIT)
+
+#define AW_PID_2049_VOUT_VREFSET_START_BIT	(0)
+#define AW_PID_2049_VOUT_VREFSET_BITS_LEN	(6)
+#define AW_PID_2049_VOUT_VREFSET_MASK	\
+	(~(((1<<AW_PID_2049_VOUT_VREFSET_BITS_LEN)-1) << AW_PID_2049_VOUT_VREFSET_START_BIT))
+
+#define AW_PID_2049_VOUT_VREFSET_3P125V	(0)
+#define AW_PID_2049_VOUT_VREFSET_3P125V_VALUE	\
+	(AW_PID_2049_VOUT_VREFSET_3P125V << AW_PID_2049_VOUT_VREFSET_START_BIT)
+
+#define AW_PID_2049_VOUT_VREFSET_3P250V	(1)
+#define AW_PID_2049_VOUT_VREFSET_3P250V_VALUE	\
+	(AW_PID_2049_VOUT_VREFSET_3P250V << AW_PID_2049_VOUT_VREFSET_START_BIT)
+
+#define AW_PID_2049_VOUT_VREFSET_3P375V	(2)
+#define AW_PID_2049_VOUT_VREFSET_3P375V_VALUE	\
+	(AW_PID_2049_VOUT_VREFSET_3P375V << AW_PID_2049_VOUT_VREFSET_START_BIT)
+
+#define AW_PID_2049_VOUT_VREFSET_3P500V	(3)
+#define AW_PID_2049_VOUT_VREFSET_3P500V_VALUE	\
+	(AW_PID_2049_VOUT_VREFSET_3P500V << AW_PID_2049_VOUT_VREFSET_START_BIT)
+
+#define AW_PID_2049_VOUT_VREFSET_3P625V	(4)
+#define AW_PID_2049_VOUT_VREFSET_3P625V_VALUE	\
+	(AW_PID_2049_VOUT_VREFSET_3P625V << AW_PID_2049_VOUT_VREFSET_START_BIT)
+
+#define AW_PID_2049_VOUT_VREFSET_3P750V	(5)
+#define AW_PID_2049_VOUT_VREFSET_3P750V_VALUE	\
+	(AW_PID_2049_VOUT_VREFSET_3P750V << AW_PID_2049_VOUT_VREFSET_START_BIT)
+
+#define AW_PID_2049_VOUT_VREFSET_11P000V	(63)
+#define AW_PID_2049_VOUT_VREFSET_11P000V_VALUE	\
+	(AW_PID_2049_VOUT_VREFSET_11P000V << AW_PID_2049_VOUT_VREFSET_START_BIT)
+
+#define AW_PID_2049_VOUT_VREFSET_DEFAULT_VALUE	(0x33)
+#define AW_PID_2049_VOUT_VREFSET_DEFAULT	\
+	(AW_PID_2049_VOUT_VREFSET_DEFAULT_VALUE << AW_PID_2049_VOUT_VREFSET_START_BIT)
+
+/* default value of BSTCTRL2 (0x61) */
+/* #define AW_PID_2049_BSTCTRL2_DEFAULT		(0x6B33) */
+
+/* detail information of registers end */
+
+/* EF_VSN_GESLP bit 9:0 (EFRH 0x78) */
+#define AW_PID_2049_EF_VSN_GESLP_START_BIT	(0)
+#define AW_PID_2049_EF_VSN_GESLP_BITS_LEN	(10)
+#define AW_PID_2049_EF_VSN_GESLP_MASK	\
+	(~(((1<<AW_PID_2049_EF_VSN_GESLP_BITS_LEN)-1) << AW_PID_2049_EF_VSN_GESLP_START_BIT))
+
+#define AW_PID_2049_EF_VSN_GESLP_SIGN_MASK		(~(1 << 9))
+#define AW_PID_2049_EF_VSN_GESLP_SIGN_NEG		(0xfe00)
+/* EF_ISN_GESLP bit 9:0 (EFRM2 0x79) */
+#define AW_PID_2049_EF_ISN_GESLP_START_BIT	(0)
+#define AW_PID_2049_EF_ISN_GESLP_BITS_LEN	(10)
+#define AW_PID_2049_EF_ISN_GESLP_MASK	\
+	(~(((1<<AW_PID_2049_EF_ISN_GESLP_BITS_LEN)-1) << AW_PID_2049_EF_ISN_GESLP_START_BIT))
+
+#define AW_PID_2049_EF_ISN_GESLP_SIGN_MASK		(~(1 << 9))
+#define AW_PID_2049_EF_ISN_GESLP_SIGN_NEG		(0xfe00)
+/*
+ * Vcalb
+ */
+
+#define AW_PID_2049_CABL_BASE_VALUE			(1000)
+#define AW_PID_2049_ICABLK_FACTOR			(1)
+#define AW_PID_2049_VCABLK_FACTOR			(1)
+#define AW_PID_2049_VCAL_FACTOR				(1 << 12)
+#define AW_PID_2049_VSCAL_FACTOR			(16500)
+#define AW_PID_2049_ISCAL_FACTOR			(3667)
+#define AW_PID_2049_EF_VSENSE_GAIN_SHIFT		(0)
+
+#define AW_PID_2049_VCABLK_FACTOR_DAC			(2)
+#define AW_PID_2049_VSCAL_FACTOR_DAC			(11790)
+#define AW_PID_2049_EF_DAC_GESLP_SHIFT			(10)
+#define AW_PID_2049_EF_DAC_GESLP_SIGN_MASK		(1 << 5)
+#define AW_PID_2049_EF_DAC_GESLP_SIGN_NEG		(0xffc0)
+
+#define AW_PID_2049_VCALB_ADJ_FACTOR			(12)
+
+/*
+ * AW883XX DSP
+ */
+#define AW_PID_2049_DSP_CFG_ADDR			(0x9C80)
+#define AW_PID_2049_DSP_FW_ADDR				(0x8C00)
+
+#define AW_PID_2049_DSP_REG_RESULT_F0			(0x9C58)
+#define AW_PID_2049_DSP_F0_SHIFT			(1)
+
+#define AW_PID_2049_DSP_REG_CALRE			(0x9C5A)
+#define AW_PID_2049_DSP_REG_CALRE_SHIFT			(10)
+#define AW_PID_2049_DSP_REG_RESULT_Q			(0x9C5C)
+#define AW_PID_2049_DSP_Q_SHIFT				(11)
+
+#define AW_PID_2049_DSP_REG_VMAX			(0x9C94)
+
+
+#define AW_PID_2049_DSP_REG_CFG_MBMEC_GLBCFG		(0x9CE2)
+/* bit 0 */
+#define AW_PID_2049_DSP_MONITOR_MASK			(~(1 << 0))
+#define AW_PID_2049_DSP_MONITOR_ENABLE			(1 << 0)
+#define AW_PID_2049_DSP_MONITOR_DISABLE			(0 << 0)
+/*bit 4*/
+#define AW_PID_2049_DSP_REG_NOISE_MASK			(~(1 << 4))
+
+#define AW_PID_2049_DSP_TEMP_PEAK_MASK			(~(1 << 4))
+#define AW_PID_2049_DSP_TEMP_SEL_FLAG			(~(1 << 14))
+
+#define AW_PID_2049_DSP_REG_CFG_MBMEC_ACTAMPTH		(0x9CE4)/*32bit*/
+#define AW_PID_2049_DSP_REG_CFG_MBMEC_NOISEAMPTH	(0x9CE6)/*32bit*/
+#define AW_PID_2049_DSP_REG_VCALB			(0x9CF7)
+
+#define AW_PID_2049_DSP_REG_CFG_ADPZ_RE			(0x9D00)/*32bit*/
+#define AW_PID_2049_DSP_RE_SHIFT			(12)
+
+#define AW_PID_2049_DSP_REG_CFG_ADPZ_RA			(0x9D02)/*32bit*/
+
+#define AW_PID_2049_DSP_REG_CFG_ADPZ_USTEPN		(0x9D08)
+
+
+#define AW_PID_2049_DSP_REG_CRC_ADDR			(0x9F42)/*32bit*/
+#define AW_PID_2049_DSP_REG_CFGF0_FS			(0x9F44)/*32bit*/
+#define AW_PID_2049_DSP_REG_CFG_RE_ALPHA		(0x9F47)
+#define AW_PID_2049_DSP_REG_TEMP_ADDR			(0x9C5D)
+#define AW_PID_2049_DSP_REG_TEMP_SWITCH			(0x9D71)/*16bit*/
+#define AW_PID_2049_DSP_CALI_F0_DELAY			(0x9CFD)
+#define AW_PID_2049_DSP_CFG_ADPZ_T0			(0x9D11)/*16bit*/
+#define AW_PID_2049_DSP_CFG_ADPZ_COILALPHA		(0x9D0F)/*16bit*/
+#define AW_PID_2049_DSP_ST_S1				(0x8180)
+#define AW_PID_2049_DSP_ST_E1				(0x83FD)
+#define AW_PID_2049_DSP_ST_S2				(0x9C00)
+#define AW_PID_2049_DSP_ST_E2				(0x9C5D)
+
+#endif  /* #ifndef  __AW_PID_2049_REG_H__ */
-- 
2.7.4


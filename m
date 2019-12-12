Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB4D11CBF0
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 12:10:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 402F416C9;
	Thu, 12 Dec 2019 12:10:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 402F416C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576149054;
	bh=81ROP3V95ivEFLRwP6yhk1xTs8ZpWu4Rb3GhyIF+FVo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B1MQr8+aBsJPPU8RPY/dX2ph9/xLVGHHID6P8T1qYBY1NAKgH0iFyp2QxST1+pdkv
	 rqOcIu/d+OOZuAY42umkqIU8Q8kIR5u/iFSsuIt7JCcDTmk/kUtPa9+anMVB9TBSuw
	 IBOtH8/bN9FZTTtYlpVCMBcpHQuGGPFUBS4za5Gw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9159F801D8;
	Thu, 12 Dec 2019 12:09:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D83CEF8020C; Thu, 12 Dec 2019 12:09:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90C54F80089
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 12:09:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90C54F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hbPGHZZ4"
Received: by mail-pg1-x543.google.com with SMTP id x8so976442pgk.8
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 03:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=k4RzHoNkv383rDBXl+5OK7JjZvdaSuEf0dTMckHtYjI=;
 b=hbPGHZZ4MxY74hbxL4TLzUuOAevO2Jx+0BjLCKbZf9JAuerslIdssX8SHCdgG4w+Q0
 FtpP7SUxDCsgJxbjN2blgOz7k5zeYjRgIPRAc1Kg1odQh/nKiWxaDNDo7cNDB9dyTSI1
 XhgW0CUOHvdV5KakOb9uzVpad9f+agk95EjyPbCbWfbttUMUPLwE5q0EiXuCIzdO5I4f
 sbnxnzE5wIkYuNDLWvI2UdQJUTYChsLcLRNQK1Uj7p4eIGjFNj2Ja+dmRJ/r7FyU2vDL
 qtvFZaxD8oPwXDyEeqmVa2pVFStlTvCgbjzG02w6UjvB9QxC390GiLWkoq0m82BmcTI+
 JNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=k4RzHoNkv383rDBXl+5OK7JjZvdaSuEf0dTMckHtYjI=;
 b=WycMHImoO1M/Wmi1Ib80e88LaIwPptXDfI41ww1bSintDQs6ktV+FC+0fBahDm46Zt
 9Ci+cxAvH7BdHaKxBZ7I77N0VeH62whshHMi2v2Rdgr8cejwY27g8yaoft8HnGNn5iWe
 BzAMRK8r8vvqDD0A3uUGPHsSuQyUYcKydPNXjJ/KSPlgHLfDNI+Fv3PUZDpxrSIIrrC2
 5NoKdn3seVI32h6SpH9WnrNqDyrrDlz6sVgji+H5a6Pr01/saflhKcadyjRjNWf2aFwf
 0pXeZ07zwlvaRptmsM35CrvGCGfAr2X9DPdq+6IOqgBXjgYcSFJXk0ZMt7VNjb/lkOR4
 arQA==
X-Gm-Message-State: APjAAAVpJgoTTMy7vptLJh7KdIe7lzl8eR3g4oXekXSt4WaMadlMBgkW
 aaODx7j4/qCKmnwdlDw6N/I=
X-Google-Smtp-Source: APXvYqxqWLTWkIehM23XWnJuv390o96UFOn1w16BBpTmlGHCYuLN03tUCOT2GqFJ4bU+gLGJOn0NtA==
X-Received: by 2002:a63:9d8f:: with SMTP id i137mr9677405pgd.33.1576148940537; 
 Thu, 12 Dec 2019 03:09:00 -0800 (PST)
Received: from localhost.localdomain ([101.12.153.180])
 by smtp.gmail.com with ESMTPSA id z1sm6880937pfk.61.2019.12.12.03.08.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 12 Dec 2019 03:09:00 -0800 (PST)
From: Jeff Chang <richtek.jeff.chang@gmail.com>
To: lgirdwood@gmail.com
Date: Thu, 12 Dec 2019 19:08:54 +0800
Message-Id: <1576148934-27701-1-git-send-email-richtek.jeff.chang@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: alsa-devel@alsa-project.org, richtek.jeff.chang@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, jeff_chang@richtek.com,
 broonie@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH] ASoC: Add MediaTek MT6660 Speaker Amp Driver
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

    The MT6660 is a boosted BTL class-D amplifier with V/I sensing.
    A built-in DC-DC step-up converter is used to provide efficient
    power for class-D amplifier with multi-level class-G operation.
    The digital audio interface supports I2S, left-justified,
    right-justified, TDM and DSP A/B format for audio in with a data
    out used for chip information like voltage sense and current
    sense, which are able to be monitored via DATAO through proper
---
 sound/soc/codecs/Kconfig  |   14 +
 sound/soc/codecs/Makefile |    2 +
 sound/soc/codecs/mt6660.c | 1063 +++++++++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/mt6660.h |   95 ++++
 4 files changed, 1174 insertions(+)
 create mode 100644 sound/soc/codecs/mt6660.c
 create mode 100644 sound/soc/codecs/mt6660.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 229cc89..806cd03 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -122,6 +122,7 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_ML26124 if I2C
 	select SND_SOC_MT6351 if MTK_PMIC_WRAP
 	select SND_SOC_MT6358 if MTK_PMIC_WRAP
+	select SND_SOC_MT6660 if I2C
 	select SND_SOC_NAU8540 if I2C
 	select SND_SOC_NAU8810 if I2C
 	select SND_SOC_NAU8822 if I2C
@@ -1465,6 +1466,19 @@ config SND_SOC_MT6358
 	  Enable support for the platform which uses MT6358 as
 	  external codec device.
 
+config SND_SOC_MT6660
+	tristate "Mediatek MT6660 Speaker Amplifier"
+	depends on I2C
+	select CRC32
+	select CRYPTO_SHA256
+	select CRYTO_RSA
+	help
+	  MediaTek MT6660 is a smart power amplifier which contain
+	  speaker protection, multi-band DRC, equalizer functions.
+	  Select N if you don't have MT6660 on board.
+	  Select M to build this as module.
+
+
 config SND_SOC_NAU8540
        tristate "Nuvoton Technology Corporation NAU85L40 CODEC"
        depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index c498373..2b6814c 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -119,6 +119,7 @@ snd-soc-msm8916-analog-objs := msm8916-wcd-analog.o
 snd-soc-msm8916-digital-objs := msm8916-wcd-digital.o
 snd-soc-mt6351-objs := mt6351.o
 snd-soc-mt6358-objs := mt6358.o
+snd-soc-mt6660-objs := mt6660.o
 snd-soc-nau8540-objs := nau8540.o
 snd-soc-nau8810-objs := nau8810.o
 snd-soc-nau8822-objs := nau8822.o
@@ -403,6 +404,7 @@ obj-$(CONFIG_SND_SOC_MSM8916_WCD_ANALOG) +=snd-soc-msm8916-analog.o
 obj-$(CONFIG_SND_SOC_MSM8916_WCD_DIGITAL) +=snd-soc-msm8916-digital.o
 obj-$(CONFIG_SND_SOC_MT6351)	+= snd-soc-mt6351.o
 obj-$(CONFIG_SND_SOC_MT6358)	+= snd-soc-mt6358.o
+obj-$(CONFIG_SND_SOC_MT6660)	+= snd-soc-mt6660.o
 obj-$(CONFIG_SND_SOC_NAU8540)   += snd-soc-nau8540.o
 obj-$(CONFIG_SND_SOC_NAU8810)   += snd-soc-nau8810.o
 obj-$(CONFIG_SND_SOC_NAU8822)   += snd-soc-nau8822.o
diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
new file mode 100644
index 0000000..5ba8ec5
--- /dev/null
+++ b/sound/soc/codecs/mt6660.c
@@ -0,0 +1,1063 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/version.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/pm_runtime.h>
+#include <linux/delay.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+#include <sound/pcm_params.h>
+#include <linux/debugfs.h>
+
+#include "mt6660.h"
+
+struct codec_reg_val {
+	u32 addr;
+	u32 mask;
+	u32 data;
+};
+
+struct reg_size_table {
+	u32 addr;
+	u8 size;
+};
+
+static const struct reg_size_table mt6660_reg_size_table[] = {
+	{ MT6660_REG_HPF1_COEF, 4 },
+	{ MT6660_REG_HPF2_COEF, 4 },
+	{ MT6660_REG_TDM_CFG3, 2 },
+	{ MT6660_REG_RESV17, 2 },
+	{ MT6660_REG_RESV23, 2 },
+	{ MT6660_REG_SIGMAX, 2 },
+	{ MT6660_REG_DEVID, 2},
+	{ MT6660_REG_TDM_CFG3, 2},
+	{ MT6660_REG_HCLIP_CTRL, 2},
+	{ MT6660_REG_DA_GAIN, 2},
+};
+
+static int mt6660_get_reg_size(uint32_t addr)
+{
+	int i = 0;
+
+	for (i = 0; i < ARRAY_SIZE(mt6660_reg_size_table); i++) {
+		if (mt6660_reg_size_table[i].addr == addr)
+			return mt6660_reg_size_table[i].size;
+	}
+	return 1;
+}
+
+#if GENERIC_DEBUGFS
+static int mt6660_dbg_io_read(void *drvdata, u16 reg, void *val, u16 size)
+{
+	struct mt6660_chip *chip = (struct mt6660_chip *)drvdata;
+	int ret = 0, i = 0;
+	unsigned int data;
+	u8 *_val = val;
+
+	if (size != 1 && size != 2 && size != 4) {
+		dev_err(chip->dev, "%s size not match\n", __func__);
+		return -EINVAL;
+	}
+	ret = regmap_read(chip->regmap, reg, &data);
+	if (reg < 0)
+		return ret;
+
+	for (i = 0; i < size; i++)
+		_val[size-i-1] = (data >> (8*i))&0xff;
+
+	return 0;
+}
+
+static int mt6660_dbg_io_write(void *drvdata, u16 reg,
+			       const void *val, u16 size)
+{
+	struct mt6660_chip *chip = (struct mt6660_chip *)drvdata;
+	int reg_size = mt6660_get_reg_size(reg);
+	int i = 0;
+	unsigned int regval = 0;
+	u8 *_val = (u8 *)val;
+
+	if (size != reg_size) {
+		dev_err(chip->dev,
+			"%s size not match reg_size(%d), size(%d)\n",
+			__func__, reg_size, size);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < size; i++) {
+		regval <<= 8;
+		regval |= _val[i];
+	}
+
+	return regmap_write(chip->regmap, reg, regval);
+}
+#endif /* GENERIC_DEBUGFS */
+
+static int mt6660_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct mt6660_chip *chip = context;
+	int size = mt6660_get_reg_size(reg);
+	u8 reg_data[4] = {0};
+	int i = 0;
+
+	for (i = 0; i < size; i++)
+		reg_data[size - i - 1] = (val >> (8 * i)) & 0xff;
+
+	return i2c_smbus_write_i2c_block_data(chip->i2c, reg, size, reg_data);
+}
+
+static int mt6660_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct mt6660_chip *chip = context;
+	int size = mt6660_get_reg_size(reg);
+	int i = 0, ret = 0;
+	u8 data[4] = {0};
+	u32 reg_data = 0;
+
+	ret = i2c_smbus_read_i2c_block_data(chip->i2c, reg, size, data);
+	if (ret < 0)
+		return ret;
+	for (i = 0; i < size; i++) {
+		reg_data <<= 8;
+		reg_data |= data[i];
+	}
+	*val = reg_data;
+
+	return ret;
+}
+
+static bool mt6660_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return true;
+}
+
+static struct regmap_config mt6660_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 32,
+	.reg_write = mt6660_reg_write,
+	.reg_read = mt6660_reg_read,
+	.volatile_reg = mt6660_volatile_reg,
+};
+
+static unsigned int mt6660_component_io_read(
+	struct snd_soc_component *component, unsigned int reg)
+{
+	struct mt6660_chip *chip = snd_soc_component_get_drvdata(component);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(chip->regmap, reg, &val);
+	if (ret < 0) /* ret success -> >= 0, fail -> < - */
+		return ret;
+	pr_err("%s val = 0x%x\n", __func__, val);
+	return val;
+}
+
+static int mt6660_component_io_write(struct snd_soc_component *component,
+	unsigned int reg, unsigned int data)
+{
+	struct mt6660_chip *chip = snd_soc_component_get_drvdata(component);
+
+	pr_err("%s data = 0x%x\n", __func__, data);
+	return regmap_write(chip->regmap, reg, data);
+}
+
+static const int mt6660_dump_table[] = {
+	MT6660_REG_DEVID,
+	MT6660_REG_SYSTEM_CTRL,
+	MT6660_REG_IRQ_STATUS1,
+	MT6660_REG_ADDA_CLOCK,
+	MT6660_REG_SERIAL_CFG1,
+	MT6660_REG_DATAO_SEL,
+	MT6660_REG_TDM_CFG3,
+	MT6660_REG_HPF_CTRL,
+	MT6660_REG_HPF1_COEF,
+	MT6660_REG_HPF2_COEF,
+	MT6660_REG_PATH_BYPASS,
+	MT6660_REG_WDT_CTRL,
+	MT6660_REG_HCLIP_CTRL,
+	MT6660_REG_VOL_CTRL,
+	MT6660_REG_SPS_CTRL,
+	MT6660_REG_SIGMAX,
+	MT6660_REG_CALI_T0,
+	MT6660_REG_BST_CTRL,
+	MT6660_REG_PROTECTION_CFG,
+	MT6660_REG_DA_GAIN,
+	MT6660_REG_AUDIO_IN2_SEL,
+	MT6660_REG_SIG_GAIN,
+	MT6660_REG_PLL_CFG1,
+	MT6660_REG_DRE_CTRL,
+	MT6660_REG_DRE_THDMODE,
+	MT6660_REG_DRE_CORASE,
+	MT6660_REG_PWM_CTRL,
+	MT6660_REG_DC_PROTECT_CTRL,
+	MT6660_REG_ADC_USB_MODE,
+	MT6660_REG_INTERNAL_CFG,
+	MT6660_REG_RESV0,
+	MT6660_REG_RESV1,
+	MT6660_REG_RESV2,
+	MT6660_REG_RESV3,
+	MT6660_REG_RESV7,
+	MT6660_REG_RESV10,
+	MT6660_REG_RESV11,
+	MT6660_REG_RESV16,
+	MT6660_REG_RESV17,
+	MT6660_REG_RESV19,
+	MT6660_REG_RESV21,
+	MT6660_REG_RESV23,
+	MT6660_REG_RESV31,
+	MT6660_REG_RESV40,
+};
+
+#if GENERIC_DEBUGFS
+#ifdef CONFIG_DEBUG_FS
+/* reg/size/data/bustype */
+#define PREALLOC_RBUFFER_SIZE	(32)
+#define PREALLOC_WBUFFER_SIZE	(1000)
+
+static int data_debug_show(struct seq_file *s, void *data)
+{
+	struct dbg_info *di = s->private;
+	struct dbg_internal *d = &di->internal;
+	void *buffer;
+	u8 *pdata;
+	int i, ret;
+
+	if (d->data_buffer_size < d->size) {
+		buffer = kzalloc(d->size, GFP_KERNEL);
+		if (!buffer)
+			return -ENOMEM;
+		kfree(d->data_buffer);
+		d->data_buffer = buffer;
+		d->data_buffer_size = d->size;
+	}
+	/* read transfer */
+	if (!di->io_read)
+		return -EPERM;
+	ret = di->io_read(di->io_drvdata, d->reg, d->data_buffer, d->size);
+	if (ret < 0)
+		return ret;
+	pdata = d->data_buffer;
+	seq_printf(s, "0x");
+	for (i = 0; i < d->size; i++)
+		seq_printf(s, "%02x,", *(pdata + i));
+	seq_printf(s, "\n");
+	return 0;
+}
+
+static int data_debug_open(struct inode *inode, struct file *file)
+{
+	if (file->f_mode & FMODE_READ)
+		return single_open(file, data_debug_show, inode->i_private);
+	return simple_open(inode, file);
+}
+
+static ssize_t data_debug_write(struct file *file,
+				const char __user *user_buf,
+				size_t cnt, loff_t *loff)
+{
+	struct dbg_info *di = file->private_data;
+	struct dbg_internal *d = &di->internal;
+	void *buffer;
+	u8 *pdata;
+	char buf[PREALLOC_WBUFFER_SIZE + 1], *token, *cur;
+	int val_cnt = 0, ret;
+
+	if (cnt > PREALLOC_WBUFFER_SIZE)
+		return -ENOMEM;
+	if (copy_from_user(buf, user_buf, cnt))
+		return -EFAULT;
+	buf[cnt] = 0;
+	/* buffer size check */
+	if (d->data_buffer_size < d->size) {
+		buffer = kzalloc(d->size, GFP_KERNEL);
+		if (!buffer)
+			return -ENOMEM;
+		kfree(d->data_buffer);
+		d->data_buffer = buffer;
+		d->data_buffer_size = d->size;
+	}
+	/* data parsing */
+	cur = buf;
+	pdata = d->data_buffer;
+	while ((token = strsep(&cur, ",\n")) != NULL) {
+		if (!*token)
+			break;
+		if (val_cnt++ >= d->size)
+			break;
+		if (kstrtou8(token, 16, pdata++))
+			return -EINVAL;
+	}
+	if (val_cnt != d->size)
+		return -EINVAL;
+	/* write transfer */
+	if (!di->io_write)
+		return -EPERM;
+	ret = di->io_write(di->io_drvdata, d->reg, d->data_buffer, d->size);
+	return (ret < 0) ? ret : cnt;
+}
+
+static int data_debug_release(struct inode *inode, struct file *file)
+{
+	if (file->f_mode & FMODE_READ)
+		return single_release(inode, file);
+	return 0;
+}
+
+static const struct file_operations data_debug_fops = {
+	.open = data_debug_open,
+	.read = seq_read,
+	.write = data_debug_write,
+	.llseek = seq_lseek,
+	.release = data_debug_release,
+};
+
+static int type_debug_show(struct seq_file *s, void *data)
+{
+	struct dbg_info *di = s->private;
+
+	seq_printf(s, "%s,%s\n", di->typestr, di->devname);
+	return 0;
+}
+
+static int type_debug_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, type_debug_show, inode->i_private);
+}
+
+static const struct file_operations type_debug_fops = {
+	.open = type_debug_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static int dump_debug_show(struct seq_file *s, void *data)
+{
+	struct dbg_info *di = s->private;
+	struct mt6660_chip *chip =
+		container_of(di, struct mt6660_chip, dbg_info);
+	int i = 0, j = 0, ret = 0;
+	unsigned int val;
+	int size = 0;
+
+	if (!chip) {
+		pr_err("%s chip is null\n", __func__);
+		return -ENODEV;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(mt6660_dump_table); i++) {
+		ret = regmap_read(chip->regmap, mt6660_dump_table[i], &val);
+		size = mt6660_get_reg_size(mt6660_dump_table[i]);
+		seq_printf(s, "reg0x%02x:0x", mt6660_dump_table[i]);
+		for (j = size - 1; j >= 0; j--)
+			seq_printf(s, "%x,", (val >> 8*j)&0xff);
+		seq_printf(s, "\n");
+	}
+	return 0;
+}
+
+static int dump_debug_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, dump_debug_show, inode->i_private);
+}
+
+static const struct file_operations dump_debug_fops = {
+	.open = dump_debug_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static ssize_t lock_debug_read(struct file *file,
+			       char __user *user_buf, size_t cnt, loff_t *loff)
+{
+	struct dbg_info *di = file->private_data;
+	struct dbg_internal *d = &di->internal;
+	char buf[10];
+
+	snprintf(buf, sizeof(buf), "%d\n", mutex_is_locked(&d->io_lock));
+	return simple_read_from_buffer(user_buf, cnt, loff, buf, strlen(buf));
+}
+
+static ssize_t lock_debug_write(struct file *file,
+				const char __user *user_buf,
+				size_t cnt, loff_t *loff)
+{
+	struct dbg_info *di = file->private_data;
+	struct dbg_internal *d = &di->internal;
+	u32 lock;
+	int ret;
+
+	ret = kstrtou32_from_user(user_buf, cnt, 0, &lock);
+	if (ret < 0)
+		return ret;
+	lock ? mutex_lock(&d->io_lock) : mutex_unlock(&d->io_lock);
+	return cnt;
+}
+
+static const struct file_operations lock_debug_fops = {
+	.open = simple_open,
+	.read = lock_debug_read,
+	.write = lock_debug_write,
+};
+
+static int generic_debugfs_init(struct dbg_info *di)
+{
+	struct dbg_internal *d = &di->internal;
+
+	/* valid check */
+	if (!di->dirname || !di->devname || !di->typestr)
+		return -EINVAL;
+	d->data_buffer_size = PREALLOC_RBUFFER_SIZE;
+	d->data_buffer = kzalloc(PREALLOC_RBUFFER_SIZE, GFP_KERNEL);
+	if (!d->data_buffer)
+		return -ENOMEM;
+	/* create debugfs */
+	d->rt_root = debugfs_lookup("ext_dev_io", NULL);
+	if (!d->rt_root) {
+		d->rt_root = debugfs_create_dir("ext_dev_io", NULL);
+		if (!d->rt_root)
+			return -ENODEV;
+		d->rt_dir_create = true;
+	}
+	d->ic_root = debugfs_create_dir(di->dirname, d->rt_root);
+	if (!d->ic_root)
+		goto err_cleanup_rt;
+	if (!debugfs_create_u16("reg", 0644, d->ic_root, &d->reg))
+		goto err_cleanup_ic;
+	if (!debugfs_create_u16("size", 0644, d->ic_root, &d->size))
+		goto err_cleanup_ic;
+	if (!debugfs_create_file("data", 0644,
+				 d->ic_root, di, &data_debug_fops))
+		goto err_cleanup_ic;
+	if (!debugfs_create_file("type", 0444,
+				 d->ic_root, di, &type_debug_fops))
+		goto err_cleanup_ic;
+	if (!debugfs_create_file("lock", 0644,
+				 d->ic_root, di, &lock_debug_fops))
+		goto err_cleanup_ic;
+	if (!debugfs_create_file("dumps", 0444,
+				d->ic_root, di, &dump_debug_fops))
+		goto err_cleanup_ic;
+	mutex_init(&d->io_lock);
+	return 0;
+err_cleanup_ic:
+	debugfs_remove_recursive(d->ic_root);
+err_cleanup_rt:
+	if (d->rt_dir_create)
+		debugfs_remove_recursive(d->rt_root);
+	kfree(d->data_buffer);
+	return -ENODEV;
+}
+
+static void generic_debugfs_exit(struct dbg_info *di)
+{
+	struct dbg_internal *d = &di->internal;
+
+	mutex_destroy(&d->io_lock);
+	debugfs_remove_recursive(d->ic_root);
+	if (d->rt_dir_create)
+		debugfs_remove_recursive(d->rt_root);
+	kfree(d->data_buffer);
+}
+#else
+static inline int generic_debugfs_init(struct dbg_info *di)
+{
+	return 0;
+}
+
+static inline void generic_debugfs_exit(struct dbg_info *di) {}
+#endif /* CONFIG_DEBUG_FS */
+#endif /* GENERIC_DEBUGFS */
+
+/*
+ * MT6660 Generic Setting make this chip work normally.
+ * it is tuned by Richtek RDs.
+ */
+static const struct codec_reg_val generic_reg_inits[] = {
+	{ MT6660_REG_WDT_CTRL, 0x80, 0x00 },
+	{ MT6660_REG_SPS_CTRL, 0x01, 0x00 },
+	{ MT6660_REG_AUDIO_IN2_SEL, 0x1c, 0x04 },
+	{ MT6660_REG_RESV11, 0x0c, 0x00 },
+	{ MT6660_REG_RESV31, 0x03, 0x03 },
+	{ MT6660_REG_RESV40, 0x01, 0x00 },
+	{ MT6660_REG_RESV0, 0x44, 0x04 },
+	{ MT6660_REG_RESV19, 0xff, 0x82 },
+	{ MT6660_REG_RESV17, 0x7777, 0x7273 },
+	{ MT6660_REG_RESV16, 0x07, 0x03 },
+	{ MT6660_REG_DRE_CORASE, 0xe0, 0x20 },
+	{ MT6660_REG_ADDA_CLOCK, 0xff, 0x70 },
+	{ MT6660_REG_RESV21, 0xff, 0x20 },
+	{ MT6660_REG_DRE_THDMODE, 0xff, 0x40 },
+	{ MT6660_REG_RESV23, 0xffff, 0x17f8 },
+	{ MT6660_REG_PWM_CTRL, 0xff, 0x15 },
+	{ MT6660_REG_ADC_USB_MODE, 0xff, 0x00 },
+	{ MT6660_REG_PROTECTION_CFG, 0xff, 0x1d },
+	{ MT6660_REG_HPF1_COEF, 0xffffffff, 0x7fdb7ffe },
+	{ MT6660_REG_HPF2_COEF, 0xffffffff, 0x7fdb7ffe },
+	{ MT6660_REG_SIG_GAIN, 0xff, 0x58 },
+	{ MT6660_REG_RESV6, 0xff, 0xce },
+	{ MT6660_REG_SIGMAX, 0xffff, 0x7fff },
+	{ MT6660_REG_DA_GAIN, 0xffff, 0x0116 },
+	{ MT6660_REG_TDM_CFG3, 0x1800, 0x0800 },
+	{ MT6660_REG_DRE_CTRL, 0x1f, 0x07 },
+};
+
+static int mt6660_component_init_setting(struct snd_soc_component *component)
+{
+	int i, len, ret;
+	const struct codec_reg_val *init_table;
+
+	pr_info("%s start\n", __func__);
+	init_table = generic_reg_inits;
+	len = ARRAY_SIZE(generic_reg_inits);
+
+	for (i = 0; i < len; i++) {
+		ret = snd_soc_component_update_bits(component,
+			init_table[i].addr,
+			init_table[i].mask, init_table[i].data);
+		if (ret < 0)
+			return ret;
+	}
+	pr_info("%s end\n", __func__);
+	return 0;
+}
+
+static int mt6660_component_set_bias_level(struct snd_soc_component *component,
+	enum snd_soc_bias_level level)
+{
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
+	struct mt6660_chip *chip = snd_soc_component_get_drvdata(component);
+	unsigned int val;
+	int ret = 0;
+
+	switch (level) {
+	case SND_SOC_BIAS_OFF:
+		ret = regmap_read(chip->regmap, MT6660_REG_IRQ_STATUS1, &val);
+		dev_info(component->dev,
+			"%s reg0x05 = 0x%x\n", __func__, val);
+		break;
+	case SND_SOC_BIAS_ON:
+	case SND_SOC_BIAS_PREPARE:
+	/* Fall Through */
+	case SND_SOC_BIAS_STANDBY:
+	default:
+		break;
+	}
+	dapm->bias_level = level;
+	dev_dbg(component->dev, "c bias_level = %d\n", level);
+	return 0;
+}
+
+static int mt6660_codec_dac_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		usleep_range(1000, 1100);
+		break;
+	}
+	return 0;
+}
+
+static int mt6660_codec_classd_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	int ret = 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		dev_dbg(component->dev,
+			"%s: before classd turn on\n", __func__);
+		/* config to adaptive mode */
+		ret = snd_soc_component_update_bits(component,
+			MT6660_REG_BST_CTRL, 0x03, 0x03);
+		if (ret < 0) {
+			dev_err(component->dev, "config mode adaptive fail\n");
+			return ret;
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		/* voltage sensing enable */
+		ret = snd_soc_component_update_bits(component,
+			MT6660_REG_RESV7, 0x04, 0x04);
+		if (ret < 0) {
+			dev_err(component->dev,
+				"enable voltage sensing fail\n");
+			return ret;
+		}
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		/* voltage sensing disable */
+		ret = snd_soc_component_update_bits(component,
+			MT6660_REG_RESV7, 0x04, 0x00);
+		if (ret < 0) {
+			dev_err(component->dev,
+				"disable voltage sensing fail\n");
+			return ret;
+		}
+		/* pop-noise improvement 1 */
+		ret = snd_soc_component_update_bits(component,
+			MT6660_REG_RESV10, 0x10, 0x10);
+		if (ret < 0) {
+			dev_err(component->dev,
+				"pop-noise improvement 1 fail\n");
+			return ret;
+		}
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		dev_dbg(component->dev,
+			"%s: after classd turn off\n", __func__);
+		/* pop-noise improvement 2 */
+		ret = snd_soc_component_update_bits(component,
+			MT6660_REG_RESV10, 0x10, 0x00);
+		if (ret < 0) {
+			dev_err(component->dev,
+				"pop-noise improvement 2 fail\n");
+			return ret;
+		}
+		/* config to off mode */
+		ret = snd_soc_component_update_bits(component,
+			MT6660_REG_BST_CTRL, 0x03, 0x00);
+		if (ret < 0) {
+			dev_err(component->dev, "config mode off fail\n");
+			return ret;
+		}
+		break;
+	}
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget mt6660_component_dapm_widgets[] = {
+	SND_SOC_DAPM_DAC_E("DAC", NULL, MT6660_REG_PLL_CFG1,
+		0, 1, mt6660_codec_dac_event, SND_SOC_DAPM_POST_PMU),
+	SND_SOC_DAPM_ADC("VI ADC", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_PGA("PGA", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_OUT_DRV_E("ClassD", MT6660_REG_SYSTEM_CTRL, 2, 0,
+			       NULL, 0, mt6660_codec_classd_event,
+			       SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			       SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_OUTPUT("OUTP"),
+	SND_SOC_DAPM_OUTPUT("OUTN"),
+};
+
+static const struct snd_soc_dapm_route mt6660_component_dapm_routes[] = {
+	{ "DAC", NULL, "aif_playback"},
+	{ "PGA", NULL, "DAC"},
+	{ "ClassD", NULL, "PGA"},
+	{ "OUTP", NULL, "ClassD"},
+	{ "OUTN", NULL, "ClassD"},
+	{ "VI ADC", NULL, "ClassD"},
+	{ "aif_capture", NULL, "VI ADC"},
+};
+
+static int mt6660_component_put_volsw(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	int put_ret = 0;
+
+	pm_runtime_get_sync(component->dev);
+	put_ret = snd_soc_put_volsw(kcontrol, ucontrol);
+	if (put_ret < 0)
+		return put_ret;
+	pm_runtime_put(component->dev);
+	return put_ret;
+}
+
+static int mt6660_component_get_volsw(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct mt6660_chip *chip = (struct mt6660_chip *)
+		snd_soc_component_get_drvdata(component);
+	int ret = -EINVAL;
+
+	if (!strcmp(kcontrol->id.name, "Chip_Rev")) {
+		ucontrol->value.integer.value[0] = chip->chip_rev & 0x0f;
+		ret = 0;
+	}
+	return ret;
+}
+
+static const DECLARE_TLV_DB_SCALE(vol_ctl_tlv, -1155, 5, 0);
+
+static const struct snd_kcontrol_new mt6660_component_snd_controls[] = {
+	SOC_SINGLE_EXT_TLV("Digital Volume", MT6660_REG_VOL_CTRL, 0, 255,
+			   1, snd_soc_get_volsw, mt6660_component_put_volsw,
+			   vol_ctl_tlv),
+	SOC_SINGLE_EXT("WDT Switch", MT6660_REG_WDT_CTRL, 7, 1, 0,
+		       snd_soc_get_volsw, mt6660_component_put_volsw),
+	SOC_SINGLE_EXT("Hard Clip Switch", MT6660_REG_HCLIP_CTRL, 8, 1, 0,
+		       snd_soc_get_volsw, mt6660_component_put_volsw),
+	SOC_SINGLE_EXT("Clip Switch", MT6660_REG_SPS_CTRL, 0, 1, 0,
+		       snd_soc_get_volsw, mt6660_component_put_volsw),
+	SOC_SINGLE_EXT("BoostMode", MT6660_REG_BST_CTRL, 0, 3, 0,
+		       snd_soc_get_volsw, mt6660_component_put_volsw),
+	SOC_SINGLE_EXT("DRE Switch", MT6660_REG_DRE_CTRL, 0, 1, 0,
+		       snd_soc_get_volsw, mt6660_component_put_volsw),
+	SOC_SINGLE_EXT("DC_Protect Switch",
+		MT6660_REG_DC_PROTECT_CTRL, 3, 1, 0,
+		snd_soc_get_volsw, mt6660_component_put_volsw),
+	SOC_SINGLE_EXT("audio input selection", MT6660_REG_DATAO_SEL, 6, 3, 0,
+		       snd_soc_get_volsw, mt6660_component_put_volsw),
+	SOC_SINGLE_EXT("Data Output Left Channel Selection",
+		       MT6660_REG_DATAO_SEL, 3, 7, 0,
+		       snd_soc_get_volsw, mt6660_component_put_volsw),
+	SOC_SINGLE_EXT("Data Output Right Channel Selection",
+		       MT6660_REG_DATAO_SEL, 0, 7, 0,
+		       snd_soc_get_volsw, mt6660_component_put_volsw),
+	/* for debug purpose */
+	SOC_SINGLE_EXT("HPF AUD IN Switch", MT6660_REG_HPF_CTRL, 0, 1, 0,
+		       snd_soc_get_volsw, mt6660_component_put_volsw),
+	SOC_SINGLE_EXT("AUD LOOP BACK Switch", MT6660_REG_PATH_BYPASS, 4, 1, 0,
+		       snd_soc_get_volsw, mt6660_component_put_volsw),
+	SOC_SINGLE_EXT("Mute Switch", MT6660_REG_SYSTEM_CTRL, 1, 1, 0,
+		       snd_soc_get_volsw, mt6660_component_put_volsw),
+	SOC_SINGLE_EXT("Bypass CS Comp Switch", MT6660_REG_PATH_BYPASS, 2, 1, 0,
+		       snd_soc_get_volsw, mt6660_component_put_volsw),
+	SOC_SINGLE_EXT("T0 SEL", MT6660_REG_CALI_T0, 0, 7, 0,
+		       snd_soc_get_volsw, NULL),
+	SOC_SINGLE_EXT("Chip Rev", SND_SOC_NOPM, 0, 16, 0,
+		       mt6660_component_get_volsw, NULL),
+};
+
+static int mt6660_component_probe(struct snd_soc_component *component)
+{
+	struct mt6660_chip *chip = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	pr_info("%s\n", __func__);
+	//snd_soc_component_init_regmap(component, chip->regmap);
+
+	/* init chip setting */
+	ret = mt6660_component_init_setting(component);
+	if (ret < 0)
+		dev_err(chip->dev, "chip i2c init setting fail\n");
+
+	return ret;
+}
+
+static void mt6660_component_remove(struct snd_soc_component *component)
+{
+	pr_info("%s\n", __func__);
+	snd_soc_component_exit_regmap(component);
+}
+
+static const struct snd_soc_component_driver mt6660_component_driver = {
+	.probe = mt6660_component_probe,
+	.remove = mt6660_component_remove,
+	.read = mt6660_component_io_read,
+	.write = mt6660_component_io_write,
+
+	.controls = mt6660_component_snd_controls,
+	.num_controls = ARRAY_SIZE(mt6660_component_snd_controls),
+	.dapm_widgets = mt6660_component_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt6660_component_dapm_widgets),
+	.dapm_routes = mt6660_component_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt6660_component_dapm_routes),
+
+	.set_bias_level = mt6660_component_set_bias_level,
+	.idle_bias_on = false, /* idle_bias_off = true */
+};
+
+static int mt6660_component_aif_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *hw_params, struct snd_soc_dai *dai)
+{
+	int word_len = params_physical_width(hw_params);
+	int aud_bit = params_width(hw_params);
+	u16 reg_data = 0;
+	int ret = 0;
+
+	dev_dbg(dai->dev, "%s: ++\n", __func__);
+	dev_dbg(dai->dev, "format: 0x%08x\n", params_format(hw_params));
+	dev_dbg(dai->dev, "rate: 0x%08x\n", params_rate(hw_params));
+	dev_dbg(dai->dev, "word_len: %d, aud_bit: %d\n", word_len, aud_bit);
+	if (word_len > 32 || word_len < 16) {
+		dev_err(dai->dev, "not supported word length\n");
+		return -ENOTSUPP;
+	}
+	switch (aud_bit) {
+	case 16:
+		reg_data = 3;
+		break;
+	case 18:
+		reg_data = 2;
+		break;
+	case 20:
+		reg_data = 1;
+		break;
+	case 24:
+	case 32:
+		reg_data = 0;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+	ret = snd_soc_component_update_bits(dai->component,
+		MT6660_REG_SERIAL_CFG1, 0xc0, (reg_data << 6));
+	if (ret < 0) {
+		dev_err(dai->dev, "config aud bit fail\n");
+		return ret;
+	}
+	ret = snd_soc_component_update_bits(dai->component,
+		MT6660_REG_TDM_CFG3, 0x3f0, word_len << 4);
+	if (ret < 0) {
+		dev_err(dai->dev, "config word len fail\n");
+		return ret;
+	}
+	dev_dbg(dai->dev, "%s: --\n", __func__);
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mt6660_component_aif_ops = {
+	.hw_params = mt6660_component_aif_hw_params,
+};
+
+#define STUB_RATES	SNDRV_PCM_RATE_8000_192000
+#define STUB_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+			SNDRV_PCM_FMTBIT_U16_LE | \
+			SNDRV_PCM_FMTBIT_S24_LE | \
+			SNDRV_PCM_FMTBIT_U24_LE | \
+			SNDRV_PCM_FMTBIT_S32_LE | \
+			SNDRV_PCM_FMTBIT_U32_LE)
+
+static struct snd_soc_dai_driver mt6660_codec_dai = {
+	.name = "mt6660-aif",
+	.playback = {
+		.stream_name	= "aif_playback",
+		.channels_min	= 1,
+		.channels_max	= 2,
+		.rates		= STUB_RATES,
+		.formats	= STUB_FORMATS,
+	},
+	.capture = {
+		.stream_name	= "aif_capture",
+		.channels_min	= 1,
+		.channels_max	= 2,
+		.rates = STUB_RATES,
+		.formats = STUB_FORMATS,
+	},
+	/* dai properties */
+	.symmetric_rates = 1,
+	.symmetric_channels = 1,
+	.symmetric_samplebits = 1,
+	/* dai operations */
+	.ops = &mt6660_component_aif_ops,
+};
+
+static inline int _mt6660_chip_id_check(struct mt6660_chip *chip)
+{
+	u8 id[2] = {0};
+	int ret = 0;
+
+	ret = i2c_smbus_read_i2c_block_data(chip->i2c, MT6660_REG_DEVID, 2, id);
+	if (ret < 0)
+		return ret;
+	ret = (id[0] << 8) + id[1];
+	ret &= 0x0ff0;
+	if (ret != 0x00e0 && ret != 0x01e0)
+		return -ENODEV;
+	return ret;
+}
+
+static inline int _mt6660_chip_sw_reset(struct mt6660_chip *chip)
+{
+	int ret;
+
+	/* turn on main pll first, then trigger reset */
+	ret = regmap_write(chip->regmap, 0x03, 0x00);
+	if (ret < 0)
+		return ret;
+	ret = regmap_write(chip->regmap, MT6660_REG_SYSTEM_CTRL, 0x80);
+	msleep(30);
+	return 0;
+}
+
+static inline int _mt6660_chip_power_on(struct mt6660_chip *chip, int on_off)
+{
+	u8 reg_data = 0;
+	int ret = 0;
+
+	ret = i2c_smbus_read_byte_data(chip->i2c, MT6660_REG_SYSTEM_CTRL);
+	if (ret < 0)
+		return ret;
+	reg_data = (u8)ret;
+	if (on_off)
+		reg_data &= (~0x01);
+	else
+		reg_data |= 0x01;
+	return regmap_write(chip->regmap, MT6660_REG_SYSTEM_CTRL, reg_data);
+}
+
+static inline int _mt6660_read_chip_revision(struct mt6660_chip *chip)
+{
+	u8 reg_data[2] = {0};
+	int ret = 0;
+
+	ret = i2c_smbus_read_i2c_block_data(
+		chip->i2c, MT6660_REG_DEVID, 2, reg_data);
+	if (ret < 0) {
+		dev_err(chip->dev, "get chip revision fail\n");
+		return ret;
+	}
+	chip->chip_rev = reg_data[1];
+	return 0;
+}
+
+static int mt6660_i2c_probe(struct i2c_client *client,
+			    const struct i2c_device_id *id)
+{
+	struct mt6660_chip *chip = NULL;
+	int ret = 0;
+
+	pr_info("%s start\n", __func__);
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+	chip->i2c = client;
+	chip->dev = &client->dev;
+	mutex_init(&chip->io_lock);
+	i2c_set_clientdata(client, chip);
+
+	chip->regmap = devm_regmap_init(&client->dev,
+		NULL, chip, &mt6660_regmap_config);
+	if (IS_ERR(chip->regmap)) {
+		ret = PTR_ERR(chip->regmap);
+		dev_err(&client->dev, "failed to initialise regmap: %d\n", ret);
+		return ret;
+	}
+
+#if GENERIC_DEBUGFS
+	/* debugfs interface */
+	chip->dbg_info.dirname = devm_kasprintf(&client->dev,
+						GFP_KERNEL, "MT6660.%s",
+						dev_name(&client->dev));
+	chip->dbg_info.devname = dev_name(&client->dev);
+	chip->dbg_info.typestr = devm_kasprintf(&client->dev,
+						GFP_KERNEL, "I2C,MT6660");
+	chip->dbg_info.io_drvdata = chip;
+	chip->dbg_info.io_read = mt6660_dbg_io_read;
+	chip->dbg_info.io_write = mt6660_dbg_io_write;
+
+	ret = generic_debugfs_init(&chip->dbg_info);
+	if (ret < 0) {
+		dev_err(&client->dev, "generic dbg init fail\n");
+		return -EINVAL;
+	}
+#endif /* GENERIC_DEBUGFS */
+
+	/* chip reset first */
+	ret = _mt6660_chip_sw_reset(chip);
+	if (ret < 0) {
+		dev_err(chip->dev, "chip reset fail\n");
+		goto probe_fail;
+	}
+	/* chip power on */
+	ret = _mt6660_chip_power_on(chip, 1);
+	if (ret < 0) {
+		dev_err(chip->dev, "chip power on 2 fail\n");
+		goto probe_fail;
+	}
+	/* chip devid check */
+	ret = _mt6660_chip_id_check(chip);
+	if (ret < 0) {
+		dev_err(chip->dev, "chip id check fail\n");
+		goto probe_fail;
+	}
+	/* chip revision get */
+	ret = _mt6660_read_chip_revision(chip);
+	if (ret < 0) {
+		dev_err(chip->dev, "read chip revision fail\n");
+		goto probe_fail;
+	}
+	pm_runtime_set_active(chip->dev);
+	pm_runtime_enable(chip->dev);
+
+	ret = devm_snd_soc_register_component(chip->dev,
+					       &mt6660_component_driver,
+					       &mt6660_codec_dai, 1);
+	pr_info("%s end, ret = %d\n", __func__, ret);
+	return ret;
+probe_fail:
+	_mt6660_chip_power_on(chip, 0);
+	mutex_destroy(&chip->io_lock);
+	return ret;
+}
+
+static int mt6660_i2c_remove(struct i2c_client *client)
+{
+	struct mt6660_chip *chip = i2c_get_clientdata(client);
+
+	pm_runtime_disable(chip->dev);
+	pm_runtime_set_suspended(chip->dev);
+#if GENERIC_DEBUGFS
+	generic_debugfs_exit(&chip->dbg_info);
+#endif /* GENERIC_DEBUGFS */
+	mutex_destroy(&chip->io_lock);
+	return 0;
+}
+
+static int __maybe_unused mt6660_i2c_runtime_suspend(struct device *dev)
+{
+	struct mt6660_chip *chip = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "enter low power mode\n");
+	return regmap_update_bits(chip->regmap,
+		MT6660_REG_SYSTEM_CTRL, 0x01, 0x01);
+}
+
+static int __maybe_unused mt6660_i2c_runtime_resume(struct device *dev)
+{
+	struct mt6660_chip *chip = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "exit low power mode\n");
+	return regmap_update_bits(chip->regmap,
+		MT6660_REG_SYSTEM_CTRL, 0x01, 0x00);
+}
+
+static const struct dev_pm_ops mt6660_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(mt6660_i2c_runtime_suspend,
+			   mt6660_i2c_runtime_resume, NULL)
+};
+
+static const struct of_device_id __maybe_unused mt6660_of_id[] = {
+	{ .compatible = "mediatek,mt6660",},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mt6660_of_id);
+
+static const struct i2c_device_id mt6660_i2c_id[] = {
+	{"mt6660", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, mt6660_i2c_id);
+
+static struct i2c_driver mt6660_i2c_driver = {
+	.driver = {
+		.name = "mt6660",
+		.of_match_table = of_match_ptr(mt6660_of_id),
+		.pm = &mt6660_dev_pm_ops,
+	},
+	.probe = mt6660_i2c_probe,
+	.remove = mt6660_i2c_remove,
+	.id_table = mt6660_i2c_id,
+};
+module_i2c_driver(mt6660_i2c_driver);
+
+MODULE_AUTHOR("Jeff Chang <jeff_chang@richtek.com>");
+MODULE_DESCRIPTION("MT6660 SPKAMP Driver");
+MODULE_LICENSE("GPL");
+MODULE_VERSION("1.0.7_G");
diff --git a/sound/soc/codecs/mt6660.h b/sound/soc/codecs/mt6660.h
new file mode 100644
index 0000000..9e62dcc
--- /dev/null
+++ b/sound/soc/codecs/mt6660.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#ifndef __SND_SOC_MT6660_H
+#define __SND_SOC_MT6660_H
+
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+
+#define GENERIC_DEBUGFS	0
+
+#if GENERIC_DEBUGFS
+struct dbg_internal {
+	struct dentry *rt_root;
+	struct dentry *ic_root;
+	bool rt_dir_create;
+	struct mutex io_lock;
+	u16 reg;
+	u16 size;
+	u16 data_buffer_size;
+	void *data_buffer;
+};
+
+struct dbg_info {
+	const char *dirname;
+	const char *devname;
+	const char *typestr;
+	void *io_drvdata;
+	int (*io_read)(void *drvdata, u16 reg, void *val, u16 size);
+	int (*io_write)(void *drvdata, u16 reg, const void *val, u16 size);
+	struct dbg_internal internal;
+};
+#endif /* GENERIC_DEBUGFS */
+
+struct mt6660_chip {
+	struct i2c_client *i2c;
+	struct device *dev;
+	struct platform_device *param_dev;
+	struct mutex io_lock;
+#if GENERIC_DEBUGFS
+	struct dbg_info dbg_info;
+#endif /* GENERIC_DEBUGFS */
+	struct regmap *regmap;
+	u16 chip_rev;
+};
+
+#define MT6660_REG_DEVID		(0x00)
+#define MT6660_REG_SYSTEM_CTRL		(0x03)
+#define MT6660_REG_IRQ_STATUS1		(0x05)
+#define MT6660_REG_ADDA_CLOCK		(0x07)
+#define MT6660_REG_SERIAL_CFG1		(0x10)
+#define MT6660_REG_DATAO_SEL		(0x12)
+#define MT6660_REG_TDM_CFG3		(0x15)
+#define MT6660_REG_HPF_CTRL		(0x18)
+#define MT6660_REG_HPF1_COEF		(0x1A)
+#define MT6660_REG_HPF2_COEF		(0x1B)
+#define MT6660_REG_PATH_BYPASS		(0x1E)
+#define MT6660_REG_WDT_CTRL		(0x20)
+#define MT6660_REG_HCLIP_CTRL		(0x24)
+#define MT6660_REG_VOL_CTRL		(0x29)
+#define MT6660_REG_SPS_CTRL		(0x30)
+#define MT6660_REG_SIGMAX		(0x33)
+#define MT6660_REG_CALI_T0		(0x3F)
+#define MT6660_REG_BST_CTRL		(0x40)
+#define MT6660_REG_PROTECTION_CFG	(0x46)
+#define MT6660_REG_DA_GAIN		(0x4c)
+#define MT6660_REG_AUDIO_IN2_SEL	(0x50)
+#define MT6660_REG_SIG_GAIN		(0x51)
+#define MT6660_REG_PLL_CFG1		(0x60)
+#define MT6660_REG_DRE_CTRL		(0x68)
+#define MT6660_REG_DRE_THDMODE		(0x69)
+#define MT6660_REG_DRE_CORASE		(0x6B)
+#define MT6660_REG_PWM_CTRL		(0x70)
+#define MT6660_REG_DC_PROTECT_CTRL	(0x74)
+#define MT6660_REG_ADC_USB_MODE		(0x7c)
+#define MT6660_REG_INTERNAL_CFG		(0x88)
+#define MT6660_REG_RESV0		(0x98)
+#define MT6660_REG_RESV1		(0x99)
+#define MT6660_REG_RESV2		(0x9A)
+#define MT6660_REG_RESV3		(0x9B)
+#define MT6660_REG_RESV6		(0xA2)
+#define MT6660_REG_RESV7		(0xA3)
+#define MT6660_REG_RESV10		(0xB0)
+#define MT6660_REG_RESV11		(0xB1)
+#define MT6660_REG_RESV16		(0xB6)
+#define MT6660_REG_RESV17		(0xB7)
+#define MT6660_REG_RESV19		(0xB9)
+#define MT6660_REG_RESV21		(0xBB)
+#define MT6660_REG_RESV23		(0xBD)
+#define MT6660_REG_RESV31		(0xD3)
+#define MT6660_REG_RESV40		(0xE0)
+
+#endif /* __SND_SOC_MT6660_H */
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

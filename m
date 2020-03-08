Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1972217D42A
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Mar 2020 15:27:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 135D5167A;
	Sun,  8 Mar 2020 15:27:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 135D5167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583677675;
	bh=apTilEknLqayYOCxkXUCJWm7cxXINkWG1Gb8nTfNJK8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aBdzxegrSgT4843AmEATTWQHoSvnnsVAc4hwo3ESgdogcjnb+Pd65rGb875YcYWFj
	 qmLh2MTXA9OWTL5XTOmGxpH6capyMZc6eNya67GvV6YT9jyc/t80uxyEKV/8aCIybo
	 i/rkxGQzCSCGYPbTs7FbSROp8uV2N7xDwrQlYyDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A74C2F8028B;
	Sun,  8 Mar 2020 15:25:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05D14F8024A; Sun,  8 Mar 2020 15:25:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0527FF80130
 for <alsa-devel@alsa-project.org>; Sun,  8 Mar 2020 15:25:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0527FF80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.b="ahiw9kz9"
Received: by mail-ed1-x544.google.com with SMTP id a20so2895426edj.2
 for <alsa-devel@alsa-project.org>; Sun, 08 Mar 2020 07:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ltbFQpvDr6eWC1nBphRJMGpp4ElQHZylR9+xfc5JCcQ=;
 b=ahiw9kz9DK9ykr8hV2ZkuJtR1Mk68Ujs0BtTj/sygqrXPHWSnoAGDDuLJGOPXU7ypD
 S6IM4SAR0R7OPYSGzQUYwKkpDrDwv4fQT2iRi3Z/SbxR11iQ+LLaiUtqYu43wUshnguu
 /anpPOsTnr3aYh8Lr7JZjxiJZqdfPA1kB6vhzp2VHtnuRBLQDUMh0cHcF37dHboUNhLq
 qB46VBEuVfVuMkXi6fdcC5/5Z+2wf4Y3EGiCIv3hNsWa9Y5MRZQgRYfl7RTf0of6HoQ2
 OEKNHVbYifUGMIOZFrzzhMzxk4hi+txFU1kamdG604RHYi+4uOJDarSOpjon/8MuOfS7
 U/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ltbFQpvDr6eWC1nBphRJMGpp4ElQHZylR9+xfc5JCcQ=;
 b=BZ1pS9k9tDPFN/l5jvQWDoLv1I1OoyQ4Y+5zCd7XCcShizCjjqMTgcW9Tfr98Gmze+
 UlnixPnocnHgpHXQEujWo3TJsLJi6JzLpatkc0sYjQJGQI7TZlrOgppPQSXgLvJljcdq
 R02WYoUZVvgKEceiQIA7fh8cA2rEE/Cstd0ozyQzUbbDE9umb2SqIfZqZvDm3Zfsf9In
 okmrEaJAVBxjZ8HpsjVZiFFb0kEuoomHCYHnivjsuQRe557PoK1NBnPogsuBIwHgTL/2
 UuND0YgdonoHO5SIsmi0O/5V5sstQEP0oR8qb7+9XiIqyiawyN+DKJZg7BoMRUivc5vs
 RaRQ==
X-Gm-Message-State: ANhLgQ0xzmWfdS1ssVAXihK+3oi44Ym+W5PBMkWCjI2gMObC35z/HhoG
 9NZXdWs7KjKC2vmRhvtPzDVTbSoNIz4=
X-Google-Smtp-Source: ADFU+vtmXKV65k7cNrLBJxRIdW/IECluZcEyVL1qZ0mo2H3H13E4XcZvXSog/KGusKQf8o64PULKgw==
X-Received: by 2002:a50:ee15:: with SMTP id g21mr12786051eds.25.1583677519892; 
 Sun, 08 Mar 2020 07:25:19 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:44b4:9700:886c:841d:dea2:ee2a])
 by smtp.googlemail.com with ESMTPSA id h20sm1736516edr.43.2020.03.08.07.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 07:25:19 -0700 (PDT)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/6 V3] ASoC: add TAS5756m driver
Date: Sun,  8 Mar 2020 15:25:04 +0100
Message-Id: <20200308142509.27765-2-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200308142509.27765-1-charles-antoine.couret@mind.be>
References: <20200308142509.27765-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Charles-Antoine Couret <charles-antoine.couret@mind.be>
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

You can read datasheets there:
http://www.ti.com/lit/ds/symlink/tas5754m.pdf
http://www.ti.com/lit/ds/symlink/tas5756m.pdf

TAS5754M datasheet has a more complete datasheet about register mapping
which is common with TAS5756M.

Those devices have a programmable DSP whith several modes named hybridflow.
Currently only Hybridflow 3, 4, 6 and 7 are supported (out of 9).
Retro engenerring is required to map coefficients registers to registers
for each Hybridflow.

More details about it there: http://www.ti.com/lit/ug/slau577a/slau577a.pdf

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 sound/soc/codecs/Kconfig    |    8 +
 sound/soc/codecs/Makefile   |    2 +
 sound/soc/codecs/tas5756m.c | 2165 +++++++++++++++++++++++++++++++++++
 sound/soc/codecs/tas5756m.h |  351 ++++++
 4 files changed, 2526 insertions(+)
 create mode 100644 sound/soc/codecs/tas5756m.c
 create mode 100644 sound/soc/codecs/tas5756m.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ea912439e446..5e3afb4fb68d 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -193,6 +193,7 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_TAS5086 if I2C
 	select SND_SOC_TAS571X if I2C
 	select SND_SOC_TAS5720 if I2C
+	select SND_SOC_TAS5756M if I2C
 	select SND_SOC_TAS6424 if I2C
 	select SND_SOC_TDA7419 if I2C
 	select SND_SOC_TFA9879 if I2C
@@ -1221,6 +1222,13 @@ config SND_SOC_TAS5720
 	  Enable support for Texas Instruments TAS5720L/M high-efficiency mono
 	  Class-D audio power amplifiers.
 
+config SND_SOC_TAS5756M
+	tristate "Texas Instruments TAS5756M Audio amplifier"
+	depends on I2C
+	help
+	  Enable support for Texas Instruments TAS5756M and TAS5754
+	  audio power amplifiers.
+
 config SND_SOC_TAS6424
 	tristate "Texas Instruments TAS6424 Quad-Channel Audio amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index ba1b4b3fa2da..39dbaad4af70 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -204,6 +204,7 @@ snd-soc-sti-sas-objs := sti-sas.o
 snd-soc-tas5086-objs := tas5086.o
 snd-soc-tas571x-objs := tas571x.o
 snd-soc-tas5720-objs := tas5720.o
+snd-soc-tas5756m-objs := tas5756m.o
 snd-soc-tas6424-objs := tas6424.o
 snd-soc-tda7419-objs := tda7419.o
 snd-soc-tas2770-objs := tas2770.o
@@ -502,6 +503,7 @@ obj-$(CONFIG_SND_SOC_TAS2562)	+= snd-soc-tas2562.o
 obj-$(CONFIG_SND_SOC_TAS5086)	+= snd-soc-tas5086.o
 obj-$(CONFIG_SND_SOC_TAS571X)	+= snd-soc-tas571x.o
 obj-$(CONFIG_SND_SOC_TAS5720)	+= snd-soc-tas5720.o
+obj-$(CONFIG_SND_SOC_TAS5756M)	+= snd-soc-tas5756m.o
 obj-$(CONFIG_SND_SOC_TAS6424)	+= snd-soc-tas6424.o
 obj-$(CONFIG_SND_SOC_TDA7419)	+= snd-soc-tda7419.o
 obj-$(CONFIG_SND_SOC_TAS2770) += snd-soc-tas2770.o
diff --git a/sound/soc/codecs/tas5756m.c b/sound/soc/codecs/tas5756m.c
new file mode 100644
index 000000000000..67a03ac337ef
--- /dev/null
+++ b/sound/soc/codecs/tas5756m.c
@@ -0,0 +1,2165 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * tas5756m.h - ALSA SoC Texas Instruments TAS5756M Audio Amplifier
+ *
+ * Copyright (C)2018-2020 House of Music NV -  https://www.homa.be
+ *
+ * Authors: Charles-Antoine Couret <charles-antoine.couret@mind.be>
+ *        : Thomas Brijs <thomas.brijs@houseofmusic.be>
+ */
+
+#include <linux/init.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+
+#include <linux/regulator/consumer.h>
+
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-component.h>
+#include <sound/tlv.h>
+
+#include "tas5756m.h"
+#if 0
+#include "tas5756m_hf3_cfg.h"
+#include "tas5756m_hf4_cfg.h"
+#include "tas5756m_hf6_cfg.h"
+#include "tas5756m_hf7_cfg.h"
+#endif
+
+/* Define how often to check (and clear) the fault status register (in ms) */
+#define TAS5756M_FAULT_CHECK_INTERVAL		200
+
+static struct reg_default tas5756m_reg_defaults[] = {
+	{ TAS5756M_RESET, 0x00 },
+	{ TAS5756M_PDN_STBY, 0x00 },
+	{ TAS5756M_MUTE_L_R, 0x00 },
+	{ TAS5756M_PLL_EN_STA, 0x01 },
+	{ TAS5756M_SPI_MISO_SEL, 0x01 },
+	{ TAS5756M_SDOUT_DEEMPH, 0x00 },
+	{ TAS5756M_GPIO_OUT_EN, 0x00 },
+	{ TAS5756M_BCK_LRCK_CFG, 0x00 },
+	{ TAS5756M_DSP_GPIO_IN, 0x00 },
+	{ TAS5756M_MASTER_B_LRCK_RST, 0x7c },
+	{ TAS5756M_PLL_CLK_SRC_SEL, 0x00 },
+	{ TAS5756M_DAC_CLOCK_SRC, 0x00 },
+	{ TAS5756M_PLL_GPIO_REF_SEL, 0x00 },
+	{ TAS5756M_SYNC_REQ, 0x10 },
+	{ TAS5756M_PLL_P_VALUE, 0x00 },
+	{ TAS5756M_PLL_J_VALUE, 0x00 },
+	{ TAS5756M_PLL_D_VALUE_MSB, 0x00 },
+	{ TAS5756M_PLL_D_VALUE_LSB, 0x00 },
+	{ TAS5756M_PLL_R_VALUE, 0x00 },
+	{ TAS5756M_DSP_CLKDIV, 0x00 },
+	{ TAS5756M_DAC_CLKDIV, 0x00 },
+	{ TAS5756M_NCP_CLKDIV, 0x00 },
+	{ TAS5756M_OSR_CLKDIV, 0x00 },
+	{ TAS5756M_MM_BCK_CLKDIV, 0x00 },
+	{ TAS5756M_MM_LRCK_CLKDIV, 0x00 },
+	{ TAS5756M_FS_SPEED_MODE, 0x00 },
+	{ TAS5756M_IDAC_MSB, 0x01 },
+	{ TAS5756M_IDAC_LSB, 0x00 },
+	{ TAS5756M_IGN_ERRORS, 0x00 },
+	{ TAS5756M_I2S_CONFIG, 0x10 },
+	{ TAS5756M_I2S_SHIFT, 0x00 },
+	{ TAS5756M_DAC_DATA_PATH, 0x01 },
+	{ TAS5756M_DSP_PROG_SEL, 0x01 },
+	{ TAS5756M_CLK_MISS_DET, 0x00 },
+	{ TAS5756M_AUTO_MUTE_TIME, 0x00 },
+	{ TAS5756M_DIGITAL_VOLUME, 0x00 },
+	{ TAS5756M_LEFT_DVOL, 0x30 },
+	{ TAS5756M_RIGHT_DVOL, 0x30 },
+	{ TAS5756M_DVOL_RAMP_NORMAL, 0x22 },
+	{ TAS5756M_DVOL_RAMP_EMRGNCY, 0x02 },
+	{ TAS5756M_AUTO_MUTE, 0x04 },
+	{ TAS5756M_GPIO1_OUTPUT_SEL, 0x00 },
+	{ TAS5756M_GPIO2_OUTPUT_SEL, 0x00 },
+	{ TAS5756M_GPIO3_OUTPUT_SEL, 0x00 },
+	{ TAS5756M_GPIO4_OUTPUT_SEL, 0x00 },
+	{ TAS5756M_GPIO5_OUTPUT_SEL, 0x00 },
+	{ TAS5756M_GPIO6_OUTPUT_SEL, 0x00 },
+	{ TAS5756M_DAC_MODE, 0x00 },
+	{ TAS5756M_MCM_MODE, 0x00 },
+	{ TAS5756M_MCM_OUT_GPIO_1_2, 0x00 },
+	{ TAS5756M_MCM_OUT_GPIO_3_4, 0x00 },
+	{ TAS5756M_MCM_OUT_GPIO_5_6, 0x00 },
+	{ TAS5756M_ANLG_GAIN, 0x00 },
+	{ TAS5756M_ANLG_BOOST, 0x00 },
+};
+
+static bool tas5756m_volatile(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TAS5756M_PAGE_SEL:	/* regmap implementation requires this */
+	case TAS5756M_CHAN_OVRFLOW:
+	case TAS5756M_DET_FS_MCLK:
+	case TAS5756M_DET_SCLK:
+	case TAS5756M_DET_SCLK_DESC:
+	case TAS5756M_CLK_DET_STATUS:
+	case TAS5756M_CLK_STATUS:
+	case TAS5756M_ANLG_MUTE_MON:
+	case TAS5756M_SHORT_DETECT:
+	case TAS5756M_SPK_MUTE_DEC:
+	case TAS5756M_FS_SPEED_MON:
+	case TAS5756M_DAC_PWR_STA:
+	case TAS5756M_GPIO012_STATE:
+	case TAS5756M_AUTO_MUTE_FLAG:
+		return true;
+	}
+
+	return false;
+}
+
+static bool tas5756m_writeable(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TAS5756M_CHAN_OVRFLOW:
+	case TAS5756M_DET_FS_MCLK:
+	case TAS5756M_DET_SCLK:
+	case TAS5756M_DET_SCLK_DESC:
+	case TAS5756M_CLK_DET_STATUS:
+	case TAS5756M_CLK_STATUS:
+	case TAS5756M_ANLG_MUTE_MON:
+	case TAS5756M_SHORT_DETECT:
+	case TAS5756M_SPK_MUTE_DEC:
+	case TAS5756M_FS_SPEED_MON:
+	case TAS5756M_DAC_PWR_STA:
+	case TAS5756M_GPIO012_STATE:
+	case TAS5756M_AUTO_MUTE_FLAG:
+		return false;
+	}
+
+	return true;
+}
+
+static int tas5756m_route_channels(struct tas5756m_data *tas5756m,
+				   enum channel_mixer channel)
+{
+	struct device *dev = &tas5756m->tas5756m_client->dev;
+	const int ADDR = PAGE_NR(0) + TAS5756M_DAC_DATA_PATH;
+	unsigned char value;
+	int ret;
+
+	switch (channel) {
+	case CHANNEL_MIXER_RIGHT:
+		value =
+		    DAC_PATH_DEFAULT + (DAC_PATH_OPPOSITE << DAC_PATH_B_SHIFT);
+		break;
+	case CHANNEL_MIXER_LEFT:
+		value =
+		    DAC_PATH_OPPOSITE + (DAC_PATH_DEFAULT << DAC_PATH_B_SHIFT);
+		break;
+	default:
+		value =
+		    DAC_PATH_DEFAULT + (DAC_PATH_DEFAULT << DAC_PATH_B_SHIFT);
+		break;
+	}
+
+	ret = regmap_bulk_write(tas5756m->regmap, ADDR, &value, 1);
+	if (ret < 0) {
+		dev_err(dev, "failed to write default channels route: %d\n",
+			ret);
+		return ret;
+	}
+
+	tas5756m->channel = channel;
+	return ret;
+}
+
+static int tas5756m_resume(struct tas5756m_data *tas5756m)
+{
+	struct device *dev = &tas5756m->tas5756m_client->dev;
+	int ret;
+
+	ret =
+	    regulator_bulk_enable(ARRAY_SIZE(tas5756m->supplies),
+				  tas5756m->supplies);
+	if (ret < 0)
+		dev_err(dev, "failed to enable regulators %d\n", ret);
+
+	regcache_cache_only(tas5756m->regmap, false);
+
+	ret = regcache_sync(tas5756m->regmap);
+	if (ret < 0) {
+		dev_err(dev, "failed to sync regcache: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int tas5756m_shutdown(struct tas5756m_data *tas5756m)
+{
+	struct device *dev = &tas5756m->tas5756m_client->dev;
+	int ret, reg_val, is_shutdown;
+
+	ret = regmap_read(tas5756m->regmap, TAS5756M_PDN_STBY, &reg_val);
+	if (ret < 0) {
+		dev_err(dev, "failed to read DAC power state: %d\n", ret);
+		return ret;
+	}
+
+	is_shutdown = reg_val & PDN_MASK;
+	if (!is_shutdown) {
+		dev_info(dev, "codec power down - PDN: %u\n", is_shutdown);
+		regmap_update_bits(tas5756m->regmap, TAS5756M_PDN_STBY,
+				   PDN_MASK, PDN_MASK);
+	}
+
+	return 0;
+}
+
+static bool tas5756m_is_running(struct tas5756m_data *tas5756m)
+{
+	struct device *dev = &tas5756m->tas5756m_client->dev;
+	bool running = false;
+	int err;
+	int dac_power_state;
+
+	err =
+	    regmap_read(tas5756m->regmap, TAS5756M_DAC_PWR_STA,
+			&dac_power_state);
+	if (err < 0) {
+		dev_err(dev, "failed to read DAC power state: %d\n", err);
+		return running;
+	}
+
+	if ((dac_power_state & DAC_POWER_STATE_MASK) == DAC_RUNNING)
+		running = true;
+
+	return running;
+}
+
+static int tas5756m_get_coef_reg_offset(struct tas5756m_data *tas5756m,
+					enum hybridflow_features feature)
+{
+	int reg = -1;
+
+	if (tas5756m->hybridflow == HYBRIDFLOW_3) {
+		switch (feature) {
+		case TAS5756_REG_ADD_DELAY:
+			reg = PAGE_NR(50) + 72;
+			break;
+		case TAS5756_REG_CHAN_MIXER_HIGH:
+			reg = PAGE_NR(50) + 92;
+			break;
+		case TAS5756_REG_CHAN_MIXER_LOW:
+			reg = PAGE_NR(50) + 112;
+			break;
+		case TAS5756_REG_FILTER_HIGH_BIQUAD_1:
+			reg = PAGE_NR(46) + 56;
+			break;
+		case TAS5756_REG_FILTER_HIGH_BIQUAD_2:
+			reg = PAGE_NR(46) + 76;
+			break;
+		case TAS5756_REG_FILTER_HIGH_BIQUAD_3:
+			reg = PAGE_NR(46) + 96;
+			break;
+		case TAS5756_REG_FILTER_HIGH_BIQUAD_4:
+			reg = PAGE_NR(46) + 116;
+			break;
+		case TAS5756_REG_FILTER_HIGH_BIQUAD_5:
+			reg = PAGE_NR(47) + 16;
+			break;
+		case TAS5756_REG_FILTER_LOW_BIQUAD_1:
+			reg = PAGE_NR(45) + 60;
+			break;
+		case TAS5756_REG_FILTER_LOW_BIQUAD_2:
+			reg = PAGE_NR(45) + 80;
+			break;
+		case TAS5756_REG_FILTER_LOW_BIQUAD_3:
+			reg = PAGE_NR(45) + 100;
+			break;
+		case TAS5756_REG_FILTER_LOW_BIQUAD_4:
+			reg = PAGE_NR(45) + 120;
+			break;
+		case TAS5756_REG_FILTER_LOW_BIQUAD_5:
+			reg = PAGE_NR(46) + 20;
+			break;
+		case TAS5756_REG_DBE_EQ_HIGH_BIQUAD_1:
+			reg = PAGE_NR(47) + 80;
+			break;
+		case TAS5756_REG_DBE_EQ_HIGH_BIQUAD_2:
+			reg = PAGE_NR(47) + 100;
+			break;
+		case TAS5756_REG_DBE_EQ_LOW_BIQUAD_1:
+			reg = PAGE_NR(51) + 16;
+			break;
+		case TAS5756_REG_DBE_EQ_LOW_BIQUAD_2:
+			reg = PAGE_NR(51) + 36;
+			break;
+		case TAS5756_REG_DBE_EQ_LOW_BIQUAD_3:
+			reg = PAGE_NR(51) + 56;
+			break;
+		case TAS5756M_REG_DBE_MIXING_HIGH:
+			reg = PAGE_NR(46) + 44;
+			break;
+		case TAS5756M_REG_DBE_MIXING_LOW:
+			reg = PAGE_NR(46) + 48;
+			break;
+		case TAS5756M_REG_DBE_SENSING_HIGH:
+			reg = PAGE_NR(47) + 60;
+			break;
+		case TAS5756M_REG_DBE_SENSING_LOW:
+			reg = PAGE_NR(47) + 40;
+			break;
+		case TAS5756M_REG_DBE_WINDOW:
+			reg = PAGE_NR(46) + 52;
+			break;
+		case TAS5756M_REG_PBE_BYPASS:
+			reg = PAGE_NR(51) + 76;
+			break;
+		case TAS5756M_REG_PBE_HARMONIC:
+			reg = PAGE_NR(44) + 16;
+			break;
+		case TAS5756M_REG_PBE_EFFECT:
+		case TAS5756M_REG_PBE_HPF:
+			reg = PAGE_NR(44) + 20;
+			break;
+		default:
+			reg = -1;
+			break;
+		}
+	} else if (tas5756m->hybridflow == HYBRIDFLOW_4) {
+		switch (feature) {
+		case TAS5756_REG_CHAN_MIXER:
+		case TAS5756_REG_CHAN_MIXER_HIGH:
+		case TAS5756_REG_CHAN_MIXER_LOW:
+			reg = PAGE_NR(51) + 28;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_PRE_DBE_1:
+			reg = PAGE_NR(51) + 48;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_PRE_DBE_2:
+			reg = PAGE_NR(51) + 68;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_PRE_DBE_3:
+			reg = PAGE_NR(51) + 88;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_POST_DBE_1:
+			reg = PAGE_NR(46) + 108;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_POST_DBE_2:
+			reg = PAGE_NR(47) + 8;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_POST_DBE_3:
+			reg = PAGE_NR(47) + 28;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_POST_DBE_4:
+			reg = PAGE_NR(47) + 48;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_POST_DBE_5:
+			reg = PAGE_NR(47) + 68;
+			break;
+		case TAS5756_REG_DBE_EQ_HIGH_BIQUAD_1:
+			reg = PAGE_NR(46) + 16;
+			break;
+		case TAS5756_REG_DBE_EQ_HIGH_BIQUAD_2:
+			reg = PAGE_NR(46) + 36;
+			break;
+		case TAS5756_REG_DBE_EQ_HIGH_BIQUAD_3:
+			reg = PAGE_NR(46) + 56;
+			break;
+		case TAS5756_REG_DBE_EQ_HIGH_BIQUAD_4:
+			reg = PAGE_NR(46) + 76;
+			break;
+		case TAS5756_REG_DBE_EQ_LOW_BIQUAD_1:
+			reg = PAGE_NR(50) + 52;
+			break;
+		case TAS5756_REG_DBE_EQ_LOW_BIQUAD_2:
+			reg = PAGE_NR(50) + 72;
+			break;
+		case TAS5756_REG_DBE_EQ_LOW_BIQUAD_3:
+			reg = PAGE_NR(50) + 92;
+			break;
+		case TAS5756_REG_DBE_EQ_LOW_BIQUAD_4:
+			reg = PAGE_NR(50) + 112;
+			break;
+		case TAS5756M_REG_DBE_MIXING_HIGH:
+			reg = PAGE_NR(46) + 100;
+			break;
+		case TAS5756M_REG_DBE_MIXING_LOW:
+			reg = PAGE_NR(46) + 96;
+			break;
+		case TAS5756M_REG_DBE_SENSING_HIGH:
+			reg = PAGE_NR(45) + 8;
+			break;
+		case TAS5756M_REG_DBE_SENSING_LOW:
+			reg = PAGE_NR(44) + 108;
+			break;
+		case TAS5756M_REG_DBE_WINDOW:
+			reg = PAGE_NR(46) + 104;
+			break;
+		case TAS5756M_REG_PBE_BYPASS:
+			reg = PAGE_NR(51) + 108;
+			break;
+		case TAS5756M_REG_PBE_HARMONIC:
+			reg = PAGE_NR(45) + 28;
+			break;
+		case TAS5756M_REG_PBE_EFFECT:
+		case TAS5756M_REG_PBE_HPF:
+			reg = PAGE_NR(45) + 32;
+			break;
+		default:
+			reg = -1;
+			break;
+		}
+	} else if (tas5756m->hybridflow == HYBRIDFLOW_6) {
+		switch (feature) {
+		case TAS5756_REG_FILTER_BIQUAD_1:
+			reg = PAGE_NR(47) + 32;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_2:
+			reg = PAGE_NR(47) + 52;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_3:
+			reg = PAGE_NR(47) + 72;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_4:
+			reg = PAGE_NR(47) + 92;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_5:
+			reg = PAGE_NR(47) + 112;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_6:
+			reg = PAGE_NR(48) + 12;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_7:
+			reg = PAGE_NR(48) + 32;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_8:
+			reg = PAGE_NR(48) + 52;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_9:
+			reg = PAGE_NR(48) + 72;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_10:
+			reg = PAGE_NR(48) + 92;
+			break;
+		case TAS5756_REG_DBE_EQ_HIGH_BIQUAD_1:
+			reg = PAGE_NR(45) + 32;
+			break;
+		case TAS5756_REG_DBE_EQ_HIGH_BIQUAD_2:
+			reg = PAGE_NR(45) + 52;
+			break;
+		case TAS5756_REG_DBE_EQ_HIGH_BIQUAD_3:
+			reg = PAGE_NR(45) + 72;
+			break;
+		case TAS5756_REG_DBE_EQ_LOW_BIQUAD_1:
+			reg = PAGE_NR(46) + 16;
+			break;
+		case TAS5756_REG_DBE_EQ_LOW_BIQUAD_2:
+			reg = PAGE_NR(46) + 36;
+			break;
+		case TAS5756_REG_DBE_EQ_LOW_BIQUAD_3:
+			reg = PAGE_NR(46) + 56;
+			break;
+		case TAS5756_REG_DBE_EQ_LOW_BIQUAD_4:
+			reg = PAGE_NR(46) + 76;
+			break;
+		case TAS5756_REG_DBE_EQ_LOW_BIQUAD_5:
+			reg = PAGE_NR(46) + 96;
+			break;
+		case TAS5756M_REG_DBE_MIXING_HIGH:
+			reg = PAGE_NR(44) + 100;
+			break;
+		case TAS5756M_REG_DBE_MIXING_LOW:
+			reg = PAGE_NR(44) + 96;
+			break;
+		case TAS5756M_REG_DBE_SENSING_HIGH:
+		case TAS5756M_REG_DBE_SENSING_LOW:
+			reg = PAGE_NR(44) + 108;
+			break;
+		case TAS5756M_REG_DBE_WINDOW:
+			reg = PAGE_NR(44) + 104;
+			break;
+		default:
+			reg = -1;
+			break;
+		}
+	} else if (tas5756m->hybridflow == HYBRIDFLOW_7) {
+		switch (feature) {
+		case TAS5756_REG_FILTER_BIQUAD_1:
+			reg = PAGE_NR(45) + 48;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_2:
+			reg = PAGE_NR(45) + 76;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_3:
+			reg = PAGE_NR(45) + 96;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_4:
+			reg = PAGE_NR(45) + 116;
+			break;
+		case TAS5756_REG_FILTER_BIQUAD_5:
+			reg = PAGE_NR(46) + 16;
+			break;
+		default:
+			reg = -1;
+			break;
+		}
+	}
+
+	return CRAM_BUFFER_OFFSET(reg);
+}
+
+static int tas5756m_get_nb_coef(struct tas5756m_data *tas5756m,
+				enum hybridflow_features feature)
+{
+	int nb_coefs;
+
+	switch (feature) {
+	case TAS5756_REG_FILTER_BIQUAD_1:
+	case TAS5756_REG_FILTER_BIQUAD_2:
+	case TAS5756_REG_FILTER_BIQUAD_3:
+	case TAS5756_REG_FILTER_BIQUAD_4:
+	case TAS5756_REG_FILTER_BIQUAD_5:
+	case TAS5756_REG_FILTER_BIQUAD_6:
+	case TAS5756_REG_FILTER_BIQUAD_7:
+	case TAS5756_REG_FILTER_BIQUAD_8:
+	case TAS5756_REG_FILTER_BIQUAD_9:
+	case TAS5756_REG_FILTER_BIQUAD_10:
+
+	case TAS5756_REG_FILTER_BIQUAD_PRE_DBE_1:
+	case TAS5756_REG_FILTER_BIQUAD_PRE_DBE_2:
+	case TAS5756_REG_FILTER_BIQUAD_PRE_DBE_3:
+
+	case TAS5756_REG_FILTER_BIQUAD_POST_DBE_1:
+	case TAS5756_REG_FILTER_BIQUAD_POST_DBE_2:
+	case TAS5756_REG_FILTER_BIQUAD_POST_DBE_3:
+	case TAS5756_REG_FILTER_BIQUAD_POST_DBE_4:
+	case TAS5756_REG_FILTER_BIQUAD_POST_DBE_5:
+
+	case TAS5756_REG_FILTER_HIGH_BIQUAD_1:
+	case TAS5756_REG_FILTER_HIGH_BIQUAD_2:
+	case TAS5756_REG_FILTER_HIGH_BIQUAD_3:
+	case TAS5756_REG_FILTER_HIGH_BIQUAD_4:
+	case TAS5756_REG_FILTER_HIGH_BIQUAD_5:
+
+	case TAS5756_REG_FILTER_LOW_BIQUAD_1:
+	case TAS5756_REG_FILTER_LOW_BIQUAD_2:
+	case TAS5756_REG_FILTER_LOW_BIQUAD_3:
+	case TAS5756_REG_FILTER_LOW_BIQUAD_4:
+	case TAS5756_REG_FILTER_LOW_BIQUAD_5:
+
+	case TAS5756_REG_DBE_EQ_HIGH_BIQUAD_1:
+	case TAS5756_REG_DBE_EQ_HIGH_BIQUAD_2:
+	case TAS5756_REG_DBE_EQ_HIGH_BIQUAD_3:
+	case TAS5756_REG_DBE_EQ_HIGH_BIQUAD_4:
+	case TAS5756_REG_DBE_EQ_HIGH_BIQUAD_5:
+
+	case TAS5756_REG_DBE_EQ_LOW_BIQUAD_1:
+	case TAS5756_REG_DBE_EQ_LOW_BIQUAD_2:
+	case TAS5756_REG_DBE_EQ_LOW_BIQUAD_3:
+	case TAS5756_REG_DBE_EQ_LOW_BIQUAD_4:
+	case TAS5756_REG_DBE_EQ_LOW_BIQUAD_5:
+
+	case TAS5756M_REG_DBE_SENSING_HIGH:
+	case TAS5756M_REG_DBE_SENSING_LOW:
+		nb_coefs = CRAM_BIQUAD_NB_COEF;
+		break;
+
+	case TAS5756_REG_CHAN_MIXER:
+	case TAS5756_REG_CHAN_MIXER_HIGH:
+	case TAS5756_REG_CHAN_MIXER_LOW:
+	case TAS5756M_REG_PBE_BYPASS:
+		nb_coefs = 2;
+		break;
+
+	case TAS5756M_REG_PBE_EFFECT:
+	case TAS5756M_REG_PBE_HPF:
+		nb_coefs = CRAM_HPF_EFFECT_NB_COEF;
+		break;
+
+	case TAS5756_REG_ADD_DELAY:
+		nb_coefs = DELAY_SAMPLES_MAX;
+		break;
+
+	case TAS5756M_REG_DBE_WINDOW:
+	case TAS5756M_REG_DBE_MIXING_HIGH:
+	case TAS5756M_REG_DBE_MIXING_LOW:
+	case TAS5756M_REG_PBE_HARMONIC:
+	default:
+		nb_coefs = 1;
+		break;
+	}
+
+	return nb_coefs;
+}
+
+static int tas5756m_get_coef(struct tas5756m_data *tas5756m,
+			     enum hybridflow_features feature)
+{
+	int reg = tas5756m_get_coef_reg_offset(tas5756m, feature);
+	int page_offset = ADDR_TO_PAGE_NR(reg);
+	int reg_offset = (reg & PAGE_ADDRESS_MASK) - CRAM_BUFFER_PAGE_OFFSET;
+
+	if (reg < 0)
+		return -EINVAL;
+
+	return page_offset * CRAM_NB_COEF_PER_PAGE +
+	    reg_offset / CRAM_COEF_NB_REGS;
+}
+
+static int tas5756m_enable_adaptive_mode(struct tas5756m_data *tas5756m,
+					 bool enable)
+{
+	struct device *dev = &tas5756m->tas5756m_client->dev;
+	int mask = CRAM_BUFFER_CRAM_ADAP_MODE_MASK;
+	int value = (enable ? 1 : 0) << 2;
+	int ret;
+
+	ret =
+	    regmap_update_bits(tas5756m->regmap, CRAM_BUFFER_SWITCH_REG, mask,
+			       value);
+	if (ret < 0)
+		dev_err(dev, "failed to enable adaptive mode: %d\n", ret);
+
+	return ret;
+}
+
+static bool tas5756m_adaptive_mode_is_enabled(struct tas5756m_data *tas5756m)
+{
+	struct device *dev = &tas5756m->tas5756m_client->dev;
+	int ret;
+	bool enabled = false;
+	int value;
+
+	ret = regmap_read(tas5756m->regmap, CRAM_BUFFER_SWITCH_REG, &value);
+	if (ret < 0)
+		dev_err(dev, "failed to read adaptive mode value: %d\n", ret);
+	else
+		enabled =
+		    value & CRAM_BUFFER_CRAM_ADAP_MODE_MASK ? true : false;
+
+	return enabled;
+}
+
+static enum cram_buffer tas5756m_get_current_cram_buffer(struct tas5756m_data
+							 *tas5756m)
+{
+	struct device *dev = &tas5756m->tas5756m_client->dev;
+	enum cram_buffer buffer = CRAM_BUFFER_A;
+	int ret, used_buffer;
+	int mask = CRAM_BUFFER_CRAM_BUFFER_USED_NON_ADAPT_MASK;
+
+	ret =
+	    regmap_read(tas5756m->regmap, CRAM_BUFFER_SWITCH_REG, &used_buffer);
+	if (ret < 0) {
+		dev_err(dev,
+			"failed to read which buffer is currently used: %d\n",
+			ret);
+		return buffer;
+	}
+
+	if (tas5756m_adaptive_mode_is_enabled(tas5756m))
+		mask = CRAM_BUFFER_CRAM_BUFFER_USED_MASK;
+
+	if ((used_buffer & mask) == 0)
+		buffer = CRAM_BUFFER_A;
+	else
+		buffer = CRAM_BUFFER_B;
+
+	return buffer;
+}
+
+static int tas5756m_cram_to_virt_buffer(struct tas5756m_data *tas5756m,
+					enum cram_buffer src)
+{
+	struct regmap *regmap = tas5756m->regmap;
+	struct device *dev = &tas5756m->tas5756m_client->dev;
+	const int SRC_PAGE =
+	    src ==
+	    CRAM_BUFFER_A ? CRAM_FIRST_PAGE : CRAM_FIRST_PAGE_SECOND_BANK;
+	const int NB_PAGES = CRAM_BUFFER_NB_PAGES;
+	const int OFFSET = CRAM_BUFFER_PAGE_OFFSET;
+	int i, ret;
+
+	for (i = 0; i < NB_PAGES; i++) {
+		ret = regmap_bulk_read(regmap, PAGE_NR(SRC_PAGE + i) + OFFSET,
+				       tas5756m->cram_buffer +
+				       CRAM_NB_COEF_PER_PAGE * i,
+				       CRAM_REGS_PER_PAGES);
+		if (ret < 0) {
+			dev_err(dev,
+				"failed to copy from CRAM page %d registers to virtual buffer: %d\n",
+				SRC_PAGE + i, ret);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+static int tas5756m_virt_buffer_to_cram(struct tas5756m_data *tas5756m,
+					enum cram_buffer src)
+{
+	struct regmap *regmap = tas5756m->regmap;
+	struct device *dev = &tas5756m->tas5756m_client->dev;
+	const int SRC_PAGE =
+	    src ==
+	    CRAM_BUFFER_A ? CRAM_FIRST_PAGE : CRAM_FIRST_PAGE_SECOND_BANK;
+	const int NB_PAGES = CRAM_BUFFER_NB_PAGES;
+	const int OFFSET = CRAM_BUFFER_PAGE_OFFSET;
+	int i, ret;
+
+	for (i = 0; i < NB_PAGES; i++) {
+		ret = regmap_bulk_write(regmap, PAGE_NR(SRC_PAGE + i) + OFFSET,
+					tas5756m->cram_buffer +
+					CRAM_NB_COEF_PER_PAGE * i,
+					CRAM_REGS_PER_PAGES);
+		if (ret < 0) {
+			dev_err(dev,
+				"failed to copy from virt buffer to CRAM page %d registers: %d\n",
+				SRC_PAGE + i, ret);
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
+static int tas5756m_info_cram_buffer(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1;
+
+	return 0;
+}
+
+static int tas5756m_get_current_buffer(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = tas5756m->buffer;
+	return 0;
+}
+
+static int tas5756m_apply_config(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+	struct device *dev = &tas5756m->tas5756m_client->dev;
+
+	const int MAX_TRY_CHECK_STATUS = 10;
+	int ret = 0, try = 0;
+	unsigned int switch_status = 1;
+
+	/* Without adaptive mode, the chip must be suspended
+	 * before writing CRAM buffer then enable it again.
+	 */
+	if (!tas5756m_adaptive_mode_is_enabled(tas5756m)) {
+		tas5756m_shutdown(tas5756m);
+		tas5756m_virt_buffer_to_cram(tas5756m, tas5756m->buffer);
+		tas5756m_resume(tas5756m);
+	} else {
+		tas5756m_virt_buffer_to_cram(tas5756m, CRAM_BUFFER_A);
+		tas5756m_virt_buffer_to_cram(tas5756m, CRAM_BUFFER_B);
+
+		ret =
+		    regmap_update_bits(tas5756m->regmap, CRAM_BUFFER_SWITCH_REG,
+				       CRAM_BUFFER_SWITCH_MASK, switch_status);
+		if (ret < 0) {
+			dev_err(dev,
+				"failed to write CRAM switch register: %d\n",
+				ret);
+			return ret;
+		}
+
+		/* CRAM switching is done on next audio frame.
+		 * When the chip is running,
+		 * the driver is able to check if the operation succeed.
+		 * Otherwise, this checking step is skipped.
+		 */
+		if (tas5756m_is_running(tas5756m)) {
+			while (switch_status && try < MAX_TRY_CHECK_STATUS) {
+				ret =
+				    regmap_read(tas5756m->regmap,
+						CRAM_BUFFER_SWITCH_REG,
+						&switch_status);
+				if (ret < 0) {
+					dev_err(dev,
+						"failed to read CRAM switch register: %d\n",
+						ret);
+					return ret;
+				}
+
+				switch_status &= CRAM_BUFFER_SWITCH_MASK;
+				try++;
+				usleep_range(100, 200);
+			}
+
+			if (switch_status) {
+				dev_err(dev,
+					"failed to switch CRAM: %d tries.\n",
+					try);
+				return ret;
+			}
+		}
+	}
+
+	tas5756m->buffer = tas5756m_get_current_cram_buffer(tas5756m);
+	return ret;
+}
+
+static int tas5756m_coef_get(struct tas5756m_data *tas5756m, int coef,
+			     long *val)
+{
+	if (coef < 0 || coef >= CRAM_BUFFER_SIZE)
+		return -EINVAL;
+
+	*val = be32_to_cpu(tas5756m->cram_buffer[coef]) >> 8;
+	return 0;
+}
+
+static int tas5756m_coef_set(struct tas5756m_data *tas5756m, int coef, long val)
+{
+	if (coef < 0 || coef >= CRAM_BUFFER_SIZE)
+		return -EINVAL;
+
+	tas5756m->cram_buffer[coef] = cpu_to_be32(val << 8);
+	return 0;
+}
+
+static int tas5756m_coef_set_mask(struct tas5756m_data *tas5756m, size_t coef,
+				  int mask, long val)
+{
+	long old_val;
+	int ret;
+
+	ret = tas5756m_coef_get(tas5756m, coef, &old_val);
+	if (ret < 0)
+		return ret;
+
+	return tas5756m_coef_set(tas5756m, coef,
+				 (val & mask) | (old_val & ~mask));
+}
+
+/*
+ * Integer array controls for setting biquad, mixer, DRC coefficients.
+ * According to the datasheet each coefficient is effectively 24 bits,
+ * i.e. stored as 32bits, where bits [31:24] are ignored.
+ * TI's TAS57xx Graphical Development Environment tool however produces
+ * coefficients with more than 24 bits. For this reason we allow values
+ * in the full 32-bits reange.
+ * The coefficients are ordered as given in the TAS575x data sheet:
+ * b0, b1, b2, a1, a2.
+ * To compute valid values:
+ *	http://www.ti.com/lit/an/slaa447/slaa447.pdf
+ * In this document, Peak EQ is miscomputed:
+ *	https://e2e.ti.com/support/audio/f/6/p/656270/2415402
+ */
+static int tas5756m_coefficient_info(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_info *uinfo)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	int nb_coefs = tas5756m_get_nb_coef(tas5756m, kcontrol->private_value);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = nb_coefs;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 0x00ffffff;
+
+	return 0;
+}
+
+static int tas5756m_coefficient_get(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	int coef = tas5756m_get_coef(tas5756m, kcontrol->private_value);
+	int nb_coefs = tas5756m_get_nb_coef(tas5756m, kcontrol->private_value);
+	int i, ret;
+
+	for (i = 0; i < nb_coefs; i++) {
+		ret = tas5756m_coef_get(tas5756m, coef + i,
+					&(ucontrol->value.integer.value[i]));
+		if (ret < 0)
+			return ret;
+	}
+
+	return i;
+}
+
+static int tas5756m_coefficient_put(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	int coef = tas5756m_get_coef(tas5756m, kcontrol->private_value);
+	int nb_coefs = tas5756m_get_nb_coef(tas5756m, kcontrol->private_value);
+	int i, ret;
+
+	for (i = 0; i < nb_coefs; i++) {
+		ret = tas5756m_coef_set(tas5756m, coef + i,
+					ucontrol->value.integer.value[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return i;
+}
+
+#define CRAM_COEFS(xname, feature) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
+	.info = tas5756m_coefficient_info, \
+	.get = tas5756m_coefficient_get,\
+	.put = tas5756m_coefficient_put, \
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.private_value = feature \
+}
+
+const char *mixer_mode_text[] = {
+	"Right",
+	"Left",
+	"Mono",
+};
+
+static int tas5756m_channel_mixer_info(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_info *uinfo)
+{
+	return snd_ctl_enum_info(uinfo, 1, CHANNEL_MIXER_MAX, mixer_mode_text);
+}
+
+static int tas5756m_channel_mixer_get(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.enumerated.item[0] = tas5756m->channel;
+	return 1;
+}
+
+static int tas5756m_channel_mixer_put(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	const int default_gain_one = 0x7FFFFF, default_gain_both = 0x400000;
+	long gains[2];
+	int coef = tas5756m_get_coef(tas5756m, kcontrol->private_value);
+	int nb_coefs = tas5756m_get_nb_coef(tas5756m, kcontrol->private_value);
+	int i, ret;
+
+	switch (ucontrol->value.enumerated.item[0]) {
+	case CHANNEL_MIXER_MONO:
+		gains[0] = default_gain_both;
+		gains[1] = default_gain_both;
+		break;
+	case CHANNEL_MIXER_LEFT:
+		gains[0] = default_gain_one;
+		gains[1] = 0;
+		break;
+	case CHANNEL_MIXER_RIGHT:
+		gains[0] = 0;
+		gains[1] = default_gain_one;
+		break;
+	default:
+		gains[0] = 0;
+		gains[1] = 0;
+		break;
+	}
+
+	tas5756m_route_channels(tas5756m, ucontrol->value.enumerated.item[0]);
+
+	for (i = 0; i < nb_coefs; i++) {
+		ret = tas5756m_coef_set_mask(tas5756m, coef + i,
+					     MIXER_GAIN_MASK_MASK, gains[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 1;
+}
+
+#define CHANNEL_MIXER_COEFS(xname, feature) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
+	.info = tas5756m_channel_mixer_info, \
+	.get = tas5756m_channel_mixer_get,\
+	.put = tas5756m_channel_mixer_put, \
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.private_value = feature \
+}
+
+static int tas5756m_channel_phase_info(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_info *uinfo)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	int nb_coefs = tas5756m_get_nb_coef(tas5756m, kcontrol->private_value);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = nb_coefs;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1;
+
+	return 0;
+}
+
+static int tas5756m_channel_phase_get(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	long phases[2];
+	int coef = tas5756m_get_coef(tas5756m, kcontrol->private_value);
+	int nb_coefs = tas5756m_get_nb_coef(tas5756m, kcontrol->private_value);
+	int i, ret;
+
+	for (i = 0; i < nb_coefs; i++) {
+		ret = tas5756m_coef_get(tas5756m, coef + i, &(phases[i]));
+		if (ret < 0)
+			return ret;
+
+		phases[i] = phases[i] & MIXER_PHASE_INVERSION_MASK;
+	}
+
+	if (phases[0] || phases[1])
+		ucontrol->value.integer.value[0] = PHASE_INVERSION;
+	else
+		ucontrol->value.integer.value[0] = PHASE_NO_INVERSION;
+
+	return 1;
+}
+
+static int tas5756m_channel_phase_put(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	int phase =
+	    ucontrol->value.integer.value[0] ==
+	    1 ? MIXER_PHASE_INVERSION_MASK : 0;
+	int coef = tas5756m_get_coef(tas5756m, kcontrol->private_value);
+	int nb_coefs = tas5756m_get_nb_coef(tas5756m, kcontrol->private_value);
+	int i, ret;
+
+	for (i = 0; i < nb_coefs; i++) {
+		ret = tas5756m_coef_set_mask(tas5756m, coef + i,
+					     MIXER_PHASE_INVERSION_MASK, phase);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 1;
+}
+
+#define CHANNEL_PHASE_COEFS(xname, feature) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
+	.info = tas5756m_channel_phase_info, \
+	.get = tas5756m_channel_phase_get,\
+	.put = tas5756m_channel_phase_put, \
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.private_value = feature \
+}
+
+static int tas5756m_bypass_coef_info(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_info *uinfo)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	int nb_coefs = tas5756m_get_nb_coef(tas5756m, kcontrol->private_value);
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = nb_coefs;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1;
+
+	return 0;
+}
+
+static int tas5756m_bypass_coef_get(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	int coef = tas5756m_get_coef(tas5756m, kcontrol->private_value);
+	int nb_coefs = tas5756m_get_nb_coef(tas5756m, kcontrol->private_value);
+	long value[2];
+	int i, ret;
+
+	for (i = 0; i < nb_coefs; i++) {
+		ret = tas5756m_coef_get(tas5756m, coef + i, &value[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (value[0] == 0 && value[1] == COEF_ENABLE_FEATURE_VALUE)
+		ucontrol->value.integer.value[0] = 1;
+	else
+		ucontrol->value.integer.value[0] = 0;
+
+	return 1;
+}
+
+static int tas5756m_bypass_coef_put(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	int coef = tas5756m_get_coef(tas5756m, kcontrol->private_value);
+	int nb_coefs = tas5756m_get_nb_coef(tas5756m, kcontrol->private_value);
+	long value[2];
+	int i, ret;
+
+	if (ucontrol->value.integer.value[0] == 1) {
+		value[0] = 0;
+		value[1] = COEF_ENABLE_FEATURE_VALUE;
+	} else {
+		value[0] = COEF_ENABLE_FEATURE_VALUE;
+		value[1] = 0;
+	}
+
+	for (i = 0; i < nb_coefs; i++) {
+		ret = tas5756m_coef_set(tas5756m, coef + i, value[i]);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 1;
+}
+
+#define BYPASS_COEFS(xname, feature) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
+	.info = tas5756m_bypass_coef_info, \
+	.get = tas5756m_bypass_coef_get,\
+	.put = tas5756m_bypass_coef_put, \
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.private_value = feature \
+}
+
+const char *delay_samples_text[] = {
+	"0",
+	"4",
+	"8",
+	"12",
+	"16",
+};
+
+static int tas5756m_delay_samples_info(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_info *uinfo)
+{
+	return snd_ctl_enum_info(uinfo, 1, DELAY_SAMPLES_MAX,
+				 delay_samples_text);
+}
+
+static int tas5756m_delay_samples_get(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	int coef = tas5756m_get_coef(tas5756m, kcontrol->private_value);
+	int nb_coefs = tas5756m_get_nb_coef(tas5756m, kcontrol->private_value);
+	long value;
+	enum delay_samples delay = DELAY_SAMPLES_0;
+	int i, ret;
+
+	for (i = 0; i < nb_coefs; i++) {
+		ret = tas5756m_coef_get(tas5756m, coef + i, &value);
+		if (ret < 0)
+			return ret;
+
+		if (value != 0)
+			delay = DELAY_SAMPLES_MAX - i - 1;
+	}
+
+	ucontrol->value.enumerated.item[0] = delay;
+	return 1;
+}
+
+static int tas5756m_delay_samples_put(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+	    snd_soc_kcontrol_component(kcontrol);
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	const int default_value = 0x7FFFFF;
+	int coef = tas5756m_get_coef(tas5756m, kcontrol->private_value);
+	int nb_coefs = tas5756m_get_nb_coef(tas5756m, kcontrol->private_value);
+	int coef_index, value;
+	int i, ret;
+
+	coef_index = nb_coefs - ucontrol->value.enumerated.item[0] - 1;
+
+	for (i = 0; i < nb_coefs; i++) {
+		value = coef_index == i ? default_value : 0;
+		ret = tas5756m_coef_set(tas5756m, coef + i, value);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 1;
+}
+
+#define DELAY_SAMPLES_COEFS(xname, feature) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
+	.info = tas5756m_delay_samples_info, \
+	.get = tas5756m_delay_samples_get,\
+	.put = tas5756m_delay_samples_put, \
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.private_value = feature \
+}
+
+#define APPLY_CONFIG \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, \
+		.name = "Apply config", \
+		.put = tas5756m_apply_config, \
+		.get = tas5756m_get_current_buffer, \
+		.info = tas5756m_info_cram_buffer, \
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+}
+
+static const char *const tas5756m_supply_names[] = {
+	"dvdd",		/* Digital power supply. Connect to 3.3-V supply. */
+	"pvdd",		/* Class-D amp and analog power supply (connected). */
+};
+
+static int tas5756m_hw_params(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params,
+			      struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	u16 iface_reg;
+	int ret;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		switch (params_rate(params)) {
+		case 8000:
+		case 11025:
+		case 16000:
+		case 22050:
+		case 32000:
+		case 44100:
+		case 48000:
+		case 96000:
+			dev_info(component->dev, "sample rate: %u\n",
+				 params_rate(params));
+			break;
+
+		default:
+			dev_err(component->dev, "invalid sample rate: %u\n",
+				params_rate(params));
+			return -EINVAL;
+		}
+
+		switch (params_width(params)) {
+		case 16:
+			iface_reg = RES_16BIT;
+			break;
+		case 20:
+			iface_reg = RES_20BIT;
+			break;
+		case 24:
+			iface_reg = RES_24BIT;
+			break;
+		case 32:
+		default:
+			iface_reg = RES_32BIT;
+			break;
+		}
+
+		dev_info(component->dev, "bit depth: %u\n",
+			 params_width(params));
+
+		ret =
+		    snd_soc_component_write(component, TAS5756M_I2S_CONFIG,
+					    iface_reg);
+		if (ret < 0) {
+			dev_err(component->dev, "error setting width: %d\n",
+				ret);
+			return ret;
+		}
+
+	}
+
+	return 0;
+}
+
+static int tas5756m_pcm_prepare(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	int ret = 0;
+	int val;
+	unsigned int rate = substream->runtime->rate;	/* rate in Hz */
+	unsigned int channels = substream->runtime->channels;
+	unsigned int frame_bits = substream->runtime->frame_bits;
+
+	dev_info(component->dev,
+		 "runtime data: sample rate: %u - channels: %u - bitrate: %u\n",
+		 rate, channels, frame_bits);
+
+	ret = snd_soc_component_read(component, TAS5756M_PDN_STBY, &val);
+	if (!ret) {
+		val &= PDN_STBY_MASK;
+		if (val) {
+			dev_info(component->dev,
+				 "activating codec - PDN/STBY: %u\n", val);
+			ret =
+			    snd_soc_component_write(component,
+						    TAS5756M_PDN_STBY, 0x00);
+		}
+	}
+
+	return ret;
+}
+
+static void tas5756m_shutdown_dai(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas5756m_data *tas5756m_data =
+	    snd_soc_component_get_drvdata(component);
+
+	tas5756m_shutdown(tas5756m_data);
+}
+
+static void tas5756m_fault_check_work(struct work_struct *work)
+{
+	struct tas5756m_data *tas5756m =
+	    container_of(work, struct tas5756m_data, fault_check_work.work);
+	struct i2c_client *tas5756m_client = tas5756m->tas5756m_client;
+	struct device *dev = &tas5756m_client->dev;
+
+	unsigned int curr_fault;
+	int ret;
+
+	ret = regmap_read(tas5756m->regmap, TAS5756M_SHORT_DETECT, &curr_fault);
+	if (ret < 0) {
+		dev_err(dev, "failed to read FAULT register: %d\n", ret);
+		goto out;
+	}
+
+	/* Check / handle all errors except SAIF clock errors */
+	curr_fault &= (SHORT_BUSY_MASK | SHORT_MASK);
+
+	/* Only flag errors once for a given occurrence. This is needed as
+	 * the TAS5756M will take time clearing the fault condition internally
+	 * during which we don't want to bombard the system with the same
+	 * error message over and over.
+	 */
+	if (curr_fault && !tas5756m->last_fault)
+		dev_crit(dev, "error: short detected\n");
+
+	/* Store current fault value so we can detect any changes next time */
+	tas5756m->last_fault = curr_fault;
+
+out:
+	schedule_delayed_work(&tas5756m->fault_check_work,
+			      msecs_to_jiffies(TAS5756M_FAULT_CHECK_INTERVAL));
+}
+
+static int tas5756m_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	u16 iface_reg;
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	tas5756m->fmt = fmt;
+
+	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) != SND_SOC_DAIFMT_CBS_CFS) {
+		dev_info(component->dev, "master mode not supported\n");
+		return -EINVAL;
+	}
+
+	/* Interface format. Always normal I²S.
+	 * Also assumed when setting resolution (bits).
+	 */
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case (SND_SOC_DAIFMT_RIGHT_J | SND_SOC_DAIFMT_NB_NF):
+		iface_reg = FMT_RTJ;
+		dev_info(component->dev, "fmt: rightj\n");
+		break;
+	case (SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_NB_NF):
+	case (SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_NB_NF):
+		dev_info(component->dev, "fmt: leftj\n");
+		iface_reg = FMT_LTJ;
+		break;
+	default:
+	case (SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF):
+	case (SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF):
+		dev_info(component->dev, "fmt: i2s / dsp_a\n");
+		iface_reg = FMT_I2S;
+		break;
+	}
+
+	return snd_soc_component_write(component, TAS5756M_I2S_CONFIG,
+				       (iface_reg << 4));
+}
+
+static int tas5756m_mute(struct snd_soc_dai *dai, int mute)
+{
+	struct snd_soc_component *component = dai->component;
+	int ret;
+	int reg;
+
+	ret = snd_soc_component_read(component, TAS5756M_MUTE_L_R, &reg);
+	if (ret) {
+		dev_err(component->dev, "unable to read mute status: %d\n",
+			ret);
+		return ret;
+	}
+
+	if (mute) {
+		dev_info(component->dev, "mute requested\n");
+		reg |= MUTE_ALL_MASK;
+	} else {
+		dev_info(component->dev, "unmute requested\n");
+		reg &= ~(MUTE_ALL_MASK);
+	}
+
+	return snd_soc_component_write(component, TAS5756M_MUTE_L_R,
+				       (reg & MUTE_ALL_MASK));
+}
+
+static int tas5756m_codec_probe(struct snd_soc_component *component)
+{
+	int ret;
+	unsigned int dac_power_state;
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	tas5756m->component = component;
+
+#ifdef CONFIG_OF
+	tas5756m->gpio_mute =
+	    of_get_named_gpio(component->dev->of_node, "mute-gpios", 0);
+#endif
+
+	/* Enable the amplifier */
+	if (gpio_is_valid(tas5756m->gpio_mute)) {
+		ret =
+		    gpio_request_one(tas5756m->gpio_mute, GPIOF_OUT_INIT_LOW,
+				     "TAS5756M mute GPIO");
+
+		if (ret < 0) {
+			dev_warn(component->dev,
+				 "failed to request mute gpio: %d\n", ret);
+		} else {
+			gpio_set_value(tas5756m->gpio_mute, 1);
+			dev_info(component->dev, "unmuted\n");
+		}
+	}
+
+	/* Set L / R volume to same value (are always differing on first boot
+	 * when there're no saved state and messes up the mixer element).
+	 */
+	ret =
+	    regmap_write(tas5756m->regmap, TAS5756M_RIGHT_DVOL,
+			 VOL_CH1_2_DEFAULT);
+	if (ret < 0)
+		dev_warn(component->dev, "failed to set volume: %d\n", ret);
+
+	ret =
+	    regmap_write(tas5756m->regmap, TAS5756M_LEFT_DVOL,
+			 VOL_CH1_2_DEFAULT);
+	if (ret < 0)
+		dev_warn(component->dev, "failed to set volume: %d\n", ret);
+
+	ret =
+	    regmap_update_bits(tas5756m->regmap, TAS5756M_DAC_PWR_STA,
+			       DAC_ENABLED_MASK, DAC_ENABLED_MASK);
+
+	dev_info(component->dev, "checking DAC booting register\n");
+	ret =
+	    regmap_read(tas5756m->regmap, TAS5756M_DAC_PWR_STA,
+			&dac_power_state);
+	if (ret < 0) {
+		dev_err(component->dev, "failed to read DAC power state: %d\n",
+			ret);
+		goto probe_fail;
+	}
+
+	if (!dac_power_state) {
+		dev_info(component->dev, "not ready. retrying..");
+
+		ret =
+		    regmap_read(tas5756m->regmap, TAS5756M_DAC_PWR_STA,
+				&dac_power_state);
+		if (ret < 0) {
+			dev_err(component->dev,
+				"failed to read DAC power state: %d\n", ret);
+			goto probe_fail;
+		}
+	}
+
+	/* Only D7 matters, lower nibble used for RO status */
+	dac_power_state &= 0x80;
+
+	if (dac_power_state) {
+		dev_info(component->dev, "DAC enabled\n");
+	} else {
+		dev_err(component->dev, "DAC disabled\n");
+		ret = -ENODEV;
+		goto probe_fail;
+	}
+
+	/* Set device to mute */
+	dev_info(component->dev, "muting TAS5756M\n");
+
+	ret =
+	    snd_soc_component_write(component, TAS5756M_MUTE_L_R,
+				    MUTE_ALL_MASK);
+	if (ret < 0) {
+		dev_info(component->dev, "failed to mute\n");
+		goto error_snd_soc_update_bits;
+	}
+
+	dev_info(component->dev, "entering standby mode\n");
+	ret = snd_soc_component_write(component, TAS5756M_PDN_STBY, STBY_MASK);
+	if (ret < 0)
+		goto error_snd_soc_update_bits;
+
+	INIT_DELAYED_WORK(&tas5756m->fault_check_work,
+			  tas5756m_fault_check_work);
+	return 0;
+
+error_snd_soc_update_bits:
+	dev_err(component->dev, "error configuring device registers: %d\n",
+		ret);
+
+probe_fail:
+	dev_err(component->dev, "probe failed\n");
+	regulator_bulk_disable(ARRAY_SIZE(tas5756m->supplies),
+			       tas5756m->supplies);
+	return ret;
+}
+
+static void tas5756m_codec_remove(struct snd_soc_component *component)
+{
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+	int ret;
+
+	cancel_delayed_work_sync(&tas5756m->fault_check_work);
+
+	ret =
+	    regulator_bulk_disable(ARRAY_SIZE(tas5756m->supplies),
+				   tas5756m->supplies);
+	if (ret < 0)
+		dev_err(component->dev, "failed to disable supplies: %d\n",
+			ret);
+}
+
+static int tas5756m_suspend(struct snd_soc_component *component)
+{
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+	int ret;
+
+	regcache_cache_only(tas5756m->regmap, true);
+	regcache_mark_dirty(tas5756m->regmap);
+
+	ret =
+	    regulator_bulk_disable(ARRAY_SIZE(tas5756m->supplies),
+				   tas5756m->supplies);
+	if (ret < 0)
+		dev_err(component->dev, "failed to disable regulators %d\n",
+			ret);
+
+	return ret;
+}
+
+static int tas5756m_resume_codec(struct snd_soc_component *component)
+{
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	return tas5756m_resume(tas5756m);
+}
+
+static const struct regmap_range_cfg tas5756m_regmap_pages[] = {
+	{
+	 .selector_reg = TAS5756M_PAGE_SEL,
+	 .selector_mask = 0xff,
+	 .window_start = 0,
+	 .window_len = 128,
+	 .range_min = 0,
+	 .range_max = TAS5756M_MAX_REG,
+	  },
+};
+
+static const struct regmap_config tas5756m_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.read_flag_mask = 0x80,
+	.write_flag_mask = 0x80,
+
+	.reg_defaults = tas5756m_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(tas5756m_reg_defaults),
+	.writeable_reg = tas5756m_writeable,
+	.volatile_reg = tas5756m_volatile,
+	.max_register = TAS5756M_MAX_REG,
+	.ranges = tas5756m_regmap_pages,
+	.num_ranges = ARRAY_SIZE(tas5756m_regmap_pages),
+	.cache_type = REGCACHE_RBTREE,
+};
+
+/* Right/Left Digital volume -103 to 24 dB */
+static const DECLARE_TLV_DB_LINEAR(out_volume_tlv, -10350, 25);
+
+#define KCONTROLS_COMMON \
+	SOC_SINGLE("Bass Boost", TAS5756M_ANLG_GAIN, 0, 0x01, 1), \
+	SOC_DOUBLE_R_RANGE_TLV("Volume", TAS5756M_LEFT_DVOL, \
+			       TAS5756M_RIGHT_DVOL, 0x00, 0x00, 0xff, 1, \
+			       out_volume_tlv), \
+	APPLY_CONFIG
+
+#define KCONTROLS_DBE_COMMON \
+	CRAM_COEFS("Filter DBE biquad high 1", TAS5756_REG_DBE_EQ_HIGH_BIQUAD_1), \
+	CRAM_COEFS("Filter DBE biquad high 2", TAS5756_REG_DBE_EQ_HIGH_BIQUAD_2), \
+	CRAM_COEFS("Filter DBE biquad low 1", TAS5756_REG_DBE_EQ_LOW_BIQUAD_1), \
+	CRAM_COEFS("Filter DBE biquad low 2", TAS5756_REG_DBE_EQ_LOW_BIQUAD_2), \
+	CRAM_COEFS("Filter DBE biquad low 3", TAS5756_REG_DBE_EQ_LOW_BIQUAD_3), \
+	\
+	/* First order lowpass and highpass only => b2 = 0 and a2 = 0*/ \
+	CRAM_COEFS("Filter DBE biquad energy lowpass", TAS5756M_REG_DBE_SENSING_HIGH), \
+	CRAM_COEFS("Filter DBE biquad energy highpass", TAS5756M_REG_DBE_SENSING_LOW), \
+	\
+	CRAM_COEFS("DBE energy window", TAS5756M_REG_DBE_WINDOW), \
+	CRAM_COEFS("DBE mixing high threshold", TAS5756M_REG_DBE_MIXING_HIGH), \
+	CRAM_COEFS("DBE mixing low threshold", TAS5756M_REG_DBE_MIXING_LOW)
+
+#define KCONTROLS_PBE_COMMON \
+	BYPASS_COEFS("PBE bypass", TAS5756M_REG_PBE_BYPASS), \
+	CRAM_COEFS("PBE harmonic", TAS5756M_REG_PBE_HARMONIC), \
+	CRAM_COEFS("PBE HPF and effect", TAS5756M_REG_PBE_HPF)
+
+static const struct snd_kcontrol_new tas5756m_snd_controls_no_hf[] = {
+	KCONTROLS_COMMON,
+};
+
+static const struct snd_kcontrol_new tas5756m_snd_controls_hf3[] = {
+	KCONTROLS_COMMON,
+	KCONTROLS_DBE_COMMON,
+	KCONTROLS_PBE_COMMON,
+
+	CRAM_COEFS("Filter high biquad 1", TAS5756_REG_FILTER_HIGH_BIQUAD_1),
+	CRAM_COEFS("Filter high biquad 2", TAS5756_REG_FILTER_HIGH_BIQUAD_2),
+	CRAM_COEFS("Filter high biquad 3", TAS5756_REG_FILTER_HIGH_BIQUAD_3),
+	CRAM_COEFS("Filter high biquad 4", TAS5756_REG_FILTER_HIGH_BIQUAD_4),
+	CRAM_COEFS("Filter high biquad 5", TAS5756_REG_FILTER_HIGH_BIQUAD_5),
+
+	CRAM_COEFS("Filter low biquad 1", TAS5756_REG_FILTER_LOW_BIQUAD_1),
+	CRAM_COEFS("Filter low biquad 2", TAS5756_REG_FILTER_LOW_BIQUAD_2),
+	CRAM_COEFS("Filter low biquad 3", TAS5756_REG_FILTER_LOW_BIQUAD_3),
+	CRAM_COEFS("Filter low biquad 4", TAS5756_REG_FILTER_LOW_BIQUAD_4),
+	CRAM_COEFS("Filter low biquad 5", TAS5756_REG_FILTER_LOW_BIQUAD_5),
+
+	CHANNEL_MIXER_COEFS("Channel mixer high", TAS5756_REG_CHAN_MIXER_HIGH),
+	CHANNEL_MIXER_COEFS("Channel mixer low", TAS5756_REG_CHAN_MIXER_LOW),
+
+	CHANNEL_PHASE_COEFS("Phase inversion mixer high",
+			    TAS5756_REG_CHAN_MIXER_HIGH),
+	CHANNEL_PHASE_COEFS("Phase inversion mixer low",
+			    TAS5756_REG_CHAN_MIXER_LOW),
+
+	DELAY_SAMPLES_COEFS("Delay samples high/mid", TAS5756_REG_ADD_DELAY),
+};
+
+static const struct snd_kcontrol_new tas5756m_snd_controls_hf4[] = {
+	KCONTROLS_COMMON,
+	KCONTROLS_DBE_COMMON,
+	KCONTROLS_PBE_COMMON,
+
+	CRAM_COEFS("Filter pre DBE biquad 1",
+		   TAS5756_REG_FILTER_BIQUAD_PRE_DBE_1),
+	CRAM_COEFS("Filter pre DBE biquad 2",
+		   TAS5756_REG_FILTER_BIQUAD_PRE_DBE_2),
+	CRAM_COEFS("Filter pre DBE biquad 3",
+		   TAS5756_REG_FILTER_BIQUAD_PRE_DBE_3),
+
+	CRAM_COEFS("Filter post DBE biquad 1",
+		   TAS5756_REG_FILTER_BIQUAD_POST_DBE_1),
+	CRAM_COEFS("Filter post DBE biquad 2",
+		   TAS5756_REG_FILTER_BIQUAD_POST_DBE_2),
+	CRAM_COEFS("Filter post DBE biquad 3",
+		   TAS5756_REG_FILTER_BIQUAD_POST_DBE_3),
+	CRAM_COEFS("Filter post DBE biquad 4",
+		   TAS5756_REG_FILTER_BIQUAD_POST_DBE_4),
+	CRAM_COEFS("Filter post DBE biquad 5",
+		   TAS5756_REG_FILTER_BIQUAD_POST_DBE_5),
+
+	CRAM_COEFS("Filter DBE biquad high 3",
+		   TAS5756_REG_DBE_EQ_HIGH_BIQUAD_3),
+	CRAM_COEFS("Filter DBE biquad high 4",
+		   TAS5756_REG_DBE_EQ_HIGH_BIQUAD_4),
+
+	CRAM_COEFS("Filter DBE biquad low 4", TAS5756_REG_DBE_EQ_LOW_BIQUAD_4),
+
+	CHANNEL_MIXER_COEFS("Channel mixer", TAS5756_REG_CHAN_MIXER),
+	CHANNEL_PHASE_COEFS("Phase inversion mixer", TAS5756_REG_CHAN_MIXER),
+};
+
+static const struct snd_kcontrol_new tas5756m_snd_controls_hf6[] = {
+	KCONTROLS_COMMON,
+	KCONTROLS_DBE_COMMON,
+	KCONTROLS_PBE_COMMON,
+
+	CRAM_COEFS("Filter biquad 1", TAS5756_REG_FILTER_BIQUAD_1),
+	CRAM_COEFS("Filter biquad 2", TAS5756_REG_FILTER_BIQUAD_2),
+	CRAM_COEFS("Filter biquad 3", TAS5756_REG_FILTER_BIQUAD_3),
+	CRAM_COEFS("Filter biquad 4", TAS5756_REG_FILTER_BIQUAD_4),
+	CRAM_COEFS("Filter biquad 5", TAS5756_REG_FILTER_BIQUAD_5),
+	CRAM_COEFS("Filter biquad 6", TAS5756_REG_FILTER_BIQUAD_6),
+	CRAM_COEFS("Filter biquad 7", TAS5756_REG_FILTER_BIQUAD_7),
+	CRAM_COEFS("Filter biquad 8", TAS5756_REG_FILTER_BIQUAD_8),
+	CRAM_COEFS("Filter biquad 9", TAS5756_REG_FILTER_BIQUAD_9),
+	CRAM_COEFS("Filter biquad 10", TAS5756_REG_FILTER_BIQUAD_10),
+
+	CRAM_COEFS("Filter DBE biquad high 3",
+		   TAS5756_REG_DBE_EQ_HIGH_BIQUAD_3),
+
+	CRAM_COEFS("Filter DBE biquad low 4", TAS5756_REG_DBE_EQ_LOW_BIQUAD_4),
+	CRAM_COEFS("Filter DBE biquad low 5", TAS5756_REG_DBE_EQ_LOW_BIQUAD_5),
+
+	CHANNEL_MIXER_COEFS("Channel mixer", TAS5756_REG_CHAN_MIXER),
+};
+
+static const struct snd_kcontrol_new tas5756m_snd_controls_hf7[] = {
+	KCONTROLS_COMMON,
+
+	CHANNEL_MIXER_COEFS("Channel mixer", TAS5756_REG_CHAN_MIXER),
+
+	CRAM_COEFS("Filter biquad 1", TAS5756_REG_FILTER_BIQUAD_1),
+	CRAM_COEFS("Filter biquad 2", TAS5756_REG_FILTER_BIQUAD_2),
+	CRAM_COEFS("Filter biquad 3", TAS5756_REG_FILTER_BIQUAD_3),
+	CRAM_COEFS("Filter biquad 4", TAS5756_REG_FILTER_BIQUAD_4),
+	CRAM_COEFS("Filter biquad 5", TAS5756_REG_FILTER_BIQUAD_5),
+};
+
+static const struct snd_soc_dapm_widget tas5756mw_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("DAC IN", "Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_OUTPUT("OUT"),
+};
+
+static const struct snd_soc_dapm_route tas5756mw_audio_map[] = {
+	{ "DAC", NULL, "DAC IN" },
+	{ "OUT", NULL, "DAC" },
+};
+
+static const struct snd_soc_dapm_widget tas5756m_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("DAC IN", "Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_OUTPUT("OUT"),
+};
+
+static const struct snd_soc_dapm_route tas5756m_audio_map[] = {
+	{ "DAC", NULL, "DAC IN" },
+	{ "OUT", NULL, "DAC" },
+};
+
+static struct snd_soc_component_driver soc_component_dev_tas5756m = {
+	.probe = tas5756m_codec_probe,
+	.remove = tas5756m_codec_remove,
+	.suspend = tas5756m_suspend,
+	.resume = tas5756m_resume_codec,
+};
+
+#define TAS5756M_RATES		(SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 \
+				 | SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 \
+				 | SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 \
+				 | SNDRV_PCM_RATE_96000)
+
+#define TAS5756M_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE \
+				 | SNDRV_PCM_FMTBIT_S20_3LE \
+				 | SNDRV_PCM_FMTBIT_S24_3LE \
+				 | SNDRV_PCM_FMTBIT_S32_LE)
+
+static const u32 tas5756m_dai_rates[] = {
+	8000, 16000, 32000, 44100, 48000, 88200, 96000,
+};
+
+static const struct snd_pcm_hw_constraint_list constraints_slave = {
+	.count = ARRAY_SIZE(tas5756m_dai_rates),
+	.list = tas5756m_dai_rates,
+};
+
+static int tas5756m_dai_startup_slave(struct snd_pcm_substream *substream,
+				      struct snd_soc_dai *dai)
+{
+	struct device *dev = dai->dev;
+
+	dev_info(dev, "setting pcm hw constraints\n");
+	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+					  SNDRV_PCM_HW_PARAM_RATE,
+					  &constraints_slave);
+}
+
+static int tas5756m_dai_startup(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas5756m_data *tas5756m =
+	    snd_soc_component_get_drvdata(component);
+
+	switch (tas5756m->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		dev_info(component->dev, "setting DAI slave mode\n");
+		return tas5756m_dai_startup_slave(substream, dai);
+	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBM_CFS:
+	default:
+		dev_info(component->dev, "cant set DAI master mode\n");
+		return -EINVAL;
+	}
+}
+
+static const struct snd_soc_dai_ops tas5756m_dai_ops = {
+	.startup = tas5756m_dai_startup,
+	.prepare = tas5756m_pcm_prepare,
+	.hw_params = tas5756m_hw_params,
+	.shutdown = tas5756m_shutdown_dai,
+	.set_fmt = tas5756m_set_dai_fmt,
+	.digital_mute = tas5756m_mute,
+};
+
+static struct snd_soc_dai_driver tas5756m_dai[] = {
+	{
+	 .name = "tas5756m-hifi",
+	 .playback = {
+		      .stream_name = "Playback",
+		      .channels_min = 1,
+		      .channels_max = 2,
+		      .rates = TAS5756M_RATES,
+		      .formats = TAS5756M_FORMATS,
+		      },
+	 .ops = &tas5756m_dai_ops,
+	  },
+};
+
+/* To send default values of registers generated by
+ * Purepath tool from Texas Instruments
+ */
+static int tas5756m_transmit_registers(struct i2c_client *client, cfg_reg *r,
+				       int n)
+{
+	unsigned int i = 0;
+	int ret = 0;
+
+	while (i < n) {
+		switch (r[i].command) {
+		case CFG_META_DELAY:
+			usleep_range(1000ul, r[i].param * 1000ul);
+			break;
+		case CFG_META_BURST:
+			ret =
+			    i2c_master_send(client, (unsigned char *)&r[i + 1],
+					    r[i].param);
+			i += (r[i].param + 1) / 2;
+			break;
+		default:
+			ret =
+			    i2c_master_send(client, (unsigned char *)&r[i], 2);
+			break;
+		}
+
+		if (ret)
+			return ret;
+
+		i++;
+	}
+
+	return ret;
+}
+
+static int tas5756m_setup_hybridflow(struct tas5756m_data *tas5756m)
+{
+	struct i2c_client *client = tas5756m->tas5756m_client;
+	size_t array_reg_size = 0;
+	cfg_reg *array_reg = NULL;
+	int ret;
+
+	ret =
+	    tas5756m_transmit_registers(client, &tas5756m_startup_registers[0],
+					ARRAY_SIZE(tas5756m_startup_registers));
+	if (!ret) {
+		dev_err(&client->dev, "failed to transmit init registers: %d\n",
+			ret);
+		return ret;
+	}
+
+	/* No all hybridflow are currently supported.
+	 * If not supported, Hybridflow is not used.
+	 */
+	switch (tas5756m->hybridflow) {
+#if 0
+	case HYBRIDFLOW_3:
+		soc_component_dev_tas5756m.controls = tas5756m_snd_controls_hf3;
+		soc_component_dev_tas5756m.num_controls =
+		    ARRAY_SIZE(tas5756m_snd_controls_hf3);
+		array_reg = tas5756m_init_hf3;
+		array_reg_size = ARRAY_SIZE(tas5756m_init_hf3);
+		break;
+	case HYBRIDFLOW_4:
+		soc_component_dev_tas5756m.controls = tas5756m_snd_controls_hf4;
+		soc_component_dev_tas5756m.num_controls =
+		    ARRAY_SIZE(tas5756m_snd_controls_hf4);
+		array_reg = tas5756m_init_hf4;
+		array_reg_size = ARRAY_SIZE(tas5756m_init_hf4);
+		break;
+	case HYBRIDFLOW_6:
+		soc_component_dev_tas5756m.controls = tas5756m_snd_controls_hf6;
+		soc_component_dev_tas5756m.num_controls =
+		    ARRAY_SIZE(tas5756m_snd_controls_hf6);
+		array_reg = tas5756m_init_hf6;
+		array_reg_size = ARRAY_SIZE(tas5756m_init_hf6);
+		break;
+	case HYBRIDFLOW_7:
+		soc_component_dev_tas5756m.controls = tas5756m_snd_controls_hf7;
+		soc_component_dev_tas5756m.num_controls =
+		    ARRAY_SIZE(tas5756m_snd_controls_hf7);
+		array_reg = tas5756m_init_hf7;
+		array_reg_size = ARRAY_SIZE(tas5756m_init_hf7);
+		break;
+#endif
+	default:
+		soc_component_dev_tas5756m.controls =
+		    tas5756m_snd_controls_no_hf;
+		soc_component_dev_tas5756m.num_controls =
+		    ARRAY_SIZE(tas5756m_snd_controls_no_hf);
+		tas5756m->hybridflow = NO_HYBRIDFLOW;
+		break;
+	}
+
+	if (array_reg && array_reg_size) {
+		ret =
+		    tas5756m_transmit_registers(client, array_reg,
+						array_reg_size);
+		if (!ret) {
+			dev_err(&client->dev,
+				"failed to transmit hybridflow registers: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
+	ret =
+	    snd_soc_register_component(&client->dev,
+				       &soc_component_dev_tas5756m,
+				       &tas5756m_dai[0],
+				       ARRAY_SIZE(tas5756m_dai));
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to register component: %d\n",
+			ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int tas5756m_i2c_probe(struct i2c_client *client,
+			      const struct i2c_device_id *i2c_id)
+{
+	struct device *dev = &client->dev;
+	struct tas5756m_data *tas5756m;
+	int ret;
+	int i;
+#ifdef CONFIG_OF
+	int hybridflow;
+	struct device_node *np;
+#endif
+
+	tas5756m = devm_kzalloc(dev, sizeof(struct tas5756m_data), GFP_KERNEL);
+	if (!tas5756m)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, tas5756m);
+	tas5756m->tas5756m_client = client;
+	tas5756m->hybridflow = NO_HYBRIDFLOW;
+
+	/* When adaptive mode is enabled, pages from CRAM A or B are referring
+	 * to the same memory location.
+	 * So, the driver has to enable a virtual buffer
+	 * to track current settings and be able to apply them to both bank
+	 * when it is relevant.
+	 * Because we are not able to copy from A to B directly.
+	 * Source: http://www.ti.com/lit/an/slaa425d/slaa425d.pdf
+	 */
+	tas5756m->cram_buffer = vmalloc(CRAM_BUFFER_SIZE);
+	if (!tas5756m->cram_buffer)
+		return -ENOMEM;
+
+#ifdef CONFIG_OF
+	of_node_get(np);
+
+	if (of_property_read_u32(dev->of_node, "ti,hybridflow", &hybridflow)) {
+		dev_info(dev,
+			 "no hybridflow property. Use default DSP program.\n");
+	} else {
+		dev_info(dev, "read property hybridflow: %u\n", hybridflow);
+		tas5756m->hybridflow = hybridflow;
+	}
+#endif
+
+	dev_info(dev, "## %s: %s codec_type = %d\n", __func__, i2c_id->name,
+		 (int)i2c_id->driver_data);
+
+	tas5756m->regmap =
+	    devm_regmap_init_i2c(client, &tas5756m_regmap_config);
+	if (IS_ERR(tas5756m->regmap)) {
+		ret = PTR_ERR(tas5756m->regmap);
+		dev_err(dev, "failed to allocate register map: %d\n", ret);
+		return ret;
+	}
+
+	regcache_cache_only(tas5756m->regmap, false);
+	regcache_sync(tas5756m->regmap);
+
+	tas5756m_enable_adaptive_mode(tas5756m, true);
+	tas5756m->buffer = tas5756m_get_current_cram_buffer(tas5756m);
+
+	for (i = 0; i < ARRAY_SIZE(tas5756m->supplies); i++)
+		tas5756m->supplies[i].supply = tas5756m_supply_names[i];
+
+	ret =
+	    devm_regulator_bulk_get(dev, ARRAY_SIZE(tas5756m->supplies),
+				    tas5756m->supplies);
+	if (ret != 0) {
+		dev_err(dev, "failed to request supplies: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(tas5756m->supplies); i++)
+		tas5756m->supplies[i].supply = tas5756m_supply_names[i];
+
+	ret =
+	    regulator_bulk_enable(ARRAY_SIZE(tas5756m->supplies),
+				  tas5756m->supplies);
+	if (ret != 0) {
+		dev_err(dev, "failed to enable supplies: %d\n", ret);
+		return ret;
+	}
+
+	ret = tas5756m_setup_hybridflow(tas5756m);
+	if (ret) {
+		dev_err(dev, "failed to setup hybridflow: %d\n", ret);
+		goto err;
+	}
+
+	/*
+	 * By default, hybridflow mutes both channels when
+	 * Purepath Console is dumping memory.
+	 * We must configure them after hybridflow init to get sound back.
+	 * Source: https://e2e.ti.com/support/audio/f/6/p/523251/1919266?tisearch=e2e-sitesearch&keymatch=audio&pi316677=2&pi320995=3
+	 */
+	tas5756m_route_channels(tas5756m, CHANNEL_MIXER_MONO);
+
+	tas5756m_cram_to_virt_buffer(tas5756m, CRAM_BUFFER_A);
+	return 0;
+
+err:
+	dev_err(dev, "probe error\n");
+	regulator_bulk_disable(ARRAY_SIZE(tas5756m->supplies),
+			       tas5756m->supplies);
+	return ret;
+}
+
+static int tas5756m_i2c_remove(struct i2c_client *i2c)
+{
+	struct device *dev = &i2c->dev;
+	struct tas5756m_data *tas5756m = i2c_get_clientdata(i2c);
+
+	vfree(tas5756m->cram_buffer);
+	snd_soc_unregister_component(dev);
+	return 0;
+}
+
+static const struct i2c_device_id tas5756m_id[] = {
+	{ "tas5754m", },
+	{ "tas5756m", },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(i2c, tas5756m_id);
+
+#ifdef CONFIG_OF
+static const struct of_device_id tas5756m_of_match[] = {
+	{.compatible = "ti,tas5754m" },
+	{.compatible = "ti,tas5756m" },
+	{ },
+};
+
+MODULE_DEVICE_TABLE(of, tas5756m_of_match);
+#endif
+
+static struct i2c_driver tas5756m_i2c_driver = {
+	.driver = {
+		   .name = "tas5756m-codec",
+		   .owner = THIS_MODULE,
+		   .of_match_table = of_match_ptr(tas5756m_of_match),
+		    },
+
+	.probe = tas5756m_i2c_probe,
+	.remove = tas5756m_i2c_remove,
+	.id_table = tas5756m_id,
+};
+
+module_i2c_driver(tas5756m_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC TAS5756M codec / amplifier driver");
+MODULE_AUTHOR("Thomas Brijs <thomas.brijs@houseofmusic.be>");
+MODULE_AUTHOR("Charles-Antoine Couret <charles-antoine.couret@essensium.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/tas5756m.h b/sound/soc/codecs/tas5756m.h
new file mode 100644
index 000000000000..2b45eb8f0fe2
--- /dev/null
+++ b/sound/soc/codecs/tas5756m.h
@@ -0,0 +1,351 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * tas5756m.h - ALSA SoC Texas Instruments TAS5756M Audio Amplifier
+ *
+ * Copyright (C)2018-2020 House of Music NV -  https://www.homa.be
+ *
+ * Authors: Charles-Antoine Couret <charles-antoine.couret@mind.be>
+ *        : Thomas Brijs <thomas.brijs@houseofmusic.be>
+ */
+
+#ifndef _TAS5756M_H
+#define _TAS5756M_H
+
+enum purepath_hybridflow {
+	NO_HYBRIDFLOW = 0,
+	HYBRIDFLOW_1,
+	HYBRIDFLOW_2,
+	HYBRIDFLOW_3,
+	HYBRIDFLOW_4,
+	HYBRIDFLOW_5,
+	HYBRIDFLOW_6,
+	HYBRIDFLOW_7,
+};
+
+enum channel_mixer {
+	CHANNEL_MIXER_RIGHT = 0,
+	CHANNEL_MIXER_LEFT,
+	CHANNEL_MIXER_MONO,
+	CHANNEL_MIXER_MAX,
+};
+
+enum delay_samples {
+	DELAY_SAMPLES_0 = 0,
+	DELAY_SAMPLES_4,
+	DELAY_SAMPLES_8,
+	DELAY_SAMPLES_12,
+	DELAY_SAMPLES_16,
+	DELAY_SAMPLES_MAX,
+};
+
+#define MIXER_PHASE_INVERSION_MASK	BIT(23)
+#define MIXER_GAIN_MASK_MASK		0x7FFFFF
+#define COEF_ENABLE_FEATURE_VALUE	0x7FFFFF
+
+enum phase_inversion {
+	PHASE_NO_INVERSION = 0,
+	PHASE_INVERSION,
+};
+
+#define TAS5756M_NUM_SUPPLIES	2
+
+#define CFG_META_SWITCH (255)
+#define CFG_META_DELAY  (254)
+#define CFG_META_BURST  (253)
+
+#define TAS5756M_PAGE_SIZE			128
+#define PAGE_NR(x)			(TAS5756M_PAGE_SIZE * (x))
+#define PAGE_ADDRESS_MASK		0x7F
+#define ADDR_TO_PAGE_NR(x)		((x) >> 7)
+#define TAS5756M_PAGE_SEL		0x00
+
+/* Register Address Map */
+#define TAS5756M_RESET			0x01
+#define	RESET_REGISTER_MASK	0x01
+#define	RESET_MODULES_MASK	0x10
+#define	RESET_ALL_MASK		0x11
+
+#define TAS5756M_PDN_STBY		0x02
+#define PDN_MASK		0x01
+#define STBY_MASK		0x10
+#define PDN_STBY_MASK		0x11
+
+#define TAS5756M_MUTE_L_R		0x03
+#define	MUTE_LEFT_MASK		0x10
+#define MUTE_RIGHT_MASK		0x01
+#define	MUTE_ALL_MASK		(MUTE_LEFT_MASK | MUTE_RIGHT_MASK)
+
+#define TAS5756M_PLL_EN_STA		0x04
+#define TAS5756M_SPI_MISO_SEL		0x06
+#define TAS5756M_SDOUT_DEEMPH		0x07
+#define TAS5756M_GPIO_OUT_EN		0x08
+#define TAS5756M_BCK_LRCK_CFG		0x09
+#define TAS5756M_DSP_GPIO_IN		0x0a
+#define TAS5756M_MASTER_B_LRCK_RST	0x0c
+
+/* PLL Regs */
+#define TAS5756M_PLL_CLK_SRC_SEL	0x0d
+#define TAS5756M_DAC_CLOCK_SRC		0x0e
+#define TAS5756M_PLL_GPIO_REF_SEL	0x12
+#define TAS5756M_SYNC_REQ		0x13
+#define TAS5756M_PLL_P_VALUE		0x14
+#define TAS5756M_PLL_J_VALUE		0x15
+#define TAS5756M_PLL_D_VALUE_MSB	0x16
+#define TAS5756M_PLL_D_VALUE_LSB	0x17
+#define TAS5756M_PLL_R_VALUE		0x18
+
+/* Clock dividers */
+#define TAS5756M_DSP_CLKDIV		0x1b
+#define TAS5756M_DAC_CLKDIV		0x1c
+#define TAS5756M_NCP_CLKDIV		0x1d
+#define TAS5756M_OSR_CLKDIV		0x1e
+#define TAS5756M_MM_BCK_CLKDIV		0x20
+#define TAS5756M_MM_LRCK_CLKDIV		0x21
+
+#define TAS5756M_FS_SPEED_MODE		0x22
+#define TAS5756M_IDAC_MSB		0x23
+#define TAS5756M_IDAC_LSB		0x24
+#define TAS5756M_IGN_ERRORS		0x25
+
+/* I2S config */
+#define TAS5756M_I2S_CONFIG		0x28
+#define FMT_MASK		0x30
+#define FMT_I2S		(0x00 << 4)
+#define FMT_DSP		(0x01 << 4)
+#define FMT_RTJ		(0x02 << 4)
+#define FMT_LTJ		(0x03 << 4)
+
+#define RES_MASK		0x03
+#define RES_16BIT	(0x00)
+#define RES_20BIT	(0x01)
+#define RES_24BIT	(0x02)
+#define RES_32BIT	(0x03)
+
+#define TAS5756M_I2S_SHIFT		0x29
+
+#define TAS5756M_DAC_DATA_PATH		0x2a
+#define DAC_PATH_DEFAULT	0x01
+#define DAC_PATH_OPPOSITE	0x02
+#define DAC_PATH_B_SHIFT	4
+
+#define TAS5756M_DSP_PROG_SEL		0x2b
+#define TAS5756M_DSP_HYBRIDFLOW	0x1f
+#define TAS5756M_CLK_MISS_DET		0x2c
+#define TAS5756M_AUTO_MUTE_TIME		0x3b
+#define TAS5756M_DIGITAL_VOLUME		0x3c
+#define VOL_MASTER_DEFAULT	0x00
+
+#define TAS5756M_RIGHT_DVOL		0x3d
+#define TAS5756M_LEFT_DVOL		0x3e
+#define	VOL_CH1_2_DEFAULT	0x74
+
+#define TAS5756M_DVOL_RAMP_NORMAL	0x3f
+#define TAS5756M_DVOL_RAMP_EMRGNCY	0x40
+#define TAS5756M_AUTO_MUTE		0x41
+
+/* GPIO ouputs */
+#define TAS5756M_GPIO1_OUTPUT_SEL	0x50
+#define TAS5756M_GPIO2_OUTPUT_SEL	0x51
+#define TAS5756M_GPIO3_OUTPUT_SEL	0x52
+#define TAS5756M_GPIO4_OUTPUT_SEL	0x53
+#define TAS5756M_GPIO5_OUTPUT_SEL	0x54
+#define TAS5756M_GPIO6_OUTPUT_SEL	0x55
+#define TAS5756M_GPIO_OUTPUT_CTRL	0x56
+/* Read only */
+#define TAS5756M_CHAN_OVRFLOW		0x5a
+#define TAS5756M_DET_FS_MCLK		0x5b
+#define TAS5756M_DET_SCLK		0x5c
+#define TAS5756M_DET_SCLK_DESC		0x5d
+#define TAS5756M_CLK_DET_STATUS		0x5e
+#define TAS5756M_CLK_STATUS		0x5f
+
+#define TAS5756M_ANLG_MUTE_MON		0x6c
+
+#define TAS5756M_SHORT_DETECT		0x6d
+#define SHORT_MASK		0x01
+#define SHORT_BUSY_MASK		0x10
+
+#define TAS5756M_SPK_MUTE_DEC		0x72
+#define TAS5756M_FS_SPEED_MON		0x73
+
+/* Datasheet is wrong, R118 is the right register to get DSP and DAC status
+ * Source: https://e2e.ti.com/support/audio/f/6/t/390728?TAS5756M-experiences
+ */
+#define TAS5756M_DAC_PWR_STA		0x76
+#define	DAC_ENABLED_MASK	0x80
+#define	DAC_POWER_STATE_MASK	0x0F
+#define	DAC_RUNNING		0x05
+
+#define TAS5756M_GPIO012_STATE		0x77
+#define TAS5756M_AUTO_MUTE_FLAG		0x78
+
+#define TAS5756M_DAC_MODE		0x79
+#define TAS5756M_MCM_MODE		0x7a
+#define TAS5756M_MCM_OUT_GPIO_1_2	0x7b
+#define TAS5756M_MCM_OUT_GPIO_3_4	0x7c
+#define TAS5756M_MCM_OUT_GPIO_5_6	0x7d
+
+/* End Page 0 */
+
+#define TAS5756M_ANLG_GAIN		(PAGE_NR(1) + 0x02)
+#define	CHANNEL_A_GAIN				0x01
+#define	CHANNEL_B_GAIN				0x10
+
+#define TAS5756M_PWR_DET_CTRL		(PAGE_NR(1) + 0x05)
+#define	EXT_UVLO_PROTECT			0x02
+#define	INT_UVLO_PROTECT			0x01
+
+#define TAS5756M_ANLG_MUTE		(PAGE_NR(1) + 0x06)
+#define ANLG_MUTE_DIS				0x01
+
+#define TAS5756M_ANLG_BOOST		(PAGE_NR(1) + 0x07)
+#define ANLG_CHA_BOOST				0x01
+#define	ANLG_CHB_BOOST				0x10
+
+#define TAS5756M_VCOM_REF_RAMP		(PAGE_NR(1) + 0x08)
+#define FAST_RAMP_EN				0x01
+
+#define TAS5756M_VCOM_PDN_SWITCH	(PAGE_NR(1) + 0x09)
+#define VCOM_POWER_DN				0x01
+
+/* End page 1 */
+
+enum cram_buffer {
+	CRAM_BUFFER_A = 0,
+	CRAM_BUFFER_B,
+};
+
+#define CRAM_FIRST_PAGE					44
+#define CRAM_FIRST_PAGE_SECOND_BANK			62
+
+#define TAS5756M_ACTIVE_CRAM_MON			(PAGE_NR(CRAM_FIRST_PAGE) + 1)
+#define CRAM_BUFFER_SWITCH_MASK				BIT(0)
+#define CRAM_BUFFER_CRAM_BUFFER_USED_MASK		BIT(1)
+#define CRAM_BUFFER_CRAM_ADAP_MODE_MASK			BIT(2)
+#define CRAM_BUFFER_CRAM_BUFFER_USED_NON_ADAPT_MASK	BIT(3)
+
+#define CRAM_BUFFER_SWITCH_REG		TAS5756M_ACTIVE_CRAM_MON
+#define CRAM_BUFFER_PAGE_OFFSET		8
+#define CRAM_BUFFER_A_BASE_ADDR		(PAGE_NR(CRAM_FIRST_PAGE) + CRAM_BUFFER_PAGE_OFFSET)
+#define CRAM_BUFFER_B_BASE_ADDR		(PAGE_NR(CRAM_FIRST_PAGE_SECOND_BANK) + CRAM_BUFFER_PAGE_OFFSET)
+#define CRAM_NB_COEF			256
+#define CRAM_COEF_NB_REGS		4
+#define CRAM_BUFFER_SIZE		(CRAM_COEF_NB_REGS * CRAM_NB_COEF)
+#define CRAM_BUFFER_OFFSET(reg)		(reg - PAGE_NR(CRAM_FIRST_PAGE))
+#define CRAM_BUFFER_NB_PAGES		(53 - CRAM_FIRST_PAGE)
+#define CRAM_REGS_PER_PAGES		(TAS5756M_PAGE_SIZE - CRAM_BUFFER_PAGE_OFFSET)
+#define CRAM_NB_COEF_PER_PAGE		(CRAM_REGS_PER_PAGES / CRAM_COEF_NB_REGS)
+#define CRAM_BIQUAD_NB_COEF		5
+#define CRAM_BIQUAD_SIZE		(CRAM_COEF_NB_REGS * CRAM_BIQUAD_NB_COEF)
+#define CRAM_HPF_EFFECT_NB_COEF		24
+#define CRAM_HPF_EFFECT_SIZE		(CRAM_HPF_EFFECT_NB_COEF * CRAM_BIQUAD_NB_COEF)
+
+enum hybridflow_features {
+	TAS5756_REG_FILTER_BIQUAD_1,
+	TAS5756_REG_FILTER_BIQUAD_2,
+	TAS5756_REG_FILTER_BIQUAD_3,
+	TAS5756_REG_FILTER_BIQUAD_4,
+	TAS5756_REG_FILTER_BIQUAD_5,
+	TAS5756_REG_FILTER_BIQUAD_6,
+	TAS5756_REG_FILTER_BIQUAD_7,
+	TAS5756_REG_FILTER_BIQUAD_8,
+	TAS5756_REG_FILTER_BIQUAD_9,
+	TAS5756_REG_FILTER_BIQUAD_10,
+
+	TAS5756_REG_FILTER_BIQUAD_PRE_DBE_1,
+	TAS5756_REG_FILTER_BIQUAD_PRE_DBE_2,
+	TAS5756_REG_FILTER_BIQUAD_PRE_DBE_3,
+
+	TAS5756_REG_FILTER_BIQUAD_POST_DBE_1,
+	TAS5756_REG_FILTER_BIQUAD_POST_DBE_2,
+	TAS5756_REG_FILTER_BIQUAD_POST_DBE_3,
+	TAS5756_REG_FILTER_BIQUAD_POST_DBE_4,
+	TAS5756_REG_FILTER_BIQUAD_POST_DBE_5,
+
+	TAS5756_REG_FILTER_HIGH_BIQUAD_1,
+	TAS5756_REG_FILTER_HIGH_BIQUAD_2,
+	TAS5756_REG_FILTER_HIGH_BIQUAD_3,
+	TAS5756_REG_FILTER_HIGH_BIQUAD_4,
+	TAS5756_REG_FILTER_HIGH_BIQUAD_5,
+
+	TAS5756_REG_FILTER_LOW_BIQUAD_1,
+	TAS5756_REG_FILTER_LOW_BIQUAD_2,
+	TAS5756_REG_FILTER_LOW_BIQUAD_3,
+	TAS5756_REG_FILTER_LOW_BIQUAD_4,
+	TAS5756_REG_FILTER_LOW_BIQUAD_5,
+
+	TAS5756_REG_DBE_EQ_HIGH_BIQUAD_1,
+	TAS5756_REG_DBE_EQ_HIGH_BIQUAD_2,
+	TAS5756_REG_DBE_EQ_HIGH_BIQUAD_3,
+	TAS5756_REG_DBE_EQ_HIGH_BIQUAD_4,
+	TAS5756_REG_DBE_EQ_HIGH_BIQUAD_5,
+
+	TAS5756_REG_DBE_EQ_LOW_BIQUAD_1,
+	TAS5756_REG_DBE_EQ_LOW_BIQUAD_2,
+	TAS5756_REG_DBE_EQ_LOW_BIQUAD_3,
+	TAS5756_REG_DBE_EQ_LOW_BIQUAD_4,
+	TAS5756_REG_DBE_EQ_LOW_BIQUAD_5,
+
+	TAS5756M_REG_DBE_MIXING_HIGH,
+	TAS5756M_REG_DBE_MIXING_LOW,
+	TAS5756M_REG_DBE_SENSING_HIGH,
+	TAS5756M_REG_DBE_SENSING_LOW,
+	TAS5756M_REG_DBE_WINDOW,
+
+	TAS5756M_REG_PBE_BYPASS,
+	TAS5756M_REG_PBE_EFFECT,
+	TAS5756M_REG_PBE_HARMONIC,
+	TAS5756M_REG_PBE_HPF,
+
+	TAS5756_REG_CHAN_MIXER,
+	TAS5756_REG_CHAN_MIXER_HIGH,
+	TAS5756_REG_CHAN_MIXER_LOW,
+
+	TAS5756_REG_ADD_DELAY,
+};
+
+#define TAS5756M_MAX_REG			(PAGE_NR(71))
+
+/* To support registers arrays generated by Purepath tool */
+typedef unsigned char cfg_u8;
+typedef union {
+	struct {
+		cfg_u8 offset;
+		cfg_u8 value;
+	};
+
+	struct {
+		cfg_u8 command;
+		cfg_u8 param;
+	};
+} cfg_reg;
+
+static void tas5756m_fault_check_work(struct work_struct *work);
+static cfg_reg tas5756m_startup_registers[] = {
+	{ { TAS5756M_PAGE_SEL, 0x00} },
+	{ { TAS5756M_PDN_STBY, STBY_MASK} },
+	{ { TAS5756M_RESET, RESET_ALL_MASK} },
+	{ { TAS5756M_LEFT_DVOL, 0x40} },
+	{ { TAS5756M_RIGHT_DVOL, 0x40} },
+	{ { TAS5756M_PDN_STBY, STBY_MASK} },
+};
+
+struct tas5756m_data {
+	struct snd_soc_component *component;
+	struct regmap *regmap;
+	struct i2c_client *tas5756m_client;
+	unsigned int fmt;
+	struct regulator_bulk_data supplies[TAS5756M_NUM_SUPPLIES];
+
+	struct delayed_work fault_check_work;
+
+	unsigned int gpio_mute;
+	unsigned int last_fault;
+	unsigned int power_state;
+	enum purepath_hybridflow hybridflow;
+	enum cram_buffer buffer;
+	uint32_t *cram_buffer;
+	enum channel_mixer channel;
+};
+
+#endif /* _TAS5756M_H */
-- 
2.24.1


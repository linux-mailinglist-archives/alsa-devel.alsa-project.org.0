Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2287380EC2
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 19:22:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FC621786;
	Fri, 14 May 2021 19:21:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FC621786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621012947;
	bh=Ulj0Zer24l5bAUfI/Z6C2lKtibPBmxlW38Ad2uI2IGc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JAaf2Nt8COSodwRCZZPWY2ohtLe2e03Fj0+4KKwXGUt1kbs0bS5NF+dqbOqyfncLc
	 tlf2ffx+2SSvMkGogRWoirOpEn14u0KonmWqOwLR5VZk/q9+/pe5WA/Z0/1uYvRZK2
	 pDjUTJe+ojDMzGM8C9gMQn2HR/DEJfNrJxq+lFbw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33187F8049C;
	Fri, 14 May 2021 19:20:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF3DCF802CA; Fri, 14 May 2021 19:20:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA5ABF8020C
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 19:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA5ABF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="icn8pWet"
Received: by mail-ot1-x32b.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso26989212otb.13
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 10:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J0zFqIlDR18adY4+23D4sY+edWf1XWcVGvaw8taoe6I=;
 b=icn8pWetyEtj3A4E4W52w+89T2lvJcIoRJrV/g4yzHRwq8dwfyAcBi/5eO8Jon3vMu
 JF9orzzNgxF5oxyfXhh7rBlRL0ZKEXxI2ZwlGdNO/pyzAYg7ymg0RF5UEGCh93Sn9fWj
 LzC5/C6TyN58OoVtoAy9xJ8PLFGFy8LSSMnLlh1NOOK5ar1wnLji0BWt0CpGo0YaQlX8
 DQcDwYXRSmthI+wMlzCp5IC0kibOhOnH6YegVPzFJLcoPvLDk+zmo6aBptVLZMsI2TT3
 8nQZxC0iMpz9R85liohhrnp3GC7uwowiAnd0MiE4HGcGkmpBK97U6B71QqDXZq97SuDw
 7ctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J0zFqIlDR18adY4+23D4sY+edWf1XWcVGvaw8taoe6I=;
 b=b1TnAY+uVgoaph5W4WEo1FgIoNLN+nXoiVWynroZJtQvY0s0l0OMcABR/kaIUQdah3
 1ekLKX7B9Z5NXGPHFX/q8lxtvPWDkfs6DySGxpY1a/bD8M93zBMGG0ntsExQSEzsXPsw
 JgV8qK759rX1KsrgWhNUlE7HMXdMjUxvrNTrAgDndGMjsfWRDS9nwBqzOzBfan56B81G
 8nxf1rH+p3FJ2rkfjTrX7d4cAwyvAZ6i2OFcjlN/qkT0VVGmvMYFGCEjNzXXtYl2rAdP
 JPFij4VyXAkeXdpvzfpX1MMQpV7RqqJxoHDcaWRyd490/oCGtIZT7aWblTI0N5ZncuzZ
 EIcw==
X-Gm-Message-State: AOAM531O+IBmAK7jPYGS2VNjfv3EoCPHTLp5wamm72h8bhG/4DfDL6Yp
 MT4iVg08sCR8uK1G9L/40PDpkDjq7XI=
X-Google-Smtp-Source: ABdhPJzSlYL2F3CxGu07idWFxYnY8Ax3gM/SneL0KSIbjtxK4u5+oRX/wLPGGB98LOrYsUVp8S8B0g==
X-Received: by 2002:a05:6830:1e64:: with SMTP id
 m4mr23783099otr.238.1621012798455; 
 Fri, 14 May 2021 10:19:58 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id x14sm1302547oic.3.2021.05.14.10.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 10:19:57 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v10 2/4] ASoC: Add Rockchip rk817 audio CODEC support
Date: Fri, 14 May 2021 12:19:38 -0500
Message-Id: <20210514171940.20831-3-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514171940.20831-1-macroalpha82@gmail.com>
References: <20210514171940.20831-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, heiko@sntech.de,
 devicetree@vger.kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, broonie@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 lee.jones@linaro.org, maccraft123mc@gmail.com
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

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Rockchip rk817 audio codec integrated into the
rk817 PMIC. This is based on the sources provided by Rockchip from
their BSP kernel.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Tested-by: Maciej Matuszczyk <maccraft123mc@gmail.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/Kconfig       |   6 +
 sound/soc/codecs/Makefile      |   2 +
 sound/soc/codecs/rk817_codec.c | 558 +++++++++++++++++++++++++++++++++
 3 files changed, 566 insertions(+)
 create mode 100644 sound/soc/codecs/rk817_codec.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 2a7b3e363069..4fbd404566c5 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -155,6 +155,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_PCM512x_I2C
 	imply SND_SOC_PCM512x_SPI
 	imply SND_SOC_RK3328
+	imply SND_SOC_RK817
 	imply SND_SOC_RT274
 	imply SND_SOC_RT286
 	imply SND_SOC_RT298
@@ -1063,6 +1064,11 @@ config SND_SOC_RK3328
 	tristate "Rockchip RK3328 audio CODEC"
 	select REGMAP_MMIO
 
+config SND_SOC_RK817
+	tristate "Rockchip RK817 audio CODEC"
+	depends on MFD_RK808
+	select REGMAP_I2C
+
 config SND_SOC_RL6231
 	tristate
 	default y if SND_SOC_RT5514=y
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 0efdba609048..d4a75ba43c18 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -166,6 +166,7 @@ snd-soc-pcm512x-objs := pcm512x.o
 snd-soc-pcm512x-i2c-objs := pcm512x-i2c.o
 snd-soc-pcm512x-spi-objs := pcm512x-spi.o
 snd-soc-rk3328-objs := rk3328_codec.o
+snd-soc-rk817-objs := rk817_codec.o
 snd-soc-rl6231-objs := rl6231.o
 snd-soc-rl6347a-objs := rl6347a.o
 snd-soc-rt1011-objs := rt1011.o
@@ -487,6 +488,7 @@ obj-$(CONFIG_SND_SOC_PCM512x)	+= snd-soc-pcm512x.o
 obj-$(CONFIG_SND_SOC_PCM512x_I2C)	+= snd-soc-pcm512x-i2c.o
 obj-$(CONFIG_SND_SOC_PCM512x_SPI)	+= snd-soc-pcm512x-spi.o
 obj-$(CONFIG_SND_SOC_RK3328)	+= snd-soc-rk3328.o
+obj-$(CONFIG_SND_SOC_RK817)	+= snd-soc-rk817.o
 obj-$(CONFIG_SND_SOC_RL6231)	+= snd-soc-rl6231.o
 obj-$(CONFIG_SND_SOC_RL6347A)	+= snd-soc-rl6347a.o
 obj-$(CONFIG_SND_SOC_RT1011)	+= snd-soc-rt1011.o
diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
new file mode 100644
index 000000000000..8f4e9c0983ae
--- /dev/null
+++ b/sound/soc/codecs/rk817_codec.c
@@ -0,0 +1,558 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// rk817 ALSA SoC Audio driver
+//
+// Copyright (c) 2018, Fuzhou Rockchip Electronics Co., Ltd All rights reserved.
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/mfd/rk808.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <sound/core.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+
+struct rk817_codec_priv {
+	struct snd_soc_component *component;
+	struct rk808 *rk808;
+	struct clk *mclk;
+	unsigned int stereo_sysclk;
+	bool mic_in_differential;
+};
+
+/*
+ * This sets the codec up with the values defined in the default implementation including the APLL
+ * from the Rockchip vendor kernel. I do not know if these values are universal despite differing
+ * from the default values defined above and taken from the datasheet, or implementation specific.
+ * I don't have another implementation to compare from the Rockchip sources. Hard-coding for now.
+ * Additionally, I do not know according to the documentation the units accepted for the clock
+ * values, so for the moment those are left unvalidated.
+ */
+
+static int rk817_init(struct snd_soc_component *component)
+{
+	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
+
+	snd_soc_component_write(component, RK817_CODEC_DDAC_POPD_DACST, 0x02);
+	snd_soc_component_write(component, RK817_CODEC_DDAC_SR_LMT0, 0x02);
+	snd_soc_component_write(component, RK817_CODEC_DADC_SR_ACL0, 0x02);
+	snd_soc_component_write(component, RK817_CODEC_DTOP_VUCTIME, 0xf4);
+	if (rk817->mic_in_differential) {
+		snd_soc_component_update_bits(component, RK817_CODEC_AMIC_CFG0, MIC_DIFF_MASK,
+			MIC_DIFF_EN);
+	};
+	return 0;
+}
+
+static int rk817_set_component_pll(struct snd_soc_component *component,
+		int pll_id, int source, unsigned int freq_in,
+		unsigned int freq_out)
+{
+	/* Set resistor value and charge pump current for PLL. */
+	snd_soc_component_write(component, RK817_CODEC_APLL_CFG1, 0x58);
+	/* Set the PLL feedback clock divide value (values not documented). */
+	snd_soc_component_write(component, RK817_CODEC_APLL_CFG2, 0x2d);
+	/* Set the PLL pre-divide value (values not documented). */
+	snd_soc_component_write(component, RK817_CODEC_APLL_CFG3, 0x0c);
+	/* Set the PLL VCO output clock divide and PLL divided ratio of PLL High Clk (values not
+	 * documented).
+	 */
+	snd_soc_component_write(component, RK817_CODEC_APLL_CFG4, 0xa5);
+
+	return 0;
+}
+
+/*
+ * DDAC/DADC L/R volume setting
+ * 0db~-95db, 0.375db/step, for example:
+ * 0x00: 0dB
+ * 0xff: -95dB
+ */
+
+static const DECLARE_TLV_DB_MINMAX(rk817_vol_tlv, -9500, 0);
+
+/*
+ * PGA GAIN L/R volume setting
+ * 27db~-18db, 3db/step, for example:
+ * 0x0: -18dB
+ * 0xf: 27dB
+ */
+
+static const DECLARE_TLV_DB_MINMAX(rk817_gain_tlv, -1800, 2700);
+
+static const struct snd_kcontrol_new rk817_volume_controls[] = {
+	SOC_DOUBLE_R_RANGE_TLV("Master Playback Volume", RK817_CODEC_DDAC_VOLL,
+		RK817_CODEC_DDAC_VOLR, 0, 0x00, 0xff, 1, rk817_vol_tlv),
+	SOC_DOUBLE_R_RANGE_TLV("Master Capture Volume", RK817_CODEC_DADC_VOLL,
+		RK817_CODEC_DADC_VOLR, 0, 0x00, 0xff, 1, rk817_vol_tlv),
+	SOC_DOUBLE_TLV("Mic Capture Gain", RK817_CODEC_DMIC_PGA_GAIN, 4, 0, 0xf, 0,
+		rk817_gain_tlv),
+};
+
+/* Since the speaker output and L headphone pin are internally the same, make audio path mutually
+ * exclusive with a mux.
+ */
+
+static const char *dac_mux_text[] = {
+	"HP",
+	"SPK",
+};
+
+static SOC_ENUM_SINGLE_VIRT_DECL(dac_enum, dac_mux_text);
+
+static const struct snd_kcontrol_new dac_mux =
+	SOC_DAPM_ENUM("Playback Mux", dac_enum);
+
+static const struct snd_soc_dapm_widget rk817_dapm_widgets[] = {
+
+	/* capture/playback common */
+	SND_SOC_DAPM_SUPPLY("LDO Regulator", RK817_CODEC_AREF_RTCFG1, 6, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("IBIAS Block", RK817_CODEC_AREF_RTCFG1, 2, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("VAvg Buffer", RK817_CODEC_AREF_RTCFG1, 1, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("PLL Power", RK817_CODEC_APLL_CFG5, 0, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("I2S TX1 Transfer Start", RK817_CODEC_DI2S_RXCMD_TSD, 5, 0, NULL, 0),
+
+	/* capture path common */
+	SND_SOC_DAPM_SUPPLY("ADC Clock", RK817_CODEC_DTOP_DIGEN_CLKE, 7, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("I2S TX Clock", RK817_CODEC_DTOP_DIGEN_CLKE, 6, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("ADC Channel Enable", RK817_CODEC_DTOP_DIGEN_CLKE, 5, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("I2S TX Channel Enable", RK817_CODEC_DTOP_DIGEN_CLKE, 4, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("MIC Power On", RK817_CODEC_AMIC_CFG0, 6, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("I2S TX3 Transfer Start", RK817_CODEC_DI2S_TXCR3_TXCMD, 7, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("I2S TX3 Right Justified", RK817_CODEC_DI2S_TXCR3_TXCMD, 3, 0, NULL, 0),
+
+	/* capture path L */
+	SND_SOC_DAPM_ADC("ADC L", "Capture", RK817_CODEC_AADC_CFG0, 7, 1),
+	SND_SOC_DAPM_SUPPLY("PGA L Power On", RK817_CODEC_AMIC_CFG0, 5, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Mic Boost L1", RK817_CODEC_AMIC_CFG0, 3, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Mic Boost L2", RK817_CODEC_AMIC_CFG0, 2, 0, NULL, 0),
+
+	/* capture path R */
+	SND_SOC_DAPM_ADC("ADC R", "Capture", RK817_CODEC_AADC_CFG0, 6, 1),
+	SND_SOC_DAPM_SUPPLY("PGA R Power On", RK817_CODEC_AMIC_CFG0, 4, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Mic Boost R1", RK817_CODEC_AMIC_CFG0, 3, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Mic Boost R2", RK817_CODEC_AMIC_CFG0, 3, 0, NULL, 0),
+
+	/* playback path common */
+	SND_SOC_DAPM_SUPPLY("DAC Clock", RK817_CODEC_DTOP_DIGEN_CLKE, 3, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("I2S RX Clock", RK817_CODEC_DTOP_DIGEN_CLKE, 2, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DAC Channel Enable", RK817_CODEC_DTOP_DIGEN_CLKE, 1, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("I2S RX Channel Enable", RK817_CODEC_DTOP_DIGEN_CLKE, 0, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DAC Bias", RK817_CODEC_ADAC_CFG1, 3, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("DAC Mute Off", RK817_CODEC_DDAC_MUTE_MIXCTL, 0, 1, NULL, 0),
+
+	/* playback path speaker */
+	SND_SOC_DAPM_SUPPLY("Class D Mode", RK817_CODEC_DDAC_MUTE_MIXCTL, 4, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("High Pass Filter", RK817_CODEC_DDAC_MUTE_MIXCTL, 7, 0, NULL, 0),
+	SND_SOC_DAPM_DAC("SPK DAC", "Playback", RK817_CODEC_ADAC_CFG1, 2, 1),
+	SND_SOC_DAPM_SUPPLY("Enable Class D", RK817_CODEC_ACLASSD_CFG1, 7, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Disable Class D Mute Ramp", RK817_CODEC_ACLASSD_CFG1, 6, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Class D Mute Rate 1", RK817_CODEC_ACLASSD_CFG1, 3, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Class D Mute Rate 2", RK817_CODEC_ACLASSD_CFG1, 2, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Class D OCPP 2", RK817_CODEC_ACLASSD_CFG2, 5, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Class D OCPP 3", RK817_CODEC_ACLASSD_CFG2, 4, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Class D OCPN 2", RK817_CODEC_ACLASSD_CFG2, 1, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Class D OCPN 3", RK817_CODEC_ACLASSD_CFG2, 0, 0, NULL, 0),
+
+	/* playback path headphones */
+	SND_SOC_DAPM_SUPPLY("Headphone Charge Pump", RK817_CODEC_AHP_CP, 4, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Headphone CP Discharge LDO", RK817_CODEC_AHP_CP, 3, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Headphone OStage", RK817_CODEC_AHP_CFG0, 6, 1, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("Headphone Pre Amp", RK817_CODEC_AHP_CFG0, 5, 1, NULL, 0),
+	SND_SOC_DAPM_DAC("DAC L", "Playback", RK817_CODEC_ADAC_CFG1, 1, 1),
+	SND_SOC_DAPM_DAC("DAC R", "Playback", RK817_CODEC_ADAC_CFG1, 0, 1),
+
+	/* Mux for input/output path selection */
+	SND_SOC_DAPM_MUX("Playback Mux", SND_SOC_NOPM, 1, 0, &dac_mux),
+
+	/* Pins for Simple Card Bindings */
+	SND_SOC_DAPM_INPUT("MICL"),
+	SND_SOC_DAPM_INPUT("MICR"),
+	SND_SOC_DAPM_OUTPUT("HPOL"),
+	SND_SOC_DAPM_OUTPUT("HPOR"),
+	SND_SOC_DAPM_OUTPUT("SPKO"),
+};
+
+static const struct snd_soc_dapm_route rk817_dapm_routes[] = {
+
+	/* capture path */
+	/* left mic */
+	{"ADC L", NULL, "LDO Regulator"},
+	{"ADC L", NULL, "IBIAS Block"},
+	{"ADC L", NULL, "VAvg Buffer"},
+	{"ADC L", NULL, "PLL Power"},
+	{"ADC L", NULL, "ADC Clock"},
+	{"ADC L", NULL, "I2S TX Clock"},
+	{"ADC L", NULL, "ADC Channel Enable"},
+	{"ADC L", NULL, "I2S TX Channel Enable"},
+	{"ADC L", NULL, "I2S TX1 Transfer Start"},
+	{"MICL", NULL, "MIC Power On"},
+	{"MICL", NULL, "PGA L Power On"},
+	{"MICL", NULL, "Mic Boost L1"},
+	{"MICL", NULL, "Mic Boost L2"},
+	{"MICL", NULL, "I2S TX3 Transfer Start"},
+	{"MICL", NULL, "I2S TX3 Right Justified"},
+	{"ADC L", NULL, "MICL"},
+
+	/* right mic */
+	{"ADC R", NULL, "LDO Regulator"},
+	{"ADC R", NULL, "IBIAS Block"},
+	{"ADC R", NULL, "VAvg Buffer"},
+	{"ADC R", NULL, "PLL Power"},
+	{"ADC R", NULL, "ADC Clock"},
+	{"ADC R", NULL, "I2S TX Clock"},
+	{"ADC R", NULL, "ADC Channel Enable"},
+	{"ADC R", NULL, "I2S TX Channel Enable"},
+	{"ADC R", NULL, "I2S TX1 Transfer Start"},
+	{"MICR", NULL, "MIC Power On"},
+	{"MICR", NULL, "PGA R Power On"},
+	{"MICR", NULL, "Mic Boost R1"},
+	{"MICR", NULL, "Mic Boost R2"},
+	{"MICR", NULL, "I2S TX3 Transfer Start"},
+	{"MICR", NULL, "I2S TX3 Right Justified"},
+	{"ADC R", NULL, "MICR"},
+
+	/* playback path */
+	/* speaker path */
+	{"SPK DAC", NULL, "LDO Regulator"},
+	{"SPK DAC", NULL, "IBIAS Block"},
+	{"SPK DAC", NULL, "VAvg Buffer"},
+	{"SPK DAC", NULL, "PLL Power"},
+	{"SPK DAC", NULL, "I2S TX1 Transfer Start"},
+	{"SPK DAC", NULL, "DAC Clock"},
+	{"SPK DAC", NULL, "I2S RX Clock"},
+	{"SPK DAC", NULL, "DAC Channel Enable"},
+	{"SPK DAC", NULL, "I2S RX Channel Enable"},
+	{"SPK DAC", NULL, "Class D Mode"},
+	{"SPK DAC", NULL, "DAC Bias"},
+	{"SPK DAC", NULL, "DAC Mute Off"},
+	{"SPK DAC", NULL, "Enable Class D"},
+	{"SPK DAC", NULL, "Disable Class D Mute Ramp"},
+	{"SPK DAC", NULL, "Class D Mute Rate 1"},
+	{"SPK DAC", NULL, "Class D Mute Rate 2"},
+	{"SPK DAC", NULL, "Class D OCPP 2"},
+	{"SPK DAC", NULL, "Class D OCPP 3"},
+	{"SPK DAC", NULL, "Class D OCPN 2"},
+	{"SPK DAC", NULL, "Class D OCPN 3"},
+	{"SPK DAC", NULL, "High Pass Filter"},
+
+	/* headphone path L */
+	{"DAC L", NULL, "LDO Regulator"},
+	{"DAC L", NULL, "IBIAS Block"},
+	{"DAC L", NULL, "VAvg Buffer"},
+	{"DAC L", NULL, "PLL Power"},
+	{"DAC L", NULL, "I2S TX1 Transfer Start"},
+	{"DAC L", NULL, "DAC Clock"},
+	{"DAC L", NULL, "I2S RX Clock"},
+	{"DAC L", NULL, "DAC Channel Enable"},
+	{"DAC L", NULL, "I2S RX Channel Enable"},
+	{"DAC L", NULL, "DAC Bias"},
+	{"DAC L", NULL, "DAC Mute Off"},
+	{"DAC L", NULL, "Headphone Charge Pump"},
+	{"DAC L", NULL, "Headphone CP Discharge LDO"},
+	{"DAC L", NULL, "Headphone OStage"},
+	{"DAC L", NULL, "Headphone Pre Amp"},
+
+	/* headphone path R */
+	{"DAC R", NULL, "LDO Regulator"},
+	{"DAC R", NULL, "IBIAS Block"},
+	{"DAC R", NULL, "VAvg Buffer"},
+	{"DAC R", NULL, "PLL Power"},
+	{"DAC R", NULL, "I2S TX1 Transfer Start"},
+	{"DAC R", NULL, "DAC Clock"},
+	{"DAC R", NULL, "I2S RX Clock"},
+	{"DAC R", NULL, "DAC Channel Enable"},
+	{"DAC R", NULL, "I2S RX Channel Enable"},
+	{"DAC R", NULL, "DAC Bias"},
+	{"DAC R", NULL, "DAC Mute Off"},
+	{"DAC R", NULL, "Headphone Charge Pump"},
+	{"DAC R", NULL, "Headphone CP Discharge LDO"},
+	{"DAC R", NULL, "Headphone OStage"},
+	{"DAC R", NULL, "Headphone Pre Amp"},
+
+	/* mux path for output selection */
+	{"Playback Mux", "HP", "DAC L"},
+	{"Playback Mux", "HP", "DAC R"},
+	{"Playback Mux", "SPK", "SPK DAC"},
+	{"SPKO", NULL, "Playback Mux"},
+	{"HPOL", NULL, "Playback Mux"},
+	{"HPOR", NULL, "Playback Mux"},
+};
+
+static int rk817_set_dai_sysclk(struct snd_soc_dai *codec_dai,
+				int clk_id, unsigned int freq, int dir)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
+
+	rk817->stereo_sysclk = freq;
+
+	return 0;
+}
+
+static int rk817_set_dai_fmt(struct snd_soc_dai *codec_dai,
+			     unsigned int fmt)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	unsigned int i2s_mst = 0;
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		i2s_mst |= RK817_I2S_MODE_SLV;
+		break;
+	case SND_SOC_DAIFMT_CBM_CFM:
+		i2s_mst |= RK817_I2S_MODE_MST;
+		break;
+	default:
+		dev_err(component->dev, "%s : set master mask failed!\n", __func__);
+		return -EINVAL;
+	}
+
+	snd_soc_component_update_bits(component, RK817_CODEC_DI2S_CKM,
+				      RK817_I2S_MODE_MASK, i2s_mst);
+
+	return 0;
+}
+
+static int rk817_hw_params(struct snd_pcm_substream *substream,
+			   struct snd_pcm_hw_params *params,
+			    struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		snd_soc_component_write(component, RK817_CODEC_DI2S_RXCR2,
+					VDW_RX_16BITS);
+		snd_soc_component_write(component, RK817_CODEC_DI2S_TXCR2,
+					VDW_TX_16BITS);
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+	case SNDRV_PCM_FORMAT_S32_LE:
+		snd_soc_component_write(component, RK817_CODEC_DI2S_RXCR2,
+					VDW_RX_24BITS);
+		snd_soc_component_write(component, RK817_CODEC_DI2S_TXCR2,
+					VDW_TX_24BITS);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rk817_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct snd_soc_component *component = dai->component;
+
+	if (mute)
+		snd_soc_component_update_bits(component,
+					      RK817_CODEC_DDAC_MUTE_MIXCTL,
+					      DACMT_MASK, DACMT_ENABLE);
+	else
+		snd_soc_component_update_bits(component,
+					      RK817_CODEC_DDAC_MUTE_MIXCTL,
+					      DACMT_MASK, DACMT_DISABLE);
+
+	return 0;
+}
+
+#define RK817_PLAYBACK_RATES (SNDRV_PCM_RATE_8000 |\
+			      SNDRV_PCM_RATE_16000 |	\
+			      SNDRV_PCM_RATE_32000 |	\
+			      SNDRV_PCM_RATE_44100 |	\
+			      SNDRV_PCM_RATE_48000 |	\
+			      SNDRV_PCM_RATE_96000)
+
+#define RK817_CAPTURE_RATES (SNDRV_PCM_RATE_8000 |\
+			      SNDRV_PCM_RATE_16000 |	\
+			      SNDRV_PCM_RATE_32000 |	\
+			      SNDRV_PCM_RATE_44100 |	\
+			      SNDRV_PCM_RATE_48000 |	\
+			      SNDRV_PCM_RATE_96000)
+
+#define RK817_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			SNDRV_PCM_FMTBIT_S20_3LE |\
+			SNDRV_PCM_FMTBIT_S24_LE |\
+			SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_ops rk817_dai_ops = {
+	.hw_params	= rk817_hw_params,
+	.set_fmt	= rk817_set_dai_fmt,
+	.set_sysclk	= rk817_set_dai_sysclk,
+	.mute_stream	= rk817_digital_mute,
+	.no_capture_mute	= 1,
+};
+
+static struct snd_soc_dai_driver rk817_dai[] = {
+	{
+		.name = "rk817-hifi",
+		.playback = {
+			.stream_name = "Playback",
+			.channels_min = 2,
+			.channels_max = 8,
+			.rates = RK817_PLAYBACK_RATES,
+			.formats = RK817_FORMATS,
+		},
+		.capture = {
+			.stream_name = "Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = RK817_CAPTURE_RATES,
+			.formats = RK817_FORMATS,
+		},
+		.ops = &rk817_dai_ops,
+	},
+};
+
+static int rk817_probe(struct snd_soc_component *component)
+{
+	struct rk817_codec_priv *rk817 = snd_soc_component_get_drvdata(component);
+	struct rk808 *rk808 = dev_get_drvdata(component->dev->parent);
+	int ret;
+
+	snd_soc_component_init_regmap(component, rk808->regmap);
+	rk817->component = component;
+
+	ret = snd_soc_component_write(component, RK817_CODEC_DTOP_LPT_SRST, 0x40);
+
+	rk817_init(component);
+
+	/* setting initial pll values so that we can continue to leverage simple-audio-card.
+	 * The values aren't important since no parameters are used.
+	 */
+
+	snd_soc_component_set_pll(component, 0, 0, 0, 0);
+
+	return 0;
+}
+
+static void rk817_remove(struct snd_soc_component *component)
+{
+	snd_soc_component_exit_regmap(component);
+}
+
+static const struct snd_soc_component_driver soc_codec_dev_rk817 = {
+	.probe = rk817_probe,
+	.remove = rk817_remove,
+	.idle_bias_on = 1,
+	.use_pmdown_time = 1,
+	.endianness = 1,
+	.non_legacy_dai_naming = 1,
+	.controls = rk817_volume_controls,
+	.num_controls = ARRAY_SIZE(rk817_volume_controls),
+	.dapm_routes = rk817_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(rk817_dapm_routes),
+	.dapm_widgets = rk817_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(rk817_dapm_widgets),
+	.set_pll = rk817_set_component_pll,
+};
+
+static int rk817_codec_parse_dt_property(struct device *dev,
+					 struct rk817_codec_priv *rk817)
+{
+	struct device_node *node = dev->parent->of_node;
+
+	if (!node) {
+		dev_err(dev, "%s() dev->parent->of_node is NULL\n",
+			__func__);
+		return -ENODEV;
+	}
+
+	node = of_get_child_by_name(dev->parent->of_node, "codec");
+	if (!node) {
+		dev_dbg(dev, "%s() Can not get child: codec\n",
+			__func__);
+		return -ENODEV;
+	}
+
+	rk817->mic_in_differential =
+			of_property_read_bool(node, "rockchip,mic-in-differential");
+
+	return 0;
+}
+
+static int rk817_platform_probe(struct platform_device *pdev)
+{
+	struct rk808 *rk808 = dev_get_drvdata(pdev->dev.parent);
+	struct rk817_codec_priv *rk817_codec_data;
+	int ret;
+
+	if (!rk808) {
+		dev_err(&pdev->dev, "%s : rk817 is NULL\n", __func__);
+		return -EINVAL;
+	}
+
+	rk817_codec_data = devm_kzalloc(&pdev->dev,
+					sizeof(struct rk817_codec_priv),
+					GFP_KERNEL);
+	if (!rk817_codec_data)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, rk817_codec_data);
+
+	rk817_codec_data->rk808 = rk808;
+
+	ret = rk817_codec_parse_dt_property(&pdev->dev, rk817_codec_data);
+	if (ret < 0) {
+		dev_dbg(&pdev->dev, "%s() parse device tree property error %d\n",
+			__func__, ret);
+		goto err_;
+	}
+
+	rk817_codec_data->mclk = clk_get(pdev->dev.parent, "mclk");
+	if (IS_ERR(rk817_codec_data->mclk)) {
+		dev_err(&pdev->dev, "Unable to get mclk\n");
+		ret = -ENXIO;
+		goto err_;
+	}
+
+	ret = clk_prepare_enable(rk817_codec_data->mclk);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "%s() clock prepare error %d\n",
+			__func__, ret);
+		goto err_;
+	}
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &soc_codec_dev_rk817,
+					      rk817_dai, ARRAY_SIZE(rk817_dai));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "%s() register codec error %d\n",
+			__func__, ret);
+		goto err_;
+	}
+
+	return 0;
+err_:
+
+	return ret;
+}
+
+static int rk817_platform_remove(struct platform_device *pdev)
+{
+	struct rk817_codec_priv *rk817 = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(rk817->mclk);
+
+	return 0;
+}
+
+static struct platform_driver rk817_codec_driver = {
+	.driver = {
+		   .name = "rk817-codec",
+		   },
+	.probe = rk817_platform_probe,
+	.remove = rk817_platform_remove,
+};
+
+module_platform_driver(rk817_codec_driver);
+
+MODULE_DESCRIPTION("ASoC RK817 codec driver");
+MODULE_AUTHOR("binyuan <kevan.lan@rock-chips.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1


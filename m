Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A9D37F5CE
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 12:45:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A172F17D4;
	Thu, 13 May 2021 12:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A172F17D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620902709;
	bh=xhVSqF2Ii4/Ld8ECyfoy9lCiv1Vx3yE56cN42S3iOGU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LUQCNpBBkEcUNF/y/+oMhUXwDqo0ebp5SE0MVsnzl2jmmoyIHpz1KLR3FkwUK6bbr
	 Qds4n1qdsFAuEtiEYJMrPOBAAKgC1kHU+58ci0pMc+pW+4ZAoFKc7gR2ZEGvnVg2SO
	 l2kqIk1lo1/+ZUPKnGxp+FzJrOILkxr1e+TEnXGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32A7BF8016B;
	Thu, 13 May 2021 12:43:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7793BF8016B; Thu, 13 May 2021 12:43:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A4CCF80156
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 12:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A4CCF80156
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="J3C5Qu+0"
ARC-Seal: i=1; a=rsa-sha256; t=1620902604; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=dvWio0d3C8tL3wz0u7Aw03KSFZNNqVxKslWGB6i+DlnhnWgSctrtqBcHWRADycHPP5
 0ggBp4WDnIdIBimDPXgdE743AOvIEkz26G45lXuS8EfYZ2kIDNhwtXN6498iXAL8tLkU
 KdH7g0VHMDnshrC519c+kadjhOZGN756hSFKU8O3qAbOwTclvF3XP8lWjBzc/IXlE8s+
 dz9dye4UNND0TtHd9ubjNyzPBPzELIZoqVXechVwsH/eqnAOU21sZUuBYrTuDAAtYfjU
 3qpkz+nTlUT8g4PFkPezUUjPIIDpAgFbhuSRg9bEsTAf7rgJatMCJj5vSUueo0JZua+a
 5MmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620902604;
 s=strato-dkim-0002; d=strato.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=IsbpEsgbbvnnzGPsaDkOD9zDycMHYyB7lT+Wai1GJkc=;
 b=j2tfLwZS8MHtBTsQRs2AW0V70F6gL7BgHyaqtbR95O9n4DAxrZygPDS+dZOTCHI7u0
 9jBL3TAOr/me23OiXuQIYMeTKQkLeSQqNyDrZVXny6v/6NqXXk9DLtGaSxL24/YdilxT
 W/J9j1c7TlncQ/M56uDTMclMbIpjbfMBhINAo/hs83+TRYqnpy/5Wj5QbG13fAzDhZOI
 tCoKqs+k5mPOe3dqV79UtvY71e0BhDsN8J8KkLX1ORMiNaE6rtUs+8PiEIdD1xHGkgMl
 WqdRT5MdkfE2rdj9w+1HCO1PIXaK8UlAbOpr1U6FEP717Z6AyQTLRb6pfOTXNksn/aMt
 iFPg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620902604;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=IsbpEsgbbvnnzGPsaDkOD9zDycMHYyB7lT+Wai1GJkc=;
 b=J3C5Qu+07hwTC16auimdIAGIBCgOKV2hO1D41JelEdSI6GnJxacYTiFlzTDLGmRH22
 IX6SVNW7kso5McsSaZKQT5H4zcjLsQpXyUanCQE77ifa05ZCbdWe8Tsy1HRwq80tdZKr
 iqLqooYfCN8jyLkUoD5S8FpDYRy8JU7bplSPHfACNc9J5ZLaaRu6jqGAf2Lmb9z5mZ1f
 NOHgz6amF4vq17ZutjXXwvI28+EBKz9Ho4M8abDQQsghTyElAjhk4p2uVyScQdBr4g2F
 JG7WGQk/tyt47tyVqXKJKyZTFjeOSrZJjlyfILa37hElFYUYjP984iQtW5GsP/SiQZ9D
 bcZA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6OJCs="
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.25.7 DYNA|AUTH)
 with ESMTPSA id j06c13x4DAhNA9I
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 13 May 2021 12:43:23 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [RFC PATCH 2/2] ASoC: codecs: Add driver for NXP/Goodix TFA989x
 (TFA1) amplifiers
Date: Thu, 13 May 2021 12:41:29 +0200
Message-Id: <20210513104129.36583-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210513104129.36583-1-stephan@gerhold.net>
References: <20210513104129.36583-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Vincent Knecht <vincent.knecht@mailoo.org>
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

NXP's TFA98xx (now part of Goodix) are fairly popular speaker amplifiers
used in many smartphones and tablets. Most of them are sold as "smart
amplifiers" with built-in "CoolFlux DSP" that is used for volume control,
plus a "sophisticated speaker-boost and protection algorithm".

Unfortunately, they are also almost entirely undocumented. The short
datasheets (e.g. [1] for TFA9897) describe the available features,
but do not provide any information about the registers or how to use
the "CoolFlux DSP".

The amplifiers are most often configured through proprietary userspace
libraries. There are also some (rather complex) kernel drivers (e.g. [2])
but even those rely on obscure firmware blobs for configuration (so-called
"containers"). They seem to contain different "profiles" with tuned speaker
settings, sample rates and volume steps (which would be better exposed
as separate ALSA mixers).

The format of the firmware files seems to have changed a lot over the time,
so it's not even possible to simply re-use the firmware originally provided
by the vendor.

Overall, it seems close to impossible to develop a proper mainline driver
for these amplifiers that could make proper use of the built-in DSP.

This commit implements a compromise: At least the TFA1 family of the
TFA98xx amplifiers (usually called TFA989x) provide a way to *bypass*
the DSP using a special register sequence. The register sequence can be
found in similar variations in the kernel drivers from lots of vendors
e.g. in [3] and was probably mainly used for factory testing.

With the DSP bypassed, the amplifier acts mostly like a dumb standard
speaker amplifier, without (hardware) volume control. However, the setup
is much simpler and it works without any obscure firmware.

This driver implements the DSP bypass combined with chip-specific
initialization sequences adapted from [2]. Only TFA9895 is supported in
this initial commit. Except for the lack of volume control I can not hear
any difference with or without the DSP, it works just fine.

This driver allows the speaker to work on mainline Linux running on the
Samsung Galaxy A3/A5 (2015) [TFA9895] and Alcatel Idol 3 [TFA9897].
TFA9897 support will be added in separate patch set later.

[1]: https://product.goodix.com/en/docview/TFA9897%20SDS_Rev.3.1?objectId=47&objectType=document&version=78
[2]: https://source.codeaurora.org/external/mas/tfa98xx
[3]: https://github.com/sonyxperiadev/kernel/blob/57b5050e340f40a88e1ddb8d16fd9adb44418923/sound/soc/codecs/tfa98xx.c#L1422-L1462

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 MAINTAINERS                |   7 +
 sound/soc/codecs/Kconfig   |  11 ++
 sound/soc/codecs/Makefile  |   2 +
 sound/soc/codecs/tfa989x.c | 298 +++++++++++++++++++++++++++++++++++++
 4 files changed, 318 insertions(+)
 create mode 100644 sound/soc/codecs/tfa989x.c

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..33079fddc7b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13204,6 +13204,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/tfa9879.txt
 F:	sound/soc/codecs/tfa9879*
 
+NXP/Goodix TFA989X (TFA1) DRIVER
+M:	Stephan Gerhold <stephan@gerhold.net>
+L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
+F:	sound/soc/codecs/tfa989x.c
+
 NXP-NCI NFC DRIVER
 M:	Clément Perrochaud <clement.perrochaud@effinnov.com>
 R:	Charles Gorand <charles.gorand@effinnov.com>
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 2a7b3e363069..196919bc27ab 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -211,6 +211,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_TAS6424
 	imply SND_SOC_TDA7419
 	imply SND_SOC_TFA9879
+	imply SND_SOC_TFA989X
 	imply SND_SOC_TLV320ADCX140
 	imply SND_SOC_TLV320AIC23_I2C
 	imply SND_SOC_TLV320AIC23_SPI
@@ -1408,6 +1409,16 @@ config SND_SOC_TFA9879
 	tristate "NXP Semiconductors TFA9879 amplifier"
 	depends on I2C
 
+config SND_SOC_TFA989X
+	tristate "NXP/Goodix TFA989X (TFA1) amplifiers"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Enable support for NXP (now Goodix) TFA989X (TFA1 family) speaker
+	  amplifiers, e.g. TFA9895.
+	  Note that the driver currently bypasses the built-in "CoolFlux DSP"
+	  and does not support (hardware) volume control.
+
 config SND_SOC_TLV320AIC23
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 0efdba609048..8c7257035e4c 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -229,6 +229,7 @@ snd-soc-tas6424-objs := tas6424.o
 snd-soc-tda7419-objs := tda7419.o
 snd-soc-tas2770-objs := tas2770.o
 snd-soc-tfa9879-objs := tfa9879.o
+snd-soc-tfa989x-objs := tfa989x.o
 snd-soc-tlv320aic23-objs := tlv320aic23.o
 snd-soc-tlv320aic23-i2c-objs := tlv320aic23-i2c.o
 snd-soc-tlv320aic23-spi-objs := tlv320aic23-spi.o
@@ -551,6 +552,7 @@ obj-$(CONFIG_SND_SOC_TAS6424)	+= snd-soc-tas6424.o
 obj-$(CONFIG_SND_SOC_TDA7419)	+= snd-soc-tda7419.o
 obj-$(CONFIG_SND_SOC_TAS2770) += snd-soc-tas2770.o
 obj-$(CONFIG_SND_SOC_TFA9879)	+= snd-soc-tfa9879.o
+obj-$(CONFIG_SND_SOC_TFA989X)	+= snd-soc-tfa989x.o
 obj-$(CONFIG_SND_SOC_TLV320AIC23)	+= snd-soc-tlv320aic23.o
 obj-$(CONFIG_SND_SOC_TLV320AIC23_I2C)	+= snd-soc-tlv320aic23-i2c.o
 obj-$(CONFIG_SND_SOC_TLV320AIC23_SPI)	+= snd-soc-tlv320aic23-spi.o
diff --git a/sound/soc/codecs/tfa989x.c b/sound/soc/codecs/tfa989x.c
new file mode 100644
index 000000000000..408e26eee108
--- /dev/null
+++ b/sound/soc/codecs/tfa989x.c
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021 Stephan Gerhold
+ *
+ * Register definitions/sequences taken from various tfa98xx kernel drivers:
+ * Copyright (C) 2014-2020 NXP Semiconductors, All Rights Reserved.
+ * Copyright (C) 2013 Sony Mobile Communications Inc.
+ */
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+
+#define TFA989X_STATUSREG		0x00
+#define TFA989X_BATTERYVOLTAGE		0x01
+#define TFA989X_TEMPERATURE		0x02
+#define TFA989X_REVISIONNUMBER		0x03
+#define TFA989X_REVISIONNUMBER_REV_MSK	GENMASK(7, 0)	/* device revision */
+#define TFA989X_I2SREG			0x04
+#define TFA989X_I2SREG_CHSA		6	/* amplifier input select */
+#define TFA989X_I2SREG_CHSA_MSK		GENMASK(7, 6)
+#define TFA989X_I2SREG_I2SSR		12	/* sample rate */
+#define TFA989X_I2SREG_I2SSR_MSK	GENMASK(15, 12)
+#define TFA989X_BAT_PROT		0x05
+#define TFA989X_AUDIO_CTR		0x06
+#define TFA989X_DCDCBOOST		0x07
+#define TFA989X_SPKR_CALIBRATION	0x08
+#define TFA989X_SYS_CTRL		0x09
+#define TFA989X_SYS_CTRL_PWDN		0	/* power down */
+#define TFA989X_SYS_CTRL_I2CR		1	/* I2C reset */
+#define TFA989X_SYS_CTRL_CFE		2	/* enable CoolFlux DSP */
+#define TFA989X_SYS_CTRL_AMPE		3	/* enable amplifier */
+#define TFA989X_SYS_CTRL_DCA		4	/* enable boost */
+#define TFA989X_SYS_CTRL_SBSL		5	/* DSP configured */
+#define TFA989X_SYS_CTRL_AMPC		6	/* amplifier enabled by DSP */
+#define TFA989X_I2S_SEL_REG		0x0a
+#define TFA989X_I2S_SEL_REG_SPKR_MSK	GENMASK(10, 9)	/* speaker impedance */
+#define TFA989X_I2S_SEL_REG_DCFG_MSK	GENMASK(14, 11)	/* DCDC compensation */
+#define TFA989X_PWM_CONTROL		0x41
+#define TFA989X_CURRENTSENSE1		0x46
+#define TFA989X_CURRENTSENSE2		0x47
+#define TFA989X_CURRENTSENSE3		0x48
+#define TFA989X_CURRENTSENSE4		0x49
+
+#define TFA9895_REVISION		0x12
+
+struct tfa989x_rev {
+	unsigned int rev;
+	int (*init)(struct regmap *regmap);
+};
+
+static bool tfa989x_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return reg > TFA989X_REVISIONNUMBER;
+}
+
+static bool tfa989x_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg < TFA989X_REVISIONNUMBER;
+}
+
+static const struct regmap_config tfa989x_regmap = {
+	.reg_bits = 8,
+	.val_bits = 16,
+
+	.writeable_reg	= tfa989x_writeable_reg,
+	.volatile_reg	= tfa989x_volatile_reg,
+	.cache_type	= REGCACHE_RBTREE,
+};
+
+static const char * const chsa_text[] = { "Left", "Right", /* "DSP" */ };
+static SOC_ENUM_SINGLE_DECL(chsa_enum, TFA989X_I2SREG, TFA989X_I2SREG_CHSA, chsa_text);
+static const struct snd_kcontrol_new chsa_mux = SOC_DAPM_ENUM("Amp Input", chsa_enum);
+
+static const struct snd_soc_dapm_widget tfa989x_dapm_widgets[] = {
+	SND_SOC_DAPM_OUTPUT("OUT"),
+	SND_SOC_DAPM_SUPPLY("POWER", TFA989X_SYS_CTRL, TFA989X_SYS_CTRL_PWDN, 1, NULL, 0),
+	SND_SOC_DAPM_OUT_DRV("AMPE", TFA989X_SYS_CTRL, TFA989X_SYS_CTRL_AMPE, 0, NULL, 0),
+
+	SND_SOC_DAPM_MUX("Amp Input", SND_SOC_NOPM, 0, 0, &chsa_mux),
+	SND_SOC_DAPM_AIF_IN("AIFINL", "HiFi Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("AIFINR", "HiFi Playback", 1, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route tfa989x_dapm_routes[] = {
+	{"OUT", NULL, "AMPE"},
+	{"AMPE", NULL, "POWER"},
+	{"AMPE", NULL, "Amp Input"},
+	{"Amp Input", "Left", "AIFINL"},
+	{"Amp Input", "Right", "AIFINR"},
+};
+
+static const struct snd_soc_component_driver tfa989x_component = {
+	.dapm_widgets		= tfa989x_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tfa989x_dapm_widgets),
+	.dapm_routes		= tfa989x_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(tfa989x_dapm_routes),
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static const unsigned int tfa989x_rates[] = {
+	8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000
+};
+
+static int tfa989x_find_sample_rate(unsigned int rate)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(tfa989x_rates); ++i)
+		if (tfa989x_rates[i] == rate)
+			return i;
+
+	return -EINVAL;
+}
+
+static int tfa989x_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	int sr;
+
+	sr = tfa989x_find_sample_rate(params_rate(params));
+	if (sr < 0)
+		return sr;
+
+	return snd_soc_component_update_bits(component, TFA989X_I2SREG,
+					     TFA989X_I2SREG_I2SSR_MSK,
+					     sr << TFA989X_I2SREG_I2SSR);
+}
+
+static const struct snd_soc_dai_ops tfa989x_dai_ops = {
+	.hw_params = tfa989x_hw_params,
+};
+
+static struct snd_soc_dai_driver tfa989x_dai = {
+	.name = "tfa989x-hifi",
+	.playback = {
+		.stream_name	= "HiFi Playback",
+		.formats	= SNDRV_PCM_FMTBIT_S16_LE,
+		.rates		= SNDRV_PCM_RATE_8000_48000,
+		.rate_min	= 8000,
+		.rate_max	= 48000,
+		.channels_min	= 1,
+		.channels_max	= 2,
+	},
+	.ops = &tfa989x_dai_ops,
+};
+
+static const struct reg_sequence tfa9895_reg_init[] = {
+	/* some other registers must be set for optimal amplifier behaviour */
+	{ TFA989X_BAT_PROT, 0x13ab },
+	{ TFA989X_AUDIO_CTR, 0x001f },
+
+	/* peak voltage protection is always on, but may be written */
+	{ TFA989X_SPKR_CALIBRATION, 0x3c4e },
+
+	/* TFA989X_SYSCTRL_DCA = 0 */
+	{ TFA989X_SYS_CTRL, 0x024d },
+	{ TFA989X_PWM_CONTROL, 0x0308 },
+	{ TFA989X_CURRENTSENSE4, 0x0e82 },
+};
+
+static int tfa9895_init(struct regmap *regmap)
+{
+	return regmap_multi_reg_write(regmap, tfa9895_reg_init,
+				      ARRAY_SIZE(tfa9895_reg_init));
+}
+
+static const struct tfa989x_rev tfa9895_rev = {
+	.rev	= TFA9895_REVISION,
+	.init	= tfa9895_init,
+};
+
+/*
+ * Note: At the moment this driver bypasses the "CoolFlux DSP" built into the
+ * TFA989X amplifiers. Unfortunately, there seems to be absolutely
+ * no documentation for it - the public "short datasheets" do not provide
+ * any information about the DSP or available registers.
+ *
+ * Usually the TFA989X amplifiers are configured through proprietary userspace
+ * libraries. There are also some (rather complex) kernel drivers but even those
+ * rely on obscure firmware blobs for configuration (so-called "containers").
+ * They seem to contain different "profiles" with tuned speaker settings, sample
+ * rates and volume steps (which would be better exposed as separate ALSA mixers).
+ *
+ * Bypassing the DSP disables volume control (and perhaps some speaker
+ * optimization?), but at least allows using the speaker without obscure
+ * kernel drivers and firmware.
+ *
+ * Ideally NXP (or now Goodix) should release proper documentation for these
+ * amplifiers so that support for the "CoolFlux DSP" can be implemented properly.
+ */
+static int tfa989x_dsp_bypass(struct regmap *regmap)
+{
+	int ret;
+
+	/* Clear CHSA to bypass DSP and take input from I2S 1 left channel */
+	ret = regmap_clear_bits(regmap, TFA989X_I2SREG, TFA989X_I2SREG_CHSA_MSK);
+	if (ret)
+		return ret;
+
+	/* Set DCDC compensation to off and speaker impedance to 8 ohm */
+	ret = regmap_update_bits(regmap, TFA989X_I2S_SEL_REG,
+				 TFA989X_I2S_SEL_REG_DCFG_MSK |
+				 TFA989X_I2S_SEL_REG_SPKR_MSK,
+				 TFA989X_I2S_SEL_REG_SPKR_MSK);
+	if (ret)
+		return ret;
+
+	/* Set DCDC to follower mode and disable CoolFlux DSP */
+	return regmap_clear_bits(regmap, TFA989X_SYS_CTRL,
+				 BIT(TFA989X_SYS_CTRL_DCA) |
+				 BIT(TFA989X_SYS_CTRL_CFE) |
+				 BIT(TFA989X_SYS_CTRL_AMPC));
+}
+
+static int tfa989x_i2c_probe(struct i2c_client *i2c)
+{
+	struct device *dev = &i2c->dev;
+	const struct tfa989x_rev *rev;
+	struct regmap *regmap;
+	unsigned int val;
+	int ret;
+
+	rev = device_get_match_data(dev);
+	if (!rev) {
+		dev_err(dev, "unknown device revision\n");
+		return -ENODEV;
+	}
+
+	regmap = devm_regmap_init_i2c(i2c, &tfa989x_regmap);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/* Bypass regcache for reset and init sequence */
+	regcache_cache_bypass(regmap, true);
+
+	/* Dummy read to generate i2c clocks, required on some devices */
+	regmap_read(regmap, TFA989X_REVISIONNUMBER, &val);
+
+	ret = regmap_read(regmap, TFA989X_REVISIONNUMBER, &val);
+	if (ret) {
+		dev_err(dev, "failed to read revision number: %d\n", ret);
+		return ret;
+	}
+
+	val &= TFA989X_REVISIONNUMBER_REV_MSK;
+	if (val != rev->rev) {
+		dev_err(dev, "invalid revision number, expected %#x, got %#x\n",
+			rev->rev, val);
+		return -ENODEV;
+	}
+
+	ret = regmap_write(regmap, TFA989X_SYS_CTRL, BIT(TFA989X_SYS_CTRL_I2CR));
+	if (ret) {
+		dev_err(dev, "failed to reset I2C registers: %d\n", ret);
+		return ret;
+	}
+
+	ret = rev->init(regmap);
+	if (ret) {
+		dev_err(dev, "failed to initialize registers: %d\n", ret);
+		return ret;
+	}
+
+	ret = tfa989x_dsp_bypass(regmap);
+	if (ret) {
+		dev_err(dev, "failed to enable DSP bypass: %d\n", ret);
+		return ret;
+	}
+	regcache_cache_bypass(regmap, false);
+
+	return devm_snd_soc_register_component(dev, &tfa989x_component,
+					       &tfa989x_dai, 1);
+}
+
+static const struct of_device_id tfa989x_of_match[] = {
+	{ .compatible = "nxp,tfa9895", .data = &tfa9895_rev },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tfa989x_of_match);
+
+static struct i2c_driver tfa989x_i2c_driver = {
+	.driver = {
+		.name = "tfa989x",
+		.of_match_table = tfa989x_of_match,
+	},
+	.probe_new = tfa989x_i2c_probe,
+};
+module_i2c_driver(tfa989x_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC NXP/Goodix TFA989X (TFA1) driver");
+MODULE_AUTHOR("Stephan Gerhold <stephan@gerhold.net>");
+MODULE_LICENSE("GPL");
-- 
2.31.1


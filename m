Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 838B3473111
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 17:02:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 213841801;
	Mon, 13 Dec 2021 17:01:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 213841801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639411345;
	bh=nqaQgdwtXeV6c2h9hyDqypPaTpaMXIWEua3oIHtWQcM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qu/G410J7Os9SyXEwdbwm6XPjUeoyR+ItOiDjLAevjloyGikXGYJZ1Ltxlb2wrsYr
	 WlQJ6IWLv35wjmUGUSXa1MfIkYQVcfUb8LkNDjSPJeWu26sPZRPBJd0Gj2Z+m9Wkhd
	 22FywpGHRRH3qzFcmrG7UCP8Fkc5lfzaZPdpjfyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62B55F80519;
	Mon, 13 Dec 2021 17:00:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D751F80511; Mon, 13 Dec 2021 17:00:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from msg-4.mailo.com (ip-15.mailobj.net [213.182.54.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69ECAF8025F
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 17:00:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69ECAF8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org
 header.b="XuOvRamU"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1639411174; bh=nqaQgdwtXeV6c2h9hyDqypPaTpaMXIWEua3oIHtWQcM=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding;
 b=XuOvRamUl0bSZrxXrIJDoNC/eQmjLA7/QJxwVvuhmgWem63JSoBxWWJs9ZiajDMOm
 Q0VoGAHEd5hMJ7l1z+O2YoyLi+iLLyw/FwOeGa5+I9o+/VBlVCq+kIVnl4NbyA8Koh
 z9H2CTTVNLmYAptOfycVqqbGT1bhBSJ5KYQjddpM=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
 via proxy.mailoo.org [213.182.55.207]
 Mon, 13 Dec 2021 16:59:34 +0100 (CET)
X-EA-Auth: Xx0v2exYMlE4+Ef9FfeLvbe/kM7p9uFKLgkem61xyjYCdWp9/OiKjA7gEQxdj37OhXzZJ8Muh6qEhDoNbOkFvJfvIH2OoHOdSn6cVcWGXaY=
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH 2/2] ASoC: Add AK4375 support
Date: Mon, 13 Dec 2021 16:59:12 +0100
Message-Id: <20211213155914.2558902-2-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211213155914.2558902-1-vincent.knecht@mailoo.org>
References: <20211213155914.2558902-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 obayerd@eurocomposant.fr, stephan@gerhold.net, linux-kernel@vger.kernel.org,
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

AK4375 is a 32-bit stereo DAC with headphones amplifier.
There's no documentation for it on akm.com, and only a brief
datasheet can be found floating on the internets [1].

Thanks to Oriane BAYERD <obayerd@eurocomposant.fr>
for finally answering my inquiries through akm.com, if only to tell
me that this chip is EOL following AKM factory burning in october 2020
and thus no detailed documentation is available anymore...

AK4331 is advertised [2] as pin and register compatible with AK4375
so some scraps of its datasheet were used and this driver might be
used as a base for it, but this is totally untested.

So this driver is mainly based on downstream code [3] and [4]
by Hu Jin from AKM (no known email).

Tested on msm8916-alcatel-idol347 and msm8939-alcatel-idol3,
which both use PLL driven clock with bypass of SRC (sample rate
converter), so only this setup is supported for now.

[1] https://datasheetspdf.com/pdf-file/1400317/AKM/AK4375A/1
[2] https://www.akm.com/content/dam/documents/products/audio/audio-dac/ak4331ecb/ak4331ecb-en-datasheet.pdf
[3] https://github.com/msm8916-mainline/android_kernel_qcom_msm8916/blob/alcatel-idol347/sound/soc/codecs/idol347/ak4375.c
[4] https://github.com/msm8916-mainline/android_kernel_qcom_msm8916/blob/alcatel-idol347/sound/soc/codecs/ak4375.c

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 sound/soc/codecs/Kconfig  |  11 +
 sound/soc/codecs/Makefile |   2 +
 sound/soc/codecs/ak4375.c | 676 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 689 insertions(+)
 create mode 100644 sound/soc/codecs/ak4375.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index c033ee7d82e4..d8d26914faf7 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -41,6 +41,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_ADS117X
 	imply SND_SOC_AK4104
 	imply SND_SOC_AK4118
+	imply SND_SOC_AK4375
 	imply SND_SOC_AK4458
 	imply SND_SOC_AK4535
 	imply SND_SOC_AK4554
@@ -522,6 +523,16 @@ config SND_SOC_AK4118
 	depends on I2C
 	select REGMAP_I2C
 
+config SND_SOC_AK4375
+	tristate "AKM AK4375 CODEC"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Enable support for the Asahi-Kasei AK4375 codec.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-soc-ak4375.
+
 config SND_SOC_AK4458
 	tristate "AKM AK4458 CODEC"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 485eee75502b..96aef5857eac 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -34,6 +34,7 @@ snd-soc-adav803-objs := adav803.o
 snd-soc-ads117x-objs := ads117x.o
 snd-soc-ak4104-objs := ak4104.o
 snd-soc-ak4118-objs := ak4118.o
+snd-soc-ak4375-objs := ak4375.o
 snd-soc-ak4458-objs := ak4458.o
 snd-soc-ak4535-objs := ak4535.o
 snd-soc-ak4554-objs := ak4554.o
@@ -370,6 +371,7 @@ obj-$(CONFIG_SND_SOC_ADAV803)  += snd-soc-adav803.o
 obj-$(CONFIG_SND_SOC_ADS117X)	+= snd-soc-ads117x.o
 obj-$(CONFIG_SND_SOC_AK4104)	+= snd-soc-ak4104.o
 obj-$(CONFIG_SND_SOC_AK4118)	+= snd-soc-ak4118.o
+obj-$(CONFIG_SND_SOC_AK4375)	+= snd-soc-ak4375.o
 obj-$(CONFIG_SND_SOC_AK4458)	+= snd-soc-ak4458.o
 obj-$(CONFIG_SND_SOC_AK4535)	+= snd-soc-ak4535.o
 obj-$(CONFIG_SND_SOC_AK4554)	+= snd-soc-ak4554.o
diff --git a/sound/soc/codecs/ak4375.c b/sound/soc/codecs/ak4375.c
new file mode 100644
index 000000000000..d922e74e5dc6
--- /dev/null
+++ b/sound/soc/codecs/ak4375.c
@@ -0,0 +1,676 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/*
+ * Based on code by Hu Jin
+ * Copyright (C) 2014 Asahi Kasei Microdevices Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+
+/* Registers */
+#define AK4375_00_POWER_MANAGEMENT1		0x00
+#define AK4375_01_POWER_MANAGEMENT2		0x01
+#define AK4375_02_POWER_MANAGEMENT3		0x02
+#define AK4375_03_POWER_MANAGEMENT4		0x03
+#define AK4375_04_OUTPUT_MODE_SETTING		0x04
+#define AK4375_05_CLOCK_MODE_SELECT		0x05
+#define AK4375_06_DIGITAL_FILTER_SELECT		0x06
+#define AK4375_07_DAC_MONO_MIXING		0x07
+#define AK4375_08_JITTER_CLEANER_SETTING1	0x08
+#define AK4375_09_JITTER_CLEANER_SETTING2	0x09
+#define AK4375_0A_JITTER_CLEANER_SETTING3	0x0a
+#define AK4375_0B_LCH_OUTPUT_VOLUME		0x0b
+#define AK4375_0C_RCH_OUTPUT_VOLUME		0x0c
+#define AK4375_0D_HP_VOLUME_CONTROL		0x0d
+#define AK4375_0E_PLL_CLK_SOURCE_SELECT		0x0e
+#define AK4375_0F_PLL_REF_CLK_DIVIDER1		0x0f
+#define AK4375_10_PLL_REF_CLK_DIVIDER2		0x10
+#define AK4375_11_PLL_FB_CLK_DIVIDER1		0x11
+#define AK4375_12_PLL_FB_CLK_DIVIDER2		0x12
+#define AK4375_13_SRC_CLK_SOURCE		0x13
+#define AK4375_14_DAC_CLK_DIVIDER		0x14
+#define AK4375_15_AUDIO_IF_FORMAT		0x15
+#define AK4375_24_MODE_CONTROL			0x24
+
+#define AK4375_FS_MASK				GENMASK(4, 0)
+#define AK4375_FS_8KHZ				(0x00 << 0)
+#define AK4375_FS_11_025KHZ			(0x01 << 0)
+#define AK4375_FS_16KHZ				(0x04 << 0)
+#define AK4375_FS_22_05KHZ			(0x05 << 0)
+#define AK4375_FS_32KHZ				(0x08 << 0)
+#define AK4375_FS_44_1KHZ			(0x09 << 0)
+#define AK4375_FS_48KHZ				(0x0a << 0)
+#define AK4375_FS_88_2KHZ			(0x0d << 0)
+#define AK4375_FS_96KHZ				(0x0e << 0)
+#define AK4375_FS_176_4KHZ			(0x11 << 0)
+#define AK4375_FS_192KHZ			(0x12 << 0)
+
+/* Master Clock settings */
+#define AK4375_CM_MASK				(0x03 << 5)
+#define AK4375_CM_0				(0 << 5)
+#define AK4375_CM_1				BIT(5)
+#define AK4375_CM_3				(3 << 5)
+
+#define AK4375_15_DEVICEID_MASK			GENMASK(7, 5)
+#define DEVICEID_AK4375				0x00
+#define DEVICEID_AK4375A			0x01
+#define DEVICEID_AK4376A			0x02
+#define DEVICEID_AK4377				0x03
+#define DEVICEID_AK4331				0x07
+
+struct ak4375_drvdata {
+	struct snd_soc_dai_driver *dai_drv;
+	const struct snd_soc_component_driver *comp_drv;
+};
+
+struct ak4375_priv {
+	struct device *dev;
+	struct regmap *regmap;
+	struct gpio_desc *pdn_gpiod;
+	struct regulator *avdd_supply;
+	struct regulator *tvdd_supply;
+};
+
+static const struct reg_default ak4375_reg_defaults[] = {
+	{ 0x00, 0x00 }, { 0x01, 0x00 }, { 0x02, 0x00 },
+	{ 0x03, 0x00 }, { 0x04, 0x00 }, { 0x05, 0x00 },
+	{ 0x06, 0x00 }, { 0x07, 0x00 }, { 0x08, 0x00 },
+	{ 0x09, 0x00 }, { 0x0a, 0x00 }, { 0x0b, 0x19 },
+	{ 0x0c, 0x19 }, { 0x0d, 0x75 }, { 0x0e, 0x01 },
+	{ 0x0f, 0x00 }, { 0x10, 0x00 }, { 0x11, 0x00 },
+	{ 0x12, 0x00 }, { 0x13, 0x00 }, { 0x14, 0x00 },
+	{ 0x15, 0x00 }, { 0x24, 0x00 },
+};
+
+/*
+ * Output Digital volume control:
+ * from -12.5 to 3 dB in 0.5 dB steps (mute instead of -12.5 dB)
+ */
+static DECLARE_TLV_DB_SCALE(ovl_tlv, -1250, 50, 0);
+static DECLARE_TLV_DB_SCALE(ovr_tlv, -1250, 50, 0);
+
+/*
+ * HP-Amp Analog volume control:
+ * from -4.2 to 6 dB in 2 dB steps (mute instead of -4.2 dB)
+ */
+static DECLARE_TLV_DB_SCALE(hpg_tlv, -4200, 20, 0);
+
+static const char * const ak4375_ovolcn_select_texts[]	= { "Dependent", "Independent" };
+static const char * const ak4375_mdacl_select_texts[]	= { "x1", "x1/2" };
+static const char * const ak4375_mdacr_select_texts[]	= { "x1", "x1/2" };
+static const char * const ak4375_invl_select_texts[]	= { "Normal", "Inverting" };
+static const char * const ak4375_invr_select_texts[]	= { "Normal", "Inverting" };
+static const char * const ak4375_hphl_select_texts[]	= { "9ohm", "200kohm" };
+static const char * const ak4375_hphr_select_texts[]	= { "9ohm", "200kohm" };
+static const char * const ak4375_cpmod_select_texts[]	= {
+	"Automatic Switching",
+	"+-VDD Operation",
+	"+-1/2VDD Operation"
+};
+
+/*
+ * DASD, DASL bits Digital Filter Setting
+ * 0, 0 : Sharp Roll-Off Filter
+ * 0, 1 : Slow Roll-Off Filter
+ * 1, 0 : Short delay Sharp Roll-Off Filter
+ * 1, 1 : Short delay Slow Roll-Off Filter
+ */
+static const char * const ak4375_digfil_select_texts[] = {
+	"Sharp Roll-Off Filter",
+	"Slow Roll-Off Filter",
+	"Short delay Sharp Roll-Off Filter",
+	"Short delay Slow Roll-Off Filter",
+};
+
+static int get_pdn(struct snd_kcontrol *kcontrol,
+		   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct ak4375_priv *ak4375 = snd_soc_component_get_drvdata(component);
+	int value = gpiod_get_value_cansleep(ak4375->pdn_gpiod);
+
+	if (value < 0)
+		dev_err(ak4375->dev, "unable to get pdn gpiod: %d\n", value);
+	else
+		ucontrol->value.enumerated.item[0] = value;
+
+	return 0;
+}
+
+static int set_pdn(struct snd_kcontrol *kcontrol,
+		   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct ak4375_priv *ak4375 = snd_soc_component_get_drvdata(component);
+
+	gpiod_set_value_cansleep(ak4375->pdn_gpiod,
+				 ucontrol->value.enumerated.item[0]);
+
+	return 0;
+}
+
+static const struct soc_enum ak4375_dac_enum[] = {
+	SOC_ENUM_SINGLE(AK4375_0B_LCH_OUTPUT_VOLUME, 7,
+			ARRAY_SIZE(ak4375_ovolcn_select_texts), ak4375_ovolcn_select_texts),
+	SOC_ENUM_SINGLE(AK4375_07_DAC_MONO_MIXING, 2,
+			ARRAY_SIZE(ak4375_mdacl_select_texts), ak4375_mdacl_select_texts),
+	SOC_ENUM_SINGLE(AK4375_07_DAC_MONO_MIXING, 6,
+			ARRAY_SIZE(ak4375_mdacr_select_texts), ak4375_mdacr_select_texts),
+	SOC_ENUM_SINGLE(AK4375_07_DAC_MONO_MIXING, 3,
+			ARRAY_SIZE(ak4375_invl_select_texts), ak4375_invl_select_texts),
+	SOC_ENUM_SINGLE(AK4375_07_DAC_MONO_MIXING, 7,
+			ARRAY_SIZE(ak4375_invr_select_texts), ak4375_invr_select_texts),
+	SOC_ENUM_SINGLE(AK4375_03_POWER_MANAGEMENT4, 2,
+			ARRAY_SIZE(ak4375_cpmod_select_texts), ak4375_cpmod_select_texts),
+	SOC_ENUM_SINGLE(AK4375_04_OUTPUT_MODE_SETTING, 0,
+			ARRAY_SIZE(ak4375_hphl_select_texts), ak4375_hphl_select_texts),
+	SOC_ENUM_SINGLE(AK4375_04_OUTPUT_MODE_SETTING, 1,
+			ARRAY_SIZE(ak4375_hphr_select_texts), ak4375_hphr_select_texts),
+	SOC_ENUM_SINGLE(AK4375_06_DIGITAL_FILTER_SELECT, 6,
+			ARRAY_SIZE(ak4375_digfil_select_texts), ak4375_digfil_select_texts),
+};
+
+static const char * const pdn_on_select[] = { "OFF", "ON" };
+
+static const struct soc_enum ak4375_pdn_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(pdn_on_select), pdn_on_select);
+
+static const struct snd_kcontrol_new ak4375_snd_controls[] = {
+	SOC_SINGLE_TLV("AK4375 Digital Output VolumeL",
+		       AK4375_0B_LCH_OUTPUT_VOLUME, 0, 0x1f, 0, ovl_tlv),
+	SOC_SINGLE_TLV("AK4375 Digital Output VolumeR",
+		       AK4375_0C_RCH_OUTPUT_VOLUME, 0, 0x1f, 0, ovr_tlv),
+	SOC_SINGLE_TLV("AK4375 HP-Amp Analog Volume",
+		       AK4375_0D_HP_VOLUME_CONTROL, 0, 0x1f, 0, hpg_tlv),
+
+	SOC_ENUM("AK4375 Digital Volume Control", ak4375_dac_enum[0]),
+	SOC_ENUM("AK4375 DACL Signal Level", ak4375_dac_enum[1]),
+	SOC_ENUM("AK4375 DACR Signal Level", ak4375_dac_enum[2]),
+	SOC_ENUM("AK4375 DACL Signal Invert", ak4375_dac_enum[3]),
+	SOC_ENUM("AK4375 DACR Signal Invert", ak4375_dac_enum[4]),
+	SOC_ENUM("AK4375 Charge Pump Mode", ak4375_dac_enum[5]),
+	SOC_ENUM("AK4375 HPL Power-down Resistor", ak4375_dac_enum[6]),
+	SOC_ENUM("AK4375 HPR Power-down Resistor", ak4375_dac_enum[7]),
+	SOC_ENUM("AK4375 DAC Digital Filter Mode", ak4375_dac_enum[8]),
+
+	SOC_ENUM_EXT("AK4375 HP", ak4375_pdn_enum, get_pdn, set_pdn),
+};
+
+static const struct snd_kcontrol_new ak4375_hpl_mixer_controls[] = {
+	SOC_DAPM_SINGLE("LDACL", AK4375_07_DAC_MONO_MIXING, 0, 1, 0),
+	SOC_DAPM_SINGLE("RDACL", AK4375_07_DAC_MONO_MIXING, 1, 1, 0),
+};
+
+static const struct snd_kcontrol_new ak4375_hpr_mixer_controls[] = {
+	SOC_DAPM_SINGLE("LDACR", AK4375_07_DAC_MONO_MIXING, 4, 1, 0),
+	SOC_DAPM_SINGLE("RDACR", AK4375_07_DAC_MONO_MIXING, 5, 1, 0),
+};
+
+static int ak4375_dac_event(struct snd_soc_dapm_widget *w,
+			    struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_update_bits(component, AK4375_00_POWER_MANAGEMENT1, 0x01, 0x01);
+		snd_soc_component_update_bits(component, AK4375_01_POWER_MANAGEMENT2, 0x01, 0x01);
+		usleep_range(6500, 7000);
+		snd_soc_component_update_bits(component, AK4375_01_POWER_MANAGEMENT2, 0x30, 0x30);
+		usleep_range(1000, 2000);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_component_update_bits(component, AK4375_01_POWER_MANAGEMENT2, 0x02, 0x02);
+		usleep_range(4500, 5000);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		snd_soc_component_update_bits(component, AK4375_01_POWER_MANAGEMENT2, 0x02, 0x00);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(component, AK4375_01_POWER_MANAGEMENT2, 0x30, 0x00);
+		snd_soc_component_update_bits(component, AK4375_01_POWER_MANAGEMENT2, 0x01, 0x00);
+		snd_soc_component_update_bits(component, AK4375_00_POWER_MANAGEMENT1, 0x01, 0x00);
+		break;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget ak4375_dapm_widgets[] = {
+	SND_SOC_DAPM_DAC_E("AK4375 DAC", NULL, AK4375_02_POWER_MANAGEMENT3, 0, 0, ak4375_dac_event,
+			   SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+			   SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_AIF_IN("AK4375 SDTI", "HiFi Playback", 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_OUTPUT("AK4375 HPL"),
+	SND_SOC_DAPM_OUTPUT("AK4375 HPR"),
+
+	SND_SOC_DAPM_MIXER("AK4375 HPR Mixer", AK4375_03_POWER_MANAGEMENT4, 1, 0,
+			   &ak4375_hpr_mixer_controls[0], ARRAY_SIZE(ak4375_hpr_mixer_controls)),
+	SND_SOC_DAPM_MIXER("AK4375 HPL Mixer", AK4375_03_POWER_MANAGEMENT4, 0, 0,
+			   &ak4375_hpl_mixer_controls[0], ARRAY_SIZE(ak4375_hpl_mixer_controls)),
+};
+
+static const struct snd_soc_dapm_route ak4375_intercon[] = {
+	{ "AK4375 DAC",		NULL,		"AK4375 SDTI" },
+
+	{ "AK4375 HPL Mixer",	"LDACL",	"AK4375 DAC" },
+	{ "AK4375 HPL Mixer",	"RDACL",	"AK4375 DAC" },
+	{ "AK4375 HPR Mixer",	"LDACR",	"AK4375 DAC" },
+	{ "AK4375 HPR Mixer",	"RDACR",	"AK4375 DAC" },
+
+	{ "AK4375 HPL",		NULL,		"AK4375 HPL Mixer" },
+	{ "AK4375 HPR",		NULL,		"AK4375 HPR Mixer" },
+};
+
+static int ak4375_set_pllblock(struct snd_soc_component *component, int fs)
+{
+	struct ak4375_priv *ak4375 = snd_soc_component_get_drvdata(component);
+	int mclk, pllclk, refclk, pldbit, plmbit, mdivbit, divbit;
+	u8 mode;
+
+	mode = snd_soc_component_read(component, AK4375_05_CLOCK_MODE_SELECT);
+	mode &= ~AK4375_CM_MASK;
+
+	if (fs <= 24000) {
+		mode |= AK4375_CM_1;
+		mclk = 512 * fs;
+	} else if (fs <= 96000) {
+		mode |= AK4375_CM_0;
+		mclk = 256 * fs;
+	} else {
+		mode |= AK4375_CM_3;
+		mclk = 128 * fs;
+	}
+
+	snd_soc_component_write(component, AK4375_05_CLOCK_MODE_SELECT, mode);
+
+	if ((fs % 8000) == 0)
+		pllclk = 122880000;
+	else
+		pllclk = 112896000;
+
+	if (fs <= 96000)
+		pldbit = 1;
+	else
+		pldbit = 2;
+
+	refclk = 32 * fs / pldbit;
+	plmbit = pllclk / refclk;
+
+	if (fs <= 96000) {
+		mdivbit = pllclk / mclk;
+		divbit = 0;
+	} else {
+		mdivbit = 5;
+		divbit = 1;
+	}
+
+	pldbit--;
+	plmbit--;
+	mdivbit--;
+
+	/* PLD 15-0 bits */
+	snd_soc_component_write(component,
+				AK4375_0F_PLL_REF_CLK_DIVIDER1, ((pldbit & 0xff00) >> 8));
+	snd_soc_component_write(component,
+				AK4375_10_PLL_REF_CLK_DIVIDER2, (pldbit & 0x00ff));
+	/* PLM 15-0 bits */
+	snd_soc_component_write(component,
+				AK4375_11_PLL_FB_CLK_DIVIDER1, ((plmbit & 0xff00) >> 8));
+	snd_soc_component_write(component,
+				AK4375_12_PLL_FB_CLK_DIVIDER2, (plmbit & 0x00ff));
+	/* DIV and SRCCKS bits: force SRCCKS=1 for PLL mode */
+	mode = snd_soc_component_read(component, AK4375_13_SRC_CLK_SOURCE);
+	mode &= ~0x10;
+	mode |= (divbit << 4);
+	snd_soc_component_write(component, AK4375_13_SRC_CLK_SOURCE, (mode | 0x01));
+	/* MDIV 7-0 bits */
+	snd_soc_component_write(component, AK4375_14_DAC_CLK_DIVIDER, mdivbit);
+
+	dev_dbg(ak4375->dev, "fs=%d mclk=%d pllclk=%d PLD=%d PLM=%d MDIV=%d DIV=%d\n",
+		fs, mclk, pllclk, pldbit, plmbit, mdivbit, divbit);
+
+	return 0;
+}
+
+static int ak4375_hw_params(struct snd_pcm_substream *substream,
+			    struct snd_pcm_hw_params *params,
+			    struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	int rate = params_rate(params);
+	u8 fs;
+
+	fs = snd_soc_component_read(component, AK4375_05_CLOCK_MODE_SELECT);
+	fs &= ~AK4375_FS_MASK;
+
+	switch (rate) {
+	case 8000:
+		fs |= AK4375_FS_8KHZ;
+		break;
+	case 11025:
+		fs |= AK4375_FS_11_025KHZ;
+		break;
+	case 16000:
+		fs |= AK4375_FS_16KHZ;
+		break;
+	case 22050:
+		fs |= AK4375_FS_22_05KHZ;
+		break;
+	case 32000:
+		fs |= AK4375_FS_32KHZ;
+		break;
+	case 44100:
+		fs |= AK4375_FS_44_1KHZ;
+		break;
+	case 48000:
+		fs |= AK4375_FS_48KHZ;
+		break;
+	case 88200:
+		fs |= AK4375_FS_88_2KHZ;
+		break;
+	case 96000:
+		fs |= AK4375_FS_96KHZ;
+		break;
+	case 176400:
+		fs |= AK4375_FS_176_4KHZ;
+		break;
+	case 192000:
+		fs |= AK4375_FS_192KHZ;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	snd_soc_component_write(component, AK4375_05_CLOCK_MODE_SELECT, fs);
+
+	ak4375_set_pllblock(component, rate);
+
+	return 0;
+}
+
+#define AK4375_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE |\
+			 SNDRV_PCM_FMTBIT_S24_LE |\
+			 SNDRV_PCM_FMTBIT_S32_LE)
+
+static const unsigned int ak4375_rates[] = {
+	8000, 11025, 16000, 22050,
+	32000, 44100, 48000, 88200,
+	96000, 176400, 192000,
+};
+
+static const struct snd_pcm_hw_constraint_list ak4375_rate_constraints = {
+	.count = ARRAY_SIZE(ak4375_rates),
+	.list = ak4375_rates,
+};
+
+static int ak4375_startup(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+					  SNDRV_PCM_HW_PARAM_RATE,
+					  &ak4375_rate_constraints);
+}
+
+static const struct snd_soc_dai_ops ak4375_dai_ops = {
+	.startup	= ak4375_startup,
+	.hw_params	= ak4375_hw_params,
+};
+
+static struct snd_soc_dai_driver ak4375_dai = {
+	.name = "ak4375-hifi",
+	.playback = {
+		.stream_name	= "HiFi Playback",
+		.channels_min	= 1,
+		.channels_max	= 2,
+		.rates		= SNDRV_PCM_RATE_KNOT,
+		.rate_min	= 8000,
+		.rate_max	= 192000,
+		.formats	= AK4375_FORMATS,
+	},
+	.ops = &ak4375_dai_ops,
+};
+
+static void ak4375_power_off(struct ak4375_priv *ak4375)
+{
+	gpiod_set_value_cansleep(ak4375->pdn_gpiod, 0);
+	usleep_range(1000, 2000);
+
+	if (!IS_ERR(ak4375->avdd_supply))
+		regulator_disable(ak4375->avdd_supply);
+
+	regulator_disable(ak4375->tvdd_supply);
+	usleep_range(3000, 4000);
+}
+
+static int ak4375_power_on(struct ak4375_priv *ak4375)
+{
+	int ret;
+
+	ret = regulator_enable(ak4375->tvdd_supply);
+	if (ret < 0) {
+		dev_err(ak4375->dev, "failed to enable tvdd supply: %d\n", ret);
+		return ret;
+	}
+
+	if (!IS_ERR(ak4375->avdd_supply)) {
+		ret = regulator_enable(ak4375->avdd_supply);
+		if (ret < 0) {
+			dev_err(ak4375->dev, "failed to enable avdd supply: %d\n", ret);
+			return ret;
+		}
+	}
+
+	usleep_range(3000, 4000);
+
+	gpiod_set_value_cansleep(ak4375->pdn_gpiod, 1);
+	usleep_range(1000, 2000);
+
+	return 0;
+}
+
+static int ak4375_probe(struct snd_soc_component *component)
+{
+	struct ak4375_priv *ak4375 = snd_soc_component_get_drvdata(component);
+
+	gpiod_set_value_cansleep(ak4375->pdn_gpiod, 0);
+	usleep_range(1000, 2000);
+
+	return ak4375_power_on(ak4375);
+}
+
+static void ak4375_remove(struct snd_soc_component *component)
+{
+	struct ak4375_priv *ak4375 = snd_soc_component_get_drvdata(component);
+
+	ak4375_power_off(ak4375);
+}
+
+#ifdef CONFIG_PM
+static int __maybe_unused ak4375_runtime_suspend(struct device *dev)
+{
+	struct ak4375_priv *ak4375 = dev_get_drvdata(dev);
+
+	regcache_cache_only(ak4375->regmap, true);
+	ak4375_power_off(ak4375);
+
+	return 0;
+}
+
+static int __maybe_unused ak4375_runtime_resume(struct device *dev)
+{
+	struct ak4375_priv *ak4375 = dev_get_drvdata(dev);
+	int ret;
+
+	ak4375_power_off(ak4375);
+	ret = ak4375_power_on(ak4375);
+	if (ret < 0)
+		return ret;
+
+	regcache_cache_only(ak4375->regmap, false);
+	regcache_mark_dirty(ak4375->regmap);
+
+	return regcache_sync(ak4375->regmap);
+}
+#endif /* CONFIG_PM */
+
+static const struct snd_soc_component_driver soc_codec_dev_ak4375 = {
+	.probe			= ak4375_probe,
+	.remove			= ak4375_remove,
+	.controls		= ak4375_snd_controls,
+	.num_controls		= ARRAY_SIZE(ak4375_snd_controls),
+	.dapm_widgets		= ak4375_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(ak4375_dapm_widgets),
+	.dapm_routes		= ak4375_intercon,
+	.num_dapm_routes	= ARRAY_SIZE(ak4375_intercon),
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static const struct regmap_config ak4375_regmap = {
+	.reg_bits		= 8,
+	.val_bits		= 8,
+	.max_register		= AK4375_24_MODE_CONTROL,
+	.reg_defaults		= ak4375_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(ak4375_reg_defaults),
+	.cache_type		= REGCACHE_RBTREE,
+};
+
+static const struct ak4375_drvdata ak4375_drvdata = {
+	.dai_drv = &ak4375_dai,
+	.comp_drv = &soc_codec_dev_ak4375,
+};
+
+static const struct dev_pm_ops ak4375_pm = {
+	SET_RUNTIME_PM_OPS(ak4375_runtime_suspend, ak4375_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
+};
+
+static int ak4375_i2c_probe(struct i2c_client *i2c)
+{
+	struct ak4375_priv *ak4375;
+	const struct ak4375_drvdata *drvdata;
+	unsigned int deviceid;
+	int ret;
+
+	ak4375 = devm_kzalloc(&i2c->dev, sizeof(*ak4375), GFP_KERNEL);
+	if (!ak4375)
+		return -ENOMEM;
+
+	ak4375->regmap = devm_regmap_init_i2c(i2c, &ak4375_regmap);
+	if (IS_ERR(ak4375->regmap))
+		return PTR_ERR(ak4375->regmap);
+
+	i2c_set_clientdata(i2c, ak4375);
+	ak4375->dev = &i2c->dev;
+
+	drvdata = of_device_get_match_data(&i2c->dev);
+
+	ak4375->avdd_supply = devm_regulator_get_optional(ak4375->dev, "avdd");
+	if (IS_ERR(ak4375->avdd_supply)) {
+		if (PTR_ERR(ak4375->avdd_supply) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+	}
+
+	ak4375->tvdd_supply = devm_regulator_get(ak4375->dev, "tvdd");
+	if (IS_ERR(ak4375->tvdd_supply)) {
+		if (PTR_ERR(ak4375->tvdd_supply) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		else
+			return PTR_ERR(ak4375->tvdd_supply);
+	}
+
+	ak4375->pdn_gpiod = devm_gpiod_get_optional(ak4375->dev, "pdn", GPIOD_OUT_LOW);
+	if (IS_ERR(ak4375->pdn_gpiod))
+		return PTR_ERR(ak4375->pdn_gpiod);
+
+	ret = ak4375_power_on(ak4375);
+	if (ret < 0)
+		return ret;
+
+	/* Don't read deviceid from cache */
+	regcache_cache_bypass(ak4375->regmap, true);
+
+	ret = regmap_read(ak4375->regmap, AK4375_15_AUDIO_IF_FORMAT, &deviceid);
+	if (ret < 0) {
+		dev_err(ak4375->dev, "unable to read DEVICEID!\n");
+		return ret;
+	}
+
+	regcache_cache_bypass(ak4375->regmap, false);
+
+	deviceid = (deviceid & AK4375_15_DEVICEID_MASK) >> 5;
+
+	switch (deviceid) {
+	case DEVICEID_AK4331:
+		dev_err(ak4375->dev, "found untested AK4331\n");
+		return -EINVAL;
+	case DEVICEID_AK4375:
+		dev_dbg(ak4375->dev, "found AK4375\n");
+		break;
+	case DEVICEID_AK4375A:
+		dev_dbg(ak4375->dev, "found AK4375A\n");
+		break;
+	case DEVICEID_AK4376A:
+		dev_err(ak4375->dev, "found unsupported AK4376/A!\n");
+		return -EINVAL;
+	case DEVICEID_AK4377:
+		dev_err(ak4375->dev, "found unsupported AK4377!\n");
+		return -EINVAL;
+	default:
+		dev_err(ak4375->dev, "unrecognized DEVICEID!\n");
+		return -EINVAL;
+	}
+
+	ret = devm_snd_soc_register_component(ak4375->dev, drvdata->comp_drv,
+					      drvdata->dai_drv, 1);
+	if (ret < 0) {
+		dev_err(ak4375->dev, "Failed to register CODEC: %d\n", ret);
+		return ret;
+	}
+
+	pm_runtime_enable(&i2c->dev);
+
+	return 0;
+}
+
+static int ak4375_i2c_remove(struct i2c_client *i2c)
+{
+	pm_runtime_disable(&i2c->dev);
+
+	return 0;
+}
+
+static const struct of_device_id ak4375_of_match[] = {
+	{ .compatible = "asahi-kasei,ak4375", .data = &ak4375_drvdata },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ak4375_of_match);
+
+static struct i2c_driver ak4375_i2c_driver = {
+	.driver = {
+		.name = "ak4375",
+		.pm = &ak4375_pm,
+		.of_match_table = ak4375_of_match,
+	},
+	.probe_new = ak4375_i2c_probe,
+	.remove = ak4375_i2c_remove,
+};
+module_i2c_driver(ak4375_i2c_driver);
+
+MODULE_AUTHOR("Vincent Knecht <vincent.knecht@mailoo.org>");
+MODULE_DESCRIPTION("ASoC AK4375 DAC driver");
+MODULE_LICENSE("GPL");
-- 
2.31.1




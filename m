Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEC62A6A0B
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 17:41:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1058F16A3;
	Wed,  4 Nov 2020 17:40:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1058F16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604508102;
	bh=1sjruI0z4GLzYcI1qBotAGRIyUncXhs4c8MhBrIe1Yk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nyy7GuXJf2xqVkTYZhMuD61h0lh4BPnIQwRKa6KKuuJgTxOmSTTvXUBZEi3bvYlmy
	 IH+Ys7LARQriavqBc/3fnemlAz4WqG6uJ1UCyymAsyLI5iLQItL8/ECEKWqy2u4RuT
	 znT001h2k5q7KQY+rnw/laGBf3o0pgVkBQHD9CUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72BA4F80259;
	Wed,  4 Nov 2020 17:40:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D4F9F80234; Wed,  4 Nov 2020 16:42:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0a-00183b01.pphosted.com (mx0a-00183b01.pphosted.com
 [67.231.149.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A221FF800EC
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 16:42:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A221FF800EC
Received: from pps.filterd (m0059812.ppops.net [127.0.0.1])
 by m0059812.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 0A4FQUNX019837;
 Wed, 4 Nov 2020 08:42:14 -0700
Received: from smtp1.onsemi.com (relay1.onsemi.com [65.197.242.60])
 by m0059812.ppops.net with ESMTP id 34h2frav2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Nov 2020 08:42:14 -0700
Received: from dns2.onsemi.com (unknown [10.253.88.2])
 by Forcepoint Email with ESMTP id 0BF17D77D0275F88EFE2;
 Wed,  4 Nov 2020 08:42:13 -0700 (MST)
Received: from usaz01ws0031.ad.onsemi.com (usaz01ws0031.onsemi.com
 [10.253.116.33])
 by dns2.onsemi.com (8.13.8+Sun/8.11.6) with ESMTP id 0A4FgBij006147;
 Wed, 4 Nov 2020 08:42:12 -0700 (MST)
Received: from usco01ws0034.ad.onsemi.com (10.100.19.224) by
 USAZ01WS0031.ad.onsemi.com (10.253.116.33) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Wed, 4 Nov 2020 08:42:11 -0700
Received: from usco01ws0032.ad.onsemi.com ([fe80::80b7:7a80:187f:c952]) by
 USCO01WS0034.ad.onsemi.com ([fe80::2075:7655:52f:8c77%24]) with mapi id
 14.03.0487.000; Wed, 4 Nov 2020 08:42:10 -0700
From: Jamie Meacham <Jamie.Meacham@onsemi.com>
To: "lgirwood@gmail.com" <lgirwood@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>
Subject: [PATCH] ona10iv: add ona10iv smart PA kernel driver
Thread-Topic: [PATCH] ona10iv: add ona10iv smart PA kernel driver
Thread-Index: AdaywNO+6MP9fnwBRuu2aV2KMribMQ==
Date: Wed, 4 Nov 2020 15:42:10 +0000
Message-ID: <DBDC5A1C646D0E44AAF2E13C59E2BADDBC95D502@usco01ws0032.ad.onsemi.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.19.74]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-04_11:2020-11-04,
 2020-11-04 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
X-Mailman-Approved-At: Wed, 04 Nov 2020 17:40:12 +0100
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

From: Jamie Meacham <jamie.meacham@onsemi.com>

add ona10iv smart PA kernel driver

Signed-off-by: Jamie Meacham <jamie.meacham@onsemi.com>
---
 sound/soc/codecs/Kconfig   |    8=20
 sound/soc/codecs/Makefile  |    2=20
 sound/soc/codecs/ona10iv.c |  699 +++++++++++++++++++++++++++++++++++
 sound/soc/codecs/ona10iv.h |  632 +++++++++++++++++++++++++++++++
 4 files changed, 1341 insertions(+)
=20
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 5791b7056..53aa98f5c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -136,6 +136,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_NAU8824
 	imply SND_SOC_NAU8825
 	imply SND_SOC_HDMI_CODEC
+	imply SND_SOC_ONA10IV
 	imply SND_SOC_PCM1681
 	imply SND_SOC_PCM1789_I2C
 	imply SND_SOC_PCM179X_I2C
@@ -920,6 +921,13 @@ config SND_SOC_MSM8916_WCD_DIGITAL
 	tristate "Qualcomm MSM8916 WCD DIGITAL Codec"
 	select REGMAP_MMIO
=20
+config SND_SOC_ONA10IV
+	tristate "ON Semiconductor ONA10IV Speaker Amplifier"
+	depends on I2C
+	help
+	  Adds support for the ON Semiconductor ONA10IV
+	  speaker amplifier with I/V feedback
+
 config SND_SOC_PCM1681
 	tristate "Texas Instruments PCM1681 CODEC"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 11ce98c25..c11aa20e7 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -135,6 +135,7 @@ snd-soc-nau8822-objs :=3D nau8822.o
 snd-soc-nau8824-objs :=3D nau8824.o
 snd-soc-nau8825-objs :=3D nau8825.o
 snd-soc-hdmi-codec-objs :=3D hdmi-codec.o
+snd-soc-ona10iv-objs :=3D ona10iv.o
 snd-soc-pcm1681-objs :=3D pcm1681.o
 snd-soc-pcm1789-codec-objs :=3D pcm1789.o
 snd-soc-pcm1789-i2c-objs :=3D pcm1789-i2c.o
@@ -444,6 +445,7 @@ obj-$(CONFIG_SND_SOC_NAU8822)   +=3D snd-soc-nau8822.o
 obj-$(CONFIG_SND_SOC_NAU8824)   +=3D snd-soc-nau8824.o
 obj-$(CONFIG_SND_SOC_NAU8825)   +=3D snd-soc-nau8825.o
 obj-$(CONFIG_SND_SOC_HDMI_CODEC)	+=3D snd-soc-hdmi-codec.o
+obj-$(CONFIG_SND_SOC_ONA10IV)	+=3D snd-soc-ona10iv.o
 obj-$(CONFIG_SND_SOC_PCM1681)	+=3D snd-soc-pcm1681.o
 obj-$(CONFIG_SND_SOC_PCM179X)	+=3D snd-soc-pcm179x-codec.o
 obj-$(CONFIG_SND_SOC_PCM1789_I2C)	+=3D snd-soc-pcm1789-i2c.o
diff --git a/sound/soc/codecs/ona10iv.c b/sound/soc/codecs/ona10iv.c
new file mode 100644
index 000000000..53db45adc
--- /dev/null
+++ b/sound/soc/codecs/ona10iv.c
@@ -0,0 +1,699 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ALSA SoC ON Semiconductor ONA10IV 16W Digital Input Mono Class-D
+ * Audio Amplifier with Speaker I/V Sense
+ *
+ * Copyright (C) 2020 ON Semiconductor - https://www.onsemi.com/
+ *	Author: Jamie Meacham <jamie.meacham@onsemi.com>
+ */
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/err.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/regmap.h>
+#include <linux/of.h>
+#include <sound/soc.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/tlv.h>
+
+#include "ona10iv.h"
+
+///////////////////////////////////////////////////////
+// Local function prototypes
+///////////////////////////////////////////////////////
+static void param_errcheck(int retval, struct device *dev,
+				const char *errmsg, int param_val);
+
+///////////////////////////////////////////////////////
+// Local structure definitions
+///////////////////////////////////////////////////////
+struct ona10iv_priv {
+	struct regmap *regmap;
+	struct snd_soc_component *component;
+	int	volume;
+};
+
+///////////////////////////////////////////////////////
+// Function implementations
+///////////////////////////////////////////////////////
+static void ona10iv_reset(struct ona10iv_priv *ona10iv)
+{
+	snd_soc_component_write(ona10iv->component, ONA10IV_REG_PWR_CTRL,
+		ONA10IV_RST);
+}
+
+static int ona10iv_set_bias_level(struct snd_soc_component *component,
+					enum snd_soc_bias_level level)
+{
+	int from_state;
+	int ret;
+
+	switch (level) {
+	case SND_SOC_BIAS_ON:
+		dev_dbg(component->dev, "ONA10IV-->active\n");
+		ret =3D snd_soc_component_update_bits(component,
+			ONA10IV_REG_PWR_CTRL, ONA10IV_PWR_STATE_MASK,
+			ONA10IV_SD_N_NORMAL | ONA10IV_STBY_RELEASE);
+		break;
+
+	case SND_SOC_BIAS_PREPARE:
+	case SND_SOC_BIAS_STANDBY:
+		dev_dbg(component->dev, "ONA10IV-->standby\n");
+		from_state =3D snd_soc_component_get_bias_level(component);
+
+		ret =3D snd_soc_component_update_bits(component,
+			ONA10IV_REG_PWR_CTRL, ONA10IV_PWR_STATE_MASK,
+			ONA10IV_SD_N_NORMAL | ONA10IV_STBY);
+
+		if (from_state =3D=3D SND_SOC_BIAS_ON)
+			msleep(255);
+		break;
+
+	case SND_SOC_BIAS_OFF:
+		dev_dbg(component->dev, "ONA10IV-->soft shut-down\n");
+		from_state =3D snd_soc_component_get_bias_level(component);
+
+		ret =3D snd_soc_component_update_bits(component,
+			ONA10IV_REG_PWR_CTRL, ONA10IV_PWR_STATE_MASK,
+			ONA10IV_SD_N_SHUTDOWN | ONA10IV_STBY);
+
+		if (from_state =3D=3D SND_SOC_BIAS_ON)
+			msleep(255);
+
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int ona10iv_codec_suspend(struct snd_soc_component *component)
+{
+	int from_state;
+	int ret;
+
+	dev_dbg(component->dev, "ONA10IV-->suspend (standby)\n");
+	from_state =3D snd_soc_component_get_bias_level(component);
+
+	ret =3D snd_soc_component_update_bits(component,
+			ONA10IV_REG_PWR_CTRL, ONA10IV_PWR_STATE_MASK,
+			ONA10IV_SD_N_NORMAL | ONA10IV_STBY);
+
+	if (from_state =3D=3D SND_SOC_BIAS_ON)
+		msleep(255);	// pause for volume ramp to complete
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int ona10iv_codec_resume(struct snd_soc_component *component)
+{
+	int from_state;
+	int ret;
+
+	dev_dbg(component->dev, "ONA10IV-->resume (active)\n");
+	from_state =3D snd_soc_component_get_bias_level(component);
+
+	ret =3D snd_soc_component_update_bits(component,
+			ONA10IV_REG_PWR_CTRL, ONA10IV_PWR_STATE_MASK,
+			ONA10IV_SD_N_NORMAL | ONA10IV_STBY);
+
+	if (from_state =3D=3D SND_SOC_BIAS_ON)
+		msleep(255);	// pause for volume ramp to complete
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+#else
+#define ona10iv_codec_suspend NULL
+#define ona10iv_codec_resume NULL
+#endif
+
+static int ona10iv_dac_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =3D
+			snd_soc_dapm_to_component(w->dapm);
+	int ret =3D 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		dev_dbg(component->dev, "ONA10IV-->post power-up\n");
+		ret =3D snd_soc_component_update_bits(component,
+				ONA10IV_REG_PWR_CTRL, ONA10IV_PWR_STATE_MASK,
+				ONA10IV_SD_N_NORMAL | ONA10IV_STBY_RELEASE);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		dev_dbg(component->dev, "ONA10IV-->pre power-down\n");
+		ret =3D snd_soc_component_update_bits(component,
+				ONA10IV_REG_PWR_CTRL, ONA10IV_PWR_STATE_MASK,
+				ONA10IV_SD_N_NORMAL | ONA10IV_STBY);
+		msleep(255);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		dev_dbg(component->dev, "ONA10IV-->post power-down\n");
+		ret =3D snd_soc_component_update_bits(component,
+				ONA10IV_REG_PWR_CTRL, ONA10IV_PWR_STATE_MASK,
+				ONA10IV_SD_N_SHUTDOWN | ONA10IV_STBY_RELEASE);
+		break;
+	default:
+		dev_err(component->dev, "Not supported evevt\n");
+		ret =3D -EINVAL;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new isense_switch =3D
+	SOC_DAPM_SINGLE("Switch", ONA10IV_REG_DATAO_CTRL2, 7, 1, 0);
+static const struct snd_kcontrol_new vsense_switch =3D
+	SOC_DAPM_SINGLE("Switch", ONA10IV_REG_DATAO_CTRL2, 6, 1, 0);
+
+static const struct snd_soc_dapm_widget ona10iv_dapm_widgets[] =3D {
+	SND_SOC_DAPM_AIF_IN("ona10iv DAI", "DAI Playback",
+				0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_SWITCH("ISENSE", ONA10IV_REG_DATAO_CTRL2,
+				7, 0, &isense_switch),
+	SND_SOC_DAPM_SWITCH("VSENSE", ONA10IV_REG_DATAO_CTRL2,
+				7, 0, &vsense_switch),
+	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM,
+				0, 0, ona10iv_dac_event,
+				SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD |
+				SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_OUTPUT("OUT"),
+	SND_SOC_DAPM_SIGGEN("VMON"),
+	SND_SOC_DAPM_SIGGEN("IMON"),
+	SND_SOC_DAPM_ADC("VMON", "DAI Capture", SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_ADC("IMON", "DAI Capture", SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route ona10iv_audio_map[] =3D {
+	{"DAC", NULL, "ona10iv DAI"},
+	{"OUT", NULL, "DAC"},
+	{"ISENSE", "Switch", "IMON"},
+	{"VSENSE", "Switch", "VMON"},
+};
+
+static int ona10iv_mute(struct snd_soc_dai *dai, int mute, int dir)
+{
+	int ret;
+	struct snd_soc_component *component =3D dai->component;
+	struct ona10iv_priv *ona10iv;
+
+	ona10iv =3D snd_soc_component_get_drvdata(component);
+
+	/* using "mute" bit can cause a pop. Instead store volume setting
+	 * and set volume to minimum allowing a smooth ramp-down.
+	 */
+
+	dev_dbg(component->dev, "mute dir: %d val: %d\n", dir, mute);
+
+	if (dir !=3D SNDRV_PCM_STREAM_PLAYBACK)
+		return -EINVAL;
+
+	if (mute) {
+		ret =3D regmap_read(ona10iv->regmap, ONA10IV_REG_MAX_VOL,
+					&ona10iv->volume);
+		if (ret < 0) {
+			dev_err(component->dev, "Failed to read: %d\n", ret);
+			return ret;
+		}
+		ret =3D regmap_write(ona10iv->regmap, ONA10IV_REG_MAX_VOL,
+					ONA10IV_VOL_AMP_MUTE);
+	} else {
+		ret =3D regmap_write(ona10iv->regmap, ONA10IV_REG_MAX_VOL,
+					ona10iv->volume);
+	}
+
+	return ret;
+}
+
+static int ona10iv_set_bitwidth(struct ona10iv_priv *ona10iv, int format)
+{
+	struct snd_soc_component *component =3D ona10iv->component;
+	int slot_width, sample_width;
+	int ret =3D 0;
+
+	dev_dbg(component->dev,
+			"ONA10IV-->set bitwidth for format: %d\n", format);
+
+	switch (format) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		sample_width =3D ONA10IV_SAMPW_16;
+		slot_width =3D ONA10IV_SLOTW_16;
+		break;
+	case SNDRV_PCM_FORMAT_S24_3LE:
+		sample_width =3D ONA10IV_SAMPW_24;
+		slot_width =3D ONA10IV_SLOTW_24;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+	case SNDRV_PCM_FORMAT_S32_LE:
+		sample_width =3D ONA10IV_SAMPW_32;
+		slot_width =3D ONA10IV_SLOTW_32;
+		break;
+	default:
+		ret =3D -EINVAL;
+	}
+	param_errcheck(ret, component->dev,
+				"error no case match for format", format);
+
+	if (ret < 0)
+		return ret;
+
+	ret =3D snd_soc_component_update_bits(component,
+				ONA10IV_REG_DAI_CTRL2, ONA10IV_SAMPW_MASK,
+				sample_width);
+	param_errcheck(ret, component->dev,
+				"error writing sample width", sample_width);
+	if (ret < 0)
+		return ret;
+
+	ret =3D snd_soc_component_update_bits(component,
+				ONA10IV_REG_DAI_CTRL2, ONA10IV_SLOTW_MASK,
+				slot_width);
+	param_errcheck(ret, component->dev,
+				"error writing slot width", slot_width);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int ona10iv_set_samplerate(struct ona10iv_priv *ona10iv,
+					int samplerate)
+{
+	struct snd_soc_component *component =3D ona10iv->component;
+	int rate_val;
+	int ret =3D 0;
+
+	dev_dbg(component->dev, "ONA10IV-->samplerate: %d\n", samplerate);
+
+	switch (samplerate) {
+	case 16000:
+		rate_val =3D ONA10IV_FS_16KHZ;
+		break;
+	case 22050:
+		rate_val =3D ONA10IV_FS_22KHZ;
+		break;
+	case 32000:
+		rate_val =3D ONA10IV_FS_32KHZ;
+		break;
+	case 44100:
+		rate_val =3D ONA10IV_FS_44KHZ;
+		break;
+	case 48000:
+		rate_val =3D ONA10IV_FS_48KHZ;
+		break;
+	case 96000:
+		rate_val =3D ONA10IV_FS_96KHZ;
+		break;
+	default:
+		ret =3D -EINVAL;
+	}
+	param_errcheck(ret, component->dev,
+				"error no case match for rate", samplerate);
+	if (ret < 0)
+		return ret;
+
+	ret =3D snd_soc_component_update_bits(component,
+				ONA10IV_REG_DAI_CTRL1, ONA10IV_FS_MASK,
+				rate_val);
+	param_errcheck(ret, component->dev,
+				"error writing rate", rate_val);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int ona10iv_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component =3D dai->component;
+	struct ona10iv_priv *ona10iv =3D
+				snd_soc_component_get_drvdata(component);
+	int ret;
+
+	dev_dbg(component->dev, "ONA10IV-->setting hw params\n");
+
+	ret =3D ona10iv_set_bitwidth(ona10iv, params_format(params));
+	param_errcheck(ret, component->dev,
+				"error setting bitwidth for format",
+				params_format(params));
+	if (ret)
+		return ret;
+
+	ret =3D ona10iv_set_samplerate(ona10iv, params_rate(params));
+	param_errcheck(ret, component->dev,
+				"error setting rate", params_rate(params));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ona10iv_set_dai_tdm_slot(struct snd_soc_dai *dai,
+				unsigned int tx_mask,
+				unsigned int rx_mask,
+				int slots, int slot_width)
+{
+	struct snd_soc_component *component =3D dai->component;
+	int left_slot, right_slot;
+	int slot_val;
+	int i_enable, v_enable;
+	int i_slot, v_slot;
+	int reg_val;
+	int ret;
+
+	dev_dbg(component->dev,
+			"set dai txm: %x rxm %x slots: %d width: %d\n",
+			tx_mask, rx_mask, slots, slot_width);
+
+	if (tx_mask =3D=3D 0 || slots !=3D 2)
+		return -EINVAL;
+
+	left_slot =3D __ffs(tx_mask);
+	tx_mask &=3D ~(1 << left_slot);
+	if (tx_mask =3D=3D 0) {
+		right_slot =3D left_slot;
+	} else {
+		right_slot =3D __ffs(tx_mask);
+		tx_mask &=3D ~(1 << right_slot);
+	}
+
+
+	// right slot checked but not used.
+	if (tx_mask !=3D 0 || left_slot >=3D slots || right_slot >=3D slots)
+		return -EINVAL;
+
+	switch (left_slot) {
+	case 1:
+		slot_val =3D ONA10IV_A_SLOT_1;
+		break;
+	case 2:
+		slot_val =3D ONA10IV_A_SLOT_2;
+		break;
+	}
+
+	ret =3D snd_soc_component_update_bits(component,
+				ONA10IV_REG_DAI_CTRL3, ONA10IV_A_SLOT_MSK,
+				slot_val);
+	param_errcheck(ret, component->dev,
+				"error setting transmit slot", slot_val);
+	if (ret < 0)
+		return ret;
+
+	i_slot =3D 0;
+	v_slot =3D 0;
+	if (rx_mask =3D=3D 0) {
+		i_enable =3D 0;
+		v_enable =3D 0;
+	} else {
+		i_enable =3D 1;
+		i_slot =3D __ffs(rx_mask);
+		rx_mask &=3D ~(1 << i_slot);
+		if (rx_mask !=3D 0) {
+			v_enable =3D 1;
+			v_slot =3D __ffs(rx_mask);
+			rx_mask &=3D ~(1 << v_slot);
+		}
+	}
+
+	if (rx_mask !=3D 0 || i_slot >=3D slots || v_slot >=3D slots)
+		return -EINVAL;
+
+	if (i_enable) {
+		reg_val =3D ONA10IV_I_DATAO_TX_ENABLE;
+		switch (i_slot) {
+		case 1:
+			reg_val |=3D ONA10IV_I_SLOT_1;
+			break;
+		case 2:
+			reg_val |=3D ONA10IV_I_SLOT_2;
+			break;
+		}
+		ret =3D snd_soc_component_write(component,
+					ONA10IV_REG_DATAO_CTRL2, reg_val);
+		param_errcheck(ret, component->dev,
+				"error setting current sense slot and enable",
+				reg_val);
+		if (ret < 0)
+			return ret;
+	}
+
+	if (v_enable) {
+		reg_val =3D ONA10IV_V_DATAO_TX_ENABLE;
+		switch (v_slot) {
+		case 1:
+			reg_val |=3D ONA10IV_V_SLOT_1;
+			break;
+		case 2:
+			reg_val |=3D ONA10IV_V_SLOT_2;
+			break;
+		}
+		ret =3D snd_soc_component_write(component,
+					ONA10IV_REG_DATAO_CTRL2, reg_val);
+		param_errcheck(ret, component->dev,
+				"error setting voltage sense slot and enable",
+				reg_val);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void param_errcheck(int retval, struct device *dev,
+				const char *errmsg, int param_val)
+{
+	if (retval < 0)
+		dev_dbg(dev, "Error %d: %s =3D %d\n", retval, errmsg, param_val);
+}
+
+static struct snd_soc_dai_ops ona10iv_dai_ops =3D {
+	.mute_stream =3D ona10iv_mute,
+	.hw_params  =3D ona10iv_hw_params,
+	.set_fmt    =3D NULL,
+	.set_tdm_slot =3D ona10iv_set_dai_tdm_slot,
+	.startup =3D NULL,
+	.shutdown =3D NULL,
+	.prepare =3D NULL,
+};
+
+#define ONA10IV_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			 SNDRV_PCM_FMTBIT_S24_3LE |\
+			 SNDRV_PCM_FMTBIT_S24_LE |\
+			 SNDRV_PCM_FMTBIT_S32_LE)
+
+#define ONA10IV_RATES (SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 |\
+			 SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |\
+			 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000)
+
+static struct snd_soc_dai_driver ona10iv_dai[] =3D {
+	{
+		.name =3D "ona10iv DAI",
+		.id =3D 0,
+		.playback =3D {
+			.stream_name	=3D "DAI Playback",
+			.channels_min	=3D 2,
+			.channels_max	=3D 2,
+			.rates			=3D ONA10IV_RATES,
+			.formats		=3D ONA10IV_FORMATS,
+		},
+		.capture =3D {
+			.stream_name	=3D "DAI Capture",
+			.channels_min	=3D 2,
+			.channels_max	=3D 2,
+			.rates			=3D ONA10IV_RATES,
+			.formats		=3D ONA10IV_FORMATS,
+		},
+		.ops =3D &ona10iv_dai_ops,
+		.symmetric_rates =3D 1,
+	},
+};
+
+static int ona10iv_codec_probe(struct snd_soc_component *component)
+{
+	struct ona10iv_priv *ona10iv =3D
+			snd_soc_component_get_drvdata(component);
+
+	ona10iv->component =3D component;
+
+	dev_dbg(component->dev, "ONA10IV-->device probe\n");
+
+	ona10iv_reset(ona10iv);
+
+	return 0;
+}
+
+static DECLARE_TLV_DB_MINMAX(ona10iv_digital_tlv, 0, 1600);
+static DECLARE_TLV_DB_MINMAX(ona10iv_playback_volume, -9562, 0);
+
+static const struct snd_kcontrol_new ona10iv_snd_controls[] =3D {
+	SOC_SINGLE_TLV("Playback Volume", ONA10IV_REG_MAX_VOL, 0, 255, 1,
+					ona10iv_playback_volume),
+	SOC_SINGLE_TLV("Amp Gain", ONA10IV_REG_GAIN_CTRL1, 0, 31, 1,
+					ona10iv_digital_tlv),
+};
+
+static const struct snd_soc_component_driver ona10iv_component_driver =3D =
{
+	.probe =3D ona10iv_codec_probe,
+	.suspend =3D ona10iv_codec_suspend,
+	.resume =3D ona10iv_codec_resume,
+	.set_bias_level =3D ona10iv_set_bias_level,
+	.controls =3D ona10iv_snd_controls,
+	.num_controls =3D ARRAY_SIZE(ona10iv_snd_controls),
+	.dapm_widgets =3D ona10iv_dapm_widgets,
+	.num_dapm_widgets =3D ARRAY_SIZE(ona10iv_dapm_widgets),
+	.dapm_routes =3D ona10iv_audio_map,
+	.num_dapm_routes =3D ARRAY_SIZE(ona10iv_audio_map),
+	.idle_bias_on =3D 1,
+	.endianness =3D 1,
+	.non_legacy_dai_naming =3D 1,
+	.use_pmdown_time =3D 1,
+};
+
+static const struct reg_default ona10iv_reg_defaults[] =3D {
+	{ ONA10IV_REG_PWR_CTRL,		0x00 },
+	{ ONA10IV_REG_INT_MASK,		0x00 },
+	{ ONA10IV_REG_ERR_CTRL,		0x00 },
+	{ ONA10IV_REG_DAI_CTRL1,	0x06 },
+	{ ONA10IV_REG_DAI_CTRL2,	0x55 },
+	{ ONA10IV_REG_DAI_CTRL3,	0x00 },
+	{ ONA10IV_REG_MAX_VOL,		0x00 },
+	{ ONA10IV_REG_VOL_CTRL,		0x0E },
+	{ ONA10IV_REG_GAIN_CTRL1,	0x00 },
+	{ ONA10IV_REG_EMI_CTRL,		0x1C },
+	{ ONA10IV_REG_AGC_BATT,		0x00 },
+	{ ONA10IV_REG_AGC_CTRL1,	0x00 },
+	{ ONA10IV_REG_AGC_CTRL2,	0x00 },
+	{ ONA10IV_REG_AGC_CTRL3,	0x00 },
+	{ ONA10IV_REG_MAGC_CTRL1,	0x00 },
+	{ ONA10IV_REG_MAGC_CTRL2,	0x00 },
+	{ ONA10IV_REG_MAGC_CTRL3,	0x00 },
+	{ ONA10IV_REG_SENSE_CTRL,	0x00 },
+	{ ONA10IV_REG_DATAO_CTRL1,	0x00 },
+	{ ONA10IV_REG_DATAO_CTRL2,	0x08 },
+	{ ONA10IV_REG_DATAO_CTRL3,	0x02 },
+};
+
+static bool ona10iv_volatile(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ONA10IV_REG_PWR_CTRL:	/* reset bit is self clearing */
+	case ONA10IV_REG_INT_FLAG:
+	case ONA10IV_REG_ERR_STAT:
+	case ONA10IV_REG_T_SENSE_OUT1:
+	case ONA10IV_REG_T_SENSE_OUT2:/* Sticky interrupt flags */
+		return true;
+	}
+
+	return false;
+}
+
+static bool ona10iv_writeable(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ONA10IV_REG_DEVICE_ID:
+	case ONA10IV_REG_ERR_STAT:
+	case ONA10IV_REG_T_SENSE_OUT1:
+	case ONA10IV_REG_T_SENSE_OUT2:
+		return false;
+	}
+
+	return true;
+}
+
+static const struct regmap_config ona10iv_i2c_regmap =3D {
+	.reg_bits	=3D 8,
+	.val_bits	=3D 8,
+	.writeable_reg =3D ona10iv_writeable,
+	.volatile_reg =3D ona10iv_volatile,
+	.reg_defaults =3D ona10iv_reg_defaults,
+	.max_register =3D ONA10IV_REG_DATAO_CTRL3,
+	.num_reg_defaults =3D ARRAY_SIZE(ona10iv_reg_defaults),
+	.cache_type	=3D REGCACHE_RBTREE,
+};
+
+static int ona10iv_i2c_probe(struct i2c_client *i2c,
+			const struct i2c_device_id *id)
+{
+	struct ona10iv_priv *ona10iv;
+	int ret, reg;
+
+	ona10iv =3D devm_kzalloc(&i2c->dev, sizeof(*ona10iv), GFP_KERNEL);
+	if (ona10iv =3D=3D NULL)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, ona10iv);
+
+	ona10iv->regmap =3D devm_regmap_init_i2c(i2c, &ona10iv_i2c_regmap);
+	if (IS_ERR(ona10iv->regmap)) {
+		ret =3D PTR_ERR(ona10iv->regmap);
+		dev_err(&i2c->dev, "Failed to allocate regmap: %d\n", ret);
+		return ret;
+	}
+	ret =3D regmap_read(ona10iv->regmap, ONA10IV_REG_DEVICE_ID, &reg);
+	if (ret < 0) {
+		dev_err(&i2c->dev, "Failed to read: %d\n", ret);
+		return ret;
+	}
+	dev_dbg(&i2c->dev, "device revision: %x\n", reg);
+
+	ona10iv->volume =3D 0;
+
+	ret =3D devm_snd_soc_register_component(&i2c->dev,
+				&ona10iv_component_driver,
+				ona10iv_dai, ARRAY_SIZE(ona10iv_dai));
+	if (ret < 0)
+		dev_err(&i2c->dev, "Failed to register component: %d\n", ret);
+	return ret;
+}
+
+static int ona10iv_i2c_remove(struct i2c_client *client)
+{
+	return 0;
+}
+
+static const struct i2c_device_id ona10iv_i2c_id[] =3D {
+	{ "ona10iv", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ona10iv_i2c_id);
+
+static const struct of_device_id ona10iv_of_match[] =3D {
+	{ .compatible =3D "onnn,ona10iv" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ona10iv_of_match);
+
+static struct i2c_driver ona10iv_i2c_driver =3D {
+	.driver =3D {
+		.name   =3D "ona10iv",
+		.of_match_table =3D of_match_ptr(ona10iv_of_match),
+	},
+	.probe		=3D ona10iv_i2c_probe,
+	.remove		=3D ona10iv_i2c_remove,
+	.id_table	=3D ona10iv_i2c_id,
+};
+module_i2c_driver(ona10iv_i2c_driver);
+
+MODULE_AUTHOR("Jamie Meacham <jamie.meacham@onsemi.com>");
+MODULE_DESCRIPTION("ONA10IV I2C Smart Amplifier driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/ona10iv.h b/sound/soc/codecs/ona10iv.h
new file mode 100644
index 000000000..2c46088ac
--- /dev/null
+++ b/sound/soc/codecs/ona10iv.h
@@ -0,0 +1,632 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * ALSA SoC ONA10IV codec driver
+ *
+ * Copyright (C) 2020 ON Semiconductor - https://www.onsemi.com/
+ */
+#ifndef __ONA10IV__
+#define __ONA10IV__
+
+
+/** ONA10IV Register Map **/
+#define ONA10IV_REG_DEVICE_ID		(0x00)
+
+#define ONA10IV_REG_PWR_CTRL			(0x01)
+#define		ONA10IV_TFB_PD			(0x01<<7)
+#define		ONA10IV_BATT_CFG		(0x01<<6)
+#define		ONA10IV_AGC_PD			(0x01<<5)
+#define		ONA10IV_IVSNS_PD		(0x01<<4)
+#define		ONA10IV_AMP_PD			(0x01<<3)
+#define		ONA10IV_SD_N_SHUTDOWN		(0x00<<2)
+#define		ONA10IV_SD_N_NORMAL		(0x01<<2)
+#define		ONA10IV_STBY_RELEASE		(0x00<<1)
+#define		ONA10IV_STBY			(0x01<<1)
+#define		ONA10IV_PWR_STATE_MASK		(0x03<<1)
+#define		ONA10IV_RST_RELEASE		(0x00<<0)
+#define		ONA10IV_RST			(0x01<<0)
+
+#define ONA10IV_REG_INT_FLAG		(0x02)
+#define		ONA10IV_TFB_I			(0x01<<5)
+#define		ONA10IV_AGC_I			(0x01<<4)
+#define		ONA10IV_CERR_I			(0x01<<3)
+#define		ONA10IV_TERR_I			(0x01<<2)
+#define		ONA10IV_IERR_I			(0x01<<1)
+#define		ONA10IV_VERR_I			(0x01<<0)
+
+#define ONA10IV_REG_INT_MASK		(0x03)
+#define		ONA10IV_ALL_MASK		(0x01<<6)
+#define		ONA10IV_TFB_M			(0x01<<5)
+#define		ONA10IV_AGC_M			(0x01<<4)
+#define		ONA10IV_CERR_M			(0x01<<3)
+#define		ONA10IV_TERR_M			(0x01<<2)
+#define		ONA10IV_IERR_M			(0x01<<1)
+#define		ONA10IV_VERR_M			(0x01<<0)
+
+#define ONA10IV_REG_ERR_STAT		(0x04)
+#define		ONA10IV_TFB			(0x01<<5)
+#define		ONA10IV_AGC			(0x01<<4)
+#define		ONA10IV_CERR			(0x01<<3)
+#define		ONA10IV_TERR			(0x01<<2)
+#define		ONA10IV_IERR			(0x01<<1)
+#define		ONA10IV_VERR			(0x01<<0)
+
+#define ONA10IV_REG_ERR_CTRL		(0x05)
+#define		ONA10IV_MRCV			(0x01<<5)
+#define		ONA10IV_MAX_ARCV_ALWAYS		(0x00<<3)
+#define		ONA10IV_MAX_ARCV_1_ATT		(0x01<<3)
+#define		ONA10IV_MAX_ARCV_3_ATT		(0x02<<3)
+#define		ONA10IV_MAX_ARCV_7_ATT		(0x03<<3)
+#define		ONA10IV_ARCV_T			(0x01<<2)
+#define		ONA10IV_ARCV_I			(0x01<<1)
+#define		ONA10IV_ARCV_C			(0x01<<0)
+
+#define ONA10IV_REG_DAI_CTRL1		(0x06)
+#define		ONA10IV_BEDGE_DAI_FALLING	(0x00<<7)
+#define		ONA10IV_BEDGE_DAI_RISING	(0x01<<7)
+#define		ONA10IV_FORMAT_I2S_DELAY	(0x00<<6)
+#define		ONA10IV_FORMAT_NO_DELAY		(0x01<<6)
+#define		ONA10IV_DAI_I2S			(0x00<<4)
+#define		ONA10IV_DAI_TDM2		(0x01<<4)
+#define		ONA10IV_DAI_TDM4		(0x02<<4)
+#define		ONA10IV_DAI_TDM8		(0x03<<4)
+#define		ONA10IV_FS_16KHZ		(0x02<<0)
+#define		ONA10IV_FS_22KHZ		(0x03<<0)
+#define		ONA10IV_FS_32KHZ		(0x04<<0)
+#define		ONA10IV_FS_44KHZ		(0x05<<0)
+#define		ONA10IV_FS_48KHZ		(0x06<<0)
+#define		ONA10IV_FS_96KHZ		(0x08<<0)
+#define		ONA10IV_FS_MASK			(0x0F<<0)
+
+#define ONA10IV_REG_DAI_CTRL2		(0x07)
+#define		ONA10IV_SAMPW_16		(0x00<<6)
+#define		ONA10IV_SAMPW_24		(0x01<<6)
+#define		ONA10IV_SAMPW_32		(0x02<<6)
+#define		ONA10IV_SAMPW_MASK		(0x03<<6)
+#define		ONA10IV_SLOTW_16		(0x00<<4)
+#define		ONA10IV_SLOTW_24		(0x01<<4)
+#define		ONA10IV_SLOTW_32		(0x02<<4)
+#define		ONA10IV_SLOTW_MASK		(0x03<<4)
+#define		ONA10IV_FRM_DLY_0		(0x00<<2)
+#define		ONA10IV_FRM_DLY_1		(0x01<<2)
+#define		ONA10IV_FRM_DLY_2		(0x02<<2)
+#define		ONA10IV_FRM_DLY_3		(0x03<<2)
+#define		ONA10IV_FRM_POL_NORMAL		(0x00<<1)
+#define		ONA10IV_FRM_POL_INVERT		(0x01<<1)
+#define		ONA10IV_FRCK_MODE_50		(0x00<<0)
+#define		ONA10IV_FRCK_MODE_PULSE		(0x01<<0)
+
+#define ONA10IV_REG_DAI_CTRL3		(0x08)
+#define		ONA10IV_DAC_MODE_1		(0x00<<4)
+#define		ONA10IV_DAC_MODE_2		(0x01<<4)
+#define		ONA10IV_DAC_MODE_3		(0x02<<4)
+#define		ONA10IV_DAC_MODE_NOT_USED	(0x03<<4)
+#define		ONA10IV_PDM_MODE_PCM		(0x00<<3)
+#define		ONA10IV_PDM_MODE_PDM		(0x01<<3)
+#define		ONA10IV_A_SLOT_1		(0x00<<0)
+#define		ONA10IV_A_SLOT_2		(0x01<<0)
+#define		ONA10IV_A_SLOT_3		(0x02<<0)
+#define		ONA10IV_A_SLOT_4		(0x03<<0)
+#define		ONA10IV_A_SLOT_5		(0x04<<0)
+#define		ONA10IV_A_SLOT_6		(0x05<<0)
+#define		ONA10IV_A_SLOT_7		(0x06<<0)
+#define		ONA10IV_A_SLOT_8		(0x07<<0)
+#define		ONA10IV_A_SLOT_MSK		(0x07<<0)
+
+#define ONA10IV_REG_MAX_VOL		(0x09)
+#define		ONA10IV_VOL_0DB			(0x00)
+#define		ONA10IV_VOL_MINUS_0_375DB	(0x01)
+#define		ONA10IV_VOL_MINUS_0_750DB	(0x02)
+#define		ONA10IV_VOL_MINUS_1_125DB	(0x03)
+#define		ONA10IV_VOL_MINUS_1_500DB	(0x04)
+#define		ONA10IV_VOL_MINUS_1_875DB	(0x05)
+#define		ONA10IV_VOL_MINUS_2_250DB	(0x06)
+#define		ONA10IV_VOL_MINUS_2_625DB	(0x07)
+#define		ONA10IV_VOL_MINUS_3_000DB	(0x08)
+#define		ONA10IV_VOL_MINUS_3_375DB	(0x09)
+#define		ONA10IV_VOL_MINUS_3_750DB	(0x0A)
+#define		ONA10IV_VOL_MINUS_4_125DB	(0x0B)
+#define		ONA10IV_VOL_MINUS_4_500DB	(0x0C)
+#define		ONA10IV_VOL_MINUS_4_875DB	(0x0D)
+#define		ONA10IV_VOL_MINUS_5_250DB	(0x0E)
+#define		ONA10IV_VOL_MINUS_5_625DB	(0x0F)
+#define		ONA10IV_VOL_MINUS_6_000DB	(0x10)
+#define		ONA10IV_VOL_MINUS_6_375DB	(0x11)
+#define		ONA10IV_VOL_MINUS_6_750DB	(0x12)
+#define		ONA10IV_VOL_MINUS_7_125DB	(0x13)
+#define		ONA10IV_VOL_MINUS_7_500DB	(0x14)
+#define		ONA10IV_VOL_MINUS_7_875DB	(0x15)
+#define		ONA10IV_VOL_MINUS_8_250DB	(0x16)
+#define		ONA10IV_VOL_MINUS_8_625DB	(0x17)
+#define		ONA10IV_VOL_MINUS_9_000DB	(0x18)
+#define		ONA10IV_VOL_MINUS_9_375DB	(0x19)
+#define		ONA10IV_VOL_MINUS_9_750DB	(0x1A)
+#define		ONA10IV_VOL_MINUS_10_125DB	(0x1B)
+#define		ONA10IV_VOL_MINUS_10_500DB	(0x1C)
+#define		ONA10IV_VOL_MINUS_10_875DB	(0x1D)
+#define		ONA10IV_VOL_MINUS_11_250DB	(0x1E)
+#define		ONA10IV_VOL_MINUS_11_625DB	(0x1F)
+#define		ONA10IV_VOL_MINUS_12_000DB	(0x20)
+#define		ONA10IV_VOL_MINUS_12_375DB	(0x21)
+#define		ONA10IV_VOL_MINUS_12_750DB	(0x22)
+#define		ONA10IV_VOL_MINUS_13_125DB	(0x23)
+#define		ONA10IV_VOL_MINUS_13_500DB	(0x24)
+#define		ONA10IV_VOL_MINUS_13_875DB	(0x25)
+#define		ONA10IV_VOL_MINUS_14_250DB	(0x26)
+#define		ONA10IV_VOL_MINUS_14_625DB	(0x27)
+#define		ONA10IV_VOL_MINUS_15_000DB	(0x28)
+#define		ONA10IV_VOL_MINUS_15_375DB	(0x29)
+#define		ONA10IV_VOL_MINUS_15_750DB	(0x2A)
+#define		ONA10IV_VOL_MINUS_16_125DB	(0x2B)
+#define		ONA10IV_VOL_MINUS_16_500DB	(0x2C)
+#define		ONA10IV_VOL_MINUS_16_875DB	(0x2D)
+#define		ONA10IV_VOL_MINUS_17_250DB	(0x2E)
+#define		ONA10IV_VOL_MINUS_17_625DB	(0x2F)
+#define		ONA10IV_VOL_MINUS_18_000DB	(0x30)
+#define		ONA10IV_VOL_MINUS_18_375DB	(0x31)
+#define		ONA10IV_VOL_MINUS_18_750DB	(0x32)
+#define		ONA10IV_VOL_MINUS_19_125DB	(0x33)
+#define		ONA10IV_VOL_MINUS_19_500DB	(0x34)
+#define		ONA10IV_VOL_MINUS_19_875DB	(0x35)
+#define		ONA10IV_VOL_MINUS_20_250DB	(0x36)
+#define		ONA10IV_VOL_MINUS_20_625DB	(0x37)
+#define		ONA10IV_VOL_MINUS_21_000DB	(0x38)
+#define		ONA10IV_VOL_MINUS_21_375DB	(0x39)
+#define		ONA10IV_VOL_MINUS_21_750DB	(0x3A)
+#define		ONA10IV_VOL_MINUS_22_125DB	(0x3B)
+#define		ONA10IV_VOL_MINUS_22_500DB	(0x3C)
+#define		ONA10IV_VOL_MINUS_22_875DB	(0x3D)
+#define		ONA10IV_VOL_MINUS_23_250DB	(0x3E)
+#define		ONA10IV_VOL_MINUS_23_625DB	(0x3F)
+#define		ONA10IV_VOL_MINUS_24_000DB	(0x40)
+#define		ONA10IV_VOL_MINUS_24_375DB	(0x41)
+#define		ONA10IV_VOL_MINUS_24_750DB	(0x42)
+#define		ONA10IV_VOL_MINUS_25_125DB	(0x43)
+#define		ONA10IV_VOL_MINUS_25_500DB	(0x44)
+#define		ONA10IV_VOL_MINUS_25_875DB	(0x45)
+#define		ONA10IV_VOL_MINUS_26_250DB	(0x46)
+#define		ONA10IV_VOL_MINUS_26_625DB	(0x47)
+#define		ONA10IV_VOL_MINUS_27_000DB	(0x48)
+#define		ONA10IV_VOL_MINUS_27_375DB	(0x49)
+#define		ONA10IV_VOL_MINUS_27_750DB	(0x4A)
+#define		ONA10IV_VOL_MINUS_28_125DB	(0x4B)
+#define		ONA10IV_VOL_MINUS_28_500DB	(0x4C)
+#define		ONA10IV_VOL_MINUS_28_875DB	(0x4D)
+#define		ONA10IV_VOL_MINUS_29_250DB	(0x4E)
+#define		ONA10IV_VOL_MINUS_29_625DB	(0x4F)
+#define		ONA10IV_VOL_MINUS_30_000DB	(0x50)
+#define		ONA10IV_VOL_MINUS_30_375DB	(0x51)
+#define		ONA10IV_VOL_MINUS_30_750DB	(0x52)
+#define		ONA10IV_VOL_MINUS_31_125DB	(0x53)
+#define		ONA10IV_VOL_MINUS_31_500DB	(0x54)
+#define		ONA10IV_VOL_MINUS_31_875DB	(0x55)
+#define		ONA10IV_VOL_MINUS_32_250DB	(0x56)
+#define		ONA10IV_VOL_MINUS_32_625DB	(0x57)
+#define		ONA10IV_VOL_MINUS_33_000DB	(0x58)
+#define		ONA10IV_VOL_MINUS_33_375DB	(0x59)
+#define		ONA10IV_VOL_MINUS_33_750DB	(0x5A)
+#define		ONA10IV_VOL_MINUS_34_125DB	(0x5B)
+#define		ONA10IV_VOL_MINUS_34_500DB	(0x5C)
+#define		ONA10IV_VOL_MINUS_34_875DB	(0x5D)
+#define		ONA10IV_VOL_MINUS_35_250DB	(0x5E)
+#define		ONA10IV_VOL_MINUS_35_625DB	(0x5F)
+#define		ONA10IV_VOL_MINUS_36_000DB	(0x60)
+#define		ONA10IV_VOL_MINUS_36_375DB	(0x61)
+#define		ONA10IV_VOL_MINUS_36_750DB	(0x62)
+#define		ONA10IV_VOL_MINUS_37_125DB	(0x63)
+#define		ONA10IV_VOL_MINUS_37_500DB	(0x64)
+#define		ONA10IV_VOL_MINUS_37_875DB	(0x65)
+#define		ONA10IV_VOL_MINUS_38_250DB	(0x66)
+#define		ONA10IV_VOL_MINUS_38_625DB	(0x67)
+#define		ONA10IV_VOL_MINUS_39_000DB	(0x68)
+#define		ONA10IV_VOL_MINUS_39_375DB	(0x69)
+#define		ONA10IV_VOL_MINUS_39_750DB	(0x6A)
+#define		ONA10IV_VOL_MINUS_40_125DB	(0x6B)
+#define		ONA10IV_VOL_MINUS_40_500DB	(0x6C)
+#define		ONA10IV_VOL_MINUS_40_875DB	(0x6D)
+#define		ONA10IV_VOL_MINUS_41_250DB	(0x6E)
+#define		ONA10IV_VOL_MINUS_41_625DB	(0x6F)
+#define		ONA10IV_VOL_MINUS_42_000DB	(0x70)
+#define		ONA10IV_VOL_MINUS_42_375DB	(0x71)
+#define		ONA10IV_VOL_MINUS_42_750DB	(0x72)
+#define		ONA10IV_VOL_MINUS_43_125DB	(0x73)
+#define		ONA10IV_VOL_MINUS_43_500DB	(0x74)
+#define		ONA10IV_VOL_MINUS_43_875DB	(0x75)
+#define		ONA10IV_VOL_MINUS_44_250DB	(0x76)
+#define		ONA10IV_VOL_MINUS_44_625DB	(0x77)
+#define		ONA10IV_VOL_MINUS_45_000DB	(0x78)
+#define		ONA10IV_VOL_MINUS_45_375DB	(0x79)
+#define		ONA10IV_VOL_MINUS_45_750DB	(0x7A)
+#define		ONA10IV_VOL_MINUS_46_125DB	(0x7B)
+#define		ONA10IV_VOL_MINUS_46_500DB	(0x7C)
+#define		ONA10IV_VOL_MINUS_46_875DB	(0x7D)
+#define		ONA10IV_VOL_MINUS_47_250DB	(0x7E)
+#define		ONA10IV_VOL_MINUS_47_625DB	(0x7F)
+#define		ONA10IV_VOL_MINUS_48_000DB	(0x80)
+#define		ONA10IV_VOL_MINUS_48_375DB	(0x81)
+#define		ONA10IV_VOL_MINUS_48_750DB	(0x82)
+#define		ONA10IV_VOL_MINUS_49_125DB	(0x83)
+#define		ONA10IV_VOL_MINUS_49_500DB	(0x84)
+#define		ONA10IV_VOL_MINUS_49_875DB	(0x85)
+#define		ONA10IV_VOL_MINUS_50_250DB	(0x86)
+#define		ONA10IV_VOL_MINUS_50_625DB	(0x87)
+#define		ONA10IV_VOL_MINUS_51_000DB	(0x88)
+#define		ONA10IV_VOL_MINUS_51_375DB	(0x89)
+#define		ONA10IV_VOL_MINUS_51_750DB	(0x8A)
+#define		ONA10IV_VOL_MINUS_52_125DB	(0x8B)
+#define		ONA10IV_VOL_MINUS_52_500DB	(0x8C)
+#define		ONA10IV_VOL_MINUS_52_875DB	(0x8D)
+#define		ONA10IV_VOL_MINUS_53_250DB	(0x8E)
+#define		ONA10IV_VOL_MINUS_53_625DB	(0x8F)
+#define		ONA10IV_VOL_MINUS_54_000DB	(0x90)
+#define		ONA10IV_VOL_MINUS_54_375DB	(0x91)
+#define		ONA10IV_VOL_MINUS_54_750DB	(0x92)
+#define		ONA10IV_VOL_MINUS_55_125DB	(0x93)
+#define		ONA10IV_VOL_MINUS_55_500DB	(0x94)
+#define		ONA10IV_VOL_MINUS_55_875DB	(0x95)
+#define		ONA10IV_VOL_MINUS_56_250DB	(0x96)
+#define		ONA10IV_VOL_MINUS_56_625DB	(0x97)
+#define		ONA10IV_VOL_MINUS_57_000DB	(0x98)
+#define		ONA10IV_VOL_MINUS_57_375DB	(0x99)
+#define		ONA10IV_VOL_MINUS_57_750DB	(0x9A)
+#define		ONA10IV_VOL_MINUS_58_125DB	(0x9B)
+#define		ONA10IV_VOL_MINUS_58_500DB	(0x9C)
+#define		ONA10IV_VOL_MINUS_58_875DB	(0x9D)
+#define		ONA10IV_VOL_MINUS_59_250DB	(0x9E)
+#define		ONA10IV_VOL_MINUS_59_625DB	(0x9F)
+#define		ONA10IV_VOL_MINUS_60_000DB	(0xA0)
+#define		ONA10IV_VOL_MINUS_60_375DB	(0xA1)
+#define		ONA10IV_VOL_MINUS_60_750DB	(0xA2)
+#define		ONA10IV_VOL_MINUS_61_125DB	(0xA3)
+#define		ONA10IV_VOL_MINUS_61_500DB	(0xA4)
+#define		ONA10IV_VOL_MINUS_61_875DB	(0xA5)
+#define		ONA10IV_VOL_MINUS_62_250DB	(0xA6)
+#define		ONA10IV_VOL_MINUS_62_625DB	(0xA7)
+#define		ONA10IV_VOL_MINUS_63_000DB	(0xA8)
+#define		ONA10IV_VOL_MINUS_63_375DB	(0xA9)
+#define		ONA10IV_VOL_MINUS_63_750DB	(0xAA)
+#define		ONA10IV_VOL_MINUS_64_125DB	(0xAB)
+#define		ONA10IV_VOL_MINUS_64_500DB	(0xAC)
+#define		ONA10IV_VOL_MINUS_64_875DB	(0xAD)
+#define		ONA10IV_VOL_MINUS_65_250DB	(0xAE)
+#define		ONA10IV_VOL_MINUS_65_625DB	(0xAF)
+#define		ONA10IV_VOL_MINUS_66_000DB	(0xB0)
+#define		ONA10IV_VOL_MINUS_66_375DB	(0xB1)
+#define		ONA10IV_VOL_MINUS_66_750DB	(0xB2)
+#define		ONA10IV_VOL_MINUS_67_125DB	(0xB3)
+#define		ONA10IV_VOL_MINUS_67_500DB	(0xB4)
+#define		ONA10IV_VOL_MINUS_67_875DB	(0xB5)
+#define		ONA10IV_VOL_MINUS_68_250DB	(0xB6)
+#define		ONA10IV_VOL_MINUS_68_625DB	(0xB7)
+#define		ONA10IV_VOL_MINUS_69_000DB	(0xB8)
+#define		ONA10IV_VOL_MINUS_69_375DB	(0xB9)
+#define		ONA10IV_VOL_MINUS_69_750DB	(0xBA)
+#define		ONA10IV_VOL_MINUS_70_125DB	(0xBB)
+#define		ONA10IV_VOL_MINUS_70_500DB	(0xBC)
+#define		ONA10IV_VOL_MINUS_70_875DB	(0xBD)
+#define		ONA10IV_VOL_MINUS_71_250DB	(0xBE)
+#define		ONA10IV_VOL_MINUS_71_625DB	(0xBF)
+#define		ONA10IV_VOL_MINUS_72_000DB	(0xC0)
+#define		ONA10IV_VOL_MINUS_72_375DB	(0xC1)
+#define		ONA10IV_VOL_MINUS_72_750DB	(0xC2)
+#define		ONA10IV_VOL_MINUS_73_125DB	(0xC3)
+#define		ONA10IV_VOL_MINUS_73_500DB	(0xC4)
+#define		ONA10IV_VOL_MINUS_73_875DB	(0xC5)
+#define		ONA10IV_VOL_MINUS_74_250DB	(0xC6)
+#define		ONA10IV_VOL_MINUS_74_625DB	(0xC7)
+#define		ONA10IV_VOL_MINUS_75_000DB	(0xC8)
+#define		ONA10IV_VOL_MINUS_75_375DB	(0xC9)
+#define		ONA10IV_VOL_MINUS_75_750DB	(0xCA)
+#define		ONA10IV_VOL_MINUS_76_125DB	(0xCB)
+#define		ONA10IV_VOL_MINUS_76_500DB	(0xCC)
+#define		ONA10IV_VOL_MINUS_76_875DB	(0xCD)
+#define		ONA10IV_VOL_MINUS_77_250DB	(0xCE)
+#define		ONA10IV_VOL_MINUS_77_625DB	(0xCF)
+#define		ONA10IV_VOL_MINUS_78_000DB	(0xD0)
+#define		ONA10IV_VOL_MINUS_78_375DB	(0xD1)
+#define		ONA10IV_VOL_MINUS_78_750DB	(0xD2)
+#define		ONA10IV_VOL_MINUS_79_125DB	(0xD3)
+#define		ONA10IV_VOL_MINUS_79_500DB	(0xD4)
+#define		ONA10IV_VOL_MINUS_79_875DB	(0xD5)
+#define		ONA10IV_VOL_MINUS_80_250DB	(0xD6)
+#define		ONA10IV_VOL_MINUS_80_625DB	(0xD7)
+#define		ONA10IV_VOL_MINUS_81_000DB	(0xD8)
+#define		ONA10IV_VOL_MINUS_81_375DB	(0xD9)
+#define		ONA10IV_VOL_MINUS_81_750DB	(0xDA)
+#define		ONA10IV_VOL_MINUS_82_125DB	(0xDB)
+#define		ONA10IV_VOL_MINUS_82_500DB	(0xDC)
+#define		ONA10IV_VOL_MINUS_82_875DB	(0xDD)
+#define		ONA10IV_VOL_MINUS_83_250DB	(0xDE)
+#define		ONA10IV_VOL_MINUS_83_625DB	(0xDF)
+#define		ONA10IV_VOL_MINUS_84_000DB	(0xE0)
+#define		ONA10IV_VOL_MINUS_84_375DB	(0xE1)
+#define		ONA10IV_VOL_MINUS_84_750DB	(0xE2)
+#define		ONA10IV_VOL_MINUS_85_125DB	(0xE3)
+#define		ONA10IV_VOL_MINUS_85_500DB	(0xE4)
+#define		ONA10IV_VOL_MINUS_85_875DB	(0xE5)
+#define		ONA10IV_VOL_MINUS_86_250DB	(0xE6)
+#define		ONA10IV_VOL_MINUS_86_625DB	(0xE7)
+#define		ONA10IV_VOL_MINUS_87_000DB	(0xE8)
+#define		ONA10IV_VOL_MINUS_87_375DB	(0xE9)
+#define		ONA10IV_VOL_MINUS_87_750DB	(0xEA)
+#define		ONA10IV_VOL_MINUS_88_125DB	(0xEB)
+#define		ONA10IV_VOL_MINUS_88_500DB	(0xEC)
+#define		ONA10IV_VOL_MINUS_88_875DB	(0xED)
+#define		ONA10IV_VOL_MINUS_89_250DB	(0xEE)
+#define		ONA10IV_VOL_MINUS_89_625DB	(0xEF)
+#define		ONA10IV_VOL_MINUS_90_000DB	(0xF0)
+#define		ONA10IV_VOL_MINUS_90_375DB	(0xF1)
+#define		ONA10IV_VOL_MINUS_90_750DB	(0xF2)
+#define		ONA10IV_VOL_MINUS_91_125DB	(0xF3)
+#define		ONA10IV_VOL_MINUS_91_500DB	(0xF4)
+#define		ONA10IV_VOL_MINUS_91_875DB	(0xF5)
+#define		ONA10IV_VOL_MINUS_92_250DB	(0xF6)
+#define		ONA10IV_VOL_MINUS_92_625DB	(0xF7)
+#define		ONA10IV_VOL_MINUS_93_000DB	(0xF8)
+#define		ONA10IV_VOL_MINUS_93_375DB	(0xF9)
+#define		ONA10IV_VOL_MINUS_93_750DB	(0xFA)
+#define		ONA10IV_VOL_MINUS_94_125DB	(0xFB)
+#define		ONA10IV_VOL_MINUS_94_500DB	(0xFC)
+#define		ONA10IV_VOL_MINUS_94_875DB	(0xFD)
+#define		ONA10IV_VOL_MINUS_95_250DB	(0xFE)
+#define		ONA10IV_VOL_AMP_MUTE		(0xFF)
+#define		ONA10IV_VOL_AMP_MASK		(0xFF)
+
+#define ONA10IV_REG_VOL_CTRL		(0x0A)
+#define		ONA10IV_VOL_RAMP		(0x01<<5)
+#define		ONA10IV_VOL_ZEROCROSS		(0x00<<5)
+#define		ONA10IV_VOL_RAMP_0_01MSSTEP	(0x00<<3)
+#define		ONA10IV_VOL_RAMP_0_10MSSTEP	(0x01<<3)
+#define		ONA10IV_VOL_RAMP_0_50MSSTEP	(0x02<<3)
+#define		ONA10IV_VOL_RAMP_1_00MSSTEP	(0x03<<3)
+#define		ONA10IV_AVOL_UP_DISABLE		(0x00<<2)
+#define		ONA10IV_AVOL_UP_RAMP		(0x01<<2)
+#define		ONA10IV_AVOL_DN_DISABLE		(0x00<<1)
+#define		ONA10IV_AVOL_DN_RAMP		(0x01<<1)
+#define		ONA10IV_MUTE_NORMAL		(0x00<<0)
+#define		ONA10IV_MUTE_AMPLIFIER_OUT	(0x01<<0)
+
+#define	ONA10IV_REG_GAIN_CTRL1		(0x0B)
+#define		ONA10IV_PCM_AMP_GAIN_PLUS_16DB	(0x00<<0)
+#define		ONA10IV_PCM_AMP_GAIN_PLUS_12DB	(0x08<<0)
+#define		ONA10IV_PCM_AMP_GAIN_PLUS_9DB	(0x0E<<0)
+#define		ONA10IV_PCM_AMP_GAIN_PLUS_6DB	(0x14<<0)
+#define		ONA10IV_PCM_AMP_GAIN_PLUS_3DB	(0x1A<<0)
+#define		ONA10IV_PCM_AMP_GAIN_PLUS_MASK	(0x1F<<0)
+#define		ONA10IV_PCM_AMP_GAIN_PLUS_MAX	(0x20)
+
+#define	ONA10IV_REG_GAIN_CTRL2		(0x0C)
+#define		ONA10IV_PDM_DAC_MAP_7_23DBV	(0x00<<0)
+#define		ONA10IV_PDM_DAC_MAP_4_31DBV	(0x01<<0)
+#define		ONA10IV_PDM_DAC_MAP_M0_13DBV	(0x02<<0)
+#define		ONA10IV_PDM_DAC_MAP_M9_68DBV	(0x03<<0)
+#define		ONA10IV_PDM_AMP_GAIN_PLUS_16DB	(0x00<<0)
+#define		ONA10IV_PDM_AMP_GAIN_PLUS_12DB	(0x08<<0)
+#define		ONA10IV_PDM_AMP_GAIN_PLUS_9DB	(0x0E<<0)
+#define		ONA10IV_PDM_AMP_GAIN_PLUS_6DB	(0x14<<0)
+#define		ONA10IV_PDM_AMP_GAIN_PLUS_3DB	(0x1A<<0)
+
+#define	ONA10IV_REG_EMI_CTRL		(0x0D)
+#define		ONA10IV_AMP_ERC_1_00VPNS	(0x00<<3)
+#define		ONA10IV_AMP_ERC_0_75VPNS	(0x01<<3)
+#define		ONA10IV_AMP_ERC_0_50VPNS	(0x02<<3)
+#define		ONA10IV_AMP_ERC_3_50VPNS	(0x03<<3)
+#define		ONA10IV_SS_MOD_5_3PERCENT	(0x00<<0)
+#define		ONA10IV_SS_MOD_7_0PERCENT	(0x01<<0)
+#define		ONA10IV_SS_MOD_10_6PERCENT	(0x02<<0)
+#define		ONA10IV_SS_MOD_21_2PERCENT	(0x03<<0)
+#define		ONA10IV_SS_MOD_0_0PERCENT	(0x04<<0)
+#define		ONA10IV_SS_MOD_3_0PERCENT	(0x05<<0)
+#define		ONA10IV_SS_MOD_3_6PERCENT	(0x06<<0)
+#define		ONA10IV_SS_MOD_4_2PERCENT	(0x07<<0)
+
+#define	ONA10IV_REG_AGC_BATT		(0x0E)
+#define		ONA10IV_BATT_ATH_9_763V		(0x00<<0)
+#define		ONA10IV_BATT_ATH_9_835V		(0x01<<0)
+#define		ONA10IV_BATT_ATH_9_907V		(0x02<<0)
+#define		ONA10IV_BATT_ATH_9_979V		(0x03<<0)
+#define		ONA10IV_BATT_ATH_10_510V	(0x04<<0)
+#define		ONA10IV_BATT_ATH_10_123V	(0x05<<0)
+#define		ONA10IV_BATT_ATH_10_195V	(0x06<<0)
+#define		ONA10IV_BATT_ATH_10_267V	(0x07<<0)
+#define		ONA10IV_BATT_ATH_10_339V	(0x08<<0)
+#define		ONA10IV_BATT_ATH_10_411V	(0x09<<0)
+#define		ONA10IV_BATT_ATH_10_483V	(0x0A<<0)
+#define		ONA10IV_BATT_ATH_10_555V	(0x0B<<0)
+#define		ONA10IV_BATT_ATH_10_627V	(0x0C<<0)
+#define		ONA10IV_BATT_ATH_10_699V	(0x0D<<0)
+#define		ONA10IV_BATT_ATH_10_771V	(0x0E<<0)
+#define		ONA10IV_BATT_ATH_10_843V	(0x0F<<0)
+#define		ONA10IV_BATT_ATH_10_915V	(0x10<<0)
+#define		ONA10IV_BATT_ATH_10_987V	(0x11<<0)
+#define		ONA10IV_BATT_ATH_11_590V	(0x12<<0)
+#define		ONA10IV_BATT_ATH_11_131V	(0x13<<0)
+#define		ONA10IV_BATT_ATH_11_203V	(0x14<<0)
+#define		ONA10IV_BATT_ATH_11_275V	(0x15<<0)
+#define		ONA10IV_BATT_ATH_11_347V	(0x16<<0)
+#define		ONA10IV_BATT_ATH_11_419V	(0x17<<0)
+#define		ONA10IV_BATT_ATH_11_491V	(0x18<<0)
+#define		ONA10IV_BATT_ATH_11_563V	(0x19<<0)
+#define		ONA10IV_BATT_ATH_11_635V	(0x1A<<0)
+#define		ONA10IV_BATT_ATH_11_707V	(0x1B<<0)
+#define		ONA10IV_BATT_ATH_11_779V	(0x1C<<0)
+#define		ONA10IV_BATT_ATH_11_851V	(0x1D<<0)
+#define		ONA10IV_BATT_ATH_11_923V	(0x1E<<0)
+#define		ONA10IV_BATT_ATH_11_995V	(0x1F<<0)
+
+#define	ONA10IV_REG_AGC_CTRL1		(0x0F)
+#define		ONA10IV_AGC_HOLD_10MS		(0x00<<4)
+#define		ONA10IV_AGC_HOLD_45MS		(0x01<<4)
+#define		ONA10IV_AGC_HOLD_80MS		(0x02<<4)
+#define		ONA10IV_AGC_HOLD_115MS		(0x03<<4)
+#define		ONA10IV_AGC_HOLD_150MS		(0x04<<4)
+#define		ONA10IV_AGC_HOLD_185MS		(0x05<<4)
+#define		ONA10IV_AGC_HOLD_220MS		(0x06<<4)
+#define		ONA10IV_AGC_HOLD_255MS		(0x07<<4)
+#define		ONA10IV_AGC_HOLD_290MS		(0x08<<4)
+#define		ONA10IV_AGC_HOLD_325MS		(0x09<<4)
+#define		ONA10IV_AGC_HOLD_360MS		(0x0A<<4)
+#define		ONA10IV_AGC_HOLD_395MS		(0x0B<<4)
+#define		ONA10IV_AGC_HOLD_430MS		(0x0C<<4)
+#define		ONA10IV_AGC_HOLD_465MS		(0x0D<<4)
+#define		ONA10IV_AGC_HOLD_500MS		(0x0E<<4)
+#define		ONA10IV_AGC_HOLD_INFINIT	(0x0F<<4)
+#define		ONA10IV_AGC_ATTACK_10USPDB	(0x00<<0)
+#define		ONA10IV_AGC_ATTACK_45USPDB	(0x01<<0)
+#define		ONA10IV_AGC_ATTACK_80USPDB	(0x02<<0)
+#define		ONA10IV_AGC_ATTACK_115USPDB	(0x03<<0)
+#define		ONA10IV_AGC_ATTACK_150USPDB	(0x04<<0)
+#define		ONA10IV_AGC_ATTACK_185USPDB	(0x05<<0)
+#define		ONA10IV_AGC_ATTACK_220USPDB	(0x06<<0)
+#define		ONA10IV_AGC_ATTACK_255USPDB	(0x07<<0)
+#define		ONA10IV_AGC_ATTACK_290USPDB	(0x08<<0)
+#define		ONA10IV_AGC_ATTACK_325USPDB	(0x09<<0)
+#define		ONA10IV_AGC_ATTACK_360USPDB	(0x0A<<0)
+#define		ONA10IV_AGC_ATTACK_395USPDB	(0x0B<<0)
+#define		ONA10IV_AGC_ATTACK_430USPDB	(0x0C<<0)
+#define		ONA10IV_AGC_ATTACK_465USPDB	(0x0D<<0)
+#define		ONA10IV_AGC_ATTACK_500USPDB	(0x0E<<0)
+#define		ONA10IV_AGC_ATTACK_535USPDB	(0x0F<<0)
+
+#define	ONA10IV_REG_AGC_CTRL2		(0x10)
+#define		ONA10IV_AGC_MAX_ATT_MINUS_9DB	(0x00<<4)
+#define		ONA10IV_AGC_MAX_ATT_MINUS_8DB	(0x01<<4)
+#define		ONA10IV_AGC_MAX_ATT_MINUS_7DB	(0x02<<4)
+#define		ONA10IV_AGC_MAX_ATT_MINUS_6DB	(0x03<<4)
+#define		ONA10IV_AGC_MAX_ATT_MINUS_5DB	(0x04<<4)
+#define		ONA10IV_AGC_MAX_ATT_MINUS_4DB	(0x05<<4)
+#define		ONA10IV_AGC_MAX_ATT_MINUS_3DB	(0x06<<4)
+#define		ONA10IV_AGC_MAX_ATT_MINUS_2DB	(0x07<<4)
+#define		ONA10IV_AGC_RELEASE_5MSPDB	(0x00<<0)
+#define		ONA10IV_AGC_RELEASE_75MSPDB	(0x01<<0)
+#define		ONA10IV_AGC_RELEASE_145MSPDB	(0x02<<0)
+#define		ONA10IV_AGC_RELEASE_215MSPDB	(0x03<<0)
+#define		ONA10IV_AGC_RELEASE_285MSPDB	(0x04<<0)
+#define		ONA10IV_AGC_RELEASE_355MSPDB	(0x05<<0)
+#define		ONA10IV_AGC_RELEASE_425MSPDB	(0x06<<0)
+#define		ONA10IV_AGC_RELEASE_495MSPDB	(0x07<<0)
+#define		ONA10IV_AGC_RELEASE_565MSPDB	(0x08<<0)
+#define		ONA10IV_AGC_RELEASE_635MSPDB	(0x09<<0)
+#define		ONA10IV_AGC_RELEASE_705MSPDB	(0x0A<<0)
+#define		ONA10IV_AGC_RELEASE_775MSPDB	(0x0B<<0)
+#define		ONA10IV_AGC_RELEASE_845MSPDB	(0x0C<<0)
+#define		ONA10IV_AGC_RELEASE_915MSPDB	(0x0D<<0)
+#define		ONA10IV_AGC_RELEASE_985MSPDB	(0x0E<<0)
+#define		ONA10IV_AGC_RELEASE_1055MSPDB	(0x0F<<0)
+
+#define	ONA10IV_REG_AGC_CTRL3		(0x11)
+#define		ONA10IV_AGC_TIMEOUT_DISABLE	(0x00<<0)
+#define		ONA10IV_AGC_TIMEOUT_565MS	(0x01<<0)
+#define		ONA10IV_AGC_TIMEOUT_775MS	(0x02<<0)
+#define		ONA10IV_AGC_TIMEOUT_985MS	(0x03<<0)
+
+#define	ONA10IV_REG_MAGC_CTRL1		(0x12)
+#define		ONA10IV_RX_SLOT8_IGNORES	(0x00<<7)
+#define		ONA10IV_RX_SLOT8_LISTENS	(0x01<<7)
+#define		ONA10IV_RX_SLOT7_IGNORES	(0x00<<6)
+#define		ONA10IV_RX_SLOT7_LISTENS	(0x01<<6)
+#define		ONA10IV_RX_SLOT6_IGNORES	(0x00<<5)
+#define		ONA10IV_RX_SLOT6_LISTENS	(0x01<<5)
+#define		ONA10IV_RX_SLOT5_IGNORES	(0x00<<4)
+#define		ONA10IV_RX_SLOT5_LISTENS	(0x01<<4)
+#define		ONA10IV_RX_SLOT4_IGNORES	(0x00<<3)
+#define		ONA10IV_RX_SLOT4_LISTENS	(0x01<<3)
+#define		ONA10IV_RX_SLOT3_IGNORES	(0x00<<2)
+#define		ONA10IV_RX_SLOT3_LISTENS	(0x01<<2)
+#define		ONA10IV_RX_SLOT2_IGNORES	(0x00<<1)
+#define		ONA10IV_RX_SLOT2_LISTENS	(0x01<<1)
+#define		ONA10IV_RX_SLOT1_IGNORES	(0x00<<0)
+#define		ONA10IV_RX_SLOT1_LISTENS	(0x01<<0)
+
+#define	ONA10IV_REG_MAGC_CTRL2		(0x13)
+#define		ONA10IV_TX_SLOT8_HIZ		(0x00<<7)
+#define		ONA10IV_TX_SLOT8_TRANSMIT	(0x01<<7)
+#define		ONA10IV_TX_SLOT7_HIZ		(0x00<<6)
+#define		ONA10IV_TX_SLOT7_TRANSMIT	(0x01<<6)
+#define		ONA10IV_TX_SLOT6_HIZ		(0x00<<5)
+#define		ONA10IV_TX_SLOT6_TRANSMIT	(0x01<<5)
+#define		ONA10IV_TX_SLOT5_HIZ		(0x00<<4)
+#define		ONA10IV_TX_SLOT5_TRANSMIT	(0x01<<4)
+#define		ONA10IV_TX_SLOT4_HIZ		(0x00<<3)
+#define		ONA10IV_TX_SLOT4_TRANSMIT	(0x01<<3)
+#define		ONA10IV_TX_SLOT3_HIZ		(0x00<<2)
+#define		ONA10IV_TX_SLOT3_TRANSMIT	(0x01<<2)
+#define		ONA10IV_TX_SLOT2_HIZ		(0x00<<1)
+#define		ONA10IV_TX_SLOT2_TRANSMIT	(0x01<<1)
+#define		ONA10IV_TX_SLOT1_HIZ		(0x00<<0)
+#define		ONA10IV_TX_SLOT1_TRANSMIT	(0x01<<0)
+
+#define	ONA10IV_REG_MAGC_CTRL3		(0x14)
+#define		ONA10IV_MAGC_ODRV_100P		(0x00<<1)
+#define		ONA10IV_MAGC_ODRV_75P		(0x01<<1)
+#define		ONA10IV_MAGC_ODRV_50P		(0x02<<1)
+#define		ONA10IV_MAGC_ODRV_25P		(0x03<<1)
+#define		ONA10IV_MAGC_EN_DISABLE		(0x00<<0)
+#define		ONA10IV_MAGC_EN_ENABLE		(0x01<<0)
+
+#define	ONA10IV_REG_SENSE_CTRL		(0x15)
+#define		ONA10IV_T_HOLD_10MS		(0x00<<6)
+#define		ONA10IV_T_HOLD_45MS		(0x01<<6)
+#define		ONA10IV_T_HOLD_80MS		(0x02<<6)
+#define		ONA10IV_T_HOLD_115MS		(0x03<<6)
+#define		ONA10IV_T_ATTACK_2MS_STEP	(0x00<<4)
+#define		ONA10IV_T_ATTACK_4MS_STEP	(0x01<<4)
+#define		ONA10IV_T_ATTACK_6MS_STEP	(0x02<<4)
+#define		ONA10IV_T_ATTACK_8MS_STEP	(0x03<<4)
+#define		ONA10IV_T_ATH_140CELSIUS	(0x00<<2)
+#define		ONA10IV_T_ATH_130CELSIUS	(0x01<<2)
+#define		ONA10IV_T_ATH_120CELSIUS	(0x02<<2)
+#define		ONA10IV_T_ATH_110CELSIUS	(0x03<<2)
+#define		ONA10IV_T_SAMP_40MS		(0x00<<0)
+#define		ONA10IV_T_SAMP_20MS		(0x01<<0)
+#define		ONA10IV_T_SAMP_10MS		(0x02<<0)
+#define		ONA10IV_T_SAMP_CONSTANTLY	(0x03<<0)
+
+#define	ONA10IV_REG_T_SENSE_OUT1	(0x16)
+#define	ONA10IV_REG_T_SENSE_OUT2		(0x17)
+#define		ONA10IV_T_SENSE_OUT2_BIT	(0x07)
+#define		ONA10IV_T_SENSE_OUT2_SIGN_BIT	(0x04)
+
+#define	ONA10IV_REG_DATAO_CTRL1		(0x18)
+#define		ONA10IV_HPF_BP_NORMAL		(0x00<<4)
+#define		ONA10IV_HPF_BP_HIGHPASS		(0x01<<4)
+#define		ONA10IV_PDM_OUT_FALLING		(0x00<<2)
+#define		ONA10IV_PDM_OUT_RISING		(0x01<<2)
+#define		ONA10IV_DATA_ODRV_100P		(0x00<<0)
+#define		ONA10IV_DATA_ODRV_75P		(0x01<<0)
+#define		ONA10IV_DATA_ODRV_50P		(0x02<<0)
+#define		ONA10IV_DATA_ODRV_25P		(0x03<<0)
+
+#define	ONA10IV_REG_DATAO_CTRL2		(0x19)
+#define		ONA10IV_I_DATAO_TX_DISABLE	(0x00<<7)
+#define		ONA10IV_I_DATAO_TX_ENABLE	(0x01<<7)
+#define		ONA10IV_V_DATAO_TX_DISABLE	(0x00<<6)
+#define		ONA10IV_V_DATAO_TX_ENABLE	(0x01<<6)
+#define		ONA10IV_I_SLOT_1		(0x00<<3)
+#define		ONA10IV_I_SLOT_2		(0x01<<3)
+#define		ONA10IV_I_SLOT_3		(0x02<<3)
+#define		ONA10IV_I_SLOT_4		(0x03<<3)
+#define		ONA10IV_I_SLOT_5		(0x04<<3)
+#define		ONA10IV_I_SLOT_6		(0x05<<3)
+#define		ONA10IV_I_SLOT_7		(0x06<<3)
+#define		ONA10IV_I_SLOT_8		(0x07<<3)
+#define		ONA10IV_V_SLOT_1		(0x00<<0)
+#define		ONA10IV_V_SLOT_2		(0x01<<0)
+#define		ONA10IV_V_SLOT_3		(0x02<<0)
+#define		ONA10IV_V_SLOT_4		(0x03<<0)
+#define		ONA10IV_V_SLOT_5		(0x04<<0)
+#define		ONA10IV_V_SLOT_6		(0x05<<0)
+#define		ONA10IV_V_SLOT_7		(0x06<<0)
+#define		ONA10IV_V_SLOT_8		(0x07<<0)
+
+#define	ONA10IV_REG_DATAO_CTRL3		(0x1A)
+#define		ONA10IV_T_DATAO_TX_DISABLE	(0x00<<3)
+#define		ONA10IV_T_DATAO_TX_ENABLE	(0x01<<3)
+#define		ONA10IV_T_SLOT_1		(0x00<<0)
+#define		ONA10IV_T_SLOT_2		(0x01<<0)
+#define		ONA10IV_T_SLOT_3		(0x02<<0)
+#define		ONA10IV_T_SLOT_4		(0x03<<0)
+#define		ONA10IV_T_SLOT_5		(0x04<<0)
+#define		ONA10IV_T_SLOT_6		(0x05<<0)
+#define		ONA10IV_T_SLOT_7		(0x06<<0)
+#define		ONA10IV_T_SLOT_8		(0x07<<0)
+#endif	// _ONA10IV__



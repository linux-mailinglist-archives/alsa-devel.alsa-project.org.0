Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D1230D3AE
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 08:03:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A752174F;
	Wed,  3 Feb 2021 08:03:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A752174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612335837;
	bh=U0ptZIZMNHXhVaHgOJVRORqg6JfBtEyCQFz04bNl33Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rj+zgvE/StJOg8kfhGBFGuEivljZFsp/fyJ04gQT0UXE5sYUxSWmC+nN7/4CyFi81
	 IJNUlyO3tAXT5Qmny6cFVBPIvOj+uoCqFZGrqo2eteC1wRmkHb8wUwp+oT4IkqOkuK
	 lfMf+RCK2AJokaqTyaenn6y1zIVm0lm3bKGsRmXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3C1CF80155;
	Wed,  3 Feb 2021 08:01:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0399EF801F7; Sun, 31 Jan 2021 19:43:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sonic307-33.consmr.mail.ir2.yahoo.com
 (sonic307-33.consmr.mail.ir2.yahoo.com [87.248.110.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C463F80134
 for <alsa-devel@alsa-project.org>; Sun, 31 Jan 2021 19:43:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C463F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="KXap4eYp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1612118622; bh=HED36otJ1FDmy1kTm9+uyg74Y9oUBveqzS05JACSswM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=KXap4eYpevZgXItO7zGkTCblWpHNWuElojRMPtJnHL3p3bm8S3yRsqSI00LQeFNEu+tvVDcCRBZBO8LsRozRf9InZmNnYCDaxpSN10WTnDbGAhsnlVGUe15Gly7IdUMOchRXsEfiRs2D8GrlJplC94NHw+ELS9j9DF6yK7qhWp4hCJYbAFN4QKR+0meDiDdjbFI5r9FL00879N7XauCmzxf2TdF/M6FiyNiklZ/SNky0fd+xqvalmh+A+HGT/i6oMK662LgJ4oemiwdCnVSneFJpVRcVHSnMJ0npcmRT+pykHTQOWQmSlNijW9YzkRxQufYMmSZPmz5OWS7u4ZUssQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1612118622; bh=etEnedHCrevszpnIzMbKC29nbRn1eujlQMjFlZKsIg+=;
 h=From:To:Subject:Date:From:Subject:Reply-To;
 b=UUNd3m393W3O/ZWq99wEDkwc0xW0Rnrtl0JEfQzVGuNX7rAtZGeQwidFJqmXAof7QP8xMzZiQTft46q2RSKkQdG0Eb/t60UNUTstgR9k4YbdxmP6OFdtSCDxQfveH6Gmy8Pg2J39DOPFnz5baxkclBFVfvXOg7pnxxHQSBmlXZ5cqpf1VgJm7x1/0vshj2naLFR7dY2DnkYwXPQONbNeFxueQ5EhI31CHrRJznCDdfmVDsoVE/FYanMgloFT69mzcrPFaYe20nFZHG/BBIvaJs6WFk5pKshjf6rUsEOarys6kgVtWDjJnFE3N58qryv3RhDEivCw/T2CInVA8CuK0Q==
X-YMail-OSG: EOw8iTAVM1kH284NKfAZmyoo.dNfuo1IjDhKhfRvQaRvI_pNleNOLSBdItadwkz
 rSXObsK0MS882408X4DJGMjs1GRNNwTePSCIjOANdIiPwBVuo6x51vuOXPWr.Ui.V7YZA._lvAvn
 c1VuC1OEcwwFrrz9t_J5AIeecaOfIZmy3WZw6G8p3Ooes4bbpYQ1Tzdk3tX2X0pd0ibHB7CG8Dil
 p7cvHDaFuXNiMNbG9USU2sA0nbrxG47EQNfiymboHZwCCLIGh17qATatNvI0TL4ujF9Ve7dcJIO7
 focxtk31x0PwmCwm9a4fXKv.PWMXNzRqRnPpN1tLUhiMv8qcc1M0r6FHEDK3DjlPEPgCUacWJPK7
 t9e8oA_g43jnzGJTda3zKX0TCJrIygwQ0kzzYWVnk36VZkbzkn32VAukmZC88UnkltSW.dpLbaMl
 H2HTp0AdS7bgMukh_YawwhhJZkNG_Q.oUSVDDy4gJuQ6sHIH_bukYqeAPTksvQO6brESk._9s9kk
 d8fjQ8DPm.tYlsQ0HKA9Hazo_Ao1yR1kzzMdwXtwTqGbUc_KD_SrXu7hbJ4h8Bch7SkpnlpfnQ4N
 .9WTTh6pnKUJJXgGxzd_XysowwBDrgROOWc44QPgfFEV16QUMpDJngSJxtVd.gwGckr7vhtLCttb
 WhtSniO3maA4oNPKwKlg3sK7Ko3CBrifG_nGmCMIt29N8z5evoPT3JPq2wmEEWA4lhr4pMdGTmVx
 VgAZJWp2ODAcG0JdfxkeEs0oVUtwHxkWMRM5IdSMJySeczNLzl0CbckbqWZ92Vo8QBC4ZPqepxSH
 hbdFvl5ezyRi3.7cjGM6ZmRF8fWYwpItW8hZlMpElk8OBzZ0.FQe7vBRkkK9TSstv.i8zq7W_YIj
 CUBAwsb2pAu5mTvdKW3VMYlI8OfhoFTj4WRj26VroWgJBUEYKPDXvr2bYf6XycDMj5Or4cDC4itF
 zSwKp0BTXlyvP0l06Ijyh_7yh3C8amMlV_RqiPo56mP_ac_eKm4FB7b9Gtu.rQrSO4yWJzWblZ97
 A1u8c0ms3ig6taSHC93pcX801SA2j7uyWIK6akU2foWrGe1_11Ita4IZiOd4goZbAkbl5NM4CdHQ
 qm8ICd2AbwdAt0BWhoovm452OUjwh.BMcCS758ZJND1guZPF4M4SwBEuAB6OQ6Eq6GcQwVn4YN4f
 Xv.N9l1eK8v_UbyX.EteddAd41nHuGq6qg_ZoJE2mniRUIEEjaaiuWbqtsnaG.S0Goke9FBYyple
 T70ccETw3HtCxUG4QyX4N3EGkEZRAR3mWzu9GCI2lf49Mg2U7HQ7ugSM_v2WoNbGzgK5e4ROUaaT
 3ZOPtArRb3nZTkV.dIbnXkqmDEfR5VTEuvzPWiEyhAOBrlCfo6ENbiEhHR7n4JQOL9qURvC1bLDN
 zNL0_HaqzZw3spzQcR5kr4g_X.NP1yStCaRMcc5JvpCMHx9kzFErdoGzUjIkvuDwzewyEF4lc3ec
 skMcq4cwa01dmMaDl1zoTwojvHSl.xQT7DUEwVTfYnRel12ljt_jVdOeSCkEzRpvfeAihf.gcjVA
 Rw4R1QfTFChXJiIyhSRRGXcm6GbZ7Mbv1LZE4ZdQ.HslmIaMjWIZQgvFsDWxcBteUMRO75BTV9sd
 hSsh2c2CJalorGJCouSgNzcbSTjcj5tdLh5_Y_oP1jon5.zLNL8EXgLosCeM8ZOnCcoNMDeUouHp
 TvFZU6Ejf.ufUQyDlO7kUcyVS38z8mifsHRhATXUWP_RA0aY_mgqY3g0ox4XTVtx4PdFt8RKOBYz
 X_zqXLysyd1lakKzDnxPzHk0utHdhCVO7nlnGmVoWJ2AtPHjwG_9n.0t0xw3dPGZ_L1p61foFneq
 L9gOm4cupKdfTtr_JrAIEIVXywZ8zjYrZzbjL3IiaKuPC9_3j05C3KhBLCyCTEEEa.fhpViXSHGx
 ynq6rKaJqETbuvDdlLtWQwS3nnT7ObnUs7.W5R_i2w833br1Uw9txiFI4F9rlGxvAkzsfNiONi8i
 aU8KNYr4EC1AWeK0OhYeamLGMEZhnZIbJQID66XgJN29Fxh7Ws1TpBx.lKFpLYJWmgixcJ_gnNuB
 QsrfaLElH4B8pf8UsiHtaDCUawibbexNPx2Gu1br7KcgEwqiwbBnYA6I.iS8XRZCYemUog_RbU3w
 LrE2tPGCWBQkD5V0.qw8Z.SHYmhGgd_Iet20PkrQoyyIskd.TBeQ2xxb4mTtw08_Eydb8vYYmsGN
 EulIonfmK4NNUddypGclvX2WExfqjMbI3nnjbs9TBSajRkGyG.xNmUVpRJ3NAnyttI6murGoDoOM
 p7DghzMpCa59ZhFRqd7b95XnCwLxu9uhVk7zxpuD81wD7.deVqfSDNRYEPirRRzDxobsHrhb0nHc
 FBP.a57_4nihr8sbjFusCOqIICAG6QA0diJSBvEw9EEHHfvCi3tdPUwBkvCuuG80NyRTV_aKns8z
 prRHQSbTmzab7zIX0GnAJyT_M1VbduHGMT8TX.BdBY7rowSHUQNFudM8I9Hn4yVrhpLZmy9QvJ39
 thUXRUDRfxh9hj4f7UfeRYfmjy3yFekPvUEPH6LfS8nhQWLMp_kZuzscwMxvT7Q8AWCM_X763GGB
 BKfXHmjCy.lAmkz76MWUTnEN4ndJSMMUNK0sAhDZr1vyoVfMSWAvlOu5eWS7OHopTK8eECZRuit2
 bIY7_W.KAvS3Hr1HZhLeRKG1N3PcWLbTEjvpuo0BoAGpCmqgpe7nEUh400lESOXmu6ljvvQZi8oY
 6KrCD1HKyTAmfqsqNWpUUDVKiMGcqAD.A0RnR76uDDzhUtetRrM0mUUpeoTbWjjpjAASbbMjgdff
 ZFR16CmiKqu.x6fEnyIO9.Wtv4oML6hjvIW6arj.xTa1BDuOqvCF69HUSRgMYG6JVysotnm6FeBB
 v94XvflnruW0us9lXj.ca_6DTR6lO54hGVewtcCtPFeKlggEuf8At9ME9rkXU2oRcFu27W4yeZ57
 vdzZUZnK8SduQJfcv7LybRFq7xG0-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ir2.yahoo.com with HTTP; Sun, 31 Jan 2021 18:43:42 +0000
Received: by smtp407.mail.ir2.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID e16a2e904335ed9f41206b782293961f; 
 Sun, 31 Jan 2021 18:41:41 +0000 (UTC)
From: Ion Agorria <AG0RRIA@yahoo.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Rob Herring <robh+dt@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>,
 Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/2] ASoC: tegra: Add RT5631 machine driver
Date: Sun, 31 Jan 2021 19:41:01 +0100
Message-Id: <20210131184101.651486-3-AG0RRIA@yahoo.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131184101.651486-1-AG0RRIA@yahoo.com>
References: <20210131184101.651486-1-AG0RRIA@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:01:31 +0100
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

From: Svyatoslav Ryhel <clamor95@gmail.com>

Add Tegra ASoC driver for Realtek ALC5631/RT5631 codec. The RT5631
codec is found on devices like ASUS Transformer TF201, TF700T and other
Tegra-based Android tablets.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Ion Agorria <ion@agorria.com>
---
 sound/soc/tegra/Kconfig        |   8 +
 sound/soc/tegra/Makefile       |   2 +
 sound/soc/tegra/tegra_rt5631.c | 261 +++++++++++++++++++++++++++++++++
 3 files changed, 271 insertions(+)
 create mode 100644 sound/soc/tegra/tegra_rt5631.c

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index acaf7339168d..449a858f155d 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -126,6 +126,14 @@ config SND_SOC_TEGRA_AUDIO_GRAPH_CARD
 	  few things for Tegra audio. Most of the code is re-used from
 	  audio graph driver and the same DT bindings are used.
 
+config SND_SOC_TEGRA_RT5631
+	tristate "SoC Audio support for Tegra boards using an RT5631 codec"
+	depends on SND_SOC_TEGRA && I2C && GPIOLIB
+	select SND_SOC_RT5631
+	help
+	  Say Y or M here if you want to add support for SoC audio on Tegra
+	  boards using the RT5631 codec, such as Transformer.
+
 config SND_SOC_TEGRA_RT5640
 	tristate "SoC Audio support for Tegra boards using an RT5640 codec"
 	depends on SND_SOC_TEGRA && I2C && GPIOLIB
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index af0b9889306c..11debfc03bc4 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_SND_SOC_TEGRA186_DSPK) += snd-soc-tegra186-dspk.o
 obj-$(CONFIG_SND_SOC_TEGRA210_ADMAIF) += snd-soc-tegra210-admaif.o
 
 # Tegra machine Support
+snd-soc-tegra-rt5631-objs := tegra_rt5631.o
 snd-soc-tegra-rt5640-objs := tegra_rt5640.o
 snd-soc-tegra-rt5677-objs := tegra_rt5677.o
 snd-soc-tegra-wm8753-objs := tegra_wm8753.o
@@ -41,6 +42,7 @@ snd-soc-tegra-max98090-objs := tegra_max98090.o
 snd-soc-tegra-sgtl5000-objs := tegra_sgtl5000.o
 snd-soc-tegra-audio-graph-card-objs := tegra_audio_graph_card.o
 
+obj-$(CONFIG_SND_SOC_TEGRA_RT5631) += snd-soc-tegra-rt5631.o
 obj-$(CONFIG_SND_SOC_TEGRA_RT5640) += snd-soc-tegra-rt5640.o
 obj-$(CONFIG_SND_SOC_TEGRA_RT5677) += snd-soc-tegra-rt5677.o
 obj-$(CONFIG_SND_SOC_TEGRA_WM8753) += snd-soc-tegra-wm8753.o
diff --git a/sound/soc/tegra/tegra_rt5631.c b/sound/soc/tegra/tegra_rt5631.c
new file mode 100644
index 000000000000..9034f48bcb26
--- /dev/null
+++ b/sound/soc/tegra/tegra_rt5631.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * tegra_rt5631.c - Tegra machine ASoC driver for boards using RT5631 codec.
+ *
+ * Copyright (c) 2020, Svyatoslav Ryhel and Ion Agorria
+ *
+ * Based on code copyright/by:
+ *
+ * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
+ * Author: Stephen Warren <swarren@nvidia.com>
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#include "tegra_asoc_utils.h"
+
+#include "../codecs/rt5631.h"
+
+struct tegra_rt5631 {
+	struct tegra_asoc_utils_data util_data;
+	struct gpio_desc *gpiod_hp_mute;
+	struct gpio_desc *gpiod_hp_det;
+};
+
+static int tegra_rt5631_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	struct tegra_rt5631 *machine = snd_soc_card_get_drvdata(card);
+	unsigned int srate, mclk;
+	int err;
+
+	srate = params_rate(params);
+	switch (srate) {
+	case 64000:
+	case 88200:
+	case 96000:
+		mclk = 128 * srate;
+		break;
+	default:
+		mclk = 256 * srate;
+		break;
+	}
+	/* FIXME: Codec only requires >= 3MHz if OSR==0 */
+	while (mclk < 6000000)
+		mclk *= 2;
+
+	err = tegra_asoc_utils_set_rate(&machine->util_data, srate, mclk);
+	if (err < 0) {
+		dev_err(card->dev, "Can't configure clocks\n");
+		return err;
+	}
+
+	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk, SND_SOC_CLOCK_IN);
+	if (err < 0) {
+		dev_err(card->dev, "codec_dai clock not set\n");
+		return err;
+	}
+
+	return 0;
+}
+
+static struct snd_soc_ops tegra_rt5631_ops = {
+	.hw_params = tegra_rt5631_hw_params,
+};
+
+static struct snd_soc_jack tegra_rt5631_hp_jack;
+
+static struct snd_soc_jack_pin tegra_rt5631_hp_jack_pins[] = {
+	{
+		.pin = "Headphone Jack",
+		.mask = SND_JACK_HEADPHONE,
+	},
+};
+
+static struct snd_soc_jack_gpio tegra_rt5631_hp_jack_gpio = {
+	.name = "Headphone detection",
+	.report = SND_JACK_HEADPHONE,
+	.debounce_time = 150,
+};
+
+static int tegra_rt5631_event_hp(struct snd_soc_dapm_widget *w,
+				 struct snd_kcontrol *k, int event)
+{
+	struct snd_soc_dapm_context *dapm = w->dapm;
+	struct snd_soc_card *card = dapm->card;
+	struct tegra_rt5631 *machine = snd_soc_card_get_drvdata(card);
+
+	gpiod_set_value_cansleep(machine->gpiod_hp_mute,
+				 !SND_SOC_DAPM_EVENT_ON(event));
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget tegra_rt5631_dapm_widgets[] = {
+	SND_SOC_DAPM_SPK("Int Spk", NULL),
+	SND_SOC_DAPM_HP("Headphone Jack", tegra_rt5631_event_hp),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+	SND_SOC_DAPM_MIC("Int Mic", NULL),
+};
+
+static const struct snd_kcontrol_new tegra_rt5631_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Int Spk"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
+};
+
+static int tegra_rt5631_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct tegra_rt5631 *machine = snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	ret = snd_soc_card_jack_new(rtd->card, "Headphone Jack",
+				    SND_JACK_HEADPHONE,
+				    &tegra_rt5631_hp_jack,
+				    tegra_rt5631_hp_jack_pins,
+				    ARRAY_SIZE(tegra_rt5631_hp_jack_pins));
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	if (machine->gpiod_hp_det) {
+		tegra_rt5631_hp_jack_gpio.desc = machine->gpiod_hp_det;
+
+		ret = snd_soc_jack_add_gpios(&tegra_rt5631_hp_jack, 1,
+					     &tegra_rt5631_hp_jack_gpio);
+		if (ret)
+			dev_err(rtd->dev, "Jack GPIOs not added: %d\n", ret);
+	}
+
+	return 0;
+}
+
+SND_SOC_DAILINK_DEFS(hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5631-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_rt5631_dai = {
+	.name = "RT5631",
+	.stream_name = "RT5631 PCM",
+	.init = tegra_rt5631_init,
+	.ops = &tegra_rt5631_ops,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBS_CFS,
+	SND_SOC_DAILINK_REG(hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_rt5631 = {
+	.name = "tegra-rt5631",
+	.owner = THIS_MODULE,
+	.dai_link = &tegra_rt5631_dai,
+	.num_links = 1,
+	.controls = tegra_rt5631_controls,
+	.num_controls = ARRAY_SIZE(tegra_rt5631_controls),
+	.dapm_widgets = tegra_rt5631_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(tegra_rt5631_dapm_widgets),
+	.fully_routed = true,
+};
+
+static int tegra_rt5631_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &snd_soc_tegra_rt5631;
+	struct device_node *np_codec, *np_i2s;
+	struct tegra_rt5631 *machine;
+	struct gpio_desc *gpiod;
+	int ret;
+
+	machine = devm_kzalloc(&pdev->dev, sizeof(*machine), GFP_KERNEL);
+	if (!machine)
+		return -ENOMEM;
+
+	card->dev = &pdev->dev;
+	snd_soc_card_set_drvdata(card, machine);
+
+	gpiod = devm_gpiod_get_optional(&pdev->dev, "nvidia,hp-mute",
+					GPIOD_OUT_HIGH);
+	if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
+
+	machine->gpiod_hp_mute = gpiod;
+
+	gpiod = devm_gpiod_get_optional(&pdev->dev, "nvidia,hp-det",
+					GPIOD_IN);
+	if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
+
+	machine->gpiod_hp_det = gpiod;
+
+	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
+	if (ret)
+		return ret;
+
+	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
+	if (ret)
+		return ret;
+
+	np_codec = of_parse_phandle(pdev->dev.of_node, "nvidia,audio-codec", 0);
+	if (!np_codec) {
+		dev_err(&pdev->dev,
+			"Property 'nvidia,audio-codec' missing or invalid\n");
+		return -EINVAL;
+	}
+
+	np_i2s = of_parse_phandle(pdev->dev.of_node, "nvidia,i2s-controller", 0);
+	if (!np_i2s) {
+		dev_err(&pdev->dev,
+			"Property 'nvidia,i2s-controller' missing or invalid\n");
+		return -EINVAL;
+	}
+
+	tegra_rt5631_dai.cpus->of_node = np_i2s;
+	tegra_rt5631_dai.codecs->of_node = np_codec;
+	tegra_rt5631_dai.platforms->of_node = np_i2s;
+
+	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct of_device_id tegra_rt5631_of_match[] = {
+	{ .compatible = "nvidia,tegra-audio-rt5631", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra_rt5631_of_match);
+
+static struct platform_driver tegra_rt5631_driver = {
+	.driver = {
+		.name = "tegra-snd-rt5631",
+		.pm = &snd_soc_pm_ops,
+		.of_match_table = tegra_rt5631_of_match,
+	},
+	.probe = tegra_rt5631_probe,
+};
+module_platform_driver(tegra_rt5631_driver);
+
+MODULE_DESCRIPTION("Tegra+RT5631 machine ASoC driver");
+MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_AUTHOR("Ion Agorria <ion@agorria.com>");
+MODULE_LICENSE("GPL");
-- 
2.26.2


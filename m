Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA53738DE28
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 01:47:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16BD1169B;
	Mon, 24 May 2021 01:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16BD1169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621813661;
	bh=sdZMdC+YiHvkZ2hlcfg864//MGE/F5y9SdgCKvm+1UQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hGbKh3zvPTgcU9CVms0iC62/j/REjiFn4CGSfjh0UB1Gm5fPgQr4HRQvSOeKydwZp
	 ZLe2jd0By6xK1h99j2rA58ikuUU20ZaY5Hr56QboXG7Koowg26fPvR8IiVFGlIFtQj
	 rmXJWU+cMfFLEQVe2pGKD3sHsnma9S2934hx6GY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CA87F804AD;
	Mon, 24 May 2021 01:45:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2A99F800DF; Mon, 24 May 2021 01:45:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA4BDF801EB
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 01:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA4BDF801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="N9wUdfAX"
Received: by mail-lf1-x12b.google.com with SMTP id j10so38019990lfb.12
 for <alsa-devel@alsa-project.org>; Sun, 23 May 2021 16:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ggfwROcBNJSwMbrZor0w463XQCT3b4PkCrhY7d7Nj0=;
 b=N9wUdfAXpB7jB5DlDbtgQ4vGf7k8x55rH51bypgDWZmLrK7wWAQNjh13Ip/nERpaRR
 LmVlQ0TZow5iXVsMIjMr9Gh9e0NM6NC4nwyzYC6St0ORrPo/33fii09niHaky0bSyfTY
 Lc0lLLnmj63Xfd1hVPdSeUTyhfzxoKIrb3zN3RSaGiEyUYyBKfV+MJJA5O43Wd6o3hL7
 bIB27tDIE8SopgZIn6nTo+LzYjOsemfA/HNXc5xB18kJXGv+9px4lXxjs0hn+9lbdFQo
 cM+QwW21KnmEoueAbFtU+7HwVQngXbF9EDMoOKyy0HS2iz541+SL1cwTG+87Bgn85POC
 szbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ggfwROcBNJSwMbrZor0w463XQCT3b4PkCrhY7d7Nj0=;
 b=a2t5hWMVaMr9WVrEtZDMBw0r6G2zGEggUmyafbwNkF96NJY/UDdbkLQ5bSKz967gYJ
 EwmplLq3P9WxlLbJZ78H0ZLvmuSfGObfMr34PlCBKbHTpKcZFRX5AVRxGZ+DHnbxe0tp
 cPu0gmxb9vVb8Ofv7bGShhT0mBi8wf/Xu225xK4/+yHEPvQmq03Qwdxa0HKo81oVFCL4
 epUwPvgErJUsqdgcK9/af3SBb8eXXagKgHWjiI2OtGUlg5KYzDh99YsFtMgh+C0As2qr
 ge3omv9+evNA1P2fyu1YgRDB8fIRzFWJUFzZO3PhDciriVCE7Nm5QUWFtVd0d7SlQrDi
 TmxA==
X-Gm-Message-State: AOAM5314sEWwG5ffVumPrcV83kywIoDlWFps5SnEhDmsF/foRPq/SjOv
 nlt9mCl3pBuNSxnVZUwg1Ts=
X-Google-Smtp-Source: ABdhPJxu8dX3SLi3AsI7/Hv6197Hvn9IHmD3Yx63C02hwxYYPH9yqKj6xm7xP++UdAc6j8rVS9m3aQ==
X-Received: by 2002:ac2:4d1a:: with SMTP id r26mr8470755lfi.226.1621813500937; 
 Sun, 23 May 2021 16:45:00 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-110.dynamic.spd-mgts.ru.
 [109.252.193.110])
 by smtp.gmail.com with ESMTPSA id u11sm1269054lfg.243.2021.05.23.16.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 16:45:00 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 2/4] ASoC: tegra: Unify ASoC machine drivers
Date: Mon, 24 May 2021 02:44:35 +0300
Message-Id: <20210523234437.25077-3-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210523234437.25077-1-digetx@gmail.com>
References: <20210523234437.25077-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Squash all machine drivers into a single-universal one. This reduces
code duplication, eases addition of a new drivers and upgrades older
code to a modern Linux kernel APIs.

Suggested-by: Jonathan Hunter <jonathanh@nvidia.com>
Co-developed-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Ion Agorria <ion@agorria.com>
Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/Kconfig              |  12 +
 sound/soc/tegra/Makefile             |  18 +-
 sound/soc/tegra/tegra_alc5632.c      | 260 ----------
 sound/soc/tegra/tegra_asoc_machine.c | 733 +++++++++++++++++++++++++++
 sound/soc/tegra/tegra_asoc_machine.h |  46 ++
 sound/soc/tegra/tegra_max98090.c     | 277 ----------
 sound/soc/tegra/tegra_rt5640.c       | 223 --------
 sound/soc/tegra/tegra_rt5677.c       | 325 ------------
 sound/soc/tegra/tegra_sgtl5000.c     | 212 --------
 sound/soc/tegra/tegra_wm8753.c       | 186 -------
 sound/soc/tegra/tegra_wm8903.c       | 358 +++----------
 sound/soc/tegra/tegra_wm9712.c       | 167 ------
 sound/soc/tegra/trimslice.c          | 173 -------
 13 files changed, 864 insertions(+), 2126 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra_alc5632.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.c
 create mode 100644 sound/soc/tegra/tegra_asoc_machine.h
 delete mode 100644 sound/soc/tegra/tegra_max98090.c
 delete mode 100644 sound/soc/tegra/tegra_rt5640.c
 delete mode 100644 sound/soc/tegra/tegra_rt5677.c
 delete mode 100644 sound/soc/tegra/tegra_sgtl5000.c
 delete mode 100644 sound/soc/tegra/tegra_wm8753.c
 delete mode 100644 sound/soc/tegra/tegra_wm9712.c
 delete mode 100644 sound/soc/tegra/trimslice.c

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index a4e6760944d0..83c87f35a7d3 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -117,9 +117,13 @@ config SND_SOC_TEGRA_AUDIO_GRAPH_CARD
 	  few things for Tegra audio. Most of the code is re-used from
 	  audio graph driver and the same DT bindings are used.
 
+config SND_SOC_TEGRA_MACHINE_DRV
+	tristate
+
 config SND_SOC_TEGRA_RT5640
 	tristate "SoC Audio support for Tegra boards using an RT5640 codec"
 	depends on I2C && GPIOLIB
+	select SND_SOC_TEGRA_MACHINE_DRV
 	select SND_SOC_RT5640
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
@@ -128,6 +132,7 @@ config SND_SOC_TEGRA_RT5640
 config SND_SOC_TEGRA_WM8753
 	tristate "SoC Audio support for Tegra boards using a WM8753 codec"
 	depends on I2C && GPIOLIB
+	select SND_SOC_TEGRA_MACHINE_DRV
 	select SND_SOC_WM8753
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
@@ -136,6 +141,7 @@ config SND_SOC_TEGRA_WM8753
 config SND_SOC_TEGRA_WM8903
 	tristate "SoC Audio support for Tegra boards using a WM8903 codec"
 	depends on I2C && GPIOLIB
+	select SND_SOC_TEGRA_MACHINE_DRV
 	select SND_SOC_WM8903
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
@@ -145,6 +151,7 @@ config SND_SOC_TEGRA_WM8903
 config SND_SOC_TEGRA_WM9712
 	tristate "SoC Audio support for Tegra boards using a WM9712 codec"
 	depends on GPIOLIB
+	select SND_SOC_TEGRA_MACHINE_DRV
 	select SND_SOC_TEGRA20_AC97
 	select SND_SOC_WM9712
 	help
@@ -154,6 +161,7 @@ config SND_SOC_TEGRA_WM9712
 config SND_SOC_TEGRA_TRIMSLICE
 	tristate "SoC Audio support for TrimSlice board"
 	depends on I2C
+	select SND_SOC_TEGRA_MACHINE_DRV
 	select SND_SOC_TLV320AIC23_I2C
 	help
 	  Say Y or M here if you want to add support for SoC audio on the
@@ -162,6 +170,7 @@ config SND_SOC_TEGRA_TRIMSLICE
 config SND_SOC_TEGRA_ALC5632
 	tristate "SoC Audio support for Tegra boards using an ALC5632 codec"
 	depends on I2C && GPIOLIB
+	select SND_SOC_TEGRA_MACHINE_DRV
 	select SND_SOC_ALC5632
 	help
 	  Say Y or M here if you want to add support for SoC audio on the
@@ -170,6 +179,7 @@ config SND_SOC_TEGRA_ALC5632
 config SND_SOC_TEGRA_MAX98090
 	tristate "SoC Audio support for Tegra boards using a MAX98090 codec"
 	depends on I2C && GPIOLIB
+	select SND_SOC_TEGRA_MACHINE_DRV
 	select SND_SOC_MAX98090
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
@@ -178,6 +188,7 @@ config SND_SOC_TEGRA_MAX98090
 config SND_SOC_TEGRA_RT5677
 	tristate "SoC Audio support for Tegra boards using a RT5677 codec"
 	depends on I2C && GPIOLIB
+	select SND_SOC_TEGRA_MACHINE_DRV
 	select SND_SOC_RT5677
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
@@ -186,6 +197,7 @@ config SND_SOC_TEGRA_RT5677
 config SND_SOC_TEGRA_SGTL5000
 	tristate "SoC Audio support for Tegra boards using a SGTL5000 codec"
 	depends on I2C && GPIOLIB
+	select SND_SOC_TEGRA_MACHINE_DRV
 	select SND_SOC_SGTL5000
 	help
 	  Say Y or M here if you want to add support for SoC audio on Tegra
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index b17dd6eef92a..b930ea7c75f1 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -29,24 +29,10 @@ obj-$(CONFIG_SND_SOC_TEGRA186_DSPK) += snd-soc-tegra186-dspk.o
 obj-$(CONFIG_SND_SOC_TEGRA210_ADMAIF) += snd-soc-tegra210-admaif.o
 
 # Tegra machine Support
-snd-soc-tegra-rt5640-objs := tegra_rt5640.o
-snd-soc-tegra-rt5677-objs := tegra_rt5677.o
-snd-soc-tegra-wm8753-objs := tegra_wm8753.o
 snd-soc-tegra-wm8903-objs := tegra_wm8903.o
-snd-soc-tegra-wm9712-objs := tegra_wm9712.o
-snd-soc-tegra-trimslice-objs := trimslice.o
-snd-soc-tegra-alc5632-objs := tegra_alc5632.o
-snd-soc-tegra-max98090-objs := tegra_max98090.o
-snd-soc-tegra-sgtl5000-objs := tegra_sgtl5000.o
+snd-soc-tegra-machine-objs := tegra_asoc_machine.o
 snd-soc-tegra-audio-graph-card-objs := tegra_audio_graph_card.o
 
-obj-$(CONFIG_SND_SOC_TEGRA_RT5640) += snd-soc-tegra-rt5640.o
-obj-$(CONFIG_SND_SOC_TEGRA_RT5677) += snd-soc-tegra-rt5677.o
-obj-$(CONFIG_SND_SOC_TEGRA_WM8753) += snd-soc-tegra-wm8753.o
 obj-$(CONFIG_SND_SOC_TEGRA_WM8903) += snd-soc-tegra-wm8903.o
-obj-$(CONFIG_SND_SOC_TEGRA_WM9712) += snd-soc-tegra-wm9712.o
-obj-$(CONFIG_SND_SOC_TEGRA_TRIMSLICE) += snd-soc-tegra-trimslice.o
-obj-$(CONFIG_SND_SOC_TEGRA_ALC5632) += snd-soc-tegra-alc5632.o
-obj-$(CONFIG_SND_SOC_TEGRA_MAX98090) += snd-soc-tegra-max98090.o
-obj-$(CONFIG_SND_SOC_TEGRA_SGTL5000) += snd-soc-tegra-sgtl5000.o
+obj-$(CONFIG_SND_SOC_TEGRA_MACHINE_DRV) += snd-soc-tegra-machine.o
 obj-$(CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD) += snd-soc-tegra-audio-graph-card.o
diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
deleted file mode 100644
index 81ea6ceba689..000000000000
--- a/sound/soc/tegra/tegra_alc5632.c
+++ /dev/null
@@ -1,260 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
-* tegra_alc5632.c  --  Toshiba AC100(PAZ00) machine ASoC driver
- *
- * Copyright (C) 2011 The AC100 Kernel Team <ac100@lists.lauchpad.net>
- * Copyright (C) 2012 - NVIDIA, Inc.
- *
- * Authors:  Leon Romanovsky <leon@leon.nu>
- *           Andrey Danin <danindrey@mail.ru>
- *           Marc Dietrich <marvin24@gmx.de>
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
-
-#include <sound/core.h>
-#include <sound/jack.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-
-#include "../codecs/alc5632.h"
-
-#include "tegra_asoc_utils.h"
-
-#define DRV_NAME "tegra-alc5632"
-
-struct tegra_alc5632 {
-	struct tegra_asoc_utils_data util_data;
-	int gpio_hp_det;
-};
-
-static int tegra_alc5632_asoc_hw_params(struct snd_pcm_substream *substream,
-					struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_card *card = rtd->card;
-	struct tegra_alc5632 *alc5632 = snd_soc_card_get_drvdata(card);
-	int srate, mclk;
-	int err;
-
-	srate = params_rate(params);
-	mclk = 512 * srate;
-
-	err = tegra_asoc_utils_set_rate(&alc5632->util_data, srate, mclk);
-	if (err < 0) {
-		dev_err(card->dev, "Can't configure clocks\n");
-		return err;
-	}
-
-	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
-					SND_SOC_CLOCK_IN);
-	if (err < 0) {
-		dev_err(card->dev, "codec_dai clock not set\n");
-		return err;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops tegra_alc5632_asoc_ops = {
-	.hw_params = tegra_alc5632_asoc_hw_params,
-};
-
-static struct snd_soc_jack tegra_alc5632_hs_jack;
-
-static struct snd_soc_jack_pin tegra_alc5632_hs_jack_pins[] = {
-	{
-		.pin = "Headset Mic",
-		.mask = SND_JACK_MICROPHONE,
-	},
-	{
-		.pin = "Headset Stereophone",
-		.mask = SND_JACK_HEADPHONE,
-	},
-};
-
-static struct snd_soc_jack_gpio tegra_alc5632_hp_jack_gpio = {
-	.name = "Headset detection",
-	.report = SND_JACK_HEADSET,
-	.debounce_time = 150,
-};
-
-static const struct snd_soc_dapm_widget tegra_alc5632_dapm_widgets[] = {
-	SND_SOC_DAPM_SPK("Int Spk", NULL),
-	SND_SOC_DAPM_HP("Headset Stereophone", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_MIC("Digital Mic", NULL),
-};
-
-static const struct snd_kcontrol_new tegra_alc5632_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Int Spk"),
-};
-
-static int tegra_alc5632_asoc_init(struct snd_soc_pcm_runtime *rtd)
-{
-	int ret;
-	struct tegra_alc5632 *machine = snd_soc_card_get_drvdata(rtd->card);
-
-	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
-				    SND_JACK_HEADSET,
-				    &tegra_alc5632_hs_jack,
-				    tegra_alc5632_hs_jack_pins,
-				    ARRAY_SIZE(tegra_alc5632_hs_jack_pins));
-	if (ret)
-		return ret;
-
-	if (gpio_is_valid(machine->gpio_hp_det)) {
-		tegra_alc5632_hp_jack_gpio.gpio = machine->gpio_hp_det;
-		snd_soc_jack_add_gpios(&tegra_alc5632_hs_jack,
-						1,
-						&tegra_alc5632_hp_jack_gpio);
-	}
-
-	snd_soc_dapm_force_enable_pin(&rtd->card->dapm, "MICBIAS1");
-
-	return 0;
-}
-
-SND_SOC_DAILINK_DEFS(pcm,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "alc5632-hifi")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
-
-static struct snd_soc_dai_link tegra_alc5632_dai = {
-	.name = "ALC5632",
-	.stream_name = "ALC5632 PCM",
-	.init = tegra_alc5632_asoc_init,
-	.ops = &tegra_alc5632_asoc_ops,
-	.dai_fmt = SND_SOC_DAIFMT_I2S
-			   | SND_SOC_DAIFMT_NB_NF
-			   | SND_SOC_DAIFMT_CBS_CFS,
-	SND_SOC_DAILINK_REG(pcm),
-};
-
-static struct snd_soc_card snd_soc_tegra_alc5632 = {
-	.name = "tegra-alc5632",
-	.driver_name = "tegra",
-	.owner = THIS_MODULE,
-	.dai_link = &tegra_alc5632_dai,
-	.num_links = 1,
-	.controls = tegra_alc5632_controls,
-	.num_controls = ARRAY_SIZE(tegra_alc5632_controls),
-	.dapm_widgets = tegra_alc5632_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(tegra_alc5632_dapm_widgets),
-	.fully_routed = true,
-};
-
-static int tegra_alc5632_probe(struct platform_device *pdev)
-{
-	struct device_node *np = pdev->dev.of_node;
-	struct snd_soc_card *card = &snd_soc_tegra_alc5632;
-	struct tegra_alc5632 *alc5632;
-	int ret;
-
-	alc5632 = devm_kzalloc(&pdev->dev,
-			sizeof(struct tegra_alc5632), GFP_KERNEL);
-	if (!alc5632)
-		return -ENOMEM;
-
-	card->dev = &pdev->dev;
-	snd_soc_card_set_drvdata(card, alc5632);
-
-	alc5632->gpio_hp_det = of_get_named_gpio(np, "nvidia,hp-det-gpios", 0);
-	if (alc5632->gpio_hp_det == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-
-	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
-	if (ret)
-		goto err;
-
-	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
-	if (ret)
-		goto err;
-
-	tegra_alc5632_dai.codecs->of_node = of_parse_phandle(
-			pdev->dev.of_node, "nvidia,audio-codec", 0);
-
-	if (!tegra_alc5632_dai.codecs->of_node) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,audio-codec' missing or invalid\n");
-		ret = -EINVAL;
-		goto err;
-	}
-
-	tegra_alc5632_dai.cpus->of_node = of_parse_phandle(np,
-			"nvidia,i2s-controller", 0);
-	if (!tegra_alc5632_dai.cpus->of_node) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,i2s-controller' missing or invalid\n");
-		ret = -EINVAL;
-		goto err_put_codec_of_node;
-	}
-
-	tegra_alc5632_dai.platforms->of_node = tegra_alc5632_dai.cpus->of_node;
-
-	ret = tegra_asoc_utils_init(&alc5632->util_data, &pdev->dev);
-	if (ret)
-		goto err_put_cpu_of_node;
-
-	ret = snd_soc_register_card(card);
-	if (ret) {
-		dev_err_probe(&pdev->dev, ret,
-			      "snd_soc_register_card failed\n");
-		goto err_put_cpu_of_node;
-	}
-
-	return 0;
-
-err_put_cpu_of_node:
-	of_node_put(tegra_alc5632_dai.cpus->of_node);
-	tegra_alc5632_dai.cpus->of_node = NULL;
-	tegra_alc5632_dai.platforms->of_node = NULL;
-err_put_codec_of_node:
-	of_node_put(tegra_alc5632_dai.codecs->of_node);
-	tegra_alc5632_dai.codecs->of_node = NULL;
-err:
-	return ret;
-}
-
-static int tegra_alc5632_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-
-	snd_soc_unregister_card(card);
-
-	of_node_put(tegra_alc5632_dai.cpus->of_node);
-	tegra_alc5632_dai.cpus->of_node = NULL;
-	tegra_alc5632_dai.platforms->of_node = NULL;
-	of_node_put(tegra_alc5632_dai.codecs->of_node);
-	tegra_alc5632_dai.codecs->of_node = NULL;
-
-	return 0;
-}
-
-static const struct of_device_id tegra_alc5632_of_match[] = {
-	{ .compatible = "nvidia,tegra-audio-alc5632", },
-	{},
-};
-
-static struct platform_driver tegra_alc5632_driver = {
-	.driver = {
-		.name = DRV_NAME,
-		.pm = &snd_soc_pm_ops,
-		.of_match_table = tegra_alc5632_of_match,
-	},
-	.probe = tegra_alc5632_probe,
-	.remove = tegra_alc5632_remove,
-};
-module_platform_driver(tegra_alc5632_driver);
-
-MODULE_AUTHOR("Leon Romanovsky <leon@leon.nu>");
-MODULE_DESCRIPTION("Tegra+ALC5632 machine ASoC driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra_alc5632_of_match);
diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
new file mode 100644
index 000000000000..17579decceda
--- /dev/null
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -0,0 +1,733 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * tegra_asoc_machine.c - Universal ASoC machine driver for NVIDIA Tegra boards.
+ */
+
+#include <linux/export.h>
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
+#include "tegra_asoc_machine.h"
+
+/* Headphones Jack */
+
+static struct snd_soc_jack tegra_machine_hp_jack;
+
+static struct snd_soc_jack_pin tegra_machine_hp_jack_pins[] = {
+	{ .pin = "Headphone",  .mask = SND_JACK_HEADPHONE },
+	{ .pin = "Headphones", .mask = SND_JACK_HEADPHONE },
+};
+
+static struct snd_soc_jack_gpio tegra_machine_hp_jack_gpio = {
+	.name = "Headphones detection",
+	.report = SND_JACK_HEADPHONE,
+	.debounce_time = 150,
+};
+
+/* Headset Jack */
+
+static struct snd_soc_jack tegra_machine_headset_jack;
+
+static struct snd_soc_jack_pin tegra_machine_headset_jack_pins[] = {
+	{ .pin = "Headset Mic", .mask = SND_JACK_MICROPHONE },
+	{ .pin = "Headset Stereophone", .mask = SND_JACK_HEADPHONE },
+};
+
+static struct snd_soc_jack_gpio tegra_machine_headset_jack_gpio = {
+	.name = "Headset detection",
+	.report = SND_JACK_HEADSET,
+	.debounce_time = 150,
+};
+
+/* Mic Jack */
+
+static struct snd_soc_jack tegra_machine_mic_jack;
+
+static struct snd_soc_jack_pin tegra_machine_mic_jack_pins[] = {
+	{ .pin = "Mic Jack",    .mask = SND_JACK_MICROPHONE },
+	{ .pin = "Headset Mic", .mask = SND_JACK_MICROPHONE },
+};
+
+static struct snd_soc_jack_gpio tegra_machine_mic_jack_gpio = {
+	.name = "Mic detection",
+	.report = SND_JACK_MICROPHONE,
+	.debounce_time = 150,
+};
+
+static int tegra_machine_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *k, int event)
+{
+	struct snd_soc_dapm_context *dapm = w->dapm;
+	struct tegra_machine *machine = snd_soc_card_get_drvdata(dapm->card);
+
+	if (machine->asoc->dapm_event) {
+		int ret = machine->asoc->dapm_event(w, k, event);
+		if (ret <= 0)
+			return ret;
+	}
+
+	if (!strcmp(w->name, "Int Spk") || !strcmp(w->name, "Speakers"))
+		gpiod_set_value_cansleep(machine->gpiod_spkr_en,
+					 SND_SOC_DAPM_EVENT_ON(event));
+
+	if (!strcmp(w->name, "Mic Jack"))
+		gpiod_set_value_cansleep(machine->gpiod_ext_mic_en,
+					 SND_SOC_DAPM_EVENT_ON(event));
+
+	if (!strcmp(w->name, "Int Mic"))
+		gpiod_set_value_cansleep(machine->gpiod_int_mic_en,
+					 SND_SOC_DAPM_EVENT_ON(event));
+
+	if (!strcmp(w->name, "Headphone") || !strcmp(w->name, "Headphone Jack"))
+		gpiod_set_value_cansleep(machine->gpiod_hp_mute,
+					 !SND_SOC_DAPM_EVENT_ON(event));
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget tegra_machine_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", tegra_machine_event),
+	SND_SOC_DAPM_HP("Headphone", tegra_machine_event),
+	SND_SOC_DAPM_HP("Headset Stereophone", NULL),
+	SND_SOC_DAPM_HP("Headphones", NULL),
+	SND_SOC_DAPM_SPK("Speakers", tegra_machine_event),
+	SND_SOC_DAPM_SPK("Int Spk", tegra_machine_event),
+	SND_SOC_DAPM_MIC("Int Mic", tegra_machine_event),
+	SND_SOC_DAPM_MIC("Mic Jack", tegra_machine_event),
+	SND_SOC_DAPM_MIC("Internal Mic 1", NULL),
+	SND_SOC_DAPM_MIC("Internal Mic 2", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Digital Mic", NULL),
+	SND_SOC_DAPM_MIC("Mic", NULL),
+	SND_SOC_DAPM_LINE("Line In Jack", NULL),
+	SND_SOC_DAPM_LINE("Line In", NULL),
+	SND_SOC_DAPM_LINE("LineIn", NULL),
+};
+
+static const struct snd_kcontrol_new tegra_machine_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speakers"),
+	SOC_DAPM_PIN_SWITCH("Int Spk"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Internal Mic 1"),
+	SOC_DAPM_PIN_SWITCH("Internal Mic 2"),
+};
+
+int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct tegra_machine *machine = snd_soc_card_get_drvdata(card);
+	int err;
+
+	if (machine->gpiod_hp_det && machine->asoc->add_hp_jack) {
+		err = snd_soc_card_jack_new(card, "Headphones Jack",
+					    SND_JACK_HEADPHONE,
+					    &tegra_machine_hp_jack,
+					    tegra_machine_hp_jack_pins,
+					    ARRAY_SIZE(tegra_machine_hp_jack_pins));
+		if (err) {
+			dev_err(rtd->dev,
+				"Headphones Jack creation failed: %d\n", err);
+			return err;
+		}
+
+		tegra_machine_hp_jack_gpio.desc = machine->gpiod_hp_det;
+
+		err = snd_soc_jack_add_gpios(&tegra_machine_hp_jack, 1,
+					     &tegra_machine_hp_jack_gpio);
+		if (err)
+			dev_err(rtd->dev, "HP GPIOs not added: %d\n", err);
+	}
+
+	if (machine->gpiod_hp_det && machine->asoc->add_headset_jack) {
+		err = snd_soc_card_jack_new(card, "Headset Jack",
+					    SND_JACK_HEADSET,
+					    &tegra_machine_headset_jack,
+					    tegra_machine_headset_jack_pins,
+					    ARRAY_SIZE(tegra_machine_headset_jack_pins));
+		if (err) {
+			dev_err(rtd->dev,
+				"Headset Jack creation failed: %d\n", err);
+			return err;
+		}
+
+		tegra_machine_headset_jack_gpio.desc = machine->gpiod_hp_det;
+
+		err = snd_soc_jack_add_gpios(&tegra_machine_headset_jack, 1,
+					     &tegra_machine_headset_jack_gpio);
+		if (err)
+			dev_err(rtd->dev, "Headset GPIOs not added: %d\n", err);
+	}
+
+	if (machine->gpiod_mic_det && machine->asoc->add_mic_jack) {
+		err = snd_soc_card_jack_new(rtd->card, "Mic Jack",
+					    SND_JACK_MICROPHONE,
+					    &tegra_machine_mic_jack,
+					    tegra_machine_mic_jack_pins,
+					    ARRAY_SIZE(tegra_machine_mic_jack_pins));
+		if (err) {
+			dev_err(rtd->dev, "Mic Jack creation failed: %d\n", err);
+			return err;
+		}
+
+		tegra_machine_mic_jack_gpio.desc = machine->gpiod_mic_det;
+
+		err = snd_soc_jack_add_gpios(&tegra_machine_mic_jack, 1,
+					     &tegra_machine_mic_jack_gpio);
+		if (err)
+			dev_err(rtd->dev, "Mic GPIOs not added: %d\n", err);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra_asoc_machine_init);
+
+static unsigned int tegra_machine_mclk_rate_128(unsigned int srate)
+{
+	return 128 * srate;
+}
+
+static unsigned int tegra_machine_mclk_rate_256(unsigned int srate)
+{
+	return 256 * srate;
+}
+
+static unsigned int tegra_machine_mclk_rate_512(unsigned int srate)
+{
+	return 512 * srate;
+}
+
+static unsigned int tegra_mclk_rate_12000000(unsigned int srate)
+{
+	unsigned int mclk;
+
+	switch (srate) {
+	case 8000:
+	case 16000:
+	case 24000:
+	case 32000:
+	case 48000:
+	case 64000:
+	case 96000:
+		mclk = 12288000;
+		break;
+	case 11025:
+	case 22050:
+	case 44100:
+	case 88200:
+		mclk = 11289600;
+		break;
+	default:
+		mclk = 12000000;
+		break;
+	}
+
+	return mclk;
+}
+
+unsigned int tegra_asoc_machine_mclk_rate_128_256(unsigned int srate)
+{
+	unsigned int mclk;
+
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
+	return mclk;
+}
+EXPORT_SYMBOL_GPL(tegra_asoc_machine_mclk_rate_128_256);
+
+static int tegra_machine_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	struct tegra_machine *machine = snd_soc_card_get_drvdata(card);
+	unsigned int srate = params_rate(params);
+	unsigned int mclk = machine->asoc->mclk_rate(srate);
+	unsigned int clk_id = machine->asoc->mclk_id;
+	int err;
+
+	err = tegra_asoc_utils_set_rate(&machine->util_data, srate, mclk);
+	if (err < 0) {
+		dev_err(card->dev, "Can't configure clocks: %d\n", err);
+		return err;
+	}
+
+	err = snd_soc_dai_set_sysclk(codec_dai, clk_id, mclk, SND_SOC_CLOCK_IN);
+	if (err < 0) {
+		dev_err(card->dev, "codec_dai clock not set: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static struct snd_soc_ops tegra_machine_snd_ops = {
+	.hw_params = tegra_machine_hw_params,
+};
+
+static void tegra_machine_node_release(void *of_node)
+{
+	of_node_put(of_node);
+}
+
+static struct device_node *
+tegra_machine_parse_phandle(struct device *dev, const char *name)
+{
+	struct device_node *np;
+	int err;
+
+	np = of_parse_phandle(dev->of_node, name, 0);
+	if (!np) {
+		dev_err(dev, "Property '%s' missing or invalid\n", name);
+		return ERR_PTR(-EINVAL);
+	}
+
+	err = devm_add_action_or_reset(dev, tegra_machine_node_release, np);
+	if (err)
+		return ERR_PTR(err);
+
+	return np;
+}
+
+int tegra_asoc_machine_probe(struct platform_device *pdev)
+{
+	struct device_node *np_codec, *np_i2s;
+	const struct tegra_asoc_data *asoc;
+	struct device *dev = &pdev->dev;
+	struct tegra_machine *machine;
+	struct snd_soc_card *card;
+	struct gpio_desc *gpiod;
+	int err;
+
+	machine = devm_kzalloc(dev, sizeof(*machine), GFP_KERNEL);
+	if (!machine)
+		return -ENOMEM;
+
+	asoc = of_device_get_match_data(dev);
+	card = asoc->card;
+	card->dev = dev;
+
+	machine->asoc = asoc;
+	machine->mic_jack = &tegra_machine_mic_jack;
+	machine->hp_jack_gpio = &tegra_machine_hp_jack_gpio;
+	snd_soc_card_set_drvdata(card, machine);
+
+	gpiod = devm_gpiod_get_optional(dev, "nvidia,hp-mute", GPIOD_OUT_HIGH);
+	machine->gpiod_hp_mute = gpiod;
+	if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
+
+	gpiod = devm_gpiod_get_optional(dev, "nvidia,hp-det", GPIOD_IN);
+	machine->gpiod_hp_det = gpiod;
+	if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
+
+	gpiod = devm_gpiod_get_optional(dev, "nvidia,mic-det", GPIOD_IN);
+	machine->gpiod_mic_det = gpiod;
+	if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
+
+	gpiod = devm_gpiod_get_optional(dev, "nvidia,spkr-en", GPIOD_OUT_LOW);
+	machine->gpiod_spkr_en = gpiod;
+	if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
+
+	gpiod = devm_gpiod_get_optional(dev, "nvidia,int-mic-en", GPIOD_OUT_LOW);
+	machine->gpiod_int_mic_en = gpiod;
+	if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
+
+	gpiod = devm_gpiod_get_optional(dev, "nvidia,ext-mic-en", GPIOD_OUT_LOW);
+	machine->gpiod_ext_mic_en = gpiod;
+	if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
+
+	err = snd_soc_of_parse_card_name(card, "nvidia,model");
+	if (err)
+		return err;
+
+	if (!card->dapm_routes) {
+		err = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
+		if (err)
+			return err;
+	}
+
+	np_codec = tegra_machine_parse_phandle(dev, "nvidia,audio-codec");
+	if (IS_ERR(np_codec))
+		return PTR_ERR(np_codec);
+
+	np_i2s = tegra_machine_parse_phandle(dev, "nvidia,i2s-controller");
+	if (!np_i2s)
+		return PTR_ERR(np_i2s);
+
+	card->dai_link->cpus->of_node = np_i2s;
+	card->dai_link->codecs->of_node = np_codec;
+	card->dai_link->platforms->of_node = np_i2s;
+
+	if (asoc->add_common_controls) {
+		card->controls = tegra_machine_controls;
+		card->num_controls = ARRAY_SIZE(tegra_machine_controls);
+	}
+
+	if (asoc->add_common_dapm_widgets) {
+		card->dapm_widgets = tegra_machine_dapm_widgets;
+		card->num_dapm_widgets = ARRAY_SIZE(tegra_machine_dapm_widgets);
+	}
+
+	if (asoc->add_common_snd_ops)
+		card->dai_link->ops = &tegra_machine_snd_ops;
+
+	if (!card->owner)
+		card->owner = THIS_MODULE;
+	if (!card->driver_name)
+		card->driver_name = "tegra";
+
+	err = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
+	if (err)
+		return err;
+
+	err = devm_snd_soc_register_card(dev, card);
+	if (err)
+		return err;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tegra_asoc_machine_probe);
+
+/* WM8753 machine */
+
+SND_SOC_DAILINK_DEFS(wm8753_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8753-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_wm8753_dai = {
+	.name = "WM8753",
+	.stream_name = "WM8753 PCM",
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBS_CFS,
+	SND_SOC_DAILINK_REG(wm8753_hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_wm8753 = {
+	.dai_link = &tegra_wm8753_dai,
+	.num_links = 1,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_wm8753_data = {
+	.mclk_rate = tegra_mclk_rate_12000000,
+	.card = &snd_soc_tegra_wm8753,
+	.add_common_dapm_widgets = true,
+	.add_common_snd_ops = true,
+};
+
+/* WM9712 machine */
+
+static int tegra_wm9712_init(struct snd_soc_pcm_runtime *rtd)
+{
+	return snd_soc_dapm_force_enable_pin(&rtd->card->dapm, "Mic Bias");
+}
+
+SND_SOC_DAILINK_DEFS(wm9712_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm9712-codec", "wm9712-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_wm9712_dai = {
+	.name = "AC97 HiFi",
+	.stream_name = "AC97 HiFi",
+	.init = tegra_wm9712_init,
+	SND_SOC_DAILINK_REG(wm9712_hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_wm9712 = {
+	.dai_link = &tegra_wm9712_dai,
+	.num_links = 1,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_wm9712_data = {
+	.card = &snd_soc_tegra_wm9712,
+	.add_common_dapm_widgets = true,
+};
+
+/* MAX98090 machine */
+
+SND_SOC_DAILINK_DEFS(max98090_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "HiFi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_max98090_dai = {
+	.name = "max98090",
+	.stream_name = "max98090 PCM",
+	.init = tegra_asoc_machine_init,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBS_CFS,
+	SND_SOC_DAILINK_REG(max98090_hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_max98090 = {
+	.components = "codec:max98090",
+	.dai_link = &tegra_max98090_dai,
+	.num_links = 1,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_max98090_data = {
+	.mclk_rate = tegra_mclk_rate_12000000,
+	.card = &snd_soc_tegra_max98090,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+	.add_mic_jack = true,
+	.add_hp_jack = true,
+};
+
+/* SGTL5000 machine */
+
+SND_SOC_DAILINK_DEFS(sgtl5000_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "sgtl5000")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_sgtl5000_dai = {
+	.name = "sgtl5000",
+	.stream_name = "HiFi",
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBS_CFS,
+	SND_SOC_DAILINK_REG(sgtl5000_hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
+	.dai_link = &tegra_sgtl5000_dai,
+	.num_links = 1,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_sgtl5000_data = {
+	.mclk_rate = tegra_mclk_rate_12000000,
+	.card = &snd_soc_tegra_sgtl5000,
+	.add_common_dapm_widgets = true,
+	.add_common_snd_ops = true,
+};
+
+/* TLV320AIC23 machine */
+
+static const struct snd_soc_dapm_widget trimslice_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Line Out", NULL),
+	SND_SOC_DAPM_LINE("Line In", NULL),
+};
+
+static const struct snd_soc_dapm_route trimslice_audio_map[] = {
+	{"Line Out", NULL, "LOUT"},
+	{"Line Out", NULL, "ROUT"},
+
+	{"LLINEIN", NULL, "Line In"},
+	{"RLINEIN", NULL, "Line In"},
+};
+
+SND_SOC_DAILINK_DEFS(tlv320aic23_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "tlv320aic23-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_tlv320aic23_dai = {
+	.name = "TLV320AIC23",
+	.stream_name = "AIC23",
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBS_CFS,
+	SND_SOC_DAILINK_REG(tlv320aic23_hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_trimslice = {
+	.dai_link = &tegra_tlv320aic23_dai,
+	.num_links = 1,
+	.dapm_widgets = trimslice_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(trimslice_dapm_widgets),
+	.dapm_routes = trimslice_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(trimslice_audio_map),
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_trimslice_data = {
+	.mclk_rate = tegra_machine_mclk_rate_128,
+	.card = &snd_soc_tegra_trimslice,
+	.add_common_snd_ops = true,
+};
+
+/* RT5677 machine */
+
+static int tegra_rt5677_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int err;
+
+	err = tegra_asoc_machine_init(rtd);
+	if (err)
+		return err;
+
+	snd_soc_dapm_force_enable_pin(&card->dapm, "MICBIAS1");
+
+	return 0;
+}
+
+SND_SOC_DAILINK_DEFS(rt5677_aif1,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5677-aif1")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_rt5677_dai = {
+	.name = "RT5677",
+	.stream_name = "RT5677 PCM",
+	.init = tegra_rt5677_init,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBS_CFS,
+	SND_SOC_DAILINK_REG(rt5677_aif1),
+};
+
+static struct snd_soc_card snd_soc_tegra_rt5677 = {
+	.dai_link = &tegra_rt5677_dai,
+	.num_links = 1,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_rt5677_data = {
+	.mclk_rate = tegra_machine_mclk_rate_256,
+	.card = &snd_soc_tegra_rt5677,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+	.add_mic_jack = true,
+	.add_hp_jack = true,
+};
+
+/* RT5640 machine */
+
+SND_SOC_DAILINK_DEFS(rt5640_aif1,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5640-aif1")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_rt5640_dai = {
+	.name = "RT5640",
+	.stream_name = "RT5640 PCM",
+	.init = tegra_asoc_machine_init,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBS_CFS,
+	SND_SOC_DAILINK_REG(rt5640_aif1),
+};
+
+static struct snd_soc_card snd_soc_tegra_rt5640 = {
+	.dai_link = &tegra_rt5640_dai,
+	.num_links = 1,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_rt5640_data = {
+	.mclk_rate = tegra_machine_mclk_rate_256,
+	.card = &snd_soc_tegra_rt5640,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+	.add_hp_jack = true,
+};
+
+/* RT5632 machine */
+
+SND_SOC_DAILINK_DEFS(rt5632_hifi,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "alc5632-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link tegra_rt5632_dai = {
+	.name = "ALC5632",
+	.stream_name = "ALC5632 PCM",
+	.init = tegra_rt5677_init,
+	.dai_fmt = SND_SOC_DAIFMT_I2S |
+		   SND_SOC_DAIFMT_NB_NF |
+		   SND_SOC_DAIFMT_CBS_CFS,
+	SND_SOC_DAILINK_REG(rt5632_hifi),
+};
+
+static struct snd_soc_card snd_soc_tegra_rt5632 = {
+	.dai_link = &tegra_rt5632_dai,
+	.num_links = 1,
+	.fully_routed = true,
+};
+
+static const struct tegra_asoc_data tegra_rt5632_data = {
+	.mclk_rate = tegra_machine_mclk_rate_512,
+	.card = &snd_soc_tegra_rt5632,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+	.add_headset_jack = true,
+};
+
+static const struct of_device_id tegra_machine_of_match[] = {
+	{ .compatible = "nvidia,tegra-audio-trimslice", .data = &tegra_trimslice_data },
+	{ .compatible = "nvidia,tegra-audio-max98090", .data = &tegra_max98090_data },
+	{ .compatible = "nvidia,tegra-audio-sgtl5000", .data = &tegra_sgtl5000_data },
+	{ .compatible = "nvidia,tegra-audio-wm9712", .data = &tegra_wm9712_data },
+	{ .compatible = "nvidia,tegra-audio-wm8753", .data = &tegra_wm8753_data },
+	{ .compatible = "nvidia,tegra-audio-rt5677", .data = &tegra_rt5677_data },
+	{ .compatible = "nvidia,tegra-audio-rt5640", .data = &tegra_rt5640_data },
+	{ .compatible = "nvidia,tegra-audio-alc5632", .data = &tegra_rt5632_data },
+	{},
+};
+MODULE_DEVICE_TABLE(of, tegra_machine_of_match);
+
+static struct platform_driver tegra_asoc_machine_driver = {
+	.driver = {
+		.name = "tegra-audio",
+		.of_match_table = tegra_machine_of_match,
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = tegra_asoc_machine_probe,
+};
+module_platform_driver(tegra_asoc_machine_driver);
+
+MODULE_AUTHOR("Anatol Pomozov <anatol@google.com>");
+MODULE_AUTHOR("Andrey Danin <danindrey@mail.ru>");
+MODULE_AUTHOR("Dmitry Osipenko <digetx@gmail.com>");
+MODULE_AUTHOR("Ion Agorria <ion@agorria.com>");
+MODULE_AUTHOR("Leon Romanovsky <leon@leon.nu>");
+MODULE_AUTHOR("Lucas Stach <dev@lynxeye.de>");
+MODULE_AUTHOR("Marc Dietrich <marvin24@gmx.de>");
+MODULE_AUTHOR("Marcel Ziswiler <marcel@ziswiler.com>");
+MODULE_AUTHOR("Mike Rapoport <mike@compulab.co.il>");
+MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("Tegra machine ASoC driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/tegra/tegra_asoc_machine.h b/sound/soc/tegra/tegra_asoc_machine.h
new file mode 100644
index 000000000000..080c1a26073a
--- /dev/null
+++ b/sound/soc/tegra/tegra_asoc_machine.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __TEGRA_ASOC_MACHINE_H__
+#define __TEGRA_ASOC_MACHINE_H__
+
+#include "tegra_asoc_utils.h"
+
+struct gpio_desc;
+struct snd_soc_card;
+struct snd_soc_jack;
+struct platform_device;
+struct snd_soc_jack_gpio;
+struct snd_soc_pcm_runtime;
+
+struct tegra_asoc_data {
+	unsigned int (*mclk_rate)(unsigned int srate);
+	struct snd_soc_card *card;
+	unsigned int mclk_id;
+	bool hp_jack_gpio_active_low;
+	bool add_common_dapm_widgets;
+	bool add_common_controls;
+	bool add_common_snd_ops;
+	bool add_headset_jack;
+	bool add_mic_jack;
+	bool add_hp_jack;
+};
+
+struct tegra_machine {
+	struct tegra_asoc_utils_data util_data;
+	const struct tegra_asoc_data *asoc;
+	struct gpio_desc *gpiod_ext_mic_en;
+	struct gpio_desc *gpiod_int_mic_en;
+	struct gpio_desc *gpiod_spkr_en;
+	struct gpio_desc *gpiod_mic_det;
+	struct gpio_desc *gpiod_ear_sel;
+	struct gpio_desc *gpiod_hp_mute;
+	struct gpio_desc *gpiod_hp_det;
+	struct snd_soc_jack *mic_jack;
+	struct snd_soc_jack_gpio *hp_jack_gpio;
+};
+
+int tegra_asoc_machine_probe(struct platform_device *pdev);
+int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd);
+unsigned int tegra_asoc_machine_mclk_rate_128_256(unsigned int srate);
+
+#endif
diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
deleted file mode 100644
index 5a649810c0c8..000000000000
--- a/sound/soc/tegra/tegra_max98090.c
+++ /dev/null
@@ -1,277 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Tegra machine ASoC driver for boards using a MAX90809 CODEC.
- *
- * Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
- *
- * Based on code copyright/by:
- *
- * Copyright (C) 2010-2012 - NVIDIA, Inc.
- * Copyright (C) 2011 The AC100 Kernel Team <ac100@lists.lauchpad.net>
- * (c) 2009, 2010 Nvidia Graphics Pvt. Ltd.
- * Copyright 2007 Wolfson Microelectronics PLC.
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
-
-#include <sound/core.h>
-#include <sound/jack.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-
-#include "tegra_asoc_utils.h"
-
-#define DRV_NAME "tegra-snd-max98090"
-
-struct tegra_max98090 {
-	struct tegra_asoc_utils_data util_data;
-	int gpio_hp_det;
-	int gpio_mic_det;
-};
-
-static int tegra_max98090_asoc_hw_params(struct snd_pcm_substream *substream,
-					struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_card *card = rtd->card;
-	struct tegra_max98090 *machine = snd_soc_card_get_drvdata(card);
-	int srate, mclk;
-	int err;
-
-	srate = params_rate(params);
-	switch (srate) {
-	case 8000:
-	case 16000:
-	case 24000:
-	case 32000:
-	case 48000:
-	case 64000:
-	case 96000:
-		mclk = 12288000;
-		break;
-	case 11025:
-	case 22050:
-	case 44100:
-	case 88200:
-		mclk = 11289600;
-		break;
-	default:
-		mclk = 12000000;
-		break;
-	}
-
-	err = tegra_asoc_utils_set_rate(&machine->util_data, srate, mclk);
-	if (err < 0) {
-		dev_err(card->dev, "Can't configure clocks\n");
-		return err;
-	}
-
-	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
-					SND_SOC_CLOCK_IN);
-	if (err < 0) {
-		dev_err(card->dev, "codec_dai clock not set\n");
-		return err;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops tegra_max98090_ops = {
-	.hw_params = tegra_max98090_asoc_hw_params,
-};
-
-static struct snd_soc_jack tegra_max98090_hp_jack;
-
-static struct snd_soc_jack_pin tegra_max98090_hp_jack_pins[] = {
-	{
-		.pin = "Headphones",
-		.mask = SND_JACK_HEADPHONE,
-	},
-};
-
-static struct snd_soc_jack_gpio tegra_max98090_hp_jack_gpio = {
-	.name = "Headphone detection",
-	.report = SND_JACK_HEADPHONE,
-	.debounce_time = 150,
-	.invert = 1,
-};
-
-static struct snd_soc_jack tegra_max98090_mic_jack;
-
-static struct snd_soc_jack_pin tegra_max98090_mic_jack_pins[] = {
-	{
-		.pin = "Mic Jack",
-		.mask = SND_JACK_MICROPHONE,
-	},
-};
-
-static struct snd_soc_jack_gpio tegra_max98090_mic_jack_gpio = {
-	.name = "Mic detection",
-	.report = SND_JACK_MICROPHONE,
-	.debounce_time = 150,
-	.invert = 1,
-};
-
-static const struct snd_soc_dapm_widget tegra_max98090_dapm_widgets[] = {
-	SND_SOC_DAPM_HP("Headphones", NULL),
-	SND_SOC_DAPM_SPK("Speakers", NULL),
-	SND_SOC_DAPM_MIC("Mic Jack", NULL),
-	SND_SOC_DAPM_MIC("Int Mic", NULL),
-};
-
-static const struct snd_kcontrol_new tegra_max98090_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphones"),
-	SOC_DAPM_PIN_SWITCH("Speakers"),
-	SOC_DAPM_PIN_SWITCH("Mic Jack"),
-	SOC_DAPM_PIN_SWITCH("Int Mic"),
-};
-
-static int tegra_max98090_asoc_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct tegra_max98090 *machine = snd_soc_card_get_drvdata(rtd->card);
-
-	if (gpio_is_valid(machine->gpio_hp_det)) {
-		snd_soc_card_jack_new(rtd->card, "Headphones",
-				      SND_JACK_HEADPHONE,
-				      &tegra_max98090_hp_jack,
-				      tegra_max98090_hp_jack_pins,
-				      ARRAY_SIZE(tegra_max98090_hp_jack_pins));
-
-		tegra_max98090_hp_jack_gpio.gpio = machine->gpio_hp_det;
-		snd_soc_jack_add_gpios(&tegra_max98090_hp_jack,
-					1,
-					&tegra_max98090_hp_jack_gpio);
-	}
-
-	if (gpio_is_valid(machine->gpio_mic_det)) {
-		snd_soc_card_jack_new(rtd->card, "Mic Jack",
-				      SND_JACK_MICROPHONE,
-				      &tegra_max98090_mic_jack,
-				      tegra_max98090_mic_jack_pins,
-				      ARRAY_SIZE(tegra_max98090_mic_jack_pins));
-
-		tegra_max98090_mic_jack_gpio.gpio = machine->gpio_mic_det;
-		snd_soc_jack_add_gpios(&tegra_max98090_mic_jack,
-				       1,
-				       &tegra_max98090_mic_jack_gpio);
-	}
-
-	return 0;
-}
-
-SND_SOC_DAILINK_DEFS(pcm,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "HiFi")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
-
-static struct snd_soc_dai_link tegra_max98090_dai = {
-	.name = "max98090",
-	.stream_name = "max98090 PCM",
-	.init = tegra_max98090_asoc_init,
-	.ops = &tegra_max98090_ops,
-	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
-	SND_SOC_DAILINK_REG(pcm),
-};
-
-static struct snd_soc_card snd_soc_tegra_max98090 = {
-	.name = "tegra-max98090",
-	.driver_name = "tegra",
-	.owner = THIS_MODULE,
-	.dai_link = &tegra_max98090_dai,
-	.num_links = 1,
-	.controls = tegra_max98090_controls,
-	.num_controls = ARRAY_SIZE(tegra_max98090_controls),
-	.dapm_widgets = tegra_max98090_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(tegra_max98090_dapm_widgets),
-	.fully_routed = true,
-};
-
-static int tegra_max98090_probe(struct platform_device *pdev)
-{
-	struct device_node *np = pdev->dev.of_node;
-	struct snd_soc_card *card = &snd_soc_tegra_max98090;
-	struct tegra_max98090 *machine;
-	int ret;
-
-	machine = devm_kzalloc(&pdev->dev,
-			sizeof(struct tegra_max98090), GFP_KERNEL);
-	if (!machine)
-		return -ENOMEM;
-
-	card->dev = &pdev->dev;
-	snd_soc_card_set_drvdata(card, machine);
-
-	machine->gpio_hp_det = of_get_named_gpio(np, "nvidia,hp-det-gpios", 0);
-	if (machine->gpio_hp_det == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-
-	machine->gpio_mic_det =
-			of_get_named_gpio(np, "nvidia,mic-det-gpios", 0);
-	if (machine->gpio_mic_det == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-
-	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
-	if (ret)
-		return ret;
-
-	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
-	if (ret)
-		return ret;
-
-	tegra_max98090_dai.codecs->of_node = of_parse_phandle(np,
-			"nvidia,audio-codec", 0);
-	if (!tegra_max98090_dai.codecs->of_node) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,audio-codec' missing or invalid\n");
-		return -EINVAL;
-	}
-
-	tegra_max98090_dai.cpus->of_node = of_parse_phandle(np,
-			"nvidia,i2s-controller", 0);
-	if (!tegra_max98090_dai.cpus->of_node) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,i2s-controller' missing or invalid\n");
-		return -EINVAL;
-	}
-
-	tegra_max98090_dai.platforms->of_node = tegra_max98090_dai.cpus->of_node;
-
-	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "snd_soc_register_card failed\n");
-
-	return 0;
-}
-
-static const struct of_device_id tegra_max98090_of_match[] = {
-	{ .compatible = "nvidia,tegra-audio-max98090", },
-	{},
-};
-
-static struct platform_driver tegra_max98090_driver = {
-	.driver = {
-		.name = DRV_NAME,
-		.pm = &snd_soc_pm_ops,
-		.of_match_table = tegra_max98090_of_match,
-	},
-	.probe = tegra_max98090_probe,
-};
-module_platform_driver(tegra_max98090_driver);
-
-MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
-MODULE_DESCRIPTION("Tegra max98090 machine ASoC driver");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra_max98090_of_match);
diff --git a/sound/soc/tegra/tegra_rt5640.c b/sound/soc/tegra/tegra_rt5640.c
deleted file mode 100644
index 3344f16258be..000000000000
--- a/sound/soc/tegra/tegra_rt5640.c
+++ /dev/null
@@ -1,223 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
-* tegra_rt5640.c - Tegra machine ASoC driver for boards using RT5640 codec.
- *
- * Copyright (c) 2013, NVIDIA CORPORATION.  All rights reserved.
- *
- * Based on code copyright/by:
- *
- * Copyright (C) 2010-2012 - NVIDIA, Inc.
- * Copyright (C) 2011 The AC100 Kernel Team <ac100@lists.lauchpad.net>
- * (c) 2009, 2010 Nvidia Graphics Pvt. Ltd.
- * Copyright 2007 Wolfson Microelectronics PLC.
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
-
-#include <sound/core.h>
-#include <sound/jack.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-
-#include "../codecs/rt5640.h"
-
-#include "tegra_asoc_utils.h"
-
-#define DRV_NAME "tegra-snd-rt5640"
-
-struct tegra_rt5640 {
-	struct tegra_asoc_utils_data util_data;
-	int gpio_hp_det;
-	enum of_gpio_flags gpio_hp_det_flags;
-};
-
-static int tegra_rt5640_asoc_hw_params(struct snd_pcm_substream *substream,
-					struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_card *card = rtd->card;
-	struct tegra_rt5640 *machine = snd_soc_card_get_drvdata(card);
-	int srate, mclk;
-	int err;
-
-	srate = params_rate(params);
-	mclk = 256 * srate;
-
-	err = tegra_asoc_utils_set_rate(&machine->util_data, srate, mclk);
-	if (err < 0) {
-		dev_err(card->dev, "Can't configure clocks\n");
-		return err;
-	}
-
-	err = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_MCLK, mclk,
-					SND_SOC_CLOCK_IN);
-	if (err < 0) {
-		dev_err(card->dev, "codec_dai clock not set\n");
-		return err;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops tegra_rt5640_ops = {
-	.hw_params = tegra_rt5640_asoc_hw_params,
-};
-
-static struct snd_soc_jack tegra_rt5640_hp_jack;
-
-static struct snd_soc_jack_pin tegra_rt5640_hp_jack_pins[] = {
-	{
-		.pin = "Headphones",
-		.mask = SND_JACK_HEADPHONE,
-	},
-};
-
-static struct snd_soc_jack_gpio tegra_rt5640_hp_jack_gpio = {
-	.name = "Headphone detection",
-	.report = SND_JACK_HEADPHONE,
-	.debounce_time = 150,
-	.invert = 1,
-};
-
-static const struct snd_soc_dapm_widget tegra_rt5640_dapm_widgets[] = {
-	SND_SOC_DAPM_HP("Headphones", NULL),
-	SND_SOC_DAPM_SPK("Speakers", NULL),
-	SND_SOC_DAPM_MIC("Mic Jack", NULL),
-};
-
-static const struct snd_kcontrol_new tegra_rt5640_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Speakers"),
-};
-
-static int tegra_rt5640_asoc_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct tegra_rt5640 *machine = snd_soc_card_get_drvdata(rtd->card);
-
-	snd_soc_card_jack_new(rtd->card, "Headphones", SND_JACK_HEADPHONE,
-			      &tegra_rt5640_hp_jack, tegra_rt5640_hp_jack_pins,
-			      ARRAY_SIZE(tegra_rt5640_hp_jack_pins));
-
-	if (gpio_is_valid(machine->gpio_hp_det)) {
-		tegra_rt5640_hp_jack_gpio.gpio = machine->gpio_hp_det;
-		tegra_rt5640_hp_jack_gpio.invert =
-			!!(machine->gpio_hp_det_flags & OF_GPIO_ACTIVE_LOW);
-		snd_soc_jack_add_gpios(&tegra_rt5640_hp_jack,
-						1,
-						&tegra_rt5640_hp_jack_gpio);
-	}
-
-	return 0;
-}
-
-SND_SOC_DAILINK_DEFS(aif1,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5640-aif1")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
-
-static struct snd_soc_dai_link tegra_rt5640_dai = {
-	.name = "RT5640",
-	.stream_name = "RT5640 PCM",
-	.init = tegra_rt5640_asoc_init,
-	.ops = &tegra_rt5640_ops,
-	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
-	SND_SOC_DAILINK_REG(aif1),
-};
-
-static struct snd_soc_card snd_soc_tegra_rt5640 = {
-	.name = "tegra-rt5640",
-	.driver_name = "tegra",
-	.owner = THIS_MODULE,
-	.dai_link = &tegra_rt5640_dai,
-	.num_links = 1,
-	.controls = tegra_rt5640_controls,
-	.num_controls = ARRAY_SIZE(tegra_rt5640_controls),
-	.dapm_widgets = tegra_rt5640_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(tegra_rt5640_dapm_widgets),
-	.fully_routed = true,
-};
-
-static int tegra_rt5640_probe(struct platform_device *pdev)
-{
-	struct device_node *np = pdev->dev.of_node;
-	struct snd_soc_card *card = &snd_soc_tegra_rt5640;
-	struct tegra_rt5640 *machine;
-	int ret;
-
-	machine = devm_kzalloc(&pdev->dev,
-			sizeof(struct tegra_rt5640), GFP_KERNEL);
-	if (!machine)
-		return -ENOMEM;
-
-	card->dev = &pdev->dev;
-	snd_soc_card_set_drvdata(card, machine);
-
-	machine->gpio_hp_det = of_get_named_gpio_flags(
-		np, "nvidia,hp-det-gpios", 0, &machine->gpio_hp_det_flags);
-	if (machine->gpio_hp_det == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-
-	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
-	if (ret)
-		return ret;
-
-	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
-	if (ret)
-		return ret;
-
-	tegra_rt5640_dai.codecs->of_node = of_parse_phandle(np,
-			"nvidia,audio-codec", 0);
-	if (!tegra_rt5640_dai.codecs->of_node) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,audio-codec' missing or invalid\n");
-		return -EINVAL;
-	}
-
-	tegra_rt5640_dai.cpus->of_node = of_parse_phandle(np,
-			"nvidia,i2s-controller", 0);
-	if (!tegra_rt5640_dai.cpus->of_node) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,i2s-controller' missing or invalid\n");
-		return -EINVAL;
-	}
-
-	tegra_rt5640_dai.platforms->of_node = tegra_rt5640_dai.cpus->of_node;
-
-	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "snd_soc_register_card failed\n");
-
-	return 0;
-}
-
-static const struct of_device_id tegra_rt5640_of_match[] = {
-	{ .compatible = "nvidia,tegra-audio-rt5640", },
-	{},
-};
-
-static struct platform_driver tegra_rt5640_driver = {
-	.driver = {
-		.name = DRV_NAME,
-		.pm = &snd_soc_pm_ops,
-		.of_match_table = tegra_rt5640_of_match,
-	},
-	.probe = tegra_rt5640_probe,
-};
-module_platform_driver(tegra_rt5640_driver);
-
-MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
-MODULE_DESCRIPTION("Tegra+RT5640 machine ASoC driver");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra_rt5640_of_match);
diff --git a/sound/soc/tegra/tegra_rt5677.c b/sound/soc/tegra/tegra_rt5677.c
deleted file mode 100644
index 0f03e97d9355..000000000000
--- a/sound/soc/tegra/tegra_rt5677.c
+++ /dev/null
@@ -1,325 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
-* tegra_rt5677.c - Tegra machine ASoC driver for boards using RT5677 codec.
- *
- * Copyright (c) 2014, The Chromium OS Authors.  All rights reserved.
- *
- * Based on code copyright/by:
- *
- * Copyright (C) 2010-2012 - NVIDIA, Inc.
- * Copyright (C) 2011 The AC100 Kernel Team <ac100@lists.lauchpad.net>
- * (c) 2009, 2010 Nvidia Graphics Pvt. Ltd.
- * Copyright 2007 Wolfson Microelectronics PLC.
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
-
-#include <sound/core.h>
-#include <sound/jack.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-
-#include "../codecs/rt5677.h"
-
-#include "tegra_asoc_utils.h"
-
-#define DRV_NAME "tegra-snd-rt5677"
-
-struct tegra_rt5677 {
-	struct tegra_asoc_utils_data util_data;
-	int gpio_hp_det;
-	int gpio_hp_en;
-	int gpio_mic_present;
-	int gpio_dmic_clk_en;
-};
-
-static int tegra_rt5677_asoc_hw_params(struct snd_pcm_substream *substream,
-					struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_card *card = rtd->card;
-	struct tegra_rt5677 *machine = snd_soc_card_get_drvdata(card);
-	int srate, mclk, err;
-
-	srate = params_rate(params);
-	mclk = 256 * srate;
-
-	err = tegra_asoc_utils_set_rate(&machine->util_data, srate, mclk);
-	if (err < 0) {
-		dev_err(card->dev, "Can't configure clocks\n");
-		return err;
-	}
-
-	err = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_MCLK, mclk,
-					SND_SOC_CLOCK_IN);
-	if (err < 0) {
-		dev_err(card->dev, "codec_dai clock not set\n");
-		return err;
-	}
-
-	return 0;
-}
-
-static int tegra_rt5677_event_hp(struct snd_soc_dapm_widget *w,
-			struct snd_kcontrol *k, int event)
-{
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
-	struct tegra_rt5677 *machine = snd_soc_card_get_drvdata(card);
-
-	if (!gpio_is_valid(machine->gpio_hp_en))
-		return 0;
-
-	gpio_set_value_cansleep(machine->gpio_hp_en,
-		SND_SOC_DAPM_EVENT_ON(event));
-
-	return 0;
-}
-
-static const struct snd_soc_ops tegra_rt5677_ops = {
-	.hw_params = tegra_rt5677_asoc_hw_params,
-};
-
-static struct snd_soc_jack tegra_rt5677_hp_jack;
-
-static struct snd_soc_jack_pin tegra_rt5677_hp_jack_pins = {
-	.pin = "Headphone",
-	.mask = SND_JACK_HEADPHONE,
-};
-static struct snd_soc_jack_gpio tegra_rt5677_hp_jack_gpio = {
-	.name = "Headphone detection",
-	.report = SND_JACK_HEADPHONE,
-	.debounce_time = 150,
-};
-
-static struct snd_soc_jack tegra_rt5677_mic_jack;
-
-static struct snd_soc_jack_pin tegra_rt5677_mic_jack_pins = {
-	.pin = "Headset Mic",
-	.mask = SND_JACK_MICROPHONE,
-};
-
-static struct snd_soc_jack_gpio tegra_rt5677_mic_jack_gpio = {
-	.name = "Headset Mic detection",
-	.report = SND_JACK_MICROPHONE,
-	.debounce_time = 150,
-	.invert = 1
-};
-
-static const struct snd_soc_dapm_widget tegra_rt5677_dapm_widgets[] = {
-	SND_SOC_DAPM_SPK("Speaker", NULL),
-	SND_SOC_DAPM_HP("Headphone", tegra_rt5677_event_hp),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_MIC("Internal Mic 1", NULL),
-	SND_SOC_DAPM_MIC("Internal Mic 2", NULL),
-};
-
-static const struct snd_kcontrol_new tegra_rt5677_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Speaker"),
-	SOC_DAPM_PIN_SWITCH("Headphone"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-	SOC_DAPM_PIN_SWITCH("Internal Mic 1"),
-	SOC_DAPM_PIN_SWITCH("Internal Mic 2"),
-};
-
-static int tegra_rt5677_asoc_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct tegra_rt5677 *machine = snd_soc_card_get_drvdata(rtd->card);
-
-	snd_soc_card_jack_new(rtd->card, "Headphone Jack", SND_JACK_HEADPHONE,
-			      &tegra_rt5677_hp_jack,
-			      &tegra_rt5677_hp_jack_pins, 1);
-
-	if (gpio_is_valid(machine->gpio_hp_det)) {
-		tegra_rt5677_hp_jack_gpio.gpio = machine->gpio_hp_det;
-		snd_soc_jack_add_gpios(&tegra_rt5677_hp_jack, 1,
-				&tegra_rt5677_hp_jack_gpio);
-	}
-
-
-	snd_soc_card_jack_new(rtd->card, "Mic Jack", SND_JACK_MICROPHONE,
-			      &tegra_rt5677_mic_jack,
-			      &tegra_rt5677_mic_jack_pins, 1);
-
-	if (gpio_is_valid(machine->gpio_mic_present)) {
-		tegra_rt5677_mic_jack_gpio.gpio = machine->gpio_mic_present;
-		snd_soc_jack_add_gpios(&tegra_rt5677_mic_jack, 1,
-				&tegra_rt5677_mic_jack_gpio);
-	}
-
-	snd_soc_dapm_force_enable_pin(&rtd->card->dapm, "MICBIAS1");
-
-	return 0;
-}
-
-SND_SOC_DAILINK_DEFS(pcm,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "rt5677-aif1")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
-
-static struct snd_soc_dai_link tegra_rt5677_dai = {
-	.name = "RT5677",
-	.stream_name = "RT5677 PCM",
-	.init = tegra_rt5677_asoc_init,
-	.ops = &tegra_rt5677_ops,
-	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
-	SND_SOC_DAILINK_REG(pcm),
-};
-
-static struct snd_soc_card snd_soc_tegra_rt5677 = {
-	.name = "tegra-rt5677",
-	.driver_name = "tegra",
-	.owner = THIS_MODULE,
-	.dai_link = &tegra_rt5677_dai,
-	.num_links = 1,
-	.controls = tegra_rt5677_controls,
-	.num_controls = ARRAY_SIZE(tegra_rt5677_controls),
-	.dapm_widgets = tegra_rt5677_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(tegra_rt5677_dapm_widgets),
-	.fully_routed = true,
-};
-
-static int tegra_rt5677_probe(struct platform_device *pdev)
-{
-	struct device_node *np = pdev->dev.of_node;
-	struct snd_soc_card *card = &snd_soc_tegra_rt5677;
-	struct tegra_rt5677 *machine;
-	int ret;
-
-	machine = devm_kzalloc(&pdev->dev,
-			sizeof(struct tegra_rt5677), GFP_KERNEL);
-	if (!machine)
-		return -ENOMEM;
-
-	card->dev = &pdev->dev;
-	snd_soc_card_set_drvdata(card, machine);
-
-	machine->gpio_hp_det = of_get_named_gpio(np, "nvidia,hp-det-gpios", 0);
-	if (machine->gpio_hp_det == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-
-	machine->gpio_mic_present = of_get_named_gpio(np,
-			"nvidia,mic-present-gpios", 0);
-	if (machine->gpio_mic_present == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-
-	machine->gpio_hp_en = of_get_named_gpio(np, "nvidia,hp-en-gpios", 0);
-	if (machine->gpio_hp_en == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-	if (gpio_is_valid(machine->gpio_hp_en)) {
-		ret = devm_gpio_request_one(&pdev->dev, machine->gpio_hp_en,
-				GPIOF_OUT_INIT_LOW, "hp_en");
-		if (ret) {
-			dev_err(card->dev, "cannot get hp_en gpio\n");
-			return ret;
-		}
-	}
-
-	machine->gpio_dmic_clk_en = of_get_named_gpio(np,
-		"nvidia,dmic-clk-en-gpios", 0);
-	if (machine->gpio_dmic_clk_en == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-	if (gpio_is_valid(machine->gpio_dmic_clk_en)) {
-		ret = devm_gpio_request_one(&pdev->dev,
-				machine->gpio_dmic_clk_en,
-				GPIOF_OUT_INIT_HIGH, "dmic_clk_en");
-		if (ret) {
-			dev_err(card->dev, "cannot get dmic_clk_en gpio\n");
-			return ret;
-		}
-	}
-
-	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
-	if (ret)
-		goto err;
-
-	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
-	if (ret)
-		goto err;
-
-	tegra_rt5677_dai.codecs->of_node = of_parse_phandle(np,
-			"nvidia,audio-codec", 0);
-	if (!tegra_rt5677_dai.codecs->of_node) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,audio-codec' missing or invalid\n");
-		ret = -EINVAL;
-		goto err;
-	}
-
-	tegra_rt5677_dai.cpus->of_node = of_parse_phandle(np,
-			"nvidia,i2s-controller", 0);
-	if (!tegra_rt5677_dai.cpus->of_node) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,i2s-controller' missing or invalid\n");
-		ret = -EINVAL;
-		goto err_put_codec_of_node;
-	}
-	tegra_rt5677_dai.platforms->of_node = tegra_rt5677_dai.cpus->of_node;
-
-	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
-	if (ret)
-		goto err_put_cpu_of_node;
-
-	ret = snd_soc_register_card(card);
-	if (ret) {
-		dev_err_probe(&pdev->dev, ret,
-			      "snd_soc_register_card failed\n");
-		goto err_put_cpu_of_node;
-	}
-
-	return 0;
-
-err_put_cpu_of_node:
-	of_node_put(tegra_rt5677_dai.cpus->of_node);
-	tegra_rt5677_dai.cpus->of_node = NULL;
-	tegra_rt5677_dai.platforms->of_node = NULL;
-err_put_codec_of_node:
-	of_node_put(tegra_rt5677_dai.codecs->of_node);
-	tegra_rt5677_dai.codecs->of_node = NULL;
-err:
-	return ret;
-}
-
-static int tegra_rt5677_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-
-	snd_soc_unregister_card(card);
-
-	tegra_rt5677_dai.platforms->of_node = NULL;
-	of_node_put(tegra_rt5677_dai.codecs->of_node);
-	tegra_rt5677_dai.codecs->of_node = NULL;
-	of_node_put(tegra_rt5677_dai.cpus->of_node);
-	tegra_rt5677_dai.cpus->of_node = NULL;
-
-	return 0;
-}
-
-static const struct of_device_id tegra_rt5677_of_match[] = {
-	{ .compatible = "nvidia,tegra-audio-rt5677", },
-	{},
-};
-
-static struct platform_driver tegra_rt5677_driver = {
-	.driver = {
-		.name = DRV_NAME,
-		.pm = &snd_soc_pm_ops,
-		.of_match_table = tegra_rt5677_of_match,
-	},
-	.probe = tegra_rt5677_probe,
-	.remove = tegra_rt5677_remove,
-};
-module_platform_driver(tegra_rt5677_driver);
-
-MODULE_AUTHOR("Anatol Pomozov <anatol@google.com>");
-MODULE_DESCRIPTION("Tegra+RT5677 machine ASoC driver");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra_rt5677_of_match);
diff --git a/sound/soc/tegra/tegra_sgtl5000.c b/sound/soc/tegra/tegra_sgtl5000.c
deleted file mode 100644
index ef6a553e0b7d..000000000000
--- a/sound/soc/tegra/tegra_sgtl5000.c
+++ /dev/null
@@ -1,212 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * tegra_sgtl5000.c - Tegra machine ASoC driver for boards using SGTL5000 codec
- *
- * Author: Marcel Ziswiler <marcel@ziswiler.com>
- *
- * Based on code copyright/by:
- *
- * Copyright (C) 2010-2012 - NVIDIA, Inc.
- * (c) 2009, 2010 Nvidia Graphics Pvt. Ltd.
- * Copyright 2007 Wolfson Microelectronics PLC.
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
-
-#include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-
-#include "../codecs/sgtl5000.h"
-
-#include "tegra_asoc_utils.h"
-
-#define DRV_NAME "tegra-snd-sgtl5000"
-
-struct tegra_sgtl5000 {
-	struct tegra_asoc_utils_data util_data;
-};
-
-static int tegra_sgtl5000_hw_params(struct snd_pcm_substream *substream,
-					struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_card *card = rtd->card;
-	struct tegra_sgtl5000 *machine = snd_soc_card_get_drvdata(card);
-	int srate, mclk;
-	int err;
-
-	srate = params_rate(params);
-	switch (srate) {
-	case 11025:
-	case 22050:
-	case 44100:
-	case 88200:
-		mclk = 11289600;
-		break;
-	default:
-		mclk = 12288000;
-		break;
-	}
-
-	err = tegra_asoc_utils_set_rate(&machine->util_data, srate, mclk);
-	if (err < 0) {
-		dev_err(card->dev, "Can't configure clocks\n");
-		return err;
-	}
-
-	err = snd_soc_dai_set_sysclk(codec_dai, SGTL5000_SYSCLK, mclk,
-				     SND_SOC_CLOCK_IN);
-	if (err < 0) {
-		dev_err(card->dev, "codec_dai clock not set\n");
-		return err;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops tegra_sgtl5000_ops = {
-	.hw_params = tegra_sgtl5000_hw_params,
-};
-
-static const struct snd_soc_dapm_widget tegra_sgtl5000_dapm_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
-	SND_SOC_DAPM_LINE("Line In Jack", NULL),
-	SND_SOC_DAPM_MIC("Mic Jack", NULL),
-};
-
-SND_SOC_DAILINK_DEFS(hifi,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "sgtl5000")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
-
-static struct snd_soc_dai_link tegra_sgtl5000_dai = {
-	.name = "sgtl5000",
-	.stream_name = "HiFi",
-	.ops = &tegra_sgtl5000_ops,
-	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
-	SND_SOC_DAILINK_REG(hifi),
-};
-
-static struct snd_soc_card snd_soc_tegra_sgtl5000 = {
-	.name = "tegra-sgtl5000",
-	.driver_name = "tegra",
-	.owner = THIS_MODULE,
-	.dai_link = &tegra_sgtl5000_dai,
-	.num_links = 1,
-	.dapm_widgets = tegra_sgtl5000_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(tegra_sgtl5000_dapm_widgets),
-	.fully_routed = true,
-};
-
-static int tegra_sgtl5000_driver_probe(struct platform_device *pdev)
-{
-	struct device_node *np = pdev->dev.of_node;
-	struct snd_soc_card *card = &snd_soc_tegra_sgtl5000;
-	struct tegra_sgtl5000 *machine;
-	int ret;
-
-	machine = devm_kzalloc(&pdev->dev, sizeof(struct tegra_sgtl5000),
-			       GFP_KERNEL);
-	if (!machine)
-		return -ENOMEM;
-
-	card->dev = &pdev->dev;
-	snd_soc_card_set_drvdata(card, machine);
-
-	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
-	if (ret)
-		goto err;
-
-	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
-	if (ret)
-		goto err;
-
-	tegra_sgtl5000_dai.codecs->of_node = of_parse_phandle(np,
-			"nvidia,audio-codec", 0);
-	if (!tegra_sgtl5000_dai.codecs->of_node) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,audio-codec' missing or invalid\n");
-		ret = -EINVAL;
-		goto err;
-	}
-
-	tegra_sgtl5000_dai.cpus->of_node = of_parse_phandle(np,
-			"nvidia,i2s-controller", 0);
-	if (!tegra_sgtl5000_dai.cpus->of_node) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,i2s-controller' missing/invalid\n");
-		ret = -EINVAL;
-		goto err_put_codec_of_node;
-	}
-
-	tegra_sgtl5000_dai.platforms->of_node = tegra_sgtl5000_dai.cpus->of_node;
-
-	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
-	if (ret)
-		goto err_put_cpu_of_node;
-
-	ret = snd_soc_register_card(card);
-	if (ret) {
-		dev_err_probe(&pdev->dev, ret,
-			      "snd_soc_register_card failed\n");
-		goto err_put_cpu_of_node;
-	}
-
-	return 0;
-
-err_put_cpu_of_node:
-	of_node_put(tegra_sgtl5000_dai.cpus->of_node);
-	tegra_sgtl5000_dai.cpus->of_node = NULL;
-	tegra_sgtl5000_dai.platforms->of_node = NULL;
-err_put_codec_of_node:
-	of_node_put(tegra_sgtl5000_dai.codecs->of_node);
-	tegra_sgtl5000_dai.codecs->of_node = NULL;
-err:
-	return ret;
-}
-
-static int tegra_sgtl5000_driver_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	int ret;
-
-	ret = snd_soc_unregister_card(card);
-
-	of_node_put(tegra_sgtl5000_dai.cpus->of_node);
-	tegra_sgtl5000_dai.cpus->of_node = NULL;
-	tegra_sgtl5000_dai.platforms->of_node = NULL;
-	of_node_put(tegra_sgtl5000_dai.codecs->of_node);
-	tegra_sgtl5000_dai.codecs->of_node = NULL;
-
-	return ret;
-}
-
-static const struct of_device_id tegra_sgtl5000_of_match[] = {
-	{ .compatible = "nvidia,tegra-audio-sgtl5000", },
-	{ /* sentinel */ },
-};
-
-static struct platform_driver tegra_sgtl5000_driver = {
-	.driver = {
-		.name = DRV_NAME,
-		.pm = &snd_soc_pm_ops,
-		.of_match_table = tegra_sgtl5000_of_match,
-	},
-	.probe = tegra_sgtl5000_driver_probe,
-	.remove = tegra_sgtl5000_driver_remove,
-};
-module_platform_driver(tegra_sgtl5000_driver);
-
-MODULE_AUTHOR("Marcel Ziswiler <marcel@ziswiler.com>");
-MODULE_DESCRIPTION("Tegra SGTL5000 machine ASoC driver");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra_sgtl5000_of_match);
diff --git a/sound/soc/tegra/tegra_wm8753.c b/sound/soc/tegra/tegra_wm8753.c
deleted file mode 100644
index 27089077f2ea..000000000000
--- a/sound/soc/tegra/tegra_wm8753.c
+++ /dev/null
@@ -1,186 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * tegra_wm8753.c - Tegra machine ASoC driver for boards using WM8753 codec.
- *
- * Author: Stephen Warren <swarren@nvidia.com>
- * Copyright (C) 2010-2012 - NVIDIA, Inc.
- *
- * Based on code copyright/by:
- *
- * (c) 2009, 2010 Nvidia Graphics Pvt. Ltd.
- *
- * Copyright 2007 Wolfson Microelectronics PLC.
- * Author: Graeme Gregory
- *         graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
-
-#include <sound/core.h>
-#include <sound/jack.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-
-#include "../codecs/wm8753.h"
-
-#include "tegra_asoc_utils.h"
-
-#define DRV_NAME "tegra-snd-wm8753"
-
-struct tegra_wm8753 {
-	struct tegra_asoc_utils_data util_data;
-};
-
-static int tegra_wm8753_hw_params(struct snd_pcm_substream *substream,
-					struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_card *card = rtd->card;
-	struct tegra_wm8753 *machine = snd_soc_card_get_drvdata(card);
-	int srate, mclk;
-	int err;
-
-	srate = params_rate(params);
-	switch (srate) {
-	case 11025:
-	case 22050:
-	case 44100:
-	case 88200:
-		mclk = 11289600;
-		break;
-	default:
-		mclk = 12288000;
-		break;
-	}
-
-	err = tegra_asoc_utils_set_rate(&machine->util_data, srate, mclk);
-	if (err < 0) {
-		dev_err(card->dev, "Can't configure clocks\n");
-		return err;
-	}
-
-	err = snd_soc_dai_set_sysclk(codec_dai, WM8753_MCLK, mclk,
-					SND_SOC_CLOCK_IN);
-	if (err < 0) {
-		dev_err(card->dev, "codec_dai clock not set\n");
-		return err;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops tegra_wm8753_ops = {
-	.hw_params = tegra_wm8753_hw_params,
-};
-
-static const struct snd_soc_dapm_widget tegra_wm8753_dapm_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone Jack", NULL),
-	SND_SOC_DAPM_MIC("Mic Jack", NULL),
-};
-
-SND_SOC_DAILINK_DEFS(pcm,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8753-hifi")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
-
-static struct snd_soc_dai_link tegra_wm8753_dai = {
-	.name = "WM8753",
-	.stream_name = "WM8753 PCM",
-	.ops = &tegra_wm8753_ops,
-	.dai_fmt = SND_SOC_DAIFMT_I2S |
-			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
-	SND_SOC_DAILINK_REG(pcm),
-};
-
-static struct snd_soc_card snd_soc_tegra_wm8753 = {
-	.name = "tegra-wm8753",
-	.driver_name = "tegra",
-	.owner = THIS_MODULE,
-	.dai_link = &tegra_wm8753_dai,
-	.num_links = 1,
-
-	.dapm_widgets = tegra_wm8753_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(tegra_wm8753_dapm_widgets),
-	.fully_routed = true,
-};
-
-static int tegra_wm8753_driver_probe(struct platform_device *pdev)
-{
-	struct device_node *np = pdev->dev.of_node;
-	struct snd_soc_card *card = &snd_soc_tegra_wm8753;
-	struct tegra_wm8753 *machine;
-	int ret;
-
-	machine = devm_kzalloc(&pdev->dev, sizeof(struct tegra_wm8753),
-			       GFP_KERNEL);
-	if (!machine)
-		return -ENOMEM;
-
-	card->dev = &pdev->dev;
-	snd_soc_card_set_drvdata(card, machine);
-
-	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
-	if (ret)
-		return ret;
-
-	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
-	if (ret)
-		return ret;
-
-	tegra_wm8753_dai.codecs->of_node = of_parse_phandle(np,
-			"nvidia,audio-codec", 0);
-	if (!tegra_wm8753_dai.codecs->of_node) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,audio-codec' missing or invalid\n");
-		return -EINVAL;
-	}
-
-	tegra_wm8753_dai.cpus->of_node = of_parse_phandle(np,
-			"nvidia,i2s-controller", 0);
-	if (!tegra_wm8753_dai.cpus->of_node) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,i2s-controller' missing or invalid\n");
-		return -EINVAL;
-	}
-
-	tegra_wm8753_dai.platforms->of_node = tegra_wm8753_dai.cpus->of_node;
-
-	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "snd_soc_register_card failed\n");
-
-	return 0;
-}
-
-static const struct of_device_id tegra_wm8753_of_match[] = {
-	{ .compatible = "nvidia,tegra-audio-wm8753", },
-	{},
-};
-
-static struct platform_driver tegra_wm8753_driver = {
-	.driver = {
-		.name = DRV_NAME,
-		.pm = &snd_soc_pm_ops,
-		.of_match_table = tegra_wm8753_of_match,
-	},
-	.probe = tegra_wm8753_driver_probe,
-};
-module_platform_driver(tegra_wm8753_driver);
-
-MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
-MODULE_DESCRIPTION("Tegra+WM8753 machine ASoC driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra_wm8753_of_match);
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index f219c26d66a3..a3ec1f50bcb8 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -14,192 +14,67 @@
  *         graeme.gregory@wolfsonmicro.com or linux@wolfsonmicro.com
  */
 
+#include <linux/gpio/consumer.h>
+#include <linux/of.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 
 #include <sound/core.h>
 #include <sound/jack.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
 #include <sound/soc.h>
 
 #include "../codecs/wm8903.h"
 
-#include "tegra_asoc_utils.h"
+#include "tegra_asoc_machine.h"
 
-#define DRV_NAME "tegra-snd-wm8903"
-
-struct tegra_wm8903 {
-	int gpio_spkr_en;
-	int gpio_hp_det;
-	int gpio_hp_mute;
-	int gpio_int_mic_en;
-	int gpio_ext_mic_en;
-	struct tegra_asoc_utils_data util_data;
+static struct snd_soc_jack_pin tegra_wm8903_mic_jack_pins[] = {
+	{ .pin = "Mic Jack", .mask = SND_JACK_MICROPHONE },
 };
 
-static int tegra_wm8903_hw_params(struct snd_pcm_substream *substream,
-					struct snd_pcm_hw_params *params)
+static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct tegra_machine *machine = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_card *card = rtd->card;
-	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
-	int srate, mclk;
 	int err;
 
-	srate = params_rate(params);
-	switch (srate) {
-	case 64000:
-	case 88200:
-	case 96000:
-		mclk = 128 * srate;
-		break;
-	default:
-		mclk = 256 * srate;
-		break;
-	}
-	/* FIXME: Codec only requires >= 3MHz if OSR==0 */
-	while (mclk < 6000000)
-		mclk *= 2;
+	/*
+	 * Older version of machine driver was ignoring GPIO polarity,
+	 * forcing it to active-low.  This means that all older device-trees
+	 * which set the polarity to active-high are wrong and we need to fix
+	 * them up.
+	 */
+	if (machine->asoc->hp_jack_gpio_active_low) {
+		bool active_low = gpiod_is_active_low(machine->gpiod_hp_det);
 
-	err = tegra_asoc_utils_set_rate(&machine->util_data, srate, mclk);
-	if (err < 0) {
-		dev_err(card->dev, "Can't configure clocks\n");
-		return err;
+		machine->hp_jack_gpio->invert = !active_low;
 	}
 
-	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
-					SND_SOC_CLOCK_IN);
-	if (err < 0) {
-		dev_err(card->dev, "codec_dai clock not set\n");
+	err = tegra_asoc_machine_init(rtd);
+	if (err)
 		return err;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops tegra_wm8903_ops = {
-	.hw_params = tegra_wm8903_hw_params,
-};
-
-static struct snd_soc_jack tegra_wm8903_hp_jack;
-
-static struct snd_soc_jack_pin tegra_wm8903_hp_jack_pins[] = {
-	{
-		.pin = "Headphone Jack",
-		.mask = SND_JACK_HEADPHONE,
-	},
-};
-
-static struct snd_soc_jack_gpio tegra_wm8903_hp_jack_gpio = {
-	.name = "headphone detect",
-	.report = SND_JACK_HEADPHONE,
-	.debounce_time = 150,
-	.invert = 1,
-};
-
-static struct snd_soc_jack tegra_wm8903_mic_jack;
-
-static struct snd_soc_jack_pin tegra_wm8903_mic_jack_pins[] = {
-	{
-		.pin = "Mic Jack",
-		.mask = SND_JACK_MICROPHONE,
-	},
-};
-
-static int tegra_wm8903_event_int_spk(struct snd_soc_dapm_widget *w,
-					struct snd_kcontrol *k, int event)
-{
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
-	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
-
-	if (!gpio_is_valid(machine->gpio_spkr_en))
-		return 0;
-
-	gpio_set_value_cansleep(machine->gpio_spkr_en,
-				SND_SOC_DAPM_EVENT_ON(event));
-
-	return 0;
-}
-
-static int tegra_wm8903_event_hp(struct snd_soc_dapm_widget *w,
-					struct snd_kcontrol *k, int event)
-{
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
-	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
-
-	if (!gpio_is_valid(machine->gpio_hp_mute))
-		return 0;
-
-	gpio_set_value_cansleep(machine->gpio_hp_mute,
-				!SND_SOC_DAPM_EVENT_ON(event));
-
-	return 0;
-}
-
-static int tegra_wm8903_event_int_mic(struct snd_soc_dapm_widget *w,
-				      struct snd_kcontrol *k, int event)
-{
-	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct snd_soc_card *card = dapm->card;
-	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
-
-	if (!gpio_is_valid(machine->gpio_int_mic_en))
-		return 0;
-
-	gpio_set_value_cansleep(machine->gpio_int_mic_en,
-				SND_SOC_DAPM_EVENT_ON(event));
-
-	return 0;
-}
 
-static const struct snd_soc_dapm_widget tegra_wm8903_dapm_widgets[] = {
-	SND_SOC_DAPM_SPK("Int Spk", tegra_wm8903_event_int_spk),
-	SND_SOC_DAPM_HP("Headphone Jack", tegra_wm8903_event_hp),
-	SND_SOC_DAPM_MIC("Mic Jack", NULL),
-	SND_SOC_DAPM_MIC("Int Mic", tegra_wm8903_event_int_mic),
-};
+	if (!machine->gpiod_mic_det && machine->asoc->add_mic_jack) {
+		struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+		struct snd_soc_component *component = codec_dai->component;
+		int shrt = 0;
+
+		err = snd_soc_card_jack_new(rtd->card, "Mic Jack",
+					    SND_JACK_MICROPHONE,
+					    machine->mic_jack,
+					    tegra_wm8903_mic_jack_pins,
+					    ARRAY_SIZE(tegra_wm8903_mic_jack_pins));
+		if (err) {
+			dev_err(rtd->dev, "Mic Jack creation failed: %d\n", err);
+			return err;
+		}
 
-static const struct snd_kcontrol_new tegra_wm8903_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Int Spk"),
-	SOC_DAPM_PIN_SWITCH("Int Mic"),
-};
+		if (of_property_read_bool(card->dev->of_node, "nvidia,headset"))
+			shrt = SND_JACK_MICROPHONE;
 
-static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_component *component = codec_dai->component;
-	struct snd_soc_card *card = rtd->card;
-	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
-	int shrt = 0;
-
-	if (gpio_is_valid(machine->gpio_hp_det)) {
-		tegra_wm8903_hp_jack_gpio.gpio = machine->gpio_hp_det;
-		snd_soc_card_jack_new(rtd->card, "Headphone Jack",
-				      SND_JACK_HEADPHONE, &tegra_wm8903_hp_jack,
-				      tegra_wm8903_hp_jack_pins,
-				      ARRAY_SIZE(tegra_wm8903_hp_jack_pins));
-		snd_soc_jack_add_gpios(&tegra_wm8903_hp_jack,
-					1,
-					&tegra_wm8903_hp_jack_gpio);
+		wm8903_mic_detect(component, machine->mic_jack,
+				  SND_JACK_MICROPHONE, shrt);
 	}
 
-	if (of_property_read_bool(card->dev->of_node, "nvidia,headset"))
-		shrt = SND_JACK_MICROPHONE;
-
-	snd_soc_card_jack_new(rtd->card, "Mic Jack", SND_JACK_MICROPHONE,
-			      &tegra_wm8903_mic_jack,
-			      tegra_wm8903_mic_jack_pins,
-			      ARRAY_SIZE(tegra_wm8903_mic_jack_pins));
-	wm8903_mic_detect(component, &tegra_wm8903_mic_jack, SND_JACK_MICROPHONE,
-				shrt);
-
 	snd_soc_dapm_force_enable_pin(&card->dapm, "MICBIAS");
 
 	return 0;
@@ -207,8 +82,8 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 
 static int tegra_wm8903_remove(struct snd_soc_card *card)
 {
-	struct snd_soc_pcm_runtime *rtd =
-		snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
+	struct snd_soc_dai_link *link = &card->dai_link[0];
+	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card, link);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 
@@ -226,7 +101,6 @@ static struct snd_soc_dai_link tegra_wm8903_dai = {
 	.name = "WM8903",
 	.stream_name = "WM8903 PCM",
 	.init = tegra_wm8903_init,
-	.ops = &tegra_wm8903_ops,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBS_CFS,
@@ -234,149 +108,59 @@ static struct snd_soc_dai_link tegra_wm8903_dai = {
 };
 
 static struct snd_soc_card snd_soc_tegra_wm8903 = {
-	.name = "tegra-wm8903",
-	.driver_name = "tegra",
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_wm8903_dai,
 	.num_links = 1,
 	.remove = tegra_wm8903_remove,
-	.controls = tegra_wm8903_controls,
-	.num_controls = ARRAY_SIZE(tegra_wm8903_controls),
-	.dapm_widgets = tegra_wm8903_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(tegra_wm8903_dapm_widgets),
 	.fully_routed = true,
 };
 
-static int tegra_wm8903_driver_probe(struct platform_device *pdev)
-{
-	struct device_node *np = pdev->dev.of_node;
-	struct snd_soc_card *card = &snd_soc_tegra_wm8903;
-	struct tegra_wm8903 *machine;
-	int ret;
-
-	machine = devm_kzalloc(&pdev->dev, sizeof(struct tegra_wm8903),
-			       GFP_KERNEL);
-	if (!machine)
-		return -ENOMEM;
-
-	card->dev = &pdev->dev;
-	snd_soc_card_set_drvdata(card, machine);
-
-	machine->gpio_spkr_en = of_get_named_gpio(np, "nvidia,spkr-en-gpios",
-						  0);
-	if (machine->gpio_spkr_en == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-	if (gpio_is_valid(machine->gpio_spkr_en)) {
-		ret = devm_gpio_request_one(&pdev->dev, machine->gpio_spkr_en,
-					    GPIOF_OUT_INIT_LOW, "spkr_en");
-		if (ret) {
-			dev_err(card->dev, "cannot get spkr_en gpio\n");
-			return ret;
-		}
-	}
-
-	machine->gpio_hp_mute = of_get_named_gpio(np, "nvidia,hp-mute-gpios",
-						  0);
-	if (machine->gpio_hp_mute == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-	if (gpio_is_valid(machine->gpio_hp_mute)) {
-		ret = devm_gpio_request_one(&pdev->dev, machine->gpio_hp_mute,
-					    GPIOF_OUT_INIT_HIGH, "hp_mute");
-		if (ret) {
-			dev_err(card->dev, "cannot get hp_mute gpio\n");
-			return ret;
-		}
-	}
-
-	machine->gpio_hp_det = of_get_named_gpio(np, "nvidia,hp-det-gpios", 0);
-	if (machine->gpio_hp_det == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-
-	machine->gpio_int_mic_en = of_get_named_gpio(np,
-						"nvidia,int-mic-en-gpios", 0);
-	if (machine->gpio_int_mic_en == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-	if (gpio_is_valid(machine->gpio_int_mic_en)) {
-		/* Disable int mic; enable signal is active-high */
-		ret = devm_gpio_request_one(&pdev->dev,
-					    machine->gpio_int_mic_en,
-					    GPIOF_OUT_INIT_LOW, "int_mic_en");
-		if (ret) {
-			dev_err(card->dev, "cannot get int_mic_en gpio\n");
-			return ret;
-		}
-	}
-
-	machine->gpio_ext_mic_en = of_get_named_gpio(np,
-						"nvidia,ext-mic-en-gpios", 0);
-	if (machine->gpio_ext_mic_en == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
-	if (gpio_is_valid(machine->gpio_ext_mic_en)) {
-		/* Enable ext mic; enable signal is active-low */
-		ret = devm_gpio_request_one(&pdev->dev,
-					    machine->gpio_ext_mic_en,
-					    GPIOF_OUT_INIT_LOW, "ext_mic_en");
-		if (ret) {
-			dev_err(card->dev, "cannot get ext_mic_en gpio\n");
-			return ret;
-		}
-	}
-
-	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
-	if (ret)
-		return ret;
-
-	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
-	if (ret)
-		return ret;
-
-	tegra_wm8903_dai.codecs->of_node = of_parse_phandle(np,
-						"nvidia,audio-codec", 0);
-	if (!tegra_wm8903_dai.codecs->of_node) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,audio-codec' missing or invalid\n");
-		return -EINVAL;
-	}
-
-	tegra_wm8903_dai.cpus->of_node = of_parse_phandle(np,
-			"nvidia,i2s-controller", 0);
-	if (!tegra_wm8903_dai.cpus->of_node) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,i2s-controller' missing or invalid\n");
-		return -EINVAL;
-	}
-
-	tegra_wm8903_dai.platforms->of_node = tegra_wm8903_dai.cpus->of_node;
-
-	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "snd_soc_register_card failed\n");
+/* older device-trees used wrong polarity for the headphone GPIO */
+static const struct tegra_asoc_data tegra_wm8903_data_legacy = {
+	.mclk_rate = tegra_asoc_machine_mclk_rate_128_256,
+	.card = &snd_soc_tegra_wm8903,
+	.hp_jack_gpio_active_low = true,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+	.add_mic_jack = true,
+	.add_hp_jack = true,
+};
 
-	return 0;
-}
+static const struct tegra_asoc_data tegra_wm8903_data = {
+	.mclk_rate = tegra_asoc_machine_mclk_rate_128_256,
+	.card = &snd_soc_tegra_wm8903,
+	.add_common_dapm_widgets = true,
+	.add_common_controls = true,
+	.add_common_snd_ops = true,
+	.add_mic_jack = true,
+	.add_hp_jack = true,
+};
 
 static const struct of_device_id tegra_wm8903_of_match[] = {
-	{ .compatible = "nvidia,tegra-audio-wm8903", },
+	{ .compatible = "ad,tegra-audio-plutux", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "ad,tegra-audio-wm8903-medcom-wide", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "ad,tegra-audio-wm8903-tec", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "nvidia,tegra-audio-wm8903-cardhu", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "nvidia,tegra-audio-wm8903-harmony", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "nvidia,tegra-audio-wm8903-picasso", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "nvidia,tegra-audio-wm8903-seaboard", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "nvidia,tegra-audio-wm8903-ventana", .data = &tegra_wm8903_data_legacy },
+	{ .compatible = "nvidia,tegra-audio-wm8903", .data = &tegra_wm8903_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, tegra_wm8903_of_match);
 
 static struct platform_driver tegra_wm8903_driver = {
 	.driver = {
-		.name = DRV_NAME,
-		.pm = &snd_soc_pm_ops,
+		.name = "tegra-wm8903",
 		.of_match_table = tegra_wm8903_of_match,
+		.pm = &snd_soc_pm_ops,
 	},
-	.probe = tegra_wm8903_driver_probe,
+	.probe = tegra_asoc_machine_probe,
 };
 module_platform_driver(tegra_wm8903_driver);
 
 MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
 MODULE_DESCRIPTION("Tegra+WM8903 machine ASoC driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra_wm8903_of_match);
diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9712.c
deleted file mode 100644
index c66da161c85a..000000000000
--- a/sound/soc/tegra/tegra_wm9712.c
+++ /dev/null
@@ -1,167 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * tegra20_wm9712.c - Tegra machine ASoC driver for boards using WM9712 codec.
- *
- * Copyright 2012 Lucas Stach <dev@lynxeye.de>
- *
- * Partly based on code copyright/by:
- * Copyright 2011,2012 Toradex Inc.
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
-
-#include <sound/core.h>
-#include <sound/jack.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-
-#include "tegra_asoc_utils.h"
-
-#define DRV_NAME "tegra-snd-wm9712"
-
-struct tegra_wm9712 {
-	struct platform_device *codec;
-	struct tegra_asoc_utils_data util_data;
-};
-
-static const struct snd_soc_dapm_widget tegra_wm9712_dapm_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone", NULL),
-	SND_SOC_DAPM_LINE("LineIn", NULL),
-	SND_SOC_DAPM_MIC("Mic", NULL),
-};
-
-static int tegra_wm9712_init(struct snd_soc_pcm_runtime *rtd)
-{
-	return snd_soc_dapm_force_enable_pin(&rtd->card->dapm, "Mic Bias");
-}
-
-SND_SOC_DAILINK_DEFS(hifi,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC("wm9712-codec", "wm9712-hifi")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
-
-static struct snd_soc_dai_link tegra_wm9712_dai = {
-	.name = "AC97 HiFi",
-	.stream_name = "AC97 HiFi",
-	.init = tegra_wm9712_init,
-	SND_SOC_DAILINK_REG(hifi),
-};
-
-static struct snd_soc_card snd_soc_tegra_wm9712 = {
-	.name = "tegra-wm9712",
-	.driver_name = "tegra",
-	.owner = THIS_MODULE,
-	.dai_link = &tegra_wm9712_dai,
-	.num_links = 1,
-
-	.dapm_widgets = tegra_wm9712_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(tegra_wm9712_dapm_widgets),
-	.fully_routed = true,
-};
-
-static int tegra_wm9712_driver_probe(struct platform_device *pdev)
-{
-	struct device_node *np = pdev->dev.of_node;
-	struct snd_soc_card *card = &snd_soc_tegra_wm9712;
-	struct tegra_wm9712 *machine;
-	int ret;
-
-	machine = devm_kzalloc(&pdev->dev, sizeof(struct tegra_wm9712),
-			       GFP_KERNEL);
-	if (!machine)
-		return -ENOMEM;
-
-	card->dev = &pdev->dev;
-	snd_soc_card_set_drvdata(card, machine);
-
-	machine->codec = platform_device_alloc("wm9712-codec", -1);
-	if (!machine->codec) {
-		dev_err(&pdev->dev, "Can't allocate wm9712 platform device\n");
-		return -ENOMEM;
-	}
-
-	ret = platform_device_add(machine->codec);
-	if (ret)
-		goto codec_put;
-
-	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
-	if (ret)
-		goto codec_unregister;
-
-	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
-	if (ret)
-		goto codec_unregister;
-
-	tegra_wm9712_dai.cpus->of_node = of_parse_phandle(np,
-				       "nvidia,ac97-controller", 0);
-	if (!tegra_wm9712_dai.cpus->of_node) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,ac97-controller' missing or invalid\n");
-		ret = -EINVAL;
-		goto codec_unregister;
-	}
-
-	tegra_wm9712_dai.platforms->of_node = tegra_wm9712_dai.cpus->of_node;
-
-	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
-	if (ret)
-		goto codec_unregister;
-
-	ret = tegra_asoc_utils_set_ac97_rate(&machine->util_data);
-	if (ret)
-		goto codec_unregister;
-
-	ret = snd_soc_register_card(card);
-	if (ret) {
-		dev_err_probe(&pdev->dev, ret,
-			      "snd_soc_register_card failed\n");
-		goto codec_unregister;
-	}
-
-	return 0;
-
-codec_unregister:
-	platform_device_del(machine->codec);
-codec_put:
-	platform_device_put(machine->codec);
-	return ret;
-}
-
-static int tegra_wm9712_driver_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct tegra_wm9712 *machine = snd_soc_card_get_drvdata(card);
-
-	snd_soc_unregister_card(card);
-
-	platform_device_unregister(machine->codec);
-
-	return 0;
-}
-
-static const struct of_device_id tegra_wm9712_of_match[] = {
-	{ .compatible = "nvidia,tegra-audio-wm9712", },
-	{},
-};
-
-static struct platform_driver tegra_wm9712_driver = {
-	.driver = {
-		.name = DRV_NAME,
-		.pm = &snd_soc_pm_ops,
-		.of_match_table = tegra_wm9712_of_match,
-	},
-	.probe = tegra_wm9712_driver_probe,
-	.remove = tegra_wm9712_driver_remove,
-};
-module_platform_driver(tegra_wm9712_driver);
-
-MODULE_AUTHOR("Lucas Stach");
-MODULE_DESCRIPTION("Tegra+WM9712 machine ASoC driver");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, tegra_wm9712_of_match);
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
deleted file mode 100644
index cb4c8f72e4e6..000000000000
--- a/sound/soc/tegra/trimslice.c
+++ /dev/null
@@ -1,173 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * trimslice.c - TrimSlice machine ASoC driver
- *
- * Copyright (C) 2011 - CompuLab, Ltd.
- * Author: Mike Rapoport <mike@compulab.co.il>
- *
- * Based on code copyright/by:
- * Author: Stephen Warren <swarren@nvidia.com>
- * Copyright (C) 2010-2011 - NVIDIA, Inc.
- */
-
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-
-#include <sound/core.h>
-#include <sound/jack.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-
-#include "../codecs/tlv320aic23.h"
-
-#include "tegra_asoc_utils.h"
-
-#define DRV_NAME "tegra-snd-trimslice"
-
-struct tegra_trimslice {
-	struct tegra_asoc_utils_data util_data;
-};
-
-static int trimslice_asoc_hw_params(struct snd_pcm_substream *substream,
-					struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_card *card = rtd->card;
-	struct tegra_trimslice *trimslice = snd_soc_card_get_drvdata(card);
-	int srate, mclk;
-	int err;
-
-	srate = params_rate(params);
-	mclk = 128 * srate;
-
-	err = tegra_asoc_utils_set_rate(&trimslice->util_data, srate, mclk);
-	if (err < 0) {
-		dev_err(card->dev, "Can't configure clocks\n");
-		return err;
-	}
-
-	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
-					SND_SOC_CLOCK_IN);
-	if (err < 0) {
-		dev_err(card->dev, "codec_dai clock not set\n");
-		return err;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops trimslice_asoc_ops = {
-	.hw_params = trimslice_asoc_hw_params,
-};
-
-static const struct snd_soc_dapm_widget trimslice_dapm_widgets[] = {
-	SND_SOC_DAPM_HP("Line Out", NULL),
-	SND_SOC_DAPM_LINE("Line In", NULL),
-};
-
-static const struct snd_soc_dapm_route trimslice_audio_map[] = {
-	{"Line Out", NULL, "LOUT"},
-	{"Line Out", NULL, "ROUT"},
-
-	{"LLINEIN", NULL, "Line In"},
-	{"RLINEIN", NULL, "Line In"},
-};
-
-SND_SOC_DAILINK_DEFS(single_dsp,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "tlv320aic23-hifi")),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
-
-static struct snd_soc_dai_link trimslice_tlv320aic23_dai = {
-	.name = "TLV320AIC23",
-	.stream_name = "AIC23",
-	.ops = &trimslice_asoc_ops,
-	.dai_fmt = SND_SOC_DAIFMT_I2S |
-		   SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBS_CFS,
-	SND_SOC_DAILINK_REG(single_dsp),
-};
-
-static struct snd_soc_card snd_soc_trimslice = {
-	.name = "tegra-trimslice",
-	.driver_name = "tegra",
-	.owner = THIS_MODULE,
-	.dai_link = &trimslice_tlv320aic23_dai,
-	.num_links = 1,
-
-	.dapm_widgets = trimslice_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(trimslice_dapm_widgets),
-	.dapm_routes = trimslice_audio_map,
-	.num_dapm_routes = ARRAY_SIZE(trimslice_audio_map),
-	.fully_routed = true,
-};
-
-static int tegra_snd_trimslice_probe(struct platform_device *pdev)
-{
-	struct device_node *np = pdev->dev.of_node;
-	struct snd_soc_card *card = &snd_soc_trimslice;
-	struct tegra_trimslice *trimslice;
-	int ret;
-
-	trimslice = devm_kzalloc(&pdev->dev, sizeof(struct tegra_trimslice),
-				 GFP_KERNEL);
-	if (!trimslice)
-		return -ENOMEM;
-
-	card->dev = &pdev->dev;
-	snd_soc_card_set_drvdata(card, trimslice);
-
-	trimslice_tlv320aic23_dai.codecs->of_node = of_parse_phandle(np,
-			"nvidia,audio-codec", 0);
-	if (!trimslice_tlv320aic23_dai.codecs->of_node) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,audio-codec' missing or invalid\n");
-		return -EINVAL;
-	}
-
-	trimslice_tlv320aic23_dai.cpus->of_node = of_parse_phandle(np,
-			"nvidia,i2s-controller", 0);
-	if (!trimslice_tlv320aic23_dai.cpus->of_node) {
-		dev_err(&pdev->dev,
-			"Property 'nvidia,i2s-controller' missing or invalid\n");
-		return -EINVAL;
-	}
-
-	trimslice_tlv320aic23_dai.platforms->of_node =
-			trimslice_tlv320aic23_dai.cpus->of_node;
-
-	ret = tegra_asoc_utils_init(&trimslice->util_data, &pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "snd_soc_register_card failed\n");
-
-	return 0;
-}
-
-static const struct of_device_id trimslice_of_match[] = {
-	{ .compatible = "nvidia,tegra-audio-trimslice", },
-	{},
-};
-MODULE_DEVICE_TABLE(of, trimslice_of_match);
-
-static struct platform_driver tegra_snd_trimslice_driver = {
-	.driver = {
-		.name = DRV_NAME,
-		.of_match_table = trimslice_of_match,
-	},
-	.probe = tegra_snd_trimslice_probe,
-};
-module_platform_driver(tegra_snd_trimslice_driver);
-
-MODULE_AUTHOR("Mike Rapoport <mike@compulab.co.il>");
-MODULE_DESCRIPTION("Trimslice machine ASoC driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.30.2


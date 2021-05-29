Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC6C394D07
	for <lists+alsa-devel@lfdr.de>; Sat, 29 May 2021 17:49:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAB7F16D8;
	Sat, 29 May 2021 17:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAB7F16D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622303370;
	bh=3aWBa4suO8hhUwEmNP+jfFQOH+ngvOGr9P8Gq+IzMOw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JH/XAJVKmhPG0b3vM7D73bbH+Zi0oIM6HuSYHFoCZAQAI2vHabXPFSYqeBo78O6UR
	 hhglNKVfjSOAZsc0DkPCIiyEVF73QbOmAY8i7zo4wNWsm/DeI5vTFZbp58OOcZp4Y5
	 E7DuPnMWAFG3Fzsv3TQ/z7QXf9t0Du1Zqg9b2MdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 031FEF804B4;
	Sat, 29 May 2021 17:47:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B37D5F804BB; Sat, 29 May 2021 17:47:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E7A8F80132
 for <alsa-devel@alsa-project.org>; Sat, 29 May 2021 17:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E7A8F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TbMiJGGJ"
Received: by mail-lf1-x12a.google.com with SMTP id x38so9836102lfa.10
 for <alsa-devel@alsa-project.org>; Sat, 29 May 2021 08:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pO0H22zQy0hWIbbfN3xY68+CLeo+OMFw2Vv0SCa5Ock=;
 b=TbMiJGGJdUoD4wWHlHvpEMJfkd0uRPxiNnK8R36XKzc0nbvhvvDCjxLuU5cxCs6Uia
 n1AG+l7zs06PfVVP4CLo1LWcJ3iJxB7N4YGUNn4yXEReEl6bEKR6449o06kplP9cJ/CK
 fhybG9gjgz/96HEC700HnPmEymd1YDacObdcP5G+K83aCto+KFIhRL8Ht0/Zf4gk3vCx
 mMxo1o0NHhyL4txNulQnPnRBD8VJ5FgOZF6p7cGPggds/x20mKWkuAB1b5TMPepq94e8
 06YrlxoEgPrZZA8g/vK3R6I3smh15GnGnSPBoL6v2fVUUMtFOGmlPuTo2rv1D/wnqGuv
 X8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pO0H22zQy0hWIbbfN3xY68+CLeo+OMFw2Vv0SCa5Ock=;
 b=r/C7W0S3iQ3cHHFWLwBvbXxP5ZtMunVdDFhNF8jySWOvSMHl4Z7Tr9bGlBKw01QnUc
 1/QNtnrqWfT4KzRMjNFj4fdLt+RlPGfgheQo0QMuclaxZI5LycCOQ9sAytxLqXIXyKPa
 jRxE2TyFPUR5R6w1W2GCnwaf6qb6RH2lsx1edV4rkBtXPME57aAQ1I5LSehSDjsjIJ7b
 VVjsRMS4N+5cMPqLyltQBSjZF2sKKgQTNu3Gqxw8r2/8vxJiU7JcAwhb0anvX1PFuyxC
 tPpTOgfSxxD3jbgXerAT6FGBRiyBnJ2QGDyJvPQZPUR1eAxH5iPhkVhI1Vc2ttulcS9G
 sVvg==
X-Gm-Message-State: AOAM533hJ6pHfBFdIYyHCJ6pKycSLjSYES/54bPCMKvR3+MC/YFXMUzO
 Mbe6pnOP/mpXPP2fH9XTUihbRa4s/Mw=
X-Google-Smtp-Source: ABdhPJwfwM/LM+N/S1m75/J+UQnkSTQu0lCIAuWVboWCQXLrtMCWZzgAO2d3w5EitblXV4rr25BcsQ==
X-Received: by 2002:a19:5e0d:: with SMTP id s13mr9381160lfb.229.1622303226526; 
 Sat, 29 May 2021 08:47:06 -0700 (PDT)
Received: from localhost.localdomain (46-138-84-89.dynamic.spd-mgts.ru.
 [46.138.84.89])
 by smtp.gmail.com with ESMTPSA id y24sm764005lfg.232.2021.05.29.08.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 08:47:06 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v6 4/4] ASoC: tegra: Squash utils into common machine driver
Date: Sat, 29 May 2021 18:46:49 +0300
Message-Id: <20210529154649.25936-5-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529154649.25936-1-digetx@gmail.com>
References: <20210529154649.25936-1-digetx@gmail.com>
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

There no users left of the utils other than the new common machine driver.
Squash the utils into the common machine driver in order to simplify code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/Makefile             |   1 -
 sound/soc/tegra/tegra_asoc_machine.c | 153 ++++++++++++++++--
 sound/soc/tegra/tegra_asoc_machine.h |   9 +-
 sound/soc/tegra/tegra_asoc_utils.c   | 225 ---------------------------
 sound/soc/tegra/tegra_asoc_utils.h   |  38 -----
 5 files changed, 150 insertions(+), 276 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra_asoc_utils.c
 delete mode 100644 sound/soc/tegra/tegra_asoc_utils.h

diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index b930ea7c75f1..e2cec9ae31c9 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -15,7 +15,6 @@ snd-soc-tegra186-dspk-objs := tegra186_dspk.o
 snd-soc-tegra210-admaif-objs := tegra210_admaif.o
 
 obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-pcm.o
-obj-$(CONFIG_SND_SOC_TEGRA) += snd-soc-tegra-utils.o
 obj-$(CONFIG_SND_SOC_TEGRA20_AC97) += snd-soc-tegra20-ac97.o
 obj-$(CONFIG_SND_SOC_TEGRA20_DAS) += snd-soc-tegra20-das.o
 obj-$(CONFIG_SND_SOC_TEGRA20_I2S) += snd-soc-tegra20-i2s.o
diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 31ab7123945b..a53aec361a77 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -3,6 +3,7 @@
  * tegra_asoc_machine.c - Universal ASoC machine driver for NVIDIA Tegra boards.
  */
 
+#include <linux/clk.h>
 #include <linux/export.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -239,12 +240,68 @@ static int tegra_machine_hw_params(struct snd_pcm_substream *substream,
 	unsigned int srate = params_rate(params);
 	unsigned int mclk = machine->asoc->mclk_rate(srate);
 	unsigned int clk_id = machine->asoc->mclk_id;
+	unsigned int new_baseclock;
 	int err;
 
-	err = tegra_asoc_utils_set_rate(&machine->util_data, srate, mclk);
-	if (err < 0) {
-		dev_err(card->dev, "Can't configure clocks: %d\n", err);
-		return err;
+	switch (srate) {
+	case 11025:
+	case 22050:
+	case 44100:
+	case 88200:
+		if (of_machine_is_compatible("nvidia,tegra20"))
+			new_baseclock = 56448000;
+		else if (of_machine_is_compatible("nvidia,tegra30"))
+			new_baseclock = 564480000;
+		else
+			new_baseclock = 282240000;
+		break;
+	case 8000:
+	case 16000:
+	case 32000:
+	case 48000:
+	case 64000:
+	case 96000:
+		if (of_machine_is_compatible("nvidia,tegra20"))
+			new_baseclock = 73728000;
+		else if (of_machine_is_compatible("nvidia,tegra30"))
+			new_baseclock = 552960000;
+		else
+			new_baseclock = 368640000;
+		break;
+	default:
+		dev_err(card->dev, "Invalid sound rate: %u\n", srate);
+		return -EINVAL;
+	}
+
+	if (new_baseclock != machine->set_baseclock ||
+	    mclk != machine->set_mclk) {
+		machine->set_baseclock = 0;
+		machine->set_mclk = 0;
+
+		clk_disable_unprepare(machine->clk_cdev1);
+
+		err = clk_set_rate(machine->clk_pll_a, new_baseclock);
+		if (err) {
+			dev_err(card->dev, "Can't set pll_a rate: %d\n", err);
+			return err;
+		}
+
+		err = clk_set_rate(machine->clk_pll_a_out0, mclk);
+		if (err) {
+			dev_err(card->dev, "Can't set pll_a_out0 rate: %d\n", err);
+			return err;
+		}
+
+		/* Don't set cdev1/extern1 rate; it's locked to pll_a_out0 */
+
+		err = clk_prepare_enable(machine->clk_cdev1);
+		if (err) {
+			dev_err(card->dev, "Can't enable cdev1: %d\n", err);
+			return err;
+		}
+
+		machine->set_baseclock = new_baseclock;
+		machine->set_mclk = mclk;
 	}
 
 	err = snd_soc_dai_set_sysclk(codec_dai, clk_id, mclk, SND_SOC_CLOCK_IN);
@@ -377,14 +434,92 @@ int tegra_asoc_machine_probe(struct platform_device *pdev)
 	if (!card->driver_name)
 		card->driver_name = "tegra";
 
-	err = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
-	if (err)
-		return err;
+	machine->clk_pll_a = devm_clk_get(dev, "pll_a");
+	if (IS_ERR(machine->clk_pll_a)) {
+		dev_err(dev, "Can't retrieve clk pll_a\n");
+		return PTR_ERR(machine->clk_pll_a);
+	}
+
+	machine->clk_pll_a_out0 = devm_clk_get(dev, "pll_a_out0");
+	if (IS_ERR(machine->clk_pll_a_out0)) {
+		dev_err(dev, "Can't retrieve clk pll_a_out0\n");
+		return PTR_ERR(machine->clk_pll_a_out0);
+	}
+
+	machine->clk_cdev1 = devm_clk_get(dev, "mclk");
+	if (IS_ERR(machine->clk_cdev1)) {
+		dev_err(dev, "Can't retrieve clk cdev1\n");
+		return PTR_ERR(machine->clk_cdev1);
+	}
+
+	/*
+	 * If clock parents are not set in DT, configure here to use clk_out_1
+	 * as mclk and extern1 as parent for Tegra30 and higher.
+	 */
+	if (!of_find_property(dev->of_node, "assigned-clock-parents", NULL) &&
+	    !of_machine_is_compatible("nvidia,tegra20")) {
+		struct clk *clk_out_1, *clk_extern1;
+
+		dev_warn(dev, "Configuring clocks for a legacy device-tree\n");
+		dev_warn(dev, "Please update DT to use assigned-clock-parents\n");
+
+		clk_extern1 = devm_clk_get(dev, "extern1");
+		if (IS_ERR(clk_extern1)) {
+			dev_err(dev, "Can't retrieve clk extern1\n");
+			return PTR_ERR(clk_extern1);
+		}
+
+		err = clk_set_parent(clk_extern1, machine->clk_pll_a_out0);
+		if (err < 0) {
+			dev_err(dev, "Set parent failed for clk extern1\n");
+			return err;
+		}
+
+		clk_out_1 = devm_clk_get(dev, "pmc_clk_out_1");
+		if (IS_ERR(clk_out_1)) {
+			dev_err(dev, "Can't retrieve pmc_clk_out_1\n");
+			return PTR_ERR(clk_out_1);
+		}
+
+		err = clk_set_parent(clk_out_1, clk_extern1);
+		if (err < 0) {
+			dev_err(dev, "Set parent failed for pmc_clk_out_1\n");
+			return err;
+		}
+
+		machine->clk_cdev1 = clk_out_1;
+	}
 
 	if (asoc->set_ac97) {
-		err = tegra_asoc_utils_set_ac97_rate(&machine->util_data);
-		if (err)
+		/*
+		 * AC97 rate is fixed at 24.576MHz and is used for both the
+		 * host controller and the external codec
+		 */
+		err = clk_set_rate(machine->clk_pll_a, 73728000);
+		if (err) {
+			dev_err(dev, "Can't set pll_a rate: %d\n", err);
 			return err;
+		}
+
+		err = clk_set_rate(machine->clk_pll_a_out0, 24576000);
+		if (err) {
+			dev_err(dev, "Can't set pll_a_out0 rate: %d\n", err);
+			return err;
+		}
+
+		machine->set_baseclock = 73728000;
+		machine->set_mclk = 24576000;
+	}
+
+	/*
+	 * FIXME: There is some unknown dependency between audio MCLK disable
+	 * and suspend-resume functionality on Tegra30, although audio MCLK is
+	 * only needed for audio.
+	 */
+	err = clk_prepare_enable(machine->clk_cdev1);
+	if (err) {
+		dev_err(dev, "Can't enable cdev1: %d\n", err);
+		return err;
 	}
 
 	err = devm_snd_soc_register_card(dev, card);
diff --git a/sound/soc/tegra/tegra_asoc_machine.h b/sound/soc/tegra/tegra_asoc_machine.h
index f3a087a7548b..8ee0ec814f67 100644
--- a/sound/soc/tegra/tegra_asoc_machine.h
+++ b/sound/soc/tegra/tegra_asoc_machine.h
@@ -3,8 +3,7 @@
 #ifndef __TEGRA_ASOC_MACHINE_H__
 #define __TEGRA_ASOC_MACHINE_H__
 
-#include "tegra_asoc_utils.h"
-
+struct clk;
 struct gpio_desc;
 struct snd_soc_card;
 struct snd_soc_jack;
@@ -27,7 +26,11 @@ struct tegra_asoc_data {
 };
 
 struct tegra_machine {
-	struct tegra_asoc_utils_data util_data;
+	struct clk *clk_pll_a_out0;
+	struct clk *clk_pll_a;
+	struct clk *clk_cdev1;
+	unsigned int set_baseclock;
+	unsigned int set_mclk;
 	const struct tegra_asoc_data *asoc;
 	struct gpio_desc *gpiod_ext_mic_en;
 	struct gpio_desc *gpiod_int_mic_en;
diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
deleted file mode 100644
index 587f62a288d1..000000000000
--- a/sound/soc/tegra/tegra_asoc_utils.c
+++ /dev/null
@@ -1,225 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * tegra_asoc_utils.c - Harmony machine ASoC driver
- *
- * Author: Stephen Warren <swarren@nvidia.com>
- * Copyright (C) 2010,2012 - NVIDIA, Inc.
- */
-
-#include <linux/clk.h>
-#include <linux/device.h>
-#include <linux/err.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/of.h>
-
-#include "tegra_asoc_utils.h"
-
-int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
-			      int mclk)
-{
-	int new_baseclock;
-	bool clk_change;
-	int err;
-
-	switch (srate) {
-	case 11025:
-	case 22050:
-	case 44100:
-	case 88200:
-		if (data->soc == TEGRA_ASOC_UTILS_SOC_TEGRA20)
-			new_baseclock = 56448000;
-		else if (data->soc == TEGRA_ASOC_UTILS_SOC_TEGRA30)
-			new_baseclock = 564480000;
-		else
-			new_baseclock = 282240000;
-		break;
-	case 8000:
-	case 16000:
-	case 32000:
-	case 48000:
-	case 64000:
-	case 96000:
-		if (data->soc == TEGRA_ASOC_UTILS_SOC_TEGRA20)
-			new_baseclock = 73728000;
-		else if (data->soc == TEGRA_ASOC_UTILS_SOC_TEGRA30)
-			new_baseclock = 552960000;
-		else
-			new_baseclock = 368640000;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	clk_change = ((new_baseclock != data->set_baseclock) ||
-			(mclk != data->set_mclk));
-	if (!clk_change)
-		return 0;
-
-	data->set_baseclock = 0;
-	data->set_mclk = 0;
-
-	clk_disable_unprepare(data->clk_cdev1);
-
-	err = clk_set_rate(data->clk_pll_a, new_baseclock);
-	if (err) {
-		dev_err(data->dev, "Can't set pll_a rate: %d\n", err);
-		return err;
-	}
-
-	err = clk_set_rate(data->clk_pll_a_out0, mclk);
-	if (err) {
-		dev_err(data->dev, "Can't set pll_a_out0 rate: %d\n", err);
-		return err;
-	}
-
-	/* Don't set cdev1/extern1 rate; it's locked to pll_a_out0 */
-
-	err = clk_prepare_enable(data->clk_cdev1);
-	if (err) {
-		dev_err(data->dev, "Can't enable cdev1: %d\n", err);
-		return err;
-	}
-
-	data->set_baseclock = new_baseclock;
-	data->set_mclk = mclk;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(tegra_asoc_utils_set_rate);
-
-int tegra_asoc_utils_set_ac97_rate(struct tegra_asoc_utils_data *data)
-{
-	const int pll_rate = 73728000;
-	const int ac97_rate = 24576000;
-	int err;
-
-	clk_disable_unprepare(data->clk_cdev1);
-
-	/*
-	 * AC97 rate is fixed at 24.576MHz and is used for both the host
-	 * controller and the external codec
-	 */
-	err = clk_set_rate(data->clk_pll_a, pll_rate);
-	if (err) {
-		dev_err(data->dev, "Can't set pll_a rate: %d\n", err);
-		return err;
-	}
-
-	err = clk_set_rate(data->clk_pll_a_out0, ac97_rate);
-	if (err) {
-		dev_err(data->dev, "Can't set pll_a_out0 rate: %d\n", err);
-		return err;
-	}
-
-	/* Don't set cdev1/extern1 rate; it's locked to pll_a_out0 */
-
-	err = clk_prepare_enable(data->clk_cdev1);
-	if (err) {
-		dev_err(data->dev, "Can't enable cdev1: %d\n", err);
-		return err;
-	}
-
-	data->set_baseclock = pll_rate;
-	data->set_mclk = ac97_rate;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(tegra_asoc_utils_set_ac97_rate);
-
-int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
-			  struct device *dev)
-{
-	struct clk *clk_out_1, *clk_extern1;
-	int ret;
-
-	data->dev = dev;
-
-	if (of_machine_is_compatible("nvidia,tegra20"))
-		data->soc = TEGRA_ASOC_UTILS_SOC_TEGRA20;
-	else if (of_machine_is_compatible("nvidia,tegra30"))
-		data->soc = TEGRA_ASOC_UTILS_SOC_TEGRA30;
-	else if (of_machine_is_compatible("nvidia,tegra114"))
-		data->soc = TEGRA_ASOC_UTILS_SOC_TEGRA114;
-	else if (of_machine_is_compatible("nvidia,tegra124"))
-		data->soc = TEGRA_ASOC_UTILS_SOC_TEGRA124;
-	else {
-		dev_err(data->dev, "SoC unknown to Tegra ASoC utils\n");
-		return -EINVAL;
-	}
-
-	data->clk_pll_a = devm_clk_get(dev, "pll_a");
-	if (IS_ERR(data->clk_pll_a)) {
-		dev_err(data->dev, "Can't retrieve clk pll_a\n");
-		return PTR_ERR(data->clk_pll_a);
-	}
-
-	data->clk_pll_a_out0 = devm_clk_get(dev, "pll_a_out0");
-	if (IS_ERR(data->clk_pll_a_out0)) {
-		dev_err(data->dev, "Can't retrieve clk pll_a_out0\n");
-		return PTR_ERR(data->clk_pll_a_out0);
-	}
-
-	data->clk_cdev1 = devm_clk_get(dev, "mclk");
-	if (IS_ERR(data->clk_cdev1)) {
-		dev_err(data->dev, "Can't retrieve clk cdev1\n");
-		return PTR_ERR(data->clk_cdev1);
-	}
-
-	/*
-	 * If clock parents are not set in DT, configure here to use clk_out_1
-	 * as mclk and extern1 as parent for Tegra30 and higher.
-	 */
-	if (!of_find_property(dev->of_node, "assigned-clock-parents", NULL) &&
-	    data->soc > TEGRA_ASOC_UTILS_SOC_TEGRA20) {
-		dev_warn(data->dev,
-			 "Configuring clocks for a legacy device-tree\n");
-		dev_warn(data->dev,
-			 "Please update DT to use assigned-clock-parents\n");
-		clk_extern1 = devm_clk_get(dev, "extern1");
-		if (IS_ERR(clk_extern1)) {
-			dev_err(data->dev, "Can't retrieve clk extern1\n");
-			return PTR_ERR(clk_extern1);
-		}
-
-		ret = clk_set_parent(clk_extern1, data->clk_pll_a_out0);
-		if (ret < 0) {
-			dev_err(data->dev,
-				"Set parent failed for clk extern1\n");
-			return ret;
-		}
-
-		clk_out_1 = devm_clk_get(dev, "pmc_clk_out_1");
-		if (IS_ERR(clk_out_1)) {
-			dev_err(data->dev, "Can't retrieve pmc_clk_out_1\n");
-			return PTR_ERR(clk_out_1);
-		}
-
-		ret = clk_set_parent(clk_out_1, clk_extern1);
-		if (ret < 0) {
-			dev_err(data->dev,
-				"Set parent failed for pmc_clk_out_1\n");
-			return ret;
-		}
-
-		data->clk_cdev1 = clk_out_1;
-	}
-
-	/*
-	 * FIXME: There is some unknown dependency between audio mclk disable
-	 * and suspend-resume functionality on Tegra30, although audio mclk is
-	 * only needed for audio.
-	 */
-	ret = clk_prepare_enable(data->clk_cdev1);
-	if (ret) {
-		dev_err(data->dev, "Can't enable cdev1: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(tegra_asoc_utils_init);
-
-MODULE_AUTHOR("Stephen Warren <swarren@nvidia.com>");
-MODULE_DESCRIPTION("Tegra ASoC utility code");
-MODULE_LICENSE("GPL");
diff --git a/sound/soc/tegra/tegra_asoc_utils.h b/sound/soc/tegra/tegra_asoc_utils.h
deleted file mode 100644
index a34439587d59..000000000000
--- a/sound/soc/tegra/tegra_asoc_utils.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * tegra_asoc_utils.h - Definitions for Tegra DAS driver
- *
- * Author: Stephen Warren <swarren@nvidia.com>
- * Copyright (C) 2010,2012 - NVIDIA, Inc.
- */
-
-#ifndef __TEGRA_ASOC_UTILS_H__
-#define __TEGRA_ASOC_UTILS_H__
-
-struct clk;
-struct device;
-
-enum tegra_asoc_utils_soc {
-	TEGRA_ASOC_UTILS_SOC_TEGRA20,
-	TEGRA_ASOC_UTILS_SOC_TEGRA30,
-	TEGRA_ASOC_UTILS_SOC_TEGRA114,
-	TEGRA_ASOC_UTILS_SOC_TEGRA124,
-};
-
-struct tegra_asoc_utils_data {
-	struct device *dev;
-	enum tegra_asoc_utils_soc soc;
-	struct clk *clk_pll_a;
-	struct clk *clk_pll_a_out0;
-	struct clk *clk_cdev1;
-	int set_baseclock;
-	int set_mclk;
-};
-
-int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
-			      int mclk);
-int tegra_asoc_utils_set_ac97_rate(struct tegra_asoc_utils_data *data);
-int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
-			  struct device *dev);
-
-#endif
-- 
2.30.2


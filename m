Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C712E263C15
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 06:32:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 541AD167F;
	Thu, 10 Sep 2020 06:31:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 541AD167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599712362;
	bh=5jKSS5yurRr9Xy52qK0mfI5RR/k4NOIzgmiLmn4TD0E=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HpTU9f8fUveAyt+sZ8BAmH19OOBa9LvWWPEtAxnpKB4jTNzxw90zwjTnBu8ZG9sLh
	 WdYlYn+Bt5M4z2eHk2LmUXCe+Ko1RjEjTEda8K0fDHiwAOmSFNBh5LVIA8cjyyjYys
	 xk91AoX6Je3ASWI+hUiFiYydDhx2zgBC6XeCVetc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3BAAF8010E;
	Thu, 10 Sep 2020 06:30:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DEF9F800D0; Thu, 10 Sep 2020 06:30:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7535FF800D0
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 06:30:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7535FF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Ai8mNNuQ"
Received: by mail-qt1-x849.google.com with SMTP id a16so3295000qtj.7
 for <alsa-devel@alsa-project.org>; Wed, 09 Sep 2020 21:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=hX4LArcIeiO7DYSi2U69MGeuOS3UcDbsbvMpax4YZiQ=;
 b=Ai8mNNuQMhZuKePhVH05owAPbYc/r2R54TR/OM/6x5d9ZGHEilpIURfbMiderGprgC
 yrsOydJzMI+3zD7o0pDR4FiHcrbnN8l/Hf7/l4eZYjTGE3ggp6R6/MZyFTbClBjCZ1QG
 gbE3+atojfoWyLr2yaFOOzh1XCvm4VCBfQGSfqmmWQNMl/QK7Om7Xvg21+/EHCFwV5U9
 b9FxbIrPxXbTMK4OFjRXD8uEX7njeyZ89QK7/R1o16NivoloswZjT8NN7sjR7tbWNLu7
 fuhspeSvCX0XuMnQFMOKLWCt3c1RHwM5YGhwK+BBeBmDbV1yEKn3JCjTy/XvnUS/ll9G
 07Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=hX4LArcIeiO7DYSi2U69MGeuOS3UcDbsbvMpax4YZiQ=;
 b=VC60IpspeXUnPHp/+Q1pOgsIedGHIsn1llgTM9mJiD+NCXlJ7G8HL8SxH30V6TZtPl
 LNOsiALzQ0ADtOCVlh0mALEbutE7Od+1DAH41iK9bOzVxCbV5GSbxvwn2XoHwxD1R7Jk
 nyRWlPkQzZH0UWaXAeitoxZUCzNv6/LuE8ssAKHXaMY+2utlvI0EAKgSQ6vJxc18YJp0
 IAVQL6f/PqaF96zXiT3uQew2FHoGcvHag3apyyHS1W++9FgbMPwdUHSQxmGZQLFFAgHy
 XRcnglcRPUL/fB43tI0s7Y00Hhi4t9KXmQ5TDKdvnfpWOd1T7gEDooa30Fr4Tt7yqF9v
 3ELA==
X-Gm-Message-State: AOAM531rVlKq7h395QraGBUZg17aJdbQQVkfQLnqB6Cv5NZ3dioANnBp
 q3BjZxtbR/kSg3aPuOpp2F8HKoj+bzyr
X-Google-Smtp-Source: ABdhPJyv/+h14ZIRGIC8h7EuETopTcbS7+QLmXHSOYXwjDyEj0fIJuAsxkuKEsQK9x5v73K7VxtVP7crimIG
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:ad4:5a07:: with SMTP id
 ei7mr7360656qvb.35.1599712205357; Wed, 09 Sep 2020 21:30:05 -0700 (PDT)
Date: Thu, 10 Sep 2020 12:29:48 +0800
In-Reply-To: <20200910042949.3795682-1-tzungbi@google.com>
Message-Id: <20200910042949.3795682-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20200910042949.3795682-1-tzungbi@google.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH 1/2] ASoC: rt1015p: add codec driver
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, tzungbi@google.com
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

Adds rt1015p codec driver.

Rt1015p is a rt1015 variant.
- It doesn't support I2C.
- It only supports S24, 48kHz, 64FS.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/Kconfig   |   7 ++
 sound/soc/codecs/Makefile  |   2 +
 sound/soc/codecs/rt1015p.c | 148 +++++++++++++++++++++++++++++++++++++
 3 files changed, 157 insertions(+)
 create mode 100644 sound/soc/codecs/rt1015p.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index e6c71ca0cd9b..1cf686eb6a51 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -155,6 +155,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_RT298
 	imply SND_SOC_RT1011
 	imply SND_SOC_RT1015
+	imply SND_SOC_RT1015P
 	imply SND_SOC_RT1305
 	imply SND_SOC_RT1308
 	imply SND_SOC_RT5514
@@ -1032,6 +1033,7 @@ config SND_SOC_RL6231
 	default y if SND_SOC_RT5682=y
 	default y if SND_SOC_RT1011=y
 	default y if SND_SOC_RT1015=y
+	default y if SND_SOC_RT1015P=y
 	default y if SND_SOC_RT1305=y
 	default y if SND_SOC_RT1308=y
 	default m if SND_SOC_RT5514=m
@@ -1049,6 +1051,7 @@ config SND_SOC_RL6231
 	default m if SND_SOC_RT5682=m
 	default m if SND_SOC_RT1011=m
 	default m if SND_SOC_RT1015=m
+	default m if SND_SOC_RT1015P=m
 	default m if SND_SOC_RT1305=m
 	default m if SND_SOC_RT1308=m
 
@@ -1081,6 +1084,10 @@ config SND_SOC_RT1015
 	tristate
 	depends on I2C
 
+config SND_SOC_RT1015P
+	tristate
+	depends on GPIOLIB
+
 config SND_SOC_RT1305
 	tristate
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 9a3f58c1069a..2e5a79b55102 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -159,6 +159,7 @@ snd-soc-rl6231-objs := rl6231.o
 snd-soc-rl6347a-objs := rl6347a.o
 snd-soc-rt1011-objs := rt1011.o
 snd-soc-rt1015-objs := rt1015.o
+snd-soc-rt1015p-objs := rt1015p.o
 snd-soc-rt1305-objs := rt1305.o
 snd-soc-rt1308-objs := rt1308.o
 snd-soc-rt1308-sdw-objs := rt1308-sdw.o
@@ -465,6 +466,7 @@ obj-$(CONFIG_SND_SOC_RL6231)	+= snd-soc-rl6231.o
 obj-$(CONFIG_SND_SOC_RL6347A)	+= snd-soc-rl6347a.o
 obj-$(CONFIG_SND_SOC_RT1011)	+= snd-soc-rt1011.o
 obj-$(CONFIG_SND_SOC_RT1015)	+= snd-soc-rt1015.o
+obj-$(CONFIG_SND_SOC_RT1015P)	+= snd-soc-rt1015p.o
 obj-$(CONFIG_SND_SOC_RT1305)	+= snd-soc-rt1305.o
 obj-$(CONFIG_SND_SOC_RT1308)	+= snd-soc-rt1308.o
 obj-$(CONFIG_SND_SOC_RT1308_SDW)	+= snd-soc-rt1308-sdw.o
diff --git a/sound/soc/codecs/rt1015p.c b/sound/soc/codecs/rt1015p.c
new file mode 100644
index 000000000000..59bb60682270
--- /dev/null
+++ b/sound/soc/codecs/rt1015p.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// rt1015p.c  --  RT1015P ALSA SoC audio amplifier driver
+//
+// Copyright 2020 The Linux Foundation. All rights reserved.
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <sound/soc-dapm.h>
+
+struct rt1015p_priv {
+	struct gpio_desc *sdb;
+	int sdb_switch;
+};
+
+static int rt1015p_daiops_trigger(struct snd_pcm_substream *substream,
+		int cmd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct rt1015p_priv *rt1015p =
+		snd_soc_component_get_drvdata(component);
+
+	if (!rt1015p->sdb)
+		return 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		if (rt1015p->sdb_switch) {
+			gpiod_set_value(rt1015p->sdb, 1);
+			dev_dbg(component->dev, "set sdb to 1");
+		}
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		gpiod_set_value(rt1015p->sdb, 0);
+		dev_dbg(component->dev, "set sdb to 0");
+		break;
+	}
+
+	return 0;
+}
+
+static int rt1015p_sdb_event(struct snd_soc_dapm_widget *w,
+		struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct rt1015p_priv *rt1015p =
+		snd_soc_component_get_drvdata(component);
+
+	if (event & SND_SOC_DAPM_POST_PMU)
+		rt1015p->sdb_switch = 1;
+	else if (event & SND_SOC_DAPM_POST_PMD)
+		rt1015p->sdb_switch = 0;
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget rt1015p_dapm_widgets[] = {
+	SND_SOC_DAPM_OUTPUT("Speaker"),
+	SND_SOC_DAPM_OUT_DRV_E("SDB", SND_SOC_NOPM, 0, 0, NULL, 0,
+			rt1015p_sdb_event,
+			SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+};
+
+static const struct snd_soc_dapm_route rt1015p_dapm_routes[] = {
+	{"SDB", NULL, "HiFi Playback"},
+	{"Speaker", NULL, "SDB"},
+};
+
+static const struct snd_soc_component_driver rt1015p_component_driver = {
+	.dapm_widgets		= rt1015p_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(rt1015p_dapm_widgets),
+	.dapm_routes		= rt1015p_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(rt1015p_dapm_routes),
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static const struct snd_soc_dai_ops rt1015p_dai_ops = {
+	.trigger        = rt1015p_daiops_trigger,
+};
+
+static struct snd_soc_dai_driver rt1015p_dai_driver = {
+	.name = "HiFi",
+	.playback = {
+		.stream_name	= "HiFi Playback",
+		.formats	= SNDRV_PCM_FMTBIT_S24,
+		.rates		= SNDRV_PCM_RATE_48000,
+		.channels_min	= 1,
+		.channels_max	= 2,
+	},
+	.ops    = &rt1015p_dai_ops,
+};
+
+static int rt1015p_platform_probe(struct platform_device *pdev)
+{
+	struct rt1015p_priv *rt1015p;
+
+	rt1015p = devm_kzalloc(&pdev->dev, sizeof(*rt1015p), GFP_KERNEL);
+	if (!rt1015p)
+		return -ENOMEM;
+
+	rt1015p->sdb = devm_gpiod_get_optional(&pdev->dev,
+				"sdb", GPIOD_OUT_LOW);
+	if (IS_ERR(rt1015p->sdb))
+		return PTR_ERR(rt1015p->sdb);
+
+	dev_set_drvdata(&pdev->dev, rt1015p);
+
+	return devm_snd_soc_register_component(&pdev->dev,
+			&rt1015p_component_driver,
+			&rt1015p_dai_driver, 1);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id rt1015p_device_id[] = {
+	{ .compatible = "realtek,rt1015p" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rt1015p_device_id);
+#endif
+
+static struct platform_driver rt1015p_platform_driver = {
+	.driver = {
+		.name = "rt1015p",
+		.of_match_table = of_match_ptr(rt1015p_device_id),
+	},
+	.probe = rt1015p_platform_probe,
+};
+module_platform_driver(rt1015p_platform_driver);
+
+MODULE_DESCRIPTION("ASoC RT1015P driver");
+MODULE_LICENSE("GPL v2");
-- 
2.28.0.526.ge36021eeef-goog


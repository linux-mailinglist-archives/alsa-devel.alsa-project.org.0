Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0EC15C56C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 16:58:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F66A16DD;
	Thu, 13 Feb 2020 16:57:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F66A16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581609519;
	bh=Kz5hTMG4f+9nhN0+vkdKhX/wNczyiCDqvH/NkcSBHC8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pOt6uNOqUZM/PGPYCT+G0qw2vLYoqTaPDMI79/Ew17MtgtMIfSp7Hrp4dwk94L7Lu
	 IBRnjU7eVkwIZiso5KfDVb4uk58uNxmU4RTre6q6enhTs5l6Dr81PyEAYn0ykNkPGC
	 2ovH5nH6OblL3+/N3Uk5FghaaSc2TdnZ4ew6kQBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 462D9F802C4;
	Thu, 13 Feb 2020 16:52:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25329F80291; Thu, 13 Feb 2020 16:52:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80412F8013E
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 16:52:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80412F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="OcbaJySh"
Received: by mail-wm1-x341.google.com with SMTP id t14so7311830wmi.5
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 07:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tveyt6J2X+uabgEQ/mj5bAqqccazTsWZH5vIdnttJSg=;
 b=OcbaJyShdx1CRYbEg0P7r6/7tU4ttgaXvOw6dIVStzuNDwuKZO9sZNgWdCK71k8pFE
 b5WfunilEzaZF/54lgN1xTSDCi8dtm+WwiyEoWeHJHdRbKu65sCJehSgDxSqLMjvjIlW
 yX4Kb7FqQFH/cos/EMvelQGbB1mLmMkYqpS6OhqmmuPN0Z8Gp+qcUKe1i0bEKveAIsJH
 Tn4kkGKR82GtzFUa5hRT5YyorS9UTW3iFMnyNpPKh04AdbXI9l7uGBrm917etxPjNnMP
 SrcIGXWJ6tWyHuSv7aCiQSbNuq+b9jHF0ozI3VdqXAbEAq8WkGyb1R7X62iKuS6GDHwG
 6NwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tveyt6J2X+uabgEQ/mj5bAqqccazTsWZH5vIdnttJSg=;
 b=SAGwbqxwmlQq1bd+8AoGssZ7SnXoHnVKyOFxzWdnCVrNN8QdM6fP0ldj3Gj+UZB1ZP
 om7Y7KpDeVEHDvtbJc9xPwrBs3lpcosd2LN7gHpjD7sBkHYEl6AAKm40sXTMF8wJG5tW
 LgoIldRrfJxGgi+IwHkkzUWLQdKykENeSiWrlh99UZsy2Xn3v38ge04+9xSJftGczv4z
 itY4ebju38dc7DA2sV3HnPsxmHSHdY2Da6awpGfyl+dJThLZWQe2skzg7BIO4aDgusdh
 FhCGRh/YbFylYYtHkLvHK/1IH4tnW0zRT9MMHkYom2jrAfxGOJyXizi+QsFz+aiLZUXL
 n/BA==
X-Gm-Message-State: APjAAAUgwNqp/DE91Y4ECepNco97Qqow7myymyHuBzWtHSAZJKDgfNCU
 //tJ4Ugb2H8NJH1ARfJ1GHX8+eO5eyw=
X-Google-Smtp-Source: APXvYqwA041IWnaiiF8p6WaNGCtAIMpLGWSuvS9KZogSxJnR7PyvLosI31gLD3ccOvYkV2nUj2AC7g==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr6783621wmi.118.1581609136778; 
 Thu, 13 Feb 2020 07:52:16 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e1sm3319814wrt.84.2020.02.13.07.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:52:16 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Thu, 13 Feb 2020 16:51:59 +0100
Message-Id: <20200213155159.3235792-10-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213155159.3235792-1-jbrunet@baylibre.com>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 9/9] ASoC: meson: gx: add sound card support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support for the sound card used on the amlogic GX SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/Kconfig   |   7 ++
 sound/soc/meson/Makefile  |   2 +
 sound/soc/meson/gx-card.c | 141 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 150 insertions(+)
 create mode 100644 sound/soc/meson/gx-card.c

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 347fa78e309a..22d2af75b59e 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -101,6 +101,13 @@ config SND_MESON_CARD_UTILS
 config SND_MESON_CODEC_GLUE
 	tristate
 
+config SND_MESON_GX_SOUND_CARD
+	tristate "Amlogic GX Sound Card Support"
+	select SND_MESON_CARD_UTILS
+	imply SND_MESON_AIU
+	help
+	  Select Y or M to add support for the GXBB/GXL SoC sound card
+
 config SND_MESON_G12A_TOHDMITX
 	tristate "Amlogic G12A To HDMI TX Control Support"
 	select REGMAP_MMIO
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index bef2b72fd7a7..f9c90c391498 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -21,6 +21,7 @@ snd-soc-meson-axg-spdifout-objs := axg-spdifout.o
 snd-soc-meson-axg-pdm-objs := axg-pdm.o
 snd-soc-meson-card-utils-objs := meson-card-utils.o
 snd-soc-meson-codec-glue-objs := meson-codec-glue.o
+snd-soc-meson-gx-sound-card-objs := gx-card.o
 snd-soc-meson-g12a-tohdmitx-objs := g12a-tohdmitx.o
 
 obj-$(CONFIG_SND_MESON_AIU) += snd-soc-meson-aiu.o
@@ -37,4 +38,5 @@ obj-$(CONFIG_SND_MESON_AXG_SPDIFOUT) += snd-soc-meson-axg-spdifout.o
 obj-$(CONFIG_SND_MESON_AXG_PDM) += snd-soc-meson-axg-pdm.o
 obj-$(CONFIG_SND_MESON_CARD_UTILS) += snd-soc-meson-card-utils.o
 obj-$(CONFIG_SND_MESON_CODEC_GLUE) += snd-soc-meson-codec-glue.o
+obj-$(CONFIG_SND_MESON_GX_SOUND_CARD) += snd-soc-meson-gx-sound-card.o
 obj-$(CONFIG_SND_MESON_G12A_TOHDMITX) += snd-soc-meson-g12a-tohdmitx.o
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
new file mode 100644
index 000000000000..7b01dcb73e5e
--- /dev/null
+++ b/sound/soc/meson/gx-card.c
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+//
+// Copyright (c) 2020 BayLibre, SAS.
+// Author: Jerome Brunet <jbrunet@baylibre.com>
+
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "meson-card.h"
+
+struct gx_dai_link_i2s_data {
+	unsigned int mclk_fs;
+};
+
+/*
+ * Base params for the codec to codec links
+ * Those will be over-written by the CPU side of the link
+ */
+static const struct snd_soc_pcm_stream codec_params = {
+	.formats = SNDRV_PCM_FMTBIT_S24_LE,
+	.rate_min = 5525,
+	.rate_max = 192000,
+	.channels_min = 1,
+	.channels_max = 8,
+};
+
+static int gx_card_i2s_be_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct gx_dai_link_i2s_data *be =
+		(struct gx_dai_link_i2s_data *)priv->link_data[rtd->num];
+
+	return meson_card_i2s_set_sysclk(substream, params, be->mclk_fs);
+}
+
+static const struct snd_soc_ops gx_card_i2s_be_ops = {
+	.hw_params = gx_card_i2s_be_hw_params,
+};
+
+static int gx_card_parse_i2s(struct snd_soc_card *card,
+			     struct device_node *node,
+			     int *index)
+{
+	struct meson_card *priv = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai_link *link = &card->dai_link[*index];
+	struct gx_dai_link_i2s_data *be;
+
+	/* Allocate i2s link parameters */
+	be = devm_kzalloc(card->dev, sizeof(*be), GFP_KERNEL);
+	if (!be)
+		return -ENOMEM;
+	priv->link_data[*index] = be;
+
+	/* Setup i2s link */
+	link->ops = &gx_card_i2s_be_ops;
+	link->dai_fmt = meson_card_parse_daifmt(node, link->cpus->of_node);
+
+	of_property_read_u32(node, "mclk-fs", &be->mclk_fs);
+
+	return 0;
+}
+
+static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
+				char *match)
+{
+	if (of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) {
+		if (strstr(c->dai_name, match))
+			return 1;
+	}
+
+	/* dai not matched */
+	return 0;
+}
+
+static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
+			    int *index)
+{
+	struct snd_soc_dai_link *dai_link = &card->dai_link[*index];
+	struct snd_soc_dai_link_component *cpu;
+	int ret;
+
+	cpu = devm_kzalloc(card->dev, sizeof(*cpu), GFP_KERNEL);
+	if (!cpu)
+		return -ENOMEM;
+
+	dai_link->cpus = cpu;
+	dai_link->num_cpus = 1;
+
+	ret = meson_card_parse_dai(card, np, &dai_link->cpus->of_node,
+				   &dai_link->cpus->dai_name);
+	if (ret)
+		return ret;
+
+	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
+		ret = meson_card_set_fe_link(card, dai_link, np, true);
+	else
+		ret = meson_card_set_be_link(card, dai_link, np);
+
+	if (ret)
+		return ret;
+
+	/* Check if the cpu is the i2s encoder and parse i2s data */
+	if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+		ret = gx_card_parse_i2s(card, np, index);
+
+	/* Or apply codec to codec params if necessary */
+	else if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL"))
+		dai_link->params = &codec_params;
+
+	return ret;
+}
+
+static const struct meson_card_match_data gx_card_match_data = {
+	.add_link = gx_card_add_link,
+};
+
+static const struct of_device_id gx_card_of_match[] = {
+	{
+		.compatible = "amlogic,gx-sound-card",
+		.data = &gx_card_match_data,
+	}, {}
+};
+MODULE_DEVICE_TABLE(of, gx_card_of_match);
+
+static struct platform_driver gx_card_pdrv = {
+	.probe = meson_card_probe,
+	.remove = meson_card_remove,
+	.driver = {
+		.name = "gx-sound-card",
+		.of_match_table = gx_card_of_match,
+	},
+};
+module_platform_driver(gx_card_pdrv);
+
+MODULE_DESCRIPTION("Amlogic GX ALSA machine driver");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

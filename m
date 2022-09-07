Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4A95B0672
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 16:24:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66672168C;
	Wed,  7 Sep 2022 16:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66672168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662560685;
	bh=XoygatHT4Li32rCgO8k43XIL6g7WCfZNoyPKsWFgees=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gq1+LBFbcZBt/iclEmKPwNWv//x21gHf2gBVVTWXrRldylSl/29e1taIIZJv17L7j
	 CiCh9uajAnH9B1ZfTKxYzlBf4OJzuXzS2eaA3OV4xDmaPOw/Mu8/EZmR2hAOz1QxOB
	 WaRFOnzxImDKBlESFgDlXX5eGAajjslCbK1BLZH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87BA8F804B1;
	Wed,  7 Sep 2022 16:22:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A417FF80564; Wed,  7 Sep 2022 16:22:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DC82F80542
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 16:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DC82F80542
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="AOWGd9Mn"
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id D228B20000F;
 Wed,  7 Sep 2022 14:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1662560537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SRJhK68KAnFJfkryAuHaNW+7tiZrtjjidVkx4uYL5XU=;
 b=AOWGd9MnnWKkE7Kmh2RGiJ/tBsTNQAQlKX7ROe9c/tvImUL9+OaD5W96WHNG9mvr6LmjGl
 PUmSTtKfPtvyt88zsz1P9TKi8vzYE+Kx5tiTBSCYjU1wfbYNX6TDJ7TsuW+n7fkGEWEHa9
 yauHRc7Ov7tlYpoW6WRPbL0dxV0vf7gQbenMqjFAPJQTazZpap8MXWGBI7oixstVXRTdD9
 tSbp3QWfblJLKxm0SvRGUDGdSt36nQ0YrUwrQdrV+ayViu491G9x195k9S4gqsjvBJkA7k
 hdXkSoElmUCLXK6Kw7IwGFwPb1WX2xY8pMUz3K8TVuAVKNqL240woQFIA31GaA==
From: luca.ceresoli@bootlin.com
To: alsa-devel@alsa-project.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 8/8] ASoC: rockchip: add new RK3308 sound card
Date: Wed,  7 Sep 2022 16:21:24 +0200
Message-Id: <20220907142124.2532620-9-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
References: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Takashi Iwai <tiwai@suse.com>, Chris Morgan <macromorgan@hotmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Johan Jonker <jbx6244@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
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

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

The Rockchip RK3308 8-channel I2S adapter has a mainline driver that can
work fine with an audio-graph-card or simple-audio-card. Those card drivers
call the .set_sysclk op once, and this is usually enough for applications
using an external codec.

But in reality the I2S adapter has two clock inputs (TX and RX), and the
preferred way to use the RK3308 internal codec is enabling both clocks,
potentially with different rates. The existing simple-card code does not
implement this possibility.

To allow setting both clocks, add a new minimal driver that builds on top
of audio-graph-card and changes the dai_link->init callback with a modified
version of asoc_simple_init_dai(). This ultimately calls the set_sysclk()
callback as many times as the number of clocks defined in device tree.

With this implementation, the same rate is set to all the sysclks. Setting
different rates can be added later.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 MAINTAINERS                               |  1 +
 sound/soc/rockchip/Kconfig                | 14 ++++
 sound/soc/rockchip/Makefile               |  1 +
 sound/soc/rockchip/rockchip_rk3308_card.c | 97 +++++++++++++++++++++++
 4 files changed, 113 insertions(+)
 create mode 100644 sound/soc/rockchip/rockchip_rk3308_card.c

diff --git a/MAINTAINERS b/MAINTAINERS
index fb2a0a6e3c1f..96ccda9625f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17600,6 +17600,7 @@ ROCKCHIP RK3308 SOUND CARD DRIVER
 M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3308-audio-graph-card.yaml
+F:	sound/soc/rockchip/rockchip_rk3308_card.c
 
 ROCKCHIP VIDEO DECODER DRIVER
 M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index 42f76bc0fb02..b00dc04f8fd0 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -45,6 +45,20 @@ config SND_SOC_ROCKCHIP_SPDIF
 	  Say Y or M if you want to add support for SPDIF driver for
 	  Rockchip SPDIF transceiver device.
 
+config SND_SOC_ROCKCHIP_RK3308_INTERNAL_CODEC
+	tristate "ASoC sound card based on the internal RK3308 codec"
+	depends on HAVE_CLK && SND_SOC_ROCKCHIP
+	depends on SND_AUDIO_GRAPH_CARD
+	select SND_SOC_ROCKCHIP_I2S_TDM
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	help
+	  ASoC sound card driver for the RK3308 internal audio codec.
+
+	  The Rockchip RK3308 SoC has a built-in audio codec that is
+	  connected internally to one out of a selection of the internal
+	  I2S controllers. This driver implements an audio card using these
+	  components.
+
 config SND_SOC_ROCKCHIP_MAX98090
 	tristate "ASoC support for Rockchip boards using a MAX98090 codec"
 	depends on SND_SOC_ROCKCHIP && I2C && GPIOLIB && HAVE_CLK
diff --git a/sound/soc/rockchip/Makefile b/sound/soc/rockchip/Makefile
index 30c57c0d7660..680decae0c02 100644
--- a/sound/soc/rockchip/Makefile
+++ b/sound/soc/rockchip/Makefile
@@ -15,6 +15,7 @@ snd-soc-rockchip-rt5645-objs := rockchip_rt5645.o
 snd-soc-rk3288-hdmi-analog-objs := rk3288_hdmi_analog.o
 snd-soc-rk3399-gru-sound-objs := rk3399_gru_sound.o
 
+obj-$(CONFIG_SND_SOC_ROCKCHIP_RK3308_INTERNAL_CODEC) += rockchip_rk3308_card.o
 obj-$(CONFIG_SND_SOC_ROCKCHIP_MAX98090) += snd-soc-rockchip-max98090.o
 obj-$(CONFIG_SND_SOC_ROCKCHIP_RT5645) += snd-soc-rockchip-rt5645.o
 obj-$(CONFIG_SND_SOC_RK3288_HDMI_ANALOG) += snd-soc-rk3288-hdmi-analog.o
diff --git a/sound/soc/rockchip/rockchip_rk3308_card.c b/sound/soc/rockchip/rockchip_rk3308_card.c
new file mode 100644
index 000000000000..3cfc751993fe
--- /dev/null
+++ b/sound/soc/rockchip/rockchip_rk3308_card.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Audio card using the RK3308 internal I2S
+//
+// Allows driving the I2S peripheral with both the RX and TX clocks. This
+// is useful to use the RK3308 internal audio codec.
+//
+// Copyright (c) 2022, Vivax-Metrotech Ltd
+//
+// Based on sound/soc/generic/audio-graph-card.c
+
+#include <linux/module.h>
+#include <linux/of_clk.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <sound/graph_card.h>
+
+static int rk3308_audio_asoc_simple_init_dai(struct snd_soc_dai *dai,
+					     struct asoc_simple_dai *simple_dai)
+{
+	const int nclks = 2; /* The sysclks are clk_id 0 and 1 for the RK3308 driver */
+	int err;
+	int i;
+
+	if (!simple_dai || !simple_dai->sysclk)
+		return 0;
+
+	/* Can be extended to get two different sysclk values via device tree */
+	for (i = 0; i < nclks; i++) {
+		err = snd_soc_dai_set_sysclk(dai, i, simple_dai->sysclk,
+					     simple_dai->clk_direction);
+		if (err && err != -ENOTSUPP)
+			return dev_err_probe(dai->dev, err, "simple-card: set_sysclk error\n");
+	}
+
+	return 0;
+}
+
+static int rk3308_audio_asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
+	struct asoc_simple_dai *dai;
+	int i, ret;
+
+	for_each_prop_dai_codec(props, i, dai) {
+		ret = rk3308_audio_asoc_simple_init_dai(asoc_rtd_to_codec(rtd, i), dai);
+		if (ret < 0)
+			return ret;
+	}
+	for_each_prop_dai_cpu(props, i, dai) {
+		ret = rk3308_audio_asoc_simple_init_dai(asoc_rtd_to_cpu(rtd, i), dai);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int rk3308_audio_graph_probe(struct platform_device *pdev)
+{
+	struct asoc_simple_priv *priv;
+	struct device *dev = &pdev->dev;
+	struct snd_soc_card *card;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	card = simple_priv_to_card(priv);
+	card->driver_name = "rk3308-audio-graph-card";
+	card->probe = asoc_graph_card_probe;
+	priv->init = rk3308_audio_asoc_simple_dai_init;
+
+	return audio_graph_parse_of(priv, dev);
+}
+
+static const struct of_device_id graph_of_rk3308_card_match[] = {
+	{ .compatible = "rockchip,rk3308-audio-graph-card" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, graph_of_rk3308_card_match);
+
+static struct platform_driver rk3308_audio_graph_card = {
+	.driver = {
+		.name = "rk3308-audio-graph-card",
+		.pm = &snd_soc_pm_ops,
+		.of_match_table = graph_of_rk3308_card_match,
+	},
+	.probe = rk3308_audio_graph_probe,
+	.remove = asoc_simple_remove,
+};
+module_platform_driver(rk3308_audio_graph_card);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("ASoC Audio Graph Card for Rockchip RK3308");
+MODULE_AUTHOR("Luca Ceresoli <luca.ceresoli@bootlin.com>");
-- 
2.34.1


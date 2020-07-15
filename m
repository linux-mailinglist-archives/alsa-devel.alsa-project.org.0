Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F65F220EFE
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 16:16:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0250715E5;
	Wed, 15 Jul 2020 16:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0250715E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594822605;
	bh=pXctas0ONvlBI/lG2SVRUWeZGcbgMfknGnp/Ezckzqo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rpGcFHO/nAlgYfHQ1NFIM68/xAX5Wx1OSTddmBB3FlMr+93ZqPrjYzbo/StAnViul
	 Kmcmt6cSWXDk5gnCg/aONIuFWiyk/phn+MW+VJAXKV6GRdpMqVQILJDoYj/V6mkSEK
	 kwoK2naRnAvi2bTEpe39BMFeoP1CCy6awzoSmC60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4187AF802BC;
	Wed, 15 Jul 2020 16:14:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A88BF80254; Wed, 15 Jul 2020 16:14:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D14C1F8021D
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 16:13:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D14C1F8021D
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9267F1A1442;
 Wed, 15 Jul 2020 16:13:52 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0F4A31A0241;
 Wed, 15 Jul 2020 16:13:47 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A6A80402C1;
 Wed, 15 Jul 2020 22:13:40 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com
Subject: [PATCH v2 3/3] ASoC: fsl-asoc-card: Support Headphone and Microphone
 Jack detection
Date: Wed, 15 Jul 2020 22:09:39 +0800
Message-Id: <1594822179-1849-4-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594822179-1849-1-git-send-email-shengjiu.wang@nxp.com>
References: <1594822179-1849-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

Use asoc_simple_init_jack function from simple card to implement
the Headphone and Microphone detection.
Register notifier to disable Speaker when Headphone is plugged in
and enable Speaker when Headphone is unplugged.
Register notifier to disable Digital Microphone when Analog Microphone
is plugged in and enable DMIC when Analog Microphone is unplugged.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/Kconfig         |  1 +
 sound/soc/fsl/fsl-asoc-card.c | 77 ++++++++++++++++++++++++++++++++++-
 2 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index ea7b4787a8af..1c4ca5ec8caf 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -315,6 +315,7 @@ config SND_SOC_FSL_ASOC_CARD
 	depends on OF && I2C
 	# enforce SND_SOC_FSL_ASOC_CARD=m if SND_AC97_CODEC=m:
 	depends on SND_AC97_CODEC || SND_AC97_CODEC=n
+	select SND_SIMPLE_CARD_UTILS
 	select SND_SOC_IMX_AUDMUX
 	select SND_SOC_IMX_PCM_DMA
 	select SND_SOC_FSL_ESAI
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index faac6ce9a82c..f0cde3ecb5b7 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -15,6 +15,8 @@
 #endif
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
+#include <sound/jack.h>
+#include <sound/simple_card_utils.h>
 
 #include "fsl_esai.h"
 #include "fsl_sai.h"
@@ -65,6 +67,8 @@ struct cpu_priv {
 /**
  * struct fsl_asoc_card_priv - Freescale Generic ASOC card private data
  * @dai_link: DAI link structure including normal one and DPCM link
+ * @hp_jack: Headphone Jack structure
+ * @mic_jack: Microphone Jack structure
  * @pdev: platform device pointer
  * @codec_priv: CODEC private data
  * @cpu_priv: CPU private data
@@ -79,6 +83,8 @@ struct cpu_priv {
 
 struct fsl_asoc_card_priv {
 	struct snd_soc_dai_link dai_link[3];
+	struct asoc_simple_jack hp_jack;
+	struct asoc_simple_jack mic_jack;
 	struct platform_device *pdev;
 	struct codec_priv codec_priv;
 	struct cpu_priv cpu_priv;
@@ -445,6 +451,44 @@ static int fsl_asoc_card_audmux_init(struct device_node *np,
 	return 0;
 }
 
+static int hp_jack_event(struct notifier_block *nb, unsigned long event,
+			 void *data)
+{
+	struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
+	struct snd_soc_dapm_context *dapm = &jack->card->dapm;
+
+	if (event & SND_JACK_HEADPHONE)
+		/* Disable speaker if headphone is plugged in */
+		snd_soc_dapm_disable_pin(dapm, "Ext Spk");
+	else
+		snd_soc_dapm_enable_pin(dapm, "Ext Spk");
+
+	return 0;
+}
+
+static struct notifier_block hp_jack_nb = {
+	.notifier_call = hp_jack_event,
+};
+
+static int mic_jack_event(struct notifier_block *nb, unsigned long event,
+			  void *data)
+{
+	struct snd_soc_jack *jack = (struct snd_soc_jack *)data;
+	struct snd_soc_dapm_context *dapm = &jack->card->dapm;
+
+	if (event & SND_JACK_MICROPHONE)
+		/* Disable dmic if microphone is plugged in */
+		snd_soc_dapm_disable_pin(dapm, "DMIC");
+	else
+		snd_soc_dapm_enable_pin(dapm, "DMIC");
+
+	return 0;
+}
+
+static struct notifier_block mic_jack_nb = {
+	.notifier_call = mic_jack_event,
+};
+
 static int fsl_asoc_card_late_probe(struct snd_soc_card *card)
 {
 	struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(card);
@@ -745,8 +789,37 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(&priv->card, priv);
 
 	ret = devm_snd_soc_register_card(&pdev->dev, &priv->card);
-	if (ret && ret != -EPROBE_DEFER)
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
+		goto asrc_fail;
+	}
+
+	/*
+	 * Properties "hp-det-gpio" and "mic-det-gpio" are optional, and
+	 * asoc_simple_init_jack uses these properties for creating
+	 * Headphone Jack and Microphone Jack.
+	 *
+	 * The notifier is initialized in snd_soc_card_jack_new(), then
+	 * snd_soc_jack_notifier_register can be called.
+	 */
+	if (of_property_read_bool(np, "hp-det-gpio")) {
+		ret = asoc_simple_init_jack(&priv->card, &priv->hp_jack,
+					    1, NULL, "Headphone Jack");
+		if (ret)
+			goto asrc_fail;
+
+		snd_soc_jack_notifier_register(&priv->hp_jack.jack, &hp_jack_nb);
+	}
+
+	if (of_property_read_bool(np, "mic-det-gpio")) {
+		ret = asoc_simple_init_jack(&priv->card, &priv->mic_jack,
+					    0, NULL, "Mic Jack");
+		if (ret)
+			goto asrc_fail;
+
+		snd_soc_jack_notifier_register(&priv->mic_jack.jack, &mic_jack_nb);
+	}
 
 asrc_fail:
 	of_node_put(asrc_np);
-- 
2.27.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C5A15BF79
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 14:36:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 712B31684;
	Thu, 13 Feb 2020 14:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 712B31684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581600979;
	bh=RSTHFlN+lnUp8PtLbF4FwZnq1Yagauummv1en3VRPt4=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=i84HSHgW0frFd0Cud4/KukNZqIZL7ciNsG6ZRR5Ww7Mq2ZB5wDhghNjso9QUXszd9
	 2jAzUkUu4pYfY8/Rm+qpSZDRry/Z0ZDmREXI1cGPkk7Cvzpm2vCqZhIMEJ3qatQ/g9
	 q84SN2VTmoUbfYDzyj4PVrV1rMKxst/YHzDYP0z0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98B33F8028D;
	Thu, 13 Feb 2020 14:32:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 971E7F8028F; Thu, 13 Feb 2020 14:32:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B6604F8025E
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 14:32:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6604F8025E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE7DF1045;
 Thu, 13 Feb 2020 05:32:16 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51C9E3F6CF;
 Thu, 13 Feb 2020 05:32:16 -0800 (PST)
Date: Thu, 13 Feb 2020 13:32:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: mediatek: mt8183-da7219: pull TDM GPIO
	pins down when probed" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: mediatek: mt8183-da7219: pull TDM GPIO pins down when probed

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 8726ee6148fe24e2b29d4a961ad95c4ff8025d1d Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 13 Feb 2020 11:27:26 +0800
Subject: [PATCH] ASoC: mediatek: mt8183-da7219: pull TDM GPIO pins down when
 probed

1. Switch TDM GPIO pins according to playback on or off.
2. Pull TDM GPIO pins down when probed to avoid current leakage.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20200213112003.2.I1d568b0c99742c6e755d051aadfd52e4be3cc0a5@changeid
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 104 +++++++++++++++++-
 1 file changed, 98 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index b52ffed882a7..d7685916a5cb 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -18,6 +18,22 @@
 
 static struct snd_soc_jack headset_jack;
 
+enum PINCTRL_PIN_STATE {
+	PIN_STATE_DEFAULT = 0,
+	PIN_TDM_OUT_ON,
+	PIN_TDM_OUT_OFF,
+	PIN_STATE_MAX
+};
+
+static const char * const mt8183_pin_str[PIN_STATE_MAX] = {
+	"default", "aud_tdm_out_on", "aud_tdm_out_off",
+};
+
+struct mt8183_da7219_max98357_priv {
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pin_states[PIN_STATE_MAX];
+};
+
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
@@ -244,6 +260,47 @@ SND_SOC_DAILINK_DEFS(tdm,
 	DAILINK_COMP_ARRAY(COMP_DUMMY()),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
+static int mt8183_da7219_tdm_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mt8183_da7219_max98357_priv *priv =
+		snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	if (IS_ERR(priv->pin_states[PIN_TDM_OUT_ON]))
+		return PTR_ERR(priv->pin_states[PIN_TDM_OUT_ON]);
+
+	ret = pinctrl_select_state(priv->pinctrl,
+				   priv->pin_states[PIN_TDM_OUT_ON]);
+	if (ret)
+		dev_err(rtd->card->dev, "%s failed to select state %d\n",
+			__func__, ret);
+
+	return ret;
+}
+
+static void mt8183_da7219_tdm_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mt8183_da7219_max98357_priv *priv =
+		snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	if (IS_ERR(priv->pin_states[PIN_TDM_OUT_OFF]))
+		return;
+
+	ret = pinctrl_select_state(priv->pinctrl,
+				   priv->pin_states[PIN_TDM_OUT_OFF]);
+	if (ret)
+		dev_err(rtd->card->dev, "%s failed to select state %d\n",
+			__func__, ret);
+}
+
+static struct snd_soc_ops mt8183_da7219_tdm_ops = {
+	.startup = mt8183_da7219_tdm_startup,
+	.shutdown = mt8183_da7219_tdm_shutdown,
+};
+
 static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
 	/* FE */
 	{
@@ -395,6 +452,8 @@ static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
+		.be_hw_params_fixup = mt8183_i2s_hw_params_fixup,
+		.ops = &mt8183_da7219_tdm_ops,
 		SND_SOC_DAILINK_REG(tdm),
 	},
 };
@@ -470,7 +529,7 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &mt8183_da7219_max98357_card;
 	struct device_node *platform_node;
 	struct snd_soc_dai_link *dai_link;
-	struct pinctrl *default_pins;
+	struct mt8183_da7219_max98357_priv *priv;
 	int ret, i;
 
 	card->dev = &pdev->dev;
@@ -504,12 +563,45 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	default_pins =
-		devm_pinctrl_get_select(&pdev->dev, PINCTRL_STATE_DEFAULT);
-	if (IS_ERR(default_pins)) {
-		dev_err(&pdev->dev, "%s set pins failed\n",
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	snd_soc_card_set_drvdata(card, priv);
+
+	priv->pinctrl = devm_pinctrl_get(&pdev->dev);
+	if (IS_ERR(priv->pinctrl)) {
+		dev_err(&pdev->dev, "%s devm_pinctrl_get failed\n",
 			__func__);
-		return PTR_ERR(default_pins);
+		return PTR_ERR(priv->pinctrl);
+	}
+
+	for (i = 0; i < PIN_STATE_MAX; i++) {
+		priv->pin_states[i] = pinctrl_lookup_state(priv->pinctrl,
+							   mt8183_pin_str[i]);
+		if (IS_ERR(priv->pin_states[i])) {
+			ret = PTR_ERR(priv->pin_states[i]);
+			dev_info(&pdev->dev, "%s Can't find pin state %s %d\n",
+				 __func__, mt8183_pin_str[i], ret);
+		}
+	}
+
+	if (!IS_ERR(priv->pin_states[PIN_TDM_OUT_OFF])) {
+		ret = pinctrl_select_state(priv->pinctrl,
+					   priv->pin_states[PIN_TDM_OUT_OFF]);
+		if (ret)
+			dev_info(&pdev->dev,
+				 "%s failed to select state %d\n",
+				 __func__, ret);
+	}
+
+	if (!IS_ERR(priv->pin_states[PIN_STATE_DEFAULT])) {
+		ret = pinctrl_select_state(priv->pinctrl,
+					   priv->pin_states[PIN_STATE_DEFAULT]);
+		if (ret)
+			dev_info(&pdev->dev,
+				 "%s failed to select state %d\n",
+				 __func__, ret);
 	}
 
 	return ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

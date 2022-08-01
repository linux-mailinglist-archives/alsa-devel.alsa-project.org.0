Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C17586B0A
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 14:43:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 268051EA;
	Mon,  1 Aug 2022 14:42:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 268051EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659357820;
	bh=Psqus1GXa7Y0rzUkyCWkI7P5MQJU805msxDKsvE3iDM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AORAh7Jy+Q5wsq6KnZW3yYjXHyTtYpdcLa1wkoOKzYl6DTLaMt43L2kNyF1Q7r8m+
	 VXa8RGrao69rf3itkI11l5EByoXPkk++B+26qBUYooDzI0Urmayr4jWlw2HdtfMN0K
	 XRjRn8pk6T9nvR6HnMZGBbmrUYykGeqjI8gCAs4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EF2DF80246;
	Mon,  1 Aug 2022 14:42:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9BA9F8013D; Mon,  1 Aug 2022 14:42:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEAB0F8013D
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 14:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEAB0F8013D
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0228A20148F;
 Mon,  1 Aug 2022 14:42:34 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BEB9220130A;
 Mon,  1 Aug 2022 14:42:33 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 4C22A180031C;
 Mon,  1 Aug 2022 20:42:32 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: imx-rpmsg: Support configure sysclk for codec dai
Date: Mon,  1 Aug 2022 20:26:13 +0800
Message-Id: <1659356773-8315-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
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

Some codecs need to configure the sysclk even with slave
mode, otherwise it may not work properly with some case.

wm8960 is the one that need sysclk be configured, so add
late_probe() to call the snd_soc_dai_set_sysclk() of codec

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 2e117311e582..bef4bd997c98 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -19,6 +19,7 @@
 struct imx_rpmsg {
 	struct snd_soc_dai_link dai;
 	struct snd_soc_card card;
+	unsigned int sysclk;
 };
 
 static const struct snd_soc_dapm_widget imx_rpmsg_dapm_widgets[] = {
@@ -28,6 +29,27 @@ static const struct snd_soc_dapm_widget imx_rpmsg_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("Main MIC", NULL),
 };
 
+static int imx_rpmsg_late_probe(struct snd_soc_card *card)
+{
+	struct imx_rpmsg *data = snd_soc_card_get_drvdata(card);
+	struct snd_soc_pcm_runtime *rtd = list_first_entry(&card->rtd_list,
+							   struct snd_soc_pcm_runtime, list);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct device *dev = card->dev;
+	int ret;
+
+	if (!data->sysclk)
+		return 0;
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, data->sysclk, SND_SOC_CLOCK_IN);
+	if (ret && ret != -ENOTSUPP) {
+		dev_err(dev, "failed to set sysclk in %s\n", __func__);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int imx_rpmsg_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link_component *dlc;
@@ -72,12 +94,18 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		data->dai.codecs->dai_name = "snd-soc-dummy-dai";
 		data->dai.codecs->name = "snd-soc-dummy";
 	} else {
+		struct clk *clk;
+
 		data->dai.codecs->of_node = args.np;
 		ret = snd_soc_get_dai_name(&args, &data->dai.codecs->dai_name);
 		if (ret) {
 			dev_err(&pdev->dev, "Unable to get codec_dai_name\n");
 			goto fail;
 		}
+
+		clk = devm_get_clk_from_child(&pdev->dev, args.np, NULL);
+		if (!IS_ERR(clk))
+			data->sysclk = clk_get_rate(clk);
 	}
 
 	data->dai.cpus->dai_name = dev_name(&rpmsg_pdev->dev);
@@ -103,6 +131,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	data->card.owner = THIS_MODULE;
 	data->card.dapm_widgets = imx_rpmsg_dapm_widgets;
 	data->card.num_dapm_widgets = ARRAY_SIZE(imx_rpmsg_dapm_widgets);
+	data->card.late_probe = imx_rpmsg_late_probe;
 	/*
 	 * Inoder to use common api to get card name and audio routing.
 	 * Use parent of_node for this device, revert it after finishing using
-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEBE54D916
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 06:04:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC0771AB0;
	Thu, 16 Jun 2022 06:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC0771AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655352271;
	bh=f5GrQfWqlYdoOaWwETn2JxLxYiGD4lCXrZDjT8hs/PA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nCQOpzG4R6b22mMTqoK3EUv4Ey2bS+tgJzPdzdWNAsQcgr3GJzTgrIWDY/tAAHIKh
	 l5XyXSLmfLq287pKyrwBnubwlt66npUQFo47zCs7Y5terXvKaaC5eimjM9yHtkxwue
	 lomxCXdsAcUziKuCgvD1OpUQOkYMQrSdXPeyXJkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6381AF80310;
	Thu, 16 Jun 2022 06:03:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DC1BF800F0; Thu, 16 Jun 2022 06:03:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7116F800F0
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 06:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7116F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="Lsq5lPKO"
Received: from localhost.localdomain (unknown [123.112.64.211])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id A7D3A3F92F; 
 Thu, 16 Jun 2022 04:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1655352199;
 bh=bLvO9SNIs0y7Kq8yc4QJ3FM+sq77rYlYHm5FQJrvbzs=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=Lsq5lPKOF4F67JQrVRFbckCdgGF1HlWGMvQjy6W6Yn65JS3tDtehuNHRPTxdbBiZh
 GnFCsD6ja3gAg6YOcn6J6DT59fb5g2II2KoCR5yH4JpbYOD3A8UOt5AhvLfByzq74J
 MZv0dsUvA+kD+TbFjiJzbcaWIwvwRWQ2y65OfhmcK4zP1Rt25vH7eqnjeGRINLI0pH
 UFpUzGJXykwkQSNQZE+gW/UkPbCdyx3NI6EOSjlVIFTrY3TXybFNRmB/gp7DBrQx3e
 7jEID81im6FV7PDtRwRajd4jvfBeNebSrL5IzDBUjeFowsbPGwAcS2eE3niVO1VB2Y
 0Tr65KtVM3Eyw==
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/2] ASoC: fsl-asoc-card: add nau8822 support
Date: Thu, 16 Jun 2022 12:00:45 +0800
Message-Id: <20220616040046.103524-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: shengjiu.wang@nxp.com
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

This is for an imx6sx EVB which has a nau8822 codec connects to the
SSI2 interface, so add the nau8822 support in this machine driver.

Because the codec driver nau8822.c doesn't handle mclk enabling, here
adding a codec_priv->mclk for nau8822 and similar codecs which need to
enable the mclk in the machine driver, and enable the mclk in the
card_late_probe() conditionally.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index d9a0d4768c4d..89504865cb1d 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -27,6 +27,7 @@
 #include "../codecs/wm8960.h"
 #include "../codecs/wm8994.h"
 #include "../codecs/tlv320aic31xx.h"
+#include "../codecs/nau8822.h"
 
 #define CS427x_SYSCLK_MCLK 0
 
@@ -45,6 +46,7 @@
  * @pll_id: PLL id for set_pll()
  */
 struct codec_priv {
+	struct clk *mclk;
 	unsigned long mclk_freq;
 	unsigned long free_freq;
 	u32 mclk_id;
@@ -522,6 +524,9 @@ static int fsl_asoc_card_late_probe(struct snd_soc_card *card)
 		return ret;
 	}
 
+	if (!IS_ERR_OR_NULL(codec_priv->mclk))
+		clk_prepare_enable(codec_priv->mclk);
+
 	return 0;
 }
 
@@ -682,6 +687,14 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->codec_priv.free_freq = priv->codec_priv.mclk_freq;
 		priv->card.dapm_routes = NULL;
 		priv->card.num_dapm_routes = 0;
+	} else if (of_device_is_compatible(np, "fsl,imx-audio-nau8822")) {
+		codec_dai_name = "nau8822-hifi";
+		priv->codec_priv.mclk_id = NAU8822_CLK_MCLK;
+		priv->codec_priv.fll_id = NAU8822_CLK_PLL;
+		priv->codec_priv.pll_id = NAU8822_CLK_PLL;
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
+		if (codec_dev)
+			priv->codec_priv.mclk = devm_clk_get(codec_dev, NULL);
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret = -EINVAL;
@@ -907,6 +920,7 @@ static const struct of_device_id fsl_asoc_card_dt_ids[] = {
 	{ .compatible = "fsl,imx-audio-wm8524", },
 	{ .compatible = "fsl,imx-audio-si476x", },
 	{ .compatible = "fsl,imx-audio-wm8958", },
+	{ .compatible = "fsl,imx-audio-nau8822", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);
-- 
2.25.1


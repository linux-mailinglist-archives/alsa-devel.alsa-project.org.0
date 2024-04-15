Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FFF8A4931
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Apr 2024 09:38:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BD251060;
	Mon, 15 Apr 2024 09:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BD251060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713166717;
	bh=HpCFmGx4NBaky7HFi3ZWGC0MRq8UUC7ntK4Evj+X6Cc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=r0vpTw5e3x20wyl/sajJbuULiun3hILi7nfSDGlxYkP4gs23RySBOVL//n4BnjvAv
	 eTY5lzcAaIoAf16DfTh292v8SyNq8/qb8I0G7Q+5y8Yt3Z7LtfhAnEnG2l6crl3bRE
	 c7HIYKKrFyXkltBbH2jZM0/l4r4ZSerp/EV60DpI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0128F805D4; Mon, 15 Apr 2024 09:37:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 809C7F805B5;
	Mon, 15 Apr 2024 09:37:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29711F80423; Mon, 15 Apr 2024 09:36:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0564CF8013D
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 09:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0564CF8013D
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6C58E1A019F;
	Mon, 15 Apr 2024 09:35:30 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 354151A018D;
	Mon, 15 Apr 2024 09:35:30 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 55B60183AD15;
	Mon, 15 Apr 2024 15:35:28 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] ASoC: fsl-asoc-card: add wm8904 codec support
Date: Mon, 15 Apr 2024 15:17:35 +0800
Message-Id: <1713165456-3494-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1713165456-3494-1-git-send-email-shengjiu.wang@nxp.com>
References: <1713165456-3494-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: QBK4RVS6K4ZNDZPHURQXOO23FQGYPBGP
X-Message-ID-Hash: QBK4RVS6K4ZNDZPHURQXOO23FQGYPBGP
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QBK4RVS6K4ZNDZPHURQXOO23FQGYPBGP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

wm8904 codec is used on i.MX95 Toradex board

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index bc07f26ba303..f6d2564864c6 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -28,6 +28,7 @@
 #include "../codecs/wm8994.h"
 #include "../codecs/tlv320aic31xx.h"
 #include "../codecs/nau8822.h"
+#include "../codecs/wm8904.h"
 
 #define DRIVER_NAME "fsl-asoc-card"
 
@@ -709,6 +710,12 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
 		if (codec_dev)
 			priv->codec_priv.mclk = devm_clk_get(codec_dev, NULL);
+	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8904")) {
+		codec_dai_name = "wm8904-hifi";
+		priv->codec_priv.mclk_id = WM8904_FLL_MCLK;
+		priv->codec_priv.fll_id = WM8904_CLK_FLL;
+		priv->codec_priv.pll_id = WM8904_FLL_MCLK;
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret = -EINVAL;
@@ -935,6 +942,7 @@ static const struct of_device_id fsl_asoc_card_dt_ids[] = {
 	{ .compatible = "fsl,imx-audio-si476x", },
 	{ .compatible = "fsl,imx-audio-wm8958", },
 	{ .compatible = "fsl,imx-audio-nau8822", },
+	{ .compatible = "fsl,imx-audio-wm8904", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);
-- 
2.34.1


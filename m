Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2A3227736
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 05:48:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 781EC1607;
	Tue, 21 Jul 2020 05:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 781EC1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595303325;
	bh=bSJyBu1TwQ4mVDLG2a6R4zOM7vZOSEEVCTdnKauV24g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RiIdl8afyw2PuUttJ9cF5QUY0wZDwOqlkJW/ZRkAq4YbfpnWE2QDN4FyljboeaBFi
	 Wa+v048efs3tgZyP7ONGxLCRKsE2mI+ZZBqtda1ci3QcjR6GBEcCBzIRaddo6cAXFT
	 UTXolPyH6wS6JIc5vN84JIHKfu5scuX5hIXGWMx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8402BF8028B;
	Tue, 21 Jul 2020 05:46:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49950F80087; Tue, 21 Jul 2020 05:46:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE773F80087
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 05:45:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE773F80087
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 61DC12003A3;
 Tue, 21 Jul 2020 05:45:58 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 25F1720038B;
 Tue, 21 Jul 2020 05:45:53 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id CA01C4030C;
 Tue, 21 Jul 2020 11:27:10 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: fsl-asoc-card: Support configuring dai fmt from DT
Date: Tue, 21 Jul 2020 11:41:49 +0800
Message-Id: <1595302910-19688-1-git-send-email-shengjiu.wang@nxp.com>
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

Support same propeties as simple card for configuring fmt
from DT.
In order to make this change compatible with old DT, these
properties are optional.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index ee80d02b56c6..4848ba61d083 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -531,11 +531,14 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	struct device_node *cpu_np, *codec_np, *asrc_np;
 	struct device_node *np = pdev->dev.of_node;
 	struct platform_device *asrc_pdev = NULL;
+	struct device_node *bitclkmaster = NULL;
+	struct device_node *framemaster = NULL;
 	struct platform_device *cpu_pdev;
 	struct fsl_asoc_card_priv *priv;
 	struct device *codec_dev = NULL;
 	const char *codec_dai_name;
 	const char *codec_dev_name;
+	unsigned int daifmt;
 	u32 width;
 	int ret;
 
@@ -667,6 +670,31 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		goto asrc_fail;
 	}
 
+	/* Format info from DT is optional. */
+	daifmt = snd_soc_of_parse_daifmt(np, NULL,
+					 &bitclkmaster, &framemaster);
+	daifmt &= ~SND_SOC_DAIFMT_MASTER_MASK;
+	if (bitclkmaster || framemaster) {
+		if (codec_np == bitclkmaster)
+			daifmt |= (codec_np == framemaster) ?
+				SND_SOC_DAIFMT_CBM_CFM : SND_SOC_DAIFMT_CBM_CFS;
+		else
+			daifmt |= (codec_np == framemaster) ?
+				SND_SOC_DAIFMT_CBS_CFM : SND_SOC_DAIFMT_CBS_CFS;
+
+		/* Override dai_fmt with value from DT */
+		priv->dai_fmt = daifmt;
+	}
+
+	/* Change direction according to format */
+	if (priv->dai_fmt & SND_SOC_DAIFMT_CBM_CFM) {
+		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_IN;
+		priv->cpu_priv.sysclk_dir[RX] = SND_SOC_CLOCK_IN;
+	}
+
+	of_node_put(bitclkmaster);
+	of_node_put(framemaster);
+
 	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
 		dev_err(&pdev->dev, "failed to find codec device\n");
 		ret = -EPROBE_DEFER;
-- 
2.27.0


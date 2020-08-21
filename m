Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6D524CEB3
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 09:14:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C468C168E;
	Fri, 21 Aug 2020 09:13:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C468C168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597994059;
	bh=hsFilC0q1ryGsIIF62waCvhPyJEvTFWfBLAV0i0JgVU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K8pe+FXVBlhu30VA2PtWo5NoE4J0RUe6Lbgp1kshX1m6pTEa+HyKwBBziGqw/kvbl
	 22uJ4zcwZE+GnfeeFwpgAGzbLYEjn+AE8ljYLrVZoozmGwxXj2B+0xsVjZ+aKIqIUu
	 iVDIVQ8pCHVAff+DWBJD1mP1WteCMrDderclEHi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23CF0F8025A;
	Fri, 21 Aug 2020 09:12:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B0E3F8025A; Fri, 21 Aug 2020 09:12:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.tq-group.com (mx1.tq-group.com [62.157.118.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49BF4F800C0
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 09:12:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49BF4F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com
 header.b="Trkh8tzC"
IronPort-SDR: 2VXbvpM0wpDsnADs9ZVhZ6cgKIUMtgcaRhqz8Za8c/9zSkU7Y8y82HAThi5mMhwd9UfzZwvbeR
 7+ZQUzg8imTnmgzC3qV5dSItklz9GSCFruWyH+cxTarqseYt7T1wTgZKCnVuh8pFnRKNipf1Xn
 gHE68kwhcWKCOKHPWHeZHVelcbyfbTXK4T2OvAi7gPxF5gyZY6OmyqkdgjmtlQURxe+c6CnVdI
 b3qIimilR4NIZInlI9Akj2z2WU1unZT4LJqNSgTEfNSeqJ2fDnOd1cxAvImeCv2PKiwjiy+YQH
 5F4=
X-IronPort-AV: E=Sophos;i="5.76,335,1592863200"; d="scan'208";a="13549139"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 21 Aug 2020 09:12:14 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Fri, 21 Aug 2020 09:12:14 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Fri, 21 Aug 2020 09:12:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1597993934; x=1629529934;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=hsFilC0q1ryGsIIF62waCvhPyJEvTFWfBLAV0i0JgVU=;
 b=Trkh8tzC0ZhbKNS8pOevh3GZ/JkMriQfhfMOXHBeUHAABSmiycfY/WWY
 Bo8YaUF/Bo+5JSXNhP812g5tzKyp+JdUsq75gdqnnRN1U2cnZUFCw59Mr
 lJgigQpzfGsx2SOZsrzLSGdUEpXEs8Q8B0/y2ghKhe9fz1o1SWNuuwYCz
 xh4tKFfSQKyZhQ8s2SFRzNLM1PnpaLWjDFAMWmhM8yQ6yzo2WpI63knF7
 aSCC7v6/f87wtTxX353JcFVCfbbvZFfeFGY0EgU4SEiDtClIZs4Cz5+0a
 h5nDohwYTUotZ4GBWQLqjY7yGLyFw7fDMkbwH9tC1u2vjjXtI5JDi780A Q==;
IronPort-SDR: Zj2sok/VJ8Obs+mdkHurW+yviq9k9jfjO7VIKm2gnpRJvhaL3GvGHbVAPZCs6QBxmJ/RYzm1mh
 uvDTbhcWH595M9l3PTHxggtzHeGm0iQEwx0xo86ar9FggiH0NrkTa5mqi9Ib3+fEFtCO4tPIkM
 Uwsvt2p4sxGS5EN+dCmhcBfZmHMa4hV6TvWJzEF1ojUYJwg6aos0hWRTvgcyPHBdTdY7hRXRw1
 2Nppve+eskuJnLsaMRoRsOjNAu8alPc570Wy3mpHmcA54VU0WrMAOKfaGEPR5o1rM7FXMt0v98
 MXQ=
X-IronPort-AV: E=Sophos;i="5.76,335,1592863200"; d="scan'208";a="13549138"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 21 Aug 2020 09:12:14 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de
 [10.117.49.26])
 by vtuxmail01.tq-net.de (Postfix) with ESMTPA id D9150280065;
 Fri, 21 Aug 2020 09:12:13 +0200 (CEST)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Timur Tabi <timur@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH 2/2] ASoC: fsl-asoc-card: add support for TLV320AIC32x4 codec
Date: Fri, 21 Aug 2020 09:11:53 +0200
Message-Id: <20200821071153.7317-2-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821071153.7317-1-matthias.schiffer@ew.tq-group.com>
References: <20200821071153.7317-1-matthias.schiffer@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
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

The TLV320AIC32x4 is commonly used on TQ-Systems starterkit mainboards
for i.MX-based SoMs (i.MX6Q/DL, i.MX6UL, i.MX7) and LS1021A.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 sound/soc/fsl/Kconfig         | 2 +-
 sound/soc/fsl/fsl-asoc-card.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 1c4ca5ec8caf..3f76ff71ea47 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -324,7 +324,7 @@ config SND_SOC_FSL_ASOC_CARD
 	help
 	 ALSA SoC Audio support with ASRC feature for Freescale SoCs that have
 	 ESAI/SAI/SSI and connect with external CODECs such as WM8962, CS42888,
-	 CS4271, CS4272 and SGTL5000.
+	 CS4271, CS4272, SGTL5000 and TLV320AIC32x4.
 	 Say Y if you want to add support for Freescale Generic ASoC Sound Card.
 
 config SND_SOC_IMX_AUDMIX
diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 32f8f756e6bb..a2dd3b6b7fec 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -617,6 +617,9 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		codec_dai_name = "sgtl5000";
 		priv->codec_priv.mclk_id = SGTL5000_SYSCLK;
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
+	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic32x4")) {
+		codec_dai_name = "tlv320aic32x4-hifi";
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8962")) {
 		codec_dai_name = "wm8962";
 		priv->codec_priv.mclk_id = WM8962_SYSCLK_MCLK;
@@ -860,6 +863,7 @@ static const struct of_device_id fsl_asoc_card_dt_ids[] = {
 	{ .compatible = "fsl,imx-audio-ac97", },
 	{ .compatible = "fsl,imx-audio-cs42888", },
 	{ .compatible = "fsl,imx-audio-cs427x", },
+	{ .compatible = "fsl,imx-audio-tlv320aic32x4", },
 	{ .compatible = "fsl,imx-audio-sgtl5000", },
 	{ .compatible = "fsl,imx-audio-wm8962", },
 	{ .compatible = "fsl,imx-audio-wm8960", },
-- 
2.17.1


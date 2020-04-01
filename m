Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BD319A811
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Apr 2020 10:59:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49FFB1694;
	Wed,  1 Apr 2020 10:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49FFB1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585731555;
	bh=9jB/jCmCIOjZCadHwmwN7BtYJW9IYGt6BjPWuHk/ZnY=;
	h=From:To:Subject:Date:In-Reply-To:References:In-Reply-To:
	 References:Cc:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=lMmqhi6lQ3cESR5XQ4NSVN3ahWuLszPtlwbJFksJW4119rORyyVtmHwe/EuvHx/HD
	 IWo+Te2cJqX5x89rretbno44RNFBNGfFT1xpBVGAaSqqt5XcabbNIWTCGFCFp0LJt4
	 vN0H+95ykp2HS8036OqWa479iW4LOjHqhvRZk8y0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B7F9F802EA;
	Wed,  1 Apr 2020 10:53:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2CB2F80110; Wed,  1 Apr 2020 10:53:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1F1DF80110
 for <alsa-devel@alsa-project.org>; Wed,  1 Apr 2020 10:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1F1DF80110
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 47BAB1A0D50;
 Wed,  1 Apr 2020 10:53:21 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 27CD11A0D44;
 Wed,  1 Apr 2020 10:53:14 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 58100402D0;
 Wed,  1 Apr 2020 16:53:05 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org
Subject: [PATCH v6 3/7] ASoC: fsl-asoc-card: Support new property fsl,
 asrc-format
Date: Wed,  1 Apr 2020 16:45:36 +0800
Message-Id: <b8d6d9322e865f61f0c9cb17c69a399624e07676.1585726761.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1585726761.git.shengjiu.wang@nxp.com>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1585726761.git.shengjiu.wang@nxp.com>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
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

In order to align with new ESARC, we add new property fsl,asrc-format.
The fsl,asrc-format can replace the fsl,asrc-width, driver
can accept format from devicetree, don't need to convert it to
format through width.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index bb33601fab84..a0f5eb27d61a 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -680,17 +680,20 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 			goto asrc_fail;
 		}
 
-		ret = of_property_read_u32(asrc_np, "fsl,asrc-width", &width);
+		ret = of_property_read_u32(asrc_np, "fsl,asrc-format", &priv->asrc_format);
 		if (ret) {
-			dev_err(&pdev->dev, "failed to get output rate\n");
-			ret = -EINVAL;
-			goto asrc_fail;
-		}
+			/* Fallback to old binding; translate to asrc_format */
+			ret = of_property_read_u32(asrc_np, "fsl,asrc-width", &width);
+			if (ret) {
+				dev_err(&pdev->dev, "failed to get output width\n");
+				return ret;
+			}
 
-		if (width == 24)
-			priv->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
-		else
-			priv->asrc_format = SNDRV_PCM_FORMAT_S16_LE;
+			if (width == 24)
+				priv->asrc_format = SNDRV_PCM_FORMAT_S24_LE;
+			else
+				priv->asrc_format = SNDRV_PCM_FORMAT_S16_LE;
+		}
 	}
 
 	/* Finish card registering */
-- 
2.21.0


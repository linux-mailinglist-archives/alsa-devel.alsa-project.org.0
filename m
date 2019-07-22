Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A0170039
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:54:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 226CF17E7;
	Mon, 22 Jul 2019 14:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 226CF17E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563800044;
	bh=n9df1eyYg1WABTyYnIf2b/zEjRyCeVeXZ+CfhA7nDHI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BZCzaa18Xi/6wafAmG/GNIh8HpC1GZ2UR5N9Cwq8emNAcX1ktjLX3ENlsqg3Tpkhn
	 CC9C1ZqsNQQfl1YZr4ACp9jRGB3wB3+GbeA9aEqfVOY8IkSm65BwPswMzNOKTIqSci
	 6kl+4ce8O6MsHPB48C0Y1U4vGTLvUT9B2ypsz5TA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B36C3F80528;
	Mon, 22 Jul 2019 14:49:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 509BFF804AB; Mon, 22 Jul 2019 14:49:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20302F803F3
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20302F803F3
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BF1901A0108;
 Mon, 22 Jul 2019 14:48:53 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B176F1A00AA;
 Mon, 22 Jul 2019 14:48:53 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 0430E205DB;
 Mon, 22 Jul 2019 14:48:52 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Date: Mon, 22 Jul 2019 15:48:30 +0300
Message-Id: <20190722124833.28757-8-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722124833.28757-1-daniel.baluta@nxp.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 viorel.suman@nxp.com, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com, angus@akkea.ca,
 tiwai@suse.com, nicoleotsuka@gmail.com, linux-imx@nxp.com,
 kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org,
 l.stach@pengutronix.de
Subject: [alsa-devel] [PATCH 07/10] ASoC: fsl_sai: Add support for FIFO
	combine mode
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

FIFO combining mode allows the separate FIFOs for multiple data channels
to be used as a single FIFO for either software accesses or a single data
channel or both.

FIFO combined mode is described in chapter 13.10.3.5.4 from i.MX8MQ
reference manual [1].

For each direction (RX/TX) fifo combine mode is read from fsl,fcomb-mode
DT property. By default, if no property is specified fifo combine mode
is disabled.

[1]https://cache.nxp.com/secured/assets/documents/en/reference-manual/IMX8MDQLQRM.pdf?__gda__=1563728701_38bea7f0f726472cc675cb141b91bec7&fileExt=.pdf

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 37 +++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_sai.h |  9 +++++++++
 2 files changed, 46 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index d0fa02188b7c..140014901fce 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -475,6 +475,35 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
+	switch (sai->soc_data->fcomb_mode[tx]) {
+	case FSL_SAI_FCOMB_NONE:
+		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
+				   FSL_SAI_CR4_FCOMB_SOFT |
+				   FSL_SAI_CR4_FCOMB_SHIFT, 0);
+		break;
+	case FSL_SAI_FCOMB_SHIFT:
+		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
+				   FSL_SAI_CR4_FCOMB_SOFT |
+				   FSL_SAI_CR4_FCOMB_SHIFT,
+				   FSL_SAI_CR4_FCOMB_SHIFT);
+		break;
+	case FSL_SAI_FCOMB_SOFT:
+		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
+				   FSL_SAI_CR4_FCOMB_SOFT |
+				   FSL_SAI_CR4_FCOMB_SHIFT,
+				   FSL_SAI_CR4_FCOMB_SOFT);
+		break;
+	case FSL_SAI_FCOMB_BOTH:
+		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
+				   FSL_SAI_CR4_FCOMB_SOFT |
+				   FSL_SAI_CR4_FCOMB_SHIFT,
+				   FSL_SAI_CR4_FCOMB_SOFT |
+				   FSL_SAI_CR4_FCOMB_SHIFT);
+		break;
+	default:
+		break;
+	}
+
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
 			   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
 			   val_cr4);
@@ -887,6 +916,14 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		}
 	}
 
+	/* FIFO combine mode for TX/RX, defaults to disabled */
+	sai->fcomb_mode[RX] = FSL_SAI_FCOMB_NONE;
+	sai->fcomb_mode[TX] = FSL_SAI_FCOMB_NONE;
+	of_property_read_u32_index(np, "fsl,fcomb-mode", RX,
+				   &sai->fcomb_mode[RX]);
+	of_property_read_u32_index(np, "fsl,fcomb-mode", TX,
+				   &sai->fcomb_mode[TX]);
+
 	/* active data lines mask for TX/RX, defaults to 1 (only the first
 	 * data line is enabled
 	 */
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 6d32f0950ec5..abf140951187 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -115,6 +115,8 @@
 #define FSL_SAI_CR3_WDFL_MASK	0x1f
 
 /* SAI Transmit and Receive Configuration 4 Register */
+#define FSL_SAI_CR4_FCOMB_SHIFT BIT(26)
+#define FSL_SAI_CR4_FCOMB_SOFT  BIT(27)
 #define FSL_SAI_CR4_FRSZ(x)	(((x) - 1) << 16)
 #define FSL_SAI_CR4_FRSZ_MASK	(0x1f << 16)
 #define FSL_SAI_CR4_SYWD(x)	(((x) - 1) << 8)
@@ -155,6 +157,12 @@
 #define FSL_SAI_MAXBURST_TX 6
 #define FSL_SAI_MAXBURST_RX 6
 
+/* FIFO combine modes */
+#define FSL_SAI_FCOMB_NONE     0
+#define FSL_SAI_FCOMB_SHIFT    1
+#define FSL_SAI_FCOMB_SOFT     2
+#define FSL_SAI_FCOMB_BOTH     3
+
 struct fsl_sai_soc_data {
 	bool use_imx_pcm;
 	unsigned int fifo_depth;
@@ -177,6 +185,7 @@ struct fsl_sai {
 	unsigned int slot_width;
 
 	unsigned int dl_mask[2];
+	unsigned int fcomb_mode[2];
 
 	const struct fsl_sai_soc_data *soc_data;
 	struct snd_dmaengine_dai_dma_data dma_params_rx;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

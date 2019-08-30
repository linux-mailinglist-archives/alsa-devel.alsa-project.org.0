Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4F7A40BA
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Aug 2019 00:57:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57CF5165D;
	Sat, 31 Aug 2019 00:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57CF5165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567205829;
	bh=j4vpGxzWqNX/E3lHJ39GssY6XPCrDaf5AcEBFoou/oc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dcng+zEzxWfdZotNNPypA08a/NPJre5f8ZG+JcxcnJgaC+bfF/n1V6OILt6KHNy5A
	 NgmhNXtCfSszCGIgLwL2N827gRGcE5ZxEjN8y1SlxBdWLPEJbAm+IYTMUNILpgnNJO
	 kC3PPX/EoFSc1cjEkVcYp5Q8jDAreMkgE2pe/JZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0A76F800AA;
	Sat, 31 Aug 2019 00:55:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E18AFF80369; Sat, 31 Aug 2019 00:55:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1362BF800AA
 for <alsa-devel@alsa-project.org>; Sat, 31 Aug 2019 00:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1362BF800AA
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B8A351A008B;
 Sat, 31 Aug 2019 00:55:16 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A20AB1A0412;
 Sat, 31 Aug 2019 00:55:16 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 222C220627;
 Sat, 31 Aug 2019 00:55:16 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Date: Sat, 31 Aug 2019 01:55:14 +0300
Message-Id: <20190830225514.5283-1-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 Daniel Baluta <daniel.baluta@nxp.com>, shengjiu.wang@nxp.com,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 NXP Linux Team <linux-imx@nxp.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>, gabrielcsmo@gmail.com,
 festevam@gmail.com
Subject: [alsa-devel] [PATCH] ASoC: fsl_sai: Set SAI Channel Mode to Output
	Mode
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

From SAI datasheet:

CHMOD, configures if transmit data pins are configured for TDM mode
or Output mode.
	* (0) TDM mode, transmit data pins are tri-stated when slots are
	masked or channels are disabled.
	* (1) Output mode, transmit data pins are never tri-stated and
	will output zero when slots are masked or channels are disabled.

When data pins are tri-stated, there is noise on some channels
when FS clock value is high and data is read while fsclk is
transitioning from high to low.

Fix this by setting CHMOD to Output Mode so that pins will output zero
when slots are masked or channels are disabled.

Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 15 ++++++++++++---
 sound/soc/fsl/fsl_sai.h |  2 ++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index e896b577b1f7..b9daab0eb6eb 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -467,6 +467,12 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	val_cr4 |= FSL_SAI_CR4_FRSZ(slots);
 
+	/*
+	 * set CHMOD to Output Mode so that transmit data pins will
+	 * output zero when slots are masked or channels are disabled
+	 */
+	val_cr4 |= FSL_SAI_CR4_CHMOD;
+
 	/*
 	 * For SAI master mode, when Tx(Rx) sync with Rx(Tx) clock, Rx(Tx) will
 	 * generate bclk and frame clock for Tx(Rx), we should set RCR4(TCR4),
@@ -477,7 +483,8 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	if (!sai->is_slave_mode) {
 		if (!sai->synchronous[TX] && sai->synchronous[RX] && !tx) {
 			regmap_update_bits(sai->regmap, FSL_SAI_TCR4(ofs),
-				FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
+				FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK |
+				FSL_SAI_CR4_CHMOD_MASK,
 				val_cr4);
 			regmap_update_bits(sai->regmap, FSL_SAI_TCR5(ofs),
 				FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
@@ -486,7 +493,8 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 				~0UL - ((1 << channels) - 1));
 		} else if (!sai->synchronous[RX] && sai->synchronous[TX] && tx) {
 			regmap_update_bits(sai->regmap, FSL_SAI_RCR4(ofs),
-				FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
+				FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK |
+				FSL_SAI_CR4_CHMOD_MASK,
 				val_cr4);
 			regmap_update_bits(sai->regmap, FSL_SAI_RCR5(ofs),
 				FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
@@ -497,7 +505,8 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
-			   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
+			   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK |
+			   FSL_SAI_CR4_CHMOD_MASK,
 			   val_cr4);
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR5(tx, ofs),
 			   FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index f96f8d97489d..1e3b4a6889a8 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -119,6 +119,8 @@
 #define FSL_SAI_CR4_FRSZ_MASK	(0x1f << 16)
 #define FSL_SAI_CR4_SYWD(x)	(((x) - 1) << 8)
 #define FSL_SAI_CR4_SYWD_MASK	(0x1f << 8)
+#define FSL_SAI_CR4_CHMOD	BIT(5)
+#define FSL_SAI_CR4_CHMOD_MASK	GENMASK(5, 5)
 #define FSL_SAI_CR4_MF		BIT(4)
 #define FSL_SAI_CR4_FSE		BIT(3)
 #define FSL_SAI_CR4_FSP		BIT(1)
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

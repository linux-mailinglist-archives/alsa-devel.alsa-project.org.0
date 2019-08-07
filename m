Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F73584D8A
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 15:38:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32A5486F;
	Wed,  7 Aug 2019 15:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32A5486F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565185118;
	bh=7+uf1xq4SpyRO4UAfXgot+FSLalnECu1XnrK1zUuMG8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=OJJsFwbSxMQonf677TPbxHfkoZuQQBC4EbpzSp5RnSexMLJdSDJQij0318ADdTv7+
	 3tHTqG6gwtR2cHsUS80XkUjhiX/GUJ8MCOTL7qApCkm57/xFWsLnembdZ7Jv2Rup6V
	 4wsDNttG4fzV2LUBxO5plVY658QgKoz68WPQFQ5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 304F3F80676;
	Wed,  7 Aug 2019 15:31:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4F84F805FB; Wed,  7 Aug 2019 15:31:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB5ADF8053B
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 15:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB5ADF8053B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="aGd22mEb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=3UbDlGqu8J/qf3Muw4+FeFpHBLEEmWRQETYIxImINsM=; b=aGd22mEbH1u7
 CzoMkrHYWf/qyubfujXZSsT8wSD5jWB7P1atVxlOWeMLnndIPNL/NGZsc6UzeWnnN71zHc3+DD1b0
 4N//DropZBuGAOnkuZYh0T7ZGBl302iQRFQHnjSMAM6JFRAodekmO4s6ySN9BcWBV3omzHuAdnR0b
 NRvqo=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvM1g-0007fD-4m; Wed, 07 Aug 2019 13:30:48 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 452A7274304E; Wed,  7 Aug 2019 14:30:47 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20190806151214.6783-2-daniel.baluta@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190807133047.452A7274304E@ypsilon.sirena.org.uk>
Date: Wed,  7 Aug 2019 14:30:47 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 robh@kernel.org, shengjiu.wang@nxp.com, angus@akkea.ca,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
 mihai.serban@gmail.com, l.stach@pengutronix.de
Subject: [alsa-devel] Applied "ASoC: fsl_sai: Add registers definition for
	multiple datalines" to the asoc tree
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

   ASoC: fsl_sai: Add registers definition for multiple datalines

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 5f0ac20ed6db1d6da2eea8b862cf3d54fdfb5830 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Tue, 6 Aug 2019 18:12:10 +0300
Subject: [PATCH] ASoC: fsl_sai: Add registers definition for multiple
 datalines

SAI IP supports up to 8 data lines. The configuration of
supported number of data lines is decided at SoC integration
time.

This patch adds definitions for all related data TX/RX registers:
	* TDR0..7, Transmit data register
	* TFR0..7, Transmit FIFO register
	* RDR0..7, Receive data register
	* RFR0..7, Receive FIFO register

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Link: https://lore.kernel.org/r/20190806151214.6783-2-daniel.baluta@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_sai.c | 76 +++++++++++++++++++++++++++++++++++------
 sound/soc/fsl/fsl_sai.h | 36 ++++++++++++++++---
 2 files changed, 98 insertions(+), 14 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 8f4d9fa95599..e4221f2a5ee3 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -685,7 +685,14 @@ static struct reg_default fsl_sai_reg_defaults[] = {
 	{FSL_SAI_TCR3, 0},
 	{FSL_SAI_TCR4, 0},
 	{FSL_SAI_TCR5, 0},
-	{FSL_SAI_TDR,  0},
+	{FSL_SAI_TDR0, 0},
+	{FSL_SAI_TDR1, 0},
+	{FSL_SAI_TDR2, 0},
+	{FSL_SAI_TDR3, 0},
+	{FSL_SAI_TDR4, 0},
+	{FSL_SAI_TDR5, 0},
+	{FSL_SAI_TDR6, 0},
+	{FSL_SAI_TDR7, 0},
 	{FSL_SAI_TMR,  0},
 	{FSL_SAI_RCR1, 0},
 	{FSL_SAI_RCR2, 0},
@@ -704,7 +711,14 @@ static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
 	case FSL_SAI_TCR3:
 	case FSL_SAI_TCR4:
 	case FSL_SAI_TCR5:
-	case FSL_SAI_TFR:
+	case FSL_SAI_TFR0:
+	case FSL_SAI_TFR1:
+	case FSL_SAI_TFR2:
+	case FSL_SAI_TFR3:
+	case FSL_SAI_TFR4:
+	case FSL_SAI_TFR5:
+	case FSL_SAI_TFR6:
+	case FSL_SAI_TFR7:
 	case FSL_SAI_TMR:
 	case FSL_SAI_RCSR:
 	case FSL_SAI_RCR1:
@@ -712,8 +726,22 @@ static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
 	case FSL_SAI_RCR3:
 	case FSL_SAI_RCR4:
 	case FSL_SAI_RCR5:
-	case FSL_SAI_RDR:
-	case FSL_SAI_RFR:
+	case FSL_SAI_RDR0:
+	case FSL_SAI_RDR1:
+	case FSL_SAI_RDR2:
+	case FSL_SAI_RDR3:
+	case FSL_SAI_RDR4:
+	case FSL_SAI_RDR5:
+	case FSL_SAI_RDR6:
+	case FSL_SAI_RDR7:
+	case FSL_SAI_RFR0:
+	case FSL_SAI_RFR1:
+	case FSL_SAI_RFR2:
+	case FSL_SAI_RFR3:
+	case FSL_SAI_RFR4:
+	case FSL_SAI_RFR5:
+	case FSL_SAI_RFR6:
+	case FSL_SAI_RFR7:
 	case FSL_SAI_RMR:
 		return true;
 	default:
@@ -726,9 +754,30 @@ static bool fsl_sai_volatile_reg(struct device *dev, unsigned int reg)
 	switch (reg) {
 	case FSL_SAI_TCSR:
 	case FSL_SAI_RCSR:
-	case FSL_SAI_TFR:
-	case FSL_SAI_RFR:
-	case FSL_SAI_RDR:
+	case FSL_SAI_TFR0:
+	case FSL_SAI_TFR1:
+	case FSL_SAI_TFR2:
+	case FSL_SAI_TFR3:
+	case FSL_SAI_TFR4:
+	case FSL_SAI_TFR5:
+	case FSL_SAI_TFR6:
+	case FSL_SAI_TFR7:
+	case FSL_SAI_RFR0:
+	case FSL_SAI_RFR1:
+	case FSL_SAI_RFR2:
+	case FSL_SAI_RFR3:
+	case FSL_SAI_RFR4:
+	case FSL_SAI_RFR5:
+	case FSL_SAI_RFR6:
+	case FSL_SAI_RFR7:
+	case FSL_SAI_RDR0:
+	case FSL_SAI_RDR1:
+	case FSL_SAI_RDR2:
+	case FSL_SAI_RDR3:
+	case FSL_SAI_RDR4:
+	case FSL_SAI_RDR5:
+	case FSL_SAI_RDR6:
+	case FSL_SAI_RDR7:
 		return true;
 	default:
 		return false;
@@ -744,7 +793,14 @@ static bool fsl_sai_writeable_reg(struct device *dev, unsigned int reg)
 	case FSL_SAI_TCR3:
 	case FSL_SAI_TCR4:
 	case FSL_SAI_TCR5:
-	case FSL_SAI_TDR:
+	case FSL_SAI_TDR0:
+	case FSL_SAI_TDR1:
+	case FSL_SAI_TDR2:
+	case FSL_SAI_TDR3:
+	case FSL_SAI_TDR4:
+	case FSL_SAI_TDR5:
+	case FSL_SAI_TDR6:
+	case FSL_SAI_TDR7:
 	case FSL_SAI_TMR:
 	case FSL_SAI_RCSR:
 	case FSL_SAI_RCR1:
@@ -883,8 +939,8 @@ static int fsl_sai_probe(struct platform_device *pdev)
 				   MCLK_DIR(index));
 	}
 
-	sai->dma_params_rx.addr = res->start + FSL_SAI_RDR;
-	sai->dma_params_tx.addr = res->start + FSL_SAI_TDR;
+	sai->dma_params_rx.addr = res->start + FSL_SAI_RDR0;
+	sai->dma_params_tx.addr = res->start + FSL_SAI_TDR0;
 	sai->dma_params_rx.maxburst = FSL_SAI_MAXBURST_RX;
 	sai->dma_params_tx.maxburst = FSL_SAI_MAXBURST_TX;
 
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 7c1ef671da28..4bb478041d67 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -20,8 +20,22 @@
 #define FSL_SAI_TCR3	0x0c /* SAI Transmit Configuration 3 */
 #define FSL_SAI_TCR4	0x10 /* SAI Transmit Configuration 4 */
 #define FSL_SAI_TCR5	0x14 /* SAI Transmit Configuration 5 */
-#define FSL_SAI_TDR	0x20 /* SAI Transmit Data */
-#define FSL_SAI_TFR	0x40 /* SAI Transmit FIFO */
+#define FSL_SAI_TDR0	0x20 /* SAI Transmit Data 0 */
+#define FSL_SAI_TDR1	0x24 /* SAI Transmit Data 1 */
+#define FSL_SAI_TDR2	0x28 /* SAI Transmit Data 2 */
+#define FSL_SAI_TDR3	0x2C /* SAI Transmit Data 3 */
+#define FSL_SAI_TDR4	0x30 /* SAI Transmit Data 4 */
+#define FSL_SAI_TDR5	0x34 /* SAI Transmit Data 5 */
+#define FSL_SAI_TDR6	0x38 /* SAI Transmit Data 6 */
+#define FSL_SAI_TDR7	0x3C /* SAI Transmit Data 7 */
+#define FSL_SAI_TFR0	0x40 /* SAI Transmit FIFO 0 */
+#define FSL_SAI_TFR1	0x44 /* SAI Transmit FIFO 1 */
+#define FSL_SAI_TFR2	0x48 /* SAI Transmit FIFO 2 */
+#define FSL_SAI_TFR3	0x4C /* SAI Transmit FIFO 3 */
+#define FSL_SAI_TFR4	0x50 /* SAI Transmit FIFO 4 */
+#define FSL_SAI_TFR5	0x54 /* SAI Transmit FIFO 5 */
+#define FSL_SAI_TFR6	0x58 /* SAI Transmit FIFO 6 */
+#define FSL_SAI_TFR7	0x5C /* SAI Transmit FIFO 7 */
 #define FSL_SAI_TMR	0x60 /* SAI Transmit Mask */
 #define FSL_SAI_RCSR	0x80 /* SAI Receive Control */
 #define FSL_SAI_RCR1	0x84 /* SAI Receive Configuration 1 */
@@ -29,8 +43,22 @@
 #define FSL_SAI_RCR3	0x8c /* SAI Receive Configuration 3 */
 #define FSL_SAI_RCR4	0x90 /* SAI Receive Configuration 4 */
 #define FSL_SAI_RCR5	0x94 /* SAI Receive Configuration 5 */
-#define FSL_SAI_RDR	0xa0 /* SAI Receive Data */
-#define FSL_SAI_RFR	0xc0 /* SAI Receive FIFO */
+#define FSL_SAI_RDR0	0xa0 /* SAI Receive Data 0 */
+#define FSL_SAI_RDR1	0xa4 /* SAI Receive Data 1 */
+#define FSL_SAI_RDR2	0xa8 /* SAI Receive Data 2 */
+#define FSL_SAI_RDR3	0xac /* SAI Receive Data 3 */
+#define FSL_SAI_RDR4	0xb0 /* SAI Receive Data 4 */
+#define FSL_SAI_RDR5	0xb4 /* SAI Receive Data 5 */
+#define FSL_SAI_RDR6	0xb8 /* SAI Receive Data 6 */
+#define FSL_SAI_RDR7	0xbc /* SAI Receive Data 7 */
+#define FSL_SAI_RFR0	0xc0 /* SAI Receive FIFO 0 */
+#define FSL_SAI_RFR1	0xc4 /* SAI Receive FIFO 1 */
+#define FSL_SAI_RFR2	0xc8 /* SAI Receive FIFO 2 */
+#define FSL_SAI_RFR3	0xcc /* SAI Receive FIFO 3 */
+#define FSL_SAI_RFR4	0xd0 /* SAI Receive FIFO 4 */
+#define FSL_SAI_RFR5	0xd4 /* SAI Receive FIFO 5 */
+#define FSL_SAI_RFR6	0xd8 /* SAI Receive FIFO 6 */
+#define FSL_SAI_RFR7	0xdc /* SAI Receive FIFO 7 */
 #define FSL_SAI_RMR	0xe0 /* SAI Receive Mask */
 
 #define FSL_SAI_xCSR(tx)	(tx ? FSL_SAI_TCSR : FSL_SAI_RCSR)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

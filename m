Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FDB6BAE3
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 13:00:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E23DB16A6;
	Wed, 17 Jul 2019 12:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E23DB16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563361217;
	bh=hrASVk8wN0oQ00mO/pEjE8BJznrzwTmNLUPXiwVqWMI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AbGMlCcrpUPuJqAGWcZmq8uBVSiqiGwdLPhfj2iINLHFygRSJjWkX5yY9CBvVzKqd
	 vD45bDnqhHvIC1Sd2mzhVlR8fXBcBxUwh8JS5BIc/+v22O1WKLRTKj6I6H16C1IlS8
	 cAvKtQ+ppPoT9k+UcePfQiTqpKtmcDdEllV9dwlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A502F80440;
	Wed, 17 Jul 2019 12:56:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4C34F8036B; Wed, 17 Jul 2019 12:56:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4B3DF80228
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 12:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4B3DF80228
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hnhbx-0000LT-Q4; Wed, 17 Jul 2019 12:56:37 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Wed, 17 Jul 2019 12:56:34 +0200
Message-Id: <20190717105635.18514-3-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717105635.18514-1-l.stach@pengutronix.de>
References: <20190717105635.18514-1-l.stach@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, Angus Ainslie <angus@akkea.ca>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Subject: [alsa-devel] [PATCH 2/3] ASoC: fsl_sai: derive TX FIFO watermark
	from FIFO depth
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The DMA request schould be triggered as soon as the FIFO has space
for another burst. As different versions of the SAI block have
different FIFO sizes, the watrmark level needs to be derived from
version specific data.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 4 +++-
 sound/soc/fsl/fsl_sai.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 3a1ed8b857d6..b3cd055a61c7 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -649,7 +649,7 @@ static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 	regmap_write(sai->regmap, FSL_SAI_RCSR, 0);
 
 	regmap_update_bits(sai->regmap, FSL_SAI_TCR1, FSL_SAI_CR1_RFW_MASK,
-			   FSL_SAI_MAXBURST_TX * 2);
+			   sai->soc_data->fifo_depth - FSL_SAI_MAXBURST_TX);
 	regmap_update_bits(sai->regmap, FSL_SAI_RCR1, FSL_SAI_CR1_RFW_MASK,
 			   FSL_SAI_MAXBURST_RX - 1);
 
@@ -923,10 +923,12 @@ static int fsl_sai_remove(struct platform_device *pdev)
 
 static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
 	.use_imx_pcm = false,
+	.fifo_depth = 32,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
 	.use_imx_pcm = true,
+	.fifo_depth = 32,
 };
 
 static const struct of_device_id fsl_sai_ids[] = {
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 83e2bfe05b1b..7c1ef671da28 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -128,6 +128,7 @@
 
 struct fsl_sai_soc_data {
 	bool use_imx_pcm;
+	unsigned int fifo_depth;
 };
 
 struct fsl_sai {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

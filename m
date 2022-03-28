Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CA14E94BE
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 13:31:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DF3617E0;
	Mon, 28 Mar 2022 13:30:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DF3617E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648467084;
	bh=54/ueIQm/5LhVgvyxBqsUeT1EROkzwm6YHuFqzHVq6g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qN8Dv9uDM5xE+kbqfogbc2qYCIC04hEYGs616P32weUwLP0Hus5MJt6BPDckK458A
	 uY2UvX2JdjIS0Uj/4TCdHpSi0GMtqX/lN1nx8FmuuTb4L0TElO+pJ2GKTU+UF4fF+c
	 Jct1zal5YtyBAFjLfMEmHsUDSB/oxfhWlfpYvq+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA3E7F8052F;
	Mon, 28 Mar 2022 13:28:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB642F8026A; Mon, 28 Mar 2022 13:28:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 240B9F804CF
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 13:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 240B9F804CF
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nYnXi-0003St-U6; Mon, 28 Mar 2022 13:28:14 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nYnXe-003Zlf-Sj; Mon, 28 Mar 2022 13:28:13 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nYnXd-006byo-Jv; Mon, 28 Mar 2022 13:28:09 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 12/19] ASoC: fsl_micfil: use define for OSR default value
Date: Mon, 28 Mar 2022 13:27:37 +0200
Message-Id: <20220328112744.1575631-13-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220328112744.1575631-1-s.hauer@pengutronix.de>
References: <20220328112744.1575631-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 dmaengine@vger.kernel.org, Shengjiu Wang <shengjiu.wang@gmail.com>
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

The OSR (OverSampling Rate) setting is set once to the default value
and never changed throughout the driver. Nevertheless the value is
read back from the register for further calculations. Just use the
default value because we know what we have written.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/fsl/fsl_micfil.c | 10 ++++++----
 sound/soc/fsl/fsl_micfil.h |  1 -
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index fe3e1319b35fd..4b4b7fbbf5c4f 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -29,6 +29,8 @@
 #define FSL_MICFIL_RATES		SNDRV_PCM_RATE_8000_48000
 #define FSL_MICFIL_FORMATS		(SNDRV_PCM_FMTBIT_S16_LE)
 
+#define MICFIL_OSR_DEFAULT	16
+
 struct fsl_micfil {
 	struct platform_device *pdev;
 	struct regmap *regmap;
@@ -41,6 +43,7 @@ struct fsl_micfil {
 	char name[32];
 	int irq[MICFIL_IRQ_LINES];
 	int quality;	/*QUALITY 2-0 bits */
+	unsigned int osr;
 };
 
 struct fsl_micfil_soc_data {
@@ -112,11 +115,11 @@ static inline int get_pdm_clk(struct fsl_micfil *micfil,
 			      unsigned int rate)
 {
 	u32 ctrl2_reg;
-	int qsel, osr;
+	int qsel;
 	int bclk;
+	int osr = MICFIL_OSR_DEFAULT;
 
 	regmap_read(micfil->regmap, REG_MICFIL_CTRL2, &ctrl2_reg);
-	osr = 16 - FIELD_GET(MICFIL_CTRL2_CICOSR, ctrl2_reg);
 	qsel = FIELD_GET(MICFIL_CTRL2_QSEL, ctrl2_reg);
 
 	switch (qsel) {
@@ -282,7 +285,7 @@ static int fsl_set_clock_params(struct device *dev, unsigned int rate)
 	/* set CICOSR */
 	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
 				 MICFIL_CTRL2_CICOSR,
-				 FIELD_PREP(MICFIL_CTRL2_CICOSR, MICFIL_CTRL2_CICOSR_DEFAULT));
+				 FIELD_PREP(MICFIL_CTRL2_CICOSR, 16 - MICFIL_OSR_DEFAULT));
 	if (ret)
 		return ret;
 
@@ -673,7 +676,6 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 	micfil->dma_params_rx.addr = res->start + REG_MICFIL_DATACH0;
 	micfil->dma_params_rx.maxburst = MICFIL_DMA_MAXBURST_RX;
 
-
 	platform_set_drvdata(pdev, micfil);
 
 	pm_runtime_enable(&pdev->dev);
diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
index 5cecae2519795..08901827047db 100644
--- a/sound/soc/fsl/fsl_micfil.h
+++ b/sound/soc/fsl/fsl_micfil.h
@@ -58,7 +58,6 @@
 #define MICFIL_QSEL_VLOW2_QUALITY	4
 
 #define MICFIL_CTRL2_CICOSR		GENMASK(19, 16)
-#define MICFIL_CTRL2_CICOSR_DEFAULT	0
 #define MICFIL_CTRL2_CLKDIV		GENMASK(7, 0)
 
 /* MICFIL Status Register -- REG_MICFIL_STAT 0x08 */
-- 
2.30.2


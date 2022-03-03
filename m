Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8942F4CB7ED
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 08:33:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FEB71ABD;
	Thu,  3 Mar 2022 08:32:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FEB71ABD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646292804;
	bh=vIoWhShgkBYRtYHQulNCsW3bVTaja9uoB2F+un6sxO4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N1V1ds6qmlKEFqtOOx5wwOfp8g0tcgtXsSafVwODkPNDHyvefTZFR3Ues+51HTO4k
	 IZMv3U3ymGWs/Tz9O31PkbLnIbKV9eeVYom6vrG8nHwT9Z7Ddr/bYJw7RV/6BN1h4Q
	 Cyw0t8gZw7xVVrcLJxiB/ornQ6F4Q6FXfJTO615M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF29AF8052E;
	Thu,  3 Mar 2022 08:30:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC2EFF80152; Thu,  3 Mar 2022 08:30:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B208DF80515
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 08:30:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B208DF80515
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nPfux-0006PO-En; Thu, 03 Mar 2022 08:30:31 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nPfuw-002UmZ-1Q; Thu, 03 Mar 2022 08:30:30 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/7] ASoC: fsl_sai: simplify irq return value
Date: Thu,  3 Mar 2022 08:30:23 +0100
Message-Id: <20220303073028.594183-3-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303073028.594183-1-s.hauer@pengutronix.de>
References: <20220303073028.594183-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, Shengjiu Wang <shengjiu.wang@gmail.com>
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

Instead of using a boolean "irq_none" to describe the interrupt
handlers return value use a variable of type irqreturn_t and return
it directly. No functional change.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index d79cb7eb3b262..56311a0f23b95 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -62,7 +62,7 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
 	unsigned int ofs = sai->soc_data->reg_offset;
 	struct device *dev = &sai->pdev->dev;
 	u32 flags, xcsr, mask;
-	bool irq_none = true;
+	irqreturn_t iret = IRQ_NONE;
 
 	/*
 	 * Both IRQ status bits and IRQ mask bits are in the xCSR but
@@ -76,7 +76,7 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
 	flags = xcsr & mask;
 
 	if (flags)
-		irq_none = false;
+		iret = IRQ_HANDLED;
 	else
 		goto irq_rx;
 
@@ -110,7 +110,7 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
 	flags = xcsr & mask;
 
 	if (flags)
-		irq_none = false;
+		iret = IRQ_HANDLED;
 	else
 		goto out;
 
@@ -139,10 +139,7 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
 		regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), flags | xcsr);
 
 out:
-	if (irq_none)
-		return IRQ_NONE;
-	else
-		return IRQ_HANDLED;
+	return iret;
 }
 
 static int fsl_sai_set_dai_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
-- 
2.30.2


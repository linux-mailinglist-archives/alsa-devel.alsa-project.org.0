Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A84B4E94BF
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 13:31:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 344C41825;
	Mon, 28 Mar 2022 13:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 344C41825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648467093;
	bh=GSfOC2ijq5rKNhepbX0SqmL0DIQTxTeBZHYSYTa41fc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bxSS0pSWmogcug0TspKGYD/1O8HhFS++TQws3qb/0Q8o9y0KZqei1IQXlNQTY40pt
	 d7ahygjINdFrCmNEwZ0MDcwFUOpRDdJqxXfSoMpLpfy052Fnx+tgdS77ecMJCcJbQe
	 HWcKIecNsDVJPYr3CasRiwzZRBr/IBC0cOj/W/qs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 891C2F80533;
	Mon, 28 Mar 2022 13:28:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7301F8051D; Mon, 28 Mar 2022 13:28:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CA9BF804DA
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 13:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CA9BF804DA
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nYnXj-0003TS-1A; Mon, 28 Mar 2022 13:28:15 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nYnXf-003Zlp-8s; Mon, 28 Mar 2022 13:28:13 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nYnXd-006byc-H7; Mon, 28 Mar 2022 13:28:09 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 08/19] ASoC: fsl_micfil: drop unused variables
Date: Mon, 28 Mar 2022 13:27:33 +0200
Message-Id: <20220328112744.1575631-9-s.hauer@pengutronix.de>
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

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/fsl/fsl_micfil.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index b88ece31437ab..ffca56d72562d 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -38,10 +38,7 @@ struct fsl_micfil {
 	unsigned int dataline;
 	char name[32];
 	int irq[MICFIL_IRQ_LINES];
-	unsigned int mclk_streams;
 	int quality;	/*QUALITY 2-0 bits */
-	bool slave_mode;
-	int channel_gain[8];
 };
 
 struct fsl_micfil_soc_data {
@@ -342,7 +339,6 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_micfil *micfil = dev_get_drvdata(cpu_dai->dev);
 	int ret;
-	int i;
 
 	/* set qsel to medium */
 	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL2,
@@ -353,8 +349,6 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 
 	/* set default gain to max_gain */
 	regmap_write(micfil->regmap, REG_MICFIL_OUT_CTRL, 0x77777777);
-	for (i = 0; i < 8; i++)
-		micfil->channel_gain[i] = 0xF;
 
 	snd_soc_dai_init_dma_data(cpu_dai, NULL,
 				  &micfil->dma_params_rx);
-- 
2.30.2


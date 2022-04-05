Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D7B4F264D
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 10:02:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10D8D1757;
	Tue,  5 Apr 2022 10:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10D8D1757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649145732;
	bh=JupzhYh+6L7aoRiWiQiJeGSR06BN96s9PWUMwYu7zI8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TOuT9wuCdD63BB5S/GAS3OoPTwAZqJn9DIot0x3L31Mh5IPsbcMGWJHFHupvBpcbj
	 1BtrQs5C02dIhbZIJJXmeEdOfcaUg2uKbLVigeJM0Lgu9G0RRyPbYaYENfwnhRU3BH
	 r/Ve089d2I2HXTBOW+OmvdOESWJMpO/yVTi98oPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C9CCF8016B;
	Tue,  5 Apr 2022 10:00:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF56BF8052D; Tue,  5 Apr 2022 10:00:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE3F6F8014B
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 10:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE3F6F8014B
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nbe6e-0003aE-EF; Tue, 05 Apr 2022 10:00:04 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nbe6e-001BGk-T3; Tue, 05 Apr 2022 10:00:03 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nbe6a-00BXZk-SQ; Tue, 05 Apr 2022 10:00:00 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 03/20] ASoC: fsl_micfil: drop fsl_micfil_set_mclk_rate()
Date: Tue,  5 Apr 2022 09:59:42 +0200
Message-Id: <20220405075959.2744803-4-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220405075959.2744803-1-s.hauer@pengutronix.de>
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
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

All that the .set_sysclk hook in the micfil driver does is to pass
the sysclk frequency to fsl_micfil_set_mclk_rate(). This function
expects the sample rate as argument though, not any kind of sysclk
frequency. The resulting rate setting of the clock is overwritten
in hw_params anyway, so drop this altogether.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/fsl/fsl_micfil.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index cf10c212d770d..5353474d0ff2b 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -358,30 +358,10 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int fsl_micfil_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
-				     unsigned int freq, int dir)
-{
-	struct fsl_micfil *micfil = snd_soc_dai_get_drvdata(dai);
-	struct device *dev = &micfil->pdev->dev;
-
-	int ret;
-
-	if (!freq)
-		return 0;
-
-	ret = fsl_micfil_set_mclk_rate(micfil, freq);
-	if (ret < 0)
-		dev_err(dev, "failed to set mclk[%lu] to rate %u\n",
-			clk_get_rate(micfil->mclk), freq);
-
-	return ret;
-}
-
 static const struct snd_soc_dai_ops fsl_micfil_dai_ops = {
 	.startup = fsl_micfil_startup,
 	.trigger = fsl_micfil_trigger,
 	.hw_params = fsl_micfil_hw_params,
-	.set_sysclk = fsl_micfil_set_dai_sysclk,
 };
 
 static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
-- 
2.30.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE1253A045
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 11:25:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9902816EF;
	Wed,  1 Jun 2022 11:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9902816EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654075534;
	bh=2R/V4MuaE6Xg8sEMP2gpB9dTuvSAr0TdZzdh4zzq1Os=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y3wVHUvgACBZdCZJOSEoaN26TY8EkudVvkK30BvjgT+hLkVnCrCAXISmqMN6ntzIw
	 nfGjxs/n+fHafYGFDbdIqk2Zw+ymd5gu9wJmWrZCiOyU/ozgGy7fvXZVkkmaNEm/IS
	 EJXoqwXOW4HVR0l+GaMsieEwcBqlfmaJ+sS089jI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D61EDF80525;
	Wed,  1 Jun 2022 11:24:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18DB6F80271; Wed,  1 Jun 2022 11:24:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 021ADF80089
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 11:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 021ADF80089
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1nwKZy-0006FC-OT; Wed, 01 Jun 2022 11:23:50 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <mfe@pengutronix.de>)
 id 1nwKZx-005oH1-1B; Wed, 01 Jun 2022 11:23:47 +0200
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <mfe@pengutronix.de>)
 id 1nwKZv-00Dxwn-07; Wed, 01 Jun 2022 11:23:47 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org
Subject: [PATCH 3/3] ASoC: fsl_sai: add error message in case of missing
 imx-pcm-dma support
Date: Wed,  1 Jun 2022 11:23:42 +0200
Message-Id: <20220601092342.3328644-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220601092342.3328644-1-m.felsch@pengutronix.de>
References: <20220601092342.3328644-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 kernel@pengutronix.de
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

If the imx-pcm-dma is required we need to have the module enabled. For
all NXP/FSL sound cards using the ASoC architecture this is the case but
in case of using the simple-audio-card sound card this isn't the case.

In such case the driver probe fails silently and the card isn't
available. It took a while to find the missing Kconfig. Make this easier
for others by printing a error if this the module isn't available but
required by the HW.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 3e54f1f71c1e..2371da814b09 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1152,8 +1152,11 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	 */
 	if (sai->soc_data->use_imx_pcm) {
 		ret = imx_pcm_dma_init(pdev);
-		if (ret)
+		if (ret) {
+			if (!IS_ENABLED(CONFIG_SND_SOC_IMX_PCM_DMA))
+				dev_err(dev, "Error: You must enable the imx-pcm-dma support!\n");
 			goto err_pm_get_sync;
+		}
 	} else {
 		ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
 		if (ret)
-- 
2.30.2


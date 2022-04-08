Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CE64F9427
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 13:33:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CCF61A94;
	Fri,  8 Apr 2022 13:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CCF61A94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649417582;
	bh=ZXeUnm831jL3Euac9SfwMLVcjIFTvdFtCcb3srrf1GM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FI3iAaKmhB92jiCzhygFYYodx7l8nmz1VDMBNCZhOc4sqtnms3qOWSgkl6AqB2b/y
	 cqI5ZpnR6jgk+aUQd/99S39tkW6y4+5gd9FYHGTMDlIchuYblX/Qqnu8XWj/j8X1mU
	 nNKGybJlG5tRviD5cHVIzhqyXmx42YhFIWsoWwMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6B5DF80544;
	Fri,  8 Apr 2022 13:30:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71B20F80536; Fri,  8 Apr 2022 13:29:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67DEFF8050F
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 13:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67DEFF8050F
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo8-0004wS-4F; Fri, 08 Apr 2022 13:29:40 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo8-001n6o-Fy; Fri, 08 Apr 2022 13:29:39 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo3-005ZBL-1m; Fri, 08 Apr 2022 13:29:35 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 14/21] ASoC: fsl_micfil: Drop get_pdm_clk()
Date: Fri,  8 Apr 2022 13:29:21 +0200
Message-Id: <20220408112928.1326755-15-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408112928.1326755-1-s.hauer@pengutronix.de>
References: <20220408112928.1326755-1-s.hauer@pengutronix.de>
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

get_pdm_clk() calculates the PDM clock based on the quality setting,
but really the PDM clock is independent of the quality, it's always
rate * 4 * micfil->osr. Just drop the function and do the calculation
in the caller.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
---

Notes:
    Changes since v3:
    - Don't use uninitialized and no longer present struct fsl_micfil::osr

 sound/soc/fsl/fsl_micfil.c | 38 +-------------------------------------
 1 file changed, 1 insertion(+), 37 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index a35c1c580dbc1..3ddc988b4fe65 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -110,42 +110,6 @@ static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
 		     snd_soc_get_enum_double, snd_soc_put_enum_double),
 };
 
-static inline int get_pdm_clk(struct fsl_micfil *micfil,
-			      unsigned int rate)
-{
-	u32 ctrl2_reg;
-	int qsel;
-	int bclk;
-	int osr = MICFIL_OSR_DEFAULT;
-
-	regmap_read(micfil->regmap, REG_MICFIL_CTRL2, &ctrl2_reg);
-	qsel = FIELD_GET(MICFIL_CTRL2_QSEL, ctrl2_reg);
-
-	switch (qsel) {
-	case MICFIL_QSEL_HIGH_QUALITY:
-		bclk = rate * 8 * osr / 2; /* kfactor = 0.5 */
-		break;
-	case MICFIL_QSEL_MEDIUM_QUALITY:
-	case MICFIL_QSEL_VLOW0_QUALITY:
-		bclk = rate * 4 * osr * 1; /* kfactor = 1 */
-		break;
-	case MICFIL_QSEL_LOW_QUALITY:
-	case MICFIL_QSEL_VLOW1_QUALITY:
-		bclk = rate * 2 * osr * 2; /* kfactor = 2 */
-		break;
-	case MICFIL_QSEL_VLOW2_QUALITY:
-		bclk = rate * osr * 4; /* kfactor = 4 */
-		break;
-	default:
-		dev_err(&micfil->pdev->dev,
-			"Please make sure you select a valid quality.\n");
-		bclk = -1;
-		break;
-	}
-
-	return bclk;
-}
-
 static inline int get_clk_div(struct fsl_micfil *micfil,
 			      unsigned int rate)
 {
@@ -154,7 +118,7 @@ static inline int get_clk_div(struct fsl_micfil *micfil,
 
 	mclk_rate = clk_get_rate(micfil->mclk);
 
-	clk_div = mclk_rate / (get_pdm_clk(micfil, rate) * 2);
+	clk_div = mclk_rate / (rate * MICFIL_OSR_DEFAULT * 8);
 
 	return clk_div;
 }
-- 
2.30.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DC54DC157
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 09:33:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D484192A;
	Thu, 17 Mar 2022 09:32:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D484192A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647506014;
	bh=VwgGmzlYXk0VT175NoKxBAUM5wVOdmEyt/29BDVEA9k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KgUN9Qo7foKSbj2w3l0YE5QQ5EvGNoEW1NTh7lwaZI1oK9bzT9esB8R2E007WLFOK
	 tITOPxRogEuPJHlur54YzTWbq8+QwilyzOyO367cz00Ee4AW0nPRCUJ7QhLPGFCYup
	 ddHBH8/WKQ1BVbWSfA+BTLjYlCjAODGxsG94E35Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3DF1F80567;
	Thu, 17 Mar 2022 09:29:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC620F80124; Thu, 17 Mar 2022 09:29:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7652AF8014C
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 09:28:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7652AF8014C
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nUlUo-000698-7y; Thu, 17 Mar 2022 09:28:34 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nUlUn-0027US-2X; Thu, 17 Mar 2022 09:28:33 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 18/19] ASoC: fsl_micfil: drop support for undocumented property
Date: Thu, 17 Mar 2022 09:28:17 +0100
Message-Id: <20220317082818.503143-19-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220317082818.503143-1-s.hauer@pengutronix.de>
References: <20220317082818.503143-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
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

The "fsl,shared-interrupt" property is undocumented and unnecessary.
Just pass IRQF_SHARED unconditionally.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/fsl/fsl_micfil.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 7a2af7d34dadc..99e25761008b1 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -552,7 +552,6 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *regs;
 	int ret, i;
-	unsigned long irqflag = 0;
 
 	micfil = devm_kzalloc(&pdev->dev, sizeof(*micfil), GFP_KERNEL);
 	if (!micfil)
@@ -616,12 +615,9 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 			return micfil->irq[i];
 	}
 
-	if (of_property_read_bool(np, "fsl,shared-interrupt"))
-		irqflag = IRQF_SHARED;
-
 	/* Digital Microphone interface interrupt */
 	ret = devm_request_irq(&pdev->dev, micfil->irq[0],
-			       micfil_isr, irqflag,
+			       micfil_isr, IRQF_SHARED,
 			       micfil->name, micfil);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to claim mic interface irq %u\n",
@@ -631,7 +627,7 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 
 	/* Digital Microphone interface error interrupt */
 	ret = devm_request_irq(&pdev->dev, micfil->irq[1],
-			       micfil_err_isr, irqflag,
+			       micfil_err_isr, IRQF_SHARED,
 			       micfil->name, micfil);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to claim mic interface error irq %u\n",
-- 
2.30.2


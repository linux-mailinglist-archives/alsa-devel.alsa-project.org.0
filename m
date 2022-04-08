Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF1C4F9435
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 13:36:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2FF61AD3;
	Fri,  8 Apr 2022 13:35:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2FF61AD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649417760;
	bh=a7yzLwIQjibdtUh5N6GklfhrKmEjI6CIY3x/Op11pDs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XoG0+sCK5DMAUfBr3x0AWKYfxKmi4aQ/tmrc7LC0pWZQEkbow2WJh2W8K86hYLBA0
	 Ta+Iusm6LvtFbu47L/m6vmKL6IMfI43ZJ7sIMSOqMgdVsFKpX3Y6vkv3zjSW0Kp0TJ
	 aTIXFxTn+zQB24wvDf8WH5KhAZDunoRwwI2KgJ7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDC07F805B6;
	Fri,  8 Apr 2022 13:30:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E62B2F8055B; Fri,  8 Apr 2022 13:30:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00F9FF80525
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 13:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00F9FF80525
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo6-0004tV-6g; Fri, 08 Apr 2022 13:29:38 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo6-001n6B-IT; Fri, 08 Apr 2022 13:29:37 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo3-005ZBa-5J; Fri, 08 Apr 2022 13:29:35 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 19/21] ASoC: fsl_micfil: drop support for undocumented
 property
Date: Fri,  8 Apr 2022 13:29:26 +0200
Message-Id: <20220408112928.1326755-20-s.hauer@pengutronix.de>
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

The "fsl,shared-interrupt" property is undocumented and unnecessary.
Just pass IRQF_SHARED unconditionally.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
---
 sound/soc/fsl/fsl_micfil.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 89af6cfe24e69..a603033daed69 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -554,7 +554,6 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *regs;
 	int ret, i;
-	unsigned long irqflag = 0;
 
 	micfil = devm_kzalloc(&pdev->dev, sizeof(*micfil), GFP_KERNEL);
 	if (!micfil)
@@ -618,12 +617,9 @@ static int fsl_micfil_probe(struct platform_device *pdev)
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
@@ -633,7 +629,7 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 
 	/* Digital Microphone interface error interrupt */
 	ret = devm_request_irq(&pdev->dev, micfil->irq[1],
-			       micfil_err_isr, irqflag,
+			       micfil_err_isr, IRQF_SHARED,
 			       micfil->name, micfil);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to claim mic interface error irq %u\n",
-- 
2.30.2


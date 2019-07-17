Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F24A6BADE
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 13:00:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB6A81690;
	Wed, 17 Jul 2019 12:59:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB6A81690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563361199;
	bh=l7NIQ8Ch82EgW89aThHCz4L2G6TgU5i2EisokihoZD0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L4Yt4mWzX/SbC2vIbCrxlHv2UakJOolbE6moUmZMatz6rzKq06eyyHxkuC2jFPVt/
	 wOhGhPJ1y29phKBHSmQyOO0B7OswjBk53vcXovp5MNr3yw39jOEWnNyRf/Xdwr3Qvp
	 5dhcn9rPQRecpCWxTwv8OJ73uc+nEgukfbjsJMFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAC95F803D7;
	Wed, 17 Jul 2019 12:56:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15546F80369; Wed, 17 Jul 2019 12:56:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C13EFF80363
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 12:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C13EFF80363
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
 helo=dude02.pengutronix.de.)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1hnhbx-0000LT-RE; Wed, 17 Jul 2019 12:56:37 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Wed, 17 Jul 2019 12:56:35 +0200
Message-Id: <20190717105635.18514-4-l.stach@pengutronix.de>
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
Subject: [alsa-devel] [PATCH 3/3] ASoC: fsl_sai: add i.MX8M support
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

The SAI block on the i.MX8M moved the register layout, as 2 version
registers were added at the start of the register map. We deal with
this by moving the start of the regmap, so both register layouts
look the same to accesses going through the regmap.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 .../devicetree/bindings/sound/fsl-sai.txt     |  2 +-
 sound/soc/fsl/fsl_sai.c                       | 19 +++++++++++++++++++
 sound/soc/fsl/fsl_sai.h                       |  1 +
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
index 2e726b983845..037871d2f505 100644
--- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
@@ -8,7 +8,7 @@ codec/DSP interfaces.
 Required properties:
 
   - compatible		: Compatible list, contains "fsl,vf610-sai",
-			  "fsl,imx6sx-sai" or "fsl,imx6ul-sai"
+			  "fsl,imx6sx-sai", "fsl,imx6ul-sai" or "fsl,imx8mq-sai"
 
   - reg			: Offset and length of the register set for the device.
 
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index b3cd055a61c7..a10201078e40 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -808,6 +808,16 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	/*
+	 * New versions of the SAI have 2 32bit version registers added at the
+	 * start of the register map. To avoid dealing with this shift all over
+	 * the driver, we move the start of the regmap to make both register
+	 * layouts look the same to the regmap. This means we can't read the
+	 * version registers through the regmap, but this is small price to pay.
+	 */
+	if (sai->soc_data->has_version_registers)
+		base += 8;
+
 	sai->regmap = devm_regmap_init_mmio_clk(&pdev->dev,
 			"bus", base, &fsl_sai_regmap_config);
 
@@ -923,18 +933,27 @@ static int fsl_sai_remove(struct platform_device *pdev)
 
 static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
 	.use_imx_pcm = false,
+	.has_version_registers = false,
 	.fifo_depth = 32,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
 	.use_imx_pcm = true,
+	.has_version_registers = false,
 	.fifo_depth = 32,
 };
 
+static const struct fsl_sai_soc_data fsl_sai_imx8m_data = {
+	.use_imx_pcm = true,
+	.has_version_registers = true,
+	.fifo_depth = 128,
+};
+
 static const struct of_device_id fsl_sai_ids[] = {
 	{ .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
 	{ .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
 	{ .compatible = "fsl,imx6ul-sai", .data = &fsl_sai_imx6sx_data },
+	{ .compatible = "fsl,imx8mq-sai", .data = &fsl_sai_imx8m_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_sai_ids);
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 7c1ef671da28..b6a9053ed400 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -128,6 +128,7 @@
 
 struct fsl_sai_soc_data {
 	bool use_imx_pcm;
+	bool has_version_registers;
 	unsigned int fifo_depth;
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

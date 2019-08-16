Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2478FA5E
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 07:23:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2A451654;
	Fri, 16 Aug 2019 07:22:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2A451654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565933026;
	bh=ARtvYWZkRdNNq2Xdh9m508h0T8XkGRPjBCbkVV6zzkg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n5hMEgYHMMwt+EN59A3PexLqBJ3lsuP7KugUw6hSkDa4b+fWw321RvmSDrk4h1SV6
	 bgdyezmfbgbBqXbnvAOM72p9mTGavstyLgm0/vmzbhvk7jnS11XrKI6jIcyCZr9WOU
	 8g3x0umHPD3BbnzxUIeqqwAK6M48ZtWjlxwMJ12A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 237A9F80214;
	Fri, 16 Aug 2019 07:22:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38F56F80214; Fri, 16 Aug 2019 07:22:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2379F8011F
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 07:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2379F8011F
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0D4C9200078;
 Fri, 16 Aug 2019 07:21:55 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E9C6C2000A6;
 Fri, 16 Aug 2019 07:21:47 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 1D839402EC;
 Fri, 16 Aug 2019 13:21:39 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, alsa-devel@alsa-project.org
Date: Fri, 16 Aug 2019 01:03:14 -0400
Message-Id: <1565931794-7218-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: imx-audmux: Add driver suspend and
	resume to support MEGA Fast
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

For i.MX6 SoloX, there is a mode of the SoC to shutdown all power
source of modules during system suspend and resume procedure.
Thus, AUDMUX needs to save all the values of registers before the
system suspend and restore them after the system resume.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-audmux.c | 54 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index 7595f24a006e..3ce85a43e08f 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -23,6 +23,8 @@
 
 static struct clk *audmux_clk;
 static void __iomem *audmux_base;
+static u32 *regcache;
+static u32 reg_max;
 
 #define IMX_AUDMUX_V2_PTCR(x)		((x) * 8)
 #define IMX_AUDMUX_V2_PDCR(x)		((x) * 8 + 4)
@@ -315,8 +317,23 @@ static int imx_audmux_probe(struct platform_device *pdev)
 	if (of_id)
 		pdev->id_entry = of_id->data;
 	audmux_type = pdev->id_entry->driver_data;
-	if (audmux_type == IMX31_AUDMUX)
+
+	switch (audmux_type) {
+	case IMX31_AUDMUX:
 		audmux_debugfs_init();
+		reg_max = 14;
+		break;
+	case IMX21_AUDMUX:
+		reg_max = 6;
+		break;
+	default:
+		dev_err(&pdev->dev, "unsupported version!\n");
+		return -EINVAL;
+	}
+
+	regcache = devm_kzalloc(&pdev->dev, sizeof(u32) * reg_max, GFP_KERNEL);
+	if (!regcache)
+		return -ENOMEM;
 
 	if (of_id)
 		imx_audmux_parse_dt_defaults(pdev, pdev->dev.of_node);
@@ -332,12 +349,47 @@ static int imx_audmux_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int imx_audmux_suspend(struct device *dev)
+{
+	int i;
+
+	clk_prepare_enable(audmux_clk);
+
+	for (i = 0; i < reg_max; i++)
+		regcache[i] = readl(audmux_base + i * 4);
+
+	clk_disable_unprepare(audmux_clk);
+
+	return 0;
+}
+
+static int imx_audmux_resume(struct device *dev)
+{
+	int i;
+
+	clk_prepare_enable(audmux_clk);
+
+	for (i = 0; i < reg_max; i++)
+		writel(regcache[i], audmux_base + i * 4);
+
+	clk_disable_unprepare(audmux_clk);
+
+	return 0;
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static const struct dev_pm_ops imx_audmux_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(imx_audmux_suspend, imx_audmux_resume)
+};
+
 static struct platform_driver imx_audmux_driver = {
 	.probe		= imx_audmux_probe,
 	.remove		= imx_audmux_remove,
 	.id_table	= imx_audmux_ids,
 	.driver	= {
 		.name	= DRIVER_NAME,
+		.pm = &imx_audmux_pm,
 		.of_match_table = imx_audmux_dt_ids,
 	}
 };
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

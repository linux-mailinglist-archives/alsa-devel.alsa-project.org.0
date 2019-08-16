Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA669013B
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 14:19:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AAE81669;
	Fri, 16 Aug 2019 14:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AAE81669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565957963;
	bh=OxzUUDwXWkXGAd3BdfcOpT3ukL5pwjYm3hEeEtLPLac=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cUIP77xG8me6UXNnj+yot6Qpms6AvI8PDka6u6NW2I7Lo+pzv9PtXLy5+eT0C7ZhN
	 uDwW6KZZ8ugceFA+zOA34BSy78edmxcPIi9ee1q/uvbG9vsBj108JNsE2hcDr9OR++
	 mHWIIm30qwUnd41aIPOp9lOA2icS5SNSVr6cwV9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E11CCF8060E;
	Fri, 16 Aug 2019 14:15:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49458F801DB; Fri, 16 Aug 2019 14:15:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com
 [209.85.128.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25CC3F80268
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 14:14:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25CC3F80268
Received: by mail-wm1-f99.google.com with SMTP id m125so3896620wmm.3
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 05:14:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=pLS4DxT1dPkt+ilKsw/CiwD4KIIKskFjBYK+1KbWdsE=;
 b=P5MhXK+cczGRHtbTFjgwWahXkdA5iEQTX/QtQYyyIVnOk9SbHS1nF20Rr2I1VCt11q
 FSyej8CpAmReYCIrSMlzzLQm1dmJNuehfPHZ5dpxEmbWAKYJ3187/6kVo/yZRjE1U/Qf
 KL52fQwRXnKmqaQFRnloDOUZfMeK6g8U6tRhIzsFxZPLxtBTpr0xggKmUi0DFggbT7Ec
 ZUHxpaZvHdCaAxytKdxUvtpon2uEEB9wpCX7gsWDPypSLzuMjY68gn+Wq1gADQCIPG1R
 xVDGiznOP8e61/cZdBr8gHGETOvI0n0PPkuQkcrPNeS4dZEhQ6lFAW/JIKidOpXpxE3t
 plIw==
X-Gm-Message-State: APjAAAUoeEjOCDCj/YtXPUjN4f4sDfmRmS53vAT6tM5xCOGvU8BUYzTb
 3xJEErHvHJyuhflShSG0eXhujb4NhSKpc7/dFT9G1vgayaaZs9PoeFuo956+kjUFQQ==
X-Google-Smtp-Source: APXvYqySVq6C/xknyvsxzKlqH7UE+qi1NJxPkT+wedb/ovVs8FyUI5SRHDjge/ud7Koip4TsqGPgyJPtw6LB
X-Received: by 2002:a1c:cfc6:: with SMTP id f189mr6938434wmg.18.1565957694085; 
 Fri, 16 Aug 2019 05:14:54 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id d8sm90830wro.28.2019.08.16.05.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 05:14:54 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyb89-0003L6-Nv; Fri, 16 Aug 2019 12:14:53 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 184B12743134; Fri, 16 Aug 2019 13:14:53 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1565931794-7218-1-git-send-email-shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190816121453.184B12743134@ypsilon.sirena.org.uk>
Date: Fri, 16 Aug 2019 13:14:53 +0100 (BST)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, s.hauer@pengutronix.de, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: imx-audmux: Add driver suspend and
	resume to support MEGA Fast" to the asoc tree
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

The patch

   ASoC: imx-audmux: Add driver suspend and resume to support MEGA Fast

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 8661ab5b23d6d30d8687fc05bc1dba8f9a64b444 Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Fri, 16 Aug 2019 01:03:14 -0400
Subject: [PATCH] ASoC: imx-audmux: Add driver suspend and resume to support
 MEGA Fast

For i.MX6 SoloX, there is a mode of the SoC to shutdown all power
source of modules during system suspend and resume procedure.
Thus, AUDMUX needs to save all the values of registers before the
system suspend and restore them after the system resume.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Link: https://lore.kernel.org/r/1565931794-7218-1-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-audmux.c | 54 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index b2351cd33b0f..16ede3b5cb32 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -23,6 +23,8 @@
 
 static struct clk *audmux_clk;
 static void __iomem *audmux_base;
+static u32 *regcache;
+static u32 reg_max;
 
 #define IMX_AUDMUX_V2_PTCR(x)		((x) * 8)
 #define IMX_AUDMUX_V2_PDCR(x)		((x) * 8 + 4)
@@ -317,8 +319,23 @@ static int imx_audmux_probe(struct platform_device *pdev)
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
@@ -334,12 +351,47 @@ static int imx_audmux_remove(struct platform_device *pdev)
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

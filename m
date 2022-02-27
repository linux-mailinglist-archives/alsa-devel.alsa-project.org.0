Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFDC4C5953
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Feb 2022 06:11:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A9DB175D;
	Sun, 27 Feb 2022 06:10:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A9DB175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645938667;
	bh=K8Tsj0L/WTQST0tQUFt2uavz5bte3+4KQo+hLg4gT+o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IxdQ/vn2jYs1eN6XuZbeqlr8+xda6znvC2/Hny83lbg7AFd9nH1dTa48GPEV0Jyk2
	 qW9LSmcaHlAW1J3b6a7QjPo+s1DMasqW6Rtsv0amBlBS6jC2xeh2I3GRUwWIxRNUXo
	 Ak4ZRm3IHzsd59r2L3BewNhQymkgLiXd2/8OC1Ic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC35CF80155;
	Sun, 27 Feb 2022 06:10:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F37CF800F8; Sun, 27 Feb 2022 06:09:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 603E5F800F8
 for <alsa-devel@alsa-project.org>; Sun, 27 Feb 2022 06:09:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 603E5F800F8
X-QQ-mid: bizesmtp67t1645938576th46lq5y
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 27 Feb 2022 13:09:30 +0800 (CST)
X-QQ-SSF: 01400000002000C0F000B00A0000000
X-QQ-FEAT: TskX/GkkryA71JOqngR2rwZY4PD6O/RVwtsyrw4mgSIqLyrN4/cHwFSRUAAp2
 nR0XRI4wrRVKRLrdiE6qGyegr41pyu+1MEpFc3Hz29sKVjLWnSopnntoSvE/kbFq32SbGIt
 rbKaxgHdClGn63PGDLiKLSpge7rvhJ2Lb3a5Y/yGuNkxqQUnijlLwfyWJU6wXBOxTJ7JKFX
 cMi+vVSHFi+wNBW55gLFClF6hKkyj7uafbdRpW+nMSEPF3jbY4VNx4svjPYstj924syC6eE
 yDSDVNSo2F2ERn2AuTqDZRqdAo9LtT/+peenskUgLlQaHG5yjuZnqfpatn4Pz+NsjBWotzV
 joUCZm/9zOQ9wEjuOAG21F38Ciz/O1ZZ9k68BUb
X-QQ-GoodBg: 2
From: Meng Tang <tangmeng@uniontech.com>
To: tiwai@suse.com, perex@perex.cz, broonie@kernel.org, lgirdwood@gmail.com
Subject: [PATCH] ASoC: amd: pcm-dma: Use platform_get_irq() to get the
 interrupt
Date: Sun, 27 Feb 2022 13:09:28 +0800
Message-Id: <20220227050928.32270-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
Cc: Meng Tang <tangmeng@uniontech.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
allocation of IRQ resources in DT core code, this causes an issue
when using hierarchical interrupt domains using "interrupts" property
in the node as this bypassed the hierarchical setup and messed up the
irq chaining.

In preparation for removal of static setup of IRQ resource from DT core
code use platform_get_irq().

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 sound/soc/amd/acp-pcm-dma.c           | 11 ++++-------
 sound/soc/amd/raven/acp3x-pcm-dma.c   |  8 ++------
 sound/soc/amd/renoir/acp3x-pdm-dma.c  |  7 ++-----
 sound/soc/amd/vangogh/acp5x-pcm-dma.c |  7 ++-----
 4 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index 8fa2e2fde4f1..1cd2e70a57df 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -1217,9 +1217,8 @@ static const struct snd_soc_component_driver acp_asoc_platform = {
 
 static int acp_audio_probe(struct platform_device *pdev)
 {
-	int status;
+	int status, irq;
 	struct audio_drv_data *audio_drv_data;
-	struct resource *res;
 	const u32 *pdata = pdev->dev.platform_data;
 
 	if (!pdata) {
@@ -1249,13 +1248,11 @@ static int acp_audio_probe(struct platform_device *pdev)
 
 	audio_drv_data->asic_type =  *pdata;
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
 		return -ENODEV;
-	}
 
-	status = devm_request_irq(&pdev->dev, res->start, dma_irq_handler,
+	status = devm_request_irq(&pdev->dev, irq, dma_irq_handler,
 				  0, "ACP_IRQ", &pdev->dev);
 	if (status) {
 		dev_err(&pdev->dev, "ACP IRQ request failed\n");
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 75c06697fa09..e4f8dbf0d11d 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -394,13 +394,9 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 	if (!adata->acp3x_base)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
+	adata->i2s_irq =  platform_get_irq(pdev, 0);
+	if (adata->i2s_irq < 0)
 		return -ENODEV;
-	}
-
-	adata->i2s_irq = res->start;
 
 	dev_set_drvdata(&pdev->dev, adata);
 	status = devm_snd_soc_register_component(&pdev->dev,
diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 9dd22a2fa2e5..88a242538461 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -399,13 +399,10 @@ static int acp_pdm_audio_probe(struct platform_device *pdev)
 	if (!adata->acp_base)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
+	adata->pdm_irq = platform_get_irq(pdev, 0);
+	if (adata->pdm_irq < 0)
 		return -ENODEV;
-	}
 
-	adata->pdm_irq = res->start;
 	adata->capture_stream = NULL;
 
 	dev_set_drvdata(&pdev->dev, adata);
diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index f10de38976cb..c8cd1777a63c 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -388,13 +388,10 @@ static int acp5x_audio_probe(struct platform_device *pdev)
 	if (!adata->acp5x_base)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
+	adata->i2s_irq = platform_get_irq(pdev, 0);
+	if (adata->i2s_irq < 0)
 		return -ENODEV;
-	}
 
-	adata->i2s_irq = res->start;
 	dev_set_drvdata(&pdev->dev, adata);
 	status = devm_snd_soc_register_component(&pdev->dev,
 						 &acp5x_i2s_component,
-- 
2.20.1




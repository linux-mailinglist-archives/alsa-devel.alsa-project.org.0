Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C84F18F2
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 15:42:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC3CE16AE;
	Wed,  6 Nov 2019 15:41:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC3CE16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573051368;
	bh=zLAY6vjtTA1l2k1RhPdkx4Otm3aq4TaLV3hBw1DN1+Y=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y8huJcdQHo5qpJIkkKFqG8DJDCWMmXSF/fWvvYYH/8C8TnolnkWktxnEYe5oB5iJd
	 /SFLtFE/fTZ83/3JnhmCmqkX78jvhOOaegemb8JPcILkHxpCQubzklDFWdueM2dMbp
	 Sxg5qZLME9CmLYeF5BjJrowkhEO9qT8mwolkKT5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE679F8065A;
	Wed,  6 Nov 2019 15:38:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B58E8F8065B; Wed,  6 Nov 2019 15:38:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=DATE_IN_FUTURE_12_24,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740043.outbound.protection.outlook.com [40.107.74.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06955F80649
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 15:38:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06955F80649
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="N8bNXb5H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOhaS9LrDzEpBOmwF5WvL8iV9euCyVfLj+naQ1b45XV8GY7nyTxTq1iveQ273hGc84QWSOUOvz/i9WqxyZFB5uYxr2uujSjsRxSNHps2eLBlC8dcpTe5XtRpQnLPyFT7Vj4HUtFcusobWKC253FDiw3qYpfuisGq68k1qBJ4fk6GCk9MRBr9/CSikS8M4AttfG4Yp/jL6Qx/LY+3QrmL6cpVQjZwkhjK4pVImvY0uYDv+bFi+j16bP8s8BrTNHFgKuUJ1Tmpxzugf+IBhMX/CW5LDgnU92QWeIFudoJUmgotKtwTPpYt2AzcVYOzR94ObKI7PXOkk1fC9MNFwxbXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVL4o38yDpyH+A9b8/WL2raRF3Hm49ypYqmT/EEKVWI=;
 b=EeinVRxON+b/+5TFprEa/V+Zlrx/V0NsedV0QmplOyk3yndrX0A7BaLpGuAz+6oLuwqZLvqRaBundcA3AoB9KAVbr/89RFdrlMf5erq81pT9njghj3x8X1g8D8VuYFTm9mXzwubO2WAQ85TRTQJYkxOpVGM34RRvt4rkaTMdHl57uvYotCO0lFedU47/VwM0+H0HG64N8iAjj1uG5nVLApbsVkMkyq/CAWKcCxS0aKOfA8NTOmkNUy35syAJb+J55+/qtCycqfp63h6uj+zXfVr9+Vys5AcpQNOzRuPW5mxvsPovbLeLggaUevnufFSjJkR5Spa4rIqJQ1lyy8ozmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVL4o38yDpyH+A9b8/WL2raRF3Hm49ypYqmT/EEKVWI=;
 b=N8bNXb5H8UPxdGpBjxHnc4LwamGJpuDoNPwxvUVo64CWRU1xaIZg8lnA0Fas8WcfA5fBUc3NkjLWGLeHEqWi3tC1EpHLrq+lHw4sxxAENUuuePLPgm7ABd1l1p5KdYfsnBY2TDfg4NLArP0lL6hrHEVl4qtR+BmqdFXs9sG+wn8=
Received: from DM6PR12CA0031.namprd12.prod.outlook.com (2603:10b6:5:1c0::44)
 by DM5PR12MB1481.namprd12.prod.outlook.com (2603:10b6:4:e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Wed, 6 Nov 2019 14:38:39 +0000
Received: from DM3NAM03FT048.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::205) by DM6PR12CA0031.outlook.office365.com
 (2603:10b6:5:1c0::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2430.22 via Frontend
 Transport; Wed, 6 Nov 2019 14:38:39 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT048.mail.protection.outlook.com (10.152.83.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2430.20 via Frontend Transport; Wed, 6 Nov 2019 14:38:38 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 6 Nov 2019
 08:38:38 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 6 Nov 2019 08:38:26 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Thu, 7 Nov 2019 20:06:03 +0530
Message-ID: <1573137364-5592-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573137364-5592-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573137364-5592-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(136003)(376002)(39860400002)(396003)(346002)(428003)(199004)(189003)(70586007)(5660300002)(70206006)(50226002)(51416003)(7696005)(305945005)(81156014)(356004)(6666004)(76176011)(126002)(486006)(1671002)(86362001)(81166006)(426003)(8676002)(2616005)(446003)(11346002)(476003)(109986005)(26005)(186003)(336012)(8936002)(4326008)(50466002)(48376002)(478600001)(36756003)(53416004)(16586007)(316002)(54906003)(14444005)(2906002)(7416002)(47776003)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1481; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5696982-3b47-42ed-23de-08d762c70357
X-MS-TrafficTypeDiagnostic: DM5PR12MB1481:|DM5PR12MB1481:
X-Microsoft-Antispam-PRVS: <DM5PR12MB14816A8C42449F501BD0F1C1E7790@DM5PR12MB1481.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:37;
X-Forefront-PRVS: 02135EB356
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4pUqrGLarsle8Ecc1IzhfwoXNjbfnxDayJD2b8s5rn0SUrlVuVlU5Os+7SxYI2sZvD9PCs3l3RTpzoCErXlAkRsxzjWw6VskTYvcxhxUue1drFzdUJzuELb5vgoBlpeSP0JwDjOmYZ6Oqt/GRVBiXvMIzHwgo50uhfRE498kPWqOijwW4zcRbhOxZ9F8p7m3zJIVuXlJdpX1M/o7u9yeN3EmZlAhHfSdjqueUaZ0pCO+/flTfiZSqB+u6QITbhr6dc3ZkY7qnP9Y4tR1g2X/2WpRAPFVlnW7uQVqDvQfUk5WiPXysz0fWDHwf3LsPgG6cu7LxysldLrmIo5uvZSFy5Afwist4oxuNRGItqxTfJto0uX9hXSngnnHrf/A7J4j24ATmLmx/Lqgj3ztN+BFw1JWLnnFvI13onfYkL5QT5rEzmY1i5Obgg4H0q7oEKlT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2019 14:38:38.9400 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5696982-3b47-42ed-23de-08d762c70357
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1481
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, Maruthi
 Bayyavarapu <maruthi.bayyavarapu@amd.com>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Akshu.Agrawal@amd.com,
 Sanju R Mehta <sanju.mehta@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH v2 6/7] ASoC: amd: ACP powergating to be done
	by controller
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

ACP power gating should be done by ACP-PCI.previous it was
handled in DMA driver which is not authorised to do.Moving
it to ACP-PCI.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 141 +-----------------------------------
 sound/soc/amd/raven/acp3x.h         |   7 ++
 sound/soc/amd/raven/pci-acp3x.c     | 130 ++++++++++++++++++++++++++++++++-
 3 files changed, 138 insertions(+), 140 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 689e234..f77f5bc 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -58,106 +58,6 @@ static const struct snd_pcm_hardware acp3x_pcm_hardware_capture = {
 	.periods_max = CAPTURE_MAX_NUM_PERIODS,
 };
 
-static int acp3x_power_on(void __iomem *acp3x_base, bool on)
-{
-	u16 val, mask;
-	u32 timeout;
-
-	if (on == true) {
-		val = 1;
-		mask = ACP3x_POWER_ON;
-	} else {
-		val = 0;
-		mask = ACP3x_POWER_OFF;
-	}
-
-	rv_writel(val, acp3x_base + mmACP_PGFSM_CONTROL);
-	timeout = 0;
-	while (true) {
-		val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
-		if ((val & ACP3x_POWER_OFF_IN_PROGRESS) == mask)
-			break;
-		if (timeout > 100) {
-			pr_err("ACP3x power state change failure\n");
-			return -ENODEV;
-		}
-		timeout++;
-		cpu_relax();
-	}
-	return 0;
-}
-
-static int acp3x_reset(void __iomem *acp3x_base)
-{
-	u32 val, timeout;
-
-	rv_writel(1, acp3x_base + mmACP_SOFT_RESET);
-	timeout = 0;
-	while (true) {
-		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
-		if ((val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK) ||
-		     timeout > 100) {
-			if (val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK)
-				break;
-			return -ENODEV;
-		}
-		timeout++;
-		cpu_relax();
-	}
-
-	rv_writel(0, acp3x_base + mmACP_SOFT_RESET);
-	timeout = 0;
-	while (true) {
-		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
-		if (!val || timeout > 100) {
-			if (!val)
-				break;
-			return -ENODEV;
-		}
-		timeout++;
-		cpu_relax();
-	}
-	return 0;
-}
-
-static int acp3x_init(void __iomem *acp3x_base)
-{
-	int ret;
-
-	/* power on */
-	ret = acp3x_power_on(acp3x_base, true);
-	if (ret) {
-		pr_err("ACP3x power on failed\n");
-		return ret;
-	}
-	/* Reset */
-	ret = acp3x_reset(acp3x_base);
-	if (ret) {
-		pr_err("ACP3x reset failed\n");
-		return ret;
-	}
-	return 0;
-}
-
-static int acp3x_deinit(void __iomem *acp3x_base)
-{
-	int ret;
-
-	/* Reset */
-	ret = acp3x_reset(acp3x_base);
-	if (ret) {
-		pr_err("ACP3x reset failed\n");
-		return ret;
-	}
-	/* power off */
-	ret = acp3x_power_on(acp3x_base, false);
-	if (ret) {
-		pr_err("ACP3x power off failed\n");
-		return ret;
-	}
-	return 0;
-}
-
 static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
 {
 	u16 play_flag, cap_flag;
@@ -555,63 +455,37 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 	adata->i2ssp_capture_stream = NULL;
 
 	dev_set_drvdata(&pdev->dev, adata);
-	/* Initialize ACP */
-	status = acp3x_init(adata->acp3x_base);
-	if (status)
-		return -ENODEV;
 	status = devm_snd_soc_register_component(&pdev->dev,
 						 &acp3x_i2s_component,
 						 NULL, 0);
 	if (status) {
 		dev_err(&pdev->dev, "Fail to register acp i2s component\n");
-		goto dev_err;
+		return -ENODEV;
 	}
 	status = devm_request_irq(&pdev->dev, adata->i2s_irq, i2s_irq_handler,
 				  irqflags, "ACP3x_I2S_IRQ", adata);
 	if (status) {
 		dev_err(&pdev->dev, "ACP3x I2S IRQ request failed\n");
-		goto dev_err;
+		return -ENODEV;
 	}
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 10000);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	return 0;
-dev_err:
-	status = acp3x_deinit(adata->acp3x_base);
-	if (status)
-		dev_err(&pdev->dev, "ACP de-init failed\n");
-	else
-		dev_info(&pdev->dev, "ACP de-initialized\n");
-	/*ignore device status and return driver probe error*/
-	return -ENODEV;
 }
 
 static int acp3x_audio_remove(struct platform_device *pdev)
 {
-	int ret;
-	struct i2s_dev_data *adata = dev_get_drvdata(&pdev->dev);
-
-	ret = acp3x_deinit(adata->acp3x_base);
-	if (ret)
-		dev_err(&pdev->dev, "ACP de-init failed\n");
-	else
-		dev_info(&pdev->dev, "ACP de-initialized\n");
-
 	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
 
 static int acp3x_resume(struct device *dev)
 {
-	int status;
 	u32 val;
 	struct i2s_dev_data *adata = dev_get_drvdata(dev);
 
-	status = acp3x_init(adata->acp3x_base);
-	if (status)
-		return -ENODEV;
-
 	if (adata->play_stream && adata->play_stream->runtime) {
 		struct i2s_stream_instance *rtd =
 			adata->play_stream->runtime->private_data;
@@ -656,15 +530,8 @@ static int acp3x_resume(struct device *dev)
 
 static int acp3x_pcm_runtime_suspend(struct device *dev)
 {
-	int status;
 	struct i2s_dev_data *adata = dev_get_drvdata(dev);
 
-	status = acp3x_deinit(adata->acp3x_base);
-	if (status)
-		dev_err(dev, "ACP de-init failed\n");
-	else
-		dev_info(dev, "ACP de-initialized\n");
-
 	rv_writel(0, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
 
 	return 0;
@@ -672,12 +539,8 @@ static int acp3x_pcm_runtime_suspend(struct device *dev)
 
 static int acp3x_pcm_runtime_resume(struct device *dev)
 {
-	int status;
 	struct i2s_dev_data *adata = dev_get_drvdata(dev);
 
-	status = acp3x_init(adata->acp3x_base);
-	if (status)
-		return -ENODEV;
 	rv_writel(1, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
 	return 0;
 }
diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index 01b283a..cf16ceb 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -65,6 +65,13 @@
 #define SLOT_WIDTH_16 0x10
 #define SLOT_WIDTH_24 0x18
 #define SLOT_WIDTH_32 0x20
+#define ACP_PGFSM_CNTL_POWER_ON_MASK	0x01
+#define ACP_PGFSM_CNTL_POWER_OFF_MASK	0x00
+#define ACP_PGFSM_STATUS_MASK		0x03
+#define ACP_POWERED_ON			0x00
+#define ACP_POWER_ON_IN_PROGRESS	0x01
+#define ACP_POWERED_OFF			0x02
+#define ACP_POWER_OFF_IN_PROGRESS	0x03
 
 struct acp3x_platform_info {
 	u16 play_i2s_instance;
diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
index ec3ef625..7727c9d 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -19,6 +19,120 @@ struct acp3x_dev_data {
 	struct platform_device *pdev[ACP3x_DEVS];
 };
 
+static int acp3x_power_on(void __iomem *acp3x_base)
+{
+	u32 val;
+	u32 timeout = 0;
+	int ret = 0;
+
+	val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
+
+	if (val == 0)
+		return val;
+
+	if (!((val & ACP_PGFSM_STATUS_MASK) ==
+				ACP_POWER_ON_IN_PROGRESS))
+		rv_writel(ACP_PGFSM_CNTL_POWER_ON_MASK,
+			acp3x_base + mmACP_PGFSM_CONTROL);
+	while (++timeout < 500) {
+		val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
+		if (!val)
+			break;
+		udelay(1);
+		if (timeout > 500) {
+			pr_err("ACP is Not Powered ON\n");
+			return -ETIMEDOUT;
+		}
+	}
+}
+
+static int acp3x_power_off(void __iomem *acp3x_base)
+{
+	u32 val;
+	u32 timeout = 0;
+
+	rv_writel(ACP_PGFSM_CNTL_POWER_OFF_MASK,
+			acp3x_base + mmACP_PGFSM_CONTROL);
+	while (++timeout < 500) {
+		val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
+		if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_OFF)
+			return 0;
+		udelay(1);
+		if (timeout > 500) {
+			pr_err("ACP is Not Powered OFF\n");
+			return -ETIMEDOUT;
+		}
+	}
+}
+
+
+static int acp3x_reset(void __iomem *acp3x_base)
+{
+	u32 val, timeout;
+
+	rv_writel(1, acp3x_base + mmACP_SOFT_RESET);
+	timeout = 0;
+	while (++timeout < 100) {
+		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
+		if ((val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK) ||
+							timeout > 100) {
+			if (val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK)
+				break;
+			return -ENODEV;
+		}
+		cpu_relax();
+	}
+	rv_writel(0, acp3x_base + mmACP_SOFT_RESET);
+	timeout = 0;
+	while (++timeout < 100) {
+		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
+		if (!val)
+			break;
+		if (timeout > 100)
+			return -ENODEV;
+		cpu_relax();
+	}
+	return 0;
+}
+
+static int acp3x_init(void __iomem *acp3x_base)
+{
+	int ret;
+
+	/* power on */
+	ret = acp3x_power_on(acp3x_base);
+	if (ret) {
+		pr_err("ACP3x power on failed\n");
+		return ret;
+	}
+	/* Reset */
+	ret = acp3x_reset(acp3x_base);
+	if (ret) {
+		pr_err("ACP3x reset failed\n");
+		return ret;
+	}
+	return 0;
+}
+
+static int acp3x_deinit(void __iomem *acp3x_base)
+{
+	int ret;
+
+	/* Reset */
+	ret = acp3x_reset(acp3x_base);
+	if (ret) {
+		pr_err("ACP3x reset failed\n");
+		return ret;
+	}
+	/* power off */
+	ret = acp3x_power_off(acp3x_base);
+	if (ret) {
+		pr_err("ACP3x power off failed\n");
+		return ret;
+	}
+	return 0;
+}
+
 static int snd_acp3x_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
@@ -63,6 +177,10 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	}
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
+	ret = acp3x_init(adata->acp3x_base);
+	if (ret)
+		return -ENODEV;
+
 
 	val = rv_readl(adata->acp3x_base + mmACP_I2S_PIN_CONFIG);
 	switch (val) {
@@ -132,6 +250,11 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	return 0;
 
 unmap_mmio:
+	ret = acp3x_deinit(adata->acp3x_base);
+	if (ret)
+		dev_err(&pci->dev, "ACP de-init failed\n");
+	else
+		dev_info(&pci->dev, "ACP de-initialized\n");
 	pci_disable_msi(pci);
 	for (i = 0 ; i < ACP3x_DEVS ; i++)
 		platform_device_unregister(adata->pdev[i]);
@@ -147,13 +270,18 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 
 static void snd_acp3x_remove(struct pci_dev *pci)
 {
-	int i;
+	int i, ret;
 	struct acp3x_dev_data *adata = pci_get_drvdata(pci);
 
 	if (adata->acp3x_audio_mode == ACP3x_I2S_MODE) {
 		for (i = 0 ; i <  ACP3x_DEVS ; i++)
 			platform_device_unregister(adata->pdev[i]);
 	}
+	ret = acp3x_deinit(adata->acp3x_base);
+	if (ret)
+		dev_err(&pci->dev, "ACP de-init failed\n");
+	else
+		dev_info(&pci->dev, "ACP de-initialized\n");
 	iounmap(adata->acp3x_base);
 
 	pci_disable_msi(pci);
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

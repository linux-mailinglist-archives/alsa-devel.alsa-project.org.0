Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C63C0C22D7
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2019 16:11:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 648E81677;
	Mon, 30 Sep 2019 16:11:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 648E81677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569852713;
	bh=SBAJHsTr+NhOV2s72Pm4gvMD+PZ7pO+RA1zum7W+DK0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tnRa8Tj1dNUnccb/d5P9qsyWTLhYQsbHaEBOzNK+ShGzW+c5jU8o1f8WUh77nGAiZ
	 LLUlN7EOV9voJKbq5XOi9wv1qNSyGRSEqblycAo/H+CfTxLmEQEauceTEX4wFbolrm
	 VmTa6UGOl6DZA3XOun5CXAdx7pelLl+8MhNt6Yt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F143F8065C;
	Mon, 30 Sep 2019 16:07:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34B80F803F3; Mon, 30 Sep 2019 16:07:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770077.outbound.protection.outlook.com [40.107.77.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 464D0F803F3
 for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2019 16:07:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 464D0F803F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="SbYmxjoZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RR5Aa93aEK8UCKII/IWC3TCdzepdgF3fhR8+ZZpnLQyWn1ijME3RpOQDi2Q8k4q7mg/loOYC3UAyh7Xvvrc/UOjuzubQJI/bSJ5qKNhOOfN9ULI/CZL201kszMf9MJQzh0WdhwLy4fNeN6+mzGNbbU1yPvS5KruXlYmXSLOY1AD8SPOS14ftgqgSFFt9hrkBg4HvvuLY+V6NjVE93Tetj+UlLHjngOK3BW9J5d9OuBOdwHiyYOp0pxVmuiMUHSzU3M47CoXno6m7dZGyUVic9bBw7IvtohAA/zD3Js38oissiYW7y085PHIDa0xxfm8OsFOW2f3J32ZQfufthwB3vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41mimW94ELZCqFOtKsh89Si6C0x+vxR5n8irJqfWfKE=;
 b=Q6iqkiivG7wbPcJ2fnOgd/zr06a/lshtzXivt5NWGkbutz3GgUra9I3r3YITQKQzhUSJwNQA3jn8NDJxq4O1Ych/z20ZsXzEXngLaHDHQA0MPj4IpLcHhV0qH7kikoW0p4SOd5Jlu+BY/8hDRH8o7hg48DDdbb+k9G8UnELYENNpREaFLIFc7kYEDDIiPF5vnsgrddLFcEIIRVH+ONa8WMEXnbvnVxOWbn5QJgs8GUjnWPDC+SnHp4A8jIStIqypLRGx8d/Cap94W80n5yZyshN8x6RA57h+TFFD9Alhg7ZsnheBeCGwpf4V8nOJzaRQB9+NE1OPznpLcmr6nnO+cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=oracle.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41mimW94ELZCqFOtKsh89Si6C0x+vxR5n8irJqfWfKE=;
 b=SbYmxjoZzFFXJcum1mqIfJ3Bx2Iff7CIAnOX63PJRJsCadU4jwCikLsEkN+ucmEr976Wd8eeM5ARWAyj38xB0rWUNntBv9sV8oe21gFuTUyCmRF81ertgzXK4YX/RmmiN5iYPs6ZxGcM48Tu3pmzftEByD+J+uNXGzgKtztoVF8=
Received: from SN1PR12CA0106.namprd12.prod.outlook.com (2603:10b6:802:21::41)
 by MN2PR12MB4000.namprd12.prod.outlook.com (2603:10b6:208:16b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.17; Mon, 30 Sep
 2019 14:06:56 +0000
Received: from CO1NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by SN1PR12CA0106.outlook.office365.com
 (2603:10b6:802:21::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.18 via Frontend
 Transport; Mon, 30 Sep 2019 14:06:55 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT046.mail.protection.outlook.com (10.152.81.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 14:06:55 +0000
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Mon, 30 Sep 2019 09:06:53 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Tue, 1 Oct 2019 06:28:15 +0530
Message-ID: <1569891524-18875-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(136003)(428003)(199004)(189003)(14444005)(16586007)(1671002)(36756003)(316002)(11346002)(446003)(126002)(476003)(486006)(356004)(6666004)(48376002)(305945005)(426003)(70206006)(336012)(70586007)(47776003)(50226002)(30864003)(2906002)(7696005)(109986005)(86362001)(53416004)(8676002)(8936002)(81166006)(81156014)(5660300002)(2616005)(51416003)(76176011)(4326008)(186003)(50466002)(54906003)(26005)(478600001)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4000; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f0fe140-bfa3-412f-6e41-08d745af73a0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4000:|MN2PR12MB4000:
X-Microsoft-Antispam-PRVS: <MN2PR12MB400016906899093257B318D4E7820@MN2PR12MB4000.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:42;
X-Forefront-PRVS: 01762B0D64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KZdgIUfjz7zs1v7M28DcWIGTmx31DOZutwa9TGi4oxOLNTQOTRzIuu5lAdfBV/X1dH4p47b5UIbABMkIvi7iDiLzB7+d5TDE22H8lQvPvdN86UMPhHvMRqDmjP3Cwc4Perl3ZlPT4JEavvlCkul6uKLR0U46dxBIyNTpFbUNSEnGoso5Bd2rwJm+xFHfJxeel10s61iYJjrTGuiCNKzeYR+Th0DJ1NWFvQozyE/P0+rCclfn6gSYajiK37YTfyL4rB8WMTN1tLcHf1BxC82sgu5nCnhOQhMCDFrP/ebR8lFCMIWeWgGSowI4mZBMKis2QjTYwH6MzI/OnmnUpNCNKhoNGIIom2q6nD+sf0EKx/QDwraDsnvA1XeAK/rhglWlX96FMx0A811ZAB1YG+i9fz9V1fqMoPfonBq7Kd6YG6Q=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 14:06:55.5779 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0fe140-bfa3-412f-6e41-08d745af73a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4000
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH 7/7] ASoc: amd: Added ACP3x system resume and
	runtime pm ops
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

When audio usecase in progress and system wide suspend happens, ACP will
be powered off and when system resumes, for audio usecase to continue,
all the runtime configuration data needs to be programmed again. Added
'resume'pm call back to ACP pm ops and also Added runtime PM operations
for ACP3x PCM platform device. Device will be powered on/off based on
device is in use or not.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 160 +++-------------------------
 sound/soc/amd/raven/acp3x.h         |   7 ++
 sound/soc/amd/raven/pci-acp3x.c     | 204 +++++++++++++++++++++++++++++++++++-
 3 files changed, 223 insertions(+), 148 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 49f640f..4011c78 100644
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
@@ -554,75 +454,52 @@ static int acp3x_audio_probe(struct platform_device *pdev)
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
 		config_acp3x_dma(rtd, SNDRV_PCM_STREAM_PLAYBACK);
 		rv_writel((rtd->xfer_resolution  << 3),
-			  rtd->acp3x_base + mmACP_BTTDM_ITER);
+				rtd->acp3x_base + mmACP_BTTDM_ITER);
+		val = rv_readl(rtd->acp3x_base + mmACP_I2STDM_ITER);
+		val = val | (rtd->xfer_resolution  << 3);
+		rv_writel(val, rtd->acp3x_base + mmACP_I2STDM_ITER);
 		if (adata->tdm_mode == true) {
 			rv_writel(adata->tdm_fmt, adata->acp3x_base +
-				  mmACP_BTTDM_TXFRMT);
+					mmACP_BTTDM_TXFRMT);
 			val = rv_readl(adata->acp3x_base + mmACP_BTTDM_ITER);
 			rv_writel((val | 0x2), adata->acp3x_base +
-				  mmACP_BTTDM_ITER);
+					mmACP_BTTDM_ITER);
 		}
 	}
 
@@ -631,13 +508,17 @@ static int acp3x_resume(struct device *dev)
 			adata->capture_stream->runtime->private_data;
 		config_acp3x_dma(rtd, SNDRV_PCM_STREAM_CAPTURE);
 		rv_writel((rtd->xfer_resolution  << 3),
-			  rtd->acp3x_base + mmACP_BTTDM_IRER);
+				rtd->acp3x_base + mmACP_BTTDM_IRER);
+		val = rv_readl(rtd->acp3x_base + mmACP_I2STDM_ITER);
+		val = val | (rtd->xfer_resolution  << 3);
+		rv_writel(val, rtd->acp3x_base + mmACP_I2STDM_ITER);
+
 		if (adata->tdm_mode == true) {
 			rv_writel(adata->tdm_fmt, adata->acp3x_base +
-				  mmACP_BTTDM_RXFRMT);
+					mmACP_BTTDM_RXFRMT);
 			val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
 			rv_writel((val | 0x2), adata->acp3x_base +
-				  mmACP_BTTDM_IRER);
+					mmACP_BTTDM_IRER);
 		}
 	}
 
@@ -648,15 +529,8 @@ static int acp3x_resume(struct device *dev)
 
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
@@ -664,12 +538,8 @@ static int acp3x_pcm_runtime_suspend(struct device *dev)
 
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
index d97d7d5..21c3109 100644
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
index d9f5bc0..8386c4a 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -10,6 +10,9 @@
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/core.h>
+#include <linux/pm_runtime.h>
+#include <linux/delay.h>
+#include <sound/pcm.h>
 
 #include "acp3x.h"
 
@@ -27,12 +30,141 @@ struct acp3x_dev_data {
 	struct platform_device *pdev;
 };
 
+static int acp3x_power_on(void __iomem *acp3x_base)
+{
+	u32 val;
+	u32 timeout = 0;
+	int ret = 0;
+
+	val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
+	if (val) {
+		if (!((val & ACP_PGFSM_STATUS_MASK) ==
+				ACP_POWER_ON_IN_PROGRESS))
+			rv_writel(ACP_PGFSM_CNTL_POWER_ON_MASK,
+				acp3x_base + mmACP_PGFSM_CONTROL);
+		while (true) {
+			val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
+			if (!val)
+				break;
+			udelay(1);
+			if (timeout > 500) {
+				pr_err("ACP is Not Powered ON\n");
+				ret = -ETIMEDOUT;
+				break;
+			}
+			timeout++;
+		}
+		if (ret) {
+			pr_err("ACP is not powered on status:%d\n", ret);
+			return ret;
+		}
+	}
+	return ret;
+}
+
+static int acp3x_power_off(void __iomem *acp3x_base)
+{
+	u32 val;
+	u32 timeout = 0;
+	int ret = 0;
+
+	val = rv_readl(acp3x_base + mmACP_PGFSM_CONTROL);
+	rv_writel(ACP_PGFSM_CNTL_POWER_OFF_MASK,
+			acp3x_base + mmACP_PGFSM_CONTROL);
+	while (true) {
+		val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
+		if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_OFF)
+			break;
+		udelay(1);
+		if (timeout > 500) {
+			pr_err("ACP is Not Powered OFF\n");
+			ret = -ETIMEDOUT;
+			break;
+		}
+		timeout++;
+	}
+	if (ret)
+		pr_err("ACP is not powered off status:%d\n", ret);
+	return ret;
+}
+
+
+static int acp3x_reset(void __iomem *acp3x_base)
+{
+	u32 val, timeout;
+
+	rv_writel(1, acp3x_base + mmACP_SOFT_RESET);
+	timeout = 0;
+	while (true) {
+		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
+		if ((val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK) ||
+							timeout > 100) {
+			if (val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK)
+				break;
+			return -ENODEV;
+		}
+		timeout++;
+		cpu_relax();
+	}
+	rv_writel(0, acp3x_base + mmACP_SOFT_RESET);
+	timeout = 0;
+	while (true) {
+		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
+		if (!val || timeout > 100) {
+			if (!val)
+				break;
+			return -ENODEV;
+		}
+		timeout++;
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
 	int ret;
 	resource_size_t addr;
-	int val, i, r;
+	int val, i, r, status;
 	struct acp3x_dev_data *adata;
 	struct device *dev;
 	struct i2s_platform_data *i2s_pdata;
@@ -46,7 +178,7 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	ret = pci_request_regions(pci, "AMD ACP3x audio");
 	if (ret < 0) {
 		dev_err(&pci->dev, "pci_request_regions failed\n");
-		goto disable_pci;
+		goto release_regions;
 	}
 
 	adata = devm_kzalloc(&pci->dev, sizeof(struct acp3x_dev_data),
@@ -67,6 +199,10 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
 	adata->parent = &pci->dev;
+	status = acp3x_init(adata->acp3x_base);
+	if (status)
+		return -ENODEV;
+
 	val = rv_readl(adata->acp3x_base + mmACP_I2S_PIN_CONFIG);
 	switch (val) {
 	case I2S_MODE:
@@ -141,26 +277,85 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 					adata->cell, ACP3x_DEVS);
 		break;
 	}
+	pm_runtime_set_autosuspend_delay(&pci->dev, 10000);
+	pm_runtime_use_autosuspend(&pci->dev);
+	pm_runtime_set_active(&pci->dev);
+	pm_runtime_put_noidle(&pci->dev);
+	pm_runtime_enable(&pci->dev);
 	return 0;
 
 unmap_mmio:
+	status = acp3x_deinit(adata->acp3x_base);
+	if (status)
+		dev_err(&pci->dev, "ACP de-init failed\n");
+	else
+		dev_info(&pci->dev, "ACP de-initialized\n");
 	mfd_remove_devices(adata->parent);
 	kfree(adata->res);
 	kfree(adata->cell);
 	iounmap(adata->acp3x_base);
 release_regions:
 	pci_release_regions(pci);
-disable_pci:
 	pci_disable_device(pci);
+	status = acp3x_deinit(adata->acp3x_base);
+	if (status)
+		dev_err(&pci->dev, "ACP de-init failed\n");
+	else
+		dev_info(&pci->dev, "ACP de-initialized\n");
 
 	return ret;
 }
 
+
+
+static int  snd_acp3x_suspend(struct device *dev)
+{
+
+	int status;
+	struct acp3x_dev_data *adata = dev_get_drvdata(dev);
+
+	status = acp3x_deinit(adata->acp3x_base);
+	if (status)
+		dev_err(dev, "ACP de-init failed\n");
+	else
+		dev_info(dev, "ACP de-initialized\n");
+
+	return 0;
+}
+static int  snd_acp3x_resume(struct device *dev)
+{
+
+	int status;
+	struct acp3x_dev_data *adata = dev_get_drvdata(dev);
+
+	status = acp3x_init(adata->acp3x_base);
+	if (status)
+		return -ENODEV;
+
+	return 0;
+}
+
+static const struct dev_pm_ops acp3x_pm = {
+	.runtime_suspend = snd_acp3x_suspend,
+	.runtime_resume =  snd_acp3x_resume,
+	.resume	=	snd_acp3x_resume,
+
+};
+
 static void snd_acp3x_remove(struct pci_dev *pci)
 {
+	int i;
 	struct acp3x_dev_data *adata = pci_get_drvdata(pci);
 	mfd_remove_devices(adata->parent);
+	i = acp3x_deinit(adata->acp3x_base);
+	if (i)
+		dev_err(&pci->dev, "ACP de-init failed\n");
+	else
+		dev_info(&pci->dev, "ACP de-initialized\n");
 	iounmap(adata->acp3x_base);
+	pm_runtime_disable(&pci->dev);
+	pm_runtime_get_noresume(&pci->dev);
+	pci_disable_msi(pci);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
 }
@@ -178,6 +373,9 @@ static struct pci_driver acp3x_driver  = {
 	.id_table = snd_acp3x_ids,
 	.probe = snd_acp3x_probe,
 	.remove = snd_acp3x_remove,
+	.driver = {
+		.pm = &acp3x_pm,
+	}
 };
 
 module_pci_driver(acp3x_driver);
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

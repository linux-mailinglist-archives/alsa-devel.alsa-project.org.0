Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B32111141D4
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 14:44:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47FEF1671;
	Thu,  5 Dec 2019 14:43:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47FEF1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575553476;
	bh=DO672m4r0D8043XUhqWT6QW6/72VdrN5qcbz7HrjES8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vm0SmPfToBZvPeQFeEND4ReGFkbWeKVa/SeGHNx6iKIKJmnreWxJSuI9YSCGFkTpr
	 0pB6aalml3gWdNsOD91MevkD8hS+0VXSNz+xiU/ET3PEzh4BI6aqB0Y/VusMnb7YuE
	 gwk389YjXxwrwK/qO9uOn+52ObiwbqEACRMzm43M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E29F80277;
	Thu,  5 Dec 2019 14:40:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81FF9F80278; Thu,  5 Dec 2019 14:39:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2995DF80269
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 14:39:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2995DF80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="H8tVZFCj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDlqdfn+eCmx/T9Njhf6YmoPW7NIYhv6t5Dd/FjkqT6MJpzZdbZGJ1hxliWdgVskzlzWX5cheFTUcQi/aQ3/3M3QTA29uMxT8bh/TclqdT9Q6qe6IiSFFU5ey+7nikVwaINw+DkbXArz03W4uU+Y/vEWWwnmdQ+yyjUWhwJv99uhrnHyPplcJcK9q/16Hj9Lxo61yS+JKjZ9wkHu2ABoSLdKsRdmVHWjb0HcD56t51a9rcWNaAHGLVIotw6eudbThG6DCxgFGd+3hfz2hpviO+uYZ4Vc6ET1myfkIcfab3X8SAtnCwZop4pQ3gJ0Gsm396XgHrMuyLK+/9OheO7oYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=442gr+WQPVztth3FabNY99kUZcihtIZxNVPArdygT1w=;
 b=GoZHtVGDoMAhlYg1017GzhBUxb19JOmB9s7YWHLVx4MaenXjJifyqSBeLUkc3Dn2Szp9zH/bK2qIyDlah1u3NAYjEgQrfJApxd3SM479wwZ/Qf2UYgMauS9TANjiayjPOEPhl+HjsZmtmP6e5AIYq+crsHZrKjSPjVqz2OHuJ087ouLltWrTudyL3DxtzNgx05GlRrUci+z18Ii+qyXatLc9w+xOMD6/EfQGSUD6UinAP2HpXZezcf7mk6deU9VYGLX/LiZnvuIaym7LVJ8nEPQqttWxHd52++8SY2GxOLXIDtu/KS5Ei0KIRYKAu4wxV20FoAouLuyfF8ub2wgg2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=442gr+WQPVztth3FabNY99kUZcihtIZxNVPArdygT1w=;
 b=H8tVZFCjsOjw1r6D4NuTwWhz+vNiKlH8LrIQpvfq9WR99qkzRIPdgYCfc1u8Vkqf6v8muBzZ5pPPQy/WCWvqmfHJhQin3nCd/canw922QKEIX/QSTnXtvDoYIXDVKCt96kwh4WDr7zRyuYubl47huRrI/bWBRtiih+ImD1ibRCI=
Received: from MN2PR12CA0020.namprd12.prod.outlook.com (2603:10b6:208:a8::33)
 by DM6PR12MB3291.namprd12.prod.outlook.com (2603:10b6:5:186::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14; Thu, 5 Dec
 2019 13:39:49 +0000
Received: from BN8NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::201) by MN2PR12CA0020.outlook.office365.com
 (2603:10b6:208:a8::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2516.12 via Frontend
 Transport; Thu, 5 Dec 2019 13:39:49 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT040.mail.protection.outlook.com (10.13.177.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Thu, 5 Dec 2019 13:39:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 5 Dec 2019
 07:39:49 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 5 Dec 2019
 07:39:49 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 5 Dec 2019 07:39:44 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Thu, 5 Dec 2019 19:07:31 +0530
Message-ID: <1575553053-18344-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575553053-18344-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1575553053-18344-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(396003)(428003)(23433003)(189003)(199004)(53416004)(316002)(36756003)(16586007)(478600001)(81156014)(2616005)(50466002)(86362001)(186003)(76176011)(51416003)(54906003)(48376002)(26005)(7696005)(6666004)(336012)(356004)(30864003)(11346002)(109986005)(70206006)(2906002)(5660300002)(4326008)(8936002)(70586007)(305945005)(7416002)(50226002)(426003)(81166006)(14444005)(8676002)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3291; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab0077d7-bfa4-44e4-8e32-08d7798899a2
X-MS-TrafficTypeDiagnostic: DM6PR12MB3291:|DM6PR12MB3291:
X-Microsoft-Antispam-PRVS: <DM6PR12MB32911CB5DFEC2559799B1A30E75C0@DM6PR12MB3291.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:21;
X-Forefront-PRVS: 02426D11FE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t0tNuiEqcLCOoQlZSAoYn/jDu7axWu8queil6BFIeCkTnBC7kLBXCdQkoBEWrEu9DwfZnBFNLLw06t08ijTvD+Kbap8Y7G2J4hgi3fJKI1++uduLBHgq3A0bP6+qY+N+eBSRibc/oAbwv77Sa9RcsyNCguxTCMSmSb9x7nIqdZDFNwGwbfyIMEY2Ndwy6OZg23AqWp4jZuFQaU3+Jzzo62rSboxrKshmVlq86nrJaK3QjrNJZBnMUm7TxAgqfYnuH/QRgaMtleWFimBCpW1u0usvxttvDjaJ8R0Ltd1m7lFev9hrT5a3wQKkDHzq8dJkSlVdyQ+ukfVg8ABhZ9xPxNH6iu2+OKaaDk7qLOSBl3Vqku/nAL5/n/F/5hESkk1ZVTvqleIhS74vylZ9JEHX7WhgWcloF4eFxxqZC5Mf35dvxrmT1I5MmaXiUQ9capbQIQa3/XXoAaUfL5kP2dkprxMNZSKXu3NW1Dwq9y/WAiWRs2PhFpZsqMdcPdMHb6xXN2RKG048xgyaJv/7yrOAL8zPtJ+edOYS3ut8RC+SCv8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2019 13:39:49.5854 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0077d7-bfa4-44e4-8e32-08d7798899a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3291
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 pierre-louis.bossart@linux.intel.com, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com, Dan
 Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH v14 6/7] ASoC: amd: Added ACP3x system resume
	and runtime pm
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

When system wide suspend happens, ACP will be powered off
and when system resumes,for audio usecase to continue,all
the runtime configuration data needs to be programmed again.
Added resume pm call back to ACP pm ops and also added runtime
PM operations for ACP3x PCM platform device.
Device will enter into D3 state when there is no activity
on audio I2S lines.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 146 +-----------------------------
 sound/soc/amd/raven/acp3x.h         |   7 ++
 sound/soc/amd/raven/pci-acp3x.c     | 173 ++++++++++++++++++++++++++++++++++--
 3 files changed, 178 insertions(+), 148 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 7a107ea..916f0d8 100644
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
 	struct i2s_dev_data *rv_i2s_data;
@@ -502,7 +402,7 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct i2s_dev_data *adata;
 	unsigned int irqflags;
-	int status, ret;
+	int status;
 
 	if (!pdev->dev.platform_data) {
 		dev_err(&pdev->dev, "platform_data not retrieved\n");
@@ -534,53 +434,28 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 	adata->i2s_irq = res->start;
 
 	dev_set_drvdata(&pdev->dev, adata);
-	/* Initialize ACP */
-	status = acp3x_init(adata->acp3x_base);
-	if (status)
-		return -ENODEV;
-
 	status = devm_snd_soc_register_component(&pdev->dev,
 						 &acp3x_i2s_component,
 						 NULL, 0);
 	if (status) {
 		dev_err(&pdev->dev, "Fail to register acp i2s component\n");
-		ret = -ENODEV;
-		goto dev_err;
+		return -ENODEV;
 	}
 	status = devm_request_irq(&pdev->dev, adata->i2s_irq, i2s_irq_handler,
 				  irqflags, "ACP3x_I2S_IRQ", adata);
 	if (status) {
 		dev_err(&pdev->dev, "ACP3x I2S IRQ request failed\n");
-		ret = -ENODEV;
-		goto dev_err;
+		return -ENODEV;
 	}
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	return 0;
-
-dev_err:
-	status = acp3x_deinit(adata->acp3x_base);
-	if (status)
-		dev_err(&pdev->dev, "ACP de-init failed\n");
-	else
-		dev_dbg(&pdev->dev, "ACP de-initialized\n");
-	return ret;
 }
 
 static int acp3x_audio_remove(struct platform_device *pdev)
 {
-	struct i2s_dev_data *adata;
-	int ret;
-
-	adata = dev_get_drvdata(&pdev->dev);
-	ret = acp3x_deinit(adata->acp3x_base);
-	if (ret)
-		dev_err(&pdev->dev, "ACP de-init failed\n");
-	else
-		dev_dbg(&pdev->dev, "ACP de-initialized\n");
-
 	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
@@ -588,15 +463,11 @@ static int acp3x_audio_remove(struct platform_device *pdev)
 static int acp3x_resume(struct device *dev)
 {
 	struct i2s_dev_data *adata;
-	int status;
 	u32 val, reg_val, frmt_val;
 
 	reg_val = 0;
 	frmt_val = 0;
 	adata = dev_get_drvdata(dev);
-	status = acp3x_init(adata->acp3x_base);
-	if (status)
-		return -ENODEV;
 
 	if (adata->play_stream && adata->play_stream->runtime) {
 		struct i2s_stream_instance *rtd =
@@ -643,14 +514,8 @@ static int acp3x_resume(struct device *dev)
 static int acp3x_pcm_runtime_suspend(struct device *dev)
 {
 	struct i2s_dev_data *adata;
-	int status;
 
 	adata = dev_get_drvdata(dev);
-	status = acp3x_deinit(adata->acp3x_base);
-	if (status)
-		dev_err(dev, "ACP de-init failed\n");
-	else
-		dev_dbg(dev, "ACP de-initialized\n");
 
 	rv_writel(0, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
 
@@ -660,12 +525,9 @@ static int acp3x_pcm_runtime_suspend(struct device *dev)
 static int acp3x_pcm_runtime_resume(struct device *dev)
 {
 	struct i2s_dev_data *adata;
-	int status;
 
 	adata = dev_get_drvdata(dev);
-	status = acp3x_init(adata->acp3x_base);
-	if (status)
-		return -ENODEV;
+
 	rv_writel(1, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
 	return 0;
 }
diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index 3c28644..b64f8b0 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -68,6 +68,13 @@
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
index 94f5f21..934f975 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -9,6 +9,9 @@
 #include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/delay.h>
+#include <sound/pcm.h>
 
 #include "acp3x.h"
 
@@ -19,6 +22,109 @@ struct acp3x_dev_data {
 	struct platform_device *pdev[ACP3x_DEVS];
 };
 
+static int acp3x_power_on(void __iomem *acp3x_base)
+{
+	u32 val;
+	int timeout;
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
+	timeout = 0;
+	while (++timeout < 500) {
+		val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
+		if (!val)
+			return 0;
+		udelay(1);
+	}
+	return -ETIMEDOUT;
+}
+
+static int acp3x_power_off(void __iomem *acp3x_base)
+{
+	u32 val;
+	int timeout;
+
+	rv_writel(ACP_PGFSM_CNTL_POWER_OFF_MASK,
+			acp3x_base + mmACP_PGFSM_CONTROL);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
+		if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_OFF)
+			return 0;
+		udelay(1);
+	}
+	return -ETIMEDOUT;
+}
+
+static int acp3x_reset(void __iomem *acp3x_base)
+{
+	u32 val;
+	int timeout;
+
+	rv_writel(1, acp3x_base + mmACP_SOFT_RESET);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
+		if (val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK)
+			break;
+		cpu_relax();
+	}
+	rv_writel(0, acp3x_base + mmACP_SOFT_RESET);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
+		if (!val)
+			return 0;
+		cpu_relax();
+	}
+	return -ETIMEDOUT;
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
@@ -64,6 +170,9 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	}
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
+	ret = acp3x_init(adata->acp3x_base);
+	if (ret)
+		goto disable_msi;
 
 	val = rv_readl(adata->acp3x_base + mmACP_I2S_PIN_CONFIG);
 	switch (val) {
@@ -73,7 +182,7 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 					  GFP_KERNEL);
 		if (!adata->res) {
 			ret = -ENOMEM;
-			goto disable_msi;
+			goto de_init;
 		}
 
 		adata->res[0].name = "acp3x_i2s_iomem";
@@ -118,7 +227,7 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 		pdevinfo[2].parent = &pci->dev;
 		pdevinfo[2].num_res = 1;
 		pdevinfo[2].res = &adata->res[2];
-		for (i = 0; i < ACP3x_DEVS ; i++) {
+		for (i = 0; i < ACP3x_DEVS; i++) {
 			adata->pdev[i] =
 				platform_device_register_full(&pdevinfo[i]);
 			if (IS_ERR(adata->pdev[i])) {
@@ -134,12 +243,20 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 		ret = -ENODEV;
 		goto disable_msi;
 	}
+	pm_runtime_set_autosuspend_delay(&pci->dev, 5000);
+	pm_runtime_use_autosuspend(&pci->dev);
+	pm_runtime_set_active(&pci->dev);
+	pm_runtime_put_noidle(&pci->dev);
+	pm_runtime_enable(&pci->dev);
 	return 0;
 
 unregister_devs:
 	if (val == I2S_MODE)
-		for (i = 0 ; i < ACP3x_DEVS ; i++)
+		for (i = 0; i < ACP3x_DEVS; i++)
 			platform_device_unregister(adata->pdev[i]);
+de_init:
+	if (acp3x_deinit(adata->acp3x_base))
+		dev_err(&pci->dev, "ACP de-init failed\n");
 disable_msi:
 	pci_disable_msi(pci);
 release_regions:
@@ -150,15 +267,56 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	return ret;
 }
 
+static int snd_acp3x_suspend(struct device *dev)
+{
+	int ret;
+	struct acp3x_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	ret = acp3x_deinit(adata->acp3x_base);
+	if (ret)
+		dev_err(dev, "ACP de-init failed\n");
+	else
+		dev_dbg(dev, "ACP de-initialized\n");
+
+	return 0;
+}
+
+static int snd_acp3x_resume(struct device *dev)
+{
+	int ret;
+	struct acp3x_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	ret = acp3x_init(adata->acp3x_base);
+	if (ret) {
+		dev_err(dev, "ACP init failed\n");
+		return ret;
+	}
+	return 0;
+}
+
+static const struct dev_pm_ops acp3x_pm = {
+	.runtime_suspend = snd_acp3x_suspend,
+	.runtime_resume =  snd_acp3x_resume,
+	.resume =	snd_acp3x_resume,
+};
+
 static void snd_acp3x_remove(struct pci_dev *pci)
 {
-	struct acp3x_dev_data *adata = pci_get_drvdata(pci);
-	int i;
+	struct acp3x_dev_data *adata;
+	int i, ret;
 
+	adata = pci_get_drvdata(pci);
 	if (adata->acp3x_audio_mode == ACP3x_I2S_MODE) {
-		for (i = 0 ; i <  ACP3x_DEVS ; i++)
+		for (i = 0; i < ACP3x_DEVS; i++)
 			platform_device_unregister(adata->pdev[i]);
 	}
+	ret = acp3x_deinit(adata->acp3x_base);
+	if (ret)
+		dev_err(&pci->dev, "ACP de-init failed\n");
+	pm_runtime_disable(&pci->dev);
+	pm_runtime_get_noresume(&pci->dev);
 	pci_disable_msi(pci);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
@@ -177,6 +335,9 @@ static struct pci_driver acp3x_driver  = {
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

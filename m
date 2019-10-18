Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3911EDC297
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 12:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A797D1693;
	Fri, 18 Oct 2019 12:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A797D1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571393922;
	bh=9h5z6imBn4onDbYsmA5je7TS2Tn7NZVw8i3RUW2rO1s=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X9km2qxNUzpnEWuvGonD5CMDOALDSD+kJvxQnUiHCcl3e5gLiJ1WskOO6eyWSAoxd
	 EiwvkbiJnjOfw+Nbh4NcQe1I6QEp8D/Iw9D1KkKRqMoDwXoaMW11YL7JPNe9gFkXeD
	 ZXWlYNxlbbbGZgE5RCjBg1jIwLsXDaGkGo0yUDno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A63BF8065B;
	Fri, 18 Oct 2019 12:14:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93139F8065B; Fri, 18 Oct 2019 12:14:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750054.outbound.protection.outlook.com [40.107.75.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C97C7F80649
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 12:14:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C97C7F80649
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="zOgJ608h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBRte7Wb6V9kjOJaFejPrC8l3qpLR7jVCJ8d6UBssJ54kvJ8/2ag1S/7A68UWEvFSexLJvigs/IywfF4sh1gxdGhoEI3i9LIAUWJchpDoWbSSTURQ5i4zEnp7dhmJKmg2IDgOzcdQU1OI/OtrIsUQ3Wcc4UKB5cFBRhcX4BMroVkk8JJIVZbtnrLZK0nor1bAaE2eMislCl8V+zWzn9+SpaNPVagtHJ0aqP13Z2Ea8AcSHolsC/tnVVQmDomltDPFIZUiJo1Qci3b9wErxYUM6B2xpIYP6BInwBOMUpZNo2fiDFVUP9Gu1daA4GLKMLcw77U58owvk2yFrLjNsOKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHQT8tXo6gKtHbnVueuO5lX3Xlv2rb16x9tonJoMsy4=;
 b=X4WZtr0t8IJlovNj8zjt7Le0BfFdXWwnBQ+ReU6yFFl3jCUpbJx/y2GE6a/7i+DoPtXzDBiRccPlWpgzXpCapUnynkZevHvirUbqfMAt5DzeFDl6WoBt2NtI+vW3lZbXr+ceQfXmM20xxqZYemlSAc8clgXWB5DGyqTY2SwgqErGRI10Wi/Hbil8oxF4Uduz+vQENZtV+g3WwmYBrx/gWucEjE0Mf95N8136sV+egjwsnFV7gNbTkMy524nB2cl6J0An4qpweXDK2HHjSJ133TbJ13bNV9hsO1hTl23un1hG8Yv+kLngVj+KjvroBv1F6jGE35XP8I4mM1QHUViuzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHQT8tXo6gKtHbnVueuO5lX3Xlv2rb16x9tonJoMsy4=;
 b=zOgJ608hUIdhcBIV0LHMyMwhSFkSMJaOOnsPRmn2Cje8B3ZeRUhikR9ciJTjJbL11EAJvebO115mrE5B9UQ9Kq9VXcpFLcPvpkJMeVpxmSd6jykQDmlF/MCTDZpb3bA7C8O3sixkxBdeB+9Rtkdaj4cZo0sCJ02E4zPpiE2BwNo=
Received: from CH2PR12CA0020.namprd12.prod.outlook.com (2603:10b6:610:57::30)
 by BN6PR12MB1810.namprd12.prod.outlook.com (2603:10b6:404:107::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.19; Fri, 18 Oct
 2019 10:14:10 +0000
Received: from CO1NAM03FT027.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by CH2PR12CA0020.outlook.office365.com
 (2603:10b6:610:57::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.18 via Frontend
 Transport; Fri, 18 Oct 2019 10:14:10 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM03FT027.mail.protection.outlook.com (10.152.80.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2367.14 via Frontend Transport; Fri, 18 Oct 2019 10:14:09 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 18 Oct
 2019 05:14:08 -0500
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 18 Oct 2019 05:14:04 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Sat, 19 Oct 2019 02:35:44 +0530
Message-ID: <1571432760-3008-6-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571432760-3008-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1571432760-3008-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(428003)(199004)(189003)(16586007)(305945005)(50466002)(81156014)(48376002)(26005)(54906003)(81166006)(2906002)(51416003)(36756003)(50226002)(8676002)(316002)(186003)(336012)(76176011)(8936002)(1671002)(7696005)(486006)(126002)(446003)(2616005)(476003)(4326008)(6666004)(356004)(109986005)(11346002)(53416004)(14444005)(426003)(5660300002)(478600001)(70206006)(86362001)(70586007)(47776003)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1810; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4550238-9bfe-4205-35b9-08d753b3eab6
X-MS-TrafficTypeDiagnostic: BN6PR12MB1810:|BN6PR12MB1810:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1810A999E7B050F3C6F92866E76C0@BN6PR12MB1810.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:37;
X-Forefront-PRVS: 01949FE337
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RvLldAs3D0ape5IWcTZ6Pkpy9vUh2drpVOlv+sgY3SEIfWoY/KYhkjPM0kcrPWtNmoRE2Cs13AqLiSZgrrao+i4nDAlsvVp63ThRtGTvCelKK1iHKu+pvfRgOMNmLrdYdpNhY7YKshzpivIjhbnoD/0fTlMRA4/CcdLZThxGwX7ezYHKUWQztxkGdgohv+ZsEsbCU01X5pkDhfx5JBF4gf9b/Kfag0mq8RZ9jzR9LQqbRPXVbHrYuAb67pL5qZKwuM4Psn//eTu/vedXy0L8DMM2+uwhaKkcYcJjkX3bKEpstk9pfLZxhwV8Kfp6jWNnWGgWz9gdv60l/uY+GcG8+AsDMZLpuiCQtcsvzi85I96mVXNJ8zDzdXDZQDNI+A55LnS3BkOsDXGdHZV5XRhW+WaR77ONQoX6jKt6sBVnAYQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 10:14:09.6639 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4550238-9bfe-4205-35b9-08d753b3eab6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1810
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Maruthi
 Bayyavarapu <maruthi.bayyavarapu@amd.com>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Sanju R Mehta <sanju.mehta@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH 6/7] ASoC: amd: ACP powergating should be done
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
 sound/soc/amd/raven/acp3x-pcm-dma.c | 141 +----------------------------------
 sound/soc/amd/raven/acp3x.h         |   7 ++
 sound/soc/amd/raven/pci-acp3x.c     | 145 +++++++++++++++++++++++++++++++++++-
 3 files changed, 153 insertions(+), 140 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index a000ac4..11189ac 100644
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
index dba7065..48669f4 100644
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
index 7f435b3..b74ecf6 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -19,11 +19,140 @@ struct acp3x_dev_data {
 	struct platform_device *pdev[ACP3x_DEVS];
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
-	u32 addr, val, i;
+	u32 addr, val, i, status;
 	struct acp3x_dev_data *adata;
 	struct platform_device_info pdevinfo[ACP3x_DEVS];
 	unsigned int irqflags;
@@ -63,6 +192,10 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	}
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
+	status = acp3x_init(adata->acp3x_base);
+	if (status)
+		return -ENODEV;
+
 
 	val = rv_readl(adata->acp3x_base + mmACP_I2S_PIN_CONFIG);
 	switch (val) {
@@ -132,6 +265,11 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	return 0;
 
 unmap_mmio:
+	status = acp3x_deinit(adata->acp3x_base);
+	if (status)
+		dev_err(&pci->dev, "ACP de-init failed\n");
+	else
+		dev_info(&pci->dev, "ACP de-initialized\n");
 	for (i = 0 ; i < ACP3x_DEVS ; i++)
 		platform_device_unregister(adata->pdev[i]);
 	kfree(adata->res);
@@ -153,6 +291,11 @@ static void snd_acp3x_remove(struct pci_dev *pci)
 		for (i = 0 ; i <  ACP3x_DEVS ; i++)
 			platform_device_unregister(adata->pdev[i]);
 	}
+	i = acp3x_deinit(adata->acp3x_base);
+	if (i)
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

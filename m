Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDFBBF2CC
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 14:19:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E6E61757;
	Thu, 26 Sep 2019 14:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E6E61757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569500380;
	bh=pD9ylYHvQWIRdMVaB2dSFd33cwFQcH/TCG7nxelsojM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bPDrsdQwWBW65YTJYiXKMfPRRB7qcmHiD84fUc1HL+ouhxF/Kq3/Fj6AsKSztrw4s
	 BRxfiE65UF/uEya9GmzBYroIbpPgHD2aoceTPwrtq+Tp8UfHMsXU5B/U5o51wb1oGX
	 3/13dyQOO3HFMEgyAIswCiLirlPDy3UiI2nnHYGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99FC7F80636;
	Thu, 26 Sep 2019 14:16:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E602EF80140; Thu, 26 Sep 2019 14:16:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710062.outbound.protection.outlook.com [40.107.71.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C45C8F80140
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 14:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C45C8F80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="lYgCGLC4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIIFdUI4k9Kq5hdvljEkyzezdDYmswBueNoEGeMfhSrc4XHBsQ87hlYVz8U5ULnkQ4lG308BOMHE8jVsp2BPxzlQ5L0h1jRU1OyAAAqVjOMaeZZT5LWpxXzIjIgu/3aW+OLOgn6QoQTk9C1HICRHLTNBBkDbH1LmM9xlJJhgGYlYDHJ54yQKMeOpwsMNYTvOImx2sC6SaForBxLZJkqCyUACH41GxuMW1b1R3K2OeTdlG1VRuPP6s1Em97fj6GnYvtHr8EKc9sgoHu4AYjfWoeuTDWA7meaHxjzPHWKeB2waH9CE0YZ6ElqcRDuRaZ/a79bnDgN1KS/TZBARrGVZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxqpuYxJpslz7wUayeIVDBfIMwZaXtTQa6w8sTyRUCQ=;
 b=j/3i/jIk6mqIGPC2Gsg34dyZd9a5qFfzk/FXxzi5JvOFDCPjDQYQ3jq3bwnKuHgwaOQYC60OZpxwR44zJvLWUcOKq4NDEN5hxz9NzTlvHIvyL8DbOrDrINGJJpN4EW9vXlQAzIYsU9s7/bTqpTRzO+ki0S7kjq/rHgnwt6PKEeybvdaesZCbcwSOgYk29haPxFvLe3MMG9dBTrAo4kIIxQz8fNxBzzKfq1UYcDFEewRRC5v2q89zwx7vUy3QN90GgKBQ9RX/HtvxJKa6Mv8VSewuWQ682F+u70BC7duIHXIGiJWgHUfu+g9GkkiMJKfPNnITzp7vs3xeyK51+sZ0lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=oracle.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxqpuYxJpslz7wUayeIVDBfIMwZaXtTQa6w8sTyRUCQ=;
 b=lYgCGLC4EvxaazlnG8m/hLp9oMhB4anJip1zreKRIL1S6NiLzndfXil4opnaCZNLOgMG5IZWQJ2COWYtbl+y7MMw6RwwXBzs8xVqcNv9G/e85KTxxW7fj9TVewPEiOUX54Qyv9uXuODK+8c/XfXmBK063Da5GKrvI1HkkDrhKes=
Received: from DM5PR12CA0066.namprd12.prod.outlook.com (2603:10b6:3:103::28)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.19; Thu, 26 Sep
 2019 12:16:08 +0000
Received: from CO1NAM03FT015.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by DM5PR12CA0066.outlook.office365.com
 (2603:10b6:3:103::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.15 via Frontend
 Transport; Thu, 26 Sep 2019 12:16:08 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT015.mail.protection.outlook.com (10.152.80.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 26 Sep 2019 12:16:07 +0000
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Thu, 26 Sep 2019 07:16:06 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 27 Sep 2019 04:37:39 +0530
Message-ID: <1569539290-756-5-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569539290-756-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1569539290-756-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(1496009)(136003)(39860400002)(396003)(376002)(346002)(428003)(199004)(189003)(26005)(53416004)(5660300002)(86362001)(36756003)(2906002)(47776003)(81156014)(81166006)(50226002)(8936002)(6666004)(30864003)(356004)(54906003)(478600001)(50466002)(14444005)(109986005)(8676002)(316002)(16586007)(70206006)(51416003)(476003)(1671002)(7696005)(126002)(11346002)(4326008)(2616005)(305945005)(446003)(336012)(70586007)(186003)(486006)(426003)(76176011)(48376002)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR12MB4033; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7070950-e926-4e73-7809-08d7427b4f80
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BY5PR12MB4033; 
X-MS-TrafficTypeDiagnostic: BY5PR12MB4033:|BY5PR12MB4033:
X-Microsoft-Antispam-PRVS: <BY5PR12MB403349301736414F6C3E4771E7860@BY5PR12MB4033.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:9;
X-Forefront-PRVS: 0172F0EF77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +9HL+FafTaHLQdvVcsBAof1t79Kv7MwG3F7Q48kEBQUwqz7L/wDpP6MSXCXMCbrh/g1XDvAYYLikA4ZntLppU4ZsNhAMGoS8U19ArtrRSeKj+yuNEXdd2sj9ckEf1eRVShEFCRVUKbmc+ss4D0w2Ll0YQzPKWILGO75H2RX2WvrvAcUbm8BXj2/AapDE/PkF+BwkXZNx7vGwF+qqFM504SHJl9M8wy67BQfIbMFCco9Kh/eaF6qmFxIXCCpoPnPNMq+Oacr2lFzf6x+5ajAiEKZ9WyV56+k1S/FdnyGteeLl7PasExidQrEoBKj9GZa4QIQsDIiRjAm+3qOhvvPgV/2xaW61Dd0RZ5ohhMiphGIv3mGXcKt37iwvQD369IWsF/TtEFQus+di6CWRO7Z9fecqdes8sMLdu/PAm4JR9ec=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2019 12:16:07.5782 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7070950-e926-4e73-7809-08d7427b4f80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Maruthi
 Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH 5/5] ASoC: amd: ACP powergating should be done
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

ACP power gating should be handled by ACP-PCI driver.
This patch moves the power gating logic into ACP-PCI driver.
This Power gating helps ACP to enter into D3 when there
is no activity on I2S.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Signed-off-by: Vijendar Mukunda <vijendar.mukunda@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 141 +---------------------
 sound/soc/amd/raven/acp3x.h         |   8 ++
 sound/soc/amd/raven/pci-acp3x.c     | 227 ++++++++++++++++++++++++++++++------
 3 files changed, 200 insertions(+), 176 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index bc90fa0..0995d92 100644
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
-				timeout > 100) {
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
@@ -560,63 +460,37 @@ static int acp3x_audio_probe(struct platform_device *pdev)
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
@@ -661,15 +535,8 @@ static int acp3x_resume(struct device *dev)
 
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
@@ -677,12 +544,8 @@ static int acp3x_pcm_runtime_suspend(struct device *dev)
 
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
index d381b5c..1862172 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -73,6 +73,14 @@
 #define SLOT_WIDTH_24	0x18
 #define SLOT_WIDTH_32	0x20
 
+#define ACP_PGFSM_CNTL_POWER_ON_MASK	0x01
+#define ACP_PGFSM_CNTL_POWER_OFF_MASK	0x00
+#define ACP_PGFSM_STATUS_MASK		0x03
+#define ACP_POWERED_ON			0x00
+#define ACP_POWER_ON_IN_PROGRESS	0x01
+#define ACP_POWERED_OFF			0x02
+#define ACP_POWER_OFF_IN_PROGRESS	0x03
+
 struct acp3x_platform_info {
 	u16 play_i2s_instance;
 	u16 cap_i2s_instance;
diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
index 6fbb720..627798a 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -11,10 +11,12 @@
 #include <linux/interrupt.h>
 #include <linux/mfd/core.h>
 #include <linux/pm_runtime.h>
+#include <linux/delay.h>
 #include <sound/pcm.h>
 
 #include "acp3x.h"
 
+
 struct i2s_platform_data {
 	unsigned int cap;
 	int channel;
@@ -29,6 +31,134 @@ struct acp3x_dev_data {
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
 
 static struct device *get_mfd_cell_dev(const char *device_name, int r)
 {
@@ -36,9 +166,9 @@ static struct device *get_mfd_cell_dev(const char *device_name, int r)
 	struct device *dev;
 
 	snprintf(auto_dev_name, sizeof(auto_dev_name),
-		 "%s.%d.auto", device_name, r);
+			"%s.%d.auto", device_name, r);
 	dev = bus_find_device_by_name(&platform_bus_type,
-					NULL, auto_dev_name);
+			NULL, auto_dev_name);
 	dev_info(dev, "device %s added\n", auto_dev_name);
 	return dev;
 }
@@ -47,8 +177,8 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
 	int ret;
-	uint64_t addr;
-	int val, i, r;
+	resource_size_t addr;
+	int val, i, r, status;
 	struct acp3x_dev_data *adata;
 	struct device *dev;
 	struct i2s_platform_data *i2s_pdata;
@@ -58,38 +188,30 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 		dev_err(&pci->dev, "pci_enable_device failed\n");
 		return -ENODEV;
 	}
+	pci_set_master(pci);
 
+	adata = devm_kzalloc(&pci->dev, sizeof(struct acp3x_dev_data),
+							GFP_KERNEL);
+	if (!adata)
+		return -ENOMEM;
+	pci_set_drvdata(pci, adata);
+	adata->parent = &pci->dev;
 	ret = pci_request_regions(pci, "AMD ACP3x audio");
 	if (ret < 0) {
 		dev_err(&pci->dev, "pci_request_regions failed\n");
-		goto disable_pci;
-	}
-
-	adata = devm_kzalloc(&pci->dev, sizeof(struct acp3x_dev_data),
-			     GFP_KERNEL);
-	if (!adata) {
-		ret = -ENOMEM;
 		goto release_regions;
 	}
 
-	/* check for msi interrupt support */
-	ret = pci_enable_msi(pci);
-	if (ret)
-		/* msi is not enabled */
-		irqflags = IRQF_SHARED;
-	else
-		/* msi is enabled */
-		irqflags = 0;
-
 	addr = pci_resource_start(pci, 0);
 	adata->acp3x_base = ioremap(addr, pci_resource_len(pci, 0));
 	if (!adata->acp3x_base) {
 		ret = -ENOMEM;
 		goto release_regions;
 	}
-	pci_set_master(pci);
-	pci_set_drvdata(pci, adata);
-	adata->parent = &pci->dev;
+	status = acp3x_init(adata->acp3x_base);
+	if (status)
+		return -ENODEV;
+
 	val = rv_readl(adata->acp3x_base + mmACP_I2S_PIN_CONFIG);
 	switch (val) {
 	case I2S_MODE:
@@ -165,10 +287,6 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 			dev = get_mfd_cell_dev(adata->cell[i].name, i);
 		break;
 
-	default:
-		dev_err(&pci->dev, "Invalid ACP audio mode : %d\n", val);
-		ret = -ENODEV;
-		goto unmap_mmio;
 	}
 	pm_runtime_set_autosuspend_delay(&pci->dev, 10000);
 	pm_runtime_use_autosuspend(&pci->dev);
@@ -177,30 +295,59 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	pm_runtime_enable(&pci->dev);
 	return 0;
 
+release_regions:
+	pci_release_regions(pci);
+	pci_disable_device(pci);
+	status = acp3x_deinit(adata->acp3x_base);
+	if (status)
+		dev_err(&pci->dev, "ACP de-init failed\n");
+	else
+		dev_info(&pci->dev, "ACP de-initialized\n");
+
+	/*ignore device status and return driver probe error*/
+	return -ENODEV;
 unmap_mmio:
+	status = acp3x_deinit(adata->acp3x_base);
+	if (status)
+		dev_err(&pci->dev, "ACP de-init failed\n");
+	else
+		dev_info(&pci->dev, "ACP de-initialized\n");
+
 	mfd_remove_devices(adata->parent);
 	kfree(adata->res);
 	kfree(adata->cell);
 	iounmap(adata->acp3x_base);
 	/*ignore device status and return driver probe error*/
 	return -ENODEV;
-release_regions:
-	pci_release_regions(pci);
-	/*ignore device status and return driver probe error*/
-	return -ENODEV;
-disable_pci:
-	pci_disable_device(pci);
-	/*ignore device status and return driver probe error*/
-	return -ENODEV;
+
+	return ret;
 }
 
 static int  snd_acp3x_suspend(struct device *dev)
 {
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
 	return 0;
 }
 
 static int  snd_acp3x_resume(struct device *dev)
 {
+
+	int status;
+	struct acp3x_dev_data *adata = dev_get_drvdata(dev);
+
+	status = acp3x_init(adata->acp3x_base);
+	if (status)
+		return -ENODEV;
+
 	return 0;
 }
 
@@ -213,8 +360,14 @@ static const struct dev_pm_ops acp3x_pm = {
 
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
 	kfree(adata->res);
 	kfree(adata->cell);
 	iounmap(adata->acp3x_base);
@@ -227,8 +380,8 @@ static void snd_acp3x_remove(struct pci_dev *pci)
 
 static const struct pci_device_id snd_acp3x_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, 0x15e2),
-	.class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
-	.class_mask = 0xffffff },
+		.class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
+		.class_mask = 0xffffff },
 	{ 0, },
 };
 MODULE_DEVICE_TABLE(pci, snd_acp3x_ids);
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

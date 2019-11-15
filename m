Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB985FDD32
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 13:17:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 701C51615;
	Fri, 15 Nov 2019 13:16:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 701C51615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573820266;
	bh=VVfQ7S5JuhdhtoN1uL+K2HRWRxXdq7QKbIHIniyJioM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sCdymKZ1QCyrcrUlFPHCu6gJVXwhwWespGRwimuHK77Be9W9+V/NN77+ZJhWapcpV
	 iyzm87CdXGqrbJGt1sux+eIMx+s3F8afX6V1N5sGLe1MFqCvkAl1VDLT57+LvD9/O6
	 W8v5KvWzFtt/vMW69btUJ8R3RJ9y+ToMJGTCZLUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57E4AF8010B;
	Fri, 15 Nov 2019 13:14:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 276A4F80109; Fri, 15 Nov 2019 13:14:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750052.outbound.protection.outlook.com [40.107.75.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C581F80108
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 13:14:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C581F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="AKAQPp6J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CifenNSGFgO1vMFXR6N3NrVBCaGo+j0Dq9unH/0IKgKQrGennr85jCPNVzmDGLl6eTYsk8ZwXIul5Ia5uJSqIekLtwR0+IFlKrtgocn3yiYpAHcCRfxVulirn6X9MRXHW6U9g4ksfRoy2Cyp7ihmUAZnJapktXt8r8oyDNWND+QQv94WvWJalg8C3wuCil+YxqUd322lt4ba3Hsrmym34QJ0ga4uslBc/vVUFruseJHxHrSsZXyBYiWdA1ATw1PW8901poYV23rzaNZiIR4c98UchD70FW85hIk3EvC9RA8PZ5R8X+zI1rofS+TZT8P8u1tJlFoARoE0HfN49C17jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lubwPzAgmm2KrUMMpgfhs50IuoVTH1Tj8hZvxtIB6Do=;
 b=mrrNNEqFAy4got0wqUqRzCj2jfQAKG5qSF3Zzgw5U+fi1ic31yH0c4Uec3XewgAB4dCyUCzVPPX0hK6Jq7ryhBL3WvMscCOCnHXGBN1Ewjcevquk0/ZmAefSdhfPb5FviiA/8OxyQywHQwi0moa2nTSJBh2SD+C06wO7grklWKeqQg4C1cUzu9/Q1Cw7apC2ivHPQcH6VelIjWGl/xkC0Ao2cxl1eqo4wqdpv127RosAIBTfkkwfeJmtspLYR7PBuQSVGuPAFFV26frRjefM50OW2jCFpc/8J9MeGOkrBmnNoHP8Zi8vi8abaI+qsUpd58nOSQGv0tNIxxYaaY2L7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lubwPzAgmm2KrUMMpgfhs50IuoVTH1Tj8hZvxtIB6Do=;
 b=AKAQPp6J8chTR4sBxSMCwdh2z8xciY/RbX0IaBaka5MjkjTAnpADnBvVFK4w3M3EfeTkXsJu+vYLRoh/J0lM1py+CufGTgzA8KqK07oGnYuPX4natr/Fvygkf8cHZQ0jAmYPpUt/1XHm6ugKpL0Y5m/hxJzoAZ7z+Qe8Uu3hk60=
Received: from DM5PR12CA0021.namprd12.prod.outlook.com (2603:10b6:4:1::31) by
 MN2PR12MB3229.namprd12.prod.outlook.com (2603:10b6:208:102::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22; Fri, 15 Nov
 2019 12:14:14 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::203) by DM5PR12CA0021.outlook.office365.com
 (2603:10b6:4:1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.23 via Frontend
 Transport; Fri, 15 Nov 2019 12:14:13 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Fri, 15 Nov 2019 12:14:13 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 15 Nov
 2019 06:14:06 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 15 Nov 2019 06:13:56 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 15 Nov 2019 17:40:23 +0530
Message-ID: <1573819823-23731-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573819823-23731-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573819823-23731-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(1496009)(346002)(376002)(396003)(136003)(39860400002)(428003)(23433003)(189003)(199004)(50466002)(5660300002)(48376002)(109986005)(36756003)(2906002)(186003)(305945005)(478600001)(26005)(11346002)(126002)(476003)(2616005)(446003)(486006)(336012)(426003)(7696005)(51416003)(53416004)(76176011)(30864003)(356004)(1671002)(6666004)(316002)(81156014)(81166006)(8676002)(47776003)(7416002)(16586007)(54906003)(14444005)(70206006)(50226002)(86362001)(70586007)(4326008)(8936002)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3229; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52fb6ab5-6082-4af3-d857-08d769c55441
X-MS-TrafficTypeDiagnostic: MN2PR12MB3229:|MN2PR12MB3229:
X-Microsoft-Antispam-PRVS: <MN2PR12MB32290B48090B81F375AA0140E7700@MN2PR12MB3229.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:820;
X-Forefront-PRVS: 02229A4115
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8/I+54hmYuowdUrOdWSl7Yw2TGYjR0WRSdQ6j3ireAVUlmJOKfy5Dh+hnVadKO/7jbcy8myfIV3dpY+q2m/3wVDRKOvn8u0j97vLK7l1wLr0Kav3M3nTLeWafTP+6whcLOi1ZnWv+ufyqRKu7BP00Cxr/rxKQtmHhdvM77qMoh3poaQ2RXGsNB9wKMkjxF9+Rw7YyQwd4iFqZMti3j+0CTb8bC4b8lLXDB9lBEevbMD8BsdAPjZl14ammTRkMwSyaqoHtO+++gukZRaVEfIkBlRA8TIQFVrzCpeH6V73ysicqfiMGphTcns5RwqX1hSpUAKCflYA5Sjv9pit7zSFPU0rRbSt5+nwCMvoBO2cdbRlRtbWcfMRncPPlLX+bkW8hCZL7jR7vDX4Wo8e91g3rUl1MmOzCKNRlqf1hpZeysNFzd6801FlChbKbQa5IwxK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 12:14:13.8449 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52fb6ab5-6082-4af3-d857-08d769c55441
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3229
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Akshu.Agrawal@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH v6 6/6] ASoC: amd: Added ACP3x system resume
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
 sound/soc/amd/raven/acp3x-pcm-dma.c | 136 +------------------------
 sound/soc/amd/raven/acp3x.h         |   7 ++
 sound/soc/amd/raven/pci-acp3x.c     | 195 +++++++++++++++++++++++++++++++++++-
 3 files changed, 200 insertions(+), 138 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 51ff1c0..49279911 100644
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
@@ -536,12 +436,6 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 	adata->i2s_irq = res->start;
 
 	dev_set_drvdata(&pdev->dev, adata);
-	/* Initialize ACP */
-	status = acp3x_init(adata->acp3x_base);
-	if (status) {
-		ret = -ENODEV;
-		goto io_irq;
-	}
 	status = devm_snd_soc_register_component(&pdev->dev,
 						 &acp3x_i2s_component,
 						 NULL, 0);
@@ -566,11 +460,6 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 dev_err:
 	iounmap(adata->acp3x_base);
 	kfree(adata);
-	status = acp3x_deinit(adata->acp3x_base);
-	if (status)
-		dev_err(&pdev->dev, "ACP de-init failed\n");
-	else
-		dev_info(&pdev->dev, "ACP de-initialized\n");
 	return ret;
 io_irq:
 	iounmap(adata->acp3x_base);
@@ -583,16 +472,6 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 
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
-		dev_info(&pdev->dev, "ACP de-initialized\n");
-
 	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
@@ -600,13 +479,9 @@ static int acp3x_audio_remove(struct platform_device *pdev)
 static int acp3x_resume(struct device *dev)
 {
 	struct i2s_dev_data *adata;
-	int status;
 	u32 val;
 
 	adata = dev_get_drvdata(dev);
-	status = acp3x_init(adata->acp3x_base);
-	if (status)
-		return -ENODEV;
 
 	if (adata->play_stream && adata->play_stream->runtime) {
 		struct i2s_stream_instance *rtd =
@@ -653,14 +528,8 @@ static int acp3x_resume(struct device *dev)
 static int acp3x_pcm_runtime_suspend(struct device *dev)
 {
 	struct i2s_dev_data *adata;
-	int status;
 
 	adata = dev_get_drvdata(dev);
-	status = acp3x_deinit(adata->acp3x_base);
-	if (status)
-		dev_err(dev, "ACP de-init failed\n");
-	else
-		dev_info(dev, "ACP de-initialized\n");
 
 	rv_writel(0, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
 
@@ -670,12 +539,9 @@ static int acp3x_pcm_runtime_suspend(struct device *dev)
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
index 4c4601d..d1dc7ba 100644
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
 
@@ -19,6 +22,120 @@ struct acp3x_dev_data {
 	struct platform_device *pdev[ACP3x_DEVS];
 };
 
+static int acp3x_power_on(void __iomem *acp3x_base)
+{
+	u32 val;
+	u32 timeout;
+
+	timeout = 0;
+	val = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
+
+	if (val == 0)
+		return val;
+
+	if (!((val & ACP_PGFSM_STATUS_MASK) ==
+				ACP_POWER_ON_IN_PROGRESS))
+		rv_writel(ACP_PGFSM_CNTL_POWER_ON_MASK,
+			acp3x_base + mmACP_PGFSM_CONTROL);
+	while (++timeout) {
+		val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
+		if (!val)
+			break;
+		udelay(1);
+		if (timeout > 500) {
+			pr_err("ACP is Not Powered ON\n");
+			return -ETIMEDOUT;
+		}
+	}
+	return 0;
+}
+static int acp3x_power_off(void __iomem *acp3x_base)
+{
+	u32 val;
+	u32 timeout, ret;
+
+	timeout = 0;
+	rv_writel(ACP_PGFSM_CNTL_POWER_OFF_MASK,
+			acp3x_base + mmACP_PGFSM_CONTROL);
+	while (++timeout) {
+		val  = rv_readl(acp3x_base + mmACP_PGFSM_STATUS);
+		if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_OFF) {
+			ret = 0;
+			break;
+		}
+		udelay(1);
+		if (timeout > 500) {
+			pr_err("ACP is Not Powered OFF\n");
+			ret = -ETIMEDOUT;
+			break;
+		}
+	}
+	return ret;
+}
+static int acp3x_reset(void __iomem *acp3x_base)
+{
+	u32 val, timeout;
+
+	rv_writel(1, acp3x_base + mmACP_SOFT_RESET);
+	timeout = 0;
+	while (++timeout) {
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
+	while (++timeout) {
+		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
+		if (!val)
+			break;
+		if (timeout > 100)
+			return -ENODEV;
+		cpu_relax();
+	}
+	return 0;
+}
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
 static int snd_acp3x_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
@@ -63,6 +180,9 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	}
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
+	ret = acp3x_init(adata->acp3x_base);
+	if (ret)
+		goto release_init;
 
 	val = rv_readl(adata->acp3x_base + mmACP_I2S_PIN_CONFIG);
 	switch (val) {
@@ -72,7 +192,7 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 					  GFP_KERNEL);
 		if (!adata->res) {
 			ret = -ENOMEM;
-			goto release_regions;
+			goto release_resource;
 		}
 
 		adata->res[0].name = "acp3x_i2s_iomem";
@@ -133,9 +253,19 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 		ret = -ENODEV;
 		goto unmap_mmio;
 	}
+	pm_runtime_set_autosuspend_delay(&pci->dev, 5000);
+	pm_runtime_use_autosuspend(&pci->dev);
+	pm_runtime_set_active(&pci->dev);
+	pm_runtime_put_noidle(&pci->dev);
+	pm_runtime_enable(&pci->dev);
 	return 0;
 
 unmap_mmio:
+	ret = acp3x_deinit(adata->acp3x_base);
+	if (ret)
+		dev_err(&pci->dev, "ACP de-init failed\n");
+	else
+		dev_dbg(&pci->dev, "ACP de-initialized\n");
 	for (i = 0 ; i < ACP3x_DEVS ; i++)
 		platform_device_unregister(adata->pdev[i]);
 	iounmap(adata->acp3x_base);
@@ -144,6 +274,23 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	pci_disable_msi(pci);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
+release_resource:
+	ret = acp3x_deinit(adata->acp3x_base);
+	if (ret)
+		dev_err(&pci->dev, "ACP de-init failed\n");
+	else
+		dev_dbg(&pci->dev, "ACP de-initialized\n");
+	iounmap(adata->acp3x_base);
+	kfree(adata);
+	pci_disable_msi(pci);
+	pci_release_regions(pci);
+	pci_disable_device(pci);
+release_init:
+	iounmap(adata->acp3x_base);
+	kfree(adata);
+	pci_disable_msi(pci);
+	pci_release_regions(pci);
+	pci_disable_device(pci);
 release_regions:
 	kfree(adata);
 	pci_disable_msi(pci);
@@ -157,17 +304,56 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 
 	return ret;
 }
+static int  snd_acp3x_suspend(struct device *dev)
+{
+	int status;
+	struct acp3x_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	status = acp3x_deinit(adata->acp3x_base);
+	if (status)
+		dev_err(dev, "ACP de-init failed\n");
+	else
+		dev_dbg(dev, "ACP de-initialized\n");
+
+	return 0;
+}
+static int  snd_acp3x_resume(struct device *dev)
+{
+	int status;
+	struct acp3x_dev_data *adata;
 
+	adata = dev_get_drvdata(dev);
+	status = acp3x_init(adata->acp3x_base);
+	if (status) {
+		dev_err(dev, "ACP init failed\n");
+		return status;
+	}
+	return 0;
+}
+static const struct dev_pm_ops acp3x_pm = {
+	.runtime_suspend = snd_acp3x_suspend,
+	.runtime_resume =  snd_acp3x_resume,
+	.resume =       snd_acp3x_resume,
+};
 static void snd_acp3x_remove(struct pci_dev *pci)
 {
-	struct acp3x_dev_data *adata = pci_get_drvdata(pci);
-	int i;
+	struct acp3x_dev_data *adata;
+	int i, ret;
 
+	adata = pci_get_drvdata(pci);
 	if (adata->acp3x_audio_mode == ACP3x_I2S_MODE) {
 		for (i = 0 ; i <  ACP3x_DEVS ; i++)
 			platform_device_unregister(adata->pdev[i]);
 	}
+	ret = acp3x_deinit(adata->acp3x_base);
+	if (ret)
+		dev_err(&pci->dev, "ACP de-init failed\n");
+	else
+		dev_dbg(&pci->dev, "ACP de-initialized\n");
 	iounmap(adata->acp3x_base);
+	pm_runtime_disable(&pci->dev);
+	pm_runtime_get_noresume(&pci->dev);
 	pci_disable_msi(pci);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
@@ -186,6 +372,9 @@ static struct pci_driver acp3x_driver  = {
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

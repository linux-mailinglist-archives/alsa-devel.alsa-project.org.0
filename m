Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C87BE1051D5
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 12:52:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 107581690;
	Thu, 21 Nov 2019 12:51:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 107581690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574337160;
	bh=No8TBPuaVtHcS2SD3wNF5tk9SpE9+2ALp8hOnzI+nIs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eWQ8ZEHk10Gy4fgV7CieGszPxbjBoBuIEMQ3EvA8kS/MTlcZdJuwhsTtMY+g7C1js
	 zGhEj5pAeGAYFlQQb8NAfe4cvR9ba9KxXjo9v57JbmNJkAsaj3vm9aR0CFum88YKxh
	 pBeJ5LI23IVVTUeCqavspR2XfpK1J3w7NiBlc2jU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E59CF80216;
	Thu, 21 Nov 2019 12:48:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AAD6F801ED; Thu, 21 Nov 2019 12:48:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05hn0214.outbound.protection.outlook.com [104.47.49.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66CFDF8019B
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 12:48:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66CFDF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="0t/VzTGI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LDrcU/wjXgillIND/VL0wMO+X3zjjdSovlOO1NJLSr4CHfJkdq+Ea1BKg20wGLW17fYtgVak2dINZzxPQoTukICCfPkJJCnnxT9sWqGHS3iP0mOiVe9jWiYybhDDMak4xdtzG2M66eo3XaVID+HSUmMQc+DJGOgSMHWdL8im13qGSvWEcXTnMtyC4CGikR4/AL+JuZ5M6TkuboWY/uzkL7v1KwAPcmIXaZZbvh3K8NPNS5fauwsqYeS97yqHU0Xv8U/xjeRYMsrkikllqSTZcHAFvWwZvogOSPuZxNOhxtAvwJXJqGAuX9EQsysB2PAvga+8I1umNtPjOCiLwTplPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTYq+USnDJj7aStognQ6qniOJG6lIo+NhqjMec/YYmc=;
 b=aii+1VOaReKsuz/MT7cdOzfw34BiQuKkndnXvztg5SSD7Zx43kU5kIUFZl13wdnRrlZGUVNqyO2OPSn17Utd6j752AXe3r1UynMfGnKlTLucp09+CPJblMWCL6qAkl8JWw97/Tc2RKJBGZBFoq2pIQjxr3eiCwVuls4MpHSsz+Ctu6KkLTj1+kbLpkKLm2FXCs2jUiahbWbmCDJ7cD3iez1WT22SRnGu/EF8YpPIOfp3KXijG/ksQUYUihIDyrKwzHKtvRIKo/7EPJ2AvykEP4TpCqU6gR7qumz4U7dcKQN1Hm7ylH6PMzxUVGACT4klSof6btC2pc0T9KR0HKO56w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oTYq+USnDJj7aStognQ6qniOJG6lIo+NhqjMec/YYmc=;
 b=0t/VzTGIPcaGM4EA6QYjVUcYTxWJpsWqDatrQBbu0DycyCoYmeaOZ3lNu17MVvweg6b4mbf2EPQxDIaucjg7QFctpSaz3TAUGLQI5h2V2/Djnm5mZgbvKul6PC9jo0TD6+b7czt4EZV9lG9inYB6uIHJRortubg/EpNvBzvMXQo=
Received: from DM3PR12CA0068.namprd12.prod.outlook.com (2603:10b6:0:57::12) by
 BY5PR12MB4243.namprd12.prod.outlook.com (2603:10b6:a03:20f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16; Thu, 21 Nov
 2019 11:47:58 +0000
Received: from DM6NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::204) by DM3PR12CA0068.outlook.office365.com
 (2603:10b6:0:57::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.18 via Frontend
 Transport; Thu, 21 Nov 2019 11:47:58 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT008.mail.protection.outlook.com (10.13.172.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2451.23 via Frontend Transport; Thu, 21 Nov 2019 11:47:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 21 Nov
 2019 05:47:57 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 21 Nov
 2019 05:47:56 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 21 Nov 2019 05:47:52 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Thu, 21 Nov 2019 17:16:01 +0530
Message-ID: <1574336761-16717-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574336761-16717-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574336761-16717-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:SPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(136003)(396003)(428003)(189003)(23433003)(199004)(5660300002)(7696005)(51416003)(426003)(76176011)(478600001)(109986005)(47776003)(54906003)(4326008)(336012)(48376002)(36756003)(53416004)(16586007)(11346002)(50466002)(446003)(86362001)(2616005)(356004)(1671002)(316002)(30864003)(81156014)(14444005)(81166006)(2906002)(6666004)(8676002)(70586007)(70206006)(7416002)(50226002)(8936002)(305945005)(186003)(26005)(266003)(32563001)(989001);
 DIR:OUT; SFP:1501; SCL:6; SRVR:BY5PR12MB4243; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 159f3636-5dc5-45c3-3370-08d76e78a794
X-MS-TrafficTypeDiagnostic: BY5PR12MB4243:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4243713D47E91B5D76E31EADE74E0@BY5PR12MB4243.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:17;
X-Forefront-PRVS: 0228DDDDD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FsaZs4KPAb+I+J0/Y6fnXbFbSiQm74z+QGCFloU1jsGcOHTxlzfp8A3bPNfV01n7EWcu7WUxBBNleqBmZtHPLPRNaU8b2HXtUO1xq4zV8HxY5Hi0Ign4/SEiUIz94kQCQec+cMqc6NZqLeVUviL89CCN7qG63qm46dUOv90+MfB6y3G+JJACrHnNFsEnZOTRZdEmg0E2TqR/NEDcJniAt3+KRN3eLWlsOP+vpglAy6FiSEtonmlGKOtV7F/YZjNTJPBzYMdtNcE+OEzMOaQBHOix/+H52JBlmGu0AD3hbVMRy2BAOucFmlENCf79CnRRnapMBD+k51GtR7SchD0vduj+076jmZHkQiYNKaaQJhGWSxolnVnWiP3pWFyNufU02k6hmhDHvPqIJ9FdCj3hY5DiMeBSuJfy+PnSmS6AhylURge/eeyUZQo7EzIKMNjV8pkkkSVs9r9gj+PIQu0CWRC/cAUlIr0+G1NJ8HK3fAqtW9Wp00JxqKOv61qAygm4/+qSu12mDNFzOjqrDIlZ2AdRQJxqleoOzSF/BSXQ83nV9vycIrUNcgSZfqSTDtASsnhN/KWHaKSyZWfjjQy9WwLZRrlWrH9VO3xtBQgVJqeGRZwLTrZXdu1QVWesI4ON6A/6r+LAUv2XmOtX2IkECX0uUqWEY44VXklAQV7CrvXXm0nYgAlzkY1v9qlWxGPZ5oY6GeaLYepJKIG01Nl1fg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2019 11:47:58.1944 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 159f3636-5dc5-45c3-3370-08d76e78a794
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4243
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, pierre-louis.bossart@linux.intel.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>, Akshu.Agrawal@amd.com,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [RESEND PATCH v11 6/6] ASoC: amd: Added ACP3x system
	resume and runtime pm
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
 sound/soc/amd/raven/acp3x-pcm-dma.c | 144 +-----------------------------
 sound/soc/amd/raven/acp3x.h         |   7 ++
 sound/soc/amd/raven/pci-acp3x.c     | 173 ++++++++++++++++++++++++++++++++++--
 3 files changed, 177 insertions(+), 147 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index e0bac1f..b4c277a 100644
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
@@ -535,53 +435,28 @@ static int acp3x_audio_probe(struct platform_device *pdev)
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
@@ -589,13 +464,9 @@ static int acp3x_audio_remove(struct platform_device *pdev)
 static int acp3x_resume(struct device *dev)
 {
 	struct i2s_dev_data *adata;
-	int status;
 	u32 val, reg_val, frmt_val;
 
 	adata = dev_get_drvdata(dev);
-	status = acp3x_init(adata->acp3x_base);
-	if (status)
-		return -ENODEV;
 
 	if (adata->play_stream && adata->play_stream->runtime) {
 		struct i2s_stream_instance *rtd =
@@ -641,14 +512,8 @@ static int acp3x_resume(struct device *dev)
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
 
@@ -658,12 +523,9 @@ static int acp3x_pcm_runtime_suspend(struct device *dev)
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
index bf0a683..8ba484d 100644
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
index 94f5f21..d46a6d6 100644
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
+			return 0;
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

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEDF1D8008
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:25:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF3061752;
	Mon, 18 May 2020 19:24:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF3061752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589822738;
	bh=47ciKiCMq0YQO0bLl+Mhe77u4a+fNHSVg6A9GhwpqSk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RgUkyAqYpX5tSegJeP14KehNI3WHVXi4YlQhv4QWbuFC8gWHs0s2AZhlUCuZ35I6R
	 PplHCmrFMDwm5/Wyxbh+4IF89VXYF4I4H8mDufjeQyhpCrBtuPvf/O6fqtBzI9B43t
	 yo6mi1mh7Tjs3gHMOEffKljBARh1yTvJt6yHa0as=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3582FF80335;
	Mon, 18 May 2020 19:17:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3356F802DF; Mon, 18 May 2020 19:17:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF9CFF802BC
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:17:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF9CFF802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="MX0jgPIx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAktvM0Ut8g6M0oPoeXlVM3jHCMEQgOcpPchVtYEPF2AsRGxv/d3cYo0v6bhV7AL2aY1MT0ecI1WclhXg19XLDBx5Owjhh1kHK6DPSmPh1io4D5PsGYiCAX9DRW3MrG+0ZxQhe1uIl5AWu9RcWDGwkyzPXmxSCltH73vPukwCjY/gxfq4zExG0j5atOcSM/3RHDeeqlhrUx3UpHFLdmBrLrWFFhlNXnbQbQumpyPQ6vmezIP/YtHZEhFMJ1PVjE3dn1MrD+WWWUTAk8PPzF9V/njY+nm2HpC0tZjkGeaVgQMIYgGDBqY45yhMP4yWwv1/sy1vcKSq3fYW8X+fBGTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM3fsZZ0/uuo59qlvPUa50NSJTv0VooGds4AFsSsRgs=;
 b=jQqwJcxBPPUBRgtMErDT52ZNyiYu/pErWxihiTojhIJtPOvDq4UsZX/dnBk4czGnM/Z85vA8EFOAxjiHW1wArup14qso/5vc71RG4PCP8LCLcA427S+UVmvtNiWSL7jGCxm9oy4QZ8klv2lA6E3ySOEPKfL6f5jYV4yhyzPfXL7+/NBd9epWY+qh7LzW9n9COiFYvqsI1DsC5sV5up0TbinQtOS46dBKbFktNtK5fLqm+E3v15tmO/+v5MeaOcAvk+S4vLkPMWVMrv+lxE0HjPRKv1FD8omnoxTjunLEZ1s1nkVVsqwL9K9+4LpEKRPA9tph6mqCLxdu+wRPirg00A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LM3fsZZ0/uuo59qlvPUa50NSJTv0VooGds4AFsSsRgs=;
 b=MX0jgPIxkYdi6jDyXBbhRJK24FnvtUHdlFn3xGuzcjEnWhZK96j8y9WtNowWfwlr7NSp1aXK5ffDwwdhewWq16tH5izyrj6sH+Zv5zjEtcFmGMaLgSaRfppnhdZYk7LMfQs4ISKOov+lmmx6zMsjGA7EauwYEUhb+SIvZ39Z9+M=
Received: from MWHPR1401CA0013.namprd14.prod.outlook.com
 (2603:10b6:301:4b::23) by SN6PR12MB2797.namprd12.prod.outlook.com
 (2603:10b6:805:6e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Mon, 18 May
 2020 17:17:27 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4b:cafe::45) by MWHPR1401CA0013.outlook.office365.com
 (2603:10b6:301:4b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend
 Transport; Mon, 18 May 2020 17:17:26 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Mon, 18 May 2020 17:17:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:25 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:25 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 18 May 2020 12:17:24 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH v3 10/14] ASoC: amd: add ACP PDM DMA driver pm ops
Date: Tue, 19 May 2020 01:17:00 +0800
Message-ID: <20200518171704.24999-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(1076003)(81166007)(5660300002)(356005)(316002)(6666004)(47076004)(478600001)(7696005)(36756003)(4326008)(8676002)(54906003)(110136005)(82310400002)(8936002)(26005)(186003)(336012)(2906002)(86362001)(70206006)(2616005)(70586007)(426003)(82740400003);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c7339de-355e-4705-7268-08d7fb4f5645
X-MS-TrafficTypeDiagnostic: SN6PR12MB2797:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2797E4ACABBBAEE620E860A097B80@SN6PR12MB2797.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: En+m53AdRBUxNk+RrJnyGMUmOY4m/6UOEidzbA2GNdPA3pzENx+6QXymVB3zhsVjFXM8D9w4nQr5cVk4mgluQsVrWYufIUr+w/Ty+5O5INA53dHkTK/7kSQ/9LgTTi5WhRvxnhvlqjClkve1JvtbuH5t0Ox7BDCwWltf61deXbj70obsBhGkDAhhIOGm3+9/o2xuoq7wyMSOinYPZIfy1W9z/D+VtkXQWpxjwyFeIumlch2wsYG9EvJ/qd572FuuiX+7syk9dWuO2Q0yZ6aV7gRgJnbJhzcPc03IutVf/7mfx+7lEbDNLra51w89n/QX4P3G/iQieeIOfXeyaQ9lSqOmT8EMDmHpXxbJ40XlHUGekD6KhGaqAx3R/ifZe8gBamOpgvfrJb06OL5jPtNGJegu+BK7n/P0M8HQDv77lrSNqSkBK6Q2D+I9mm1y4U0Os/qqW27oEsca6x2qEveNpoPR5QXRosEh2pJkFrr7HHmRXoZwdV8IQdfr/CLiFJJgNahjK4VXNI/nYZ1Y/4VasA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 17:17:26.2975 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7339de-355e-4705-7268-08d7fb4f5645
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2797
Cc: Alexander.Deucher@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

Add ACP PDM DMA driver pm ops.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 53 ++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index fd19b17f553e..942010021319 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/pm_runtime.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
@@ -453,19 +454,71 @@ static int acp_pdm_audio_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "ACP PDM IRQ request failed\n");
 		return -ENODEV;
 	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_allow(&pdev->dev);
 	return 0;
 }
 
 static int acp_pdm_audio_remove(struct platform_device *pdev)
 {
+	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
 
+static int acp_pdm_resume(struct device *dev)
+{
+	struct pdm_dev_data *adata;
+	struct snd_pcm_runtime *runtime;
+	struct pdm_stream_instance *rtd;
+	u32 period_bytes, buffer_len;
+
+	adata = dev_get_drvdata(dev);
+	if (adata->capture_stream && adata->capture_stream->runtime) {
+		runtime = adata->capture_stream->runtime;
+		rtd = runtime->private_data;
+		period_bytes = frames_to_bytes(runtime, runtime->period_size);
+		buffer_len = frames_to_bytes(runtime, runtime->buffer_size);
+		config_acp_dma(rtd, SNDRV_PCM_STREAM_CAPTURE);
+		init_pdm_ring_buffer(MEM_WINDOW_START, buffer_len, period_bytes,
+				     adata->acp_base);
+	}
+	enable_pdm_interrupts(adata->acp_base);
+	return 0;
+}
+
+static int acp_pdm_runtime_suspend(struct device *dev)
+{
+	struct pdm_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	disable_pdm_interrupts(adata->acp_base);
+
+	return 0;
+}
+
+static int acp_pdm_runtime_resume(struct device *dev)
+{
+	struct pdm_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	enable_pdm_interrupts(adata->acp_base);
+	return 0;
+}
+
+static const struct dev_pm_ops acp_pdm_pm_ops = {
+	.runtime_suspend = acp_pdm_runtime_suspend,
+	.runtime_resume = acp_pdm_runtime_resume,
+	.resume = acp_pdm_resume,
+};
+
 static struct platform_driver acp_pdm_dma_driver = {
 	.probe = acp_pdm_audio_probe,
 	.remove = acp_pdm_audio_remove,
 	.driver = {
 		.name = "acp_rn_pdm_dma",
+		.pm = &acp_pdm_pm_ops,
 	},
 };
 
-- 
2.26.2


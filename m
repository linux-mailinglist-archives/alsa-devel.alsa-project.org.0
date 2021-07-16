Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AAF3CB934
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 16:56:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3F5F16A8;
	Fri, 16 Jul 2021 16:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3F5F16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626447382;
	bh=F2UJmqBJtny5UKjAEVKHc250RaNxPkeqd/gRr8Aodcs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cdWJfE3Tf/bipthjW5TPLYwsIm7LT8Jhf8CCv6ZnVlSthUMf82UOSTjDtslzpyuJa
	 zkH4W53j6X7X0K8EPSqtykRk6yYJqfzhK9OYEWuXysG09crirzQ3SxO9LHQuASbO3g
	 yDIEjv4UoGfbsZY7ay9gJLdzikDXq7hLeBen9R9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F71CF80511;
	Fri, 16 Jul 2021 16:54:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DCDFF8025B; Fri, 16 Jul 2021 16:53:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6999AF8025B
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 16:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6999AF8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="yz8+Xhuj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ujct+pDvk7WvZKli7qGBRPblWR8QacucfGbXgbsn57jiHZyuyvaO5fQOyqgCaZ+mw2GGfXEtWVv0FqJHUqEen3Yh8Nhnv4J9n2NKUuLAFyinkRnhK6smzr2Xslv05oRZAcBMg/pv5VljnnBaLVfB+kCOnUvt0xeEibeioFM7L5TQVbAXRII6Z3Ms0lS9QRTGaRSDkidK1qa/wYHHNPbCv0Kdf0rvC6Plc4pJWSbGrvBVokhI/bdXbJNbeO6xCRhhZq/JGG8oMDKHnK0NchcyU4LeKnhz85e3lyYF2dxZx3B8tBAmokG1/Ph6sf6ZGCk4ZnKmnquDFv0TjD+huKqnJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYYbH0y9Kw+Z6hGU//5CNrQHQ1EkPPfykz9/FFjc7iQ=;
 b=jvTob18QsWncifS6djO7ov9gpCfs/BzcDy3oSLduIkkbUEXN5Vaocoiw9mSnEfqypP2x0SMYWbX0DC1jAD8Vb+3libFYAcxDgdV1T/yJ1fLC39yon3OOGw5+yj7yWSZWK53tHl8yKPPQQyZuHsLecdUPC5a1mCv5lbRmkVT2KbPnanL+TBkG6vv7SHEYe+nU67otuNq9zOA5VMBBpZ3MFLCNKsQdHPnYqi+1yIhyPK42awR8pZ3yi5jTn1mtSelgzbxOuievctp/C55zXk7vcoa62GgAgriZFpC5qji4nNIwAshVuNqP2wwL4bq5Lmn7++tYhuHfI4aIAHeV4kPLNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYYbH0y9Kw+Z6hGU//5CNrQHQ1EkPPfykz9/FFjc7iQ=;
 b=yz8+XhujmWX3SOhwmEBweoifvoBxVAQeuBi8R91Qnf0oceIwU4YJWvRDiJ8TcVrGPkBkU8AKaQT/+GzpiTqfARo1QLp1uTWDSx3Z/Tjexq4IypUXKx5Vu8588UsR89Q0jcqkOpTlsh0+svdNlPXHMVkjB2TuJFWy8vqtShx0hCc=
Received: from DM5PR15CA0041.namprd15.prod.outlook.com (2603:10b6:4:4b::27) by
 MWHPR12MB1550.namprd12.prod.outlook.com (2603:10b6:301:8::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21; Fri, 16 Jul 2021 14:53:46 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:4b:cafe::df) by DM5PR15CA0041.outlook.office365.com
 (2603:10b6:4:4b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23 via Frontend
 Transport; Fri, 16 Jul 2021 14:53:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 14:53:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 09:53:45 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 16 Jul 2021 09:53:37 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 11/12] ASoC: amd: add vangogh i2s dma driver pm ops
Date: Fri, 16 Jul 2021 20:38:08 +0530
Message-ID: <20210716150809.21450-12-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716150809.21450-1-vijendar.mukunda@amd.com>
References: <20210716150809.21450-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ca4dd42-9139-4677-6462-08d94869839f
X-MS-TrafficTypeDiagnostic: MWHPR12MB1550:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1550AD0C2B4128C98D3A64BF97119@MWHPR12MB1550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mBw+9EbR5Dc7UIFPMjf2jjwcWsj+X0LPverm7ix9Zetra3VnifPrPzjL/f02JZNxcqeKxLTg54P+HPZixmXxynE9/zW7md0BtbbeqEcow0pmUT1FMY837kS1di3AszLuEsAikb/FYSM5qvV6euhTppBlbp+O5YK+F8x5jFXnt12ovs3wxvRZ9px8BhG1g3yXV/PABpPWN/UtnEhkxiFZXdqisuBLNzwClZFygHxQlNolxi7ki1ElTd8ZL8vITlrP35FLMaQvHzYPv4axEKKyrf/NQkcRITGqwJZkOAY6imZzgH47Cea9L8gQ63vxVQB2EtOqXPXDjvWAb4+8JXDVs8DltpGkp5xBIUeXqJcXlj+hoZxYqP4RghyfFiZOC7qoYfHAZlxN+5//K507Z9t+N64WYMwgBL8HIl8iZC7xZTgcteZueg5x4Zk3rU8ySr0TGpo3JiuxA4HCNXvSGDsIEL5a4Dnde0rOx6dcp3Kc87a6xAYB70Gsv4H5o+b1Cebxhbpx1QHYthbsSFFCWxpaotQSXm/Cv1VjWx+tHonuhx8WPIE82FxR7Rdi9juvldJumyxGCStI04sDGVmocqS6V0RzbLTD4+XzMSlYtpeENov9Hm3Kr2qWBVdxKoVo8iKGjg2OyYasVA6ACmQDCBETsXBRXOlV201F8xrAUKS1M1nSvjfcA6XK5wxRVEspPdMZyNOinIqtPbUSdQV5Q1ZWXqgnTZ3nUcDXWSeD5SDVwRk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966006)(36840700001)(86362001)(36756003)(2616005)(82310400003)(426003)(81166007)(5660300002)(54906003)(1076003)(83380400001)(316002)(186003)(44832011)(2906002)(26005)(478600001)(110136005)(4326008)(82740400003)(8936002)(336012)(47076005)(7696005)(356005)(36860700001)(70206006)(6666004)(8676002)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 14:53:46.5653 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca4dd42-9139-4677-6462-08d94869839f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1550
Cc: Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com
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

Add Vangogh i2s dma driver pm ops

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
v1 ->v2: use PM Macros
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 90 +++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index a2bd53dc86b9..260b6ae0fb2f 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/pm_runtime.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -417,13 +418,102 @@ static int acp5x_audio_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "ACP5x I2S IRQ request failed\n");
 		return -ENODEV;
 	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_allow(&pdev->dev);
 	return 0;
 }
 
+static int acp5x_audio_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+	return 0;
+}
+
+static int acp5x_pcm_resume(struct device *dev)
+{
+	struct i2s_dev_data *adata;
+	u32 val, reg_val, frmt_val;
+
+	reg_val = 0;
+	frmt_val = 0;
+	adata = dev_get_drvdata(dev);
+
+	if (adata->play_stream && adata->play_stream->runtime) {
+		struct i2s_stream_instance *rtd =
+			adata->play_stream->runtime->private_data;
+		config_acp5x_dma(rtd, SNDRV_PCM_STREAM_PLAYBACK);
+		switch (rtd->i2s_instance) {
+		case I2S_HS_INSTANCE:
+			reg_val = ACP_HSTDM_ITER;
+			frmt_val = ACP_HSTDM_TXFRMT;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			reg_val = ACP_I2STDM_ITER;
+			frmt_val = ACP_I2STDM_TXFRMT;
+		}
+		acp_writel((rtd->xfer_resolution  << 3),
+			   rtd->acp5x_base + reg_val);
+	}
+
+	if (adata->capture_stream && adata->capture_stream->runtime) {
+		struct i2s_stream_instance *rtd =
+			adata->capture_stream->runtime->private_data;
+		config_acp5x_dma(rtd, SNDRV_PCM_STREAM_CAPTURE);
+		switch (rtd->i2s_instance) {
+		case I2S_HS_INSTANCE:
+			reg_val = ACP_HSTDM_IRER;
+			frmt_val = ACP_HSTDM_RXFRMT;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			reg_val = ACP_I2STDM_IRER;
+			frmt_val = ACP_I2STDM_RXFRMT;
+		}
+		acp_writel((rtd->xfer_resolution  << 3),
+			   rtd->acp5x_base + reg_val);
+	}
+	if (adata->tdm_mode == TDM_ENABLE) {
+		acp_writel(adata->tdm_fmt, adata->acp5x_base + frmt_val);
+		val = acp_readl(adata->acp5x_base + reg_val);
+		acp_writel(val | 0x2, adata->acp5x_base + reg_val);
+	}
+	acp_writel(1, adata->acp5x_base + ACP_EXTERNAL_INTR_ENB);
+	return 0;
+}
+
+static int acp5x_pcm_suspend(struct device *dev)
+{
+	struct i2s_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	acp_writel(0, adata->acp5x_base + ACP_EXTERNAL_INTR_ENB);
+	return 0;
+}
+
+static int acp5x_pcm_runtime_resume(struct device *dev)
+{
+	struct i2s_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	acp_writel(1, adata->acp5x_base + ACP_EXTERNAL_INTR_ENB);
+	return 0;
+}
+
+static const struct dev_pm_ops acp5x_pm_ops = {
+	SET_RUNTIME_PM_OPS(acp5x_pcm_suspend,
+			   acp5x_pcm_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(acp5x_pcm_suspend, acp5x_pcm_resume)
+};
+
 static struct platform_driver acp5x_dma_driver = {
 	.probe = acp5x_audio_probe,
+	.remove = acp5x_audio_remove,
 	.driver = {
 		.name = "acp5x_i2s_dma",
+		.pm = &acp5x_pm_ops,
 	},
 };
 
-- 
2.17.1


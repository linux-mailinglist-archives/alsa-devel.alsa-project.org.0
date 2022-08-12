Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4651E5910A2
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Aug 2022 14:13:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C99BAAE8;
	Fri, 12 Aug 2022 14:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C99BAAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660306435;
	bh=qFBCfnSmSkxkbKeSVvzFSt+h1YAGJkSBlcmUSAj5X1U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RPQ9cDv40/CLOyNyi3p7puFZKu5fl5ksrV9TH3sSEGiL1T0d62S2g3kPedHhLxJ2i
	 wHiBF6xzf7ZQzW1wR5nung03O0xRmBp2V9pti10bKNgeXhYlKnGeFHBTuHIWlqovhW
	 sPszWynDz5qC7yuZtAm6QLpkBRj32Zydept0S3mQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30F80F80517;
	Fri, 12 Aug 2022 14:12:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C48BF80152; Fri, 12 Aug 2022 14:12:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDC63F80152
 for <alsa-devel@alsa-project.org>; Fri, 12 Aug 2022 14:10:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDC63F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="eA56KwdN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZoG11EYhlHv08ujq51qG43Wo3MpNZs8pBJuj2opvLufIIy0/EzNWhi06w8kzIqdGkS7jDdwpp9Ucq9KxDWXPn4akOI/8Wzgb0DiD8BRBhWiFZGoTzSxgiI4y2Qow8jKYO8Gpxv61E23+jQ81hc4w1s8Jrde0jDZJW7Maz4l0Q39kQthOPq1kqplzdD9AQvRVNoihIUBpXU6sZEtEn/nt9Z65Z9VrxU6OhwYMV332wUFe+SN4jmlF+wZfDhhS7GFGCVQuChAK7hKoUJF9T8G7UcjmB2PAo3v1P144aJaT2bDqaFZjU0WUDZ3WObxlRgoa8jC6V3XqQxfd38iTa+8qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbCKi3GglQJAJd2XTXoHLZHgpJ+9x68hNT1rRxm2ack=;
 b=Poivt4fvbL10hVPtrOj3TH8lRT6KwEbKngjaptI7HUiu6wCB6VG1CKZxYQS3kSJmPUezuwBzQR9aw9fFgu8o8Itr8gkNSeHS45t/2L1cbH/bnfs0/azn/hnLP2EecZwOZNWNDAWrh2F09THzwFlS1k7lhD44XnsB3OFzGggJ49C27TgSUMZ0GzZwuoeH4sNcxNQVJTGtFXr1zvpjMXjSphG++tdg1TLzduz4T65IEN6xMb6O8EdEeSEeUvZcp1bv4r5X6J2z3adAuWpvQ5arYq3NGQ0S2ZvItayI3lgA3treufexJRON77+dLfNN2VcnWZBRyxNGNYvFNxNtIX/ocw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbCKi3GglQJAJd2XTXoHLZHgpJ+9x68hNT1rRxm2ack=;
 b=eA56KwdNYVJ6RjDFioPgDbViQpiaJxwQpPckWd9+32c2pAILaLQyf1ABtnT19bjgh+duEDmxt6qNGpqtFWEu2H14UBloCtkzykexUou3Mek4KdEJEPBn0gj8iRa8/GXwA3d0MfQKQ4hcFlBg/npKb4asHoee2BbtDKdhtYDJ3A8=
Received: from DS7PR05CA0092.namprd05.prod.outlook.com (2603:10b6:8:56::10) by
 DM5PR1201MB0060.namprd12.prod.outlook.com (2603:10b6:4:51::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.15; Fri, 12 Aug 2022 12:10:42 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::31) by DS7PR05CA0092.outlook.office365.com
 (2603:10b6:8:56::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.8 via Frontend
 Transport; Fri, 12 Aug 2022 12:10:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5525.11 via Frontend Transport; Fri, 12 Aug 2022 12:10:42 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 12 Aug
 2022 07:10:09 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 12 Aug
 2022 05:09:56 -0700
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 12 Aug 2022 07:09:52 -0500
From: Syed Saba kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 05/13] ASoC: amd: add acp6.2 pdm platform driver
Date: Fri, 12 Aug 2022 17:37:23 +0530
Message-ID: <20220812120731.788052-6-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812120731.788052-1-Syed.SabaKareem@amd.com>
References: <20220812120731.788052-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6db49eb-3f12-4ebd-dd63-08da7c5badef
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0060:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BttHAK0faGhTHPlLECq0J2OOHZxy++pxtxcSKxFm5I/czQhn6Sw2dxt3xZccLpmQiZNVoiF/aLS+Fntdp+8JLtjHOFnbR/9MkVxkrM8fOEs1YPE3e6gvF/MhZIixSe6G/BnRpD7cSlvjiu8kvG5ptuosk2hU2eKuzwLS9fSdZopLPET0DKmVk38syj49yfTPPg9m+RtQbsbDHK0VM+DklDzD65htVinGdvyFSdl16NftzKQkBa0kUj20ONQd89EqyLDa8WcLIcUPrHw8pc+VuqTEkapewZRWQURgnUlR9W8EOSrxAdCxWA13U25Sa8/tXmZbaKu97AFpZ0Rj+qCFpln8hQ6loX+053V0nzGphEgSxufv/ZqtXlNaYKkdUc2xkOyt+0XFcxK34jj2Qn2KPkkd9X91rrY2weFhtwN2o+NU/0TIsQUKZlsB2caEuAMsZYa0/o42idkkj1tk4KNGzTrpguIZ/Ghsiye4EqvwfZL/JcqwG/55GTz1q9Og1N5M1d6kdCQI/BJr3ZS0uxK+n2zaDsL+WMv99sVfTCL+F4Ca+ra2cxb80nZMAssJ1LXmxgZyNp8lWMAaIHE0IYwTnK58PXYoWK94wtUPd+mGlQQR3Kx9hhRoYPksv6DzIQaLVuo5frCd8LSG+BsOTzv07W0tmqlldDGT8icolx8VsedGqc256QTfNR26UN4GkE3Tw9AIKiLBOokxuWWUJ+yln6PJZVFKcgBjVBL3GOrH/WPaZBA17PXo3ivQWtdyQVSJ2DA45n+KkIpfog1vhR7sECXn8roeukPxiRV4Vq7/hFDLLjiLpMSLk1tre/ISMI+AcKD3GIC35W0qUTtuo5S0yw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(396003)(346002)(376002)(46966006)(40470700004)(36840700001)(82740400003)(4326008)(70586007)(70206006)(8676002)(8936002)(478600001)(5660300002)(356005)(81166007)(316002)(2616005)(54906003)(110136005)(336012)(186003)(36860700001)(1076003)(47076005)(40460700003)(6666004)(426003)(41300700001)(7696005)(26005)(40480700001)(36756003)(86362001)(82310400005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 12:10:42.7299 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6db49eb-3f12-4ebd-dd63-08da7c5badef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0060
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, mario.limonciello@amd.com,
 Vijendar.Mukunda@amd.com, Syed Saba kareem <Syed.SabaKareem@amd.com>
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

PDM platform driver binds to the platform device created by
ACP6.2 PCI device. PDM driver registers ALSA DMA and CPU DAI
components with ASoC framework.

Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 sound/soc/amd/ps/acp62.h      |  5 +++
 sound/soc/amd/ps/ps-pdm-dma.c | 82 +++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 sound/soc/amd/ps/ps-pdm-dma.c

diff --git a/sound/soc/amd/ps/acp62.h b/sound/soc/amd/ps/acp62.h
index ab56e1f8c31b..7636bfeb8a8a 100644
--- a/sound/soc/amd/ps/acp62.h
+++ b/sound/soc/amd/ps/acp62.h
@@ -45,6 +45,11 @@ enum acp_config {
 	ACP_CONFIG_15,
 };
 
+struct pdm_dev_data {
+	void __iomem *acp62_base;
+	struct snd_pcm_substream *capture_stream;
+};
+
 static inline u32 acp62_readl(void __iomem *base_addr)
 {
 	return readl(base_addr - ACP62_PHY_BASE_ADDRESS);
diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
new file mode 100644
index 000000000000..bca2ac3e81f5
--- /dev/null
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * AMD ALSA SoC Pink Sardine PDM Driver
+ *
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "acp62.h"
+
+#define DRV_NAME "acp_ps_pdm_dma"
+
+static struct snd_soc_dai_driver acp62_pdm_dai_driver = {
+	.name = "acp_ps_pdm_dma.0",
+	.capture = {
+		.rates = SNDRV_PCM_RATE_48000,
+		.formats = SNDRV_PCM_FMTBIT_S32_LE,
+		.channels_min = 2,
+		.channels_max = 2,
+		.rate_min = 48000,
+		.rate_max = 48000,
+	},
+};
+
+static const struct snd_soc_component_driver acp62_pdm_component = {
+	.name		= DRV_NAME,
+};
+
+static int acp62_pdm_audio_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct pdm_dev_data *adata;
+	int status;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
+		return -ENODEV;
+	}
+
+	adata = devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
+	if (!adata)
+		return -ENOMEM;
+
+	adata->acp62_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!adata->acp62_base)
+		return -ENOMEM;
+
+	adata->capture_stream = NULL;
+
+	dev_set_drvdata(&pdev->dev, adata);
+	status = devm_snd_soc_register_component(&pdev->dev,
+						 &acp62_pdm_component,
+						 &acp62_pdm_dai_driver, 1);
+	if (status) {
+		dev_err(&pdev->dev, "Fail to register acp pdm dai\n");
+
+		return -ENODEV;
+	}
+	return 0;
+}
+
+static struct platform_driver acp62_pdm_dma_driver = {
+	.probe = acp62_pdm_audio_probe,
+	.driver = {
+		.name = "acp_ps_pdm_dma",
+	},
+};
+
+module_platform_driver(acp62_pdm_dma_driver);
+
+MODULE_AUTHOR("Syed.SabaKareem@amd.com");
+MODULE_DESCRIPTION("AMD PHEONIX PDM Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.25.1


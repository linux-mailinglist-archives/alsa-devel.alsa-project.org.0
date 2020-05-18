Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 113111D7FFB
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:22:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B37D7173E;
	Mon, 18 May 2020 19:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B37D7173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589822525;
	bh=w/K6V3pkoVhc5lXWSxhg5reCKxXMnUHDAnZiVNVWuwY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rCYft7/vTw5q1C8YUMz+7bvfHoydk6Qf/45HMZwkHYRYyohfh0WP2fDnKN8uTmaXR
	 OFPsa7MZN4L4IX2SfHAPOn7WnAkq3c8EWuWmcJmuJrfOc0kSESe2TIlf57PI2gHMLb
	 hsStp4D/c/D4HKMaDYB6PTTar/NoC43cnbWPi3Vw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0738F8027D;
	Mon, 18 May 2020 19:17:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14E44F802C4; Mon, 18 May 2020 19:17:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9673F8027D
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9673F8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="bNgsRdC7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JK/KKCGKFz+Hqh9CUJEwJCbL1ca5ERLV+jv1Rn1VdRBN9YX0atg3IQc6WQzHDEfKfLpjW0zC+1oTuxXj1CgGLXJR6wbFer6XU3sSiwyVL0NYM+QVZCmLWDBppUfBuYBfiF3cykYHtuowYZDks2q+cbiQuxOlWDaAwlx1w24vB9QVc/yRBiumti5LBBZtcTjN9cMQlHkTTlbklKEcARzx2ACM2NkR6GHn/SLCnbmSXPqceHj3tIMSaJYU7jb5OCPphGEsiCqDv1I42QqA8V1kIlgFr81dFgOKpbDLBjj1ldI+uCwLwrE7GvreI9fHw+0AumyjzE3dLmBQ8HULlcNFWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxEIrQmz+0eX/Xx32A7alTbq9ZbZXvk/Yoruh+fIU7s=;
 b=ViVaqKvow6Bs1aeOKth+wihtmc5WbBQMpz3Gh2CDiof6vs1k2Y5PXCg9p263vfqiZhhveXl2HSB63ikBOLi+zMy370OxfzjRbN48GC8+7DIi4llHYSO/k64jsZp5CIbOAeyOpFcaPTvEHg9xDmbMaWoyXVjmHS7y5Ha+yuD1M5Y+8EQagQHDQOZq0uYksfhLo1gqv63nnLcNQgWM+vpUqFvfI9JkR+VmSg1/euKJHlvAtA4MtIc+Jr+7jgBUHcPioTt9V4DhO12B23UbAUQ+DaNuU/rk4wxzYQPquOWOD9CHVCV8HJ5Z9gPIoX9h9HbYpoZF+eQgrFcqmUJ+S4jGIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxEIrQmz+0eX/Xx32A7alTbq9ZbZXvk/Yoruh+fIU7s=;
 b=bNgsRdC7A/uWX31mn6OLfmPBgHHZ5IFvJGNLghFj9GgZFwRlo2ooccR7yi+w5z15+gQgwYGOSR89gsCkpvffYUyVPSlXJQyVRo1xv7U3SYi5pw2nCZnQZeSmQdJ+NmxxvoBxpEuDOLXepLhmrRfWUW4dpDmvgLltd9zuTnjYnhE=
Received: from DM5PR10CA0007.namprd10.prod.outlook.com (2603:10b6:4:2::17) by
 CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.20; Mon, 18 May 2020 17:17:18 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:2:cafe::da) by DM5PR10CA0007.outlook.office365.com
 (2603:10b6:4:2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Mon, 18 May 2020 17:17:18 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Mon, 18 May 2020 17:17:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:16 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:16 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 18 May 2020 12:17:15 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH v3 05/14] ASoC: amd: add ACP3x PDM platform driver
Date: Tue, 19 May 2020 01:16:55 +0800
Message-ID: <20200518171704.24999-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966005)(36756003)(5660300002)(82740400003)(6666004)(4326008)(86362001)(356005)(81166007)(82310400002)(1076003)(186003)(7696005)(54906003)(110136005)(316002)(8936002)(26005)(8676002)(47076004)(2616005)(2906002)(336012)(478600001)(70586007)(70206006)(426003)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b959cd63-ccdf-4d54-2db0-08d7fb4f50d9
X-MS-TrafficTypeDiagnostic: CH2PR12MB4071:
X-Microsoft-Antispam-PRVS: <CH2PR12MB407117E435E8E3809193746D97B80@CH2PR12MB4071.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:42;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JjnBe2jHP9pFfU4pEBceVI7vaSVn/5swmGY8xOF8B9r2DlrQ5FE3MBH67CDCQzsav7/7PNY2awUwv6e7b7ImQwTNhkv8K5mSEgStBaUvtllYXpS6JQi2d+uhGwW+ZlyDYQ3x9Q1SY3RjJu/9k38omVKwmOOQ01IJzfEOQ2DNfNeFoeFg5ojri5bIWyhWHZFZn8S5VNgS+1tN+vLBoD+h/k7OBAJMGX5amAjGtrVwXY0fX85134n39TeW5dhEiMdwyCiIUeSf3n1ws7OcBUaQATVQj6l1nAKZkFeyRzuf0cqGHVU4wBq8cAOyD8AaYIvVdLBWAEMQVfusy32krCdLCExPVoNX49SwpH/ErGGuzHSj18aBR87RjoytmY3xEMEDOD2l1F7g7dXTpK1o52+QiNoqv7DoOMm4XRTdqHKmiA0S7mh/kNQxlowgkYPddY74lVmSrs9emGrnX9my5ramSgLAIq3Rw4U9XcLqm8FGsmP1EdCXD1WE+3kjkjWNHrNxtnf/kgYYC7q5GdvIWRg/0zzAWJqqEfBwj7wrQ9p1sXo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 17:17:17.2703 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b959cd63-ccdf-4d54-2db0-08d7fb4f50d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
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

PDM platform driver binds to the platform device created by
ACP3x PCI device. PDM driver registers ALSA DMA and CPU DAI
components with ASoC framework.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 95 ++++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h      |  5 ++
 2 files changed, 100 insertions(+)
 create mode 100644 sound/soc/amd/renoir/acp3x-pdm-dma.c

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
new file mode 100644
index 000000000000..1dda8cf2edd2
--- /dev/null
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// AMD ALSA SoC PDM Driver
+//
+//Copyright 2020 Advanced Micro Devices, Inc.
+
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "rn_acp3x.h"
+
+#define DRV_NAME "acp_rn_pdm_dma"
+
+static struct snd_soc_dai_driver acp_pdm_dai_driver = {
+	.capture = {
+		.rates = SNDRV_PCM_RATE_48000,
+		.formats = SNDRV_PCM_FMTBIT_S24_LE |
+			   SNDRV_PCM_FMTBIT_S32_LE,
+		.channels_min = 2,
+		.channels_max = 2,
+		.rate_min = 48000,
+		.rate_max = 48000,
+	},
+};
+
+static const struct snd_soc_component_driver acp_pdm_component = {
+	.name		= DRV_NAME,
+};
+
+static int acp_pdm_audio_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct pdm_dev_data *adata;
+	unsigned int irqflags;
+	int status;
+
+	if (!pdev->dev.platform_data) {
+		dev_err(&pdev->dev, "platform_data not retrieved\n");
+		return -ENODEV;
+	}
+	irqflags = *((unsigned int *)(pdev->dev.platform_data));
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
+	adata->acp_base = devm_ioremap(&pdev->dev, res->start,
+				       resource_size(res));
+	if (!adata->acp_base)
+		return -ENOMEM;
+
+	adata->capture_stream = NULL;
+
+	dev_set_drvdata(&pdev->dev, adata);
+	status = devm_snd_soc_register_component(&pdev->dev,
+						 &acp_pdm_component,
+						 &acp_pdm_dai_driver, 1);
+	if (status) {
+		dev_err(&pdev->dev, "Fail to register acp pdm dai\n");
+
+		return -ENODEV;
+	}
+	return 0;
+}
+
+static int acp_pdm_audio_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver acp_pdm_dma_driver = {
+	.probe = acp_pdm_audio_probe,
+	.remove = acp_pdm_audio_remove,
+	.driver = {
+		.name = "acp_rn_pdm_dma",
+	},
+};
+
+module_platform_driver(acp_pdm_dma_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("AMD ACP3x Renior PDM Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index 5e4fd99397d5..0b450882c6c4 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -29,6 +29,11 @@
 #define ACP_ERROR_MASK 0x20000000
 #define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
 
+struct pdm_dev_data {
+	void __iomem *acp_base;
+	struct snd_pcm_substream *capture_stream;
+};
+
 static inline u32 rn_readl(void __iomem *base_addr)
 {
 	return readl(base_addr - ACP_PHY_BASE_ADDRESS);
-- 
2.26.2


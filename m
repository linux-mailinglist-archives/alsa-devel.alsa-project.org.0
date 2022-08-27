Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2525A3909
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Aug 2022 19:02:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9033284D;
	Sat, 27 Aug 2022 19:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9033284D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661619723;
	bh=I0U3VKfdhzlV9P44l6ZU9ONGa5u5O8n6gDNBW66OxMM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BslAuzwOFnDyUBUOFDpF2gVXbJC0Hilv88nrf700LLQtwj9qyWBoZ70p+2yfhVHTE
	 kPmkh8SwViey/ovOOKlb38HjE4iNfVGacC6NhVMbt3Mmzna/uug1by8cOq1jvd8s9G
	 L0aNJk/fhr0wVF4JWYtonw6Y4OBzwNGBwyzl+TvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E5C2F80558;
	Sat, 27 Aug 2022 19:00:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F3D0F80557; Sat, 27 Aug 2022 19:00:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ED3FF80552
 for <alsa-devel@alsa-project.org>; Sat, 27 Aug 2022 19:00:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ED3FF80552
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="2VqeZxh/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PO03wBOMjEg3ZgB9nhxgB/rD7blTJiCSRMu+HJEVPh7gkdg0r2boCDW3jEJSzUI+UHA7R4jOJT1oPh5cxqF1iWuykaciinRJB9l5fI8I6QAQsYzoOcAkGifwTlXbu+1G5VkzOW5oKcviYEACaGtS8z/okEdMgHtmzZgTg4FyMRWe0TDtv4Hd8r3GQbd2KAGbLMnPruU7XPPR76/zdExIsncHIeYV8BREf1poy8n1BKXkRqCX2/PPn007P6xoo4iUVoCthnJ/T2yZvGe/jZX7mrdxG5AUseWFu6BnbW0zw7MAlAtVJ6th+HqX3bkyi5jtARJc5rlQ+13FSOLOyA/D4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8Om7QRCObmIZziTvemxwt8Fm8tPDnab1fOTzQtloTI=;
 b=d+1odwuc79TLROp4boqAN70vOY5IO2gy1wiUrnq900mTpmbHvXMo3tlCK6vZmpTv+S3vt8sGzINlKpVdSu12/6SGW7y13mhp/4nUQ3R5dECGuKHUr0SiNkOhZojymbWQKNyL9ouz+uAzVBDH7Ijtqu4XfT4wDO7hsC1RgBnrfcgeW/p7mDghTBBJLw920MP5/gn0iV5ppMIvTgzomLCVTY8aCiOLTWjCazzU4ms08Witd9lixPbZdSPVjF+gBZCIi4v3NNHG/DT89QbWAL3YLT0+uX87i/qwJ6mZGAmOPKfyOokn61r/iRyU03vceFb5Y81XL5aGxPhnR+bg4iiUlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com;
 dmarc=bestguesspass action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8Om7QRCObmIZziTvemxwt8Fm8tPDnab1fOTzQtloTI=;
 b=2VqeZxh/nhlkADFJmmd8Fnyu+sdewr8PqbZwAyqI22TPwrBz6v91XPdi8y1YkM9NH3oSS8pRRVegBnnufZLJsVIpI6FbFZ1CMrVY77vx6vOuU2GoG2BdqzTPD+lriFFzyuro7prJTjg/7kPwSCiG5U3B0hXPifsBh4Ok+RA3v78=
Received: from BN9PR03CA0034.namprd03.prod.outlook.com (2603:10b6:408:fb::9)
 by MW4PR12MB6898.namprd12.prod.outlook.com (2603:10b6:303:207::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sat, 27 Aug
 2022 16:59:58 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fb:cafe::e4) by BN9PR03CA0034.outlook.office365.com
 (2603:10b6:408:fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Sat, 27 Aug 2022 16:59:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5566.15 via Frontend Transport; Sat, 27 Aug 2022 16:59:57 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 27 Aug
 2022 11:59:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 27 Aug
 2022 09:59:56 -0700
Received: from amd-B450M-DS3H.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 27 Aug 2022 11:59:52 -0500
From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v2 05/13] ASoC: amd: add acp6.2 pdm platform driver
Date: Sat, 27 Aug 2022 22:26:49 +0530
Message-ID: <20220827165657.2343818-6-Syed.SabaKareem@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220827165657.2343818-1-Syed.SabaKareem@amd.com>
References: <20220827165657.2343818-1-Syed.SabaKareem@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b392923-3195-4aa0-6ee2-08da884d9216
X-MS-TrafficTypeDiagnostic: MW4PR12MB6898:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4IHFANGgBRRZt3oMI+vpT7N8dRbnmLJxRlXdhdlh4kFPtYbZdgIY3WfkuQcUAunphQgepKJicpqgpxgmuIbuHXT96ANYOlvxdau7AXe0BPtv3oQ7SlnIlBZPZYIuJ0Hf5ey7A6K0UZfO8qwZn0GEHNkF3FngnxNFhnHIW64dHLWaXiM/MMeT0GYbmLc76cUhTvq+ZfyNr/S8vqBdoo/jyT8o83N2ywtOH3kgZ4kQ8A4ePTdofdGGL+1JfdTyfOsz52rUFO5CQG1ClUSdjXl4ICHPdUKWfeh7h2A2qeEDGgC90xfCldD9wKHSRg7m6QelD5Et3VH3YkjEWGPNHAlW4ymid9wYiboOhSROQjK3JIcCul0fU0/wEL2Lsolgzg9EcJaxR5jCPbrxru2yyUJNCtuAVi0Y3l+Hk2JuqKJgWtktxEmS67Bui5vPCfwParA/9THTMqlxekxonw5O+XM8TkIVv3LJYOxukQCpQ89nktlsy2ToLHIxDp8oafDFLekBsgzoILsnIAYy+DYnyCWcNnTBSA183I0H1KZd6Ta1k1ITya1byBumaoQRrb999hIT6S5ZcmTXleWaYdh5WIlmBWK8YMPsWOSdpoj2LCFmdPQxdjRdREEZ1hoxRV08Bh4eC8VoXlN6wxs+Re6fzjvQi57/kK23Nyc9t8pIpP3Nq4LJZymNZAr4YnM3mgeMhfCKqvZf18eHNsg15XRsdT/d5axhjmcJ8oKW/I2fjlrqhXa7U1zvs/Dn5dD/hdmMH37HlYwFlFyBSp2Z1JnUzMOcryGxqEon6Q2CScp6xV32qAA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(376002)(136003)(396003)(36840700001)(40470700004)(46966006)(478600001)(41300700001)(186003)(2906002)(47076005)(336012)(426003)(2616005)(1076003)(8676002)(4326008)(82310400005)(6666004)(7696005)(26005)(40460700003)(40480700001)(86362001)(36756003)(81166007)(356005)(82740400003)(36860700001)(110136005)(5660300002)(54906003)(70206006)(70586007)(8936002)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2022 16:59:57.0524 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b392923-3195-4aa0-6ee2-08da884d9216
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6898
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, mario.limonciello@amd.com,
 Vijendar.Mukunda@amd.com, alexander.deucher@amd.com,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
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
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp62.h      |  5 +++
 sound/soc/amd/ps/ps-pdm-dma.c | 82 +++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 sound/soc/amd/ps/ps-pdm-dma.c

diff --git a/sound/soc/amd/ps/acp62.h b/sound/soc/amd/ps/acp62.h
index 79ad1bdb5b38..9026df7ab169 100644
--- a/sound/soc/amd/ps/acp62.h
+++ b/sound/soc/amd/ps/acp62.h
@@ -44,6 +44,11 @@ enum acp_config {
 	ACP_CONFIG_15,
 };
 
+struct pdm_dev_data {
+	void __iomem *acp62_base;
+	struct snd_pcm_substream *capture_stream;
+};
+
 static inline u32 acp62_readl(void __iomem *base_addr)
 {
 	return readl(base_addr);
diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
new file mode 100644
index 000000000000..964686b46097
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
+MODULE_DESCRIPTION("AMD PINK SARDINE PDM Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.25.1


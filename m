Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E488C42865D
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 07:41:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67FE2168F;
	Mon, 11 Oct 2021 07:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67FE2168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633930866;
	bh=y4UkV6P3OCYyZgyzVfSQmzvM/17hzdVC0OwqjvF2QJo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jNJF7I8uBVCo7q74hvqyBxeu+dbHGqKuUemxsoinPzdUNPBvIwgRQNZ1cnXVy8rVB
	 JmVDlEjL/L54a4aOB/7V1tqducD7P+E2I/mkWkQX7tzYEQBZdtYmyIolvLpiognHem
	 CN4JMx5pfcI2/tD/0gAyz85L+ue+zEWM2wzr1wEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74694F80423;
	Mon, 11 Oct 2021 07:39:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5195DF804FE; Mon, 11 Oct 2021 07:39:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC291F804E5
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 07:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC291F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="sINpf8os"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7upO487lgulz7wbT8P3NMAwxNAiLWwVBXTXP1bR9O04/PFJBJJ5sXMjSo9quWo7QOPtaopKCiHba1YzCQdsKeh/JonrkzCSASIT2me18KTNYgGqm0t6JUaUEN6yX6jZmYZkSUHepF7kWZ/vR3TLgblTAtjipYYPDNTSpGtWOgs1XtxSKQCAHRfpblpX22xHerT+N8sixlHhW8FkcKEi7akLYPFTj9wM5LsQ6bdrYUeU0UIN0dLFhhNvtr32YKAaQ7yToVJ/lP7UT2SqQQlBfBOapDJHBcvCPsdINVoA7jRuRcYl1HCubw4HUfKj46ZLag7q/4KAwtFrbkv/QEUl6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PD7AmQRaOH7b12a1/4ruSuM2VuXVXIKtTO126TURZDI=;
 b=exRpXUW9D+gK7ticnpuzcCxvdxwZuFpY5mM6rNJaFs+UNg7gKeFR6v3Pod52Dx3l2qmWggiTbs5IyrW79I8pe4JDc9eALw8znt5b0hBgXC2iLkOx7/678XE2uI7LYZRJz0IzvSr+2j+nwS1KWTRXKFu7vIEw2LkRC9g2jvlhzd5jtYwblngPZRJ+/aYFZu6vfp6kvyn/ZDImSQ8xNTK5hBXElv+GrrCdR0kVC2efkZKdAmz6RKKfan585ZjERqRPueciDfnuFyRBEJ4rqibmM1tsK92UfbDQeTOGvfKi9f55u57b4Vibdlu4oA/SdMA3JpzHIl1Bot976XvRm0Lkxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PD7AmQRaOH7b12a1/4ruSuM2VuXVXIKtTO126TURZDI=;
 b=sINpf8oswO5FcnIY4jKhf2OXpgfXeXeK+Cf4KvLc7oSTqKDwWiFaEboqNcwYHCKzcBQskPyvMZpqthjDEMdxA7eCQhTiMZh2nMP1j/384uUPLjEDahJgOHg5ERXi2TCQxaDSWICgiD0OuTpzyggXNgKM3jkR5g8Z3uuCzjJGpJI=
Received: from MW4PR04CA0255.namprd04.prod.outlook.com (2603:10b6:303:88::20)
 by BN6PR12MB1458.namprd12.prod.outlook.com (2603:10b6:405:d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Mon, 11 Oct
 2021 05:39:05 +0000
Received: from CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::92) by MW4PR04CA0255.outlook.office365.com
 (2603:10b6:303:88::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 05:39:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT041.mail.protection.outlook.com (10.13.174.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 05:39:04 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 00:39:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Sun, 10 Oct
 2021 22:39:00 -0700
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Mon, 11 Oct 2021 00:38:56 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 05/13] ASoC: amd: add acp6x pdm platform driver
Date: Mon, 11 Oct 2021 11:26:13 +0530
Message-ID: <20211011055621.13240-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
References: <20211011055621.13240-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be4c2996-d801-4dcc-ccc4-08d98c79700f
X-MS-TrafficTypeDiagnostic: BN6PR12MB1458:
X-Microsoft-Antispam-PRVS: <BN6PR12MB14582B0F84DE6FF3E63DC07697B59@BN6PR12MB1458.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:38;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XKQsoEvImZdiGKoJ66ZoE/ns6RGy7mFtX351AYC1FckGauQY6T5pFnJeWL45ojFoxnGHECNGeNQupqO3Tf4n3SM21B/LisZu1X4hGg4o2taiSBb2vj2yN89wnaU6je1x/v0Iznhuho2gAZ/nfhFsvOPgtHPgHWasgGM8E8bjYRZCQm3OA9vuFTz/2shGbm60a2bbS1TRXmudgn5kVs3WT7gT8v4TqrQcNoCk90yt8IgMXHyctS2yR4ps61gSpDDybvnnhH5bz8ml+gfoLKcb+2uKH7vUEli6yamjIyplIUH2JduC4OEScuxqaZXtZjS7NPfTrRY5al0dY+a4W8DcDhaoM3wD/jQ+1SGJvdqyRj0XBwK/84o/e09cwJAzR7sSYYKZIBDCogg5mRNJLGHhhiAfHNTtOXJiw1FNEWz0ZFchoI1cyX6fOtgKDs3SLhtFDMbDA93AsbfpjeLH25BF57hrZFObU1PuzwKf26H1TZeb2k2b8CaCKwyzAVd4wHsWK42VObF4SREJ4CdLVTHKdqj3zWvOy2rTxwv6biMz8v6l/cPRmgyYBYtiXJShXonORmkCsIgtkFh4etcnM0ol0mfz6x5YiqpHWwpk4ZlmFH267MaoKgRMLw+dQ5mo4YN83ljwE2Dz6c4QEekfMPg8sHUjdizpl6nL7N+zqo5GGrbvEYJDoHOd1+xcjs91H2P6emlGutAqfnoo1uzOgCmKPoC/szDC6rcu9LHtavL1rAx037EZIByFkvHIxSshJBDjzbCYbaRtfLZ6d+9grbSXtA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(336012)(8676002)(82310400003)(81166007)(6666004)(5660300002)(186003)(316002)(36860700001)(508600001)(86362001)(426003)(110136005)(70206006)(36756003)(2906002)(70586007)(26005)(2616005)(356005)(47076005)(1076003)(4326008)(54906003)(8936002)(7696005)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:39:04.7111 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be4c2996-d801-4dcc-ccc4-08d98c79700f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1458
Cc: Sunil-kumar.Dommati@amd.com, Richard.Gong@amd.com,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mario.Limonciello@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 open list <linux-kernel@vger.kernel.org>
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
ACP6x PCI device. PDM driver registers ALSA DMA and CPU DAI
components with ASoC framework.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/yc/acp6x-pdm-dma.c | 80 ++++++++++++++++++++++++++++++++
 sound/soc/amd/yc/acp6x.h         |  5 ++
 2 files changed, 85 insertions(+)
 create mode 100644 sound/soc/amd/yc/acp6x-pdm-dma.c

diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
new file mode 100644
index 000000000000..e1a25268bc5c
--- /dev/null
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// AMD ALSA SoC Yellow Carp PDM Driver
+//
+//Copyright 2021 Advanced Micro Devices, Inc.
+
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "acp6x.h"
+
+#define DRV_NAME "acp_yc_pdm_dma"
+
+static struct snd_soc_dai_driver acp6x_pdm_dai_driver = {
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
+static const struct snd_soc_component_driver acp6x_pdm_component = {
+	.name		= DRV_NAME,
+};
+
+static int acp6x_pdm_audio_probe(struct platform_device *pdev)
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
+	adata->acp6x_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!adata->acp6x_base)
+		return -ENOMEM;
+
+	adata->capture_stream = NULL;
+
+	dev_set_drvdata(&pdev->dev, adata);
+	status = devm_snd_soc_register_component(&pdev->dev,
+						 &acp6x_pdm_component,
+						 &acp6x_pdm_dai_driver, 1);
+	if (status) {
+		dev_err(&pdev->dev, "Fail to register acp pdm dai\n");
+
+		return -ENODEV;
+	}
+	return 0;
+}
+
+static struct platform_driver acp6x_pdm_dma_driver = {
+	.probe = acp6x_pdm_audio_probe,
+	.driver = {
+		.name = "acp_yc_pdm_dma",
+	},
+};
+
+module_platform_driver(acp6x_pdm_dma_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("AMD ACP6x YC PDM Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/amd/yc/acp6x.h b/sound/soc/amd/yc/acp6x.h
index 63bdea3188ea..d6b2c70ce9c8 100644
--- a/sound/soc/amd/yc/acp6x.h
+++ b/sound/soc/amd/yc/acp6x.h
@@ -45,6 +45,11 @@ enum acp_config {
 	ACP_CONFIG_15,
 };
 
+struct pdm_dev_data {
+	void __iomem *acp6x_base;
+	struct snd_pcm_substream *capture_stream;
+};
+
 static inline u32 acp6x_readl(void __iomem *base_addr)
 {
 	return readl(base_addr - ACP6x_PHY_BASE_ADDRESS);
-- 
2.25.1


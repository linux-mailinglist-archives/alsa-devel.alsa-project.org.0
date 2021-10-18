Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7B8431731
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 13:24:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A7B2190B;
	Mon, 18 Oct 2021 13:24:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A7B2190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634556299;
	bh=YDntWO0YUlCfaN94NALJ3MRNO2I20NqD2P0kSj3Q7oU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uK0VO7sP5+2YIKzLeszslwpV/RcCzX2ljdoMMK5cVczZmsrlJEptR02Ahvs0RRvzC
	 ByWFOeUjEZQylBrHbZAcDzX3VczUhb04HRePkbZk/Qea6IugBdprob9Fcrc6FV5ywg
	 /wSbTm3Fmj81Q+cUCg5Lb0vRrTJF+1jt0suL4+is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 111AEF80520;
	Mon, 18 Oct 2021 13:22:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7C8EF80524; Mon, 18 Oct 2021 13:22:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8F54F80515
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 13:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8F54F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="IwNpysQ3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hm6F4Yf3xVKWwY+0/o6m4dh9DVZNpUBWMOiHG4LYWcCsYgbx39O46dYICCIbZvgTH8Z11idop+IdK6HvA5/90EhCPOZZnK+CQF2CIZRwNNAwaAPadmjkSayb+wKkFBZeql5LyeDLAN58lxzs840RmSBqwXjo6KL5N6rucJH4u3q0/QZasmeDWbuctxZOIsuhQ/lw0M3B0zmXqvASt5cHWuwyeLfEvRE+2qnBk+Clpw8Ts5RnRg0ExssuN16QHmtk7DpNbw/I7dmXxOB2f1D+cxPJ4XEwh/6U7XpUttgms0A4aai6s933lgIqfokE4bPd4i5w429Hk/hLuLNWu3hjNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BfBypYHqDkZQI1TcyN7GA6pZlno7kmEnbtz2fdb8ttM=;
 b=n/yWnVQ3PfbEC4NtBC+bDsq2hmQQ0NualyXDdqzGHQFcDh0k6A4ESaWKIqoH1sluLuK/O/BHTw4vqJ+g1N45aM1bLifUARJcbL1WIMx53zEziVz6Q6kJqJ9hp4DNZ0TuwhYF6xZG1UCcp0/MqYQMisSfBtO58ll5BKToyJff5ywCIy8U8Eix6Y25AYITZv+wFuT34CDIvVhB+oNcOU3DPqle6A9QRVp+UhTWkd7ALfoTsgx1/NNB3TeogXlmctL+f214ONi0RzLjzVnso1CMQXW3CKfz+Q76caOi6MZ+WS+1BURRXlkPHMITtmMNO9fqaq3BJYHFQsLE2DWC4m3AnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfBypYHqDkZQI1TcyN7GA6pZlno7kmEnbtz2fdb8ttM=;
 b=IwNpysQ3GPyfavIffveVf1CC/FiCWLDakeelBQqgMLK+9aQJ7oH4ZwJ1E26//sxcuAwBtRKKNtAGQBGP/ru+7gBRTCdsoPujvLt5QizUA1zdSOUcUx0OORDKq5tBWLk7WrEdXimYkq2h64m+iHJhoL42EK3Ht4qCK8lsqJMqFOE=
Received: from DM5PR22CA0003.namprd22.prod.outlook.com (2603:10b6:3:101::13)
 by BYAPR12MB3480.namprd12.prod.outlook.com (2603:10b6:a03:aa::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Mon, 18 Oct
 2021 11:22:11 +0000
Received: from DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:101:cafe::57) by DM5PR22CA0003.outlook.office365.com
 (2603:10b6:3:101::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Mon, 18 Oct 2021 11:22:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT006.mail.protection.outlook.com (10.13.173.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 11:22:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 06:22:10 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15
 via Frontend Transport; Mon, 18 Oct 2021 06:22:06 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 05/13] ASoC: amd: add acp6x pdm platform driver
Date: Mon, 18 Oct 2021 16:50:36 +0530
Message-ID: <20211018112044.1705805-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
References: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37ef4cda-9a12-48e9-03ab-08d99229875b
X-MS-TrafficTypeDiagnostic: BYAPR12MB3480:
X-Microsoft-Antispam-PRVS: <BYAPR12MB34803CD525C045955888FEE097BC9@BYAPR12MB3480.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:38;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TF38WTZYFUEMa4V7+tJSOE757aX87HXgZdjmhuhhYjQ3HG7NxmqUTt7FdbWPEiOltZsici1Ig17YeNPlfnMWKxrS6Tnx1WZgx6bn753oBk5ZhcC+5gjejtX8xrdDf9Fod/Z9eY4zMjS+dXthU9a1CLjgp1X5VM864EAzfjIoW+an89CtzFDTfM0gaJL1A/CJu6V1PL1QrBdbhuVkfG7mBzVQZ6wAAs1VnlMFktXtH+OXzIsCuhHdbx/QlZV5hVsKthvrUt8zf62b7HclSOXPOrXIx3Jwm9qBA8oXkXacRqs5DPNhb6GQ4Bj6xUVLEuYAYSiZgwzrJiR+R9PBU+4Y40SUBV5+fQ40H5QDYPqIp+TIO24VrgtRcagEF/3ZCuQPbE+q3khDWqGH2iM4qUJsiJKEvzAJxlMTmMUpD258JoSi3LQqGnK9m2Nd/UqKGr0r5XMuL7C0ggFc90vv69VcTq31Ydg8xhN2l/qhoH3k5GZbRfeUtczntGXK8ss3q0cD4LqDQZ/U8QBdLlhSlUYxvcxziihasnroLoP/Pdz01lRvn4EKU3cznPNGQgfMSKUnBGCI1lcwFcqX23kr5ynnp2UgESArPg08BJFFm8gmoMjFAbXPxAUfu7j30ScZVd11s/VJvnPH2qh6uUA2cAgXlIe8/D0h7aB2Ve1TlbT1eqBU0MU6akcBNvwdi+dniUrtFG1SaurG+7AVQg2erl/0anbacSRqTVyG5DpI3z16UknNfV8sUqlnHlaPD7FQzrM+fOiXBpRaDMn88JangBSsYg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(5660300002)(186003)(47076005)(81166007)(2616005)(6666004)(8936002)(2906002)(7696005)(316002)(36756003)(356005)(1076003)(26005)(508600001)(110136005)(54906003)(36860700001)(86362001)(70206006)(426003)(336012)(4326008)(8676002)(70586007)(82310400003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:22:11.1039 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37ef4cda-9a12-48e9-03ab-08d99229875b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3480
Cc: Sunil-kumar.Dommati@amd.com, mlimonci@amd.com, richgong@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>
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
 sound/soc/amd/yc/acp6x-pdm-dma.c | 81 ++++++++++++++++++++++++++++++++
 sound/soc/amd/yc/acp6x.h         |  5 ++
 2 files changed, 86 insertions(+)
 create mode 100644 sound/soc/amd/yc/acp6x-pdm-dma.c

diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
new file mode 100644
index 000000000000..75228ce74da1
--- /dev/null
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * AMD ALSA SoC Yellow Carp PDM Driver
+ *
+ * Copyright 2021 Advanced Micro Devices, Inc.
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


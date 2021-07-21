Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DD43D1582
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 19:51:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A0131702;
	Wed, 21 Jul 2021 19:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A0131702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626889885;
	bh=sLn13C8xRvCZ9qyT8Mn1JAk5/WcwI5L8hb2FHhTjkAk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sLlu/Fd8QkDXa+XVbY1Jn9/poDA2zzCeIm7fMpaMXsoShrPRnOz4tBui0OtEPuiua
	 2AguFxzRE5ssiYrSfToRWrAwUPB+rpulQ3MOzvCbJaktDhPqay0O/YveOG+4acLtgF
	 1cRVS6n7gRFpd3A8JwOA5YIqFDyrATpWL5FX6cqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 020C0F804E1;
	Wed, 21 Jul 2021 19:49:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46F6CF80507; Wed, 21 Jul 2021 19:49:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC7D5F804E2
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 19:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC7D5F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="KheNcxVn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CW4YBgc5LjgRh/ZhbEfbzh3t5PgNe+kGXBUVVqkNBRN8nrCSCgAmbotliJXzseRQUryHFx0BWRT07T0C6vi1XQiiRCVKFXmVdymsm8ONzYUKv0q2x+oyLN8yXL29jmJqI/SxROPf7ujjwOwCrostJ/NmIp+uSISpi5Ccz7lCCWkhmNHEUQstIqU0leYhIhyrcZivKgHT8qPDtCtOHVcg0nd+rxkU4RgsDydAWUEYYBVIpVD1o+VPGHGx5iyEsJ3SnP0iQq1mzUq0Ph/LHyXwmHJzOiOZyX9qECuoz2w+w8PMfHDhm+czDIicgDiYFIJ5YZU7WunyFmbtwxSrDXhQSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+safQbXcU0Mnsj+HYozuxByaF2zXwOPApsfItM/zHqw=;
 b=V2M1yVxbVrrm6r/kBm1rmcir9Jrf/6M7YV14KdAhrni3+qB6tOWO0L5aXABn3ICoiuOn6bPIgnzkWwjQVJrqTsSstzLolHjOkj1JB8KOsCmGoLhRqdCM74spaysKk31pPAZII5yplvo7Pz9cakmZOyJXx5Rdh6uJbvjm/Ct8q3MDKPls2fe6NR8eBibo4tyBAua5LpJ2xY49Guy+5oz0SKhv+fX1hk1TUrml7Krr/D+P52cmj9q2WZfP7eoj+KLmudpMu6sjdRqLNnmd4F6NqVZrdkCU6E5/dUHejTabDH1bE5B2JybOuRbeOAnTOK5F+j0b0z2FgHV0DQ+agwbQtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+safQbXcU0Mnsj+HYozuxByaF2zXwOPApsfItM/zHqw=;
 b=KheNcxVnJT2atWfwq//rfWnNyv3BeMnp4ZP/93NXrxl3UIw4hrs408Va25oCWp0RU2NRyCs14FXCRQxBgXqZtEJPwPgWgrOg/20QR+kC/eHrkQPZv1q319v+k0W4/90YV/aFIX1YOQkdH+DxliNMSUQ1aNahRSIiEVTKBEPqs24=
Received: from DM6PR10CA0036.namprd10.prod.outlook.com (2603:10b6:5:60::49) by
 DM6PR12MB3227.namprd12.prod.outlook.com (2603:10b6:5:18d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.29; Wed, 21 Jul 2021 17:48:55 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::5d) by DM6PR10CA0036.outlook.office365.com
 (2603:10b6:5:60::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Wed, 21 Jul 2021 17:48:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 17:48:55 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 21 Jul
 2021 12:48:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 21 Jul
 2021 10:48:54 -0700
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 21 Jul 2021 12:48:50 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v5 08/12] ASoC: amd: add vangogh i2s controller driver
Date: Wed, 21 Jul 2021 23:34:24 +0530
Message-ID: <20210721180430.11571-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210721180430.11571-1-Vijendar.Mukunda@amd.com>
References: <20210721180430.11571-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e03ee39e-0e0f-44bf-f8ea-08d94c6fcf97
X-MS-TrafficTypeDiagnostic: DM6PR12MB3227:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3227CF0FFCDE635FB0AB05F397E39@DM6PR12MB3227.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:14;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qk5LkzE7bWPgXryBOE31XGC4nwefhgTmIVHQXZ6JKWFUm+QR9g2Vw6tAzjR3ixpWErBdU8yCgLkGd6UfJ9ArGpcDuT9Pz1TcyKsyJkKermRtBMu2oObKKWC/y1gDOQhBO3MW37Ku92xDz12S4scWZtRyME4c8+DtrC2NFF5AJig2xeapRNVHQueM+8Dbt9eAN3yVMlT642gbXRkdf0ciSyQiJezgXytCM99kPIqxI9Ie16igKYU0MDDg5Wpwnpq0aGy7wIjStEm0+VYkrzHLsGU6OzpB5eXjbj5clpgbm15LBZ6I9nxFE8pUuHfpTEWMntmhpQ7HFjEmmd8k9C/tIpQE9GSb/BAYQH6DXy5ZrOEPynb7jFVWty8tm682EqntkgqsRH0u7Yw6FWNu5EMQWrR2W9bcOcFr6OTeMTF0pIaV52nIyDmTljgPbOTs6RcrrMX0aHz6Hxm8T6eV5rMZ2+3oZ7PiyXbqsGLbatwALufG48MXhKWeaJYnsxcWXJuO54OPCFT6BZIpagIPaB7gcxM3CIl2mttVyKqO7w9hvO3b4cDFcswMtuJ50wsC0zQof33pIJekeGqFLO5eAapMav8MNuJNvHLpMkTz1Oix7RxhNCK1ihAkYb2iwfkRE8wPv4j12rI2uEEhp1ZUoDfBdncRxaAoH/fMUqUhNABWNQ7zsPWtzb22xmazTzC4FkHUqSzi7ixQkudG1e2pX495IpTfcmE51ylcfvqmApdtmOg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(36840700001)(46966006)(478600001)(316002)(7696005)(47076005)(2616005)(54906003)(5660300002)(110136005)(8936002)(4326008)(36860700001)(86362001)(36756003)(1076003)(186003)(82310400003)(26005)(2906002)(356005)(336012)(6666004)(426003)(81166007)(70586007)(70206006)(8676002)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 17:48:55.6580 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e03ee39e-0e0f-44bf-f8ea-08d94c6fcf97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3227
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 pierre-louis.bossart@linux.intel.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 krisman@collabora.com
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

Add Vangogh I2S controller driver to support two I2S controller
instances.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x-i2s.c | 88 +++++++++++++++++++++++++++++++
 sound/soc/amd/vangogh/acp5x.h     |  4 ++
 2 files changed, 92 insertions(+)
 create mode 100644 sound/soc/amd/vangogh/acp5x-i2s.c

diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
new file mode 100644
index 000000000000..30b651035042
--- /dev/null
+++ b/sound/soc/amd/vangogh/acp5x-i2s.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// AMD ALSA SoC PCM Driver
+//
+// Copyright (C) 2021 Advanced Micro Devices, Inc. All rights reserved.
+
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <linux/dma-mapping.h>
+
+#include "acp5x.h"
+
+#define DRV_NAME "acp5x_i2s_playcap"
+
+static const struct snd_soc_component_driver acp5x_dai_component = {
+	.name = "acp5x-i2s",
+};
+
+static struct snd_soc_dai_driver acp5x_i2s_dai = {
+	.playback = {
+		.rates = SNDRV_PCM_RATE_8000_96000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+			SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
+		.channels_min = 2,
+		.channels_max = 2,
+		.rate_min = 8000,
+		.rate_max = 96000,
+	},
+	.capture = {
+		.rates = SNDRV_PCM_RATE_8000_96000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
+			SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
+		.channels_min = 2,
+		.channels_max = 2,
+		.rate_min = 8000,
+		.rate_max = 96000,
+	},
+};
+
+static int acp5x_dai_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct i2s_dev_data *adata;
+	int ret;
+
+	adata = devm_kzalloc(&pdev->dev, sizeof(struct i2s_dev_data),
+			     GFP_KERNEL);
+	if (!adata)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
+		return -ENOMEM;
+	}
+	adata->acp5x_base = devm_ioremap(&pdev->dev, res->start,
+					 resource_size(res));
+	if (IS_ERR(adata->acp5x_base))
+		return PTR_ERR(adata->acp5x_base);
+
+	adata->master_mode = I2S_MASTER_MODE_ENABLE;
+	dev_set_drvdata(&pdev->dev, adata);
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &acp5x_dai_component,
+					      &acp5x_i2s_dai, 1);
+	if (ret)
+		dev_err(&pdev->dev, "Fail to register acp i2s dai\n");
+	return ret;
+}
+
+static struct platform_driver acp5x_dai_driver = {
+	.probe = acp5x_dai_probe,
+	.driver = {
+		.name = "acp5x_i2s_playcap",
+	},
+};
+
+module_platform_driver(acp5x_dai_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("AMD ACP5.x CPU DAI Driver");
+MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
index 929be9905e8e..3238c1154053 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -71,7 +71,11 @@
 #define DMA_SIZE 0x40
 #define FRM_LEN 0x100
 
+#define I2S_MASTER_MODE_ENABLE 1
+#define I2S_MASTER_MODE_DISABLE 0
+
 struct i2s_dev_data {
+	bool master_mode;
 	unsigned int i2s_irq;
 	void __iomem *acp5x_base;
 	struct snd_pcm_substream *play_stream;
-- 
2.17.1


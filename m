Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1583BE2C3
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 07:43:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04FC9168A;
	Wed,  7 Jul 2021 07:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04FC9168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625636587;
	bh=JYIOmps2YB5ld1eCPvpI1YAKsFLtjBrYTnIfu2IVju4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Djt1449e0BHUFoHd3/o+d4ZR/xAEpWMZF+XveXp/l1AQ6Z1LovJxizBGH9RVRUlF4
	 xgRoAtO5msRcIscMi5wOigSAZuRq9UA5RHIyqUFOgS3HLFZ+NC1QAxuC/HBUHRHtaN
	 KELJHLZ5VqddGeHMNHEOfH0g2r+ALa5Vhk9uKXAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17914F804E4;
	Wed,  7 Jul 2021 07:41:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12BEDF804D0; Wed,  7 Jul 2021 07:41:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73571F80224
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 07:41:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73571F80224
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="CDg02ME5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6QgoHRbSjZU/FajIe9TNMSobAvOG4J49WMFbGspSygKnjlojykTtuhumrJ6EHyx9wsSelVjb8Q/AF/skGnBhPXl55+bnVRPSybMoz6pB976pIcXJEDWf1fO3fKp0wogXIIdxWGgwFW1paS3eHcXihYQG/8/jGT5tTiZAUGVv2nigstPJVFHqlejUZzrc+uPTNlKt2+OX+1ItMO10UY1s+8zZooR0Deaza3oRumITtjfwWhcTTFl2qQ9rgEbN+QGMoA0/L1w/h1u4z5OUPdxj3gQL9D7/CinOWi243k21MvxEs+OILq2UglN5X3ooW53bCK9hAKzo1te/3FIWG01Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nz/8dKfGzq99u/lYboo7xCpJCY4uOuw7pnNfSdi4+Vc=;
 b=YR0Ynn+2Yw2wRTPi3NS9Imph50hFRO7CfL2Ye0lj6O/tVWHTS0TQ9H3gsNN99DgWt/p2rtCUzDNuJLkwDhfAZeKk4S0jCeWq4iYQnAXetSMvvFyVIMwAz+e+2bBvYRoi/ylAcfaFzxK8p0T1wpj79qfVpEtqUTjXTidZHlTFh16v5EO5XLUgupvFqH9xnXq9uND2IxhK6O0oybcRRNaS0KOTaNdaWiXaf0A7EZp184dTOnPkvDGGpwbmeMlSXuD9RhQV+H+yFIlKNQRBNkjvf6AVuYaiN4Wygdda0ePHMp+TuEyPSh66f3PhYe/sQDCerRrF3N2uIWufNfT4Bi94OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nz/8dKfGzq99u/lYboo7xCpJCY4uOuw7pnNfSdi4+Vc=;
 b=CDg02ME578DK/xR0YTAMp+rVBYxvUyEdGmFGq5QqZMbsgITrQ910flMv/lbRPeDDql25WWYOkRa0lorOWI17aBghKAuox0YycEmuOXmIHuHyqCBbjxqNfIrE4WAmAfg2KV0n8mGZD8HEOaVVM9mK6t2SJ1pPgkosLgwhO+R00IY=
Received: from MW4PR03CA0013.namprd03.prod.outlook.com (2603:10b6:303:8f::18)
 by DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 05:41:33 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::64) by MW4PR03CA0013.outlook.office365.com
 (2603:10b6:303:8f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 7 Jul 2021 05:41:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4287.22 via Frontend Transport; Wed, 7 Jul 2021 05:41:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 7 Jul 2021
 00:41:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 7 Jul 2021
 00:41:31 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 7 Jul 2021 00:41:21 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 08/12] ASoC: amd: add vangogh i2s controller driver
Date: Wed, 7 Jul 2021 11:26:19 +0530
Message-ID: <20210707055623.27371-9-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210707055623.27371-1-vijendar.mukunda@amd.com>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9f4491d-ea23-484d-f879-08d94109e09c
X-MS-TrafficTypeDiagnostic: DM6PR12MB3962:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3962AA0A94F508C73C1BFEAF971A9@DM6PR12MB3962.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:17;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xpTZ3g8u0Gv0QmEx8I8zaA/rGzPaeXI7rnyNHWETaU1XCYIDISobFs+A5EdPjvjRaqDk6Eg9XEF5H/wxP+0GQ9er9lEi5BTIMGawyBf3ujMylCu8/5JLw8uvmZpr8Yadv6FnQAJiN2QVN8hWu+Ru8XGl1wBbilFdHJtmqHNW4lBHCtr6um6x/owAAS/FZ/eTQDHMzD4o+S/hsSsNFFkkqh9fdEUER7YRphxjCyyuSX65pEKcgRo48tLcGRyKk5iJEpY5s7gututwq2i2jd0SlCIxkKYnv5mT1viwKBAIbPsxsiF/OKeOQDO/gMYXcbkCZJ23cKRk2gwz8f1rJbWNrIDoYILulH8fKC5leUtv5q0zitH1dZN713WzAMH2QsnKAq3Tp0YG4TQ0LsxHMaHODX8q+JQD7iyRkZWYBGUF2d58542GyoiQ0CAFmRSXPy07oLWEVVpS+o8KI0jzqXg5MdjuWp5hM5cwHBJmAxaSZqZ8BwdjnrdyoO95q8pmjMEZ/kDDKBptH6KZ69o536s3W1HFuUpoFSAvsFinoblCWnX5Ci7F6NeaH5MXcGCdErKE21/1F0GCUbgfZOwI9SH32q4SULmBGVzzuUgJWKelPAZcc5ulpFjA53LPsGSLwPr7YbfIIDUW3q8pkwlzcdIsT5+5vx91WP4vlka/PluGLw/Sq6YbIGnm7eki1xe1/srcrodWp+4mB/eQYKP9ekhTaE/8SshK1qD3WC6Fo4tyK8w=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(36840700001)(2906002)(1076003)(86362001)(336012)(5660300002)(356005)(26005)(426003)(82310400003)(70586007)(7696005)(2616005)(54906003)(44832011)(82740400003)(110136005)(4326008)(36860700001)(47076005)(8676002)(81166007)(316002)(70206006)(478600001)(8936002)(186003)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 05:41:32.6901 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f4491d-ea23-484d-f879-08d94109e09c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3962
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

Add Vangogh I2S controller driver to support two I2S controller
instances.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x-i2s.c | 97 +++++++++++++++++++++++++++++++
 sound/soc/amd/vangogh/acp5x.h     |  4 ++
 2 files changed, 101 insertions(+)
 create mode 100644 sound/soc/amd/vangogh/acp5x-i2s.c

diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
new file mode 100644
index 000000000000..0945c6452189
--- /dev/null
+++ b/sound/soc/amd/vangogh/acp5x-i2s.c
@@ -0,0 +1,97 @@
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
+	if (ret) {
+		dev_err(&pdev->dev, "Fail to register acp i2s dai\n");
+		return -ENODEV;
+	}
+	return 0;
+}
+
+static int acp5x_dai_remove(struct platform_device *pdev)
+{
+	/* As we use devm_ memory alloc there is nothing TBD here */
+	return 0;
+}
+
+static struct platform_driver acp5x_dai_driver = {
+	.probe = acp5x_dai_probe,
+	.remove = acp5x_dai_remove,
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
index 99298a2f38ce..27cdd3b08701 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -70,7 +70,11 @@
 #define DMA_SIZE 0x40
 #define FRM_LEN 0x100
 
+#define I2S_MASTER_MODE_ENABLE 0x01
+#define I2S_MASTER_MODE_DISABLE 0x00
+
 struct i2s_dev_data {
+	bool master_mode;
 	unsigned int i2s_irq;
 	void __iomem *acp5x_base;
 	struct snd_pcm_substream *play_stream;
-- 
2.17.1


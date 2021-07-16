Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1DC3CB924
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 16:54:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AD92169B;
	Fri, 16 Jul 2021 16:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AD92169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626447241;
	bh=p7A7nja4NUtNYfXTX2snatJDVwX+oG1edoabZxdHDoI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MqWey/6AFGRev4bObA+MndLpHdMsgE/NxMXzV4tcfAAOsAamlokJlEpIS4g37bkf4
	 nuG6N7E84dF+ZCST9e+9apgbj/0BfptJlOptgjYSmfDNU342QxYf/eiBF8lZEjZunx
	 yj+zzDC83P73FH+Xt8nDJCnpQsCgN8OUuvUWA/Rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B36AF804DF;
	Fri, 16 Jul 2021 16:52:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 191D9F80269; Fri, 16 Jul 2021 16:52:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50D5BF800FE
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 16:52:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50D5BF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="NBqXV+T4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4l3ze421vs98frlIhQTPKcXwRd/kWG3E9bhmLcO1tH/KoZ7ruE+iQzAjvd7xZNdP0kOKjIudI+iNftmisOjjTWGHgVgJ+YvvuDYEJgk3+sr9parPTquN1TmOg0Vw72SoMQ4G6uonFqsVX+AkFJTBg8tcWgx7kIdwK648BwRY+5ZRm1n3m2TCD8rgw8ZCCt5TMOJgtW1PaLVQKQD6OMR/9r1zQ3UhGyh+3VhAfhMKzc4keMA4xEn+H94mS+G+4l78uI9xSpcV5xIYHxTHYztLFvallpe+fRRxGSorP4orwVyxzCuWU9fQXJ4c9thGY5dERj944OQ08dtGi56W41e4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaljDr17sNECrlZi387V8jBinuF272xJ1/DIjDMp4WQ=;
 b=GWelYcO/ASF7139sKywCHPYcqTtmK/fWlhnJCr0S6wiUaKlo1WxapVEWWNbkZU1xEipubX9C8pNnOkHCsJIRH3u/t1RuXaDy4Gtl/FoPyOE4m3DI8tohLXIjZG2RjBUIcZU7rcmXGlzxknLQpafnOeokLLfPZJGnDQdi2WpGKGx+dWmk6sa8qRSSJH2nrxC/xF+cxmUccoB4yNdY96DNhilpUkh/ZHiW0D0BtDOCHtZjvoi98kKNXTm+mBtuBrYshs+u+XBKrYj2OHACiSJBJY/nhlHP+/+P39tvgkI75JdvWoKnIvnqVUnrpq4uhHGx99tUWYp3r8fCJM7dhsJsmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaljDr17sNECrlZi387V8jBinuF272xJ1/DIjDMp4WQ=;
 b=NBqXV+T4wISvIDLIJ2zZ4M3wg6fWr5R43wFfJqEUUYHhnHn8CuUFomLK8iTaAkbOP5bvlTPr2orCt7id7ZI1XneX5DAuLaCXzhko5J+KzuI7GK4vQsuN2tuxNTIzS3N9TDpe/aFETcStzpZbsJ+R+AJOKWCQel/WDr1TOpgKJNo=
Received: from DM5PR08CA0048.namprd08.prod.outlook.com (2603:10b6:4:60::37) by
 MWHPR12MB1485.namprd12.prod.outlook.com (2603:10b6:301:4::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21; Fri, 16 Jul 2021 14:52:15 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::2b) by DM5PR08CA0048.outlook.office365.com
 (2603:10b6:4:60::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 14:52:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT044.mail.protection.outlook.com (10.13.173.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 14:52:15 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 09:52:13 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 09:52:13 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 16 Jul 2021 09:52:05 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 05/12] ASoC: amd: add ACP5x PCM platform driver
Date: Fri, 16 Jul 2021 20:38:02 +0530
Message-ID: <20210716150809.21450-6-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716150809.21450-1-vijendar.mukunda@amd.com>
References: <20210716150809.21450-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0120581-a7c4-4f79-72d3-08d948694d20
X-MS-TrafficTypeDiagnostic: MWHPR12MB1485:
X-Microsoft-Antispam-PRVS: <MWHPR12MB14851C2F2251D95E97A68B3997119@MWHPR12MB1485.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L7WkO9oFMhEFPnCoh+I3hrVobvFGfwiv3ll7G9GoFcCOGAPyqxQSfYPtuLtwFWfZislFkYgwvPhS914h5S2/sqtDRRj1Bpzzz4Jdww+ryItcxJ4emFiY4d1IkI+HQp2xmpn7SB8XZ2blug9D3X41/K+OXT4DKHMGUE/Eu5efBG32zf20pNnt0CfGx29G1aZ9tIsMpXAJh0swIIFeUxKwyXtaguUzbllCMeQ2Z/do4eo8fBDKn9AKPjmY+y1USu/Udm9F9lry0cSoqb0WeurlxZ+5iE6Ne9/DotGJGCFIxJg3iU2OR3ZffqLRpCxb1BtJgwC+ZDXpB7PGUdkZ/hFKsrlLwNmbWFekwxvPFj0BhE8kNw7thZAEdetMLRkrTntwM1Z2LAzCyDmkqNExDI94EiAaNCSqBCd2YryzgSprYbK/3ObTQNYHN0LswforuLk9k3oryVJBCCNGklnXQLl316xvmLsftlnx0fubC1G3W/hI3oaRs2WGVDboj852iGO1vnFLjzWWXBzTSQsTOen8pbcKB9o+DBZTKslVcDvOeu7Gg109FnqOHlJj81BSPwIuV3yW+gDxMakj/TRRiUAWyMngygablo67hzOtp5iTYIRuzMjewgFmNbrSbx0fYlYy4fzGA49rImqdF1QCi8GfOUNMvOhZFPOHZjR9s2LTwiBKIAzOjP8KhxWt4dRZBnkNQ8HE2tBJ8OAuCp3M7AtCHqg44SGKhlAGIIdkxZ/TCMLaY/F4BaqMqHWkGEw6oD99
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(46966006)(36840700001)(4326008)(426003)(44832011)(2616005)(8936002)(1076003)(478600001)(8676002)(336012)(316002)(110136005)(70206006)(6666004)(54906003)(186003)(26005)(356005)(7696005)(5660300002)(82740400003)(36756003)(86362001)(81166007)(70586007)(36860700001)(83380400001)(47076005)(2906002)(82310400003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 14:52:15.1344 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0120581-a7c4-4f79-72d3-08d948694d20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1485
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

PCM platform driver binds to the platform device created by
ACP5x PCI device. PCM driver registers ALSA DMA components
with ASoC framework.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
v1 -> v2: drop acp5x_audio_remove() API
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 73 +++++++++++++++++++++++++++
 sound/soc/amd/vangogh/acp5x.h         |  4 ++
 2 files changed, 77 insertions(+)
 create mode 100644 sound/soc/amd/vangogh/acp5x-pcm-dma.c

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
new file mode 100644
index 000000000000..2ff11bb88305
--- /dev/null
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -0,0 +1,73 @@
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
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "acp5x.h"
+
+#define DRV_NAME "acp5x_i2s_dma"
+
+static const struct snd_soc_component_driver acp5x_i2s_component = {
+	.name		= DRV_NAME,
+};
+
+static int acp5x_audio_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct i2s_dev_data *adata;
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
+			return -ENODEV;
+	}
+
+	adata = devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
+	if (!adata)
+		return -ENOMEM;
+
+	adata->acp5x_base = devm_ioremap(&pdev->dev, res->start,
+					 resource_size(res));
+	if (!adata->acp5x_base)
+		return -ENOMEM;
+	dev_set_drvdata(&pdev->dev, adata);
+	status = devm_snd_soc_register_component(&pdev->dev,
+						 &acp5x_i2s_component,
+						 NULL, 0);
+	if (status) {
+		dev_err(&pdev->dev, "Fail to register acp i2s component\n");
+		return -ENODEV;
+	}
+	return 0;
+}
+
+static struct platform_driver acp5x_dma_driver = {
+	.probe = acp5x_audio_probe,
+	.driver = {
+		.name = "acp5x_i2s_dma",
+	},
+};
+
+module_platform_driver(acp5x_dma_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("AMD ACP 5.x PCM Driver");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
index bbf29fd2b12f..d2853738eb17 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -32,6 +32,10 @@
 #define I2S_MODE 0x00
 #define ACP5x_I2S_MODE 0x00
 
+struct i2s_dev_data {
+	void __iomem *acp5x_base;
+};
+
 /* common header file uses exact offset rather than relative
  * offset which requires substraction logic from base_addr
  * for accessing ACP5x MMIO space registers
-- 
2.17.1


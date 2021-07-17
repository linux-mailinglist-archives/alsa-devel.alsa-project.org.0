Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B4C3CBCEC
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 21:45:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DB8E16BC;
	Fri, 16 Jul 2021 21:44:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DB8E16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626464718;
	bh=HEODpg3krUh7E0q35miRNZdLwJjQwDkKujbpU4niHNg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NJndLsQYjJDpXU6sxCiBiEvJRqeK3Wig+2/qGUmNuw1Ax5RujfbLTh28T9/0qwPNG
	 /lhRCNmYGctNYHGdsrrbn3n3oUy0Hyqq6yC44HroiB1DT+prQRmTkLgIPC/w43Un/u
	 vj1vZak7JfSAs515PKBRngWxAj4VzcV+TPT6KDNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C047F804FB;
	Fri, 16 Jul 2021 21:43:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E9B8F804FB; Fri, 16 Jul 2021 21:43:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02057F804DF
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 21:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02057F804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="covPBDaj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4BhZAxru7YcV3lHXsIviTtPXuSMLj09vtZBUHKhTnbVP0/aYyTWW5QIkKGrD/9MGiyIuLHFOkY83L3+XCOpYsHKIi3dAbXLj/01UAKu4MiVhb6EZgafwSUdn4VY4Su115H2GbsuWr++S8VEtG3lHImpn5DexT2mWmCdliDO069GS8fng8QasQX/DY+uJM5V6+PyqW06UR5PTm85EugIXM1r89mgD55vKswaALMQ1FOo/ufLWWDWN7F0p1Eq19zVt+N/1kvya2mE05TkUsRT9/CZIrEI/Opn1zyk4rLz8zlKSLXFu+94peVjP1NTgCwQQBfPectVI7yodQ+5sphJHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4k8jEUgWQcIECjH9BT8sImgy0tQkLFMvEcfc+iuKLBs=;
 b=MBV8igy3SjjM6siivhxRfnC8SFC2caUNFx4SYkXFih2tZ233IRa2vaBB2B3HzzU20jgNN9vSvAlGkADEq1oohEAhhY1Fos5tmWBGBwSJf8AhGM+aSyP1mmPiM4hoN5TL8W85mswjsXWaLfMvPhtY5rrpmRwzY+heX9vsfZ5CjWtTW7SoPGqcW4+HFYgu4Yak3olTARN5ifz06reKXjPyCqjkE48XxBUwzmwWlU8nQVY0ZFBepJJChGYcs0S+B3y2VKHKkQ9EtRQKf0uspmjUsW17ZGMbx9ztnhxnuXcq2qJW4GtLlRDjESGXenHewgtwo7kE1O0BNTDFeEFZmrVtyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4k8jEUgWQcIECjH9BT8sImgy0tQkLFMvEcfc+iuKLBs=;
 b=covPBDajGKno0ag1L/k4ZqK/wjll8iYiCAcQqZlcnjFb1EfIQujMqW8ym9HV+lka/2Xx7zORUxhtpYF5lz0uv3pIV0U4regnHpjjb/nLIDCRbMYHfd7Xwf0rnR2KVJqPuNnXW1H7bpDfICIjCtMCMmS5tMSqpMJgE8ntGnqRbUA=
Received: from MWHPR17CA0088.namprd17.prod.outlook.com (2603:10b6:300:c2::26)
 by DM6PR12MB2796.namprd12.prod.outlook.com (2603:10b6:5:50::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Fri, 16 Jul
 2021 19:42:57 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:c2:cafe::2c) by MWHPR17CA0088.outlook.office365.com
 (2603:10b6:300:c2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 19:42:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 19:42:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 14:42:56 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4
 via Frontend Transport; Fri, 16 Jul 2021 14:42:48 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH RESEND V2 05/12] ASoC: amd: add ACP5x PCM platform driver
Date: Sat, 17 Jul 2021 09:30:52 +0530
Message-ID: <20210717040059.310410-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
References: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73dc789e-5fd8-4be3-6ff9-08d94891e990
X-MS-TrafficTypeDiagnostic: DM6PR12MB2796:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2796C5B17AAC9EE7055E074897119@DM6PR12MB2796.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qTTZQcSt/TfaAkx+M8jtbCDz2/0fUo8rvhW6MBg1WVhMlUloeknwm1lHNtUqvGB25I3q3e11+H/3K70kOPPT0q4LcxWnPO1t/kAjbCHoZo6dnDvR1oxg5hvaq1G0cUq10npaLTbHSajklfASk9jSgMuopwJXQGP4JfC+cI1ClvYN8ecXUtiAm9M8iwHeuKrJF30wnDuEEp3wwkkpxGLTCe5XPwtu8qAVZrCfFE9xGrQDRfIj4jVmIGUk1BfY/gTzvf0rZD3yH1O1ZBHMc8OigNVF1Jz1ddnko2tA1WW780uTf8HavXVkzl6fMEbxN1vlYjcaXI9KZSZ5HM5D4jE0kzJCnnok2bE8+qz+WlzpsKXwh/H7LSKxfh5JBrZc72JsNz80rEnVb22tRvMcTz0XPqwjOMUYzUEvjXwOUHS9YsfVAvcHNHamktwZaBRZe0ljFUudOeHuHczXixu0zv4b1amn9jzJuDhtf0igjEBVkue/TYsisOydSzhT6ZzLYTfPty6Rqp4imdo7y4rcrDDDD4g+qCplZQgxbZUF3IQAVoB8l7rRy/xgq26+z4nNFsukq6jt7wxzXgrdpRaB/VTXqNk+YHIySgq6TcCjG2TTZ+slEZIZb/EQfZWZwj5VYuvQd+WIFzNbmYQjwDWCmtNLftRFsHyC89glN8oPmTF5l63GBHgLnn3GMPBY5P88nLJUVUsxU/60Iu4qi2poeIent5xSTNaIEyFEYQ5dOJaBouMjWEOhQHY3rxmB4zvyB1dK
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966006)(36840700001)(36860700001)(110136005)(81166007)(70206006)(70586007)(54906003)(8936002)(356005)(7696005)(47076005)(8676002)(186003)(5660300002)(6666004)(82310400003)(82740400003)(83380400001)(426003)(478600001)(4326008)(316002)(36756003)(336012)(26005)(2616005)(86362001)(2906002)(1076003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 19:42:57.3981 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73dc789e-5fd8-4be3-6ff9-08d94891e990
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2796
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
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

From: Vijendar Mukunda <vijendar.mukunda@amd.com>

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
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2313BE2BB
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 07:42:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7072D169A;
	Wed,  7 Jul 2021 07:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7072D169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625636536;
	bh=eLxHavKzeg2D1cJwvjodivxhtxN6ddsHI+T1JOtNiJI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZFmp6zJOLMq3ao4ug0+v2ik8eSCRdilSKTaqBvDc9cftzQTd6s1mcdixsngUgI6dD
	 UQ4nd+LPJNbu4Vyrpze//HVemJEffcYw+ytPeLN7Rm++RtDdLNCP77IIjYiMyfsdbD
	 vWYarjOmUVYMd2zi143HG0sCV/ocSGJqzbbo92FY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E88EF80300;
	Wed,  7 Jul 2021 07:40:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D973F80302; Wed,  7 Jul 2021 07:40:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8AC1F8016C
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 07:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8AC1F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Wcg1fJm/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aMMachguRlsoLO2pEikOoMvCSfPInfpTertwmJ9ZtOKf4jB5ZTb+xSPbOl/COFjHlTxvywdzmMAWrHz6kTWSmkHzVKoIg3WDg6gw2V6Hcm0p9Wrn3Fg3Dq8HuB8gdIgNOzGJ506t1jbapMciKvxM1Q6AQs15HdcKXDgkSS5L6RWAno7w25IvTMN9N0SbIWNwvPXEUAxq+Byen/8HdNL37+USZDuM/1Y+kmDSgiUMhIQztGQSptBQwh7yE7VQoYRZuGERNJSl6snB8TWTa/euAuerg8mmdBStsatbY7n6GLcCJCkPXXYrmVFwBAkbwyUqBq5aniVLo1pj9ffBTLE8Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqICdtzpDqZ1LTE9SfNSkoaBJGN67yYlte30WiI2OOU=;
 b=bRNWLFbKvvKMfaELQJklr4MHwt+dwsr1lusiHiSNy7vU6Fx4wF4bn0ksjg5fTaBu7A4wBnod+AG2ywaJWQfZNS7dx/yGxcHKUTHEEoDbdn+rZXJscKDj1kqV343AgyzZ4nDhneVX3kTRtdT4yO65xbDTbwWToq6vS4G3HSqEj+pZkT9u23tSnmU/Zmtsii9gAtClCdjQFLw3dp6Bqw29EOIJAFxCGZcnDvBKD8Wa/RyYtSIHGuhG39lx7+vXykT8GueQroEqJ03iTfem2q39boV7F6Vw1clfn5/Qn18vVHRFyv5ct14cEyXaeBELnra4DpQQ13M4Pdg5lxYatAowPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqICdtzpDqZ1LTE9SfNSkoaBJGN67yYlte30WiI2OOU=;
 b=Wcg1fJm//o/GXltTaNc6rinfzTju5Hlu9eSi5MSJL/qtElHxcWmjS9GJDBPY4kqrLJ48kQhKVoSzTRKZiOpwQnt5VrXjUgPSWbETbeRrSFYu0CJ/VfIXWUeuYtPZ42AL/6/1FdYTR4kFXAdN5SiXtKIeNJ10/X2KZ3Y0Xs7+pSU=
Received: from MWHPR22CA0004.namprd22.prod.outlook.com (2603:10b6:300:ef::14)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 05:40:39 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ef:cafe::8d) by MWHPR22CA0004.outlook.office365.com
 (2603:10b6:300:ef::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 7 Jul 2021 05:40:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 05:40:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 7 Jul 2021
 00:40:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 7 Jul 2021
 00:40:38 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 7 Jul 2021 00:40:28 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 05/12] ASoC: amd: add ACP5x PCM platform driver
Date: Wed, 7 Jul 2021 11:26:16 +0530
Message-ID: <20210707055623.27371-6-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210707055623.27371-1-vijendar.mukunda@amd.com>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71a4914d-e647-4973-57ed-08d94109c0d9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4110:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41100EE6AD1D569ED0975498971A9@MN2PR12MB4110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:42;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PP+vwten+RDdr9019YrmqQaovXWQLlXejqPOWONj28BhxJkCvL+PQ8yrWqR9zwdPmD1KR2LU3ZwGu9xYthISY4DbEAdXJlNwSSn2+pbHQgDVhjDK1KaYT91Kw/aCKqbiIkM7n1vcwG7X2cbtsunRtaTwZys5zGuArGSS4/Ul9hNYV0y0bc+LHd4RYQGdxvrhykdpd4zE2ELkMaLjiP1MD/5f8A/O5UlMCN+SNECbXS3xnD5k5CH624158VzPm0ISbiOpqSYB1ADL9F7XgEaODbtCnvdfRLZshCGHJNv/V/yg/w3M2VUuH2plADJEPqFM5DK9GN1letptU1f3z9dUbgooAnwR3FtZsSOy2mJ6vdPr3lzQAplhwOW7FFnWdvu2IcbYNCkwCY834UmdiMiaC3ujeetCSok5aOkIXeMwaL3kJwjUizQWGxxaRPpaWHaN3+6JO3Bns1/kU/FibIcnJp+4GD095/o07EcgOeFfiRiRD0H9/CyMqauHk7IEAoxG+puR2SymzLwi3YqvzlNU06ZaP9FkuFqN5p2lBwVeG46J8DBhFoXBMH0cqbC2pGOqWorbXUyZ8g7X5xslUXtg1EfyQmbuVx2PKv9lrT3N5rxk+cITmOwAARBgSWrThCwPEM4D+W1KwAYiP3vPEaFr+OXAOSU2bq+2tDsRmu6jXAqNUuslKvOdkG9uNXQ+JEbkM4nRzSFjTPYMOlSdTQdUwk4pYQTIQU+foQ1Z+HR1jO3x49rFF2fVIHs3piDKESL0
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(36840700001)(46966006)(7696005)(426003)(81166007)(70586007)(70206006)(6666004)(8936002)(336012)(44832011)(186003)(8676002)(2616005)(478600001)(1076003)(110136005)(36860700001)(356005)(4326008)(86362001)(2906002)(47076005)(316002)(82740400003)(54906003)(36756003)(5660300002)(26005)(82310400003)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 05:40:39.3907 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71a4914d-e647-4973-57ed-08d94109c0d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
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
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 79 +++++++++++++++++++++++++++
 sound/soc/amd/vangogh/acp5x.h         |  4 ++
 2 files changed, 83 insertions(+)
 create mode 100644 sound/soc/amd/vangogh/acp5x-pcm-dma.c

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
new file mode 100644
index 000000000000..efcf01eb89ae
--- /dev/null
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -0,0 +1,79 @@
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
+static int acp5x_audio_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver acp5x_dma_driver = {
+	.probe = acp5x_audio_probe,
+	.remove = acp5x_audio_remove,
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
index 365e80b56ff9..eca642614b4f 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -32,6 +32,10 @@
 #define I2S_MODE 0x00
 #define ACP5x_I2S_MODE 0x00
 
+struct i2s_dev_data {
+	void __iomem *acp5x_base;
+};
+
 static inline u32 acp_readl(void __iomem *base_addr)
 {
 	return readl(base_addr - ACP5x_PHY_BASE_ADDRESS);
-- 
2.17.1


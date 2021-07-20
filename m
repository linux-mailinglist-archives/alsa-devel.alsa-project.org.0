Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFFF3CFF2D
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 18:23:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D2FA1694;
	Tue, 20 Jul 2021 18:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D2FA1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626798202;
	bh=wHtj/XD2wgaba4WY4W1Sj9p4auNtc9qGUrVrHrXVukM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qPuKane0udHqIiaz+fgiysNlc8TT0iIc4u5Uv0JprQK10/nUHqtOFqrJl9sxQdTNx
	 twOp8nCzNcR2Y38gY8EO4UEiOxxLan1wMfuCAkzcclvU2JzW9r+k/P2fl71LSB4FZ6
	 +rhbU/bG7uhrTBgOGBoV1PCAA/hdJp2kuEuEyKYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F8F5F804FD;
	Tue, 20 Jul 2021 18:21:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF893F804AC; Tue, 20 Jul 2021 18:20:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2071.outbound.protection.outlook.com [40.107.101.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D980F804BD
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 18:20:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D980F804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="CNtaNVZU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYaivEFDcPGBzxiMudm+GSjyctIKKY+cILJnQOCReAxOSZgoi6G6gPODmVi5UvD+6ibMWaEoybU7eyV/zwIuRsqZl2OAnnPDfRDfxS8aGE7ljSaQcU/sjResfiIcBn9Xn/MpNw7U5/h7XF7dJi7ISbxzqkgQ8tUiEfYrtgWnpbdbjHaUzZM9uemz9LilTd0f0GiIBG3KXOdYV2dpP6hHI1eYls/+xwiCZmtyaXNTYxweISoRRQUW+tcRccTvLNH26s3IgppyKv3Oa/gkjpBFbBu8wKxF5KVPP7CQr8HhH6uMzPYAXCmgXpnAKi1MTISENP1nvVRN84Q58RE7JlPjIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uUu7hxWo8KH3exlY2oSZbLEkiRPOGtXVfqZtMHQqjM=;
 b=D9kzo0CqI16HGUdiSoiat0qhq5Vw32QFaUoGvieSB4i75MxRsOLA6G0groJix53FoDFcFD4SCz6GHbkpongTdbAexz5d6gltF6kPQyCuf8tq6o8myFrmA2iWpEY3KlArHqf+6PmnPpnR/p+fsIC1hoSngvXatzs3ZkDMlPracY6INmyg4ePfX5xkASFcNTWpIhZpGwjF9BHrF5WEa3w1D+M78eTrMmJBjYwUlotHjzXpoxXoBAzcyq7Lvu9WXV1xNPAt9xQp3T5sBXjlqkMZzBzPGDImul41MF3J41J2zivbPUdE/ktf8ZQYdGMepxCm3c/MhsRfr7qXsu1JSdQObQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uUu7hxWo8KH3exlY2oSZbLEkiRPOGtXVfqZtMHQqjM=;
 b=CNtaNVZUYDplSU12cDGLW2QqRI56sitN9Mx2xpa4Ps3yZjLZ6B3n1BykeRjHdhetGEFEkyN8MO4sGYv+mCVpOBvACzjrs/FUSJBlQXGl2Yb019kwTKev9sMevYvD1UwmaiqlbhN8XblwCMUUzl0quSOAnsi5PXtGxiznS34AL7o=
Received: from MWHPR2001CA0019.namprd20.prod.outlook.com
 (2603:10b6:301:15::29) by CY4PR12MB1350.namprd12.prod.outlook.com
 (2603:10b6:903:41::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 16:20:51 +0000
Received: from CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:15:cafe::71) by MWHPR2001CA0019.outlook.office365.com
 (2603:10b6:301:15::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Tue, 20 Jul 2021 16:20:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT047.mail.protection.outlook.com (10.13.174.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 16:20:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 11:20:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 11:20:49 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 20 Jul 2021 11:20:46 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v4 05/12] ASoC: amd: add ACP5x PCM platform driver
Date: Tue, 20 Jul 2021 22:07:25 +0530
Message-ID: <20210720163732.23003-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
References: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aca501e5-4069-4312-47a6-08d94b9a5757
X-MS-TrafficTypeDiagnostic: CY4PR12MB1350:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1350ADEF9B35C010A1D4DF6597E29@CY4PR12MB1350.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dwTrXLtkoJjHbtossvoeFnucet9S2N/ElmJUBEjkKMRAQAr1PlqbSpemY5lkqK+6jmyfXXkIjVlNsunZxJ6oUR8eSM0YcduLWCXU+B/dzGIe4qwXyVOyrjvz9C3sKJtjYbx7xqn4EflD3k3WOR2XjfuJryD1p+AvF2RHkSC6EmvJcCFB8i7ZxMckH+EILNmJeSoWRCx2ajNnW1TkYi22bznhGGK/+E90n1w41UJkttOblyBxVuF0Y2HB99K+Gu+ulo1OicfDqpN7UkLGRNK7Yp6gfyIufJE/tEUtuhKqsg33dOPfNi81vdnOfxQZlYwMxQY15vBoDJeuyL7xuSX+SOJuO0OzSHGmnq/xQ6be4sp6zitpMkAhMlQh9OkW6jTRBKlAwOgSPt1mblnYebZ3rlGaearMLR1x4/FS8ND2jin+nTqAbSpbxIXQmplqjr5AbSXGYN+ZvTOcP/ad85cq6rIaPvuFnA+fk0dPuuqblk/mOnsaLajl6IZNiw+uCOiXDY/9BPzsU0MgbIjzpfbmICMHtWyCcXZjtqPgNXwPtpNzmVNLJimcCJritJlSXsEjCw8bx/XdCov0odHjxi7RJWCornAXHj/lSvgdRzwJqTHAcTn+Hm4ezcQyDgx3WIw3UNOS6GwaZDEUHMMC3ZlPGIE81RKuhVOM4S5eV859kW2ew/q4zCzigfwMsGqbRDw9GQNIGxXSsXCmNkj0KZq+POwLZCR9RBWlTuuY9sKoeuS+xc8g4w95CQud5wpY4PBi
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(396003)(46966006)(36840700001)(8676002)(86362001)(356005)(2906002)(2616005)(36860700001)(8936002)(1076003)(5660300002)(336012)(426003)(47076005)(7696005)(54906003)(478600001)(82310400003)(4326008)(186003)(83380400001)(26005)(70586007)(316002)(81166007)(82740400003)(70206006)(110136005)(36756003)(6666004)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 16:20:51.0401 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aca501e5-4069-4312-47a6-08d94b9a5757
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1350
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, krisman@collabora.com
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
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 72 +++++++++++++++++++++++++++
 sound/soc/amd/vangogh/acp5x.h         |  4 ++
 2 files changed, 76 insertions(+)
 create mode 100644 sound/soc/amd/vangogh/acp5x-pcm-dma.c

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
new file mode 100644
index 000000000000..7d397acb3632
--- /dev/null
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -0,0 +1,72 @@
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
+	if (status)
+		dev_err(&pdev->dev, "Fail to register acp i2s component\n");
+
+	return status;
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
index 32e5db10c1c8..e450fb32d680 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -33,6 +33,10 @@
 #define ACP5x_I2S_MODE 1
 #define ACP5x_RES 4
 
+struct i2s_dev_data {
+	void __iomem *acp5x_base;
+};
+
 /* common header file uses exact offset rather than relative
  * offset which requires subtraction logic from base_addr
  * for accessing ACP5x MMIO space registers
-- 
2.17.1


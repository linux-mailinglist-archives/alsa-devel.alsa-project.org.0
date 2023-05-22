Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F11070BFC3
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 15:28:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E0D8836;
	Mon, 22 May 2023 15:27:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E0D8836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684762121;
	bh=ZVIZDMdXwE09ive3yr0XLSfw49U24aDB1zOxXoRrKAg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aHERZ27ArFKQNqVRVvxTMJDRfvGxu68dbuftUzVP8y1ySO7fLG2PZamBko3Kty9KX
	 nNCCGRIRKY83kwFhDBZUHCicAM8AJyHIlBpFuuamP+wOHZYHlFUJKbHHeCk8KWFgR9
	 pKCMJHRaZ1MHuQikpsGFhCqAvNhgsklxdV28rCs8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1EA7F805AC; Mon, 22 May 2023 15:27:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55B96F80580;
	Mon, 22 May 2023 15:27:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56E0DF805A8; Mon, 22 May 2023 15:26:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47752F8057D
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 15:26:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47752F8057D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=2l5a+dMy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRqnkgyTINQVTiwWBZhPOmFDnIIn9mbil6oslz9yreVXNRgVUSkFTYSAUMTi55OwhKT0s12UhmLYueoschEt+k4F78P11hNUKw/Ajmh8lXABZ6sIPfjm6CRfXNst84Uu4t+wfs06PoIlbiOhWKWR5G0QUgoq8j1CXMwPqxXZrtw+Pgc/ebzX5us8v0T8jNCGHQQnc9U0pTSIiMJSBHkLeIOxd0Kelz0ka/JtxWIzNShYIJcaFGJJt5S12wOS2f0ihZvD3whJ9fJ41Iq2/uFpX9f/Pmr1oRWapwDJiRcUSaboScwV7k2THo5RghknnQ3FfQxhgEwqCJypWpJFKcC3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oInXiL7CeKXlK9T9YeD3FEO2IDbCnscFb2CJJibNE4Y=;
 b=IeOluBde6JIkXwvUtYzlvW7aiYLigW8BpWkpp7V0Sf1iXMzTf2hQzWL8Vk+3rmLcwGwV8Rng/F31aHKx7bZT3E/gfMiCTjSdg+MlbwWJMcZklA1RUt1v8Ss4zftWGHu5fOaT7EoA7BD4LLCdnrm915r44g+y1PS+qbRteoxhej5UTnrIaY1bx48P7u+W2ipFRKMs2NmT1Lc0XSVJjHuSuA2mJ8kZ3ufC425oXcDlFCSulBtC+kgbASEoOD7FdqwNMSbpFanh5rxzEaizBC14YycUHnXyOIlqPOHN9HIz8pPsSfEd2aiKcWjI8rphPnTQRcY4ZmCXXOh2v9fqVHwV3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oInXiL7CeKXlK9T9YeD3FEO2IDbCnscFb2CJJibNE4Y=;
 b=2l5a+dMyVx+7Eu5TLBGPhPnA0s5cwmsOfNHeM/xnXwE5+Lm0RwrFkLqTCXxb5RsBoC9XutVP0Mwnxl7/ecAtDDYXRiCAix2PWd2WAN8OKuSOXRWLwd8Nw6W0efOY6xeAgX4mbJshC9afB9rIGG5fC32t1BeK1eGF8MN8L5vgnOE=
Received: from SJ0P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::25)
 by CO6PR12MB5442.namprd12.prod.outlook.com (2603:10b6:5:35b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 13:26:45 +0000
Received: from CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:41b:cafe::5b) by SJ0P220CA0009.outlook.office365.com
 (2603:10b6:a03:41b::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28 via Frontend
 Transport; Mon, 22 May 2023 13:26:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT003.mail.protection.outlook.com (10.13.175.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.28 via Frontend Transport; Mon, 22 May 2023 13:26:45 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 22 May
 2023 08:26:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 22 May
 2023 06:26:44 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 22 May 2023 08:26:40 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<Mastan.Katragadda@amd.com>, <Arungopal.kondaveeti@amd.com>,
	<mario.limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 3/9] ASoC: amd: ps: add SoundWire dma driver
Date: Mon, 22 May 2023 19:01:16 +0530
Message-ID: <20230522133122.166841-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230522133122.166841-1-Vijendar.Mukunda@amd.com>
References: <20230522133122.166841-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT003:EE_|CO6PR12MB5442:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c958248-513e-4870-7143-08db5ac8305c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1llBD0xI4Q/I7qIF2RdhyPQgmR0EvRe61GzFx/eWNopoPZVzNqnb9ZKEfAAjo3kxGEETpwy3Bzg5vK8dcQrXJVzjB6jQ8yAWQOzAT3nFH+1zEbJ3R8WNswCXHPSNNjkGkcVXJFtQP5PGKLrR0w0VQ0wD0boMh40+xtewktlGwBIs5KZ5kPJZQYNMRPQrFPfXpGeDwUtVzhC4pEBjZKKCAzyiA1QvQN1DsyID/h6qvilSVO1nYn+09PJ3xbobA1lxKO6J7zhOKnt2AE51RNEKzk1KQIqDSdNjk35eCRijHSJknrUEHekthbPivhdBMp5fCZSpe1g+0IAFJMBMXyfBR6lsRBrjrfQ66fnHkdJg6hgQpTd0IwbFg6EwXsbtbvZ7ezy2F5WJl8QLqp7r3w+S5PLtLTtKEEigrYw2bmHcUC2Fw8NN4TwUvHar7t+qtCFraMANGllv91E0fg8svSqBFYB4D/WrNxgvGd8GWNEG3sThEAHRvtMYJk2Bp4u5kbjn+1XTluNM8Oe5KAjG/bEeZ3zDqHcmQrQwe0sA75SmxMEtAegN1i4WHyuP5df58SJyEQv7YYdxZ5A+iM6DFFcIqzgd4pBsUC3DLf0Ox4c0iA3I41kIwxdIivhsS3GOFJ6LvdH4nXFFB3q29Qe7op+BM98s7UTOEunsiFVjbhviJUiJRYJYpmbHteQrnZBQDmg6PLRCaSUW+HlJycatqBJkdnMikySwb8e0PXp1wH019+RfoG/vApU9zY7dj/YAme8SfdXEqDqD8YAmTonrVrayRA==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199021)(40470700004)(46966006)(36840700001)(478600001)(54906003)(26005)(5660300002)(41300700001)(6666004)(7696005)(186003)(316002)(4326008)(6916009)(1076003)(336012)(8936002)(8676002)(426003)(2906002)(47076005)(2616005)(36860700001)(83380400001)(70206006)(70586007)(82740400003)(356005)(81166007)(36756003)(40460700003)(86362001)(82310400005)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 13:26:45.2818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0c958248-513e-4870-7143-08db5ac8305c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5442
Message-ID-Hash: SD7RLLPLPCTYFVBIMG22VPYANOIC3VZX
X-Message-ID-Hash: SD7RLLPLPCTYFVBIMG22VPYANOIC3VZX
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SD7RLLPLPCTYFVBIMG22VPYANOIC3VZX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SoundWire DMA platform driver binds to the platform device created by
ACP PCI device. SoundWire DMA driver registers ALSA DMA component
with ASoC framework.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h      |  5 +++
 sound/soc/amd/ps/ps-sdw-dma.c | 70 +++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 sound/soc/amd/ps/ps-sdw-dma.c

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index d296059be4f0..eec58da7ec8b 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -148,6 +148,11 @@ struct pdm_dev_data {
 	struct snd_pcm_substream *capture_stream;
 };
 
+struct sdw_dma_dev_data {
+	void __iomem *acp_base;
+	struct mutex *acp_lock; /* used to protect acp common register access */
+};
+
 /**
  * struct acp63_dev_data - acp pci driver context
  * @acp63_base: acp mmio base
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
new file mode 100644
index 000000000000..f41849fd035c
--- /dev/null
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * AMD ALSA SoC Pink Sardine SoundWire DMA Driver
+ *
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include "acp63.h"
+
+#define DRV_NAME "amd_ps_sdw_dma"
+
+static const struct snd_soc_component_driver acp63_sdw_component = {
+	.name		= DRV_NAME,
+};
+
+static int acp63_sdw_platform_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct sdw_dma_dev_data *sdw_data;
+	int status;
+
+	if (!pdev->dev.platform_data) {
+		dev_err(&pdev->dev, "platform_data not retrieved\n");
+		return -ENODEV;
+	}
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
+		return -ENODEV;
+	}
+
+	sdw_data = devm_kzalloc(&pdev->dev, sizeof(*sdw_data), GFP_KERNEL);
+	if (!sdw_data)
+		return -ENOMEM;
+
+	sdw_data->acp_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!sdw_data->acp_base)
+		return -ENOMEM;
+
+	sdw_data->acp_lock = pdev->dev.platform_data;
+	dev_set_drvdata(&pdev->dev, sdw_data);
+	status = devm_snd_soc_register_component(&pdev->dev,
+						 &acp63_sdw_component,
+						 NULL, 0);
+	if (status)
+		dev_err(&pdev->dev, "Fail to register sdw dma component\n");
+
+	return status;
+}
+
+static struct platform_driver acp63_sdw_dma_driver = {
+	.probe = acp63_sdw_platform_probe,
+	.driver = {
+		.name = "amd_ps_sdw_dma",
+	},
+};
+
+module_platform_driver(acp63_sdw_dma_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("AMD ACP6.3 PS SDW DMA Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.34.1


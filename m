Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C80A16A4C
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:05:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D8B160245;
	Mon, 20 Jan 2025 11:05:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D8B160245
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367528;
	bh=8zfMggSaGPgVOluTTFEYBg25lnFXl/2ApMT5XwS1o04=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dahmGBUyS1j8EAWHpW5OLpxCHa3noXHtKeIk/nrSUnYvliF9s8UNAGJaZZ7CnxrUW
	 mKV1j4S9ipamFqwwGzht62pCD2KDNtMmdfGRmpQ16p5IWHWodZPrWNsaQHMmNoofn7
	 jasbIm/nBmxp16bdlvX7RXEjAX2F89J6LcNXrTf4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42C7DF805ED; Mon, 20 Jan 2025 11:04:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7909BF805F6;
	Mon, 20 Jan 2025 11:04:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06A7CF80651; Mon, 20 Jan 2025 11:02:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A446F80631
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:02:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A446F80631
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=LHF1Pxh2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5Yx6Uc17mhuZ+kh5eHaFsTeYgBHnwk7EOLEcDd0AaaS20Qrups6V77Qvr3APt+JKnnAiaySeJgKknLfPekvGoiCMAGwNZjy2p4Agd2v75vw7CNIoc631CSHPmIrTkUVhPa0vmwOu+wohF2wNSTCt8D+8c5kv+3IJ3hJt7jQ37Sa+kFKLrC6lXAUSfbNSURzufmbUUqaSRCvh4af7qYpF48f2pfAw2H8mH9HHYbcHFZW6Hcx6zMx0HUk30aX4SK5dySoXvJsyqzK4ruD+7SqFa0s62bxh3i36tJmvpd9Sxw1kA3sxdcjVLgcY36hDR6J/ESvcSQWr1kfne+7KcTckQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0mHmi3x2XfPwnw1peF6G77Qs3/Zm4UCQI8CCkVrF5s=;
 b=cyyvryOC8czrnDPO8S6oHUXxt4j8Qt5xTWoSviVmtplpGP3XH8qyCm2iA4p37YKORvBL2q/n5rWPJ7Mh11Fal0w/WDU5shQDeIzRStB5tdKi0Lv9UN9AW58sbBR+TnDV1/Ihq5Euk0yPGuC+aF7TflIS1+sypMiMZD18A9Ph71MhaZvYN1bl742K3+RhDn3ueATrTgNbcUMUPFxzOrvwSCD/5lvAn3fXrxphfB3XmUb4dL6rzKUGDEZBzNGKgD06uit2YAclQqYaCYe6fWmqSyaJDjHIq0ff0x/JL9rCnM1Izw+fNwZdqWz6fZ3AyDuj+r/8IfdugLc6yIvNRY+3cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0mHmi3x2XfPwnw1peF6G77Qs3/Zm4UCQI8CCkVrF5s=;
 b=LHF1Pxh24tlti8ZuR30QSPUAUfLsl9xaNuhKjFAiZMuBzXRfiDIRcqb69qCtwBZDCzMFNLxr162srZaXNTCcGh1ObHR0RYS1Qok9P0XmkmOUBPLvibsmvjVWQNovaVkhYkIZCa2avQO8UzMuB+P2WESv68BwIA5RFoM3okpZPag=
Received: from CH2PR08CA0021.namprd08.prod.outlook.com (2603:10b6:610:5a::31)
 by DM3PR12MB9288.namprd12.prod.outlook.com (2603:10b6:0:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Mon, 20 Jan
 2025 10:02:17 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::32) by CH2PR08CA0021.outlook.office365.com
 (2603:10b6:610:5a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 10:02:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:16 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:13 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 09/23] ASoC: amd: acp70: add acp soundwire dma driver
Date: Mon, 20 Jan 2025 15:31:16 +0530
Message-ID: <20250120100130.3710412-10-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|DM3PR12MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b5fd087-6f8e-42e2-e9fb-08dd39398560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vg2EeFuGVOcQMHBXND7sLR/T94PHh4/e4lX6aWw0QKsesr2bDFaXTVmjOnHX?=
 =?us-ascii?Q?lBxYOq/6xvAF/VCmnVMyFERkQoDrBKsu96TW3Cc0pmEoMLdT1bu+DdX2D4Zn?=
 =?us-ascii?Q?7jdjZ25OQlZOU6me01HfrJHoY0TK1PzAfvIRLaUJ3VQribNZUQ+JkvojiDnu?=
 =?us-ascii?Q?PyIMywyYuIC0cC+nXsTgWKWq4TJfeOHRmnM22zMcX2S7wPEUSAardd5Kez4k?=
 =?us-ascii?Q?9/5tqXugWKVyPgCiECdcnvnRHzfTVM2c1BtJZyWMHZkSabOHqNl4Eb+E4lfM?=
 =?us-ascii?Q?Lxwk6nmPo7Oq9cuCxKehXQ33aX36Kl2cgfqSuaiOzFEPfDTwKga3LeibDDE3?=
 =?us-ascii?Q?dMxqDAFHKDdcK7WQMXsdFSYjFJJcKymqcvj1TA2c8qNQ5O0RgiqNV9ExFDIb?=
 =?us-ascii?Q?XiKKsRnvSYAcm3nRxb+gP9YRALFuCRD1l+qK3iDhJc7qZDcSzosoGk+7v5UX?=
 =?us-ascii?Q?P5EOSeEEi4YmteMB/lAyFRJuRR3kweCsFAuv0a+MDCMtrO6kEy9Sy0y8hH1j?=
 =?us-ascii?Q?IpoREc3PNRa5ZMvu3bfmqqWNO/DfIxg4Dp+Rz7r2OPJmD1HX09SInQIv+dH6?=
 =?us-ascii?Q?M20kMPiE0LR31yEF8VWH//IOpaSLBSzDkjZFuC7G+Phk5Dm3ZeW/m9uThpXV?=
 =?us-ascii?Q?nsgyW3hbUnX7inPBG5JA6gv/vZruxKmo/DFVpey0xoVhHgjb3LvKxuX8HuMB?=
 =?us-ascii?Q?2bWdBY0V87XeX41kMyVgVLV+6NonljQAdDLis207pXBFd23WJ6SLTrPvuiai?=
 =?us-ascii?Q?UY0lmxiVuXE8UF4J15Y2rNGTa/mLdLhxBLlvfUSBe5fADER6xp9Focl68duu?=
 =?us-ascii?Q?XautT2mmr0hQ+oSbUahijvyvpTJMEwWWMDrbjNDG5Ldfn02UtiDvzri00cb/?=
 =?us-ascii?Q?lotIxAH2GdDdj0n3Txzu3XGbGyBRSg5etPt2961a2kswvAZ7MvOaQqfcqj6S?=
 =?us-ascii?Q?5W4d2wRYtNd7Ezy6DuqvGw69hOfGAiQetIwNLFow0wLRpUkoCM0DYBZ23hQ0?=
 =?us-ascii?Q?nEa7dXkxa5sSxtP0x1yAKw2iAr/1Hjqojy1ALVgRG7n/9sDsfO6pqTHp1azY?=
 =?us-ascii?Q?ZMcr0wkmsMeWenTv2WO6tPqQRnSE8Kz2GbJ4YaXGBWuhT1/7YKePaXpY0eBr?=
 =?us-ascii?Q?ibDFKNXHbCQiZDRVxuuGBMhmJyLgP4lgWAUCZQoYId2eKYQ2Tf4opsQwmy2y?=
 =?us-ascii?Q?rCtVmxpJXYF72WtoHrT7CasKGyXGaGSV8Rlz3PgRktt8CnD/5Qi5ZMDiQ60c?=
 =?us-ascii?Q?G41IyVjbdybghahGm16+VIou+j64HTw4du79jhmINSni0SFPdPEXlUy8ppK1?=
 =?us-ascii?Q?73A7haZ2mUWoxMu6TGNxPc61u5ojosen2iz59hFLcGGkbpDfMeSLcC1uz/gx?=
 =?us-ascii?Q?D4aMuWXxYiUFxjqniGQ86gr1CfkwTntGgD3Wll0HyCYcT36flpWokpI0Msvf?=
 =?us-ascii?Q?9lSZX47nmAQILEhPMpf1GSzuWTvZ6nbkukIy5uwczBukCFyP5kLIBA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:16.9337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9b5fd087-6f8e-42e2-e9fb-08dd39398560
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9288
Message-ID-Hash: 4WWKYES5V6ZQETAFNZCEJFVQLSHBGRPM
X-Message-ID-Hash: 4WWKYES5V6ZQETAFNZCEJFVQLSHBGRPM
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4WWKYES5V6ZQETAFNZCEJFVQLSHBGRPM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SoundWire DMA platform driver binds to the platform device created by ACP
PCI device. SoundWire DMA driver registers ALSA DMA component with ASoC
framework. Add common SoundWire dma driver for ACP7.0 and ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/Makefile        |  2 +
 sound/soc/amd/acp70/acp70-sdw-dma.c | 74 +++++++++++++++++++++++++++++
 sound/soc/amd/acp70/acp70.h         |  5 ++
 3 files changed, 81 insertions(+)
 create mode 100644 sound/soc/amd/acp70/acp70-sdw-dma.c

diff --git a/sound/soc/amd/acp70/Makefile b/sound/soc/amd/acp70/Makefile
index 778bdf268731..f3e47635558b 100644
--- a/sound/soc/amd/acp70/Makefile
+++ b/sound/soc/amd/acp70/Makefile
@@ -2,6 +2,8 @@
 # ACP 7.0 platform Support
 snd-pci-acp70-y := pci-acp70.o
 snd-acp70-pdm-dma-y := acp70-pdm-dma.o
+snd-acp70-sdw-dma-y := acp70-sdw-dma.o
 
 obj-$(CONFIG_SND_SOC_AMD_ACP70) += snd-pci-acp70.o
 obj-$(CONFIG_SND_SOC_AMD_ACP70) += snd-acp70-pdm-dma.o
+obj-$(CONFIG_SND_SOC_AMD_ACP70) += snd-acp70-sdw-dma.o
diff --git a/sound/soc/amd/acp70/acp70-sdw-dma.c b/sound/soc/amd/acp70/acp70-sdw-dma.c
new file mode 100644
index 000000000000..6d748b295cb0
--- /dev/null
+++ b/sound/soc/amd/acp70/acp70-sdw-dma.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * AMD ALSA SoC common SoundWire DMA Driver for ACP 7.0 and
+ * ACP 7.1 platforms.
+ *
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <linux/soundwire/sdw_amd.h>
+#include "acp70.h"
+
+#define DRV_NAME "amd_acp70_sdw_dma"
+
+static const struct snd_soc_component_driver acp70_sdw_component = {
+	.name		= DRV_NAME,
+	.use_dai_pcm_id = true,
+};
+
+static int acp70_sdw_platform_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct sdw_dma_dev_data *sdw_data;
+	struct acp70_dev_data *acp_data;
+	struct device *parent;
+	int status;
+
+	parent = pdev->dev.parent;
+	acp_data = dev_get_drvdata(parent);
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
+	sdw_data->acp_lock = &acp_data->acp_lock;
+	dev_set_drvdata(&pdev->dev, sdw_data);
+	status = devm_snd_soc_register_component(&pdev->dev,
+						 &acp70_sdw_component,
+						 NULL, 0);
+	if (status) {
+		dev_err(&pdev->dev, "Fail to register sdw dma component\n");
+		return status;
+	}
+	return 0;
+}
+
+static struct platform_driver acp70_sdw_dma_driver = {
+	.probe = acp70_sdw_platform_probe,
+	.driver = {
+		.name = "amd_acp70_sdw_dma",
+	},
+};
+
+module_platform_driver(acp70_sdw_dma_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("AMD ACP7.0 SDW DMA Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index d6c99d43ed4f..c707c10c4be4 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -97,6 +97,11 @@ struct pdm_dev_data {
 	struct snd_pcm_substream *capture_stream;
 };
 
+struct sdw_dma_dev_data {
+	void __iomem *acp_base;
+	struct mutex *acp_lock; /* used to protect acp common register access */
+};
+
 /**
  * struct acp70_dev_data - acp pci driver context
  * @acp70_base: acp mmio base
-- 
2.34.1


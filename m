Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BD59C6E4C
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2024 12:54:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C20E02097;
	Wed, 13 Nov 2024 12:54:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C20E02097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731498894;
	bh=E0iB/Y7A8bBtGh9STxLDrCQ9i8JJno7/0PgSloXlh50=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fQLbq7OQxSSH+4UCYy5qKR4r6UPHz73UcHy2FZlCsSDtrquvtiGOiIpDDVtDMFYLY
	 3dpE7EV2AHFX2xLzar5WADoflmHMcr6Qa4qj/8XqqzWs8BmmMtdR6KbYFdf3gQ5vHu
	 iPvCoaN+51js7U6p+ba6GMQbjOGEZTZAL2htuekA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2BAEF806A0; Wed, 13 Nov 2024 12:53:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F04A3F80691;
	Wed, 13 Nov 2024 12:53:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C93CF8063B; Wed, 13 Nov 2024 12:53:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3BB3F8061E
	for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2024 12:53:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3BB3F8061E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SpcU5HS3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rd0vI9BJqPKuHuFLmp+ISxBVkNugUdFerVp9DTalXhDWW5nscaaxkdkTBzCy3EdpQt08T3JLOE5ZOH6chAwq/s4OQMI4khSwHKvaq/IfAfFU+WO395D4BrwbBY4AERXH5rnQMieLch5JlJeydjZdqazZxwILnHFMEEZSwUk9MwTKk4j/feYSNAcuaTubh2h5SDGuGINsgsjoBMBvxNsKMn1n2uN4TrkkApyksKJbWpwalrnBu3JYKhYNRy7A3tqQ2JWx+SjMS2fkIBaKvDYJXHst6QBuk+h5f/cOIXdg1hsXq54+rThvFkQYli5CVg8sX4CVX7uJMwzisbHUEj5g7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LP9yTetBwovcFli0rlNhn/0czsgrjnQoS3v5xWEfxcY=;
 b=hA3dGN2ldIqU/FdJP0BolqvIFjRBwfg4PRzlH6QS2yI0vMJNdMrTSKTUZO7+M/k0yc8QZwf1qLh49+GtTB+hJaxEd6eruI0qtfFZGHcnk48cWF0far7Al5oaMZZdzTPvdTlJ9zf8rNLW0RTiD2hreoB0+s/og5HmzDkl8l6vfEn5qTel0KjFc4g3KWRUhVXT8dJ2Kxs7YHxpXl7Gi9/+ARpiwHECcU1W1pEHDORNTOkkS9aOcwfZn3ay864c91Impt3fMbv0ro3XTbKLcaFoysrTokQbazob9pyBSfWBcX+10E8W2Ottj98V5bhsti/RcJbYy+WNt0ttez6YKywekg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LP9yTetBwovcFli0rlNhn/0czsgrjnQoS3v5xWEfxcY=;
 b=SpcU5HS3ADq9VOXjz5Bd1EebZgI8d/DqnlaUE9XMeMpgsyGSdQ4+L/nPszrbVaI3vuo2v/xlexPHTzjhrZf1oI/Ne3nqUm21ygKAaxF9jODJ2jTLOrNAFCriTGM59CCHFDdDWb4be53Zj2jbE7E9e6GZWnlshxQpt0EK3XmO5Gw=
Received: from BY5PR13CA0022.namprd13.prod.outlook.com (2603:10b6:a03:180::35)
 by MW4PR12MB8610.namprd12.prod.outlook.com (2603:10b6:303:1ef::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Wed, 13 Nov
 2024 11:53:06 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:a03:180:cafe::12) by BY5PR13CA0022.outlook.office365.com
 (2603:10b6:a03:180::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.14 via Frontend
 Transport; Wed, 13 Nov 2024 11:53:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 11:53:05 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 05:53:01 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<mario.limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 6/6] ASoC: amd: ps: fix the pcm device numbering for acp 6.3
 platform
Date: Wed, 13 Nov 2024 17:22:23 +0530
Message-ID: <20241113115223.3274868-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113115223.3274868-1-Vijendar.Mukunda@amd.com>
References: <20241113115223.3274868-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|MW4PR12MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: 294eafc2-c332-480d-bd7f-08dd03d9bc24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BHNvFqS98cDDfLtQn3nLvsAvxm3gmYwnbGzb7rAkKT5PLXDL+ELct1XR+Ut9?=
 =?us-ascii?Q?bo+MUdMNdim/cq1Nfn8AhtgMCXKuLv9OfTISN+r6Iktxkw6jMfAehM8D3JcJ?=
 =?us-ascii?Q?9j1vzpg+x9fO+AVLXq38qSyAoMzqAgt2liHa6fwBVx5sHKFJqi+x9vGVjp/z?=
 =?us-ascii?Q?r6avUThyz6OIist741XzoQDQYGVvBk8q1LbGTjVxcRj2PrVDoglsihA3i2ds?=
 =?us-ascii?Q?tRBgAaQhjwPP0C+LG/iH5j9YhJ/D+SOsPI/t6Bt6+5WIXxx4UA2yIZAl/NyD?=
 =?us-ascii?Q?ryzDOBHnWjVSkayfSE4K+Q03Y59De2XgK8mlvj99CsqnYHwJ2+ltCPXm3EUr?=
 =?us-ascii?Q?U26h/ro7ocHiiU8/M+mk4yJh1K3inprG6HU1ei1G4IEa/4gzEU1fO+LKu86d?=
 =?us-ascii?Q?I/0PVmuUQuEht2chc98LI+guIbp19pcb2vgAv3iyZ1B5KZSeKFoB62bF3dLd?=
 =?us-ascii?Q?ssTs84BZdQO0qek7Ac0VMYhUtJrUoI3UBny5VbPx/btdnoTp1nl8MnvZYpp8?=
 =?us-ascii?Q?tqd413/QMnB2uYncQK7gAgwqBj/+/CdHmpiJQScc+r0S+8dBMCRmMz8KnkgR?=
 =?us-ascii?Q?MCLl8/Sq5YjYoBX/b5TEdEQSsz5rLLWZwTUcKL/10rpWeRUt+6olgVRSfXWV?=
 =?us-ascii?Q?z8NY256x08/iUroR+oX0u9MR9EibM1HLRXg1mAGiJAMw9I9Q1fbYc7hs70hk?=
 =?us-ascii?Q?QompxqCa3Z5VNzUSBaE0ZNIq1n2sBvnCQ15rYH7iSrmxwqYy8AQ2n2Vmy44w?=
 =?us-ascii?Q?4agLhC5mmL9OeD7qEVBshS0KjxEmPbor1ILkRV+VAOB/8IH71Ea84biZYYDe?=
 =?us-ascii?Q?Pw8f1NJuZFGfA989ctDjk2nua23mQ9YBqxvljcKkVdhjVkCPFfON9N0o1EHL?=
 =?us-ascii?Q?4nZ8EwpAEJg2EF+/CYAY/BoClpr/PiC2FHOSXMyh2teHeLPZO9INo5IZmNqa?=
 =?us-ascii?Q?McDiKagUDAjcOgtzfpknx9kvuX6qbFPq69VyRJjIalw9UEe7Kxm1jTd/lDeA?=
 =?us-ascii?Q?vJXYaOFsFiMNUtHCJKmKcArgmX0X2V/hPacFow3tiNuKxjFT0mbfNWPRgcx2?=
 =?us-ascii?Q?HcphXaZP6fuac3ggIaCFAeYS9Mbmfkq4tpdrcZcA7zT6Wv0zvuZPjDQvtVrS?=
 =?us-ascii?Q?2aJi5p7wbY5djeaEoPOwNbJ5YHYCglf+2Z8GHI97VP49gAeootx65i10L0I/?=
 =?us-ascii?Q?0ohTO56EbgUdofxDf8RjJbh14GYypi2Z9W7eUMIOI3FvBitqx6zJRsp8lv4k?=
 =?us-ascii?Q?XemyqFEu3eF4dvC2mRB+wupuwDhSDzZyrMqKZLuRRzMYYq0mvdNDf/R6f0GY?=
 =?us-ascii?Q?hNzoMpPbKbrl2w9suCIZKmU6FZFPGudNLx9YgZ/UfR//nXyB5+OhZmbWrbVM?=
 =?us-ascii?Q?tovq+BOQdM47fzlVirdBzddchCrCE5X+0QexfqM1t8tUCmVJQw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 11:53:05.3601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 294eafc2-c332-480d-bd7f-08dd03d9bc24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8610
Message-ID-Hash: VBUSQ5IBNGET3SDHWC7OOCUIVIWLUKEU
X-Message-ID-Hash: VBUSQ5IBNGET3SDHWC7OOCUIVIWLUKEU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VBUSQ5IBNGET3SDHWC7OOCUIVIWLUKEU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fixed PCM device numbering is required for defining common alsa ucm
changes for generic soundwire machine driver for legacy(No DSP) stack.

Ex: For Headphone playback use case, use PCM device number as 0.
For Headset mic Capture use case, PCM device number as 1.

Set the 'use_dai_pcm_id' flag true in soundwire dma driver for acp 6.3
platform. This will fix the pcm device numbering based on dai_link->id.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/ps-sdw-dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 3b4b9c6b3171..b602cca92b8b 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -445,6 +445,8 @@ static const struct snd_soc_component_driver acp63_sdw_component = {
 	.trigger	= acp63_sdw_dma_trigger,
 	.pointer	= acp63_sdw_dma_pointer,
 	.pcm_construct	= acp63_sdw_dma_new,
+	.use_dai_pcm_id = true,
+
 };
 
 static int acp63_sdw_platform_probe(struct platform_device *pdev)
-- 
2.34.1


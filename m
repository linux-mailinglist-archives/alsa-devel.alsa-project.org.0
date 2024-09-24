Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE8B984050
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 10:20:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2F97202;
	Tue, 24 Sep 2024 10:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2F97202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727166052;
	bh=cDXdtJKNEBqO3/or1G8DkQjgnZNHsQ+/7sDW2RCEbAE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Sie5F1Bm9l8I/adkyPHjJP1Uy15xndhZixJIvpAThxHqE+2V9ON0+RdFnwToqmi3i
	 ua80JC25YTrw1L7MuCuo1xmNopXOqmII92OaSAjRMwFkl6gfvjc6n1kRa3sLxt2sqE
	 P7TP3z18T7b3a6zMRtQXgYLjkQzWDOFAkZZvA4OA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BB0BF80632; Tue, 24 Sep 2024 10:19:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85269F8063C;
	Tue, 24 Sep 2024 10:19:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CF15F805EA; Tue, 24 Sep 2024 10:19:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07AEDF802DB
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 10:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07AEDF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=zeEuSYYy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQnDB4MzY+dvIyyC5SaB1uYuvYkDJj/cBYhAkytDmlPEY92IK14hMIPZaNGRmCEVqc9ZTwV9JPEEmqJCtWKD450oXMJcjGNrePxOkLXsiLIaJfMUMWps7q96Frh7QVLWPLetYSz3Lu4RDrzNKxG9GOzlffLkgrxyhjaoFAolK2ROjqJD483sDO2Sb3vz+f0sniTcpYuYEmhnyMELcGpL8AoiUOPxPzaLICrKpSdfw0SnT573FWl6eGv/rYAwLQQgwrXzacKxjorHJ/avaL+mrl7Bz1IqYoG+85Z6nQy73G0Tt6XR3cthAJfdaO0uuxammjYvITZiNjCmSNZXPMFqNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKy9wUhG3WaIs92o7Z0M5iYudKb8D/yEP3pJH3z3TcQ=;
 b=CTy5NQ5oMyL1L0l+xTWwSNMW+bfqJ1v8QxkFaSpTyQwdkuNsYqZ6GQzDmfebakqdzDI7c7XFnmior4pstR8MIE/l7fV4GOFSwcoUCa4SifrhzDXBxpLEM4stVH68XslGEslKAX8zQU82e3f9UVomwaK/qyqwh7SuK0toLGeaxCWtCIblNZx1v0FnxD9qwux+hiHSvFTsUYGes5aTJlWuovADHSpo4UUobGzUe6RLnXohsQZmI1ECgcjEv4QR0k+JAC4XzQ5kLIq5eK/J6/thezWx7LhzMfp7hqmKtaw2IxN0fU3idZJknd3GxMRkSWlMD2glqTgE4d6KciMN64O4YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKy9wUhG3WaIs92o7Z0M5iYudKb8D/yEP3pJH3z3TcQ=;
 b=zeEuSYYyZqeNDck+3H4ZbziaRh2+CsVOl9t+ntxUM2oVZsOqfVDFZmTvJZy0jwVJ2cXTDlrqk7eC6hfxZuWXK32TlspVcfqiG+Ttiti2Vx8zxBFrS8pgZMjWJZG+H1y8+KtP2Gu17emIkfN2as7Stam42+7DXLAmV8nR1WOnIAw=
Received: from DS7PR03CA0100.namprd03.prod.outlook.com (2603:10b6:5:3b7::15)
 by IA1PR12MB6484.namprd12.prod.outlook.com (2603:10b6:208:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 08:19:25 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:5:3b7:cafe::f8) by DS7PR03CA0100.outlook.office365.com
 (2603:10b6:5:3b7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Tue, 24 Sep 2024 08:19:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Tue, 24 Sep 2024 08:19:24 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 03:19:18 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 4/4] ASoC: amd: ps: pass acp pci revision id as soundwire
 resource data
Date: Tue, 24 Sep 2024 13:48:46 +0530
Message-ID: <20240924081846.1834612-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924081846.1834612-1-Vijendar.Mukunda@amd.com>
References: <20240924081846.1834612-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|IA1PR12MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: d3793c00-c10f-499c-1c90-08dcdc71999c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nCphI8Uum9P72+4AntUpTsq6TmY+2TpPFDyJJ6aQdP/toZX8HeVN8k3GkO9R?=
 =?us-ascii?Q?yfr+r/IzymSjGENaUUf/hH2nhcaqZNAiVL2fLZIYEMR4VcaYMu2Sno/bGvbE?=
 =?us-ascii?Q?G217+6TOVEwLBmGXR3ZiwW8J9T0oSLhds9wXySLYoQlZoP2fj8P2TLOMwRZo?=
 =?us-ascii?Q?uRarpZzyIu8+6RTgWxqKniUZwPc4p75fg3cz9QO4thGIIyJdebualex43Foy?=
 =?us-ascii?Q?BudrRvmMo8VGVz0gwXmZMdYD+Nm3EPrm/+fwyqd/mOmAN2jFmBQ+FIz7yxP4?=
 =?us-ascii?Q?p6abZWIwkMWqJPO9rJPa4btJ6ND6AmUZT25AuLOIO9hiUCpVHJyu71WHHD0y?=
 =?us-ascii?Q?xgg0m/yWLkkHJuvRCfnFbGsr9zJ06/6yKUh622HzNKKZmU0RIXqPV+K5RzCp?=
 =?us-ascii?Q?KbuLtPM54n8LCYQdM/zhE59PrxA00jn+vMQbLODRl3fdQe4UqWVWOjCUg76f?=
 =?us-ascii?Q?apA3A3LriTPJKo06BaKEXV1fSQAWw4VkLyVqMIDBigmjKFd0pAK2SYIZY6FL?=
 =?us-ascii?Q?QoB3XygqGMCApUDn5GICQF0czrGcjjxMqk+uPqrib7f9iAG6N1uoaAt2cR11?=
 =?us-ascii?Q?51/a8uoGLJ9IxATXu0yXdxKVsRkGYq/sKmtdTxfCth1NK9l3CVZjAywWtjMN?=
 =?us-ascii?Q?fDtbZErZDB6UHAwWSJPPP0kUrcsrTblZrmdQwS6CxDiwlL2p9eb53Lnvavfw?=
 =?us-ascii?Q?zo1L5RWrBsaWadoCtwWaxfMOfX9I5sJ7luRroK1DyFcEcwcT/LkvdFTxAd7K?=
 =?us-ascii?Q?jS6wVl+hRLO233VZI+HiveIE+qrLyp83s/kWwj804sCLOIz+8EB4r5Cglb7+?=
 =?us-ascii?Q?uaqAsK46yiEPkjaHJSZtOs4M820o5Jv20vVeqMvNyuZDI366TtRAa2aZEUq0?=
 =?us-ascii?Q?a1BnJxm8G9LeahxDqt9CjM2nARXjN949/LFxP07ypXwu/sWsGBPd/z2fOctr?=
 =?us-ascii?Q?/N13quPmzpgSHI1p/Q2b1wZYkxicaMqISvsWMjhW+jxKwicuOzOfTUPfZ9C1?=
 =?us-ascii?Q?21/ycdI/az06xTzXvfJX3LuQwZiSy4AwFnPlymnnpxwn1hKVZZa1lPgzBabF?=
 =?us-ascii?Q?FUGgqlDJiO8MvkjjtT23wyt5zH9MFqAEAjx9pTYetC1qAMeN38TRm6vAJYye?=
 =?us-ascii?Q?wKr+t2bOB7ZRYKEfnZ3/YBQfRZtVWn2qIfjyhL7C1Ow4KynK72vY9CzL8/5V?=
 =?us-ascii?Q?5jBq3+7jTEaBEtTIP9bWxBq2WLow6xmMaLgBgZ3LMAoteMIYhx1AEoGHW9DV?=
 =?us-ascii?Q?ltT+M95HZkIgcvLP9ILTNdkwHBHrSfpoDhOf36unfkL6kOfcZBlQlT5N3Cpp?=
 =?us-ascii?Q?4eQslapbYu/M6kQ7m5iH0ig3uuO+lxV9jwn+VcYi2oIQGe8Vvn6RnQ0+cOmk?=
 =?us-ascii?Q?fNhtTrfhC7BhVgFxqxKETuMUHTniWwvPjwR2nAEs/fc1MjID5UobdZtY1cBQ?=
 =?us-ascii?Q?PRM6LUfsonf/ds6hZ05yEKk7IBGAumSx?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 08:19:24.5390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d3793c00-c10f-499c-1c90-08dcdc71999c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6484
Message-ID-Hash: RVIKC5WLL5P34CEX76YWQVNQN4ATF4CR
X-Message-ID-Hash: RVIKC5WLL5P34CEX76YWQVNQN4ATF4CR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVIKC5WLL5P34CEX76YWQVNQN4ATF4CR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add acp_rev as structure member in acp pci driver private data structure
to store acp pci revision id and assign this variable to SoundWire resource
data acp_rev variable.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h  | 2 ++
 sound/soc/amd/ps/pci-ps.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 39208305dd6c..e54eabaa4d3e 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -231,6 +231,7 @@ struct sdw_dma_ring_buf_reg {
  * @sdw_en_stat: flag set to true when any one of the SoundWire manager instance is enabled
  * @addr: pci ioremap address
  * @reg_range: ACP reigister range
+ * @acp_rev: ACP PCI revision id
  * @sdw0-dma_intr_stat: DMA interrupt status array for SoundWire manager-SW0 instance
  * @sdw_dma_intr_stat: DMA interrupt status array for SoundWire manager-SW1 instance
  */
@@ -254,6 +255,7 @@ struct acp63_dev_data {
 	bool sdw_en_stat;
 	u32 addr;
 	u32 reg_range;
+	u32 acp_rev;
 	u16 sdw0_dma_intr_stat[ACP63_SDW0_DMA_MAX_STREAMS];
 	u16 sdw1_dma_intr_stat[ACP63_SDW1_DMA_MAX_STREAMS];
 };
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index c72d666d51bd..0c3bb1da5097 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -267,6 +267,7 @@ static int amd_sdw_probe(struct device *dev)
 	sdw_res.acp_lock = &acp_data->acp_lock;
 	sdw_res.count = acp_data->info.count;
 	sdw_res.mmio_base = acp_data->acp63_base;
+	sdw_res.acp_rev = acp_data->acp_rev;
 	sdw_res.link_mask = acp_data->info.link_mask;
 	ret = sdw_amd_probe(&sdw_res, &acp_data->sdw);
 	if (ret)
@@ -576,6 +577,7 @@ static int snd_acp63_probe(struct pci_dev *pci,
 	}
 	adata->addr = addr;
 	adata->reg_range = ACP63_REG_END - ACP63_REG_START;
+	adata->acp_rev = pci->revision;
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
 	mutex_init(&adata->acp_lock);
-- 
2.34.1


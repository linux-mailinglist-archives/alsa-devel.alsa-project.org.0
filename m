Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F16A20489
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2025 07:39:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92F69601B5;
	Tue, 28 Jan 2025 07:38:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92F69601B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738046348;
	bh=VCpnc25refq8mAgZdYq0pPnbJA0dv+a/V3fRi3qRJkQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rtrgz821TzxNQ2slc8z9pc7M5D8s5tL3uUKKNChh+L8kOH+W5SMmngonMRp2THCmv
	 ttiDT8sbjhTlgy53UtpjyQgsRHmIm6I/JEgEXl42bTusn3qbFFNlhYvv6dErMdZeJg
	 jf8ffknIc7DWhXTG/egCsGhnd6I8Vat/jm6kAQ5k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BEFEF806B7; Tue, 28 Jan 2025 07:37:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C3B1F806A5;
	Tue, 28 Jan 2025 07:37:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18EA8F8069E; Tue, 28 Jan 2025 07:37:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::609])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 319C6F80691
	for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2025 07:37:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 319C6F80691
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SqA5JH3C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCr720kDh3ho4hlnDqgi2T+5WF/Sx+xu61SordPymnXgFT5zACRiOctR94VHYrvJSnAofrzmG3QISYzj2H4Ilc/oAklBV7ynBLjlyQYxuzMDI9lO804AqnkKCYaRT0NW90wzIwTYXCE0OZoZIucLF1nyfYloKTcm/kQ+G7EmnsUWJMJtt15T3ndH88LGRl7BhIpIrCDDoeLBbZnyi/4BWSpk77eijFQEF57z4CtfRPey9WN6SUqJEwjE0zsHHV3ljt1zanmhHYFr01qM3m2TiVgFgu5HaRTNdxLaYKPq+Rjek1md3nNNjyZGAuJXeZKc29vyvaHsMnmYfmyvK1BG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAglG2jnzZ0rxt83YlgsmoDuBthCfKwFfhHdegjIQl4=;
 b=KGF4VJ9V3VMfDodjh92Ed9+HRwXL5GsNZJniGbQ3UjYI5K18yZrgB+6lUrDB2Asjb2Kw0rm5UvGEQD0/1jOzCJbSZ5yLUM/K+tQeGzj+/eNdPosau9qO0esyhfACzkq2ZKct28bUdIlKcWeVeJnyPUmnsnF3Qvqi8BWcq94qVAWOzLHA0vbhUkHPFv8u4Rqs/rcNG9a4THZN4yFW5Etgw2yxNEmQuYCQM3HwogQlfIj85HqSM648iuxPIdlfSELjfdNVNPzy5COCIJPFN+t6/8kLTdTSQwEreb/LXc1bR/wjh2CU+AQugXK/I7h+2PhxcJA4gA7n27Ir2TVXmFeTfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAglG2jnzZ0rxt83YlgsmoDuBthCfKwFfhHdegjIQl4=;
 b=SqA5JH3C5Nn2QXi4S4CwdIRDlFekI1JaGyjINAq/J32tE5fyIYtda8GsDFdoGRGiy8WcRLE0+JzteC1X5IgFvwbiPD1eDESWaRP0KMafeSSY+vChvIj+KHzzuuAZ9jT3oG1F0zIecG7U2C+pI53XFAiFzAbnPiQTlqP+jFrpavo=
Received: from BY3PR10CA0020.namprd10.prod.outlook.com (2603:10b6:a03:255::25)
 by PH0PR12MB8773.namprd12.prod.outlook.com (2603:10b6:510:28d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 06:37:02 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::6b) by BY3PR10CA0020.outlook.office365.com
 (2603:10b6:a03:255::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.23 via Frontend Transport; Tue,
 28 Jan 2025 06:37:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 28 Jan 2025 06:37:02 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 Jan 2025 00:36:57 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 6/6] soundwire: amd: add soundwire host wake interrupt
 enable/disable sequence
Date: Tue, 28 Jan 2025 12:06:24 +0530
Message-ID: <20250128063624.1922470-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128063624.1922470-1-Vijendar.Mukunda@amd.com>
References: <20250128063624.1922470-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|PH0PR12MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: e0dcb125-7809-457d-d334-08dd3f662c75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?m+wng5vGjRbcg7QxXriA9hSSishirQSJEzyTdQE8ZQsntH7ZkYCUm690Wa5+?=
 =?us-ascii?Q?8O/ogC8yR/VY87wyr2a8XGxlzXug1on6SjQUrr5arPMBRIzA/yjZzjQ+NOhg?=
 =?us-ascii?Q?6q5Uuc0kv3RfzCQdtA7MMGVllWPADONCxyJTIRC2/sPPXldhFy1TaRkuDpFF?=
 =?us-ascii?Q?nqz7SRnZCpKa5L3g9oZpCXPqbrPvlFTHH/SQlQQPgwy8NRZ3ngGa7UXyaBoC?=
 =?us-ascii?Q?uyvVGvlwzMdEt9z6MZD88Anm3Dc1pvMDSk0e3+zUUp6LuGCNZJWcbn0crIj4?=
 =?us-ascii?Q?6wmHeJ7sknGxQSLhadlHYprEp7jfe8z6Pzbxop8dIwHwSiCby2//nmzb9+Od?=
 =?us-ascii?Q?Kq3LoYwgPM6UIz/lAEBYKzC5YJs8Xshn4tG1aIYD6bsRrVIx3UzQjg1sey0g?=
 =?us-ascii?Q?rCd3nKnGUTsN++tYBXIkkUsh6i2QU/gL7J2WVXgLZ6EZKPbiK0TtbkUkCFiR?=
 =?us-ascii?Q?TrJnGDEhrr9pIeg28xZWHE4qX31yAU3MsXxfPqg4l7gMPjwpE4qd7saHEoZn?=
 =?us-ascii?Q?ZDciE2yIU4QVNheGJq3r57vA4/hBwKALT3jpTrnzBouvk0Cw2FNZ3ceF8UN2?=
 =?us-ascii?Q?G86DhBzg1nGoB/bTZp0xzr4QzyZPmnNJIBIdxGJ2rbUs72F6YEqRrurknJ94?=
 =?us-ascii?Q?suNrvvn2NeIeuuOQaSMZh3JFItWBa6q/nFCYLgxqHHvXywLm/KZK+ooh7XzD?=
 =?us-ascii?Q?sOWft53gMlc8k8r5f3nN4KQ04Iz0TRmXBoCd2GmoUdxURaY6WeqL5v31XdGk?=
 =?us-ascii?Q?pDiA9KdENTBHxYjvSxkXI6qBzTRAt2Va/KwHzs0/q5Iz0Avz9R0BMFO50mJN?=
 =?us-ascii?Q?D1jRghcS51xed2wJOgK2pibraNxPnXvaOam0WlrOo04uOeYWs6/IJeZPWD72?=
 =?us-ascii?Q?CsiiTa1HaE1jEkDSuh0Jx7alh05nlY+S0HEvZrVN9pDYgK4u8DNfSusvdog+?=
 =?us-ascii?Q?9eT41lSvQXYDQv3uOzvUamhwIAfu5vF9oUMFWKkFRKnfD0dqgb6iD0ZhtIe9?=
 =?us-ascii?Q?4hhgKz7Zdxyb7IPxWGp79jNtA/PjZ8dt1TUNFdPRyJV5DnlsxZs/6hdMqA/v?=
 =?us-ascii?Q?UzLCF4aKhdZWdHXHYogN04EH5HXGlSUyS034LqoV71c5xS3LOGWfGdu7YsSV?=
 =?us-ascii?Q?7M75NyKNrgp6raQAxiAW9qxrpsNc65BKaPAUaLoTFNH63CKx6n2vJUbavDLM?=
 =?us-ascii?Q?344FM02B3eZdHnqNw0C+HeKoBBqmQdhcI92AtdZigsqQKE2/P8MscngPA2/g?=
 =?us-ascii?Q?qbsomdqEt5Ezb6H777Lg3IVSijH6/2tW4Eqb/EKVDFNWVdHXg57Xz5OBVlkv?=
 =?us-ascii?Q?rttpYZ/gnt+Eia1bcMCkpV86nfIxZ7qtnL9redX5uf1GOzZxEsQYm0jxsCh4?=
 =?us-ascii?Q?zhKiyoXsdBhLWHOKCGDIlWvANakNeiSwtFtDmcgStcROCi5UgwBzljQBCwSm?=
 =?us-ascii?Q?87LCt92nlm4hHRoqrkuiNaJeZfhvePzwBwft9cFpxbOjHzH29eb42jfnb6To?=
 =?us-ascii?Q?zqUlPCegtF+pXgQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 06:37:02.0049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e0dcb125-7809-457d-d334-08dd3f662c75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8773
Message-ID-Hash: 3XEIKUAQ3K4MUUKSRCHMM5T3ZBFJWXUO
X-Message-ID-Hash: 3XEIKUAQ3K4MUUKSRCHMM5T3ZBFJWXUO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3XEIKUAQ3K4MUUKSRCHMM5T3ZBFJWXUO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For wake event, SoundWire host wake interrupt will be asserted based on
below pre-conditions for ACP7.0 & ACP7.1 platforms.
- ACP device should be in D0 state.
- SoundWire manager instance should be in D3 state.
- SoundWire manager device state should be set to D3.
- ACP_PME_EN should be set to 1.

Implement code changes to enable/disable SoundWire host wake interrupt mask
during suspend and resume as per design flow for ACP7.0 & ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 58 +++++++++++++++++++++++++++++++++
 drivers/soundwire/amd_manager.h |  2 ++
 2 files changed, 60 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 41aa24986a1f..2be27df0a03a 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -166,6 +166,34 @@ static int amd_sdw_set_device_state(struct amd_sdw_manager *amd_manager, u32 tar
 	return 0;
 }
 
+static int amd_sdw_host_wake_enable(struct amd_sdw_manager *amd_manager, bool enable)
+{
+	u32 intr_cntl1;
+	u32 sdw_host_wake_irq_mask;
+
+	if (!amd_manager->wake_en_mask)
+		return 0;
+
+	switch (amd_manager->instance) {
+	case ACP_SDW0:
+		sdw_host_wake_irq_mask = AMD_SDW0_HOST_WAKE_INTR_MASK;
+		break;
+	case ACP_SDW1:
+		sdw_host_wake_irq_mask = AMD_SDW1_HOST_WAKE_INTR_MASK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	intr_cntl1 = readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(ACP_SDW1));
+	if (enable)
+		intr_cntl1 |= sdw_host_wake_irq_mask;
+	else
+		intr_cntl1 &= ~sdw_host_wake_irq_mask;
+	writel(intr_cntl1, amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(ACP_SDW1));
+	return 0;
+}
+
 static void amd_sdw_ctl_word_prep(u32 *lower_word, u32 *upper_word, struct sdw_msg *msg,
 				  int cmd_offset)
 {
@@ -1183,11 +1211,21 @@ static int __maybe_unused amd_suspend(struct device *dev)
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		amd_sdw_wake_enable(amd_manager, false);
+		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+			ret = amd_sdw_host_wake_enable(amd_manager, false);
+			if (ret)
+				return ret;
+		}
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		amd_sdw_wake_enable(amd_manager, false);
+		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+			ret = amd_sdw_host_wake_enable(amd_manager, false);
+			if (ret)
+				return ret;
+		}
 		/*
 		 * As per hardware programming sequence on AMD platforms,
 		 * clock stop should be invoked first before powering-off
@@ -1221,11 +1259,21 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 	}
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		amd_sdw_wake_enable(amd_manager, true);
+		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+			ret = amd_sdw_host_wake_enable(amd_manager, true);
+			if (ret)
+				return ret;
+		}
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		amd_sdw_wake_enable(amd_manager, true);
+		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+			ret = amd_sdw_host_wake_enable(amd_manager, true);
+			if (ret)
+				return ret;
+		}
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
@@ -1266,8 +1314,18 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		ret = amd_sdw_clock_stop_exit(amd_manager);
 		if (ret)
 			return ret;
+		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+			ret = amd_sdw_host_wake_enable(amd_manager, false);
+			if (ret)
+				return ret;
+		}
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
+		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+			ret = amd_sdw_host_wake_enable(amd_manager, false);
+			if (ret)
+				return ret;
+		}
 		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
 		if (val) {
 			val |= AMD_SDW_CLK_RESUME_REQ;
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 1d5e94371f81..6cc916b0c820 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -194,6 +194,8 @@
 #define AMD_SDW_CLK_RESUME_DONE				3
 #define AMD_SDW_WAKE_STAT_MASK				BIT(16)
 #define AMD_SDW_WAKE_INTR_MASK				BIT(16)
+#define AMD_SDW0_HOST_WAKE_INTR_MASK			BIT(22)
+#define AMD_SDW1_HOST_WAKE_INTR_MASK			BIT(23)
 #define AMD_SDW_DEVICE_STATE				0x1430
 #define AMD_SDW0_DEVICE_STATE_MASK			GENMASK(1, 0)
 #define AMD_SDW1_DEVICE_STATE_MASK			GENMASK(3, 2)
-- 
2.34.1


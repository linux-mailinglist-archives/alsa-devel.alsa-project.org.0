Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B4BA16A9F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:16:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB6BA602CD;
	Mon, 20 Jan 2025 11:16:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB6BA602CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737368204;
	bh=2mxFfcIffpKTSyLdlghabe4haSladRl1CKXokc98jM4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WBLyLYeTz/Pkd6QlcFurF5B5KnhNoxLN2E0VkFRoPv4OAU3oJYtmAFGKGKzESeL1s
	 NT6Lnl57Up6SNgx63YjxT3Q0hnnSNH3x4LJ6MdA/8R5G+rj7iW+2zZin1IqLk4wICJ
	 VtgoDhYsvtgN3vcKRjmNQ2YwZDvWlBArU2/wNzn0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE0DEF805B1; Mon, 20 Jan 2025 11:15:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D534F805EB;
	Mon, 20 Jan 2025 11:15:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3277F80571; Mon, 20 Jan 2025 11:14:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::61f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D54A7F805AE
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:14:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D54A7F805AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AAghmSWe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxFY/txHTOkBfgaypi6RpT9a/P8bNDpmfB8yiTIrphsr5yB7bXITy2YIMxxr0TA4kSfK8Sb4FXTRvoT8CenmalNVgG05JYpHQxxF6MY3vWDjGKMjy0jfaCFPpdQ+C0L68VeU+7tFi6gVxKjNuMbJp+nhyJrt8vSHsvLgSn5VQDbb9NAQCrmjlRv42luLIqH3jst2yzZyeU70GQGd/WMSSEVHEAoZjQ7Sg5wApBr6tl/6+8l92+/IvW72rOQvH3I4cx7wtj1R91AGqswCgWlShxmNeN9MGK8J//KK6rTZzd1yV9EtVpe7ahG6c6ePQVYZVPxoYXp3KR6Zu+EmL+TahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbFLIc86qhZtS6AqFt18YG5NxzDnVKEfEU/tjDTJ7Aw=;
 b=lxz68Z+TYF5lTe9yF/lovYunRdzrIxAt1S1PAywuNlGb1xqAt5nbkmG2qzn1R+eOQquDQEXkGqOONaaK1Qfqioslq/OTljfWo3HfDM52II67ryLRL4RD9b5d/DpcMY4gnxFnowWaSCVT1hrbdRWYg81bWla80YWv09lGZOeagZYN94pyNl/+9WOOJKD4KjlHJ8BSJ6D1VQwIX5SNQ7LE0aG8OuhbCjSSHu1MAd+epUfvzRc56Y6XY/kdkJwiCK4oKXF+VmuxrY3iVgc2/d6blB1cyRta9ynKDTI6nJdcJjX7zYhv71cEa7M1Sr1EOTTgc6Mj3NywCx8naqIuUu03Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbFLIc86qhZtS6AqFt18YG5NxzDnVKEfEU/tjDTJ7Aw=;
 b=AAghmSWeunZ19E7tM7JyJvtxzosXZa7XXCAyo9Zzn1IftKXZkuTt9NDqjT0kZi44yyip/B7OY40C53j+DMBoRAR47MerVW4aEhYL9rwX5FspES1/0xVxQWT/hoE5wpUl9YYsyClDfTF0CSl68X8er9B2LnOVON/CrTnzt1IdQ+k=
Received: from MN2PR16CA0006.namprd16.prod.outlook.com (2603:10b6:208:134::19)
 by SA3PR12MB7879.namprd12.prod.outlook.com (2603:10b6:806:306::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 10:14:08 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:208:134:cafe::50) by MN2PR16CA0006.outlook.office365.com
 (2603:10b6:208:134::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.16 via Frontend Transport; Mon,
 20 Jan 2025 10:14:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.0 via Frontend Transport; Mon, 20 Jan 2025 10:14:07 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:14:04 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 7/7] soundwire: amd: add soundwire host wake interrupt
 enable/disable sequence
Date: Mon, 20 Jan 2025 15:43:29 +0530
Message-ID: <20250120101329.3713017-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120101329.3713017-1-Vijendar.Mukunda@amd.com>
References: <20250120101329.3713017-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|SA3PR12MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: c6eb9e7a-6849-478e-d23d-08dd393b2d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Hw3j0RtrPdGR55k3tGdkHAHv2TLk7cCeefRRpSj0VC12JTLyKc5ZVVlOkPM5?=
 =?us-ascii?Q?gUT5rove8K2BTTrr8L+v1rwXRsV+NaKgr4ksCBL53ohxHaKbij1hCFUIt/u5?=
 =?us-ascii?Q?GonsqNXq04qz1ygT7GvUjoGgBN6T/ovMgMC05TaiLOZ/20x4YNcBO5bSiTCD?=
 =?us-ascii?Q?mewS8M6EAvJZc2RruvcFsR/xUwHeph8x10xw3C0eTg5x4X/P7wZIePmB+0pe?=
 =?us-ascii?Q?7OTjSMYD0aWzOne6PVPo+g/m9ByYpTz0yCMgU3ORP+fDnGs1VKSyELFeyPwq?=
 =?us-ascii?Q?o5RpdPgztB1EXQC4+rhPRCkicagkZV/z2pqf2Xv00GEOgUeYrGH/w2JvZ/qy?=
 =?us-ascii?Q?nkQQEV2dCYg9BjpbgCk7fL4aGexr7quCF3AW7tKljF+rywcU22/Es+ohha0w?=
 =?us-ascii?Q?16QYFuXHVdFCW5d3WwJZGu2ttGRkasozqTE6oTV1uT23rJJSlelfbdV0JB9L?=
 =?us-ascii?Q?T7VtTJhIkIQQQ4VE68pkqUOvDp5/3bIMztFQ8qCMADUxjwSpmZ9H5RF3cs+Z?=
 =?us-ascii?Q?QTIaTqfItcPvB5omCXlyi6r2WbUSR/4v4F81iWoj/ckBewqAavuLi1MnGeo5?=
 =?us-ascii?Q?U//npQGk10y5zrLQFKM93aT0IOqqlPIM/Qp3c3b1FgX8yTqIHwn2wdIBdFOe?=
 =?us-ascii?Q?EFEupETzUUg5YwSiO/VDINjFCCmJk0aK+oZ5c7Hp3QBTpli5/z659Q4htdDR?=
 =?us-ascii?Q?QAdUfJSF6YLynhWOnf+zNx/d1qKjTtGmwdmtH6NAAmDgBobn2G2Y//OxNZgK?=
 =?us-ascii?Q?S8B/DSOLBY341BKn6MUb56iFZf1KnsL8tzElC7sOssrT05Pcpvn8zSw3N/ko?=
 =?us-ascii?Q?iC9KOOdf6QGQ/uJ6O+vaYOCYEqsER2bGBZlDt9BCjyxpSZTCmAZ5L6QAYKzY?=
 =?us-ascii?Q?JEhK9wqSt9jLMxnerIiHcQY4Kev5Fej1V2zBrZwMIGGtGjl4GX+4FJPoe3S+?=
 =?us-ascii?Q?2DB1LpZaZTvILHUf5iyZwPudtIwy1KVIpDmP7uywVWPWXoFykVP06o9iuubt?=
 =?us-ascii?Q?NBMnzmb48U4viKJWBFELYbf/vRaB5ljE2NfbkayjcGigeUuSqZFZ6v0f2lCM?=
 =?us-ascii?Q?3kZoiNtCpWKz8foM6jKOeD9/J3hR4r8Ok8sQWzKKz/tPOtJfAAe2EKsySdR+?=
 =?us-ascii?Q?JEXaI+9eQ1KxV59Ii3rofO0rTZiOZe9TtnI5OEH2ca9xW4CwC/B0bnmdV5w8?=
 =?us-ascii?Q?FG+FxZKueN4/k+zArXr7Ey7PAI5H/EgzTQIewiQ56DNBVylGjzCPM30LLgQD?=
 =?us-ascii?Q?BdH1FqS1SJ/2pcZyokEUSJ1ZIpiin8ygXk0GvfGJ+k5bwxpjIBqxhm5Gf6k3?=
 =?us-ascii?Q?SFscniz+GajeurMiW9V94K7/gZdkL8JqAXpq9eBAlAT/AIPR89mGg5U2L4RK?=
 =?us-ascii?Q?6+ZWtiEJM0EnlpV3spQjKN6Q/2FdkY3ZczEqLEZySxq+GKXGxGhrlQYsNXj5?=
 =?us-ascii?Q?ennrLumWdlIJzkZEtg03qcp/IDbKvsafLGk+7AxChUbXD4J9KQOG3niMPSn4?=
 =?us-ascii?Q?ditAF4iJBVy/c4c=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:14:07.6801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c6eb9e7a-6849-478e-d23d-08dd393b2d01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7879
Message-ID-Hash: RCXNZK2IKOCI7MRUIP3MT52P5Y2UZK3U
X-Message-ID-Hash: RCXNZK2IKOCI7MRUIP3MT52P5Y2UZK3U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RCXNZK2IKOCI7MRUIP3MT52P5Y2UZK3U/>
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
index 03c9e15dce5b..161d963c80e6 100644
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
@@ -1186,11 +1214,21 @@ static int __maybe_unused amd_suspend(struct device *dev)
 
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
@@ -1224,11 +1262,21 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
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
@@ -1269,8 +1317,18 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D6DA16A9B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:16:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38D8460250;
	Mon, 20 Jan 2025 11:16:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38D8460250
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737368170;
	bh=8wETD2CiblFdPNd7uMR2vz+JsM3atB2zGzf2bM4jXII=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fWuErxhAnEQpidPB15S60VK3F2fGCsFZ4rB487LFZw6haf/EXOM1vofYv66oVzPDp
	 r/Ianc28TebOZG/O3EC8+waF9Er6chFdP1Wwzgf3nsL8effaAra1X+t/OiRMrQznVF
	 sz+sl1v9uH3ZJhrQlge3flhKYK2KbTzRoxlDwCC0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC12CF80640; Mon, 20 Jan 2025 11:14:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E3ABF80639;
	Mon, 20 Jan 2025 11:14:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02915F80533; Mon, 20 Jan 2025 11:14:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC44AF805AC
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:14:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC44AF805AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=AKhEuQ1I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tninXX1SWmr9mLMbOTuLAmTQpmoKN51CtZjQxdE9xp5z3eAL4NkF4GhJjUD3RvbQVzOQeJsVVlgP2foP5FqKMprlIEvklH28CW05YQpq6ovcg3sam41PgEhUKSawDUCPzeP/Le9cDIlwZsOiUDW6LDNnKgRU8dyolRiQfC4VUaooAEXdwnQs9vtUSWcmIsaO1r+lxKq2lkeT1rXNdghVWGDUV2tqyLZ+nMCqy6zPchxASt+HUKn4GD59H+1dLMic2d27zx3Kmx9gQWbjDfD+kBf7srtMIXZr25WqpbDSEUUVh33mzYXpte3CxRRP5sazHkR20DC4So/iL+6vP8hudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7sUVlFmCGQS8oRmNUor2lzsBlfZBpnlJn0jCCIImqU=;
 b=EE6suCAtT17IsSzVbnpzrSA0+q1MjYKfOJcQnhFWATqk424ws4Zq6OWU8sdz78eVsEEajHxgM2lpq9CmY5q9rO++X5ZTirQLVd86kX7zVYo3V31jlzq8iRs9WWB2fwkjefoJfAlCFsntea1srPDAQMkJC/okqlEAFGpVYbilcbziMlZAXKkwZWuG8XWhNrPKUYaH2BmrrvaqIztx5hVxkFVUe24bHkVY0eZj/efbSXVsx+ykA22MfNbXAQhuw8ET8q/T1YHu90VFV1wlmN9bgqywvGiC+/oG14FtJ/YVTqnwOlbpMlQmXqEvlzatw7nbnGn5b9is/mTIBfYtQH9nXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7sUVlFmCGQS8oRmNUor2lzsBlfZBpnlJn0jCCIImqU=;
 b=AKhEuQ1IxwwV6JHikEfN0cnfG+Ji1OIsWYNW99XUWZJKet/BQAB6I0xQsVhSYfcsU4vidqGn/ORBn6ZZGXXHbbx96DLGGRxk006i0KC2ZX9W4nFTMaeTR6ii05yLMlDWM7Aqv9yE1sMqAvVldrppLufHlan5vkZilPdEntOQF04=
Received: from BL0PR02CA0013.namprd02.prod.outlook.com (2603:10b6:207:3c::26)
 by SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 10:14:01 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:207:3c:cafe::a6) by BL0PR02CA0013.outlook.office365.com
 (2603:10b6:207:3c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Mon,
 20 Jan 2025 10:14:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.0 via Frontend Transport; Mon, 20 Jan 2025 10:14:01 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:13:57 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 5/7] soundwire: amd: set device power state during
 suspend/resume sequence
Date: Mon, 20 Jan 2025 15:43:27 +0530
Message-ID: <20250120101329.3713017-6-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|SN7PR12MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca63472-8b8f-4336-28c3-08dd393b2944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XzBrMfs0bGPIByjudBHF5kqmIkrxq6sVp57JqitG71GbHhrRblNNzNvH/m/9?=
 =?us-ascii?Q?XLQiOoKbLeTOqoveNxOQBv1pCzwfJScFnk4bD7pYqwVU0ToEZgCkxSwsTqhX?=
 =?us-ascii?Q?fAedBGjd41ChKmNPr2sB2ZLLACSOvshHvUvwYPQ0bJ/hTjpCccGjxsp8nx2X?=
 =?us-ascii?Q?VU1eUmUlY4wYOzPdabmIxlYI0tLgjxU4Hno0T3EpTK0vVV3K9Z6vc0MwRBZj?=
 =?us-ascii?Q?MhYT3Hnmg9FgOVFSWszjbvCWHPubcqyj4jrvRk+4gR867w0KFvo7N/T9/XDY?=
 =?us-ascii?Q?Zp0prKLFBYeRB8hCIDQ7GQduz9pbx2jWWF001bVbB176QgrsFBlKIzIMsRXa?=
 =?us-ascii?Q?vMKBthtSkZkcMWkCk94fjXI10kk1h0YX8jpqs8oiENi+DSRG6nTEQTZ6PCG6?=
 =?us-ascii?Q?kf2v4xyKcr+RYYFjzzEt1wY+E5sY2XH5rVHGNqrXhdogsqIvttn2jZLa4ZDu?=
 =?us-ascii?Q?tm1sjm/J7VkH7FxCtWezNJWvzM/tedE1qFmRwyRPcEEZC8zoOXgWEksnw2EZ?=
 =?us-ascii?Q?dWRuaDWE15LEVBcvIrV0WorR7bvzeQUmh3NrR/IvfeGo4PCIqZKYMzVrgF4T?=
 =?us-ascii?Q?86z2OP6JMRgInRqLeOLUZynEBaOLFo6f84qo4imzmueorScCC+hinagbyt8i?=
 =?us-ascii?Q?m8daPG+PChCkl8y806pXemLBUytnSYW/uoPf3ezSFdXS/NLrU1MR+fgJGvQz?=
 =?us-ascii?Q?mMqjTARdDS0Zp4fh+TfNJd7NPinAmeNiLjGQ3mepE4gIo0OnJ7nd8JYkbOr/?=
 =?us-ascii?Q?+liFZDmjZ6wxzn2D8acViCQxqoGK3N8AmsmYnmn3wEqNWYN/NX4ETFCNbyMk?=
 =?us-ascii?Q?Opi2Hcv1Lak5snCLu+HwVxNxaMUrOdMixVGWr8MQJbJQW7pQoKE31gBl5tr0?=
 =?us-ascii?Q?780WPYcJl7VkZ4L1tQ+j+xQ2J6LZrwBfJVX33fccu46lB6jkDpxt6nKqwRUS?=
 =?us-ascii?Q?kQN+ngqxtVctmKhG+6dj/UVNRNvdhEy5Gf9DZLRovZTJ7I9arSsro/axl3mS?=
 =?us-ascii?Q?k5B88yKeXGDWL55GEw6hVOm55JO7ABm4yqTaRLIbS1GLE6ab1JqVS1RDgMGN?=
 =?us-ascii?Q?kOQWrpWwC86sksGnz35MTPyQxist/dsdJML7U6cyjMo+GXjWtOVudqxI7AWK?=
 =?us-ascii?Q?x5MHSb47ojdjddyRgUqhB02b0Sfjz6UY+ChPwwwNWj/lFJThyYQLAbimlOKF?=
 =?us-ascii?Q?gKJgNGpFNLZxwKI3WjPO1ZaMj+cYorM5VfanyMEmIWd+7jc92E5/nLKSS0tv?=
 =?us-ascii?Q?SYOE6R2hgSgDUJtqTE3BOmYnS3aw6VOdU8AHJJuP2IUiBI7J0V8QNQIlTVmw?=
 =?us-ascii?Q?z05odXmdReJgWlnb2JFKIBGxXPdfptN/Hf820QFuFn0QP79dpRpUd8ZRxIMy?=
 =?us-ascii?Q?7glvSy9AZrQty1xrSHKxL5zBVhRVU0DiQmsVgA45G/eiBoLDqTtQeHfuIT9o?=
 =?us-ascii?Q?qTN9yriYsRsMrYFBH9+R4sNmTfm9RkEBUfRjedYjfIKVc/KJIAB0C1bkCnUt?=
 =?us-ascii?Q?yOlav4R/Cdk2q7c=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:14:01.3883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8ca63472-8b8f-4336-28c3-08dd393b2944
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8059
Message-ID-Hash: XGGOMBVBMCF2EYV4ZMVPXR67NOESBZ5C
X-Message-ID-Hash: XGGOMBVBMCF2EYV4ZMVPXR67NOESBZ5C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGGOMBVBMCF2EYV4ZMVPXR67NOESBZ5C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Set SoundWire manager device power state during suspend and resume
sequence for ACP7.0 & ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 58 ++++++++++++++++++++++++++++++---
 drivers/soundwire/amd_manager.h |  5 +++
 2 files changed, 58 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index d611498d5488..42d553878e91 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -143,6 +143,29 @@ static void amd_sdw_wake_enable(struct amd_sdw_manager *amd_manager, bool enable
 	writel(wake_ctrl, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
 }
 
+static int amd_sdw_set_device_state(struct amd_sdw_manager *amd_manager, u32 target_device_state)
+{
+	u32 sdw_dev_state;
+
+	sdw_dev_state = readl(amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
+	switch (amd_manager->instance) {
+	case ACP_SDW0:
+		u32p_replace_bits(&sdw_dev_state, target_device_state,
+				  AMD_SDW0_DEVICE_STATE_MASK);
+		break;
+	case ACP_SDW1:
+		u32p_replace_bits(&sdw_dev_state, target_device_state,
+				  AMD_SDW1_DEVICE_STATE_MASK);
+		break;
+	default:
+		return -EINVAL;
+	}
+	writel(sdw_dev_state, amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
+	sdw_dev_state = readl(amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
+	dev_dbg(amd_manager->dev, "AMD_SDW_DEVICE_STATE:0x%x\n", sdw_dev_state);
+	return 0;
+}
+
 static void amd_sdw_ctl_word_prep(u32 *lower_word, u32 *upper_word, struct sdw_msg *msg,
 				  int cmd_offset)
 {
@@ -1163,7 +1186,9 @@ static int __maybe_unused amd_suspend(struct device *dev)
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		amd_sdw_wake_enable(amd_manager, false);
-		return amd_sdw_clock_stop(amd_manager);
+		ret = amd_sdw_clock_stop(amd_manager);
+		if (ret)
+			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		amd_sdw_wake_enable(amd_manager, false);
 		/*
@@ -1173,7 +1198,14 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		return amd_deinit_sdw_manager(amd_manager);
+		ret = amd_deinit_sdw_manager(amd_manager);
+		if (ret)
+			return ret;
+	}
+	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
+		if (ret)
+			return ret;
 	}
 	return 0;
 }
@@ -1191,13 +1223,22 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 	}
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		amd_sdw_wake_enable(amd_manager, true);
-		return amd_sdw_clock_stop(amd_manager);
+		ret = amd_sdw_clock_stop(amd_manager);
+		if (ret)
+			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		amd_sdw_wake_enable(amd_manager, true);
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		return amd_deinit_sdw_manager(amd_manager);
+		ret = amd_deinit_sdw_manager(amd_manager);
+		if (ret)
+			return ret;
+	}
+	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
+		if (ret)
+			return ret;
 	}
 	return 0;
 }
@@ -1216,7 +1257,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		return amd_sdw_clock_stop_exit(amd_manager);
+		ret = amd_sdw_clock_stop_exit(amd_manager);
+		if (ret)
+			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
@@ -1239,6 +1282,11 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 			return ret;
 		amd_sdw_set_frameshape(amd_manager);
 	}
+	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D0);
+		if (ret)
+			return ret;
+	}
 	return 0;
 }
 
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 30244a31c21c..8430f279d88e 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -194,6 +194,11 @@
 #define AMD_SDW_CLK_RESUME_DONE				3
 #define AMD_SDW_WAKE_STAT_MASK				BIT(16)
 #define AMD_SDW_WAKE_INTR_MASK				BIT(16)
+#define AMD_SDW_DEVICE_STATE				0x1430
+#define AMD_SDW0_DEVICE_STATE_MASK			GENMASK(1, 0)
+#define AMD_SDW1_DEVICE_STATE_MASK			GENMASK(3, 2)
+#define AMD_SDW_DEVICE_STATE_D0				0
+#define AMD_SDW_DEVICE_STATE_D3				3
 
 static u32 amd_sdw_freq_tbl[AMD_SDW_MAX_FREQ_NUM] = {
 	AMD_SDW_DEFAULT_CLK_FREQ,
-- 
2.34.1


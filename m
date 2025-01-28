Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E665A20486
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2025 07:38:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95E62601C2;
	Tue, 28 Jan 2025 07:38:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95E62601C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738046312;
	bh=K/ycwqafH0Hq9XLjlelD2muJIuptuEyTWZjWbo3IxP4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=peHHx1kH4MXqjeYxdj2YZb7h6paIC7uVTl/rSJtEOxReyrD8L9CbqfhuOVRWCypP5
	 XPSsaXs6emBwEgL68QN7BppGnm5V9w6DjeoXA/fGiLaLuytokNKc8vGLe+ds3v7wVS
	 GPQz+vHfJIjP9q4jYJ3HmQAmrnCLusJKJkPruafA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62638F8063D; Tue, 28 Jan 2025 07:37:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18A77F8063D;
	Tue, 28 Jan 2025 07:37:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA86BF80611; Tue, 28 Jan 2025 07:37:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::60d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6AD4F805FF
	for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2025 07:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6AD4F805FF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HRtIF9Tf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8hcImX7GDzMMKH/CIWTEqQzDBzAhwY6Ynk3L1fVNuHPW4EZooNq14Y+zLtKIBhjvg8Ts+5gie/ZFFISz6dowwpdtYxVlhPFYrUMlXFEoQM9wnbz6zHDkF2g1ln8XPQBsQECMCEHY+ZsYQEoYbxAXBghjHQk1oYXzptowmxBFSlphOw0lw84WhDNwA02j1/pN+79/J5XMe21ReRP13TFf6ynpuOUlNxBYsOm8HWE5R12YREnVWJtZvxcq041hDUZG3ekdcoO0it7gOsKxHXyBftrnb2BWWReVNj8KJ+nCF/Hvr6B7kYSv0qzFVgzQpY8B/852yvqHHUpaFQG7WGZZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmTY1EfWyuIScVRUmZpYGys1H55wThfmAk3qY1O9pBw=;
 b=kT/iWe/1CnzpamT1JV9EqznXUQxxzlxyBVRj6AzdcR7jm2U8p2iGbb2NHQ8O1fFTnoDxc6Sy+pGUcXOzBLA0Nm1wNYz5fHMoMcosagWv72mrqFX+OzeXzGiHLYIqc/xUgBPrAjwrObd86GiFx+1QhdIMySm4yx9poaAuhpKcbEPT1xkvWXjsiEfSaWJZtkNMel+1aZ5UAd1BfhRhh14wbD5jY/F6Hi6s8zkDh0kNGesYaGNQK3JOiX8TWYiFw8Ue+hMubtIWSY/XlxzUaVvPgdY8ilIBN7BFYC3pjqtlH1mX7fWBXvkASPPZ9+7LZKTuYl8qFCNrYGPwlsmSS35D+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmTY1EfWyuIScVRUmZpYGys1H55wThfmAk3qY1O9pBw=;
 b=HRtIF9TfRzTQsf7AsSaylzn0PU6eOHkmboGJV7QBB/F96c4ODPPPySUeQ45NFCpIB6DTse7e0ihn3GhY+eTHEkf6sUnRF3OlDh9xeJogmU3BpK8AsyYKLfkaXJ9ySwqoKxJC4S0XQSbuD0sCn26fQ/iNm23ZJ1X5gyvr3HD1U7E=
Received: from BYAPR08CA0032.namprd08.prod.outlook.com (2603:10b6:a03:100::45)
 by CH2PR12MB4101.namprd12.prod.outlook.com (2603:10b6:610:a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 06:36:55 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:100:cafe::1e) by BYAPR08CA0032.outlook.office365.com
 (2603:10b6:a03:100::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Tue,
 28 Jan 2025 06:36:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 28 Jan 2025 06:36:54 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 Jan 2025 00:36:50 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 4/6] soundwire: amd: set device power state during
 suspend/resume sequence
Date: Tue, 28 Jan 2025 12:06:22 +0530
Message-ID: <20250128063624.1922470-5-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|CH2PR12MB4101:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea1db1d-f7a2-46c9-d8d3-08dd3f66282d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tXJ3lNLJXido26boC87UlO7E5XZvQ5hLsI52e+Yj/4r5ZCf5SLYvfEL6leEA?=
 =?us-ascii?Q?U4hYtqyJBA7XeM46k5Op0PvyghW/vUYlKtIpotW7xspX2nmAguG+DX8eHpEo?=
 =?us-ascii?Q?iASRXrpIQ9apevJZ9uvyZb3uTUaIdeHkw//+oQBCtp3mJlLjLVHVZULDQ/CJ?=
 =?us-ascii?Q?TcYd0RfHUTqZBxUtc/3Z9/55wlqHDNdOvYIbFUKqJHQDSZkAdR4XaoeEk53M?=
 =?us-ascii?Q?b0QVWquHErx3lvna7fEngdjQ+YrebIfa9l/VjwFMUzSgXRsoeshDJkwNKlQ1?=
 =?us-ascii?Q?jzb/zlBVLPmuzJMuUOEvb1oS7fNheniRNy+PwwUSVQzcm0RUP1HGyL3jN+pz?=
 =?us-ascii?Q?R8apHPr/MNzyTCpf5HpKnsEmn/7KDT4WGEPQunlV6fT02GZB63o0AaZqj3jn?=
 =?us-ascii?Q?EiAuzj3BY+z0lCjw5bZquFBrBoY7IXnggiI2Jh8OuItIy7P+XjEK8hJzymH0?=
 =?us-ascii?Q?D1dpFz2pRIA9jVkz5E/Butbh9CtQApZ8lplfTipgHw4AMN/+lMY1QH4+zdPr?=
 =?us-ascii?Q?G4EnPonPRbB6v4nnAyWR76sdpg3RB88YEBUtOfJYsuUEVYePwAYpf2y1RYx1?=
 =?us-ascii?Q?CCmeu7h1rB3kW456J7TqWA2+e86oPv9RBlGLw5neRij7qfn50ZN3TiTsu5E7?=
 =?us-ascii?Q?hP7FXauA8b/tECf4gIWmvkIadRKPPoUntEx16QibQIcMhLMk90LWt8v42SXR?=
 =?us-ascii?Q?qtv8nl5MG+8TWELEO8DteruvRF1Qg+ACSudV6gt3Cbp748wcIYKLcaMzdcKJ?=
 =?us-ascii?Q?5XCuVYddGESFs744MYZ/Hdss+DTjUnHWIebQWr2NIcGj+3rKInfkdk0G1XQs?=
 =?us-ascii?Q?IEdCZ7ty4C7z30UQOb7Mc8TGaZ5SonflHrLqw68yGP8vf0JTJKlOHKRFKYlw?=
 =?us-ascii?Q?vxzCOFJFEvyXtXuF7lGaAGC0S30wJufeED15AkLt4cMeANAHYVE5WtwPTN2W?=
 =?us-ascii?Q?sjahDkbapXzWHifJaGnjFyqgvUNDCwkP9Kq3NkhN8Sdc8riroiva7RXzre8r?=
 =?us-ascii?Q?ooo4LrOXvqPf29sne7BPhkNzvdXTvMyE7mk6wUP6Z66h+CXJ+WORniDn7ngB?=
 =?us-ascii?Q?qBbiSsQUfOS055Gf6C/JjL56nw4/xZnH2CduydMtLdOqjHkEd4mt33WBHyyU?=
 =?us-ascii?Q?uS/H92178ozBjxgHnk6mJHnI29nqrr4mgzEF9C1Zn6EnkC/mZydh9it+s3pK?=
 =?us-ascii?Q?G6S6GkGSA47ko1JU+k/EzCVwuMf7lUJxiDzjAc2pzquAXIejK9+EIxIrt2Ug?=
 =?us-ascii?Q?sbmCxXXP+IeyGzKxzsFZ9EdYLublmlESglD2VlQw1n8jZ8110c8RB38BSYRB?=
 =?us-ascii?Q?QBHoRr7FkgTmW553mavNVZt81EiaTJnIq6llP68sk2PXHcgxMiwgU/VsqoGf?=
 =?us-ascii?Q?Rl/uj0qovc/DGDD8I73ToFa71g9MZYA/+o7rZl12MqEBD3PIBAZC3THMXwIK?=
 =?us-ascii?Q?PyfF5OBZJBbSSm4K0yILcEtgdqkkDNdrSp4H21FawVMnW69UXqfiiw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 06:36:54.8067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0ea1db1d-f7a2-46c9-d8d3-08dd3f66282d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4101
Message-ID-Hash: Z6PTC5S4GNXZCDLATACV4XDJT3FN6RZ6
X-Message-ID-Hash: Z6PTC5S4GNXZCDLATACV4XDJT3FN6RZ6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z6PTC5S4GNXZCDLATACV4XDJT3FN6RZ6/>
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
index 216f495d238d..41ddb491601b 100644
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
@@ -1160,7 +1183,9 @@ static int __maybe_unused amd_suspend(struct device *dev)
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		amd_sdw_wake_enable(amd_manager, false);
-		return amd_sdw_clock_stop(amd_manager);
+		ret = amd_sdw_clock_stop(amd_manager);
+		if (ret)
+			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		amd_sdw_wake_enable(amd_manager, false);
 		/*
@@ -1170,7 +1195,14 @@ static int __maybe_unused amd_suspend(struct device *dev)
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
@@ -1188,13 +1220,22 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
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
@@ -1213,7 +1254,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		return amd_sdw_clock_stop_exit(amd_manager);
+		ret = amd_sdw_clock_stop_exit(amd_manager);
+		if (ret)
+			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
@@ -1236,6 +1279,11 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
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


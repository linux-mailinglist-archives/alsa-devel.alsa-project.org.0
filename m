Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9BFA2BBF5
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 08:00:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00A0060292;
	Fri,  7 Feb 2025 08:00:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00A0060292
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738911653;
	bh=7rtKWyNuZ/F9NaZyaIdVtku0Em4x47NurWn+hKvz0bw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z+RYiUMm2/A9DV7tuTKcy+jMLOS+/weFx5cAOYLgOFcTdJryuuLtezlc8KjYFOHfu
	 TUyeVoF7jDMurCobt6l/oWy/x1TVqIIEtq+gf+ZpRuDsqxZPGSI60kyQmp+jXCDCFs
	 bAXO+Z7BpqNQSakQOsY5Gf3aiM3ctcg2bldYzPf0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5982DF8065D; Fri,  7 Feb 2025 07:59:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 387C0F80674;
	Fri,  7 Feb 2025 07:59:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B33CAF800ED; Fri,  7 Feb 2025 07:59:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5454AF805F4
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:59:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5454AF805F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=jT7Gt75r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmkPukMC35cz2WahdUi5E8hQuxEXJpJeoxCVkHGwrbULzeFjUunG5gtcYcmonkVHudfuOXzArYiSml1ZiRiwuRaBpxCroTtgtU8r+iEsTADUwrS1y4FrrGETBuJZ1qJZprOLvWXJeM/c+ShE8EhRvjNP59805DB4eaL2u9WuIkc2IY3JLOGvhpA9PUzYqizJft8MlDaa27rry4rpamuuY8oCqD9LeAEh0r80aHSaIobEYteliK/qBidLCIL3vCZQUqVBtljIpMzG9NE3qEbrG/jGSTcBS0WBDIXH+K0qOe3jZIOfRl9Hn/LJtNuN/bZXo6Izqgxb1cknxkCwztnUyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/ge/koJFMj+eacI4/HEU2u0TsrlxDhbpt6H9gHDI9U=;
 b=dArQ6TR7ukV+ISCKbyarS59OZAQrVj3FwLNSosuOnKYE9TcH5PRoFPRdTdu8/rvI0/Q33EY8sBLvPzFZ9UbX1iuRhdvNCniEDvx2JosPp+MqH/YmKgHk6M48pCVBJIliBgoB+Dq5iyGQrducjm1NX1ZipVQPkvgfYRi4JUz+TqcfRebyYrb5vRSk4oUwf7tN5RG9DfoSUp38mjIl6uo/UbVcOQbBloMcCuPwr2cuisrTLfB88WtKXy7ESqviAcmv9fLSK2J0try4OOGutlPrcU2PNDOwqx3tKIeXKP0/T/s09rNRRAr/eOXsX0hmZfak4/r2E3fKa3Sv5Vt03/lF+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/ge/koJFMj+eacI4/HEU2u0TsrlxDhbpt6H9gHDI9U=;
 b=jT7Gt75ry5TNkZVH7lZWgtva8GsVRN62kL0LGsWKjUAiBSBbVfva+SUpkuXeoIkRXmn9QpDSjgH6j099RNSKBNBCweXsXbxTFzYBFNqvw4wbpArBvFwXSR6fK3ZlJYbUIXHmSRwOINsAv/Q7FLDU7+KhMNtZj97jEKMsJ/ebO94=
Received: from BYAPR01CA0008.prod.exchangelabs.com (2603:10b6:a02:80::21) by
 BY5PR12MB4225.namprd12.prod.outlook.com (2603:10b6:a03:211::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 06:59:15 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a02:80:cafe::6c) by BYAPR01CA0008.outlook.office365.com
 (2603:10b6:a02:80::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Fri,
 7 Feb 2025 06:59:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:59:14 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:59:09 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V4 4/6] soundwire: amd: set device power state during
 suspend/resume sequence
Date: Fri, 7 Feb 2025 12:28:39 +0530
Message-ID: <20250207065841.4718-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207065841.4718-1-Vijendar.Mukunda@amd.com>
References: <20250207065841.4718-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|BY5PR12MB4225:EE_
X-MS-Office365-Filtering-Correlation-Id: 136130d2-1d42-487a-3d00-08dd4744eee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BjBKJOdQkzU5/8oafreO8r8hSm/4BqQ5CDA1+694jnrZS+NshM4FGLGwB+Qs?=
 =?us-ascii?Q?wVozuKH3P55KsuZJ7U70lLGV25uD1+k6e6NYa2Kr7rV4mzBcrn+f7eqr8qMb?=
 =?us-ascii?Q?F+Iqi37zsPSUzJhfQKu+zQfgAanFzcybcQJKcEazJCLDc92cTlH3INudaOwA?=
 =?us-ascii?Q?aCnvfOCcKxG3VWHqOrFT+dhTo3OI77TZqxKxAYy7mPUTjui7pBA7R7kUN7gX?=
 =?us-ascii?Q?cf2pRqH7K5xqUgAqr/DDIjfzsElDEQJHAvTMTTP2rIUGgx2kDm5AwgPQqjOH?=
 =?us-ascii?Q?zQGpEtaS7ye1t6rjOLMgoG0q0W83YOUWYqtTYid8xxJJvetjjtNjuQScCVFV?=
 =?us-ascii?Q?BDH8MEvf3Spt695Wgpe/dFUBQzCAW4aP9R3a+OWtNsEY7He262dTWsDddEoJ?=
 =?us-ascii?Q?aFEWBNe4UWUGb7o+OQdxxU67+j0iyVxPd22LWwXKe7kXz4p/MlG7fwfVP8tj?=
 =?us-ascii?Q?+v7WkPg93L240yy6cTYpv0TQAGo2l/dm//hwObN9anoGinyMHslCEx2nDkX7?=
 =?us-ascii?Q?hbDfb0t9CYWZOcrpxEpeeYOwUnbE7NxpULkhedEXaeve3GPC0qmtLQ0zyl/A?=
 =?us-ascii?Q?PM7O8jSDhXO6OeYxGAa6b6wZZp2F2onBewjEKVgCWkiw7l6XXdaFzK4kmzoa?=
 =?us-ascii?Q?JzufG4ypxELhhmPq7AjXt9LyhDcHKBABy/bUWOqWnsdfFatUq5zHMGhcOqQo?=
 =?us-ascii?Q?lwT/oQ4979q5NjviDXjN1Y4sFTwMpjm0KIRhGgbnhvA0n5g5Zh/tdnhZdHvV?=
 =?us-ascii?Q?0Fi6F8GlpwVM9fDokZdC3J2vcqBYGHheA2XD47Hqm+BbWugCI2U+ZXTXpytK?=
 =?us-ascii?Q?bgBHKAbu8uZuTZucOnCu4bB43wHf8mNSoF7kv3JmIvaEJj/YeJKOXxZc4eP0?=
 =?us-ascii?Q?//irnE3Ipd9t7ItF4+QMkoX4t4kjEZegEVhNya7UvkGjZTy3dDDJA4eRjmIH?=
 =?us-ascii?Q?XjYycHdyWNWAYtu0qSViKgT5YL0LGJxG9j3C42nCGnLYRD1PuyUVlOj/Kjtu?=
 =?us-ascii?Q?+aQVxdGOGZUP504jeC8vHeXKabczgKjZHa5aOVcBgu3OtPnAlefV0yy/wr48?=
 =?us-ascii?Q?JSGolkCXFg+8AeuktBwRAWjdlRaSRk2o2D54m4f0VO6loVBwtGIK74iN8iPo?=
 =?us-ascii?Q?85+rJY6Kbljfh0r3JbG6b0QwUGUCBgZsj3lSXdDWTwlbr77Ser5/tIoedqRl?=
 =?us-ascii?Q?IeGfijPpQVu8rZEIYC7jPftJCldhhEukj+YliaathBbaavtWth7zVnuyRAMm?=
 =?us-ascii?Q?mDGMTZtb7uQcUIVJvXTSZYDqOLEcZjzwVvymcnCEOGPt10rGK0xMUfiZt2G8?=
 =?us-ascii?Q?dV8pqN0rGQ9jVv9fdgTYKKYbDCqcGc5ebnVQuC7ReMx8SUdRogNCtHuzh/Uj?=
 =?us-ascii?Q?BE+cJFlKg6J/GNGtKK5OIif//1RcNlgiRET0rr0tdIOtR5eepmF5jViC2VfK?=
 =?us-ascii?Q?akG+U/1Vxhd9RNusyYrPY31ZstD+jLUr8Z3SpEgrEDUr4VzbRPfixw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:59:14.6068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 136130d2-1d42-487a-3d00-08dd4744eee2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4225
Message-ID-Hash: K7R2AZMBWWVFUEWFDG6RDU4BA3KYKQUU
X-Message-ID-Hash: K7R2AZMBWWVFUEWFDG6RDU4BA3KYKQUU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K7R2AZMBWWVFUEWFDG6RDU4BA3KYKQUU/>
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
index a1ea7b95b4ce..cc87e77f1dd7 100644
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
@@ -1159,7 +1182,9 @@ static int __maybe_unused amd_suspend(struct device *dev)
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		amd_sdw_wake_enable(amd_manager, false);
-		return amd_sdw_clock_stop(amd_manager);
+		ret = amd_sdw_clock_stop(amd_manager);
+		if (ret)
+			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		amd_sdw_wake_enable(amd_manager, false);
 		/*
@@ -1169,7 +1194,14 @@ static int __maybe_unused amd_suspend(struct device *dev)
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
@@ -1187,13 +1219,22 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
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
@@ -1212,7 +1253,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		return amd_sdw_clock_stop_exit(amd_manager);
+		ret = amd_sdw_clock_stop_exit(amd_manager);
+		if (ret)
+			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
@@ -1235,6 +1278,11 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
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


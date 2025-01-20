Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF481A16A9E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:16:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE68D602D7;
	Mon, 20 Jan 2025 11:16:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE68D602D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737368194;
	bh=PmCZ+qQRTU8/grVFFej73TMT40nwC6JcaTZAK+n3LeI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iMcuRtT7oR0eUMOULD4WZLU5ChCidanJQWLz5CdG5EAmdNl2OtUyM/uodfunJANHg
	 2DfQv472mM7tdkrTWucTdJpMRhbR3bVdeDZl6vp4o8QnIKj8piFFv6N6e4/eC8Dko0
	 2TY5SMQJO7ZMwbreA063DchxpZweGysPPgwdkU1s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 948B6F805AC; Mon, 20 Jan 2025 11:15:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D362F80533;
	Mon, 20 Jan 2025 11:15:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE4C6F80533; Mon, 20 Jan 2025 11:14:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::628])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C31AF805AD
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:14:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C31AF805AD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ThF2jBQr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZ4TZqlxqMWCnC+FXDMMENsMwLsnOHBJ8caKp4LkVNte3bPe2e3zpefqIlCxZTs7MGL4uTGTIAT7utgyGT6BeCC63wO7TTgG13WvJ0LDg/KfqYy2qXrSYjGFTA47EIjJ3LCnD9WBsegul63maWlv4uDftvoe1eO14Vf0PLruczJ66lOysGNkS7xf9NixGlZdff/RB8oF7PxZJMPrySo04INWSfUpwUo3IekWcBSuxrFXGjfgq0EpYcXKclqxIi1SyrkCowqEhQnqN/S7JApNhC2/Ipf/vFak4m7Qb4e0pw35dtUx2alLkKbs1xU0q/B+wwiqkXBTNRXYFSB3uj/Sqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLkOkOZ1VicUSKvl1HTnRINVKm/zN1CSPOC9j/hTe+E=;
 b=jG0ZfSKcfqsiifG6zMeK1pK/kPbcb95LWYNrpngWp9fGMLAF3JDoZDVffYGHcGL+zKVEV8gocFd3siptxu8mujhbq/6QqWBDebhK0iLxBljPoi5LPTFyiCDTZA7A3Lk+1o3KFciNJyPzEMx6VeZWs0TJVechPVzf0reOWQvK6kWXCQckyDH/eIxgm8leZhIU4SRoenUq5u5D2q1bWcWBMfRPNz4xmtqfO/PYmmWjzPagPPyOL7ltaRusIoT5V19ysLWn18SUfdmwKUJgALrIdJ4hOe2/UCHf+ZbsyNr9Zdx8g2gyIrhsRTvYy/+aZsVmGPAShRGckP7IF/6m3jeVKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLkOkOZ1VicUSKvl1HTnRINVKm/zN1CSPOC9j/hTe+E=;
 b=ThF2jBQrOO2nNtPkkn3MyDBcb+Ay9SB6ppbvWnAmulLqpseOagyymgBlpp/hNRIQO6QG0B2yfRR+Q4v/8Qw/MvBJKZbbSAC+oz1ZLq40cZj+WkTE3lqLGIZ8jyuEwN1I0IjU09IbqELeiiupLs4Jb3oe/a0LjgiumO1UpU2JSp4=
Received: from MN2PR04CA0007.namprd04.prod.outlook.com (2603:10b6:208:d4::20)
 by BL4PR12MB9480.namprd12.prod.outlook.com (2603:10b6:208:58d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:14:04 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:208:d4:cafe::18) by MN2PR04CA0007.outlook.office365.com
 (2603:10b6:208:d4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Mon,
 20 Jan 2025 10:14:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.0 via Frontend Transport; Mon, 20 Jan 2025 10:14:04 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:14:00 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 6/7] soundwire: amd: set ACP_PME_EN during runtime suspend
 sequence
Date: Mon, 20 Jan 2025 15:43:28 +0530
Message-ID: <20250120101329.3713017-7-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|BL4PR12MB9480:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a9eac20-5ee5-4316-8f32-08dd393b2b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ld8jnXD6yWPM5jrfrGTrjQQBt6EfXt5/JIdujgkvCuy4bY5MF+uptvqCMN08?=
 =?us-ascii?Q?k5RSvSIgfpnpE1iCiqx1w+mjDfhHOnf+71mWIPR2KvMO90crfa6hUxe67IFL?=
 =?us-ascii?Q?wBLXFwjJjsagmPCIIE+xj81n5tsulOW8NJec7YHJLxNsWJNI+h6YdY3nhC8X?=
 =?us-ascii?Q?cFyHOQ3RzEL2ZszUa4qYJLvJzST0NJGF+WWrd3Bp+B7YQsFtBR8viB42XlGO?=
 =?us-ascii?Q?tWfSg+K6b++h4rxFWvFq15uvouNpIxrVmLimTPfvlCWPb8EWwRAFzqJD6YdC?=
 =?us-ascii?Q?kE+cCS58SJj+1cLVfuHP2FwqW4+2nzuWwwQTaz78l3LUMnXZdmTBrTGAGHdI?=
 =?us-ascii?Q?6n3N0wI0rK+WEqhI20kmhpr6tdvWEUYmS7JkWYvsvARXje/na2PKiez5vxpC?=
 =?us-ascii?Q?BTSgVVkebNiNaptRv+W7LLRy19BOvUtajJ+IzAfpni/bJ0cPVJ/27C76c8Ry?=
 =?us-ascii?Q?NKdRB4wnURqQG8BobPS1mBOUIHnapdhaSko8CHj6y/L8l6t1WEBmMJ8w3nIz?=
 =?us-ascii?Q?jwG+c+euMPAN1SGkYv7zvGdj3Ia4h5A4a+pq0AfOn+z0vwAdpfTlRdsojTLO?=
 =?us-ascii?Q?SBQxy0V/eDzF7XT/HxvKaaiQKlHnH6CWygaGM7Oc/ZDFdVAyZzyDDw/hYT7z?=
 =?us-ascii?Q?hHmZFqt8vxP0QyCuqusD5qUsb6ZCNbwsUAFXNAa/gsHydols5QRe5ea8MtgL?=
 =?us-ascii?Q?W/4SRq+U/BbUoyTp7AREMptNKpuPi9R6RkDj2VZ5CGWxjdkOYuAygye62vLK?=
 =?us-ascii?Q?2VPUEmt0pgQp7qrO7WQp/MnffIaHkcyUdpC5PjaVe2pxZuLxGomzAl4aA2vs?=
 =?us-ascii?Q?scb37skgsL7+eb8I3JgXtMMObOyMiH/j1bWQUloMtC/6/algB85VVbxjE8tq?=
 =?us-ascii?Q?JP21EodkRFkq0DkKqyePr56CVL+GgQlUKe8dsiYYkgVIhk8MHGbFjTl4hBpx?=
 =?us-ascii?Q?38mDeKjbGfJDAo97EtyO2eg3N6wGQKHkRji8Opb9hIIcaSpp48tYupXMZoA3?=
 =?us-ascii?Q?LmzQTT6KgIGGve4DqXXhx3zqcFgPu7WLxlqK3PYHTVF+uLog50WsuBL7zJj/?=
 =?us-ascii?Q?bZorv4QiN0V8FrTwfVLRDUdtBrisIKMjmv12zWN1rYcbuwQYz7SHo0DQQgHc?=
 =?us-ascii?Q?7vAG7ULpyjpA9jFpyOw2XJPm+b+FyTruaMiENMWbLrrKSaesaCwZyB5HE7LA?=
 =?us-ascii?Q?cTFDE+q0Salo2sF46pVsLqsUxJtidOcuGN0PLPurJclQYyqwZT1fTZ7RFtbh?=
 =?us-ascii?Q?W77myYqFz4EogPSGgZlPD8oEST6zlCh0Vn7KmduGmrGiMqsWzVptyayiEfSJ?=
 =?us-ascii?Q?m9LkWHUvlugZsVoj0TD71l3WoATDWp+GkFaNYiutYg3L8ogRmN6cJWs+0rIC?=
 =?us-ascii?Q?guHkRkbRTJY/one95MWAqktkZxGnLvgbsmk52Qy5gB2hozINWrNdkBbzpnzy?=
 =?us-ascii?Q?/iFe5dKdRZ5s99jBxM5X49BYvBZzqWcA49xkeiZViAhj+HStDxNBQlRyG0Qg?=
 =?us-ascii?Q?huXQqmSyrwI/cLo=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:14:04.3557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3a9eac20-5ee5-4316-8f32-08dd393b2b06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9480
Message-ID-Hash: SM4GSUJDXWKFGU4EFK2PFRSBTOUD74P5
X-Message-ID-Hash: SM4GSUJDXWKFGU4EFK2PFRSBTOUD74P5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SM4GSUJDXWKFGU4EFK2PFRSBTOUD74P5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Set ACP_PME_EN to 1 during runtime suspend sequence as per design flow
for ACP7.0 & ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 9 +++++++++
 drivers/soundwire/amd_manager.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 42d553878e91..03c9e15dce5b 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1215,6 +1215,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
 	struct sdw_bus *bus = &amd_manager->bus;
 	int ret;
+	u32 val;
 
 	if (bus->prop.hw_disabled) {
 		dev_dbg(bus->dev, "SoundWire manager %d is disabled,\n",
@@ -1239,6 +1240,14 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
+		if (amd_manager->wake_en_mask) {
+			val = readl(amd_manager->acp_mmio + ACP_PME_EN);
+			if (!val) {
+				writel(1, amd_manager->acp_mmio + ACP_PME_EN);
+				val = readl(amd_manager->acp_mmio + ACP_PME_EN);
+				dev_dbg(amd_manager->dev, "ACP_PME_EN:0x%x\n", val);
+			}
+		}
 	}
 	return 0;
 }
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 8430f279d88e..1d5e94371f81 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -199,6 +199,7 @@
 #define AMD_SDW1_DEVICE_STATE_MASK			GENMASK(3, 2)
 #define AMD_SDW_DEVICE_STATE_D0				0
 #define AMD_SDW_DEVICE_STATE_D3				3
+#define ACP_PME_EN					0x0001400
 
 static u32 amd_sdw_freq_tbl[AMD_SDW_MAX_FREQ_NUM] = {
 	AMD_SDW_DEFAULT_CLK_FREQ,
-- 
2.34.1


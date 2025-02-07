Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D792EA2BBFE
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 08:01:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C1DC602B0;
	Fri,  7 Feb 2025 08:01:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C1DC602B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738911688;
	bh=o5RpFRNyUAdMxcez9kpsMZoK08VE+2GqfZ7i6PsHtcY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l5ZAp0wd5SzwcoBhkRIpIwy1BYstaCkoPgsf3et0npIGEPMMlE+Tslrl1kOotUFYA
	 zI012/HwWT8aSiIU5SiiroDjJpC6kd+OHiMAzlLelg4f98C5rTCSNaOSdXKYqAAqXY
	 LwWTW9alnuMhrftu6ay7OpvIoqYAhjrfbqsbsvKA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36E63F806B4; Fri,  7 Feb 2025 07:59:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3B0CF806AC;
	Fri,  7 Feb 2025 07:59:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1549FF80679; Fri,  7 Feb 2025 07:59:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::625])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54DDCF8063E
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:59:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54DDCF8063E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=w7upvc1S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ee2gx3PrMI6/iUcDCVI2SOInmBLyPVfrh1e/cRuMT2yspe3rTKGeRfAEF4Wi0uaGlboCxrpezh1DNLCS1hJWafANkANbScp6c0AWd+kgiNeWOsH8DaWZfM26PCf018smV4UX+j1JbVPYZd5AnyF5qbFRh2b1hTpIyJQsHG8cn6/axSE5pqq2wOMn/wd8h3qKdL3ssHhCfA9+41nOsVkXu2fvb0Wuon9T476VDm0D9Q0LOUGisrANCUDJ+DpdtJc/3KR/79EguX4CybmC+C28ETwJC+e56Trm3pcgr6Cgare2vHvzjKI6bEDoznYwmm3JeU3eqWPFz0SfKelu7bVQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmv3S732E4bOpEp1y3xB9rfay+/HF6gbMTTyf8m925M=;
 b=GPKJQFuM48kewcxdBGfYcMd5dpqmp2oPIQ3MdupwdPFUzef4hS8d6Hl7f35fDk+dBAmWeAKctpr6/PaK7zkeVyGUlm9v1pxUdfZ35Dh7XCyVkQv//JO1tFvq+kp3GPtpHepXclfxcEgo0gshsNS3x6FnDBDVLSOJzlaxiNf6Fq6baXXzHXZk2/7PdRAg9fvI5yxV3IIdAdt/N7KxG6xG2OkYBQ3bDxYSnHyL5XdbHmLOUaIvH7LKZscsLzxeR8krM0YfmX+oN7QNfbKJxkZfRhx6CglUIwnNlk+2RHlf7LaF9kSYfmz5ZhRt7PBwiixccsDoNYdAzGdLWCmhsQdCgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmv3S732E4bOpEp1y3xB9rfay+/HF6gbMTTyf8m925M=;
 b=w7upvc1SQrO/a/6adHLqOp2Yh1IrChABFDjV2S5BQUFqkeLPZUkU4lCuArKViULqpClSLBelDKqTDZRGqnkgq4k9YDHEO29UUxioobbmJmyLsgbM5MV0G3P8ZPXgrCbT5xWTmfQU/HuIyamR7b9YeqOetXZEMFsQ2bNoNF8NFCY=
Received: from SJ2PR07CA0002.namprd07.prod.outlook.com (2603:10b6:a03:505::25)
 by SN7PR12MB6886.namprd12.prod.outlook.com (2603:10b6:806:262::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 06:59:21 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::a) by SJ2PR07CA0002.outlook.office365.com
 (2603:10b6:a03:505::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.29 via Frontend Transport; Fri,
 7 Feb 2025 06:59:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:59:20 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:59:16 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V4 6/6] soundwire: amd: add soundwire host wake interrupt
 enable/disable sequence
Date: Fri, 7 Feb 2025 12:28:41 +0530
Message-ID: <20250207065841.4718-7-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|SN7PR12MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: 892290b7-d3ee-4cae-6ad3-08dd4744f29e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AHOff5JKKrNsss8VNOprRKaMBkhlmFvjjvkFZE/AxH1kadGbxyj+MpzIGCIH?=
 =?us-ascii?Q?xwr9YQpcKumAnPJfujgu4CwyIFJrWFd1GAD/DFij4lttBCqkfw+ZunUIFHo+?=
 =?us-ascii?Q?A2ik2u9NqfB69xrpnJhS6zIOTDMIOjavKa5zi7t2NfbyI1j/6wTcGzSnwSm5?=
 =?us-ascii?Q?O9KkJFEmfTf56jgG5qGoXZm0HTi5p/G8bqw9wzCLaaqob+Y608E0aMjto9xH?=
 =?us-ascii?Q?ZGIU60BNXzv5vG5LSnkr+rkUfFnUI4qLst2Qfk1hEbPPXJlowmrY/JrepZkG?=
 =?us-ascii?Q?O6r+E0qcsXhhRh6gOjOXD1s5tcbvUf0rGQsbnssamqkrQDVk737Z1IzLFoOA?=
 =?us-ascii?Q?EZU4JtACxeZkJnlDOL1wzRxD2ZPOKFiu8u9dciqJNrHXeuziEufmjUx4K69T?=
 =?us-ascii?Q?7sSVQviWsjOw2AMmboc/o5oRAW3tDz0qeHaLRlNIpNUDq4/8TIcc7MktKim7?=
 =?us-ascii?Q?AetiRDvsbBbpGk3RxO5k6D2A4yHi8t1O0lUv+5hHHs/sUFiH19ZZQa4Cs6K/?=
 =?us-ascii?Q?pmyv5q+zxrh/W4NCvc3jb2KQbX41FW6iK4pUufn+vx6tKvXi+fBYy8Kf0exi?=
 =?us-ascii?Q?L37VSNHWOsyrP0b0ESf/In/+5cDtOqxfR3sumc3g5se/5fZU1CACMBCRPA2B?=
 =?us-ascii?Q?cn6tw8gR51bJUnjEORnPp5P6n/IIwpA5vk8SuPrSpymohqYNfIxUzsPvCVU5?=
 =?us-ascii?Q?PK+O93Gjn3RzKeNS/a+gMY74F6kzBp10ipGAAQqFWYjPnR+K5bg/Ma5bEM3Y?=
 =?us-ascii?Q?F8uH5BTWNnKkGoSa2Zq+lEQMwici0xiVsDHiB84zVLQ+ys6n+EepAODgwkJK?=
 =?us-ascii?Q?53LDJctC7Ze7pMynWh9/jRz83tKSpgVEb+8LDNDujHaiwQ6c9jnxua1h/dlS?=
 =?us-ascii?Q?sHfhT5tNRwg5OZi487kQW2HdjByzgbA1T3aDVYqWdZc5xi4sdUqDEmebwvpJ?=
 =?us-ascii?Q?N8kGdf70PidN5Po9HPgYtes58YiUfrYp24bPA3wHf83Obii9BFyeZbN8zRxu?=
 =?us-ascii?Q?N7ULu09uBjx5NmKs0WbhEl13miTt8YI2R7QOXxORFYTnVeHX+SKHUzN+MV8H?=
 =?us-ascii?Q?E6QVglffXLMbNgojzORBtZxLZZMAl3e5I8ByNnGMfQRhV53Jcl9VaW7hM9JA?=
 =?us-ascii?Q?wu/HEQdPtusYAYPQLxigxZsxsn9YljwZ9Wt6skNIt30tIiyzxaVLhfrI8A9z?=
 =?us-ascii?Q?TR/wqjcO0Cp3c8YxTgM1PJKy+oEc2zqCuJa+TwP3yqveF1BhbrUu56oq/NUf?=
 =?us-ascii?Q?rW0wLydmNn+pNlAqui+eX/QZz15MD5nFqc2BpDiUYRtAymEqKSGT8Th6G5YR?=
 =?us-ascii?Q?1as4EEdBiPMx8XCxaQ9uefJ4S4kVJl5b9stCF4uixd1lvV02ihVt/9uo2uI6?=
 =?us-ascii?Q?EsGo8J6bGJb09eJiug2yyx74taeFHyZFGbKyZK79DtpLi+e34c8dksO5BuUF?=
 =?us-ascii?Q?Wln/ierdem5klX53g17fOh0ukJvy2Gd62RiuHMv+rapBjP7ujcl0kykq1oT3?=
 =?us-ascii?Q?M4ECrWkYdk2J/jQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:59:20.8732
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 892290b7-d3ee-4cae-6ad3-08dd4744f29e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6886
Message-ID-Hash: ASUWHXS3BWQ5KWNITKSBTN47HXERT5LL
X-Message-ID-Hash: ASUWHXS3BWQ5KWNITKSBTN47HXERT5LL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ASUWHXS3BWQ5KWNITKSBTN47HXERT5LL/>
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
index d38b4baee221..8e74536808fa 100644
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
@@ -1182,11 +1210,21 @@ static int __maybe_unused amd_suspend(struct device *dev)
 
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
@@ -1220,11 +1258,21 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
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
@@ -1265,8 +1313,18 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C4788D665
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 07:32:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 953742BE5;
	Wed, 27 Mar 2024 07:32:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 953742BE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711521166;
	bh=U7II5aM47NjahBKXLENLwzvNOu8U2pQ6kAe5iSKHQUA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UTAs+K7+9dKZImqxOaTXpug4HVNtYj1/88740OH8zvRV8v/ca3i+nTB5eIM2E2gcy
	 A9atvrb0UWwG5b3JBaGYG6cKvPDWcr4CPHNxJ1vukjEpbanmGezvXO9d0xhlQPAts1
	 V9XZRXMCRqVPgk30/+EqMwnjX5Azl+iklwAmkXmc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C39DDF8057F; Wed, 27 Mar 2024 07:32:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F82AF805A1;
	Wed, 27 Mar 2024 07:32:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D71CAF802DB; Wed, 27 Mar 2024 07:32:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0C75F80093
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 07:31:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0C75F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=TtcMCMvU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKGli/ZKC6Kuc3751msGMY9283yb1yvvlfsuDF3ZxRqLxkG0o4CadHO+0iQrBdQvSVlMTdPmgD6R0dNZd/Thsp2ovlVr6xfoTy4HdKO48QqKWuNG9rtr6TCU460o0g+RuXoeYnx/9nHawbyvm5tY31QMIQDEUW0zyNrGVeDqKnkvIR5IDAheq3jld3PAGyOiWsDGAaPIzpI7CyzNLmBd5/6G+7UTwFEeT+HggbP1GF12fH9FnzyAh8Amxc5NJIYSEwEwY9/cWF02gS92LRGEoXDuQevZtlZ5WYEFHuNcwW1BPpowDup2Z7wDLWiFFxXsZe+PoFk83pIUPOxUXSOZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXZu2Z11hprHqioumay1wdgJxHF/1PqNLOVBLng7Eyc=;
 b=BTb5bwTv7+jcXZ8yRsifWxWwtfU3FQ3DeOqwr+GDmnZN5lkN7dI7Xhx9c31sDyyNy/HwDE+hF68rHMP6jXytTt6kulImriLT4cuGnUMQm1LNj3epA2TuHTTs7vj+brEpSBhAA4fcWcfkPfhOcpaDY7jzE5ZxM4PBtSmaJUBrA4/Y1aOxdb/OmACzeXNEp8SnNDtFGXLFhqsE7Fj4zEg7UgaqhnCoE10WZzbxoF4diuqs3NKoUn9vpgvuwDaWM/kQK2mAdlirRBqSPLvHYXVzn0HckhK7znlMJVb7qZSJuAPcv/iDOUFC55hBpS4W6mTNia/ToK2tPgu4615hoqHIhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXZu2Z11hprHqioumay1wdgJxHF/1PqNLOVBLng7Eyc=;
 b=TtcMCMvUcKclzyaEsfUlzWqP8o3w7xTWjphuUSMSMnSJkc4pbRP43VTcL+TqckJxp9Zp2Xw7152cHODZ75j0y4PduScJ7K0s7CuJsEYN5uv7KBxqFG6649JoEGV28QSYjJNjkkXTm+xjGr7KEiQpMxvUw4GtIblwTB5nDClnZfY=
Received: from CH5P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::29)
 by DM4PR12MB7599.namprd12.prod.outlook.com (2603:10b6:8:109::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 06:31:48 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::83) by CH5P220CA0006.outlook.office365.com
 (2603:10b6:610:1ef::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Wed, 27 Mar 2024 06:31:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 06:31:48 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 01:31:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 23:31:47 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Wed, 27 Mar 2024 01:31:44 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] soundwire: amd: use inline function for register update
Date: Wed, 27 Mar 2024 12:01:42 +0530
Message-ID: <20240327063143.2266464-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|DM4PR12MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: 633bd5b6-8238-496a-afc4-08dc4e279470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dC+R2epwMQg7kZ9/hnWmxjkvojoNNP74FY4QIzwj5072Wbjos9kpbkpVTM8wPB1Ij1L2QmuojvAqS8JjnJUbcyGGUt0qaUdOBOlOVdLHtZQUZNZ6McE4omJsDqpJyowZzfHtBKb8q6PnZJhWpAl1s3hxlIQPckzrqi36Ejr7LiBRY0m0RAP/GTtjS7bdbJnqBcMrVcMakHpXJTGk2IBIKVRIjAycHUa6OCK5KhvAGpUghC1TADmG3aVH5kDN1FOv8+k8Lai5rLHCFqPsHBMgMeVxyOQt2iS5LrnNoqg3mhLO7N4JQ5uT0nuWdvsBsxcXyiXw4jKIBwxOl6Jgmni93dmI5/7uWrT9lfNLqXM51bKFu21weCi6zbFpwvUxWh6QqX2ZQYYL1yZuZQF8Tro9ROd5fniVL7wdkauC4Dt/4KDh6NtoQF1+WacNiV5KE5b4nIqaFRVPcltHfzD70CqsK7rjQc4HJMVgLhZZKNtdG/PJienF9rmLC0cK7FdQ9hRjbKM6wTfm91rDgFy1AFq2rVoBG56zv/tImTEP4oe3RouVMypE81ptxFyfQ4P5fvoq7bfWwJNihHeB9LFkQtUSHKUlgIcaaD9nJGejs/WnMIq3CS/4+TXH0lVmtGIJRL+3Z0cNLwHhILM/8OeuQ4zhk9XqzgodH3k+2QyDzGgYCimxQkMlMuUcmyxZyIOa2bum3hUnYXhnZ5qscalLhrgqwKClyBw4KmOQ5wmj3ccI1BOTHTYq70wLIfeYHwZvOxAW
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 06:31:48.0246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 633bd5b6-8238-496a-afc4-08dc4e279470
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7599
Message-ID-Hash: FY3XPFVRJ7JSUIQXXTSQM6YMX6BNS5SQ
X-Message-ID-Hash: FY3XPFVRJ7JSUIQXXTSQM6YMX6BNS5SQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FY3XPFVRJ7JSUIQXXTSQM6YMX6BNS5SQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Define common inline function for register update.
Use this inline function for updating SoundWire Pad registers
and enable/disable SoundWire interrupt control registers.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c    | 36 +++++++++++++++------------------
 drivers/soundwire/amd_init.h    |  8 ++++++++
 drivers/soundwire/amd_manager.c | 13 ++++++------
 3 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index e45dc8261ab1..4cd26f3a21f5 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -17,42 +17,38 @@
 
 #define ACP_PAD_PULLDOWN_CTRL				0x0001448
 #define ACP_SW_PAD_KEEPER_EN				0x0001454
-#define AMD_SDW_PAD_PULLDOWN_CTRL_ENABLE_MASK		0x7f9a
-#define AMD_SDW0_PAD_PULLDOWN_CTRL_ENABLE_MASK		0x7f9f
-#define AMD_SDW1_PAD_PULLDOWN_CTRL_ENABLE_MASK		0x7ffa
-#define AMD_SDW0_PAD_EN_MASK				1
-#define AMD_SDW1_PAD_EN_MASK				0x10
-#define AMD_SDW_PAD_EN_MASK	(AMD_SDW0_PAD_EN_MASK | AMD_SDW1_PAD_EN_MASK)
+#define AMD_SDW0_PAD_CTRL_MASK				0x60
+#define AMD_SDW1_PAD_CTRL_MASK				5
+#define AMD_SDW_PAD_CTRL_MASK		(AMD_SDW0_PAD_CTRL_MASK | AMD_SDW1_PAD_CTRL_MASK)
+#define AMD_SDW0_PAD_EN					1
+#define AMD_SDW1_PAD_EN					0x10
+#define AMD_SDW_PAD_EN			(AMD_SDW0_PAD_EN | AMD_SDW1_PAD_EN)
 
 static int amd_enable_sdw_pads(void __iomem *mmio, u32 link_mask, struct device *dev)
 {
-	u32 val;
-	u32 pad_keeper_en_mask, pad_pulldown_ctrl_mask;
+	u32 pad_keeper_en, pad_pulldown_ctrl_mask;
 
 	switch (link_mask) {
 	case 1:
-		pad_keeper_en_mask = AMD_SDW0_PAD_EN_MASK;
-		pad_pulldown_ctrl_mask = AMD_SDW0_PAD_PULLDOWN_CTRL_ENABLE_MASK;
+		pad_keeper_en = AMD_SDW0_PAD_EN;
+		pad_pulldown_ctrl_mask = AMD_SDW0_PAD_CTRL_MASK;
 		break;
 	case 2:
-		pad_keeper_en_mask = AMD_SDW1_PAD_EN_MASK;
-		pad_pulldown_ctrl_mask = AMD_SDW1_PAD_PULLDOWN_CTRL_ENABLE_MASK;
+		pad_keeper_en = AMD_SDW1_PAD_EN;
+		pad_pulldown_ctrl_mask = AMD_SDW1_PAD_CTRL_MASK;
 		break;
 	case 3:
-		pad_keeper_en_mask = AMD_SDW_PAD_EN_MASK;
-		pad_pulldown_ctrl_mask = AMD_SDW_PAD_PULLDOWN_CTRL_ENABLE_MASK;
+		pad_keeper_en = AMD_SDW_PAD_EN;
+		pad_pulldown_ctrl_mask = AMD_SDW_PAD_CTRL_MASK;
 		break;
 	default:
 		dev_err(dev, "No SDW Links are enabled\n");
 		return -ENODEV;
 	}
 
-	val = readl(mmio + ACP_SW_PAD_KEEPER_EN);
-	val |= pad_keeper_en_mask;
-	writel(val, mmio + ACP_SW_PAD_KEEPER_EN);
-	val = readl(mmio + ACP_PAD_PULLDOWN_CTRL);
-	val &= pad_pulldown_ctrl_mask;
-	writel(val, mmio + ACP_PAD_PULLDOWN_CTRL);
+	amd_updatel(mmio, ACP_SW_PAD_KEEPER_EN, pad_keeper_en, pad_keeper_en);
+	amd_updatel(mmio, ACP_PAD_PULLDOWN_CTRL, pad_pulldown_ctrl_mask, 0);
+
 	return 0;
 }
 
diff --git a/drivers/soundwire/amd_init.h b/drivers/soundwire/amd_init.h
index 928b0c707162..5e7b43836a37 100644
--- a/drivers/soundwire/amd_init.h
+++ b/drivers/soundwire/amd_init.h
@@ -10,4 +10,12 @@
 
 int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager);
 
+static inline void amd_updatel(void __iomem *mmio, int offset, u32 mask, u32 val)
+{
+	u32 tmp;
+
+	tmp = readl(mmio + offset);
+	tmp = (tmp & ~mask) | val;
+	writel(tmp, mmio + offset);
+}
 #endif
diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 7cd24bd8e224..1066d87aa011 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -89,9 +89,8 @@ static void amd_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 	u32 val;
 
 	mutex_lock(amd_manager->acp_sdw_lock);
-	val = readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));
-	val |= sdw_manager_reg_mask_array[amd_manager->instance];
-	writel(val, amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));
+	val = sdw_manager_reg_mask_array[amd_manager->instance];
+	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->instance), val, val);
 	mutex_unlock(amd_manager->acp_sdw_lock);
 
 	writel(AMD_SDW_IRQ_MASK_0TO7, amd_manager->mmio +
@@ -103,12 +102,12 @@ static void amd_enable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 
 static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 {
-	u32 val;
+	u32 irq_mask;
 
 	mutex_lock(amd_manager->acp_sdw_lock);
-	val = readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));
-	val &= ~sdw_manager_reg_mask_array[amd_manager->instance];
-	writel(val, amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(amd_manager->instance));
+	irq_mask = sdw_manager_reg_mask_array[amd_manager->instance];
+	amd_updatel(amd_manager->acp_mmio, ACP_EXTERNAL_INTR_CNTL(amd_manager->instance),
+		    irq_mask, 0);
 	mutex_unlock(amd_manager->acp_sdw_lock);
 
 	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
-- 
2.34.1


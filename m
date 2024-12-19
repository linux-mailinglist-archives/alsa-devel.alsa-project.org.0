Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CC49F7434
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:50:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2171660238;
	Thu, 19 Dec 2024 06:50:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2171660238
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587426;
	bh=byhCUQKlJTkl15m+xRBkKItXbuPYYbC1wkHqNUoVjo4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vhUcrUBAE1lPoakZgbVJVdJKbuK1YjPbiusBjlqg83GXIE4HC0Qtg7oGHwPBGT+Ll
	 wWEWPjSojl7fwnpJ7G0my/9LkaR1ljtulRXOsN+1499PzJBZ7dgMclXEgXvNY1wZ4H
	 MpMHrwN84udmWdcOof7ebheqkwYDVflLfurj9bMU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57FBDF805F6; Thu, 19 Dec 2024 06:49:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A6D3F805EF;
	Thu, 19 Dec 2024 06:49:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E097BF8020D; Thu, 19 Dec 2024 06:49:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::625])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF8FAF800D2
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:49:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF8FAF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=KmY5oxvu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAK0kIw3GbH85c5jtcKxL7xOB8BbT1dIp6P90RdnMUCeIoDtCBvDgEcgqHnt4BODffI5BPiuCbYuTeLThQO4ua34hLFKm0VdX6E8PUgeP/fUml7a+E9vH3hlyy18Zqvi2rqTVGuQyu3ME0qT86MoRDDTPSrrsHKKpzIks8uJyQfnXlPA0uQVvLKLeQ2Oee88yYYv905ZC8rggzdRHAqOwF1bdp/AXga0WErdRwUem6dGN9Br3iMZAgpuA+7ea/tXV3FKH64K6eGiax7v2NFw22+C5YDndcog4g3gBFXj+P5XvaMNi+S3LdIvPN1jJJrhOPbQxtYwugIztuybOVV0ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vlNkV/RtEvW3xa84teBzsXeH9ffrowFb0rpXfzlQ8w=;
 b=xtQUtpliE16kCOsdSLJLDdOPaH6LI3m/UGWDzfzqmBsxkUIJr6BSNKWEmaeOHi4daDDwAVOZlWEya688VvohrVtU6jgBXmTy+OJsMWvYsulQ5CPX10Bt9Mdc7FM+NSeK0kY7yx5HYYvsJTZmk++2RGrY6nQzHRqjT0jrgR52Gjmt7wrAWGnZF36Zf0OujZp+iDsKhENyelkhqu564wnnOaISUyFxraUPjCT4B8U0YtMTcwN3E/5m1XjJUW4Lkc8Afoyb9r+kVE2vy5Pu58rGBcsyHo+nHLj8hLCwJjznL4SRQhnRaabwZaXZ44tkNbUe+uiC23M1ZNdM+mLe5a4Yxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vlNkV/RtEvW3xa84teBzsXeH9ffrowFb0rpXfzlQ8w=;
 b=KmY5oxvu7Qde6EihP13X9PHw8mYP5xlPg5bH6wHL2umdyPTxSBZXUTStlfFYaVua0Bpv6dZv8Q/2d8rfYdDPvIUe1rGFlYFn5LnWeAAEe5zEZpH7AbUHi0YcqmMGCrG/zi6bxggKUWMovQK/uGazve3/OKwbo38kHWBi+Yrbi5U=
Received: from CH2PR11CA0027.namprd11.prod.outlook.com (2603:10b6:610:54::37)
 by CH3PR12MB9315.namprd12.prod.outlook.com (2603:10b6:610:1cf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 05:49:21 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::2d) by CH2PR11CA0027.outlook.office365.com
 (2603:10b6:610:54::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 05:49:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:49:21 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:49:17 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 01/21] ASoC: amd: add register header file for ACP7.0 platform
Date: Thu, 19 Dec 2024 11:18:37 +0530
Message-ID: <20241219054857.2070420-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
References: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|CH3PR12MB9315:EE_
X-MS-Office365-Filtering-Correlation-Id: 39052d76-ebe9-4071-d034-08dd1ff0e30c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/A3ZHYyWNwNFNtDMJD91Uwt3KHR4Jg0Fuu0F3Bbh9dFX5+PrD8i8tXea7oaO?=
 =?us-ascii?Q?uamxxR4UsmJiYepCUIhFwrhpYPpFcgcV8Z+53B9sQ7dO0cObEthdwHr6gbJ3?=
 =?us-ascii?Q?qVA+JFauFDyJ31m8kqTLeuGhgbLBDdQFKwC34SxmzfyhnI/7vrdLIHN1c+G2?=
 =?us-ascii?Q?gQ+PWcIrCeDsldE/7jIydNmHFlP4GJwV/zqT0/FhsaG+xjFdnLZqGZgl/w2/?=
 =?us-ascii?Q?QSYtzrJ0bPB0DBbjXeBALeOTLYg6W1Pi8Cx1YSQLPuMTdbYB4Dsq4WDxZZhK?=
 =?us-ascii?Q?3nSXVouxZdXIDx4NxhoOfzwIk/5pL1uCxJc5f2xRvmeL8lpobNKY70lDWn/P?=
 =?us-ascii?Q?B2Vlk6W5/lCUEVM+gzsOxNPP0LRLo5sTQVMt3/H0X4lMCm0RkBCIrw1KatHG?=
 =?us-ascii?Q?QWuuLH6ndAwPdiL82CwtykKS4E1Eps4ypcEvhrFqKMaLQcgTzdkWkbJmaKrW?=
 =?us-ascii?Q?bOTfpRU9SGilC8A0cI4zuYH6rEEBZ2UKs418LUSXzoawWR+Dns+OVSqBCLDh?=
 =?us-ascii?Q?inAfyXut2Euxg03QWmi2+5NUNbfh0aLewLOY/8D+aJ4ugA3P4PGGeDi1zTaP?=
 =?us-ascii?Q?cvZOOohPUhqZ8Lt9Y4/GV2Mut4qLlORQk+4qhBfFxvTmfGGS66ekiPruiDt8?=
 =?us-ascii?Q?QyISnsXw9jjcos3xbNkYLQYv5MiQ7L1uM2yYtWhs/k+XQib52PnVgENlOMfh?=
 =?us-ascii?Q?OrkYkQj0iGCU6DacaNREC/5s5ofBH+x528GWgDobMVwYXmrUCDeSK0ACHqqZ?=
 =?us-ascii?Q?dkclFuNmcg+FXdgKzQfTju7Uxd3UJm2eYha+OY/N1HcG6AyqBXj2lppN70Sk?=
 =?us-ascii?Q?ZZmFDa7fWor78Lq4dGlHAb0Fk33w9rJuROs1LZWG/ePxQsfNCkkckZq9I5HV?=
 =?us-ascii?Q?QQoL5eXWpmuQIy9xLJFj4dO464L/NMgb7fbEXMsMZzdVN418MNwCxr/cV13i?=
 =?us-ascii?Q?dVcyDB7UAudEhSqTe/1rM0TG/q15cRaEv/AyyZftdVdXbZgYP9YFOruEf9kW?=
 =?us-ascii?Q?isT2q3KnR69xSohG49rSBOD9vy7NmAMoYjQT+TS34Lc0h7brb9j2AlIYgf2l?=
 =?us-ascii?Q?vfyo7ULgDbpasSpxl6kWHXNZ6JsSUnypoxg0/lvGM4FMQHJIaPCNn1V12zN4?=
 =?us-ascii?Q?UWk4mRoKrW+N/CTN/1Krmno3kuFXTzrJmlVXBzcOulT+ggsG7usYJ22ICZyZ?=
 =?us-ascii?Q?Hv4wOCECT1+APnLdTWiu2tX9WozOUkc3JCKNW9OfcbsZvzm8vYB2zrYUPWbM?=
 =?us-ascii?Q?lAsOGzQkwirs+ANA+jOKRGoKdIUzLaF3Ie2o5x1p03lgSBGz+yGAkECaKY8v?=
 =?us-ascii?Q?44TnWg/kdp8lquXBFmknqM3rDMkm+usy4VcWfpF9dpO47+NQyHg2TohYhDxA?=
 =?us-ascii?Q?zsCGZH2DzVT+KZ9l/AuJCj6UxJSUcDH2L1XHMx02bk70A7D0BhRx4xB7udN9?=
 =?us-ascii?Q?+ForHK3Hi8Uvy1SqDcJFdiCreurzz6AfezJCC5smkwkRx46soLTC+XEAY3c7?=
 =?us-ascii?Q?LNvhpNqX2QLVt2c=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:49:21.7577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 39052d76-ebe9-4071-d034-08dd1ff0e30c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9315
Message-ID-Hash: 2II3IM2SCYHTYPYABXHCGWOF6HS5NX4Q
X-Message-ID-Hash: 2II3IM2SCYHTYPYABXHCGWOF6HS5NX4Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2II3IM2SCYHTYPYABXHCGWOF6HS5NX4Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add ACP IP register header file for ACP7.0 platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 include/sound/acp70_chip_offset_byte.h | 484 +++++++++++++++++++++++++
 1 file changed, 484 insertions(+)
 create mode 100644 include/sound/acp70_chip_offset_byte.h

diff --git a/include/sound/acp70_chip_offset_byte.h b/include/sound/acp70_chip_offset_byte.h
new file mode 100644
index 000000000000..c0d51a0e012e
--- /dev/null
+++ b/include/sound/acp70_chip_offset_byte.h
@@ -0,0 +1,484 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * AMD ACP 7.0 Register Documentation
+ *
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _acp_ip_OFFSET_HEADER
+#define _acp_ip_OFFSET_HEADER
+
+/* Registers from ACP_AXI2AXIATU block */
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1			0x0000C00
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_1			0x0000C04
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_2			0x0000C08
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_2			0x0000C0C
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_3			0x0000C10
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_3			0x0000C14
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_4			0x0000C18
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_4			0x0000C1C
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_5			0x0000C20
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_5			0x0000C24
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_6			0x0000C28
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_6			0x0000C2C
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_7			0x0000C30
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_7			0x0000C34
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_8			0x0000C38
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_8			0x0000C3C
+#define ACPAXI2AXI_ATU_CTRL				0x0000C40
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_9			0x0000C44
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_9			0x0000C48
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_10			0x0000C4C
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_10			0x0000C50
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_11			0x0000C54
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_11			0x0000C58
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_12			0x0000C5C
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_12			0x0000C60
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_13			0x0000C64
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_13			0x0000C68
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_14			0x0000C6C
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_14			0x0000C70
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_15			0x0000C74
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_15			0x0000C78
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_16			0x0000C7C
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_16			0x0000C80
+
+/* Registers from ACP_CLKRST block */
+#define ACP_SOFT_RESET					0x0001000
+#define ACP_CONTROL					0x0001004
+#define ACP_STATUS					0x0001008
+#define ACP_DYNAMIC_CG_MASTER_CONTROL			0x0001010
+#define ACP_ZSC_DSP_CTRL				0x0001014
+#define ACP_ZSC_STS					0x0001018
+#define ACP_PGFSM_CONTROL				0x0001024
+#define ACP_PGFSM_STATUS				0x0001028
+#define ACP_CLKMUX_SEL					0x000102C
+#define ACP_SW0_48MHZ_CLK_SEL				0x0001030
+
+/* Registers from ACP_AON block */
+#define ACP_PME_EN					0x0001400
+#define ACP_DEVICE_STATE				0x0001404
+#define AZ_DEVICE_STATE					0x0001408
+#define SW_DEVICE_STATE					0x0001430
+#define ACP_PIN_CONFIG					0x0001440
+#define ACP_PAD_PULLUP_CTRL				0x0001444
+#define ACP_PAD_PULLDOWN_CTRL				0x0001448
+#define ACP_PAD_DRIVE_STRENGTH_CTRL			0x000144C
+#define ACP_PAD_SCHMEN_CTRL				0x0001450
+#define ACP_SW_PAD_KEEPER_EN				0x0001454
+#define ACP_SW0_WAKE_EN					0x0001458
+#define ACP_I2S_WAKE_EN					0x000145C
+#define ACP_SW1_WAKE_EN					0x0001460
+#define ACP_PAD_DISABLE_OE_CTRL				0x0001468
+
+/* Registers from ACP_MISC block */
+#define ACP_SW0_I2S_ERROR_REASON			0x00018B4
+#define ACP_SW0_POS_TRACK_AUDIO0_TX_CTRL		0x00018B8
+#define ACP_SW0_AUDIO0_TX_DMA_POS			0x00018BC
+#define ACP_SW0_POS_TRACK_AUDIO1_TX_CTRL		0x00018C0
+#define ACP_SW0_AUDIO1_TX_DMA_POS			0x00018C4
+#define ACP_SW0_POS_TRACK_AUDIO2_TX_CTRL		0x00018C8
+#define ACP_SW0_AUDIO2_TX_DMA_POS			0x00018CC
+#define ACP_SW0_POS_TRACK_AUDIO0_RX_CTRL		0x00018D0
+#define ACP_SW0_AUDIO0_DMA_POS				0x00018D4
+#define ACP_SW0_POS_TRACK_AUDIO1_RX_CTRL		0x00018D8
+#define ACP_SW0_AUDIO1_RX_DMA_POS			0x00018DC
+#define ACP_SW0_POS_TRACK_AUDIO2_RX_CTRL		0x00018E0
+#define ACP_SW0_AUDIO2_RX_DMA_POS			0x00018E4
+#define ACP_ERROR_INTR_MASK1				0x0001974
+#define ACP_ERROR_INTR_MASK2				0x0001978
+#define ACP_ERROR_INTR_MASK3				0x000197C
+
+/* Registers from ACP_P1_MISC block */
+#define ACP_EXTERNAL_INTR_ENB				0x0001A00
+#define ACP_EXTERNAL_INTR_CNTL				0x0001A04
+#define ACP_EXTERNAL_INTR_CNTL1				0x0001A08
+#define ACP_EXTERNAL_INTR_STAT				0x0001A0C
+#define ACP_EXTERNAL_INTR_STAT1				0x0001A10
+#define ACP_ERROR_STATUS				0x0001A4C
+#define ACP_SW1_I2S_ERROR_REASON			0x0001A50
+#define ACP_SW1_POS_TRACK_AUDIO0_TX_CTRL		0x0001A6C
+#define ACP_SW1_AUDIO0_TX_DMA_POS			0x0001A70
+#define ACP_SW1_POS_TRACK_AUDIO0_RX_CTRL		0x0001A74
+#define ACP_SW1_AUDIO0_RX_DMA_POS			0x0001A78
+#define ACP_P1_DMIC_I2S_GPIO_INTR_CTRL			0x0001A7C
+#define ACP_P1_DMIC_I2S_GPIO_INTR_STATUS		0x0001A80
+#define ACP_SCRATCH_REG_BASE_ADDR			0x0001A84
+#define ACP_SW1_POS_TRACK_AUDIO1_TX_CTRL		0x0001A88
+#define ACP_SW1_AUDIO1_TX_DMA_POS			0x0001A8C
+#define ACP_SW1_POS_TRACK_AUDIO2_TX_CTRL		0x0001A90
+#define ACP_SW1_AUDIO2_TX_DMA_POS			0x0001A94
+#define ACP_SW1_POS_TRACK_AUDIO1_RX_CTRL		0x0001A98
+#define ACP_SW1_AUDIO1_RX_DMA_POS			0x0001A9C
+#define ACP_SW1_POS_TRACK_AUDIO2_RX_CTRL		0x0001AA0
+#define ACP_SW1_AUDIO2_RX_DMA_POS			0x0001AA4
+#define ACP_ERROR_INTR_MASK4				0x0001AEC
+#define ACP_ERROR_INTR_MASK5				0x0001AF0
+#define ACP_ERROR_STATUS1				0x0001B28
+
+/* Registers from ACP_AUDIO_BUFFERS block */
+#define ACP_AUDIO0_RX_RINGBUFADDR			0x0002000
+#define ACP_AUDIO0_RX_RINGBUFSIZE			0x0002004
+#define ACP_AUDIO0_RX_LINKPOSITIONCNTR			0x0002008
+#define ACP_AUDIO0_RX_FIFOADDR				0x000200C
+#define ACP_AUDIO0_RX_FIFOSIZE				0x0002010
+#define ACP_AUDIO0_RX_DMA_SIZE				0x0002014
+#define ACP_AUDIO0_RX_LINEARPOSITIONCNTR_HIGH		0x0002018
+#define ACP_AUDIO0_RX_LINEARPOSITIONCNTR_LOW		0x000201C
+#define ACP_AUDIO0_RX_INTR_WATERMARK_SIZE		0x0002020
+#define ACP_AUDIO0_TX_RINGBUFADDR			0x0002024
+#define ACP_AUDIO0_TX_RINGBUFSIZE			0x0002028
+#define ACP_AUDIO0_TX_LINKPOSITIONCNTR			0x000202C
+#define ACP_AUDIO0_TX_FIFOADDR				0x0002030
+#define ACP_AUDIO0_TX_FIFOSIZE				0x0002034
+#define ACP_AUDIO0_TX_DMA_SIZE				0x0002038
+#define ACP_AUDIO0_TX_LINEARPOSITIONCNTR_HIGH		0x000203C
+#define ACP_AUDIO0_TX_LINEARPOSITIONCNTR_LOW		0x0002040
+#define ACP_AUDIO0_TX_INTR_WATERMARK_SIZE		0x0002044
+#define ACP_AUDIO1_RX_RINGBUFADDR			0x0002048
+#define ACP_AUDIO1_RX_RINGBUFSIZE			0x000204C
+#define ACP_AUDIO1_RX_LINKPOSITIONCNTR			0x0002050
+#define ACP_AUDIO1_RX_FIFOADDR				0x0002054
+#define ACP_AUDIO1_RX_FIFOSIZE				0x0002058
+#define ACP_AUDIO1_RX_DMA_SIZE				0x000205C
+#define ACP_AUDIO1_RX_LINEARPOSITIONCNTR_HIGH		0x0002060
+#define ACP_AUDIO1_RX_LINEARPOSITIONCNTR_LOW		0x0002064
+#define ACP_AUDIO1_RX_INTR_WATERMARK_SIZE		0x0002068
+#define ACP_AUDIO1_TX_RINGBUFADDR			0x000206C
+#define ACP_AUDIO1_TX_RINGBUFSIZE			0x0002070
+#define ACP_AUDIO1_TX_LINKPOSITIONCNTR			0x0002074
+#define ACP_AUDIO1_TX_FIFOADDR				0x0002078
+#define ACP_AUDIO1_TX_FIFOSIZE				0x000207C
+#define ACP_AUDIO1_TX_DMA_SIZE				0x0002080
+#define ACP_AUDIO1_TX_LINEARPOSITIONCNTR_HIGH		0x0002084
+#define ACP_AUDIO1_TX_LINEARPOSITIONCNTR_LOW		0x0002088
+#define ACP_AUDIO1_TX_INTR_WATERMARK_SIZE		0x000208C
+#define ACP_AUDIO2_RX_RINGBUFADDR			0x0002090
+#define ACP_AUDIO2_RX_RINGBUFSIZE			0x0002094
+#define ACP_AUDIO2_RX_LINKPOSITIONCNTR			0x0002098
+#define ACP_AUDIO2_RX_FIFOADDR				0x000209C
+#define ACP_AUDIO2_RX_FIFOSIZE				0x00020A0
+#define ACP_AUDIO2_RX_DMA_SIZE				0x00020A4
+#define ACP_AUDIO2_RX_LINEARPOSITIONCNTR_HIGH		0x00020A8
+#define ACP_AUDIO2_RX_LINEARPOSITIONCNTR_LOW		0x00020AC
+#define ACP_AUDIO2_RX_INTR_WATERMARK_SIZE		0x00020B0
+#define ACP_AUDIO2_TX_RINGBUFADDR			0x00020B4
+#define ACP_AUDIO2_TX_RINGBUFSIZE			0x00020B8
+#define ACP_AUDIO2_TX_LINKPOSITIONCNTR			0x00020BC
+#define ACP_AUDIO2_TX_FIFOADDR				0x00020C0
+#define ACP_AUDIO2_TX_FIFOSIZE				0x00020C4
+#define ACP_AUDIO2_TX_DMA_SIZE				0x00020C8
+#define ACP_AUDIO2_TX_LINEARPOSITIONCNTR_HIGH		0x00020CC
+#define ACP_AUDIO2_TX_LINEARPOSITIONCNTR_LOW		0x00020D0
+#define ACP_AUDIO2_TX_INTR_WATERMARK_SIZE		0x00020D4
+
+/* Registers from ACP_I2S_TDM block */
+#define ACP_I2STDM_IER					0x0002400
+#define ACP_I2STDM_IRER					0x0002404
+#define ACP_I2STDM_RXFRMT				0x0002408
+#define ACP_I2STDM_ITER					0x000240C
+#define ACP_I2STDM_TXFRMT				0x0002410
+#define ACP_I2STDM0_MSTRCLKGEN				0x0002414
+#define ACP_I2STDM1_MSTRCLKGEN				0x0002418
+#define ACP_I2STDM2_MSTRCLKGEN				0x000241C
+#define ACP_I2STDM_REFCLKGEN				0x0002420
+
+/* Registers from ACP_BT_TDM block */
+#define ACP_BTTDM_IER					0x0002800
+#define ACP_BTTDM_IRER					0x0002804
+#define ACP_BTTDM_RXFRMT				0x0002808
+#define ACP_BTTDM_ITER					0x000280C
+#define ACP_BTTDM_TXFRMT				0x0002810
+#define ACP_HSTDM_IER					0x0002814
+#define ACP_HSTDM_IRER					0x0002818
+#define ACP_HSTDM_RXFRMT				0x000281C
+#define ACP_HSTDM_ITER					0x0002820
+#define ACP_HSTDM_TXFRMT				0x0002824
+
+/* Registers from ACP_WOV block */
+#define ACP_WOV_PDM_ENABLE				0x0002C04
+#define ACP_WOV_PDM_DMA_ENABLE				0x0002C08
+#define ACP_WOV_RX_RINGBUFADDR				0x0002C0C
+#define ACP_WOV_RX_RINGBUFSIZE				0x0002C10
+#define ACP_WOV_RX_LINKPOSITIONCNTR			0x0002C14
+#define ACP_WOV_RX_LINEARPOSITIONCNTR_HIGH		0x0002C18
+#define ACP_WOV_RX_LINEARPOSITIONCNTR_LOW		0x0002C1C
+#define ACP_WOV_RX_INTR_WATERMARK_SIZE			0x0002C20
+#define ACP_WOV_PDM_FIFO_FLUSH				0x0002C24
+#define ACP_WOV_PDM_NO_OF_CHANNELS			0x0002C28
+#define ACP_WOV_PDM_DECIMATION_FACTOR			0x0002C2C
+#define ACP_WOV_PDM_VAD_CTRL				0x0002C30
+#define ACP_WOV_WAKE					0x0002C54
+#define ACP_WOV_BUFFER_STATUS				0x0002C58
+#define ACP_WOV_MISC_CTRL				0x0002C5C
+#define ACP_WOV_CLK_CTRL				0x0002C60
+#define ACP_PDM_VAD_DYNAMIC_CLK_GATING_EN		0x0002C64
+#define ACP_WOV_ERROR_STATUS_REGISTER			0x0002C68
+#define ACP_PDM_CLKDIV					0x0002C6C
+
+/* Registers from ACP_SW0_SWCLK block */
+#define ACP_SW0_EN                                     0x0003000
+#define ACP_SW0_EN_STATUS                              0x0003004
+#define ACP_SW0_FRAMESIZE                              0x0003008
+#define ACP_SW0_SSP_COUNTER                            0x000300C
+#define ACP_SW0_AUDIO0_TX_EN                           0x0003010
+#define ACP_SW0_AUDIO0_TX_EN_STATUS                    0x0003014
+#define ACP_SW0_AUDIO0_TX_FRAME_FORMAT                 0x0003018
+#define ACP_SW0_AUDIO0_TX_SAMPLEINTERVAL               0x000301C
+#define ACP_SW0_AUDIO0_TX_HCTRL_DP0                    0x0003020
+#define ACP_SW0_AUDIO0_TX_HCTRL_DP1                    0x0003024
+#define ACP_SW0_AUDIO0_TX_HCTRL_DP2                    0x0003028
+#define ACP_SW0_AUDIO0_TX_HCTRL_DP3                    0x000302C
+#define ACP_SW0_AUDIO0_TX_OFFSET_DP0                   0x0003030
+#define ACP_SW0_AUDIO0_TX_OFFSET_DP1                   0x0003034
+#define ACP_SW0_AUDIO0_TX_OFFSET_DP2                   0x0003038
+#define ACP_SW0_AUDIO0_TX_OFFSET_DP3                   0x000303C
+#define ACP_SW0_AUDIO0_TX_CHANNEL_ENABLE_DP0           0x0003040
+#define ACP_SW0_AUDIO0_TX_CHANNEL_ENABLE_DP1           0x0003044
+#define ACP_SW0_AUDIO0_TX_CHANNEL_ENABLE_DP2           0x0003048
+#define ACP_SW0_AUDIO0_TX_CHANNEL_ENABLE_DP3           0x000304C
+#define ACP_SW0_AUDIO1_TX_EN                           0x0003050
+#define ACP_SW0_AUDIO1_TX_EN_STATUS                    0x0003054
+#define ACP_SW0_AUDIO1_TX_FRAME_FORMAT                 0x0003058
+#define ACP_SW0_AUDIO1_TX_SAMPLEINTERVAL               0x000305C
+#define ACP_SW0_AUDIO1_TX_HCTRL                        0x0003060
+#define ACP_SW0_AUDIO1_TX_OFFSET                       0x0003064
+#define ACP_SW0_AUDIO1_TX_CHANNEL_ENABLE_DP0           0x0003068
+#define ACP_SW0_AUDIO2_TX_EN                           0x000306C
+#define ACP_SW0_AUDIO2_TX_EN_STATUS                    0x0003070
+#define ACP_SW0_AUDIO2_TX_FRAME_FORMAT                 0x0003074
+#define ACP_SW0_AUDIO2_TX_SAMPLEINTERVAL               0x0003078
+#define ACP_SW0_AUDIO2_TX_HCTRL                        0x000307C
+#define ACP_SW0_AUDIO2_TX_OFFSET                       0x0003080
+#define ACP_SW0_AUDIO2_TX_CHANNEL_ENABLE_DP0           0x0003084
+#define ACP_SW0_AUDIO0_RX_EN                           0x0003088
+#define ACP_SW0_AUDIO0_RX_EN_STATUS                    0x000308C
+#define ACP_SW0_AUDIO0_RX_FRAME_FORMAT                 0x0003090
+#define ACP_SW0_AUDIO0_RX_SAMPLEINTERVAL               0x0003094
+#define ACP_SW0_AUDIO0_RX_HCTRL_DP0                    0x0003098
+#define ACP_SW0_AUDIO0_RX_HCTRL_DP1                    0x000309C
+#define ACP_SW0_AUDIO0_RX_HCTRL_DP2                    0x0003100
+#define ACP_SW0_AUDIO0_RX_HCTRL_DP3                    0x0003104
+#define ACP_SW0_AUDIO0_RX_OFFSET_DP0                   0x0003108
+#define ACP_SW0_AUDIO0_RX_OFFSET_DP1                   0x000310C
+#define ACP_SW0_AUDIO0_RX_OFFSET_DP2                   0x0003110
+#define ACP_SW0_AUDIO0_RX_OFFSET_DP3                   0x0003114
+#define ACP_SW0_AUDIO0_RX_CHANNEL_ENABLE_DP0           0x0003118
+#define ACP_SW0_AUDIO0_RX_CHANNEL_ENABLE_DP1           0x000311C
+#define ACP_SW0_AUDIO0_RX_CHANNEL_ENABLE_DP2           0x0003120
+#define ACP_SW0_AUDIO0_RX_CHANNEL_ENABLE_DP3           0x0003124
+#define ACP_SW0_AUDIO1_RX_EN                           0x0003128
+#define ACP_SW0_AUDIO1_RX_EN_STATUS                    0x000312C
+#define ACP_SW0_AUDIO1_RX_FRAME_FORMAT                 0x0003130
+#define ACP_SW0_AUDIO1_RX_SAMPLEINTERVAL               0x0003134
+#define ACP_SW0_AUDIO1_RX_HCTRL                        0x0003138
+#define ACP_SW0_AUDIO1_RX_OFFSET                       0x000313C
+#define ACP_SW0_AUDIO1_RX_CHANNEL_ENABLE_DP0           0x0003140
+#define ACP_SW0_AUDIO2_RX_EN                           0x0003144
+#define ACP_SW0_AUDIO2_RX_EN_STATUS                    0x0003148
+#define ACP_SW0_AUDIO2_RX_FRAME_FORMAT                 0x000314C
+#define ACP_SW0_AUDIO2_RX_SAMPLEINTERVAL               0x0003150
+#define ACP_SW0_AUDIO2_RX_HCTRL                        0x0003154
+#define ACP_SW0_AUDIO2_RX_OFFSET                       0x0003158
+#define ACP_SW0_AUDIO2_RX_CHANNEL_ENABLE_DP0           0x000315C
+#define ACP_SW0_BPT_PORT_EN                            0x0003160
+#define ACP_SW0_BPT_PORT_EN_STATUS                     0x0003164
+#define ACP_SW0_BPT_PORT_FRAME_FORMAT                  0x0003168
+#define ACP_SW0_BPT_PORT_SAMPLEINTERVAL                0x000316C
+#define ACP_SW0_BPT_PORT_HCTRL                         0x0003170
+#define ACP_SW0_BPT_PORT_OFFSET                        0x0003174
+#define ACP_SW0_BPT_PORT_CHANNEL_ENABLE                0x0003178
+#define ACP_SW0_BPT_PORT_FIRST_BYTE_ADDR               0x000317C
+#define ACP_SW0_CLK_RESUME_CTRL                        0x0003180
+#define ACP_SW0_CLK_RESUME_DELAY_CNTR                  0x0003184
+#define ACP_SW0_BUS_RESET_CTRL                         0x0003188
+#define ACP_SW0_PRBS_ERR_STATUS                        0x000318C
+
+/* Registers from ACP_SW0_ACLK block */
+#define ACP_SW0_CORB_BASE_ADDRESS			0x0003200
+#define ACP_SW0_CORB_WRITE_POINTER			0x0003204
+#define ACP_SW0_CORB_READ_POINTER			0x0003208
+#define ACP_SW0_CORB_CONTROL				0x000320C
+#define ACP_SW0_CORB_SIZE				0x0003214
+#define ACP_SW0_RIRB_BASE_ADDRESS			0x0003218
+#define ACP_SW0_RIRB_WRITE_POINTER			0x000321C
+#define ACP_SW0_RIRB_RESPONSE_INTERRUPT_COUNT		0x0003220
+#define ACP_SW0_RIRB_CONTROL				0x0003224
+#define ACP_SW0_RIRB_SIZE				0x0003228
+#define ACP_SW0_RIRB_FIFO_MIN_THDL			0x000322C
+#define ACP_SW0_IMM_CMD_UPPER_WORD			0x0003230
+#define ACP_SW0_IMM_CMD_LOWER_QWORD			0x0003234
+#define ACP_SW0_IMM_RESP_UPPER_WORD			0x0003238
+#define ACP_SW0_IMM_RESP_LOWER_QWORD			0x000323C
+#define ACP_SW0_IMM_CMD_STS				0x0003240
+#define ACP_SW0_BRA_BASE_ADDRESS			0x0003244
+#define ACP_SW0_BRA_TRANSFER_SIZE			0x0003248
+#define ACP_SW0_BRA_DMA_BUSY				0x000324C
+#define ACP_SW0_BRA_RESP				0x0003250
+#define ACP_SW0_BRA_RESP_FRAME_ADDR			0x0003254
+#define ACP_SW0_BRA_CURRENT_TRANSFER_SIZE		0x0003258
+#define ACP_SW0_STATECHANGE_STATUS_0TO7			0x000325C
+#define ACP_SW0_STATECHANGE_STATUS_8TO11		0x0003260
+#define ACP_SW0_STATECHANGE_STATUS_MASK_0TO7		0x0003264
+#define ACP_SW0_STATECHANGE_STATUS_MASK_8TO11		0x0003268
+#define ACP_SW0_CLK_FREQUENCY_CTRL			0x000326C
+#define ACP_SW0_ERROR_INTR_MASK				0x0003270
+#define ACP_SW0_PHY_TEST_MODE_DATA_OFF			0x0003274
+
+/* Registers from ACP_P1_AUDIO_BUFFERS block */
+#define ACP_P1_AUDIO0_RX_RINGBUFADDR			0x0003A00
+#define ACP_P1_AUDIO0_RX_RINGBUFSIZE			0x0003A04
+#define ACP_P1_AUDIO0_RX_LINKPOSITIONCNTR		0x0003A08
+#define ACP_P1_AUDIO0_RX_FIFOADDR			0x0003A0C
+#define ACP_P1_AUDIO0_RX_FIFOSIZE			0x0003A10
+#define ACP_P1_AUDIO0_RX_DMA_SIZE			0x0003A14
+#define ACP_P1_AUDIO0_RX_LINEARPOSITIONCNTR_HIGH	0x0003A18
+#define ACP_P1_AUDIO0_RX_LINEARPOSITIONCNTR_LOW		0x0003A1C
+#define ACP_P1_AUDIO0_RX_INTR_WATERMARK_SIZE		0x0003A20
+#define ACP_P1_AUDIO0_TX_RINGBUFADDR			0x0003A24
+#define ACP_P1_AUDIO0_TX_RINGBUFSIZE			0x0003A28
+#define ACP_P1_AUDIO0_TX_LINKPOSITIONCNTR		0x0003A2C
+#define ACP_P1_AUDIO0_TX_FIFOADDR			0x0003A30
+#define ACP_P1_AUDIO0_TX_FIFOSIZE			0x0003A34
+#define ACP_P1_AUDIO0_TX_DMA_SIZE			0x0003A38
+#define ACP_P1_AUDIO0_TX_LINEARPOSITIONCNTR_HIGH	0x0003A3C
+#define ACP_P1_AUDIO0_TX_LINEARPOSITIONCNTR_LOW		0x0003A40
+#define ACP_P1_AUDIO0_TX_INTR_WATERMARK_SIZE		0x0003A44
+#define ACP_P1_AUDIO1_RX_RINGBUFADDR			0x0003A48
+#define ACP_P1_AUDIO1_RX_RINGBUFSIZE			0x0003A4C
+#define ACP_P1_AUDIO1_RX_LINKPOSITIONCNTR		0x0003A50
+#define ACP_P1_AUDIO1_RX_FIFOADDR			0x0003A54
+#define ACP_P1_AUDIO1_RX_FIFOSIZE			0x0003A58
+#define ACP_P1_AUDIO1_RX_DMA_SIZE			0x0003A5C
+#define ACP_P1_AUDIO1_RX_LINEARPOSITIONCNTR_HIGH	0x0003A60
+#define ACP_P1_AUDIO1_RX_LINEARPOSITIONCNTR_LOW		0x0003A64
+#define ACP_P1_AUDIO1_RX_INTR_WATERMARK_SIZE		0x0003A68
+#define ACP_P1_AUDIO1_TX_RINGBUFADDR			0x0003A6C
+#define ACP_P1_AUDIO1_TX_RINGBUFSIZE			0x0003A70
+#define ACP_P1_AUDIO1_TX_LINKPOSITIONCNTR		0x0003A74
+#define ACP_P1_AUDIO1_TX_FIFOADDR			0x0003A78
+#define ACP_P1_AUDIO1_TX_FIFOSIZE			0x0003A7C
+#define ACP_P1_AUDIO1_TX_DMA_SIZE			0x0003A80
+#define ACP_P1_AUDIO1_TX_LINEARPOSITIONCNTR_HIGH	0x0003A84
+#define ACP_P1_AUDIO1_TX_LINEARPOSITIONCNTR_LOW		0x0003A88
+#define ACP_P1_AUDIO1_TX_INTR_WATERMARK_SIZE		0x0003A8C
+#define ACP_P1_AUDIO2_RX_RINGBUFADDR			0x0003A90
+#define ACP_P1_AUDIO2_RX_RINGBUFSIZE			0x0003A94
+#define ACP_P1_AUDIO2_RX_LINKPOSITIONCNTR		0x0003A98
+#define ACP_P1_AUDIO2_RX_FIFOADDR			0x0003A9C
+#define ACP_P1_AUDIO2_RX_FIFOSIZE			0x0003AA0
+#define ACP_P1_AUDIO2_RX_DMA_SIZE			0x0003AA4
+#define ACP_P1_AUDIO2_RX_LINEARPOSITIONCNTR_HIGH	0x0003AA8
+#define ACP_P1_AUDIO2_RX_LINEARPOSITIONCNTR_LOW		0x0003AAC
+#define ACP_P1_AUDIO2_RX_INTR_WATERMARK_SIZE		0x0003AB0
+#define ACP_P1_AUDIO2_TX_RINGBUFADDR			0x0003AB4
+#define ACP_P1_AUDIO2_TX_RINGBUFSIZE			0x0003AB8
+#define ACP_P1_AUDIO2_TX_LINKPOSITIONCNTR		0x0003ABC
+#define ACP_P1_AUDIO2_TX_FIFOADDR			0x0003AC0
+#define ACP_P1_AUDIO2_TX_FIFOSIZE			0x0003AC4
+#define ACP_P1_AUDIO2_TX_DMA_SIZE			0x0003AC8
+#define ACP_P1_AUDIO2_TX_LINEARPOSITIONCNTR_HIGH	0x0003ACC
+#define ACP_P1_AUDIO2_TX_LINEARPOSITIONCNTR_LOW		0x0003AD0
+#define ACP_P1_AUDIO2_TX_INTR_WATERMARK_SIZE		0x0003AD4
+
+/* Registers from ACP_SW1_SWCLK block */
+#define ACP_SW1_EN					0x0003C00
+#define ACP_SW1_EN_STATUS				0x0003C04
+#define ACP_SW1_FRAMESIZE				0x0003C08
+#define ACP_SW1_SSP_COUNTER				0x0003C0C
+#define ACP_SW1_AUDIO0_TX_EN				0x0003C10
+#define ACP_SW1_AUDIO0_TX_EN_STATUS			0x0003C14
+#define ACP_SW1_AUDIO0_TX_FRAME_FORMAT			0x0003C18
+#define ACP_SW1_AUDIO0_TX_SAMPLEINTERVAL		0x0003C1C
+#define ACP_SW1_AUDIO0_TX_HCTRL_DP0			0x0003C20
+#define ACP_SW1_AUDIO0_TX_HCTRL_DP1			0x0003C24
+#define ACP_SW1_AUDIO0_TX_OFFSET_DP0			0x0003C30
+#define ACP_SW1_AUDIO0_TX_OFFSET_DP1			0x0003C34
+#define ACP_SW1_AUDIO0_TX_CHANNEL_ENABLE_DP0		0x0003C40
+#define ACP_SW1_AUDIO0_TX_CHANNEL_ENABLE_DP1		0x0003C44
+#define ACP_SW1_AUDIO1_TX_EN				0x0003C50
+#define ACP_SW1_AUDIO1_TX_EN_STATUS			0x0003C54
+#define ACP_SW1_AUDIO1_TX_FRAME_FORMAT			0x0003C58
+#define ACP_SW1_AUDIO1_TX_SAMPLEINTERVAL		0x0003C5C
+#define ACP_SW1_AUDIO1_TX_HCTRL				0x0003C60
+#define ACP_SW1_AUDIO1_TX_OFFSET			0x0003C64
+#define ACP_SW1_AUDIO1_TX_CHANNEL_ENABLE_DP0		0x0003C68
+#define ACP_SW1_AUDIO2_TX_EN				0x0003C6C
+#define ACP_SW1_AUDIO2_TX_EN_STATUS			0x0003C70
+#define ACP_SW1_AUDIO2_TX_FRAME_FORMAT			0x0003C74
+#define ACP_SW1_AUDIO2_TX_SAMPLEINTERVAL		0x0003C78
+#define ACP_SW1_AUDIO2_TX_HCTRL				0x0003C7C
+#define ACP_SW1_AUDIO2_TX_OFFSET			0x0003C80
+#define ACP_SW1_AUDIO2_TX_CHANNEL_ENABLE_DP0		0x0003C84
+#define ACP_SW1_AUDIO0_RX_EN				0x0003C88
+#define ACP_SW1_AUDIO0_RX_EN_STATUS			0x0003C8C
+#define ACP_SW1_AUDIO0_RX_FRAME_FORMAT			0x0003C90
+#define ACP_SW1_AUDIO0_RX_SAMPLEINTERVAL		0x0003C94
+#define ACP_SW1_AUDIO0_RX_HCTRL_DP0			0x0003C98
+#define ACP_SW1_AUDIO0_RX_HCTRL_DP1			0x0003C9C
+#define ACP_SW1_AUDIO0_RX_OFFSET_DP0			0x0003D08
+#define ACP_SW1_AUDIO0_RX_OFFSET_DP1			0x0003D0C
+#define ACP_SW1_AUDIO0_RX_CHANNEL_ENABLE_DP0		0x0003D18
+#define ACP_SW1_AUDIO0_RX_CHANNEL_ENABLE_DP1		0x0003D1C
+#define ACP_SW1_AUDIO1_RX_EN				0x0003D28
+#define ACP_SW1_AUDIO1_RX_EN_STATUS			0x0003D2C
+#define ACP_SW1_AUDIO1_RX_FRAME_FORMAT			0x0003D30
+#define ACP_SW1_AUDIO1_RX_SAMPLEINTERVAL		0x0003D34
+#define ACP_SW1_AUDIO1_RX_HCTRL				0x0003D38
+#define ACP_SW1_AUDIO1_RX_OFFSET			0x0003D3C
+#define ACP_SW1_AUDIO1_RX_CHANNEL_ENABLE_DP0		0x0003D40
+#define ACP_SW1_AUDIO2_RX_EN				0x0003D44
+#define ACP_SW1_AUDIO2_RX_EN_STATUS			0x0003D48
+#define ACP_SW1_AUDIO2_RX_FRAME_FORMAT			0x0003D4C
+#define ACP_SW1_AUDIO2_RX_SAMPLEINTERVAL		0x0003D50
+#define ACP_SW1_AUDIO2_RX_HCTRL				0x0003D54
+#define ACP_SW1_AUDIO2_RX_OFFSET			0x0003D58
+#define ACP_SW1_AUDIO2_RX_CHANNEL_ENABLE_DP0		0x0003D5C
+#define ACP_SW1_BPT_PORT_EN				0x0003D60
+#define ACP_SW1_BPT_PORT_EN_STATUS			0x0003D64
+#define ACP_SW1_BPT_PORT_FRAME_FORMAT			0x0003D68
+#define ACP_SW1_BPT_PORT_SAMPLEINTERVAL			0x0003D6C
+#define ACP_SW1_BPT_PORT_HCTRL				0x0003D70
+#define ACP_SW1_BPT_PORT_OFFSET				0x0003D74
+#define ACP_SW1_BPT_PORT_CHANNEL_ENABLE			0x0003D78
+#define ACP_SW1_BPT_PORT_FIRST_BYTE_ADDR		0x0003D7C
+#define ACP_SW1_CLK_RESUME_CTRL				0x0003D80
+#define ACP_SW1_CLK_RESUME_DELAY_CNTR			0x0003D84
+#define ACP_SW1_BUS_RESET_CTRL				0x0003D88
+#define ACP_SW1_PRBS_ERR_STATUS				0x0003D8C
+
+/* Registers from ACP_SW1_ACLK block */
+#define ACP_SW1_CORB_BASE_ADDRESS			0x0003E00
+#define ACP_SW1_CORB_WRITE_POINTER			0x0003E04
+#define ACP_SW1_CORB_READ_POINTER			0x0003E08
+#define ACP_SW1_CORB_CONTROL				0x0003E0C
+#define ACP_SW1_CORB_SIZE				0x0003E14
+#define ACP_SW1_RIRB_BASE_ADDRESS			0x0003E18
+#define ACP_SW1_RIRB_WRITE_POINTER			0x0003E1C
+#define ACP_SW1_RIRB_RESPONSE_INTERRUPT_COUNT		0x0003E20
+#define ACP_SW1_RIRB_CONTROL				0x0003E24
+#define ACP_SW1_RIRB_SIZE				0x0003E28
+#define ACP_SW1_RIRB_FIFO_MIN_THDL			0x0003E2C
+#define ACP_SW1_IMM_CMD_UPPER_WORD			0x0003E30
+#define ACP_SW1_IMM_CMD_LOWER_QWORD			0x0003E34
+#define ACP_SW1_IMM_RESP_UPPER_WORD			0x0003E38
+#define ACP_SW1_IMM_RESP_LOWER_QWORD			0x0003E3C
+#define ACP_SW1_IMM_CMD_STS				0x0003E40
+#define ACP_SW1_BRA_BASE_ADDRESS			0x0003E44
+#define ACP_SW1_BRA_TRANSFER_SIZE			0x0003E48
+#define ACP_SW1_BRA_DMA_BUSY				0x0003E4C
+#define ACP_SW1_BRA_RESP				0x0003E50
+#define ACP_SW1_BRA_RESP_FRAME_ADDR			0x0003E54
+#define ACP_SW1_BRA_CURRENT_TRANSFER_SIZE		0x0003E58
+#define ACP_SW1_STATECHANGE_STATUS_0TO7			0x0003E5C
+#define ACP_SW1_STATECHANGE_STATUS_8TO11		0x0003E60
+#define ACP_SW1_STATECHANGE_STATUS_MASK_0TO7		0x0003E64
+#define ACP_SW1_STATECHANGE_STATUS_MASK_8TO11		0x0003E68
+#define ACP_SW1_CLK_FREQUENCY_CTRL			0x0003E6C
+#define ACP_SW1_ERROR_INTR_MASK				0x0003E70
+#define ACP_SW1_PHY_TEST_MODE_DATA_OFF			0x0003E74
+
+/* Registers from ACP_SCRATCH block */
+#define ACP_SCRATCH_REG_0				0x0010000
+
+#endif
-- 
2.34.1


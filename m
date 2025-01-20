Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D78DA16A3F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:04:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5D566022E;
	Mon, 20 Jan 2025 11:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5D566022E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367440;
	bh=byhCUQKlJTkl15m+xRBkKItXbuPYYbC1wkHqNUoVjo4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BtlH4ub265L3/DtaB+RqJvcHMfPIkPA88HevEQG8AnpqbkjdKHhH91x2FDz323aU8
	 CisThtLXDCcGS4ELG3n7Fmp9fuf41mAPE++B8fUGKCUMpAELEXwQ8M7JEFo1l7Lf7D
	 kWrhgMrsf96JfmSC6SaawLD3e/hSoLq4mlQNV09c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A88EF805AB; Mon, 20 Jan 2025 11:02:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2482F80631;
	Mon, 20 Jan 2025 11:02:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AD4AF80424; Mon, 20 Jan 2025 11:02:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::623])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B25C9F80517
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:01:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B25C9F80517
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=JCPY/3P7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GE3A9W9qnJPuvSsMD2ln4777oLJTLy3XtiTHT7dDHUJlWrMhnfOkdFUQQTXaOyxSNroDNpUZuRRTh0w8ALWLN75BKLMYO9AokGvbdA348Eyxt8ptginzTlLJSNfmjzsXMq0FKNXE+aVor3gzNYwG8Lc7Xn6JfZZZ07SEUsEGXuYLwj0lIcovyLgUcdDQUguOJVBhw+2Hs+Ct3SSXezxLQflvXY4Jx5lAf/9TW9TMekevSwUQumqYL/C+0sSOinkBzuygXmWvaVmXk18n8lxDyOmD1BA3R/5GIxOtWOpW3mHGj30QwuPaNHW8cNZiszalyC17WmFVIxZEjayHk+v5YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vlNkV/RtEvW3xa84teBzsXeH9ffrowFb0rpXfzlQ8w=;
 b=w3rnDeFJjW++AzQypwTfph5JdEHzCJQOrj5Mqc++8aR6RB/y57BkPDlUn9NYVMszRUd6jlfPQYTbNz4CNcvk6ILec4t5SKdDZSdgH40HMTFejdJl4ciUajE67fRpxA9o7AfRvuj823tL+JvvE1hlMAH2PikOZCkMjAf8tUehZdnm0i+Uzpc+w7xmBIeHbAsBhp1r1ZRTaXoRYPrLX6fwxdgP9DqGIeBv4qEOz75Yjx83GRP5qDrRCODL8J/A9mbqq6pUJtSsGkylZNlIoSV48ptJCsyrGBQcBO9pnduuGK8KKkzbsU0qcJRVS3nB1A1Y7wGy7cb1HPYFv2T8hfmxew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6vlNkV/RtEvW3xa84teBzsXeH9ffrowFb0rpXfzlQ8w=;
 b=JCPY/3P7rZkdOJT59CDetfPS3UGm0fyXgq4NIo5B1B4ciZSvl35iMIxT7h31xzlcRJJil85okB3NoyRbaWw40XcuVHspp2KPpdUOyghr2gxUtY8mD0qLoxEYU/UP9A4gg3Oa8pQc3T+ItITdE5aqbDonESBA2Et3J+AH53bSVxQ=
Received: from CH5P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::6)
 by SJ2PR12MB8740.namprd12.prod.outlook.com (2603:10b6:a03:53f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:01:50 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::46) by CH5P222CA0014.outlook.office365.com
 (2603:10b6:610:1ee::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Mon,
 20 Jan 2025 10:01:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:01:49 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:01:46 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 01/23] ASoC: amd: add register header file for ACP7.0
 platform
Date: Mon, 20 Jan 2025 15:31:08 +0530
Message-ID: <20250120100130.3710412-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|SJ2PR12MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: 0218c57e-551a-4161-c781-08dd39397540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S2LWuaOaZwyVRs+d57n63lkRWmfFV+GxvsCYrx6XeGGLgKIj6TY8dSNiODR4?=
 =?us-ascii?Q?mQ+14ZxdJf5cEN4yJ2kgJYnYHGz2KniR+jEaArQkIqEYfB05k9ikPM54ta9f?=
 =?us-ascii?Q?mUoUQgB4mxYoTDOAHJ4A1bH/Oi8tS4t/AGzJ4Xd9aPkbIYMEtWpFqgZuIPOR?=
 =?us-ascii?Q?mpd2aobO/gwk+n73DurlJlvJMhC7U04O6rOEU0Eu6fGJK8WLIE7vABtkjEeG?=
 =?us-ascii?Q?I7gqCRZBxihATpZWt2D0xv8plKRi5kU6rwxfpHzl/5fmnXBdaRJ/ArhUGNqJ?=
 =?us-ascii?Q?u8W66glh/B6LyxATpwYn+5PLelDv42aiBGs+8O9SFwrs3OIt1U0huA5VOaaY?=
 =?us-ascii?Q?v460/1gXSHJv/Sd/eChKpNcL244NRVD5R6jRGzyOwKDEvLbuPHNL5e+Dt1SE?=
 =?us-ascii?Q?PuEU3KmCtTQNaIsgskdLUG/DgzWLDI8k7RqtYBVHwqvMrAwxI/BNDPU+oj+r?=
 =?us-ascii?Q?vLa9NOQXBoUWjKjeeEexAHDfk0P8quyxWJqQE9XvJGYHS+pMNdDiXoZxiWPt?=
 =?us-ascii?Q?rUq/qPv3VqFon4vUNe47FZfZ9bz2IdlefcAB1tcmRZl8eSGWi3mpTuu6QuZ8?=
 =?us-ascii?Q?efHA023/srl5XLUkP/BNNKfiKAtNPbZBrk4c53dq+PCO5cIigBqLRe8PF0ST?=
 =?us-ascii?Q?sZ/WAX2X986PRolWKp+Ts3Yw66U9y1wuOIbaRMe3zkRsFypXGLdFYW19K1KX?=
 =?us-ascii?Q?FF1UVw+bYZkk9AeByQmJ7e8ys18noRQIrnKBOIoMJL0TCHUzZqfGeZRLaDKN?=
 =?us-ascii?Q?hxSTsTVSpx1wihE+tKnx2IQld59BWLrVr78hzFoHe5OYoXgoXUqwbzJyegqo?=
 =?us-ascii?Q?AnJxg0kQG2V8K5gDFhyimA8dnNM4MtW8Hi33THp463Zb3rtK6TfqQK7B0P5O?=
 =?us-ascii?Q?kmEoXvPLnRb0Qm5S6U4yTziF7J+gzcTDXpqva3lG9/fTpdkRcFRoqWljEwRz?=
 =?us-ascii?Q?UL2pCSA1zDhmJDkH6CJrVzGCaKyX/81ykHuzjpW24n+ls1IGHuq/vNaxLMVI?=
 =?us-ascii?Q?ZMF/vrfbDyIIFdpTsrWa5O45vzT1+T9IBqIiDGOpX7aMoh3zAGa/bxrOhj3X?=
 =?us-ascii?Q?BpQzZjxjN7Y4RsYNCJc5EHgcoIhXzqJXGOazXcMtC37W/QzapPGTuNZq3CVH?=
 =?us-ascii?Q?t6TyX75XydcXtaEKmi1fD+K3dowl+huU2a/4fMWfSXqiWtQnMXXuOZaIWNre?=
 =?us-ascii?Q?2DGbVu5V8eLj85dFZ/3HUeKKQxnQAa6SU4IrxIE0MdP+NUVXSf2NRywIVI2h?=
 =?us-ascii?Q?aMLAvId7Ux6VuxHrUEDJVfC+fLgCfrGmxi1pmtIschD2GrBKB73VHXJ6BMip?=
 =?us-ascii?Q?Uujd6L54nuOeG+5dmSi8LIH45BMkUeCKZLHFG9D4D5HlOCHDJFspqM9Czlrj?=
 =?us-ascii?Q?y92xveII3CHnig/SjwmH3Zji+QnzpdS6r906+NLbBVEFxLmHd+tmtLxW8kFn?=
 =?us-ascii?Q?xgb8jF9jqFnws+bsgDX2DWAizF6YZ5HKQtCySbyzhnlwcOxXUTdsx9fQ8Qap?=
 =?us-ascii?Q?Ij4OYt/ow16YJ8o=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:01:49.8795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0218c57e-551a-4161-c781-08dd39397540
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8740
Message-ID-Hash: V4MTTTARTANWLQIZ2A5ADJMQRDRKJ76I
X-Message-ID-Hash: V4MTTTARTANWLQIZ2A5ADJMQRDRKJ76I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V4MTTTARTANWLQIZ2A5ADJMQRDRKJ76I/>
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


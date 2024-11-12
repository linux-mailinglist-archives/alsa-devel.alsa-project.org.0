Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 609D29C60D4
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2024 19:52:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01B3214EA;
	Tue, 12 Nov 2024 19:52:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01B3214EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731437562;
	bh=JCArq2paes462V82FvolIinFT9U/GeOLXOi2cG53vD4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ElE/Lo8wZjkRPyqCgZkM5ARKp4XK7fdNdYSK7XwUCLsoFFSupNbA6qIy3m3cX0Tth
	 IsCtNSWXy6idBgd2SByIj7LyJ8BkWzLlA3/FiIP0LevIsAb8aeRhrf2EuhFFnoYDIs
	 LdWAKSdBF3V1HORi0KetBmGHx3ET28Stpcz+Xb2Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83DC0F805C1; Tue, 12 Nov 2024 19:52:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C59A7F805BD;
	Tue, 12 Nov 2024 19:52:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00C26F8058C; Tue, 12 Nov 2024 19:52:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::61e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3B77F802DB
	for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2024 19:52:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3B77F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=NvyNiMJ8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VG3M10u/hmvGrscZCLCysxRtMRzZtl48eeSXUD34kDLafbtam4oEF1JBHVHHSbGpP+G5H0C0BDeiAsFIiwAslCL16gqYwdmW9ROirSR0IC3UFIaD0PxXdrcVYVdexf7qte663oiq9Twqi1btfiN+7uLwKhGWxQJ50RoOm5IUcFJ2sapOyMWXkbCndPj1Z+Fy38gMH7fnKxoaDhhHYucgyvDNhFyawNisk/QGOYPGcOF9wRCOCp0HE+xIoDukPBehrwq5/oK5jLjMf5sMdqvoO3IPPSvfJL0+8wnQrY+adNRDdasSiqNdOk1aODeYkoQOwQA8NB0lXqfjcN/Ttuqxtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tB/zHa4I0nkrecKYF8loAUxBra6/AwysO5/gHTQRL4=;
 b=ei3+QvwdD/THngXEyUJtKFsvgU5QtqPyQPPfPHpeITjTMOK8OW8050HCz18X5o2EVvCd5AJtM+cVQfWrj1AlxReAnJ5KxzWSo1kGpQOtyaqfwpE5D4T/7PnQuONvhHsPeQHSue3tcZitWaeAUsumfMGivCJrJTKopN7gKzY9ulJTeas+cmd5z7sIc2YhH8b7PfZcvSJdz52DY36s8NNxvRSD8PSAUfYJHLVbB/nnfCPEJlgxr2EvPDy8C8bj4iw8+SWIclkxqdTnFteKtvVXUqsE5JenVZLHsI85HooxfMdRygNagt4ukcsP9nITlLvAGRKHHP26w3ofkd0bzCqM1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tB/zHa4I0nkrecKYF8loAUxBra6/AwysO5/gHTQRL4=;
 b=NvyNiMJ82pCh+RVmBrrqzW7EfHt80I1WugcslqlCdXsSZT6Wy1XaofH24cDcRjsNYxTdZT2YSnzfPAPlvs7tL6QvAV8y7O4k+pRtpLqRf6BBHGMsxQD6Rjo5nMX1Lup9JjSUV0Ja0Zo6oVMVP6S91FAH1JkUNECzcc29TjSgRQI=
Received: from CH2PR14CA0003.namprd14.prod.outlook.com (2603:10b6:610:60::13)
 by PH0PR12MB5630.namprd12.prod.outlook.com (2603:10b6:510:146::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Tue, 12 Nov
 2024 18:51:55 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::e0) by CH2PR14CA0003.outlook.office365.com
 (2603:10b6:610:60::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29 via Frontend
 Transport; Tue, 12 Nov 2024 18:51:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 18:51:55 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 12:51:51 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<sanyog.r.kale@intel.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<mario.limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH] soundwire: amd: clear wake enable register for power off mode
Date: Wed, 13 Nov 2024 00:21:38 +0530
Message-ID: <20241112185138.3235375-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|PH0PR12MB5630:EE_
X-MS-Office365-Filtering-Correlation-Id: b15ee624-0942-4259-7e0f-08dd034b1453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?O+cfNXX/gNZR60He+gxfIGlxe22x4nkEBx2qzE/FOZQ5E/zmp8x//nL2lLQE?=
 =?us-ascii?Q?ybB4YKOHt49CvRkmt0zNBfNvoFBXwL8rz3wcO7KojxzXz4cNsJhg4PSk4YOF?=
 =?us-ascii?Q?PfAB5zpa78nQozeXZDP/gI3NO1RTfsbZ96ddD+vWT7097BQGN2EV9Q3Rb4zY?=
 =?us-ascii?Q?DUoXtjYV9Z3UEHD7Y0K0RDlTCAD3GFOEvgLCuBgPE21798sMdTQUy41atr2d?=
 =?us-ascii?Q?9KLl0+3R8ScX3fJ59IhKSEOcXIv/8bS8EHGcwqnB1UCHn71XDbd1qshgaoKB?=
 =?us-ascii?Q?DOwPcfJjGazsIAf02mU7GCAI3Xt+d8nxmVOYbbA4IpvqzniqBBBMH1mjxHjq?=
 =?us-ascii?Q?jjPUqxMdjCtB8YVzEzuSBaIapcbSN2GELXDUlrNQ2h6bsF/mRyTUf+NsKZ0T?=
 =?us-ascii?Q?470R268WiZ84LpL0sclbpbPG2MxnIEJm7WUZiiqI4UyTNMyPFs1Rxu1c+/pi?=
 =?us-ascii?Q?yL3g7QtV2glOdX4imMC/9WFE5rcf+jT90xgmv7c0dSV11//gn0OVIT/0iZj/?=
 =?us-ascii?Q?nuFPYceFXhHDr/j/r6NDJW4w7UvVHWr8yns8CdW36weoqb8aqv+9ZOrAk28S?=
 =?us-ascii?Q?Nq2YecMhx8D7BaIEWpHa7uBIMwsqkeXeawFSk/oYbLMSnjcLUTxo0mPmef78?=
 =?us-ascii?Q?du4eoBAOESWJftN997GHcl3ft/fjHFQXYsQBf/QpNqFLf4dOqkKA9qDW/b3i?=
 =?us-ascii?Q?O6qFXCgVrhxPYYRp1u/XnV52kok36c3L8EuuSfnnEHa8CqcZvQB0aqFgyB4D?=
 =?us-ascii?Q?b9NQk0+1LAlWDqj00oH3NzWW/CS2m5Te+jV8WS+nIp1UC5I3wTotVF6W3Hii?=
 =?us-ascii?Q?+BPBbaSpk/xMiGza7ISGlnb8mH3t8aZC949Bms5nqU11NABq+fsiltU/O3MG?=
 =?us-ascii?Q?lNSM/HoyQC+58K4JAHt/c/k1iXgArxuKCTB3gyCktrPMg9PutP5ILwxlFgfU?=
 =?us-ascii?Q?aBQLyfSHfQhyYg65NYL6oj80O6FNZdnPlHw2FqfdWF/2aFu1xSsYLGMgjbRw?=
 =?us-ascii?Q?xJDULB4RJHjUX6M1w8XyAI0QS7fDys7ayOqGT+fUVLmMt7dTIVRaa3jVzlfR?=
 =?us-ascii?Q?c6wR0OzGDMidjmiFni2gfvshMeJNJJSU6H0d9FJ1NFLqgwLDh2KFZ2qbLXq+?=
 =?us-ascii?Q?c3ywlo/LrDXzIguK2h07kN+0QNI5mKcOgABqU3oeftd7tgVxuA2s1vEhpyRL?=
 =?us-ascii?Q?Eh7CQmG6if5IvOgHpmjHaOiAvlLmG8QPPiXWO/zNuEIAO5dxDu3sbCXVwIZ6?=
 =?us-ascii?Q?5T+PZsIMckYTDGiw+YePHq649DYtLVtr+DfvKP5L2vWkGrn0DG0l9dzG4C4n?=
 =?us-ascii?Q?ZnAYFhdCZyIQdWUB+H64YajM0Ub7vsO/S4yQXLVi34npZSm5GgBCGlslIPJZ?=
 =?us-ascii?Q?XifB8vABTNGRwUqlzXSGf3v9Q4wWs1gSGAeyk2bMW97oPQrXRA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 18:51:55.3987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b15ee624-0942-4259-7e0f-08dd034b1453
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5630
Message-ID-Hash: PQEO6LN2KJLZ3N5OX4MK6LEWXKJEU24B
X-Message-ID-Hash: PQEO6LN2KJLZ3N5OX4MK6LEWXKJEU24B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PQEO6LN2KJLZ3N5OX4MK6LEWXKJEU24B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As per design for power off mode, clear the wake enable register during
resume sequence.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 5a4bfaef65fb..96a3aa6da711 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1190,6 +1190,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		return amd_sdw_clock_stop_exit(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
 		if (val) {
 			val |= AMD_SDW_CLK_RESUME_REQ;
-- 
2.34.1


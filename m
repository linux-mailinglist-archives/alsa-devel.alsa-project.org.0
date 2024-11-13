Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 448D29C6E44
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2024 12:54:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39954211E;
	Wed, 13 Nov 2024 12:53:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39954211E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731498848;
	bh=0S+ZRHiGH6w3wz7JpNhUIspIr3uNOjYyJRXQjRXoa7A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XrE0L/rFdWu0usv39ixch6XWrretJTsedD7759aW6FlaTlrNSnuorVNNtwQLZlAFm
	 dNhQ4E18khCU0enD9XdiE7qIBqGZ26NI5olLXjGc7yHlIV2ntUfxeCNxY7Beqxyvsm
	 qZYKx+Mr/zRSc3VCd6DmvjxXKdvC2uSv60+7X5a0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 402A5F80610; Wed, 13 Nov 2024 12:53:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 279D3F8060B;
	Wed, 13 Nov 2024 12:53:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCE1AF805C8; Wed, 13 Nov 2024 12:52:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::61c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C4E2F805C2
	for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2024 12:52:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C4E2F805C2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=KqCcQzwE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPpEMtnc7f971tTrfA1bNddqzxkIguZWv6o8yjccQ3NAqfj7ykZHql/wuNTCbUkizq4AQ5hjIbluDyc56VH8xaS4gBqc7pvsVlxgqOrl2P83BLOXia6dtyh6+VqHosjxaQNboUHlTLBW8DeYK7xP11M7Ec5A+pY7T6B4LsDAN5ZHw+SXWGh7HCRM9EClKK630rE4QeM4iyEZIroN5Af7PpTqwA0uTjHOZHAwM6utykPQS1uLvkawcQrO69vFX+Iwyjj4cyeoIYZZ8fLJrVFD7eLhc2gJM7ld3IzglF802XO/VbBZwZEZfT0lK2JajTDJci6SLUgT+czXD/stOZcgEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HVZq+tLgFHS6AuABgRzstlxDW5DDNtpFwHBZZ42JGo=;
 b=qJNbVqtt+P5+brgP870x/+RuVNdOJd/uWd6B/DXf0v3utG7pa67KRlkd2gC0n/h2DZRPuiZsc4+ApZNzSpqwo2wcjfdr+f7EqYeozgk2Xil4yX8PWxerkWD5/H6JqbpSRyB03OUni2SmGJaCkDNoEwjqNwILdkgDbUZ89ClMkk/3uBMN8JQ3s8hZXnp0MQCEcG+VEMbr92I3swiwUOXsF0minXXh1NmA6eqEqQRsY0Q2bVgLp6nmlZGeQKI7KgDv5SopjYYS89mLwh/KW+4LY3hH5F0SwNu7fW08E+J5EjZPO5EMVX8dBWnjGcCKRPfq/rjsSnzoPmE7PM9aYx4pbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HVZq+tLgFHS6AuABgRzstlxDW5DDNtpFwHBZZ42JGo=;
 b=KqCcQzwEFXDa8gKVs5QzYQwDrItQuen9m3z2m+uU4zdAvwn55FY7kbRrNUcSWoRkkKCc84mPxm4Jtexw9W9p5eWGKXVtCtuRHxngzwDNC3QYgtB3xiF05F5zWezA0veL44DrB/2P78IEVS7aOqpFdJgW7uEmoCau6294FLJzXxM=
Received: from BYAPR06CA0019.namprd06.prod.outlook.com (2603:10b6:a03:d4::32)
 by SA1PR12MB6896.namprd12.prod.outlook.com (2603:10b6:806:24f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Wed, 13 Nov
 2024 11:52:52 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:d4:cafe::d8) by BYAPR06CA0019.outlook.office365.com
 (2603:10b6:a03:d4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.16 via Frontend
 Transport; Wed, 13 Nov 2024 11:52:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 11:52:49 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 05:52:45 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<mario.limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 2/6] ASoC: amd: acp: add RT711,
 RT714 & RT1316 support for acp 6.3 platform
Date: Wed, 13 Nov 2024 17:22:19 +0530
Message-ID: <20241113115223.3274868-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113115223.3274868-1-Vijendar.Mukunda@amd.com>
References: <20241113115223.3274868-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|SA1PR12MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: f35e49ed-9a2c-4a22-23e5-08dd03d9b2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?N1tIvncG3Aok6khfvA2H1151DUx3VLYu8odCy9eMqpkndrN4RqyffOQA9B9U?=
 =?us-ascii?Q?THWlf70YE85T7HwoD/ClD0wFxnDNCb7T0be5aAMEGvEPQkKvhtuY6J/78AGB?=
 =?us-ascii?Q?1Un0m+x3lhpnz82FK+HOQxB/syjrKbHVF7q0fPf0mUN5dw0Ra2EUdV5xsRjW?=
 =?us-ascii?Q?2KzL7soM+AVCXvpCBlL8IxXdo7W5l4NTqpvnsZOXpRpL8iSVRJ6x0lDH3uo0?=
 =?us-ascii?Q?dXJ6Lfs33tYxc+eN/ZMonX5+NJD7QqlIepAgFIY8+0s7J3QnkaHDH8SDc2DF?=
 =?us-ascii?Q?u4G8dZqtiKlZ85KZTRcAAK9ChRA8bwnu8oBByn1SiuOIIk6jXQcgGziOjUP3?=
 =?us-ascii?Q?DmJql4ooZOb3Wcw2XObPyqrHdLQjoCGgFaoIT47ALMBrjGj8RNrIJxtXPOMT?=
 =?us-ascii?Q?KALkkWPU5pd2mpkvGsFIdMwIMOr0LQ9VgVGEKy+uLIT4O2GFqPk9UYNZIUwO?=
 =?us-ascii?Q?oE4sBJHgMPCZMAs/Oqsggr4dvm/b3SmMs4dCXtpitFsAMM0iC/47oA1cOApT?=
 =?us-ascii?Q?LBJ6m8xHtmahzPcEuXDYStW1+KlSlGHQdQ2jDEpGxOZDUM2wDrGulX47lHzp?=
 =?us-ascii?Q?T0Y7x6RPMTZBXPla2MkvnxbWDuAKTNIy8GRTkB6+aQF74GQixXVULQZkB4t5?=
 =?us-ascii?Q?XmBvcmpSRD8uMCIGAfgbhb57awUGGL07WZ8pAWC7j/8U0oSVfwLsauQkJWvF?=
 =?us-ascii?Q?7qiFBBSbhtWvA1hGDN2D5rWttIP0WwIiK/un3J8r7L3T/CVlEY00ZtA/MANS?=
 =?us-ascii?Q?l6QuOYQ4fZRgG7VuQm85WuzcaJkZBQLe0KwEN06CK4m3tufxLzlrtZ1LxzyZ?=
 =?us-ascii?Q?uTTXWd9DAPOPBetsQSJWcqjIE9TuUCG4ksm/INv6M+P3NsYZPu6OGD2shMQP?=
 =?us-ascii?Q?sn+2G57nAN2WBrxx9XgTCUu9SPeBFnkCKPT3jP1ODJLzcN99C2Xnln1C8HsJ?=
 =?us-ascii?Q?V+FC+T+gkNMDDiSb0aNHKJZSK5cSmGj3aSCWyzFaJ1h++0spMtSWshWJfMnj?=
 =?us-ascii?Q?HL4i0DNOAVR4uxnbDvkPTh9zoRefQ4JxsHgLULoWfgeeujXvBxIXIVm4xERz?=
 =?us-ascii?Q?vs+xuVUpJu+s5eEN1NzzvWe+uVGXR6dRzDWk7mfKu3FD/A8LP3dhoxMJzXBB?=
 =?us-ascii?Q?RlsLGxyA3JfHOshXWr7Qvby2b5jarAqlKbkNRcUAc4ZJM7/mV9AtOOhu8JJD?=
 =?us-ascii?Q?PbzHxHbj+KWkhEFC5OxU25VVB/6gXm13NhYIlUXGChbU9A21jPJuOo3j0ALw?=
 =?us-ascii?Q?uzRqC9YPSH3OjFpRpLASWG6a6lG8BZSbj4BeZYHI29pHtlPvhBoyuIMYDN4g?=
 =?us-ascii?Q?QxFCI/cIu8/Tpn8YoHgviG/SNIFdfqMFMcN7x8yMlcOXwdJt9RXtRRZO+9tp?=
 =?us-ascii?Q?TxKv9VSqLKqvxFhE85RAWwkTHSH4p1yMn3r0U1RSjQomAaPbjA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 11:52:49.8282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f35e49ed-9a2c-4a22-23e5-08dd03d9b2e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6896
Message-ID-Hash: OENMUEHNSKZMH7OZYO7EGSQNOM6THWEH
X-Message-ID-Hash: OENMUEHNSKZMH7OZYO7EGSQNOM6THWEH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OENMUEHNSKZMH7OZYO7EGSQNOM6THWEH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch add supports for corresponding codecs on acp6.3 platform
hardware configuration.
SDW0: RT711 Jack
SDW0: RT1316 Left Speaker
SDW0: RT1316 Right Speaker
SDW1: RT714 DMIC

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/amd-acp63-acpi-match.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp63-acpi-match.c b/sound/soc/amd/acp/amd-acp63-acpi-match.c
index 5e506c9e3da6..9b6a49c051cd 100644
--- a/sound/soc/amd/acp/amd-acp63-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp63-acpi-match.c
@@ -130,6 +130,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_sdw_machines[] = {
 		.links = acp63_rt722_only,
 		.drv_name = "amd_sdw",
 	},
+	{
+		.link_mask = BIT(0) | BIT(1),
+		.links = acp63_4_in_1_sdca,
+		.drv_name = "amd_sdw",
+	},
 	{},
 };
 EXPORT_SYMBOL(snd_soc_acpi_amd_acp63_sdw_machines);
-- 
2.34.1


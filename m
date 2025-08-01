Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8A1B17CDA
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Aug 2025 08:25:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87C6C60244;
	Fri,  1 Aug 2025 08:25:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87C6C60244
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754029513;
	bh=cZ5s2OXQ5oLqXxuq32kEJjhvIJ9Yee285uqHylnjUis=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KJEgy+oAN8b879FgiwTNLQ+12Fp/i+77skkJnygCRCcsIsvMVM2XZDpqltidSxy4p
	 BTp32/qjoSD/yr33IVZBoBFHJ7aSJWzReFbj2Ysz7T/qFVFW6PgBEP0w3f2OCzkhFN
	 yrMfn8Z3Dd0XvJ1vvg2d02kqny4xy035JdgDCjvc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C93B4F805C5; Fri,  1 Aug 2025 08:24:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7465EF80518;
	Fri,  1 Aug 2025 08:24:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 775E5F8052D; Fri,  1 Aug 2025 08:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E8B7F80086
	for <alsa-devel@alsa-project.org>; Fri,  1 Aug 2025 08:22:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E8B7F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rxVv5jfo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QodQ71D++3erYfSGbCtQruFLlfQ6Kzb+T7iZJWpVFd7+68OE8uSp4dCoBtt7l42ZmSUlJM5oBPfQttgCxNwgRrqNDJhWttRjPCJMb1GA8+g1fyG2QQXESu3/KdGzLf4ZmlW3yzJig5tdR+HIXploIW/FnMrOY77L0R8IQzdgPVCiCc9rGEoiujIkBLVq9LsbokcaCYLwL/W5K/bErxjY6czo3PRQlwLpI1R9i3H3Oj07EIz0K8x3go9yCVv8ND3lTXwcfd/H/ed2VWYj5DsRmRb/OkB+MbVulan9CzyHxjgVWkvN24eM6MR5mm7m23QyblqI67F96z/gaST87CQNeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtEocplxdMpGAAVO37DqoI3MFwhzQbyw73a3a5LmC3c=;
 b=mPv8bzkxy5UNDGsW6cQAZ9JRdZNWrNFreKedRfVS5Dbu570+Rug9iisxPNOAaWBtk04XP1/a7hfgjv51ZPTZKVY2uL3lPCTl2r0SNiih6aNqs3RIv1SBlm9ylUpKV+ibJmeF+2fCpVEvtveMJYQ+T/6RqGo7RvN0pvFRA4tYTqBtyP2SOrwslQQe55LxryrSLt/ElV5tiqp+KGTVHb34mywrQJkXffPRRteVUi29JXhooEutG/pXlPFzAyMz4h5zfaX7H3oBPerirC1C6X7b3356blx+vAH5yFHpaYx5pNyNdQ1etDY+7kOIlvvlGB0kIu0zrKVo5xtZz3mrEVeGtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtEocplxdMpGAAVO37DqoI3MFwhzQbyw73a3a5LmC3c=;
 b=rxVv5jfon0y+qkrfmck5Yl+0kLxFcbZmWCmKJ8YXcFqmRj7szjvxM//qA5M3/LzBYtYpaAsv1yMhAOvs78geoW1p4FWdPCBXzKgu5UCmHJDFHI95Q9JdTziWf6PJOp5sR6qEz//ujK9lwWfXRv2E71D52YdZJk9Hm2ytJp7VIF8=
Received: from DS7PR05CA0046.namprd05.prod.outlook.com (2603:10b6:8:2f::14) by
 PH0PR12MB7469.namprd12.prod.outlook.com (2603:10b6:510:1e9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 06:22:11 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:8:2f:cafe::e7) by DS7PR05CA0046.outlook.office365.com
 (2603:10b6:8:2f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.5 via Frontend Transport; Fri, 1
 Aug 2025 06:22:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 1 Aug 2025 06:22:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Aug
 2025 01:22:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Aug
 2025 01:22:10 -0500
Received: from r9-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 1 Aug 2025 01:22:07 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>
Subject: [PATCH 0/4] Add audio support for acp7.2 platform
Date: Fri, 1 Aug 2025 11:51:34 +0530
Message-ID: <20250801062207.579388-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|PH0PR12MB7469:EE_
X-MS-Office365-Filtering-Correlation-Id: e834b1a0-aad8-4284-7018-08ddd0c3bfe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xQEbVW6QkId04ogWV1j6Pu7acYfhAPQ+FeBD9f7YDAzASlOUKojHEAKmcAQD?=
 =?us-ascii?Q?KsCxi/jU64V213O7vpmB+D2YvqL1VbO3BgrenaYx4stgcnW+vuHMnXlFyhdf?=
 =?us-ascii?Q?3JRbFAdJmhBGkSZ96BxX6/jqpGe0aL9YEiG7qEVRHrtDJbkay4wFmA2usfRY?=
 =?us-ascii?Q?fpOaYd66imaeWWloWu1WqrDhRMQ260fXuPJkq6EdsjBrQYY7TRe3exTq1zsE?=
 =?us-ascii?Q?zTTOlsEiyoXJdxUMQmWwWtcXVkXk5Ag42JpVVpN1smNOH1JJ7epFNOk3wt+U?=
 =?us-ascii?Q?jtVlrKkkndsXSf6ylJV0cbEGu51ikUzKtV1Ht53EV/mCbcPBV1yoWegXDEiU?=
 =?us-ascii?Q?sptgqGX7y1vPgV9aooXJpkjUeQ8mAB12Xck7ze6RAp2ATc2fe/lV/7cr5ISq?=
 =?us-ascii?Q?2MeaOP+dr6YTmg9o/st4+mrWZKBonMH+BEbi/5noPsZvgjeAdR5QVG4FX4Mr?=
 =?us-ascii?Q?M0eyPIhxm1hxmPrSREIjJIyfKbY9uNwUe1jWyP+74NCYnsiqEK1zQAStVt8S?=
 =?us-ascii?Q?DZ6YzbIBDl+0Jhg6qxChGA1/FZzMbIOs0n397+xJPaoJLlLEpEvsnWVTbhHO?=
 =?us-ascii?Q?1RgM5q+vd5E8rTm+Pvn5S5Irv6MmLI0MML1Pg5hQNjA7G3+a7o3J7KcFOmxm?=
 =?us-ascii?Q?x1pmSHPvNcGsElotkhhZTScbN0kAKLTno8wIkALDFP8R1NrZB7qXukN5AQim?=
 =?us-ascii?Q?hyKmhZO5PrjZv5yPl5AaGjKQytmbdstwP+V1lLDEVhK6wBH6gIt7zyXABJQe?=
 =?us-ascii?Q?AZl7n/oHP7yXdebScm44imn7b4vwdmGrlZV4vrA7DDKrpJvb7CuoBpEcyfvr?=
 =?us-ascii?Q?/Y/38pY8pRbxC9EL8OdgVq4pE3Q9FUdDG/2g63oMcFYXywiNtrXcWE755LpB?=
 =?us-ascii?Q?NJuob2tJpRXL/OxzmBC/bwv8dfvUN2XyHAKC2FlUwbwIk5kOfzp6pQwCfz63?=
 =?us-ascii?Q?5El87UIFYPXsFyECjCL9R5SnaJL2MBR7aW6J1pscXSfUd53cws04R/n8qmZD?=
 =?us-ascii?Q?X1vUMWjkPjd+XnQBF1+hPNmVfyboDC6K1qz9JvtauHsk8TrxjjhKk1dx9qlO?=
 =?us-ascii?Q?20mPrIapLlWAQEeOr41PQPWbwTPfucoS89eMWO+UzO6r3LmaUVZ1KabE4G0g?=
 =?us-ascii?Q?HiUN670ycFYGnsK4ewzyUn4p9xyJHJb2L39zBzDE3QkXw7ZxLlRxrVnuQTyH?=
 =?us-ascii?Q?U3/vE51Kit8/DzWkGDANoC+2pOUZjDNPha9hsUJaW/11bgAuHuO/qYlFNFJH?=
 =?us-ascii?Q?TbtUshcyKWf1gUVvitSJyBvSqj+YRafBXaysHJ0ZkQZUcQ/30ODN71PKacAv?=
 =?us-ascii?Q?tmZZJOuLxRe/ApwKUH+SCGF6VOHDTLqKGP6fWEq65P6T4Vy2jRirQU/vp2je?=
 =?us-ascii?Q?B/sDbTWIYlheigeAqK+0LNoWxi1BEnBjQX8Xa1vwko0rWEagH42i4SBt4dB8?=
 =?us-ascii?Q?L8k2+07eB/dNoM2OEOyNxxlHxTpFLGJhni0AyE0x+QM+tg5Vjh1QVp4KK29x?=
 =?us-ascii?Q?t4JiqyrFZwRuYB7AnAaeH24OJG/oGbWXdem+?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 06:22:11.2021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e834b1a0-aad8-4284-7018-08ddd0c3bfe0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7469
Message-ID-Hash: EWJHSMYARIQLMIXTBEBVMNVGICHFFITS
X-Message-ID-Hash: EWJHSMYARIQLMIXTBEBVMNVGICHFFITS
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EWJHSMYARIQLMIXTBEBVMNVGICHFFITS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series is to add legacy and sof audio support
for acp7.2 platform.

Venkata Prasad Potturu (4):
  ASoC: SOF: amd: Add sof audio support for acp7.2 platform
  ASoC: amd: ps: Add SoundWire pci and dma driver support for acp7.2
    platform
  ASoC: amd: acp: Add SoundWire legacy machine driver support for acp7.2
    platform
  ASoC: amd: acp: Add SoundWire SOF machine driver support for acp7.2
    platform

 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 3 +++
 sound/soc/amd/acp/acp-sdw-sof-mach.c    | 1 +
 sound/soc/amd/acp/soc_amd_sdw_common.h  | 2 ++
 sound/soc/amd/ps/acp63.h                | 1 +
 sound/soc/amd/ps/pci-ps.c               | 4 ++++
 sound/soc/amd/ps/ps-sdw-dma.c           | 5 +++++
 sound/soc/sof/amd/acp.c                 | 8 ++++++++
 sound/soc/sof/amd/acp.h                 | 1 +
 sound/soc/sof/amd/pci-acp70.c           | 1 +
 9 files changed, 26 insertions(+)

-- 
2.43.0


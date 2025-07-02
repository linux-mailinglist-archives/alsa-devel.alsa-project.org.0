Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EBDAF1053
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jul 2025 11:45:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3568F601DB;
	Wed,  2 Jul 2025 11:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3568F601DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751449518;
	bh=H9QvZMB1eEpfgR3twgxuMQqM18u3eh7qlp6Jjfp8ZJM=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eQQv4DU1tddpUDCeWt4WxdknBtna3F9zwgA9HRXWRDa3R+RpzwtUb06abxtPbyhiO
	 41v5B1JX4DLuYdkRhM+PR2DKxC+Z+trUPSSr/nnNObkuxA7hFAaSCsfZoPEycvCdrK
	 RojaLH9Lq/8HKLRFvZLf8HmA71/TfvsqgqrXjErQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D533F805D2; Wed,  2 Jul 2025 11:44:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 378FEF805C6;
	Wed,  2 Jul 2025 11:44:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB331F804FF; Wed,  2 Jul 2025 11:44:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::624])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 913F8F800B0
	for <alsa-devel@alsa-project.org>; Wed,  2 Jul 2025 11:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 913F8F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qL7yjrin
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ku5MpaAHuaCSLcIXWPvdVnm5LmUnk6n5zQO+HgE9NhZ/Q5vcureSKf5GzhJQThDmfpLsxUMpjViYJh/jlo0IgLuLZTr4qPB0kULqck7aIugD58N34nqSs8g+TFrUjSCoJrQ1SnNwQp5fnU90xnNDAgGExSGSx3nHPyhHO2uxbzgqUNR0Aq50WmghVh/Vig0WUnhSrgVaTCivKigPIn+lJ7YBE3oHoB2IQiUe8V39tKeTNJ4cUfkjykdcDgShPTItWdQ3R4XpZ0Fm6RYkuHAtRvyV+0GBFsVkrUXmj8plM7DwSw6h5r6KZjdWjh6y9OO6V7+5HvnFoX36BQh7HHfQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBjoHZ3KJ5NiAFK9o0SEYgnxIlecwpkdNOH8Ix9L1qI=;
 b=Lanaufg+Keb91pQCUIqfMs0aeumrPAX9RazCGpWYRg8LrYrTjwwvAwzaK7fHlaoV0ZBSUQN2IqTQ3FTLSrqfvbjQheHfxFnE4KmNafCaz14zoTeal3Vmvcp7gtaFERBj8FnciPlFiFnMIjEAwisjL/C8aCh9+eH7vb/8HXBOTTwP6t+srxb1Lh9cKi2B/swtu0ybyd16BlwkoHRwipb/sZqR4hEhvYVE07NsH+gMn6hF0ImiT3xH5xYzomcrmOFyZ8EnESKnMc25DwEI/63exoYe9JMxjeTtizKoEbN0Kw0t90r8983y8dF28Fk4yWajo4cVk69xZgIT6WndoKDo9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBjoHZ3KJ5NiAFK9o0SEYgnxIlecwpkdNOH8Ix9L1qI=;
 b=qL7yjrinAI+bVBwy97fqfPr4Fagay8CwWyFIOrFufEu1uHy5xWzHPV8ETSKIx8pUtNvAoQKDg845ZA4d4RqpCdpedFw9MCNooFBhlbjfBTuP3WIXTHWN3WtPjOjOor74g/vY1VS3ZGnV9YZ8zYaF/q3WpeX/UKDRwBMsYh1WUm0=
Received: from BL0PR02CA0055.namprd02.prod.outlook.com (2603:10b6:207:3d::32)
 by DS0PR12MB7536.namprd12.prod.outlook.com (2603:10b6:8:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Wed, 2 Jul
 2025 09:44:34 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:207:3d:cafe::ca) by BL0PR02CA0055.outlook.office365.com
 (2603:10b6:207:3d::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 09:44:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Wed, 2 Jul 2025 09:44:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 04:44:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 04:44:33 -0500
Received: from r9-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 2 Jul 2025 04:44:31 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>
Subject: [PATCH 0/3] Add legacy driver support for ACP7.2 based
Date: Wed, 2 Jul 2025 15:14:09 +0530
Message-ID: <20250702094425.155185-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|DS0PR12MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d1c5f7-a200-4365-7a29-08ddb94d0d4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nTx9BTSvCzTx3f3KhguTNIqqQjg5e30fGFln3LaL0koYUEGYz9Ty8y1rvY5O?=
 =?us-ascii?Q?2ri5eLsImPUbMpmRb5sZp07VsrS+66iCBjPmRjh952bNh7fukUl6tx08gBa0?=
 =?us-ascii?Q?OkqE6wHU2SVnwvfcjImMMQ0wMZr/uceGKR6201CY/dbEWzDz8VsgkwM3Y3Al?=
 =?us-ascii?Q?bKBjFDcIXCbI4jc3uRSea8Dmj4IkjMWXZLJ11Zymz1qQgDbcZUMYSqm072aZ?=
 =?us-ascii?Q?UiRmfT2/BYTXavsxOd3q/z0DxdmTI9UZBPjAjBe345MmLkenBQUMwdmo8QxW?=
 =?us-ascii?Q?Cm5zFxTD90Cazk4muczvTjYKkWVOrDt2mTqjXJN4uOlkbySe1bHJtOXg3JVl?=
 =?us-ascii?Q?t4zPAV7VpU/JbaWV5m9V2nXaE+bvyzI/bMMSh9MdoG6xaR+KCzDVn7q3mVP7?=
 =?us-ascii?Q?4aA1cvMzsqwbTSOaZ0O22ezV+Xa6UVgrnCsra/5BRZx1P5xgxi6Ne3rtfIKS?=
 =?us-ascii?Q?U4mwolsVV+XkcjY88kSG3GEAdF7CczPf0l4USGe6+8pRtfe8MKeb9X4+L+bJ?=
 =?us-ascii?Q?J8TtpaMOYTnA7PnEH/lymVNnD5+ejT92B7Q6Vsv4If3oT1a2oDYdoLWTrT2w?=
 =?us-ascii?Q?BghMxXe/MwcNI7+eaDrcQ43srkBNm+fFbP6uCq3jEoI/tAzVUjckgOUa46Fn?=
 =?us-ascii?Q?Rj+cgoVhPwdIQFBfq0O/nGZ2944sOlah2RTd7f++miWSoMDuEfsrjViLepdi?=
 =?us-ascii?Q?F0Ic9xjdFqHETQWTNxGMno1WstGgzJ9xC0Fdukkm1dzkpziBHqxqKKlPUNCR?=
 =?us-ascii?Q?lvvOfL7qxgrzkR7nxFjVn8CdMBitSW9AcD2t505tccCCXBpFZaCw+erEMgrK?=
 =?us-ascii?Q?dKi3PLjw/kZYd/RIIL2nLCo0x9/ZXHaTSAGyES2hhu2AzYPlIVA9TP5wBfls?=
 =?us-ascii?Q?FHkBFvQeDeGC8aVUWCfA9lHdztyT8eFi41C+spqMAJqmUbpya+mbdJ5FMstn?=
 =?us-ascii?Q?H+M9iHyL9siwnhBXfswbk9ekruf+I5k9R8mrIjWhxP28ZnenVk60T/PBUN+0?=
 =?us-ascii?Q?TpiASW5ooTi56dO7TYNCTMu46Tcq2IYKDabBWijH5NQMT3b4eN54ITBuItD0?=
 =?us-ascii?Q?NHKiW3XXXsXdVfLdriZ98KJ2eBI8DIWRr3kKQYXu7xgLaDO/MYl97TwAds54?=
 =?us-ascii?Q?UD4NEq8jLqu7M/Y420Y0SYbIIYy6af71KA3mPI4znLjIGkqjprjsB2tn8TNN?=
 =?us-ascii?Q?Ykx7KsP6CoTzZ2v1/6voHLDIR8lNajuGCQ7YHHZl0LtgJVgDq3+WlOTdSuQ9?=
 =?us-ascii?Q?Gf670hLK93kK1yuE6nTJS6JiciCnjkLKydNAfThRRHnLM2mCQlR+YPSeQbYv?=
 =?us-ascii?Q?Mqg1auARxL3/uzyuOr+8M9xZTzAl7yQEq7+2MdPc9uYTw7wpzrNhcarjElc7?=
 =?us-ascii?Q?wWd+MlyWYyWCOdZn4atfWAeK9N/5uUGOTFnZJupv/k0RJr1zlj6+ejrzw9rQ?=
 =?us-ascii?Q?bvT7yo/ipKl2d8LjGw3Acbnca68772cknh7xPG+JplTDqK2D1zDPT6eKBEFU?=
 =?us-ascii?Q?vX+SPZDlcM/atKCkzjdG4BALvG9KQRaWygMV?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 09:44:34.2828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 93d1c5f7-a200-4365-7a29-08ddb94d0d4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7536
Message-ID-Hash: SRBUY4VIT4JHGJEKJGKIJCA3XHBQ4PRR
X-Message-ID-Hash: SRBUY4VIT4JHGJEKJGKIJCA3XHBQ4PRR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SRBUY4VIT4JHGJEKJGKIJCA3XHBQ4PRR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch series is to add I2S and PDM support for ACP7.2 based
platforms. 

Venkata Prasad Potturu (3):
  ASoC: amd: acp: Add legacy driver support acp7.2 based platforms
  ASoC: amd: acp: Enable I2S support for acp7.2 based platforms
  ASoC: amd: acp: Enable acp7.2 platform based DMIC support in machine
    driver

 sound/soc/amd/acp/acp-i2s.c           | 3 +++
 sound/soc/amd/acp/acp-legacy-common.c | 2 ++
 sound/soc/amd/acp/acp-mach-common.c   | 1 +
 sound/soc/amd/acp/acp-pci.c           | 1 +
 sound/soc/amd/acp/acp-platform.c      | 2 ++
 sound/soc/amd/acp/acp70.c             | 1 +
 sound/soc/amd/acp/acp_common.h        | 1 +
 7 files changed, 11 insertions(+)

-- 
2.43.0


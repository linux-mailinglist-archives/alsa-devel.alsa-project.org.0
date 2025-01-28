Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C7FA2047E
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2025 07:37:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F0D0601D6;
	Tue, 28 Jan 2025 07:37:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F0D0601D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738046259;
	bh=zM2zh0uJM8rvEjfNegpihH264PTE4XAZU4iWLdI353Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d/LcfP5+9RlD+cAk9O0SXi7OHNAp+aYZrgSr7iJlNiQ/dMP+aHxLnHF0bmjgGgtpt
	 p1Hcp4UMQ5jFphYuUYkTDWIlfTz+n7WebJIcDb7MQjLUngebjU8VpZ3uVy0yvuignC
	 dRT16sPaV37gtcwiU8eEov8FX5ysfMagQS7V9hU4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6D11F805D5; Tue, 28 Jan 2025 07:36:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A613AF805E5;
	Tue, 28 Jan 2025 07:36:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BC25F805C8; Tue, 28 Jan 2025 07:36:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6846DF805C6
	for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2025 07:36:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6846DF805C6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=eMBvkSg9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOnCw/UdQA2NLSBpjfmAkqPqpXUrTsZbdvo1sEwhFQCrh5GFIHpyzpCMIqBr9PhYHkSQhtWIoL34zGFGT22KaiJvQV+rNWlE+VgFdH/cFtAQ8iEDrwuQGo01sSubOO245HvDz28yy8uENm3ZLMB1Hqe9F+gDq+gE/qhuOugMu6TcGRiR1I241T+vnCNJlQCv4YXA2syhP8YN5OKxDsd6NCEhmm1F2O3fQ7e2sT/KyBb4UV6AQ3nUuSdn9qkSCf4oBhm5vXK94QfVqeutNgk5Xq7Uon9113Wv942n3ukjFJtu9oNjhDvQGWUvELhn52uIPwCVfysd77PKTHpsE+sP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLKy6dTIYcrqkT+OBBEkmVnloXRQGYN6kFXV5rWHDsk=;
 b=mfnEFUrDA9xkW/uN41NGgIALfrnRcZF98NOLUlIwKmOyFHxpLGehXgSADjxWshGj785bk3c/cvOOnwReFsjxwL183qK6IU4uz2bn5vEHDA9eDJUyOlJRWrbX6sya95DHC6jjnufKe0kigEO9FSWWRy9JBqgE4RuEda/glXhmmBChlx6fbJ4Qbg8344ryxu2kqZs1XptfJ11nrX1+nDiBsZPGKQJXVkAdrOBSYbQjb6Ih83EuQ6HUkUTC9DEW0fSIDFWZ/CZMfqBcbJGeiVyz6JFtmcpaPeC5p5gTgTNxM7Fmkp4Uh29Fg5qtv0i0B1az+Y9Z/8FyghnPVlrSjkBKOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLKy6dTIYcrqkT+OBBEkmVnloXRQGYN6kFXV5rWHDsk=;
 b=eMBvkSg9qsE/YcmGalQENSmt88jjQhk/6WRWxS1Cojl8pIc99egLwgNC+hiYmhYyXvDdIxulboZkmH7DpeFSGXQwMt67GBbOWYafuUDDukak1b6YWoUHU5EPn4u1i/S6PmuhlBqOh+qUkROeTtdjKRyQ9fkt9OXHEGlyMrY9sGM=
Received: from MW4PR03CA0334.namprd03.prod.outlook.com (2603:10b6:303:dc::9)
 by DM4PR12MB8522.namprd12.prod.outlook.com (2603:10b6:8:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 06:36:44 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:303:dc:cafe::b2) by MW4PR03CA0334.outlook.office365.com
 (2603:10b6:303:dc::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Tue,
 28 Jan 2025 06:36:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 28 Jan 2025 06:36:44 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 Jan 2025 00:36:39 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 1/6] soundwire: amd: change the soundwire wake
 enable/disable sequence
Date: Tue, 28 Jan 2025 12:06:19 +0530
Message-ID: <20250128063624.1922470-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128063624.1922470-1-Vijendar.Mukunda@amd.com>
References: <20250128063624.1922470-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|DM4PR12MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: 695fc11c-bc51-404d-9848-08dd3f6621bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PjF3cwYD5g0zFhDEAHT1tyYEiUk5y8KtGFEcCUHUDsfbc6u1iWiPhXH+2D8D?=
 =?us-ascii?Q?3jdsKY2eMfKjzrkcTRQo+hkh7kFiR+CFl+FGSwG+l3qAsvColN1ljOx85xu/?=
 =?us-ascii?Q?tcadH0fka1xbStj5DBcYpxs24mtneuZ//j2yUHkSQC31m23/RKaZWhMHblj2?=
 =?us-ascii?Q?y6HFnzFGvi66UDeGvkbR/YOINg+SLElESx0vDH2w7HPjcmLqLm1tpbAwQKKe?=
 =?us-ascii?Q?MLGHb1/4PNQk+xsbA/N8y4Wdy9d8Enyssp6fq7ItKl/2HS1w3GGeVbnWgxzW?=
 =?us-ascii?Q?9XyFTLpADV6p9JbLP+YNCid2w/L57qrrvaj/NQqHTADOR2Trdi93HIyV5NFQ?=
 =?us-ascii?Q?4uHvu92byl2RtxRdofaetJi0qS0Mc+TNhEBtQarhQGNikaUjEnPkWHaM/FND?=
 =?us-ascii?Q?uma33f+kj/CI7lW047ifEy55v42ThXlRTf7uBQFjgLbsQCSvUanwPBHqVBqK?=
 =?us-ascii?Q?YyE2d2CUhwzDH7DAROxuEWkzcZl66GKk+vDaMstq+ZDcZjOWcXtCSis+ERGJ?=
 =?us-ascii?Q?fuxAi/q7PNuitQt6WNMkb9atloIZ0vFZCqiUIM8Q44PzK1JJUXOtcIyDZMZi?=
 =?us-ascii?Q?ZIxvHXitZy8MeGiww/vxUOqMHozovnGZYiZXM6cn7aNBxC0/TlZVVBLccMBq?=
 =?us-ascii?Q?VAfkfHmU+7Xjm653b7c4gegkmfR5DJLUrdnlZm/lfG8jTsPsQkO/fd8vYpkh?=
 =?us-ascii?Q?vEpVL7stI6EXKTwAqDJxfkklkXi1nztXYo5XI2pmjpVg/sVZYfN+STNME6IA?=
 =?us-ascii?Q?I5W5V+g4+DWUCt2JyLCHlPoqLVlQk+y/Xw7ClVF7Bj0V1VaZEO6wCTmRkZbR?=
 =?us-ascii?Q?QFfHcX6d5MIHfHUMy9MKQ7Ln9r5kkF5n14cznXnPTFweVXfiK+Vbg6kwsONL?=
 =?us-ascii?Q?UDUEHSG2YN5MvdQ8DHjULlj7Zow1wy8Be+Rk86/UWPcunC9yDJuS2Ok5IfoA?=
 =?us-ascii?Q?a4ivRQMlrPgsQfWT1vzfnNEG+J0VMeiusm/LQzrHDW8k4yn7AVFvAmaFg1+Y?=
 =?us-ascii?Q?YMCnB+N2krzOJcXyPS6gSDRMYCmybkPphWgHVZx8WB8FFFly9TDAZ6BB9EVG?=
 =?us-ascii?Q?6mUGfKq0Hw1BO+Jyn7g1XNUqtjapxfCslB98B3pH7ZqlTTXqyXD0So0MxleK?=
 =?us-ascii?Q?t9asf9kVxvS1PUUcFfp+Meb0cgeTn2YAbS0DvouKRaYl2atCjdovHJoaO+sY?=
 =?us-ascii?Q?4Ek2jay30NhHmGCtTb0ugG6KNxZ30bG8mKqiibshn9/my+P8xDLx1n0ATW6a?=
 =?us-ascii?Q?tfPPlZuWe7aYeymiR7qADuAR0wCbOkbmWkjS8Hmkm9OefQH4h6DHCO727KW/?=
 =?us-ascii?Q?DxPsnddpY6jIQb6gFhdZslZuj4CXz28pW2n8IkugbtzjFh9FRu/pTH7Xj8kE?=
 =?us-ascii?Q?xINzBQA3Kz+I1dD7fKp3cY3fOaJtAVV1UHq5h949jE1se3Cs6gUserktysgx?=
 =?us-ascii?Q?NvzstF/MUxbi1VZzNGjgM1q1+APQyCfugD8/ONpnpwcYSDUOD5IV9IOgLDCh?=
 =?us-ascii?Q?s3WgtkvG1YiyyaY=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 06:36:44.0204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 695fc11c-bc51-404d-9848-08dd3f6621bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8522
Message-ID-Hash: VOUNFGSZKFLGLGCI2AHJ7JEGQCFHXNUQ
X-Message-ID-Hash: VOUNFGSZKFLGLGCI2AHJ7JEGQCFHXNUQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VOUNFGSZKFLGLGCI2AHJ7JEGQCFHXNUQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

During runtime suspend scenario, SoundWire wake should be enabled and
during system level suspend scenario SoundWire wake should be disabled.

Implement the SoundWire wake enable/disable sequence as per design flow
for SoundWire poweroff mode.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 71b3cf2df89d..187006e68ad6 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1139,6 +1139,7 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		amd_sdw_wake_enable(amd_manager, false);
 		return amd_sdw_clock_stop(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		amd_sdw_wake_enable(amd_manager, false);
 		/*
 		 * As per hardware programming sequence on AMD platforms,
 		 * clock stop should be invoked first before powering-off
@@ -1166,6 +1167,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		amd_sdw_wake_enable(amd_manager, true);
 		return amd_sdw_clock_stop(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		amd_sdw_wake_enable(amd_manager, true);
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-- 
2.34.1


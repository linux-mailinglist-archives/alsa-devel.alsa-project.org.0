Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BFB983D0D
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 08:21:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CCD384D;
	Tue, 24 Sep 2024 08:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CCD384D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727158901;
	bh=NWz8knI7us9C5irlKL+Dy3yWgxoAxx/m4OHKjnCG1s4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RjR1Cjk1fTB8TKneBNb0WW5ja8CB4ubFU1UavZ9tpAuBkEeJIRELDfrwgmY7BoRTw
	 IY1Tb+d0NzLdMhtQlb/ZH645dprEqXeZGRhWsOrRpqIUGsmCj2HjF8E5uju7ySUxvw
	 mUNjcFA4d0PE4KRy42d/TwapyPxG4RItA9Ma4ZE4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6307FF806D3; Tue, 24 Sep 2024 08:19:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9A69F806CF;
	Tue, 24 Sep 2024 08:19:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A337F80649; Tue, 24 Sep 2024 08:19:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBEB1F80610
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 08:19:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBEB1F80610
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=FqD+iOvM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scS4+q9cMGm1119zJ4/lmrFAo6VkCjFGUZli5aOl/kyHas6lxgH6bCiY6Fgpg/bE7lASSE3llFjbzWrkUQsTy+OMvtTYfIiMnNaBk16t1N+sk8UCtZj6WpaJJ4PPT7Gp8xMe83erdfBlcPdHNxfaw3BXSuUXEzASD0gvu36c41c04bbqN7uTk78KOlZcYd7ddZFuxhhtRVWkvbUt3HJJChubZ3/vFZAjdyoZk0bEtYwuxdS/31RU8HWCQmjJVVsCCzwLL4dGewQh0UVxk4ZJ/X+hgThDWqfyOy+P2kNQObr8BqpPQaghbJ0+iLST8pN5DOCEuDkI8Zy112OCg0XrJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYyEICfYiLb5ugOa5VANcuKbNB31s+AMUuuyEvTrqH4=;
 b=IGcFHpsonQfwglPrrV38oU0IKkBfBdcKQUFM6fzzh3z0oRlEXQJ6Qj6O63wEsADoQzqQb9Hn89xjyp/n4eB+hXLpoRtThzLPbSSqd2hS+sQaoQs8L6aw7QvxS7MQhhH217NVxmErnWDCWcGrYZqYI8k2bYtR2o/yw2FKAj6Z35NZXNv0xBdjMzkOf1EnSeNF0A7b8Cp4GX8D/5eidTu3WWz5oRJv4F4DKMb57WstWjvrmjAhr0mJeh3pYhyfPeJpmexB0ibQQRie9bHivuYBW+MUZc/tHcmP10FQZp57/8/0KmDigkSo0tlCjn0/CVmuTc16q4yolgiNdESPb0LWCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYyEICfYiLb5ugOa5VANcuKbNB31s+AMUuuyEvTrqH4=;
 b=FqD+iOvMHxM2vEeu1VDBtNRYImb1KxZOXpGlq8IFGmxLQw5aex8XR0A/45Cl8XqUMLg6c+AaquG8OIrVZdhRXgBuG2uJXL28zkPgFyyxyN5AqXaJOLVJOtP7MHqgmQwfzXnmvk9oqEpPF43oq7DjvuvTZ8M1Mn1oARySeTjj5xw=
Received: from PH7PR13CA0021.namprd13.prod.outlook.com (2603:10b6:510:174::29)
 by CY5PR12MB6599.namprd12.prod.outlook.com (2603:10b6:930:41::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Tue, 24 Sep
 2024 06:19:05 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:510:174:cafe::3c) by PH7PR13CA0021.outlook.office365.com
 (2603:10b6:510:174::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.15 via Frontend
 Transport; Tue, 24 Sep 2024 06:19:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 24 Sep 2024 06:19:05 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 01:18:59 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 7/9] ASoC: amd: acp: remove unused variable from
 acp_card_drvdata structure
Date: Tue, 24 Sep 2024 11:48:19 +0530
Message-ID: <20240924061821.1127054-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924061821.1127054-1-Vijendar.Mukunda@amd.com>
References: <20240924061821.1127054-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|CY5PR12MB6599:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed41983-2a91-447c-a024-08dcdc60ca80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8tLRYtrTztQhC280/KIF5E66UQYX0vR1BHT+6mNWLAfG6+RLYHGJp1vUmhPf?=
 =?us-ascii?Q?mo4qWccOc6itX22TufyqV5P+s8ka1OnbAytm84V5XEfJheTeNEMi51wh4KZW?=
 =?us-ascii?Q?Ik46nJQEXBvgCENOIsb0kyfG/hTjHHFMPjJ4qWbwuQUm+2tgNl0BKaodssz+?=
 =?us-ascii?Q?yinHOPKOIu/WZ42zHXrQH/AkfsjCsXLJ4niZ0h8Ofv6dllz/76sgrJW72A/g?=
 =?us-ascii?Q?Z7WfyFlB1EfbIFyZ9r1ibbuwD6OmAwbXm2cy0nC8Quzcxb9VmSye5M7XRZdD?=
 =?us-ascii?Q?v8qaf/NU5GsGJ5rqwz2G/moFYG5uhQPBV7FIVV3gjfPKgI5QoJ4L+w/SPSqe?=
 =?us-ascii?Q?SIBRce9imlaB/gMK0/nHayIah/6eEiCbYV8XPd5xawBVMOTLkrAmBXCmdVxV?=
 =?us-ascii?Q?CWsp71AxmXgcwjiIXVJzIMQSnk+8AiaNx0OsZV+lPrFzvCqPsxnjssFpOntP?=
 =?us-ascii?Q?S3P9DBg6S3vzT2kc1MkyfvMTFD/F3wpZDEoWi/b8dhMeeku4rcnWD9el0d7h?=
 =?us-ascii?Q?X/0pLujWywwHwWfKIF+gb8Huo/Vag5YTsv0JmT8TAKHJ/3Vqg4SUWMujKTlH?=
 =?us-ascii?Q?W+Fqn7+DIvhtN+fK4jXMMZuk6wV/gqIAHB+TRBX97KtQIDa/AimkbgRiKoEE?=
 =?us-ascii?Q?fik3UArpQGgLkEkfKXgDLpEYjOxII4hsm23t1Yo9QqiXQDFmGudPf/07IXGy?=
 =?us-ascii?Q?qZtyP6gRkg3/yJmz6RA8F4kTRYo4XzzSNkL+Is7YHhaBvMP1Pppied68UXqn?=
 =?us-ascii?Q?C1+0ssovJmmlImUZTEnpNVWiatjeEsosuuWFlY2ej3NH6w79YfMACFqnyzEc?=
 =?us-ascii?Q?LQVBzVj88M843bQ6zOWYv1+lvrQEbRCL9OHA/qFLsA1bQrWNlCl3UIZIxHVF?=
 =?us-ascii?Q?NohVd+P9I80EkAd5y3Y3g5rtnUXBALk8fpmBf5IHYLv3fzsOChHIcLmBJ90M?=
 =?us-ascii?Q?Qv/ZzVEN8XlNXTeyu9cVa5wFS1pvB1keLhS72TYVxA8U6HQLQllIlN6G+XIB?=
 =?us-ascii?Q?R7bxEcPZAUaN4IKHEPwORZdiqDkuNQuNM8bRUif0UzpZC9lkgLXwtpBBxHVs?=
 =?us-ascii?Q?bvH3M3NkOThqk5GA9ywn+45b/Q+Ksfoef6po8b8+F/3H92W88w1/V2GHAMkA?=
 =?us-ascii?Q?62cYWsRFf1kqmk8BLd8SPUhwypxdgKz8KBRL4ZBxPp+oPy0MVL6fIvqRyAqm?=
 =?us-ascii?Q?3TwJ1TyDMWC0n79uIm1uyxVcu17lxUNErceCZZ4LwL0LobZXIl9EgHp5ZZbR?=
 =?us-ascii?Q?cw7RuqUnJ8q5IJSMaEaoV2wD8POv+oKs+yr5TM4ZRS301nqIvGN3Pe4cJ+xa?=
 =?us-ascii?Q?9e1WV7hon0hibHa+dHGJEDJhf3bvwqhwc9IsFopPaWC04KKx4vsLWAyyg5rY?=
 =?us-ascii?Q?6cmJGjSqpRZIIrSCDfDE7T4g0Rg6bnwlwCitO7mEJUBWD9Nw+TuM3kfv/HEX?=
 =?us-ascii?Q?P9yE9bEAH3e9vo6eek8AqRJTHENpkFJX?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 06:19:05.1384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4ed41983-2a91-447c-a024-08dcdc60ca80
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6599
Message-ID-Hash: YN7CJUW4YPJYWCBCSLBQMOLZFLAEACQL
X-Message-ID-Hash: YN7CJUW4YPJYWCBCSLBQMOLZFLAEACQL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YN7CJUW4YPJYWCBCSLBQMOLZFLAEACQL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove unused 'platform' variable from acp_card_drvdata structure.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-legacy-mach.c | 3 ---
 sound/soc/amd/acp/acp-mach.h        | 1 -
 sound/soc/amd/acp/acp-sof-mach.c    | 4 ----
 3 files changed, 8 deletions(-)

diff --git a/sound/soc/amd/acp/acp-legacy-mach.c b/sound/soc/amd/acp/acp-legacy-mach.c
index 3526fbe2c84d..45613a865d2b 100644
--- a/sound/soc/amd/acp/acp-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-legacy-mach.c
@@ -57,7 +57,6 @@ static struct acp_card_drvdata es83xx_rn_data = {
 	.dmic_cpu_id = DMIC,
 	.hs_codec_id = ES83XX,
 	.dmic_codec_id = DMIC,
-	.platform = RENOIR,
 };
 
 static struct acp_card_drvdata max_nau8825_data = {
@@ -68,7 +67,6 @@ static struct acp_card_drvdata max_nau8825_data = {
 	.amp_codec_id = MAX98360A,
 	.dmic_codec_id = DMIC,
 	.soc_mclk = true,
-	.platform = REMBRANDT,
 	.tdm_mode = false,
 };
 
@@ -80,7 +78,6 @@ static struct acp_card_drvdata rt5682s_rt1019_rmb_data = {
 	.amp_codec_id = RT1019,
 	.dmic_codec_id = DMIC,
 	.soc_mclk = true,
-	.platform = REMBRANDT,
 	.tdm_mode = false,
 };
 
diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
index 2b6b8b3e1b94..414d0175988b 100644
--- a/sound/soc/amd/acp/acp-mach.h
+++ b/sound/soc/amd/acp/acp-mach.h
@@ -79,7 +79,6 @@ struct acp_card_drvdata {
 	unsigned int bt_codec_id;
 	unsigned int dmic_codec_id;
 	unsigned int dai_fmt;
-	unsigned int platform;
 	unsigned int acp_rev;
 	struct clk *wclk;
 	struct clk *bclk;
diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index 49aadbadb7e1..63a9621ede6d 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -46,7 +46,6 @@ static struct acp_card_drvdata sof_rt5682s_rt1019_data = {
 	.hs_codec_id = RT5682S,
 	.amp_codec_id = RT1019,
 	.dmic_codec_id = DMIC,
-	.platform = RENOIR,
 };
 
 static struct acp_card_drvdata sof_rt5682s_max_data = {
@@ -56,7 +55,6 @@ static struct acp_card_drvdata sof_rt5682s_max_data = {
 	.hs_codec_id = RT5682S,
 	.amp_codec_id = MAX98360A,
 	.dmic_codec_id = DMIC,
-	.platform = RENOIR,
 };
 
 static struct acp_card_drvdata sof_nau8825_data = {
@@ -66,7 +64,6 @@ static struct acp_card_drvdata sof_nau8825_data = {
 	.hs_codec_id = NAU8825,
 	.amp_codec_id = MAX98360A,
 	.dmic_codec_id = DMIC,
-	.platform = REMBRANDT,
 	.soc_mclk = true,
 };
 
@@ -77,7 +74,6 @@ static struct acp_card_drvdata sof_rt5682s_hs_rt1019_data = {
 	.hs_codec_id = RT5682S,
 	.amp_codec_id = RT1019,
 	.dmic_codec_id = DMIC,
-	.platform = REMBRANDT,
 	.soc_mclk = true,
 };
 
-- 
2.34.1


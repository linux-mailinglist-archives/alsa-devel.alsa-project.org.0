Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C45997B7E2
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2024 08:22:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFCC1B71;
	Wed, 18 Sep 2024 08:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFCC1B71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726640577;
	bh=NWz8knI7us9C5irlKL+Dy3yWgxoAxx/m4OHKjnCG1s4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SuZ8BMWsjnIOEfO3QXBwtt4PRSlu4XJ5hbJnpHNHFFJ/t4VwMXRM3EhJJU5OhcNV4
	 8mK32q4P0nqWdLijrCQVJsiYfZDPWDxZJWCgYlU74aJ5d71rlxAz23YueVekYNWN33
	 Bcf/rZTWR/BFKA1cRxBViiLHvNhChC6IqGV8v4Mo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CC29F80301; Wed, 18 Sep 2024 08:22:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D077F805C0;
	Wed, 18 Sep 2024 08:22:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5423F8020D; Wed, 18 Sep 2024 08:22:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8900DF8010B
	for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2024 08:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8900DF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=x9N70rox
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s92eI1Ajtb8vlnEoFjwkN6Q4Ti+xsDKwCLP6LzQGdk45u8hzFoTFJYaG/nyggCUccrkO9qNt6A9MhklHKdyQZ/7c51dHVXUHT3sUJFWCtz0u2Q3PtB2lck32x0Ki0Acr2GY7rglfYjI3BBXp8L3+mjYKhufn/7DLhq/3pjYNshw3sgNNioOPf6don+ruWfit2otBElFKK23bZ8UwOZUILJtslfy98g9huaMxl5sS+7MtlV+m3GMqSWS5DorL+DTY6gRuBDLRkBkBCewlyJkKk/bAFKxRdYnMfmnAHWaRo1nPhJNGOQo2wBdebZcWW19Dc+63Xt3ozAw9PSQvc/wLhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yYyEICfYiLb5ugOa5VANcuKbNB31s+AMUuuyEvTrqH4=;
 b=xQDy6TKKoACpVp0TF/9D2RlWLZXr/q5i/i1BWgS2mW35MwSg7HMbzpv3lbBh2jn0ahMrNLZWkaNRBdGp5+stZTxqUIXQyvUjEGVx5aiRmpcZGKCHF57WmrdNm5rDEZ01fInip+lw0eVGzhc0Oq1xHLVVnQ7OWbisLfm4g6eMKdhfGPvs1cYgLCyBRbIXh8/fTnPRUzfWQmL+iyTMWhEvx0Cw0RftJSbEgq8M7n0oP9I/IinxUiRepYHyDmrLzyh0+kRg2D0NOi4THkotzg3aHj8RiRSOToVc6sXbvhUeJI3nRkMbaxWytIgvnkLxZowRSaLnf4G5HbaLpbRCFTu3OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYyEICfYiLb5ugOa5VANcuKbNB31s+AMUuuyEvTrqH4=;
 b=x9N70rox1wdzKajR0ZT9f+UEgQmNFqfZzqFdzNMX4TRdnTPW/cx5kP8IQEpB9dt+bE0ICBsadMCbawcdn8uksMnY+2rF27nvem0DPpkaSva5iYnkhA0TWn9ZNPNKOxJGxmi/a498U+uetyG6KY56e9H48uDw8QwQG5wRpvuK1l0=
Received: from BN0PR02CA0026.namprd02.prod.outlook.com (2603:10b6:408:e4::31)
 by SA0PR12MB7461.namprd12.prod.outlook.com (2603:10b6:806:24b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 06:22:23 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:e4:cafe::6) by BN0PR02CA0026.outlook.office365.com
 (2603:10b6:408:e4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 06:22:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 06:22:22 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 01:21:12 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 6/8] ASoC: amd: acp: remove unused variable from
 acp_card_drvdata structure
Date: Wed, 18 Sep 2024 11:45:38 +0530
Message-ID: <20240918061540.685579-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918061540.685579-1-Vijendar.Mukunda@amd.com>
References: <20240918061540.685579-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|SA0PR12MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7f1e8c-87bc-42d9-dd24-08dcd7aa41e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+tkJjtZbePJ2kTCGLNz2FA/bnIk9j69BiozN7TTDzQQvnLZ11Eh9NwVCcylN?=
 =?us-ascii?Q?Mb9C8MZfGM5jc/sq+ufsGjBZxxZNaHtr8ThVaQOFSETQCAL0tSO1s+4OhLqH?=
 =?us-ascii?Q?XpvWpqlFN2TG1v4DC1r+ye7v+JD+yoa4rcrh61WSZhulPJD4BqfuuAK+lcfd?=
 =?us-ascii?Q?qB14c1BYbQ1WmKKW9XwL5LR0mq5iYmsqmJmJbf8bgtNZQyIYVwDtKca0qnp6?=
 =?us-ascii?Q?G1TpetjoY3xvpzXvhPp7cO8hCBMyafU0keZEbCVOxEyAIcImINdlq9znLKzb?=
 =?us-ascii?Q?cFSinSnYDKeBHjtwJmWLWHk788nrEWckkW4lXZGDPLmKzu2L8R+RmNChRo7z?=
 =?us-ascii?Q?1LBze4PZgwwQr+GqGH8F6OjveDYKs423StQZ67m3VCxBEJuwp4CHJC24z7cy?=
 =?us-ascii?Q?1egp1+ZoGVwWytFhjkVnYZgaFfQiDlY14/h4f5YjH7ALYklpS9Q6yEui7w48?=
 =?us-ascii?Q?wDZ5ZSva2g/vuYRgTC/pE1S+p1cEr3Vp1XHVafgZoWTuesfBYCg+AKAto6FQ?=
 =?us-ascii?Q?j3Clb+vuqYm8jMKr9pjJ3E53O5OY7gzpF3QsWpuBsIC5AQQkfmk9a2Zib2SI?=
 =?us-ascii?Q?s97XQ+8lHFHCJcPambwmDt2DHWmDV3AZ/HHY0JoJDO2c04WGepvL+kF4SeBv?=
 =?us-ascii?Q?SJh8VvwS7sTBBO6IBR652TckLt0VLPjj+Gwcc8uzieygJ9HJKGha84uqPB6b?=
 =?us-ascii?Q?VIMcuJC5/a/glc+VscQSdtJTK0Z3RV6UTPqpA98RnxB47tNBDeWaFpHIkAEp?=
 =?us-ascii?Q?1RiiQsUOvJjdXP8FULR4OO8mk2+anP5VHJ+dja5srDg50riaDL5D5BNsUeNu?=
 =?us-ascii?Q?OtMIGIbjjdxKYo+IT7WMZWj62DPVGEkwFgkTdjQ+TTJPDvYDO0yWrWSrESm+?=
 =?us-ascii?Q?aTZ1LzbGJ2Fr6NQXX577F7qd/v9O/h4Y6/EruCvxjNhUG7DbSj+nWs+6BHuo?=
 =?us-ascii?Q?wKpI6QUVeKAQkWipf3VQmQGrT/AHpX83XQKTXcJoYL2WneO0wOmjm5EbmYT3?=
 =?us-ascii?Q?bi0LhvdWrTKEeHBgqJwjvqUy4Ehs3wLRvoOw1E+E+jEbhxtmxlsY9oy/Fyou?=
 =?us-ascii?Q?sVVDUPmb66UrMVmgCRwNsvdkLUEIzp6TatL15JDecCfdAEJ2C72WFfdc+7w3?=
 =?us-ascii?Q?C01OwkFfuPvI3ER8L7JeRiOPPmEvoxiZPecaCZ2sWp1bKCgucma8F8y3nlYd?=
 =?us-ascii?Q?k/L/gG6ZNpQLX7jGxgRYIGhuRBiOJV/CW1mcvS+bHoD85LhOFGccqmOsR7x2?=
 =?us-ascii?Q?dbRunbwUKyhLZkoBoZRMtP+1wDT3kcL9qy0xJ2/SqDFnI9XIecZaQTHU1Xw3?=
 =?us-ascii?Q?Csuy7B0OgoLX0Nc72S9cB7sWQGseWkjVDcHfEeCNvtUbbTu9Z3k5oSwITmMR?=
 =?us-ascii?Q?Z/U26+2Td4tlWPnhw4s5KI02RcDsQ8CvT6sJlSzL+wNUifmGZpUPMCTGJ3Mc?=
 =?us-ascii?Q?IlJypq8HTE3wzlRTC26YspoQDCUCiUXY?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 06:22:22.8891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bf7f1e8c-87bc-42d9-dd24-08dcd7aa41e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7461
Message-ID-Hash: 6QPD6RXDD5S66PZ6BF74FP2IHVJD3G53
X-Message-ID-Hash: 6QPD6RXDD5S66PZ6BF74FP2IHVJD3G53
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6QPD6RXDD5S66PZ6BF74FP2IHVJD3G53/>
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A63E394EA76
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2024 12:06:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7DF11919;
	Mon, 12 Aug 2024 12:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7DF11919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723457161;
	bh=pFphKa6qJi6OgcW+BS+FZxBkttZDB6P+4CpWPOvplFE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=h7m5bolHwqZporJPzgJ9JVjweG9cMjLpC17XORtYSRIDR5vLixzb7H2cGakErk863
	 h3FLMQACMGZnIxCM7LlLZKmyQAX9JpJg0g08PxV2UYueIkUx0uGA2vZAiCT1ldvUez
	 +r76ZK8LhvxEj7jqty8Yh83bN5OwJ/kX271CzSp0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53678F805A8; Mon, 12 Aug 2024 12:05:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3B1FF805B0;
	Mon, 12 Aug 2024 12:05:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 689C6F80423; Mon, 12 Aug 2024 12:05:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A7EDF80107
	for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2024 12:04:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A7EDF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WHHzcnkF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cd14mg9eq72hndL7BpqvcJ2ZaeNSsHCcgwlw/GPDTnu8F4tq8GFDzu3SpvkxJEUH70TotYXXm5xdhyQJl3j+7saLSmppqjEfJEwSKqrR79J2BHYC28bRsJcDAKXuQG8tUMBuJnFI/keS3G7+lu19vXYNatY6uY02mDHK7D6RO+qqH412SFcZqorb6YkIzdtKDuynu5o5iqLKGEhRYByu43TE9w+MSlp312EzVBioSxt80o2Pc5Isgb37NJ0dMdwYu8WhpZZEZWt20Mo7gA821ewlsZiTF/SHDLEEUK2I/wybI44CIyP8b9IR7B60fhRmS+/bdMP5DiuJc59uwpvnuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPt72Cimb+2QfkM30b0ByRs6PiQ/Yi2yATKvrS50q9M=;
 b=y87DWE1cZiSYTcf7DlJm58nXnQaMoE4QKcE11T4NJBV1M9+kqyTnmiXTmLIZm3hsqscIXow0yS125CBhTPQtB//FE35jEJzdEfkqDJqFP6eBDBIeRa54NU8q5JVhbuYXetUGIXnGzFWDuM6SgjFiuBuhkFSdUPcdKLff+gha9bOXZ8ZjUhSp7lqRPhsv2WCmx7jUyek+nYCCvgvpLT18utSKVkH37+Wgn8HP+zYYbU0c7Pr6UCeloSpqm8Ze22ovjhJ7IpYt32UqSUkrZOX48XsRqQZmZ6QR6mtWLxnIlVtsY6wZ3aI0OVMJm7Uo7V2Beiv71oaL1KilavYHOxDcXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPt72Cimb+2QfkM30b0ByRs6PiQ/Yi2yATKvrS50q9M=;
 b=WHHzcnkFW7wh4YkDoJMv4aLtTu5EIQdR/Az6IhC2TLQT7b9IjdIOryss95JlOipCSK8vI+JziM0dhgqISKHbLGgqbMEhe0bqMKMUzZCXy00Vias93ZRMbR99F82G/fUJb/Ezx2+XKxrYbneN6o2bJGUd46t63cG53iUy+B5yyWA=
Received: from DM6PR02CA0060.namprd02.prod.outlook.com (2603:10b6:5:177::37)
 by DS7PR12MB8420.namprd12.prod.outlook.com (2603:10b6:8:e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 10:04:47 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:177:cafe::c2) by DM6PR02CA0060.outlook.office365.com
 (2603:10b6:5:177::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Mon, 12 Aug 2024 10:04:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 10:04:46 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 05:04:41 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Sunil-kumar.Dommati@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: amd: acp: Convert comma to semicolon
Date: Mon, 12 Aug 2024 15:34:22 +0530
Message-ID: <20240812100429.2594745-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|DS7PR12MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: efa20020-2f16-4e9f-e2fb-08dcbab631dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Pvnyzke4/2boeDTINZcan20y8GEIvVNrYp27L8oYzJSNTz0q/49yOhyvjebV?=
 =?us-ascii?Q?oIdmZbIc6/D5KYHel2+DTMQaVQS03JlRKIXP4iIFx9zyc6AVHvWBi52nS0qa?=
 =?us-ascii?Q?OYgQioWotqABPpK2vSog652Gplya/l8NDaaf3AYzNix6XgUmnN/OOy+8jixo?=
 =?us-ascii?Q?Rv8t/RRief4GJiJNA9RIPz0oRlRDZwu00Hq3xEtSipwTEPH87wSUfSSec+5s?=
 =?us-ascii?Q?KQi1LmDrcexVXDJfp85N3O9rYSda8kEztKNpXQqJCr52vEy+H1TAGwL5b9U2?=
 =?us-ascii?Q?GIGIoBR5hx4IpvugMNEDfCf7h++eh34vy1TPkb04rw3kAdjhtaxFwUOJVzAO?=
 =?us-ascii?Q?1Y/e+QLaNa/71yn9AS+SZegBYd6e1160qCofDVxFRX9+WNkyAwtPN1hTQumf?=
 =?us-ascii?Q?sXDZ6l7pvoGZMlZnFgI0baVby1MEKl1sl2JVtHl2jgkWqvHYu0FsvCgnEqxo?=
 =?us-ascii?Q?nKMGsXrkrlCJGMlFIxREo4/oeIzBQ23K4dk7+fdloxwpr05UDk4pwA2s3vLC?=
 =?us-ascii?Q?bcaCheSipv7d8RAUG3QTZQVLvnxuu0zhkFyO9M+4lBlY2voxbsYNx0zxArHZ?=
 =?us-ascii?Q?T6QBNJ3/MF3OpE1UdajHxa/7YnGUZ8wvQCeQJdhRR9r1rwIj/nk75QFEUD13?=
 =?us-ascii?Q?RwALNIhMeVtqvsfH0/8KI7mV3uyCtwfTmlSh3YgKR0eE87+aneBdQ17gzJAg?=
 =?us-ascii?Q?IECgGLEJNwioVlZIAxGrccDgI+8UYNTM1jjMOHSZmb/l4nBCQG09YMwExMxR?=
 =?us-ascii?Q?fpmiFO0ynftVDzBka+hJ55akykFFIPqLVbHrSACeT1D9o8Cyl0ekSvvEOjbc?=
 =?us-ascii?Q?+jAN/CZmBPMevBJJRAXL9nCkqk3spXUx6+HyzlKq1xh6PQ+bws2UX+rRqr8m?=
 =?us-ascii?Q?ZxucHEw+nw5iADs67EYJqgugL8SPFqdUrYvAuQvYOSeDOmjtrw2CNbrznnTu?=
 =?us-ascii?Q?y7cIJ+qraqURJxVFLuZfwPmVJb0sXRhiJdiXqo0C8EUb/db13jRofCGqqrkX?=
 =?us-ascii?Q?txiAhTzTMfinU8uaGyODU18htXbr5fiWyQxs13kdycjxl6Dh2U0A22jxwHbA?=
 =?us-ascii?Q?gsQCuBn9YJuI+CDZp68y2wsgYOBwv0FhZ3doVmCQMRnzrZ21yKORrkFb705L?=
 =?us-ascii?Q?T0YypyGVaRe3sa4ZcizdPjjvC/iSu9tLwRej+znaxH9kzKXNsNPJjJ4ceDwc?=
 =?us-ascii?Q?O5d2ef03MuPajfYpy+MZ40ObMeioNXH0Gi17KXQVkv/wFg7I3IlZ2ldp/n48?=
 =?us-ascii?Q?ecrjMfRskE41k1iWpBHO5V+RmfBfzI1Sg/7uOM8weEXPRT6o4BSYq9lhZh70?=
 =?us-ascii?Q?v+Ox+dzDWQEkhfT6aDLhv1Dy47lND3v7U5hqXZND+acLgISVOCXA7B+tquX9?=
 =?us-ascii?Q?ex/OLZPs1pq/m4Qi3s9kd/w2XoxZnDMOyS2ZJ8Dd7N4iX/tZ3K2Il0U4OiVZ?=
 =?us-ascii?Q?sjay/s1zBm4fN6vmqbsF1fTFMbj6VAbv?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 10:04:46.2204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 efa20020-2f16-4e9f-e2fb-08dcbab631dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8420
Message-ID-Hash: EPITERKB5MYECPWA3AFIOECXYTATJYC5
X-Message-ID-Hash: EPITERKB5MYECPWA3AFIOECXYTATJYC5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPITERKB5MYECPWA3AFIOECXYTATJYC5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace a comma between expression statements by a semicolon.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index f7e4af850309..08f368b3bbc8 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -657,9 +657,9 @@ static int mc_probe(struct platform_device *pdev)
 	ctx->private = amd_ctx;
 	card = &ctx->card;
 	card->dev = &pdev->dev;
-	card->name = "amd-soundwire",
-	card->owner = THIS_MODULE,
-	card->late_probe = asoc_sdw_card_late_probe,
+	card->name = "amd-soundwire";
+	card->owner = THIS_MODULE;
+	card->late_probe = asoc_sdw_card_late_probe;
 
 	snd_soc_card_set_drvdata(card, ctx);
 
-- 
2.34.1


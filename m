Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EBB99279E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2024 10:55:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B88EB70;
	Mon,  7 Oct 2024 10:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B88EB70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728291309;
	bh=apfTT4964LnIJyHqKMgDadof/5bd5+ZedoJd5+Vdrew=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lh9R/GPkpUt9cPRXECue3OFYgjdrX1bufrJvIugv0S/CTTD7cQ1T/VUSDybY+ltSm
	 4HvIgryZxcxCg+yXT9am40mnhgDEsC36+OZEofU/DHY/rJxAbK1g5n7AcOxjXFFg5N
	 pK4BvMpnJY3pGGOjIkLdIGOuzRWaazcdC2Ywo2WI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 118A0F805AD; Mon,  7 Oct 2024 10:54:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EAA4F805F1;
	Mon,  7 Oct 2024 10:54:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09A4DF805A9; Mon,  7 Oct 2024 10:54:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7139BF80496
	for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2024 10:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7139BF80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=NrqWzQh7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=He+D3QbId/z/hQMliF5/IxS/6NoG7EtPVCW2wbF0olv8pW1nuB9fxmt9RjokjbYUjNIAkB1n2N+LvOzrlQXMCnY0xl4MJ5cvqhyciV3FSSOfNtaAKD83HEgld0IYYj2jK8NdTC4ns/7SwP+i9K/c9qoSiT2YaGGPdgP/5B/MLE27K0aiU4cmBMlLK6u0pFu8hZvFUBWhhBZJBg4deHw3Lws6YerL+DKonxS6rAClufsNQETTHvTkurxvzTOvB3l59/hP0gQdXb+zX7oR8TdW7B+4MJ5TsU0BvbZAXJYypL50kk5iNEvaJWsclnzj5bJX5D+rwqVK3Ic8Vqi+Y7l/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9icqqq6gOnUjbija4Vs9MCWkqfX4oCnxW6yDk2+msY=;
 b=x2iENei+LAwxQ7WftkfioT/jOZVr5/OiOvHB4OkZ0ltZl7r61PFu/vXHrXeDcgSsFaI2fvUrQCLHLc/+BRzwl3s2zJVodCBFnWTfoykt5+DaMi0VmmcQUwOV/fTGercN0rJm9cemRG4l1ExYy85Rq3rWWYAI+tupmyB71YUjF/NwtqnFKgxQMWb3omU2VuXnBA0XEGBd/wnDWHHJswkL6mBYelH+7QZxli3FkkB0wcFRvojs8pOuY7YxN1SeYypZ9PKHbZ3xxDLwZ9+78GPX+TRt5e4iydtuJ+2QLIQJA4pVx+W6yP67HIwUW0WSj25VA9tCy78rdpwNKob0j2aLaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9icqqq6gOnUjbija4Vs9MCWkqfX4oCnxW6yDk2+msY=;
 b=NrqWzQh7EDk9fgWy9Yo7rch/IGY6/KmdGuoIknjTHyKCYlMoBGXNOCsUZU0IvynNy4ORFMB+Oq8IJpO/7O7SbQunZuKJJ4hvAFIK096ToDQ9gfeNpHQIiCqCm7JH8TSVmMcqpxfD0cQVEhZ/EWWJ5iMEdXO741cUQ1cRYbp6/o0=
Received: from BL0PR02CA0054.namprd02.prod.outlook.com (2603:10b6:207:3d::31)
 by IA1PR12MB9064.namprd12.prod.outlook.com (2603:10b6:208:3a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Mon, 7 Oct
 2024 08:53:51 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:207:3d:cafe::c3) by BL0PR02CA0054.outlook.office365.com
 (2603:10b6:207:3d::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20 via Frontend
 Transport; Mon, 7 Oct 2024 08:53:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 08:53:50 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 03:53:46 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.dev>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<dan.carpenter@linaro.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 2/3] ASoC: amd: acp: fix for cpu dai index logic
Date: Mon, 7 Oct 2024 14:23:20 +0530
Message-ID: <20241007085321.3991149-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007085321.3991149-1-Vijendar.Mukunda@amd.com>
References: <20241007085321.3991149-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|IA1PR12MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be99b92-8acb-42ff-26c8-08dce6ad908a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lWUBHodxu9gIm6ut9vc0TnmP0kfLbLFQ9+GhCptAwC+W22KmPNF3qfAkiBew?=
 =?us-ascii?Q?0+NnNAoLpzyOV6zebLhQLVWVGHII9NU594r8FrJg3dZs7KxlnlU9XInorDAx?=
 =?us-ascii?Q?kJghpU+Q9dgzUHnvltj9oEyiNdNaRNBdNdazdf06i4598VJi/CKya5r55aRy?=
 =?us-ascii?Q?R38CieuD+LNZyMc1uBUH7rJGbQb7P6phuRautPhNywMU1TuEGKac7uV71gHy?=
 =?us-ascii?Q?IyMs+ybX8RWYw1GvP7dDw+ECX/JvDEdVKSKYiMYvRDzuwUvhERRrb20sVLW2?=
 =?us-ascii?Q?iXnzwfdXFu/AxKxfVjEklKQkG9K1L2MRF0vohCVE35x4glqtvc61E60IC2Z6?=
 =?us-ascii?Q?g13FJ6ADbJ+Op7Kv6y/rsJQmOnAj5jRBNJqKj1w2R3ykgJ8aEchI7I9mSpdh?=
 =?us-ascii?Q?pDeuyTq/w8kBP9qQ0JXthti1tHfCtaEM4ynJU/d/koRCduporAiXRjdh1pZ7?=
 =?us-ascii?Q?hepXA3wBnc363lOLjDRDpBPOVq4c3zpJV/Ha9qN/0lYa257IG0yrmuMw+iU/?=
 =?us-ascii?Q?yS1MoGf8r8Oj6jTB7sQ27oAvSJ28YmVs/+P1CEjhzlKwD9j5Nf4uAEoRn90n?=
 =?us-ascii?Q?R12wQiQOh/bjeowf2n1G4hhK/dx829ybtWO9xUGRgfaBUFnkIx2R+OvJZMNa?=
 =?us-ascii?Q?5q4hql756YUbH15P9ra5WpdhML0HcrO/UitF3XH5FwWNjrGmDBbsjfMHA2OL?=
 =?us-ascii?Q?X3m6luogfeojn5W/c2PS0ToE1GitmirvNJ2w+R75gLNM4I4u4ts2zAULs3aq?=
 =?us-ascii?Q?txfeUEPXqgl0/qULLqoaaQi7c83MXFKWT+swrU0UIiF/r6ekQUcRF1TOF/CF?=
 =?us-ascii?Q?BsgAOeG3xr7dnbMNCp7DkBAULrtFnDSJyQp7M+QqtYoX/VrdJoKwPcFVNaGk?=
 =?us-ascii?Q?RiptEEEA4OuJnQJrxKwDxpRki+L//ciMWf2hvMOFZVoiJQ7G/cEDh0PIXHJf?=
 =?us-ascii?Q?FSfYPiAFYbw+A3qxhsIAiotAzVQ9imLkFdTwKcRCrTsZSJAyk1dkaCvAAMHB?=
 =?us-ascii?Q?ldHgqG+Iy+uIK/WW9sISPmF4O80UVYeFYSV7oU/mD9740tMkJcZ4xWQPWO4Y?=
 =?us-ascii?Q?+CEdc/F8edSA3LnrR6jJ4MWoi1Yj8vGdjyTLtwhy/bjVb+6an4uravO0Xz5C?=
 =?us-ascii?Q?5UWJBndNnxEHo5UFh9hNe+8OS/OGYfu5pvGtOXTAQ6SMehy2uvu6HEAj91u3?=
 =?us-ascii?Q?25p5EuHpGP00PAW96/afxvFxMtyotNAZheKrzy3H1cKve/8Uj59fOu5xoKF7?=
 =?us-ascii?Q?pHxzx5vhVqFjEW1dj/0CDwJS5yRJWltiaaNhfB2e9KEu7Ui71yG2qSxbRBSC?=
 =?us-ascii?Q?o8JHeH9Jhdaz1mtyAWybaL7yiB1tsX+ZMI7DR4SNlMqslpfeqO6Vju7JavMU?=
 =?us-ascii?Q?ORVuGhp1eS1ENCP80fPbGJ/40mxE?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 08:53:50.7690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1be99b92-8acb-42ff-26c8-08dce6ad908a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9064
Message-ID-Hash: X7OWCLL7TIOQONTTILNP3K3JWA6FQVWT
X-Message-ID-Hash: X7OWCLL7TIOQONTTILNP3K3JWA6FQVWT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X7OWCLL7TIOQONTTILNP3K3JWA6FQVWT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Multi link aggregation is not supported for acp6.3 platform.
Below combinations are supported.
- one sdw BE DAI <---> one-cpu DAI <---> one-codec DAI
- one sdw BE DAI  <---> one-cpu DAI <---> multi-codec DAIs
As Single cpu dai is going to be created, In create_sdw_dailink() function
cpu dai index won't be incremented.
Refactor cpu dai index logic to fix below smatch static checker warning.
sound/soc/amd/acp/acp-sdw-sof-mach.c:157 create_sdw_dailink()
warn: iterator 'i' not incremented.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/a201e871-375e-43eb-960d-5c048956c2ff@amd.com/T/
Fixes: 6d8348ddc56e ("ASoC: amd: acp: refactor SoundWire machine driver code")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index acab2675d1f5..3be401c72270 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -154,7 +154,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		int num_cpus = hweight32(sof_dai->link_mask[stream]);
 		int num_codecs = sof_dai->num_devs[stream];
 		int playback, capture;
-		int i = 0, j = 0;
+		int j = 0;
 		char *name;
 
 		if (!sof_dai->num_devs[stream])
@@ -213,14 +213,14 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 			int link_num = ffs(sof_end->link_mask) - 1;
 
-			cpus[i].dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							  "SDW%d Pin%d",
-							  link_num, cpu_pin_id);
-			dev_dbg(dev, "cpu[%d].dai_name:%s\n", i, cpus[i].dai_name);
-			if (!cpus[i].dai_name)
+			cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							"SDW%d Pin%d",
+							link_num, cpu_pin_id);
+			dev_dbg(dev, "cpu->dai_name:%s\n", cpus->dai_name);
+			if (!cpus->dai_name)
 				return -ENOMEM;
 
-			codec_maps[j].cpu = i;
+			codec_maps[j].cpu = 0;
 			codec_maps[j].codec = j;
 
 			codecs[j].name = sof_end->codec_name;
-- 
2.34.1


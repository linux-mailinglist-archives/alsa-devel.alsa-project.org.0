Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FB2949F1B
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 07:23:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C71D1945;
	Wed,  7 Aug 2024 07:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C71D1945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723008236;
	bh=QxszdzAXMtanwDxUmQhoRcJ8Iy1ocp7vJQhlv0/g38U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=if7Ir8xXPrLM2xArwfLekMaVmI8J57yfVskbu2SEttIH6/NWkwYNQ+W8m6qQj/Y+j
	 +jtYWnCjwkN8LPQK3O52bPYwnBoWKav+miKy5qqEKIC4Yv1cJutCREL+mvpfERBksA
	 4hWX5/f9DaW7gm2yRB0Y1XneoVt3Dw7vFHInWWMk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FD4EF8064F; Wed,  7 Aug 2024 07:22:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DCACF8067D;
	Wed,  7 Aug 2024 07:22:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B1F0F80448; Wed,  7 Aug 2024 07:15:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2B08F80236
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 07:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2B08F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rSw/VF0P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPFAj0WKooqKpfIVtyTSLXXJUB6OqEECZ1/226G4oQljaLZ1uj8Fqc8gJtAnBVM8X8efo5ElaVxwR1dgL6jlpFPIFkNp8dS4IrLUx5lmc5DpEwh3Z/qaDYRTdnsqzBqYPSMKk/RdEq9+x3oJNdEzvyFeafpzLYq26KQORApNLnikIgjtA5GGUT2iLoGnexsgjvuzS9HC4DUAnUpRgNfeUWXRqCLO20lXsxWmQP8/ypkzS0nSFervFei7qNst0Bhn7IPeK5bCEApDj3w9HNCGOngULs6NbGvQFn+OHq+RfJTK8JxS5MUdsZHuSPTLv7+mjyMJvksfXNcPkz250+m6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBNfv35Z9aYp/a4IbdRFX7G0RUSMVnZLZzGXQqLX6hc=;
 b=UfTbV60a19REG+chXsqYsOhDIsndcSHoRCFwVpLdTEl3FSLxZ0UKpRyNj97GjndTvXZ0x2afWxVulec7riThizutXe+/9IvNILoN+e6ak+r2a/ovDeI2DkJgdEyeBhBqzsos/j8EqOmpwnJBGVwdawlE50fSTU9yKLK+VXXdpMMJANDlvJwglyaJJpa/RXKTWil53oOFc4H4UU+lvHFRywt31MySPC4+aoWXB7ttsTiIVaE9/e4QCg70Gwv1fZWotTs1B4wLxHB8zVEk9SFz8J3gTWgxLEEGEwioY9e5QR5LcxDICiFs3uyk2BmRmMDNZZEdqDr/dSALIp3OGZ6fOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBNfv35Z9aYp/a4IbdRFX7G0RUSMVnZLZzGXQqLX6hc=;
 b=rSw/VF0P6gYh5+JiRSzLmkZ6bUAiSOhTfd7v9dSOh8NjfgOHW5/CHDHjSkiyXmFywfqh4epOzMcstDDK1FZu+33b65wvhgGk/s90ikmCfoiSqsxte27K50+qupkjC2zf8g7ULCN/JEVxhran1XCB1uqn61FMcUDE3Vp18Q4ZMN8=
Received: from BYAPR07CA0042.namprd07.prod.outlook.com (2603:10b6:a03:60::19)
 by SJ1PR12MB6169.namprd12.prod.outlook.com (2603:10b6:a03:45c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 05:15:40 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:60:cafe::6b) by BYAPR07CA0042.outlook.office365.com
 (2603:10b6:a03:60::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27 via Frontend
 Transport; Wed, 7 Aug 2024 05:15:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 05:15:40 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 00:15:35 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 8/8] ASoC: amd: acp: Convert comma to semicolon
Date: Wed, 7 Aug 2024 10:43:20 +0530
Message-ID: <20240807051341.1616925-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
References: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|SJ1PR12MB6169:EE_
X-MS-Office365-Filtering-Correlation-Id: 1278b9c5-4887-49a1-b6de-08dcb69ffabd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CCjfe8bT+0dUWTKqOhhv5kHlwGICHPQACsTOgKv2DsRW9x4PiEIIOREXwsS4?=
 =?us-ascii?Q?k5ZLTriikPHoXy8q7PNN6Xus30J/sjCb/VW6EIg7fxfQFcXcl+CiheI9R+HA?=
 =?us-ascii?Q?3Ge9A1L8xTqnIdpRGo52Xe43raNclaC5BOLtQfxecpm/VKJ4NWhEhxeVusfu?=
 =?us-ascii?Q?XYOlW3nOFu5j2JsH8vZUgXVri9TRKtISl1s7myPy2xzog+MLAAczivYEh8nw?=
 =?us-ascii?Q?TevLAhdjNhvZcOtVRT6QXIGq2VuY9D0yHpMccFLUuhLDB7SZKYasJQkn0IXi?=
 =?us-ascii?Q?QJA9zcYLE2Vn5qadXt9n6mwZwnQTkAYbMb5ZEGGY5WJtHxzjry27CmL+Fzkk?=
 =?us-ascii?Q?S80VB435R/rphxY0Thjs30ZbApbrN8krZSzM3CDzn0Ud54O/znrt2Ep2AA9r?=
 =?us-ascii?Q?1UAkRxFkqMoc50xO36lGFXVAI3MjK7pmsJiDunm5adAFXvRn9cJjRI70T0Om?=
 =?us-ascii?Q?wPG6/deqcY0ZIPPx/w8kWHKToiCMZBM3KRkvmj4SVUYso6aBVwbxkciLfEB+?=
 =?us-ascii?Q?wgSEThIpQb9TzpuIU6aGD/VzkB3F79unCKpBauoq5YRWH+Q9zInJ7MdbrOH3?=
 =?us-ascii?Q?RyQFfIFxxIFZCt9kBTRn3X77NHuCr1MFEtudYNN2ZqRu4BJHG1m7KTbryqP/?=
 =?us-ascii?Q?3V0Pr3st0cvDeJ4LEQmGQCZkkh8ChJIMrE0d+ODLZVO6YURhS59/0hWpMqCb?=
 =?us-ascii?Q?S8mWOalqVgbZXmR1U+wuupJhWxSbSpcflcVDqWZrSqyXr0U0HZPx0diQEkfe?=
 =?us-ascii?Q?3mhmvEqd3LxJNVxrVnX9Q6dQdKb2AOqwCXeMjXP14lDOX84F3GhSE0l7sYmd?=
 =?us-ascii?Q?4N8bn8IHJ2SjUTXnRDwgydP/PqVzHOxScG6cdpWTlMqzgD2kBuO/3zznHvDE?=
 =?us-ascii?Q?x0FNlZAxFWDlQkXCg0CyQI4EFkhc9SHFt0BxmBHvvh9U2SUIow395/Ls/mrE?=
 =?us-ascii?Q?MB8IitmVeuKxSPbyfUYE8s8Gj4dCiTxob2S7BdSEUHoVhjA87m4GSjJ9+OzF?=
 =?us-ascii?Q?5p+rcOJP2HNpG08jpucxKfyBPUAmGly36Trs17GETIakDEcm6avI4eO9TvFG?=
 =?us-ascii?Q?CqUqmlI4MmxRULHA4iK4bGOaPcSr+m1BT6ZFjsvdFZSaP+twZ9bsDMWE48E7?=
 =?us-ascii?Q?rpvEG7NlaelOe7KDRmmq74ZyEycbFFuFWTLZ07Mky0ttgvnyW+pLEU1lqTPj?=
 =?us-ascii?Q?TyGqgUUnK2JWtBt5PLP8w5c2qOhZJsrKUqWW0r8cfY5OJPNqF5smyl4f62aG?=
 =?us-ascii?Q?xwBEdOGWHdoJJLcr0j5IOl1zKekAr6nMN7iFTrb6w/XC3tku0to99+pg4kMr?=
 =?us-ascii?Q?XRwahADTJXAVej0aEiQcdRjIt/oVrP2VV/FX9MYPy7E//F6e4NRsb6NRyYEl?=
 =?us-ascii?Q?MLktjvy1+nHHWM1hnACzMTFQEMtiKNoejbTm6ktmgSYzPYP3KyOjxkL14RGb?=
 =?us-ascii?Q?uSdIUGjyVw+bJB0YYWFqz/pR/lJ8SzRF?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 05:15:40.1153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1278b9c5-4887-49a1-b6de-08dcb69ffabd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6169
Message-ID-Hash: CTVBSN5GJMV3222CPG4IMCA46RJYXMS3
X-Message-ID-Hash: CTVBSN5GJMV3222CPG4IMCA46RJYXMS3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CTVBSN5GJMV3222CPG4IMCA46RJYXMS3/>
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
index 3419675e45a9..0995b40d15f3 100644
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


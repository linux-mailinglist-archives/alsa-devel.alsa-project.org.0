Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAA9969C00
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 13:36:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 707F4E68;
	Tue,  3 Sep 2024 13:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 707F4E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725363412;
	bh=pzVQJ2oBcN/W/lJHA0ITThSO9WcpclH7jXkM7SyQ/vI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mQBOCThQd+a/clmS2Gr/l05eoFbV7+v8Mu5vmfIuMYUbkkPKucgpwru+2n3NIz+J1
	 lPMHbCXae2TeAhEd9ZF5yrHIofU/xGgnw72+oyAuOvS9hV5EW7cM9WG9iTnIYjHDSo
	 mlnS6Q3Bc3udkRhLVz/LQZIl0bParn6skFpI7oT0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B2E1F8065B; Tue,  3 Sep 2024 13:35:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91D1DF8065D;
	Tue,  3 Sep 2024 13:35:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A149F805C5; Tue,  3 Sep 2024 13:35:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CF51F805BF
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 13:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CF51F805BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xhJ41aHL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOtnPnGSTk9w8Fqi4f+3rfgXPGzKMatFLe2UHxKfEjyHKZestZqgG/V2O6kapPUgGB0U4Q6di2f9Y0qb0AC/hTjoYTIEpZ8oUZKVaUqUajYD/5tUo3dCOfIdFfJN/MHuvzKbx6QMPIDqdymyfUG9CdYXrh8qDfU/KrkCWArVL0dZoY45ZjcXwil/qUf9pZJrVNaDSJEfBO1MbJ17conwUol9Z3nxN7laSEQvaUpHtzjHan4SGVZOxpdFU9bZh5wFe7BH240uNuvPVtR6u/gilJHEeQLKxLVuck59N95Ppnt80Dgicl1h9RCncmuWFKpEGaFehCeeBQ5iW2GoKCXjcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2cOki3l4blca+xqthX9RSDzuPkGkB1UWmJhP3XxZUg=;
 b=dwffCdWZofNT09qzjHtAFTwvfM6R/mQiIaRjRUV8gxAgL0l76eZJT+MavGLYWd4Dpx/9NR58FdgBkOAGMtAuyD996pT6n3S1KYFKF9qN5zsc9tg4qmcfTE6qPH3/jhp3nWNitT/Ib5I5sPxVfVNibAcjuUR5Svsc2kW4vYkFNYWBxPyiPj0mtcY/2UXGl18iOtWtDQW64nfAZiyQPX6Oh3BoZmFC6TLAS3JqfkcfgKi5JX4FlsRo6Xb5YiJBfgK8ylpGYIyLVR2x7rxErYvOFGGOZzdoQ4iyEi0Qct3HkeF3AHtRn5Kf69FEwG4qOHYcQebCSkmNH5zhQqjKIZoBXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2cOki3l4blca+xqthX9RSDzuPkGkB1UWmJhP3XxZUg=;
 b=xhJ41aHLiRK+PIHysxeoTW5e/jEPUCi3Wa/JVW6veq7y5ng+atZ2jxKJFO1dfCE02+xr2+OE9Du0X73Hspmj6dhWUJnlRXnaKBLnJQWVTbdgNli2CZbdzQXxPFlsMCB/aHHRD1yQXOltG+vyzIQKHH1jAcn4gWli1iFcuaBCcKQ=
Received: from DS7PR03CA0110.namprd03.prod.outlook.com (2603:10b6:5:3b7::25)
 by DS0PR12MB9423.namprd12.prod.outlook.com (2603:10b6:8:192::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Tue, 3 Sep
 2024 11:35:24 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:3b7:cafe::b5) by DS7PR03CA0110.outlook.office365.com
 (2603:10b6:5:3b7::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 11:35:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 11:35:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 06:35:23 -0500
Received: from prasad-r9-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 06:35:15 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, "Syed Saba Kareem" <Syed.SabaKareem@amd.com>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 05/12] ASoC: amd: acp: Update pcm hardware capabilities for
 acp7.0 platform
Date: Tue, 3 Sep 2024 17:04:20 +0530
Message-ID: <20240903113427.182997-6-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240903113427.182997-1-venkataprasad.potturu@amd.com>
References: <20240903113427.182997-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|DS0PR12MB9423:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f8c49e-e7dd-42e4-f908-08dccc0c8093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EJOLIlPpyXsSd1jaZZGoLdJSnZY58m2afnR9WLE18hxXf/OXAmBfUatN/AaL?=
 =?us-ascii?Q?wI3/ygH0LK73PqacLNVjc4ysJoQKY8r6PCOyCEngXxaLVOusYSAbjTaDqbmK?=
 =?us-ascii?Q?xlvp4hoMorAzoBuVHrYeYwNoxtxrZ2KkCb2uUoQxF7J5koDWq0wbbJ/px+Nz?=
 =?us-ascii?Q?Y+shtc6D5HejppptfkSzkub8avc1N5c0AaTIMHw8T02Mmbi2e0pgUTToA+QS?=
 =?us-ascii?Q?wvxKQwXitCKbISRXg1IWQcGTd8QpQji7f1bbkKI4fcwupa3J6MrsEYrpzovu?=
 =?us-ascii?Q?65/QodESvojF5+zFcq48OuyzfhIK4VE5DWMw78UKfVuIF/+Vcd6SSfdQfU4S?=
 =?us-ascii?Q?i8o8TTqOLcbKdeBZIeWJdX55fOiQs1PxAocI8yeUrxNLK9maHSUPr3dGMwJc?=
 =?us-ascii?Q?opQfwk6XpiFHB72/oTXmth9Kga9J7xY4tJm95ztA4RwGMkOCSXRtf+6s7gY+?=
 =?us-ascii?Q?sHP/w6bVx7frmvJ9gh2ePYHhMtFmWQ4Xtc6FUdKgvhbUG8hZdAXMH6vBfER2?=
 =?us-ascii?Q?WTSRsFWnszIJddWC6Tq541rrwIG4vTY0tfjYcVYzQ135+2B6CdaNRbIwYAQS?=
 =?us-ascii?Q?4D0EOlC4MIYcOtFemBFQ+riyR/pN74jgWkbC1/DKD7NcLLHS8yRf0OMLXh6g?=
 =?us-ascii?Q?t/KTYXfucFkDajC5MgszW3vBmvyU0l0yq5D2J5c8eo2aRaEQKQJCgZ1pRJua?=
 =?us-ascii?Q?gjGDM3cVTupr1EzzFarSwqDI2TGdv3VBnfTX8asnC+nn/TZW4QS5rsC4fiD3?=
 =?us-ascii?Q?UuvcUi9LLmm73YKb5HAMMZFajgrbjyWuwfl+xFjwu57A6rBMGs5y+H5H49oe?=
 =?us-ascii?Q?Lz8BmmLRM3FZTq32PxxKN3eFzaE+Iwk95wVNPLmawHu6baxo7yUAKHufjd3Y?=
 =?us-ascii?Q?7KDwHp1q0kUNhLVICQjjua7aXVYT9o/MXm5XnfL1oJABk4DAjh80FtA43r9L?=
 =?us-ascii?Q?YY8r2tvK87CVldhAEhIivHakmgbyn0PtFPeCcivHn96T+6Yx2yIgCLqP5DKB?=
 =?us-ascii?Q?69VbR7h75Dx0Eh1qq0ob9blCIZxO44bvqN/D+XD0yvkCpwyDv8s+VFgi9+hv?=
 =?us-ascii?Q?2PwhsFCW7oAwGscuWwD3VmzLjL4HkF2LSMikaeTF7BT+1GaEYR8eY/bQ2Fzd?=
 =?us-ascii?Q?JI57xB2inMPPSMTypHo0ZWiZNOX02AeeyXTvu7K2ua6kokcdKJbP1/IPBlg5?=
 =?us-ascii?Q?qL9VjiIESrEV0Ylcj9/L4+cIC7+simvU0pc25JpyECCzpztlnx3U+WcS9Y1m?=
 =?us-ascii?Q?7cjEXie1w3+2UZZn8taCSPObQaQy78eC5iTohjZwgCwGbUbUu8joo68Xaknn?=
 =?us-ascii?Q?Pyv6jKx+6VzqBHsi+jcE4pwfA3Brzx1hDPfe0S4c5idEruD4DP+eo+Ogwpoa?=
 =?us-ascii?Q?j3/L0DmDVHbD27trObVt8W/OBxVEUyqeDxhtX81AEBMa37Zhg1WLAfcXpXUc?=
 =?us-ascii?Q?5BVORjlaJqI=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 11:35:24.7685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c6f8c49e-e7dd-42e4-f908-08dccc0c8093
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9423
Message-ID-Hash: WXUYU6AH6K5VFG6GLPNWFZ2653SBR5DP
X-Message-ID-Hash: WXUYU6AH6K5VFG6GLPNWFZ2653SBR5DP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WXUYU6AH6K5VFG6GLPNWFZ2653SBR5DP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update pcm hardware capabilities for acp7.0 platform.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 238b4f648f44..55573bdd5ef4 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -235,6 +235,7 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	chip = dev_get_platdata(dev);
 	switch (chip->acp_rev) {
 	case ACP63_DEV:
+	case ACP70_DEV:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			runtime->hw = acp6x_pcm_hardware_playback;
 		else
-- 
2.39.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CB5949F0E
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 07:20:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF4C114DD;
	Wed,  7 Aug 2024 07:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF4C114DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723008017;
	bh=lJgs8IE/U+vR2H19Hg3rrBeJUe//fkqHXSEHCm6Udhs=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZzLZc0u0gfSaDHfG9GFn26PWnxrjesIbU5Bfsa8A1jfHisE0gFN4XZVHrXXs+2WQC
	 PvUhYa/sh81t6Vj9UZX4rPCOzuDV3vqLXrvr56ExYZDno/6RwGrZG93fvxzt0T4/qd
	 5aWm/QlFSlkQuFA0NMVY/uKFFPnUsbxOKyaBAajg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D112F8059F; Wed,  7 Aug 2024 07:19:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBB4FF805AE;
	Wed,  7 Aug 2024 07:19:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37834F802DB; Wed,  7 Aug 2024 07:13:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A77CF80236
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 07:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A77CF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=LLmfN8p2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxVIA1yqV4GtrtZRh7zh+QV/2co4TEMgZl+gViZNpZpQ97Fx8123opqTnC1qHvrZS6LcosttabPL0i0wGd8YiB8mQ/wRGsDQSyCMDJVIsNlZB1YMtaFlGQvd5hXIDV88TfUTpZeDx15DpbVUrbVnwnsLToRKqSZXlrdLSvLBw1rBzFSsGHUGiQbt/6pvOOwG2k/u8fC03CSjL9HoVrMqdDl5GRlLVoDdBAtbrR/gEkL3HcZDOnZVSZkzu2Rg/hU+ntNn2AsUHO7+wBk+ahSvNLevigVFyy3n3bhWe6za3cu98QR1kmg2GksV2swoT0v5wi3T/5SPe8J/qzdlxA2cyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4XpOq0sD6iKIaIU3wBjg4JjTSKWAR2yTAz6PpuNNL8=;
 b=yJtsY1g94cLpFHUn1ixxV1HxEj4LqAS4nkvbO8W227w16naieNLsVxFH/CGh1KOBG4GqV9/Ll9TtphCImHIBU4K/9KFIg79GwGmNOMg8C78e+tIdLE3KrUdD9Vlcdg3q/UDobwE4MUAyHC7HDYyC6UL9n6AR4xk9cVXiHwbnSdy7a5mKOkdzX2BexoYp3aixjMjdW4cA7QGMe6oEUUEksQWi3adUZpvXpDk2el29y9KA3lp0/U5Juq3gZjC0CEUOcqz6tpjBaitqCxhfS8lpZh2SbTjz+s3Z6eEzRkjES27r0UA/9+Xf1V0UGfKzkRz+7SrBmqRrm3RZQpgy4CDxoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4XpOq0sD6iKIaIU3wBjg4JjTSKWAR2yTAz6PpuNNL8=;
 b=LLmfN8p2wc3w2OES4WzHjeSynVeRW1NkuUgWwkL2J7EF5NlKvQqYw2hJSi5ZTfUqOnYL7jP1cqu57cyNzyVtuz/NqycguMY8SyHf8Hayg1Itzg8IROa6pNMcerWby/jcIL9zJXlg59g7y5FySTMSz3kpGymMSO0A+1TchC3Y31A=
Received: from BN9PR03CA0616.namprd03.prod.outlook.com (2603:10b6:408:106::21)
 by CY8PR12MB7586.namprd12.prod.outlook.com (2603:10b6:930:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 7 Aug
 2024 05:09:12 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:106:cafe::28) by BN9PR03CA0616.outlook.office365.com
 (2603:10b6:408:106::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29 via Frontend
 Transport; Wed, 7 Aug 2024 05:09:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 05:09:12 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 00:09:07 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <krzk@kernel.org>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "open list:SOUND
 - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: amd: acp: remove MODULE_ALIAS for SoundWire machine
 driver
Date: Wed, 7 Aug 2024 10:38:39 +0530
Message-ID: <20240807050846.1616725-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|CY8PR12MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4645fe-1c24-49a8-b373-08dcb69f1390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ymQ0d+C9zn+GqPRHKtatU6P1qHma4553hp1+u4Tuoi649yJ0RCCSwmenWbKs?=
 =?us-ascii?Q?07lLfva4i7KxOjovzh21plZ2EyuvYjsmfeSn3oUfNJDGCiTk4FtmNfTwu4A1?=
 =?us-ascii?Q?I2yYFahjHiYW6cBxvbU+emUbm0BjacJl/9Hi71cHHde8GuiAd5EsivFwM4ZL?=
 =?us-ascii?Q?HEoDvi/nUNUbKa0gTKcFxscUsPEN1Gx3d6a4IgEWnE1rRpjP1o25cJ8Gw3aJ?=
 =?us-ascii?Q?7pKtzMtYFhpHt8VBveXM3H/TGBe4tyODIUou2qioW7eOdErX7cn1Mr1+iQGC?=
 =?us-ascii?Q?e56Mwqmw6h4fA0PvlFGAll0WzCCtGubxSgSvHSHRKKqSYX8GJq/gGfE4JyY/?=
 =?us-ascii?Q?gwLaGHC8Cjvx75MxmXz4RRyV4BG4mLawi9G95g/ndCDZX0c3XPArNfr+rcc6?=
 =?us-ascii?Q?l49k1TBCwmEdgjD3/lmrnJfe62pgEG1Q2t8HuFme7UtfxDaMp+g7JQsAxHUo?=
 =?us-ascii?Q?RKLJM4a26eciwW49bCb1jkDy//uqOh91OV1xRUevvhOoOc2miyxdBe52nAJj?=
 =?us-ascii?Q?O1+NXPk4YJtUyoa1TJ4n3yOIssYDlMWPHT1g/ZBQapBpVcoO0yh3IdF21RVx?=
 =?us-ascii?Q?WafRGoA4B29rQ870HFxzPYtFVskp67QEWsf+fT8/GbolqHRJDfLeapAHcq9o?=
 =?us-ascii?Q?+WOWH7GMBHO083ZBbIT0h1QWls25lrQ4rLxtBZ3X7jekEj++Of/IEEqKaea7?=
 =?us-ascii?Q?uCruchSQqDi8mvU5TEfqe9ISNHCFdYsazMIoF9vVxLD/kW2t266X0OYqk0SL?=
 =?us-ascii?Q?IbPXNuBmB7q7TDoN7ImdHVrBc6O3v27JGnDAlm7FgUVyFc4MX4QVafKTzuTL?=
 =?us-ascii?Q?LpLOr967FhfIAv6o7qjhK4Zv4vbtoIpd3oBHLv7xAFoFNYcif4PZMLRwih0A?=
 =?us-ascii?Q?fVPQryj/i8PRrM7h6qHmVbtGcTwzVPLdVG8ilAMjS4a4avjgsQ220um8nwWf?=
 =?us-ascii?Q?YOdq/4LCJkyPtzqt15/7h1zzkdsUg/P1L8UQaXJv3StjheKeJ9T1PZjk/7oe?=
 =?us-ascii?Q?O7SML9r+fKthjUHpRNiu7gdAk7Ar2eBjbvqSdMZoWDuOw4ZdSrUtqwZ2Loe+?=
 =?us-ascii?Q?EcEPaTh2AIrbG2JHGU+oVrP/LKaunV/Owg0gXUj53UmpgaIt6hmVeTZh68h+?=
 =?us-ascii?Q?o/e1qEh5QlX6+1BVMku8m78x48M1lpe1ZXuGsGhQaBtUn+Z/5ArZ4VsaC4z0?=
 =?us-ascii?Q?2w6QBaWLChxukPSZmr/2flIVBFeTxL2V2eT25xwbhU/fqBSUaNTutaezcMTT?=
 =?us-ascii?Q?LSPfQ8c9nC199sQQSm+DBubhPYIvnDgiJ0IAN/8igYueVhvDdCwNJBum5fIk?=
 =?us-ascii?Q?j9MFH10/QDJqh8tDDzTnBHD8OFTVblYqfyytiB0Oox2Ea/XDZr+lksansJJl?=
 =?us-ascii?Q?koaFhZjP2lwh5zAajgmunYERIgIj3M3pSu74i2AMluiefUJ0WZpGALDRMryK?=
 =?us-ascii?Q?KDTKd1Qnl17as6js4/+uctbhzYeKnErM?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 05:09:12.3292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0e4645fe-1c24-49a8-b373-08dcb69f1390
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7586
Message-ID-Hash: XBZJ2EFS6EVCRG2F65KLSOLI3SSFNFIS
X-Message-ID-Hash: XBZJ2EFS6EVCRG2F65KLSOLI3SSFNFIS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XBZJ2EFS6EVCRG2F65KLSOLI3SSFNFIS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As module device table added for AMD SoundWire machine driver MODULE_ALIAS
is not required. Remove MODULE_ALIAS for AMD SoundWire machine driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 3419675e45a9..f7e4af850309 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -738,5 +738,4 @@ module_platform_driver(sof_sdw_driver);
 MODULE_DESCRIPTION("ASoC AMD SoundWire Generic Machine driver");
 MODULE_AUTHOR("Vijendar Mukunda <Vijendar.Mukunda@amd.com");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:amd_sof_sdw");
 MODULE_IMPORT_NS(SND_SOC_SDW_UTILS);
-- 
2.34.1


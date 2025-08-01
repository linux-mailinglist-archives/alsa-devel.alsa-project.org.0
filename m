Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE936B17CEF
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Aug 2025 08:31:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3156F601E5;
	Fri,  1 Aug 2025 08:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3156F601E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754029913;
	bh=lKu6AUlME1OPQ4biU2TYT/jmNsntDzFkq5ywhGmArWs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BAYSdBDJwYYI9yvn8I3RvGv2kQ2p2eGeIs+YHqdINOAgcZ3B2/nkBskaTorNXHxVl
	 Yz9cx0aS9I7cjQm/+ljJW9WdwVsJsnNHLc47Sd+ZYgt4jm4X+vNg9jAcKZTdYyRMWl
	 lWMakU8r5Vok/3LN2FIrSIc3jx8a0+52KHnadNWw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCDEFF805D6; Fri,  1 Aug 2025 08:31:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00C71F805C3;
	Fri,  1 Aug 2025 08:31:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F928F8052D; Fri,  1 Aug 2025 08:23:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2065.outbound.protection.outlook.com [40.107.95.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A91DF8012A
	for <alsa-devel@alsa-project.org>; Fri,  1 Aug 2025 08:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A91DF8012A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ni8asxo+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mwQ5L+gqBcvIuW5WCXwoXfd5BMA8e1gyZ+uk3l/VgjCYGrbTBSGWc10L3dvgwVBEKyHSpxwTyhtGXkUdjX971AURGFwQu3JqKSFmOKE0u0pF8Z2D2l3WwnY3SRiavJKFXReHrern+8gIiL3kRF0be7c6QRs9uvBi5fc/gVVH9o9jLvPu2Fk72d1f6ETLyDPWX6n1qQH4+oQdSV2aRsQ+P2T4/TL+CSEUSJ/bBaksgC56Q4qgDh6s4RHy1AzrVfs+YthixqzoALio1CjUK5FDqbERMFvvaBbEeC0uXn2YHqZbmXWvG2+YqiuY8eHJrAwqMLYiHWioPd7AxrxB2sM0Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfq8lUKoukk1DmhASgS/+VDP4vBRCi8uv2TlHM7BaKg=;
 b=q2NlyRaFkIolwFr58p6kqNhJDSBEPIRj8mzxxuc4AmoavO1Eh9NtxjrdBi7TCMvfR2FLrRVAajHU+my2DYl+Q/YE1kRvNRZ85blr87SRIITpV1W7NBM3CdGY2v92hmfJ6MzCMIq0hssfeb4LgDVn3SeO2VKrivi+i/RatJsxVY2RAOmyRR7zDH/xsXVG+jj231XzZ0ZJQLFJxBIJc5GpwiKkEfEowjEQN1qiQYGg75HRhO54L+9rPJ5gS/SWETfSZls0i/nuaCZK4UDaFCbDjZdJ8UcurRGvClEkWXxrlbVZZh92feSML48/BWgczf4y7Tz7Q1TxbezY+ZW3+nYRhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfq8lUKoukk1DmhASgS/+VDP4vBRCi8uv2TlHM7BaKg=;
 b=ni8asxo+YS13/kRVBKsbw0UrkIKzq2nzGLWbUpUTnvLjmlsp2ut6kQgPqzSeCD1amc/Uuwj/zv0v0cx1C5UmD3svXxH/ocrOcgp293GNkFP8xr97aDUHgfIEGnmIZ5RCwTJ1S1/Y3TMfLGS65TNLbgKnYoDKbMsHtUo1Fi9TPzQ=
Received: from BN9PR03CA0673.namprd03.prod.outlook.com (2603:10b6:408:10e::18)
 by PH7PR12MB5687.namprd12.prod.outlook.com (2603:10b6:510:13e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 06:22:56 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:408:10e:cafe::44) by BN9PR03CA0673.outlook.office365.com
 (2603:10b6:408:10e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.14 via Frontend Transport; Fri,
 1 Aug 2025 06:22:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Fri, 1 Aug 2025 06:22:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Aug
 2025 01:22:47 -0500
Received: from r9-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 1 Aug 2025 01:22:42 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Peter Zijlstra <peterz@infradead.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] ASoC: amd: acp: Add SoundWire SOF machine driver support
 for acp7.2 platform
Date: Fri, 1 Aug 2025 11:51:38 +0530
Message-ID: <20250801062207.579388-5-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801062207.579388-1-venkataprasad.potturu@amd.com>
References: <20250801062207.579388-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|PH7PR12MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de11dc8-9ca3-4c7d-598c-08ddd0c3daa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B4RcnH9axqtr7UpsI/SJ3SZaRWo9UFP5W4acSVyxhnaa3THujE55Tg+N2XFc?=
 =?us-ascii?Q?u4b5pleoi2O6C72HSEk0ZxA1lqRcI2OkUrWdYNSD++YP4Rd4iK019YlcbDsy?=
 =?us-ascii?Q?1pRCc3JQW2JivBkoUNI8PZ1Z9pTwPi4AZtcwbRltdJD2ed1WDJScjkc8Gd2X?=
 =?us-ascii?Q?+mdRwZ5mLhX47eF7UzQVfr6s5XIXSNOWx1AYDIT1dfiDmDcyYo417ueCAwui?=
 =?us-ascii?Q?mT2Vvze7iMbtqs0CgSjFneYx6D5Ny1DcbOK6CfJu0p0SyaM2FUZH5nLnEigO?=
 =?us-ascii?Q?H4Q64HyoKDWnvLYna2XsG9TKcxUVatnHa4MHHW+0VSa90yodar3uUc0bh58N?=
 =?us-ascii?Q?GFeu0jJtPVi3LSKOkIugqWQCfRJoSJqxKdljXgVL6/9XCGa1Zy1ROw0BpXEf?=
 =?us-ascii?Q?JGyzrC3EqBaUrKQYjDL4Jvg7TMsP6DP2NzewRyVtCVDwmxRVvmmPbhYpeD9/?=
 =?us-ascii?Q?Yro76pVEwB4ZUy/iramnRKbC4vjV56TnTe45tZrod920h8EmYt+9wx8Y9/zg?=
 =?us-ascii?Q?dJhOp6i0ocwc7AMU7I7IICi6Zp1FkbOrYzCJVBGBIiIiU22EupYJxf6RhDdo?=
 =?us-ascii?Q?yObXYcUj49bpaB3pyXLREL/zKtXItlZ/xPaPvzS9QccmtmgYmmBH8/hdigO7?=
 =?us-ascii?Q?cPnO811kKhZ7ak7fKORKZ9DrEAGNk4zMzJEhn6hC0hUVbC9vqbpiohUjEcD1?=
 =?us-ascii?Q?414J/7s+i/nEqF+UUhyy8m2LVfBLdNVfvaZYB+2Ay1Jxsk7RXt0VbCbjNOHr?=
 =?us-ascii?Q?tx80bGrR8Bg6m8XCe+THjo9zTimEFu/PxnVYJ2gy5y/lwosPENWYKKLMZL+/?=
 =?us-ascii?Q?ZjHRHnvFldpD1PoRBzprCfAFAM9I7SMfPODBfcIFmaEh4e3LUIR1MqAMtrYH?=
 =?us-ascii?Q?xY0T0JCKMQCVZB5jJx8AjjFchq5vl9KNfuH0huw7eaVNxBNXOSlEdg/WoaVc?=
 =?us-ascii?Q?kvEsyimPCi0yne3U0+8Ecuz5yZvGs4sqvcDdOHLKpa+v3ZI1plmuAXiTxkdi?=
 =?us-ascii?Q?Z0SbdXjsuJcOPgprVuWhEFhwnyLv8d4O6qUFX6RqcfWsQ1gLiWhOs+ZjiCFy?=
 =?us-ascii?Q?G5P8r1aLUF9+osqS3aY231YdPJRM7Nd/FbEpWCHzRq6sRAna9HKfW3+/GWdd?=
 =?us-ascii?Q?adqkQbToGxZOfYiPOs217xRXX1eLgba2sPGcF+qdy46B9Ru8F/4f/TPbDfF4?=
 =?us-ascii?Q?duuE3bAURd4SAOFzvPMbIUjNTRXpISgA8p/m+163Q+BJkCcBvAW82RbBljBr?=
 =?us-ascii?Q?2LUIQFXoL+fMWEKM4FFymV8MOEhWKqlvwcW2HzIeJLC+yTfU4BRTAUkWrDs9?=
 =?us-ascii?Q?l09ggTLxyojtry3HZA/BAKoRcTdVA+GGdXyja0fG23uoeRxoLrKbV3N6PXyz?=
 =?us-ascii?Q?4V1imdywi+fMT9nt5oRA2xA77TDrFbw1Dg5iOTAhce/XItPmcEvGz9GXO31/?=
 =?us-ascii?Q?f2/1/kwTptOMiRjNrzGgGzlCyfrE2/xm0I524LhZGRDwbSRyO1xFYCisOEd+?=
 =?us-ascii?Q?XlLxZCLMRCqr5j5aYVW/7WMO6mQjurIYDlmp?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 06:22:56.1623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8de11dc8-9ca3-4c7d-598c-08ddd0c3daa7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5687
Message-ID-Hash: 7C5IW46HRSK2OOIFTLLKBSBXQ4QAMTBJ
X-Message-ID-Hash: 7C5IW46HRSK2OOIFTLLKBSBXQ4QAMTBJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7C5IW46HRSK2OOIFTLLKBSBXQ4QAMTBJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SoundWire SOF machine driver support for acp7.2 platform.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 654fe78b2e2e..91d72d4bb9a2 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -130,6 +130,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			break;
 		case ACP70_PCI_REV:
 		case ACP71_PCI_REV:
+		case ACP72_PCI_REV:
 			ret = get_acp70_cpu_pin_id(ffs(sof_end->link_mask - 1),
 						   *be_id, &cpu_pin_id, dev);
 			if (ret)
-- 
2.43.0


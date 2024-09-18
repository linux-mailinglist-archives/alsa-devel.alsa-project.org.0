Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE44E97B7EA
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2024 08:23:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EA98B65;
	Wed, 18 Sep 2024 08:23:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EA98B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726640608;
	bh=loQzfQmJhsQ0pWkbcGsa188ZKhzzVpYxkEQOWXeanRE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tzX1oq2SVPi0kQ7SFBmgxdVH0cc7K7ZmlRp/whE/F0IDR9E8O6jW5mqzCwVfeawFg
	 4/q8d4wuOlvl5MkuMzTI1Rz3ksoiL3v9qj+LygfWgSCnsw3eQjwHqDandvwhipEGT8
	 RWwAh0VMZxMtpQTPTBwHLz+dkll10D1BHaPA6TDU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF4C0F805E1; Wed, 18 Sep 2024 08:22:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55984F805EB;
	Wed, 18 Sep 2024 08:22:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BFC2F8020D; Wed, 18 Sep 2024 08:22:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A70EDF80074
	for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2024 08:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A70EDF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=UTmN8FCh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmOlIY+EANwaWFRBkz5AMZsPVbod4oJFSqWMO2mqA3yiCj+iF5NIpQr53tnL12Gnzue67wyV6Bs8LYqwJYz8Pq/7rBCNFTfa84s6c4erg9mDe0hxbXb7YpSyspZTQc+7L3NgISHVMkWR9vHJ0leTbsXnM4cYrIYwA7OkmodclqiVqx3QgziwEuIM71JqTufV9y2cFksbWbh1Y2oZcgjXbPwmiC28pkgjWMTVlnbrfcOb7beaIiww/Jk0NOgfx6e18ZY+CW9SNb1qYQa6uBYHvw6CFZVfypFEwAAxClo20m/H/xOBkS/+sKhdrxu5zCFydfpwaA+kG80d4fKbNgMpmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cf4LILkITo6sRTgwpXVGJGnK3u/PXFXhO0mgTbTkqgE=;
 b=ciGPPY3KMi85D8DQohDGb3qkMiIWZd6R4BChjCQlJqiTyEhQKXMwomxZAv+mQ7pnNnxECtHL+GPfU5Ub/h3QiAOtcIctYQ9Uhnn9zE9Su5U5Tms6CgDgWnZ+MaIDJpGJ8DUlMSd52Ekyctq2LL/5aiOa1nguluWI3Mwn1vOIb1BGTFJnrFRQJwYr6JNJ6VBbefu99Og5fSraMjazUCkBHIKu9OgvuARVlos20cf75ujqtwNjQxVMEoxACKVlUBY2he9hi/qU1Bceb+96Qnq7wVsI4Q5h4jjP1hQ1RwJWMAEJkp9QUXJlv5K1qMln3ZOFVEhgvI1nH8VDI8fCqC2Fig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cf4LILkITo6sRTgwpXVGJGnK3u/PXFXhO0mgTbTkqgE=;
 b=UTmN8FChJnQoVvmL2KF/eIf5eNyjCHnkyWw0SsbCbo900fVdEsnj62FP1oBFarsFKtOSe/V+Ulkak14DDpmZ55oSUbnmq24Z0HilMPLxfxnkuJ0Y06UU3F2YTxxALK9GLS+HtIczER9foE2iLT6fW/tyKB1MLenuCUL4WSgMpBo=
Received: from BN0PR02CA0009.namprd02.prod.outlook.com (2603:10b6:408:e4::14)
 by DS0PR12MB6581.namprd12.prod.outlook.com (2603:10b6:8:d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 06:22:43 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:e4:cafe::5e) by BN0PR02CA0009.outlook.office365.com
 (2603:10b6:408:e4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Wed, 18 Sep 2024 06:22:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 06:22:42 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 01:22:23 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 8/8] ASoC: amd: acp: remove unused variable from acp platform
 driver
Date: Wed, 18 Sep 2024 11:45:40 +0530
Message-ID: <20240918061540.685579-9-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|DS0PR12MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: 4994a2e8-e3c4-4d61-9345-08dcd7aa4dbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MqG937KLzLhQIuyUfXrcK8HWV27Vpi9kWrU3F6nHRr7s3ujckApmH13TOhdC?=
 =?us-ascii?Q?TUaXG5D6vYTuYZV7KLwUc+rF4Mzl/NSJTKhmBdKm2hn2HUlsawAXy3MYtmLj?=
 =?us-ascii?Q?IV6AvsfdavVl+OUYtL5mgnP61woAH+JpYJaKmKnNWgYDLDqRZcd8lS1Npgl4?=
 =?us-ascii?Q?Lbv2no+mbpfXgyf1++6+zZ+S2J6WobHj0MKwCwAUzrPuBSdICEw7hvSDp/aO?=
 =?us-ascii?Q?3nPNTDUdxJMyEtkSa9b6YLaX4XWIKc5e5SYCuaHGTwj7y2LnxGiFSlUyrxel?=
 =?us-ascii?Q?QO+sA8EBCmooaYU6PKOUzQLnO/6n9OHr8mWdYCMbjhspEwK9qjNT4k56lrlA?=
 =?us-ascii?Q?j/TFKWacjRvGboUGI30mP85o5TosKZXaboFV1FRgTn3dv4xSsNiwn+DnQSut?=
 =?us-ascii?Q?G1Ycvg1cZr5N06s90QbMKkiwEsC7UZI3IZkyXhpkyxed/oP3qvrsCXQPjb/L?=
 =?us-ascii?Q?UX03PWxs/D8/QBbGOPmcQ0z0GykiBrRFjq8c/PWbkdZ+pK8IFnq7eUbjk5M5?=
 =?us-ascii?Q?cVA9OK0gngBskq+QVaKur3PBm0X9mJIQ5WGtPKiw8SFMB4VZoTMw6mMy2DPx?=
 =?us-ascii?Q?jIo16yh7T3y9gqDSRGYAvZZfD8c+bPqu5JddIYNog1sG8GN7z2t1+gwETKBi?=
 =?us-ascii?Q?6zg9WPpCKhcRcYPUxNnSwNKLm30lJMlvEDHlDJUFFVKBlahnqBcF/0ZklUzs?=
 =?us-ascii?Q?OOv2EX2b6XddGMPj+priIXoQMbyZlYba21w/xsmq4pA2w39woH1En0pBdTAe?=
 =?us-ascii?Q?xiT1dt+DDG/uTghfwvI29q7ACNRKdGahzz8fX/Xwwe1/AVfETc1I/aEGfXpn?=
 =?us-ascii?Q?hGrsSB/oTtepYJvLOWWaf3na5+DhqmbQeznQP160tgcpzeg6WA/xbzo3zI/Y?=
 =?us-ascii?Q?E08NjriKAX1TYUmQLEkc1RR0q908Hqm1ZEfhNM+Yk12Ik9NzupwOCYHrDch1?=
 =?us-ascii?Q?5M0nSZ4aOIwF9CEv88nDTi8sFYovBgzu6SHT9wauR5XFGy2LKj13fLplsJCZ?=
 =?us-ascii?Q?thPH/rNXsHOsGVdQwd9gcHQceCbepxXgAZ+JY5PK7hMpmH3P7sn2oJ8gIPJT?=
 =?us-ascii?Q?VGPVbU8SczInAxqXiFOr3MaNBbxKUxwD3yYRer/joEK1ugWiSFyb4cN/CfTM?=
 =?us-ascii?Q?ksLJnp0db2aq2HHvSur0+83zaWrqCNtp2q3Tlb3o5gkpsJKyAVJQP+dqDJf+?=
 =?us-ascii?Q?EXb8N3WJ+ymq3AjshJYY26rLDFKoOcwt60gO2QKmZVKg+cK91mdw5kQeZCnx?=
 =?us-ascii?Q?GuzJVBFTIuauhnFquoQIPEdoH89yFRtFQwGt48Y6C9bszaxAMFKPQGEFDQML?=
 =?us-ascii?Q?2DioJrplsozZYWTbr/vynW3HK3xkiO9uS4Eegd6V5djLx0pkJcyrUcwGFgPk?=
 =?us-ascii?Q?4y6pQjdRVxvHH66K0uNSCt4+ugcq8MQybCann5y9qsu9X+y0kniDR68CWRbW?=
 =?us-ascii?Q?XZ0aVZM6DcBcORjFBH32FXNWpQNLVTeO?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 06:22:42.7799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4994a2e8-e3c4-4d61-9345-08dcd7aa4dbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6581
Message-ID-Hash: JNA32CEROFCYVO2HFTJAWPA5WSNRWW4G
X-Message-ID-Hash: JNA32CEROFCYVO2HFTJAWPA5WSNRWW4G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JNA32CEROFCYVO2HFTJAWPA5WSNRWW4G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove 'platform' variable from acp platform driver private data
structure. For platform differentiation, ACP pci revision id being
used through out the code. As platform variable is no longer used in
code, drop the code corresponding to 'platform' variable.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-mach.h      | 8 --------
 sound/soc/amd/acp/acp-rembrandt.c | 1 -
 sound/soc/amd/acp/acp-renoir.c    | 1 -
 sound/soc/amd/acp/acp63.c         | 1 -
 sound/soc/amd/acp/acp70.c         | 5 -----
 sound/soc/amd/acp/amd.h           | 1 -
 6 files changed, 17 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
index 414d0175988b..f94c30c20f20 100644
--- a/sound/soc/amd/acp/acp-mach.h
+++ b/sound/soc/amd/acp/acp-mach.h
@@ -53,14 +53,6 @@ enum codec_endpoints {
 	ES83XX,
 };
 
-enum platform_end_point {
-	RENOIR = 0,
-	REMBRANDT,
-	ACP63,
-	ACP70,
-	ACP71,
-};
-
 struct acp_mach_ops {
 	int (*probe)(struct snd_soc_card *card);
 	int (*configure_link)(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index 065ac13b2220..008d97598b62 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -227,7 +227,6 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 	adata->dai_driver = acp_rmb_dai;
 	adata->num_dai = ARRAY_SIZE(acp_rmb_dai);
 	adata->rsrc = &rsrc;
-	adata->platform = REMBRANDT;
 	adata->acp_rev = chip->acp_rev;
 	adata->flag = chip->flag;
 	adata->is_i2s_config = chip->is_i2s_config;
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index f372a56a0a17..166f1efacf1d 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -185,7 +185,6 @@ static int renoir_audio_probe(struct platform_device *pdev)
 	adata->dai_driver = acp_renoir_dai;
 	adata->num_dai = ARRAY_SIZE(acp_renoir_dai);
 	adata->rsrc = &rsrc;
-	adata->platform = RENOIR;
 	adata->acp_rev = chip->acp_rev;
 	adata->flag = chip->flag;
 
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index f0c516ccf96b..e0b86132eb95 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -237,7 +237,6 @@ static int acp63_audio_probe(struct platform_device *pdev)
 	adata->dai_driver = acp63_dai;
 	adata->num_dai = ARRAY_SIZE(acp63_dai);
 	adata->rsrc = &rsrc;
-	adata->platform = ACP63;
 	adata->acp_rev = chip->acp_rev;
 	adata->flag = chip->flag;
 	adata->is_i2s_config = chip->is_i2s_config;
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index db5dd64969b0..3e4fd113a8a4 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -210,11 +210,6 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 	adata->rsrc = &rsrc;
 	adata->machines = snd_soc_acpi_amd_acp70_acp_machines;
 	adata->acp_rev = chip->acp_rev;
-	if (chip->acp_rev == ACP70_PCI_ID)
-		adata->platform = ACP70;
-	else
-		adata->platform = ACP71;
-
 	adata->flag = chip->flag;
 	acp_machine_select(adata);
 
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index dcfc29b2f072..ee69dfb10cb8 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -201,7 +201,6 @@ struct acp_dev_data {
 	u32 xfer_tx_resolution[3];
 	u32 xfer_rx_resolution[3];
 	unsigned int flag;
-	unsigned int platform;
 };
 
 enum acp_config {
-- 
2.34.1


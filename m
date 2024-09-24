Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 922F6983CFD
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 08:20:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9635493A;
	Tue, 24 Sep 2024 08:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9635493A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727158819;
	bh=PEVLJXQU6KRun07b6HhrFMfLrce+M0wlO03pfzhboMM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qEWdZIgNC96NQIOKuNX018i+fXArQkNZUAB6rBKfHoHS3+gtMDZTdjP8xjwagh6Oc
	 e4Lh4gfOO50BeEluRo2bceGsblI+bMlUBrFbvBS0EeHFCaLoiMZuq+hpqkZCmd/Qn2
	 JpjDq8E+95Rwu1gQ9UJwLWwL06YaiOrBz5rzO7Ek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5604CF8061E; Tue, 24 Sep 2024 08:19:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EDC9F80611;
	Tue, 24 Sep 2024 08:19:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72FFCF805E7; Tue, 24 Sep 2024 08:19:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A513FF805C7
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 08:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A513FF805C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=h5/mwgn/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlqR9ypBY7aMs6j0azOXf+omfqwRQ4JFthhZmfc3mqZHu+rTawc34hNeX58n7d9o0+lB8/ZiQoXu+/lbXBDrkbxXjgq4mf3+l7GNgv+Ep/MMHUfHUvnofgYFP9mhjG7wHHHsT0njlSwghDLwmmkoWIhvV5Jf5pIMfAf81zzfnNTPZC1TYmtd9bLVPwAH5vYwZeucKUl4WmqA24NMh2l2IF7XLTxVZsLMwSl2dmK/hvVbBryzhSoabxFTy8Z870C8TSc4N8oMOW0JvMM2mGPr8Bf24XxtkdUW/XxJfVSfjYH0tGTQg9itKk+WuwQO4xfr1yq+p99SSzBu+32S4lGEUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbMtsb0Y98ZJcqNBWX4z+r9vW2AG6RYWKe+IgiqUbYY=;
 b=faaSFe90o6/zahBCLLMq9ZPvuIbH4Ip2kKQ46XI2U557ynCVf/R2YO6/RCrxItekx2DRCCTbTSWqIGZLQGH12SXBdHaQ+n+CLHgNhPPM3Ul8aq5hDs60ewlRgEkMT1WMr8xnUiQwOe3RA3KeqRPHDjFc9EQhMahU3Qq7KKWKQTi6sova6LmMDQo1ERt/FSo013ALoVywpav12Am0X04+x2VsSGPcRDCcUpzFRrhmxY78r+GRLsSFt+FGRu90xEMhJLSEnsHvPIkCH8giMxe9ft7lKPb7Mc+kAH5UwAqilBfLv09W7uamqd/q6L3i0wG5q2T5ZMFhQw61Mu8kdn/vbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbMtsb0Y98ZJcqNBWX4z+r9vW2AG6RYWKe+IgiqUbYY=;
 b=h5/mwgn/Yk5t6INqYx374XUnec9m0W7rNvl4bsATm9XyTQodzd1s3X3/RYjv6T/G+ZsmJecP5MDjABFn/6UdHbE5+zxC/1eQov/+ppqwRd+ul2PlXaUswqan5kmGU/7ZeueQc9J5WsFtKzbAdFZ5icvLYgfu3faBE+uqbxNV70Q=
Received: from SA9PR13CA0006.namprd13.prod.outlook.com (2603:10b6:806:21::11)
 by IA1PR12MB6625.namprd12.prod.outlook.com (2603:10b6:208:3a3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 06:18:52 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:21:cafe::2f) by SA9PR13CA0006.outlook.office365.com
 (2603:10b6:806:21::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.14 via Frontend
 Transport; Tue, 24 Sep 2024 06:18:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Tue, 24 Sep 2024 06:18:52 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 01:18:48 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 4/9] ASoC: amd: acp: store acp pci rev id in platform
 driver private structure
Date: Tue, 24 Sep 2024 11:48:16 +0530
Message-ID: <20240924061821.1127054-5-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|IA1PR12MB6625:EE_
X-MS-Office365-Filtering-Correlation-Id: 840bf857-cda0-4365-0059-08dcdc60c2c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LIKND/WbcaB20v86y2l8d9XDXzpOb8fGihGWadJNSfHgBG5QElobK+ceLIFy?=
 =?us-ascii?Q?OlDwfoGdZKPdu7sKVBaogiUrIuIyDJh6nKZb6hDcgImp/rbx/Y3Fm8xsJkhk?=
 =?us-ascii?Q?whsB+2yj7mIHmlHr86Xn66nDXkbGMICzbsnK0+wbJS1/dxlUcI1F33eQq7DX?=
 =?us-ascii?Q?CzeS4pftqtiyBnLvKP7kJa+gazCiMOde0Ypb7fPb8aruLa8SiGrVot5Xj3Fu?=
 =?us-ascii?Q?BcHcYcqiO/IyUV6DmsaKYWFR5g8IfEqJlom7PzHkx8ZL5+c5YtD7G1KGswJU?=
 =?us-ascii?Q?RaUUvf0icONPmlofeUAXyWW7I9GuYx3dyZoB/pY8XEkuJljCjswH3LreJMLk?=
 =?us-ascii?Q?z5ccquFwimcoh1zrC1gtRCvut3i877bNtwXCqc5ugELjCnrbBp0/YubNav/G?=
 =?us-ascii?Q?FB7+F93e6uXsreU/4M22G+ySsIWbg2IUgcJXINKnm7VikQK2sJrxAXj8c+we?=
 =?us-ascii?Q?XVE7Z5PsokbDV+U6ZF34ZlLzcvM0a9H0W73dXgBP8kqp4yg74mYXKLNWPPw8?=
 =?us-ascii?Q?82pz/1iRfCp63XLaWMlE0AyQv5tg6o/rurTnoTM/xHIu//gxhOpVjtzipJmv?=
 =?us-ascii?Q?FLXfMQbuTtKcyuF4/03nJA0Zb8qZHSvAUrpI78wxTBDt6BRnkNN0v6QhtziR?=
 =?us-ascii?Q?uCf3xXbRSeLD4A0RfI6L35aEFeD3XLfgH/IaUltRNj9E1FUbq2zQPFQg/PE2?=
 =?us-ascii?Q?MIgUIh2utPymkrz0WVErJy7dVS9njCxMCftpGSTu8+NO4eUDvhj87u9DlzGf?=
 =?us-ascii?Q?d4M2stzNHCBd5tAAsrqrLKrWJs9ngpcSiS9bXdj+hm04QGvVLw3gbdDWbZsF?=
 =?us-ascii?Q?k8RMo1rwJKZHA76rocPPsRctmrabSXM+YnEMuATJ3vJkqV5HU6U/IfxEDibF?=
 =?us-ascii?Q?EbslPAvGFBBknhvOz3DWnYBPOv86nfczlmMAzIh/EYOXmNlxrKnG1r/ef2le?=
 =?us-ascii?Q?T9ugNnUXP8WIH0DnsVQJ9+gVDrdug6oLxlLxbLI3lpxaCc1mWFgdqpq9N/xE?=
 =?us-ascii?Q?qER8rJ0dy0rU1+aMNyxLWrdhnt9N3cE00WbIuSZ55rjWGCcxnUz1oCmrgC0c?=
 =?us-ascii?Q?XX9X4h/QV52USXhPOR+rfzZ+fAq7jKEDXYcBvka+aKmWgg24KyVIycrPXQ13?=
 =?us-ascii?Q?m14OUaRma7OFF+42CkC67kebSzssIMzLwY6UcgYDeDjf63TBa8NbnxasTUWm?=
 =?us-ascii?Q?cmgsiVBCHc8WC2a1LuL8tWHi/8UuPgyDmaDZWnL639oaY/1EHnujWEVcBxyR?=
 =?us-ascii?Q?rYOiE2E8oph45hUZwYN9Wzrfi90c3wIQJXWQ1ajUGbnMnFnZLNrNIZNVFXD5?=
 =?us-ascii?Q?IR09dGSiRzrrP5STx8Xk2jso7nBArdv5PoN1RWl5co31hf1lna1oEVRc60SA?=
 =?us-ascii?Q?D51oZ2IFs6hwOBxILPFfIwXD6Htcp6zE7Alz6AD0TFjKoDer/opBDpe0WoIs?=
 =?us-ascii?Q?nfcEuC9U+LO3TT/sFjoqfnrVuzTX488j?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 06:18:52.1451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 840bf857-cda0-4365-0059-08dcdc60c2c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6625
Message-ID-Hash: XGMEZ7VKT4L2RAJ7OAZ46RAX4YVSUVUL
X-Message-ID-Hash: XGMEZ7VKT4L2RAJ7OAZ46RAX4YVSUVUL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGMEZ7VKT4L2RAJ7OAZ46RAX4YVSUVUL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Store acp pci revision id in platform driver private structure for all
acp varaints.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-rembrandt.c | 1 +
 sound/soc/amd/acp/acp-renoir.c    | 1 +
 sound/soc/amd/acp/acp63.c         | 1 +
 sound/soc/amd/acp/acp70.c         | 1 +
 sound/soc/amd/acp/amd.h           | 1 +
 5 files changed, 5 insertions(+)

diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index af6005888c82..065ac13b2220 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -228,6 +228,7 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 	adata->num_dai = ARRAY_SIZE(acp_rmb_dai);
 	adata->rsrc = &rsrc;
 	adata->platform = REMBRANDT;
+	adata->acp_rev = chip->acp_rev;
 	adata->flag = chip->flag;
 	adata->is_i2s_config = chip->is_i2s_config;
 	adata->machines = snd_soc_acpi_amd_rmb_acp_machines;
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index 65782023435e..f372a56a0a17 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -186,6 +186,7 @@ static int renoir_audio_probe(struct platform_device *pdev)
 	adata->num_dai = ARRAY_SIZE(acp_renoir_dai);
 	adata->rsrc = &rsrc;
 	adata->platform = RENOIR;
+	adata->acp_rev = chip->acp_rev;
 	adata->flag = chip->flag;
 
 	adata->machines = snd_soc_acpi_amd_acp_machines;
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index 099e2df5558d..f0c516ccf96b 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -238,6 +238,7 @@ static int acp63_audio_probe(struct platform_device *pdev)
 	adata->num_dai = ARRAY_SIZE(acp63_dai);
 	adata->rsrc = &rsrc;
 	adata->platform = ACP63;
+	adata->acp_rev = chip->acp_rev;
 	adata->flag = chip->flag;
 	adata->is_i2s_config = chip->is_i2s_config;
 	adata->machines = snd_soc_acpi_amd_acp63_acp_machines;
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index 0cd3daf677f5..82c26e4fefc1 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -209,6 +209,7 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 	adata->num_dai = ARRAY_SIZE(acp70_dai);
 	adata->rsrc = &rsrc;
 	adata->machines = snd_soc_acpi_amd_acp70_acp_machines;
+	adata->acp_rev = chip->acp_rev;
 	if (chip->acp_rev == ACP70_PCI_ID)
 		adata->platform = ACP70;
 	else
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index c82e438a1712..dcfc29b2f072 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -177,6 +177,7 @@ struct acp_dev_data {
 	struct device *dev;
 	void __iomem *acp_base;
 	unsigned int i2s_irq;
+	unsigned int acp_rev;	/* ACP Revision id */
 
 	bool tdm_mode;
 	bool is_i2s_config;
-- 
2.34.1


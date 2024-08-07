Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD71949F17
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 07:23:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3624D1930;
	Wed,  7 Aug 2024 07:23:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3624D1930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723008217;
	bh=ieV+xBrhkWPYSpApUkwfDqYXotPUkyJV9b3CxxMkmO0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e5QStji3wCN7W+ZC+YjBDe1soOgnMEjrvHNoOHo8t3BLBHqjR3UAbopBFslxdJX1I
	 bvgQQ2sFAThbNt2PcAwGlxBO9fiL+srWsXasaTJJgWEQtkrIc9Uk+kHtElSHYQJ9An
	 7uIBSiU2TUU/4jLAawAw5Muz7Rd0TXRBYC6MWMj8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46A07F80619; Wed,  7 Aug 2024 07:22:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CD00F8062F;
	Wed,  7 Aug 2024 07:22:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41765F80448; Wed,  7 Aug 2024 07:15:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCDF2F8023A;
	Wed,  7 Aug 2024 07:15:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCDF2F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MRVpj2R+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A7DSFCgzuox7QYkgOC/npu5B6nepOwSVXUEQnxCYerNO8sveZYDSENCTjN5b7lP/4oDbcaromwc7ktNFDjjjc/y3jiRgMDti1pMcGfayJFbnmLRoKZWiVFnYufL9NQNdAIis751aeP8XfIa1gMRH6B1ljV51RgyhiX/QIqYLecuY1fC4zXOtVrvBpmv06WPa2L50Dx2T680HlAsXt7Mx+NF/WDLXZ4T2vK0ONnakSdIGDemzWX/AoCitd5JfuW1+HpTE6DVlPyi/hdxTtBdA76GiioSoKuO61nJpbpuYHuYjnmS9iuO4aM7z6qeS37sjZXR13q8J/sZT369riX7wvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxkBInJSWtS/+2b8sbBeUAK9a3OMWSIdNo6kSvk5wFo=;
 b=DhZBq4ZlcrDFochazD8BMND04CXWS5MxvxPBcqT7lxItGFo05GH+uxG48d71yG1C4PFMp9ftY9tAQAzZygzcXMI0Gx5+Fdo4g7FDMYWKVSyHiNoZzcySVYG4SLCIEPr5/onlSl0UbmDNlpo0nhtKcAeZ6dFsx7cuFFuZ4bGaDrBbAgP+iJpbLitO68hcShDyzF/As2XDoo1HsV7EoHBz97rWOJ2RwgebEcp5e3sRn+uBnhvMYr1ItuZCG+h9NpEYILUrcNXqNNt/lUctruo5gbpkaa49PrrwAhZkquDzrNJpHtrCh/QDQn2cnyvIeTX5ePztUmKJquY5sCco2DR7JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxkBInJSWtS/+2b8sbBeUAK9a3OMWSIdNo6kSvk5wFo=;
 b=MRVpj2R+9F6crf7n0i0GI2QpHQsvB7CgBLJ907Z69ob7JkzgfPxCxxnRiq2sSlzrTcSYSbZzjsopHXLn1VSbyku9Qkh1hQzw580neY6m/4PHr26L9w79Dwcy2YoCDEHR8Eb6ItxL6TXxl/kU6UBNfX+mFn9JoXC+ZDcqXzRvfa4=
Received: from SJ0PR03CA0070.namprd03.prod.outlook.com (2603:10b6:a03:331::15)
 by SA3PR12MB8763.namprd12.prod.outlook.com (2603:10b6:806:312::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 7 Aug
 2024 05:15:29 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::d2) by SJ0PR03CA0070.outlook.office365.com
 (2603:10b6:a03:331::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.29 via Frontend
 Transport; Wed, 7 Aug 2024 05:15:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 05:15:29 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 00:15:23 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	"Kai Vehmanen" <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	"moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
	<sound-open-firmware@alsa-project.org>, "open list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 7/8] ASoC: SOF: amd: remove unused variable from
 sof_amd_acp_desc structure
Date: Wed, 7 Aug 2024 10:43:19 +0530
Message-ID: <20240807051341.1616925-7-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|SA3PR12MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: dc4f9c7e-8a07-42ac-30b4-08dcb69ff45a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0rIKBakFylX0qD1lH3BJx6apGlANGJ/miyttHVrzsuU/J8EeMz7g13m8bt/m?=
 =?us-ascii?Q?6DXyfkWHlIRQFx1OU5OHU+gjKQM7Ql5i7y0aBDAefMl+IgAPUWei1fiO/mvi?=
 =?us-ascii?Q?AWLDPMCDvm3N+MGSf7a+3/CMQQXWXS5GGsUGZflkWT7UrgMMqZdxdJBV8dZf?=
 =?us-ascii?Q?ZRSivxegsvhSQ92wFrnhjljZRRwWYLcKkPAWKigMYbdRm2bNIZtao0LBdi9A?=
 =?us-ascii?Q?F58fHqKTWFrnUMts9vg884+lQU7SpplNfgra6RmW7pWZCK/i7JkOMfO6/32W?=
 =?us-ascii?Q?OhsoZ6h1P4ILJCjHrpndT0aQPrTqDzFwRHS3k0zNqWsgY8FyDcYANGm64SLE?=
 =?us-ascii?Q?Gmf9FfUnquygtPFnyxTsVoFgfXFWCZe4OflGWTTxu79W2hs7wb5z5Lt137EN?=
 =?us-ascii?Q?cLJrC0w8YNUChj2Dgf4W1ZsN4N+pmucGVDKNZ5oOPBlOszQgW95VpPgsXLvc?=
 =?us-ascii?Q?z4eVnczBYFs3bN2pcvFH5CHCy93jgGfRmBXt1d8wq43ETGMFJBIDWBExzKJa?=
 =?us-ascii?Q?9fQTP7hSdAMsCELrzeB5hgML9vy7d6K8gU6v+vY6FcdxoxBQO6FIINtapHoe?=
 =?us-ascii?Q?QdvTCrCjFmXQx1VaXXbmMX73BfWZTpYo6LPZy3vrUBE+RsmPiyILGVJNSZdq?=
 =?us-ascii?Q?naG9lA3SsLyI2Uso32RGel+WmmrKyjZk5iaPV1NricG1DbVM1uQzkCHga4JS?=
 =?us-ascii?Q?hKZy5B6c+SKTkUxaxiRTmXHn8vJhil0qSr9pKYrNcsGuztXNtmNk65HemZ4h?=
 =?us-ascii?Q?YYpGGQDLz6wPZy1QxbH4KPlpIxYqm5CJyqDYWeq42heY4LYT0EbTysyvelbY?=
 =?us-ascii?Q?79Slux3tFFi/kzDlhv0+uEnsjxqhGJF3A/hWdKVr4uceaMR55MrYdqUz0bZg?=
 =?us-ascii?Q?MrXM1lTQ29jubTiBt5vvqi1Ga0XA4kijNiqFV6KpBE5SedLNdHXPOjA79jFf?=
 =?us-ascii?Q?eT8+Z+kOTVyvlE0nzW53DusXuqbAIUqFXrPMLBRSWY94B5QS+0VESS1b+OTv?=
 =?us-ascii?Q?tC5KogWbtKfM9d2+XXio6EBKZXDk6WldgEywTgsbyMGfKW7QVK6en9PZi6tU?=
 =?us-ascii?Q?6S6WtzjzBLGMjqwWnYon/45C6Mk9izQprnkL3cZDt4PHjZQIRIodMH5ZnzOa?=
 =?us-ascii?Q?reI/F+uV1PNDgFiDZwXUQsjeLwg4hBgTYt6HDaF+tLJvcVTLJxWOMgFk0+6D?=
 =?us-ascii?Q?SO8VLnCBGuhl10c7p5tcfSSJbudaDSoZoYT8O994w8w6fYeK3QqiziqfYXBW?=
 =?us-ascii?Q?FD6xX8OhXqHP96CHLcyTMMwlxyFRdkBZxuJQVR9qOTiNaZAFrE1lqm/1+3Ly?=
 =?us-ascii?Q?cC0yec+43llLuSL3oNzlrPvdNJxXL1gNc0ppqowBlrAZI7oq8bIGunr4tnLl?=
 =?us-ascii?Q?NwN+4k48rPKNFTmiTYO65qtJdT+H7x0spwCbylYjKdnRQchVKYjOQ87NcyX3?=
 =?us-ascii?Q?7GGr8JZDlfl2ErW0O7A+Wdj2PKgL68Rh?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 05:15:29.3811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dc4f9c7e-8a07-42ac-30b4-08dcb69ff45a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8763
Message-ID-Hash: 2IDV545IUZSR35GYCHBNHNBVG6EYI34G
X-Message-ID-Hash: 2IDV545IUZSR35GYCHBNHNBVG6EYI34G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IDV545IUZSR35GYCHBNHNBVG6EYI34G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove unused structure member 'rev' from sof_amd_acp_desc structure.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp.h         | 1 -
 sound/soc/sof/amd/pci-acp63.c   | 1 -
 sound/soc/sof/amd/pci-rmb.c     | 1 -
 sound/soc/sof/amd/pci-rn.c      | 1 -
 sound/soc/sof/amd/pci-vangogh.c | 1 -
 5 files changed, 5 deletions(-)

diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 321c40cc6d50..11def07efc0f 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -190,7 +190,6 @@ struct acp_dsp_stream {
 };
 
 struct sof_amd_acp_desc {
-	unsigned int rev;
 	const char *name;
 	unsigned int host_bridge_id;
 	u32 pgfsm_base;
diff --git a/sound/soc/sof/amd/pci-acp63.c b/sound/soc/sof/amd/pci-acp63.c
index e90658ba2bd7..b54ed61b79ed 100644
--- a/sound/soc/sof/amd/pci-acp63.c
+++ b/sound/soc/sof/amd/pci-acp63.c
@@ -28,7 +28,6 @@
 #define ACP6x_REG_END			0x125C000
 
 static const struct sof_amd_acp_desc acp63_chip_info = {
-	.rev		= 6,
 	.host_bridge_id = HOST_BRIDGE_ACP63,
 	.pgfsm_base	= ACP6X_PGFSM_BASE,
 	.ext_intr_enb = ACP6X_EXTERNAL_INTR_ENB,
diff --git a/sound/soc/sof/amd/pci-rmb.c b/sound/soc/sof/amd/pci-rmb.c
index a366f904e6f3..c45256bf4fda 100644
--- a/sound/soc/sof/amd/pci-rmb.c
+++ b/sound/soc/sof/amd/pci-rmb.c
@@ -28,7 +28,6 @@
 #define ACP6X_FUTURE_REG_ACLK_0	0x1854
 
 static const struct sof_amd_acp_desc rembrandt_chip_info = {
-	.rev		= 6,
 	.host_bridge_id = HOST_BRIDGE_RMB,
 	.pgfsm_base	= ACP6X_PGFSM_BASE,
 	.ext_intr_stat	= ACP6X_EXT_INTR_STAT,
diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index 2b7c53470ce8..386a0f1e7ee0 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -28,7 +28,6 @@
 #define ACP3X_FUTURE_REG_ACLK_0	0x1860
 
 static const struct sof_amd_acp_desc renoir_chip_info = {
-	.rev		= 3,
 	.host_bridge_id = HOST_BRIDGE_CZN,
 	.pgfsm_base	= ACP3X_PGFSM_BASE,
 	.ext_intr_stat	= ACP3X_EXT_INTR_STAT,
diff --git a/sound/soc/sof/amd/pci-vangogh.c b/sound/soc/sof/amd/pci-vangogh.c
index eba580840100..cb845f81795e 100644
--- a/sound/soc/sof/amd/pci-vangogh.c
+++ b/sound/soc/sof/amd/pci-vangogh.c
@@ -26,7 +26,6 @@
 #define ACP5X_FUTURE_REG_ACLK_0 0x1864
 
 static const struct sof_amd_acp_desc vangogh_chip_info = {
-	.rev		= 5,
 	.name		= "vangogh",
 	.host_bridge_id = HOST_BRIDGE_VGH,
 	.pgfsm_base	= ACP5X_PGFSM_BASE,
-- 
2.34.1


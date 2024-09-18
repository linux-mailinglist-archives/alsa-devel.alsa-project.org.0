Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B7397B7D0
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2024 08:19:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA5F8E0D;
	Wed, 18 Sep 2024 08:19:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA5F8E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726640353;
	bh=1Bd7wwGG/QVQcvhWSYSxbiBiNP3ENN/9T320Rmspy+8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dVw2w0HjtXrjHTJ+rn+zRqNO0eh2UvsO0QN7SLmYSURmIgj3OzYRMx+uDqJHH4H+J
	 +1rL5MO4Q8nChzPju13Z8zXzA1HBzy9KyGIcvHVbY+aLbiOUUTLMaoCInvIswagx5Z
	 oYclZ6M9Y9hHTKJAcGn8NrhgrSzuP3BA2RBk6lNk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BF4FF805B1; Wed, 18 Sep 2024 08:18:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91635F805B1;
	Wed, 18 Sep 2024 08:18:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEB50F8020D; Wed, 18 Sep 2024 08:18:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0805DF801C0
	for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2024 08:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0805DF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hE7tVXYW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spJcG+vpQ+WozanIJD7vi6PtiBKeUKAPWUSog7DNpf/z6fBxShxBQxEWwSn7S9JQT7FKhtZjrSi3rjJkPRR2a0LnaB0GHAvkd9ShBKwOND2po4LVZVU6Uz2OE6QuzAqbZ3NA2wtBVln430cxIZz3gQu61unzEbWEX7hUZ9Z0grOILTKhQSpJEx68E8x+5JzNMVNauMbFuoi6g1Rkj7ZqN6QYlYKxKKZWkVoAmNiCa2XdA8P7jIPp0riZFOqjb3H9kUx3VUYiZuQ0WR/BkFQx2/GtE9Tf52kiYmVk1A/JN5J44FheF+554b+hVL1KIvEFPohpZ3AXWITT+ydzCwXoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMPd7XQtbsy8edkYKpkZR+rJtSF7bSxWXMLhWhpYXaQ=;
 b=F3SCyW+6FOUMAKeDzUTTotonP2avPIaCAkPtbMenp/uuRl57fpevOvAGCQd3rinw45fedwhrAmuqaO4LDEpTPZo5TNtyA78BZvMt6DFUJBrng7KGvoOCwWrG3tCbmVxOTbgO6ErhqKy9XO8NoQoFDKVSzrA3Nup8IkYsPdH4jnXlXPskXQrztfiLgylYV2YOOHqEHlHlPe+RQlpgYenE9JgGDZw2hI6oyUXOs+jJrbqjmCfs0GrfG74RzVnp6Injrtzz3rmro/1RoMICDV1E+MQBqgUJUDXBKqBI8IP7j8wI2LAFiYjURZI0v+rnLGadJ10A8R6ZOvP84sDAeE6vrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMPd7XQtbsy8edkYKpkZR+rJtSF7bSxWXMLhWhpYXaQ=;
 b=hE7tVXYWr6PPniMLSy2wX514beLh5k4GsCZa3xcW1CiZA/1CLHT2vPjcVijoCKfCKJ5OHrdVD/gndeQbAxo33gz0ZL8KxxjsXYCui7SRCL6pCIYjIB8WdfjcnAgQiFxJ1YYFy8/iPZot72WQNHluDRgPtExZR8t3LH9gU5mHc28=
Received: from SA9PR11CA0028.namprd11.prod.outlook.com (2603:10b6:806:6e::33)
 by CY5PR12MB9054.namprd12.prod.outlook.com (2603:10b6:930:36::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 06:18:39 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:6e:cafe::7a) by SA9PR11CA0028.outlook.office365.com
 (2603:10b6:806:6e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 06:18:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 06:18:38 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 01:17:30 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/8] ASoC: amd: acp: simplify platform conditional checks code
Date: Wed, 18 Sep 2024 11:45:33 +0530
Message-ID: <20240918061540.685579-2-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|CY5PR12MB9054:EE_
X-MS-Office365-Filtering-Correlation-Id: 70ae87e8-2dd0-4404-47f0-08dcd7a9bc58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OMiZfx1laQd8/246YoFfAPB46aY9y1+vHBwqEsbXUfE15A/OiGYOj/Rz1uPX?=
 =?us-ascii?Q?FIIQl3KIBeC046eOppueDL2fWQVE6G1IlCmoYHvLQiJx7VJ9G17PjqsMrpyK?=
 =?us-ascii?Q?PGurn5OTE7In59yYs1LW3EhoGDdVGsAbGZDK6OzjBdMU8O+OU321LzsGvEc8?=
 =?us-ascii?Q?NMplvrF+pl1lp5dIdgCIFZ6YTYT0lVa0NBJ3LcGnFOSr+5K0McoV8+QbBOLa?=
 =?us-ascii?Q?xzE3jgIw7N5myW6YPzIg7VM5TrarE7UvoBHVUyJ1U/NiGZc5jt2PWG5nTVD6?=
 =?us-ascii?Q?Wb5yfnZX6d9J6xkuxN3yjQ8OQQGpngUQC+ai1dwxQjwd6WH0/1LE1DStXB3o?=
 =?us-ascii?Q?NF+8oLau5r74NGparjFwVFV8lDG44aZqOvZivevW2mD1NLamW5SpIPDX8EkY?=
 =?us-ascii?Q?9kl6h9/YJFHRlPc7tNe7uog9VINUvAXb9FOZjRJ6WjzdB5qbVYawhC6PsK7S?=
 =?us-ascii?Q?dus8hN6ag5/ruvp4/Z315ygv6WDtGnKphFCnKaUFrKqqtEScMChyHQmpyIAB?=
 =?us-ascii?Q?iXVofUFl3c7uskfa33Bsn/up6lq0AA51Zuk6pwrG7M6CgI70ozanpbMU3J0b?=
 =?us-ascii?Q?jmSnYsHkHkqNW3jnDDDnnIqN1/uA5M8O2PMgIeZzjVVgPOglzgdAV8b2H0/S?=
 =?us-ascii?Q?6QZsFMTSXxlcxShqDeL/PXgdIMHgN+frV2GX9j0PTFnUUHgXALGeg/yIRXWC?=
 =?us-ascii?Q?eYNVPkq8RMqzi4QBdscQx97envW972eTgUuIOEq13OVYnZcCh0ULpErggpP6?=
 =?us-ascii?Q?RXVhYjjlb5kHU6FhK3YzAa8WHnxE6HUU5Pxni8SRkZmdEhadEzuBgTLccnFC?=
 =?us-ascii?Q?3z31JMGvS+MNZDQiBJuknqSh0uV2CunJ+MKe1PDTHDM+dCcjbfZdZHPB0YmF?=
 =?us-ascii?Q?XJUYx5laTGG90PCZZCNuG28U65/SdFMRC9SA9eLSDLAIjdM3KVuvoQAkyh8t?=
 =?us-ascii?Q?TXOJobVo0k7GpfDw+sdv7zF1jSLk/UowcRb0KXN9tY6RJjiSH+i4U4ilqTjR?=
 =?us-ascii?Q?PNd8+vw25e2cbo11OSPh75KxTdRBfoEzSC8tPJkTkWGLFHHh5oZV07HyPP2N?=
 =?us-ascii?Q?in1HzX8V8nd6p92+qSMO1WIvzGq5CqgYQzCA9qx4Pn6BDw5FhkeKswOt1z2z?=
 =?us-ascii?Q?IQuPjD2HlOKGeaBRn3GcXiubnvntGR9j93ZPpEl033yFMqvJsoH7KFhg2oJz?=
 =?us-ascii?Q?kNsl0iL4rGSMMsddhtkVYaA9djKP6nc9L6XgQSoM6qNfwieq1EVJ0IdPE9g/?=
 =?us-ascii?Q?sBtKpT7vVbxZn8ICftGYWiV2kZbVRdWvupUUiEvXY/XnGjQiNsJJBcVCdDu2?=
 =?us-ascii?Q?RP5lqoBz1z6PXHqedQs1JZqh4UfgnyRUiHWY+XE1Dv1D3BH3QPu9lfeTgAXO?=
 =?us-ascii?Q?MqRBJ3/4dCvoulH/3VLgyr2eQEX31GhgGmZXTXbv5/3+0xkYBH7xJQ8Ay6x4?=
 =?us-ascii?Q?2/Y0aseFkUd14i3kmASWraKlll0PvowA?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 06:18:38.8177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 70ae87e8-2dd0-4404-47f0-08dcd7a9bc58
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9054
Message-ID-Hash: NYV4PHZDCU744SN4SSH2HNDHT5G26KZT
X-Message-ID-Hash: NYV4PHZDCU744SN4SSH2HNDHT5G26KZT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NYV4PHZDCU744SN4SSH2HNDHT5G26KZT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simplify code with switch statements for platform conditional checks.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-mach-common.c | 36 +++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index e9ff4815c12c..d4c7a7b79177 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -1647,16 +1647,21 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].id = HEADSET_BE_ID;
 		links[i].cpus = i2s_hs;
 		links[i].num_cpus = ARRAY_SIZE(i2s_hs);
-		if (drv_data->platform == REMBRANDT) {
+		switch (drv_data->platform) {
+		case REMBRANDT:
 			links[i].platforms = platform_rmb_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_rmb_component);
-		} else if (drv_data->platform == ACP63) {
+			break;
+		case ACP63:
 			links[i].platforms = platform_acp63_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_acp63_component);
-		} else {
+			break;
+		default:
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
+			break;
 		}
+
 		links[i].dpcm_playback = 1;
 		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
@@ -1714,16 +1719,21 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].id = AMP_BE_ID;
 		links[i].cpus = i2s_hs;
 		links[i].num_cpus = ARRAY_SIZE(i2s_hs);
-		if (drv_data->platform == REMBRANDT) {
+		switch (drv_data->platform) {
+		case REMBRANDT:
 			links[i].platforms = platform_rmb_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_rmb_component);
-		} else if (drv_data->platform == ACP63) {
+			break;
+		case ACP63:
 			links[i].platforms = platform_acp63_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_acp63_component);
-		} else {
+			break;
+		default:
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
+			break;
 		}
+
 		links[i].dpcm_playback = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
@@ -1760,18 +1770,24 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		}
 		links[i].cpus = pdm_dmic;
 		links[i].num_cpus = ARRAY_SIZE(pdm_dmic);
-		if (drv_data->platform == REMBRANDT) {
+		switch (drv_data->platform) {
+		case REMBRANDT:
 			links[i].platforms = platform_rmb_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_rmb_component);
-		} else if (drv_data->platform == ACP63) {
+			break;
+		case ACP63:
 			links[i].platforms = platform_acp63_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_acp63_component);
-		} else if ((drv_data->platform == ACP70) || (drv_data->platform == ACP71)) {
+			break;
+		case ACP70:
+		case ACP71:
 			links[i].platforms = platform_acp70_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_acp70_component);
-		} else {
+			break;
+		default:
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
+			break;
 		}
 		links[i].ops = &acp_card_dmic_ops;
 		links[i].dpcm_capture = 1;
-- 
2.34.1


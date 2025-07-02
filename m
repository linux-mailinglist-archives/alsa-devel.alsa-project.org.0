Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7204AF105F
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jul 2025 11:46:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A4E160213;
	Wed,  2 Jul 2025 11:45:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A4E160213
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751449566;
	bh=k8rUujp8cB9v9m4AjwQrqyUSbM+Qie/d0PY91a+hKAk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NhrwgskcVBt1yOQVm4XTsRl/DOURh+XKO6X5l4crMhyk+M2CCGHuWbG3lQI8jJkqa
	 ei8ZOMRcw1T+8LQcKNqL8ovrG6FIRjHjaLcb1J0ynnTfIqc5kO8ccxvlw2nSnGprZD
	 dO8a/zddAsfLB/lPlGfAf1we0qM3EB4RjB0a30Wg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 087B2F80636; Wed,  2 Jul 2025 11:45:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8E28F80636;
	Wed,  2 Jul 2025 11:45:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85D28F80610; Wed,  2 Jul 2025 11:44:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C887F800D0
	for <alsa-devel@alsa-project.org>; Wed,  2 Jul 2025 11:44:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C887F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=FK+RJaBS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aM5dp6KZP07sn6bzjD/IKFTvTFoVu3MxNIamQr5vaYXGgm9wKXG6LUpbLYvryQYoiEAq9MBbMFVsSsDIpi7FsQ/KNaqAulzM3KizPac2Li57c5uJ8gN8Ymz++bIGmJ1N47w1VjMQJKp2nMoxtqVGR6pUM77eZsdpyXcqxzkapNDryTOk3vl8/I3KfTxBR9dj+k2RdFH1mUVLsC9XsU27G88QLyRPqCdwyd2wl9YBbTLefgWzFYbhafav9lwhj1OkG419brzmCWSuxMHCcPLGzhZq/0Mlc9anqnoPZHDCawQPu9kOLKDDOtxGWT1coNdgJGXCrbnRbF2ftMBWc7WOhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrQsf5wH9yMMgg0Wa9EckcpAt6+rxU0wuykLiKmtZpc=;
 b=v3J4KzUQrne6U4aM7PO9h/QuQlIrnWDOub+2gShrY99BqIH/8Q+YpD4PIJwXCXxXt4nG/MUfq+J/b+cVXNfcu3Vbxxxl4Gtm9hw4MuW8wALjAx4joqs6xKyD3ZBqvT0BO+emtOlueDJPgjdBdbBuMn964FE49p6kDKzHaC9yJcS1GxOKOYh5s9nrPUgfiCstDxZbnfs62++xhkf0RVAu4hbURAP1ZaFcYoSRInnKivLhk2e4rdyaAtJXXG0fq2UuZiKAZhqe9djEiCCpF1/zJyGsMWfuoznhSuBQFxkx97AoFlphF3rJ+OmbtAfJbtE0tZj27r5qdjet+WQ3NCNUTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrQsf5wH9yMMgg0Wa9EckcpAt6+rxU0wuykLiKmtZpc=;
 b=FK+RJaBSF5ZBP23pFcKmj9Pf7EgSpNiFDnQOCOAJWycfU6v/HzeRjk1t3qgRPBjn2AY9EYLQRH5xrTuMlqkWM2/fFgk1oNseGlMTUR5anoOhmP3plj1V3XXNP0fq/ekTF9atgFow4ZLPhWSFmzt+Lii8Z0Ek4bZvl1/xtepJS2g=
Received: from BN9PR03CA0205.namprd03.prod.outlook.com (2603:10b6:408:f9::30)
 by LV8PR12MB9714.namprd12.prod.outlook.com (2603:10b6:408:2a0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Wed, 2 Jul
 2025 09:44:52 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:f9:cafe::a4) by BN9PR03CA0205.outlook.office365.com
 (2603:10b6:408:f9::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 09:44:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 09:44:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 04:44:52 -0500
Received: from r9-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 2 Jul 2025 04:44:48 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
	Mario Limonciello <mario.limonciello@amd.com>, Peter Zijlstra
	<peterz@infradead.org>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER
 MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] ASoC: amd: acp: Enable acp7.2 platform based DMIC support
 in machine driver
Date: Wed, 2 Jul 2025 15:14:12 +0530
Message-ID: <20250702094425.155185-4-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702094425.155185-1-venkataprasad.potturu@amd.com>
References: <20250702094425.155185-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|LV8PR12MB9714:EE_
X-MS-Office365-Filtering-Correlation-Id: bf06ed9e-2f39-4dc4-f550-08ddb94d184e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AMaenZdG2KcwhdbLErYKZ7oSfHVnZxzp7JM73umF+muUWV5871cw4Xi9oHvj?=
 =?us-ascii?Q?CJVhYHOiMnht33wIkijxaW7JuBeXgzxnqBXh+2CAqzPbIFZj790BLnQ1qMiy?=
 =?us-ascii?Q?69OmE5LD2ZHcMrCvxwteltJtgJCNRheyqqDcslKua3zXrAbiGNFisxWyurQM?=
 =?us-ascii?Q?nfeqWjZ75hgLLBduuRP9z1P+XBLnPZFJL3eT/mKPxgJarlOi6KFfdQ96VNBL?=
 =?us-ascii?Q?JKgM1dlqCY0I4r6Iv9eHGiB3wVNaptBdPCPBMcb0PeDBTRoPmSi3BGMnck+V?=
 =?us-ascii?Q?mZ9lVTexaE49Sbgo2n7ibwO3PgXpJJIVp5AqF7zcYtp3BFJyAhHNGFYd72Pv?=
 =?us-ascii?Q?jpmjaE4WqEBF0/YzTHqurxey7KWl3bZScNZTd4TClnfpVcSYT5lCBdv7edS4?=
 =?us-ascii?Q?8epVBNy3k8hoXw7/RVP4hxTz5kfNAh3yttCmo+SHPvdS0hqYy9nsywAaEt0P?=
 =?us-ascii?Q?f8HfN9zuN4SKsbpHy+Y/x85hUV0ZbiU8kCNpYMRFRPNiP+stFUgM8KcMbhKF?=
 =?us-ascii?Q?ATcfrQd8S6QbUeXxg13LrFSHNe6fH6+RdjbWnEQ3WPfWaCNhye6H3/W4IxbW?=
 =?us-ascii?Q?CLjNs/kvG5k580leymGFv0RvI82PqlYKMxPMo56Fypi7W6mvefxa4S88Xuwd?=
 =?us-ascii?Q?xa3SZ932fkiDGjuFTN13fw4bBRPwK2K6PnrKWbIUFWmQD4jsEKg5Yv/6GatO?=
 =?us-ascii?Q?Bz86ilxGaE9EzqHt1syZoAtS7f/VeFznUQrPmfxTkQlWSKm3JBVMoBhaKgKx?=
 =?us-ascii?Q?xU4egyrsnrOt8vqYimMeZnTbBxdVguDm2Hlfmh8OyftXo1fNIbsY/ETyTYa5?=
 =?us-ascii?Q?ci+fP8TZgTbVc9rJjHC+2jDPXE918I5hNHUCz8BiBoreCXYDtAhZPZAvXnAh?=
 =?us-ascii?Q?Swp1lBeChQ2MoU2YeXkR1vDX/Dtp478GBn4CZCazQu8YVUZ0GVtvkUI9QQ1l?=
 =?us-ascii?Q?v/gUlMpccvRnRilMaeDzvE8xOrFlrQaEw3IQo5lVlndNbf0sbw1Ts9/O26p1?=
 =?us-ascii?Q?qH0BL1++rZRh7iYWwjtiNeO//lyrSL0Xjx9TKMNbfJdi83EAaZvisQaj+Ah6?=
 =?us-ascii?Q?yem4hQzXtgVbTeZ38vG049naGdLiyENqoyiF3BY63oX47bdeso20Jm99apeZ?=
 =?us-ascii?Q?MQqftSDG6LeTlavMaykYhyLlRD4vzSa6OQsFH+56rjO7+v1rlnCJhC+Flzky?=
 =?us-ascii?Q?qd+yJ5R4a83ikBPIKqoNnT7dCljqf4LxmBiqEmO4RUhqe8P0zUDwg3ut7aM3?=
 =?us-ascii?Q?y2dbxcBE5B2niGntMzkHQwwQK1wYmDyKZ7klDHsdR+wcYcWG+5bjHQvAu4Sw?=
 =?us-ascii?Q?Qs22dH9XL8TX60W0N7/u6jC8tbi6SZO5ZHvWmz4O7oHAjBKOSm9C9WPhL9SJ?=
 =?us-ascii?Q?bSDSQSHu9pHYT0fiO5W/KtepfMlJMdl/o5Pj7+fgGS1cMNSPS23eHGrpci87?=
 =?us-ascii?Q?cDdaRJEQ8XXMO3uaX2j5VygvSqfzG1AWwV09NxlO8LgIM4B4hKlqF7bU8tB1?=
 =?us-ascii?Q?ueGXG6y7ShF8JmLEv9jv2xfyf2ubF3QUtJoa?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 09:44:52.7491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bf06ed9e-2f39-4dc4-f550-08ddb94d184e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9714
Message-ID-Hash: IYZAFE5MQKTA7DUYQYVTNUNRSPHCQX3H
X-Message-ID-Hash: IYZAFE5MQKTA7DUYQYVTNUNRSPHCQX3H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IYZAFE5MQKTA7DUYQYVTNUNRSPHCQX3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Enable acp7.2 platform based DMIC support in machine driver.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-mach-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index a0dab85088ec..c4bc8e849284 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -1772,6 +1772,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			break;
 		case ACP70_PCI_ID:
 		case ACP71_PCI_ID:
+		case ACP72_PCI_ID:
 			links[i].platforms = platform_acp70_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_acp70_component);
 			break;
-- 
2.43.0


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1171F969BF0
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 13:35:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EF6DAE8;
	Tue,  3 Sep 2024 13:35:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EF6DAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725363336;
	bh=fqrZzJyd8MAy+NtiqjQ9CU8CvY3d+BXPJ3l2U5ZUcas=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZSsxZUrQBOesfcvVNlfsAikPEw4S6Ehx1tnm1OvZUiEtMi6Cu0Avg77z7MEsfq++X
	 aOyH09cK1m8UY5DVMMlHdOvbYOG+8XfnYWnrjF2KNhpbAurVvo614gNgdvPfB5xHCZ
	 R2I/6Mntmnncrh0VIGg/9tW3LzjDp1M56pvx6c6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF95EF805BA; Tue,  3 Sep 2024 13:34:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15BC8F805E2;
	Tue,  3 Sep 2024 13:34:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFBC6F80199; Tue,  3 Sep 2024 13:34:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7677F80116
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 13:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7677F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=H94G5Exn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZkNDjj3fBqQudlsdHmm483NV0JiWGu21VTdOEkSjHFcQs68r68A216Jx7lxwMwGqBfYH4++7oRKaB+zzKqWK5Dx0GPYWQerQgg3RfUHn3zQDf705uXWe6cUv2W0mth7A8N3iU0YxT4wDUVJxTRJnm6IOYPSJQ6bCVFMSZNL3dtpb2/hiyhCpPG+sIihrBCei4SRUlFRaYBsPArYgNFqwRiA1XpsM8DcRscIcFRxv92Ihe+grdnsR45QWL1Fxp2pyfisKMhzvkdF3sFF8UXTjlrUgXzwP9EBIPuM9wGzt2oGERDAHjJ3hii6eYBreREg5ybsjJX48OUj4CurjB/Q6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=py8u4OX83i/3syVL8qYVVIMaXkGK1P/LrBgXyBaPsf4=;
 b=MtMLiZzU+5Al3MNk6DilfSjeZMcmicYov1APj/Boz//bcSLXXw0nbehk1rygoixY6TLwwkme5JcsWcARjm4hQspJ7wsRX5WFGg4qc18ac9rsdJNGxKFKtgFOMgXkaGTEdmTv8ZQz6on0P4XvWvTdCm22VKO0e27U6jFwXG6y+lXoMC3N98u5BLwmAYhilqc7toBPszDikOJQsL5gGoacBhYfVY9HHiTvBoO3YWqDE8WVBRn5rZPpuQboFIlO8EGYfWCPy14Z5i2c6QiolOFG9X5ysI8t0A2pq6GFtaSX+b7/zSOHPsULbw0qeEu+nHq7IgcEhDbmK1n/QPqXSgOQPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py8u4OX83i/3syVL8qYVVIMaXkGK1P/LrBgXyBaPsf4=;
 b=H94G5ExnfrSfCwwlUBvJ2kwpbvcb+SQJHjSrfFsx4euNkhLhP2YLG4gGX6ge50EjxviscTp0RE8NHHflsBhn/AQ6tM3wOPqcXE5EPS1NdGy/OpEyewu0KeZgc2ZMNHj+i8zMlw3z8xyKpYiM8+mTu0GJbKDDCHhTO+YWwUL2MaE=
Received: from BN7PR06CA0066.namprd06.prod.outlook.com (2603:10b6:408:34::43)
 by PH8PR12MB7278.namprd12.prod.outlook.com (2603:10b6:510:222::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 11:34:42 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:408:34:cafe::55) by BN7PR06CA0066.outlook.office365.com
 (2603:10b6:408:34::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 11:34:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 11:34:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 06:34:41 -0500
Received: from prasad-r9-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 06:34:32 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, "Syed Saba Kareem" <Syed.SabaKareem@amd.com>, Jeff Johnson
	<quic_jjohnson@quicinc.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 01/12] ASoC: amd: acp: Refactor TDM slots selction based on
 acp revision id
Date: Tue, 3 Sep 2024 17:04:16 +0530
Message-ID: <20240903113427.182997-2-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240903113427.182997-1-venkataprasad.potturu@amd.com>
References: <20240903113427.182997-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|PH8PR12MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f79c23c-6eb9-4376-ef57-08dccc0c6716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mTzmuBrS4PHyEYniTUtV9wq5BjBvJ1CqVRrxj9vtM7fZuQcO8FpTAKwJHXpH?=
 =?us-ascii?Q?MmuRHFUF+1BJbnqk4cuWdtDj/FRxJaGHi9HdpXHQfNbItqITGJWScOeMgYU1?=
 =?us-ascii?Q?0GEFI9o7r0ksJI4YIqhPd8/efF0OQAxeBw+YOxcTkNog/5PlZIqC7Op6CT0U?=
 =?us-ascii?Q?frP+JfdMGQtL8/DXQBFkPiHLD9+KvnvLM9j6/dDdfI/GHmfgmsy8Qt2PEciu?=
 =?us-ascii?Q?JuBcfv24+1ME5/CpaGqWK1rxMZMiuIuVtJwESI0MWF8a+l7nDf+oAymNHSAs?=
 =?us-ascii?Q?9gpwDhWy9I+x/nT4lknP2p5TRUNCZoo0BS5Um/VZiHCw2kpa9l//BgQBzIR+?=
 =?us-ascii?Q?bzTN8T7HbvVBe+RIlbV4P3kHkVpkpKkeDUjNyiImGt8+7okMaYqSvUyW6FJG?=
 =?us-ascii?Q?B8j4he8EVBz5Ad8gf86oFn24yqLUGR/wXMDWDZtLOCGW6B+LX5zqLwzokYtk?=
 =?us-ascii?Q?MjDUR2tMC9jFvyVr+L0Z+wghBq80cUDllWPADQj/UVOVRkSQoM2e4YHy+IMQ?=
 =?us-ascii?Q?1GxxljM0yX0s/rRBfKR2gnc//bb+A28noN8ROXVnl1ZGFpKi8k1SR+VkOZOY?=
 =?us-ascii?Q?Mdll14OkCGMqRIUc6T1ZLsMJdoXxCgU6ShuDppoTsL1wuP39bF/6/3FUqbAE?=
 =?us-ascii?Q?XG9nP0glFEnzwtmhVN0+QZA63taQkuQl8WQ2a2H6uVapRvpFFpXVHfxvVVGZ?=
 =?us-ascii?Q?QN7nKKPk7b93TE415yQhquhzYP4RuERLxS8lnYXMqmW341UGz0hXGOLlJ+XQ?=
 =?us-ascii?Q?NkA4Ltfxj/qw+tIOWuSi2KDhnccoOnS61qdy1TQAzhm7dl3k9ZG/EPFEjjgA?=
 =?us-ascii?Q?Ks4JlzdjO6T1Xddg09q2zP0Cuk4lfCzTJP0Wusz/xRoJ25JrMZW+GrouVZ6m?=
 =?us-ascii?Q?zWJxx74IbI1/02Zp8Dj89HielyMeJrlCs2Aui2DADwkV5B7FmFbxpnCovfXS?=
 =?us-ascii?Q?v5vsoknLuj4kjbcYvSrDXtBsqrAGN49f2f0P99lvoHIvahSRNoGh8O/0cXYB?=
 =?us-ascii?Q?9yBSPVhe++7/LmRbBAeZ/XlaET9VRdldISTKtQarGEKeILHNRiXtpKKrdSlB?=
 =?us-ascii?Q?FL4jy2tBwj+g9Bp6lYNlfdFwmSEg8MqfHOJQArPZyzdL1yWAI2LTR4KrxIU1?=
 =?us-ascii?Q?YLY8u0r6nMd/rCGFv+7Nnfgjrr5iEWbQAdiy7fC0MqCbtsZzghRa4aCy40Ik?=
 =?us-ascii?Q?80U6rlmE4U9TQXt4vVZGNrvTPKa4DZ7ysLhK67A0bH8IC5GRIrzNdNmPSSUk?=
 =?us-ascii?Q?eeVrp0q4sP6QPGXGB46h3iMKX5AXe9fs9BxZqCwyq0AW3Mzj6/ur1IpSp2dP?=
 =?us-ascii?Q?Xh4UxRD3T/pHeUCVs35xBMyIYo45TW3XrfDUcpg2o6tRDN0ohs5QvX2oSKVU?=
 =?us-ascii?Q?8Bafen8vfj5zWKIjwq2b7st5CN8EBoHLlEWmKomIG0HYYW9mNKRG0mF3h8GD?=
 =?us-ascii?Q?UWyRG6DplXqgzk32L88H+AV8N3mP1D1v?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 11:34:42.0216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1f79c23c-6eb9-4376-ef57-08dccc0c6716
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7278
Message-ID-Hash: BYJHJTHY7AG34XY57BWZF5IZ2FTNLPZA
X-Message-ID-Hash: BYJHJTHY7AG34XY57BWZF5IZ2FTNLPZA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BYJHJTHY7AG34XY57BWZF5IZ2FTNLPZA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor TDM slots selection based on acp revision id.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c | 40 +++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 97258b4cf89b..5d1d27078626 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -95,9 +95,11 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 {
 	struct device *dev = dai->component->dev;
 	struct acp_dev_data *adata = snd_soc_dai_get_drvdata(dai);
+	struct acp_chip_info *chip;
 	struct acp_stream *stream;
 	int slot_len, no_of_slots;
 
+	chip = dev_get_platdata(dev);
 	switch (slot_width) {
 	case SLOT_WIDTH_8:
 		slot_len = 8;
@@ -116,15 +118,23 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 		return -EINVAL;
 	}
 
-	switch (slots) {
-	case 1 ... 7:
-		no_of_slots = slots;
-		break;
-	case 8:
-		no_of_slots = 0;
+	switch (chip->acp_rev) {
+	case ACP3X_DEV:
+	case ACP6X_DEV:
+		switch (slots) {
+		case 1 ... 7:
+			no_of_slots = slots;
+			break;
+		case 8:
+			no_of_slots = 0;
+			break;
+		default:
+			dev_err(dev, "Unsupported slots %d\n", slots);
+			return -EINVAL;
+		}
 		break;
 	default:
-		dev_err(dev, "Unsupported slots %d\n", slots);
+		dev_err(dev, "Unknown chip revision %d\n", chip->acp_rev);
 		return -EINVAL;
 	}
 
@@ -132,12 +142,20 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 
 	spin_lock_irq(&adata->acp_lock);
 	list_for_each_entry(stream, &adata->stream_list, list) {
-		if (tx_mask && stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
-			adata->tdm_tx_fmt[stream->dai_id - 1] =
+		switch (chip->acp_rev) {
+		case ACP3X_DEV:
+		case ACP6X_DEV:
+			if (tx_mask && stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
+				adata->tdm_tx_fmt[stream->dai_id - 1] =
 					FRM_LEN | (slots << 15) | (slot_len << 18);
-		else if (rx_mask && stream->dir == SNDRV_PCM_STREAM_CAPTURE)
-			adata->tdm_rx_fmt[stream->dai_id - 1] =
+			else if (rx_mask && stream->dir == SNDRV_PCM_STREAM_CAPTURE)
+				adata->tdm_rx_fmt[stream->dai_id - 1] =
 					FRM_LEN | (slots << 15) | (slot_len << 18);
+			break;
+		default:
+			dev_err(dev, "Unknown chip revision %d\n", chip->acp_rev);
+			return -EINVAL;
+		}
 	}
 	spin_unlock_irq(&adata->acp_lock);
 	return 0;
-- 
2.39.2


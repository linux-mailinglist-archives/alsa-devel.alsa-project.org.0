Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D122969C14
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 13:38:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00196211D;
	Tue,  3 Sep 2024 13:38:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00196211D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725363531;
	bh=Zxo6uDrxY+TcIOP7JCSCmW2wl907TvExYyKssqGL4cI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tQU8VVYGq7cdRbm4vYvBGLLdG7+nanoxrw0aOs4rUlL8kvBJgDwFV9OSu6TW3BPpY
	 H8PckdI07J4V5gk5h/fimzTtDclt2MXLqE6JEopXbh9K+EK9kj6c78uLOWclQWYHP9
	 oBq8nzYVg+NEf6OhclT1PYl305z4PVgfWhwLiSSg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2826F806A8; Tue,  3 Sep 2024 13:37:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B17CF806A0;
	Tue,  3 Sep 2024 13:37:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50709F805EC; Tue,  3 Sep 2024 13:37:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 751D7F805C8
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 13:36:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 751D7F805C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=NQYcXGlc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1qq13f+lHlKgxfLVNJnNgsNHiqMcwaIgyPbG7odWupnXASuJLzHt05ArvBnGLkizpDPKgF4pFcB9u5OZbKuuyLjN9noNp+8I0LssXZQnM33r3CYvHTsjMDwllcxE/3FR3QFiiNdpVhba750L5UZ6CE2irmpyubUJuLKZgy8nDfvv6cusQuZpThbIK1E9YUiBaN4OF6KIAbLRJwcTP+1rPSDKonKMqXikV9QXEtQK1PgJEmJU4xgBNhyMzFKLn94KKrCOYosv4RwN3VR2JcUzmRgygVhhcVl1mh22z/kfHRDRvTiOxNb5Ad6CRKqU40Fo1W3yWP0fZtvcDMf3eoJVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlTY1ccp5e6+zTkz5tnVE4zpMvVe1UTQ2EdRjn40jU8=;
 b=kCn81ZDJtGLih1tkzrQAXheS0FeqR1WWAj181b/JK3RKKZIBVV+LsOKROKxWh92M4Qo3H2lyu5LAT1vhPqWidE62prkPqb0x+FJJ/ijN4S3rdn1r17QTjoct8kl+cPY4/M4ipGL0V8EyaTlHewnz3KvvtycLEQh0cRzMbEdyy1V7s6UMDNmPoQIYLc8KCCKBedjS2IuqgYUkp4SO1L5NrbQ8U1LrHIdnTRQzvct98rqvtFZiGs+JYGWlrC04IzwZ5jc2zLZHnycba9nppeP+W8Pm73lUXMB+E/gvWItls5o3G/hqrP6diZ41f+JhUPsb8FwOqQrxGZPQZal0uqvuzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WlTY1ccp5e6+zTkz5tnVE4zpMvVe1UTQ2EdRjn40jU8=;
 b=NQYcXGlcKMlcNzs9jyfnZtKrAOS2ialLz1F8nFPJ46bVOQv8soq8f9rJdzmwYn1COU3sCDEhnFB3O9s11fq9A81ZaGIY5WkYSwBpaUcgQqSQevPeUHueJeUUYZ3fwUTn74GDX5TZKXIJ8F9uJrD9lqpLJnw+oVDjri1J7K1mvaA=
Received: from DM6PR03CA0001.namprd03.prod.outlook.com (2603:10b6:5:40::14) by
 MW3PR12MB4492.namprd12.prod.outlook.com (2603:10b6:303:57::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.27; Tue, 3 Sep 2024 11:36:54 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:40:cafe::68) by DM6PR03CA0001.outlook.office365.com
 (2603:10b6:5:40::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25 via Frontend
 Transport; Tue, 3 Sep 2024 11:36:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 11:36:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 06:36:53 -0500
Received: from prasad-r9-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 3 Sep 2024 06:36:44 -0500
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
Subject: [PATCH 12/12] ASoC: amd: acp: Add I2S TDM support for acp7.1 platform
Date: Tue, 3 Sep 2024 17:04:27 +0530
Message-ID: <20240903113427.182997-13-venkataprasad.potturu@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|MW3PR12MB4492:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b6d2db-051d-42e2-6001-08dccc0cb5f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LxLa7slmEo/yzBOLdCy696n7zm49bIy7ynfEXDzw1pnvQrNTj7ndVKF04C4p?=
 =?us-ascii?Q?r6TFD7IdAi8b1qsV8WWR7Oje7s10/i8GKLdM/eRCTYzlIv7r5gnpOHLY+iLb?=
 =?us-ascii?Q?LS0QfW3/QiCtOIROhrBYfWUBghYMhDq57Ifyl1xXGO2huZAeLDZic8jMF84T?=
 =?us-ascii?Q?bF8wDXPSJ3Pv1aZ86TO+CmHUoLC8SE77ZSdiT1tWtel6ptUHuwedJBjB/nMe?=
 =?us-ascii?Q?u9SKokGMWzPNHNw7Hk152B6zMf5MtwQCCF2LAXY9KLCKOwiqHbGwAaVD5fk+?=
 =?us-ascii?Q?2SqeshuvicC9R4wD2GCxHev1phEHpiudzNXA2/g3WqS8Xs+C8iSVero0wj+4?=
 =?us-ascii?Q?BxCbqB2K7L9bI0bUY+apfNVifqK+K3p/egH47f8j04m2ak6OheCdFNIHhn89?=
 =?us-ascii?Q?mB3Vk4hlVDwGhEJfL6nkGXzKjiaRow5g1oF3Vwpmg2/QLPTjZbnGaOUYsU+Z?=
 =?us-ascii?Q?w/iDMisBap1bqdVoXN6nEYn2h3LwTU9U4nxap+8iTY/FOp2beYvE20ahhdAG?=
 =?us-ascii?Q?ZAC7/5zUKzhjuPVE1vMCuBO2hva1XbYP5vrF7V8yq8Rku1/xPHUKn8+P3+oe?=
 =?us-ascii?Q?iRr+QKuSg/MKzoK3VocGlLdzhtw0wCwKF8DTYolUstCSepbeS2jcRTRmSAmt?=
 =?us-ascii?Q?hCVsP3bSogZS3nWjI08sDKfOTFbA1dj76N93VkYu1ljrZnd/1QgsKwxeovS9?=
 =?us-ascii?Q?PyS0zmXwq9W6EQoCCYS30NVeL1+nOaWqFF1h2DvPaCcAzqf3+40QAe8a31o7?=
 =?us-ascii?Q?ROsiIlvA1hbd53l9rAZmNWDdh0bVaQHyEihuz8pMeHx3d0SezPKB9kKhl9dC?=
 =?us-ascii?Q?uO9YSDvVTJDZZA3u/ps+tcMy0tTvR5/3G8hQ3QONFrpkazBTHtLtwGVGIoi2?=
 =?us-ascii?Q?wBswMMczx4Lc3beTeCQbm2KHr79wzTVBZn6regOfEHdyqm7UVpFK8q+Fq6+h?=
 =?us-ascii?Q?1sEiQoSmR2cVYsslJgnJUXyfEBW5o/VmjhyCvmEmr59cCjMOks2WwlH6oMWY?=
 =?us-ascii?Q?rNE6A8iNdFR9mJcq9kY/MDKFv2kmwS8WJa3ggrTV4YrYogXejWxn9IAifA3v?=
 =?us-ascii?Q?E30aQtfBzKsKw3q9YkjJ/H7S3JFCCxPAOIZ58bTSdg780w7JfMlQm6/w7OBi?=
 =?us-ascii?Q?cG8BTfblwPGIf97rpebo/pOHKUh3K4+xlkX/JniJrpQP2rSjRwjkauDFF2Ti?=
 =?us-ascii?Q?o4OMwXT9NZuP5+Ge6awjMY6Te/3T71vnsCcPmEEChwVIAFVrUdETMU5HHTEX?=
 =?us-ascii?Q?J3TCRYOqza/21Bg/ffrc6+0I6Il/aBQ0/S12IkK+O+rPb60bvsndzTitVzZ1?=
 =?us-ascii?Q?DnMhXCs9HtIO/EoOGDZNkb/2KsxEJUHojI25JHv0VR9lJTKTOANSkCXrjyAp?=
 =?us-ascii?Q?KJj5fngBk4n6IjmKgGZxxjW4szngT/AhrQIjN/LkRFM2SZGi47vlySYpWAr8?=
 =?us-ascii?Q?UQt1DzIMmYY3cnYekEMe9Dogr651vkVL?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 11:36:54.2207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d8b6d2db-051d-42e2-6001-08dccc0cb5f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4492
Message-ID-Hash: O23KB5OVLCBEVQ33XC6XRBLYQ5R2WJFF
X-Message-ID-Hash: O23KB5OVLCBEVQ33XC6XRBLYQ5R2WJFF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O23KB5OVLCBEVQ33XC6XRBLYQ5R2WJFF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add acp71 revision id to support i2s/tdm mode.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c      | 3 +++
 sound/soc/amd/acp/acp-platform.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 74f2ad62e596..56ce9e4b6acc 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -61,6 +61,7 @@ static inline void acp_set_i2s_clk(struct acp_dev_data *adata, int dai_id)
 	switch (chip->acp_rev) {
 	case ACP63_DEV:
 	case ACP70_DEV:
+	case ACP71_DEV:
 		val |= FIELD_PREP(ACP63_LRCLK_DIV_FIELD, adata->lrclk_div);
 		val |= FIELD_PREP(ACP63_BCLK_DIV_FIELD, adata->bclk_div);
 		break;
@@ -136,6 +137,7 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 		break;
 	case ACP63_DEV:
 	case ACP70_DEV:
+	case ACP71_DEV:
 		switch (slots) {
 		case 1 ... 31:
 			no_of_slots = slots;
@@ -169,6 +171,7 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 			break;
 		case ACP63_DEV:
 		case ACP70_DEV:
+		case ACP71_DEV:
 			if (tx_mask && stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
 				adata->tdm_tx_fmt[stream->dai_id - 1] =
 						FRM_LEN | (slots << 13) | (slot_len << 18);
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 6ef9baeed74a..ae63b2e693ab 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -206,6 +206,7 @@ void config_acp_dma(struct acp_dev_data *adata, struct acp_stream *stream, int s
 
 	switch (adata->platform) {
 	case ACP70:
+	case ACP71:
 		switch (stream->dai_id) {
 		case I2S_SP_INSTANCE:
 			if (stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
@@ -271,6 +272,7 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	switch (chip->acp_rev) {
 	case ACP63_DEV:
 	case ACP70_DEV:
+	case ACP71_DEV:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			runtime->hw = acp6x_pcm_hardware_playback;
 		else
-- 
2.39.2


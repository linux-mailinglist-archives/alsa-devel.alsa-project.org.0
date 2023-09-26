Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D227AE5FD
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:33:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6EB614FC;
	Tue, 26 Sep 2023 08:32:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6EB614FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695710028;
	bh=wtqBgU+vCy3vMo7ukXmgpEzDRgpNBhMgUpUUvDhlSek=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d4TvDFrSTgDvS+6tPGUph0kTB13vTfvN3ge1fYmTxGgm1aNl6bOOwjZbOyI8XBibx
	 GuuM6cfJmJqmESqHvzm+uK86yoVioGYaxdEj61+CFD9nQ4w6EwoFxDQ/i9Mpj3puDs
	 YAgGYWSmH1Wadp+f11eCbAogm36xOICfzxSRGGhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7A03F806F9; Tue, 26 Sep 2023 08:26:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E5CBF805FB;
	Tue, 26 Sep 2023 08:26:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49952F805A0; Tue, 26 Sep 2023 08:26:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 95E6DF805A0
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:26:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95E6DF805A0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KP3YakCt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENZ2NuXHflzQ+D3+kbQAEQDFQpVqDaL1NXcVDDRGe6IE33CCmQjRG9gXk/fcZdHFT3goOKilmF/wbMjQ9GM46JNA89ExRMcnzTxF7kddujj7oYU0EyonJ4ufIh9VcnJlpjrJPUB4R2WRVgNk162vlUjmPz6fWk4CF9o83bPYhfwumXnk091JP2P1AmoV5nFOO1R7sHQm3I3zICk3I+dZv7dB1Uhz3quz2gQ95NLLGgd23CAhyKPZP9tx3jZBOD2wWKpQ9DiefNVr7XvnwxSKviG/xXZtnIBSMFWvZ/JfKM7zOUEYbrcqRARGC5pnKR9jMzir/uFwYqxldgBHEsGwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QBEz8mMZ/MRU+gwK2VekSWETETvgFmQLJhFR1GRbUs=;
 b=Bg2t/3xUh2/XZioKm/YWKJgYNc6W6y64bqV7prYHzQq5PnvFy06Tiwvgu1to68HRvrhHhjKK3eXM+SusLXREaEMHs5DwovQP70mV80zjD4W0sQ+m7rW/b/H1zK8ooPeCqQzuZg7CHCp+wdKRwHXMOvSQ9BBo70xQSnZVzcTUdHXIkR8dBSlFG6tVCp3IR9L7ianU4u0C/rW6ECeV6TlV2WobcNziN2PuxP58gGMTdBiXkbCHigUdfOSGQREMNEMldZorJ9UbaAAHrJIRVJvXFCfsDEs3GioB6QL3Vmm7GbpuI4pMupmFDYbxp9eWL4bS6G8ZuOHQg0GSC/42cPmrzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QBEz8mMZ/MRU+gwK2VekSWETETvgFmQLJhFR1GRbUs=;
 b=KP3YakCteBWENaxrcK/0rdvUp5AJDjjsbdbhPM/obXKwOd8JDMggpGwWACRC7CrIkLqHyBGyIEwLmfn4F+acOkq2acNAcIOd1aAIZ/q9oxXP43LhhJ0OLb3sW25BQFH9fwLQSdikKhLUAHyVY/YUC1tyVjwW1FwOFpB+gfGpxFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10043.jpnprd01.prod.outlook.com (2603:1096:604:1e6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:26:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:26:01 +0000
Message-ID: <87msx9fo20.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 44/54] ASoC: soc-dai: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:26:00 +0000
X-ClientProxiedBy: TYAPR01CA0013.jpnprd01.prod.outlook.com (2603:1096:404::25)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10043:EE_
X-MS-Office365-Filtering-Correlation-Id: 7feb8719-d1a7-4ed6-7b29-08dbbe5973f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ULfrvBOAPWG24kFhWLmkopD+ofSOgSnTqYwC/vC+tb9vvrlOSuTxAm+GIByu3bK/ryV/1Csi5OA4IQQq88dHfEa1Au9+6YUGeLlRE1FonvTtqZnrcPr6ofsE40zw9FyFShUeVDxdyqxBjIt1Tb+SdlIY2PjR2PmcSy1IG3khHp4vy9cQysgzr9jGHDDZIsvWSmN8yXwTFTPReruDKyaLqRS+/QcqFvTCEWumZJD9HJYeZI3b/H/PRjuDvcjGZ6ZT2jzKXiu1CrdRuKvwlEuZWDyfprJgxRdy1ffolz+LS7o3zlnrUsMIWzMscK+R6hRKhfBkI4EabFwCpxuIpknNemnrlg57T+HWfwgvEJiIvmdAp2xQq0+Hf5TxlbUoC84f5aYNMdm59mrtQVXshzafqYwiUsMnxqIrBC7+jo8mTrN+WB0ag9wFTfhTREVBZ2UbA/u4BfReZCsGKqfny/G4FRpMwTAicem+G2ylx8BH22rCQgYAYcMy6sb5mTRlxAZ6KafVCJqV8QuHGzf+47sHBJeKMNCCo/7GtHbuFPG64W+lngPN+wxhOT8gBnExR5F8qjQOpBTqRSDmPQ141xAXrRm51rbOvH0cy7+3OXl3vOPJWxOpp1k85Uy8djyTQXUsMQxfE5L3hc5exv24vUe2qQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(2906002)(110136005)(66556008)(66946007)(66476007)(316002)(4326008)(8936002)(8676002)(41300700001)(5660300002)(2616005)(26005)(83380400001)(36756003)(86362001)(38100700002)(38350700002)(6506007)(6486002)(6512007)(52116002)(478600001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3sHcPfTiNjt/Zj36m/5eaL95QnV8JpG4mnhViW4hZ46vD2+orvLC9myYsm4c?=
 =?us-ascii?Q?cjyCeO5mIiMJi8/oOISLQ8e2zS75XiW3rXle3VDcGT1bk/vkceyOrhvtdlM7?=
 =?us-ascii?Q?+OzzV33i8QzDWSwmQ4VNm+EgWNQoxdgdpjj6O8TVnLKF/kqtynq6fRA+xx1g?=
 =?us-ascii?Q?xdLuAxL/wAOh8y8G2wisZYre2lluZ5uckdCCjo/2fEyKA0abSTZRpaUzodKz?=
 =?us-ascii?Q?EZFUBmdFzrdRdfGJ+XCUoXi2AdAx+m4tw4NIZOZK6XpzrdFX4LOmeIbBM9aq?=
 =?us-ascii?Q?7idoRIUf6+W+lzP8BEo1mA7lM1Xv4JUzySoFXe/VJPVoosXksFhFYVevuKi7?=
 =?us-ascii?Q?zEE3dv1Y02jwJ4ML7/Z6+TKoqPhsJIw57cub3mSvwHfWii1wM3k4UgG2NPS8?=
 =?us-ascii?Q?M93hj4KctOSjqmkcvGx1cSIxuSHq9HF0qN8bT3C4aXQEFL+SE6n0slOKZg9e?=
 =?us-ascii?Q?UI9Ts7IlD93T92S0SzMf7ND5sK9EoPjUY18q8xpNBwGGOX50jN7eDow868tk?=
 =?us-ascii?Q?ux3uAfJ4eeiU0rkh2tDvDnBVLIvSvYmI8zVXPpsb4JBPjOLKuZLEMmnS4Hxl?=
 =?us-ascii?Q?X7+db3Wr8rdqjBQUNnJU365MHjCGdfDnJm7ULh40kbn0VXJuT/fDxmstb7YA?=
 =?us-ascii?Q?pPdKtWsb6XoSIRbdpQ0uypKIVrNer/GEUuoIANADMRftVcubUj/cv+PYHjAQ?=
 =?us-ascii?Q?f7/KIDr1UTq/2oIX7qg9yMCVFCyhpbNWyFayP47zm9hER+VeYqNeIEzJi2US?=
 =?us-ascii?Q?nr9mF+3n/Ub0iVjwFMx8V850Uk+PmWVQ8kSlrphfmBi6qFnZxLMLW8GHt9oT?=
 =?us-ascii?Q?SA0G1MOY/14tGlJVXKtrMuFwKcmbCocoNP05ivDMXTNwbuiiX0AigWXTuMqw?=
 =?us-ascii?Q?eTgy3fWP/u5LwzOMMlZK0bA3IiEH5HcL/g6g9FIludnPkFfPaP5Zv7JzeQr8?=
 =?us-ascii?Q?e1DKGtPv/9/gzcQ4aP+Im6+4Pu14Fu00yIPtGHEg922wDHyGvAuDQV2W45T1?=
 =?us-ascii?Q?XAG+X0Zp6d4h6XZQ0AvjzG5JtCg6O/Mr5f8HY/h2WjUUX/T6woEpYe9jR8yx?=
 =?us-ascii?Q?JFHLoj4MerNxvg54v+we3sUBeeuNiU9ZKMCAvXJGhRLoyTxOMDm4SnbA8DkT?=
 =?us-ascii?Q?rh5YPnlSSwZItjC+Sqc2QZ6WHjRGR/Gsfigz08NIyYKre221uvMS3E2Bw9Y0?=
 =?us-ascii?Q?0Zi+WwLwuNy8mHe9db+ol5DdY3deOK/kJtfrGq7GmXqr7NlKunB9VFXkAXSN?=
 =?us-ascii?Q?WwQYAyo6J2fXv8f6UAXUexlvMZGQsOcRqwUj3LnC6aXNIh8TmTFadvnzn3Yk?=
 =?us-ascii?Q?9kdSmQNdG33AVE686tS5p/mGg7+qlezFxRHYTTWOwS/VrpmiC6uDI6Y4UCiT?=
 =?us-ascii?Q?w/7dMHlLTU+MCpxLsQHTi2/CSc927vLzbSk+maH/5UHn5cL6Jm4yq+sdZIoM?=
 =?us-ascii?Q?YQ0QTUHO5iYKUbKxXzb7kxmWY0W150yEy1cQ/rt3NhPfyZBfk5zOTmBQ66hw?=
 =?us-ascii?Q?TH6AsMPYqRugmQlkibAcjb+aURs1+qQmpuDWP2BNoKL83R/tADaHazYpq23N?=
 =?us-ascii?Q?mKB218UaGr33YxpNlPLgXb/zj6FeevTdhvDAw5E59TeGV9S0FHfEeeRMIsQF?=
 =?us-ascii?Q?K/kebK+0hihgiUSU2Kh9Mcs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7feb8719-d1a7-4ed6-7b29-08dbbe5973f0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:26:01.0562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MwLjycVIN7GbbPIWSGmyaWFVtVQW5llM+2OMMN8xovmySSdKj6zpC3yL2aKwuF7aqAg8xBnTsRDD0YgpyOqLDeDo1JpVLaN8WbWVte534IkVTEJLya12Pr3+pbxsMLUw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10043
Message-ID-Hash: DQVKJAQPSR2PL5KAI4PA2SHDPKTX6IPS
X-Message-ID-Hash: DQVKJAQPSR2PL5KAI4PA2SHDPKTX6IPS
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQVKJAQPSR2PL5KAI4PA2SHDPKTX6IPS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dai.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 3f33f0630ad8..3fe1271204fc 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -610,7 +610,7 @@ int snd_soc_pcm_dai_new(struct snd_soc_pcm_runtime *rtd)
 
 int snd_soc_pcm_dai_prepare(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *dai;
 	int i, ret;
 
@@ -646,7 +646,7 @@ static int soc_dai_trigger(struct snd_soc_dai *dai,
 int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream,
 			    int cmd, int rollback)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *dai;
 	int i, r, ret = 0;
 
@@ -681,7 +681,7 @@ int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream,
 int snd_soc_pcm_dai_bespoke_trigger(struct snd_pcm_substream *substream,
 				    int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *dai;
 	int i, ret;
 
@@ -702,7 +702,7 @@ void snd_soc_pcm_dai_delay(struct snd_pcm_substream *substream,
 			   snd_pcm_sframes_t *cpu_delay,
 			   snd_pcm_sframes_t *codec_delay)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *dai;
 	int i;
 
-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 397337C624A
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 03:33:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AF72E85;
	Thu, 12 Oct 2023 03:32:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AF72E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697074427;
	bh=ifNCtF3ql/QikeiDvr91Flp2w6TiNIsMJd3bcafZFSE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sYfFKpWlIREFV/nVIYQY+BsaY8E1vL1D4GHwAIJ5yGJYn386R6+z7/7bLIDNknMw6
	 fxKaSk0udjSnuudEGl58fHcn7ulAyDfSKeS2nmrGHQc/7j+pgDz3nJr4qkPjspc7Uw
	 Dp09GSz/dhTOtkqH+otvdgj8QSSfTvZFdU2FdHjk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 556B8F8055B; Thu, 12 Oct 2023 03:32:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7C5FF8055B;
	Thu, 12 Oct 2023 03:32:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD8AEF80563; Thu, 12 Oct 2023 03:32:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB2F5F802BE
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 03:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB2F5F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MuwJSaii
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7YRrYY/tHHm1Eh62KXxzvjTLR+Pp7MEwii1kLoiRJo3oVgHYROnDtcQa6IdT9Jd5BW7uDNndE3LoFpvGkbMv3u9Y+NhegsS6Z5zMzAtvUbVra0gZA5Idzn6e+v30rIs3Xzli5EMvlb+aF60NC2I9cYihBy4UzfRy0czaoBhgZMJLWFCn1poswr27AUqGwVxRB/8U63n0zJ41C1AKh4U7XKfAlmu3FtDV5piKY1bFuGVpDdD52irm/dPCaOfoMV2+A4M6HZWT9s+YJhpUy1AYistnkZYMGzPz1uJ0fnpSnxA2L0MeJGajTreDrU0XfbuCs6EnJuw7gbNfxvelJWqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4AYtG+keeIPKxYqNKHZTQiSO/VnWhfY9wa6gnssUMs=;
 b=CT1sCtSIaTukpyOpxWK2tzpwL9yiO9x1lQzp5ZngW5tQUPNeYmY/88lNWBUQdNIXrnar6BEztacy/Kc0CNFZKXtHlgBjyNv1nmIl+kNHLuUq07N14ATa3gAzaQ7ONd8Tu7U9D/j++zuS7reSumrTXMuCrA2mrjspmyomV7zrNyd9zHKVJsClsPtTtujFyWyzUaWd2vtyR4q9z6GkFjHvene3rtSdwdGfQykQpHSJng/YXyetpj1OY5/0nehKqzHkl2uYgFwl/sOipDafCvdi6tcecoSzUyaxwRAWVRgBxpFHpAVQnrpGxCCWrda+KbcEKssV2IuCZDBsAkuQjczkfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4AYtG+keeIPKxYqNKHZTQiSO/VnWhfY9wa6gnssUMs=;
 b=MuwJSaiiLTKGFAxOVVpEgxmcn2brI5z7XsozdDomnsBhZV5y4HTV5KHiVcb8TaKsCTP+WXX8Ud/JEGaBjySWbTA/pSVKIBDCoA761FVJKwDP6D5C5LBuAri94zNaXCjF3ZPPsacp7vKZ4SV8xry7ZxIYa6J0Qt4UCmhmLCy0KXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8411.jpnprd01.prod.outlook.com (2603:1096:400:176::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 01:31:58 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 01:31:58 +0000
Message-ID: <875y3cy6b6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 1/4] ASoC: makes CPU/Codec channel connection map more
 generic
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
In-Reply-To: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
References: <877cnsy6bl.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Oct 2023 01:31:58 +0000
X-ClientProxiedBy: TYCPR01CA0149.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e2896e9-3f36-4362-8ac4-08dbcac306bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ukfljAno+u8F1d4nY1gBudPliy2Nfnts8sGrUNr9w21u5WmGrSdt+sfJVGh6OvXJm9njRAPQZlI0qp63Kpw4wQkqghiLsu/nDiTQKqEKaKaB3lzxe1MqswlVO3avMy0rtzOfidyBpbeJalUEYpAiNOiEizGwqxBN9tAmR8OpJib7ddVB9R/AoH06do8N+j6ggj35IgMeBBizJYhsK0PMQR7H/8hTizZv/wpbSrjfB/+jZ3X11AXPsMYTn/9zkzztD2Pqj6XmVDxK63aKjLTA1pIauZ9PLG9XazKT7GkabeltL5CLepmjWtN4kVYGc2tRhf+e+7r7dlyaDibAy80+PDyBOByt7UW6JNRkj1MWDlWHmRLUT6EBRCLoLAfguJpC4sHabvTE39JBp5EwYE7PL0hlOkyxDYFC+myK/5lZYqJwrplLjb5rcbwlYRbRNRk/azoM7jKnm1gfQtuyNnLcnlPL+dpaUqDfm1kIUGoU4teMidcyhGthP1ZmzQraevjZckbRs1oX2QHdxSMVsqg18vv3bb8ZmNEZq9/b2/2Uor7FDA/Q2Yrv5yBhRCMJun6KVvS4+i0Z4v8L9BZGpTFSHREAKIsLYpw/RXUdUatvWQlia0u3l8B7aCVH6aJRrKel
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(136003)(366004)(376002)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(52116002)(966005)(8676002)(4326008)(6486002)(6506007)(6512007)(38100700002)(26005)(8936002)(110136005)(478600001)(66476007)(66946007)(66556008)(316002)(41300700001)(2616005)(83380400001)(5660300002)(2906002)(38350700002)(30864003)(86362001)(36756003)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AgOHPCpE+J4+Qp5CQMFj6jXkiDsmiQwy7ZeIdgkD6WjLJeH4pGjITQv/WvYj?=
 =?us-ascii?Q?C+c5goFnn1pPP3OcDnGD4E1+AHUxAhvXscaQij4E8u10t71GzEMoSESkQ2Rf?=
 =?us-ascii?Q?/OCGs0UZe+hWcrQZNMs0i3FO5yo8K4OU724iV5zd+/ieI9kSh+OjKD0Vvkf2?=
 =?us-ascii?Q?BTUQdJWScn5Cm1wJXlBRRIclD7OV0kuDYLOeiFL7+j93uxoYijmAj5jbDZrN?=
 =?us-ascii?Q?1I64ORLnYA3W+Xneol/qSiyGXs//dAdhPbtdgU5WcWJgvA89lO+gErd6IQP/?=
 =?us-ascii?Q?17zPXyH8jUhOFtl4eA2QL0BWah52bX25fSoQ5/ZqPlvT/irNDyPOuLJ2WsG1?=
 =?us-ascii?Q?7tVK/cGt4JCqReMZZjKlal1Qr5VOP2ExRRtQNhGSMRx29OSxNLP/kbAAifwM?=
 =?us-ascii?Q?arM2Co6DHxx7WkjsQXd0oudn9JXP9lINmHhjTYIf0A1xd/mCQMd9+CtXDAP+?=
 =?us-ascii?Q?ABdJjtNt5hQ+dzuPTgM1TTtW3V62YPmNTS7GLaOkrNNd0Lwbv+vSKF1iHcYD?=
 =?us-ascii?Q?gTXJlxLSPzp0mbm5QjBkyaWKb9GuXIoitwvfSC9rAXetlOUdef3NsVye0FBB?=
 =?us-ascii?Q?u2gEhik7AQjjXBPS6wdRWrR1Kb4UdTDE++ExyivLI3/8wR0elB9lbeDY5nPS?=
 =?us-ascii?Q?1liqp/wIBcf+FBtfbAvvpT8wdH8AWyH1J/GOmd10uQIKtnBCnIw7sl+gFdjO?=
 =?us-ascii?Q?53xK8gGNtzqGwfTjffj7tVN5kLUS9jHYXl8CADZJQNMWe/MtQxKsZcbJuV0k?=
 =?us-ascii?Q?Lqlq/Jm5VT3XTMPS8mIsmX8FcIAdejNMfR3Se3gvNFbFz04gzFDUnCSZOL6B?=
 =?us-ascii?Q?Gbhsz1pkMNxKXiGZWcb0TZylHKL8O07KkVLq2N9zUkaqGx2F3Vqk1rSuG0ZV?=
 =?us-ascii?Q?S9rrq8kVcR5LzQeEalpERoC6uJUZgedJYJt7Vd5q1LAh79k4/L8FAFkkdV48?=
 =?us-ascii?Q?SiEvkOz+uKL7oNRn/QOdOkXfGQCFw2BjKNLXRK53mUFz2fn8gKK4qyQKrasU?=
 =?us-ascii?Q?wm58PtMg86BZeqQB0FGseAc5RmDTw9M7Asra4728B9vvxDH0tVNAEPY5qsCy?=
 =?us-ascii?Q?5JmJ4qS2S0AwMKbjId2zbXTztiEfzd8RXSrOeb0u0DjMDoDFuoQjM8aqEz2+?=
 =?us-ascii?Q?mT0TwT+aB9dSLWnfL69+pcn/Td4muX5Z8zgHGayzyWQUKE1mp8REaYDbYyT7?=
 =?us-ascii?Q?IMQ3K/fqjXr8ouqYO5BfPhqAtzizgI9oUTX3wNCkwCniTFhSyHaPSAajWUIo?=
 =?us-ascii?Q?O/MoCZ2J/n58igPMOF5WGERce+jy+VWg2FRjeF/6WXtREFy25GDarfHXsYAS?=
 =?us-ascii?Q?iycnozKnNG1GqqFVOBOXZFqH7oujNlywbw/W2rrEI2CRoA5mq4OHCLMLcHKL?=
 =?us-ascii?Q?7mM+Hp5jdeAq6asB0+Os+lo3l3Q9syz7oN3HW+wJm8Qe+Sjyh/5dszwJuwAr?=
 =?us-ascii?Q?o3EvtXAUHdR8nuZQJbgEVNbWspdpHp2uzcYn8eEd2NrtnGhzxFOEAxJHVznu?=
 =?us-ascii?Q?4JU/4jDKroU0eugpW7QaWrbfjvyVUcooogoW81amiyAZax+0zDMIU2pRETbX?=
 =?us-ascii?Q?XUVYMMCzwxpr817wK/vZqRVUa5syyqiaKs8XAPbdEn+dfX/W5DSsFKEUiBsB?=
 =?us-ascii?Q?URfCXcQ7g0kRaYJAFIIRpWQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2e2896e9-3f36-4362-8ac4-08dbcac306bb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 01:31:58.6001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WTszidPiuWKN8oIvNJRMZrlFhqCIDMcRhMsUb6JHtcHNE0zo3ALNaJtLpPuKoyI7er2wHf0Yg7K50nRu9AUZ3SZkeJ3xRGOKTmZtCB4jgZIW/lR1DrdOM2cANaRJ5QAR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8411
Message-ID-Hash: GEXPLZE5MW3SKMSBPMBGHIAZWTR6B7NZ
X-Message-ID-Hash: GEXPLZE5MW3SKMSBPMBGHIAZWTR6B7NZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GEXPLZE5MW3SKMSBPMBGHIAZWTR6B7NZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC CPU:Codec = N:M connection is using connection mapping idea,
but it is used for CPU < Codec case only. We want to use it for any case.

By this patch, not only N:M connection, but all existing connection
(1:1, 1:N, N:N) will use same connection mapping.
Because it will use default mapping, no conversion patch is needed
to exising CPU/Codec drivers.

More over, CPU:Codec = M:N (M > N) also supported in the same time.

Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h              | 66 +++++++++++++++++++++++--
 sound/soc/intel/boards/sof_sdw.c | 14 +++---
 sound/soc/soc-core.c             | 85 ++++++++++++++++++++++++++++++++
 sound/soc/soc-dapm.c             | 47 +++++++-----------
 sound/soc/soc-pcm.c              | 73 ++++++++++++++-------------
 5 files changed, 211 insertions(+), 74 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 63b57f58cc56..ff04ed312009 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -655,8 +655,68 @@ struct snd_soc_dai_link_component {
 	struct of_phandle_args *dai_args;
 };
 
-struct snd_soc_dai_link_codec_ch_map {
-	unsigned int connected_cpu_id;
+/*
+ * [dai_link->ch_maps Image sample]
+ *
+ * if (num_cpus >= num_codecs)
+ *	.ch_maps is [CPU] base
+ * else
+ *	.ch_maps is [Codec] base
+ *
+ *-------------------------
+ * CPU0 <---> CodecX
+ *
+ *	Because [num_cpus >= num_codecs]
+ *	.ch_maps is [CPU] base
+ *
+ *	.num_cpus   = 1;
+ *	.num_codecs = 1;
+ *	.ch_maps[] = {{.connected_node = X; }}; CPU0 <-> CodecX
+ *
+ *-------------------------
+ * CPU0 <---> CodecX
+ * CPU1 <---> CodecY
+ * CPU2 <---> CodecZ
+ *
+ *	Because [num_cpus >= num_codecs]
+ *	.ch_maps is [CPU] base
+ *
+ *	.num_cpus   = 3;
+ *	.num_codecs = 3;
+ *	.ch_maps[] = {{.connected_node = X; },	CPU0 <-> CodecX
+ *		      {.connected_node = Y; },	CPU1 <-> CodecY
+ *		      {.connected_node = Z; }};	CPU2 <-> CodecZ
+ *
+ *-------------------------
+ * CPU0 <---> CodecX
+ * CPU1 <-+-> CodecY
+ * CPU2 <-/
+ *
+ *	Because [num_cpus >= num_codecs]
+ *	.ch_maps is [CPU] base
+ *
+ *	.num_cpus   = 3;
+ *	.num_codecs = 2;
+ *	.ch_maps[] = {{.connected_node = X; },	CPU0 <-> CodecX
+ *		      {.connected_node = Y; },	CPU1 <-> CodecY
+ *		      {.connected_node = Y; }};	CPU2 <-> CodecY
+ *
+ *-------------------------
+ * CPU_X <---> Codec0
+ * CPU_Y <-+-> Codec1
+ *	   \-> Codec2
+ *
+ *	Because [num_cpus < num_codecs]
+ *	.ch_maps is [Codec] base
+ *
+ *	.num_cpus   = 2;
+ *	.num_codecs = 3;
+ *	.ch_maps[] = {{.connected_node = X; },	Codec0 <-> CPU_X
+ *		      {.connected_node = Y; },	Codec1 <-> CPU_Y
+ *		      {.connected_node = Y; }};	Codec2 <-> CPU_Y
+ */
+struct snd_soc_dai_link_ch_map {
+	unsigned int connected_node;
 	unsigned int ch_mask;
 };
 
@@ -688,7 +748,7 @@ struct snd_soc_dai_link {
 	struct snd_soc_dai_link_component *codecs;
 	unsigned int num_codecs;
 
-	struct snd_soc_dai_link_codec_ch_map *codec_ch_maps;
+	struct snd_soc_dai_link_ch_map *ch_maps;
 	/*
 	 * You MAY specify the link's platform/PCM/DMA driver, either by
 	 * device name, or by DT/OF node, but not both. Some forms of link
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 226a74a4c340..7927b729866d 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -579,7 +579,7 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
 	int i;
 	int j;
 
-	if (!rtd->dai_link->codec_ch_maps)
+	if (!rtd->dai_link->ch_maps)
 		return 0;
 
 	/* Identical data will be sent to all codecs in playback */
@@ -607,9 +607,9 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
 	 */
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		for_each_rtd_codec_dais(rtd, j, codec_dai) {
-			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id != i)
+			if (rtd->dai_link->ch_maps[j].connected_node != i)
 				continue;
-			rtd->dai_link->codec_ch_maps[j].ch_mask = ch_mask << (j * step);
+			rtd->dai_link->ch_maps[j].ch_mask = ch_mask << (j * step);
 		}
 	}
 	return 0;
@@ -1350,7 +1350,7 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 	return 0;
 }
 
-static void set_dailink_map(struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps,
+static void set_dailink_map(struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps,
 			    int codec_num, int cpu_num)
 {
 	int step;
@@ -1358,7 +1358,7 @@ static void set_dailink_map(struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_m
 
 	step = codec_num / cpu_num;
 	for (i = 0; i < codec_num; i++)
-		sdw_codec_ch_maps[i].connected_cpu_id = i / step;
+		sdw_codec_ch_maps[i].connected_node = i / step;
 }
 
 static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
@@ -1453,7 +1453,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		*ignore_pch_dmic = true;
 
 	for_each_pcm_streams(stream) {
-		struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps;
+		struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps;
 		char *name, *cpu_name;
 		int playback, capture;
 		static const char * const sdw_stream_name[] = {
@@ -1530,7 +1530,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		dai_links[*link_index].nonatomic = true;
 
 		set_dailink_map(sdw_codec_ch_maps, codec_num, cpu_dai_num);
-		dai_links[*link_index].codec_ch_maps = sdw_codec_ch_maps;
+		dai_links[*link_index].ch_maps = sdw_codec_ch_maps;
 		ret = set_codec_init_func(card, adr_link, dai_links + (*link_index)++,
 					  playback, group_id, adr_index, dai_index);
 		if (ret < 0) {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c305e94762c3..07fdcb997ab4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1824,6 +1824,86 @@ int snd_soc_set_dmi_name(struct snd_soc_card *card, const char *flavour)
 EXPORT_SYMBOL_GPL(snd_soc_set_dmi_name);
 #endif /* CONFIG_DMI */
 
+#define MAX_DEFAULT_CONNECTION_MAP_SIZE 7
+static struct snd_soc_dai_link_ch_map default_connection_map1[MAX_DEFAULT_CONNECTION_MAP_SIZE] = {
+	{ .connected_node = 0 },
+	{ .connected_node = 1 },
+	{ .connected_node = 2 },
+	{ .connected_node = 3 },
+	{ .connected_node = 4 },
+	{ .connected_node = 5 },
+	{ .connected_node = 6 },
+};
+static struct snd_soc_dai_link_ch_map default_connection_map2[MAX_DEFAULT_CONNECTION_MAP_SIZE] = {
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+	{ .connected_node = 0 },
+};
+
+static int snd_soc_compensate_connection_map(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *dai_link;
+	int i, j, n, max;
+
+	/*
+	 * dai_link->ch_maps indicates how CPU/Codec are connected.
+	 * It will be a map seen from a larger number of DAI.
+	 * see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 */
+	for_each_card_prelinks(card, i, dai_link) {
+
+		/* it should have ch_maps if connection was N:M */
+		if (dai_link->num_cpus > 1 && dai_link->num_codecs > 1 &&
+		    dai_link->num_cpus != dai_link->num_codecs && !dai_link->ch_maps) {
+			dev_err(card->dev, "need to have ch_maps when N:M connction (%s)",
+				dai_link->name);
+			return -EINVAL;
+		}
+
+		/* do nothing if it has own maps */
+		if (dai_link->ch_maps)
+			goto sanity_check;
+
+		/* check default map size */
+		if (dai_link->num_cpus   > MAX_DEFAULT_CONNECTION_MAP_SIZE ||
+		    dai_link->num_codecs > MAX_DEFAULT_CONNECTION_MAP_SIZE) {
+			dev_err(card->dev, "soc-core.c needs update default_connection_maps");
+			return -EINVAL;
+		}
+
+		/* Compensate missing map for ... */
+		if (dai_link->num_cpus == dai_link->num_codecs)
+			dai_link->ch_maps = default_connection_map1; /* for 1:1 or N:N */
+		else
+			dai_link->ch_maps = default_connection_map2; /* for 1:N or N:1 */
+
+sanity_check:
+		if (dai_link->num_cpus >= dai_link->num_codecs) {
+			n   = dai_link->num_cpus;
+			max = dai_link->num_codecs;
+		} else {
+			n   = dai_link->num_codecs;
+			max = dai_link->num_cpus;
+		}
+
+		for (j = 0; j < n; j++)
+			if (dai_link->ch_maps[j].connected_node >= max) {
+				dev_err(card->dev,
+					"dai_link->ch_maps[%d].connected_node (= %d) is "
+					"larger than max (= %d)",
+					j, dai_link->ch_maps[j].connected_node, max);
+				return -EINVAL;
+			}
+	}
+
+	return 0;
+}
+
 static void soc_check_tplg_fes(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
@@ -2030,6 +2110,11 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 
 	snd_soc_dapm_init(&card->dapm, card, NULL);
 
+	/* for keeping compatibility */
+	ret = snd_soc_compensate_connection_map(card);
+	if (ret < 0)
+		goto probe_end;
+
 	/* check whether any platform is ignore machine FE and using topology */
 	soc_check_tplg_fes(card);
 
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 2512aadf95f7..3c7c2b16bd64 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4426,6 +4426,7 @@ static void soc_dapm_dai_stream_event(struct snd_soc_dai *dai, int stream,
 void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
 	int i;
 
@@ -4438,39 +4439,25 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 		if (rtd->dai_link->dynamic)
 			continue;
 
-		if (rtd->dai_link->num_cpus == 1) {
-			for_each_rtd_codec_dais(rtd, i, codec_dai)
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, 0));
-		} else if (rtd->dai_link->num_codecs == rtd->dai_link->num_cpus) {
-			for_each_rtd_codec_dais(rtd, i, codec_dai)
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, i));
-		} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
-			int cpu_id;
-
-			if (!rtd->dai_link->codec_ch_maps) {
-				dev_err(card->dev, "%s: no codec channel mapping table provided\n",
-					__func__);
-				continue;
-			}
+		/*
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 */
+		/* .ch_map is from CPU */
+		if (rtd->dai_link->num_cpus >= rtd->dai_link->num_codecs) {
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+				codec_dai = snd_soc_rtd_to_codec(rtd, rtd->dai_link->ch_maps[i].connected_node);
 
+				dapm_connect_dai_pair(card, rtd, codec_dai, cpu_dai);
+			}
+		}
+		/* .ch_map is from Codec */
+		else {
 			for_each_rtd_codec_dais(rtd, i, codec_dai) {
-				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
-				if (cpu_id >= rtd->dai_link->num_cpus) {
-					dev_err(card->dev,
-						"%s: dai_link %s cpu_id %d too large, num_cpus is %d\n",
-						__func__, rtd->dai_link->name, cpu_id,
-						rtd->dai_link->num_cpus);
-					continue;
-				}
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, cpu_id));
+				cpu_dai = snd_soc_rtd_to_cpu(rtd, rtd->dai_link->ch_maps[i].connected_node);
+
+				dapm_connect_dai_pair(card, rtd, codec_dai, cpu_dai);
 			}
-		} else {
-			dev_err(card->dev,
-				"%s: codec number %d < cpu number %d is not supported\n",
-				__func__, rtd->dai_link->num_codecs, rtd->dai_link->num_cpus);
 		}
 	}
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8c168dc553f6..0bfff2ea111d 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1043,7 +1043,6 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		unsigned int ch_mask = 0;
-		int j;
 
 		/*
 		 * Skip CPUs which don't support the current stream
@@ -1055,22 +1054,28 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 		/* copy params for each cpu */
 		tmp_params = *params;
 
-		if (!rtd->dai_link->codec_ch_maps)
-			goto hw_params;
 		/*
 		 * construct cpu channel mask by combining ch_mask of each
 		 * codec which maps to the cpu.
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
 		 */
-		for_each_rtd_codec_dais(rtd, j, codec_dai) {
-			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id == i)
-				ch_mask |= rtd->dai_link->codec_ch_maps[j].ch_mask;
+		if (rtd->dai_link->num_cpus >= rtd->dai_link->num_codecs) {
+			/* .ch_map is from CPU */
+			ch_mask = rtd->dai_link->ch_maps[i].ch_mask;
+		} else {
+			int j;
+
+			/* .ch_map is from Codec */
+			for_each_rtd_codec_dais(rtd, j, codec_dai)
+				if (rtd->dai_link->ch_maps[j].connected_node == i)
+					ch_mask |= rtd->dai_link->ch_maps[j].ch_mask;
 		}
 
 		/* fixup cpu channel number */
 		if (ch_mask)
 			soc_pcm_codec_params_fixup(&tmp_params, ch_mask);
 
-hw_params:
 		ret = snd_soc_dai_hw_params(cpu_dai, substream, &tmp_params);
 		if (ret < 0)
 			goto out;
@@ -2824,36 +2829,36 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
 		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
 
-		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			if (dai_link->num_cpus == 1) {
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-			} else if (dai_link->num_cpus == dai_link->num_codecs) {
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, i);
-			} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
-				int cpu_id;
-
-				if (!rtd->dai_link->codec_ch_maps) {
-					dev_err(rtd->card->dev, "%s: no codec channel mapping table provided\n",
-						__func__);
-					return -EINVAL;
-				}
+		/*
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 */
+		/* .ch_map is from CPU */
+		if (dai_link->num_cpus >= dai_link->num_codecs) {
+			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+				codec_dai = snd_soc_rtd_to_codec(rtd, dai_link->ch_maps[i].connected_node);
 
-				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, cpu_id);
-			} else {
-				dev_err(rtd->card->dev,
-					"%s codec number %d < cpu number %d is not supported\n",
-					__func__, rtd->dai_link->num_codecs,
-					rtd->dai_link->num_cpus);
-				return -EINVAL;
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
+					has_playback = 1;
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
+					has_capture = 1;
 			}
+		}
+		/* .ch_map is from Codec */
+		else {
+			for_each_rtd_codec_dais(rtd, i, codec_dai) {
+				cpu_dai = snd_soc_rtd_to_cpu(rtd, dai_link->ch_maps[i].connected_node);
+
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
+					has_playback = 1;
+				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+				    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
+					has_capture = 1;
 
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				has_playback = 1;
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				has_capture = 1;
+			}
 		}
 	}
 
-- 
2.25.1


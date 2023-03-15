Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0755D6BA854
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 07:46:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B9591323;
	Wed, 15 Mar 2023 07:45:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B9591323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678862761;
	bh=CQE1TQaYGS45nTjyM4IvYlXECO41xbYEnglsoQm/o2Q=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N4/Q5PsDV/A3rYh50u4WO+EBs2c0dMG80VMuhQvYSUxIsxaH1uCXh1kC5FiiLLj7i
	 p5qUtiZdzSRKXDuumyHbZSWdAP534229q1zW+k0oZgZtwmCuCt/bhAXXK76AzmCB1u
	 VtvQhFeCFKJRwiOUEBLFHBtjPZGcviwKN+i/PslU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E84FF80482;
	Wed, 15 Mar 2023 07:44:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B957F80482; Wed, 15 Mar 2023 07:43:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACBE4F8016C
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 07:42:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACBE4F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=buVZyw43
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coEFQaSIE2m5B35RfuP/FQfFGXuXpD/Zay6fibiZ31068MugG2N5BQIOF0mMDt/JqXdBxwufSXHTUaIurA5KAeaq/GBnPF/M+oAbwfN6UqXGtnZ0iT+l9H9bz5WKtgbauYFXWc3UTvpUnu1uTD4t85vHfICKAclejVSfLE94vTCWsjhC4WCWhCdZOtPKn876n621V9byfOUDKvirykwIu4S4GtytizHpRX+Fhypj0Y/QCz9RsCb9vq3vuFxbv6vwen5YWLt38wjdPShvCqlP6od55mGOnNhjeuI3ZbYjswBgS8794e4j3wo3dqF4AiZ1FYFKnBc3IpWj6pWwGkdGcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcC20VK6jTKImqrjFRCkgPKdaPfeNfgpCdRSh+vvxy4=;
 b=U+umSr2RhKJlWmgzFLQbsUc2tiLwIg4j3Uk6lkaIUppVLgUzfvbO/vR9uYDalSKXiIw70Qja93idcEc1hK6k2orcFV+1YF5ko/zve9tODyYfeTVKg6Ke1n8HuHeXj/jUOnvM1h4fRrLXIPoBy8IKgVd/zvFT1RLE8rA5DfjdAlnjz9SToxQ8rybrsDgcM0Uj+yTRZZUBPrLnZwu4eyC7D66b4TRglYfv+bR0/rE+K7TdsOOHK0yptJdgW4DNUIRif8hNjAYG4MmT/a1zRFJYkyvmNlW7quttGc7+TtzGguKhf2yPLFOAiswyRwfzvFRsD11FzTCNwUtWcZo0WZ7zZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcC20VK6jTKImqrjFRCkgPKdaPfeNfgpCdRSh+vvxy4=;
 b=buVZyw43ukYjNumETTd/DtHY6/KmdnqA6B6kxImUvbKWM1xwpW3olHiAlyPlK6M+4OJYuqJhKIAE9qn6Ee6HFWkDCReIEsukvBpq65SdoUSQG5orMnoQabjMphv5OrpIggIoAW+bmP/wMXTw+AQHXvdWlZ7vk0WgNtMZjxtxVPc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11479.jpnprd01.prod.outlook.com (2603:1096:400:37f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 06:42:44 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.027; Wed, 15 Mar 2023
 06:42:44 +0000
Message-ID: <871qlqjz17.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/6] ASoC: simple-card-utils.c: remove unnecessary
 dai_link->platform
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
References: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 15 Mar 2023 06:42:44 +0000
X-ClientProxiedBy: TYAPR01CA0076.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11479:EE_
X-MS-Office365-Filtering-Correlation-Id: a2789bfa-af97-4068-98ce-08db25207ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s0p1WgQVqem1APo6qYTe6GrZK/nbqNrUWD09Atj0hCjmGNeI8tKsFGuna2ouKAjiEvkDqIDsATYcBZJe0TfAJRiFzt7xZxO87POn8VjsNnCLTnrMSJzmGglHbMEdbIJubSdmLZV9f4Aa1MphFDAUD02vW0tteSC7suEGf15YTnjH9WLsGmiqrtYTf95myKwXFdNhiBqQ+EN3nPA0hRWZXBdYrVFagw0X02z0EyLPKLoSZws+VlT12HuMge9EZD2hne+1LhyXDXsUFEKIQlhsVqSLqqYy6I+me6xbtOL6fSn1DC4QDPdFvIOKKWncFci8+KAygXIbPWvpQ04CrRSVpAz6kwpslwzVnJIA7IBQqLRpdYlODYKiJleEmk1nIpLUlXdjip59GFZFm06EcrMDvBzV4U3AEsUwQyTzfjKn8zSxhlgdLaTYvumwRAvSOzeCMW0AThmrtwPrKmtHFWvs1b7iHOP0R3+/fTvs0N+1kH5zZrUpdC1Fw9m2ZP83s5JMq7Wyc1L8609VQ19gFZn54AQtWACBbnAt2dRI2t33P1MLfzj1G59VUioELGbREEyUHnvrFrQqBqMfsuCRi/rec5P77RkNfDbjzzC16wArRlNw1KyGtyqZNFe5b8kiBcbkUJKTavTRAaPWylqk6lfmPULWEq18ub2NtRizEvYjOHJpF36jcsw64jw+UAuLrbtsTdGWIkkFlGo4BaIqUKnukg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199018)(30864003)(83380400001)(5660300002)(478600001)(52116002)(2616005)(2906002)(86362001)(26005)(6506007)(6512007)(6486002)(36756003)(186003)(41300700001)(19627235002)(38350700002)(38100700002)(4326008)(6916009)(66946007)(66556008)(8676002)(66476007)(8936002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OtrzsGUWHXRC4WLXuWCRueZEkbJV8bojPmi04qkpr+QYHZmcXAHS1zsza7Jh?=
 =?us-ascii?Q?IVM/WxN/2YM+TxwMBaP+LFAHzEJjH+/2SebHCUtj6iWhZuoYuHiMG16dK2Pi?=
 =?us-ascii?Q?eaByd78bAvDZtJZIv2El0Vm/fJldoMUYb8+3nT11qdrquvJnxiLwyApR5bxU?=
 =?us-ascii?Q?SU0q7qCW1pz3MkHqKXjF42boSnFGhV1eK/02Ia8Gg3YJOBtqf4H5l7haBCXR?=
 =?us-ascii?Q?RyvwrbBLH6gkW8fp3tErBSAu80cpXmTgvXdoBNZDcrfhL+v1fwWlkH3++mMq?=
 =?us-ascii?Q?gmTO/9MSxLWwX7hk3IU6mxewQJGGcmrhLfGAfBZs3UeJQGPUsg56rnlrCstI?=
 =?us-ascii?Q?G7ZT8ibWLBI+10iStdRerkXWkBwfgOByh+6FhE2uUUIyRhvZAIU04KLsJF8u?=
 =?us-ascii?Q?MSbBW7M+hPp/hNfjd6NEEwQaacC9Ygl5pB+dB8Yr6cyRk0eKlYABMbnDrNAC?=
 =?us-ascii?Q?SQ2RAIQIF6NGur/9Yh+/mQuHq2fNFlcEwKOPsCc4C1Hi6BFORp1YMQRbjRPX?=
 =?us-ascii?Q?ISCajevrnXSIX48K56n7hzQn/T36dL4kT0SLKGinwekx0eCnDYk8DqQ2FqKW?=
 =?us-ascii?Q?SHBQwrliUxK9+aD8dCUx6W1jBmpGXNJFC42VgjeWns3JqjGwXRd8hubiqOtT?=
 =?us-ascii?Q?rHI8I12KjUKMOjwWUTfftLrx+1eO7VPYn+ryBmnc3hhBIcLIzjSHrYPJecB0?=
 =?us-ascii?Q?5RLcFog7qtmxYncmmuIOA8hrDWs2nVSpjpOTtbg3mgE3LxfFvLFk1bt1mrL1?=
 =?us-ascii?Q?ub+cj5MYffuuoi13AIFc6Jqu5F4L2YDggpqiyCFM4tJr5e5feDaH0F87Gk0j?=
 =?us-ascii?Q?19eGy2EvbMifbq1oYjUHLjZXldzKy9aIoDXplMVbQ8mL6iX2ytu4f7cmTGMq?=
 =?us-ascii?Q?0076HzLAcrytvgod9tKSQZI7+4KuPrh3CJEGNLd+AR/9B2hTCoOhfp1Qe5Rc?=
 =?us-ascii?Q?1j8d3Hy4TuT0alHKkT0abAU0oSSmmM7VfP+qL4CNJqh6cZCoFC8T4PU1wqCM?=
 =?us-ascii?Q?eZG8RhLn9MS8b/GuG/gQ5yi5KFnd4MxfkA/Ac644ghAJhu+i+pstKy++Rzxo?=
 =?us-ascii?Q?KDZ+p5kbw3dYaWqwESBy2wFIL8abMgpcbl5VeWHirrZnBnoV6OBVnPek09dK?=
 =?us-ascii?Q?6UzFVNeCvxlGZkldyIpXG9wg0PMax591dsas7B8mSUGlEylI468GixqJp/YV?=
 =?us-ascii?Q?ztuoLUr0n3+upnb6kEQqJ6z0rmKjCnA7sdR0OSu6T+6KfrbrTjpAsyXuNk7R?=
 =?us-ascii?Q?cncPkPwb/1/Rdu8HoXzfiD/QVDkaEw7c4Jc+s9d2C8clTOH1E0GbwSk14AOV?=
 =?us-ascii?Q?xUZ5ENfyj+3GBXQHpj6q/72kkBTXdBLxM5Raj6hw3CtSLGBRshwZjXaj2h9H?=
 =?us-ascii?Q?ID676NdquOo53HUejb6SostB1HgPOxqKOxF2q1Ub9W49qJY+GNHcdQ2d0thh?=
 =?us-ascii?Q?/9cTM4sWoEzbGP2YFgRFFCfsA4EQcRpReSOph1R+pmHN2IJl00tPyU/eEO0E?=
 =?us-ascii?Q?od2W5+BaP55owUxCSWJXGyvaKSc32kltXBi7sz6dDIDykZgrTgXIC01LpwUy?=
 =?us-ascii?Q?HjfKW5O5S7DEvllQMuedGJpeYO9eeYgas5x+sw4tcIYdTAeK4BoYUem/23fy?=
 =?us-ascii?Q?Vw4tP1w3OMmY6y6Yn6J81AU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a2789bfa-af97-4068-98ce-08db25207ba6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 06:42:44.7847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 P3JGvrvXSCX3zhW/3AUYsES1YiT1Ns3KAwfZDDm60O9rlIytyKj/bQfgOzzDrrs66OCLNb6T3OKXLCrHm2WhJpAnzTQaRdgOTpJRLJCraDtYBvAWUC6W0c0en2A9KyEf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11479
Message-ID-Hash: ZVSIINL3GHWG6OQ25LIWYWBOHSOYA2FF
X-Message-ID-Hash: ZVSIINL3GHWG6OQ25LIWYWBOHSOYA2FF
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZVSIINL3GHWG6OQ25LIWYWBOHSOYA2FF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dai_link->platform is no longer needed if CPU and Platform are
same Component. This patch removes unnecessary dai_link->platform.

Simple-Card (Normal) is supporting platform, but
Simple-Cadd (DPCM), Audio-Graph-Card/Card2 (Normal/DPCM) are not
for now.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     |  2 --
 sound/soc/generic/audio-graph-card.c  |  6 ----
 sound/soc/generic/audio-graph-card2.c |  9 ++----
 sound/soc/generic/simple-card-utils.c |  9 ------
 sound/soc/generic/simple-card.c       | 40 +++++++++++++++------------
 5 files changed, 25 insertions(+), 41 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index a3f3f3aa9e6e..aeb5ceba4019 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -167,8 +167,6 @@ int asoc_simple_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 					&(dai)->slots,		\
 					&(dai)->slot_width);
 
-void asoc_simple_canonicalize_platform(struct snd_soc_dai_link_component *platforms,
-				       struct snd_soc_dai_link_component *cpus);
 void asoc_simple_canonicalize_cpu(struct snd_soc_dai_link_component *cpus,
 				  int is_single_links);
 
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 5daa824a4ffc..c709fc4a39ed 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -287,7 +287,6 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	if (li->cpu) {
 		struct snd_soc_card *card = simple_priv_to_card(priv);
 		struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
-		struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
 		int is_single_links = 0;
 
 		/* Codec is dummy */
@@ -318,7 +317,6 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 		}
 
 		asoc_simple_canonicalize_cpu(cpus, is_single_links);
-		asoc_simple_canonicalize_platform(platforms, cpus);
 	} else {
 		struct snd_soc_codec_conf *cconf = simple_props_to_codec_conf(dai_props, 0);
 		struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
@@ -372,7 +370,6 @@ static int graph_dai_link_of(struct asoc_simple_priv *priv,
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
 	struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
-	struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
 	char dai_name[64];
 	int ret, is_single_links = 0;
 
@@ -390,7 +387,6 @@ static int graph_dai_link_of(struct asoc_simple_priv *priv,
 		 "%s-%s", cpus->dai_name, codecs->dai_name);
 
 	asoc_simple_canonicalize_cpu(cpus, is_single_links);
-	asoc_simple_canonicalize_platform(platforms, cpus);
 
 	ret = graph_link_init(priv, cpu_ep, codec_ep, li, dai_name);
 	if (ret < 0)
@@ -615,7 +611,6 @@ static int graph_count_noml(struct asoc_simple_priv *priv,
 
 	li->num[li->link].cpus		= 1;
 	li->num[li->link].codecs	= 1;
-	li->num[li->link].platforms     = 1;
 
 	li->link += 1; /* 1xCPU-Codec */
 
@@ -638,7 +633,6 @@ static int graph_count_dpcm(struct asoc_simple_priv *priv,
 
 	if (li->cpu) {
 		li->num[li->link].cpus		= 1;
-		li->num[li->link].platforms     = 1;
 
 		li->link++; /* 1xCPU-dummy */
 	} else {
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 06609a526b78..9f154fc1bbb4 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -590,10 +590,8 @@ static int __graph_parse_node(struct asoc_simple_priv *priv,
 
 	if (is_cpu) {
 		struct snd_soc_dai_link_component *cpus = dlc;
-		struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, idx);
 
 		asoc_simple_canonicalize_cpu(cpus, is_single_links);
-		asoc_simple_canonicalize_platform(platforms, cpus);
 	}
 
 	return 0;
@@ -1046,8 +1044,7 @@ static int graph_count_normal(struct asoc_simple_priv *priv,
 	 * =>		lnk: port { endpoint { .. }; };
 	 *	};
 	 */
-	li->num[li->link].cpus		=
-	li->num[li->link].platforms	= graph_counter(cpu_port);
+	li->num[li->link].cpus		= graph_counter(cpu_port);
 	li->num[li->link].codecs	= graph_counter(codec_port);
 
 	of_node_put(cpu_ep);
@@ -1080,7 +1077,6 @@ static int graph_count_dpcm(struct asoc_simple_priv *priv,
 
 	if (asoc_graph_is_ports0(lnk)) {
 		li->num[li->link].cpus		= graph_counter(rport); /* FE */
-		li->num[li->link].platforms	= graph_counter(rport);
 	} else {
 		li->num[li->link].codecs	= graph_counter(rport); /* BE */
 	}
@@ -1113,8 +1109,7 @@ static int graph_count_c2c(struct asoc_simple_priv *priv,
 	 *	};
 	 * };
 	 */
-	li->num[li->link].cpus		=
-	li->num[li->link].platforms	= graph_counter(codec0);
+	li->num[li->link].cpus		= graph_counter(codec0);
 	li->num[li->link].codecs	= graph_counter(codec1);
 
 	of_node_put(ports);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 56552a616f21..f1c228743d98 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -635,15 +635,6 @@ int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd)
 }
 EXPORT_SYMBOL_GPL(asoc_simple_dai_init);
 
-void asoc_simple_canonicalize_platform(struct snd_soc_dai_link_component *platforms,
-				       struct snd_soc_dai_link_component *cpus)
-{
-	/* Assumes platform == cpu */
-	if (!platforms->of_node)
-		platforms->of_node = cpus->of_node;
-}
-EXPORT_SYMBOL_GPL(asoc_simple_canonicalize_platform);
-
 void asoc_simple_canonicalize_cpu(struct snd_soc_dai_link_component *cpus,
 				  int is_single_links)
 {
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index e98932c16754..b78d9db6ca5a 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -197,6 +197,7 @@ static int simple_link_init(struct asoc_simple_priv *priv,
 static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 				   struct device_node *np,
 				   struct device_node *codec,
+				   struct device_node *platform,
 				   struct link_info *li,
 				   bool is_top)
 {
@@ -217,7 +218,6 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 
 	if (li->cpu) {
 		struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
-		struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
 		int is_single_links = 0;
 
 		/* Codec is dummy */
@@ -233,7 +233,6 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 		snprintf(dai_name, sizeof(dai_name), "fe.%s", cpus->dai_name);
 
 		asoc_simple_canonicalize_cpu(cpus, is_single_links);
-		asoc_simple_canonicalize_platform(platforms, cpus);
 	} else {
 		struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
 		struct snd_soc_codec_conf *cconf;
@@ -277,6 +276,7 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 static int simple_dai_link_of(struct asoc_simple_priv *priv,
 			      struct device_node *np,
 			      struct device_node *codec,
+			      struct device_node *platform,
 			      struct link_info *li,
 			      bool is_top)
 {
@@ -284,12 +284,9 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
 	struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
-	struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
 	struct device_node *cpu = NULL;
 	struct device_node *node = NULL;
-	struct device_node *plat = NULL;
 	char dai_name[64];
-	char prop[128];
 	char *prefix = "";
 	int ret, single_cpu = 0;
 
@@ -302,9 +299,6 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 	if (is_top)
 		prefix = PREFIX;
 
-	snprintf(prop, sizeof(prop), "%splat", prefix);
-	plat = of_get_child_by_name(node, prop);
-
 	ret = simple_parse_node(priv, cpu, li, prefix, &single_cpu);
 	if (ret < 0)
 		goto dai_link_of_err;
@@ -313,20 +307,22 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 	if (ret < 0)
 		goto dai_link_of_err;
 
-	ret = asoc_simple_parse_platform(plat, platforms);
-	if (ret < 0)
-		goto dai_link_of_err;
+	if (platform) {
+		struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
+
+		ret = asoc_simple_parse_platform(platform, platforms);
+		if (ret < 0)
+			goto dai_link_of_err;
+	}
 
 	snprintf(dai_name, sizeof(dai_name),
 		 "%s-%s", cpus->dai_name, codecs->dai_name);
 
 	asoc_simple_canonicalize_cpu(cpus, single_cpu);
-	asoc_simple_canonicalize_platform(platforms, cpus);
 
 	ret = simple_link_init(priv, node, codec, li, prefix, dai_name);
 
 dai_link_of_err:
-	of_node_put(plat);
 	of_node_put(node);
 
 	li->link++;
@@ -339,10 +335,12 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
 			int (*func_noml)(struct asoc_simple_priv *priv,
 					 struct device_node *np,
 					 struct device_node *codec,
+					 struct device_node *platform,
 					 struct link_info *li, bool is_top),
 			int (*func_dpcm)(struct asoc_simple_priv *priv,
 					 struct device_node *np,
 					 struct device_node *codec,
+					 struct device_node *platform,
 					 struct link_info *li, bool is_top))
 {
 	struct device *dev = simple_priv_to_dev(priv);
@@ -401,7 +399,7 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
 				 * Codec |return|Pass
 				 */
 				if (li->cpu != (np == codec))
-					ret = func_dpcm(priv, np, codec, li, is_top);
+					ret = func_dpcm(priv, np, codec, plat, li, is_top);
 			/* else normal sound */
 			} else {
 				/*
@@ -411,7 +409,7 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
 				 * Codec |return|return
 				 */
 				if (li->cpu && (np != codec))
-					ret = func_noml(priv, np, codec, li, is_top);
+					ret = func_noml(priv, np, codec, plat, li, is_top);
 			}
 
 			if (ret < 0) {
@@ -435,10 +433,12 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 				int (*func_noml)(struct asoc_simple_priv *priv,
 						 struct device_node *np,
 						 struct device_node *codec,
+						 struct device_node *platform,
 						 struct link_info *li, bool is_top),
 				int (*func_dpcm)(struct asoc_simple_priv *priv,
 						 struct device_node *np,
 						 struct device_node *codec,
+						 struct device_node *platform,
 						 struct link_info *li, bool is_top))
 {
 	int ret;
@@ -500,6 +500,7 @@ static int simple_parse_of(struct asoc_simple_priv *priv, struct link_info *li)
 static int simple_count_noml(struct asoc_simple_priv *priv,
 			     struct device_node *np,
 			     struct device_node *codec,
+			     struct device_node *platform,
 			     struct link_info *li, bool is_top)
 {
 	if (li->link >= SNDRV_MAX_LINKS) {
@@ -511,7 +512,9 @@ static int simple_count_noml(struct asoc_simple_priv *priv,
 
 	li->num[li->link].cpus		= 1;
 	li->num[li->link].codecs	= 1;
-	li->num[li->link].platforms	= 1;
+
+	if (platform)
+		li->num[li->link].platforms = 1;
 
 	li->link += 1;
 
@@ -521,6 +524,7 @@ static int simple_count_noml(struct asoc_simple_priv *priv,
 static int simple_count_dpcm(struct asoc_simple_priv *priv,
 			     struct device_node *np,
 			     struct device_node *codec,
+			     struct device_node *platform,
 			     struct link_info *li, bool is_top)
 {
 	if (li->link >= SNDRV_MAX_LINKS) {
@@ -531,8 +535,10 @@ static int simple_count_dpcm(struct asoc_simple_priv *priv,
 	}
 
 	if (li->cpu) {
+		if (platform)
+			li->num[li->link].platforms = 1;
+
 		li->num[li->link].cpus		= 1;
-		li->num[li->link].platforms	= 1;
 
 		li->link++; /* CPU-dummy */
 	} else {
-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9EA6EC3B0
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 04:39:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE3DAE8A;
	Mon, 24 Apr 2023 04:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE3DAE8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682303962;
	bh=SLu4F0J0Vfoqmg+kzeXh7/rfBBodIn15aRMezmeFir4=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DQYeWxifs2y5TE4ncfQAB8c8HUeZRhSXvj9Rs0Zvz1b3HwhmqyOWz0wkueQy52q9z
	 Pb4g3Wi3aZ+IZD1z5ZdPgse1l5kELZ9ObTut8KiE+kFNj72WlZFY0GAnEWOcf8Bk5P
	 srV98wNte/lO8UbC+0U0T8v2+kdyiIy4C6GiY/6Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02160F8053B;
	Mon, 24 Apr 2023 04:37:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 193EBF8057C; Mon, 24 Apr 2023 04:37:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 904FDF8057B
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 04:37:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 904FDF8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=L2+LocSC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCBaUyYrQbEIUDsE/vbLmUb+yhDbxHITNhK0ehfkF+W3IWGlDXQFzhAc8Rm8IusCyKVhGJg1DTa6hdbWp8BGrSzcCdX8Jk7rMOKmceksLZGwc8C3+zlpNf12EYbN3HBnnH7XKF3wtkguubNvQw+3kAAu8R/M1CFCJ7X5CBQuc2rfbMehxAZbMLR5Zd6wnpLcXLJQRubcfGuVTt2w3qhqzx4pPuMPoxMpB32sjYlctQsBqZTqLvq4TPrMoFiiMhCaZE+g/mTVYVS6iHnl6XnZZ8JRVGFmPNaYs6mnlXxuu5cS5d0IkCNTbUMDh/v16x/ZHsTR2h3ZPp75kJUp/xRlmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMS9TN69tq70W6Bk47i0zECTBT5WEmlCDKQxzNA7mLM=;
 b=beHXh7rp2jt3XwgYQBV/pSwJVRDjBWLv1O5dwyynerEpryIdPP6Fwz+HqL2GYY7I60gSw41hPxi3W1mmeNnMuKrOIcTTtchbibeRcZzzA6dD82PS7EhdLVdM7PcposqYgEVwBUDMNrdcQG/FBBWjopoRQrs12QnTEK+mfVQOHihqLQFvrHf/qdgzuMcofKJOs7ygRdsKWZVUxbQcFmW1uUbZfzokRwC98nJrnXsVttIHgbWrucB2kT+D5MbZCh3jNumjVKqaxRtqNCu/g3laG1Wviaa2HXAJtb1xh1cKKwKphTaXmRWlo92WxdP8jNpb+PZszCyY+Ckx43/vSzLjFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMS9TN69tq70W6Bk47i0zECTBT5WEmlCDKQxzNA7mLM=;
 b=L2+LocSCNPkT0KokdgOuy2jxGMtONf/kQpmAi7X3pHqDez1NBlkRLyCU/lURY+6TqXzEAuCDiXKkA7BBPvA0vzlWatOEEvzn7H5a+2m3yT0qgy1e6ebdLU1cYo9+m5Wge7jTFCkQcrC6ZJDrcgmzmWwfm6w7dHgNYikY/hFGSYU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11070.jpnprd01.prod.outlook.com (2603:1096:400:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 02:37:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 02:37:12 +0000
Message-ID: <87wn22ypig.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 10/13] ASoC: intel: sof: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Apr 2023 02:37:11 +0000
X-ClientProxiedBy: TYCPR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11070:EE_
X-MS-Office365-Filtering-Correlation-Id: 16727a54-c904-4dd0-1b5a-08db446ccecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/kSPa+153T5mVfY4h16fcjUHpqP0HIW5CUiWNHlhXxlvvWUSUrFm4KVZVvmd0Ms7mVhaW5axHqeEypIz5waGUGpgjzqN4HIrvTVBoOaB+OXWx4R88X5c5Ye65lmGNqwSww+2MfvE+4To0StEqNIkP5BHOWiJCb9J92qeO9qXa8cUGajWF8bn+4AI6sJeiufiN3nBWGYSqZYZBHcRTreGfMGzjQWUFWrUgGeI/Tv3GHxzDgwtM2cxg/afAuV5UtbHqKXGC1qcX/cLm0og2aU9fVnzqat6A3pDX2eavUX3N5YDNRnWry9lP9bUQ13b+BbAGQPPhQq9kt/ZXtSZJoFRPCfpeQuXv1oJftNL0/TsYZU3gtWkTTA0sijDejIr0myEGIp66DXZ6VxBKuBpUSn3qpIBYIwfjPnmjFHyWyqVAlMmRmKUn4lCHSVMtLG32Rzxu0kYkEryw7iNokn0He/8lJlRvG+t2tux9+Zn7qHnzOaO3jOcTCXkeVQtP5Lw+67ounkAGtuLUnTOWENMPj3jmAZXZUXeXQzaPxJBxGIDd4m5mN/I8Fb1cScj2EIHXS8jMTyO1udFiCLUrxqNnzkRAFIo6VvZT1J/DHRXF5KxwdEhFhQurPtbgrv99S0d+yWkE8qNpG4715ErvPBrmvPI0A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(316002)(4326008)(7416002)(8676002)(8936002)(5660300002)(41300700001)(36756003)(86362001)(921005)(6512007)(26005)(186003)(38100700002)(38350700002)(478600001)(52116002)(6486002)(83380400001)(2616005)(6506007)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JTsGUcv5IerR9aVKda9umsLtmgxyD2NVmc0cNb8MsB3EYeASrsidQsD5p/o9?=
 =?us-ascii?Q?YBKzx14ifDGkn5P4nYuTAnabivMHjQZyv/HiJn1MIxTMklI7pJobXJbNLSNT?=
 =?us-ascii?Q?Hk11pry46zWPNoQlKvsRqqilJIEcslQ3j+uldSfmgyBWtqgzTuWUqMX4PDYi?=
 =?us-ascii?Q?lOgt+UoK65seLSSprJngBsIk9nXbNnWiBjrn5Ydr+TGBM5gKUc94FTNevLAT?=
 =?us-ascii?Q?dRfEltHuhXlJu6z+aw5m0Om370B+u1E6AVKsY3LZ2u5TxL1FyN+C+GL/fDfT?=
 =?us-ascii?Q?mZbSJZkUFadj0qAf2GNbwraJprOuMBd259mQVqSIf6P/L2wJx6j/LME+SNyM?=
 =?us-ascii?Q?vdvHO3QpuioY8tlVskfb02LvfbrWvriWCfnyyA+lzpUFrMZugVF0b+S/CxZ5?=
 =?us-ascii?Q?OasVHhsJymdQU37z0O8h+YdxflvN5LDUWlm68SoLg8cXrYMdgwEdXRsZonqy?=
 =?us-ascii?Q?e4ZzgS93aiJPe+5xUsIg/PzfCMYrbw7O44osHlqzfngH24K1i5wJ9GFsnuYH?=
 =?us-ascii?Q?U6sAGxQAI+PaKcdmuNV0yb1b+6Xal+oK85E5/RANXokfCKR9myoH1yoBn5Uc?=
 =?us-ascii?Q?IxaC/zt7njKN7sFUbxN5yyoV/fnafclR0pkt3H+bI0KMmu9xCQDsIhQXvdQU?=
 =?us-ascii?Q?P+tllX47dQ4bTo7axiJxc6jV05Fbapvei6tjWHxmCNNrp7UVDHO4D/1ADldQ?=
 =?us-ascii?Q?q8rYA6GaWWK1iSRoumpFoHLPZz4omQhvmShHf/ffQpnimH4sv/i0YRoqWfE4?=
 =?us-ascii?Q?8boXzA4mLv3vWFfG4gZLeZ8fC9duqztbJzC636dQ0ao0B8WsNvBLhfR4SBAL?=
 =?us-ascii?Q?ZwdPDievXUVQ9wYSxkr/RqwAIOxPhcekWM5IddhQ9+kydZsvqNhDyhIhbdCx?=
 =?us-ascii?Q?TrpdLQ4b51ip/oA3SO75TEpBFHMy/2duugtMfHAwu3ZiLTgagxptbC6Ez58/?=
 =?us-ascii?Q?VH+trJvDIyO6zFqVQ4WbKxBP7d6WBykBJ5cInFkgtTYzO0Sw4300+4zHjQgQ?=
 =?us-ascii?Q?5skJwBqSkWXf3qhNcIuGyNBp+a22y0sOcoVyVTfDRxMeVTPEpBlwAyTheFL4?=
 =?us-ascii?Q?gIiP7jSRvvX2ShXLT6QT/6IViTK9jY5ABa7WgUKwEDkcDXC1iGFDLtho/yLB?=
 =?us-ascii?Q?glulvLBMjTAunRln3HEyQJEA9eJg+HRSXAbhqwu0o0tarpslKhy46BPfvLII?=
 =?us-ascii?Q?8470AGJoVOpBnKw+9c2kpRoU/GiimJ2lgexxkekOixSn1CgZRIDoFyvyZ4Ni?=
 =?us-ascii?Q?nGKnmvdF6Z5cldG+cY/PL+7GYts4UBLU2YQtqFU1AeTRlAAcBV3/kiugR0EQ?=
 =?us-ascii?Q?Z0TO5OcsgFBMav+dvGBUhbSt63xIHNS8dRH3yc7f0WAo0DNK6qiVDjIGKQYO?=
 =?us-ascii?Q?24feBgw9zRkAFhB3+q2JEYvoaptakZWW0mKObhcT/njUxXf1RCHQjKwPaEvP?=
 =?us-ascii?Q?Gl2dRJDxmTsMYnI/HNmPASRsTumOlADKUH3+XBM0TY5eNV+Cpioi76keLCnL?=
 =?us-ascii?Q?HCLSOtBhnouu7CMjX792zMbgy1M/TejuoPrHDX+9H7PjjFZ+WuV+gBon1vRA?=
 =?us-ascii?Q?p2MN7FQIJVt+0EJbZViu+MQgHJXBx54HYA+40p92SNKB6IhMTtRQ0UQYfSYD?=
 =?us-ascii?Q?ljGgREMmcVN6y3RNh2S+Tg0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 16727a54-c904-4dd0-1b5a-08db446ccecb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 02:37:12.1496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CtHuWCfd+S1TZHKvmb668HrnvS1kQ8RNYgWJikTI0a+pwrmchMqcMs0QP7IFvnD8HANXWR/4FgXM0kywTPzU6KrBf81N6CgtfhMWwylsmEN4d3JEQeKd5LP06AufapgB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11070
Message-ID-Hash: QIZNKQHL6UCIQFARTKOV632UILDLNTCS
X-Message-ID-Hash: QIZNKQHL6UCIQFARTKOV632UILDLNTCS
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QIZNKQHL6UCIQFARTKOV632UILDLNTCS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/boards/ehl_rt5660.c  |  8 ++------
 sound/soc/intel/boards/sof_cs42l42.c | 11 ++---------
 sound/soc/intel/boards/sof_es8336.c  | 11 ++---------
 sound/soc/intel/boards/sof_nau8825.c | 11 ++---------
 sound/soc/intel/boards/sof_pcm512x.c |  3 +--
 sound/soc/intel/boards/sof_rt5682.c  | 14 +++-----------
 sound/soc/intel/boards/sof_sdw.c     | 13 ++-----------
 sound/soc/intel/boards/sof_ssp_amp.c | 18 +++++-------------
 8 files changed, 19 insertions(+), 70 deletions(-)

diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
index d5235c294c4c..fee80638cba2 100644
--- a/sound/soc/intel/boards/ehl_rt5660.c
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -254,7 +254,6 @@ static void hdmi_link_init(struct snd_soc_card *card,
 			   struct sof_card_private *ctx,
 			   struct snd_soc_acpi_mach *mach)
 {
-	struct snd_soc_dai_link *link;
 	int i;
 
 	if (mach->mach_params.common_hdmi_codec_drv &&
@@ -267,11 +266,8 @@ static void hdmi_link_init(struct snd_soc_card *card,
 	 * if HDMI is not enabled in kernel config, or
 	 * hdmi codec is not supported
 	 */
-	for (i = HDMI_LINK_START; i <= HDMI_LINE_END; i++) {
-		link = &card->dai_link[i];
-		link->codecs[0].name = "snd-soc-dummy";
-		link->codecs[0].dai_name = "snd-soc-dummy-dai";
-	}
+	for (i = HDMI_LINK_START; i <= HDMI_LINE_END; i++)
+		card->dai_link[i].codecs[0] = asoc_dummy_dlc;
 }
 
 static int snd_ehl_rt5660_probe(struct platform_device *pdev)
diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index e9d190cb13b0..e6695e77d594 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -296,13 +296,6 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component dummy_component[] = {
-	{
-		.name = "snd-soc-dummy",
-		.dai_name = "snd-soc-dummy-dai",
-	}
-};
-
 static int create_spk_amp_dai_links(struct device *dev,
 				    struct snd_soc_dai_link *links,
 				    struct snd_soc_dai_link_component *cpus,
@@ -510,8 +503,8 @@ static int create_bt_offload_dai_links(struct device *dev,
 		goto devm_err;
 
 	links[*id].id = *id;
-	links[*id].codecs = dummy_component;
-	links[*id].num_codecs = ARRAY_SIZE(dummy_component);
+	links[*id].codecs = &asoc_dummy_dlc;
+	links[*id].num_codecs = 1;
 	links[*id].platforms = platform_component;
 	links[*id].num_platforms = ARRAY_SIZE(platform_component);
 
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index adf5852b2c9a..d6c38d8ea2ff 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -393,13 +393,6 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component dummy_component[] = {
-	{
-		.name = "snd-soc-dummy",
-		.dai_name = "snd-soc-dummy-dai",
-	}
-};
-
 static int sof_es8336_late_probe(struct snd_soc_card *card)
 {
 	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
@@ -572,8 +565,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			if (!links[id].name)
 				return NULL;
 			links[id].id = id + hdmi_id_offset;
-			links[id].codecs = dummy_component;
-			links[id].num_codecs = ARRAY_SIZE(dummy_component);
+			links[id].codecs = &asoc_dummy_dlc;
+			links[id].num_codecs = 1;
 			links[id].platforms = platform_component;
 			links[id].num_platforms = ARRAY_SIZE(platform_component);
 			links[id].dpcm_capture = 1;
diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 6794a0249a9a..30e798431e1f 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -346,13 +346,6 @@ static struct snd_soc_dai_link_component nau8318_components[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component dummy_component[] = {
-	{
-		.name = "snd-soc-dummy",
-		.dai_name = "snd-soc-dummy-dai",
-	}
-};
-
 static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 							  int ssp_codec,
 							  int ssp_amp,
@@ -532,8 +525,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
 		if (!links[id].name)
 			goto devm_err;
-		links[id].codecs = dummy_component;
-		links[id].num_codecs = ARRAY_SIZE(dummy_component);
+		links[id].codecs = &asoc_dummy_dlc;
+		links[id].num_codecs = 1;
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].dpcm_playback = 1;
diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index 5192e02b3cee..9f673ccf81b5 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -331,8 +331,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 				devm_kasprintf(dev, GFP_KERNEL,
 					       "intel-hdmi-hifi%d", i);
 		} else {
-			idisp_components[i - 1].name = "snd-soc-dummy";
-			idisp_components[i - 1].dai_name = "snd-soc-dummy-dai";
+			idisp_components[i - 1] = asoc_dummy_dlc;
 		}
 		if (!idisp_components[i - 1].dai_name)
 			goto devm_err;
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 791a59c5f00d..7f4783592668 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -607,13 +607,6 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component dummy_component[] = {
-	{
-		.name = "snd-soc-dummy",
-		.dai_name = "snd-soc-dummy-dai",
-	}
-};
-
 #define IDISP_CODEC_MASK	0x4
 
 static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
@@ -745,8 +738,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			if (!idisp_components[i - 1].dai_name)
 				goto devm_err;
 		} else {
-			idisp_components[i - 1].name = "snd-soc-dummy";
-			idisp_components[i - 1].dai_name = "snd-soc-dummy-dai";
+			idisp_components[i - 1] = asoc_dummy_dlc;
 		}
 
 		links[id].codecs = &idisp_components[i - 1];
@@ -841,8 +833,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
 		if (!links[id].name)
 			goto devm_err;
-		links[id].codecs = dummy_component;
-		links[id].num_codecs = ARRAY_SIZE(dummy_component);
+		links[id].codecs = &asoc_dummy_dlc;
+		links[id].num_codecs = 1;
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].dpcm_playback = 1;
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 6faf4a43eaf5..c845a5cf7f4d 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1488,8 +1488,7 @@ static int sof_card_dai_links_create(struct device *dev,
 			if (!idisp_components[i].dai_name)
 				return -ENOMEM;
 		} else {
-			idisp_components[i].name = "snd-soc-dummy";
-			idisp_components[i].dai_name = "snd-soc-dummy-dai";
+			idisp_components[i] = asoc_dummy_dlc;
 		}
 
 		cpu_name = devm_kasprintf(dev, GFP_KERNEL,
@@ -1514,21 +1513,13 @@ static int sof_card_dai_links_create(struct device *dev,
 		if (!name)
 			return -ENOMEM;
 
-		ssp_components = devm_kzalloc(dev, sizeof(*ssp_components),
-						GFP_KERNEL);
-		if (!ssp_components)
-			return -ENOMEM;
-
-		ssp_components->name = "snd-soc-dummy";
-		ssp_components->dai_name = "snd-soc-dummy-dai";
-
 		cpu_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", port);
 		if (!cpu_name)
 			return -ENOMEM;
 
 		cpus[cpu_id].dai_name = cpu_name;
 		init_dai_link(dev, links + link_index, be_id, name, 1, 1,
-				cpus + cpu_id, 1, ssp_components, 1, NULL, NULL);
+				cpus + cpu_id, 1, &asoc_dummy_dlc, 1, NULL, NULL);
 	}
 
 	card->dai_link = links;
diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index ffd9c583dab1..b33f720b3e6d 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -167,13 +167,6 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component dummy_component[] = {
-	{
-		.name = "snd-soc-dummy",
-		.dai_name = "snd-soc-dummy-dai",
-	}
-};
-
 static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
@@ -233,8 +226,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			if (!links[id].name)
 				return NULL;
 			links[id].id = id;
-			links[id].codecs = dummy_component;
-			links[id].num_codecs = ARRAY_SIZE(dummy_component);
+			links[id].codecs = &asoc_dummy_dlc;
+			links[id].num_codecs = 1;
 			links[id].platforms = platform_component;
 			links[id].num_platforms = ARRAY_SIZE(platform_component);
 			links[id].dpcm_capture = 1;
@@ -331,8 +324,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 				if (!idisp_components[i - 1].dai_name)
 					goto devm_err;
 			} else {
-				idisp_components[i - 1].name = "snd-soc-dummy";
-				idisp_components[i - 1].dai_name = "snd-soc-dummy-dai";
+				idisp_components[i - 1] = asoc_dummy_dlc;
 			}
 
 			links[id].codecs = &idisp_components[i - 1];
@@ -360,8 +352,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
 		if (!links[id].name)
 			goto devm_err;
-		links[id].codecs = dummy_component;
-		links[id].num_codecs = ARRAY_SIZE(dummy_component);
+		links[id].codecs = &asoc_dummy_dlc;
+		links[id].num_codecs = 1;
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].dpcm_playback = 1;
-- 
2.25.1


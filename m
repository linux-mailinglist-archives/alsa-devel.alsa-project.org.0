Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 118FE7079EC
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:53:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 561D5207;
	Thu, 18 May 2023 07:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 561D5207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684389205;
	bh=2/gqu3s4pji9P4C/2q6o+EStRNzcf4INHLqcYIrl0XQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GxRNQC4QjLNj2awvQFmE664tcnxUdj9CoaaH/SSp+7wMTrv0zpH5mrLOZovaq4i46
	 mtIqZtST6/i/T/OorotJhnuvD0uEsFFN0Pmtg040V6IAuuw+Kh/Gzz+i4THhU8jUe4
	 dQqIAq61vPUbiyXtJEf71IG5LJSkdDAzTrSzdZG0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D1F1F80615; Thu, 18 May 2023 07:50:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A971BF805C7;
	Thu, 18 May 2023 07:49:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C51E1F80610; Thu, 18 May 2023 07:49:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A5A8F8060F
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:49:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A5A8F8060F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Mla3g1Z7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IA64++vVpxh1GQdirn4algJ9dCY94wH3GtSOGYxLjN0QXjLBKyJg0UrilPE9Yau65PPMuv96QxGDE9gnQ6hDujxHXO+/f+R3BWPjOAGSauySaymHMyr7ThnhQ0uUF4c1ba0ZqanoFyl0OWVlZXOeOXm6G9VEJPxYTeODlPUAI71bbreqRI92/6xgjvnyqijPGB3Bawu+kfvTeL9RSnR5NgT1htECfNLffuIALxSas8XGxAezftlj8yLFCrEyEWckJe5ybZFj6MvEw8V9c0f4o3EsZfRoZf5fdNyZPaXrtDm3HR8fvkzN8m5E8UbpC8VXRDRjguIa01PwNnx8hRVvyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7WV5gDJ28s91mQ7vYqXTAYTKoK9LzvZmSQ57xSPFBc=;
 b=ni2S+GXr1N5SFcLhPoOsMeL2vbLj0em0jvOJhDpxSVWzpVbMcNcdqHtX2ueMQKShZDlCRzmvC67QZIlB4ekVclsZJJecQv56XFeE1Ksg6dZ1u+Mbm26ccNXgnv6Dl0Sla0PV6oTineffPHvnapyiumbGW+LJIX3U2aa6/ZQyqae/rmwG/Mn8rED1x3dC9nfERRW/JTPVXIwsxZ3wO00hh1IveKopipOUiRnOn8vUtUhHQvdTeOWjx9FmD5mzVP/PlESA03LKYxHngM7hbVgOlMbtYtvA0JUx1hU6V6/c2upSTq0epARW0heAM6XCgy3xFCcFb4ThPxx60CPxQRejjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7WV5gDJ28s91mQ7vYqXTAYTKoK9LzvZmSQ57xSPFBc=;
 b=Mla3g1Z7Edf1xkt/WN3Suz0WyI9JjG319gcdjdT81QZJNvuhdur2SGv5lwNRK9sSKI0mM6ycQQQ9nwuNw/MPrkyWtklHV+Kl4LLwxyTTbA/itRbZ8AfH3PUy4nsg5hFUWiI/Mwgm2fdonqjV6P487R7rE32EhJj5QGMkVWK+MYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB5984.jpnprd01.prod.outlook.com (2603:1096:400:4d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 05:49:47 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:49:47 +0000
Message-ID: <87bkiip4sl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 19/20] ASoC: soc-compress.c: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:49:46 +0000
X-ClientProxiedBy: TYCPR01CA0088.jpnprd01.prod.outlook.com
 (2603:1096:405:3::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc6706d-44b1-4cb4-1fe6-08db5763b013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ORgaKkxFoB5O30a+/BdzfeZw0EKhywC3GNvIq05SzhRG6GTTVTbcqib9awpfqoGcgIkcCyXV8h9pbZZw+5EGBhFEyrjWIB7aR6aohVAl43xByGFaNYkPADeo3nB8XC0ssxZGUBMxNU30T4mVfd9h2tCZ8R8ePmVAfzPJW9rFvAp3ChvcQMknjh7sLiPeT3bbxNZ5Vspp+8NjvYCEBT3SBEMNqIbN3cpV8QuAtb1HTjfhQJOcFyjFU6UyJ9BzOJRifNveuAKNcISbMuxzP+fKwU7E4AmLycm0CuAVB2qth1f9ItBk1NCyxQmBFc0nP/I64GDYALBWVYVm5YxV2Yp9ucTkAkSNBzDMVRs1upDZQAYAPiBzupfYi8zvPd2xN4j0oCqZ48oySmrTO4VW4/K+lNXEMVKA2vocDa0+62zzJGzUbJRUNm9PbJGQUx2y4PDCyr0icjd+QGgaB46h/Sz/czmj0xP0eAQW+iV2PId5xe0nu4yWR6zlxjEEt1tRV91TXaOWpQ7wLed4LW3J3GqiOP4CwSv9EAV3y9kr5lqZ83FQULoQKv4oVxtAODMSRjF2wUpuPPbj4HaTZRoQ2xpHuL5CtlhUu3h3GUYsMTNKaRT62BTrtQlDI4knzn90OUAd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199021)(6506007)(26005)(6512007)(186003)(2616005)(83380400001)(66476007)(5660300002)(66556008)(4326008)(316002)(66946007)(41300700001)(8676002)(8936002)(52116002)(6486002)(110136005)(2906002)(86362001)(36756003)(478600001)(38350700002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rM0+KrVW48Uz310lBaYh77nmh+rSnv52/fFG8xCNnDjm7AGUibjA7zriOyVt?=
 =?us-ascii?Q?FftNyEYLeE7zzv2bWU5ILSoPKqUgT5YJVi33yE8EmzCHhEqiYwlvJNGv6xza?=
 =?us-ascii?Q?M/i0VWzu46ZhGOL+KqokuQ79K0jv1HrnIGLgvjaHGZP0FVXyaVtHni6t+9sT?=
 =?us-ascii?Q?JMVsH5H/Qj0LAgfMt5O8Pl39i3goQnXkAlb4sGNVUH9R/dijwO7x+CbXdHeU?=
 =?us-ascii?Q?1PEYrA98ijjYVLgL4y9KDo8+OZzAxI9yUSOdUD9eVzCN+lgVLLJvXQgE9tzo?=
 =?us-ascii?Q?wKVUyJwKpbakYFM8+/N8is6TRc47lQDuOUg+YT9DVK+S2euR81DPoykCqtT4?=
 =?us-ascii?Q?xwiFEglvOHuYuPelOiFpQ7BrfeEDgdqm4UTweT1JOpbuItE8roDE1SYT49Ui?=
 =?us-ascii?Q?cilm/cgDaC7dKH1YgxwymRm2bIvaJ6zHKu7EUQ1pNsY7BzRh/+b6954mD//S?=
 =?us-ascii?Q?t2LpVWNqSLa2IWbDOEXIdnnu+UTcksJJvevEJzs875YsH3FfwcMJeLJXERwP?=
 =?us-ascii?Q?7YPb8FTr/1ufF5Hx8T4wLXQOCvqsEKFioWhC2dBhMs2bKa4ePiaeoYuqRSGR?=
 =?us-ascii?Q?3/1gYKknP6FWSEa+222TyDhGsKv5ee3f1uASzduaUqZEyK/s0Qyuy8eUnkyQ?=
 =?us-ascii?Q?mtJTNdg71exgvmaFbc1zCuUWpuStcVQg0shBa6Q+9InUxRLaZMaRtgxldgs/?=
 =?us-ascii?Q?cgbYCdC+wB5ZHLw+5uIMXxNOqVf9zXu1jkKTqDWe5zv+Rc58Lx4KlN5FCDOM?=
 =?us-ascii?Q?p/Xn50Nl7GQLPjC0y1FDZjTk0TKABVpYKGAH5qHkceHjLULUJKTkNUPZ7G6+?=
 =?us-ascii?Q?C9LlyOD9cROd9uOn2wcu9RW1W189dooJCjEOCQ6eKo+maXhOaQyf87B++y6v?=
 =?us-ascii?Q?JK/WVSlHsVjGeUQ01zvMHCTjHaW88OpkV67UKtlKRWk6FGlOpoOniEKebxFV?=
 =?us-ascii?Q?nyOi+/J1VO4VBOeTSwl3kCISw19PB/n0bitQfyjbGyovymHvtCT5IzrNP+6I?=
 =?us-ascii?Q?v4S5j3W6zVyoICo9LhnoZVlbi4P8k7/S/OvuJsVzL27n99mwHaWeMuRoYA0Z?=
 =?us-ascii?Q?v6xM5U1/zK0zDGiMjC4oaWjDMkb/uLYY0CwoN4WvMYlvEltYgQ0847Hvo+bF?=
 =?us-ascii?Q?Q7gGQ3ucJgXeFqtA1XFncR0Bf/5qYFcoqXqar1201l3RK3iu+B0nHyoE9TX4?=
 =?us-ascii?Q?PGP9/Yb0EV5LEsD9LGUZeynQjB5cMcbWjBcnoKz9W+UyojLrkgAwGXrgFwsI?=
 =?us-ascii?Q?VMFFskMQDGQrkTQlEQrYQITEjYqi1YXePONC1WumfcEcNGFX1HEvNZZS9QQl?=
 =?us-ascii?Q?qKvsvqF/bfC9MRxOttAbWjkDot7EqSvgz30jIOqDqSeDeHY6WE5HCoibfZQn?=
 =?us-ascii?Q?MP0zR/znvZW5k5J3EN1YDJgnzQlRDaFTJ7kIG5hEPIXNZDsLWUY2Nd4U5sKP?=
 =?us-ascii?Q?Guj5x10B9ktT6HrhrAiMjYSFj3Eel3PSJepDYYX+frJl9LTGgWFUujTyEsYy?=
 =?us-ascii?Q?Gi7UUvm54948hLAXPpMZna3Z69RjBHCp1nlY4kOvu6Fmme4Il0g3BNQLjTJy?=
 =?us-ascii?Q?y+L34pl/BbJ355q9NENM/bGAffdWgcwWKsok/aJBwYz6ZDuMA7QI+Rs/NBWz?=
 =?us-ascii?Q?uP15eJZWxlc8ITgnUwP05tY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5cc6706d-44b1-4cb4-1fe6-08db5763b013
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:49:47.1262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vTfRfFb3k4th62BXc7tRdJWH831OFXTqYHuxwjEicGjzzeq0U7YvrtxHVNPbZf/JkOT0lx1EhAY+mSzjfGx0mF/GaPZomFRjw23t/Csin5eGlPoHQW0DK8YemepIOb9l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5984
Message-ID-Hash: CLPHWBHUPF36CQ76XNWJTWT3SUING2I2
X-Message-ID-Hash: CLPHWBHUPF36CQ76XNWJTWT3SUING2I2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLPHWBHUPF36CQ76XNWJTWT3SUING2I2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-compress.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index d8715db5e415..cf3cab7a648f 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -602,12 +602,15 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 		return -ENOMEM;
 
 	if (rtd->dai_link->dynamic) {
+		int playback = !rtd->dai_link->capture_only;
+		int capture  = !rtd->dai_link->playback_only;
+
 		snprintf(new_name, sizeof(new_name), "(%s)",
 			rtd->dai_link->stream_name);
 
+
 		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, num,
-				rtd->dai_link->dpcm_playback,
-				rtd->dai_link->dpcm_capture, &be_pcm);
+				playback, capture, &be_pcm);
 		if (ret < 0) {
 			dev_err(rtd->card->dev,
 				"Compress ASoC: can't create compressed for %s: %d\n",
@@ -620,9 +623,9 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 
 		rtd->pcm = be_pcm;
 		rtd->fe_compr = 1;
-		if (rtd->dai_link->dpcm_playback)
+		if (playback)
 			be_pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
-		if (rtd->dai_link->dpcm_capture)
+		if (capture)
 			be_pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data = rtd;
 		memcpy(compr->ops, &soc_compr_dyn_ops, sizeof(soc_compr_dyn_ops));
 	} else {
-- 
2.25.1


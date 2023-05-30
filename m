Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 129997152A1
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 02:45:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37DD71DF;
	Tue, 30 May 2023 02:44:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37DD71DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685407532;
	bh=KRIbmISBNZHXWwz62uJWh7I3XKYM95beBle2mUWEEu0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bTXR+BS8fhLt2GXf5KnAGvKGDCsTT2RTS5ehd716fFHUn9kfe2+xadjHhNjpfjLHV
	 Y1ipfl1Acv8XRtYREgTICooXf6DRNyB7P8zJvlueymerKXB0G5DWUILHksKY3hK0Ek
	 rE7HF3rsh2YMz8OIDAduXL5xx6n1upf/bA4EDtkA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D7A0F8042F; Tue, 30 May 2023 02:44:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD9A0F8026A;
	Tue, 30 May 2023 02:44:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1368EF8042F; Tue, 30 May 2023 02:43:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B56C7F800DF
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 02:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B56C7F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Nb5FrQaH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPkmqm9hxYUIaup+oKrG2tNZk6TFbeWNhurx/GcUadzJKXbBJq+vViYoZ65NP8zE/OQPFbLrxeMh+6q5RIb9mvKdhn3+FDlPd4XLS13tE4ZFAcgH63Hj2VI0HdMXjx2+2Qp/6sIjjtf5qjty8QwO4bTfzsQUL/VQ7F0KYLkwR4UGWjJRgHRpzwJ9Bqlli3EZKLRReG6jCj1/SggCYAU1KMW/RQR9n7LWbNgYMIJafm5zvHf0qKxHfNTKxgTj9nEqK8a3A/84viEI7JPJ2rDkSFIZI4Le55msWzuyA8G8HawM08sJgyv7SXhEPkIIZjzmcZJygHaGemeeSZA3o6Ilcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/vMtts24kmUO8qOtZnZ83zfV8NA/iTghKmKnGmjTTo=;
 b=ia7GGz73e+Kfii9qPjF+3ZSU74zjNApf/HYV1kLOjgAGLS0Haffb19pGYtpP7ahB8NiEtrcacsr95/1JB2Lp2uGzBi5rJF0W9KV9qZ+MTwT+ufh1WnP4/jTMy3gHQvIoNvGxHMNxqlm+19cwojWEekFND871tgz2bUDMjQrVZ2s3IEYmUffDGUa7Lg2qhbzif6JioQUJQcbv5pTrSV5yvGTz6P992U1VPgyMWQJC31yPpKTwr/zWn+Ud8TpXEDDchJUNS65Ag8XLLMrSzi8xAGlYMZZECa5KPSqu1JrOwZKd1TVnkrKjTfDEWzqzVLV+tQd3sI9idNnQjUH8wciJUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/vMtts24kmUO8qOtZnZ83zfV8NA/iTghKmKnGmjTTo=;
 b=Nb5FrQaH0UB/mhI/ruG353FvtsHU+22TxCDGIicGjNINj6xHeCf3DoCt4uCBoEJYzqgSYOvCW4+YA80Go2wc9ONRUdLAVkR9n2Derfs7DiWulQr4cWdKxW/YNSaMpspgEvKCCKnvuRMaxVmUwRzXnGBKYwDh2Jc35kYwy2z/ZaY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11490.jpnprd01.prod.outlook.com (2603:1096:604:230::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 00:42:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 00:42:30 +0000
Message-ID: <871qiy1wgb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 07/21] ASoC: soc-pcm.c: cleanup normal connection loop
 at soc_get_playback_capture() part2
In-Reply-To: <87353e1ydb.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
	<87edn0lzix.wl-kuninori.morimoto.gx@renesas.com>
	<87353e1ydb.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 May 2023 00:42:29 +0000
X-ClientProxiedBy: TYCP286CA0327.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11490:EE_
X-MS-Office365-Filtering-Correlation-Id: f38161ab-dcdd-4dfc-7463-08db60a6bfa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fupiN53138MwSABBXlt9Ux1WfzI4jpfyb9AGa7iKoHOmTpMlufjyj2tVfQRCYgmnxEoNuTZ7n0YCIAmJ9rvBm0OcHAQRnVctzwOq3rDrCQ0smzhHydYYvrutldItHp3XqWsjzgMv+H1h7iTcGZ4LTYsQVzScLoaJGS/BUtqmOfH+IzyqcS2nPKEjMpk+9IN1rVNSHO/ZVj+BTyywO65eGmdj2LZ+Ow8Zzof+vxDXy9Ji8mWuNqHx7oMJL1ESeO6b6r7FKh0zB6QBRM0qSWfYHalJrUcFo7/5NQ9a/u8TBKo9Psslbo58TKOdk0Pg+uEzuXlIFTt7Z7GAsws5qRRfCAq6s0oHv+8KeX09NGZh5+PLh5PFb2zA2vsSXdELve+/cPLI6ItKBwm1tZRqVfOdSaxI+TbPTOJsdjhbHNGvG2vt9GU5JN8nAemI3bX9wmHW/1WJYMN3g4vLKhhiScQCmW0Ye+B8GyOHEBj+WCHaL1+/RjVpJN+pFgnMHpV7fjEIx313nNDgR+XGACq7FMvn2mjpB1Q6bN4dAe9JgVV+6Qj/Ql3FNtvkP2G/9nncmiXs1uTGhkBhCGvF29pE+yACfP29KK86BEtPw83ExJm5W943v+pdqjZlxZP3PxGFrRyJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(451199021)(186003)(2616005)(38350700002)(38100700002)(41300700001)(83380400001)(6506007)(6512007)(26005)(6486002)(52116002)(478600001)(110136005)(4326008)(66476007)(66946007)(66556008)(316002)(5660300002)(8676002)(8936002)(2906002)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FEiqUI1pko84eIi5zU6fshHWzR0jVcZDTXxriscGDWuZFSzsZsPP6UgpOVFv?=
 =?us-ascii?Q?z19+QNd0ZMstUd6AuTTw97BoMxI5Tu1b3Fzx+iAldUNHFwfAfK3CPBQ/8lx6?=
 =?us-ascii?Q?/nIXN6WtgNtPoCQLQcq1z1OdzYHA0xluuX74obX29IgsB0Ax+5is4kxzdkZu?=
 =?us-ascii?Q?l7RuqcT9IkYEiFXf5XOwWfhP+cGnUvVup4H11egcXVI7/I6garBdjlb5diBS?=
 =?us-ascii?Q?DlywKyPIs5lU9oHio7gNZq5Logg4s9jPfrawoSPXRWNJF0GTJ87LulJjpopH?=
 =?us-ascii?Q?XA+vcJMCCoGaVmVseQZ+mKhNCm/+g7ask4AYEvwclo8nUJ6wtvbJdW5UQMqD?=
 =?us-ascii?Q?ydwaigRLmWG5LK2VU2s+QF+Uc/NwgSGHnPdNncZKzw95s/Zws5OqcPVYRe3b?=
 =?us-ascii?Q?jgagv2uI93Z6dMFCfrHX/7hLEm7w18FBAbouY98TT5bYMi1LYEeq/l7784BP?=
 =?us-ascii?Q?n95/JGK2ZS5IPClC6UZgv+RN5jfdamqliFw6+E1EF9V9baCUj/FVjYqQRAz0?=
 =?us-ascii?Q?PQzT2Nn4t2NoZ+wNRpwFGyt6Mq1Wjf0JL75YrOhu4KpQUf5jbqXatvlUlEbS?=
 =?us-ascii?Q?QOWN86HaUjqnYZDW3mDVOQuHoLFzMxudmoLh2zropRnq8NM9/2obDma+eHY/?=
 =?us-ascii?Q?JXhFIM9BpwIF7LY2AJntXytW8AEt2D9zDWiYGjRUemZcXULxDhGSPP3oRquO?=
 =?us-ascii?Q?m0yVj2nLKqeecs1lzCeWA+LuhQ2SjyzppS5KtWMJ4KKvdKzTn9n1a/X3rZ/A?=
 =?us-ascii?Q?0nSRRAJ0+6GiHHbF5WjToYV9hkn0hfs21O+cx0qiHUXxb4YzMSJ6QrDqEV1V?=
 =?us-ascii?Q?g8MQnz2tnFvswMsHkJOBm/7kLGSbeUqdgNrabcTCerYYX6JMe7dRa8rfQJq0?=
 =?us-ascii?Q?9R51hfiFip+um8Ngg1oZPPE+6bmaUTnILCgc7IAEg7A7D3vj0FIvdm0lrqWZ?=
 =?us-ascii?Q?fPqGPX3OvSF1JaXhJ0fZGpuiBW3VYqcMNthXSHexjlygdZLKNLGm6+Y7ID4J?=
 =?us-ascii?Q?k6N0Bnj1v0epVKisUUoTdFdq+EqiHeMXCTgDMZpQ688FjW6WK+wS65w+K89i?=
 =?us-ascii?Q?EFIJMjSyBB0q4CwBhVKvldCtD3BJpZGrFb0luasKB9DwzDPmuAbFYXcgrsoC?=
 =?us-ascii?Q?d6G0A1SDGuuQSJgcKpIvaHxpUczKRszxf20MWhYe5aiBTI2gbCZxPHv8P8ZZ?=
 =?us-ascii?Q?/AY6sRrZd+MpqGIZ3uq+++sPFThVxpcM8FrnZRu5zBnCNxgr/Kj1YA42p5z1?=
 =?us-ascii?Q?buM46TffJYUKE5blwyrkeJOaqraTLCR4rAo4lZEKf0rSU84I+aDrGTkXQuyG?=
 =?us-ascii?Q?StCv0OTsaU6R3k8Yfbh7RPTjuuIXtke/pTVzXnid1PTh86DhFtr6eACOfPB5?=
 =?us-ascii?Q?FvMMIQPIFU1+H/99VXzGImVOauFLHyMsF3yMKiOyw2mwandpDQCHMjWuZwfB?=
 =?us-ascii?Q?LDSrvHkkuFKlselcj3pwz8TSbQDU6pY/jF4HxoagVFoQJbQqOpeAu+u80sti?=
 =?us-ascii?Q?usEmJT3ya9zloyuxZCLhtm10zmYGZ+qX2mqeUDwoTsAVixJCHea/zV2WzJy2?=
 =?us-ascii?Q?ZBcrheOoMt788WDVomMG/Q8WIwonS4Y1d8Zr3d/nagVw0MT8z0CDCcashcEg?=
 =?us-ascii?Q?0NRmWg4Z44RO3B+run4kuxk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f38161ab-dcdd-4dfc-7463-08db60a6bfa5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 00:42:30.0379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6RPdE+3YOi/MwP7C+M9egu+9s5n6yPJDhPC5xkZS8nSQ3rCI1VtBdZr0AiNx5XrnNIYwIra2h6rgSSrqSQr4dQ9dVq0px4qpegDTVvAndTHOBkn9+vGmAozdXwaKRSWK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11490
Message-ID-Hash: 7SW2NCI3Z7V4VFBR57FUQH6UZDWUEHLK
X-Message-ID-Hash: 7SW2NCI3Z7V4VFBR57FUQH6UZDWUEHLK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7SW2NCI3Z7V4VFBR57FUQH6UZDWUEHLK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, again

> > @@ -2795,11 +2795,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
> >  			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
> >  
> >  		for_each_rtd_codec_dais(rtd, i, codec_dai) {
> > -			if (dai_link->num_cpus == 1) {
> > -				cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > -			} else if (dai_link->num_cpus == dai_link->num_codecs) {
> > -				cpu_dai = asoc_rtd_to_cpu(rtd, i);
> > -			}
> > +			cpu_dai = asoc_rtd_to_cpu(rtd, i);
> 
> Grr
> I noticed that this patch is also wrong.
> It doesn't care CPU:Codec = 1:N case.
> Need v4 patch

The playable/capturable calculation are similar operation,
thus I had been thinking that it is possible to merge.
But there are many patterns and has difference, moreover complex
(therefor we noticed that lack of DPCM BE Codec check,
but not sure it is lack or intentional).

It seems that my posted patch-set has a high possibility to
contain some new bugs which is difficult to notice.

I'm still thinking that we can merge it and have more simple
and understandable code, but I'm starting to think that it
should more caution.

So, I will post first few small cleanup patches only instead
of v4 patch-set for this time.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

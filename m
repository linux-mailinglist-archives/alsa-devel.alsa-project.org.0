Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B517079CB
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:48:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06814828;
	Thu, 18 May 2023 07:48:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06814828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684388932;
	bh=0XrP3QiNzZDlqWLURlTP/Qv4qUECjcZtmMcab3nr22c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dpyIs3yJf8qucihQf6YhhCTBf01SvskSjHbEjMoUSELjnaSrvDZZ3Yl0v5rX3uSIR
	 cl3Dx1BVNhubhaXl0hIPk81AXZ3GKFtkdzmuKHFw25Mz+rg60mzHFPEkfbhZN/kLhV
	 IrHeAF/qpT67Ahxv1EQmJK4pFjiuhpKsK1//O+aA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 326C9F80587; Thu, 18 May 2023 07:47:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03692F80272;
	Thu, 18 May 2023 07:47:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEEBEF80567; Thu, 18 May 2023 07:47:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3393FF8055A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3393FF8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Ohd3zssM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHDQU5CDUtuOKMRSIiJ6vtiKGiyMKiY4N8b2xdV5Io3alFjldhBO+TuUak6qVXU9iTgB/S8jUR1FJfqvuQBRyYCS2NuuQweGTFQWGtU44CvwqQuSJBGqvFTZWFu4DLWXmxvqtuGKaIwdJ4o83cpGI+WqhQhVhreiG4us4EhwIuWT73M+ewoSMKpmRyB3mqDVApXmLn7gJLkw7B/txuNJk4unZym4FEjfu4hi3dtxgF95aXHCHRoocyG0qoel9X26TcdVm3GGxlimx/DQNL2UOhgCtXSbEL+ZK1Cx965pY0LLXID8Kp9WZ50no7cdUwZTLvBgHfgaO/aXVuZQSI6lCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbC9J7u9asaBZu+6PuDp+82D9GXFg9a1UH4ql53Qz+8=;
 b=kT/sYJxZDfp9JaA06fHNonfEQPJlyoOGJTw/RqbqWSnhfwG45Lvmwp67ccoy3p816fEGXPAmqM2UYXKIUoQkcvffnawhyFZbJgKdBKBOqqnF0+JCwLVQ5aFqz5TJPLdz/mN+qkyVS6BIAQUIT9mRCqvEBCgQYLLm5faU1GZu3XTGxWc0QcjJYx7++texBp+SLGBaD/kJYZbj0lmsTWH68TZZj/KY+QDwa/lLTBD/vnF9CoBWzYVUIef8J8b+qaaKyZwVj90DJEr+pCLzV3DPjkQFiOqgnPSzDZWxbi5yOa4EXz6Hrfh36LWIQsaEZH69oNAo6eDc7QtOPYXexReJEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbC9J7u9asaBZu+6PuDp+82D9GXFg9a1UH4ql53Qz+8=;
 b=Ohd3zssMFjYnmiEhyg7QqKwwSxJF1gU03Q82Mksq5kC2e1p45dae20Cs2JcXhQumgTHd0Je4v495CrEuWz0NEtrZNmCvRU4jig4KQ47OJTTJZQgxNTAbq3NXdVm1Uqhvaw8OK6qQkVuoAvam2lE3/wv1qibMJSnogZySCVsVoPE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5591.jpnprd01.prod.outlook.com (2603:1096:604:b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 05:46:57 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:46:57 +0000
Message-ID: <87y1lmp4xb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/20] ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
 error
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:46:57 +0000
X-ClientProxiedBy: TY2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:404:f6::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f88357f-58fb-4aff-4a80-08db57634af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YbSmi1qfMmIP3NHpx72lj1I2hbCRhVMXNNyODKgUz4GgxkuELJAkTp5GqMNoj/NRt4FNfQpE6eKiEVtqIjK4zwASIjyF+uQcI2Pn7pHuAdWhlMwxPq/z6EOucINa9zSC2CYPzXVcaU88vz6XLr1ftfDSDE7JhHm0IdIyfpoGXhYLLe/fsI+4llCL0K6tjoMD62izG3QTMMWwhZlPEX0PRx8a/aAY3tD5GgBxnenQvmkhZVza9OGmh8+gL3AjJJj+xT43/iQmZzi6mO9lApcjbNoqZl2mxG6abKk+4EXFbJp7aQaGr+F/8yw/g7/FECrNIomvGJus1poPRCcVfnWFLG7aAASfvx+n0wlBQpwjmWr5PFgFSWavK6ZH3tDqGLnz/nop2iaA87UpeeD8anLa1bOVeWjCjHY558SbUm6CVrsjwP9pJAd/nVEjf2hyEjHJcOZJtxBT9hMdkjiPoFX6mla4yh2oPq8YKA9zvdfKFiPTAjsn3G2H63tJIrSd2rakoJNQQYiTvaKXEz3oMGXFoi1ZGB6f8wCG1Ip1grwOEmp+lSDKm19Ywi/x0y0hpyvfqwxQIDmkl/yvxHej1FZ18sJY49dpk9pFInIg+b8jblgtetdLxOsWFCzedfyZ7D4z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(316002)(4326008)(66946007)(66556008)(478600001)(66476007)(52116002)(110136005)(86362001)(36756003)(83380400001)(6506007)(26005)(6512007)(186003)(2616005)(41300700001)(6486002)(5660300002)(8676002)(8936002)(2906002)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1hku1ie4eqdRbXq71dS8wP5jBeMYC7+wZ+eFfAqWR+GaERpWjhtw7sk0gWHS?=
 =?us-ascii?Q?suNYlLaDNwPeuj64hV7dYYEsPJK6k6o15ioqYmhEA5koUozMndJqhWk3qc2J?=
 =?us-ascii?Q?b2dXoDdGSJkHeineDM1EDnJo5TAzUXFdVA96Ruxtstt3hxnJYja7wDAKw/aq?=
 =?us-ascii?Q?C++6aw9hWeHDyARyXZHoipKrzQuwZv+urPdow+NeV6EII+/UCmm3G3hlzhrV?=
 =?us-ascii?Q?+hjBbLVSgRv1IP/Dh56qTb953QofKujKAQkdvqKA6cQnh2S3TghORMA4fCMP?=
 =?us-ascii?Q?y1CKo2K2mgD1p0wPGGV0dhkXrfbIjPz9esBsrws2Qp3b1fkzublDKPrcf4B7?=
 =?us-ascii?Q?XjGex7akEJu8bAwsljiRt804JmbGIWdhkDBEeHKyyomLUH26Kd0OPsKXPfhK?=
 =?us-ascii?Q?xR6PZOiJ+ngxYmZ4omWAK7RkRroUIFLyEhi/hY/lZ1g95XZrgaQOyJ/hfFGO?=
 =?us-ascii?Q?VulTUav8cjEpvQ7xPNdwQIcWG7gTZZhdok3NZdisQtysfgruar5bOP2sNrHH?=
 =?us-ascii?Q?2A/8o2i+qs4DhPwGvJqTNRegRNnZFfxjTjN4eoTw6OzvCUpkFE+C4Dgv6TeA?=
 =?us-ascii?Q?q/B1kkbYSm/35sZ12LeUZdJIWVmXiO571WMmJQQFH0hygLVS2ypNc2jw6QPC?=
 =?us-ascii?Q?4wN5i2oX/viogq5S1Jhl97UamDZmfoUKjuZAiOOdmkrq0fP9byxs57hXsfeA?=
 =?us-ascii?Q?VjusslG1kCpEXiU0bK/6kX+k+WPpBZ/4RL2SRW1DX4pzVhKJR4AGNamlqSKT?=
 =?us-ascii?Q?MMTT/slhDPzxuiczIfKxug3VHDjOKSuL0Ev2zKoSLeKLLNpwN8eeWehnwREz?=
 =?us-ascii?Q?UBQ+s8y6luPtfZC8rlsPLbhgh6yj5aF+Zr0wOBTyybGY2QYhED1xgAAHBS/D?=
 =?us-ascii?Q?n6D8cdKU6OfsfvlNbwEUa1ZPCv+MSW8+TnkrpRMywsBd5rNneuP9cL5RniQX?=
 =?us-ascii?Q?+xl7RFfAmBDTUwQ1FHzBUslmH/fFg9ufGNPA5bmmac8+89M890fS1ZPgb1QO?=
 =?us-ascii?Q?CXo00u/MQ+7xskLQ3IicOVhZlDWC+TPdgXjx6E8jGzPzx7cohYphqTURmtNL?=
 =?us-ascii?Q?/KVPTpkmBPdV+yQ/UaPnRcl/JgmHUkzZnwnvt4vCAO8o5dHdXx/Mn7IUSBjM?=
 =?us-ascii?Q?xoazBhodWMPmHPKnQAFfMueF/3hKNkPsQgaZNyR9DPCAO+yi+nsK/uBexaW9?=
 =?us-ascii?Q?314M9s4Hnzc1Xhp9u8IAYYVIkSXmIQvd/k1qDGSZd1znFROV9Q7AgyXrLF4E?=
 =?us-ascii?Q?p+2W5oWpJ7+KGRRskaigQVu+oan6H9u9NaIkLKoSCNIaNPdap4K/gIKwjTuq?=
 =?us-ascii?Q?8Rt/F/apEWkPkSkwPVzdiFFGRnaa0PoEZYGFW/dNnn87ABuqpQeENgXSohNN?=
 =?us-ascii?Q?5UBlhlXRZkwCsLA9xBKUkEde4VqxZwClfOLlYX8LwIpP8LmZY0eiviPZ4hNU?=
 =?us-ascii?Q?VccTlVZCDD5ZVB/zGqQ+4PkQdhGYJhZpcokpTXH+meBge7iLxpDHRnHqOXwf?=
 =?us-ascii?Q?qaYj8MNOGrXJ/eAIepoOHyQDs0FhL0wr3xhKrSu5/kl9aMhWGQcQR7zG6Gef?=
 =?us-ascii?Q?JoBudf8c08vQAhBTGHnaMBkWVLAcgFaz/6I0o1kOhc2zqUYrwRa7U+0P78dj?=
 =?us-ascii?Q?Gixh8cm2Bm9oQVJxziICrqc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0f88357f-58fb-4aff-4a80-08db57634af3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:46:57.4914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UqT92bdgjlrsE4txBQbD4lS+XzQ+AewgA0WSH1T3WaEoHf4sojuvw57YWJ7271XrC9KegEG3U7UxgKTD7jniFHTyoyDGgITiR4vC6lnL72V5zr3ApUrv+ef4PWAXWQ77
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5591
Message-ID-Hash: MZWKUCOGUV34YDSPITK6DVPGI34L2KIN
X-Message-ID-Hash: MZWKUCOGUV34YDSPITK6DVPGI34L2KIN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MZWKUCOGUV34YDSPITK6DVPGI34L2KIN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) checks dai_link status, and indicate error
if it was not matching (B).

(A)	static int soc_get_playback_capture(...)
	{
		...
 ^		if (dai_link->dynamic && dai_link->num_cpus > 1) {
 |			dev_err(rtd->dev,
(B)				"DPCM doesn't support Multi CPU for Front-Ends yet\n");
 |			return -EINVAL;
 v		}
		...
	}

We can use 100 char for 1 line today. This patch cleanup error code line.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index db3fbe1af2ce..47da3be0ff46 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2736,8 +2736,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 	int i;
 
 	if (dai_link->dynamic && dai_link->num_cpus > 1) {
-		dev_err(rtd->dev,
-			"DPCM doesn't support Multi CPU for Front-Ends yet\n");
+		dev_err(rtd->dev, "DPCM doesn't support Multi CPU for Front-Ends yet\n");
 		return -EINVAL;
 	}
 
-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF40C76A4D0
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 01:26:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5820D836;
	Tue,  1 Aug 2023 01:25:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5820D836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690845964;
	bh=I0RwR6NNWi5MWeExnKbKdH9L6C83ps6egXvatYsP9ks=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZgB5HLREweCHMIcT0LpS9I0fgeXdpilmxggZL8yadZOAT7y+dtdGMc8GvTl7G298p
	 6tVlc84fZZCEvfzIJxm7EPgyPzxIKCRNOPkzA5t1Ym/2WSB3mLHoS7vCmVHF3oMcam
	 wgES0ymHsGtv2rFKukDmh65RaJ+OeA0V7x/ezboA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52229F8055B; Tue,  1 Aug 2023 01:24:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE791F80544;
	Tue,  1 Aug 2023 01:24:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2864F80549; Tue,  1 Aug 2023 01:24:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9563FF80087
	for <alsa-devel@alsa-project.org>; Tue,  1 Aug 2023 01:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9563FF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=nt1Jo3QN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYIa+vJ41caiSwQSurl5JFR8BcCIJakJmBVlfu9Zs387vNKXEewTqtpzGJ/kwetu/pzwUxxlL6T9aN8bBial/ljwqsEYuEblEgUrAp69hRohJ/3dfHq5cT3JgEg8VSu8zNcsG9potTimcuMyvbfmch1YLTNF1iMG6wb23UG+xpN0pwSrL3oBrERdPW1rVS3u6v9XqA570igsFyn6e6Q1f1O9lr4WHHoyAph6kaGWAPrV4uI3bpYY8OP78n0CqxhSyXCrl1Oy8xZtkajTZ7Jz984X9RLjQpkcxiLxLVVtDN3Q9g/82YjW4lRnvv6Y6QHHd+JMvewN4w5jUexAXnda5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9nwdGem76tD3INMmUSSpH+6lYg7HJ3nGsyIE6xDAhY=;
 b=W2j9jg4oH03462zoKI+PsP8MzjMRPvZE7LRTCzwq855Ia5dxMvzqLp/GLGShyNwPDzvxBhKu8n6YHGnxEY/EHf0f3vXiSvBSUGEwQteh/DGldv8AqXBRAOEmvsqnGFa/n7Bf9+HVNq53Z2ymox4VmZX3Ap7MeB7g5Z5DRpbdqLUU+5OoPiaK1wvTj7POeHg74S3g6/ko3bqRIK7tdi7GljZ5ltHNXHb6FUozdTbwd8BXLGjkKrmmEaABB8mwRNcgSNlYP80pc/YwHFjwzGvFdGXc6P8Y09KYJg2y0zWFH7i+1jlC4gDeR/824tHQd7AY+sW/WhhIUiOSdpHaw8OdjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9nwdGem76tD3INMmUSSpH+6lYg7HJ3nGsyIE6xDAhY=;
 b=nt1Jo3QNhLcUVK07Eb41tayPtplrlAZGFpDKKPOgcDspEH9ltoITDb7Pq8Qw3qFmCT/tQfwVWRPecar6YrKqP7nwS/9/9pE7zM/254gE64fiixHxmhoZd6NswdA9xrnZKhiMyY0Hrb68xJVdcZQsNAiakisJ5QuE4+aSwKqjoN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB9967.jpnprd01.prod.outlook.com (2603:1096:400:1aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Mon, 31 Jul
 2023 23:24:15 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 23:24:15 +0000
Message-ID: <87tttjpsv5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: codecs/hda.c: use devm_snd_soc_register_dai()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 31 Jul 2023 23:24:15 +0000
X-ClientProxiedBy: TY2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:404:42::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB9967:EE_
X-MS-Office365-Filtering-Correlation-Id: 6242a090-087a-4cfe-4bde-08db921d4173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iXDBdIZ9PBsIcIZlOcRlq4SnBcpNRQqr+UfdBuF8/TuA4TJfFfzEbZeReM5/+aWiw7AvBPLqO1sLJDSJpr6BsPvKsXPABLSpHR+le70+l+dz3wzc0+TVsh2YMIEpafeXn4HuuhkF5NYUSNZAmCZfei3AXw3g/Mt2/S4B33HUXxklU9iUpU7PwbXhyaNUluHeD/ukkHnx2WqG0Rfzdh2w4QdUZYTey+7A6rBwqHSorqIrovJe3JNs3ILFubdIOZPC2YVEIEaIAFM+8kyBkT7Ccx8IoiHoy6ceCdQBtGGEJD6A1UICbCIZ8WVf6wxUlZEtgb1L5K4RivdzNu4d4wgyQBWQNcQ+lIOHb3eKm/7/i0MYokVKDqeaSk37PoFjlIXEaDZa1r5uJtgnklP6YQLAwETbVYlouAK+gHOuxtbEz8nf8ouFeog2s/yy78gNEz7RL3pJZ35T9S9DMh5Wt8i3w0nbi9DgU+hbH2xEZioVTrElp27mMjbUWYsE5+IoLYhjkC8xOFV1Ka5CKjFbkIDIOIZ4xmD/OV2nsgxAXqZWxyO1Aa+ruIUGtG9X6Yd9gMcqmW1FrMT8q91+9tsW5qRTK/KN678pfEnSz693z4XsOCI1tNnL/ar0sv4ozzxoOuff
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199021)(5660300002)(66946007)(66476007)(66556008)(2906002)(4326008)(316002)(110136005)(41300700001)(2616005)(478600001)(52116002)(6486002)(8936002)(26005)(8676002)(6506007)(186003)(83380400001)(38100700002)(38350700002)(6512007)(36756003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H1T3q5u476C9U0WkC4tQZeO/V/DUtTA/Ir4b6l74ktk5JwCZdIQZwRBLM4n1?=
 =?us-ascii?Q?v2l4N6n6oMtI5GhPd6z21vhtbPaPT9W2kS8djhYsMnr4EJQkuu/FjFASHiGX?=
 =?us-ascii?Q?dpP0v/kh1Dywvn3eIIcypX7sQjw34E/sDBNR1swyzFNbyZGTbwwzKiP5GP7u?=
 =?us-ascii?Q?c3gi3Te95TBg7NShyx7p2aRfRn4GNakc2fQMsLITUeqf1HOG8i2uQnaN5JUL?=
 =?us-ascii?Q?mSXKL7v4ZY0RmRuYrurLXLFi+Wva2OP7teIcU6zg4q7Q9ED3PC+HAZLMb9vn?=
 =?us-ascii?Q?LcN6pc2/jRhR/b+aHlDCpOsqrPt0sxKHHeUIcGt+Dmcai4GTp1K23dQNMTca?=
 =?us-ascii?Q?9y9XVbX5pZOTeCzCn8C6p2ZodqNjvo+R5zRoFrlQR++hDHr0MYTYDscY+/HP?=
 =?us-ascii?Q?osSnxD2p8Z6ElYzDZ1fztYsqBinkYwmO0oQav/IrB1ChFlklKEpyiOXp6l2K?=
 =?us-ascii?Q?bCNbfzTGnqhLG7Y8QcU0A4/zGbAbAizyTxJBKiCP2ob0ZaMA2nqguf4POSxC?=
 =?us-ascii?Q?MWZ5TIRiGcoxoBvgxj5RoUwC0Yd/JzXsmt0sOkVEf2Y8spJi95Wb+hNzmw4P?=
 =?us-ascii?Q?vuBsqymMQaqqXoCSLPoe93donCT0FIo8plvzEuxKhNq1sWx+scPeFaE8+P4o?=
 =?us-ascii?Q?DAecmxbuu5vrpSDP71uXN37aqBqFiOklHjDfBy/9JQI3c1lXISXmZFzNPOuy?=
 =?us-ascii?Q?ktTCiBUcRmr/dtWt2PqKF7DoDeUFz+Le/9LCwE97A+x62sNlI9cHYhdbv+Av?=
 =?us-ascii?Q?aC69nh2llRol+1P32sZJOulCkXk1MBSDTFuVUNfWIMNWeCknbKqxwdV6LdJS?=
 =?us-ascii?Q?CbFvMQXl20Z1HYb4VHqtcvq9/G4cgERs5sELyCEftJJvxeh/1YQ5LRJJjf0T?=
 =?us-ascii?Q?MlYcpoZrDJDw7MHUf5OBTHT07X0Q4AH0bv/OqQ3pez/eJt19VD/pfyOA18FJ?=
 =?us-ascii?Q?nlvIyKonifrHqqaPnFLuRF38ADjwRCm62VWR0mfYyHC0S3b3QADkt/hv4UvV?=
 =?us-ascii?Q?FOTRzfmzGatKfIl2o9HUDofzphUnGFucJ+ywK2qj++R3nqmk/N+GPbRqAtt6?=
 =?us-ascii?Q?Oy2UJZZsyV18e117pRg/UWKAgXfqyn6MlKrW4JnZzY0nzHALE0s7ri7kdmBC?=
 =?us-ascii?Q?Zev/Q2fTXSMPHWVeYfgtovIZyMYhXdLRd13/yoh7X7C8YNi0fS9DmUGRBTEf?=
 =?us-ascii?Q?3E0EzUQkv3UYChU5pbGu9oYPBe143oBN9OHsElIbrNAZkW150QtfeL9shsRS?=
 =?us-ascii?Q?iKWybtc0JUq2nvehjIo1Srkm+k2dFQBFrCeHi7yA34GbPYioWgta/L8s+eug?=
 =?us-ascii?Q?PA1+jbrTmEeM1bonDELck84yOwl4JvNohMCdK855uxJNG4qDFTyj6iQcRaI9?=
 =?us-ascii?Q?p39jPWN8Naw07FBhVCNt2zwj4ysEePwSSidooTqDHhGHop1Al5E4AfF5T1UC?=
 =?us-ascii?Q?2TbaJzQMsZGi5cbjh8BBpZmalAsiEn7ZhLLNU7oKVYhrHgDkdbPQ8NOLqUGH?=
 =?us-ascii?Q?iYnDteCrZAZH+lC9NZL70fEq2fMrT7lhyHoHAa+F07Jg7HYU1z2Xws3UjaOI?=
 =?us-ascii?Q?EFVkT+OC3Q9o22WOIFg3l9jNC17hPnA3Dg0WCaQDFah+XkcjDekHabmKL3Zz?=
 =?us-ascii?Q?eL2ZsZmmXnUROrwUMkGRWTQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6242a090-087a-4cfe-4bde-08db921d4173
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 23:24:15.3782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hVimU1/hcuOprKkdF0FtOt+N++4VLdKOYEpjSL5BunHJbptN4WWW0l+Bf065KdeM+D2MZiyAYWxoMgTP+H78OFAK3FaIavp/p2QpXbrKQ9s6yaA8JKgWznz4qisJXs+C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9967
Message-ID-Hash: FDIQE3UAPSE2F53VRRQLVVXHBF4DNBIW
X-Message-ID-Hash: FDIQE3UAPSE2F53VRRQLVVXHBF4DNBIW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FDIQE3UAPSE2F53VRRQLVVXHBF4DNBIW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It is still using snd_soc_{un}register_dai() manually.
Let's use devm_snd_soc_register_dai().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/hda.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index d57b043d6bfe..551bd0cbfc44 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -99,7 +99,7 @@ static int hda_codec_register_dais(struct hda_codec *codec, struct snd_soc_compo
 	list_for_each_entry(pcm, &codec->pcm_list_head, list) {
 		struct snd_soc_dai *dai;
 
-		dai = snd_soc_register_dai(component, drvs, false);
+		dai = devm_snd_soc_register_dai(component->dev, component, drvs, false);
 		if (!dai) {
 			dev_err(component->dev, "register dai for %s failed\n", pcm->name);
 			return -EINVAL;
@@ -108,7 +108,6 @@ static int hda_codec_register_dais(struct hda_codec *codec, struct snd_soc_compo
 		ret = snd_soc_dapm_new_dai_widgets(dapm, dai);
 		if (ret < 0) {
 			dev_err(component->dev, "create widgets failed: %d\n", ret);
-			snd_soc_unregister_dai(dai);
 			return ret;
 		}
 
@@ -135,7 +134,6 @@ static void hda_codec_unregister_dais(struct hda_codec *codec,
 			for_each_pcm_streams(stream)
 				snd_soc_dapm_free_widget(snd_soc_dai_get_widget(dai, stream));
 
-			snd_soc_unregister_dai(dai);
 			break;
 		}
 	}
-- 
2.25.1


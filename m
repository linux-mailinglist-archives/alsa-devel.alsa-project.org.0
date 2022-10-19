Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 371ED60372D
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 02:38:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFF8C1FCF;
	Wed, 19 Oct 2022 02:37:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFF8C1FCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666139885;
	bh=wkT7vfErJJWpsTviw+cbKjtO5uVl5+jnPpuDbSK6gB8=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oAE1C6hf6hJLmKbc+KM+MgGLCfCYHlyTVeTQtTbC7I53iB/UtwTq5r3j8EV7MJ6Er
	 np75nEYM+HOHLq0CX9vyPUBfBbM4G+32MaVoNPCG09kWkIL+PA0gZrtSnjD5FtN8te
	 zaNWKwD36ebrpbwY/M7y/Oer9zn4nn0JILLb0R1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 439FCF804BD;
	Wed, 19 Oct 2022 02:36:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB21AF804BD; Wed, 19 Oct 2022 02:36:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7891F80567
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 02:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7891F80567
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="frFd5VkJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZAm4HXrHv+pd0cprS/JtS69YYvxbFVncsTLQyQnybP+Xj9YjMd8o0PW5LaySXeeZilskYQKyXAOQTzNRyJ2HQ73YFbGJec/ejAQZYvtusZhzz9lqYEtNJrJuemnVA0UBKQmDGxhwJiXoBmniVEkdkupecpKDkrAnpGLhUPX5mtOzKyItiz2av24EV0QvmgvLuLyr3xuZN+IZLOnnc2rozXn09MA0XYXWsshF2T36gq5CARQLhOH7rDLG6XXUzgzGzAHYAjC2GD7h3MEal3M1i0a08LvtMK348GdwWtnn29xbiAVGBixzhJBjWGZwa+uXWh/6FkJTjnUqF3ULVL+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6BjvMMYbeznEwmDLvJJUjpp7ttpBcP0nkK3R3c7j0I=;
 b=VSrUxRZLGkba6Alj/eOWFfsm8iJD0voXbgOPh80P028HkzV1rGpfjcnP2qT8FfN6eBSKHHbYjp3iwcGL/qN2qpJef1WzMG4+6IgzCDCTNyJYy4gTw5MittkgXkvMSkj3FRSGHoXucck5nbNb7tCekSGI2ucm9XlWYox/wH9wCKxD5ll4hC8PzSapmeCUFA8CfmKU1iTjgo0TeQ2VnnLtZlRCHudUQt/97wH/TG5BOBNuzKNvei0v379yR7oBTZeBImwpGdb+h6nzPoVRF7PgnCr5mq89BMHOPKlE7id7V3w53PB3U7qGCOzo83io1k92oCP7Ai+WUD5m0qOrRCwtzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6BjvMMYbeznEwmDLvJJUjpp7ttpBcP0nkK3R3c7j0I=;
 b=frFd5VkJXLDOBsWjOdqWYyQvXOUKYGT2gkvVuQ4c4I+Z0+iKYoY3+OpIr2+kONDsQ5RT1YSGHhkOza+jhjczx5c3ogMMX4OVwLO6ooaNRaL2+YAPVwqJLCLe1s2XVeGunBHlLIMMS7GkjP7T2IAaO3O/nSb5zk26JDt4I5vmWj4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB9919.jpnprd01.prod.outlook.com (2603:1096:400:22d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 00:36:31 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf%5]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 00:36:30 +0000
Message-ID: <874jw0tzsh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 05/11] ASoC: soc-dapm.c: cleanup dapm_widget_set_power()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Oct 2022 00:36:30 +0000
X-ClientProxiedBy: TYCP286CA0052.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB9919:EE_
X-MS-Office365-Filtering-Correlation-Id: 21d9c8d6-17d2-4244-3885-08dab169f781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bOgUYndrRBuNYE/xs54Dgi6BXYQebLFUAvF80RqBSweFcV2lTrm3aRDI9H6UDpeEzQJy26JBmrwYZgCqz3UVVknRbPNh7A8t2+b2rMAS4qobImmJuIS8hWDAtgnp9P+38j5dpVnJ20BezWwXz6KzF6QLCnPQ3MCjofJqTAajcSlFQ8M3XpZ02iYoLacXACsT+9ttLcABZy7NWeLoiWYaqFJzKEmqbUW+KeMcyhE/Qm7Bqs2TNobSjG4kHGO0mzgGwPqSj0ZSz8XjS+jfsxTTD1yjsCOOPLxryS6rjZmwkChA9Qtq16qgBzA5LC1k+A/HBFthqEeCc3Obw57YXsWOmM1eOkD4KG9lxXKMo/lhzXPm0u1cCW5GBcwaCi2nUhpaowdxL3wzOGBEJmRQapwuERWmUfxEstY7KdHyD3SbkzUKkhi1LxSAdMssHzknQvw7+fU2zpao/J9kI4Xkrzqt7kaq26ftWQs2GmTTuVu2m02R35MIUY8fvlrf9JY8SvjIPOIeALmt9YNbsfNkmyoAFKYP17DfM/igPtmgncCezipuVqbZKne0ggaTaQYajyu/RYvPv2Xfp43xmHGL79Tu5pZffQSQjrzbMUh2j99LUjD6Zl+UsNEVoqLmlnjGAr7CovwF3/ZymHOYUSJRNENOJCGuciNmWN1VWYy2EduEepqefla222J1s16m+qoTREzHN5G5JpooKm1u44+TwfgBcwdd5B1xjZyySgeT8vgtJlcRR2pSdOAexkcKfQMC3guktFQdtnN167kji5Ly/UyWgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199015)(83380400001)(2906002)(86362001)(2616005)(186003)(8936002)(66946007)(38100700002)(38350700002)(5660300002)(41300700001)(66556008)(4326008)(8676002)(66476007)(6916009)(316002)(26005)(36756003)(6512007)(52116002)(6506007)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?giSBO0VrHgQHha4Uivejwl+wnlQ5j0TltSKIJBpC0UooersJUK9xZ5U+H2ua?=
 =?us-ascii?Q?Q2mol8cfqyUvDzrT5hW7l7W4iQ3kUcrejgFx5Ap7+d2JAUHwjMFiQ4dZbjht?=
 =?us-ascii?Q?Rw2NYFqT+oUPPImoZML7zTrb2zPYW6vS9RbYiNXAA628f2cnh4Iu30DVqYNJ?=
 =?us-ascii?Q?dWDT9bf8ArdJu5c0FF0m7kfBQjSliUwPT5ajq5AgISHXUg/wU0gpqSsVJ4Wz?=
 =?us-ascii?Q?Y6LDxzn8cNadV63rHZS/GrXmIKoKa9Ey619E+B8NTwI/swZOi2taGwDNMxMQ?=
 =?us-ascii?Q?cdkueTLzdResjS/EjoTZB8HC95vFnpDFHv1xshiELLIZ87QgsCPVPyPcMlfo?=
 =?us-ascii?Q?Xpd2neNsYka773I+aIFZg5LT5NzAji/nvc52RUwuRo9Vgr8tDBPYNJL5Uy5s?=
 =?us-ascii?Q?LL7dt/SaDKqWQzGlS/My674bV91ICYOzIaoqfDz+KNw4ZYyRlbeHhO9KptBs?=
 =?us-ascii?Q?b6W+cS52uNErAosIu19HNxB/P/66bIumC7R1LAK9X7CHgigRjSbQffcjf7jW?=
 =?us-ascii?Q?jn5tdIjs2yjKP7KZyQqjxUCQHWVFTX6wr2y+DBAk8+18BgWxPCitU+iGUnB1?=
 =?us-ascii?Q?/zFlY91qfortBoHuk5cNzjeA2xhODS34xs3UYJ5HCwbYbNqNN4orblRZ7O9G?=
 =?us-ascii?Q?o3N+oZa2xTTa29l5yv0C27Qq2/JMsP4OZh83J7gTCid4bEQCvKJIqVLqu8gN?=
 =?us-ascii?Q?jmqkSlD2bSXD13IVMKmMf4FAw2tSeVGbfoYsfl65RfRsGowzT5SFgoPinfci?=
 =?us-ascii?Q?9NEHEGds4HPkWaUjJ1gJZF3Zzf9PZyfztjTa2hBjhuet2LRSQco2ybhkM9qM?=
 =?us-ascii?Q?OaatQgiPmkYwj7zrfbeSMk1/4SVKrbXtWLHdS1BP5VvPRmbtwTuhd/2mWYO/?=
 =?us-ascii?Q?+iVVCVvYeqh+28heYQcVlRsk82LYDqd17w3EOJfrW8rXnpzjRyhj0Hx4h4NV?=
 =?us-ascii?Q?0p6Rs66r9X8VCv+AHiSaWb+xCW8rkoTq8r3HrA2HcS/sQ1iwtg+gI7DgJniV?=
 =?us-ascii?Q?P6jDerWZprcY02I42x0now0+7CA+Eha9v0MUybt9ySw+X8/lRCLT+aM0D89G?=
 =?us-ascii?Q?JEm70hOKlWNAhL9KG3MOm5nllrd+0AS88gqFm64Uh72tfZK/jXEvRmZyEqOJ?=
 =?us-ascii?Q?3nH6eLHjmBZepLXHCOam3G0K5fUKugRWiyK1bUuAnl/+A7UY3+FpG9raNFUC?=
 =?us-ascii?Q?dB7N7LD99PC+vjklSwWV9K+auFP+2b+csE12evS0juWlFAS1nnMVUie6IrCm?=
 =?us-ascii?Q?Vn3IaSlXVibTqdO9TafthJyyCiBgfpGRJflfOlkOfW1kbtqcdkEbh5/wgqj9?=
 =?us-ascii?Q?CXWhMOBsW1rDiyW3WG+2pXY5j/LtiLhydpsRx19ut+TqlFbUjytDsrABi3VI?=
 =?us-ascii?Q?4s6u/VtXGM1FL1DAzZfvbqs4D/Q2h0F9Yo06gfpnOn5vgmaeQKvBxzfsV9JS?=
 =?us-ascii?Q?yVWrMFk5kOia7j/QKj29h3yZQ3CMsiKs4+n8faeh/5gaYENbg1VH7E6+RGxj?=
 =?us-ascii?Q?bPRgMl4FZEa7bDuXEJf3AStoPmwKcc21sWrPS0Vq+jPyZ6JmvLvQxpVyCPFV?=
 =?us-ascii?Q?glDcG9J97tkd6LLeM42TKtbDLbJ5H33Wp/zPeS6If2YlsSQFBlgCbV13IF2V?=
 =?us-ascii?Q?mtgtElltTaoZ82fgI6gNCyM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21d9c8d6-17d2-4244-3885-08dab169f781
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 00:36:30.9094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8y7udVfTdO27bLeJ3+nI45AoH5LgHgy9IsGu/FdLji5bFKQsNKU3kDBTxMlrBda1SqvZOs7VvEd6GFGwILfIM8+xfDg0ar25oJSuEnp+EE1/6WpaKu/2ex4j2yfAvn9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9919
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

This patch cleanup dapm_widget_set_power() comment, parenthesis,
and 100 chars. It has no meaning, nothing will be changed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 5280a1aafb92..d4281e776e44 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1884,18 +1884,19 @@ static void dapm_widget_set_power(struct snd_soc_dapm_widget *w, bool power,
 
 	trace_snd_soc_dapm_widget_power(w, power);
 
-	/* If we changed our power state perhaps our neigbours changed
-	 * also.
+	/*
+	 * If we changed our power state perhaps our neigbours
+	 * changed also.
 	 */
 	snd_soc_dapm_widget_for_each_source_path(w, path)
 		dapm_widget_set_peer_power(path->source, power, path->connect);
 
-	/* Supplies can't affect their outputs, only their inputs */
-	if (!w->is_supply) {
+	/*
+	 * Supplies can't affect their outputs, only their inputs
+	 */
+	if (!w->is_supply)
 		snd_soc_dapm_widget_for_each_sink_path(w, path)
-			dapm_widget_set_peer_power(path->sink, power,
-						   path->connect);
-	}
+			dapm_widget_set_peer_power(path->sink, power, path->connect);
 
 	if (power)
 		dapm_seq_insert(w, up_list, true);
-- 
2.25.1


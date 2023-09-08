Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDE77981E0
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 08:08:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB1EE852;
	Fri,  8 Sep 2023 08:07:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB1EE852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694153297;
	bh=sVPxNEcp8nVAmnqOCv22xwiLS7jw7ZoUw4kN3PFQr0Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IYokAMJOg2cRFO/vgeVFqh+C91F5BDJnhZbWMjH6nrys7lmwp9TuKime45qT4cuR7
	 3BsSj0iIsZEZkZ7Std4qqwh/dBDMYxVWCkKN8r8VqWu/ZhP+AYRaV/PWud2ERKKpuK
	 QZJVa2sQJCgYuTYmxzeqOPVDtYv6ptIqqwZatP6o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C43E7F80551; Fri,  8 Sep 2023 08:06:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9614F8047D;
	Fri,  8 Sep 2023 08:06:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FAAEF80494; Fri,  8 Sep 2023 08:05:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20724.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::724])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66C73F80431
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 08:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66C73F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=V/GbZJML
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPXMyJ5nsFFw99JW2jEoMo17XdUBxO/gbd6meBYGFu/oTYhp4k4gQujlrY6KIKZ3SEW4VA913L+pEtXwQNkb7lhl8LKFQfS8ofmRKqHVjwBoQrYQT9u0On8Xd7Q7rv1CAhk4atJxIlyEkn/ST97JeFeY+eW9RNFxG02TB/srhzYet6AkhWDvFkWduKWw9vlCUC4TZ1EMQO73iJZGOl+DYPnjMIVdINTQMxn5H0PcUXjvTYn6Jj12urMYcys56PjXHqg23NC6btATqb2XosY+yN4EJb4vJiswXZINHquElulzbY6bi2JC3FMBq8tFKOWLk0pXgI1Go8x8n000tbhg3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEuJ7rvqtc69wj/UVB1RGeLFl9gIIDbZvoXcPScZOOE=;
 b=hWDe/PAJdTEO6edClUaIGqq8STBj5kkC3bSyzLXkmtMbhN+oitTDxGzQwo3NqcnH7hBthLhSRcvaAFNJGnMY5rnjepXd6rvQEyhaCLKl0gGfa0Hn4iGJdEZe1kLqbKuxUdRJk+nFSHre4yiwZKTB2Rx6RLQ5Xz8NL1Zs5G8JiooiU3Fzq7Om7QS2ZbIefKfutTgn1dkQiur5ymBisyHAMlQ1px6R/iWKb4Tu925m8vpRKzSkpmZk8yaD4HAT69/IHHnYel5KgkXTbPEs8JSskmd4awIXU+bjZZKNxzUqvjLnTJg+WPhcIVR7cSvj3KWszGE1HgVjLbPwNG8Fw/KTZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEuJ7rvqtc69wj/UVB1RGeLFl9gIIDbZvoXcPScZOOE=;
 b=V/GbZJMLQLTyMYXLixANceUuSL5F3dal3OSOmlOPZjPSpcqUkSTFk+2bPLOi6oDC9nRtKDD2Jvhj1kYpGszUTFdGXD3gapF10LqywlJ0KO4URBJWASxqmYvG0cgUgOt5I5EJx013hfB5veHAVEKcRXBmL6T1zuF3GC8apVaCxgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10018.jpnprd01.prod.outlook.com (2603:1096:400:1e2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 06:05:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 06:05:27 +0000
Message-ID: <874jk55heh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	kernel-janitors@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/11] ASoC: rsnd: add missing of_node_put
In-Reply-To: <20230907095521.14053-11-Julia.Lawall@inria.fr>
References: <20230907095521.14053-1-Julia.Lawall@inria.fr>
	<20230907095521.14053-11-Julia.Lawall@inria.fr>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 8 Sep 2023 06:05:26 +0000
X-ClientProxiedBy: TYCP286CA0245.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10018:EE_
X-MS-Office365-Filtering-Correlation-Id: 627a4dfd-8971-4d7f-6d56-08dbb0319925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sEJFjzyizbfhjd1oLuAKSqJ4+cSj9oMUp1Xo2BoL+09q/m5yUpyMdyReUEgXnXR4X0v186jp0DJ8cX/bAhy4CC0TnmJoNT/zkEzbjzvUFSZMpUHVe1JK4EjlmqBGokL11Xv3yrFc/YRmhTRN9TR1fTKhyS016t++C4tY0xXMNwQdlSBnk6COabQlRTnqN/SorBL4DNS2FERGGFMXmzh10tlutKKEYufBdcVb22qAPr1tf0bD0L1UOkagvzV/E0iK8ARH/P9oZtiVfx2YEfjIWhzd6uNxkcaTBTJb1Cfd5hODMAQsB6VaIOspFmXveXfdLOiDcHpwfOSMOaKh5lRSuYK85Ps4H+R12Y4xkYG3ynObu8VPdgxELvc4egIaZ4S8pmoew8Ew/fOp1Uv611b72cLcxsS3QIK1uklt2tJBS7S+/vwQin7FYbtKmD+uotRkNhAtqrM64gtYa0dD5/g91bBNDE89nOn7Bx1tUdHRyYRkEuyqB2YiC/q4P2RPWX+mCpqg8HEvyxYkxKnIEs67QZj2K834JQVnbQV5iCt521itdgWOgZis/VJXLj71AG3GaOjlM9euRWP71X4MtqgOib79ZeEtIBSLCkGQPj6YfVY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199024)(186009)(1800799009)(5660300002)(4326008)(6486002)(66556008)(8676002)(8936002)(6506007)(66946007)(316002)(54906003)(4744005)(6916009)(66476007)(41300700001)(478600001)(2906002)(6512007)(52116002)(26005)(2616005)(83380400001)(38350700002)(38100700002)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?flDsiyAZ5eK3oSOibzKTKR7hymAVFzzCw0HgoAe9dPekst8asFqNtxtbTUya?=
 =?us-ascii?Q?suyvxyUrtq5qu/DQGmibXQkZmfmL4mayMDvOgjRKA6Mp3EUcgTuX5KtLQVxu?=
 =?us-ascii?Q?mA6F8sG6VtZAwWUhgb2qsUk0xhLZGWzfIKO05ZtI/71APk+eRHJUl6X0IeIe?=
 =?us-ascii?Q?JLhfoJgSoAWtXSX59yObph9luDjFJc/krl0ut0VUx9548taC3abUw7rK2T7y?=
 =?us-ascii?Q?BMfX2qLnV07+pNc8mDw1O50jJmCJcubghWjdzt3W6AsMsNC8kc/e94hezbg+?=
 =?us-ascii?Q?22q7SwPVA7JE9XXWwpPaV17IJ+g2NM04LlNasXcqfX3V8xgyc/pZRvs90N8K?=
 =?us-ascii?Q?JPX8QMDdPxW2XJAOsG8PRPYnWDj1S53LodUQjU3TrAfTn1QnUBqR+VyQZCep?=
 =?us-ascii?Q?wlDWHztQfkZ30wnRDxFw04xxXFz0b3hO/2f/gD3q4+AnsH6G6EGpVgMbK+Wq?=
 =?us-ascii?Q?C9GWXOCSicBNNyhhRh90fKeRjOv/QPbAv2V2swX6CPf23L8miuqWZn7U91oX?=
 =?us-ascii?Q?cW+UMWFPQHxDTlsBoBepOi2uydvnKoFq1MztbkPqs3eH1kptTGG3+CBphzte?=
 =?us-ascii?Q?tnGQBZYKV5+5HZbbKisZ21AXrUzcsd1rTvyMwTkx4rKV2n0ezCgYNhYHl3LB?=
 =?us-ascii?Q?fNy4RKD7JPqe8oGeQbNo7wgN17x6m7qRjfZsYWF8wcHUe9kVxUlyBc95WkPH?=
 =?us-ascii?Q?7wCLyO1jxfM/tmy/OQw+29AyH9SWJVWMuA5OHnxfi0fUELE8h3QIM7qMotgo?=
 =?us-ascii?Q?sCG8ZsJOMFXAU0BhRH8EDZLqLSieUPLeSCfGENxGwmk6jFo78RwP475+jLIO?=
 =?us-ascii?Q?ZEhn+E9zOmalskCIr85E7M5wdjX/3+S4kqKiustMAb5Mt3k4rbXddjKHBXP1?=
 =?us-ascii?Q?UsimbOA83aKER9oWqyzertn+h6wewCEzRhFvfAgp10wHyxDfhU7bPHB0bA66?=
 =?us-ascii?Q?AVRQmJgOfd8Hu+vZPpWdVPc5tZc7tX9JNj1Ljv4WXNpcR4X6/fO8BAU9phtU?=
 =?us-ascii?Q?krh44CgiM4VObU/qVeLP5ylg5xq5TrdT0TbrKrKNidbaQ3NAxXB1vKrb+dlB?=
 =?us-ascii?Q?AVHv1RxeIEBqKuJoafqXHPZ85W051h0hFSB27IZyqYe03bqsorI4GoRm8HRK?=
 =?us-ascii?Q?tcO9dirE9Ti1NId84/osvL8CoG750mHIx6ThKbK/Lnzux4AUl9Zi8mqVywkf?=
 =?us-ascii?Q?uOKC9mTwX7uC1sIDxUOT/TkcJeNLa0ORhEdZ3rsjUPH78fFjTPE2z1Qk/A0L?=
 =?us-ascii?Q?19qy7GrH2tpSJuLSMcGXZSudEQ1a9zpMIWKgBtEQ6+g86+1FZJuG3roZ+6F0?=
 =?us-ascii?Q?GWTbbA1foWIqrpNTI0/ecfnjFyGWcJujkmQLC2hLvDNJBQ/caCoQZSIVAaJU?=
 =?us-ascii?Q?9QFDvyd7U/I4zTOM0qdds54uKOJq29GrsZVge8POiUK/vQr04QaqDf/nDxxw?=
 =?us-ascii?Q?26Ni3GB2nZnDh+PJQ/eDgGx3ibfXjuHQgwoyxLFl728oXeDMj+7XAUQUi6gI?=
 =?us-ascii?Q?TNF6rImnw0HiDynWrWZq/jNc3gLZBcLzzWvCQRu+3TySwZGwpiyr2uly2A95?=
 =?us-ascii?Q?VfFkQljAA8fLi3LKBxfhF7YncX4Lxr1ZB1X8XpueUD+GnWT+wTPJ0AxkpKmi?=
 =?us-ascii?Q?WWAA0ovZFwNK9ZaeeewOpHY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 627a4dfd-8971-4d7f-6d56-08dbb0319925
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 06:05:27.3734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Nxu1hUi1gYDiiKjjFDZ1ErU3gt8mRXBdPQFQSTz85VE8y5Wng/GOg4mfP4ecjekXY5NdZS8qjfi/OWrX7pDcoUAuAzj+YVUm0h5Stz5yrMbF89c31Gf2z6DgliTttlnE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10018
Message-ID-Hash: TKTKBJQNA6AK7UDDBWFFNQD2JVGJEPJE
X-Message-ID-Hash: TKTKBJQNA6AK7UDDBWFFNQD2JVGJEPJE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TKTKBJQNA6AK7UDDBWFFNQD2JVGJEPJE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Julia

Thank you for the patch

> for_each_child_of_node performs an of_node_get on each
> iteration, so a break out of the loop requires an
> of_node_put.
> 
> This was done using the Coccinelle semantic patch
> iterators/for_each_child.cocci
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  sound/soc/sh/rcar/core.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff -u -p a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
> --- a/sound/soc/sh/rcar/core.c
> +++ b/sound/soc/sh/rcar/core.c
> @@ -1303,6 +1303,7 @@ audio_graph:
>  		if (i >= RSND_MAX_COMPONENT) {
>  			dev_info(dev, "reach to max component\n");
>  			of_node_put(node);
> +			of_node_put(ports);
>  			break;
>  		}
>  	}

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

I noticed that existing "of_node_put(node)" itself is not needed.
We can remove it, and I will post the patch next week.


Thank you for your help !!

Best regards
---
Kuninori Morimoto

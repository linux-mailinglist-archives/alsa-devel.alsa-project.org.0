Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7948F9AD94F
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2024 03:31:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 230BCDFA;
	Thu, 24 Oct 2024 03:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 230BCDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729733506;
	bh=hWZDDc+K/kdwffOnLdmbNgnm+RizNKlSGc3PBMvyg/g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HQh3FY7x7JH0UeZrexl/O/Mt+X67D3SI4WuJIqqiL+99aAJee2ZrfqYQFkDwPanCl
	 M7zmguI2hPu4iJmqQF+8mrlv7L1LyI9gFAm5FpLDiNF1HtN3U/r2QvV/xfcQEho+ph
	 Y9PDkz9ygOhuU4YRY7inPbBrjMbjU8LBJnOdzXgk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C7DDF80682; Thu, 24 Oct 2024 03:30:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 381A7F80673;
	Thu, 24 Oct 2024 03:30:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 633A5F805FB; Thu, 24 Oct 2024 03:30:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19EE1F805FB
	for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2024 03:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19EE1F805FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=EIuhz51Y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iERxb42PB0Fuq/g3UsO33Rw5fUrCdLKZ7WQXR2wmeWytsEg04XJQSnIYwB1DE0FA5M/Zpg/AbAqKEqUBfvQcrTg2VALfkQVTX/0SMNkPa+tPsj7QqEofk5mSDUKSvGUQdx3fbqksyp+sjh5NWiycl9m5pUDuSq0cJqCejoiQB1sbn9is+JvQ5fGp3nXiq5EMS76zK5Cm4wKwpWP8YxoFr5v0i6XAyrGl/RHOebLfUHmPQw1iHfkDFAEaqzZUCTZyP2l6tAhImmeDIMYbIx6p/pKKDGLmBmOTCrh+a/3t53uctZDNuScseWVchCz/5efui75jeOjUPOugPZ0ksDsTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmZkwuleJoNuag2OU5otDRqER2R1E3uHWvzEwJOZBq0=;
 b=aXftLuteqB9NYpsuUoRhohshrnYPXgLTZrHvp+zqQA6SP3DVJdfr47/1SCFOEgb/p2I9qT0l73iM9t0BntD6gUueXGT1XROYzJaiY5jqy07/8gvoTE8WGAqPgwm8r1V+qXkX/FVVuRd6sOFKCwBKFa3ZJ7bxXnGo6/NHcceXuiXsz/SsI2spdO77GEOR+qPlAPDQXV6rIGJIVZT8DK85OH7QhUvnjYkMLJuIrgJg1WvMz0qQ6vXy/yzpFQN/xwwXeRc7xnWe/ySdNMihyFmj14lI7W3Uy7UKJF/A/MfJ5i6vrmR3yWimkcn6wyxy883Cz1HVR6Mw1GlxzY+2uXoBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmZkwuleJoNuag2OU5otDRqER2R1E3uHWvzEwJOZBq0=;
 b=EIuhz51YBQTrg3QhRh8HgUFU3ABWQVZ5IrXEZLJ9i/KvzOoQ3YIHrbIMcu8efYUOYOAt4qBDrZHYImxMtKu0RC4c0zKfrcWQICuqKdglbD4mWWH4Jbnto7obi+mnr1TBATjrJc1WkyQ08m8JFkt94VNex53f3zxJLw+80SS+kSg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB12111.jpnprd01.prod.outlook.com
 (2603:1096:400:43d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 01:29:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 01:29:52 +0000
Message-ID: <87r086b84w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
In-Reply-To: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
References: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 7/8] ASoC: soc-core: do rtd->id trick at
 snd_soc_add_pcm_runtime()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 24 Oct 2024 01:29:52 +0000
X-ClientProxiedBy: TYXPR01CA0052.jpnprd01.prod.outlook.com
 (2603:1096:403:a::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB12111:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c07a78-fed2-4c21-772b-08dcf3cb5bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sWMo1pOc7Uy+Oig1HHplNBTrQ+tqf5H2nyozbM+M/XU9vaEfw2o0ri9tvH29?=
 =?us-ascii?Q?E18hgM5gwMGUbGKfp5Jh0hQbDlgf49Z1ZXFPOzogD9ThTxuCy66Wt4EehdRR?=
 =?us-ascii?Q?cRKQnCSCH0iYefIsLqBqxzDB9iGh+xNn8Qxb4CQMIZ23+QVkcjVx6VxTbMUO?=
 =?us-ascii?Q?c1nA7rVoaIbOBFS8Zb8BxH+bx+trvKoVbB0BoGs30azT1t4idtOxRxeVF7km?=
 =?us-ascii?Q?nfandVMo49AfvfQvNhuO2zOsbmYaxAbN88rs1PfHKPN1mllsCQfHBw06+Nea?=
 =?us-ascii?Q?6i8Q/p6bxdFXh7lNsbxC+HuBLcRllSmfihPV8rAzaD+QecTtRI2ryVCwviyK?=
 =?us-ascii?Q?jCC8bDyRKJABabNhYFTyaqNAKa377qvl16P2PX+3cx+znNET79YDAN9vzesK?=
 =?us-ascii?Q?zkm8btizxwTi4zeyLuwqqHyYM01wD468XyPnyCntM7Ll4KWcunIpldW2B9On?=
 =?us-ascii?Q?CC7iv/aNyQh0nXaMrZ6xnnhqifjttISJc6rotTdNFRdOP5ak04A2gFIXeUrv?=
 =?us-ascii?Q?gsYLYV6QMsjYcQpH8YnOUzdBft1SKzXmYL2QQnfS/Lri7G6laRzacrv5DEhk?=
 =?us-ascii?Q?gJICmGoG1K1u0b0NGw+0Xtkp6rlEBpx4gh+T/0sHn8UOzN2qvODM7+/2wY8W?=
 =?us-ascii?Q?ysLVO6TtiksZHnsdaAshp9hKOrqgKIzsGrVewLuQO75ay+mB5JZ3wpIAQoTK?=
 =?us-ascii?Q?XYVh9gS6llMVSDMwoCbxhDn9ph/eB83x8xKFb48E5InYbgHpCt3irZDiDPQk?=
 =?us-ascii?Q?W4rx0ESNY9UVOsm7aVbhVZRzb4cy90H8Ku56EPgPLEn9T+X33zAa7uzQxSWC?=
 =?us-ascii?Q?bxcCI44MvVrNB05R+4wvIn5WQKW8JAafThvjJSDtw0lLQaw2XsI74kk19LHf?=
 =?us-ascii?Q?Jxij6UXGqZbxE2EolkWAoYRe4/nDs7r6DZHJeZXmT61KtnRy9kxwCT8xFesZ?=
 =?us-ascii?Q?JrEQHvWnSb/gsjcrZ6h/Ux3rWh4QIhsJW8V7smBVqUo+LBhjdkRdgmjnNKLS?=
 =?us-ascii?Q?0tr3H7PzjpZ1UkIf8VavaJvScQ6AFczbkc+dNva596UKkfcQKHiTrOxQQTTA?=
 =?us-ascii?Q?2OXSiGcj5aC20u5AZaXgLybDZTGUerPbs22mFHOA6hx/ExURuRzB8lTkYHBq?=
 =?us-ascii?Q?P1X9xP1QT6Qem9kLvqaL9EoRsqcsdJVyjXmjJcG9Q1PyQ9S+g9kmYEtz+d38?=
 =?us-ascii?Q?jEh7B6sgpisxpxzrbkO2BOidFlIJR1yfntDIP7kYBdU4H5Hd2bvZ+4C7OBBp?=
 =?us-ascii?Q?46oyE6QmDoUr3d9W3t5o1ATTXLS1KZFyqdo56G+9rkND1jSvOlBlG2wl+gKy?=
 =?us-ascii?Q?z2I++RabTnagIm+x+Vb5gAmYnFkQabnv1PmDx6yoU42f7k7NwTQ5/PlC4x56?=
 =?us-ascii?Q?usrZWudOvsmqGKuqJ2dyt1uaRTrs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rK41qo+/5J6faqirKyTcAsXSOWpajz62zM2yWdzYhN+m76L6wxGscuhomoqg?=
 =?us-ascii?Q?aEtalpIr2SrYUDmCpWOFmOOucpQRe0uOibmq+G8NYrPxOKu6ySun1FdpgpKd?=
 =?us-ascii?Q?d6Oi0zrmmMoQFq2HStlU13/Q5/atV3soDjDvcTU9/hs8mbX12waf5EbOOHjn?=
 =?us-ascii?Q?PEOHAew7yP/5YiNpQX7Cn/saOal81FGTH0bo2oLSatt+2CXFv8vdT28Z6Nv9?=
 =?us-ascii?Q?yLx1/MyD9JREjguLYCI0vg0H6iG12Zn0Cb8yNGftTY8A5G5X+XAPpx6FckHz?=
 =?us-ascii?Q?q+GGwnUhfn2QcVoPQheybqImrSRgtB0kknAk4nrLLA4l8zBnWxebSgUEjkkz?=
 =?us-ascii?Q?O2YjBKWKA+5u7wXoNAArn3AXwLRg7gVF37koGVrZqjf5qBzTVGx0lCKEuAz0?=
 =?us-ascii?Q?w2gdavdX8rL1ojpAcNorzuZby4OtINoJ9VNu4/B3mAVa9QUoiLeqSyYtbf3m?=
 =?us-ascii?Q?8pOh2ZX7ukGYkkujTaPmPGErx9c0UBb7vMAHhrKyrxy9LiYDwEsE8cQHqWv4?=
 =?us-ascii?Q?xNsqTlyLFsKcTn9qXjY47MhfFHLoHTAcYdyTcXoYuegG6u4x0CTwG9/OnRiF?=
 =?us-ascii?Q?IMkWCYgKl7godgxuUoh1qgfNZzsf1Nk24m2vCSQup80jZQSeXR7YXFUlJ3J8?=
 =?us-ascii?Q?A+eMcemSd1xzOq5GvDqHKGQNy9cAd/2PbvXlQMVt2rSgbdv6+GoZeb/fSSLH?=
 =?us-ascii?Q?h1Qjex8uDR4ZuQCf796I3BaaVnsgoAXDZw49P9oR1A6JuWxthWTa74VLmw8n?=
 =?us-ascii?Q?KpBUKzEf7X/4xYLOa/pzIEYPHG+dggwWT0DiqP8UBLwxVu1M8A9SrcsV6Dex?=
 =?us-ascii?Q?uomFlPHIdbmMw1M0w+hEEJXzc6PGnLV8KnGfxMwxfU+qnHz4Wb16pRNyAGsd?=
 =?us-ascii?Q?l0BlmIWT4IO0Ndj2/WaKDCs+Ny0RsEVHSm24JBgCc9UjcYB1HK5JTsBXvwAB?=
 =?us-ascii?Q?bGO6aP5DnVt0cwvF3JLnmvI0VjoGBeDsOjK9dCC3quJcsl1YfSCdgPx2ShAN?=
 =?us-ascii?Q?ztuJwRRXLLGVKHtGQWCm2rYtyj2icrn516qUXidbt0S5cmwnRxO50WiIlOLs?=
 =?us-ascii?Q?lsXIzrPhIvyU5YhhX/zk4Ojj/JDAXeahWXth/svJZShHX4O+oUyWt7or2S8K?=
 =?us-ascii?Q?xfOH77j9C98hVIL/hUThqKuiZLYuJRty6+n7s+m4c2ypkTsUttn7wLG3DYOL?=
 =?us-ascii?Q?XdjI9mO/oMzWhzr0A2UZmnL4AaVfoVouT3Q3Pd7xA0xFAaaUylN3Jud7oYSo?=
 =?us-ascii?Q?HHQDr/AQW74jAqG9WlYqa2giNycdiZxX83m+ks31SMfk2SmZRKZka01iBOAk?=
 =?us-ascii?Q?5twgJncyogO9sKR0RI2CIDgXwgeXopUO7FxhAsvmPeJ0SAfkBSOdj/jaaa5+?=
 =?us-ascii?Q?WCLZ0qK0nXCEoAPTA6cq2xkw+XDrjR1b4UkITmcmq7plDzt+MwxvFyC19r5e?=
 =?us-ascii?Q?XWki070PLUvOjMREVFkopfSgmtuZLD8l/OxCZNa07j1Y3zVdGe5U+YNsz9Aq?=
 =?us-ascii?Q?WrTyfHH0fNzdF42vU0eOTpS7wyslwaXlsL9a3NAbi4WZVlHXoTqUH+DV66nl?=
 =?us-ascii?Q?FynztfyxwaB+Mn/yHsGI0TI5CLxvgOlPbj/mt+eJq98cBZQTidA+eIm4nlg5?=
 =?us-ascii?Q?yw78MXgdvT8k0ESpTj4WsMI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 56c07a78-fed2-4c21-772b-08dcf3cb5bd7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 01:29:52.5344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +VZttcix0XA87LAGsDaf5Z8WXZUNuGK0OoIhdIVqbbJs/fPTXV2d4vtuE/RePVyc9IWQOVk9HI1yW2w8loRkfSiI2Yzc3Yk5DEsFCj2LIV+RN6k+bUnBF5iIoV83ZSjh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12111
Message-ID-Hash: M4T5FZCF7GNLMKJVVN6ZQ4FWWMQ2XAGD
X-Message-ID-Hash: M4T5FZCF7GNLMKJVVN6ZQ4FWWMQ2XAGD
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M4T5FZCF7GNLMKJVVN6ZQ4FWWMQ2XAGD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

qcom/qdsp6 want to use irregular rtd->id because of its topology.
Current code is calculating it at soc_init_pcm_runtime() which calls
soc_new_pcm(), and it doesn't save it to rtd->id.

Let's calculate and save it to rtd at snd_soc_add_pcm_runtime()
which create rtd and connect related components.

But, this feature should be implemented by using "dai_link" instead
of "component". Add FIXME as comment.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 42 ++++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 233c91e60f0cb..4f0bfe73fe15e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1166,7 +1166,7 @@ static int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai_link_component *codec, *platform, *cpu;
 	struct snd_soc_component *component;
-	int i, ret;
+	int i, id, ret;
 
 	lockdep_assert_held(&client_mutex);
 
@@ -1225,6 +1225,28 @@ static int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 		}
 	}
 
+	/*
+	 * Most drivers will register their PCMs using DAI link ordering but
+	 * topology based drivers can use the DAI link id field to set PCM
+	 * device number and then use rtd + a base offset of the BEs.
+	 *
+	 * FIXME
+	 *
+	 * This should be implemented by using "dai_link" feature instead of
+	 * "component" feature.
+	 */
+	id = rtd->id;
+	for_each_rtd_components(rtd, i, component) {
+		if (!component->driver->use_dai_pcm_id)
+			continue;
+
+		if (rtd->dai_link->no_pcm)
+			id += component->driver->be_pcm_base;
+		else
+			id = rtd->dai_link->id;
+	}
+	rtd->id = id;
+
 	return 0;
 
 _err_defer:
@@ -1457,8 +1479,7 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_component *component;
-	int ret, id, i;
+	int ret, id;
 
 	/* do machine specific initialization */
 	ret = snd_soc_link_init(rtd);
@@ -1475,21 +1496,6 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 
 	id = rtd->id;
 
-	/*
-	 * most drivers will register their PCMs using DAI link ordering but
-	 * topology based drivers can use the DAI link id field to set PCM
-	 * device number and then use rtd + a base offset of the BEs.
-	 */
-	for_each_rtd_components(rtd, i, component) {
-		if (!component->driver->use_dai_pcm_id)
-			continue;
-
-		if (rtd->dai_link->no_pcm)
-			id += component->driver->be_pcm_base;
-		else
-			id = rtd->dai_link->id;
-	}
-
 	/* create compress_device if possible */
 	ret = snd_soc_dai_compress_new(cpu_dai, rtd, id);
 	if (ret != -ENOTSUPP)
-- 
2.43.0


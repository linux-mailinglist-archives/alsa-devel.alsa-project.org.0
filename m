Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0139B70D0
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Oct 2024 00:58:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51CE5EF2;
	Thu, 31 Oct 2024 00:57:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51CE5EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730332688;
	bh=tRAqIlmnqopPfN9MoXpK709PloSDAAo7niYRySdRAbc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mOCa60AFyjQE8lC2SpZM8CRDXh/gHG2Gfk0UMyzZkZE8pz1NGM6Vto/kscvkB38Aa
	 ToozAv3XQm9DKI6D53u6KmdqRy12bYKwoq8M6xteKDzHjniK+wLH8jgVvLha1Rv3bB
	 08tZ/Ch/JjNxrueIVdma11aCEyi5Wu59pvAf2fjc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A6D1F805B1; Thu, 31 Oct 2024 00:57:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42D2DF805AC;
	Thu, 31 Oct 2024 00:57:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CEF0F80269; Thu, 31 Oct 2024 00:57:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4B4CF80104
	for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2024 00:57:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4B4CF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=n2sxbZUp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRbMl9rF52eCAzSVdwwPZak0mBBx/p4MhKjfc7Mnu7MbW8W8O+CoHXmiGa/5c9gT0PBTNriqk5YUjenU1KmAPWHhNvJFUkS+I54B+RAuIWOIDDIe8WmdpTzjoMMTSvom6BrXL8ZZUaLzscBrZqbeF+0HXkJuiKIxCfh2TV6bQzu+DZBDBsWymu2PvIpFZjOac8E9jR7QFhn8878aV/5p/QH84sFrVO0mNlIr4DupfB5SSzeZ8zCSsKJeC6N2ryOGkWIG+KHF8ZpsSqlf0D9FIei5P81mNvyx6qcvEllP7CRP2X05JNGyWS4husua/AOWQoZXgdG7Kw9O/x2x7CNQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRAqIlmnqopPfN9MoXpK709PloSDAAo7niYRySdRAbc=;
 b=r2yEOst7/kg8/Xaklo44GoaON9axEeLdy89zQN4K7v5xw2OPyrWIfCqH6ueFCiSXyvaXYNpMukmLX5Q4apbIWSVjsvSUxtJMPeWS2D1dlkRqlu9/vyxiNSNDTCJKZzePKbfjT+WySni04wKmWHpYmpWugpg5j77BNDrNv5O0rlzaek7BaS9BPNMyY4O5wwCAEdsjaxwwVZQ5qxEvi0xtA7HyP101He6BuIwaoZ4iDZpf33TYXoLFlW7FhQwN/3pbnzTkDyB6QPnEorqI97938B7/GyPb8ulRY4lDuG4RE24d4ckZnGNnhP7L0w261xYQKrIAuGMwHqZYcrx3Jxxxxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRAqIlmnqopPfN9MoXpK709PloSDAAo7niYRySdRAbc=;
 b=n2sxbZUp6RTJdMTTf+7AS+hMR963jB2wWRdHoSVJWA+1vfx65tT5sn9A3vEO4ii+texSJLLYipqzMcm547Yxiny/PSZ36te5SvvsW2BUOaU/PV5bh+q35WuUDyRiCPSPxaYc/Y9Loi6DUIBcYmiqwZjWq4kxSv92cZFN3BbdO9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10156.jpnprd01.prod.outlook.com
 (2603:1096:400:1db::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Wed, 30 Oct
 2024 23:57:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8114.015; Wed, 30 Oct 2024
 23:57:17 +0000
Message-ID: <87ttct2lgt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Kevin Hilman <khilman@baylibre.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood
 <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Neil Armstrong
 <neil.armstrong@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang
 <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul
 <vkoul@kernel.org>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,
	imx@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 3/8] ASoC: meson: switch to use rtd->id from rtd->num
In-Reply-To: <1ja5eudix4.fsf@starbuckisacylon.baylibre.com>
References: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
	<87wmhyb85l.wl-kuninori.morimoto.gx@renesas.com>
	<1ja5eudix4.fsf@starbuckisacylon.baylibre.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 30 Oct 2024 23:57:16 +0000
X-ClientProxiedBy: TYWPR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10156:EE_
X-MS-Office365-Filtering-Correlation-Id: 21cf39fe-27bc-460a-62e2-08dcf93e9576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XSEXtiBxC99FU9bP9dDDw3u1bn+AMg5ibxvIsZKvM0U2rpDr3ifmwA5RRqOZ?=
 =?us-ascii?Q?KeCfg4ZGHQhlDzgPqGX8MtPb87bWoVMvOXlX5Onifl1VgoSNJTeAyR7R1KWz?=
 =?us-ascii?Q?Fw8q3by5JGvPvQ3pk2zZLMNsHxPhi4jzhXHCRHbN0EkiuTe129iUD1UcQKOQ?=
 =?us-ascii?Q?TqpwYTHsR51ouCBQNB5JNGN9FhZR5VShzRxjGVGeVABuxXET2mPZebqxQG3Z?=
 =?us-ascii?Q?vySs0AnLMaRmZnqMIxzNcoDLkZDmm3kO/8BLQD8cdZU5IuyLjEKpBN2naQEK?=
 =?us-ascii?Q?o0BCFCTMZDtvgUx1kpPu4LG1wP3V2zg1mYlcOOT4SCPRHnDHLpkqfVpjdsQv?=
 =?us-ascii?Q?klP6waV6qB3SWR/E7a0GttVYSixxSVhSp+KDEJSIf1FkajyubX5APyeOdsxq?=
 =?us-ascii?Q?8uGjWwXrIWhyK+HLSMhEjP4TO7kEPSevCkmyP+FT3PTPkHjuFputz2oiHJaw?=
 =?us-ascii?Q?NnD9rb6jGYi8l07oyoVSjCt1stRjjMlD4F04XdnqKTAM6NeRXnPS9Pkq1cuU?=
 =?us-ascii?Q?sPSmXJ/UVxmOlNm2Ky0X3z50wiaUzBkeq/Stds3//CMj5z83/A1IvhMsVAok?=
 =?us-ascii?Q?MpMA1Wmd7liJOANTVr9Hd3jABY+OnR91M0WdJ2yyQCXsU906vIY6Occm1y7m?=
 =?us-ascii?Q?R74D/qXyYuk72J7htTC8+w4Q9WDVht+rbiFjKLvbz6vUVshzzYlPpM4HinEI?=
 =?us-ascii?Q?poaCn8vcx7+t92Xk4yt20kBUKTYNPvg3QLh8HQEhvdpVvucckaJT9xvB18bP?=
 =?us-ascii?Q?PgKaEWRwkcfkLB3ckl16F4lvkhPJB1bxpiWZxW9RN7xWdj4UqVT098kwZAO0?=
 =?us-ascii?Q?+E8QXMns8MJsqlknl4RQjCLsF84pstt34wZvGb/lSXqJEa0b0KkZH4QBCWN4?=
 =?us-ascii?Q?fL44bt37Z8V6lnZ7QtXvvLnBeM7tA22D+x8vpQ6uRf1GzIdbI5Ss+MEm3NBG?=
 =?us-ascii?Q?bIFth+dmwVZF6KX9bFc2LwiZSYczH4lBG3ZdJWwWYPjdTA+lsGkGKqQPM3vV?=
 =?us-ascii?Q?zhQLnCLiPsyUrvmUZqAFQGFKZDZRJXPmcL4swl7mF3Lc+ZxUJNmvJcsEZhel?=
 =?us-ascii?Q?DNCb+sXYECDiPjCURbcgv9Jnieqjl+rS1c2xkTrlF9wuKl6geeDFiW+qu95R?=
 =?us-ascii?Q?t5UjvIWWmqKYkfVJj+7M0fa2o5Wv4EjyhupQ6yTjq4gQ9B1edWT829t54dN1?=
 =?us-ascii?Q?PGRCIWS8EiD7zrdTEPOPTpDcxXr8c2lPgPTIdY+SbKSbUobeHZ5o4kJaONL5?=
 =?us-ascii?Q?0w4AAt2EhR84l9+OZ7qI2037ilrswdy4wAEAZDw5w28nlfDeyNPOwbxmBCDS?=
 =?us-ascii?Q?BcjyZN+oeFSAD/xgb/Pxuiw6g5X4/Dxu4aYEquSwScXHi7gV/uDGGXtV7cnI?=
 =?us-ascii?Q?tR3hBgE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2BTfJN2F7n1JgexQwidyeQYy1UODCIHvqNP6HnJji0OeUw412NabEuNvVx9+?=
 =?us-ascii?Q?xOb8H6C/Qcu75J9tL9T9k4qB9zNuBE5tN8luxlOGekRpvFvAHzPzrMRzt1+I?=
 =?us-ascii?Q?BbNuPyH9jPbZkfxqrEKVglHf0Lkm/rSEu7V0jNcuUFMkvpGFy/ZoLNBf232X?=
 =?us-ascii?Q?7BtBu0aXQIyM1H+I7koc4gZ6iREwaMd2rKwKIxEGAsGfgOmQxImg1/An6ocK?=
 =?us-ascii?Q?z13pPKCSB1ury/0k/vcqkTH5eznff/XipbWzHued260gBNB4t1lXTTe4sCMs?=
 =?us-ascii?Q?i4LX86fzc7eSsyBT6jOzBTgk4XG1t+uDgSRK+iEj+IH7Fink8dMd4ySrDrV6?=
 =?us-ascii?Q?s2pJAkmyQTT49SnJefhQyez/vmeBoZkwZ5DIvWSgWaV9WEIlOgvBVyeb8OvX?=
 =?us-ascii?Q?2tCxeAq7DSHGxDTD5Lrj5ZjEZ2HVMWRkdPUWVx4/VRvNyymCb+xIMI9o/yCb?=
 =?us-ascii?Q?SI6Aemn4tSWQQdpwe9QScgm9snCo2dHGnB+OwpT/CSUsNhn1TDONBsJrzsBl?=
 =?us-ascii?Q?KDptrYGe9lHv5yuXLwtHWw27PZqmFji+oXVNr+rv6eC0qhXzzU9qj+gM+Rel?=
 =?us-ascii?Q?19gNzkyO0/4QDBR1Qvl+xLJyESYNIX8YUSgRfzl8StKn+EGN3jxyJU/ZxGSQ?=
 =?us-ascii?Q?4BwvY5S8B+fm6oDtioIntf84q529Zl+iJGmlRI3yjy/E9TUQ3eOxN6VPUhVd?=
 =?us-ascii?Q?05u2rk4V2J5nktP8BmnbCGmL7qqp3JKeui1TDBK6Dqi8OxdyCvAjnemMOn+P?=
 =?us-ascii?Q?XyDEeJF7e4mzltmIRKsIyWDyii3FKkGHh2k7GmCoVmlKhT9meCCuoyq7AbYu?=
 =?us-ascii?Q?tiwN3Jgwli5wz54pAwZVX1oy/V/ecJlmY2yZ2csZsnyDFJxiIcnlc+EAHB+f?=
 =?us-ascii?Q?PkPebCZxBlbZBZ36BuKkpEop4wXb4/3nsag3SEuImYKc660bc7kxI6pzFT26?=
 =?us-ascii?Q?Zm/8zz2Esx8RXOZ8JtSRR/NC5wCKW+eiScINmFJDC/YHX6nykiPnVGLX9VGo?=
 =?us-ascii?Q?gDAUJjanNAQe770bCUcmSIL0Y2Q+QFjfuUFBEsT6NeblxFipISF0hqkoEvPv?=
 =?us-ascii?Q?J4U2d5X6O0PyFlcPe7uZ2fM2jK3o8rQPQHHNqqbLg7daJeECTX1Zgg3KjrjE?=
 =?us-ascii?Q?hsBwGyf+liBzw+6o3RvTJi24z40XBX1jjRbYfDBNXXhb++D1RRkpnkVcb54x?=
 =?us-ascii?Q?395UejlJKNwfP6sXwHksin8udSgm3RtODTqI0ihIzsQmG5n+AOzSfgDObsxQ?=
 =?us-ascii?Q?xkyHCLT3zCfbfVBc5sk+jpwOxaGmkwYybtP0y5dCPgYdZ7p0+ezvRdDIOe1Z?=
 =?us-ascii?Q?cRynyS2h8jk5pzCkJh3cYu1Qd3dAFoT0xVzHKfP7uA1zMf7RjpS4S4kNWP6O?=
 =?us-ascii?Q?AqLBUZlAR0zXy8si/vCEqcopA3HBmV6vblEmr4NI84cCqzGzckXdnW5QBWxx?=
 =?us-ascii?Q?7wDC39ByC5u6/FVXPZPsnUZLzWtLPtC2co/vBgnyIvyYl1+hocx50Dnf5ZMG?=
 =?us-ascii?Q?KcJkbJDZubWUmb+2ohNiq7YQ4M665i2a7SmbfkLbfXpbnl8JnXIbdG43o/XS?=
 =?us-ascii?Q?FfJxSTy0jDp8c72tH4KQjnHX2XLQa7TErkgGHFBQ37yuunQ5HKJzkG4fHJHE?=
 =?us-ascii?Q?dFmKCD4S8I9dDzsUp0VIwzY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 21cf39fe-27bc-460a-62e2-08dcf93e9576
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 23:57:17.2397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LyzMdoc1d6d1UOIMAfj0Ta1hI32YZZgzLRUQ1DpjJAHN0sMPgTptbiN3aBEF9sLIylmL2NYNkmWO6RzgXXhg/z3n3rkSKaWZ140pY+vON566K0Oc0JpGnbrzkW9Nb4Nj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10156
Message-ID-Hash: DMA5COTBGC4PXV7QA4KZZ4X3OA5WJH4V
X-Message-ID-Hash: DMA5COTBGC4PXV7QA4KZZ4X3OA5WJH4V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DMA5COTBGC4PXV7QA4KZZ4X3OA5WJH4V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Jerome

Sorry for my late responce

> Just one comment: I understand why you have split this into multiple
> patches, I suppose it will help with the review but I wonder if it
> wouldn't be better to squash it all into a single change before
> applying ? To avoid exposing the intermediate state. It might be
> confusing too. The change would not be that big actually.

Thank you for suggesting, but I don't want to squash them,
because it makes backport difficult for LTS and/or BSP people.
I'm always trying to create patch as much as small piece which can
easy to backport.


Thank you for your help !!

Best regards
---
Kuninori Morimoto

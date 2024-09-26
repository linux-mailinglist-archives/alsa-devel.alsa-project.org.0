Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25677986A4D
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2024 02:45:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C34AD1CE;
	Thu, 26 Sep 2024 02:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C34AD1CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727311520;
	bh=tuXEsB6SIFylsMAKdHJYnd5JdFyZJscAbxtANvP3AGA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UsqaBe5xn2M6weETepMU8gj/RAPedujEmZyPKnJ1xWq8AeOz1dK1smZ680wzQNolf
	 UgdIzP6BbX0GRNjCmIbw4UlcH/R28MZqQRaC82FnQLZpoWmtVXeixZb6NTi5eFxEt/
	 M9eEZY3uWFSuKJrbq7W5rb6pD37F9ej8SDMmWz2M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13EB8F802DB; Thu, 26 Sep 2024 02:44:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78D0BF80518;
	Thu, 26 Sep 2024 02:44:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A938F802DB; Thu, 26 Sep 2024 02:44:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCC14F8010B
	for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2024 02:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCC14F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fkHdIioH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFN+jNzhmabxN4O780jpJxm0IUcfGJobEbXeb37sPEYGhVXpD8jgwGNcrZLnRwrqcp/ximVJcdsvKVEBCJLMWAU0JdOMziFOKX+Odhc1OkwRbSH73Tfk+8RSo6aQrUHR+TZdqY58S1hxE1pmb57w/xAkRNHTNeC1sbL7ZhgMrwOd5Ga/bdae2PZJJV5wK3kQDwrk5FkvJ+L1XTzmR86Wis4jJ7UM0WT9cMyx0qjw9SM8feYHzMAtlXTub4BP7SpXimc58FB65Wo/a0mqS7L7fqVRscAzFJTbIO0pcMdFPp3G7B+PIZfdjr+OhiO4mOA0hp4nqPf9De6VZsOoruozhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4C8iZsoHoFWgG00+gxlgvxXCmGfM03We1M5JBOzmTtI=;
 b=qaOme8jCzlotBt2FD/kRqfAGPlk6J7h0gPiN31jyMehjw9+l/D3QNzIY2ym36AeyHUZ9zM9Uv/rC03g/g7za2iGWgxyST3W6pbu2CwCDXCMH4hdWCrEHmjYT/E5TKNoQw5PNkEErhgi4tWG5tKB8f4Mxc9527I3zS01vCeDRb5xxElSbvQwUm9kF45IGemjlsb2dFhoo9mQMlvrrzCbx0j7Vn/F2j68TDTN7QOuOce9tjHi3WCe36Iavp40wMnLzpnL5vtWJzVqbR+n5MS5zRDz4heQNBJXi6sXowBQJ40LXc70X2XQPpANIBHWMMiDmFYVWF+I4gdiwGCO1z6r7Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4C8iZsoHoFWgG00+gxlgvxXCmGfM03We1M5JBOzmTtI=;
 b=fkHdIioHjsDgWpTjWFQggOI14xly+XB84zTEyZc3c2ldXqwBNruQz7OtD1cb6mSLgCyiFt5szzB68uDY+lS24I8EQnKRsXKAa6CErmSJc4WVo56OuKktlq5DQm7iIh+amAoF0GB3ruuWSOEUUb5uz5oI0sV+fHm0jnmBzM2XPvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6011.jpnprd01.prod.outlook.com
 (2603:1096:402:35::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Thu, 26 Sep
 2024 00:44:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Thu, 26 Sep 2024
 00:44:28 +0000
Message-ID: <87o74b8cr8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 03/13] ASoC: sof: remove dpcm_xxx flags
In-Reply-To: <87msjv9ugm.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
	<87msjv9ugm.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Sep 2024 00:44:27 +0000
X-ClientProxiedBy: TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6011:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d26f022-1ad7-49cc-6d49-08dcddc46050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?r9lfD/S8mz0nFZS0wzZnGNgKWeBtucv5QSFYYNm0tU19fJiNe+b4siBnAjZ2?=
 =?us-ascii?Q?1fOsDoVxV20pcbtiEpeHrVEeLJmCZPm0eO5dgHHfIMh0DMoSvUNYFIwy4IP+?=
 =?us-ascii?Q?Qy/wGpNYwZ9lRT9oONNcimZxMLnC2n2f94GyOwU9YoKb9oN7kKomYWXCgKME?=
 =?us-ascii?Q?ka++V1CqWaq3l3MHUMVEmjfDGAoetCSdM41CouqjtIPe8zqqMWXOF45bPJTL?=
 =?us-ascii?Q?cKvi81LnEIfRwE5HKEeeX8FxzL8uTlLSppwMxaf1bd/DoHwKDnROUdBIdgk2?=
 =?us-ascii?Q?68dfyqC1/OdSjCLD46F63/9tW/XsU5GE20P5LXenmDW0niraaidd40NyIEmY?=
 =?us-ascii?Q?s9/VV3SsTKUg8cSkAD5tUZy//Ndwo6bvGyLKw/igXlujSObwJfXibsCXlrDL?=
 =?us-ascii?Q?6b46H3p2cOuikestXueR/jMyjF2jTdsOsRNX2WZKJAXBCO6Bdf617w/Y0W+B?=
 =?us-ascii?Q?FCJC+k72zQuQ4sBdIah85hYBJ2NSEOrQ3STlEXnOPnDr0lZPUfzBt5q8fKoX?=
 =?us-ascii?Q?yyTiLEXqAUvbeT5wyJGbkx74zFtFkhsmXTWKwDXUEkaU4GapxxLbWdBJrZMT?=
 =?us-ascii?Q?JMB5qo1Nmvlr5bBB4xou2xI1TlqzfHzbV1KHc3Yaqnfz88SAXiP5XnVijsT+?=
 =?us-ascii?Q?juwf00PpYZlVXkESzNIYsSYIkHfh+9LCLb3Lca4G7rSJxM4TklO1mliSmLWA?=
 =?us-ascii?Q?MEZjze26sHK4IsV5KA1Fh8fv/9Z8kxDYAqf6hbxRa88x+rCf/mhD3mBNiWle?=
 =?us-ascii?Q?rywRdWuqLzmV7tJ6R29cX5PxCN2P2i/RUfJgHjfkBC5gwoIuZfPkwww5OBB7?=
 =?us-ascii?Q?N/bM+7hQVfmr09O2mP0J0c7ovRmpWcCgvlYYFv+lmfoJca0D3pXjINeIGCxU?=
 =?us-ascii?Q?ML3iw0e3jtSV51dSKggzOgngNRAz48hnHK7Qh8luJOljLNFko9w4KsLUpy6m?=
 =?us-ascii?Q?T53Sg9CzOVFGFbiuzmUvduW5b4N7kwwY6VULIp0UJug8WZhrjKJd6GTImoeG?=
 =?us-ascii?Q?uLbA8vQeDWDML3zH7vvHgzaszK/Bb/bdP/rqytLUBrjfdlwa9Thma0ulTbzm?=
 =?us-ascii?Q?DccZWATf/jLaVIgcktt9kxm16hvkohflJ5UVdx2aBJGMu2EeLyrgf9qbq8rA?=
 =?us-ascii?Q?lI4XHgiFJa4RGr1ImV05MthVfW++ypsPLVpdF9yuBbMg671U935YaJGkqLio?=
 =?us-ascii?Q?T2a2dk5h5yrGrVbUUetT2C8y98QVXO5VuPrX/ahg6uQY/zMpwcsK4hhXjn9e?=
 =?us-ascii?Q?zOTGnxtg9TK1BaN/Giy9WYz3/iRcQGAsc0oAB3EH87y8eAf5RXvbWPkL9Rpp?=
 =?us-ascii?Q?HmgdQDMaRLwgx7l7b2itIQhmh/ckzPwv47z26QNxDD4xFw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ICvSW/I4Yok1DBz6O95UOqNNDqJWfM8rcIss+nezWG9uTXdphx6cKUS4KASj?=
 =?us-ascii?Q?Y/Pqck7NWZ2Hx2l+HqFHPlciJoBdaq57ev87a8dzsjBXya8QUbfez+wvkMW/?=
 =?us-ascii?Q?O6VO2TziGGXvB0oiMx2vXUluLK1OOo+koz9VIFJ9aCyXgeTr2cIENstXDWoF?=
 =?us-ascii?Q?crvJ+cyJI9x6qchcANA3jl+7mnSLBE/i/OGtdq8We1j0EonZE9KPmmbhbxj1?=
 =?us-ascii?Q?Vd8abDLpql/kUWQTpDQlpbh43sulljnwZyvHjrSuY3iDynSJfnfaE8npGVKE?=
 =?us-ascii?Q?AtopCfqZBt0uR03PmrGpejwjt/vZXqVSeKoNY1bWth1QITzSaPxjSGWkp4X+?=
 =?us-ascii?Q?K2yePpPCSE5MAl3DdFYKz6XtbjShcp+tpaV1GXyR3V/Ieze30qkoLkWnxVmO?=
 =?us-ascii?Q?wc1n6B4yuiNENG9xM3Swdt/xDaWjmbngtMMi6eHZoq6eLOQ8kaHRvnGBBuHS?=
 =?us-ascii?Q?W+TKyugU8VNC4o7YWWvG5b9YrrR1t4UHlBooqCeKd3+100hSU7iRtHcC6LCk?=
 =?us-ascii?Q?w/p4qL4PQjBqpmNniTjT24UbipJ/YuAaLMJGIzVxCYm6+lbcCGViLWYTEQYz?=
 =?us-ascii?Q?xjYaP6yxMXkypTUncKSTW2+f54KD/Kub2S4mcYndCZBSb0ikxCX+3aCWtJQl?=
 =?us-ascii?Q?BatSNPa0zZNP3PzOmH6RlXzNwNDqm2ICpymYIhM7g1u2iG4mnMY+WBU9zqw6?=
 =?us-ascii?Q?MB6/JAoc/AlUzqjmHefcWTyAL1BSuryLPs2zH1b/cNEq/dyLEY28o2Lt08FF?=
 =?us-ascii?Q?updkxKwNpE74Uc2ZhtLKoUxlByuv17luI/geuimyHvnzad5ZN4c9dBzBI8gy?=
 =?us-ascii?Q?Z0ThTBE1mzdBcszKzxyW+umDFat9s22RfxhxXKQvv79Vq6kfi8jwB/QlIAvt?=
 =?us-ascii?Q?H+F1475k5YwuxKAgFvgggcq4/1ZzTA6UPBfDq56zKR0M3cmLzD0QvwmOx8m2?=
 =?us-ascii?Q?ikH2EYyxkTR7y2W9dlgBJn29raWyJnGKlQDt/QMjOCpjHXYZDv+/rRhoSVDW?=
 =?us-ascii?Q?7kSlODC6P4DK9mJ5r6LGv+jVw+7E94SexwJouP/SkAF7FSYF7bY+fSsO7qT6?=
 =?us-ascii?Q?3cUZh+nVZHchr3G/ItZtL/+WvjWjkjD46L0tMy1WM+HZSl+rRocqJMwLpBZb?=
 =?us-ascii?Q?FJqoMVHvP1u5hyktA71ZN2UOjngz0xEsamruSYhGmEKc96Zu7h4lhBvKur9V?=
 =?us-ascii?Q?Da+p5JgT7EEj9JabN0Ho524mYGIAxV6WFt+hgQiim4LhzEb4ptGLFIHBH+/l?=
 =?us-ascii?Q?sucL50Kr4DzfwzzHNNHVtmufn/U7r4TO1gVnCGrwOeNc4WR9fIGktljRrBFr?=
 =?us-ascii?Q?8hcS0+7Z3yye5Ji85PqWhX+OFjG6O5AIE5WW5hqRbTy0/CuQfQACWT4OHbwG?=
 =?us-ascii?Q?tlm0K7ZPMxF/gmI7th6RYpKOCrRuGBu+H86MSDJRnN7P41BiipvIs4HCsFsk?=
 =?us-ascii?Q?KNxX76myA8Uf8xYnLkRu4DXACicfTZuCJIGYnCY/1Ff/lJyQhTnD5ucWc/ux?=
 =?us-ascii?Q?t/YCX0ofFKLRsVHv5k2H3gWmvF2BdoFiN08UfnhTOuhJLCPCQirVcRaHZ6cW?=
 =?us-ascii?Q?OUzJaDQU9/0T4mAZSlZlgqskfIkJl9urQEbisx265kLSPi51IvE6kt/zGPcl?=
 =?us-ascii?Q?BfSUaKI6R1Wpq3HMm2BWU4A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1d26f022-1ad7-49cc-6d49-08dcddc46050
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 00:44:28.0049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vCqu/LSpCOKmDfhVVf7nlTk0WroZuK7PyJZniEvxXtQNinvTk1uNHqxoVBgroNLZz4jwx1S/nz8RXFnMk85qTWT5r4deyjvuoe26jOThRY4a75suXZSqBqd8cNTOzsPH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6011
Message-ID-Hash: JEREG6QN4J7BNGBL7MTM3JGUJMSVD4TX
X-Message-ID-Hash: JEREG6QN4J7BNGBL7MTM3JGUJMSVD4TX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JEREG6QN4J7BNGBL7MTM3JGUJMSVD4TX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi

> dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
> xxx_only if needed.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/sof/nocodec.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
> index b12b3d865ae30..d59cbd3a69964 100644
> --- a/sound/soc/sof/nocodec.c
> +++ b/sound/soc/sof/nocodec.c
> @@ -55,10 +55,6 @@ static int sof_nocodec_bes_setup(struct device *dev,
>  		links[i].no_pcm = 1;
>  		links[i].cpus->dai_name = drv[i].name;
>  		links[i].platforms->name = dev_name(dev->parent);
> -		if (drv[i].playback.channels_min)
> -			links[i].dpcm_playback = 1;
> -		if (drv[i].capture.channels_min)
> -			links[i].dpcm_capture = 1;

Ah, I think it should be

		links[i]->playback_only =  drv[i].playback.channels_min && !drv[i].capture.channels_min;
		links[i]->capture_only  = !drv[i].playback.channels_min &&  drv[i].capture.channels_min;

will post v2 after -rc1 was released.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

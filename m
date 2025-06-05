Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1FEACE7BE
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jun 2025 03:27:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2DC1601A6;
	Thu,  5 Jun 2025 03:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2DC1601A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749086834;
	bh=ijRvAHxNTIN2sf2x4f6zONReiBa91J/4XyAfuUcryDY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uOGePOvNHA5ABK5scOnSLlNDe0PTmm/23nwyYh5jSh6Y50393g3CeqHeAE5JT9ITd
	 L2z45J77SfkOkRIQjKg9C4ig+k01kjrBD5zLJoHojbaBfLC/O4+abFw8hcZ0G+i36R
	 WtNrH3DzEG896HbuVxjBQZJIW8mKqpRMu783RYmA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28DE2F80154; Thu,  5 Jun 2025 03:26:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B188F805BF;
	Thu,  5 Jun 2025 03:26:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E00CF80154; Thu,  5 Jun 2025 03:26:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1E10F8011B
	for <alsa-devel@alsa-project.org>; Thu,  5 Jun 2025 03:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1E10F8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RXZba9BR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNKUBMWw664OA0R/6foFAPamSMFweVjJBPlkgRlzFAur/rJj5uGvMbGUytWCQLn0GVQkPOqtagjnAhxXUNfxJJ7xu1HM2z67l88AJuJ126iThPb867uMRieOCB9TFwb4vTPWTRzNs2k+FhOXwkSdYyDkSy97sJKTAmEwjpCn+v85P/HLq7Hec77/8K1qoX6eyUAva3YF9kiN7gZHKi6C6ucFy7ijeZ/BAU//CkRjXnzhwzgtfnBYcaxFaeIZ4KZkb+BRaIg3wPIEnDNFnn9JY0kznH3BIVc+FSZAK5r4WbBoVILxkBlSZ44IkgNZNyvAzdldDZRiF5913QZrDPjIgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCRGw7uBvKe12sNjC3hAqU0pkSHIjBfnc2Y0DgzIx8g=;
 b=gGsm8m6sHPYJ1cjV0zEpT2EFBuGj/SP99By9AG1Nq02UHygnVVuawaF0q1tsdvJEmHypaG83vsZsYjqmsZ4oZo1IAU+oq5ZHzbYamjsfNsvZ0k8DMj9MscH2jr8cElX9zIxGHZwmF1kUmKhhU5j5QkVlOsem7lDHOMtLkQPXRm966BctvafzTYfaXCGevhi7A4y7xOSA/UOmYpZJ9Mo8zcQ5l4899z5KJ0+aUQcm1agIhqlcZtUQoxiHBR+5UxD9mnxLbUAiBjjCl4UjBSqt+yNpLOGAgYW661GoWVVsm25fC9w1ic2m/Mx3wY7sXhTm3XXIhrnqKJ2JA53S0gRMdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCRGw7uBvKe12sNjC3hAqU0pkSHIjBfnc2Y0DgzIx8g=;
 b=RXZba9BRwRdYqndqCMnoRcSEGXD1bzCNd3ZlJ6BvgUYNThpLhXCDYYxHIreRydYLIZ7t8yyjK3+0+bUyoS58nzCJ/P5n7MbyHYJyjT6ecXzRGcTDtrVWo6Hqdx2ANEBEgrqTbz5U/1sAnEtJWlM9WDOQBo3XOlxUxFO2kjtIFSU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11221.jpnprd01.prod.outlook.com
 (2603:1096:400:3d6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 01:26:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 01:26:22 +0000
Message-ID: <87sekfj7wi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Giedrius =?ISO-8859-2?Q?Trainavi=E8ius?= <giedrius@blokas.io>
Cc: alsa-devel@alsa-project.org
Subject: Re: snd_soc_dai_set_tdm_slot with slot=0 broken since 6.12.31 kernel
In-Reply-To: 
 <CAMONXLtSL7iKyvH6w=CzPTxQdBECf++hn8RKL6Y4=M_ou2YHow@mail.gmail.com>
References: 
 <CAMONXLtSL7iKyvH6w=CzPTxQdBECf++hn8RKL6Y4=M_ou2YHow@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 5 Jun 2025 01:26:21 +0000
X-ClientProxiedBy: TY2PR0101CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11221:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee20e4a-31e6-4946-7ca1-08dda3cffaed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PJhjFnDU5eH2XAxzGYxs0UgD0qppKoO/b7ZeOw0SugjM3nDNkw1BYo3XoN88?=
 =?us-ascii?Q?2JnIVm1gjvweo8r/B30rHFiu/cSCJLS3nN/AXYuYvlENvCu0l5Ff6MS3ctrj?=
 =?us-ascii?Q?0LjHd43z7AXwBnykbMlbF57WXVFLGS4vsYdFZTIAEugmrGuF1pCKn5NGdncp?=
 =?us-ascii?Q?870uyxB71UbhRYCml0XAHyVQmAerGkASC4OVM4nW27KoWXzVVH1H6UbrXKEN?=
 =?us-ascii?Q?zdTNcWMyAydefZlgqlb0zRzmLpmYxcq6qJiaRTLLLA88r4bqNR5XO4IUkjtG?=
 =?us-ascii?Q?sjpRaCit2XRXwROfMte4TCN02Cw12E2Ls+SHqgAlXaWJCoPPh1j/4Igx/Lpe?=
 =?us-ascii?Q?Jok03h2wW9iq8Hi5/EYZula3ur1dvO2fGN79sgsaDRxTmHN71TXAZ0U2QQHe?=
 =?us-ascii?Q?FS3X5hL95odG+bajB8KUVzG8njpjdw2gMCWRlmHCCXBUfhvXPPkqQRocWxWh?=
 =?us-ascii?Q?HgDpUjE4sSlb2olPqvlrnHCfz+gbbC8aWpjzfncPgZzkhr7brV0zyRP+q5gv?=
 =?us-ascii?Q?Ly8z20ZWVDLvW0Jy5zWqUdnWYJj4fNMcnLOKXqQBmd3Z1HfUePwZWu9KTzCY?=
 =?us-ascii?Q?ULS3NcNw0xF//m6E8Kyi3FBDxbjlT4UGodqL9LjwxDfOqUCzdGGsPZYaSdsT?=
 =?us-ascii?Q?Kt1dkLevtvde/mQLyS4U3SG2CJQU6dmAaek9TWDjOGa+WRRG3kD7N8UYRJzj?=
 =?us-ascii?Q?ZmLsodxmFYgX6BPciAbG1Dm60+v2O/VLR2GOO5IgHuJKKR+pA8SIzNLG68XR?=
 =?us-ascii?Q?mGpaUw+hoFwGkYTMLEcp8OaSzjyMV7XtG+8NyxLOUEZ72GJm9ZmcqyeXwnXr?=
 =?us-ascii?Q?Tj/32Ug/MKzV4xRIpesmnjYVjPtn9vy1IvtkfRVLODKoJ2+WWfCqkW70onRM?=
 =?us-ascii?Q?mhZW6HXx8EudXXmwoMQOmkixKt4MUVz1yyi7kUNGujYiGSdtMk/HLcaSTq8i?=
 =?us-ascii?Q?a9vKdig/PALn414DeLUJc/DMTjdh2s8vGWt01rFusmxCBW77z9hrZGzGxpCo?=
 =?us-ascii?Q?WYDsF77eR8Eu/1TzbIcfdrUU4qtAd2as/Rguuk1N9gyN+PJC9U9eKTtrdQbM?=
 =?us-ascii?Q?9kOZWSrN3Jrncz1GlscxEEy+KW1nuvVWmOEzMzlXxHWr/0fIasMftAq6K2d4?=
 =?us-ascii?Q?/MjuATs26sKyZ4yKXbGxsf8xSepv7UOFyzytk8utiBQRZxaboO09PGE7ywqo?=
 =?us-ascii?Q?8sgAalpGlKQhzN00mGtT1tiKhBIxhaKNlGS52ul7hIxAsavub9CkQUldzzUs?=
 =?us-ascii?Q?1UDv33ojs9NRuj5o/A4reIG7p1vBU2DKua7aOQtEbfroPRJG71Tb2keIcKoG?=
 =?us-ascii?Q?KP3/eWQBdTKGFq8PwonC37VR+zxPqqvN0q+/snqbQFczDfieMkdDLx2lRek+?=
 =?us-ascii?Q?ZPEA3Q0Ff0HHlmrNUWfQs0sS6BQ+XXfSoZAhi3vHAz0uKj2w94rZa2AI92dN?=
 =?us-ascii?Q?iSDXlc1PPi0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?k/6TaFlk6/A2LB0WXITNjAzvUzGHSH9o++p4GLmW2hiKTnB1veA06DYQMK57?=
 =?us-ascii?Q?kNeQjnKx1aI/Y9sbnpRC0dPv7W1N3ECzRUPuLSHYKlayzWr9Vywm2v/ZU2hk?=
 =?us-ascii?Q?7hmB39JYeWXu5eWbsSkyRWHBCh2ERENh6HNsNAccuhiuW74luhdgkUYUE6HO?=
 =?us-ascii?Q?4YKZbbfGMBEZBuBK/FUTJOnAO3uSOaHSATmCkbtnxnhDCsGt/M+ObgoK5WW/?=
 =?us-ascii?Q?gJJhpDYxMVlgFjlYVBl4MsNk1yTxKB33F1HTPp0VIGDJwjToUITWBEnVzhzF?=
 =?us-ascii?Q?jBvWn5Nfe6SIf8do9jBjRgDmQvy22emyww2CehSJ3mAXgTDA2/r5oIPO4+Vp?=
 =?us-ascii?Q?zOufZxQ6YEztFzT/S4nLDqKJkHC/BilmJ4Gw//8mPIlzFXF2oUgryPeiSBon?=
 =?us-ascii?Q?mqt782oDj7eIMMIijcB2XIhBYOvLcZkkClTI5mtUqfhdwmZSxV5oLTMDFNT+?=
 =?us-ascii?Q?pf/gVefI4n26IWeUyo51JElKxcPdnT0oWuMT8SaflTCGizBoixV9ln8dRrkR?=
 =?us-ascii?Q?7osA9yxrVimzE7KeN8FeYtsM//keLWRNhnSumgL4zPkSE3j5HgKcUWnTWSlk?=
 =?us-ascii?Q?hLP1I8fIW8cjAk87t10Yb06gGo1eJW5bI2ajQTYmguDLbE8hVflITYk96v0a?=
 =?us-ascii?Q?Q9TC4oX3ozpWBmRVKgq+zknbdqoQrc8QSne42VKNT8vK+hsTGkwULm7/xJfF?=
 =?us-ascii?Q?0cE8eag8fG/mGhuKruxK764ultIIlP02pmjSPbcxH0ohc8K/RkeFevE4dQrC?=
 =?us-ascii?Q?NjR4/uFIz1s0pTPi9YjmsX8u+R4eTRXY7yDlgLKkeseR+ePZEnpeRIcxMUSd?=
 =?us-ascii?Q?siJZ9ItxlYj2HEvEz7dFWR2nrIsczxRKKeZ6LtxevIGZTdlKBVKnjpj4m89A?=
 =?us-ascii?Q?mrLYcd2MGl7bDiSnKWQg04rBLR7to9Nk9fGuMWOCtiHhjszKwyHaGCAfrCWZ?=
 =?us-ascii?Q?4rdOpNp3TKw017P9OqRAsaGMcXy0C220XRWo1Bhrm1K2pyeN5uFvo6TveZc/?=
 =?us-ascii?Q?PgKhpdaVm5O5lOWoS3TuH7xfEUq2PqS4AoxZaoVtmjVp2+4AtdXBAr+NJLmp?=
 =?us-ascii?Q?RahjivlFNiN2T52kGUao3GwOnAtgbGZwD+z5NeRgeOU/eVOalBNgJvKAlxLF?=
 =?us-ascii?Q?KszesxOu1/2zUfEDo7DCkHNDvlSmHVfMNvarusM0RqyoevMHwK4ZVbxf5Ia1?=
 =?us-ascii?Q?M0D+Keq/a8kd4hbFA/rDCIbp0BSaDNQLdGFX/2Y/mLqVvflPTN/0THtrjWSB?=
 =?us-ascii?Q?C8xnbLoxta4c9ZFjZAMAj5sQvtWmdvvUXJXoPXsl1Gz5fjbFhv5Pdju1NhC6?=
 =?us-ascii?Q?DkH0eeoSZsVpiJqjFRwQo6MoxS5R3Rkzl9cgmlUK1WfLcvas7fpY1YowVMmE?=
 =?us-ascii?Q?smpMOKjBHxVRzH4BMfI3ZUfN0vBy/zdOoALwQJwIybo/F7M1+LAygzAg8G0h?=
 =?us-ascii?Q?z0WDGQAIkVDm3+DUYx7T97r9RZ/vGZfNG3EWYMVPx3K8zbxkuR2ZMJdF8kR9?=
 =?us-ascii?Q?uwSB1YnuXkneG9UtqFATdAzEHiGfGhbI+4T5GyndSVqHdYvNczT2yCqJWA18?=
 =?us-ascii?Q?J5Exl4yyLm3uXF4tVSughELFIYliHhjetPgn/NEo7KqKgjM4KT7p6dz7gw4g?=
 =?us-ascii?Q?Q5fjwpTAfz4XgPPRGwiKsV0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7ee20e4a-31e6-4946-7ca1-08dda3cffaed
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 01:26:22.2539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CPVm+SZazDw4T7UzEAmU2AHfS/abeXKS2/tJKBHscFCWO3EMd2hfMLI3nA8VO9rq8guvCzMrQPozAFAQ1oxSqUwfhTHrwVJl95xuQOHM1cX8RQJYwAPKoT4o35/c8kcH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11221
Message-ID-Hash: TGQEZFFCS6LO356LFGK2623QIOBGUDAR
X-Message-ID-Hash: TGQEZFFCS6LO356LFGK2623QIOBGUDAR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TGQEZFFCS6LO356LFGK2623QIOBGUDAR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Giedrius

> Since Raspberry Pi's kernel version 6.12.31, I noticed
> that snd_soc_dai_set_tdm_slot returns -EINVAL when slots=0 is provided to
> the function, even though it's a documented legal use case:
> 
>  * TDM mode can be disabled by passing 0 for @slots. In this case @tx_mask,
>  * @rx_mask and @slot_width will be ignored.
> 
> https://elixir.bootlin.com/linux/v6.12.31/source/sound/soc/soc-dai.c#L260
> 
> The issue was introduced by this commit:
> 
> https://lore.kernel.org/all/87o6z7yk61.wl-kuninori.morimoto.gx@renesas.com/#t
> 
> Which adds checking of snd_soc_xlate_tdm_slot_mask result which is -EINVAL
> in case of slots=0, therefore stopping the snd_soc_dai_set_tdm_slot
> execution.
> 
> The 6.12.30 was still fine:
> https://elixir.bootlin.com/linux/v6.12.30/source/sound/soc/soc-dai.c#L281
> 
> I would suggest skipping the xlate call in case slots is 0 in
> snd_soc_dai_set_tdm_slot.

Thank you for your report.
I will post fixup patch. I'm happy if you can test it.

Best regards
---
Kuninori Morimoto

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8599869BA
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2024 01:40:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1013950;
	Thu, 26 Sep 2024 01:40:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1013950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727307637;
	bh=n7fERorHze2JmC+6AyjZBH0qej2nC8phi50bjVYRW4E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IP9ep2z6k7Yyfy+JZC2FXYGrrPuY++EKq4b9lOVi7SGuaFe15kKy1OIbJZzhlyRW4
	 HNoWkJnbX9lNcNFd3gTa38/sln89rDU9Uy5VwP6AeCsqif7ChXOhP5GaDa/9WzCUcm
	 qa6n3nZi0JKuIv1mMWy5k3XsHmlQUKzdSx7OzXOk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 425B1F80692; Thu, 26 Sep 2024 01:38:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43B81F80692;
	Thu, 26 Sep 2024 01:38:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2C26F80608; Thu, 26 Sep 2024 01:38:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F455F80508
	for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2024 01:38:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F455F80508
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dN12aOh/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxqNfnS6izJUZOp38BNBYamnzP2tdjR7zNyWb3zjz0A2qn9OO+3+n1kk+hVzm2nqRWvPKKHWhx18VkU3BcNjoXiaMJF28cNocQYHubcLOGBkAehuTMBGDXPXKxy4sWovLhOueaWPr3/pc4oD/NzAOIlSqpqaeV5VA5jEkX7hL4M7K4vzs+Hq4LqDGIw8Y06wADTaKwO3W/YZhA0F63pPfY9JxaEGx1uN12HttjI/MbKTIqxkR0lUcz1ekpMvr2d/HyFcw8ur1e65x9D+4VBmkjDdliiXlrsUu97NLuuPkUhtdc38UQWkfqTd4MGwtTRbUfMwLnmIwbEg/CZpBX7STA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQbtWGqjWwJrlbSHrPG6x4hwYFF+NyLgnSgjClQ7fyo=;
 b=uBCu45DWjY/2dQWNnkdlMijwKtIwNWGJvUe3UeaHjFmrx6+TkCiGThC3h0CRMcwaSXyytxWK27JGVPDd7D4RfAWB/X15NE0xro20H3quIQgK3jCTQfAfr37i0SyWv6ADPHGsoajWWVClN0UPov5S79LazrLcQTWnYkRIcTcsLPg6Ui9mKFjjf/fWWXOTdEZT8AZv0j1llnglYt3nMk8av/q80ss9JvjR6sHVhkW4SRZTaa4QGVcmNhGQkaeMZvfl7Vwy+c7chwRX4s9ZCyW0MSIuoO+PwwxMCYngFNhozdpwvjnLWaNqPdguGv2/Czy5PLhAjueIxkw9IDjOSLlKtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQbtWGqjWwJrlbSHrPG6x4hwYFF+NyLgnSgjClQ7fyo=;
 b=dN12aOh/W4Wm4Jc/tHhUeZba/7ImNTCVlKcLDSU0oB3KOtxYrpaAjkEJYZ07/NfDZzRLlda9us4PzvHkPHGC+mtenxuebmoVkgEhSjRll0keD4QfPIOG8ONQ/Un53yTkiqzTI2BP658xhJSaLwPm49Hme2mcNhi7xz6Iha921UA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10634.jpnprd01.prod.outlook.com
 (2603:1096:400:292::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 23:38:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Wed, 25 Sep 2024
 23:38:22 +0000
Message-ID: <87h6a39udu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 07/13] ASoC: soc-core: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Sep 2024 23:38:21 +0000
X-ClientProxiedBy: TYAPR01CA0028.jpnprd01.prod.outlook.com
 (2603:1096:404:28::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10634:EE_
X-MS-Office365-Filtering-Correlation-Id: 446b8fed-bd1c-4c05-3649-08dcddbb246d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SCDkC9NbN1aHbhgSImvOj9zZeErr1kMrLfOI0ECoue9vkHCquyY+858IE+8N?=
 =?us-ascii?Q?DKLLtUwJ8obWGl6Tge5XaBQo4daNlXcLK0rVixHKpw2aMIJrjNTUJPus2dVm?=
 =?us-ascii?Q?9EZAoH1ld0dwUVItrV/8w+nSYXpImpyf3AzwRsP5gq1mK0O7uCeS0tBp896V?=
 =?us-ascii?Q?Ea0z+qiO5SCmvvhzSXanmJRsv1IRMhT9VT+J5vCNmJmVwzfvyXml8Me04ukF?=
 =?us-ascii?Q?NxlrM6p6WsnaS15XpaVlqFat+tU2fj1IFFY4Rz3CznMDVpoElTMwFLFD6X31?=
 =?us-ascii?Q?bMhh06LaBT5yqDA/o9Ot6Wa4kIfy1Hwhndb1+K8vVTpsChmwUyhVGfQ99SZ5?=
 =?us-ascii?Q?sM3nxDGJ01zn99eIHm+OPGKAjVRuHkcM3lb0KTD5YrEmjkcIhRVeMZlz1R4Q?=
 =?us-ascii?Q?6xscZrcSh93dzFcdBQ0Vu6AIXeNbsCHSlsq+MSMX6GMdqhKxi4d0Dc7bf+gj?=
 =?us-ascii?Q?21y4M9KNrCITM4RJvW8q5aisfbkTexu154ixiz2H2y7zlWyyZL1Tpg/FxMFl?=
 =?us-ascii?Q?dOqq8QnisxJOoOlepvqZ9QuNE7O864vQtDhukTU2HKHgeaWzy99W2sqqRKF8?=
 =?us-ascii?Q?R3zG3a6VG4v/LKw/rb62bbin6bLoGYEBYOA89pD0xo8yYY1QoEZ8dVUYT9DR?=
 =?us-ascii?Q?4cNr7K+W3zWzREEuL6uQ/1Hsf5qoTQ48HwobgvqqI+3j66TPyfNE7Ji10cDr?=
 =?us-ascii?Q?Vq9S61eqC0OFzckNgRvXEIFSR2zFqc9ecPbXIocu0i6izYYY0njzNBrkTnMQ?=
 =?us-ascii?Q?Q4sVRhpbTxNOqJviRMuc8NWaAGkrpTQnX68Awnwc2PyuMsdYcc34EuqfMsTB?=
 =?us-ascii?Q?wPi36cVuUjdH0WSbzq55miDanH9OubWYKNbtF5L4QkDzc9thV7HyWQmxXNIY?=
 =?us-ascii?Q?hKrOQk6x6VYb2hGwmy/0HQrYD1NmenlSJ/gW/PsAXD58FT8XRv2DN9K860AI?=
 =?us-ascii?Q?BakcQPLLJZ6iz13dP9EotE3wwxMd45sJULlpADw52q6891L3ce0ql4KGLqwr?=
 =?us-ascii?Q?faJlBcqk1jmspH2Yq+okMHKuvG8Cu4TB8dP/VVdvLJu9ycO3dkFk8WyOiBiO?=
 =?us-ascii?Q?R/H/kxAC4whKqbE7eysdl2DO7CSRLd+Aff9HSSBdzTPigHKbtEJP/+MrBXzZ?=
 =?us-ascii?Q?AzQ6hLwy8Tmjj+LSxvnigKIVortPfLJrcgwK182wtXi7A20DKEhMeZETbeYz?=
 =?us-ascii?Q?GzyufcxB4Fluht76Qp7UrDMd6OiYrTI2m63PsKBDKvN70ES0S0P0X5yDpvJF?=
 =?us-ascii?Q?YToU3G2BMsYK/6C/mzJN25CHfza7wdDkIBrVZloWFMDt9QTwZ2gQRl/3Bon7?=
 =?us-ascii?Q?fdyJWU7e32EPjqNBHwATeAtKMbNtk+B6oDq85uocTpFs8Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tCg5Lto+xgdgA6ykJ5jNC+i1quI5ckrifLs7NAXrS5hZWCn2UyYlDu4ALvxq?=
 =?us-ascii?Q?cOMtBbEj4oiADDIcxPFMUjaeFz0ZxI5sPvQHvIEzuYsTkSm0bw4VM6+c1kRI?=
 =?us-ascii?Q?ON+YBxBJNq2d4PD2yTO9QBxytjjGyFOTrn3eNCYIchu1QzJhwuFYV6ID1TeL?=
 =?us-ascii?Q?leTuOZpjt8bCxawZgXNsHPBqvxp/gNgUd+8M1KwFQPFHY1BzPltJvO4CQWRE?=
 =?us-ascii?Q?p/eBnWDs5X1UHUPBi9IUxDZA0f/scDu6SRJzxJ+5mCz2DH/Qd4PdqK/AmbGH?=
 =?us-ascii?Q?yIp9J9qf0dXWhnIp4fozwYbgbxVyMphSDU4A1N875Y4IEdQ+sZ8thfgBF60f?=
 =?us-ascii?Q?1UcCJOuykFES+JwcActUQ/ox8yqHmky8Gw+6XzBMMHI3Uwf6gZB9i9NyqhcB?=
 =?us-ascii?Q?xrtMLxIyivAeKNZSnC1OBhoBbd9ye3Z+xiSjGbeo7Cg506wy6xQUicHoQAcm?=
 =?us-ascii?Q?StwTyuHGha4eig9pCTLOQb1RZq93pOe9e7xorYZ7X/qEyetk3eV292W+uqVg?=
 =?us-ascii?Q?TS/iRCmS3VPf9pmK8IXCI9SUCZvT1dKN+P73qLKv319AXEk7kGOxMWkQ4JtT?=
 =?us-ascii?Q?t6EwN1Thpo1492+X8hC3hPCGUcqnH++LlLQrab9LeoWEqyU9y2b1DVJeNkw2?=
 =?us-ascii?Q?/E89ERSbTZW2ZH7nDBT/G7gyhF2iOPs72uDz9YO35AycN0mxZZYX9r2PSMsz?=
 =?us-ascii?Q?nmHmm3GJhCUM7zM2ZVb/ShGjbRmtN3ARO204x2UkXA3l5s1ebBPAW6Gm7XWm?=
 =?us-ascii?Q?vlCavzPq3S8/9tTIOzDP1m0/728ds5fT7aCIDukr3OERe1WObA9YZbIjHVL9?=
 =?us-ascii?Q?pnlAd/R7AqSEHVa/egyt7Y7Vv70L8W2PEig7YYq9E0a9YveRJkcNwxYpIM0j?=
 =?us-ascii?Q?iDrMZ9b8/IFBKOAPJwCpE2O+kRqUNgZD9t3JVUCwQgdcdxNfUL5b9PNhSJcC?=
 =?us-ascii?Q?r+45JjqwKFUOxpV2JKknoX/JN1sN6t5au9XnIIKNez6ZKr3XnGNBsb1/1KZZ?=
 =?us-ascii?Q?rdROZxB5FDSM+cNR54n9fE41+X1bBlRRl1HYgd6YBq++OQx5viBuKMAlKz4q?=
 =?us-ascii?Q?NCvbN8rE1IBTnIOMg+7UPnIHPa0BozqMf+D1TvCgRDpMCqilIeLHQq6IbSTZ?=
 =?us-ascii?Q?zorqhaQuxa/F0MzTo1j7AiHIf2z6IwHJZaRZHxSNlhQgN6B4dHTmxBRYxAgs?=
 =?us-ascii?Q?Ksam18Aic7flW+EFHVFxy25x4dJiohwIQ2HckBmB0qevBhdGF1BXTNqVwZZJ?=
 =?us-ascii?Q?ccP9jSaGPfhdzFLNrFusTuXDDf4+KJmBhygTHh6bIY3Nd3e5kS4BxqduN5aN?=
 =?us-ascii?Q?e9Q7QUz0+BtFMtAqn/Zlz655xN6KPPLG7qh/0AhxYyVanyoFlUR8SGJ06735?=
 =?us-ascii?Q?L4jPeLD5JYXvk/I2X8Clddtsb9J+dedbKwAca/nwJEJqzVNBSuytREPCswnE?=
 =?us-ascii?Q?74y5R6SybA0xRKmkDrWvk1Ff90EJZZPmaa4+G6ohS4wvVArTbZSm9YznqnAj?=
 =?us-ascii?Q?dEIK+iTzSSYd/y8vsztQauUdkeeanC2ZEdkkmJVPc0uHllvuyjE0y4wNTXJd?=
 =?us-ascii?Q?bs7AtQvCkDjyrGN7GnNZ+RPVJp1kQfuW5SdV5gOi29hKdKGixe4F22/lgIj3?=
 =?us-ascii?Q?8P49wNRqZXdsLk/1inT6fDo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 446b8fed-bd1c-4c05-3649-08dcddbb246d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 23:38:22.0645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Vd7uVwylaxzBcPkIl+o8n+hGuqjbP9asDlYt0tSzkYJpVrNGM/rX8j8/R6Bl2Y308/JeUMTaqSWGWNW72yPCeSluo4Bt8KRmfbMa+YGYmO7LbZyDEa+02MV+gGckQF81
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10634
Message-ID-Hash: PXEBW3EGVJFOJ3GFQOOFIDEQJYMR4FSM
X-Message-ID-Hash: PXEBW3EGVJFOJ3GFQOOFIDEQJYMR4FSM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PXEBW3EGVJFOJ3GFQOOFIDEQJYMR4FSM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 20248a29d1674..f04b671ce33ea 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1999,25 +1999,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 				dai_link->platforms->name = component->name;
 
 			/* convert non BE into BE */
-			if (!dai_link->no_pcm) {
-				dai_link->no_pcm = 1;
-
-				if (dai_link->dpcm_playback)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_playback=1\n",
-						 dai_link->name);
-				if (dai_link->dpcm_capture)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_capture=1\n",
-						 dai_link->name);
-
-				/* convert normal link into DPCM one */
-				if (!(dai_link->dpcm_playback ||
-				      dai_link->dpcm_capture)) {
-					dai_link->dpcm_playback = !dai_link->capture_only;
-					dai_link->dpcm_capture = !dai_link->playback_only;
-				}
-			}
+			dai_link->no_pcm = 1;
 
 			/*
 			 * override any BE fixups
-- 
2.43.0


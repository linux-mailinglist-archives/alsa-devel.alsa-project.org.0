Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD2E99DB09
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2024 03:00:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D7A3E85;
	Tue, 15 Oct 2024 03:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D7A3E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728954049;
	bh=sHJceF9qgO/8XgkLvZwhXK/dmYnmVfIJIK1XVUgl0l0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W07ZcNCnTx8ymtVcCwWwW+GC0FEN8uanAyDRCiH1WoP3nlJzxaNNx9PCUUFhYIBXj
	 7SXdyTjQVvQB8P/9l3ihNqY03wo8GxfcLquN1Y2+rV0f/LJOak+igNaS+AwZxktGKB
	 Nv9jFGcvnHswv9ry4rlT/hNueR5GG21faBFsSPTk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D0CFF80846; Tue, 15 Oct 2024 02:56:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8895BF8085D;
	Tue, 15 Oct 2024 02:56:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7558F80726; Tue, 15 Oct 2024 02:56:50 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 61531F80726
	for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2024 02:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61531F80726
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=B99ROOOz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5r5sVKWTP5o1uK+l8bXzAvRESPzd9fD3JJf9h65lYra3zpD56RzWFpItmeTg68/TBrIY0n2LYHGGZ80V5bCsrISYTjqJjS7Fmbpcms3Z8O6uiNb0IPOulaa4I9xl881p04SbLMtPVEHgBk4flUnJmfCZruy4JGwmuLrqykFH30BpN4dm+EPo+gTOTYfS7LlekMrSSDC2VhLYJ9t6eY5CuE27+bzoV4m8muliz0c2sRJwIg5AZWK1BXpWBW7+iU8tSuxc+04tBjXv6YcDeSWgnbPsP7mb3IMM1Cdb7+4Pj0vzVfPsmdpWvUmaJHZK6jDrjcnH69/cVd/vLUD6ThZGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qs4JCdG53zTFye5G/+UbLM1QMcObGvrEDohoMWSvXQ=;
 b=SWUHlq2o3sjIpDRysxVJnyPKoXSenDQp/yWoZNaEF/c5wpwi+M4gB95BfslsIvQbFdHCFI0g/XYbop5Qdyok9ncg4ByywTpFzLjbb7RrC7qW1rrr/MAM8aJrgtO0ZY1wF4/IEsTorv4cd3Ed4ea/28aSuyZkf9oj/pjIt4t1VR9zrp04B0csn7wT0Gj1E6Yt/MPP5fOaWnABcIYkID0h2TGoFx9/NxRQ96MYp558ighZBdMZxaQj3oqIKYPiMG8W+msLLveiwkCBqhmyvESUS/aWcQUfA5Cx7QmCAnPZ3DGsEqq/0Apnj5Gpkn/cArf308uImsfxQbcch9R8bpFLtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qs4JCdG53zTFye5G/+UbLM1QMcObGvrEDohoMWSvXQ=;
 b=B99ROOOzsbQ+QOXNEyJhWxYYGIcuME0R3ZoujdL3eHHJJ1d+kb1ftK9O81Rvu88GRYScmweAEz7c69wcDyPuhUooPg+8vjMSAq+lyvmrVvvTVxrkPjPgLYnnnyX6fm75+qBuMWA3PKr/FBr/TowHjk8p8ri7w2t4Q2Kujxl33ig=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7121.jpnprd01.prod.outlook.com
 (2603:1096:400:c0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 00:56:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 00:56:37 +0000
Message-ID: <87a5f6qj3u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 10/13] ASoC: intel: boards: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
References: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Oct 2024 00:56:37 +0000
X-ClientProxiedBy: TYBP286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::33) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 6245cd2e-c78f-40d8-7e9a-08dcecb43934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GxW0TQqiP9tAV3TJgG4CZq+voA/C/yGa6dX1k5wqvNtTFRHSG8zVrwUVumfR?=
 =?us-ascii?Q?I1o5GyWklbRiRi53VqFSmCqZSxIHg27M5lEAelRdq40XvCRtEM5lZTb7yxM3?=
 =?us-ascii?Q?hy7RM3qHjb36qTNZzmaDT7G1nGGbU12BQQJfH1ByYWAaN4EKbZlodYJ59TmO?=
 =?us-ascii?Q?EpgZyuTM8YWU9c3n6jQ/KhmnrH6aUKqBCbCNinpFqdJ4ReDBYaknCMWhrbav?=
 =?us-ascii?Q?DWT5AwtCfXSzNvZ0xbjKRIww/X3y8QlKtS5DsvYv+9oUHbkqZz8lfhz+hugB?=
 =?us-ascii?Q?sst551NP4DcfN+0ZmTosS3+qmdII2lqPwqM+Ux9HkNcuv7DO3AUMYyueXi75?=
 =?us-ascii?Q?pslCg7hzy5omWLbd6BgE6y30JFQ4j7TQ2g10j6QpGA4RjUsW+8yhLTjF2INi?=
 =?us-ascii?Q?vcY568SXL1ZZc5DZuDXDLbkMZoSAvBYUSvPDTN6nryq+mnKjh+R4F3xLP5XY?=
 =?us-ascii?Q?yIaoSUxph6mNzrb4IIdDqRQFKGs0ALhF7gygJ4KeG2z5WAWozt/FFg6yeW4t?=
 =?us-ascii?Q?5vUwiObptyLsNG5WwJxEULYG4HPCPVgHFQS89VI9620narUs6tU0EIo7hMaY?=
 =?us-ascii?Q?ZAT0jq4BqGCvme1QZsUszJFP2s54cJa+TrOOUA7p7eq45RYTe2i7QYYqCsHn?=
 =?us-ascii?Q?n48FGqq7dtd1xHEyywH6eVGkJN8Xpb5VR2fC/F8cqN/SlEmKvnLn7riR9aGK?=
 =?us-ascii?Q?1MamowfzbFkC5BkxKNIKv18tQrWBpuUKq3WHvmYwNxR16NouV2oH2VPqsgpd?=
 =?us-ascii?Q?YL8JVK4OGmxZD2dU8BtYH8og18fBHYVEaZuKHShZZGqkYmObdHlTCg6UFE1o?=
 =?us-ascii?Q?BvB8PzD/I72Y1GHL4O9VCRDqO+Hd/Xaf8fGoWiSsRKALYRi2W+hutaq9kOFU?=
 =?us-ascii?Q?zdSj3TzaKBoU5PT6w111rJMIEOeLgpuZsshsNA4Bby55Is8G9PLhemnK6N/h?=
 =?us-ascii?Q?VBWyMjA8yyvs4XqpQEOWO7d6W8m0hA+LKJrj1gubgxO5MNY5i5y7FbCB/vrh?=
 =?us-ascii?Q?DTvUBhYPzx06bGPJvWBq/wkWkJcggVvpvH8vTt5rG7JkAoFjx36z8i8I9aA0?=
 =?us-ascii?Q?7HsEmrz3p6GR9YBzMLvgl5YNdm3r6hhFNhwscwuBqIABrnPQYeJSKnmTBq+/?=
 =?us-ascii?Q?cyVum3HGHDznWiTmGul40QmJk5zBqVRrWuZ6C7ZNCCGF+VOOeAvZHVWHdlcf?=
 =?us-ascii?Q?fYZtAEOoLwkhD5ugdQNjFmXcBPR5gW7JcGo5ccrhBxVQ2x6T86db4d2x3Okl?=
 =?us-ascii?Q?qqagSRTXqna43B43H0p47pSldN5Blggf2boPgmR9d2uhUYzwgbESnkdvsTul?=
 =?us-ascii?Q?FpVV6cwrZhJySMvHA4KozPbId0rRgw8bni+idjUBM9Qa0w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vEXoTZ08WPMnyR0TcB8EmmeAOZ7KmCRmmz4ERpggmXqXCG6dcziNL7WbOnrc?=
 =?us-ascii?Q?TZaXSU9V5+au1iKKjhnnVeca3sWCx+7rs8WhY48mMDn+MuR8eBEq/aylHvoV?=
 =?us-ascii?Q?nw3SABeHaQ8zrZJdSr+PswTwBa3b4M89SQaD3iFMzftNJoaV0Cnc39VfPvbQ?=
 =?us-ascii?Q?wHZHoiDLL5hg1TTJKXh7xv7RBqoND+AHmWX04QsZa7bplgTf6BhuYSdjoVr6?=
 =?us-ascii?Q?m61l1y9DKYRTFq//MhdTgZngdySvGwuqz9XXkkFZT9aPUYPD81ajhv06BKUd?=
 =?us-ascii?Q?/XUl3/It5zZ7++hG8pKDaWGGoSQYmvZVPpRp5fCOHmlaljfWpCk0/r0Ow5RN?=
 =?us-ascii?Q?j+2CiLAOIZMx6NwbFy90U3flBZUQDHAi6kXTkKPBq/eOU7yF6rOn2izBRFeM?=
 =?us-ascii?Q?8BhpIXGCjJLpTImJYGgKMeMlobq7++BfmE8QOeKjPrVsxsLCuLmEA8W939mn?=
 =?us-ascii?Q?Z5NOFe36kld9rPPZsLXx55Az7wCv/Xa8cQ0d4L0JsQrp7T+Mh+UQZ6zhb2YU?=
 =?us-ascii?Q?i2uIu1RtfGVW4yHl4fj9pNBabTo2qBwdJepcs7q9lSX9O9acXZU5Di9RjcX6?=
 =?us-ascii?Q?tJ+nxqsDKuGDMBYAz0RSdAfPtOp/IWSpzsMJASxn8h0RQI9AgvLePh1JRsxP?=
 =?us-ascii?Q?sb4CQ1tSGA8mgkiZ6R6Hp1EfjF33FV2FdssrHWxEgTijTzO2pci7I0VOQXxU?=
 =?us-ascii?Q?nYEcsZENFD0rcQ02lhKxZhu+om/VcYFcP8PZlvVImxiVY5snklGZ/Vcz5CfV?=
 =?us-ascii?Q?/kQ5jklEH3z6pDPQH3Jyc19HHKie+NwLZPZz2Rp2JKG5xtk+iwKTieZF7zrF?=
 =?us-ascii?Q?uz1XEd0K23mtZysNvOQQr3wI1PDfByuUXXVqXl7J/qWZO6TLGGGIjPw8yQaj?=
 =?us-ascii?Q?jNN+IMeyr4FmU7tEg+JXcp6CtJmuQG3J2huYJlSLSHFuWoW5g74N7EKkM396?=
 =?us-ascii?Q?frm3Cr1vPguHkTMTkUzY2jhssc7FivCOfMKShOa7V+c5lpnXKqxh6KqoQknS?=
 =?us-ascii?Q?EegceSW+AUJ3Qg7x6bVhYnlJY992EgkIyUMSFOChPomN5KElGgxBqtM1Kg3u?=
 =?us-ascii?Q?Ep9cmniKdnl1uMC3OU65kOAtlUVVVaYaBRODAKrnB1ZyP03MYIOWVb8gDYoU?=
 =?us-ascii?Q?IorHR0WSV4+pxie8lNc4eKn2BMbVTBQSTOp0LujNnq7kcI9b0j49mHs2m6dx?=
 =?us-ascii?Q?iiwIFRKDB93jc5qepr2tlCplM7y/tMocgcx6xZqiOXjF6BiJnM++oBnWcKlB?=
 =?us-ascii?Q?+4AZCG9vghW9n352siHUYEyhoPqYxIhxwH63prD+jyLDekLoWa09Rtrn1geC?=
 =?us-ascii?Q?7hdITSpLux2ZgZNqdEOh4LO+k51T9fSExT/mopQb+m30BsiX6Q3Qvx8BIi7o?=
 =?us-ascii?Q?fWZgeeUFpZn38m876QxHTnprpmY4PxhdakUF7CjHmeJI+gtuxzWZmyxJ/99E?=
 =?us-ascii?Q?WNPMXN45m1It7Og0093Njjm1iLi6cPBRF0bw9pLAiK5oT2tdLelvnALsgNFM?=
 =?us-ascii?Q?CaU/pqCoebblQsWQgG8IJpI/sszpcYe4wZAwdfg39A0xFmE3rz7ZudlqDj16?=
 =?us-ascii?Q?KGe845+wx88VecKKLT2JaA3SK5n/J9SwQQzfd5T5FQJtxCO8p11hfBUuTIiM?=
 =?us-ascii?Q?WcmO52rU3wN/WfVVal2Ds3c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6245cd2e-c78f-40d8-7e9a-08dcecb43934
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 00:56:37.8899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fh6OyGwe90mp4ieU3Jv+2z8gjp3jerwEKfBxzafA107Z8TVBihqAo3XLOwXYOwiDLOGCRI+3WYvxaspOjZQ0qUJ/s5FnIJ/9HChDGHg3jAO0kDkaMrd7nk9ZkPBNrFfU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7121
Message-ID-Hash: ELPN4XHQGFN43UZSYVVUMFF6RWRUAX6P
X-Message-ID-Hash: ELPN4XHQGFN43UZSYVVUMFF6RWRUAX6P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ELPN4XHQGFN43UZSYVVUMFF6RWRUAX6P/>
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
 sound/soc/intel/boards/bdw-rt5650.c          |  4 ----
 sound/soc/intel/boards/bdw-rt5677.c          |  4 ----
 sound/soc/intel/boards/bdw_rt286.c           | 10 +++-------
 sound/soc/intel/boards/bytcht_cx2072x.c      |  6 +-----
 sound/soc/intel/boards/bytcht_da7213.c       |  6 +-----
 sound/soc/intel/boards/bytcht_es8316.c       |  6 +-----
 sound/soc/intel/boards/bytcht_nocodec.c      |  6 +-----
 sound/soc/intel/boards/bytcr_rt5640.c        |  6 +-----
 sound/soc/intel/boards/bytcr_rt5651.c        |  6 +-----
 sound/soc/intel/boards/bytcr_wm5102.c        |  6 +-----
 sound/soc/intel/boards/cht_bsw_max98090_ti.c |  6 +-----
 sound/soc/intel/boards/cht_bsw_nau8824.c     |  6 +-----
 sound/soc/intel/boards/cht_bsw_rt5645.c      |  6 +-----
 sound/soc/intel/boards/cht_bsw_rt5672.c      |  6 +-----
 sound/soc/intel/boards/ehl_rt5660.c          | 14 ++++++--------
 sound/soc/intel/boards/hsw_rt5640.c          | 10 +++-------
 sound/soc/intel/boards/sof_board_helpers.c   | 15 ++++-----------
 sound/soc/intel/boards/sof_es8336.c          |  8 +++-----
 sound/soc/intel/boards/sof_pcm512x.c         |  9 ++++-----
 sound/soc/intel/boards/sof_wm8804.c          |  2 --
 20 files changed, 34 insertions(+), 108 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index 3c7cee03a02e6..d25a7188f603f 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -239,8 +239,6 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(fe, dummy, platform),
 	},
 
@@ -256,8 +254,6 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broadwell_ssp0_fixup,
 		.ops = &bdw_rt5650_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = bdw_rt5650_init,
 		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
 	},
diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index 304af3d06d017..9484f34107876 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -329,8 +329,6 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 			SND_SOC_DPCM_TRIGGER_POST,
 			SND_SOC_DPCM_TRIGGER_POST
 		},
-		.dpcm_capture = 1,
-		.dpcm_playback = 1,
 		.ops = &bdw_rt5677_fe_ops,
 		SND_SOC_DAILINK_REG(fe, dummy, platform),
 	},
@@ -356,8 +354,6 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broadwell_ssp0_fixup,
 		.ops = &bdw_rt5677_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = bdw_rt5677_init,
 		.exit = bdw_rt5677_exit,
 		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index 58db09d9b6e16..523ade9f31ab7 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -133,8 +133,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	{
@@ -143,7 +141,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(offload0, dummy, platform),
 	},
 	{
@@ -152,7 +150,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(offload1, dummy, platform),
 	},
 	{
@@ -161,7 +159,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(loopback, dummy, platform),
 	},
 	/* Back End DAI links */
@@ -177,8 +175,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = codec_link_hw_params_fixup,
 		.ops = &codec_link_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index 8c2b4ab764bba..68a3d345dc25d 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -175,8 +175,6 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_cht_cx2072x_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -185,7 +183,7 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_cht_cx2072x_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -198,8 +196,6 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 					      | SND_SOC_DAIFMT_CBC_CFC,
 		.init = byt_cht_cx2072x_init,
 		.be_hw_params_fixup = byt_cht_cx2072x_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp2, cx2072x, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index 9178bbe8d9950..31141d4b6b256 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -174,8 +174,6 @@ static struct snd_soc_dai_link dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -184,7 +182,7 @@ static struct snd_soc_dai_link dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -197,8 +195,6 @@ static struct snd_soc_dai_link dailink[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index d3327bc237b5f..62594e7966ab0 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -315,8 +315,6 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_cht_es8316_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -326,7 +324,7 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_cht_es8316_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -339,8 +337,6 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_cht_es8316_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = byt_cht_es8316_init,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/bytcht_nocodec.c b/sound/soc/intel/boards/bytcht_nocodec.c
index 4a957d1cece35..fec23bda9e643 100644
--- a/sound/soc/intel/boards/bytcht_nocodec.c
+++ b/sound/soc/intel/boards/bytcht_nocodec.c
@@ -119,8 +119,6 @@ static struct snd_soc_dai_link dais[] = {
 		.ignore_suspend = 1,
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -130,7 +128,7 @@ static struct snd_soc_dai_link dais[] = {
 		.ignore_suspend = 1,
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -144,8 +142,6 @@ static struct snd_soc_dai_link dais[] = {
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = codec_fixup,
 		.ignore_suspend = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp2_port, dummy, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 2ed49acb4e36e..410eb36c37c93 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1546,8 +1546,6 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.stream_name = "Baytrail Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_rt5640_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -1556,7 +1554,7 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_rt5640_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -1568,8 +1566,6 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_rt5640_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = byt_rt5640_init,
 		.exit = byt_rt5640_exit,
 		.ops = &byt_rt5640_be_ssp2_ops,
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 8e4b821efe927..67c62844ca2a9 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -770,8 +770,6 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_rt5651_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -780,7 +778,7 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_rt5651_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -793,8 +791,6 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_rt5651_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = byt_rt5651_init,
 		.ops = &byt_rt5651_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 0b10d89cb1892..a6dfbcfdf74e3 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -462,8 +462,6 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		.stream_name = "Baytrail Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &byt_wm5102_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 
@@ -473,7 +471,7 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &byt_wm5102_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -490,8 +488,6 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_wm5102_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.init = byt_wm5102_init,
 		SND_SOC_DAILINK_REG(ssp0_port, ssp0_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index d7c1148588331..36984de8a0679 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -351,8 +351,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -361,7 +359,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -374,8 +372,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 					| SND_SOC_DAIFMT_CBC_CFC,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index 7651b83632fa4..4afb292d4f13a 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -193,8 +193,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -203,7 +201,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -217,8 +215,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 			| SND_SOC_DAIFMT_CBC_CFC,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index ac23a8b7cafca..b977a2db73a3a 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -448,8 +448,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -458,7 +456,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -470,8 +468,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.no_pcm = 1,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index c6c469d51243e..aaef212cf44ec 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -358,8 +358,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(media, dummy, platform),
 	},
@@ -368,7 +366,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.stream_name = "Deep-Buffer Audio",
 		.nonatomic = true,
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &cht_aif1_ops,
 		SND_SOC_DAILINK_REG(deepbuffer, dummy, platform),
 	},
@@ -381,8 +379,6 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.no_pcm = 1,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &cht_be_ssp2_ops,
 		SND_SOC_DAILINK_REG(ssp2_port, ssp2_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
index 90d93e667bd9e..ebc417c04a500 100644
--- a/sound/soc/intel/boards/ehl_rt5660.c
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -178,8 +178,6 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "SSP0-Codec",
 		.id = 0,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &rt5660_ops,
 		SND_SOC_DAILINK_REG(ssp0_pin, rt5660_codec, platform),
 	},
@@ -187,7 +185,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "dmic48k",
 		.id = 1,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
 	},
@@ -195,7 +193,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "dmic16k",
 		.id = 2,
 		.ignore_suspend = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic16k, dmic_codec, platform),
 	},
@@ -203,7 +201,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp1",
 		.id = 5,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp1_pin, idisp1_codec, platform),
 	},
@@ -211,7 +209,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp2",
 		.id = 6,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp2_pin, idisp2_codec, platform),
 	},
@@ -219,7 +217,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp3",
 		.id = 7,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp3_pin, idisp3_codec, platform),
 	},
@@ -227,7 +225,7 @@ static struct snd_soc_dai_link ehl_rt5660_dailink[] = {
 		.name = "iDisp4",
 		.id = 8,
 		.init = hdmi_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(idisp4_pin, idisp4_codec, platform),
 	},
diff --git a/sound/soc/intel/boards/hsw_rt5640.c b/sound/soc/intel/boards/hsw_rt5640.c
index 1826a4dfd0f35..9bb2822ba63e3 100644
--- a/sound/soc/intel/boards/hsw_rt5640.c
+++ b/sound/soc/intel/boards/hsw_rt5640.c
@@ -85,8 +85,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
 	},
 	{
@@ -95,7 +93,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(offload0, dummy, platform),
 	},
 	{
@@ -104,7 +102,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(offload1, dummy, platform),
 	},
 	{
@@ -113,7 +111,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		SND_SOC_DAILINK_REG(loopback, dummy, platform),
 	},
 	/* Back End DAI links */
@@ -127,8 +125,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = codec_link_hw_params_fixup,
 		.ops = &codec_link_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp0_port, codec, platform),
 	},
 };
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 24f716e42d6a3..50e846d67c194 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -217,8 +217,6 @@ static int set_ssp_codec_link(struct device *dev, struct snd_soc_dai_link *link,
 
 	link->id = be_id;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
-	link->dpcm_playback = 1;
 
 	return 0;
 }
@@ -268,7 +266,7 @@ static int set_dmic_link(struct device *dev, struct snd_soc_dai_link *link,
 		link->init = dmic_init;
 	link->ignore_suspend = 1;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
+	link->capture_only = 1;
 
 	return 0;
 }
@@ -326,7 +324,7 @@ static int set_idisp_hdmi_link(struct device *dev, struct snd_soc_dai_link *link
 	link->id = be_id;
 	link->init = (hdmi_id == 1) ? hdmi_init : NULL;
 	link->no_pcm = 1;
-	link->dpcm_playback = 1;
+	link->playback_only = 1;
 
 	return 0;
 }
@@ -361,13 +359,12 @@ static int set_ssp_amp_link(struct device *dev, struct snd_soc_dai_link *link,
 	/* codecs - caller to handle */
 
 	/* platforms */
+	/* feedback stream or firmware-generated echo reference */
 	link->platforms = platform_component;
 	link->num_platforms = ARRAY_SIZE(platform_component);
 
 	link->id = be_id;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1; /* feedback stream or firmware-generated echo reference */
-	link->dpcm_playback = 1;
 
 	return 0;
 }
@@ -407,8 +404,6 @@ static int set_bt_offload_link(struct device *dev, struct snd_soc_dai_link *link
 
 	link->id = be_id;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
-	link->dpcm_playback = 1;
 
 	return 0;
 }
@@ -448,7 +443,7 @@ static int set_hdmi_in_link(struct device *dev, struct snd_soc_dai_link *link,
 
 	link->id = be_id;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
+	link->capture_only = 1;
 
 	return 0;
 }
@@ -496,8 +491,6 @@ static int set_hda_codec_link(struct device *dev, struct snd_soc_dai_link *link,
 	if (be_type == SOF_HDA_ANALOG)
 		link->init = hda_init;
 	link->no_pcm = 1;
-	link->dpcm_capture = 1;
-	link->dpcm_playback = 1;
 
 	return 0;
 }
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index fc998fe4b1960..a927078768519 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -455,8 +455,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	links[id].exit = sof_es8316_exit;
 	links[id].ops = &sof_es8336_ops;
 	links[id].nonatomic = true;
-	links[id].dpcm_playback = 1;
-	links[id].dpcm_capture = 1;
 	links[id].no_pcm = 1;
 	links[id].cpus = &cpus[id];
 	links[id].num_cpus = 1;
@@ -496,7 +494,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].ignore_suspend = 1;
-		links[id].dpcm_capture = 1;
+		links[id].capture_only = 1;
 		links[id].no_pcm = 1;
 
 		id++;
@@ -539,7 +537,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].init = sof_hdmi_init;
-		links[id].dpcm_playback = 1;
+		links[id].playback_only = 1;
 		links[id].no_pcm = 1;
 
 		id++;
@@ -569,7 +567,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			links[id].num_codecs = 1;
 			links[id].platforms = platform_component;
 			links[id].num_platforms = ARRAY_SIZE(platform_component);
-			links[id].dpcm_capture = 1;
+			links[id].capture_only = 1;
 			links[id].no_pcm = 1;
 			links[id].num_cpus = 1;
 			id++;
diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index 8d237f67bd067..68380b738d883 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -246,12 +246,11 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	links[id].num_platforms = ARRAY_SIZE(platform_component);
 	links[id].init = sof_pcm512x_codec_init;
 	links[id].ops = &sof_pcm512x_ops;
-	links[id].dpcm_playback = 1;
 	/*
 	 * capture only supported with specific versions of the Hifiberry DAC+
 	 */
-	if (sof_pcm512x_quirk & SOF_PCM512X_ENABLE_SSP_CAPTURE)
-		links[id].dpcm_capture = 1;
+	if (!(sof_pcm512x_quirk & SOF_PCM512X_ENABLE_SSP_CAPTURE))
+		links[id].playback_only = 1;
 	links[id].no_pcm = 1;
 	links[id].cpus = &cpus[id];
 	links[id].num_cpus = 1;
@@ -294,7 +293,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].ignore_suspend = 1;
-		links[id].dpcm_capture = 1;
+		links[id].capture_only = 1;
 		links[id].no_pcm = 1;
 		id++;
 	}
@@ -341,7 +340,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].init = sof_hdmi_init;
-		links[id].dpcm_playback = 1;
+		links[id].playback_only = 1;
 		links[id].no_pcm = 1;
 		id++;
 	}
diff --git a/sound/soc/intel/boards/sof_wm8804.c b/sound/soc/intel/boards/sof_wm8804.c
index facc6c32cbfed..51922347409f0 100644
--- a/sound/soc/intel/boards/sof_wm8804.c
+++ b/sound/soc/intel/boards/sof_wm8804.c
@@ -167,8 +167,6 @@ static struct snd_soc_dai_link dailink[] = {
 		.name = "SSP5-Codec",
 		.id = 0,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &sof_wm8804_ops,
 		SND_SOC_DAILINK_REG(ssp5_pin, ssp5_codec, platform),
 	},
-- 
2.43.0


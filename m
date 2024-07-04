Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56517926DDB
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 05:03:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EA4AE85;
	Thu,  4 Jul 2024 05:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EA4AE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720062227;
	bh=V2iOgzXgIHmBNiiqYXq/fjdT02+J89ER2dn04lUduVQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OauK0X9i5FyVP/RVrKjGT4dik28H6sfKbTxK0Uc1iYpeuOksRDbun/Lw1Oy3ZMOgp
	 8Z8/sfJd8h4osoKuZW2CjxOwVB4sLbidTVmd2wYpT5uIn18GGTcjIzRXjzaCp0ykay
	 vIPLuJRBQcyg+Rh5Ar4iM1OqFiWFQj2h4FU3RIiE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4463CF805D9; Thu,  4 Jul 2024 05:02:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 546A6F805D7;
	Thu,  4 Jul 2024 05:02:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00158F804FC; Thu,  4 Jul 2024 04:54:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6807F800F8
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 04:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6807F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=S4XgmKub
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbDN0mjCY6YRBVNloZKwRauuFCr769GrckjizwW8UPcPCPHT+kk2nVlvT6l7xMZ/hiM+Rksc/AxJlLd+5w35Qb6Ezk+Gtj1KBSd4HaiRjUZhcMopDh62PJCHYZK3m0f38jeYah3/iB9Q0ZV3wfe7XaOSg3XE33+w+z6zbDpnC5Uh5kq9Kk6m/Q5gju+7/zjwYIowqjnhnlmNkHsJvx6PRf8AsiKVp9hW2GvSQZeo/gKRmFsroL5C1kk68wZwFN3081/3fEZX7EK9ZUzPMm1Aad2mQD/PC7pQQua1I8zQCZOZQZwA762qu8tFdjTYwSPi3lQsp9LWOs5q9kJP8BowtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPeEvk3F2QfdYVy6icxAF81gZvEoG+nbeyejm1TEH18=;
 b=OTDmdxgSJo8dxHfNXCOFTo0ljEN8WBsw1E9XEFt8Bu6oXk3Hcalme7KhP8qltYtas/sEM6wFRFIT9blFuxLKBqfxrYnkXHMuMF8WEmcsCDpAv65eXyzK/jyOoWLuNuIQ6gwaU7DWvDaJaxoWiW6kH7MxPgCHiljgbqPQMKSTmVuuet9cRhVgoJuhDYYJeg8BdysF8ZEKOdcLsyAh16u8DGtXchuI1eoBYr1pAK0IJEqpILmYXianDEPlLsvH+cp4MS3VnuINmLOhQ0EsHVCm3lvHfwo7GsfoReek6yixXihBy+Gs/c0MmkQ2SSI8fh4as50Xl0lRycSiVNQgUWwFmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPeEvk3F2QfdYVy6icxAF81gZvEoG+nbeyejm1TEH18=;
 b=S4XgmKubGabfUI+A6zPdHmbxh8fjCG14yBNnudlRwfKpESMBzjJ9Qj7wCluhbe8C9TugvGERP1eqEMwmzjmVSo/Rp1Wjw3y8y1xk1BTtnZVCpNiVccA26htAdVahbm9ZLrhwDakOk0X0R8GhcvVzcCuRWVN2+44zUxiGijPx4yk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9652.jpnprd01.prod.outlook.com
 (2603:1096:400:220::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Thu, 4 Jul
 2024 02:53:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7741.027; Thu, 4 Jul 2024
 02:53:54 +0000
Message-ID: <87r0c9ooji.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 08/11] ASoC: simple-card: Use cleanup.h instead of
 devm_kfree()
In-Reply-To: <20240703-asoc-cleanup-h-v1-8-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
	<20240703-asoc-cleanup-h-v1-8-71219dfd0aef@linaro.org>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Jul 2024 02:53:54 +0000
X-ClientProxiedBy: TYCP286CA0258.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9652:EE_
X-MS-Office365-Filtering-Correlation-Id: 10216d57-eb90-49fe-6fc0-08dc9bd48ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Rmt0st+6GFAhOogB15hXfcaJA4O5bxVoxRdeGkVIHb9ZCVEwGtkE+OSPR81/?=
 =?us-ascii?Q?uFP/2s89/R07XhwxuZyYGU2wA2sqm1SNuJdYIVbBGkTGN45QlKle7rdOXeYQ?=
 =?us-ascii?Q?DaRVZUnAdCgv/uuZQjuYKtrTfymEBdpZT03WHJSKigzdo6UqIR+zMnaXG+wg?=
 =?us-ascii?Q?leJmBY/M9/5dDc4PCIhZSbUnq1NTv6WAy0qWOIlhOU8Uo+9slLLYdOHtLJ+Q?=
 =?us-ascii?Q?zGcBDZHXxe8HHp8KtXVaU2L7MEY1xrTgFD8hjORONxGsFD6fdFEWgLvv87a2?=
 =?us-ascii?Q?YEcKlOwgmapTrj6ZCK/n7D7AGlteOFOoexxih4/RHqAChu8+so5CLxa3IeAv?=
 =?us-ascii?Q?jAcQJ8Lr7XWZ7A4ijXW7gd4P5YkHiIbp5I/cRhT/r25WGJMyj2sO6/SubfCG?=
 =?us-ascii?Q?TGK4zOMM2YJMxPuqSHrOZmD3nI/2tlnwlLDzG03l2FQ8Riv9M1jSqhN0jLSa?=
 =?us-ascii?Q?lUJa6SRvVTKlPgBtW3yStz3NXyEaHDBJ7emnTnRPFadHPHAhEtksCUuYaprI?=
 =?us-ascii?Q?MeyX5dBr5MfXecb8IdGdgkviPduUIuBSs1ihDzrwQeHGI+8039SuBVd3++11?=
 =?us-ascii?Q?tXsGSZbhnfH2hCKs5LIXHCjUPfnCrNtPD2m1a+ZAceFWQhh++vT+CbOvpJCK?=
 =?us-ascii?Q?Ax2IliC2iacnGaQLsU4DjPG4daD9HYandGfuw3ExZYe2GzWK3K84365rmBJ3?=
 =?us-ascii?Q?4l8JBDuC7Q9lPj3PCJppFnWpltqcAPA4UnqZz0z5OBntoEOfLTBwcWjUCQNH?=
 =?us-ascii?Q?SFVhH6Mliz4syCQ7e6Wvjg55b2XK7RK+Rnk161EHljq3kxA4E+RL3fyycfyi?=
 =?us-ascii?Q?9DjAZu+y1cnWyKhoSwMZ3xGkxQJ/E7l0+dQbLPsl0TDB1OmiLztcp4URNqyr?=
 =?us-ascii?Q?sug9LD6qdDBxBU5r/xfeIQrr+18u0Hvc+0ki/YF7/RgcBbJ8OodeN4HLDoyP?=
 =?us-ascii?Q?fYKXEkaKhrRF5A6qk64d9hlUUfRyUYE1BnF6ePNj3t+T1On/63NXdJiIsvTU?=
 =?us-ascii?Q?YAsMIXvfFtHpMlbDv00+ZgWojGdFbqA+/4uyfqCOwYIxn203SSuVKgqdvrT/?=
 =?us-ascii?Q?kz9UIF6fFImaAAUg4FoHRcOEjTzfwN8PfzZ3KyxOPkNHgSyPKtuAU+sdLC1o?=
 =?us-ascii?Q?QGUnnzGPykQvO7c6eACyi2Nd54DOE5I9kU+nJXo/cVshxxt+Y98ag9Mhe8qY?=
 =?us-ascii?Q?Eq5xVJ9sNEx+wV89+XO5TWlLcdzrxflimM0rW5PIzVeaCi5I35RmrrojqPMT?=
 =?us-ascii?Q?eoBVZrjdDMvVwuV77Sv+O0pjnv9fjRCqTwpaup2Bjcg+D15dWo9O0D33UQ0Z?=
 =?us-ascii?Q?GZDxz0ZF2PGQhCH3A3qka01/mmoxpHMVoq7pHkob7pJVZsMnvqrCZcYQIJ3c?=
 =?us-ascii?Q?nAN4GQ6no5AIKhO9GXVwGJlcOefNpy8pMFuV9hG2qGCVbJv/mw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y6Y1Vxq3CxTeRitHq+l/AR1I31P71bxXnKYsWy05aqY+Zs6adxts0Vgy7mmA?=
 =?us-ascii?Q?SnBwyKoTG/Csbx0GTFowFPJ5/vuu/gtFS6uJ+tWxRSPvReCAT6fDgx1ODxHH?=
 =?us-ascii?Q?dpFg0JjnGe3VME3uRANR4mVUH8RoND/jxZz0GTwqNiDlvLOoFILU2tTKymvQ?=
 =?us-ascii?Q?xY2fzIC+H/QMRKbQ4rgLqx7QF2V1IZvcFNl/UBBuClUjM35Zrz6dsGcZeFjn?=
 =?us-ascii?Q?E/IXa+ZLMHn81HhpydcLK3bLW1+OlUuS7zK5k4NAfN0Mz9jX7WEj2ufA5gpE?=
 =?us-ascii?Q?YrGWadpCgrev4DMbFJMpmU921vFqeVM9BEE3y4RhpkXmOru4cTdlXlILuFjX?=
 =?us-ascii?Q?r7wuPbbi7fh+23G2zxKxERW3KhsSLR2Bic2BtcXAS4LOO4NPc/aXWrlGkg+R?=
 =?us-ascii?Q?7jVaBN1HFGrg6NM9aJcsy45Hc/1SOTBcW7tDGmkqOo99Qx6hx6yNGBmmAPG5?=
 =?us-ascii?Q?p3xVV+GOcGgnSwLsPuPKBJfiWRyyZ8YfgWhcl7m5Mr/PmsBQJKBbua68HRPP?=
 =?us-ascii?Q?7yPsqM+tHSQ0TrP0W2fBrMS/ZNigJmUP1t0V68J+KlQNx0RrOvdLXS5wlf5E?=
 =?us-ascii?Q?WrxxeNyn7THObfT94uWw5fp19KXxJS6HSlXZ67uGDRwOrUS8/m9HlmS7g6Oc?=
 =?us-ascii?Q?73ZlHM92GZLKAIgu00RvuXUxwDbEM05IKo0zgX13T9zbCEHA6Ux2pspj//Xf?=
 =?us-ascii?Q?XqAvJTd3XOYLzl5JNWEQ1LlbNowvb9q52yYxjTqnqStvbKE75ELouEl6OuN1?=
 =?us-ascii?Q?vIxtZ/wF6Y1c4ORN9V8iXQfNgPBwss7PlHNe5CnCfUQkKj8R6ilk5LARJl6h?=
 =?us-ascii?Q?O7CrOgWUGks+ramK2J99jRGkQ51UgWMn8hfWH+JmnnOYvcPjovcqS5pfjyWS?=
 =?us-ascii?Q?h0oPaabbN6s9Me2qj7XAvpBPOVmShN6vYoMzC6mh5zTuh0TAgEiw2X5+7z4o?=
 =?us-ascii?Q?Mk9UEar15TzoEDtc4j5kUtqx++b3oyKkjoiD6bWutRa4nUh0Sp7GyERC31/0?=
 =?us-ascii?Q?kiodLpRs0+Gw2mXS0KL1szyhBIb/FUaAd/a+lFyyUHuBJSj4D8n59j+M9n+u?=
 =?us-ascii?Q?kVCeMoZe5Kj21WwsxPDIhhe0YSymqpfmDODPg6Yr3CEB3jq/4D0PvDqAOlid?=
 =?us-ascii?Q?HjtXDE53i1qrPFA2IUABH6gqoIRmzmRJdV8WvqZbGGaevupJYZLqpz39f6B9?=
 =?us-ascii?Q?VcSGXd7XHeIVHupF7vInohThtDmgWsz86AFruAlew0WGbp9j6YgPMA6Wdy7L?=
 =?us-ascii?Q?DDSFzSS62cWhB1Tq3vzqt5pvDVzLvuWz032Rrb0Wjt6m2WhQUdeHA0dm6RxC?=
 =?us-ascii?Q?pP0FbGBsar/1yviOdqqkJYGBnXAkFZ2Nnngz1xfSl6pYhkgBqY/OmcLBGeoq?=
 =?us-ascii?Q?Ukam45x5OwcvkXZ0TkvCBL/YOFgX71ekSsrI3DGn24ICCts+yHGJzZRWq7x3?=
 =?us-ascii?Q?k7peFnhj/agJeKNX5vrKwQ1QY7nmOd315W5SQq/nTD45I3sJYGE2BoQvq8xg?=
 =?us-ascii?Q?bpyKHwmHpvcplnC2yGmKQwvgUqo35403EWmDahCgV5HSOvvq8CgM/UIf1d4S?=
 =?us-ascii?Q?3LuyIRoGdWHnJuvCAFUGacGQ/kjAKoZ3p4lj7zu6HXLHQPtpRDgHfC4Miw8d?=
 =?us-ascii?Q?hWEZ28PKjpD0g2ippsk5Z+k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 10216d57-eb90-49fe-6fc0-08dc9bd48ab5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 02:53:54.3454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 W6SfBQaT2OMedDQlBAk3mM2O2SVDmjJlkL86YEyHkyYDdqMl5Fj0mlRkTqTjcU9OG0oCM7CWINT1fGYQVYetxvfGUXleyBOrwmK/0zvwgPlmi/sMQ8uoXyyaqbeCrbqO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9652
Message-ID-Hash: EISHGYTI37SDBZRNNGZI6POPAIEWNXK2
X-Message-ID-Hash: EISHGYTI37SDBZRNNGZI6POPAIEWNXK2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EISHGYTI37SDBZRNNGZI6POPAIEWNXK2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi

> Allocate the memory with scoped/cleanup.h, instead of devm interface, to
> make the code more obvious that memory is not used outside this scope.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto

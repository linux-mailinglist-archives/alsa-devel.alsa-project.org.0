Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2068A462F
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Apr 2024 01:41:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5381514E9;
	Mon, 15 Apr 2024 01:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5381514E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713138073;
	bh=znjhq76LB25TyZRG6PAppShEscNRynWTHmazJhDFVbw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ct7HmNOcaAbFGwizwzNZhwDnI/McEXUjid3n3VMjFtNXsu9OSNxeLd2UqqiSxjXLA
	 ncWBZD2ESEVr85mN38IiUFPF6erlN6utOQSIR3aPM0ETL/CXjyL81nPju2mNyTqkqH
	 93a0lgWrwPbr1/Lm63F3C9s+dIQdAfnMo8yAMBMU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B220F8059F; Mon, 15 Apr 2024 01:40:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A26DF80579;
	Mon, 15 Apr 2024 01:40:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5788BF8013D; Mon, 15 Apr 2024 01:40:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DC6AF8013D
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 01:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DC6AF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KHe7v4CL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAS9M/D0Vv5hnWNm+WlI7v0X+6JiDy4gLKIO6qCbsZe+ojCU+U+Cr9wI4+qQzAu6yN11DvTbneAYYYvPkt2xn3mexPTTZnybLbAPnDwlgd3465a/Lsx0Z7+O2WAhqozvh8obkZTpqkOwQBHgmBk+16tzLle8EhIJmFEDjcnLtT/dYMql0jgTkcWU6zv4emwm/Q7Ftj1wNj+DKHTpDs3Ji5eveNEFRoIndPjNIOsdDGnzrkTP70V0Agc8fB6KGDemK+8oSVGW8NGb9wooifDGxw0hTispNe6xukqyE50i+jpX03wfi2H5d7sbiFJ65YtpWyezI3pdXfPV+sQij8cvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxUcpX37Qo+B8f5CTx+bX377hRd6hnWaBOrY9nKiODc=;
 b=JUMEB+dHkcotmGkr47uDO9PzVaC0Kty8cCVrRUXPhd1gxCXqcaEKxfw/u0EFUfKIOVcDfDw+0vuKDIRLqLTHDF7j6FL6/GZZJ+/biNZnebovaMdQllTEWxNnxS7AkHQGEZa7xZYvGoeKqJJq7nPyhrdkESDoz1Q0C9lTbUBVmpaxQOHiyFDqvTxlcv/jgeLDoeUvhYVAgWFCeMf13QtAoctQWTsvQsn+AEEclH7bVhp4gL494SubibhD5Hyx8Rem/uU7RB++t03WM7i8ZZQDpkU/4CSYbu+v6mC09HqgatwL1NeU1Ujt4Kks74xnTgUCYA8UL+O/t2sKgUGC044/yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxUcpX37Qo+B8f5CTx+bX377hRd6hnWaBOrY9nKiODc=;
 b=KHe7v4CLmI59mrmAQer9nQovb1NUGaUwpHvOHMEMmdZxj0wxX4tFM3zJsUMzfXKS0ITXJW1CFzQlWnJ32J3OXa0WGNXj0ZiNqxwrCf3AsoFj4h3sczAYscR70gVx0x9uMeymhP1RxuxRYo9WR1chXx4ePQsAw2N9IasixL2A6A4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11317.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Sun, 14 Apr
 2024 23:40:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7452.049; Sun, 14 Apr 2024
 23:40:15 +0000
Message-ID: <87wmozcy3l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Jerome Brunet
 <jbrunet@baylibre.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH v2.5] ASoC: Replace dpcm_playback/capture to
 playback/capture_assertion
In-Reply-To: <87msq2kjvo.wl-kuninori.morimoto.gx@renesas.com>
References: <87msq2kjvo.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 14 Apr 2024 23:40:14 +0000
X-ClientProxiedBy: TY2PR0101CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11317:EE_
X-MS-Office365-Filtering-Correlation-Id: 57b3a4e7-873f-45ee-c8b0-08dc5cdc3bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YslaGKgft60prGpCJ9z02fq1E0TVEbJkxa2tVzcGQJMWOO/RlcmXCEOYr7zHpDqxX6/c6CdRgJvpigUe0azZwSwAOfDlkbdG2yUWMXmY5TYHFk0fpFB06Fijkf/2jOjdTqh4mnkI+vIMOfywnkfF0DSZfydXThT/My/pVBqrnPY2xcrnNbXhTV1PQmel6/pH+aGXPWQcn3RXNh3yCurENbSg0D/D9TjO1avj99LAkKyOfypZRQtnIxNkuf96CULs7vaGcpIBsHrYBajT9LORdRHJscxP/STCN9J0Rf425cGkaDjTwTXyzzw4YKJ28Dhb4tr/oSP6WqVeMFVsQBydZhTR5EInn+RK/NPyP79dKb4ZbcvaOPBkU4g3GHz2K4ewLkQeNU1CodR25KlbYhZFgzmqgzSYhISPmpUFDB0XKBn35ga1TuCUgN8rBn0FgmtfmKUMGtKy6NjiIt3SahqT1bgjwee3FCSu/AH1VTs4HxWfcpj56XgABBnKiwV/J7bKwVJlAAbdIxs+j9CJQr+CRAx+rlaB523EBuLbXsmR22dm2etmKSvxYfJqL+hooxe8j4pW9QvMI+VyW+90t3t9z+uJYtIpV1Yelnuo0diGck3va08cRypwoQllyi9mx0Qk/+EN6v/aVrkMoM1XTa3mYQUcja6iGJTv5smtFGT3rlzu6J4oC5A5jlcAUXe5dL0WnQWMLM3+2jr9HHZxCwQWuW86zVOBgybuis/Tr5e7TEs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T7H5GXoLr0frZJLEsM4ampm4/Z1HYqsOI+PSxtRfaJL9XK4ExeMu2luPCvYZ?=
 =?us-ascii?Q?CBj8DwXzao1WsG+c1FE0mPkEG2VaRsC4OWQd6ceBNbyr0xpwF3Tx1WrbScUF?=
 =?us-ascii?Q?KK9fSjp3BzuiocaVX5K5THQl0B9hWp6u6yi9Kr1E4oUZTxemUo0ZwOzH5pK6?=
 =?us-ascii?Q?NWEZU0e8+vAl5tfNXd5b1gH/127DLcYnJtjFVCnRh+2xdWIhMVzr+utNBSJh?=
 =?us-ascii?Q?5K17KEASBLDnu6dh+Tutz+16zpZZpzh+tI43bfIoj4ypgdyQlM+rMSliqoV+?=
 =?us-ascii?Q?XvXtxewigHLo5N/LJjvHBYBgI7p+sU3AyeQajJq3GXz8vBDen/NyepgAG2B3?=
 =?us-ascii?Q?GJVwTuQVCRYpwzxQNCYseb1qcAo0pTmAyXhxjMCin9Hs8ff/QTi7sL5C1R1Q?=
 =?us-ascii?Q?GKlfwBzrU5fl3t3+iIJRl2fnOPkNGADcpCyORh4QcxhLuqPp92ID2nGiPfNy?=
 =?us-ascii?Q?pwydy96D0nALvEDtDMDHAm9joJtIv3ToAEr1orIw1WgmYW14/DIdx6SsPOOc?=
 =?us-ascii?Q?YWHz4KfELD3K3BDwZfhA2B/GX2JxfoucCap4l4FnmBvfoBqp4LZ3RPoVYdy5?=
 =?us-ascii?Q?+neBo0M3A9k1DtJJBLnqkm8zi88mioSz/p2Vw/BwWTq1Kl2xsSTzPhuncFmP?=
 =?us-ascii?Q?8zQHTrWOPjAyoxCkwhf7BNlQFBEwI01fYSe/9b7zvTO3QbIMWLyn0mPxNsLX?=
 =?us-ascii?Q?bi4ZodrbbXUEues5a6cnOGblkIjg18E9HR1TdtWQN164yUMLNM1PIcDPjz/A?=
 =?us-ascii?Q?y/g+wTdKaa16A1xFgZC9GCCU3X7eo4vIYCtnGZrOFIYxtke4RcgN13uFl5EN?=
 =?us-ascii?Q?8YOTytJluGVu1giqd7n+2i++B8Onv8PZQb2BoaakPerdXfDArSAiLj8XOyDv?=
 =?us-ascii?Q?yxXxmd7V26uNvA70m6DRC4eHYodpZIsquE3wtThSdJuRsbuFoHzSkmoy7Amq?=
 =?us-ascii?Q?Qx5FQtMICb4/ytTECm0NhwXbz8uM+ix6iKjnSKqgA4s01azXgY+U5Q+GPy0+?=
 =?us-ascii?Q?5gNTkjLRQG0BLquBnxITawQZrk3gna/nQ35Y5rLBr2lYjegCXTzo3kCjj2EF?=
 =?us-ascii?Q?pzOeKyUGXuoc8Fo1GCbBuIQ1AKXlSFhd1LOotgYR+/V5vq2ufDbLyJghl6l+?=
 =?us-ascii?Q?FjlHJeHJC0cUH4xMT89O3AIBOVvz7L9jzb+p8c+YK0TgcU+8ioMmmDF9OJZ8?=
 =?us-ascii?Q?JA9Q2ImNkXut9d9ihC7umooNjf2UFNV/dW/yqjE9eZO+RdnOjfuEFb9tS35J?=
 =?us-ascii?Q?DlnOzznNIfCKR+pSqMbChP0m0+Oqshu4TRQibEsX0XAQkCYDULsyKNp0sn2X?=
 =?us-ascii?Q?UauHQi7zjKB+V7EOwwnM49m6Jdc8tRzQf1DJzLlOQIbePFDEOpLwuMq1XUDj?=
 =?us-ascii?Q?AboZvTMakv9VASQ142ReuurtE/WeIb4fKYlaoYzJkLisik+H0GdJwLfrT375?=
 =?us-ascii?Q?V0Go/ucD0Gp/Wu5TKMKJ0S/iztnmZJvMwt5+hEvHSQdfUfHP+SHefRGxgvBM?=
 =?us-ascii?Q?C2AdmkR3oPGPpQwQQVstMzozjUKjBawGR/hx3nEheVO8/Q04fyDiDepNmFZf?=
 =?us-ascii?Q?Hbt9wG6D3eo3/TxdWYw/b8AudLFjL+WaC+Ei5xfzC1eCq59Jdhk7rNn598OV?=
 =?us-ascii?Q?JZ2BGpY7DVUM09EPc85ZKzA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 57b3a4e7-873f-45ee-c8b0-08dc5cdc3bd0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2024 23:40:15.2315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 sWZnEH5x65JUv19STvc6zeeGtqWgFkhL6olWTXdPWk7MzpXPQJ/dQ4+PsuMuh9pGn2ueKyCcQT9cV/bBx2pdCikvzXztkK6IK5mTKfjzq21CLmlJf28JPER7pcrBLAtK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11317
Message-ID-Hash: NKZ5YCZJQIEMTRVR6CUV53VCLMZMF54T
X-Message-ID-Hash: NKZ5YCZJQIEMTRVR6CUV53VCLMZMF54T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NKZ5YCZJQIEMTRVR6CUV53VCLMZMF54T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, Amadeusz, Jerome, Pierre-Louis

> [Flag style]
> 	unsigned int flags;
> 	#define SND_SOC_FLAGS_ASSERTION_PLAYBACK	BIT(x)
> 	#define SND_SOC_FLAGS_ASSERTION_CAPTURE		BIT(x)
> 	...
> 
> [BitField style]
> 	unsigned int playback_assertion:1;
> 	unsigned int capture_assertion:1;
> 	...
(snip)
> So, my suggestion is that next v3 patch uses [Flag style].
> And after that, post new patch-set to switch
> [BitField style] to [Flag style] for other flags.
> But I wonder is this good approach ?

I would like to fixup my comment above.
Actually, I have no objection about current [BitField style].
If there is no special opinion/objection about this, I will post
[BitField style] in v3 patch-set with assertion flag
(= dpcm_xxx, and xxx_only compatible).
Switching to [Flag style] can be next topic/patch-set.

I will wait comment mail until end of this week.
If there was no comment, I will post v3 patch then.


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

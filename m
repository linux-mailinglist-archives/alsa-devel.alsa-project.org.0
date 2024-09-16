Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1746397A9B0
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2024 01:42:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28EA7E97;
	Tue, 17 Sep 2024 01:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28EA7E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726530139;
	bh=DrB9F8HBaGMGdvo9xjLSd7KiKgAS9ZsSABefwWiGrm0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cisagF7ond9l1N9LSMPAaTj3emFoDBuX/WPx8ISHAVQlBGJQLqOkCEtteGEJI4YHH
	 NbKGfJpyQecr/F5rcwFvqyyVxcktijo3YGfNsN31h+kV6fKulox9eefZ6T9Iy4N+f/
	 3CkJLEpeFmu3NXtzcHS9urabFpNxCWZUI1MiMGAY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC4DEF805AF; Tue, 17 Sep 2024 01:41:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 319F5F805B1;
	Tue, 17 Sep 2024 01:41:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5870F8020D; Tue, 17 Sep 2024 01:41:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70944F80074
	for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2024 01:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70944F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ZQfRq29O
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/T/VLe/N62zI48AOrr4NezPfEpRqXnwfFCGCoMYCgX6Awq2hgULrGEcZVISQ4UtmZ6KtixUDH2k+76uhnLg2jewO1INucvpzl0tFDy9UaUZu4XDiIio+BGJIFMqL9Q7bX8rM9zID97VVWmA9QOXP5OMVvTNYK/IOgmlR7Q0a7dUAcvOwmOwDZe361VKjwWUbdze6TFOHDgrmj9oDy7L1OnWP4xXPZGVYYdfT+2cebtSdobm6cvqnhZ6QNM/qtnsdwpca96Hsz+CsMqp7aDXbkh5X69IJIgW/xIiQEI3nFXSRtvOAWXbb/PwJK9Vf7DRfS7qq5MK2vZ+HU6Ct6sYdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0F/iaryenQylaG1ZwS1j0nWoPOT7zc5uiaQa0oF53es=;
 b=Eu2CkQS22x0uSrCg55HurMYoVcH5VNtNJz3JXTeqeVWODgu8pboSd+jyrt6b5pcLKbJfBsiML18C0OOczsbB2mMTx5Y/6+k0apZKnevBt38MMpzPB3o/lB//Zrg5XWjjizWWOZV2+auZeh2o/C96kxZ9bQr/99ujlPr7Tu1snzHGt5K1xF9kL4WZOs7oP/gTuRgw8gLAgutf3U1uyD3nEhu7qsX0DDNUUp2BUfEaUB7dn6WcGg85+ry7cwxcsaNCTf6sHeJsGYcmbNl30VOS1HXcR+oUE2aBepK8hNPyfXuPw6fi3denpaTnEABZVU34omnLLKVdB3dnQJmaA0GU0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0F/iaryenQylaG1ZwS1j0nWoPOT7zc5uiaQa0oF53es=;
 b=ZQfRq29OzyIey4VBoleXmWfqxeIjvs7FZp0isr1o67fnG/MmkofNHiGwNq74qhyRsfAlMPyp5WubMze8vI5QnaC99LzAObdTXqTioSfuUC9NJsRJ+KjYd2TtbwCJTT3SfRpggcTAZyRv+5WgQslR1TPtM7m08WI+/fQ16GG3GY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8238.jpnprd01.prod.outlook.com
 (2603:1096:400:103::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Mon, 16 Sep
 2024 23:41:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 23:41:28 +0000
Message-ID: <87setz6uag.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>,
	Linux-USB <linux-usb@vger.kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Greg KH <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 000/113] ALSA: add snd_pcm_is_playback/capture() macro
In-Reply-To: <87wmjgdnzg.wl-tiwai@suse.de>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
	<d6e47194-a708-4dfe-96c8-aba9391e4496@perex.cz>
	<46b37ef3-047c-4b1b-a79b-37187a46754a@sirena.org.uk>
	<87ed5o8hen.wl-kuninori.morimoto.gx@renesas.com>
	<87wmjgdnzg.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 16 Sep 2024 23:41:28 +0000
X-ClientProxiedBy: TYWP286CA0013.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8238:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f1f869-803f-4e02-5535-08dcd6a915ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ivPkZquN8lN8o1EBqZulpvqj3K5zgPBTuqX+PvPIjonNvzIwGqzThxybIxId?=
 =?us-ascii?Q?rIxS95ez1ETpuD1gtdZWnWNGkhhm03+7hIsSkIbQE0Clp7xf2yrzp9Kq6+MI?=
 =?us-ascii?Q?CwamnaZl1j2mAAmQfVHjcz7/Xj1olgutPmAWidxABywJCnVuTeVa6xqWMYdL?=
 =?us-ascii?Q?CDfha3XuybX+tWxwE236MxuUsg0YWE3sKhiMQBZ7mrpMbasv2dvWbaqqpbG6?=
 =?us-ascii?Q?o5+/LtM5EnJsgQkrOyRzq4r1aeyrq2xEUsdtM0JE60CuOKw22glgjZ+uBkGJ?=
 =?us-ascii?Q?6gE3KHUNzT+pYapqcI350vogJdzjF/omdkRB+tfIcHJBqriOgKo9pozXvOn4?=
 =?us-ascii?Q?7bhRV7ijz4pIcP0EyBGvwwht35zcjmcF/RIVpguWgAxDRd10lVSz6pkLVf2Y?=
 =?us-ascii?Q?Mo/32LBxR4UqfpgVG3Oc7yvVXIhI0E8UDlQH2xAnVLv4whdm3g9+gNKpr1HV?=
 =?us-ascii?Q?t1dedMqydqjQfVnmVBmEJuAJEp6IY3jw5NBobo/utE7GA0hi9aMGLul9blxd?=
 =?us-ascii?Q?dFCNiBTXWdz4iINTvSo0oRsoy/MM9bVF9dI4V/gcKmeEHHg5WrkfCgze7d1u?=
 =?us-ascii?Q?JBXdXBggiY7S1n965GGUe7P8eSSdT/jVDMcHDBNHL5gJ/ngd/F7uf+TR2uq9?=
 =?us-ascii?Q?hCpa9jnUg/7YXA0A0nfX1VJNAF1JCzmnSjcR1mIffYNdkf45YPeCS0pIs7gY?=
 =?us-ascii?Q?BfDlLWfzrkBSVwCRxuLRwqJJrKwrpvWQzN7NN/b8ojtGzHQ7gG1xD46EIOkF?=
 =?us-ascii?Q?3+8zWlwg3KvlwY0X2gs67GwR01xr+SapAinU/uACTZHzQSaA2r7O0IHI6nvO?=
 =?us-ascii?Q?Xw1mrmcOig/BLdB9pm3TdwmsfLNZQ0TRRsenujRL3WbU5eAjkBIFXZm6vONL?=
 =?us-ascii?Q?RXoJ9NbFgKO1SGoNb20I94ZtMtuWbLFNVXDjmx02EFe6f88s7IE++8cBFWT1?=
 =?us-ascii?Q?hD0BBC6O0Z1qxqAI2lMhYpIKfRfsyWyP2L1zDRvqfudX/cKpkQi+uNsvUlEF?=
 =?us-ascii?Q?23w+Ypiy1Upkh3nWnGeIxzwAVUDzzVUrSHjdeg3/FBHjn9GAjXezDmwCJNjg?=
 =?us-ascii?Q?QmneZTSsPWm7x/krC60NgTMwlIoHOWyR4QuWNFmfqRuGY6x4WbF1PkAWMpxc?=
 =?us-ascii?Q?nILKA+kZY+ztuc0Y8W4Oxt2SNOCg35eFio4uRHyoUpXkEwOmGMHrn4/Z6vIH?=
 =?us-ascii?Q?f6OvUnOLPblPHsbese6NMzTBanzVqy1a6HspcPZaPRIuqp2U9egm4oVjLYaM?=
 =?us-ascii?Q?la58gTfKZTqqCcQIaXKhO8Tmmd8NTSzP+nVFrdzc37JS78qL2fD42LQd44en?=
 =?us-ascii?Q?D3RxtK4F7kTKrrsPAsdpktqfZHtXWYMhlX8ji+fmRvSF4HhGjXDX8I/29+LB?=
 =?us-ascii?Q?tfaGPQNhUsnBCbLR5Q/1Zo8ELTllH5vUsVKfSZZtaMPXsD9qsg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3o0hS0suT+rVTrPmvZ5swgliCpoc/W/lprtZZdnY5IKpZJd3kAvaese8YTXw?=
 =?us-ascii?Q?DyL8N4RFHXx0uzRO+MzVfJIZapuIQpluJXd52STf+GFtssufTcKTnC/Vu3AQ?=
 =?us-ascii?Q?th3bYfsXUARp1U0BKUsGliPe/cro28Se+8bqjBlW1dl0Tm/bOYd56EOeCLd9?=
 =?us-ascii?Q?gBQTKbhGjMuJjfOtn0ZqLaFwI1zone20OuoFpWI7YbMuhDIrT7Z2xk2sbYCv?=
 =?us-ascii?Q?N0zUje2gVr0Ns8y7iSUeSLYZbRH9YZ0qYXUEZ+j+n7v1G/GBwob0Bs3leAJ0?=
 =?us-ascii?Q?P4yZFCq8EKzxj9T4IoM7g1ZulJXZAJX43VJ270+TJilii26YWRd+Ma2PXndq?=
 =?us-ascii?Q?9OnjiLdAg8Pf82qGj9qNZ9aaowKDnlFpKyY6OXHxs249WKarT0G+a998ToCZ?=
 =?us-ascii?Q?cjvSmY6WLQnocGQCnXT7to2998ci93KO6UwCFDMPBGVS10NwhZCeRbuyaKg2?=
 =?us-ascii?Q?iQOOyZi4kTF98d1QYcNBr/Giwqk39x5pwIJicJ6qzSW8xTXHM9uis/eGQoTj?=
 =?us-ascii?Q?c/UZcF0RZdoz7L97phcsbDOkrzevCrKaF8AF0xkftFWE1eM1C5lZ8XYkba55?=
 =?us-ascii?Q?Olg4Wp9ONQMRCBNqHhISANFo64Qy0+Jt0LtPPVOBtUmj6Bk2mYxdHkA6j/oN?=
 =?us-ascii?Q?hdX+CsMhOSgzz+hqo5OeLYDZSNGxMuFRl2g49q+km4kgm2az0nxQ2rkcXyOG?=
 =?us-ascii?Q?xp0JjvxCl7i307C3Ou01BsX75yxgGjtINKzVhg5VgsLr5KkIKAY4fQhxGdov?=
 =?us-ascii?Q?Vjn2m1vS7E4b5dOBo9Y07bhDc53v+KsSJoGulHIHchKY3Iq6S1Y6GkrTsO1O?=
 =?us-ascii?Q?+j9AfbUZvkUZfMGmmMB9T2CfRTjw/ZaryuM9FjbMPlJd++i2d0GhIcgj4ftb?=
 =?us-ascii?Q?INz8pPjCsGJTGCige4EBhiUpxvPx9UUmydDF+yWDZW8fng96TkIXvDWUrsdf?=
 =?us-ascii?Q?cwX3MDhfFF80aNCorO9YYjWTOouxyzp1EWvBR1wDVRS4WzkIPzMe4DVn9tWO?=
 =?us-ascii?Q?yROmgYSwdpIBX6/NZIhXmcNp9mgYIY8tcTed92JuNlhOUTb1jk80KF8Eja4l?=
 =?us-ascii?Q?eLj/is4wngZRDS68Fo57QRx2mAcU1MjlT/l78r/k2sILiFORW0q9FBUBexKy?=
 =?us-ascii?Q?rEL9oH3jBrvv3M6t7b0kfUGJHx6CQ3p4TZDr/d2j4ZN+GSBfKdvJZ60ZhCnB?=
 =?us-ascii?Q?hoPtbv/38jHQMsTmhf5ROQw1zjUZw0Tg/NyDnjNDcqYZQTUyQ06Gd1jDyLWi?=
 =?us-ascii?Q?9HIj+iUNoFVsN5D6uCWRpEsyuKjadJz2AbI49ofpNAxpb4sX1YnF7ezr2oMp?=
 =?us-ascii?Q?q/Oyaoeb0bbT4HopApNlwcwLB6s9txZwdPQapHhLwthzHQiO+79WBHu/T3qd?=
 =?us-ascii?Q?dZ4a0URNOTptWLAx99Oa/atup74Fn9tgzJo3reKl9/MSG143mus+1oIOq8u+?=
 =?us-ascii?Q?rL13Bb5jjYObJXdmrSFdt3CnLnl8hAqwOLg4TJuzzGQRHHzwbVIkhiU+f9Kz?=
 =?us-ascii?Q?+7Dsq6YMsp3s2AU9YvxOcbIYRq/4nphoUlqIn+6Vb3p0/6PrKKGgCDrQMYOc?=
 =?us-ascii?Q?JGF/KBQ0hS5QhYxAv5o6QtTtQU1035ttinLuu2U3OBkZV/fmHV2ZhY5HGMdH?=
 =?us-ascii?Q?Z1k4X2x5vX+oQA1sdnOgi3Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 48f1f869-803f-4e02-5535-08dcd6a915ef
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 23:41:28.6481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Xo5X7YhrZSk4X4rwjGO5PxrDuffduSjzD1IGDB70euSZRpZxdjEGN+QR0zoQ5F8Ez8cvTZgZ7WVV1fVZnk9ZsRvkHIzpY1A9R69B1S515INTqnH1+/6EgM7R9hwheMZm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8238
Message-ID-Hash: UJTJOI7P6LOBOTKIAWU27YKQ32ZZSYBZ
X-Message-ID-Hash: UJTJOI7P6LOBOTKIAWU27YKQ32ZZSYBZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UJTJOI7P6LOBOTKIAWU27YKQ32ZZSYBZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Takashi

> > This patch-set got both Ack and Nack.
> > I wonder can I re-post this after merge-window again ?
> > I'm asking because this is very huge patch-set.
> 
> If we get a NACK for this kind of cleanups, it's rather negative.
> Unless its' a mandatory preliminary change for other upcoming stuff,
> I don't think it's worth to work on this further. 

Hmm...

Thank you for your help !!

Best regards
---
Kuninori Morimoto

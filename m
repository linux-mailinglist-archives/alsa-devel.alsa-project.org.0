Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41326878C5B
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Mar 2024 02:37:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7A58B60;
	Tue, 12 Mar 2024 02:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7A58B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710207472;
	bh=2UP4ruxxb9V5ZTscsGJxQtXJ0Lj35nz6x9dkh9wCsH4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Uq2gZMI75jGJddQgfwGgx6hOQIG2lbwGo/WsCC+p8Y65BJKTkz+V77+G88dAFKBgC
	 jox7AQYWLT/CKWHLjSQzYuY7Qiy/t/5mOAVHglqJEp/LUHs/bO6a7evNH+Qfy/Hty3
	 FU8Ql0dOxJvPaPYX/cL7L1cxUltbu2H0ZOpr+EjM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2312F80588; Tue, 12 Mar 2024 02:37:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE1D3F8057F;
	Tue, 12 Mar 2024 02:37:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC90AF8028D; Tue, 12 Mar 2024 02:37:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64185F800E4
	for <alsa-devel@alsa-project.org>; Tue, 12 Mar 2024 02:36:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64185F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ZY4F1rUE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MB9wNbeEg5iNxgT0zOOa9iUIknYNyMo9q+FdcERDy3usuJ7r6eKmLfI3fa84ov2P/WtNCjjrircbleAwL08hQPf+RNl8bDQqZ/JPdDW8CPIpP6nxC2iFV4VPY6o+z6QsbwLMdLHfESUSiK+BpvyX0/oT9DwJOqhMTYsiPVOeujCmWUtNXSStlgkjyZgAMVVGpVsns+0Lt2tXt5VQ9DGcz8F9SKaXc/cAGQwZewG+L4m/fFa7TF+TDHap+CdDJNcLgSwLyFyGtgevs/TL+zolu1LiRnwJEprsgDukz+54xO7etDaNN8cxKmHWu5GkT1nvyg4xYmTgeO4p4HfuZ1b97g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVNIH0tst0EK5X/8hC2kihBdQJhz6bFrTMBgoGawzCE=;
 b=gsaD5oX+x7/VqIgLg465BciI/1+udEE0XpwMIGzvotqfrEYdx5eCAtLjSB2QrtwFKyTe9CzkjNJi2ztcRNcUGokReFHAv7lXcHHFkK2v+h86oQA7XOlepAwFyN5RjPEkM6EfUsaPh8CPKO7O/TYpOxnzgh7hwe4RKJzxF06CWWW+txC679x1W2+ygkTjKTdKXoRcsBLxgvhCmwIqAU0t6psCpS/QFsn5wXH+N0NLi5t2EGaHyD47Tr9oXqNcBmg4vK8B2/1AbqF7DDLAUpJt65vH1vIw7WOKW8Z+U2Yo7hfuIl4lDkhhmCPdhfMYl9UaMNHr8b7al0fvAVgIG6eQIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVNIH0tst0EK5X/8hC2kihBdQJhz6bFrTMBgoGawzCE=;
 b=ZY4F1rUEEy2K+tn1j2dTnQCWZDqbvU6r0/c/ocw7R5VAFpqsaedniPBTtO0uIEXC8nPy7g1ACivMW15nBZNKfoVQPeQYtJFBvvHOy+lNuI87N8aQA8YlbR1n0zCwKDPIfLHkeEJfgkV+Ihphg3zYpI0EVGr0twpajJHbw9ePjMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY1PR01MB10691.jpnprd01.prod.outlook.com
 (2603:1096:400:31c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Tue, 12 Mar
 2024 01:36:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::9bf0:2a66:79fa:e857]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::9bf0:2a66:79fa:e857%7]) with mapi id 15.20.7362.035; Tue, 12 Mar 2024
 01:36:48 +0000
Message-ID: <87a5n46xjk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/5] ASoC: makes CPU/Codec channel connection map more
 generic
In-Reply-To: <e7121fbc-c814-4153-9f17-82ad5de13e64@sirena.org.uk>
References: <87v8a64f3d.wl-kuninori.morimoto.gx@renesas.com>
	<87ttpq4f2c.wl-kuninori.morimoto.gx@renesas.com>
	<e7121fbc-c814-4153-9f17-82ad5de13e64@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 12 Mar 2024 01:36:47 +0000
X-ClientProxiedBy: TYCP286CA0268.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY1PR01MB10691:EE_
X-MS-Office365-Filtering-Correlation-Id: eef63a5d-42ea-4f39-72a8-08dc4234e220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oAjT+YyUB1kjMIb1OSFpN8u5zHEY6r1EGbLR2orZ8IzrD5+m9zzgFt4+ejYyO1vc4yErEWFByAT89teGVQGZopxttdjfr3MouUwrU4WS+JjeHVCt4/P6B5dwu+BfrMsS3GN72FCAm27jzewHHrd1ccQtEw9sPS346fcJ14o5t546t4SKuQYzRGNMux13/+KDER6q9aFznZesL1tyzqfXFdAGxlkFY91kMkMHDIhoAQRAyS+ul/UdAd0YHyULlZjVN9dyOSlIVePGmya+jBniMHnV6p1qd1R0VWm7ZsnpXbamX5QsWfcUhatPvN/fIi1f1rViLE5NC9B+WAj7T7zyG8GJwwQLfF5YFwAFiavhQmE2QCo/7h/0JDk/EQgRjU4Ints3/MysVAqDCMWJLL1kdnWvpk7+fGUCeXJfEQvfKyfgvz8cAYlS8IkrTaYVGmCjuTtoTtVx72lmqmnCdfMdGdJfLhPCMbp23ltk46ijzWAHwNvfjWHK4mQ6qIFZP4yBa0BqTzopkagxVTT/lOs68D7rdBbDEYIrkTa4ltKoJPQzJhRBMeHh3cFF2vc0J9s3N8Ziaib69Ny27KIt+u27DP1mWxiFC9oZAoNLzBT3iJYbN7mgNHwS/qh7aTgRxyULL1ygF+YGOOhW16u6gDfojbu38FzKuj636H5Bcs7EpJrTpODp4h0X0k4yua6qSSauRR3Zh2HwH5qdOBBQmKXiQg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(376005)(7416005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FqLAVv1wBuVW0vwyeuSA1q83ksj18gAskme2xwtFcj1LrkzY2e1HAojDyB8j?=
 =?us-ascii?Q?Xw3n0uaaaxMqpTNVwXM2VCkqllT59lQgabzJOPuOl4RQtGzNVPQuvcqPSAQy?=
 =?us-ascii?Q?h11SHHDtqbeYc5pkS1perIY8hTPGG2E3dEmF04xIFc1GCV1KJzuC/+8RJGuI?=
 =?us-ascii?Q?6nbG5cOaJ5N4Pf6bdNWGhExHvOjD7fEpOVzg4yTPWz9Um2qsPJ8e4BFw66+T?=
 =?us-ascii?Q?Pzxcer9VwhOEEsI5FLTMs2qaO7V7BkPWpB7oYPlzF4e4P5xQtoo4XEn+Yu+e?=
 =?us-ascii?Q?65LJ7lclWYA8/L/Uqhe1UhlvjVZkK7YdxQCbLHsD8p9b01cgM5gB/6RHqn/S?=
 =?us-ascii?Q?qh3+aL6L+eOfzyLtILHToQtNjXWclerX+ZrclgaHhbNk8BXYSNjwvFAucJNn?=
 =?us-ascii?Q?xsOPg8F0af3L13cCUkzJNUVSrGXnEk6X2Bf3R+7Mluei3kBZoFB0v4ZyI9JY?=
 =?us-ascii?Q?IjbbBNJhngzCSzgYelX4QH8LKbGGrBrZ01nnjQ1cEulSq1fxZ7fvtjd+zTlM?=
 =?us-ascii?Q?tU280M0/f7sR6M7GUMd6ii2ng85H8h0hrttnwXTWzNDhehhYTAHJGGc5HBBN?=
 =?us-ascii?Q?HTooeLDnKo5pcWrJYqeQR7lidY/zm9yG51I/S9sYU3BAQ5j8rJCE2QsQNZAD?=
 =?us-ascii?Q?5dXzzGE7TFwoaABtoHvI16ebeQzGYZNyHiCXKLnaJVMA5u1jVeIhSBARt1xV?=
 =?us-ascii?Q?RCRLcaKOFLWChupk5q9kmN2OTpAFlbZRrGrQhygsATQILWuoFiAg/Baz769j?=
 =?us-ascii?Q?Nhl/DxtskQEkXXcNpe8kWWEoCBAciaib76qVDYROnbJLQY6twNu0W4lCzqHx?=
 =?us-ascii?Q?QkXhe+zWwCLgvQ8e2xSwYr4jqdLBoHvyB6z6WHj/VNi977CBzb/ZAj2jQhmq?=
 =?us-ascii?Q?WElPPKGEc0UiR3qId29zr4GzgqcOxkgM8cao0cVi1V9bnikUrXolby/yUnjQ?=
 =?us-ascii?Q?38rJlB09yfA7cfvt3gH1NdXxEVI+CaAz4LSOTO7mosduPOqitojLHTPAbhz5?=
 =?us-ascii?Q?ufS0womS01u/pPy2PkBFIaPDlUX4hPeF9Md6/JtcgimcEgvP2VAn+UEu9kk3?=
 =?us-ascii?Q?Xnh6zCXiMI9gJaB++iWHbwLuwaeBN+eFHq6ulj238pMXltnHwj06RFqB5Fzx?=
 =?us-ascii?Q?XFb0eK3hVE1afJniOnwV3mwc48XrdGMj2law36fKQ6bt2l2BLsp8kR4WJpIw?=
 =?us-ascii?Q?UUo8oq3FN9PSx9n6l99jBb3q7eCnka/Dg6JekvbV+w+HBultBsTIkcFaytUC?=
 =?us-ascii?Q?xgbY8R/FCC5NxIDnKZLlMw48SYLq95QpCkoTeGTuzFKXlA3JCmAxmKO/5j1z?=
 =?us-ascii?Q?W2HQCU/gh6AB867H4SrnRFqS/90F//gjlMDljBy5NS+21+6GsDGEzcFRsED1?=
 =?us-ascii?Q?jgX3s2Zlbz+ReVrp87g7QsyeJMEppq7KLwa+fbgcWzo9qR/wh5yUscGV2V/s?=
 =?us-ascii?Q?WkE5SkDyXxSr6pLiIaW9v7ZjSJ+MS2ipEQDjD6F1zPMfjxVfk2UFfMwi/xZ2?=
 =?us-ascii?Q?jQX2j8tCl7tbB4m8MY5GZkZOAELaDz2E1WDIovoLwUnUuuA3AlojNmNVL0OP?=
 =?us-ascii?Q?/zaHJS0Q/r+XaCarb0UgwOn11OsiFQfds+ykp3ZttD+72hzUD5bbGY3vvQ0v?=
 =?us-ascii?Q?Dz1pUAtN6J1amjSG2kVoUuo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eef63a5d-42ea-4f39-72a8-08dc4234e220
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 01:36:48.0341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 24zUAxTvUEb/bdD5AK8dhZO9UObYrrVZkJDuyZV94X/TvUu4xouBsPSXUBfHwB4MMfXP11MNNS530dhay6CGXXGLqMRwlWuSZqrQUHcO0cZGB1/sP0oBVdNkKQAsvs/D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10691
Message-ID-Hash: CQNMJJS36DOVCZS4NNB4BOLPAB3PAZVK
X-Message-ID-Hash: CQNMJJS36DOVCZS4NNB4BOLPAB3PAZVK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQNMJJS36DOVCZS4NNB4BOLPAB3PAZVK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi

> <1>[   39.211516][   T39] Unable to handle kernel paging request at virtual address f999199999999999
> <1>[   39.215123][   T39] KASAN: maybe wild-memory-access in range [0xccccccccccccccc8-0xcccccccccccccccf]
(snip)
> <4>[   39.498854][   T39] x5 : 1fffe00001b50887 x4 : 0000000000000001 x3 : ffff000013f44be8
> <4>[   39.506914][   T39] x2 : dfff800000000000 x1 : 1999999999999999 x0 : 0000000000000007
> <4>[   39.514975][   T39] Call trace:
> <4>[   39.518356][   T39]  snd_soc_compensate_channel_connection_map+0x210/0x578
> <4>[   39.525461][   T39]  snd_soc_bind_card+0x368/0x1280
> <4>[   39.530575][   T39]  snd_soc_register_card+0x2e8/0x3e0
> <4>[   39.535949][   T39]  devm_snd_soc_register_card+0x58/0xd8
> <4>[   39.541581][   T39]  meson_card_probe+0x25c/0x388 [snd_soc_meson_card_utils]

Hmm...
does it have un-cleared "dai_link->ch_maps" ?

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD2294725B
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:43:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C6EA3351;
	Mon,  5 Aug 2024 02:41:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C6EA3351
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818521;
	bh=N7WYGc4xp4YzmzjWHqh7NC9smpp+INH73rQ4aqDnD68=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qv+vw1XQ0umyr/2TyhPmDUKtWgZCU+xzNWeTMFE6RsRDKzgXReakEwr4cv/R/I74I
	 4DkE1qflQnk1942HZ860D5EbAepQoeZ+e5Dvp9J2wdzZ8CoVCpjesiUpJB+i511tIL
	 U85wyQzMhwd5SQN7RXpNdMoZTX9+73tcdnIfewpQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C1F4F806F5; Mon,  5 Aug 2024 02:38:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5406F80743;
	Mon,  5 Aug 2024 02:38:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D703F802DB; Mon,  5 Aug 2024 02:35:21 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A061FF800B0
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:35:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A061FF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ZHos9fAi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GS8M1gzOaiL8Jd0ySeHuL9dB6DzCizqtCPn6viPppBQU9t2uXIZWTZfrJgJSw1E6wgZsXixsS1V32uzA2qhUO2PMCh8si00Vm99Fo2+M0ygGLd2FMhNo/4oMvkzXlDRbpuIP++cYXZI2IkmqZr4MxLRdfPVZnsCvzvLgyTpobS+Gr19LPxXXPYid61RGOu0+6ctWS6cxzzDUoTghWNvnj32b9soGd/YsI4c8vWgWFVsGyyi/HGkXCRfXKpOvIss00a+785z1M+67+SfBr6LjWedBE+W1L+wWI8Y7b3OxWdgvLm7jCqEFsQOCUuG2URt+RqF6cxMuFyl3sVy76mSNxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIeh9UFk5aLeWLWckP6h+PobhxPgKOygL3SUWnoHDcE=;
 b=u5Zskscy8pGwk7w+Oe21rHz7TQz1Hj2BGVbUHQ+/bsSAiKy3okVZdwcvWOXC5TjV/c2riRbp1RWRPuPWNV/7OF8JHE037HMhfttGRNjotsyPceQdloBePwHKbTPPH63+z8SAbW2SEfBZHqlJ8tThlChyR/mJ0VE/8zcFVs6g/q56tN9RpCnECnHEHuMIwhqYSijpcaMaI9Ie3n+bciyoFEsNpHl4R6cSwJ3RYMmhYbS9wInVPUsE67IVVEAztM/UfSeqEmzeIZkchhmUgp6Tz9aRfnXggArXgQBaTCLs7o8Dr/snhOoxWLcomH/y+XuXrf8ae55Zx5UPSHYFob7Kqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIeh9UFk5aLeWLWckP6h+PobhxPgKOygL3SUWnoHDcE=;
 b=ZHos9fAi5UEVfVKLvkRcHghaSctP/IJ2TdpR9SArGhCYzhw3ZVpHMG4vHdAEGQU2AGq4KZhFahGU7ZwsVjCj587jWxng0APd2mLyKwokrqkluK70IpXu4TsjOmxQNgysE7kAgewjWHh+AdjzY8cZ14e/7zqfwJQ97aG0Evz/hM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7994.jpnprd01.prod.outlook.com
 (2603:1096:604:163::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:35:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:35:13 +0000
Message-ID: <87plqn24e7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 010/113] ALSA: isa: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:35:12 +0000
X-ClientProxiedBy: TYCP286CA0271.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a39f26-c2dc-47b0-d536-08dcb4e67830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?N23fPjWVHSLQ5iShx9qT6HO2wmZ193LYBu/ZmBm+SAMkvkw8AnqKLgxBtwCy?=
 =?us-ascii?Q?xaPlMP/hqnOIzZMs9wF5WOY/NPs26aEMIQ8Xxbw61DmyNdNFf8J4v9B0YuH6?=
 =?us-ascii?Q?iJvonjWu2znfWlzmSvUbscgXf6oJ1YEGzUJAAovSsQefsKQHrscjnGlBDL42?=
 =?us-ascii?Q?//aBQKXMJ8fGce9nAn0V4Z43CNTgIPVZpDq12bE4LLLIsd5IXPeMED/00+Mq?=
 =?us-ascii?Q?q90a2vRmg3co+0dxBiXRACQFz36kV+vEAwQQ/7wA4G5tONy2w6AK8p1HO5dK?=
 =?us-ascii?Q?mqe76tWymPpA4Wg4786+7ahUCdY9/FACklkKoKFruSyMkv4jm7ol5Ba5mp1v?=
 =?us-ascii?Q?DQKryE2+er3FGLwIWnEpKL8hZA1CZ1LWctwOd957EdA92OFHXGshX0AGKZMN?=
 =?us-ascii?Q?Rg28sieMd5Lb6qxEsu4PoMWcI/aJklFv+APQ0t8tSGFS8ChqX7gf9HPOWi5p?=
 =?us-ascii?Q?c8Xw7FKMxBOAQ6HgYEoaDiRkCeYhxnjj/9RuCvofogkUUwfzSWvVvGWMYoa9?=
 =?us-ascii?Q?d5+FThy6mdXxnRMEK9I9/GkYi7YZ7wNChseh8Ib7f1ezM2KW5n47LkT7bl8P?=
 =?us-ascii?Q?AWUruT+crWbdnhfaa3Pcta+nRvKpPA6nnJvshNsnfXFOfBY3n0LZkiivjCLT?=
 =?us-ascii?Q?22nHr3dsldsMd+7645miU/dq05zuWdF9JGL5B62XJuw6hT2Qilm6+yKK83E5?=
 =?us-ascii?Q?eAGpXRILJ6hu3p5iIPXowt+QBI928k8fw1K9fkQKy0aXFhOUhzWDRxgnZ+3m?=
 =?us-ascii?Q?G5k6dVW38W1hW5IH8Hc/qmthHCjxsaaLQdozZHRfEGQYOi5L1h3xPtXl0+FO?=
 =?us-ascii?Q?m1g7BVdgXlvs7bGe9ECtnr+tdXQ9w3lSZV39Zs55Vtqjvq4W4ICUPF0XKfY9?=
 =?us-ascii?Q?Fduwlf/7rY8bkcuSoLirtjlkiBXdC7X6sXGNyEUaNV4SXesTgpfsvkK1Mzsr?=
 =?us-ascii?Q?jHf71AkFYNQk+jn1HXFiZJxm1N4Pz268UiBlzWVZijLCpgbTUl4XaOhYYU4E?=
 =?us-ascii?Q?p6B05BSpBxi2+ahrIaIOKydgg22UHdcaFzb2jgpA8iFYPSFITyQAEL1Usp76?=
 =?us-ascii?Q?g+Bg8uZtQhMit4DUB5C5HQ3HiddyRydSXbMJLpiIbT4ZbSTkBs73LmQAEU7a?=
 =?us-ascii?Q?gACc9lLRDlLztZA8SXIdDzgxp/mnCeIxafMyBrbd3URSUMyjXIvu/T2NptUH?=
 =?us-ascii?Q?yhh04Y1uXTNZLtw1Z4RLVc0Nh187Iy3iKhcb/3IBA07JERoBFzi1Cv4hdzIR?=
 =?us-ascii?Q?YJnLTNIIpw7f9K8Si3RLynRrfMveUO2n7uTaFRrxYk1gMaTrAj07e9jyT+nw?=
 =?us-ascii?Q?Fius4NkygG30Ym2FBKa2yLYUnfYayKbn6gORw78QSjHlZXAl+E01XqCyEFLX?=
 =?us-ascii?Q?hO3cEOHNLKcl3js4HWZsHNqNkT8ecrjWY1phi7+2jqLyIpoRBg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ujp9C9LTOwMrdSHrfHVKOpyKK8pi7g2QLt9v/McWLgCavrd4m+EMs3LwcuyJ?=
 =?us-ascii?Q?vgSRhqZID4eEZ4MWQyiBRYdAYVEqbJ9GkQAQwGfMVQABHJEScRey7NhecmYt?=
 =?us-ascii?Q?ldqI2uTPDoxVjD4NLEBUfkmn9nJH3iR9fZgZTXYdlz+3MTo9qSpFZ07m8mxW?=
 =?us-ascii?Q?UsVzGr3tDyUHaw1uPkyFBalcLbRr/vD85tIweHgnpUzM65vnf7wNEUj6gVNk?=
 =?us-ascii?Q?fuvwS4GHkdbgxSqADhxyFaECsgCCf9rrYuvodYK4jWeO9VwkIypStG1GRpZe?=
 =?us-ascii?Q?2lmu9M29M5/Tc6c9UzgUBX6K0ZJSUqaTnvugU64DQpdzCL2tV72vPPvvQIBO?=
 =?us-ascii?Q?EuZ8PG9v61g5svYj0SbxSM2iaobIWB0d6xD2Ih96H/h6UlVaDG+/5eNSjVyD?=
 =?us-ascii?Q?j64nKKYTUTxZ+CFSkwIKK9y3X8OLGrwxDPD4WEQEoxF+sgOj8Xy31X6qLkG4?=
 =?us-ascii?Q?GNASqZwxTy7J1BxXXK+cYa1gRH4KxyRxxmv1Me737oTrM/Mn9/NeaaX+sdM0?=
 =?us-ascii?Q?VZMwjbP+JfKSb7/HsRBgUds866XDSq5EQBvO8KJdS5rcXfePZIuKvBRaEgAT?=
 =?us-ascii?Q?GPkbVnQgkdU3oNKKoRlw+Qx8VP2c+P0EWrBWYuNnHnWqCNrzEV5f2ruyxEbU?=
 =?us-ascii?Q?P37MUndUfxcibTP4zxLtx30/Qp7r2CjdKj0/Qot8XGCZ4OJRUiYkVtlYqR8K?=
 =?us-ascii?Q?xkdTB3j4+QdHkxbubRLdpSyqZOGu3TrY82r6/KPRCclUggXNAlkCKRYqfz+Y?=
 =?us-ascii?Q?HW43Gxhb7NEckPFyaStLv6OERefkz55iI8Nub9xpW6N3rV3rJxxGzv9GFYJa?=
 =?us-ascii?Q?Sj/iapifBh5sy9x0uFWnDL6bApA6sw1jYJ1dHwU2M+jATVZRX5dw/f9QAm7P?=
 =?us-ascii?Q?utsY/zYSWrzXaiLCfRtwBrw+RIaj5vZ3TnuCMylsF9gsIzDyMJh5Y/yz9yWw?=
 =?us-ascii?Q?ws30VcmGKQMnA1l1Gp97iwOKtS8vYa1Ijv9q2JXNkClNQYZcHBfG2dxrIDbl?=
 =?us-ascii?Q?46ekLyCXLkZRKHFq/Frdr3RQgIvgrilIz7/chP6fTMgWUreWt74dTrSfJUmY?=
 =?us-ascii?Q?10IVZuYW9nvWZMyWAH2J3kPFgUZdFjZ+DYFwjjlIHLqKEX6CO7n4rhYUGoP3?=
 =?us-ascii?Q?1Tc49zzeQ2u1ZOmxHiqEVnYkdtonGDBpDBB8yREdZnNE54KogesadQhJ08Q+?=
 =?us-ascii?Q?V1zDWHt6WSMZ1C4DCO2lYJYwbyHuh3YOUtOiDbrNL37Z5lPRANPZPn7CQU4I?=
 =?us-ascii?Q?5WJ8FjAt2/lMoxR9GJW9QQv5JUM5qYLe9q81uYIA/lDHODtmfaHFXKHYVjRu?=
 =?us-ascii?Q?38ncWo5kwlwH85+ut/XtYAUONCjAoeHQKaaSTc/RLZnFox0rBJ6WL7m9wiy5?=
 =?us-ascii?Q?4LuWIPs5+IEw+LC6f70alqkbFsbuTdVBV+7v/FMOyeS2OZuSJgvJ0hZyOYyu?=
 =?us-ascii?Q?/iwfvw4g5F+znqLytqZCJC5kNmpFXsrOUZOSvGsWB1BbUiXMFu9K1AFL1Z+t?=
 =?us-ascii?Q?QKwz3Q9RDHoNE70anYy4wMcazg9Pf/J224X4BSoGHVS/kGmok3ZtbtIt5wUi?=
 =?us-ascii?Q?0x1ypYG4+qWWMPBJr61DNbE3RbWr76udQEB3AMQJKjZ1Wq1GYm4JoiNayYUK?=
 =?us-ascii?Q?1LWsCoKMSXKfDg3wr+L1wXY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d8a39f26-c2dc-47b0-d536-08dcb4e67830
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:35:13.2577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mlzbs2BYRChT15zTLZ+ivaPfDNn4bLnZtTEpyiUwHNKNw+XM0ttvzyG9HpjLZgM28Wlna/ooaMGfewSRX11vyzZ7hRcQUERJv7A/G76VPTYCay5Z3GYb3rUmYLIo0PTk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7994
Message-ID-Hash: UENMHEH47D7QZLMTQGXVCUCNUUKAWB7F
X-Message-ID-Hash: UENMHEH47D7QZLMTQGXVCUCNUUKAWB7F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UENMHEH47D7QZLMTQGXVCUCNUUKAWB7F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/isa/sb/sb16_main.c | 4 ++--
 sound/isa/sb/sb8_main.c  | 6 +++---
 sound/isa/wss/wss_lib.c  | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/isa/sb/sb16_main.c b/sound/isa/sb/sb16_main.c
index a9b87e159b2d1..7145dcb4417a5 100644
--- a/sound/isa/sb/sb16_main.c
+++ b/sound/isa/sb/sb16_main.c
@@ -216,7 +216,7 @@ static void snd_sb16_setup_rate(struct snd_sb *chip,
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->reg_lock, flags);
-	if (chip->mode & (channel == SNDRV_PCM_STREAM_PLAYBACK ? SB_MODE_PLAYBACK_16 : SB_MODE_CAPTURE_16))
+	if (chip->mode & (snd_pcm_is_playback(channel) ? SB_MODE_PLAYBACK_16 : SB_MODE_CAPTURE_16))
 		snd_sb_ack_16bit(chip);
 	else
 		snd_sb_ack_8bit(chip);
@@ -860,7 +860,7 @@ int snd_sb16dsp_pcm(struct snd_sb *chip, int device)
 
 const struct snd_pcm_ops *snd_sb16dsp_get_pcm_ops(int direction)
 {
-	return direction == SNDRV_PCM_STREAM_PLAYBACK ?
+	return snd_pcm_is_playback(direction) ?
 		&snd_sb16_playback_ops : &snd_sb16_capture_ops;
 }
 
diff --git a/sound/isa/sb/sb8_main.c b/sound/isa/sb/sb8_main.c
index 2ed176a5a5743..dbb08e9e0f367 100644
--- a/sound/isa/sb/sb8_main.c
+++ b/sound/isa/sb/sb8_main.c
@@ -473,7 +473,7 @@ static int snd_sb8_open(struct snd_pcm_substream *substream)
 	}
 	chip->open |= SB_OPEN_PCM;
 	spin_unlock_irqrestore(&chip->open_lock, flags);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		chip->playback_substream = substream;
 		runtime->hw = snd_sb8_playback;
 	} else {
@@ -501,7 +501,7 @@ static int snd_sb8_open(struct snd_pcm_substream *substream)
 				     SNDRV_PCM_HW_PARAM_RATE, -1);
 		break;
 	case SB_HW_201:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			runtime->hw.rate_max = 44100;
 		} else {
 			runtime->hw.rate_max = 15000;
@@ -532,7 +532,7 @@ static int snd_sb8_close(struct snd_pcm_substream *substream)
 	chip->capture_substream = NULL;
 	spin_lock_irqsave(&chip->open_lock, flags);
 	chip->open &= ~SB_OPEN_PCM;
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		chip->mode &= ~SB_MODE_PLAYBACK;
 	else
 		chip->mode &= ~SB_MODE_CAPTURE;
diff --git a/sound/isa/wss/wss_lib.c b/sound/isa/wss/wss_lib.c
index 026061b55ee94..d3f1a80c3a574 100644
--- a/sound/isa/wss/wss_lib.c
+++ b/sound/isa/wss/wss_lib.c
@@ -2196,7 +2196,7 @@ EXPORT_SYMBOL(snd_wss_mixer);
 
 const struct snd_pcm_ops *snd_wss_get_pcm_ops(int direction)
 {
-	return direction == SNDRV_PCM_STREAM_PLAYBACK ?
+	return snd_pcm_is_playback(direction) ?
 		&snd_wss_playback_ops : &snd_wss_capture_ops;
 }
 EXPORT_SYMBOL(snd_wss_get_pcm_ops);
-- 
2.43.0


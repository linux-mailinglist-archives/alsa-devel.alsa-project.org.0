Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E38669A578F
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 02:00:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75D61E72;
	Mon, 21 Oct 2024 02:00:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75D61E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729468811;
	bh=0JuyPGS4VbwTkOk2Dwr01bxEenHqvdBp0UVbg2PblNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g9xr49pZtH7ET3n4NC7iO1D2POmF1vgOa9Xj7rNKmCucSshb+RVJveTtIq77QgrrM
	 rjMgPF2UkwnWOJhMTjVbo/OP/fmkwxAQlOHeMhERcHg6iz+2d+YeUQWfnwd2rVhsF1
	 fut+llrHiGtX/hqaaDiBjwE/d3UlsYdtLqht6aMk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12DE2F8063B; Mon, 21 Oct 2024 01:59:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73602F80638;
	Mon, 21 Oct 2024 01:59:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00573F8060A; Mon, 21 Oct 2024 01:59:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A725F805C1
	for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2024 01:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A725F805C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AiOj0/P7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbIujTcczLuwQD9pPcKnF/iOpqKy0oz1FhqrhvCHfA2gZqJQSWGQ0u2XmU1OI31hl98QWC/reqHT/3BqQp14enWPv3YgO0aBckOB1Cc3xD1s32DhqbvBhie2uvqIpf3oabNBoFVxOhj0Ld/ydwbdp21mJ6jcAPolSRki2dm59+/kLrhTIOAxQZJVPG4MYsszVzIq9Lg17i0ZbqrXmdnwlwGHGRj7owBg/NE1OFd0rXyln0NLiyV35X/LgOAwjNTb/6gmFBBViJ5wyLVQK+3OkGm7v8p2x9L0sVxdcFmANw1LFlm9Y6nl9+cJuJAYLdiU4GT8XVCr9nyrgWvEsuxZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyf5TLq8Py/lTSeeOBhHx/br0P8Zo0IJRcqO4iKs/Qc=;
 b=u55HJ7sI6x5TRLGoRmpKQK7xmwNEcUepfCvInyEXyx5YDT6C/jMOgZm5zc6DrqoeT6oeHp1aW/T+FJjB8NDIF89FKKkIb4LvOEowqcrGRWtWQq9u4fByfXYCRNeKBRKQ40JnUKF43KOgmwIceQG24VMV6D5eBGYybJ0OfDSU/U2IWznPC66l0H+4JvV66o7bbIOwoJ025rxrJfOMmeSzPFyDeEkEuIfW/X4x+Ej5sToDlnkuwyQr2vmCRClOq4QXa/5/PezNTZ3xVTCgcbDZzOULkF2Jbh68qIWUW6JOxE7UjlhsfAJf+RKB1EEGDYiPQ4OyrsbWRTFL8DwnoPfSyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyf5TLq8Py/lTSeeOBhHx/br0P8Zo0IJRcqO4iKs/Qc=;
 b=AiOj0/P7+m0r3Ta0wmEdJCC3bl4HYPpnMXgihkuA8nfZ/6k4WkK3ga4pxhGdiTjDreU63wHT+Z37RB3znX4fYbDysk/lLkZJgyQLStnde/WKPkU8CD6UIee/ej+EQEhTGOM8dqKHocz7A2uUjg/GjdG5oR+iM1rxQJASX1g2dxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12916.jpnprd01.prod.outlook.com
 (2603:1096:405:1b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 23:58:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.027; Sun, 20 Oct 2024
 23:58:55 +0000
Message-ID: <87froq9vi9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 04/13] ASoC: intel: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 20 Oct 2024 23:58:55 +0000
X-ClientProxiedBy: TYCPR01CA0197.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12916:EE_
X-MS-Office365-Filtering-Correlation-Id: c03ebeea-34a2-4698-94b1-08dcf16327cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qitj7//Lm5k0SqRHcUm6Gm4ysnYr8kwyyMGZ8zFIl/EzxC1FHkTUg45fCRHH?=
 =?us-ascii?Q?o+EFSKCLhkpRN9s8OkdfG5s2Lpq/nmWzsXWpS6eciMg9gRIN/JdMDM5gCupm?=
 =?us-ascii?Q?wkzQO/WmG2mPG9vEnrLB/xEiMl9VHJrP7QlXMEUuuyIFOXwnJ57DWUH0Mf8A?=
 =?us-ascii?Q?LKCX173fmlCC7PswtOxwoSNDT7tiABxyS6fCqsKIpruWV0FNhIZU7/ChvQoX?=
 =?us-ascii?Q?NJatbl1Q///s6yLpWmfeEuv7dNIPp2JbKTBZUI0VKlEYbMV2Zaioe0fcXefo?=
 =?us-ascii?Q?H0V6UJK0cV8R+jwzc9096KnHBbfdYv+L5/7GKrTSwJFqIttCUcBegwIfYJDl?=
 =?us-ascii?Q?JYFdCOyD06A3Hw1Yu3+XlVTBY7Y8JAFDQVpuDW6CILTO6wqgHtmGTVh2ViNm?=
 =?us-ascii?Q?liXLxL8dsP1MVWqYzAb3ol5m/fn+BPV5ytvPZ7DZb4HYA3rvIVtHQC+TjwF2?=
 =?us-ascii?Q?N3yenwbZ3ZQ0UlE+RaYMg9g7iaaRLr9Q5E17uKB16LZgrue17DZbiBQbV6Sb?=
 =?us-ascii?Q?x7bQLQ9iHs7OjfUQnoKN0NG6zk+OMgNHb7oPJ63ji0pWzd1iGi2rPImgyuoM?=
 =?us-ascii?Q?AF8jO0Ec4IzsxUBSKZJwnDvZwvwJrV1bh9caKqVaQ3hDkZln9CszeKMmqddr?=
 =?us-ascii?Q?5Tc9TyZAyMBKSjfnbwY+zwvyur57XeL5cZbgtFIPMnkc/TiXouf36aX78482?=
 =?us-ascii?Q?awTyzK0hwRLae1WDs2w05Mg+C+ir8oD8r5GJjFBzdVAcw39ofZlSUySA4wAH?=
 =?us-ascii?Q?B1bTLnmCfv14gBnp1OH+6WsmlMMHbX0+rXJWvxciwxES90Rk/1JoJ7mCqZZo?=
 =?us-ascii?Q?zC6g76E1cxTZJkuSj2FL8onU8Q5lZpbwLQdhVwGZkeaqfd9qFVGz3NUFDgAs?=
 =?us-ascii?Q?cNN1Y9CMvtWsEMt+mEg6k6Arv9yOvqE5XetXxphdPQW/gcTIf3+k+IAgbM5X?=
 =?us-ascii?Q?BRDSUaaTOo/Ago21d6O1LjabE0IFDBQp9NK+Iz0dZ2IUIcirHod+U7eZ6gji?=
 =?us-ascii?Q?tuYauRC6zl8ZyYntEmPTEU3zwOtJEUIAWl1dEY+Q2q8jhjdWGeV/uAvTe3/R?=
 =?us-ascii?Q?OkXuaLY2YYe1s+FTXNXIZtQGpdfJgqFp9Tn1J8+6/rMgdCP/UhTDiatx1czo?=
 =?us-ascii?Q?t+2zGfsFBCDbQXQG43r+L1J+LZQYpjvP6dXATsakBfQqYiT3PYb1GNlHZbo+?=
 =?us-ascii?Q?94to598E1d24fyFBQMrkRPQDAh8L9UnOzdOmM9zAk21MbRladREmT8dMt+5Q?=
 =?us-ascii?Q?OStcTNmnxCuLDCqr4duIEtxdbHvlprBaIXGq/8qlviGd9TceLDdpUYxQXsJo?=
 =?us-ascii?Q?P3nML/e+Z8DgE8ltXrbWjm4n7n7kmfnAxLytRhmc+KFg/DbOQILEHs69KgDt?=
 =?us-ascii?Q?mMjTkHc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hFOGEVDrxNcJeIwXT+vkH5f7rFFlN9Ld/LpOfGzvLSulr38UaDapt2yo2eOx?=
 =?us-ascii?Q?RMggBqeyicZwS0M/AyS197vvPtVIvBqvo40HhLVD8kykl4M2y6DGa6jr1wB0?=
 =?us-ascii?Q?CDcc0VFE8M0hZeJ2XrrLdMTseEarEOOzeOwNYuqCQHHWWiPHd0YO7XB8lAu8?=
 =?us-ascii?Q?peJ6lpAy+/jcDtHnpcUzs+s+qBEJMsr7YNKZcCK3nVQgjseTd4wWLBCLKf6y?=
 =?us-ascii?Q?t0F10gtsuefsotb13NSmhsFFO33+46ciSZ2/KMAt1Q6zQ2Ms+1O+LGkm+6Gx?=
 =?us-ascii?Q?OJoct7RxBBgUMHLdQ2x7Sdz864nh99XduG7Qwdb+MLclbaGgDvYZi1I34ND8?=
 =?us-ascii?Q?xHEDIVW/tL54+bFp2XPgkcy+JQfLRqXhhWu0Ag2m5sWGL1Sjmco6GDy6UA9Z?=
 =?us-ascii?Q?Y+yKh9HnwM5bSAcrGDgvV9hSULqxCXdSi3Ci79yNiW62Trcd3Wzqrtm0QMhk?=
 =?us-ascii?Q?ZedEMJEDrLP/6eDoYVhJI5uuxXkEmnIDDUaqWWlb109hgs4ZBKAlDf7l/rnu?=
 =?us-ascii?Q?YTbpKCMj94gjXln5Jvfv/yLtnBOgYBB6AMLTzd4YPDPD5boaMySKLZCefFba?=
 =?us-ascii?Q?clvdd9CvC5G+/RV7jkD3nDBJqBhV/HTpBEYbH2f+QUjkzWX/QXEb5HzjMaHT?=
 =?us-ascii?Q?/S757OX2Ltf0cbmyrbnvTyww0ihK6tbjfY+nLutz6SyDk4YQihRaumH9aDXh?=
 =?us-ascii?Q?QLp0OGlnx3CjuQ2VGO9YaHsbHGpuRkV5H38zjc8ORVAUWWMIpkkqd0W2VXyi?=
 =?us-ascii?Q?Vi9z1TealeC28lAkyuZUukwDX3COI5QKtWMu3ho9qcBl66X6mxKABsC/EnA1?=
 =?us-ascii?Q?eO/0rKb024owzVQe+4/llS4lQWKUgFJ1EnQYDd5NSvolIm98EqixONdl/20e?=
 =?us-ascii?Q?NDAloGsbaSYHPqKe0DplwTlb5e7/tLSv8JIhJKlkt/6NxFU1/MJyUioXqE0r?=
 =?us-ascii?Q?G2QbzZnWUPrl0Q60b1T5uvV6fvlud5+G/Y6WqO8/Wv2UHN0TjtGfV4Ar/d/0?=
 =?us-ascii?Q?/2j54hz6zCVZ+szRqKH9E/xFhDCU8ysB3wMiiT4f7bZmdrhXd9mmFMfVGrda?=
 =?us-ascii?Q?3eIQw0sQVIiKifLFpDyrJgq6PRdFAScI1/kq5DjV+T7uqKjAcemflb9XrU26?=
 =?us-ascii?Q?IYVoYfFjLLHkTxN6vA7I9LtOYawUPLEwcIwo/TdFYJ74mlsV/KOu3yDnqnT4?=
 =?us-ascii?Q?pQcAsOvVwPo8jAbf1ne6ZOSwVR7WS02Zp5Uz5wJrQrioNh1a+sQ6sY97GTno?=
 =?us-ascii?Q?rXfjnrQ+P63qZ34NajP+CtPjHLGDV3JEaptFbX6zsTsnmXWHbUNG6fjAVc5h?=
 =?us-ascii?Q?kbLAGfzvEKztC8oVf1QuukuJnl/3xFWGzLkSLBFR/+NhaE+PjeU/EgNv2V+x?=
 =?us-ascii?Q?IcKw/O5nBEMfvUMMDLrJBXSZjjzj/Wd8fdrv3fzhq693QbmCtXhoEH5uxoNU?=
 =?us-ascii?Q?BqCmCQk/Z4LuYNQtAI8l4Zu7dL6KOVhsIhS2+dx+g3y1SSOjvhpWB2l7XH8z?=
 =?us-ascii?Q?y3C0Pep6iR3s8dLmIgiPQTPvTapBrycb2WgUoxpTV9U+J1M51azVUzCeM3jx?=
 =?us-ascii?Q?ahF++iUwfkyUFjUUue9bLeaIAXlRQp59L+fa/kcNopiqITDuecQUvFtBbLKv?=
 =?us-ascii?Q?PUVGx4W3drriWWpVC6JNSBw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c03ebeea-34a2-4698-94b1-08dcf16327cc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 23:58:55.2182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RxyC7EehZnDBn/1sDuOnpfZbJM7Q9t+/aKe8C/Sx4LV6qDoUWVAFIJCcJM9RuJNjjtJqmDlYhWQ+jOtlYjrRodJ2mKjzZkm63/TTcMHDHnTXd7bsnZFJuEYI1lJAf+5k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12916
Message-ID-Hash: 5TNLPDETQRHP4KTZC53UPMX6NUV2ACWG
X-Message-ID-Hash: 5TNLPDETQRHP4KTZC53UPMX6NUV2ACWG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5TNLPDETQRHP4KTZC53UPMX6NUV2ACWG/>
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
 sound/soc/intel/avs/boards/da7219.c    | 2 --
 sound/soc/intel/avs/boards/dmic.c      | 4 ++--
 sound/soc/intel/avs/boards/es8336.c    | 2 --
 sound/soc/intel/avs/boards/hdaudio.c   | 4 ----
 sound/soc/intel/avs/boards/i2s_test.c  | 2 --
 sound/soc/intel/avs/boards/max98357a.c | 2 +-
 sound/soc/intel/avs/boards/max98373.c  | 2 --
 sound/soc/intel/avs/boards/max98927.c  | 2 --
 sound/soc/intel/avs/boards/nau8825.c   | 2 --
 sound/soc/intel/avs/boards/rt274.c     | 2 --
 sound/soc/intel/avs/boards/rt286.c     | 2 --
 sound/soc/intel/avs/boards/rt298.c     | 2 --
 sound/soc/intel/avs/boards/rt5514.c    | 2 +-
 sound/soc/intel/avs/boards/rt5663.c    | 2 --
 sound/soc/intel/avs/boards/rt5682.c    | 2 --
 sound/soc/intel/avs/boards/ssm4567.c   | 2 --
 16 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 80c0a1a956542..93eba4fd27710 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -203,8 +203,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->exit = avs_da7219_codec_exit;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index a31aa471a1c21..4dd9591ee98b7 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -22,7 +22,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC",
 		.id = 0,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
@@ -30,7 +30,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC WoV",
 		.id = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		.ignore_suspend = 1,
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index c8522e2430f8a..426ce37105aeb 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -233,8 +233,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_es8336_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 430c070a1a0ee..cb6d54db71892 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -39,8 +39,6 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
 		dl[i].id = i;
 		dl[i].nonatomic = 1;
 		dl[i].no_pcm = 1;
-		dl[i].dpcm_playback = 1;
-		dl[i].dpcm_capture = 1;
 		dl[i].platforms = platform;
 		dl[i].num_platforms = 1;
 		dl[i].ignore_pmdown_time = 1;
@@ -160,8 +158,6 @@ static const struct snd_soc_dai_link probing_link = {
 	.id = -1,
 	.nonatomic = 1,
 	.no_pcm = 1,
-	.dpcm_playback = 1,
-	.dpcm_capture = 1,
 	.cpus = &snd_soc_dummy_dlc,
 	.num_cpus = 1,
 	.init = avs_probing_link_init,
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 7e6c8d9c900bd..4556f105c793e 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -46,8 +46,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->id = 0;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index 8d550e82b46a8..6570209c1a63e 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -82,7 +82,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98357a_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_playback = 1;
+	dl->playback_only = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index fdef5a008daff..6f25e66344b7a 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -134,8 +134,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98373_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98373_ops;
 
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index 082f311d8b840..ad18c4e9a6704 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -131,8 +131,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98927_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98927_ops;
 
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 6ea9058fdb2a7..bf902540744c5 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -210,8 +210,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_nau8825_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index 9fcce86c6eb48..4b6c02a402047 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -184,8 +184,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt274_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index f157f2d19efb4..e40563ca99fd5 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -153,8 +153,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt286_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 1e85242c8dd2b..94fce07c83f9e 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -173,8 +173,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt298_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index cfa146b6cf087..30588d9e9ba3b 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -121,7 +121,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt5514_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
+	dl->capture_only = 1;
 	dl->ops = &avs_rt5514_ops;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index 44f857e909691..b456b9d146654 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -171,8 +171,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt5663_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ops = &avs_rt5663_ops;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 0dcc6392a0cc8..335960cfd7ba1 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -242,8 +242,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt5682_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 63bbfc30f35e9..cfef00462f661 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -121,8 +121,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_ssm4567_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 
 	*dai_link = dl;
-- 
2.43.0


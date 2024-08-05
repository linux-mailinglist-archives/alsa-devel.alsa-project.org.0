Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE70F9472C3
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:02:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F13FD54F0;
	Mon,  5 Aug 2024 02:58:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F13FD54F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819549;
	bh=Hhv81/HSpJVtlW+VhLi/K5ZgCF+j5U2PyI7QPdZmU00=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vhAMqFGkIp4rO0+Mv41Gt//VM7SASoQZHCk2Il0HiTz8HMP+VLvHtYoNrd6ifPo11
	 BqmAioBUvRLgd/XQyUnjdZMu4QoZv7+O5+QSSnDfejyAtVPDB98Lhc1jxG0fNWhdbV
	 YpcH7Cp0WDlVC0P3Zwd8aRne2jpsScuo5Kbx/ONU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1326EF80724; Mon,  5 Aug 2024 02:41:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AE6AF89CA6;
	Mon,  5 Aug 2024 02:41:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80E65F806CB; Mon,  5 Aug 2024 02:41:33 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 32C0FF89C6C
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:41:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32C0FF89C6C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XFi6oEPo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZ0xbJWJUf6YsPLbmjiASqdL7uNx0bSzBTkWdYyziLBX7nOyvYv9TfwAHCDExrLwvL5r3h2XvxZOmnZKsoWMTcZqkDY21LZRPuDDR+qVtD6LaioVnDWf7xCHhZB9mgDPby0eoicKYoBMzw4mFQSOKeesghOoAf+EingqmfDGX47F9vTol85y6ZefXzKfDQiRnRJnbR5RIoxYQQ+gS7aoU9Zpz9+2g/BDAW68LuLKoSL5iZVycSV0lasI0z6T7EdHN9ry4WHCRAX2d+gtHCt0knatWPaUlUs/XO1nvyMFhLl2AS3lf3/CE4Mwc0gkJytxXY3niPn7Wd6ewZTux5VTVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pl/QKOh2AOi4lo/4J5AJaHKZXHuDTYPachRqMFZMBxQ=;
 b=GcrzLXFRhFrNtKU8f2V3MwSOySD7LGm+SoEir/7xVNsbWzzCSbsTnbFZSUX9+UVFJf5iem015Q17+jk8Hm8sGSXvBdKCf0PArgR38dBqLSZUemHT86mOeCEPJZ/epTXYKbVuSxNP7KLSrV5DFtXT50u+uzL9xWEVVd70JoPTxbxjzYVkD93Ng+hHSetOhT4T9XTzkXiKp8YHfHDeO9J5H8u2DPqrMC7vcPdO4W0BbvCXxoAT3eu78g8enjPeqgEyNtOOfsJGNfTsn7S7a3jkFNvM4Ef/HKkBdKzj7WUZvwraCZNyk2i4PtBEBiVdfROxK7xEvky0twoDJSVjfNVxDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pl/QKOh2AOi4lo/4J5AJaHKZXHuDTYPachRqMFZMBxQ=;
 b=XFi6oEPoJOteQYd1WTlY3MEi/MzH+zt9yGe6SDVXC5epOpizxuN8HB8gvsnsdiEDdd86/NwRzfsBGLK7VuU6/eKQgxeF6m3XDz+bkYsGrMAlala7UU5iJ1jt2vwwntmS84g+2o7lRTAlBTgWPO4YthGpCCHbtb5ewMfX7Ke19sk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8678.jpnprd01.prod.outlook.com
 (2603:1096:400:15a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:41:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:41:15 +0000
Message-ID: <875xsfyf6c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 074/113] ASoC: codecs: wm*: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:41:15 +0000
X-ClientProxiedBy: TYCP286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: b0075e42-6308-4368-77e3-08dcb4e7502c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ycepHoP4yHrYMGl86+hG6uP2Bt0ejDJJKj+zQPAvhCmdW4tjqYWGXf90EQtw?=
 =?us-ascii?Q?0IWGnZN7onSmjqFlufRv/J8CB/D33Qtrw49rTVjKSDIetx2qb27yMOCks2Gw?=
 =?us-ascii?Q?qAZcKH51nNf+/X5jgCRDIeXvkvx51avUY2GmBpNaW0dQuC8rQEopqsIFzrBr?=
 =?us-ascii?Q?d09Vllr2o58gSmG5Ed+ePnXDhWzfpdMQaG/scAZIFwQKH0RhJ/ThCDmcV1MU?=
 =?us-ascii?Q?pciVm3VGOiazzZRGD5xjQPiOFtoKGiBrWYvK/IWnHaPey9Fvxgm7jNWfrg4l?=
 =?us-ascii?Q?dAIu6YNxSad4nTs/S6rjbZH3fgKJOY8T07Qm/4fi9qhJj4RJ8+LSICYPH8AV?=
 =?us-ascii?Q?TkaHtLrcxBU1yL7y1R8bG7HK4P+U/Q6l9chkYXQrWmE7DR/MtemHThOgD71Y?=
 =?us-ascii?Q?x+VSw6LXxyMUrSFbf9IWjYjpkc7Utf+T7sFM7HkJlVloE/qRr+GilRH9eOKX?=
 =?us-ascii?Q?vGNvfOkcltQnRVuiKV4rG74k9yKkVCNJzlIJoMuZ9K2Ybe+WD3J5+hDbdYq+?=
 =?us-ascii?Q?IRqhN/JTeYVHxN0r6vy2rHdJWbiktHXlU3vXczhtAJheVds3wWWWJrfpUks2?=
 =?us-ascii?Q?HLI513tcR4y2uw7M9OKHp3B/RPcs76DWsxwms7LMPKwMyAa/7RE+pnzxoT+9?=
 =?us-ascii?Q?lad+2tmKEsy6/tSNr4+CeU9Wokc8TskjMTdBcMLdU7/qy0JJtd1xrQ/wiKS2?=
 =?us-ascii?Q?6ET817V12wDPHsVUgoB6W0C7Eqr+kowjQCNCO/eDJEIaF5KsakracxC+Sl0n?=
 =?us-ascii?Q?p4+WsmLoe/g0P8QeDmEUfyMrsKLa4nlNcNu8wMmbji5Y44x8ZT9Ys/xmuxpx?=
 =?us-ascii?Q?Ax7G/2GF7VhR1uLwnAj6JiBZslWYUY15y8/gUZ8as6DObOfuHYMyIKtsnC1D?=
 =?us-ascii?Q?ew6tlW7Nk5mbkYVYoCeQaOlWg5fXvncMetnDOx2QF2VRPXIL4AFThLi2WNi1?=
 =?us-ascii?Q?V/kuR8/8pC5o5FwJlgsTAJyqshnbvzvPrjwaw0rkq9b2c24fSjaB9HJyBrmy?=
 =?us-ascii?Q?GpMUZpGUPnmtaS19v2CzguCh3aGKKfl7RZ9t7NyoqP9yNwnbbUWhPbS7vbR1?=
 =?us-ascii?Q?dqtWi33t4HTvRTchngU7bWtwAPadk/ksygDUbI4UEhgT9HJ6fPZcJy21FKAF?=
 =?us-ascii?Q?/ogc/EwHIvRSVqqxw2K/zcuDSlOKaPFHSHySm6513s5SBd9hRcfDFGVOulAm?=
 =?us-ascii?Q?o9bhCHWlvTvV5SFxyEHz/uGlb0YhKVv85qk1jnMNbI57yZxXDp02Q6+jjVg5?=
 =?us-ascii?Q?gCrqCEl0uAzQuq8lXiPuYQT089GXqSD1ISnEIjzv7CcbiOzd6bO5evHugeh1?=
 =?us-ascii?Q?lp/ujZ0S1/l0HKIwVAgkBSOeyFR6ly1pg830L4lp6hBwIO9Es20VXcyblIHx?=
 =?us-ascii?Q?DK1LeqPH0PtlwfIiVbLx7Z3uMRYCjDZa+HmewUQQUP01Dwv/0Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RdzktogsXHh6tVyfQHW+fqvYfv3/mBIGwIkI4KVLA8iNYb9rD5xl4jvHMV58?=
 =?us-ascii?Q?grBywJs2vOhwKJ0XRTM9PK/Yqz80eLGxh3OYE5035EUyxf3za+FaRPERvXZQ?=
 =?us-ascii?Q?UJsOS/lU354FL+zmxxBcYdtw/lwQ2vJF6oBx93/h8pFXYEgHHP2NUz/3gFPa?=
 =?us-ascii?Q?9pmHoD6W0mzjDh4u/oH/EaLIRcayFL9i08A8Ur6WY5lfkaG7LttPiwXntCHn?=
 =?us-ascii?Q?XpLwvWJurWGy/fdZhrizRBOCrAnYwkrVfpTBYz9BY1QF9HTG8bKEtuu8ZKhc?=
 =?us-ascii?Q?FS+oAXCmhFEQ4rdptI1jPTg9N1bv6di4dItaNB6JcsFX4fXaiRv/6UWD18Ub?=
 =?us-ascii?Q?Mf/6YrP+OT2mbJoPVSdweBPF5uWv4+12yGLFGPFEmi+KUThGH3SLjaK56B8a?=
 =?us-ascii?Q?ka7WyuEz5D9koxZU+VFOcRqlsSwDDOsTL7CiQG9XEUTpE0EA51TDo+vI9S2v?=
 =?us-ascii?Q?F0MnERosjnHVmQa0FHrNWKqwkqFFwP2RGPADlhzOCG6ZLgEscdnqqGUxne4x?=
 =?us-ascii?Q?9OY5QbOSL54QZ924EjI4WdtPeAH3M12LhHZ330tF7Nw6Wobad0+H/NztDhBq?=
 =?us-ascii?Q?e29RfQ+P3SYGYhuVsCPdMQT0ZndTdH0uS6s55xD9ruNjujaxqfe7PvAOpNDU?=
 =?us-ascii?Q?fT1Q+wufxBbC4hklhtdAEh8TeNdLeq16XQ19lBzpdDygavHhRhSp9XQSzstR?=
 =?us-ascii?Q?kgBDMD0ZlxZvRLm8cSsQG+bwLuf0BH7HkddRagduFQHAlE8bs2TmGDVmxJdu?=
 =?us-ascii?Q?ARwrCo0U5uVZWIELxtQGrPlJxd1smgUZZFRENd0yA2u4idWpHMPfJNvxxSyj?=
 =?us-ascii?Q?sAbkKFrv0sxc4kl5f+GQNyzuXAt346qHGgfBOB0Yy2qlE7Eq5Djx2VJoZKM+?=
 =?us-ascii?Q?2Sor7xm2bLFNp9KkhZZtzd9ovOi53SBN1woTZXh9AvjUFzQc3mD1+9GjZbug?=
 =?us-ascii?Q?ExjXA5fbd4jWA9ek1rrjXYHAV4YgEtMeU8swichb0vPz7fqm4iHJ33+XQolM?=
 =?us-ascii?Q?1c8Lku51tGA5x6VuBspsBItGvuST8az+mA2WigIw3beQK4Man4iU73quaN70?=
 =?us-ascii?Q?gwhFOxllESW1qSsbLdZib0mhVls6/94fiG+DB8poCw+dWU/MJyIzR+j3XwbO?=
 =?us-ascii?Q?X/HyxWiK7rMd5h1Mqh2OQJ+y1vdyLHYTqQNkWf/7xVOk/y5wEvkGrqzcHEze?=
 =?us-ascii?Q?LdLnxFS+vZ5ayab4onFn4LOQP9culZqaO6AoBJqioJuhJh0aYDDGBr+8KP0+?=
 =?us-ascii?Q?wyNT5kO09D7Dhv75G2JNhR2/zGHPmNR+GKKFBrxNqukqGgPS6NKdGj/PzrOd?=
 =?us-ascii?Q?GSgGrrxpv/HtA0ZgmevSUM5JjrWi0Q/VyLGfLEgwzmgJnGclf/RzQCsfNLML?=
 =?us-ascii?Q?IkqpjqjoF2UHv8dXQ3+RgfNbV9Vp2O7jmkNdyhpOS45+YIKZYNZmTVb3e8Q+?=
 =?us-ascii?Q?VshEIxOSFg1LykbOL5wq0J++VDC5BD+c7Sx4X2zYjkDbljPkDv3WX9ksrayA?=
 =?us-ascii?Q?EZV0YdIzzIxnAn5Sw3X2GQ2p7gah4L6jF4TDMvErT6e6NuUrm8JNy1ysOnhM?=
 =?us-ascii?Q?j7jE+LsMJSztwCGcy9pioohnc0I1sDN6lltuKG+rkvSNi4rokpOICF4SkVWC?=
 =?us-ascii?Q?n861GtWPj7c+zonbHXucHFA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b0075e42-6308-4368-77e3-08dcb4e7502c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:41:15.6064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Gj5NoP33qqclX/GfUsCDMg689lAUV26mCemB8DdWxs0yKCnHXF4+8DCPqycC1bjRcaXeCRJcgPz0/bYX6ET41tc9TJbBjW94DbxvArHcKu/z3sCxiWidZEfCUupuunwn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8678
Message-ID-Hash: 2WX7ODJ54NRQJMQ3ATUIY4BCRDACPBXY
X-Message-ID-Hash: 2WX7ODJ54NRQJMQ3ATUIY4BCRDACPBXY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2WX7ODJ54NRQJMQ3ATUIY4BCRDACPBXY/>
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
 sound/soc/codecs/wm2200.c | 4 ++--
 sound/soc/codecs/wm5100.c | 4 ++--
 sound/soc/codecs/wm8350.c | 2 +-
 sound/soc/codecs/wm8580.c | 2 +-
 sound/soc/codecs/wm8900.c | 2 +-
 sound/soc/codecs/wm8940.c | 2 +-
 sound/soc/codecs/wm8960.c | 4 ++--
 sound/soc/codecs/wm8961.c | 4 ++--
 sound/soc/codecs/wm8994.c | 6 +++---
 sound/soc/codecs/wm8995.c | 4 ++--
 sound/soc/codecs/wm8996.c | 4 ++--
 sound/soc/codecs/wm9705.c | 2 +-
 sound/soc/codecs/wm9712.c | 4 ++--
 sound/soc/codecs/wm9713.c | 4 ++--
 14 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
index 841247173d98e..b755be789c4c7 100644
--- a/sound/soc/codecs/wm2200.c
+++ b/sound/soc/codecs/wm2200.c
@@ -1749,7 +1749,7 @@ static int wm2200_hw_params(struct snd_pcm_substream *substream,
 
 	lrclk = bclk_rates[bclk] / params_rate(params);
 	dev_dbg(component->dev, "Setting %dHz LRCLK\n", bclk_rates[bclk] / lrclk);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK ||
+	if (snd_pcm_is_playback(substream) ||
 	    wm2200->symmetric_rates)
 		snd_soc_component_update_bits(component, WM2200_AUDIO_IF_1_7,
 				    WM2200_AIF1RX_BCPF_MASK, lrclk);
@@ -1758,7 +1758,7 @@ static int wm2200_hw_params(struct snd_pcm_substream *substream,
 				    WM2200_AIF1TX_BCPF_MASK, lrclk);
 
 	i = (wl << WM2200_AIF1TX_WL_SHIFT) | wl;
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		snd_soc_component_update_bits(component, WM2200_AUDIO_IF_1_9,
 				    WM2200_AIF1RX_WL_MASK |
 				    WM2200_AIF1RX_SLOT_LEN_MASK, i);
diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index 11bbc94a282c7..b55c90f00ac5e 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -1478,7 +1478,7 @@ static int wm5100_hw_params(struct snd_pcm_substream *substream,
 
 	lrclk = bclk_rates[bclk] / params_rate(params);
 	dev_dbg(component->dev, "Setting %dHz LRCLK\n", bclk_rates[bclk] / lrclk);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK ||
+	if (snd_pcm_is_playback(substream) ||
 	    wm5100->aif_symmetric[dai->id])
 		snd_soc_component_update_bits(component, base + 7,
 				    WM5100_AIF1RX_BCPF_MASK, lrclk);
@@ -1487,7 +1487,7 @@ static int wm5100_hw_params(struct snd_pcm_substream *substream,
 				    WM5100_AIF1TX_BCPF_MASK, lrclk);
 
 	i = (wl << WM5100_AIF1TX_WL_SHIFT) | fl;
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		snd_soc_component_update_bits(component, base + 9,
 				    WM5100_AIF1RX_WL_MASK |
 				    WM5100_AIF1RX_SLOT_LEN_MASK, i);
diff --git a/sound/soc/codecs/wm8350.c b/sound/soc/codecs/wm8350.c
index 66bd281095e1c..05178509bdfab 100644
--- a/sound/soc/codecs/wm8350.c
+++ b/sound/soc/codecs/wm8350.c
@@ -931,7 +931,7 @@ static int wm8350_pcm_hw_params(struct snd_pcm_substream *substream,
 	/* The sloping stopband filter is recommended for use with
 	 * lower sample rates to improve performance.
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		if (params_rate(params) < 24000)
 			wm8350_set_bits(wm8350, WM8350_DAC_MUTE_VOLUME,
 					WM8350_DAC_SB_FILT);
diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 73a8edc797fb2..f00c3c1e62332 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -576,7 +576,7 @@ static int wm8580_paif_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(component->dev, "Running at %dfs with %dHz clock\n",
 		wm8580_sysclk_ratios[i], wm8580->sysclk[dai->driver->id]);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		switch (ratio) {
 		case 128:
 		case 192:
diff --git a/sound/soc/codecs/wm8900.c b/sound/soc/codecs/wm8900.c
index e44fdf97796f3..f084143c8171e 100644
--- a/sound/soc/codecs/wm8900.c
+++ b/sound/soc/codecs/wm8900.c
@@ -649,7 +649,7 @@ static int wm8900_hw_params(struct snd_pcm_substream *substream,
 
 	snd_soc_component_write(component, WM8900_REG_AUDIO1, reg);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		reg = snd_soc_component_read(component, WM8900_REG_DACCTRL);
 
 		if (params_rate(params) <= 24000)
diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
index 8a532f7d750c8..cda6c4d8e129b 100644
--- a/sound/soc/codecs/wm8940.c
+++ b/sound/soc/codecs/wm8940.c
@@ -408,7 +408,7 @@ static int wm8940_i2s_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	/* LoutR control */
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE
+	if (snd_pcm_is_capture(substream)
 	    && params_channels(params) == 2)
 		iface |= (1 << 9);
 
diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index 00858b9c95686..9ba1edd5ba9a9 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -833,7 +833,7 @@ static int wm8960_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct wm8960_priv *wm8960 = snd_soc_component_get_drvdata(component);
 	u16 iface = snd_soc_component_read(component, WM8960_IFACE1) & 0xfff3;
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	int i;
 
 	wm8960->bclk = snd_soc_params_to_bclk(params);
@@ -891,7 +891,7 @@ static int wm8960_hw_free(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8960_priv *wm8960 = snd_soc_component_get_drvdata(component);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 
 	wm8960->is_stream_in_use[tx] = false;
 
diff --git a/sound/soc/codecs/wm8961.c b/sound/soc/codecs/wm8961.c
index d1c731e25777b..6b0e1f76358ec 100644
--- a/sound/soc/codecs/wm8961.c
+++ b/sound/soc/codecs/wm8961.c
@@ -531,12 +531,12 @@ static int wm8961_hw_params(struct snd_pcm_substream *substream,
 	/* Select a CLK_SYS/fs ratio equal to or higher than required */
 	target = wm8961->sysclk / fs;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && target < 64) {
+	if (snd_pcm_is_playback(substream) && target < 64) {
 		dev_err(component->dev,
 			"SYSCLK must be at least 64*fs for DAC\n");
 		return -EINVAL;
 	}
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE && target < 256) {
+	if (snd_pcm_is_capture(substream) && target < 256) {
 		dev_err(component->dev,
 			"SYSCLK must be at least 256*fs for ADC\n");
 		return -EINVAL;
diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index a99908582a50a..d4adbefae32be 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -2934,7 +2934,7 @@ static int wm8994_hw_params(struct snd_pcm_substream *substream,
 		aif2_reg = WM8994_AIF1_CONTROL_2;
 		bclk_reg = WM8994_AIF1_BCLK;
 		rate_reg = WM8994_AIF1_RATE;
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK ||
+		if (snd_pcm_is_playback(substream) ||
 		    wm8994->lrclk_shared[0]) {
 			lrclk_reg = WM8994_AIF1DAC_LRCLK;
 		} else {
@@ -2947,7 +2947,7 @@ static int wm8994_hw_params(struct snd_pcm_substream *substream,
 		aif2_reg = WM8994_AIF2_CONTROL_2;
 		bclk_reg = WM8994_AIF2_BCLK;
 		rate_reg = WM8994_AIF2_RATE;
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK ||
+		if (snd_pcm_is_playback(substream) ||
 		    wm8994->lrclk_shared[1]) {
 			lrclk_reg = WM8994_AIF2DAC_LRCLK;
 		} else {
@@ -3069,7 +3069,7 @@ static int wm8994_hw_params(struct snd_pcm_substream *substream,
 	snd_soc_component_update_bits(component, rate_reg, WM8994_AIF1_SR_MASK |
 			    WM8994_AIF1CLK_RATE_MASK, rate_val);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		switch (dai->id) {
 		case 1:
 			wm8994->dac_rates[0] = params_rate(params);
diff --git a/sound/soc/codecs/wm8995.c b/sound/soc/codecs/wm8995.c
index 1f9a9b6369350..2c2074b9a6bdf 100644
--- a/sound/soc/codecs/wm8995.c
+++ b/sound/soc/codecs/wm8995.c
@@ -1563,7 +1563,7 @@ static int wm8995_hw_params(struct snd_pcm_substream *substream,
 		aif1_reg = WM8995_AIF1_CONTROL_1;
 		bclk_reg = WM8995_AIF1_BCLK;
 		rate_reg = WM8995_AIF1_RATE;
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK /* ||
+		if (snd_pcm_is_playback(substream) /* ||
 			wm8995->lrclk_shared[0] */) {
 			lrclk_reg = WM8995_AIF1DAC_LRCLK;
 		} else {
@@ -1575,7 +1575,7 @@ static int wm8995_hw_params(struct snd_pcm_substream *substream,
 		aif1_reg = WM8995_AIF2_CONTROL_1;
 		bclk_reg = WM8995_AIF2_BCLK;
 		rate_reg = WM8995_AIF2_RATE;
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK /* ||
+		if (snd_pcm_is_playback(substream) /* ||
 		    wm8995->lrclk_shared[1] */) {
 			lrclk_reg = WM8995_AIF2DAC_LRCLK;
 		} else {
diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index 5c06cea09bd18..d9c0bd6b09925 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -1740,7 +1740,7 @@ static int wm8996_hw_params(struct snd_pcm_substream *substream,
 
 	switch (dai->id) {
 	case 0:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK ||
+		if (snd_pcm_is_playback(substream) ||
 		    (snd_soc_component_read(component, WM8996_GPIO_1)) & WM8996_GP1_FN_MASK) {
 			aifdata_reg = WM8996_AIF1RX_DATA_CONFIGURATION;
 			lrclk_reg = WM8996_AIF1_RX_LRCLK_1;
@@ -1751,7 +1751,7 @@ static int wm8996_hw_params(struct snd_pcm_substream *substream,
 		dsp_shift = 0;
 		break;
 	case 1:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK ||
+		if (snd_pcm_is_playback(substream) ||
 		    (snd_soc_component_read(component, WM8996_GPIO_2)) & WM8996_GP2_FN_MASK) {
 			aifdata_reg = WM8996_AIF2RX_DATA_CONFIGURATION;
 			lrclk_reg = WM8996_AIF2_RX_LRCLK_1;
diff --git a/sound/soc/codecs/wm9705.c b/sound/soc/codecs/wm9705.c
index 5c6aebe29cf13..97f3c9c7a4413 100644
--- a/sound/soc/codecs/wm9705.c
+++ b/sound/soc/codecs/wm9705.c
@@ -236,7 +236,7 @@ static int ac97_prepare(struct snd_pcm_substream *substream,
 
 	snd_soc_component_update_bits(component, AC97_EXTENDED_STATUS, 0x1, 0x1);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		reg = AC97_PCM_FRONT_DAC_RATE;
 	else
 		reg = AC97_PCM_LR_ADC_RATE;
diff --git a/sound/soc/codecs/wm9712.c b/sound/soc/codecs/wm9712.c
index e63921de0c37a..d3a190c06ea9c 100644
--- a/sound/soc/codecs/wm9712.c
+++ b/sound/soc/codecs/wm9712.c
@@ -529,7 +529,7 @@ static int ac97_prepare(struct snd_pcm_substream *substream,
 
 	snd_soc_component_update_bits(component, AC97_EXTENDED_STATUS, 0x1, 0x1);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		reg = AC97_PCM_FRONT_DAC_RATE;
 	else
 		reg = AC97_PCM_LR_ADC_RATE;
@@ -546,7 +546,7 @@ static int ac97_aux_prepare(struct snd_pcm_substream *substream,
 	snd_soc_component_update_bits(component, AC97_EXTENDED_STATUS, 0x1, 0x1);
 	snd_soc_component_update_bits(component, AC97_PCI_SID, 0x8000, 0x8000);
 
-	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+	if (!snd_pcm_is_playback(substream))
 		return -ENODEV;
 
 	return snd_soc_component_write(component, AC97_PCM_SURR_DAC_RATE, runtime->rate);
diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index 64b69316e4c70..bf2824be4f0d4 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -1032,7 +1032,7 @@ static int ac97_hifi_prepare(struct snd_pcm_substream *substream,
 
 	snd_soc_component_update_bits(component, AC97_EXTENDED_STATUS, 0x0001, 0x0001);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		reg = AC97_PCM_FRONT_DAC_RATE;
 	else
 		reg = AC97_PCM_LR_ADC_RATE;
@@ -1049,7 +1049,7 @@ static int ac97_aux_prepare(struct snd_pcm_substream *substream,
 	snd_soc_component_update_bits(component, AC97_EXTENDED_STATUS, 0x0001, 0x0001);
 	snd_soc_component_update_bits(component, AC97_PCI_SID, 0x8000, 0x8000);
 
-	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+	if (!snd_pcm_is_playback(substream))
 		return -ENODEV;
 
 	return snd_soc_component_write(component, AC97_PCM_SURR_DAC_RATE, runtime->rate);
-- 
2.43.0


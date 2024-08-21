Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAE29592E3
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 04:29:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC5707F1;
	Wed, 21 Aug 2024 04:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC5707F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724207361;
	bh=7T5SGVq+cmPJcolPqnFU0XdNWcf66At32WJWk3zsJnY=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=At7ZYwzld7mZByzKCPkFbF55H/Z7dNjYkWHOHFhWiN002MFlD/zsmu05sVzSy+HUY
	 cVbgeP1zf+0N1AAsF9ExMxQ+LBups0k0PCqeuT+YbulgCnE9v/zF9bpJhgM7EbSMja
	 SlL7EPPUR5E82rxEa9TZY9eBzjvGHHgV6u+hpzNA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAF2BF805AE; Wed, 21 Aug 2024 04:28:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA805F805AE;
	Wed, 21 Aug 2024 04:28:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63B21F80494; Wed, 21 Aug 2024 04:28:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 763BCF800F0
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 04:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 763BCF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=CVJtVZXc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vrx+kEY92uOThYbdohuOOM8ygwZ17gNGnKb6EM+XLHrBiwcX4p/+vmqrJ25bavtnqwoO2l7Lwm8YvYw9UovMipkJHHdd3BCub7y5Tyth3N1uYkv3187iin6aBfm2dBdnkRY6kyMheU0DHJ9xy8cdl4xWJymwe12Dboun00Vb2u5cYTGnCKGK2Ld6ZqbsCy2CMhQ+Nx3/RLvUYlpRJXCqHjCGPTR0TIJ0LG1vg/taUa2zo1ajQiz9rxLsXrWfEDMVMGgF8LZIl2OanEGbXTYfPScEDtH/1jzS/41O3KyBhKkVJpZnwFxzp17JeNN5CiRqr7O/KS1UuD1jSsOghU+ZDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faVSubdc+EJMGbpDErOo0GxWg/FD8j+vvFWBcrkcqgM=;
 b=N0E7wldg1Auvy5bPzVtbJOTG3wh5yDVCdtOkOV8VOwCHrqEmlxVduOh1WMzsXA+s2wZtt2JNKLZCs8NUVQvSP6Sazc/7oTsrcFX1op67z2qBELiK15bncAY1c3804uq/S9a1X4AoxCCgm7Q/r0Tq/DZsoeapDHq6/Qa4h1nRHXtrf7XRR0ayqlF89KbcyttOglnzrQQsLYxxPUx80NmbftRrpQae5b6hTQaGuhDRN3BqfQWp0oTPzb8AYBRtDSPOseJz6frPC5QnQDYjLLSvZCv32s/7sn96WuKRZPbWt2bO4tJGdvubFXc6OUtznqMC37hsv0kRYRwDvDknYtqUKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faVSubdc+EJMGbpDErOo0GxWg/FD8j+vvFWBcrkcqgM=;
 b=CVJtVZXcSfsFbWcSyPEuLUi+dAqZS3+gXyDUGGLZQLI1h0NGEYuWFtYg/rJlsOAVPnPoQ1D1+Zk1CP8n59vrNsHCeKZV5bnwa5tlZu5kfQ24tsTiFCMrUQkqHAYD05h9BNLlCmkfx9KW8bJtPy6mLzCw04V2XDl09v1YSR/SEgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12156.jpnprd01.prod.outlook.com
 (2603:1096:405:ff::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Wed, 21 Aug
 2024 02:28:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 02:28:32 +0000
Message-ID: <87le0qa9tc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/2] ASoC: soc-pcm: makes snd_soc_dpcm_can_be_xxx() local
 function
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Aug 2024 02:28:31 +0000
X-ClientProxiedBy: TYCP286CA0243.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12156:EE_
X-MS-Office365-Filtering-Correlation-Id: 33309fed-f7ec-4fda-17d7-08dcc188f33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CTQ9FLoX6iILbfzW4ePXL2CwtWaXDrlIrzJsHi9dH2e5HbGtNPHtznqZfVZz?=
 =?us-ascii?Q?rID1OQg1qwFXp/b2SwvwP2fOKh67TUxe87RXxpUr6bKeDA9bagqF+g8UVFl4?=
 =?us-ascii?Q?bmGjb5OlYR95TVjw6lfRsS5Kwh1Ksk+g6joXCKvFzGzc5R44a2iN/WLYqnZ1?=
 =?us-ascii?Q?Z9oPAVQHs0tSGBjJ/B0H2sFj3Mw4FIXAIM8IRoFAwlTxCqJ9xwfEIWV98ewR?=
 =?us-ascii?Q?5s3DFC7dsW8Mme7dsFrZ6/YLk1HItf6CEtYnvVmkYKcXtV7fzjuM8/mWdN/q?=
 =?us-ascii?Q?iWiGhOGi90YVOtoEFaLK185DJwnOE5f5SFWkEzqt/yr+6H6/SdmhDSmPw/V5?=
 =?us-ascii?Q?SVCxTb2zGC1Mc5FUtUIK2bo0ldZF6xstHFmfgw4ARlUc8PAuJKhrrc1tU0rN?=
 =?us-ascii?Q?OCGSrnkUDkpiuCNiflqSV0r367M+TtfXeJyX0NvG4DN6YPDekkSNVD52MxFp?=
 =?us-ascii?Q?4gMB7Do0su4qtO+88BcauyPFLsz+yANt6CWV7dDVqayEFlM37BOdDgOsuzWJ?=
 =?us-ascii?Q?CCmld5oGsGjwqTubtbW2c1RQL6bz2q2sjxrNg71ElSty302Blxek8NN2S+1V?=
 =?us-ascii?Q?Xo8gIYDXxEYDfgMmXDR+X7bycgsHzzql4b6QgGbERLPGo+vakRK5AZV5TFpW?=
 =?us-ascii?Q?Z9Ywp9MVDgAWvXkyUSapxoCA/ggEuO2SuqO57YxRuCqZ2WdGuZJ4MMpXfLHk?=
 =?us-ascii?Q?zO9oB73CBJzhlKgLEvrx/iD905bghnbMt4Ly82mdX513PdeysII3Zg88ZxmX?=
 =?us-ascii?Q?F72XP8z5NXV0WBUuz8aMr2N2btm7iY8qUM/rWWo9YVadX/QXSz6vX2G9Ktir?=
 =?us-ascii?Q?dWRWMR6sFxEYedFr1b+iWHv62gGn4MCa08qqwrZoyvbFRd6CJLpdXncoIoRU?=
 =?us-ascii?Q?B0E0AXUJLYgBfpM/yDcGL2zMNMfjChYeuQ5MeXSYDBnyv4+oWv/ORPD8UkL4?=
 =?us-ascii?Q?iXHbL8rk/I5s2VgcRcjsLvYy/ej513LTbf6pXrxb+TQRq7jNEPzwnf0AmoKO?=
 =?us-ascii?Q?/AZGA5kq7cFA2EW0nxKXkp47Dioa+oS/wmbfoD3kbZdOs523n3jxMalU/iuo?=
 =?us-ascii?Q?QYS3uKtk2us9y4A7GF60UZve7EsmEXXBOGlMao/7XTaIkO6m5obc4hepFfhc?=
 =?us-ascii?Q?l1g0mK9Zfk58h3pLjz2zIMGPEy4q5lEzGanxdmkSRYPJqHP2CLksxjAq4x5A?=
 =?us-ascii?Q?dqLvW7KZ7Y4/q0pATJZtdh4zcksdfUrNrYudN0/DxKdffEnYeW8RA5LPvwrL?=
 =?us-ascii?Q?GL2QYipHQ4/ZOsI4BpcRE56IgUz23V+ZPDJcqcemTyIWSnXU9PjHEwjBKMCo?=
 =?us-ascii?Q?RtRvCwQrexJ2e19ZQFrhZA2ubCto6BEO5ROWGYCIrCWuJwXrpbQuLm8vIx2M?=
 =?us-ascii?Q?ALr4R48iaTw20H5s6RsNB7T8LA8B7rH4pZIkpBl8OFNj/YhQBg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t4YTciS7bK2wGRNjJo63aMJ3qOO2qxnieAJB+4kJexvn9HU2LNKU0H/aP6Rd?=
 =?us-ascii?Q?vJKVzD0t0qorxsc4QVBL+XWI2RkTBJmBjMbqshEvfAAMrxjKUBeKfSoObH6l?=
 =?us-ascii?Q?pO5okqJYz3eznxziukcZqQ8XVkXGL/Q7J0YhGkxUW2WHB3wEwOyOy4QW6V9l?=
 =?us-ascii?Q?0qgEpaFUDphz3oNjSVS1iEjfEcQG2o5k4BqC4Pk2e2L3J89cAy2Ru2IzANP9?=
 =?us-ascii?Q?ax/d5F9Lowu2ZUiB/X4Mt/Iy6OSJBp5akhxaDzxBmu1Uw/s1OHyp0recxuTM?=
 =?us-ascii?Q?IGyzhexo8+7qy0fYu/dC3+YI28Whp2azC71EibZ+tbCweZBuhRtTQWqDTnP+?=
 =?us-ascii?Q?8kyoKt2f8to/Jr6K/TnCPhC0G/18t2TkoS2e4Zm/QgjPpM8thKZQioW9T5j0?=
 =?us-ascii?Q?0LVc3qhBunKIgo4eFKiaPtoIFecEez0GT68EHuqNpWEg/wZEFN16SRHrTER7?=
 =?us-ascii?Q?szUGcOWm9WZpHJ70itVmqUv/aTkBLcMj+v6iCEmBe0gv4bdEB1FMYXTHQN3j?=
 =?us-ascii?Q?WXSED7ch1BxxQV3O9UqfR9ELX133eTcG7lk1Ncismn6j3pt6MS5gjRLSv1d/?=
 =?us-ascii?Q?NxBcYIHIMPhS08p/KiKe0JuZsJBrDU8z4OmgJzmZlYNBuZVlVviqC5bALSLR?=
 =?us-ascii?Q?QBvqqS4zavG6nzwto3DjY5qEAOQOkAnR/88JhXvQRC9gSDihCrrcsW8O0lG8?=
 =?us-ascii?Q?A5QPxFC5xz0FDLLVr0RxhUxsfRFLtPjdiHD85avuv2ZTE47gOpdQcopadH2M?=
 =?us-ascii?Q?nmWvjVOQtPsd3ROknRmHTdNXJhItcsTSrtJ+fb0xR4IV+NuEOelA1CxxihQi?=
 =?us-ascii?Q?EVt452LlAl45Y5QUnhz3OQyU+E+gwgSzE4a8mxxOvrgxPfAvzdKyBFvfmV33?=
 =?us-ascii?Q?+qh/hCuRs33OSL8zgK3T2lJHHiiTSVvjE1tTARI0q4m5KmOrJrWj3uE0f9w7?=
 =?us-ascii?Q?K1Pako3w4h7DSIi5T49v0S4gU72p/K0KxvQMiFaarkk6UqNI4TwUsaR7tsUm?=
 =?us-ascii?Q?3JBfN8lAm+llNFOAMMSWAfyv8FpQ7czJejuYeAIc2r4Td5YuoT5VfdA+O4za?=
 =?us-ascii?Q?b8AnEf5YfnTSqjUZoRkpKqlTCg9BFAH+dUeLcWVxevy/Iq9ObRRubgDrYWY5?=
 =?us-ascii?Q?hIlcLxocWyJ0FgD8eFyK1xH+3DzPzuS+siP522bLK0D2K420t0jjXLSIqDS6?=
 =?us-ascii?Q?ReFbyFnV2kxRvWwMD0ytRgjw7a9T8ygMRWXYq0n526oNvoT7uOnRxhEPVCC5?=
 =?us-ascii?Q?0S/DYeqDr+ggBlzVeMR/t9W9o18TNAABTnCJgSbpIbUQihaDhNvfUhuIMUiH?=
 =?us-ascii?Q?nxup6TL0orbwEIMIUYDSL6vV9URiKwWyHUpKK2Rt2IKz801Ldz+JonGW9zsV?=
 =?us-ascii?Q?SlnxuHYXFIEQgNf16//MaU3jGH6mBrUTrE73kozal7vnzs6unF0PmRyQPtlo?=
 =?us-ascii?Q?LPMpMT2Yp/5tY7NDYIeQphCfc14qhnl4DpAo0On6UryUEH0xWSJyR1oEyKyw?=
 =?us-ascii?Q?XaY+lPERWbRi0LwTfcKlBchXgbnmSy0kUXczT/AE1ZqAQGMeK0FdXSA4adzb?=
 =?us-ascii?Q?Ht0E9gwHSre36vwD33tFhwZLiRp7JJ1N5vMG9BRqotKth2nZFpFugo4Hn2sj?=
 =?us-ascii?Q?cGbi/JSQc6pgRCzM+czUiIU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 33309fed-f7ec-4fda-17d7-08dcc188f33c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 02:28:32.0955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ylj3yL3T9OwV3N9u0aCqFE2CuF2pxaePArAcT9WcGHGrJ1yFPXC+Ln8SZxewG2Go1Xml+LqoIao4SrmGZpqomvEBhnGzp4p+Zt/Iq9saMaKDhUa/8e8dINJPGenh8uWZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12156
Message-ID-Hash: PM7E34TSOVUH7VNXT2DHWUIH65OLPY63
X-Message-ID-Hash: PM7E34TSOVUH7VNXT2DHWUIH65OLPY63
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PM7E34TSOVUH7VNXT2DHWUIH65OLPY63/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

No driver is calling snd_soc_dpcm_can_be_xxx() functions. We don't need
to have EXPORT_SYMBOL_GPL() for them. This patch-set makes it static function.

v1 -> v2
	- rebased to latest branch (for-6.12)

Kuninori Morimoto (2):
  ASoC: soc-pcm: move snd_soc_dpcm_can_be_xxx() to top
  ASoC: soc-pcm: makes snd_soc_dpcm_can_be_xxx() local function

 include/sound/soc-dpcm.h |  18 ----
 sound/soc/soc-pcm.c      | 201 +++++++++++++++++++--------------------
 2 files changed, 99 insertions(+), 120 deletions(-)

-- 
2.43.0


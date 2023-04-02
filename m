Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 545676D3AD7
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 00:51:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 859301FB;
	Mon,  3 Apr 2023 00:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 859301FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680475877;
	bh=4acIE22/WWWPJ/AD6dQXrj4kyH4ZqyLsUPoCHcFkjIc=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=r6FB8j9uRJZj/JkfTdgLoDZRfG9GuMQu/UMkG6dnUjY7ZwcD4JGybpRRmTR79/85R
	 iBjCdCcVC9szMaFXcd8dA58AShFuNchs2psZVW3cRf9glK99akZwcb/QgG/4TZws4h
	 h6T44+Z67yjeVMEdzzQqZCueShJIo9JmLbcLA0gA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB6D8F80249;
	Mon,  3 Apr 2023 00:50:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16F56F801C0; Mon,  3 Apr 2023 00:45:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B4E1F801C0
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 00:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B4E1F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Rx4OTYzz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aY4svJRW2KqMEw8DMHKHvlSnGuNkqfOsOdJ++/+cryOK9NeTEZilPzUUQW71xJHk+B3zM7xDUvFKXYhUioypCDnYNPBeZtHIj5a073FlpRLiIMYIwU6MHCgGuLMe61jJfzGcny+BVuKA4Bwl+zXO7EKPvqi7ZYYemqWRAHUOI/cZFmRviY/46ZXLVWo4T5q8zEWOaazPzOw8JjGu4cuYp4/TRGOQ5E1cZ6BVxuY1Hb+KAXYYOz07ME+BPa/2pzQobRw/RE9KKKgI09DUIDxx2JazmVkQ3uB5aDrreFEgMpvvczb9R1wIxuG3yQZSeibDP3nWen5c1N+zpDBXkEtGGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/TorVoqgmMgcow69ZuMt/68uBK2pwf0Ab9Ko0+esyg=;
 b=XYkpEmRMKpof6diBSRgn2avID3/IZ9YDfuECCQN0Y5ks2FCyMiTHVdm6FC+k+nWPsHoZVhkJLVkAalzg1HQya1nsQaGOFLAFQOcsYlu6xbUVNFUSAQxgXXBLzR8/+wL3NIJbcuYdrgb+/rmGYnVJooijKx1HK50rDaQiEK8qqRCwbWWfbpEUDwpfAfuIVZD9qe7RcuD7jutb7vr6V66kodiVWmsuujyc3GNGrQXBqUvNQMJeBbPJh9Sk0dcICmUCShYl4tyP1/gZZAgL+AvMZHOmRvniTrgVYSijZf32Jcifm7w43WSf7CIevNL20d7SaeixbYVVU+yNfQ27rgiANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/TorVoqgmMgcow69ZuMt/68uBK2pwf0Ab9Ko0+esyg=;
 b=Rx4OTYzzPw8s0Gv/ILGDq3huPEsFZhhD/gfG2R7B13hE0Pv2T/R5aLN21onOkAJzaZD2igLGz1mk4FKCdz4PsH5N/kUfjqzzfVLwOTp8YHSdJ8bi6OiAVIaR7pjmYjd3ED4whh5/Y+Q7AfKtJAz39/aBEvpHdbvRo8VoutvgSUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11431.jpnprd01.prod.outlook.com (2603:1096:400:377::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Sun, 2 Apr
 2023 22:41:29 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.033; Sun, 2 Apr 2023
 22:41:29 +0000
Message-ID: <87zg7pc3fr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend 0/5] ASoC: clarify Codec2Codec params
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 2 Apr 2023 22:41:29 +0000
X-ClientProxiedBy: TYCP301CA0047.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11431:EE_
X-MS-Office365-Filtering-Correlation-Id: e633a606-5761-4a56-d9fa-08db33cb6679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hiPFdRVzbMbG4WgocBSKPpsu91HhjfwNm9qrmQZzM2okLdeNK23F5RYwtdpuPR/14KmjQ19OXfDiLNnWu6EFXV5zS+h2Lz105clrlPHPFKfHcxNcHAnbgO9hycXt5QSrmTm7gh56Av7zk5sdNkagOvQXQVNU/fgFVIwZO7OszRWcj4/XV4h3Gy4XmT9JskSqxY0xRwDRu0O7Yhh46a/IU/qJdjF7xvngn8aVLFYF2X5FKcmBRbHo/+HuPSOBmqf40bAT4Xs2cm9c3OCSMv5HR/HqISlTMxHEWwKZXKqn0MGYMn84XT0gCjutDO2yRF/h7RXRbxPKiLin5k7h0X8azEvaDaECy/WlNcd2xQWqijt+S3TAB7yONVSsHtFMqsmAuVB35k4JdiqUyilRYqyz8UEypuIjPTba/z/16EUt9iBbUYBoTtXBlOGYfRnVrbUpP+T4NHLLtX+EcaSNUQrMedTToRL0etO4d9Jmiu+xMdq8PvAWGIynPd0+yVu0bWypAD7gYsiFVdlP5JyAWtR2AfyCYl/N/RRBQm8DC5TGm/0Z4hK8z5imLX1dACM4alR2uP6B4a0D2C2wWD07YJ2m1QXqSKlhZofVaC38U6tHKT8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(4326008)(6916009)(8676002)(66556008)(66476007)(66946007)(478600001)(316002)(8936002)(5660300002)(41300700001)(38100700002)(38350700002)(186003)(83380400001)(2616005)(52116002)(966005)(6486002)(6512007)(6506007)(26005)(86362001)(36756003)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QedJ3p7zaZP/VJnadQaKlLi0OZ0ZY+H+shWmxeDs9D2XMQnVROzPSLAtYfw4?=
 =?us-ascii?Q?HyR9e7AVw2jBXrizkG/Iu81RPJ8LlWWxY3pWb4V1EWAH98ftt9QjkcX+LjiJ?=
 =?us-ascii?Q?WvLBzeYr9ZtiHNivyAK3v/VY45PmKK0FScI22ZYuIzUj+4dfFqVOpvZ1HRYx?=
 =?us-ascii?Q?fpKotajU/HZydsgsb0z+Hcf1Do7BDm88HFRU6+pC83RSBOWMND0ji/Vm4NHu?=
 =?us-ascii?Q?H6OIJzATGMG8/tcjysiROKwaX1hosJe7NUNLxLyQyc8RNAo1XfXsEKgcm7RB?=
 =?us-ascii?Q?y+B+Y14KzUy1VX+Pjv6fVBIruMu+9Ft4AGA5GdWALWKFmqxCrJden49VGBf+?=
 =?us-ascii?Q?aMgP1sEEaHeT0p671ie+fKHC8f0VE7o6/dgF2u//LQdxN7bBjb3QvNtrTe7v?=
 =?us-ascii?Q?egSvARH7n9RFdfBXOzymUpDpQLyZAUxi/dYRc4thY7mtYkrIuOwRDQZ7Mbll?=
 =?us-ascii?Q?y1VkDbHmx+ingFurqxUD1lP05uDT5hvjYg59BLoNzu4QMRX6e6HMtXzCV4PR?=
 =?us-ascii?Q?x1Sancg9kINmcpg3iZz13MQYbMaNqCb2VpZ0bsGqyy7kJ0ARgPFEC08S4Z14?=
 =?us-ascii?Q?0itXis/J/WBpDHIoRREqEc2yA0FllbKtdE+WaNSNq7T5L4znMW5ToJoBxsHD?=
 =?us-ascii?Q?h4fLoJ8Yd2FTHRMeAK3dPMT6HCPSoAPDQTW1tAxlCkCjv7FesMNezt/+VK4k?=
 =?us-ascii?Q?tzBMbjfThW4y975/RXzf9besE/h+eZ1dJ8tWOT5J6an3u+RlRIYOtVl9h7p8?=
 =?us-ascii?Q?QT5r/G/737hEywQNhEFDUAVGxT08w8KKR4OFJBpB4ocnf6CG2aYIdkhPz1Ep?=
 =?us-ascii?Q?t/a6ZTnV+spcKKZ8YHEo0wgB410D58rlufzJUEdWGOoIm4pEVLzCDub13QI7?=
 =?us-ascii?Q?mkw4w1YGHQBXBpOxXrqHqCoibXw/lNjXkLq1MZKbyolFxWBq7Rx7AXKLkSIo?=
 =?us-ascii?Q?9vEs+iHzpjjVX9fk+OHEnmOHaYnd/0psn+/aNQJCUmK2CtBCDoIlSJemaz3w?=
 =?us-ascii?Q?Is7/SYiXqdO2Swq3GJCOZ4J+uji0hN/saldkoWb9MuiJGVQPYdjb2M7xD8Jv?=
 =?us-ascii?Q?SnnRnny+garyDK/DFQR5YK2o7r8y1mu1Hodt5I3EN7G6fhoBw69PhITstecC?=
 =?us-ascii?Q?EgWMP9B/or7wHeRfNWku38ulaXFXV0gzKpamzlYvDCXU7OND5YFLMNUg9vZx?=
 =?us-ascii?Q?m0hNX4KaKxwc1dfq6JYdFmDYWf11+ubFoa20obaDrZU5k+RcfCo5vUKV/k8a?=
 =?us-ascii?Q?ZhEwVlKz4QdOUOk4zNBCbYM8+0fqhXaRxgL3RkwJwxDhw6Of7AQyxsoVDLbD?=
 =?us-ascii?Q?dbmKjwECckMKhKSXpTb2aPWgdUGqOFlrcS9vaoNE5n+g7wmIBI/2z0L9Jy7u?=
 =?us-ascii?Q?Y4QnPtzWXf2UfLgMsiVcFVsmBrLS2QS6oIheZp9TMrgOwvUt8WZW/954s9GA?=
 =?us-ascii?Q?ENSke/N3UczBliLKCPNNDxuO4ursTy/tW3t8CDmjo7k6kvUt3hq9fwvPpjN/?=
 =?us-ascii?Q?6RE7UeFHHbysYzTajSKyhrwokEzp7yOd+D82yPaF3kxpjCTIrhrjnNyhgnis?=
 =?us-ascii?Q?UzNi6MRHwyC9c/cAveDTFZWvDjfZoo8huy1cnXnXai2vD9cD5RXs26aCmrtR?=
 =?us-ascii?Q?lzsbFFYj/12B11U4NcLPDQY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e633a606-5761-4a56-d9fa-08db33cb6679
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 22:41:29.4695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Svk9R3Utj7VwJABxLo/7ljD6KepZvmFn2EVCAmY29sT1VLDvmqRCLolhwnC4U5W3zir6gb9ayrdQo59wV3psk62ziHGrB4skWaCQlVjcz+orhfEqJn5yflwOKka/Ei0H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11431
Message-ID-Hash: DFAWTAZ4MW256EVG6NJWJNEWPE2L6LKD
X-Message-ID-Hash: DFAWTAZ4MW256EVG6NJWJNEWPE2L6LKD
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DFAWTAZ4MW256EVG6NJWJNEWPE2L6LKD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

ASoC is supporting Codec2Codec, but its parameter name is
"params" and "num_params" which are very unclear naming.

This patch-set clarifies it by replacing to c2c_params / num_c2c_params.

Link: https://lore.kernel.org/r/87r0tb6ond.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (5):
  ASoC: soc.h: clarify Codec2Codec params
  ASoC: audio-graph-card2: switch to use c2c_params instead of params
  ASoC: meson: switch to use c2c_params instead of params
  ASoC: samsung: switch to use c2c_params instead of params
  ASoC: soc.h: remove unused params/num_params

 include/sound/soc.h                   |  9 ++++--
 sound/soc/generic/audio-graph-card2.c |  4 +--
 sound/soc/generic/simple-card-utils.c | 24 +++++++--------
 sound/soc/meson/axg-card.c            |  3 +-
 sound/soc/meson/gx-card.c             |  3 +-
 sound/soc/meson/meson-codec-glue.c    |  5 +--
 sound/soc/samsung/aries_wm8994.c      |  6 ++--
 sound/soc/samsung/bells.c             | 21 ++++++++-----
 sound/soc/samsung/littlemill.c        |  3 +-
 sound/soc/samsung/lowland.c           |  3 +-
 sound/soc/samsung/speyside.c          |  3 +-
 sound/soc/soc-dapm.c                  | 44 +++++++++++++--------------
 sound/soc/soc-pcm.c                   | 10 +++---
 13 files changed, 78 insertions(+), 60 deletions(-)

-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEA96E55BC
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 02:23:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50A3DAE8;
	Tue, 18 Apr 2023 02:22:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50A3DAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681777397;
	bh=7m4rrbfScaz43drhZKSLfs2hlDCz233ntSXYtzjbN3E=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dnAqyrRvhVkzoRA8HiIezHeM5M8ULE1Qt6gxDK8U2ETRWCmXWyu7xo9LyvJ0kcZ7U
	 tr90wv4QgQEccJZvBxDO2WZFVjzCH7kuRUTgpj5xsZyufAquG2dZ0s3pGFKrJC9j32
	 mFLvRf6JCEDYZY2lxEUImwYNIPY5P9TpHEvXQqyA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57049F80149;
	Tue, 18 Apr 2023 02:22:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F313F80155; Tue, 18 Apr 2023 02:22:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D31FF800F8
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 02:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D31FF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MHP92zYR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqHPqHAXD7QRCc/eZl7VoNU86g2a7y6dhZlTMJ6vv49Syf+5x5Oa6PRQvxXa8vFm1CDhTcGjMrdPLleYjvsRqKd4AzQrKe/MMJDHrlOdnceQvTBqIbOz0oonQ7VzU1AZbQzFUV3GNp2k2CivB+C+ptw6JUL+mf8UZoLexqWsO+ZFYJclTiO1zl4++sl4STNIabRN/TtpEqmF7Gu1RkQBbNZcw91ijp1Kts2SluykitElkGeRO+ysw9xWdVBxeOLvU/J1LNii8ZBgPLyNtix6MyRyQ+I5ThJn0zrzywSk0urNqUrJRL8y3EGhKVRqeWqW/qIAhfdTwV+E9ECU6GVedA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=racOrLpZXRQFkSEJu8aWUxcxk1iMFqk5BvhaZEsehyE=;
 b=CvWwwlB/tthYm/6wHrZ2QXh6ejeqWJ4xgsUiAxG6a5hr81lBtaQgnhrSY1ifo0rbYpWJCw8KmL3FuL/VYMMNFFMBPt3fF5tE9d20j6DFYbWNfWCNPhrqsdBnqdOAAxqGByLkfjfyLVtgjHDktjlHd5ee4rrqnR3ncmxCA8MyakdVcNq5JIjPTOmypeBNO2U6bBae7MAJwf+tI4Do9HQQoNSp4B0KbTSm1Bh9CQJunud1jRseZWgEfQ6V3ys/eaVjHQLjlFTlITub1WTQwgN8rpTLBlXq3thefDdrF4smvk/LN1txNaYD/aH0tHmE8bn8yQkjKOXRENzZSgKKnM1XBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=racOrLpZXRQFkSEJu8aWUxcxk1iMFqk5BvhaZEsehyE=;
 b=MHP92zYRtLFgTZvj3ZgW/BbGXVhVptOYEiRXGj9uvHT1vb+DJMSJKWtqn64+DY8RAuA7kkiEnmAlHIzbhvOjYV37flErVf8rPFkiwNFfXye5yOkBeesxv2hm/88eIbucILmWzjvUxUFXYRCzKWEufDvONdbS/FNIsP0zNMpaDz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB6024.jpnprd01.prod.outlook.com (2603:1096:604:d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 00:21:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 00:21:59 +0000
Message-ID: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/11] ASoC: add and use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Apr 2023 00:21:59 +0000
X-ClientProxiedBy: TYCP286CA0125.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: fb32ecb2-c599-4454-cded-08db3fa2ecff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fV7cWDW4DVfO3zCxhWCzQQXEXFDuEEGogWI2BGGmltiDNmRbctWzrOtlVV54fWPWqN80ZcT4+1ZabwhUap3jIgbZ/RU6PmSqMNfSgOxRyrLskcLCg5kpCCV3YSh0UqhB+z7VNma9xUuvfQtEEtO742OiNN6HaychhxZyj6DBklgYsFsJRNc1K5EG5F1fDScuAindOVv+Ez+9lmiHkh1RT6t9tdPwVba98ccW7LFN4shLCQYc3A2BZaux1uFGa6je7PH1ctqGgUtL5fc0V4CdNkTWd7TJUUPQWkophEC0ga139l9qJn61Phb6M9R6dmNS/Bpt20VVHkHqkTIvCE2YwzCYrMS264y5VSWGcoi8KB6qUzp5iWhSkokrIkl9DOx0wvkdXfXVNuH70oRMB5S+njRJKlB+5iGufZkxCDrqEo7qyihGKjAupzudwg4ZCthmHEu6Ft3I0/WFJ8PpFrR4Hb4ZJ128Qm2E+MEpIE83X5JYV+MKsK915yFkGcbtg77vF/qnAWCdtDVeFGbKp4LliP+aXP9bF1V8bExfJ3vQrtCEtFCVuvKRTa3F23fnkqT177D4AoTUNGSfmWFISnXjD+mbX5XywzPb6f/1RN+yUm0gi0PR17OMzRzCHd9xIJmN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(6486002)(478600001)(86362001)(2616005)(36756003)(26005)(83380400001)(6512007)(6506007)(186003)(38100700002)(38350700002)(52116002)(66556008)(66946007)(66476007)(316002)(2906002)(4326008)(6916009)(8936002)(5660300002)(8676002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rww2YuHFYekvUYijM+B0qSXOU3heN5Q9Un0nys2z+L9hERjmcJzuv5i/R4hF?=
 =?us-ascii?Q?4/+Xjq0l/qv6y7qS/Sso2OkYQXwyDEsG6UJ5koN/kRwIXo72zboXOz+Xqzhs?=
 =?us-ascii?Q?IoZkRr1mHnTje1FQstfgGMEJZBse1dih4hlktLv+AY0Me2LkmLLPZeERTEPt?=
 =?us-ascii?Q?g0gggMPFRpZSym9OV+77ywb+ddcdhpXxp48m6AolL9sqt5xIg7zESbsgHUiC?=
 =?us-ascii?Q?VY0STVqyiS5Fdv4kIhBJhQVYOc2VVc64JJE2GZy+ULVI2pH+X54Mx4yMIJQY?=
 =?us-ascii?Q?H2NKgUCVZ9+o/QaJTS020FmGETWMqY5AQwuH6Vks+XZTTY5eOc8QbeRQJnSJ?=
 =?us-ascii?Q?FGzM6d4i7a/PyUmex9soknQZRTQGzdq1HMA1lb1riDQQiz8AhAeea6gdtA1J?=
 =?us-ascii?Q?P7PTDc4SGwhbCKTc5ryZeflr4AyT1KnSwGGGb7AhngVGAeGOIpX3ATn4WgMF?=
 =?us-ascii?Q?qulXSWdTJs2IuUko94ibcwMAtK3dNCNeyzVBB43a7QC5o7NDIGM3x6gDf9Bb?=
 =?us-ascii?Q?zRVbXDVq4ddG+TLv5jLxvSY3Njp0erT2hizaY99f6nMmrm5vVC8W8LVP3wml?=
 =?us-ascii?Q?OsoKIF48aqhDvbYrNoWUQo2uxw31T+CII6ylafDUn5ePekhTVOnf3SYsTQzu?=
 =?us-ascii?Q?DymfVioXklTJvuhlsfUAi0s84emJJG2jqeF4DW7+Ez/OB91OHx7JJQc4JhET?=
 =?us-ascii?Q?ARgQqZE6QnoRxmVmMgavMacIi25Yy5mDKNQV7YVUSVpBuO4uJ551mdQK/WJk?=
 =?us-ascii?Q?/C00vPZdyAHHRhTNaGE3csL3vc95xt2GYeznLrJ1FE1PENTQwniuvpbwsqNA?=
 =?us-ascii?Q?DdBGiwktT8cPUa7UqSg+PHgaCvsfnww46N2lDYx+Kl4pita3EJ55rKIiYo88?=
 =?us-ascii?Q?jzmNJxihEqJDm5idZ0Li8x22R46hAoPBgTItmUuoKuI2rCc3FaJhrhbM8yRe?=
 =?us-ascii?Q?lqFPuPEDjHXZflWN40QbgZDw0gAkVisTJaG/TPhmJ22riQZFoXSEjyqw4IpW?=
 =?us-ascii?Q?zOGpOEtfq6K05odKd6MnpFIGUMz2rfePp419AZrrKYZRC831XPYRPeMtnuuz?=
 =?us-ascii?Q?RUyPZOZNBlYwR9VzGjRpanpgKLyVlmOcszW4svHsxnLQik1FnLYLd8P+8a66?=
 =?us-ascii?Q?zyaqjQWdpT14USPO3qvqFKbrFZFxfkErPAD9kDsYSQS0nudV2My/hXY8fMDV?=
 =?us-ascii?Q?kmYZrngL3FAeCFQGXRzyN6M/mBSK5A3jbhXNzzAEsQBq4mDp6GrMKdlRLByr?=
 =?us-ascii?Q?n77JtNIu87h24twzZi5hOlyVWWnEAIAVzigsBfuluypaXV9uDg/tQALTlOAr?=
 =?us-ascii?Q?Xv4YtbtBGuYj1SCw2Cv8WTDqruB/VLQTnDIGT5XKFATcBFNZvu4tAC2jGaQZ?=
 =?us-ascii?Q?wV5HHWoL8iXZeKm/E6BosBlrDgp7bRWuYpsmIeCCvYDpOwfZ0DjY962k28mq?=
 =?us-ascii?Q?N301u7jQAQOVmjFvtTjYEKl4ONTAxPrX2o8i6+Y6ou9+Iw9cUM86bq3eHBRW?=
 =?us-ascii?Q?YfRUThSpfj2tVCYHCqMwtQIS71ZAHvp6RuGrjVZ7VVHoq6ewBTWxuGJ36ukk?=
 =?us-ascii?Q?HruL6ZO4vEon8EMvWZxhfhXRy2H3vACnp7eWvfsHUd6cNaruC611Q4NK0zL4?=
 =?us-ascii?Q?y7GQGrQhyq0RURoNkag/nUg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fb32ecb2-c599-4454-cded-08db3fa2ecff
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 00:21:59.7711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5MZ7sf238E6zGtKNcE4tme9E467m8IVWmb6SNLOJHVRXjh453l0CIXgZh6p3apkMn59ylmF4ODmL4l7cBT1VMi+DRKwkX7HCpbvnImvMl6rxOTQ95ZBEYHrjm8/TCw33
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6024
Message-ID-Hash: VVT4OV6OX7VZXYST3QXX47VCGWTUKC77
X-Message-ID-Hash: VVT4OV6OX7VZXYST3QXX47VCGWTUKC77
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VVT4OV6OX7VZXYST3QXX47VCGWTUKC77/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

Many ASoC drivers are using dummy DAI.
We can use common snd_soc_dai_link_component for it.
This patch-set adds common asoc_dummy_dlc, and use it.

Kuninori Morimoto (11):
  ASoC: soc-utils.c: add asoc_dummy_dlc
  ASoC: simple_card_utils.c: use asoc_dummy_dlc
  ASoC: ti: use asoc_dummy_dlc
  ASoC: sof: use asoc_dummy_dlc
  ASoC: amd: use asoc_dummy_dlc
  ASoC: fsl: use asoc_dummy_dlc
  ASoC: qcom: use asoc_dummy_dlc
  ASoC: atmel: use asoc_dummy_dlc
  ASoC: intel: use asoc_dummy_dlc
  ASoC: meson: use asoc_dummy_dlc
  ASoC: soc-topology.c: use asoc_dummy_dlc

 include/sound/simple_card_utils.h            |  1 -
 include/sound/soc.h                          |  1 +
 sound/soc/amd/acp/acp-mach-common.c          | 43 ++++++++------------
 sound/soc/atmel/atmel-classd.c               |  6 +--
 sound/soc/atmel/atmel-pdmic.c                |  6 +--
 sound/soc/fsl/imx-audmix.c                   | 14 +++----
 sound/soc/fsl/imx-card.c                     | 11 +----
 sound/soc/fsl/imx-rpmsg.c                    |  3 +-
 sound/soc/fsl/imx-spdif.c                    |  6 +--
 sound/soc/generic/simple-card-utils.c        |  9 +---
 sound/soc/intel/avs/boards/i2s_test.c        |  6 +--
 sound/soc/intel/boards/ehl_rt5660.c          |  8 +---
 sound/soc/intel/boards/skl_hda_dsp_generic.c |  8 +---
 sound/soc/intel/boards/sof_cs42l42.c         | 11 +----
 sound/soc/intel/boards/sof_es8336.c          | 11 +----
 sound/soc/intel/boards/sof_nau8825.c         | 11 +----
 sound/soc/intel/boards/sof_pcm512x.c         |  3 +-
 sound/soc/intel/boards/sof_rt5682.c          | 14 ++-----
 sound/soc/intel/boards/sof_sdw.c             | 13 +-----
 sound/soc/intel/boards/sof_ssp_amp.c         | 18 +++-----
 sound/soc/meson/axg-card.c                   |  6 +--
 sound/soc/meson/meson-card-utils.c           | 10 +----
 sound/soc/qcom/common.c                      | 11 +----
 sound/soc/soc-topology.c                     | 12 +++---
 sound/soc/soc-utils.c                        |  7 ++++
 sound/soc/sof/nocodec.c                      |  8 ++--
 sound/soc/ti/omap-hdmi.c                     |  6 +--
 27 files changed, 78 insertions(+), 185 deletions(-)

-- 
2.25.1





Thank you for your help !!

Best regards
---
Kuninori Morimoto

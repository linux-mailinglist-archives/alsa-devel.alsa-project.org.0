Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB237BF02D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 03:22:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDAD2F04;
	Tue, 10 Oct 2023 03:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDAD2F04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696900931;
	bh=LXpx5JLraVvnJtunZuAP14ooEdWijXCygtcfie9gUSM=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ljp1CsFPFGuno+FOBEkWkrVEp6ERBdDJhAWmLhCuYW9g5Zzn68nbgVzTB5bWlFVhI
	 WqnqvY+qz35LcT6+qfqHyuz3aHS+aSQ8o9y2gJ60lngBfHQDFmpEVeYEuDCCCaAHPz
	 W5WxOG245LCo43ZpkGf8nIVVgOqbJjcpkh9rFZpo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3309CF80552; Tue, 10 Oct 2023 03:21:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C038FF8027B;
	Tue, 10 Oct 2023 03:21:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DE68F802BE; Tue, 10 Oct 2023 03:21:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E4C1F80130
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 03:21:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E4C1F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XXslpCib
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3dJBo65VrEktwBrRi/YCyeuaj1q7kg4ZxZTXl+yiilkLrgcXZ6pwrM+ttgZp/uoP8YNybHzeSu2qjqBehWi65nfj/nlMs+cofu3WHkag2Ud6PpZXXcU8bZi0PyDiwH/wJ0SCMRl6t1NbqMcX5u9OT7zZSl+NcqFXyx+/amWjRkq4cd5QtH6N0l9ufj0u+65rtwqqeinq7sIINIuswDsg8b0gDQ2qFxDZhMpMX1r976LjXnPYXu6wpBHiAd1MhSobWSJIrWdqQ2YyP7Z6KtEiAmKnznlSwIFgZox0mHmlPXn6nF+68uUXu/YY10MAYjoZuyMK1jd2sS51qwh9c5rsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9V9u6YXKRWuE/nMx7NsifkgrB/DbI5a7I8AlYN3ok4=;
 b=f+BIU5NHkccCrTz14IGNh/bUJIYjNv9Ci6TZw33rVZ2xuFQUv1BZUVj6MI53j7D0Ga3/EB3WTVtOnORch3NN37/BKkr261rbSHLxxoNRVbO4WEeTUepDfKoDyhcj4HzqpuYVFRP9LfVmydHnjw7jhATtl8x7yLadnlzYUz8agj3qHal8/dnjobMfHJJ9m9uxVIlo1cpjVE0jVFOGTyqqc0m9isgkLWllzE4oWG81vZ0ijY9XnhhEr1rD9y17svtBKTD/Og8OyXUJ55CvjqyCKAxL7oUB85X/OGdkZLdABMDAj71fwX4Yt9WxZY6zqdauHh7lWy/0hSAsME4fWIPBng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9V9u6YXKRWuE/nMx7NsifkgrB/DbI5a7I8AlYN3ok4=;
 b=XXslpCibZ6O/h4rICNuiOZKCKBQ2s6YSMku3YiXtuceZYv3/u7NIN8YkUhsoUbw2dkYSWmjCpAiWsY9z+tiEo3hbovK1+r7BUkyu+Klv+twBaSvI+s2pj7bSpajvvtdSW5Lxdj4nBSe3zcNGwbB8a3Qd4VxFY6yTuJaCs15xTP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9647.jpnprd01.prod.outlook.com (2603:1096:400:1a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 01:20:56 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 01:20:55 +0000
Message-ID: <87bkd78e88.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/4] ASoC: makes CPU/Codec channel connection map more generic
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bard.liao@intel.com
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Oct 2023 01:20:55 +0000
X-ClientProxiedBy: TYCP286CA0283.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9647:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b558446-f078-4ccd-8d2c-08dbc92f26fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vydPX5Km4MaEdEh+Mv1e45aF/SLvphxjaj1nRSrdylDwST61FE8HFegRldsI2txm/cJ5HP/B8wwB/LoTrm5WUtnXWiRLjlVQPxLNhKZvs8licMkR33cFzk1p25JQxKY0yjIyMNUJcNJlSIeTZwXQlfTxNth5L4Jz3qrRS4Yj+TnZ8D4+zVa6nWedME+SF+tYLl7cCUAfu1ipSw8vWlmqtMO3OFOSwHEclM8bcPJ4h2SYO/0sgSPFqUMTmIweqZLd1+S/irj8qLUl96uHWx1OlKyN+oaws4C6dxRTG8GkZc40JbHQPFAkr6XzrU+RfjLujeqfEIzyYzFLnUm3nwOtmsX4hx+TdwTjFYI4++4Ai63Ea8TIF7IkNCm432Ujl9xcaekqcrdt+x5he3ZCtlyipBCvqThxuSsDpLPQKz5Lsh2d7pw0ce1DeD285JJ/Pmd6K25wZGMdsBFkoBuUoC9pH74etgB1iomm9xOXMv8FXjj4deqLXb1WbrRbkS1ExhKqpubdsyS5ZkxC5dSyWbNGZnobWeb6+W5yEyV+a5SK+nbUCB536fK1RxEZ7v/lGfECAw5vGY3S3/J6pROIf7j4g5UacmhAMEGmNqW+Qbsb3toj9LgmGiNFh7nR4COcZSFC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(38100700002)(38350700002)(36756003)(6512007)(26005)(2616005)(5660300002)(8936002)(8676002)(4326008)(41300700001)(316002)(110136005)(66946007)(66476007)(66556008)(6486002)(52116002)(6506007)(966005)(2906002)(478600001)(86362001)(83380400001)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JfsAc9ZqifRmOfcB2EAmfX38TYorLl6nmFCduM4Q89zgA8Fif7LDsyWTQBMy?=
 =?us-ascii?Q?kmOCbJx/AUgToBTtu5WuzUOXGqYGB80GlSo71wvbHiGXM9zfRkCtKKNCVJ4P?=
 =?us-ascii?Q?FsoIHicpcvtyCWmKI2PyRq6LPYE+dhsF6KKaltlATLkJmgsQNozenyiu10YH?=
 =?us-ascii?Q?qrgrdHE3b8N+GgTUMceI3ODhBiqrwNDiehT34ynxot90cnGsABuaMxHnKHgn?=
 =?us-ascii?Q?irtf18yySw7pVwmBnMqhahl6Tz41Jk7mbdnrYY5FuPaJkQlhhp/fwsRx+AVl?=
 =?us-ascii?Q?E6UsoVv3bvTPFGX/WTEgiLBtbJhgF9bbelS1LDEh0Kcc1SoKaXf9nrd6TC2L?=
 =?us-ascii?Q?bL5i+pA717CUFsp55EYXYFfCEG8v3HL6vqi2G9DAw9YkaVqwvUjNswVPz9+k?=
 =?us-ascii?Q?dO9eoY9LLRtkCa842oO/oajJccTYOf+HOJiYGfXIc7pFUxUYG3RRS7NxsoDr?=
 =?us-ascii?Q?QfbFCwlmfMSy8NmccliqsJwbT7pDQ6+ig5c6DEptNrra9BAKaafbQyzH3oOC?=
 =?us-ascii?Q?cV4bJ0Qa49ePvf67dPM4LnB6bFPZI446iki/AVOYgbLtS5vRjRj0R39pRYtv?=
 =?us-ascii?Q?F0V5F86o3GAxl9rQx4GVjk/pudr9nw+WO0ryepbXFqbyL3mXsV/WH1cC2tPh?=
 =?us-ascii?Q?RWjMiOWPKVceM3jImv5JdSp5vQ0h8l7tyF9FTJcIq2t16U0p3gtRCdOycq4B?=
 =?us-ascii?Q?LHbs9xDIbq8WsnH1Z4uvlt6XFSxYA7NzjwkYdaHjongcjDBGeDXsF69+gmdJ?=
 =?us-ascii?Q?Dr6RzXRat5LdUbqqG5cqWB/XI7Ft5NrbAxIyBszRPbDAClEEg7uv0nxpGYdL?=
 =?us-ascii?Q?FxTyfosoaNtlgAvHXtGoLg6F+bsWT+yfQVwza7Z01L0eHDD3RZbzXKHcuX3x?=
 =?us-ascii?Q?jcDV0GAF++xy9F9CZZkFm8jwd5iNpwu+lGJHyyPxYzIrlqa3426OE6DKTja1?=
 =?us-ascii?Q?pxpRHaJk9jFEzZ4+iXvt5ynq5dWi7Ph2UjKaoqOiDrQNerI0BQ3cEavH4qZp?=
 =?us-ascii?Q?7ow32eZKbgECVymt/Cuo4ENjuziTi8iGrJpRHfx8vj/zvN/YmM5I1cO/zUbY?=
 =?us-ascii?Q?a/oNmiU3n6B6ZA+7G1fElgwr2LQuDEJHNbshHIWlQC7ywRyro2ph2Atj//4A?=
 =?us-ascii?Q?FJoJlA3RSV12JucBfL9fNM+M31q6JdtHJlmkFKRS5XuUKieMgkDJrX3DXdSA?=
 =?us-ascii?Q?ELuLTtsIsUGADIL5UqVYsn9ALU5wbH/5VN3XCsLNJmXbIAOG63ESKayr2jD3?=
 =?us-ascii?Q?nHfk5xGDjgBdtyNImzI0k+um6DB8O/QGwaHbWEZfaLdO3DF/zJY+dD9CF5eX?=
 =?us-ascii?Q?qwFTDdJvTSUUNIBj1aMer0cf56r5oftHN+hFGeDIsJHcxfuQamXHvEeTy0HV?=
 =?us-ascii?Q?RZS06ZPwifeyJ5ws8Dtf0Er7txduLi7a3GlkzhT2WU2TsGgvUXaZ8YHVGN+S?=
 =?us-ascii?Q?6tLAXZ2PmhC5DyHe/zNDwtG+xTK1inNKnRXQIp/SM0xUion1h+6E330QSJsh?=
 =?us-ascii?Q?dMjnffPNV72b6scLZAC0eKJTORtXcod2ry+HUaZCtdeRRH3LvFR8JIhrPxEK?=
 =?us-ascii?Q?lwKV2yANOGjGR6AYutq/CljA6B6RZ4UhNkP9KvjAAIx4M7OgEmdzaV/m5Nw7?=
 =?us-ascii?Q?Lgr7/OIN2gIiV40nGGgjLLA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b558446-f078-4ccd-8d2c-08dbc92f26fb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 01:20:55.8736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OmbUe6+uh8Xrv+bCk5rtk/UDXKXG0LIF/Ofd3sYmt608vWqCG7YUNrg5OCvrwoaJXO2d/z+BigE2t76e5YieiQcWL0AeadDrMUYujG0YwRDAPIXkSxC3gT+ylgivy091
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9647
Message-ID-Hash: IC5GT5IMXQKOCSNDEFVKKTQX74TQIAJ7
X-Message-ID-Hash: IC5GT5IMXQKOCSNDEFVKKTQX74TQIAJ7
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IC5GT5IMXQKOCSNDEFVKKTQX74TQIAJ7/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark
Cc Bard, Pierre-Louis

Current ASoC is supporting CPU/Codec = N:M (N < M) connection by using
ch_map idea. This patch expand that all connection uses this idea,
and no limit of N < M [1].

This patch is tested on Audio-Graph-Card2 with sample dtsi,
but needs Tested-by, at least from Intel.

Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com [1]

Kuninori Morimoto (4):
  ASoC: makes CPU/Codec channel connection map more generic
  ASoC: audio-graph-card2: add CPU:Codec = N:M support
  ASoC: audio-graph-card2-custom-sample: add CPU/Codec = N:M sample
  dt-bindings: audio-graph-port: ch_maps property

 .../bindings/sound/audio-graph-port.yaml      |   2 +
 include/sound/soc.h                           |  48 +++++-
 .../audio-graph-card2-custom-sample.dtsi      | 138 +++++++++++++++---
 sound/soc/generic/audio-graph-card2.c         |  29 ++++
 sound/soc/intel/boards/sof_sdw.c              |  14 +-
 sound/soc/soc-core.c                          |  83 +++++++++++
 sound/soc/soc-dapm.c                          |  47 +++---
 sound/soc/soc-pcm.c                           |  73 ++++-----
 8 files changed, 343 insertions(+), 91 deletions(-)

-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1CE7378FE
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 04:19:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C3371F9;
	Wed, 21 Jun 2023 04:18:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C3371F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687313951;
	bh=VAXGdPFJ1nuKnszDLJuOu5Bdn5yug1N0Wq0NvnH3igU=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QXkCnPAvvq9S7UcB+PbGXYa1P4LIv+gt1WcDG9yrTeaxw88A09R8TEWi0BQD0jkLc
	 EsBdtmgex7qQm//OYrsvH6jiOQN5daHwC/ZRK+7d3vudzxSHeQbDMH7KTUMy7DnE9s
	 n2ZtDTvdbrE8PVEnurjSYS8TvSy/toglRQ3JqHgI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7A0DF80552; Wed, 21 Jun 2023 04:18:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEC10F80141;
	Wed, 21 Jun 2023 04:18:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F929F80141; Wed, 21 Jun 2023 04:18:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CB00F80093
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 04:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CB00F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=o8Pv38vI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhSfGouJdyMT4tWxg1cwbI/Qtl+FkCXN30n3yC9j3XgRauF0pr67GxBHltyGH1FHR7uSejJ+s/D8vp6R+MklHcTeaB6+AiYzjpzeiROMkyb42HoEmpQm+fLxA4HSjsvkLi2JQqZmyf0kXiWcvvgNsVOpApExXrdztsbBtjFxbc8KiqSSEr7ddo/Ct96DZp4y3yWcKU6yMDpXYIbQ4f6A08uKp0m6GeZKC1RC1aUgwnx7U9b+cVm1pWNFKoQ8HT5hdAavchscAfBqA9qMjRFa/bZtXlncoMmB7r/tw8B9RiCQLqUVwQxLW9RlGWmSdywXnrAsPQ6rd1DLjkwkCjPpbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xxyWYygzkP3qpWNgaoWbpAQnl3kzwntAE1nbxrBjr74=;
 b=TNU+kn1WfMGKST7yuWrYLJMJv4j8/AWNCtdG8jOaW3Jh/Z5I2T/7/q1Rz+CztPOa3DdwqS3KCzpzwUwn5wVyXIrwc/2OFqCTsPCKNQTxbMfsHefGepwNTfMmYSr5W7YVo4LLWkfVHYcJdPdh2fhapj4Vqfa1py39ZheVC3x/fEufZCa2sHA9jA32q6rLo/WdJqgv6Z4nmaTcFYTG4aoCuXgU35ynMi9ezRvF7RX7VWNgKZ69B8QJKaLN21C54Yvklv3CpKFaWK3TgPUyfLTpT/ngJ8AOFLZjKbvRlEMaX7y/QWWJJSiaE2YpirzmbJiQI8zj86kSOsSTlF/9c10Byw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xxyWYygzkP3qpWNgaoWbpAQnl3kzwntAE1nbxrBjr74=;
 b=o8Pv38vIyYkWGKkeWQg4seNdUqbhONPs219ePOItpWzxv3ZlNNncvbY7RBPHN3FpNBKkdAykh9C9csIauHbDTWdG46Gp3zJ7RjOmgb5Cj8xCaILwcboPw/Ik0bZkj9N7ZaT0DNBztZ8VyKIATyyZzLueE5gBCu+sG5Pbz/wOHgk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10367.jpnprd01.prod.outlook.com (2603:1096:400:243::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 02:17:54 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 02:17:53 +0000
Message-ID: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 00/14] ASoC: add multi Component support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Jun 2023 02:17:53 +0000
X-ClientProxiedBy: TYAPR03CA0017.apcprd03.prod.outlook.com
 (2603:1096:404:14::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10367:EE_
X-MS-Office365-Filtering-Correlation-Id: 60164a00-922b-4e1c-d511-08db71fdb84d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ICS05T1HTZLsaV+MzGDFc+2qSrGksRLPdgVNvKbzXXhB1qTLCJAzYTEP83/dWGFRSykFl078hbuQOO47MsZBUhq28tNy9LDSddS1tnFj8LQW+5rCYBxlLTKtRxhNU4RdUdLwMGuuXaPqlvBHfn8u1luGyKa0eJT9bB3M+ViNm8hJPOxW5g64QuNAHguCyQegK6DA+R9huOKpdYd1qPWAJGl+7VTEaijcb+4NCzLZKJoVIDmNRWMkXBEmwuNpDA2Vc+9ekC8GA+fjvZ9lrX8qdGyDyvcN0Uq8XKZhmX9wFRlhPmwCbQNKrpfBHGM5Tbi1hnjIM8wUSiejH6y1g6LLzVyjTGg4VZujQ++hYz0rvD5/hNZnJgGh5hvV1kzc7ylvGXFRm/ViFaCbIhFdpywdRHERKwN/nIR9gc3Krk/gDNI3LpPB2laFoO4wDbZlNDFaNtANqyrBV6nA1FFa+qmfOdQvaA0yo07cLq5qfZbIL9By1JGK9GbuHqttXO36VwE+x04Uc1lpv0dHKHyfRzZjPoK9I4nas6Lax0zDx8DIoDdJ+zZqrJvW1Xay4KR7ItXccE6LLJzwQTzIkQFks6MquMHJ5LlIhFXmN7sFVidOYwk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199021)(66946007)(66476007)(66556008)(4326008)(6916009)(186003)(2616005)(38100700002)(38350700002)(86362001)(6506007)(26005)(6512007)(83380400001)(966005)(36756003)(478600001)(6486002)(52116002)(8936002)(8676002)(5660300002)(2906002)(316002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FwdYHvlsKbVdYNzf23FdgCQFID4KJC67bDJeQCPoHr/6tduPUSRLR+4Q83R5?=
 =?us-ascii?Q?MPmmr2rAHfL7b25W2DJiro8rWm1yB2iMKM5z7/cty5tEg/V+IIi/HI5J1uaE?=
 =?us-ascii?Q?1Y/daPN9aAvsUCLxgzhFRDuB8hKVdRxMWQjjr1i5yKeq/fMTL2G2VpKmxFDb?=
 =?us-ascii?Q?+VZh5y7gXIDy7RElEpJgXfXfQ1yojHPWw1dsv4vKekwDDBqUatP61yLDg1AY?=
 =?us-ascii?Q?x1bjrYeY9dsuQKQN9b9qT6j5hqOp0GTp1j+3Q+yfArUSHr/XnjAUKrNbqIyQ?=
 =?us-ascii?Q?mRpGhLuQZlhFO7DS25g7NR5dCiafZv1xH/73PqaZKXXKfpvIBjd5bOz/koAy?=
 =?us-ascii?Q?qVnsI2W7PXt8EBrA2BvSz9GN/rqH16jjEjaX2v3FRlhjMeitp+9EOgyXTDVF?=
 =?us-ascii?Q?yRPlhjtxvcosQdA5HSnRnceXixuQASoHuMyLeLvNA0c/K+wo3MeVIzgfrVDt?=
 =?us-ascii?Q?7LwUqtVmItsqVUGGtRenlZ0SDFqSwmwIbzmDQ1Fl5Ch/avOFEwYhG2gxywgC?=
 =?us-ascii?Q?aj0PbbeRiT5PiDhgxCuea7JCQRvNDYGmsLfVoNd3v/I9RV7J2fKDJYT7FzJK?=
 =?us-ascii?Q?irjawtUWAQ4NvEpqgUiZ7b8KY+us6DmJwhEj4wySfFgCWn5RFTlfd02axtUV?=
 =?us-ascii?Q?fJwMxTRRUoycj9s+sXpCn6ObjKAr+Qd9IIlCnrss3lvnHR1r7pbKW1YFrghA?=
 =?us-ascii?Q?hqQw26GTMO4UcZOx7AF2MzhXIqH/InPrR3olKT2UZkfdHS1tg6KV2PDkRDaz?=
 =?us-ascii?Q?1DY9vr+GDts/wsgeHQarK7Kw+WjiALvXWcJ5YX4TzRx1CR3C1PLNYkgUUcup?=
 =?us-ascii?Q?+KA0574u3YghY28RCTMAqGape4gVSb9F9dux57YFcdoTweEFZa3OA2OWH5JR?=
 =?us-ascii?Q?4YDIJkFHd8p6RfGWbKRKeS7HVTqEO7lTeQxMbChdc4slQkMYfQ24LfSPpwEA?=
 =?us-ascii?Q?wXZkgbSzkCS5kwO71PsHz1Bit6Zk+KNCxuDV60GRXfBOcnj4FZYrWl8EBWQK?=
 =?us-ascii?Q?ynWi73bF4wqKAtGfLBxcTyg156T0/qsfZTGasqLAN03cQf85rY34pgPjgiUl?=
 =?us-ascii?Q?4HfUqypoOv8xrUgvE0YX5NYLlG3NbIY5D+N1xBNa6kzKmUhQlq+mGXTUiB2w?=
 =?us-ascii?Q?LOt5moYsgxuJvQa0pKAE4QUI7Amjm4545gjkwo7qqRe6IJXMdF/C4axf7jg5?=
 =?us-ascii?Q?rJQIfKiGITKoJPEnO4gCRpIO/SdYe68ZZFhuXpUY9TnhybI2Fq7ycSsbp6va?=
 =?us-ascii?Q?R8DmkLFz92ISGjozLwr3r1d/w2K3G9/J+8/0u60shOrepMpIldI/nMqjXYGN?=
 =?us-ascii?Q?5jKx8a9pzNt4x5xNN5pkOKxEm16qC6cALsRd8wIsXJ1IuquO4n4UcLT9OY1Y?=
 =?us-ascii?Q?r1JOuYfsJBm5+1Gjky3BrQcynzDX0JsB+jJPdjL5LPOrIJmITO6QCG89YWet?=
 =?us-ascii?Q?WGIqMFhT8fVIrKUlyr3EtAhLapoGBoK2ONDvOoZlOjmcozIixfnWmMpTOjVi?=
 =?us-ascii?Q?wmxGhZrQ9HV1UQv+atg0w565ftmre2BzhNykR8XbWQoUNOZVYaBftjQjLX3a?=
 =?us-ascii?Q?wH6Me7Ahj01mU8OdI7Yf+w23/blFtIYQGlfyg95OcCZcFdydnDdO1gGAf+6v?=
 =?us-ascii?Q?nEIr+ZebvknHeAlKLJEjR+g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 60164a00-922b-4e1c-d511-08db71fdb84d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 02:17:53.7982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OG8kdFFeqrvszaNM0NzxpiG0k5UOZKeutGrGvv7OPbkJ3QNCvbZvCTQKtIN8mKApyY6VMELJjKjqOOPlznTY368B8u3wPSmxD/6Sn+wK/os4j9nXfUzNTmaC/mKx3Mlp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10367
Message-ID-Hash: DIWO5XATEX5TU6VIGFVIFO4U2Z5NNK5F
X-Message-ID-Hash: DIWO5XATEX5TU6VIGFVIFO4U2Z5NNK5F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DIWO5XATEX5TU6VIGFVIFO4U2Z5NNK5F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

On below HW case, we would like to use it as "2 Cards",
but unfortunately it is impossible in intuitive way
or possible but not intuitive way.
In reality, it is handled as "1 big Card" today.

	+-- basic board --------+
	|+--------+             |
	|| CPU ch0| <--> CodecA |
	||     ch1| <-+         |
	|+--------+   |         |
	+-------------|---------+
	+-- expansion board ----+
	|             |         |
	|             +-> CodecB|
	+-----------------------+

To handling it as intuitive "2 Cards", this patch-set
adds multi Component support.

Link: https://lore.kernel.org/all/87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com/

Kuninori Morimoto (14):
  ASoC: soc-core.c: initialize dlc on snd_soc_get_dai_id()
  ASoC: soc-core.c: cleanup soc_dai_link_sanity_check()
  ASoC: soc-dai.c: add DAI get/match functions
  ASoC: soc-core.c: enable multi Component
  ASoC: soc-core.c: add snd_soc_get_dai_via_args()
  ASoC: soc-core.c: add snd_soc_dlc_use_cpu_as_platform()
  ASoC: soc-core.c: add snd_soc_copy_dai_args()
  ASoC: simple-card-utils.c: enable multi Component support
  ASoC: simple-card.c: enable multi Component support
  ASoC: rsnd: use DAI driver ID instead of DAI ID
  ASoC: rsnd: cleanup rsnd_dai_of_node()
  ASoC: rsnd: enable multi Component support for Audio Graph Card/Card2
  ASoC: dt-bindings: renesas,rsnd.yaml: add common port-def
  ASoC: dt-bindings: renesas,rsnd.yaml: enable multi ports for multi Component support

 .../bindings/sound/renesas,rsnd.yaml          |  60 ++--
 include/sound/simple_card_utils.h             |   5 +-
 include/sound/soc-dai.h                       |   3 +
 include/sound/soc.h                           |   6 +
 sound/soc/generic/audio-graph-card.c          |   2 +-
 sound/soc/generic/audio-graph-card2.c         |   2 +-
 sound/soc/generic/simple-card-utils.c         |  23 +-
 sound/soc/generic/simple-card.c               |  20 +-
 sound/soc/sh/rcar/core.c                      | 146 +++++++---
 sound/soc/sh/rcar/rsnd.h                      |   4 +
 sound/soc/soc-core.c                          | 267 +++++++++++++-----
 11 files changed, 374 insertions(+), 164 deletions(-)

-- 
2.25.1


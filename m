Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 679B773616A
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 04:15:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 372A3836;
	Tue, 20 Jun 2023 04:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 372A3836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687227319;
	bh=N1dI0octPivYnzuuDQ/vq21XoQP2OHcH4u9DLnRkzp8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sAyI2p5VUxvxi1RcJ+v+Y+MNqrQysLMZo/YZ1fFN+lM1+P0BgFFFm5Mh6DFegyowW
	 d+A47Nu52AGJedFVq1A1N94zWo0yNsfVypI8crgJB9IkfxYqD1KouIwfZyrY39cUNs
	 Ej6Jx0iy5kkhklKQckSaI7+KviRl5tlbhSfT2JBA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F4EFF801D5; Tue, 20 Jun 2023 04:14:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF658F80163;
	Tue, 20 Jun 2023 04:14:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FCDFF80169; Tue, 20 Jun 2023 04:14:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::708])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34A3EF80124
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 04:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34A3EF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Nv34mbO3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiaEOdoMWhGkRvAsFJYmO6XyMdZAFCv7bxsrTaSwPodj68IAfiLBL4veyrYgPxYw6LwtjdPw9IpseexAAnxav7RVn0USstY68UZdG+i0fu5j21n5ohReJa/s2buiXbIQ0Ph8bLtKZ4f2lTDQpf19EbRJmtcN+Q0LxbuaymV4Hbm/O80NPaOmus732EM8PSL0sHx+QeOKAQJNq17QkL32uTIW1deAitVc1OicahM6Z2E2DVY+arBRcyrvniJ/M5lGvVpL7duqePBFpxJYnPDqqjm6W3lSjr3N4s7mHMTUFLsLvyPq2W8lXEZ7CQ2UW++1KLBcg1NZr70o06HzCbaRGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f70QmpXJ335ar/D9tC2BuJK33ZMJM0ZsEO3bWPr4rAs=;
 b=aTJRxWbojBCPIAPtSx5o80qEwEZNYPeQUmuYABl43K8CAhv2Af+0cXjEgse69VY64tYtwHohIPLap2X12F6Po4JhIxgTjuiKxL2vv8vpRP/2nLn1ccZDTZ9HLXFXOOQNc9sMhjF2MTck1BRCmK65LX70VQwivwCFYD6ssZTOXu6GrUfap9b9ZpdUyBFdoeJoBXbN/FsB0lHGqZVOWBb2JzR+S7qARXPr/jsEPhvMSik50/OxFaN5kHMJpQSNAhDOudWtgtQSP/99kSZ/kKb4Sv2NWxdVcpsRfhX65MVauaYPIBzoq5/sNogOQc9m8YOmf1T+AWgZ5D9Dv2dCEDRYlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f70QmpXJ335ar/D9tC2BuJK33ZMJM0ZsEO3bWPr4rAs=;
 b=Nv34mbO3PaWnHv7zI3d8pTWJzwxuNxQbnIKs+aFrJ8MqBmEKTMMwtXVdIOrNAG2hU9S2HjSZvizZ5ID38tuaTkeEHLZEIEcl2t2JI74OEP/rmoHBWxbkWhDtTi9rlPaI1aswxIIKeXIScIl6cX8Z0Q/mCjUK8+ZI/OfmfBz3ESM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5665.jpnprd01.prod.outlook.com (2603:1096:604:b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 02:13:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 02:13:52 +0000
Message-ID: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Banajit Goswami <bgoswami@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Yingkun Meng <mengyingkun@loongson.cn>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabio Estevam <festevam@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH v3 0/9] add snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 02:13:51 +0000
X-ClientProxiedBy: TYAPR01CA0213.jpnprd01.prod.outlook.com
 (2603:1096:404:29::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: f676ee45-514f-4af2-7d8a-08db7133fdca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1LnuxkMj1NIK7+i9dDgqykpoiTfKUIfEWGO033wpnenooqUxRpVPlj0XgNirkf8EJ/tPcItmnJRDKr6ZrMz4sn2Z7CnDNgtVJ3DSzT7o3/l8DbgXRAwTSHzVYUf7/YkkvNyo9NlZCehm1Xe2xYJ8RJBt9ctwgOffTf9JkKhHsVZY4ajw3MPHLnfpbUlT+F82AJwyymxbaY6qAUSurzGM6+UaKwjNsRDn3cA93hhfaLqyR5cj4tpAWAVmkb7IvwIKrdkmpEylFbDcyFYGyTqvPlz6rvBJ+PLxydbmsaabt3hwx8AhISel2hRYr/rMNyd/EOQZxqyG6h2MrlPuHD3FdxkWrvs6ouj9iwXDJgiCEh2U3xuG3dI8wWwb/BnCCi1m2YDrWZWLyxpAD39jcISUJ8KSd3i2MIZLGDCUHwqav0Wdcdqnh5rcoGC9w9zEOq2Pnt/Apmp6fZwkLeVWysyxS6f0Rq3QNWxj+pnQ6ValSyoOLSC7SxKkmAFf9K4IqNpyy4ekG8RUEq8Ruya4GHWieFWMBwRPgK9FtjPX/5pYRFfJN6zEEC6v+ItohZBctahPqsX6XBf2HKIvSVzhZRkg5NZ/IM1ypd48S6V5BHLfqotuXm/yjQJSqcH4LmzNd/ZCOetIxgZSiLy35QqwZnS37w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199021)(2906002)(7416002)(5660300002)(8936002)(8676002)(36756003)(41300700001)(86362001)(478600001)(26005)(6506007)(6512007)(186003)(110136005)(54906003)(52116002)(6486002)(966005)(66946007)(66556008)(66476007)(921005)(4326008)(316002)(38100700002)(38350700002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+u4YA/bbnqKkBkD0i5t4vJBaQREbZtOuOdsgLfhjQx8y+RdE5oT2RC89HCfZ?=
 =?us-ascii?Q?wc82C+MieGhm1dP+Gof8bLTmTTRubigGJQ0UnlxIoUkhTAE/CiRzGEJJ+ihy?=
 =?us-ascii?Q?TsF11+TI+ZZRtvChVBzPx60/ufqOcbaC7uuWGWOwR2bZc25eJVik76CTK5D7?=
 =?us-ascii?Q?UqHv8faLuJkQB7x2UpRYs3G371JceUhpP4ucHc+1aPYaluSWMtVmEzjHCiR8?=
 =?us-ascii?Q?Weflaq6sh5Uq92HR4mvE2pMsgZqNuuSPoeCCyGriFQWqXpnoZJRZlhMnqEny?=
 =?us-ascii?Q?DA0Cqb6zxjqLM62J8XNyK6PAl4oSNlap7Uz9otGy0QE2DYAdSJ17K2e9AZ61?=
 =?us-ascii?Q?eyyUprU5iclh2NCS783ltYwNKhzCwIoeEC3p3yM4DthJ1MQzk2Yx7xqsWAk4?=
 =?us-ascii?Q?BP1Bb2ynifs1KXh3uA81gKHhbbxSJYLI7+IKr2y/n2H5qgZ4IO/DvpRF8CD3?=
 =?us-ascii?Q?0eqAatmTEQNTV17O3qKkakRuTqyo2zdJ4RMU78Y8UdBmIa/1HzyPz7hwqSe6?=
 =?us-ascii?Q?59Y8IFRfD6U2lzwj/JJ5A96ItOVazoYOryioFyQcD+fTXgQlmeVvP+6BXQ1N?=
 =?us-ascii?Q?/+SKIl5p8PfLyMb81wknGX2IwAnwMgdZjbNDjnsnKHer4ddA44Q+HqudY+SI?=
 =?us-ascii?Q?kMW2hubNxdo4IvoFbvzENknRkLq74bLaCaDyAleiB0mjG0Ze401vE0YLLgmL?=
 =?us-ascii?Q?CGMEQaMpecV+f3GvUkW8xbx+o/iElK2PSboSlkZL8BhyqCr3CzLcOLtA3Wv9?=
 =?us-ascii?Q?j56JrkeNeHk1DYvuCS9USP2ntTC0TvcQKB4zs1uW7FGT/H51zm3EL2tDdxUc?=
 =?us-ascii?Q?givshoTJXzgwG+a3je9/zwpJXTVIUZoggXTJ29PaE88if/MDckQzyjBLAuW1?=
 =?us-ascii?Q?N6jNCjHv2RxwS9RAEe5FDYgDyq8fGhMrWaa7qYJIEQaQhbKLZJwPimnP+/Pb?=
 =?us-ascii?Q?Y6055orkI1vaVJNLjppubumbUmgexV3+wlto6nD3jlCKjfeS/adBGGIz1O1T?=
 =?us-ascii?Q?1YeIbmE+4SZD9/wiT6YKackGT3u44xZrjCiZJ16TCbm7hjkmC2UQXTz9CcV3?=
 =?us-ascii?Q?pcALae5L7g4AOR0PbSwy1dw7NoR93LYw5U0eXLEBXaN15XrDRhm7Cr+rGDM8?=
 =?us-ascii?Q?mEkX8GNfoS9s2V0z+p9O7sOR4J7MOxi9jRW6gI/4+BzpVSZ0K/rrCMQQqt78?=
 =?us-ascii?Q?BIB7URzPiiSxiDMYRab8SO/874L24ZR9aFIbl3pSwGnyBSCBWD6GNN7mglRJ?=
 =?us-ascii?Q?oJbs6oMA3BPzJyq80yg+DuO1LMM0lWAUPWEMFT7rCOHn/atz/pEYuARL/Dsy?=
 =?us-ascii?Q?WENHjVvrwQdKoS5mwU1p3Gx2nmV4C1X69Skv3xqccmnnqTzGcYDG0bEMR0yi?=
 =?us-ascii?Q?9ljdNZixyKgGpIEFy27qHi25cEPE/YBCDniZab3Htbwi7w6FBnfRlg7h6h6m?=
 =?us-ascii?Q?xSqsg8DG7nMOw7/JIekdV0nWMEFhvbgTHxXtuZCImbNyxS+YG4qD7TbbTAu8?=
 =?us-ascii?Q?M4/jHS+OVnq6823VJ7JNGQ1eIypel3yZwSAIdWwVLLRmqT4UGwwcYVQuMaAn?=
 =?us-ascii?Q?b6fwINVQYlTc/+jmqBjZKChHKaMT6ogp9cwLNhZi+Y9GbARdQCNxOts7lde0?=
 =?us-ascii?Q?ac/PgCVsR0jBEVcN+JJYWEA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f676ee45-514f-4af2-7d8a-08db7133fdca
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 02:13:51.9647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 unqxjKsrtV36hTkEhRrBHMcS9jtr02CoUY5U/GIQgfG+cfS+RtZb/Rxr4zjUlhQMOd9qiQ5R7kSwwOlCvQiwdLEbtIhEvnjIrgEZd/VmXNSUTFZDhndqgV0ubyfTM8NV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5665
Message-ID-Hash: ALHKNAO4U3YHWJUP6VKNYO5KXSJNCWVZ
X-Message-ID-Hash: ALHKNAO4U3YHWJUP6VKNYO5KXSJNCWVZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ALHKNAO4U3YHWJUP6VKNYO5KXSJNCWVZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

Current soc-core.c has snd_soc_{of_}get_dai_name() to get DAI name
for dlc (snd_soc_dai_link_component). It gets .dai_name, but we need
.of_node too. Therefor user need to arrange.

It will be more useful if it gets both .dai_name and .of_node.
This patch adds snd_soc_{of_}get_dlc() for it, and convert to use it.

v2 -> v3
	- care loongson on [2/9]

v1 -> v2
	- add patch for loongson

Link: https://lore.kernel.org/r/87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87mt12hp75.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (9):
  ASoC: soc-core.c: add snd_soc_{of_}get_dlc()
  ASoC: soc-core.c: add index on snd_soc_of_get_dai_name()
  ASoC: fsl: use snd_soc_{of_}get_dlc()
  ASoC: qcom: use snd_soc_{of_}get_dlc()
  ASoC: meson: use snd_soc_{of_}get_dlc()
  ASoC: samsung: use snd_soc_{of_}get_dlc()
  ASoC: loongson: use snd_soc_{of_}get_dlc()
  ASoC: soc-core.c: use snd_soc_{of_}get_dlc()
  ASoC: simple-card.c: use snd_soc_{of_}get_dlc()

 include/sound/soc.h                       |  8 ++-
 sound/soc/fsl/imx-card.c                  | 14 +----
 sound/soc/fsl/imx-rpmsg.c                 |  3 +-
 sound/soc/generic/simple-card-utils.c     |  4 +-
 sound/soc/generic/simple-card.c           |  4 +-
 sound/soc/loongson/loongson_card.c        | 34 ++++------
 sound/soc/mediatek/mt8173/mt8173-rt5650.c |  2 +-
 sound/soc/meson/axg-card.c                |  3 +-
 sound/soc/meson/gx-card.c                 |  3 +-
 sound/soc/meson/meson-card-utils.c        | 16 ++---
 sound/soc/meson/meson-card.h              |  3 +-
 sound/soc/qcom/common.c                   | 13 +---
 sound/soc/samsung/odroid.c                | 16 +----
 sound/soc/soc-core.c                      | 77 ++++++++++++-----------
 14 files changed, 79 insertions(+), 121 deletions(-)

-- 
2.25.1


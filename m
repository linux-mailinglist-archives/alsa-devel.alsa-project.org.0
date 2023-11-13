Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 554AD7E9424
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 02:36:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 299AE829;
	Mon, 13 Nov 2023 02:36:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 299AE829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699839412;
	bh=dawlgpAZH/cfv2pTBTXWamsDoEbTVug8/jCKU+mHo+Y=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aSQ4lOe+Run1nRGCjYEzuBP9bUdpy0iEeIdLRJV+yuyw0q68HtnTEEOohKmR+aac+
	 ELtXsyUP4NAdkbbN4LOpEvR6RC3mOESxTLL506Vsl/AFLbR/N0ShA6qOJKC+faoJ1O
	 zepzgJP5yTKy+8DPpL7VJs/siA3DmEQSDHC2vcFo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A73DF8055B; Mon, 13 Nov 2023 02:35:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AC9AF8016E;
	Mon, 13 Nov 2023 02:35:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9B32F801D5; Mon, 13 Nov 2023 02:28:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1228F800ED
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 02:27:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1228F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GjqGEmHT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWnnP7kEgQfJ8kY+6lTOmQ69yQA5IzGUnMlO6zWbDwpXJWhyIJnYdy0WHEhe3+FOk/x8qopyVXojaTQ2Cr+KFamab/nhf0cNl0zpwREqitBXW0NOmYTyci7gbl4QYgemv6AVyKtf5NCnBBhfYyrQix5/2uYoaRpIjjXBLRpByb2B8nxMdV+3BS5WdzSgj3L/EGOwHe8gZAlTkA4F2MFsOpngtMWfllj6tb/uOU5cK4u8RZPyEFCdHy120dO7s/U/Q6hj+KfxaQSHpW5ThIHoV+adoFbBHX+W+r8US9thdgtRr81mVUpW+KunTLOKhuaqWy0lNsm09w1im1NJZgViAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8kT2dUstHslSwymI1/keZdNcjUkIOgD2vRNNwG8ZZw=;
 b=RF1zpspwW7xyq6lESGf4k7Dp1kiNrcL6BO126OinSESQNBM044M2mbHLyG90rBLlgZHF3qjVaYCw+zyApaK/KISsAddutVhNY9iT9YsSB1jVOUVUZJJwBtS/RBVzbZt3sn8bFZGPBfo7YAU72PbCcsiY1EbAPMWfa7qs/kh2DJpkJJJFFzQr4ki2DXOkT8kp/6GVSru+cfUl0/qiG3FVIO2htE1XxZxULWis1Xd5aRwyXcmQMnPkxqpJyICDjUJtDtUFWJQUQaU4HGkzo9TMQLZy+TdKl7qFJSwXfjS5XWiTiU/aOBXdiKpEnfxoRMODIOxNCcRDWDzz8WnG8npqCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8kT2dUstHslSwymI1/keZdNcjUkIOgD2vRNNwG8ZZw=;
 b=GjqGEmHTTxgDRbpURxYGnVmzP4+JOFXGmyJswdzOFiXCZm7DqQzY5sYMG2Sa1yOTAdFHFuMV9rh01tcM4keXn5iFsA9oRVtZ4IQgyNmxaODmR09RAkRNtIZK+LPIBuII0TXlE39NiocA3mN/HoDxjm0vGuINF+1y5OTdJ8jywWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com (2603:1096:603:1a::14)
 by TYCPR01MB10494.jpnprd01.prod.outlook.com (2603:1096:400:306::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 01:27:51 +0000
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d]) by OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 01:27:51 +0000
Message-ID: <87v8a64f3d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 0/5] ASoC: makes CPU/Codec channel connection map more
 generic
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Nov 2023 01:27:50 +0000
X-ClientProxiedBy: TYCPR01CA0194.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::18) To OSAPR01MB2178.jpnprd01.prod.outlook.com
 (2603:1096:603:1a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSAPR01MB2178:EE_|TYCPR01MB10494:EE_
X-MS-Office365-Filtering-Correlation-Id: 89df833a-e2f3-48a5-c1cd-08dbe3e7c093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rwk67zBscCZkLaJxawjtXSfsAb0xNhmRrTt6cHBlslruZgphQsSNuKPZ0ZByCxWf/Q4Rv/AdpkKEAkEJkm+XyYWZUdGlQyGSHQ8MorxWQWdOSCNDpE4axouMSQPn7I7DKErjHIe5cfqZmh4Yo1WHks4+vc0YSh8ie7LyLFYwFkn4Ra793hMa3e3o6qoxRJxp8FmpGMRU33BS+9vGCl/d97bRpoyRJDe/sngHIG1wokmkjfAaSGvLjRA06omE2ap+IR3Nrbh2m3Lu+lSFF2Y/XdBH/+XDz5VyUSof1e8ye428tT0R+O0TSGOIrAiDWWaBrvEvRvU+a1pxAl50ri2I9N48F6nbqpuKyVBW2rseN+ayxsmga0TNM+CJ7dvDU7iNgsvAiB8a5JrOG0SxiTEXHDA5Q6P8KmDderSCx9hrFa4GVgpAbXOSfeHoaLW6JVVfQ/cTInzsFSwuMy8N7qYXF5rioHAK3fEKQt+YYIFdtWRVIt3aqxr6mvAnYgbnMSbV6QenZXRYVg06+yDiiwmkIlv09ycWlx4okvSEFAK1wyASgPIkuMO19rE87P0tcSkVujzEXpg62OtQrMeK3G2fdVSyhr0kk69YBo5Q5kymDbNht6P9K1+2xt0a0sftk590ly49Uy9UtSHi4z3jSKT4b2I9evHMijtFDaCRw1slPheQ3Wm/O4k138mJB5TEjwFBHJ0Dazp5Ie0TeIN5bciTKA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230173577357003)(230273577357003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(6506007)(52116002)(478600001)(86362001)(26005)(2616005)(6512007)(316002)(66556008)(66476007)(66946007)(6486002)(966005)(19627235002)(38100700002)(83380400001)(5660300002)(7416002)(38350700005)(8936002)(36756003)(8676002)(4326008)(110136005)(41300700001)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mOgEphy9GZTY1JBVsgxTIjnQ2FI1wpUOKZ0GSHR+IXRSrlQS4lzXKeW/JXVC?=
 =?us-ascii?Q?PlogWBi4oTPv5CQvcfeBkc3QDEB5JDwH2OavgciiA6FGy1c3vkVII6f4LgHg?=
 =?us-ascii?Q?t+QT+zshDPQK9uPcS7kDp0zmnK61mWpwurN0COwjhb1GyTsCq9+MFa9ITy1q?=
 =?us-ascii?Q?P5sHt16/F1bmxZc4MnDtZHjAlilFtd8eL5wn7Wit2U14LiLX53YqhRF2Rt+m?=
 =?us-ascii?Q?jq4CRyRovcqAZazLbcs4xwlfQXDE+wyTnMthkWpmW2OwT3a36JS1l7KrivBj?=
 =?us-ascii?Q?l82ef7hnjbM7aMgDdLS8QfdVyq6sQahIFJDX2e5Xo9NHg1wBEnF96JBgL4Uw?=
 =?us-ascii?Q?lTZVlv56U/SuNU4xxnMK9gR8HInCj/TtJjo/NwYUsz4Z6fkhXM8KU5ZpMw/j?=
 =?us-ascii?Q?1Z8G+/g7LtoPSRQWa/8vxMYgYma3suaX1NVT2P0ZVHErLsGkkjShHnQie3p0?=
 =?us-ascii?Q?TjvhV3Cb3MURYzT6y9b/wHrIUKpYKljEx9/Ps8pxNPycH/ZaTgo21aMBc98W?=
 =?us-ascii?Q?+TEucN4j1roDby/O/7qz8BpSuMu0WLBqyddZvx1PyFF+2vFCTB4TDe+jAY8v?=
 =?us-ascii?Q?3kuMmNlbnnJAuspMRlKjsaO+D0uFRXH0XZ9Bq0cPGcYuPFZS8w5rmX1MaZJZ?=
 =?us-ascii?Q?aZm77us4TAdG9YskdU63T7APNgVVGCbdEyTNbodFou/ifkBqiCpOJzHIpHRo?=
 =?us-ascii?Q?Ai15Z74G+bubWd36s3V+lpsk8tkXSqB63Iovsvyb0bISgFMc7wrqzYniB0yC?=
 =?us-ascii?Q?hzHcWxWJ9LZJTfp4bASIDsMA8cT10rL7hgV6mMxwybHbQwHfCHjSsa6S/HWp?=
 =?us-ascii?Q?2Bi2zu9Ou/lpjrJoSCR0sCurfZyOYx1VAGl1hPpNSRpZSwqWu/NuLkddccp7?=
 =?us-ascii?Q?wtdph+aocTOF20jBh0cK2ElZ6Sc6Fle2axEM1K9oSUd5phyrzs+D8gWheXha?=
 =?us-ascii?Q?ktQbthK7hAD7sxIsuydke+WxF9zSsXhzKNoGnbTIYNioFldcNt3PS/lugxoY?=
 =?us-ascii?Q?p2naIkClfGbK9mVkpaSURrbTxnli0px1Q3gNnnUQvTMu3dwKZf9oD4dAsAp9?=
 =?us-ascii?Q?QzQshCmo3s442Mpk67Q4eZVbVQrkQP5zHlOojjUENpxWEZI0zYNr0Jgw3Lv2?=
 =?us-ascii?Q?TaerJ7qWJ6cNmrZqRoTfcYv93poyXx5LQ6XXmrd7VSYtuwNbyGS/N1MN+yFU?=
 =?us-ascii?Q?hgS1c2Z8ZHvFF0A/BnL1KorKZU1ng/jeywJCp+RFy34eQWKpmmOVc21JDvLW?=
 =?us-ascii?Q?YofGv793xlYQZff34qFtokwtJc9iIUFGw6rgmR+3pnaTNt6OhX+DlGcHc8nd?=
 =?us-ascii?Q?elQUndcDF1P6jyoAxkkwHX3tsj/RuEXvlyvQ6yN29EZyg997vgLDDyhfslnn?=
 =?us-ascii?Q?aenn0hxyBVic/yZVkcskKKg8bQQnJRn4Ex7MhDSIhyI8DLbk9N5zhSxtozfs?=
 =?us-ascii?Q?7UW8gONuAXdz/TWuz14DTRO/ZgkxCMHt8uznuwAFyB95F3jp+gzO80vi8mFA?=
 =?us-ascii?Q?aj5MpgtjU4+KZR61BtQQHGpBYxAZjQe3/jVFpa3OEMGqoA3zxoQSZHhj1ERl?=
 =?us-ascii?Q?kS7Hmcjo4Diyy7uUr61vTlZBsf0pCM0nR0rk//I3Kfk8GKWyaGuzShIUXYym?=
 =?us-ascii?Q?t8WGZpvuQRBBDlU7/QvEo/M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 89df833a-e2f3-48a5-c1cd-08dbe3e7c093
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 01:27:51.2042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CSXHhCoAB2Ls5WkXJ4Y2uK+6lMfYl9PB46Hvr+wgj7NvSlaWWQzobZnHrmHMr7JHM6qLtzBnXGKx8QVceHOCP9xttsqGbZYVb8jOlSNgEVKGGMewTcXstXgEXmVbWe1P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10494
Message-ID-Hash: 2MFPXAFNDEIZQ6PYVTE7LB5LRJEBFSWD
X-Message-ID-Hash: 2MFPXAFNDEIZQ6PYVTE7LB5LRJEBFSWD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2MFPXAFNDEIZQ6PYVTE7LB5LRJEBFSWD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark
Cc Bard, Pierre-Louis, Jerome, DT-ML

This is v7 patch-set.

Current ASoC is supporting CPU/Codec = N:M (N < M) connection by using
ch_map idea. This patch-set expands it that all connection uses this idea,
and no longer N < M limit [1][2].

Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com [1]
Link: https://lore.kernel.org/r/878r7yqeo4.wl-kuninori.morimoto.gx@renesas.com [2]

ASoC core code ([PATCH 1/5]) is same as v6 and it was tested by Pierre-Louis,
and Jerome. Big change on v7 is basically for Audio-Graph-Card2.

v6 -> v7
	- use "endpoint" for N:M connection instead of ch-map-idx on Audio-Graph-Card2

v5 -> v6
	- tidyup some warnings
	- rename "ch-map-idx" -> "channel-map-index"
	- Update "channel-map-index" description
	- add Tested-by from Pierre-Louis / Jerome

v4 -> v5
	- use cpu/codec index on ch_maps
	- separate card2 sample DT patch into prepare and new feature
	- ch-maps -> ch-map-idx on DT

v3 -> v4
	- add Jerome on To
	- add "description" on "ch-maps"

v2 -> v3
	- tidyup comment
	- use more clear connection image on DT
	- "ch_maps" -> "ch-maps" on DT
	- Add DT maintainer on "To:" for all patches

v1 -> v2
	- makes CPU/Codec connection relation clear on comment/sample
	- fixup type "connction" -> "connection"
	- makes error message clear


Kuninori Morimoto (5):
  ASoC: makes CPU/Codec channel connection map more generic
  ASoC: audio-graph-card2: use better image for Multi connection
  ASoC: audio-graph-card2: add CPU:Codec = N:M support
  ASoC: audio-graph-card2-custom-sample: Add connection image
  ASoC: audio-graph-card2-custom-sample: add CPU/Codec = N:M sample

 include/sound/soc.h                           |  56 ++-
 .../audio-graph-card2-custom-sample.dtsi      | 380 ++++++++++++++++--
 sound/soc/generic/audio-graph-card2.c         | 277 ++++++++++---
 sound/soc/intel/boards/sof_sdw.c              |  28 +-
 sound/soc/soc-core.c                          |  95 ++++-
 sound/soc/soc-dapm.c                          |  45 +--
 sound/soc/soc-pcm.c                           |  44 +-
 7 files changed, 754 insertions(+), 171 deletions(-)

-- 
2.25.1


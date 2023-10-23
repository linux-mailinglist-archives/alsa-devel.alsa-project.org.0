Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBCC7D29C0
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 07:48:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E600D844;
	Mon, 23 Oct 2023 07:47:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E600D844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698040084;
	bh=Pxd6mfDBaz0FCwuOYczSSAWp8J5A6riqzaiRPD4iVEA=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ID1Z7ZLeNB9OPmj+VGhEBiFtqwUip5sHyeaMkPsEJV37+cJNnHlFbDy08hCQ0T5Rr
	 J4HLoUXrl4LKWRE90E05+QmlZ/GO/bR2KUsLIb5rVMJwtowEyarx1DXwAm+JhadePA
	 lggoqEUehwcFNhhHHWZ4sBJrgR7+0xzbb8EofQn0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 171E5F80027; Mon, 23 Oct 2023 07:47:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D585F80027;
	Mon, 23 Oct 2023 07:47:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8104DF80553; Mon, 23 Oct 2023 07:37:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C26EF80134
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 07:35:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C26EF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Bpt9mCD/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jzgf9CNjd71W3WAbEvb3gfjMovEocM6Si2hkglXy4cF5mAV+At22qrfnM8QBOHbgTzAeUUl44pD5I9szNsp3YidPskjuas9YwPOOP9HWHLKmVzHXxaUxzTjchA3nKxe8tUwCOroJQArZmcXQeB9mB7eL1wOLcxL2ErLHevah9elEK0LYXPv+9wnZZQaTs1WX4oHJ1GV/LnHWKQ9FI0w0xpyCz0spY/ubuwFqYw6CGeXuuAL0lBarSHxdy8SWXf7bdjRLCWF8/l9pc611HmNoryVrSu5/9HX+gl9hN5vCN7TacVd5iATlvCeYhgMQcf+LK4cPsZyXXcdCdf9kXa776w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ejUytKzV432hiJyOh63WqBkUHfyccPfJEShkFeg+Ig=;
 b=hyKqhQWnff+iTaqp81C0kSslMfdqkxUTHCZtwxlK57eyDnoBndXkm5rlzKpWVC0WJUJjQyYoSH7Eg/exHfmajHvCbUatD3DO4dFT1eJH+zSadBsVIsQDHBHqQoUlpJx6S7BObOUUWSlD20vI+yhQo6F2ELNKI0J0XnGO2prmZW9byf7um2MnsaJ36DG71mfoYJlLP6E8bjHwYlHOHl5O5OLlHjkOyTukqxAFNtZPvJ5dhOsX9sdnGowxObGBwJE5KoAdWQoHyazTBQQdZKn7wX5SpYoZN1rVbAnOL+3treNAMhwZ78Gy5spRSm6MOEM21k2f9FGEF8xP8PZnYhxGYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ejUytKzV432hiJyOh63WqBkUHfyccPfJEShkFeg+Ig=;
 b=Bpt9mCD/ESyr8K1BBpi9Hox8DLyJHJP4QwNB2CdO7G3gh1EUGhyjm0wZLS0VCI/Uid2ze49yrjyWrqP3gOchJsToK+DJkx1mgWUqf4VViEII5JH0Ll6MHN59LcnDatSqM51pUCgexlasRrg+mO+Q+nka7XiHeOvoEd/AcDhggN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8242.jpnprd01.prod.outlook.com (2603:1096:604:174::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Mon, 23 Oct
 2023 05:35:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::be8:b648:c989:8e7f]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::be8:b648:c989:8e7f%4]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 05:35:23 +0000
Message-ID: <874jihlx44.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 0/5] ASoC: makes CPU/Codec channel connection map more
 generic
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Oct 2023 05:35:23 +0000
X-ClientProxiedBy: TYCP301CA0017.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b77a011-e5ed-4ccb-ae0a-08dbd389dabd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mY7bwhaPo7KEa0i0PMqv+C7luAJ2YvtPunjevMk7rKTyAo+7L+bBBCVZXL2h5qOlCbWSa7NRrin7hJ3hpMUYwauaIpkkPoWfJ78DaGbps+vrWhMkLtsPaYLCFx9kzB6VibUCtJu3EsYhGyEPsTUPilsK4wRBlUovuq4UAHHxFaGCxH4Eydn3qUFlXiihX6B7OBtXX6MWcqh/4UShnnsONHaliCVHYe7hiez8CK2rYr8p4baObY9E9wihG81gfwA48m4xSig39coZrBUPauzsD0DncvDWiMdA717HNfhIfYFnVp3k4zdx8YMI6w5O2VumEM8DA3N9id8CFrdYF0w8E6Vj17LF/amhKLFPV2ZvNAOxrNx2dTojkeSqV3Y4M4abcv9qdaL5WuEiYTuLxzOUJWo9yWzX5qbdyHb/QerQMSl9VnRxxQHJ/j0+vfb6ObZdf/eWjBBXyYWoFO8wjPWdoAebThVuGlEZmqk31GptUAcjou/4KD9W7tVqfevla1k7TlrtBbxWRQqC14G7XmPtso0MfuNRJk0slxxHfW7X5FbxV4hSAdNqCfQl09EyVQkgr85Rg4kObxMD8iRD0Y+7Welf0k76Piq+N5KcfS+bus3xc9vCt+KUWGmzgG2S8nVHeZdj9zyRFcHt8mup/aFUOnQfoUMF4FLGseEI2sHNPUM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(346002)(39860400002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(38350700005)(36756003)(38100700002)(66476007)(66946007)(66556008)(110136005)(6512007)(86362001)(2616005)(26005)(52116002)(83380400001)(6506007)(2906002)(6486002)(7416002)(316002)(478600001)(8676002)(41300700001)(8936002)(966005)(4326008)(5660300002)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XiRW4tk3J81im9QbnWRX7wHIZqH7O5J3MGPjmFqHEvbzyK0OKUrBBizuJFVM?=
 =?us-ascii?Q?7IlsVQIRZOsftOKFyus5QZQUtOr19goQluC3fEQnzfvdkmFRAWE2VU8CBvl7?=
 =?us-ascii?Q?rXuA5Lf0pwCRPhTLXNyYtHxLNEwXalkP/pPhFBQxk4p/lUvmnpF4d3KyFlnk?=
 =?us-ascii?Q?4bNy92lU9horuGFwGx7CV+LcLIOhtUG/o0bPqTXt/4tCiIrG3PTU6GvBgSu/?=
 =?us-ascii?Q?IZQ9FMLxR5Tr49GMphooMaMTu0d6fGINm+Nv1ztM2Tr6XsfFdzXUcYUMDvAZ?=
 =?us-ascii?Q?J0Q6+Dd5AJfiRHqefa4ehkQ7RAKBIZ7KDf0xGRAR6WG3MTNVx9m0sosL7Lpd?=
 =?us-ascii?Q?RoPLorQQUiQcszg92w5UAXT1yl2zA6jkkK1LSsiD+oC/sN7rGzbcN3aJSf9l?=
 =?us-ascii?Q?2ZkrBfrLzKV6j4QPB4RQZdtrEmcYWUSipS8huzqfJBielBiHC5OaOdF4vlWV?=
 =?us-ascii?Q?T+ZJplIs0frQuCJXuDcx7cRxa4Qa1SSp81062SLUxA53+QW8ZpgZX4ORnb8T?=
 =?us-ascii?Q?Bw/GfF0Daxoed/uOfxlKGsrFOzi+qTly//Kbbz28k0NWQwWUzvsYVFFtrXyV?=
 =?us-ascii?Q?H04etaPIAfCn8qhc5CQrdAf7Xg8GZClUTBVuCwHMjVPUWN+gkCYKCzHKFTYf?=
 =?us-ascii?Q?utihZQyyeGQcuseHUu1S8cuErdq1ODjb7Zp57swDBPNeXSmeryAEdXEhQc17?=
 =?us-ascii?Q?nO7QaYb6IRA+m66V60t0LOi7t3FjwWhsiGtFpOg8V46hc0UdkrKZH2+wXArk?=
 =?us-ascii?Q?ZaU3g2lqdOjMmT1XGzpyYVWATs1bnxm7K++GCEvgHdIqNCfWzePUu5HJ379l?=
 =?us-ascii?Q?QIK3AbbWK7dRIdLBrzId29IJ/e/MSEvLXm3hq2zJD89Ql1iFiOY1aBlVN2Fl?=
 =?us-ascii?Q?hvRbpJV0rlPIvA9KsUTiBbhmWOYpAbceijKv4cXXUXdlKp8X6dtuWCKjceXo?=
 =?us-ascii?Q?Vw/6PVfS12uKj33nxx+IduoqzZ7vycgQHuFh9E72/9BWO9ong9dfrly/MDMc?=
 =?us-ascii?Q?lxRacdXX3OXfm7gJ5YR0JeUfFLc+jW451XH6+UnCrEqH4i69Lw1lQB0xLfmi?=
 =?us-ascii?Q?P4YuYAbuyN2+Mp7Bt2xpfobfIK+Lk9X4zeFdSaxVZfffi5tQPKtEQXEAMc9p?=
 =?us-ascii?Q?DR+Hu2v3s6Rq2pDGGBM93VHs291+Gv1RBEvpNKD0NCpyIkhZAYGxh2mIGER8?=
 =?us-ascii?Q?D3CsKzCU9VBsZTU5Eje60Un0B1YFe3OFxWXHlEzGA23Gl0Z0y0eOxcLPno73?=
 =?us-ascii?Q?flLSvfuoogZC4a44hYhXGfola0APuYQ6FH+xtnDP3TOfN0gRQ5zZbJlyvcoU?=
 =?us-ascii?Q?SQwoqngQIHShrlTwseVSNj6PHsK27kxfoIxJM+Zrk8lzmL8sP5EKq0wpB9UP?=
 =?us-ascii?Q?ga85OXsdeVb/oThPvwW2CINRP+asKyfxuH4Kk2GW0Gn/4rmcKSf27cw2G6d+?=
 =?us-ascii?Q?idGGapT3DG4a/A0gfx1ivAfktHOjpNBmUkxF0BBpYarWcSLI2mSil3oETFOZ?=
 =?us-ascii?Q?0+8uZof64bTP5Y6rk0KubCTXHipsA02THwGh7DMqXTmz1aD9H3y10p4jqMko?=
 =?us-ascii?Q?8Kht+kPEwLCXqkB4C7dx0qZj0AZvhyfXsoUu6SJEgf5w+2/lgJX6g+xCh9J5?=
 =?us-ascii?Q?NuNgi4bZpCnVR7I7lmW8SQ0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b77a011-e5ed-4ccb-ae0a-08dbd389dabd
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 05:35:23.8160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ij+bS0wNQaoyh6paMYBnBL53ScU4YRaGk7otcM+hlbzl7zCoFS+J/4lyef7D8SKeKgo9nocIgA6qAxLPzPH+IhR3HoIbRz4MxRbU+P6s8RJ8cDuFe7rxv9EKVdBE5xsz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8242
Message-ID-Hash: 3KNWO7A6F4RWJ7SSZGHAOE3RTAAORDET
X-Message-ID-Hash: 3KNWO7A6F4RWJ7SSZGHAOE3RTAAORDET
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KNWO7A6F4RWJ7SSZGHAOE3RTAAORDET/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark
Cc Bard, Pierre-Louis, Jerome, DT-ML

This is v5 patch-set.

Current ASoC is supporting CPU/Codec = N:M (N < M) connection by using
ch_map idea. This patch-set expands it that all connection uses this idea,
and no longer N < M limit [1][2].

Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com [1]
Link: https://lore.kernel.org/r/878r7yqeo4.wl-kuninori.morimoto.gx@renesas.com [2]

This patch is tested on Audio-Graph-Card2 with sample dtsi,
but needs Tested-by, at least from Intel.

[PATCH 1/5] patch got Tested-by from Pierre-Louis / Jerome before,
but v5 is using different idea from v4. Thus I didn't add below tag.

	Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
	Tested-by: Jerome Brunet <jbrunet@baylibre.com>


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

Kuninori Morimoto (4):
  ASoC: makes CPU/Codec channel connection map more generic
  ASoC: audio-graph-card2: add CPU:Codec = N:M support
  ASoC: audio-graph-card2-custom-sample: add CPU/Codec = N:M sample
  dt-bindings: audio-graph-port: add ch-maps property


Kuninori Morimoto (5):
  ASoC: makes CPU/Codec channel connection map more generic
  ASoC: audio-graph-card2: add CPU:Codec = N:M support
  ASoC: audio-graph-card2-custom-sample: tidyup comment / numbering
  ASoC: audio-graph-card2-custom-sample: add CPU/Codec = N:M sample
  dt-bindings: audio-graph-port: add ch-map-idx property

 .../bindings/sound/audio-graph-port.yaml      |   7 +-
 include/sound/soc.h                           |  55 ++++++-
 .../audio-graph-card2-custom-sample.dtsi      | 136 +++++++++++++++---
 sound/soc/generic/audio-graph-card2.c         |  49 +++++++
 sound/soc/intel/boards/sof_sdw.c              |  28 ++--
 sound/soc/soc-core.c                          |  97 ++++++++++++-
 sound/soc/soc-dapm.c                          |  45 ++----
 sound/soc/soc-pcm.c                           |  44 ++----
 8 files changed, 360 insertions(+), 101 deletions(-)

-- 
2.25.1


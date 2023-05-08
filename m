Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AABA6FBB8B
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 01:51:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 248C4118C;
	Tue,  9 May 2023 01:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 248C4118C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683589867;
	bh=I/6UqV7M5ctw40owb+GtQkjvV6rK7zaVd+aq1z2iCbA=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uN15HtQJw0siC59MlH32k4pkx1LQUWHuydjzLbwJ+muZ53/gkEFgFtXfb7dnZkf8C
	 RLV1jj4RI6aR5DpOzGU7vOIWL2vldHrV8zTBgvf4CkjDAN2XGVEXIr2ztcOz5S47vG
	 /d1tbyH0Zn04dY2XNCzcm2O6Ut5c3awMyjiORfpg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25235F80310;
	Tue,  9 May 2023 01:50:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 718C5F8032D; Tue,  9 May 2023 01:49:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20713.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::713])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 973A2F80217
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 01:49:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 973A2F80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XCOmJ0bz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzfwSiC7UQgO4CR7DSZ/APsyBzZKELK5J4b2SGqhE6Hc8O7iZgkrWF1E6zHvq4gzJonE3twBpwbSwpOHtAu6ie/5wxY6a8bwntL2mWzi1DkPKFrQgGp6utQNp9mgE336kVFnQT9IpqyMNykgswuIC4aC0kg5vQFHx4HJUYm3Rdk6xzrXecoI+YDx9NbNeSTUVUQ6oi2CjIax4qaa1gJ6M5nLbMGH0tJUyCNgdzhe11IHyPZVj2mm+we7O5LN/q6vd+m5Rh+9bG+4mjbnUL9jXhBX9kbmnhu3Ptj0ZZfAYAT+Cx0QwDFye6m0dIh1LyNkVZm8mI5Vk3R4nx9hdtTifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2HPGjlxBEF44y2h1C2yJ0Aui95T8AWeUH/D35GmAfA=;
 b=MLoSygg9cskDJwi6aZUryeEM4oAPH7pOLE2sDUlqlVIaaWmYun2EFCOm0JVpbWNPtVWiuZUjYtfrP3hH5ARqncaum0BkW5FTLRUHb4tslMHCK6Cue5/kQrEfBMASUN26YFt/qdOqBojKDVZWIHUYnaZGM4QTLS2tvlkGTJ1+9JMqxjinFIQNDLWB68Ow/viAC021OBfAeTb7SwGmZ4mbojAnjzI4zUDzqwSoKWQPpMoQD0j57ax6fHU+K9BU/dRr1ayqdM5kO/8grRvMs4WMmPK4wxjOoSe5rnHwknVG7lJhv4r6w/YvFA6uTt4pquBbTHKd8XYP9JAy8bPoS7jARw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2HPGjlxBEF44y2h1C2yJ0Aui95T8AWeUH/D35GmAfA=;
 b=XCOmJ0bzcx4/Q7tSjOWzihOYeem9kN6R/J1YInZzQn46A6O24UvVCbr1WiLMwkqUJK6iu1iCIbCTzyPsIG8obmFgs+z1J4r5G+K9QJTcryIDLcxZ/eEPcOVm5NrOKA8pPvG1MCu+4pezZcu9CJaM/9Le6bTlftiKH7Kd4ZvMnNA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10226.jpnprd01.prod.outlook.com (2603:1096:400:1e7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Mon, 8 May
 2023 23:49:43 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 23:49:43 +0000
Message-ID: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Amadeusz" <amadeuszx.slawinski@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengji
 u Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, Takashi Iwai <tiwai@suse.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>
Subject: [RESEND][PATCH v2 00/13] ASoC: add and use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 May 2023 23:49:42 +0000
X-ClientProxiedBy: TY2PR04CA0021.apcprd04.prod.outlook.com
 (2603:1096:404:f6::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10226:EE_
X-MS-Office365-Filtering-Correlation-Id: 88039c4b-e758-4273-5fad-08db501ee57a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7HHtTmN7tphxP3epnAkZMVXMhpGpaDCBhxtmRy9iNClvq1VXXtdsGo/p843ihNQQ5FTM+bn/KYG27ibScpr0CErVeaV2WupXOX0ezdFImATLkkSGni2NIHzMulTU4rieRPg9idYq8v+fwJkKuCzah66Hf7QIxtRSj9t8HvA0qeJjC8gNt3Fzy1JFNHV+TYtYlH71znBxpsR6SQbR2NO3pvyPcDh6bGLxunxQJFnwZREsRAi1TTi3Rs4VL/HVzrw4OXQrejhevZCvFgIEddepmPAW4ribIefooHwGSMIcssPARt2jojOA6opNLp8sfAUWVBIJd4uWPkpJOGV95sQe5X+grSof9uFKJ5yZ0Jar1NfNZuky1fJXFs+2jTv3n9ucvzRFb+XWpaKBm9CA3yHDHDNJ1qs5SQstH2sPA7gGl0O1oMWQJAtiFAFTy44Dnvi2vGBYyHtnHyeAZV449L/TGAvgsk9vm5djjln6MmeUgMjWEzKpmfe04O/gO7vl4CABfKKvilrbmQTxf0CSjOpRU07lY6vWt75PvNRmTvso2bjSFkNNHRri0o4A1i22vIVwxCvf0IRmkoxTN9YfMNbIhIsPaDCBKbFx9893HvPa/7plqKbDC8UD5xAwsHQ+grODDf5Gf2HpuaYWI3JQgHoKnL+/SnZWtGI+5z298myiRj8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(36756003)(41300700001)(86362001)(2906002)(38350700002)(38100700002)(7406005)(7416002)(8676002)(8936002)(6486002)(921005)(5660300002)(4326008)(66476007)(66556008)(66946007)(478600001)(83380400001)(316002)(186003)(54906003)(110136005)(6512007)(6506007)(26005)(966005)(2616005)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FkdouHxLjDPMG8PAO1qoo1gKZ8O34ENbg++M/Z62bCyWC/Se/kvVTmGQ9umf?=
 =?us-ascii?Q?8MzQHMnotmWpNC2M4j0Rq04DisXpmw71MGtwFADZquTQCSg3dTGE+1N3jcqk?=
 =?us-ascii?Q?x8O8JIZ5fb4GrTktbn08kxJ7xd1FW0dlVVuFqOJ1FkvGyFKuxqAGsGkSf0gp?=
 =?us-ascii?Q?3axD4SGW8GjnPHntNft/PyumFofkqGAT4rIkUviHljFbjrERxiuyP4u4V6RS?=
 =?us-ascii?Q?PhObdANXFLLyuBXtZ9r4Vw27gr7li60nkuXcQmWCpdNeDFjextRQ5e6JHvgV?=
 =?us-ascii?Q?5YPiDSY8FtWfseAN29tgYOPlp1ZOoPNnXzswnsf1JV3+86S4MASX/r0eqW8B?=
 =?us-ascii?Q?ERGOfh6qKVMT1E7/pJjwJ0NX5dB92N5m2hsuwh5inm/LQyTusC8r6F0qmt/1?=
 =?us-ascii?Q?pUtWWB6ad0CrObjOoMZtekpdoFCG3cGUjg7gMjyHgMcdgU8AN6cpiTLtMz6C?=
 =?us-ascii?Q?pssi01qJWQ9puMgPr3gEJgs6BDEbWh7Tdg+mLiUN4vWFpQXoUeVDuwXysPWB?=
 =?us-ascii?Q?7ngBK9n10ngnVoqK9ay/OOJEJJSCoCWWr4nRJAtuNliqDfzFQoyNglWLYXTQ?=
 =?us-ascii?Q?7MSdVnMLORCTdqiST1G81mY2/6o282SMQwH8ucbqtC8aZAnkiTqjbpvpyogw?=
 =?us-ascii?Q?9LFCC8+SFPK6jCi1/b44mDpQQsYVheGvyY+Lk5mJtBONWfKLwPpr4XMqXqyp?=
 =?us-ascii?Q?cP+lKkBDN/+P8tt8ncbeV4Wo4HrxBnHfyINN22IwBrvCSbQ3RzCl0WxU1ykd?=
 =?us-ascii?Q?HpFw+HqtxaEy9drV2xtWBolJICEg68DFmmFY/lIrYNeGWp3rj4YjHOOHl5fI?=
 =?us-ascii?Q?843A2ao9/19d/W7iRMs2hg+7eNFngYOB8XZ/N8dJz2kao3fSY4n4RbAGHkxM?=
 =?us-ascii?Q?l4p3pe0F3f1fJWEt/FEtUbf69Hwz5zET2yO5YWEmiMZ0tiIqSXTfetwLAc1G?=
 =?us-ascii?Q?0LOx6xgZo2BVnYA5oiUmgZlp1FYUGRSWcSMvWwGGkxa8uO/ux2/1VcPW0BIT?=
 =?us-ascii?Q?xvGVMIlBMtHuPPJ8/QKb7kJVpEhlyDewUJiwVk5hLttWZYQbZX32hgBKtCVK?=
 =?us-ascii?Q?ti2wmVWTWc4yuBhHDH9brFcSuOcE2hqO+ZkaX9Q58K5w/4HRgoajTwyiuiQZ?=
 =?us-ascii?Q?7fiTwPV6wLgibBq+3DdoZ0O4jJIKPwbgs6J0UQHrYQJmVE6Zklz8u9rtjmsv?=
 =?us-ascii?Q?j/IGzrF+SAYOsec1IVjy8mO1YyO63XACgu6SXjVwxDp1c7Te5OclpSrE48Rq?=
 =?us-ascii?Q?7FkLTU1n3tPBb6MvEt6ZqXrdee61MR9VGhVXRbnJlIV5G7YGX6+iNP1gVVH+?=
 =?us-ascii?Q?NoMUgNea+mLsqKo+b5g6nQEWDIYA+Lh5+nbrh2T1yspmK+aZgLWlWKAYxr3K?=
 =?us-ascii?Q?tOxKjNdQ/4LbTS37tUgon9e0idH9SJvYVny1hS2xRKSfhh7XWOGpFHlZvqBH?=
 =?us-ascii?Q?5cvmLLvR6mQMI559YUjkgU15oN9Z5Xwb1eeqPoLZttqcdvfDyW8AYflobdYD?=
 =?us-ascii?Q?QR6oqVHIAtMvotBJ1z/bqYUxnoEOVftSIxiPctDhTgBaRwB2MUiIPqlKikdU?=
 =?us-ascii?Q?mG8nPWsLlKem94J+eH6NDtPRQQ3ijslpF9/mAIDKQnsZkYugGVTWunY5gWPL?=
 =?us-ascii?Q?xGheySOMdxSjcL/DYdwEKqs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 88039c4b-e758-4273-5fad-08db501ee57a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 23:49:43.3451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NbJmuJNd2lIfeRsBhweASECKvgmLiYYVIYh3IZAI+e4hLhMvrPBPMpsIeCT/4VYGV7zkH5kly4OxjOBe0S55XEQVQydFNjs+mA4tcZATDvzYUZXpmZhVa3I0LNOEUE6C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10226
Message-ID-Hash: 6ZTJUIEMTWCMCBTYZNEXCXYNUSEUPIKF
X-Message-ID-Hash: 6ZTJUIEMTWCMCBTYZNEXCXYNUSEUPIKF
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Fabio Estevam <festevam@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ZTJUIEMTWCMCBTYZNEXCXYNUSEUPIKF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

These are v2 patch-set of asoc_dummy_dlc.

Many ASoC drivers are using dummy DAI.
I have 2 concern about it. 1st one is there is no guarantee that local
strings ("snd-soc-dummy-dai",  "snd-soc-dummy") are kept until the card
was binded if it was added at subfunction.
2nd one is we can use common snd_soc_dai_link_component for it.
This patch-set adds common asoc_dummy_dlc, and use it.

resend
	- rebased on latest asoc/for-6.4 branch

v1 -> v2
	- Separate intel patch into 3
	- Topology codec doesn't use asoc_dummy_dlc

Link: https://lore.kernel.org/r/874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (13):
  ASoC: soc-utils.c: add asoc_dummy_dlc
  ASoC: ti: use asoc_dummy_dlc
  ASoC: sof: use asoc_dummy_dlc
  ASoC: amd: use asoc_dummy_dlc
  ASoC: fsl: use asoc_dummy_dlc
  ASoC: qcom: use asoc_dummy_dlc
  ASoC: atmel: use asoc_dummy_dlc
  ASoC: meson: use asoc_dummy_dlc
  ASoC: intel: avs: use asoc_dummy_dlc
  ASoC: intel: sof: use asoc_dummy_dlc
  ASoC: intel: skylake: use asoc_dummy_dlc
  ASoC: simple_card_utils.c: use asoc_dummy_dlc
  ASoC: soc-topology.c: add comment for Platform/Codec

 include/sound/simple_card_utils.h            |  1 -
 include/sound/soc.h                          |  1 +
 sound/soc/amd/acp/acp-mach-common.c          | 43 ++++++++------------
 sound/soc/atmel/atmel-classd.c               |  8 ++--
 sound/soc/atmel/atmel-pdmic.c                |  8 ++--
 sound/soc/fsl/imx-audmix.c                   | 14 +++----
 sound/soc/fsl/imx-card.c                     | 11 +----
 sound/soc/fsl/imx-rpmsg.c                    |  3 +-
 sound/soc/fsl/imx-spdif.c                    |  8 ++--
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
 sound/soc/meson/axg-card.c                   |  8 ++--
 sound/soc/meson/meson-card-utils.c           | 10 +----
 sound/soc/qcom/common.c                      | 11 +----
 sound/soc/soc-topology.c                     | 22 +++++-----
 sound/soc/soc-utils.c                        |  7 ++++
 sound/soc/sof/nocodec.c                      |  8 ++--
 sound/soc/ti/omap-hdmi.c                     |  8 ++--
 27 files changed, 89 insertions(+), 194 deletions(-)

-- 
2.25.1


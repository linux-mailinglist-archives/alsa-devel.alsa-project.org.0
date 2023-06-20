Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 127F8736062
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 02:04:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F1C7836;
	Tue, 20 Jun 2023 02:04:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F1C7836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687219497;
	bh=akHtdW93bC5zrMGGsVliaqFVw8wa+IOTalcPjXGxEnk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=u3UB+/4Dufk6P5AeG1D/kPT/rjmXLI0izUSXKn/ZizZk4ep47ejHsQ5MJI+SJFpWx
	 93b6nXHq4UKis96GQP411Zf4O+HU+IuQ0Yltno4dohY40Q0r79YsDfJfj/hEIpYGAV
	 evb7mBLO5YNkQTAf73p6Qc0NgKJ66rLXRlRtYshM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A201FF80132; Tue, 20 Jun 2023 02:04:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4D96F80132;
	Tue, 20 Jun 2023 02:04:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A548EF80141; Tue, 20 Jun 2023 02:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20722.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::722])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CDAAF80124
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 02:03:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CDAAF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=DBjkLdM4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fT7nCkeLqEDbsFOYH2f37WKihvR4o8U9wrZPIv6n6gtijo2sHU83KfkgFZ8HVnKZr9PZAMbai+FO9Y3F2QEOutGSSlEWOmY1ECDJui7FMx+VuUCvfxBVIMEqNvnvFOWTYR9BZfrsF6+G7vV8aiW1gDqm/rBUsmZs6KNCHyeygSqb6Zd1EzNClnc/QeasXRbZ4JvsVUGtn3y7/ipKLpk9OZdZ2bYtaya7OsfPDpuX+S4sn3d+Hj1jjgQBmo7hKZ6+QmNIPCLvN2fVMbAtAjD/RigCABGFvXBmmlcyuQEmXeozBuzhCw9KsX4sLMZySHUP0zc9xMvW2+88RWaxkwSRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CT3E0rD8PUXXjp/Yp4WFyBGqzzXq/I2FlqsAYgo4hA4=;
 b=MZKfiwys2SxkOv8tbauI3Da7aP1SIHLADOBt+5FZooC1N+f0BLQuN+TYIxteO55Nr27sqfKaDl94ukQrm6U5g9IjFnt3kJloIxctK3sI56DfSINrl5AoJLL3/gHSWzfRi2CKtDFAl7W4ewO8IfBiRLOsJEgZuDmHdAdM5E2LINnFKgQRWMH0MpDPLOF7bKNJvjGjLe8EjPB2RnN/eA3W3C4e2QarpjMnMaUU255Tn3rgTh1TyDlo2hO2WSF5W+ILp56tmkXW2RuVGwb/NEuEUOWWroIWknodx8cxN6Y0e0LXbLxiwCm042ydhWk2DZEsC4VhhsY7nbImSswi8b6o6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CT3E0rD8PUXXjp/Yp4WFyBGqzzXq/I2FlqsAYgo4hA4=;
 b=DBjkLdM4/rBTWwp40x1trPTI4nMkbnlNQJDZjzc3OZS8ETodi+L+um6nhyI7l8YGceLNDec1jIxBBTyOCQu4It2PTRLHB2g1rtPKcp1tdmlUnTXgUzikOvJFWPgH7WBcObsoO8/1tsl6KljkM0ubplvpeRt7sIksjoBn+8L2zg0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSYPR01MB5382.jpnprd01.prod.outlook.com (2603:1096:604:83::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 00:03:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 00:03:40 +0000
Message-ID: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v2 0/9] add snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 00:03:39 +0000
X-ClientProxiedBy: TYXPR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:403:a::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSYPR01MB5382:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d3e9c8b-51d2-453c-0ac5-08db7121cdd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uqrV2olBmWX7PNV1Jf04Ufu0sjQSOGKxjS/YQrfqf3cb9LkabPIA8uowfeGwxpGgI/tEhWpnYOBLxFpy98W05O03GQ1LrvFGaOQxcvpDPxM9tgGFVdE63sNcL6c+IHAPVM5dFrK2sC2u1oOruD7MZiAXkOGUzNaibavPnyX9qhw4w3jMtN8fVNw09hQOBx5lTiDUrRUrKhnreCt5shH/McllZOGROdK5othMpcjFEHKeQ4irBw+JDbe7QGr+U6CDdSkJgCb4AUCKaJPS3Pekf4EEm4y1AY+1h+ZgSxz7k3dKWFSUtd/oNFUM2ofcD2ZPOC/8aTyViAyrYSFHKQrF3QOrUT6PTdTM3SPzc2hmo22ej1/WxYcbCFXZ1sLpaI2pqDx7mDTBQ4qLHGsFbdjceJoF9xsUwtr/3XYinoTqo6gRGLHmReuhiu6N+yq4G1mLlvosfKVsHxPAoxwDeJjTjZkBvwVMKiqLTUyFfJwkuhpQ6p435iivfm8yEQYumkSTW4V+o8ZWp9cfBrfkHytg3TrfmtOD4HS/LLeEvnnv9ppZ8YSHaEE3OnnY9sbOZqVLI7buX/VpJixldPdUPL5GuaKLsi+iDmrpBr1m6J2ENgA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199021)(2616005)(7416002)(83380400001)(26005)(2906002)(36756003)(6512007)(41300700001)(921005)(478600001)(8936002)(6506007)(8676002)(52116002)(38100700002)(38350700002)(316002)(4326008)(66946007)(86362001)(66556008)(66476007)(6486002)(186003)(5660300002)(966005)(110136005)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mcmaS3SHV+DgPCeMlkOlauuZh1I3+xyjans0PLBm4djTxocelBBM+URulWF9?=
 =?us-ascii?Q?AHjuZC6p+p3plr4Oki7NOBjnCTdG0nxspjUWYf8f/8PBKywDIW22Gl8BHuGW?=
 =?us-ascii?Q?kcj/OQDUJ22ITnyWzi0AVcyPZ3HjfK0VB45m9TvMXg3lfs2d6LUaUsbigRP2?=
 =?us-ascii?Q?bNSYWOUuZPC4JQG9a2dM7xk59fyO+gn6Vl9SH87LeOXXh1UIRHwCOPStQxIE?=
 =?us-ascii?Q?RKYEWZiy1uqDceNzB/wl2zmLZiYOaL5dRHq+qRhXTgjjbb8M0dXsdw8Zogg5?=
 =?us-ascii?Q?bydYLR69LsdBtSDPR35uQsnVfLiXyNXsr46YL9r3M/ZQS3/D2FM0E58UsWr4?=
 =?us-ascii?Q?NPupfgGq3c/r/JWJWIA0Ydtc3lhklYTbKl2QkyPphKGh/P9sAO2JS9H0oTQ7?=
 =?us-ascii?Q?hMqqmrR57kE2xhIMMYb88V2mcf3hEwdPbDjDqXwjrKneMaWLfE/BH9m0zDxL?=
 =?us-ascii?Q?paitZeZZGMFfsgbt4FzdxziKic1C9Fyh+x++p83o/VoYU+HUVd23ztPt4lXd?=
 =?us-ascii?Q?5Q8X5bqb81TetWoq086yn+8Ku9EhXJ1/eVMG10OEPjscZFA3yEFHDiuvB0if?=
 =?us-ascii?Q?ieQ5YjiFCXrHU3PdXVLvjdqL/Gi5lpe7frU3UTCRn8QbS8w22vyJr/NfLXdm?=
 =?us-ascii?Q?cdbCVq+b6Uxv1+jqyrjbMCZo/3IHSEgv5b7M2f5KA2k6yglPL/KAh5KKlCGf?=
 =?us-ascii?Q?Csfq+VcgYu2ESSQD/tdiuC8zjXdMw8RFX/xUTvnnf5POuB8rvwVrfXFMfA8q?=
 =?us-ascii?Q?6Xfm+4AJmg3LngRwIwuTmTHwGB7dJFHjCdhxU6/UZ8dxYkHW+hI4sH699Lrb?=
 =?us-ascii?Q?IGrRoelJpNWriJpNZ39OKS8ge83ZdaZmxkJIq3Blrm3jDGcLiBBasjYiLWDk?=
 =?us-ascii?Q?W3YtqLwxtFrxcMZw2D/us6tDJiqY5oo1OXeuqfb06F2m3KCnrHXutnBWIPpF?=
 =?us-ascii?Q?HVGjK7/9anZ0bRzC2mvJER94xzE+7o/e+WB4MYdc4/wrtaLlUqi0iBr57H97?=
 =?us-ascii?Q?D1QZNgpkrJhgBzn+cro5Wq1oQHKb6to6j3x1LIET7vmb3t09ekNrYn628xfn?=
 =?us-ascii?Q?t5hzZvQqlwzM0YxI7KwBM1PWzekLFvlqF29LQ2sD83qkq6nVE8qp2IznPTAJ?=
 =?us-ascii?Q?vaAMyYMEbPrxduCl5fgsSfi5+iNPkEdigpnjrGw5LHgDli1NJK3d8SkAoVfP?=
 =?us-ascii?Q?Xe/+kFtS6oifscBb/wV9CJyCxmJO64Go0Iats6OGMIqMB1ze2T5H5MTeMM06?=
 =?us-ascii?Q?r2AKjBwgkyQcfsBVTCxm9zLhzgAQUC53wGgi/eUGC02zDOhU23AAVt83/3Eq?=
 =?us-ascii?Q?1dlPGAL1VwUf8tDwTFRNFoqQi6x3usD0RnJ2C7BpgXkMv80bZMOGWWaeLyq1?=
 =?us-ascii?Q?8HeHQsGHzSpshJNcAHdoXawUAASRLJl+vXgYy20mlv34R/x/1k9GK7dtTLap?=
 =?us-ascii?Q?lKP8Vrlx0ACzcbkU3Pt2sAvqxbzfWdHsp0HHE2FCDdal2yEXLzLWJOFo4MkU?=
 =?us-ascii?Q?p8JS+q3xauMK/Oj3swnCUWpfx5kzt4BLcykRxT1vz5aD0kZLBfB4rA2RJmav?=
 =?us-ascii?Q?f5bSavimBVM7liaAKFmkFe4yUCh+L3EMx8dnfq8iTSMXVa+4Jkp5/IfOGqL7?=
 =?us-ascii?Q?x8IJQJBUBIobwMcyztrk0Qo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4d3e9c8b-51d2-453c-0ac5-08db7121cdd5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 00:03:40.8313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Vuw2qaJ8HPXNdGd1vBBQzOuw6wRTh3ta8jHflOJ1f/p/XGeBLMfH0I+Rv4lmndCrvCkJiuAyCcMNsmp3KE1iSz4GQIS243n+NjRes40xoCrvmlmMofODqWmz1+8TLOrG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5382
Message-ID-Hash: TFYJUOVD227T7X5MEWKF746LBDPTKQR7
X-Message-ID-Hash: TFYJUOVD227T7X5MEWKF746LBDPTKQR7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFYJUOVD227T7X5MEWKF746LBDPTKQR7/>
List-Archive: <>
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

v1 -> v2

	- care loongson

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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7906EA079
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 02:11:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70CE6E9F;
	Fri, 21 Apr 2023 02:10:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70CE6E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682035904;
	bh=NeEVPQdHQYw/hDsCfOQ1ZIMwhY1+3Xettut5AB3A5Rc=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=a1xZ13nfAbWHl8/7zEh+DMkDZpAyz4xZJkkE27ROFSmyICTmWI47eN7xIPImoPQUT
	 HbldAsu65lvW1w+N2WKjmt3dKfhZajIKZjAWbg+6RbxmaH9Wecv4ofb1hLvUjOEsTS
	 mIuWwx3vTUPLxjUmRgURCUEzHbTNtt6468snsMmk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8CF3F80149;
	Fri, 21 Apr 2023 02:10:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D8F5F80155; Fri, 21 Apr 2023 02:10:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20713.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::713])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C8B6F800D0
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 02:10:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C8B6F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=LPcfodIh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEMfPiYW8DnJr9K9CWOP2Qau2OyWhqJFuTLUISLugS3KTTPhjHX660LW8mocdDxQALAFw0RGS/6zP/vXozn3tT1pwdMBvhdyBVolPlrtfq2jv0FakHAoFTuvm8PCtXuILyy8/fGaq/51uu08UiKxEEc1l4t22nzAwQPDPERIbJIIn2FFJHtTIWxlVeGqPSvsxuaYyuYYbZTjjoZK9L/JCP5HQyAKHhbvcfyLZugGHi+lgXTqgCMLLzu8BFMBvzYaxI3UFAbxL470pwjsDXzcET3a3IzqrKuhcTtDiTpBpjPy5HuXIF5vqSB94lKMZauTQsJQAgbd0rPPVB1teEgIwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfWk/TnDgkLlXsp5Vnqy7dGCO9Kz/VzTDpKiCTXK4V4=;
 b=PWHZBTDHiS+lJqZpslyN/1wl9JO4s45V6zCd4bnohuARcmn6+iH9Oe00VGqhDy0BgEUzeC37drpxHki8gnRFHyb4h5lsB0ymrn5uEU6ebdMnBZU0o7UAdvPFjTHdQCljmMa+O0PgN4QTAC+gJm3ICZtPaWsj9IaAoBsL3WTVt+dd7l1+grGdp9lYSnox4gXS/UZuMQocHVRGzKNiaTccF/Erp5vd3Me6+hKmxYdeDCyhNYfIOT0CRBFhmalWkZ+7o3vfwAiqCKkD3qS+eRATdiuihqDC9dFio+48BmYoIJoX0mUjRSvaYJFXJsstuEfmlkNjklgGFM8eGUEKC3Iruw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfWk/TnDgkLlXsp5Vnqy7dGCO9Kz/VzTDpKiCTXK4V4=;
 b=LPcfodIhzescraWM/RVRYCRK/MGnF7eyVFVRRsqVN4yZ/9hVeZtgWcoAaS8xIbMj+Lvi3mmXA/G0RWsxdl7lLADCjyPSO787AioZEIVfV0O1bDcVZ867m3oSJdJr9onGfFL1AAGRR8xI+dGoUXhSmgAi3RWegQ+f7Qg4izED/fg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11167.jpnprd01.prod.outlook.com (2603:1096:400:3f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 00:10:33 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 00:10:32 +0000
Message-ID: <87cz3yf631.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC][PATCH 0/4] ASoC: fsl: cleanup platform
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 21 Apr 2023 00:10:32 +0000
X-ClientProxiedBy: TYCP286CA0005.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11167:EE_
X-MS-Office365-Filtering-Correlation-Id: 30bb28d9-dac6-4c4e-b9d4-08db41fcd28e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EFwgXfGlQt4LrUKlTIYbSGxGQGVNuaN8i8+kfmc6Gg6aXLIBZGBIoTU5Gnz3yiAeS1fzPrN/GhUAqpSavdCWjQmZ7mPWV3Ej4cgMFadGLvLgH/jIpDNxUlAyPP7zt9JnByzQv5EHZpuDLSyC+UdOeykElwbFxQycqLGn6a0I525Cj2JrfmsOcKm51nj6+zP1ZiU7vhRR4KX/qe8WC/1uBniGjXtsSe3psFcZhX3p8Ovt2Nv8YFrtik4N4TWUF6hNaM/bmBxfFSs9THCBYVP96MtcWHrpJrYkFs3O3TATyleJPSXTO8OOVOFqtFiDAiCSv8qqE2C4FZY9UI9aDcI1viWLSi1LNtbsFOGDH13W+4jNixkV9IopLjpQ2wvd94rCxZxkS4Yf4oLICpkoQCdAMZG6eHdfelAJZe+qf/s6Plqbgm2EKhr6/slJrwwuGwpz1HnYmEaaKe6RauX4tLE88/IrDFFSqT6ZN3iSGbBu/fFPkPO6zmg6ezIxfRzLti9xqHst+R8VcwEXkI98Bm++UbMt3XLEsYPyfF6u7LbZWnvxG/AQVgMbAaRc4WbXMGfgFkEcTpvNnrG4KwjxUxm+A+CEqDCNFjsPkvbisAKRvcWjkzc9AFcdI3j22jr5b/CqCToEOHNW8E74Wfpu/eDLeQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199021)(36756003)(2906002)(38100700002)(8936002)(8676002)(38350700002)(5660300002)(86362001)(6486002)(966005)(52116002)(6512007)(26005)(6506007)(54906003)(478600001)(2616005)(83380400001)(186003)(66476007)(66946007)(316002)(66556008)(41300700001)(4326008)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+i15S1r47eGOL3qZFJcz2zu2+yx1nxb1AJrF/vhkNP11gHVmnI4YXn89Un/w?=
 =?us-ascii?Q?cvHg9FzCpY1iRbX/F5x79qPI/XUPgIcZFyMYxBtzvVah3mysKHKq+9Ja9KyH?=
 =?us-ascii?Q?nGWq/wZM/XSa3rJ5zZK8+loHmtZE+D0xscrSLjJs64ZpALeb937ymK3bETlT?=
 =?us-ascii?Q?s4I2XoU5Nbil0Y6SpEOqUwl31QTadt35GIK8hkc57lCXK+3IWvDLrdW/yO8U?=
 =?us-ascii?Q?33M54LDxi9GwNeR5idraS+68Z75yb5oAIMxYrM2mKzskckpMl8LXje4t43sS?=
 =?us-ascii?Q?vSIbu9/wBLg/81lUt4S7uxTcVZkLgR3RzO5EXIin8tlK/Lmpneh7eSzE9SbG?=
 =?us-ascii?Q?Sx6HuO4+PuDORZgTqXbMU5UQ24qHgS9WK5n7NyiJyqaXWHt0lmY3AdO26K+H?=
 =?us-ascii?Q?hQAqCDceHjwjvPHzjivSYISht56V2ENHWHcrfAEhV2tGxW0HnlUwLy5BWTCY?=
 =?us-ascii?Q?LDSKMbvypdJ6ZMF2ZKOdpECKd1w2fyFAY8ZN9H+mejzBeU54DRN9ADn8hG3F?=
 =?us-ascii?Q?xp4eqRWvkGugxPkxnDmKx4l5oaxaagZPAVbka8k8Wjd9xLpIB9tQpbphHWq6?=
 =?us-ascii?Q?PxnBTGQYit32PbmrIZzFKSXvm49E3MpVbeIjSH+4t2wVdftMWWHT6d6Bpejy?=
 =?us-ascii?Q?rh9A2kTdFXlJGDHcpCgRmcZrzyM2A3BiARphAiu2gmaLeRd+YW1YXKFxxu7g?=
 =?us-ascii?Q?rcJVLBm0phGwi31CYYjBeYrG9cFsmI5MpEw+bPsrsiLz4qsJk347H+KWlJLB?=
 =?us-ascii?Q?lxG2g0c8OpNTofW2El+FedZJmS7tACUpAUZzBFWY8M0t4BNyq1hlTqe58kWx?=
 =?us-ascii?Q?ARUvmH/jEbafU6Jt+mJebEMQM2pUq0knKfLZcD083sovurWR1frruO7TDsDk?=
 =?us-ascii?Q?N7n37elkaMf9EFGF9t51YiTiT4tr8jp5ueSb0FSemg5Ebl8bkxzWp8Abg343?=
 =?us-ascii?Q?RBnmISSXsYO0TdApIjTAj9tPteBxbRcyTpQHyMktk/k4xGY9/M1cQ4oC0zd3?=
 =?us-ascii?Q?VB97+6RlB8BFOJ7m8bJtQUZm0hg9nS6T8dNa01zoLb55Xwsxj1pWsiRV+FOF?=
 =?us-ascii?Q?Doj8WJisQv4B6kzPo6EYSsAefHv99Rnw7hMc4pLw8BgjR3RcQ0N0R3gYpIyK?=
 =?us-ascii?Q?XDRUuheqw5rxbMa+dcJWFdCWjs+nhT6PSmHFdrCY+RytasuWx3a5e6iYU1v/?=
 =?us-ascii?Q?lJNc2AewHaaudNgRg7DEHENvdYyovW1cWJHTF2Rf1l354sQMWZZO2TQxVnGt?=
 =?us-ascii?Q?sLS3VeqUoztQ/r26A5iPRUQlKXcLRaufZ+sXouJJC5/mEuswZvUyHHg+QtRE?=
 =?us-ascii?Q?OCVIURFVyXjo+y7yEi6dHBth965qd+V+/QhEuoFFBcrm1VmLE6HgRreWd4ds?=
 =?us-ascii?Q?hDI8Qs8naAByPMq3Yr7CWG9KTrBd5pudegAlzpAnQgQajNpuXe4Dp8sXGm4V?=
 =?us-ascii?Q?GgqQDKkaKbFcvMO5m9INP+sD08RnC5nJHV0nS1Ff0G87KzrVPBzX+ogwRv78?=
 =?us-ascii?Q?+Fd8fbC9pyQ+jcSaJmEOZEW7t56oKG8cOafPB6AvOvWanwgS9wnaU4paBPSt?=
 =?us-ascii?Q?ojKAy844LB0Q2JILPWinRwzCuyVsvo+LRCTsQFKW7mzkfg1mL2lqvMC0MZfT?=
 =?us-ascii?Q?Pckv7yEHUvNC69eSYHKKBEg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 30bb28d9-dac6-4c4e-b9d4-08db41fcd28e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 00:10:32.4249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EnkaV3RBYjxpNfRSXfamjCG5zlPtGXvvDgcC3SdDcN1PkahsLvBhpoWrOHm2eUDNwkE58FaGzAgPkf3+li7unwadj0ulO5t1juhh6vpc49TFeR2Z1oZQdhsMSVS1X7+j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11167
Message-ID-Hash: CNSRE4Q3DVLS3GNJWXK2YESBFOLKHZNY
X-Message-ID-Hash: CNSRE4Q3DVLS3GNJWXK2YESBFOLKHZNY
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CNSRE4Q3DVLS3GNJWXK2YESBFOLKHZNY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark
Cc Shengjiu

The driver which is using soc-generic-dmaengine-pcm is a little bit
difficult to notice about it, because it prepares own Component,
but shares same component->dev with CPU Component.

Some fsl driver is using soc-generic-dmaengine-pcm as Platform Component.

When binding CPU/Codec, it finds relevant Component, and checks target
DAI. If it it was target DAI, ASoC binds its Component to Card.
In Platform case, it finds relevant Component and bind it. It doesn't
check DAI. This means, we can share CPU dlc with Platform in this case.
It is more reasonable / understandable / intuitive.

This patch-set share CPU dlc with Platform, and adds such comment.

Because I can't test this patch-set, thus I added [RFC] on Subject.
Please test these. This patch-set requests Tested-by.

Link: https://lore.kernel.org/r/87o7ojjd06.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/1681900158-17428-1-git-send-email-shengjiu.wang@nxp.com

Kuninori Morimoto (4):
  ASoC: fsl: imx-es8328: cleanup platform which is using Generic DMA
  ASoC: fsl: imx-spdif: cleanup platform which is using Generic DMA
  ASoC: fsl: imx-audmix: cleanup platform which is using Generic DMA
  ASoC: fsl: imx-audmix: remove dummy dai_link->platform

 sound/soc/fsl/imx-audmix.c | 22 +++++++++++-----------
 sound/soc/fsl/imx-es8328.c | 11 +++++++----
 sound/soc/fsl/imx-spdif.c  | 11 +++++++----
 3 files changed, 25 insertions(+), 19 deletions(-)

-- 
2.25.1


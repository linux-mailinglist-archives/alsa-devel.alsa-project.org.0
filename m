Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7DF8C39A1
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 02:32:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66F9AE66;
	Mon, 13 May 2024 02:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66F9AE66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715560347;
	bh=UlHQyGTEM25XSr3p5+bW3CoQw0OnSzjELwKTZ0swvc4=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=KUVwte38NTUT8kUMbSiEIBR5z/cP05nPXkSu0vBr1nj7hPHMWgNwSG9ME0BpMRvGC
	 nlj/sctAEJ63yyytIrllV5Hbt/SRtUAA5EF993iWmY4xp+kR96cdtL9npTVOvigJ74
	 WJYavmJVb89VTpN3ryau7mltiRsJK/40ohBhE2hk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F09C6F805BE; Mon, 13 May 2024 02:31:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB5A5F805B0;
	Mon, 13 May 2024 02:31:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AB1CF805AE; Mon, 13 May 2024 02:31:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 734B8F805AE
	for <alsa-devel@alsa-project.org>; Mon, 13 May 2024 02:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 734B8F805AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=V4dYuym4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrQzMKbsrx/aKYTYwiIR8x4oCANS2ueTEw35j0K84w5QoZ6CohgNnFIAXr1nCqwYJaaEf8GpUq8/vOs88uKYfwcO9RMYwi0VEmMYoFYDR4zlIIbKWCLh/F6n4KHhr38oP9y3HWaXKiYg6CqpPPaZ0bQqZI//Osi/q4DR7cYMlpJr70AkysqbvpX9MnmZy3BOCQA17GhH8pK2WOxaIN+ZQXr4rPn97lj/WX0LCE+7Z4b84KjmHZvQ0C9kfRnbDy6v87Wf6xWcxYFwesRs5hYjZjr5ZnTLShxs2/8BeZbWrmNDKz7bXEeIdrckHUEgyqWZGpearoAC6zk9bnChH2rm6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wor7/TYJgKI18gNii8iNrsHIxBN6Y8ysM4fkY0I5Z34=;
 b=DQxUvRJFmsviBsNO6mNpVXeH2FMgBOvcStp7w4cF3vHiZ282VK+PQjqC2npFHBgaacfeRh4PKRPgwB6psdYs1Wz0iPb9AIniqFAn2e0glCFJoDWSKo5gMPb3wuSp77Y68YO6TXvlIJgTPI6jK526nnuiQe0daB6Aa8hToSpIWPZmFUwwXNHX3d7Dr9GvQUSBd7iCaqv7z/l/RZ3vXukv4ZHFOkJvPqbERwgFlKxcyiYnMQY+QpcfI5N2am9sBf/6M8bO/AD6M3XKtcl8uy1Q+Cdai+rJqUEehahY/rJGKWtlWECiq9kbDpo5V0iDqWfGfI9G4cyj7fRfUgWRNeFmFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wor7/TYJgKI18gNii8iNrsHIxBN6Y8ysM4fkY0I5Z34=;
 b=V4dYuym4NjwJWIF9LKAIK45SXcC0jIt72TBo+v1PNqgzKadPZWvTpWpNiGjyNngA0za2cX8qrEgLrAqGRWUPo5ALuU9uHRb7O1DZGslkYcFkjRMF/QaQ0nvnaPw9Wpd05jEZzCIEixAQhA6xrB9o5mLLGvn68UlTShwvemQxfW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS3PR01MB7383.jpnprd01.prod.outlook.com
 (2603:1096:604:14a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 00:31:42 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 00:31:42 +0000
Message-ID: <87msouzh5e.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,	Jiawei Wang <me@jwang.link>,	Jonathan
 Corbet <corbet@lwn.net>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
In-Reply-To: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
References: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/3] ASoC: soc-pcm: Indicate warning if
 dpcm_playback/capture were used for availability limition
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 May 2024 00:31:41 +0000
X-ClientProxiedBy: TY2PR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:404:a::24) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS3PR01MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: ead90118-5c88-4a12-4f62-08dc72e40f9e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|7416005|52116005|366007|1800799015|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MBZc40RiqLbvQ7qn5T2LJl/nD+/w8nr3Tw7/Gaf0PwTNBouP5H2iprlneELn?=
 =?us-ascii?Q?GN/7g2rYQByj9XtzjQMPqOtlmWkSa/rAZh5t4+3JjzuwzOAciDTdS4oDFDHc?=
 =?us-ascii?Q?7aM0HYz679TetQ6BoPQul9pGthN1O9NeIAxTKQEiC13WFDiziRnORSdo5KHK?=
 =?us-ascii?Q?M7oKjBm+Z/SCVmLhFclPwgSmi0f18QO5lKfjRNkMkO5qBr5RThvGw3zFV3h1?=
 =?us-ascii?Q?UWyCX+kvi84+6evQv9pBUpcJ2lr0jC9QImM0neyV8D5ahfTHfxd5iSvjbfnc?=
 =?us-ascii?Q?r16uNIhXCPOSRhvSffpt9OfrpxdZjQzxtkBElZUwevz6Xv4FB8a8d/g995M9?=
 =?us-ascii?Q?a1bjXdUghvvb6pblcT9V0bYIVhwS5bc4mMwFu2vCVpIP7GZZdA7jySmjsg2x?=
 =?us-ascii?Q?T1m2g+qcNRM1Agj8AvXWeEJhhHcGMYWGxAiouLu7/OG13ztNF0a9Mcw3ArjQ?=
 =?us-ascii?Q?0Fp1/wd9cVNwDg3u5hQqeLo5G/pKcYl6YmQu1xLx8vh3cttUS4ORJ/yacmWw?=
 =?us-ascii?Q?MnC/F+mJfgJfAYtPlwB2ogoDQ8l3h+5Lu73DPI55QjBW828WeNuWiR7znNqK?=
 =?us-ascii?Q?fZikv6qgWE+2qYF8AilAJaJdNjdDpnobo9qISShqoZx9604tQ4+X1sRTCppq?=
 =?us-ascii?Q?aUFHBZ90y/cgWqSo8ceGubYHdd9aU3vtUiVPptNyJv0U9NUOv/8v//1f76yF?=
 =?us-ascii?Q?oSYfvsjtTi/YLz5HvgVATD1FquQd7AJDMGLOpws95C29CPT17jIt260LmvPT?=
 =?us-ascii?Q?98Oz+/5x+q8az9e/mQoDXJDf3ApM/1o7BsmfrNrgcwFyscENvRM/hptW10nQ?=
 =?us-ascii?Q?MwhEuhgXuzZjkPciY+DBNIPvzlD0rkf5APh+xfJOJ9uI1e0SGTjkw8tqFnaN?=
 =?us-ascii?Q?Zn/SAEGdBuj5H8NIDmqrzgmmm0gbQJMnbgty94LDseZAQoyIVMnuHXugKtZA?=
 =?us-ascii?Q?iordsAydiAk2bT/zUK1UrA9unrf3uwPPsFoJFFjGwVqlPFgS0ThJdVdrwxzY?=
 =?us-ascii?Q?DhaTVYJ1s+cRtsXyEjgyyyWMrkV8VAySDf4GsDVt1Ph5Lcuonm9cKwbd1HUm?=
 =?us-ascii?Q?wB/M0P26iYmKVGdIigqq6DKWszpEACKyJ5vCAngdbZsWMqIECLFgxsrADZ71?=
 =?us-ascii?Q?MRllJ6YHevUm58q1uZo0jUwIb84Whve9BRcxExt3KImOjESmjh+81RRLkIMH?=
 =?us-ascii?Q?97t9sQlvOKTKv+oiLBD6fljhTBwyFcRvcEFAsgDVxWGWsajRw2lHJ13PdQPK?=
 =?us-ascii?Q?ZPsI9NDFDOEGDNB9POF/oMZ1ecbyXGAx1lnczu1PXjHvT8l9aHF48Qxuwn8T?=
 =?us-ascii?Q?GUY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(52116005)(366007)(1800799015)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H2ygjSpWRV5kzSBkE38BxWsPfWQgnxSALgAKRFVnRs6nz3s8RQI8F5ikobwQ?=
 =?us-ascii?Q?uPZLKxWhQPM/b2E51OOS+NJA+ZuS93YSYYCpXHYPSsJ2dvcuuFe5Frxo9+7v?=
 =?us-ascii?Q?5wYrkd3fnjgi8veiHJ6xZ0n/EG55vE3heNF1VawbCEqMrCC1zLLp1KPB1cpP?=
 =?us-ascii?Q?jtzC8R2SujdRYcxxcrDTXPQLMnZ9ltiBZm7TEaKikab0G0CRLYvDR4MXV+WD?=
 =?us-ascii?Q?Une+14Bajfdykr5tusPxk4I+lQWvwapUhvvUtnBcde8ndOfE+bzJPmgMq2ed?=
 =?us-ascii?Q?m9hQaWGr8Lflp4CJ/aKlmGGYEQBRyZU0UhFX/Z1shCP1FMUppGbTHujmk8rT?=
 =?us-ascii?Q?Omd8TF/kw8mi8Ik0VKWEEJlRn7r8JUQLvKDTzyw5dOUhZN5nwlPQ9FEC5QR+?=
 =?us-ascii?Q?kELR0uzOU3dO/R6uiXu01GByaMHwcicGB9mdlhMlhDli0xqLuSc4XFYxbRXP?=
 =?us-ascii?Q?xWldH2vP1WMQYD141F9pzwMAvWJn8xGA494RNQURdGpHw88LYGJQKp1vgFkj?=
 =?us-ascii?Q?SBMDSySpVI9CoCJL1883nciSVg4UENxklbhlORwX6W/E3dq8yr2L7lX1sxB0?=
 =?us-ascii?Q?EbG2+UlbHBp4vj/4EKceMmHKYRWaUgodKj9ISkxHDoDAcWGxy4ddP5PLiiLn?=
 =?us-ascii?Q?H0hjEyomZp+vJ2mo40HqU/Dp1YsUHEs+Nj6U0WIVaZsbVrGgrU16jMBTYwny?=
 =?us-ascii?Q?Qs5McrB628JyV9fanB7XeFngRfk2asxyyNYR5fQOS1HEPLh+8+s847EGZp5d?=
 =?us-ascii?Q?0MouCfbmt9Lbwr+3xHUlkD+Vbib5mue8TU63O2nkOlj/dI9X+4ao90wSy3ux?=
 =?us-ascii?Q?oVvlcxcXj2W7wNH+EfCpQT+RK+oFDT7yrltYd7NSYQQjQnEL2Mgr0Lwzds5r?=
 =?us-ascii?Q?xxI9z7ygVsAWtHbX20YhWUdhbqPQpaX4PDchjJQthetaERp/Liqj845VXWh1?=
 =?us-ascii?Q?mLKVMhI9/UzP7s2bxDTjI0Z8Rrwh/U7gNwJiNfe0JLXbxabfFsBmHqS4EMMN?=
 =?us-ascii?Q?E0ERWn/WAqXSNE5XmvytncTYbx+mjjW02dNdqWYlOXf4eHRGge5IwNw8z0I8?=
 =?us-ascii?Q?YEIE4eriMCGd0J/ztpfgJiCXp/Z/mryJJDP7Orf6kd8BOI3KrRGc9xg7RNHS?=
 =?us-ascii?Q?FsFyJv0QlGNmqxtLVuWx9cdv/wfa8bpTZ8XpvIM1FJebANdQuiMgy4Me3Frq?=
 =?us-ascii?Q?XCNVei4PUCsTVIU/qlciy0EGil2wH+DqAoXbDlr444VGLOERr2TWP3oLk+Ka?=
 =?us-ascii?Q?e8fU+RuwOWEb81TY0HKqn4o+N1kBw60hfwgEFUQWewBZ0JxMraEztgNrmbpb?=
 =?us-ascii?Q?PfKBVFvQJAmDWxNGmm1JeSZDffO0Fsj4L3IkqhuhOL0ZOV0zHacnL8Idiu+s?=
 =?us-ascii?Q?oem2EYk6K6xr7XRW+o48oReNNnrdBa6SulJon7RZd9l3sO4+QR0S3iqwwc4w?=
 =?us-ascii?Q?Nzv9T6w4UEv8E6Pyt+Ov1kdmrbqQRnmZYtpg6mhdaAsMd5E+t/RYSJOFoAzf?=
 =?us-ascii?Q?C3sQG9wtQbUDcqn4yUN5SKpRKg1lmLJLJDBtsVFBV93esRqwSdnBNl6ByD9t?=
 =?us-ascii?Q?eLbcNAyMHLyYQbuIP9fBIOyD0nN4EkayuQa9SoA7sWHKmeMYVIaYtM1AVLnq?=
 =?us-ascii?Q?qcz8PDbDz6eziBHoVXD1ELw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ead90118-5c88-4a12-4f62-08dc72e40f9e
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 00:31:42.0678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KIK+byGFdr54IC8Y7wiRtWmpusDHVN0asR20qXxUMF93kklelOvHq7z3rU/EKvVtk4ogGpOh0651rN6fVXTPMIDsMfLxp3xYL1kB9lfTYooW/d4uK2UWjO2hBLW2Q5jb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7383
Message-ID-Hash: 2G3GTYGUGFF72SZGVFSP3BEFBJUCYANE
X-Message-ID-Hash: 2G3GTYGUGFF72SZGVFSP3BEFBJUCYANE
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2G3GTYGUGFF72SZGVFSP3BEFBJUCYANE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I have been wondering why DPCM needs special flag (= dpcm_playback/capture)
to use it. Below is the history why it was added to ASoC.

(A) In beginning, there was no dpcm_xxx flag on ASoC.
    It checks channels_min for DPCM, same as current non-DPCM.
    Let's name it as "validation check" here.

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		if (cpu_dai->driver->playback.channels_min)
			playback = 1;
		if (cpu_dai->driver->capture.channels_min)
			capture = 1;

(B) commit 1e9de42f4324 ("ASoC: dpcm: Explicitly set BE DAI link supported
    stream directions") force to use dpcm_xxx flag on DPCM. According to
    this commit log, this is because "Some BE dummy DAI doesn't set
    channels_min for playback/capture". But we don't know which DAI is it,
    and not know why it can't/don't have channels_min. Let's name it as
    "no_chan_DAI" here. According to the code and git-log, it is used as
    DCPM-BE and is CPU DAI. I think the correct solution was set
    channels_min on "no_chan_DAI" side, not update ASoC framework side. But
    everything is under smoke today.

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		playback = rtd->dai_link->dpcm_playback;
		capture  = rtd->dai_link->dpcm_capture;

(C) commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow playback/capture
    if supported") checks channels_min (= validation check) again. Because
    DPCM availability was handled by dpcm_xxx flag at that time, but some
    Sound Card set it even though it wasn't available. Clearly there's
    a contradiction here. I think correct solution was update Sound Card
    side instead of ASoC framework. Sound Card side will be updated to
    handle this issue later (commit 25612477d20b ("ASoC: soc-dai: set
    dai_link dpcm_ flags with a helper"))

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		...
		playback = rtd->dai_link->dpcm_playback &&
			   snd_soc_dai_stream_valid(cpu_dai, ...);
		capture = rtd->dai_link->dpcm_capture &&
			   snd_soc_dai_stream_valid(cpu_dai, ...);

This (C) patch should have broken "no_chan_DAI" which doesn't have
channels_min, but there was no such report during this 4 years.
Possibilities case are as follows
	- No one is using "no_chan_DAI"
	- "no_chan_DAI" is no longer exist : was removed ?
	- "no_chan_DAI" is no longer exist : has channels_min ?

Because of these history, this dpcm_xxx is unneeded flag today. But because
we have been used it for 10 years since (B), it may have been used
differently. For example some DAI available both playback/capture, but it
set dpcm_playback flag only, in this case dpcm_xxx flag is used as
availability limitation. We can use playback_only flag instead in this
case, but it is very difficult to find such DAI today.

Let's add grace time to remove dpcm_playback/capture flag.

This patch don't use dpcm_xxx flag anymore, and indicates warning to use
xxx_only flag if both playback/capture were available but using only
one of dpcm_xxx flag, and not using xxx_only flag.

Link: https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h |  1 +
 sound/soc/soc-pcm.c | 65 ++++++++++++++++++++++++++-------------------
 2 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 33671437ee89..2a3da1d91377 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -815,6 +815,7 @@ struct snd_soc_dai_link {
 	/* This DAI link can route to other DAI links at runtime (Frontend)*/
 	unsigned int dynamic:1;
 
+	/* REMOVE ME */
 	/* DPCM capture and Playback support */
 	unsigned int dpcm_capture:1;
 	unsigned int dpcm_playback:1;
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 711b2f49ed88..c4d80cad5982 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2795,6 +2795,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai_link_ch_map *ch_maps;
 	int has_playback = 0;
 	int has_capture  = 0;
 	int i;
@@ -2805,43 +2806,51 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	if (dai_link->dynamic || dai_link->no_pcm) {
-		int stream;
 
-		if (dai_link->dpcm_playback) {
-			stream = SNDRV_PCM_STREAM_PLAYBACK;
+		for_each_rtd_ch_maps(rtd, i, ch_maps) {
+			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
 
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					has_playback = 1;
-					break;
-				}
-			}
-			if (!has_playback) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support playback for stream %s\n",
-					dai_link->stream_name);
-				return -EINVAL;
-			}
+			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK))
+				has_playback = 1;
+
+			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE))
+				has_capture = 1;
 		}
-		if (dai_link->dpcm_capture) {
-			stream = SNDRV_PCM_STREAM_CAPTURE;
 
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					has_capture = 1;
-					break;
-				}
+		/*
+		 * REMOVE ME
+		 *
+		 * dpcm_xxx flag will be removed soon, Indicates warning if dpcm_xxx flag was used
+		 * as availability limition
+		 */
+		if (has_playback && has_capture) {
+			if ( dai_link->dpcm_playback &&
+			    !dai_link->dpcm_capture  &&
+			    !dai_link->playback_only) {
+				dev_warn(rtd->card->dev,
+					 "both playback/capture are available,"
+					 " but not using playback_only flag (%s)\n",
+					 dai_link->stream_name);
+				dev_warn(rtd->card->dev,
+					 "dpcm_playback/capture are no longer needed,"
+					 " please use playback/capture_only instead\n");
+				has_capture = 0;
 			}
 
-			if (!has_capture) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support capture for stream %s\n",
-					dai_link->stream_name);
-				return -EINVAL;
+			if (!dai_link->dpcm_playback &&
+			     dai_link->dpcm_capture  &&
+			    !dai_link->capture_only) {
+				dev_warn(rtd->card->dev,
+					 "both playback/capture are available,"
+					 " but not using capture_only flag (%s)\n",
+					 dai_link->stream_name);
+				dev_warn(rtd->card->dev,
+					 "dpcm_playback/capture are no longer needed,"
+					 " please use playback/capture_only instead\n");
+				has_playback = 0;
 			}
 		}
 	} else {
-		struct snd_soc_dai_link_ch_map *ch_maps;
 		struct snd_soc_dai *codec_dai;
 
 		/* Adapt stream for codec2codec links */
-- 
2.25.1


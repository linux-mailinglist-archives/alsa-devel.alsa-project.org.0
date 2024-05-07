Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1DD8BDA31
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 06:34:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7236B826;
	Tue,  7 May 2024 06:34:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7236B826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715056450;
	bh=zPloEHG8cVxN6AZN9hG0OOlwFHMYH0H4VX0YcD8JoSI=;
	h=To:From:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZWwbYCyZsUlRA6Dj+laoAkq3/S0l85h7ogMQtvAwOKFFKid8wYhrWKq4hIn74krYn
	 hWEbsaZH0QlCN/kv6ZNqe/dwGN9fylnZf/ujmeXDsXdmwCYP61yK3z4C0FXnGDd3g3
	 eT76Z7Snz9SJGqQQ/qUeEDqB9IgtdnB4K80oQo5I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7B7EF80571; Tue,  7 May 2024 06:33:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB45CF805A8;
	Tue,  7 May 2024 06:33:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0264EF8049C; Tue,  7 May 2024 06:33:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.9 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5B5DF8024C
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 06:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5B5DF8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=eJf4M5u2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrXKPYIKECvIXYKXRVR8jEDm/2yQ04NZe5iE6yDjzyAdif8FP0qNEBT774yXf7Tdb+ibERd4p567lQPlevvQFSG1+spnPbtokl1xnrgVL29PiwyqPjwQNbPWjb74s+9BAqRA3rCbRboxIaQIlaxJPiTzWOFcw3a+GKE+7JaGNzl6GXf1ok4ABz84D9ZuzHIfJInCD0LSo/F8DXEtLQWUcrDLxXJQ80CPkM3snGGC7/JmRnPSDrkWgcYV0Vcz4oB0BzY4uv1FGuIruDBC6kvoeLMCDPB7up4SzHipgx/sC59Gh0Un7qYZL3X2Ng937/P1l70BKMIHoPdR3YxiGD/rPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFFIuhW5v5taXm5HOw962Tk3ElZwJ087+YZzDfjhOsc=;
 b=P5kuUS5FdcS5VDlzJ44Wsj6nOdE1yn609K/6sAnGn55SeSv1+QntvqgZAT5C3e/yyBB1gf2qefp6NF4nFAe6GVk1FH7Ly97ROyxwLVXEXYlKLzuk8GxrJNmIMB86/DBE/TTs2ZRaw0vFk1oTA0kYNdVk7hJdYAcfKAa6TIk0L7sMnNGHFaaArDn2jmp7dohHZAFf84jc+RVyq0FcxaM28wKkVM/GWdg+TNJniqNiRi06FLxU1lqI4tGFup6A+oGnCz5YzDaOPsPHKbx9YNMrAgqg7UF3aNVd6ZDxnyPP5bTzsZAz5ysxvaGlvpTmN6pt00kIYuZucpsOWFbNN/cyNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFFIuhW5v5taXm5HOw962Tk3ElZwJ087+YZzDfjhOsc=;
 b=eJf4M5u2tf54eeeX7tlvLCCWinyAA3vvkaeE3mQppl4GRcqLNcKSHubD4CMaeene/skzoYectcddadEXGaVGdFsbIFyFU5ZHyp5YbW+0SiUw92ZTVAIWrXy4sUYYN3DKyf2qbrLot4vGvG4c6HTKJ8qEcTFefwEZwNUrIKykFaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7092.jpnprd01.prod.outlook.com
 (2603:1096:400:c3::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 04:32:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 04:32:44 +0000
Message-ID: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
 Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Jerome Brunet <jbrunet@baylibre.com>, Jiawei Wang <me@jwang.link>, Jonathan
 Corbet <corbet@lwn.net>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Vinod Koul
 <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] ASoC: grace time for DPCM cleanup
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 7 May 2024 04:32:43 +0000
X-ClientProxiedBy: TYCP286CA0041.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: c313d2a0-6362-4cf8-04b5-08dc6e4ebd44
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|7416005|366007|376005|1800799015|52116005|38350700005|921011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?C6LDDm9bnCo883+ZSJor7MCbjwBvPYEl7Y5rKMiI/SnKdkhf2f6vUaJ6xmfW?=
 =?us-ascii?Q?rRb9IDUOQa3wjprFxKTcvEXcM+uo+oAGpkVfnM8tp3KlanVqgTbBFFDkqs5w?=
 =?us-ascii?Q?qvu7v5nKIubmGc+cHW6HCxgP47lxy1r1gFdk+soHNci7K6jICZ8+IaJy2COI?=
 =?us-ascii?Q?Vnq+XDfTlNjcX8ivra4QSy+yalBr9Nq7gB1TqQzQb4ERNCiuJsz5827YYNv/?=
 =?us-ascii?Q?0NJFUXDHKch783iHgTQgC3375EcLDvpyhJtIBX5aJyGXnS05jrp34lpg3S7K?=
 =?us-ascii?Q?jZPhvKNXcP7h9tRCT7i4RmLcZp38OxkZlRS9ngAItbQ2kOuPp6iCBiFGSjD2?=
 =?us-ascii?Q?vZVKC3eYHoKnBjXX1+EdHOXu4zPIfOQ1K8jOR1/g98dL4NluHHGXbXbC3oFZ?=
 =?us-ascii?Q?gJVh9rkP8d+4UID14oRtvIegmALEn7eG3faz8w8G2E2SK9h+xUqNaSe8wf/w?=
 =?us-ascii?Q?+UETZ54/Hw4uT6WgOutVN57cOnAjjT9lM2tXB67/XY2VSix7thJZ4g3kU7q6?=
 =?us-ascii?Q?Pkj35GF1pwVihnPkPJJCLcJYU/obT5+jX9E+fFA5DOm2XWFBH7j3Nh/DTHsa?=
 =?us-ascii?Q?5HNyKqp0lTEQVrUx6S+0l7KJC0AXfqp2dsbLQ+0YceRwIY5fii1/yUuvv+ef?=
 =?us-ascii?Q?nwiCM1ZjqQfAlPaakaj0ETdsqDmusMJ3H5Ho94te7/Kn05oyVgGwo26WyrRs?=
 =?us-ascii?Q?Uf01fv+SbuyY0FoaHfqSeI+yS3rKcQe92tEepl/jeGWCdhQpOcg0FWcmJvzM?=
 =?us-ascii?Q?FD0+XDtpvnyC1Xyd3nbF4XjNAwRBbDGXn+4Zpv1Fbo+pURNgX4N7wuBsT3sl?=
 =?us-ascii?Q?QsBQO3fNiF/S0xNCZEEvVOpL3r0pJ1lK7z9dgHl6m/ykMpbse/ZqYee36WNS?=
 =?us-ascii?Q?h+NMx+DFfuyTCUjSQff7oMjjFhchL+8+1GtiyRxbp7xOPiH//kYo36ERjTNo?=
 =?us-ascii?Q?ChK7UNESYBsTZyliigVMaPORkEFh1OPSqd7s0jluAQXzMqp4aubbX8TvCgiq?=
 =?us-ascii?Q?6sl2iveE1eDuf6Wli2/vQ1+tfyBBcOOBaPImHnT9NBMOQcEjDBikD590dgyH?=
 =?us-ascii?Q?9oB2L0tX0arYHC01YV1n8EkFZdxs586AvDunLGAoTJCA6JR++KaPvDyBeLrm?=
 =?us-ascii?Q?OSPwCt1ia0KawdxXtjIeJLq+hJ9cHLNtEttQCL9EnJwAiwR1XNWrt6LYCUUA?=
 =?us-ascii?Q?6jO7P12kiUIBeieI0eH74Q4ttKwRRIwnSpIsbXkEY/zBtCk5Yiu0K34h0aRE?=
 =?us-ascii?Q?PKgGtY70Q1TT5hdzP7gK27cQdCbis6HiiOvrhLaazr1B/1zV3zNoPZ3bquEe?=
 =?us-ascii?Q?LC4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(366007)(376005)(1800799015)(52116005)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vUHnQ+dAJm2DDrSNjbs9Hi8wXcpi9qcFVosIrlSIm9MkX+nvw3BdYTnnMe0c?=
 =?us-ascii?Q?5OWSklmH9xd53QC2eGfVLuGniaFkXFOV0hHTvMaB9uzet9bvIDY6LhJYljlK?=
 =?us-ascii?Q?tWcgyavhvYOOQ8uOdXtc5wxgrsTTwHhXo7eKooXdrDpG01ylVoyGjlQVbYq6?=
 =?us-ascii?Q?tKfIfd0kw6h+dY5vXoexXd48bPy1cihQHYwrkJLaxkG6Ndjj+PNkX2ByWAvN?=
 =?us-ascii?Q?jLFlma0+LJs0LNUJW2G5Of0jx/utdtuHtkQRtceqmjTv/4DvkOvG5pAFe6uw?=
 =?us-ascii?Q?DFBVj31yixNRbnoRW9aMyioJMUwPTFWAsBpaAoLoB5oi7SLa55ViOKU5nTb0?=
 =?us-ascii?Q?GqByNTVcUZx3wBcaziWKaClrgXxa+kasA8OPB4CLIsfJZo0HRUlGGiKLyAZM?=
 =?us-ascii?Q?xS/smihVeKmehkOzLqz67QkcDKReR/qx8KpJQlBEBpeVq601lTZy7zVlZYqR?=
 =?us-ascii?Q?ADump7o/w+Jh02auyNZEFf6onW3tWYbDIGA2k1ZkRUQhInqM9Q3huUDWsacO?=
 =?us-ascii?Q?Sj2bUOwrnrDck9p0EQSEgGM0BsESJb3u6GpVQ+H8rDF+2W0sEEqRIPYknE6+?=
 =?us-ascii?Q?2+OG08F2O3h+8kCHGWKI0kjWKb3BleTMq1WnP60GpqbwL9OFRuwmhNvsB0qJ?=
 =?us-ascii?Q?javZRtPWvTmy/mo+5wCNh2/pvZ8+dgExaEfWIozaxWsHMcXlURxKXfupnQMB?=
 =?us-ascii?Q?tXu/jngy3iuJfgAGxX+QmMOD2z0Mkx/ePxrxc1IFCTIEb1yq6+VsjgnO5i3s?=
 =?us-ascii?Q?F0d29/4KImLhrF2p2IgeXkcFAvGjhIZInlCZ4RjPhk8uBNNj9IaMeQEmKqM5?=
 =?us-ascii?Q?B8caXEx0RUWG3rkdMQACoviVDkTXstMQTyqIsX4WQOcVTHdbsDLJJEnEmp4R?=
 =?us-ascii?Q?Hl3CGcn76IGDI91zLqfyjTxE1YJ2mBITR7+GNrQNCCf/kCp6M3Gp2jch8cek?=
 =?us-ascii?Q?Vs9y2/T8THJKN2l0WCbzlLNzIgt+TsH/y2IAEAamYP5a1eFIiF51yp8yVATm?=
 =?us-ascii?Q?jyamkCNRZMUF1E4Oud7WSupCr2rf+cfW7eLx2hlXrcGXmaKIG8CTUZKC59mr?=
 =?us-ascii?Q?CLQYPwbLzCh4xI6t1O9VUFoHsoHXVtLVj1OHGKRL5VUG1NGk2ZlAJDqs2Z8D?=
 =?us-ascii?Q?b5oVQI1mVrlaYUmikmj/UwiQP8HKiQdo0ywXUBTX9d4QOOP5grJ0+SPsAE7+?=
 =?us-ascii?Q?S/DbRfXc7bOxvZSY9c8P4JZSclAAHjYy1ejoO7D4fO20Q+s5jiMG4q03h6VL?=
 =?us-ascii?Q?qBJWCbXUwhNVNtWskQymNrTKvp2HOg6udKx1RF45SJkG5uCo7EQEKLLrtIkX?=
 =?us-ascii?Q?qZrx0ifsh1UTQ0tqdksjzwEUt2fCc/iEhYysIG81Zhri2AU4x5kXPb4zApm+?=
 =?us-ascii?Q?15t2Cwv2yWug5GzEmI87SPSJ2F8KrpGDy341xex8SC2mBRoh6sxYoHVv4K3j?=
 =?us-ascii?Q?bQzBNt2m1bjfct5AHpDp7JRw+9lm8Xi/eUK0lKrZQB/9VXicCE8DE2htDZX0?=
 =?us-ascii?Q?gqq34xWovStN2xRYDLEeOvG3yKC1n/S1xUO7Jni9ChUyZlWmEgk7+o2qlCzo?=
 =?us-ascii?Q?AXMLkOASqmRjH5gwwgxn3dFWc3SecpIaL0gqP5SE0/V0EV+44o5fmmk3/LDy?=
 =?us-ascii?Q?yDv/IfjcYpn/1CEZY1DOYdk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c313d2a0-6362-4cf8-04b5-08dc6e4ebd44
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 04:32:44.3178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xG9m9BsW6VdPyOJWGBoQEwmmKKFwQg0vJHkS8V+MXO/wiQ+RSoidfFl1QwdFBeEMNUjk3HfTCw9wy7n8HmAXmjz8v8GezegY5qJF3pJDG5LUwKO+VJ5pI4jvKk+10PHY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7092
Message-ID-Hash: 6HNVUY2JMKTMHPZZZRIJM6KWBNNJW7XA
X-Message-ID-Hash: 6HNVUY2JMKTMHPZZZRIJM6KWBNNJW7XA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6HNVUY2JMKTMHPZZZRIJM6KWBNNJW7XA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, Pierre-Louis
Cc each ASoC driver maintainer

As we discussed in [1], we don't need to use dpcm_playback/capture flag,
so we remove it. But we have been using it for 10 years, some driver might
get damage. The most likely case is that the device/driver can use both
playback/capture, but have only one flag, and not using xxx_only flag.
[1/3] patch indicates warning in such case.

And because of its history, DPCM has been checking CPU side only. But it should
check Codec side too same as non-DPCM. Some device/driver has been bypassed
this check. It should be error. [2/3] patch indicates warning in such case.

Because dpcm_xxx flag is no longer used by [1/3] patch, 
snd_soc_dai_link_set_capabilities() is no longer needed. [3/3] patch remove it.

These adds grace time for DPCM cleanup.
I'm not sure when dpcm_xxx will be removed, and Codec check bypass will be error,
but maybe v6.11 or v6.12 ?
Please check each driver by that time.

[1] https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (3):
  ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for availability limition
  ASoC: soc-pcm: Indicate warning if CPU / Codec availability mismatch
  ASoC: remove snd_soc_dai_link_set_capabilities()

 include/sound/soc-dai.h               |  1 -
 include/sound/soc.h                   |  1 +
 sound/soc/fsl/imx-card.c              |  3 -
 sound/soc/generic/audio-graph-card.c  |  2 -
 sound/soc/generic/audio-graph-card2.c |  2 -
 sound/soc/generic/simple-card.c       |  2 -
 sound/soc/meson/axg-card.c            |  1 -
 sound/soc/meson/gx-card.c             |  1 -
 sound/soc/qcom/common.c               |  1 -
 sound/soc/soc-dai.c                   | 38 -----------
 sound/soc/soc-pcm.c                   | 96 ++++++++++++++++++---------
 11 files changed, 67 insertions(+), 81 deletions(-)

-- 
2.25.1


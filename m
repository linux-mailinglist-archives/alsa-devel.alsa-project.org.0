Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FE88D42F4
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 03:32:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DF88B60;
	Thu, 30 May 2024 03:31:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DF88B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717032722;
	bh=nGlJC3NRFvPRLyPdzTHaMz8kKcV1mCanIevL04alEOg=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Zj6wtI9hCjzSZ01+sA6yXuBYWyyPtuF1lmeSmlMtsyFa6E8Jm/oWppSXTS49JYXn7
	 3mSn/Krl4YMzZeq3gmg0HTESp11GuUQ6XTcNTR6z1uGhi5ZDfLdOqfIfsTXqhzABi7
	 R1m2UeN5iHKImAThKNPzf4+rv+hjsoi5IjHzwy4Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2840F80683; Thu, 30 May 2024 03:30:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E895F806A1;
	Thu, 30 May 2024 03:30:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BE43F805EA; Thu, 30 May 2024 03:30:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D551F80675
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 03:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D551F80675
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KBuNglu3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DcplhK1QpAyL7gQ86bXameeDlaTDfE43T4mWXrPb6a/ujQuLwUhEla7brBEeu9KLdmU9KeNdTnPdz6zseINrnJJ4cUZq1sV1TcBIzkFZN39cO5PzZzFZ0CrcYpr48WdOXSXrO7UMy0nKJC9bAAXSC49/RBN+Btl5lwvT2pTI12/SsmoOQ0bFTMfSRSf2cPOVI5ldK1RwwBCfMzMBJ7GiKO3OFi6kqIUOo+zhysxKfdW6CWKJOVHZp0xTukBmd070IgqDEWijwU7z2ZW8x6lmEnauAg3FhnBCtcyVdNEZD6vedRkgc2CFE8A0HE2XIezgx+ZHYVG7LnlsdZdUdB2Yog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lh8lWRfilzAQFcaPjos444msvngltu6HgVlL1D8ZqLg=;
 b=UGX77PIj5ou+FDFgQMTYFEmGU1emNRc8Jezxz7EfKoQure6QDrv3tALvDiY7CmHJbfWi+L27qxZftWc2Yx0iPiUs0x8Tm9uh4u+waHMerLtyLvpBH/9MWRaGDfn45hQaxMOIjmWl6khz4hwPrjhwsZjft7AQ4pXQAJBCKuT+6W5K8pKRdkBUWwpX00HtKLT/hbBp0iPx5tteS1RikbIsdbn9xf3+bgnL/aymEkWrNVq+L84cvY82qnlCVjVZtjH+cTtnLAo6zRgnLL+FVgwJIRvYWDvmlJsEyYxRL/T9TTc54SmTaGdJ8C7OJ4PckSXPCDzQNWE97L66QoAF1+zDTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lh8lWRfilzAQFcaPjos444msvngltu6HgVlL1D8ZqLg=;
 b=KBuNglu3AI/fyQ+HZU/UhnxXWLtp4wlBz5n7h6vMOGQUyPNe6ghKNHiQRokE/p/NHGeogaix7RnnkfuIh+fLGV4bnV+ojY5SYaZIpw3XOdGG1OrTcMJqHB4TILalQ9ht/QqOlD6DrkrHfA9RdG52Rkd7ZZJHtPITnVc5oJxT0fk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5524.jpnprd01.prod.outlook.com
 (2603:1096:604:a6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 01:29:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 01:29:54 +0000
Message-ID: <87o78oozn2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC 11/12] ASoC: soc-pcm: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
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
In-Reply-To: <874jagqe9w.wl-kuninori.morimoto.gx@renesas.com>
References: <874jagqe9w.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 01:29:53 +0000
X-ClientProxiedBy: TY2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:404:56::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: d95a24dd-e504-472b-8e28-08dc80480269
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|7416005|366007|1800799015|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3M+1AyifHUx0y8igD/qFdLULz+uxxr5GvDhXZ6mlKRsAriZn6hEDOQbsEgNS?=
 =?us-ascii?Q?F5n/lMKlAyeoZjr0+tYEJhAqxd2e53ZLeZNe5uwfNp4/Syspj5jPg2+x22Qi?=
 =?us-ascii?Q?6kfwvNnqzHV1vcd/K48shJMnIVjOR03KAt1LxQjzn6B02qKcBYofvbYFLnFY?=
 =?us-ascii?Q?S5+S/4ENG4EX1mvJRHHwQEANyABGDwez3asy+ayGrUnEAYqqU3ApjgC3kpK2?=
 =?us-ascii?Q?Jp57rApo5Iqa7jgvqK7PLU34fKWbmitnVjHjRugHS3a6vp+vfafg1O0BWZgp?=
 =?us-ascii?Q?3xaYR2EiGa+RwYmuob7IbnTDr8LlN5tZ5wVWIdYPLJf1D5wm+pOGLggbWR/T?=
 =?us-ascii?Q?8NFiJaxigtxaFSML86YKu06dht5h12f18sW8E2ScrR9C1SigOC9YJ+QjPXcY?=
 =?us-ascii?Q?UtLPU5MXnAlViibS7OcJS1L6sHCWdCz3cLlWKitZd3VfHNsjOz8Dt5ntqtST?=
 =?us-ascii?Q?GRMAUvHTO2iZGzb/VM9IPFmJE70BH9LUoGumr3kab7JYkMzThhq6KcAR+KLc?=
 =?us-ascii?Q?+grIa2sAQTjGWc8x0DGofIAp+LUkxJsaPp1WyieqPf0TRZNZon6J2yyn7nlJ?=
 =?us-ascii?Q?Cs54fWm07ey0hVNReSnd9n3GO/uxbXVCHYnttv6p1esr5WoVUQAsxycYJ995?=
 =?us-ascii?Q?H0I6qC1iGJ6qhpYIsPb52gS5776l+Y8u1l0nxK1xx4PupWLpMFUZUtWow9bq?=
 =?us-ascii?Q?6SE0D3SHb735l1AXcOOk/dd3rE+VRLJm5NTeVk7POnxnB0CFkpmQu78GNqAS?=
 =?us-ascii?Q?YC3HSFWMB7YV3iiTnaWoZTGKCQXXc1c7Mu+hM6FCfvgckOFswNf6kqvnFy6j?=
 =?us-ascii?Q?PGAFZVdFYcf95SJscKHX//K6LtCUjbvDl5k7ouBg+wlZuhIwq4BPOTNC/McE?=
 =?us-ascii?Q?Z3TJzapbG4q4mCuHs/nQnBtg8xaIKuNVGIlOJ1m7hkiZPg4N05PIHt2CIJso?=
 =?us-ascii?Q?d7i0I+cp0M0VXPy7sAhRfIwMA8bSSZYE+po3s1iZzA8Uy132KTU9hpq+7KLy?=
 =?us-ascii?Q?Luw61Ty/8+w6I0vocluFeqkZkgXTKu8i9tRTtncFCXiw1lPtWfJOTKgwbaFS?=
 =?us-ascii?Q?CcY4sVD4J0IP+/mQqHQTZnBc/Wd/pGbTiZJVwR0NUwtQaIHiwCqekJr58nto?=
 =?us-ascii?Q?+UYSYcMT1bVI+4tTiq5wPaNYZQWd4tSGu4F5ndERJvWLYizxia5ozF91GGT5?=
 =?us-ascii?Q?1lgQm7fOALbeAT/nh480oJSD6LHajB1wvbuphLx6E6Bbp/mMFulMjEULDjmD?=
 =?us-ascii?Q?2/5n+vx20A2JoSXk+S0y0CHHirnQOK7ePH7gopGBVg6GrK/Ova6HcDIrcGf0?=
 =?us-ascii?Q?QDYNkNL4ORMIYeBxwL/luvMfEorDytNu8kRqurVMMwFw2Wl3b7W0kLjHzZ2M?=
 =?us-ascii?Q?EJjdJoQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UJ6D9bWLfpru7kS2mjdk4fw76TyNmXQPz40vGDSRzsYBtE6TJzkdJrgS32Kw?=
 =?us-ascii?Q?bMU6mvDeqirPhZUF4Q5dy+Gjv0elwSGAXQNsKV169xbpJEk34NW3kS3yrI7R?=
 =?us-ascii?Q?KpHSw/17XUse3ChA72MB2/tziKA+o9rNvBAd724uo/KSr0/rnYk2/QBOIP/m?=
 =?us-ascii?Q?1T/vwYW+YWsd/SrsHTKO5WtUaOq6z+r8YZtw1S6In9VZNKIOMJcvao4GVSy9?=
 =?us-ascii?Q?U0tiE+SXYUgosNpLocXUIjnNLGNvgWn5rpQk279sTpdubo18DTil8l2dpe02?=
 =?us-ascii?Q?Sr0wxmGwHsOsGvZfiZ/qfYBs5eMQHs6d0VvjX+Yq5Dp3PESGk+dcErVAefK/?=
 =?us-ascii?Q?QKYkdJgh6TW/cohQjcBzUULM0jwVmIEM7a0KshiFgTI5XnyvaWYhFcgDtlwX?=
 =?us-ascii?Q?9rU5DOWuXqcrzP5Ql75HM+T0b3Nc2SLNWemmeSSWiYYs68yjGJM80dVGlkll?=
 =?us-ascii?Q?e6o2pSwjGCdE2RwvL+AxGIo2GovCQYFOzreWeCLqWZlAMNgMSUqq97u4USan?=
 =?us-ascii?Q?L7e9YKw5EteVLJwtMeFOt24OlFLNccqh1oTieQDtvv1VTuIbue4isD/vC6EB?=
 =?us-ascii?Q?JTqJb1x9H0J18856X4JwwqeiyOvXGX2gL7h8NjOIQi1ERje0mWLYXKagc65a?=
 =?us-ascii?Q?hK3kiIj9WjVQnlkep5VfYfNNiMnQ2HZ8Y6G9Q7mGvmA8HjAd435kMtT6Cyre?=
 =?us-ascii?Q?FRy6S4sCgHvxwme1lj/zmaTErL9sSY1n4g3tfMN6Yhdg2+1vuiYtnVhn4rHW?=
 =?us-ascii?Q?Q2kT5FhXVmabBF0c7o92kYuNwdc7dW4Sv9kjPKRjaUQrrOJ857ByecGnyW3Y?=
 =?us-ascii?Q?r+MeNwEZzq6vZwXN8V3d7kkAGoSGiR1NqfPdni3meipnZl48ke4Y1chi4/Io?=
 =?us-ascii?Q?SH7dxDZkKfw6NFXZRhV/pBNljQQIROVjoMT4E2qLpKKHn9QeuogOak1u8RPv?=
 =?us-ascii?Q?t/mHxLxGP2U59NNsijDZ0QQ2JZzpBoz+VMSfHYLfqSpZrOIrqRcqFC87CJEb?=
 =?us-ascii?Q?Ni63kYE3mmsL9dLw3mhBsrYvcIdaUi/v59GYmeuVjCEWd5FZdjIFmxKRZBDw?=
 =?us-ascii?Q?t0rUdAH4ue0CRsEOVJbkUvMd/OXOPWQpHgmGgHgOwtUAkA7Xw1S9XSkYgXC2?=
 =?us-ascii?Q?HOBCgsxNGsOKvHC3E0cMIfxIhmFWz6UB+sHmSg3JaHzDVVboUomHNMtHH8eG?=
 =?us-ascii?Q?SavCOxcbfIVEeBMg0yMRJE0wQZnkU3KAz8gGLAKYbPyvcmSdnx1QiWf5iJ87?=
 =?us-ascii?Q?TnJP369qwFBfd0BIa9V5GSYyWiSm7Nitndt14F9GXmNhKJbYlbXqJo24fMcp?=
 =?us-ascii?Q?jU9OWt5CAval3Qp0J0k3XAB8/Bw1qq3dzWMapL3wpdANW5Cg4ussXwP0hPwl?=
 =?us-ascii?Q?T/8eRuPpy+I9nq+UjR9DNZ2LidiSI8NhwS2Z67L+C6elO2aaSwC01XBYx0UG?=
 =?us-ascii?Q?KMHMmNvmVBuL59YWjhKZO3KtYMx4G2fHuo0Ydr2P5GU9FyX0th146Gg/r+jp?=
 =?us-ascii?Q?wHxzzi+kLTIvl7LYav/Uh+cjL96mY+ICYUt9gkjfVgsh2+XzQ0Rw91/WYnZ7?=
 =?us-ascii?Q?toKZZXKXm0wEyosYrSwSL799CoSblxncQ6+ezMyWlR6A40jyzChH1++/rwHN?=
 =?us-ascii?Q?pIWU6ObVqnUWxmggcJwFcUI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d95a24dd-e504-472b-8e28-08dc80480269
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 01:29:54.7919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RZCHFXs38XWdqdZLRnmFlcbLEQh9Pf77TIiJcCYudg6//PmeBeAfyLzlCPdO39otN8ITOyUrA1FO/ODj6p2TiVdbkIViFHOZBhfvrhyH30uHY5z6da6dQFP2C8v1P8YB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5524
Message-ID-Hash: ADGTYW6AX76V4XCWQRQ4HJED2HPKI3CT
X-Message-ID-Hash: ADGTYW6AX76V4XCWQRQ4HJED2HPKI3CT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ADGTYW6AX76V4XCWQRQ4HJED2HPKI3CT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h |  5 -----
 sound/soc/soc-pcm.c | 33 ---------------------------------
 2 files changed, 38 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 2a3da1d913776..3f5c5c3c90bf1 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -815,11 +815,6 @@ struct snd_soc_dai_link {
 	/* This DAI link can route to other DAI links at runtime (Frontend)*/
 	unsigned int dynamic:1;
 
-	/* REMOVE ME */
-	/* DPCM capture and Playback support */
-	unsigned int dpcm_capture:1;
-	unsigned int dpcm_playback:1;
-
 	/* DPCM used FE & BE merged format */
 	unsigned int dpcm_merged_format:1;
 	/* DPCM used FE & BE merged channel */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7fe5ee3bcfd4e..81b992d03594b 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2817,39 +2817,6 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				has_capture = 1;
 		}
 
-		/*
-		 * REMOVE ME
-		 *
-		 * dpcm_xxx flag will be removed soon, Indicates warning if dpcm_xxx flag was used
-		 * as availability limitation
-		 */
-		if (has_playback && has_capture) {
-			if ( dai_link->dpcm_playback &&
-			    !dai_link->dpcm_capture  &&
-			    !dai_link->playback_only) {
-				dev_warn(rtd->card->dev,
-					 "both playback/capture are available,"
-					 " but not using playback_only flag (%s)\n",
-					 dai_link->stream_name);
-				dev_warn(rtd->card->dev,
-					 "dpcm_playback/capture are no longer needed,"
-					 " please use playback/capture_only instead\n");
-				has_capture = 0;
-			}
-
-			if (!dai_link->dpcm_playback &&
-			     dai_link->dpcm_capture  &&
-			    !dai_link->capture_only) {
-				dev_warn(rtd->card->dev,
-					 "both playback/capture are available,"
-					 " but not using capture_only flag (%s)\n",
-					 dai_link->stream_name);
-				dev_warn(rtd->card->dev,
-					 "dpcm_playback/capture are no longer needed,"
-					 " please use playback/capture_only instead\n");
-				has_playback = 0;
-			}
-		}
 	} else {
 		struct snd_soc_dai *codec_dai;
 
-- 
2.43.0


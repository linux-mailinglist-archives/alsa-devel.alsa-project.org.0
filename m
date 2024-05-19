Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9678C9D35
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 14:28:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A39ABE9A;
	Mon, 20 May 2024 14:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A39ABE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716208103;
	bh=KjYBOFXP3wzZqHbA2okIY86U55SER0DQJw+2vC8sLEo=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kVvsMTeU7w0YAl1QHqyCC2crKzE9YL0uvvDzM3bNkG8yrH1sVul7KDAfVjvt05tFi
	 LHNlqSqMe0d0jW8H6fYgn2qT83+jaH8eDbSO6/pQ0IoRtsI+RgVWPotr0ph/aRYjRt
	 twauzs2pDb0B5hQGR/8E1LoRnRMDu3qIoUxaVw6U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31D0EF80624; Mon, 20 May 2024 14:26:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6DB8F80637;
	Mon, 20 May 2024 14:26:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE4CAF8020D; Mon, 20 May 2024 14:20:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B74DCF8051D
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 14:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B74DCF8051D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MwZOfkKP
Received: from OSZPR01MB8402.jpnprd01.prod.outlook.com (2603:1096:604:16d::11)
 by TY1PR01MB10723.jpnprd01.prod.outlook.com (2603:1096:400:31c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 10:39:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OF7grW9eG2xFS+gBAs4BKmte/lp+8TP5TLeguXRIvDx8W1zkCjGQhutqWY2LHSDj24BSF6508WLgOLa2URWWITAC7G784vv+5kfnnge0la7WcGJ9NwQb5hLBSnODnYO+5N8gPtjXxF536l2BiY/6G7oYPGlv9M9+I5Ovm2A3dfik36Lah9Sb/JLvDeNg/A58dqpsbHGHUBYSwJF7Qz0vouar17ou7AwTl8ickjYx2mVMCQ9lMW+jg8ll9A/p5gqvGAzumtunfAHDAl9qaswkYOjOYyHtX3MGLDS6dFJL4uoItwcwf/I/iJ+qQDqqTzM5sR+gjZEowhw/R5EOwIfh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nd4sNPbb6DSYIUfpycVWGmzJC4L67KJQJEpfIBV7B/c=;
 b=LI9ety7Q4loeiiBu/fFb9hTUmlt52ujp2X9ciBwGqBlwaE8EerNF5oxZqmOMxyrqTNZF+b1QYxVh0hpL5gG33DGkdlHRVMZisZZ3SmV4I6Fk3zIejB4vKjlBE2fowRy4At82c11oMiGlRJNcPWFoIZDKHV00NyKCLpO6BF0pH6aXrVClYnwsWVqBRstA+jCID8qYd7LNYf2R3rS2HJAqCINbraYwtskTcWFgLYrxOyWxYz+gXao5Vi9/3MY/bAcdQJTBqIIWmw3OVdtgppGTZwmYDtkseHnsZSmz3muRfpz2IfB73Ev4pB2fIvhEaEVnMgnZshNRrRjsQcS2/EQkcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd4sNPbb6DSYIUfpycVWGmzJC4L67KJQJEpfIBV7B/c=;
 b=MwZOfkKP5CrQAb/ac4Nn/X7m82KDtAAoh3rqt0gpYpN5LwmEqHZaEGSxxHDoWLzQnWJA912LXDp5PHLIqINEF4Vr27+A7ojTM6fUGQIlU6nAsfJMtDIXQ/M+xlf4p86dcksJ6/k/Jp8bQf4CJOqZfMlyRPF6O1JkguUQQaMCgBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8402.jpnprd01.prod.outlook.com
 (2603:1096:604:16d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Sun, 19 May
 2024 23:31:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7587.030; Sun, 19 May 2024
 23:31:08 +0000
Message-ID: <87le45e5vo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 1/3] ASoC: soc-pcm: Indicate warning if
 dpcm_playback/capture were used for availability limition
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
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
In-Reply-To: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 19 May 2024 23:31:07 +0000
X-ClientProxiedBy: TY2PR0101CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: 
	TYCPR01MB10914:EE_|OSZPR01MB8402:EE_|TY1PR01MB10723:EE_
X-MS-Office365-Filtering-Correlation-Id: 01440fc5-2631-45e6-cd70-08dc785bc281
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
 BCL:0;ARA:13230031|366007|376005|7416005|52116005|1800799015|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
 =?us-ascii?Q?VWpyCHLnNAjyhbSTuMDIk2dCvuR8DTEPKAnhtvAtwsT8/xyDT28HPvHcjvPH?=
 =?us-ascii?Q?WBfZCKEkiDRoIeoB9mmlk1+3pq05Keklr7IjEx6iDHdPq8zw0Df28/NIHJ8V?=
 =?us-ascii?Q?QrNx1kaSBK3u/9fHZxocHQtKElPknbWN8abM88OYOPMv7N8mFNnSvj3xv7fn?=
 =?us-ascii?Q?WN8gXhLR3gsbWJSQu0VROru+hJ8UrJJ1MskNsGM7diqmjOKjiZ+C85u1K24V?=
 =?us-ascii?Q?AKyaC19PgX1rWm4RHdrkdlDPtWUwEbyOVrOUF2L1PVVXdHzU4wdcCtuq0SRV?=
 =?us-ascii?Q?2FU0/tsdl1WFN0vghBpltDRF9cIwbXa9DleV/VQBIHIrxUC2xO/4MSYDjqm3?=
 =?us-ascii?Q?b0kS2tL4+oyrg9mc0V1fB0QVHVSX1VE3n3dcr7H6GBQIyDCuGSmEOA2zoFiF?=
 =?us-ascii?Q?CB7ZGBupOaRaYturlfvfv+NUzn1xvtEdi+gpzyWNWxNQehLEi37Mi86HxtQs?=
 =?us-ascii?Q?lEyg3VFqy6D+aJzAQ3SmZHWxS8RdBMfTxirWgoaV/uuwFHQyQCIfoOtyayNq?=
 =?us-ascii?Q?oITeVZF3ARh0R2QFxYVFJ8yE7c0cM0YNCJMfokrUNwXs9O+kwxQcV04nAzRE?=
 =?us-ascii?Q?ANaFlmoLHU6AvNe5WhNWCa0p/W9vSwsOYY16OT7CUde6Gd6zSWJOgMp+RuQc?=
 =?us-ascii?Q?qXtruQUEkyvRqF10+a5yFh2FMHxAqmKkKcD5z1YPWMCdWlxz86SHsMGPFbGy?=
 =?us-ascii?Q?1vS/fdydrw4j/oJfBxKzko4nfw6tcQZmJNqbSLCpIIjO26Wr+wBgnM66Lxzl?=
 =?us-ascii?Q?IkcnfZSKj0T4fmvwbqFt6PSoYbnCkv+piO9eLYvgKpD/w+i/rYuQEDRMHG2I?=
 =?us-ascii?Q?wUhozB7bmjTMKV1aCoNhxA8hdfOcsd2wh8MKyOPS84tHPCKOo94uVpJ+U1VU?=
 =?us-ascii?Q?Zsb5amtzVSSzwUN0ZCd89o7bABVGskkSWYLkWulrxnfq0mQcA1Mv7aWWDl/4?=
 =?us-ascii?Q?1gy9J7EPSO97E2r3iLvQGSaE7yMLuJ71dRZM2FiNR1AMRYlTR+Uvu43+Y/9S?=
 =?us-ascii?Q?qmGpUB4+lC3SWMwX3wDSFqAHAEM1NN4U/RRA11GuLEe/hWFNAw+xYNBHrb8r?=
 =?us-ascii?Q?0rd7hQ35OY6Jy8V8l9qLw/DU4l8f0/V+Jb+a5p1WwKZ6WT/hq0eFa0id4d2Q?=
 =?us-ascii?Q?31h11Dv/dmHHYjZGmqnTj+MX6gj2tJkYDqJhby0nY/xyKJVCXdCPwk9YA2va?=
 =?us-ascii?Q?899lp1YNw/RKqB1wrgNtf7mgyTbjj/kOWlxJGQsbfyY3V9v8hYL+ghVRNdr6?=
 =?us-ascii?Q?biSUmdpNzRcZwT+bVfwq+e6p0cFrnXvBiu2ge0At04Yf5xYG30F5ULiFO4TT?=
 =?us-ascii?Q?hWY=3D?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(52116005)(1800799015)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?OtxeH6PGyAAEm8VIkhM20XW/EJOFugNRVcKU43ZpBAoSxxhzYG2GOeEe0cWD?=
 =?us-ascii?Q?98wA3h1XE+OJzUUXIhW+upP4v5jPqe3YSEPcB2GKvTLZeYnYXpfT64ZhXqhw?=
 =?us-ascii?Q?9BbytsIlvv3oc0zuoq1/KQaWpu22TRAQr8W+d0BwCaIwHc5FjyEpYqF/hZsf?=
 =?us-ascii?Q?+iOMDZ6uz9tQaT6BRTcYy2eBlEVSmzD4HEGOHVGPGmUtIQoVSCdaDc1MFl+/?=
 =?us-ascii?Q?8aktrO/7xFa5d3wXW7rmE1qFEPkEJmkJLEeiDYghBXjsHqDay09WkSxR0Rgq?=
 =?us-ascii?Q?xDehCcQj34pwf9qeyto8YJylgoL81FDnYAh/P6kUxFT5HXmxpOJcvTxN2Nch?=
 =?us-ascii?Q?B9O2QtlGZMKwb7RYLmaAldfM9Mpm+JtFR7Hdb4SSqNWaDhPjo78Postxvjbx?=
 =?us-ascii?Q?6yZGKX3NjLc/HAB425CDIM8UwAGduUZByPuMBhIl1UAapOwzAJDCri3Oak3d?=
 =?us-ascii?Q?BN9PUeqniMaS3jsn5lg9PzmRlfyYNB2Y1D3IqLEmWpoRkrGgf64ylGT/TTzo?=
 =?us-ascii?Q?TYZrxoWzoJ5LQk+gAKVFu6MXy4SeLAcTs27ILsYO5gtuDsqchtSJdE4HLr0i?=
 =?us-ascii?Q?wEQZlTaqQyZXRaThrq1XSZT0zce5TWz/+P+dDmkK+CrOW3vLUI/idRqPRSgM?=
 =?us-ascii?Q?M+zLzCNg9k6lHKJq7++iLwWEMlHbK+qaRnb9zcTHof7RnGEWe+S2cmnMSgcr?=
 =?us-ascii?Q?Vc8gXQ5lKTfHFSv5PCyZGAKCM98hk8Akvf9IbbKFSINRJC2HfaADu+jkb+vB?=
 =?us-ascii?Q?te04PYGO4+r1qrDZZl/Ey2ic7vFBXSUZtns01KDjiyG7ntIRF18nu3mpwB9V?=
 =?us-ascii?Q?WIHWiKUmwK6dot8bKuxDvYbqX4vHXS0DFtRVk9VIwVdK5UqDyR8nDadvHGwU?=
 =?us-ascii?Q?o5HvVQui9q321hO+ZLimqMEz4Lmh2Ltm5l31buFB2rPdu+wlF9GWZdnkjdM+?=
 =?us-ascii?Q?2vmERW6TezN051xFbP2+vkTsk1OySSjOXSnJp701fo2jm83i9JpY2SiLYBgM?=
 =?us-ascii?Q?g7t3DVAtjUURHwunah06RauEeavbYj6Ljx78MJk3GKecI1YXfSYk+8IpAM35?=
 =?us-ascii?Q?+07OOMb4LmEiAiW8nNLw0NOBT+rnWIEF0I7yjn/2Jmixvfrl7ewhJ+bVcoQ1?=
 =?us-ascii?Q?EcbJzoZqfEf0fSn2Bi/7qRIwlCvcb6p7e/f26nHLBI4tGCCCUYYqu6OU77+8?=
 =?us-ascii?Q?GlnqGO0SCiByiQFV14ARR6dNl4Av9gEo3XLBVFKCFKHQPI9t9nkhUVf7a2z+?=
 =?us-ascii?Q?EQcpRTbQeObI70Fs0uZca9DwGib07JxlBcQmCpqDvhyebRIJqUEJdju0/PZX?=
 =?us-ascii?Q?s4Qi2lQ8I37UYMyNtkuC3OTwsI92bhE0EOR5oUQGE6JRnvOmNHcKfraWNGaC?=
 =?us-ascii?Q?QDhIHCeGmklGLhtHcjPh7vdc9kzbjBuvP5XTi3bcFrktFa/MshuCyEmQ7IUO?=
 =?us-ascii?Q?jt5hRvU2fXr0jO5WrF6IFc2V/9+wBW9EL53ns2AHae3/itvmCczPhOLtOZYx?=
 =?us-ascii?Q?mSoCvu2Gxl/VHHj2T0c04PCE5EGx2VD0AY8cuSY/u03atN+6+mnx+b/07oS2?=
 =?us-ascii?Q?6fMuoV5fn+qVROb/+yfcIYuQXm1zv4j9fEeBiMoNTxdM9H5mZSOFrqxiil5K?=
 =?us-ascii?Q?5zsvx0z28zHLQ1NIRGHroy8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 01440fc5-2631-45e6-cd70-08dc785bc281
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2024 23:31:08.1324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OtxFMfhaq1q76f130j4i9OPKKjJfVqy2VxYh46FrbjfeFpQtz0ZU+o3NBQS6J6BQhU3m4LOqHlHsXcC3OoCX1mZnoQkqTQIKKv6xcRE3D4wBFkEHSU4fgSJBP5kFE6Bc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8402
X-OriginatorOrg: renesas.com
Message-ID-Hash: 3K6M6A47PYA2S7UDS5KITD33KKTPRD4E
X-Message-ID-Hash: 3K6M6A47PYA2S7UDS5KITD33KKTPRD4E
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
Archived-At: <>
List-Archive: <>
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
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/sound/soc.h |  1 +
 sound/soc/soc-pcm.c | 65 ++++++++++++++++++++++++++-------------------
 2 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 33671437ee896..2a3da1d913776 100644
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
index 711b2f49ed88d..c4d80cad59829 100644
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


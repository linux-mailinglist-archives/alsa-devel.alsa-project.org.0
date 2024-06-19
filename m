Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E03290E0C4
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 02:22:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E45BDEC;
	Wed, 19 Jun 2024 02:21:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E45BDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718756521;
	bh=se4WcdwbITVFDokTGVdfhD2eqTW+zcMvrCXrgISiZrM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vJV2HZ4gQNNJtBmOdPiCyqO57TwKjPnbHLlOR/K22DZc+IdIO0hKqslfWiOdHAFtL
	 pYJr3CYlvscKUkv3vOs706hGFFZXLjY8l/SB8YuNIrZMPXDes06HQnWPUmZF7u08e/
	 6MMka/vcC/4v/GWvd6MWLD1fNS2H9So0XEz88hL0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8727F805A9; Wed, 19 Jun 2024 02:21:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C6BEF80587;
	Wed, 19 Jun 2024 02:21:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0423F80587; Wed, 19 Jun 2024 02:19:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06524F80588
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 02:19:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06524F80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=l1JXsh09
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+7OKzc0NFKdUjCAaBnzkXzmpEeHU6Xr0/jaL2+EsyI8+BIK+qb8iAoYS3XhM11gDTY+CZt49y0ssEiwnjw2Ik4W6gY7o2Xo3icm8XygB01pU2DYT5FCv/nMVOZKJH1R/qa6IsMKZm3y/3bAAefZe5TEyUzeA8DKXeL++sEPtCtLnt54ZZqGlxADocsUCiDpPQ10ciTEggLDS8UBYAVkoLTneApx5ePWy09GRotW3u1PyU6FKe87aLfeV1tCdh0J9vD6lcDfbjpclZx7nfP+cKd9lqmF7VCpmyDV6opFnXkN7qAsd8RzdBQURyvZ7gR9OwhRPID9onqDCdoMrOftnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdMd3EFoHmtq/QP8bndNVlYrUlJsRXLuagPZvm7tS9k=;
 b=Ooy/dgMf53QHf26X8sj2gOjBbVbZVtLwfG2G1f+486pyXDnZA6Wi74efyvQ+7wumvEVDNAUAbsQkFVKeTZOdTl/LgeaKgjnc+hmGSqowjDYlxXHSq/uTbsVTQGrWewXfPWE/0cYznP1ApdPJSraT33ysy+H3qvRGfQe8caw6uXSFeqnFSrFtjq/1hqqlis34ohzoyVFNmzvH7IJBAiGZMUhqH1VCygZDM+J2hQoDOcqnmSsKS4m8r4LhTdAbJm6nzxvIM+QrfMN8/Stikg6J8RvD+wZF+YN2eYGt4/A2Reg+j0isOc9eom85rfHR6PPukq1fOOIrz5+K0DEaILntfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdMd3EFoHmtq/QP8bndNVlYrUlJsRXLuagPZvm7tS9k=;
 b=l1JXsh09h5URJqm0CqqA300J+EH+j9hEHkV1kIpR0WmBFDbX4gA1xs8ASZXe3hsLPjClTJTQkp87rZzV2PW3j/9dT382HEQzsLMXf3hkRfb5xkiH1myK0zwsDyAPbWFkWfENGu+aRZjMe9ESUNar5/y4LOYpZ67jBtTiglKbMQ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11717.jpnprd01.prod.outlook.com
 (2603:1096:400:37d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 00:19:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 00:19:36 +0000
Message-ID: <87plsdwzqf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 1/4] ASoC: soc-pcm: Indicate warning if
 dpcm_playback/capture were used for availability limition
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
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org,
	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87r0ctwzr4.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0ctwzr4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Jun 2024 00:19:36 +0000
X-ClientProxiedBy: TYCP286CA0077.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11717:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb00101-c67e-4bc8-860d-08dc8ff5806e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|366013|52116011|7416011|376011|1800799021|38350700011|921017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QlkePzcijHtCl8uPAMo3mpZCbtoAIKJdscLHomArnc1VkDH9j6ZKT3UL4vIO?=
 =?us-ascii?Q?XaDt+rh9vpqbLkZ3TwejOOI9OZ3ZuAa+VxNqrq+2LXuCT+LNRNHMwV1wGs7u?=
 =?us-ascii?Q?fsSFg8vq3PfiI5NDprcY8LEJ5ewhKqHFEw0aKNb4AXRD6j9RVLJP7qZCyQZc?=
 =?us-ascii?Q?nTEJ0HT6QsC4DjtBnON6ALP7PjWJnBGuDxLc6Re8I6zVCrEERXbGSGqG4pJZ?=
 =?us-ascii?Q?BI/l5fl3Nx8Cvcgal/ZaEXkfS3jAhkXCGmmkqfkVQGsvfLXvsGtdN8vYZz8T?=
 =?us-ascii?Q?wrVoFIuZJQWV7ySkoHd+rJO5f9LhixMrXSIGCwx8XdYNZkN8kdzBAaCttYXd?=
 =?us-ascii?Q?Q4Yz6sYBw1RiGWo0z+7F9PFr/x5jTaeW9MIE2HsrcuAcy1f/rrSFUVr4CFRJ?=
 =?us-ascii?Q?6MXn+RKVE+qsksLImbAXp/hpE4vIznUFfCdZsY9FAJjyrRtJT9fvDxBAgNUy?=
 =?us-ascii?Q?DW/AR9QcEXtEWZE9Mf47rLoePJXmJCa/z1c8RHUZBh1bNxEm0mADpTgfjHkJ?=
 =?us-ascii?Q?N7/9BNjJDhu8e6jPBhxXQ2mI8O6M3j0NWMiLWPNY7wf8itV3tXqwo+wDndqy?=
 =?us-ascii?Q?Iy8mG5ANrsS6FVU0/eYHkATgPFivABoPPYiqgJHrkoQpN0NOoWhv+1+iwmV2?=
 =?us-ascii?Q?eoiyF2vsoylXySXtaGhYTb7PfHhU22j9rJo7zmvaBybswbfwrpX/wssEaw0M?=
 =?us-ascii?Q?8DHxx/TbH9I5UfhCWJRfZbIY5TGFGSVAEmfGzDn6FjG5z9AY8HxYe97XrGZs?=
 =?us-ascii?Q?KM2zRHPAfW94K1/IZwpUIMJWlWFhMhUAyTt814gi+UbhNZ6dRs6n1MSK9oj3?=
 =?us-ascii?Q?N34YTPV5zO+3rc3ft6raoUFlGVt+Ef/VenexNPXZ4BW4aMBxNGWn0anVJ45V?=
 =?us-ascii?Q?VfPihGBut7Z1hOvSkoApNEBKwo6+22ALLOh0IDSwovdeqf9eC23noy5aaQml?=
 =?us-ascii?Q?25HxC22LQH5hzGISWqYXzT8IgZAdCF+AY+LdJtm/85KYEqHAq1JpbDR7rDJF?=
 =?us-ascii?Q?9DFBw0CWkzX+vyhkD1/4Uz3x03rOKD6UhfA6bE8q39M+a5fr/grJ0qMe6Cw8?=
 =?us-ascii?Q?ENXDz4K9864XpwM9N7GASjk8CJcbxtI/Z0jFO8/GGR+rGGZeI/eVcmTNpduq?=
 =?us-ascii?Q?2Hmvs0BdYoRhgf+7sczGAizIZiHlh+Oix0tgYUXjuVnLHu3XK2ERMutPRqu1?=
 =?us-ascii?Q?3c5Em1bZDOqnHLdfdVazaVrYq3CZCwjLLcMYrzIaO6/6wAmOWUMGtmNvBamF?=
 =?us-ascii?Q?MN/7hRGerqfc277xbnMgpAglQJPGSsr+LTS0RNuJeJksreO7ekjcipV3SVab?=
 =?us-ascii?Q?DYCT92+BR7ocg9Qan00bwQEHtd7hkInBnhqMOJ7cdTaYPw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(52116011)(7416011)(376011)(1800799021)(38350700011)(921017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PskQuAB9X7LIOKpsJWRFcN7KTYp8a9SuCLX8TtnXE7GVtkuwquqto8QMpmhk?=
 =?us-ascii?Q?Sy2pDUyLj35h4w8Yqrv84EK/ZPO1qigL6pAD09SoRkIi6MM0dDBhwllLDaa+?=
 =?us-ascii?Q?b4IsRRtIP0AIkAD0Xb7IwYyX66UKh06Eb+NWf1ZgCG79DM/KzvE5406VuWcd?=
 =?us-ascii?Q?/o8PkOcSQp5wpxmnprwsFNAc+B9j2gYriC++JJixoZ1rSVvH9Q1G8Yl9Q65e?=
 =?us-ascii?Q?bsvp4rA6McWxwK9LFl2xfvLGVhAWbXPC74424HYjhIvdq/jnmvQ289WcuYFA?=
 =?us-ascii?Q?DLAR9UXUpZmxCvz+47PpmmfhRI8ov5utLX2KVVpKxu8UdZoeLDjN+wVCunLU?=
 =?us-ascii?Q?GS3AajBNFRMpPTQ6+HJn+Z5OCZH0WitUsHgRG99vIhy25O7UivoGH7Njw/nv?=
 =?us-ascii?Q?As0f3G6hDqDKV7jisLmG4CRIBy9m6OgMzSkMV9a7j3DZuvHsvdE2xwKM4gDj?=
 =?us-ascii?Q?JmeHktBiuweapcZDypVmepv16JaTYiICWjtYsxWydfXmS2iWBZCxLEm5SWI8?=
 =?us-ascii?Q?++OweXJw5KpTjOPHUXny0Ba8NlWM/uSSFG95kVJflG5yWl+pyDm1x+/4YHbd?=
 =?us-ascii?Q?qmxXHRUmabHpYzuqh0Jmy+ENdaqEdGUGXmTYrKgzXDyaIEWgVotvA+LYqc5n?=
 =?us-ascii?Q?C9Mu42VcvOqlVWpLNiJ1xJ5UW2FF2i/3OQzQmjdyBSnMfBV7jQdQYhCihi7U?=
 =?us-ascii?Q?NmBdLQ9awor225OL0IDTR0sW7+xyuewSl5s7RFsl6cmbb6q2WyUsDr9eewqy?=
 =?us-ascii?Q?ZL+DO8xtWmsTdbostNjjPaQR7fowDXylmLYIWPC+jTJXmZEZEHrAKxEpL2H0?=
 =?us-ascii?Q?yUEU2V1Icb4zJ3w/3yEcCMV7wgNMTyTJS4ZdXC97xr72dhJAv3/Q/oJmyfVK?=
 =?us-ascii?Q?IK1iQm++jTqudZ7yKfUoN+xxsKBVk6J64T4+bUbWs43qQjuJhvGFUnmAo6HK?=
 =?us-ascii?Q?yxmySC6cetjIJ28g7288rZtJw4aJ6Wy1YBAV3oirpzzBrf0fA9hY8+BIHz0s?=
 =?us-ascii?Q?yB4eKsnWoOZj7rZ7r42eyMNldw7/0SpwmotdE/7qNkq0VsGz8y0xwoG5T6Ts?=
 =?us-ascii?Q?tlWfhqPqVDv/tWnQRViXRqrehrWbPe1bQhPFgGSCJHRgY/wt401AQpm9i2ap?=
 =?us-ascii?Q?c6yRgD5A37V6HPQOwJsXZJnunJJTUFi58hhuMsw7SOLbLL3x33T8nBFqnf/k?=
 =?us-ascii?Q?BFD1YojK5fCdnr+Rs3tGsdd1UOZn7i0ydwSn9Tr7TpmQLLqxme4SMd1cjHPO?=
 =?us-ascii?Q?3QPJxBQA3Auuu5YtVMf7rSERckThaqTSmoDZ05EyelTGo8LbT3cvhQLrqlwy?=
 =?us-ascii?Q?Dj9c97825nGS31s0YXP64MlabBTgsi7+Hh4xBIn0aKBjuPKwFAO/CUlISEAB?=
 =?us-ascii?Q?AgfeGPbBMWiF+OFEFmkQ1Yxz8YQzsALD7UH9kgqtCtM7oCh1fBAMAWnTScfk?=
 =?us-ascii?Q?rCiYBityA4P1wH4uk6+bQmRlmw9ImWI+V3BWEhwTX3r+VvSadr0p3zNBkfYH?=
 =?us-ascii?Q?OpFAe9Sxb5tVJme8azOQARFlaqs6AMiddo7XIvjJeKUoMw02n223Jff5S1kJ?=
 =?us-ascii?Q?SCldCRormxzo4XzXM9I/IOnUx6lJtaq9aQ67R3Dlvyo8WLEXvmz4iz03cp9z?=
 =?us-ascii?Q?QKvSLSTdcskk0XeNWXVsfjE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5fb00101-c67e-4bc8-860d-08dc8ff5806e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 00:19:36.6221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dC44GJqxBl4c96KiMdinNuvO5/RxOMYR+cRMuCSKk3oe2nuPhW3uevo45SYIrMdtsudKgBEVJxCv+0+YDbqMKVQgZCDNZKua1rkJJ/qWe0W4mOfScGSRc6DsQbbPe8m8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11717
Message-ID-Hash: 3BV5XEI6YT6OAC3XDTECLKLO2KH252PR
X-Message-ID-Hash: 3BV5XEI6YT6OAC3XDTECLKLO2KH252PR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3BV5XEI6YT6OAC3XDTECLKLO2KH252PR/>
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
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
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
index 711b2f49ed88..7fe5ee3bcfd4 100644
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
+		 * as availability limitation
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
2.43.0


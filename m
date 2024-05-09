Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4AF8C0B35
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 07:53:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4662ADF6;
	Thu,  9 May 2024 07:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4662ADF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715234020;
	bh=Abn6ku78wy/1oamhGsfOpuJ+/CKZci0liEj7ItXib6Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g0QANDjd1lfBEEtTXyJCeyvIohJZLbPamo6V4wfOQYMeIyGQvwcORQ54EL+N62sP/
	 SA9URckGkopqWOUUE4SKkhEnjzucne8mivMzHRjzM8hgLGPMUL5PaunveZEvCrDgua
	 EwKAi7+1xHEy9doq6CjQMOWtBPb6jTVjw9tLCu3E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AB45F80587; Thu,  9 May 2024 07:53:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85F00F80570;
	Thu,  9 May 2024 07:53:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0846AF8049C; Thu,  9 May 2024 07:51:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC897F8024C
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 07:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC897F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mGTn6HUC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZkpXgTW8UW3nFL3gntniE5xwA8nIPif12hZUnXwM7/a1l6zA4vgNg3xFtA/7b/+EFV3CiEk08jMJxJDd84YEFryxPzsg5IeHSPYlWG4t+er8seX/0CUEenZgUQA09Hwa66y40FMdCAcRKQPeHaFMUnUVoWEfst2dt5goqf6Mt09mro8D0p4V/lNnlVBu2P99Fw4DmHMcXlzt98y/Bc/dhm7s4fbQa6c37K7o6P029+Xq9Ga3tkQFdzHlT7qNZomxR9K9Ev/4ADGxFZ6FZD48qus7LWAy9ZUaDKey/ddvaXfXdOha4H8Rz9WuXAOKCz2PtvqmnNN3kSPrjnVtDRhzXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOca45vba7htqxKgkw2r5bdAFLt5wRXjXXCoEBJ5quI=;
 b=O4kZcZqebAUN7untLuYpAmELcz/g9cSPMRfTzXdtDp6BRWhVClbR6wrZVSLUN1QI5MTMfP8v05E3bEEUPuaVVwg7/cRC16uu7DuRwmkvQtD2cWa6BcCCQD48kUdhLEELv9kaXHU6iDB3auSgXdiG5pXNc5vyGXxRm0ZFeZkIS7oYMj3Vo2RNzakZbZvKUdLvVKmgv9onyBbPDnETid/PYzVzIJB1KyricJ+W9HoAlkuBItz3GAeoqDnxWSp+muZ0H+k5nZUdPjqmkp5JF1TBZNhH3BDTpHsx70q2XzJtI/gwHfE6LKA7CDQxzoCk0gqIsjCs39DEE6xb1EldsJiv5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOca45vba7htqxKgkw2r5bdAFLt5wRXjXXCoEBJ5quI=;
 b=mGTn6HUCpFYGXTPEeyGCQcHM+nY/YMyjaDJ/DqWVWP+2VWIKcAsGNVL/6r0N2/f901NPFIZW85412Gyd2PWtmFoZ9JeM0F+sL4bMmQ8WLz7c3uemVZwFHQzaszKBk8ePiTWEgJwG2j0IRcBxzp32G0JHPCuPIMyPs7BH4q9kU9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TYCPR01MB11419.jpnprd01.prod.outlook.com
 (2603:1096:400:37e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Thu, 9 May
 2024 05:50:46 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 05:50:46 +0000
Message-ID: <87edaba5ze.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
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
	Jiawei Wang <me@jwang.link>,	Jonathan  Corbet <corbet@lwn.net>,	Kai
 Vehmanen <kai.vehmanen@linux.intel.com>,	Kevin Hilman
 <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,	Mark Brown
 <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,	Matthias
 Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
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
Subject: Re: [PATCH 0/3] ASoC: grace time for DPCM cleanup
In-Reply-To: <87pltxmakr.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
	<1jr0ee2ebk.fsf@starbuckisacylon.baylibre.com>
	<87pltxmakr.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 9 May 2024 05:50:45 +0000
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TYCPR01MB11419:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc305a6-40fe-49ea-0ba7-08dc6febf8d9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|366007|52116005|1800799015|7416005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FLmOiMzY6VWWLIAnYjLBfCWRHv1gx1THGpyp132L4Q5AvUoneS1D5zZckm0Y?=
 =?us-ascii?Q?5hcgL6adJcXtWWfMQFSbYIIogr2tOdEWczNl+Hl3jiKYnZbcwPwYNvSwJjWy?=
 =?us-ascii?Q?dy/GGL8kL8H3H2ka8GKiDZWxJQx7TfUCQa1oCOSoC7Y8PoW72fSlb1dRIWTg?=
 =?us-ascii?Q?wuAJ7sNAfzzNaVoJikzmKzMGg8qvxvNGCzg0L8H7CvRDk/GAdKxl2CADv1dX?=
 =?us-ascii?Q?mXmg1gcnpot3Gq7f1ORcqYcvsQ4kzXdUmqC8FmwVR4y2XqgNfEqOekUM5cmq?=
 =?us-ascii?Q?YHTvlvezvF+eeXAS9n3Z7i1ydOJa83uHCxo17p5IkQnqd+FeANoTKCi0WLyB?=
 =?us-ascii?Q?clp+DNL57nmLcHm7cpJsfjnf13bUTEKek949jqtTvzHolV6bqosV61MF9qqh?=
 =?us-ascii?Q?nq4sDBcPIlpkZmUntiup08a7IUkqYP5b9NXpn6S0no10DjfUexD8CmJ9HPwL?=
 =?us-ascii?Q?/LiM6AIlZeNdH+tK5JvYJNfG4wlqb2zdsglo/xTL8aJznE8oQSAdS0YYo8k/?=
 =?us-ascii?Q?rDW4DPty3NU6rbvp8B+I2C7feYEbG2BJk9AloMleN45S6zTxZn1jBfijxOfG?=
 =?us-ascii?Q?oMwecyKkzAkslx/XuU7kNRHG1+uFivTmsd0CQAlzrtDUvNDB33rNVbIJ1km/?=
 =?us-ascii?Q?Y6xkuv81TMFccuIK1m02XvfOnf9svYfNj2r+zJsigdhZYoy0etUju0rMnXc+?=
 =?us-ascii?Q?DKtgCdAUVp8xspuFyqSFoP2CNU0u8fD8GSHTS+rlBy4NDsmr2Ljis3xxS02q?=
 =?us-ascii?Q?cNKPqeRwFfd8hZXlRxn03SVZaGM7Kt/QvdNo+1bZi7+279M3otni9jwiclcs?=
 =?us-ascii?Q?SKTtsI8eX1/bzRTAWsiC+Vf5LdM32/3hJJ+cPBl5LcN7hAW89UfoSkX9/3Wh?=
 =?us-ascii?Q?7xrpBD5Eb1ri5A5k4fDfSGGnhCtRgxg4YGbx+YOexcW+tKGEsAb/oV9Bymov?=
 =?us-ascii?Q?+6kpj/izUqitQSjoXqZ8txN1NE0wKzStopnbnOTdygOtvj4iubGHgu2Z2/Ho?=
 =?us-ascii?Q?7Dmo4E94zl9jnV8FQlDgo3It1smQCP2UjnoSVEuLWFD1bhlybOlEAMMaeErg?=
 =?us-ascii?Q?VSWQ3Y+PwyXYOqcvyF2rv4au6wMvvo7ERKygy2w7AT+yZ9ORFF8ODwvRMc7Z?=
 =?us-ascii?Q?RS/JCIyNLEkd524hpCffVM1HwLrv5ehx/yJD8lmy/qGHn82fikoZhL+ohmzW?=
 =?us-ascii?Q?kdrHXWLjgywV6w17oYe6bGj2104oiMdx6rDOVaJYnaAi8wxSpdY9GuONH4JK?=
 =?us-ascii?Q?kTjXYoE/shHNr9D3Ab3KlcmJISsp4ysV129vq1f6QukamhImr7pmpiUa9Ppc?=
 =?us-ascii?Q?Wdr5E2RNio8Ib2GhMivhRuLagqfySu4MjWL0hJQ7bQETmg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(52116005)(1800799015)(7416005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KQ1HOzqn3Iar8sB3DTreUoqarOKDaIN134FgcDJa1Ax5S2DC0sCUGsL5SuY6?=
 =?us-ascii?Q?EUpCCM40hZRnlt4s6qg3ANoTlXL2cdfJX6yaiEcp3/5NeQu6jsT81+/8TVK5?=
 =?us-ascii?Q?C7PclZiP1HlGzweuQrPevaBFAoWYKg7xMndeAFcNgCD47KY12oIItaixULhV?=
 =?us-ascii?Q?J2qmV2dlwCByF6LylNB9UBBaJST/+u9/34JQaSw0H72rm+sWqmMAZ3p5vfbd?=
 =?us-ascii?Q?iPB8iAW8+R0bCLmOdDlWc+6ma3MKRkTxeOcskcA9u8r9Wgzf/9EWdzMvOeCM?=
 =?us-ascii?Q?4Ym63zwOPhcMdBR3d5bSNexIi6zAkiJfXyxsnLwCofwoPKMk4qoHvMguHYWH?=
 =?us-ascii?Q?MG5gZzzaARI9g52ji+jGhAr/vqCSizpZcVE1H6+/NJC/4evzsidQlYCQgleu?=
 =?us-ascii?Q?uEjlJ3FxzfViYMFygAToDIjtZuweR1gkPR5dz2vHGWnuckO7jIyeAva8Oqpe?=
 =?us-ascii?Q?gMejc+Dr5Od1jMAedX5iEBg2nQ+cxe8NWHNolTP378HSA4RYA9alRCPVWl13?=
 =?us-ascii?Q?gccVywKkly3+9Ce2lsvnCTVux+egTFWcs2yM8H/ddkbTKzdsHK1D4Uu3Wcup?=
 =?us-ascii?Q?InTERsN/ugdI/+MmsBB3coY7+Art+QVeVvZ5GaxwjsovMdAHTKXnVz4ZYIsl?=
 =?us-ascii?Q?YWEb9g1vK/d1qsXrdsw+tjhCiSMOve7EF4CUU5mKzbErln2PWiML2bxR4wlc?=
 =?us-ascii?Q?BSrvhRTdv1kCBBe5LJ79HSFjNaG8hER3bk5LSUYKKZmIAftdqUYl2aqjqeED?=
 =?us-ascii?Q?TeIZAPpvaUxhNS39gSAEw53jyaw/KQ0FOQyO3OO6M5ZpssI4ZYHzRTnkr0Kk?=
 =?us-ascii?Q?dkvPpdoiuutD+1x71r+03bT0jIuV/xiL0DzW9CLBPbNg0XLEMYAIbM8aQLH6?=
 =?us-ascii?Q?ImXMvkiorkmFssRKUvM51Ayb2RI4G94pkPdcXOgthmi8iD1XU6y7BhEQhe5K?=
 =?us-ascii?Q?k1r/IXX6/EiB/iwUy2pbnwD/zlP19XdSyjBUlBl9+BAWn/SMk06Eohj+2EO/?=
 =?us-ascii?Q?2pWC/actHJ2U6jTnrOF5dnJzq7TIng7F1J0Job6TxD3zY13HQn8DSWmxDPqK?=
 =?us-ascii?Q?oj5DC6HBIs9UeSCCx7XxK/JXbMXRWvL+lCD91VlNbz8HKXDINLCw3FUgwWdK?=
 =?us-ascii?Q?ADGNyJs+ru2KFGa9WAKC5t4QTOpY+6/S5xj0ceTHiT/QM8d8cJuA7oRMFJn7?=
 =?us-ascii?Q?FE0mqwXJXRKItcI5GyTsWv4cvzJnaZfIcVbJeRxzErXOg7iFLW/+fozUSc3y?=
 =?us-ascii?Q?B462/wgIK7W4gU1eBHRSi97MVfLj6zLO9h8whB5iQybuVjIBBLwl6/pPUrkL?=
 =?us-ascii?Q?3GBUkAhuE0Bca9YBDP/Ma/upnQUJ7vzwBHp1KHjVb+HZwqjS0K+CxR1XV1th?=
 =?us-ascii?Q?+C6j8hQbTIKtcQhi7e2lnBC77GQzA/c4Yp0Kno7+1ogY5hrF07+LdRWNjCZ4?=
 =?us-ascii?Q?GB7mn/kZGgTUOlSb9qXWizBs+ml9btuvID+TZFzKTyNbUh/llVGii5IHDzUJ?=
 =?us-ascii?Q?xfsLEazQRJBPIalYxYrrxiDG//5xRoZhPpE0eb8KiLe7cJqeJRXEnaHI88pA?=
 =?us-ascii?Q?hUYkky7XQL2zd964VT3c3OS5xfurgrAQo1yzJVRUcdRedYDsNcHtjB8+CTuI?=
 =?us-ascii?Q?Pmi03NV7pfqMAPirPk5cpQ0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1fc305a6-40fe-49ea-0ba7-08dc6febf8d9
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 05:50:46.4005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2m0QDG0j926/ypjO99NbRU3BaqDaRyIiOgvwYE5WKJoiFRR8JTBlLSWst6a22uo5Wmx8m3dYmsMl6S82owK2ygOK7BR/hNuTPsJC2HgoTqiNjjlAv61qn5ebjMPJnHJO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11419
Message-ID-Hash: 2IJWPNLWAXOMIOJQO2A4FPZZBXW5ECN4
X-Message-ID-Hash: 2IJWPNLWAXOMIOJQO2A4FPZZBXW5ECN4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IJWPNLWAXOMIOJQO2A4FPZZBXW5ECN4/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Jerome

I need your help

> > I have tested this series on an Amlogic device (vim3l)
> > This brings warnings for cases which are perfectly fine.
> > 
> > For example, one of the DPCM backends is the TDM interface. This
> > interface is capable of both playback and capture. It can be associated
> > with any i2s/TDM codec.
> > 
> > The codec may do playback and capture too, but it
> > may also do a single direction. Then usual example is the hdmi codec
> > which does playback only.
> > 
> > In this case I get:
> >  axg-sound-card sound: CPU capture is available but Codec capture is not (be.dai-link-6) Please update Codec driver
> > 
> > I don't think this is right.
> 
> Hmm..., I'm confusing
> Does it mean you want to use "playback only" on it ?
> If so, did you get below warning too ?
> 	 "both playback/capture are available, but not using playback_only flag (%s)\n",
> 
> If not, can you please fill below ?
> 
> Card
> 	dpcm_playback = (0 or 1)
> 	dpcm_capture  = (0 or 1)
> 	playback_only = (0 or 1)
> 	capture_only  = (0 or 1)
> BE.CPU
> 	playback = (available, not available)
> 	capture  = (available, not available)
> BE.Codec
> 	playback = (available, not available)
> 	capture  = (available, not available)
> Expect
> 	playback = (available, not available)
> 	capture  = (available, not available)

I need feedback from you, it is still not clear for me.
But I noticed that we want to update below. I'm happy if it can solve your
issue.

-	if (has_playback && !has_playback_both)
+	if (has_playback && !has_playback_both && !dai_link->capture_only)
		dev_warn(rtd->card->dev, ...)

-	if (has_capture && !has_capture_both)
+	if (has_capture && !has_capture_both && !dai_link->playback_only)
		dev_warn(rtd->card->dev, ...)



Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

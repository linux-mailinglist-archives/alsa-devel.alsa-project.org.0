Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F168BDA33
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 06:34:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D1B3B60;
	Tue,  7 May 2024 06:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D1B3B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715056461;
	bh=UlHQyGTEM25XSr3p5+bW3CoQw0OnSzjELwKTZ0swvc4=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=sdGYI0+QfzmvAgMsaQ8xbNeKA+nLKA4udrjrFFfXItbKKGfZfRHKO6//SM35EGwto
	 jGGGsqSjz8QajKtb9BOPSETKbNMPfV66U+YZTXJctDyznsnsLaBP/UJmb3PtQ14xj4
	 /XoJ2iaKu8cXXRiqRa3ar7LclJBar0TI/XaM+Pgk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB75FF805BE; Tue,  7 May 2024 06:33:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FFEBF805C5;
	Tue,  7 May 2024 06:33:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A9C7F805B1; Tue,  7 May 2024 06:33:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 696CEF8003A
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 06:33:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 696CEF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KVWQ5hSO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5aitSraDX0vuE743TxNqfsXlo8Q4RCO5HzMNo0k49UGVYm6hqkw8c7Asvvf13uNCu1ptnJNPqmeLcKYIGpW7Voye1khwy1JXGa4kILyFHCL71pgXAcSdXfqIql4aVYMhxX53PselmFpNKJkCCZAppYfeTvh225MZuH30AZLYNqxU/tx9Ord9+yHZSHd+nt3QZCO0fDG2uVuP2tM7CeYn0tbhBb+6vLulRD7xFMwIWbXAeej5VAgNHLcQe7FXHPXaFteQo/dzks5OmFmlsBOjs4QmZSxJ61XvWlH9nMWmRQ8uQtcB+WNuLS06n2FBpvrxnCIu5eV4CpIWJastUV1aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wor7/TYJgKI18gNii8iNrsHIxBN6Y8ysM4fkY0I5Z34=;
 b=Gg4hRucnB5OzQHB+bt04ZDQEzn+T08yD1mFCsrwf8oFx/tmELRHjA1V51Uvj+qAKqFUqtqlB0PhBvV7XEHOTKbv82DNzM6uOcJcDgb4CoWzj1Rvwd3fOafAnTjL1lWlb80uBvVPJFpAwte/He/SS2onq+kWBWHLFThIOcW/1HZirLBP5YSTEVp6PQJclHEW8BtUQCFJcrnKFnUM5mrtKhe8YwMu0DoSA45J/deiSwFSms0NloeU2Y2HQyS5Pq5Uod9UbrEl7rYl0boeY5jPbuTJCud36wYJZu+KAjnYnKKkxUsurDPdrb1wRBcCML7X6guexFAecHoQ8lkgLGW1DZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wor7/TYJgKI18gNii8iNrsHIxBN6Y8ysM4fkY0I5Z34=;
 b=KVWQ5hSOdUVVPDiFC9qS067r4U8JPD1jDpftDeIDW8jNCcKiJ3NGf0StIl6L3GAFM4OgtQykFpUZZpU2Dlc+s7HBHL616STpRk34PAyTpV8ZRJ4gM5qGyP6i+qfNa8cTCfhKb6s8bYbQEB5o2fVVJvSbjm4zgqkb480DFWAbgH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYBPR01MB5421.jpnprd01.prod.outlook.com
 (2603:1096:404:802e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 04:33:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 04:33:22 +0000
Message-ID: <87v83qdywf.wl-kuninori.morimoto.gx@renesas.com>
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
	linux-sound@vger.kernel.org
In-Reply-To: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] ASoC: soc-pcm: Indicate warning if dpcm_playback/capture
 were used for availability limition
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 7 May 2024 04:33:20 +0000
X-ClientProxiedBy: TYCP286CA0082.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYBPR01MB5421:EE_
X-MS-Office365-Filtering-Correlation-Id: 2196bebc-2ddb-404a-3ca5-08dc6e4ed410
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|376005|7416005|1800799015|52116005|38350700005|921011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0obCyuvmGrKez9uKZhKVM0pbhVzXzbALSQwHvuAtTz0l5CFOkssMPKTNL+x1?=
 =?us-ascii?Q?5Q6406hU1b0BxXmx3FPE/rtAiepm8EO1oxUqp+zC2Jn4zHy8aOWIPq5P6puy?=
 =?us-ascii?Q?iCcLZAMbLYy6PeWndGcixjChpKtHKe2esQt5ZhfnaXyItdiuPHp53Dudp97h?=
 =?us-ascii?Q?vfD8iOuPTFRhpdBQQ9SRzhPonWvnhS7ipwxPG3AH/Ene95yE2p8kXUyzVv3/?=
 =?us-ascii?Q?7JAGY52Ga77illfrfyqBmaH62AplIhTzXysz0nPXVE8yNkNxvnRlyYvNdwFu?=
 =?us-ascii?Q?Wiw0Aj4lGWLi6DAbhn7NvJqin2gelUdCv/ge4jMCStTRS588a+sEESJy4x2B?=
 =?us-ascii?Q?b496X95HcD+ZV7baY7kzS2fxTsB7VQ+4fOILFZot5boHtl5tbN2Upg3ivK9R?=
 =?us-ascii?Q?qOeH2ZbrJYos1WyeZDmDEzbaC760a0PL0PHJFieKgs1sSqdehPDtIo3NgvjT?=
 =?us-ascii?Q?OfchWxOCCafcgHKb3cSFUyMcOSfQaqXpDFenyO+VaTH90uF5PVNZ8DElvQTu?=
 =?us-ascii?Q?6r6W/X1StAccDR+UB57SHQlZMdz2Jmjyob0rCYU6Gm/AoJ1DpH4lhPG3rND7?=
 =?us-ascii?Q?YdK6TCrmtBjA4PK5KoNT9DzPGebA6G/oWudFJ0MuFKsZ3A0aGoUDgJDkjhO2?=
 =?us-ascii?Q?3k5pVm1FjcFM/qKM/96ei5ymo3oA221q77uSol7ecCkUm0ILTH2VdciKMUzY?=
 =?us-ascii?Q?oKcBDpehuKRGIQwa9fHXiwKqHyQfCPW/Ma0E9djtMQxZvHeuDtJlbj5M6+vP?=
 =?us-ascii?Q?c3dguLGxZYTA2RtPNgr0w/cN0peQQf3OdVPmsAAROCJ9ARcSua0GhM6Za20I?=
 =?us-ascii?Q?K9oVwAU65VLm2+TlnxhscZ953TW5rra4mAG1u2KRT4te3Hpweaq6VD/exIvk?=
 =?us-ascii?Q?SL0gUFWtmfVLyQC9Rt0jTY9y86M25OxYSJs7mooTc8/3ThEjchCbZMXD9cry?=
 =?us-ascii?Q?2IVQ/xDGh1676u3ueA3OKrxuYtaigbsUBH4dpH5qQRiuOV4a3li5gHXSr/15?=
 =?us-ascii?Q?h47SCfqQ3E83RXCtb6/m+ThPuFGTjpyB0Fu0jANE8BUWPpt8308muOVtI9XM?=
 =?us-ascii?Q?6bxmF83pnJiXILtd6nZOhLvHjqtwpp6xd5EPnpVN2ki8lARrFNcGbopRxwdW?=
 =?us-ascii?Q?rlRU6rrAxRRuGt8rOC3RBF084WrMKV8wnG3zFVWnUsnsh9FbYjbEwEZcf+y+?=
 =?us-ascii?Q?i8JrohO93xm9JQKeBG3iLK8hOkQqSb6k9QVNUp2ltP1axQik0QgRpffZBRBa?=
 =?us-ascii?Q?z7AZXIE66uWi1kHF8HHCbaOYJ3dTngG4KhaKqGSsPQ2l9ASS1ywDzI8ZCWdm?=
 =?us-ascii?Q?jKM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015)(52116005)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yrVxrtxSSf5VZJLpuVmXahSv9e7PCPZPi9sGKsRAX4Yt5UN8xI0uzP/oXvEd?=
 =?us-ascii?Q?+lXrg5R8q4T5nPiKmI3rZbsMeB/izdm6LRWOVMoobj79zOUqMYWR0dMl21mg?=
 =?us-ascii?Q?GfbZ6Azy5ZlwdJ2CfZHeisXM3+Rqqq2+kU8mF1mN+tVyLtOHYC8YBEyMZSoF?=
 =?us-ascii?Q?PNfJT1DcQs+qhPTM+uF0DJPhw8dGHARNgXcj98lgcQ1TbGOYUCQYmPe+mc3p?=
 =?us-ascii?Q?VLtjGk4VdDteX7gQ+LIbLRyQUn2erQtr/ObdqqOG3hHNUnO+PENmWgWv+Mxv?=
 =?us-ascii?Q?AYTqn5DriLWa2SzzSniru8S0LCbXGNPVNCqXoWNPubO/Qjq2zPPUf7kHJB5b?=
 =?us-ascii?Q?qV5kWWU1CllSiLsEk32DT7st1ea0d3x1DJ/osFXngC8L7HHF2gvJja71aO3F?=
 =?us-ascii?Q?4paRApEfRfJVBHh1RRL6zKfen8bpdq1gcNkrOtCHzaaaZOhF54FBgyDyZ/Jh?=
 =?us-ascii?Q?PLOdVB744eb8NPWRNjFMMfcu+oDXVLsxEJJOMswuurpTtxShtQcdA/vyG4vP?=
 =?us-ascii?Q?WytjRpUM2LsbehrEWP9uqhLNcrwvA1nl4wY52JyvzPWi/3Ig6wh6oJzbF+IO?=
 =?us-ascii?Q?CnrftHE9yGqTlQwCSR/G037Qth9gqv945/NCxz7s7m+cSi6jSo15bVXpm4qh?=
 =?us-ascii?Q?fMXan5OG6PSM5BCyQK4AwyVupOvYAGLuHJz061GqfHmw17XhZKMQU9evYVnQ?=
 =?us-ascii?Q?0mt/YCEOG4fInaga4tWinVXkczZk2R7EbozmWz/y5Cfy+JWFi2u0D9AeQDML?=
 =?us-ascii?Q?9tzRMx2Qz509HYGX9Areg14F6BZiMmEOjx1fLfRLxOHTKrbWpPuQeENdhmCb?=
 =?us-ascii?Q?wqg6QIAM4cEqSQUdmkU4c4tLc6TkIPttaWtMrm7AD/1a0bVsVn2p3FUDq4A1?=
 =?us-ascii?Q?ztcdNtbHjK9XAreTz9PTRXtPIpLRxArHW7w/JngHA/lkh/zWEH/wR6K4EQv4?=
 =?us-ascii?Q?qDviL4KmOER5MV6q/HU6S7GDrECYcPpZGO5b5acB58l9TDv/NoPUaUbD1hB0?=
 =?us-ascii?Q?V7ZucfC9BXtocoBMNKK6llON7wdCeIts1QO8ppBrPv63e+YbiN/l0AKA5IQA?=
 =?us-ascii?Q?WlR5IbePm5akFds4S5V70+7l8Y+9gnl5yFZ7MeKQpXxwkFT7c5LB40XQYKEs?=
 =?us-ascii?Q?MFNIyzM056M6pUdSVm+rqJndq+PaBDG5UmRdtoXTyLhZNiK+UpdOHW4bJzr3?=
 =?us-ascii?Q?5vBi0UBC7UBaq2NAGMvy0DhAJk1ggt9GAvf7l/LXeSxePBrhA5U4Kw3k5x/R?=
 =?us-ascii?Q?CrJc0QW+zZc+lRlc/aeIT+3lCru3jDGeLL+J8JbQvHy3wp3+l0+5CpalgB8f?=
 =?us-ascii?Q?UWeQ3DovzK7vPrruuPxligfjE+u1S/dfROeJbKfxwFbAwh+OS151HHPdfeL9?=
 =?us-ascii?Q?ly5da+pnQluhkltEToY95/+n/sCwJitirOWyeRdjbEX3oG+CFcfAUC3AeQL3?=
 =?us-ascii?Q?2iZ62V/fql/W/nXBQHvsS5JGi67yK38F9HhdzwE08J6gnrlzjWMGYW2a8//t?=
 =?us-ascii?Q?JwJ0Jyy7WfVshquEjSmZrB/9409r65ayrvY1gi0yI6PVW43uOP0N7XH9Nuhs?=
 =?us-ascii?Q?6zJPpLPGfxOyvZupHtvE2qffGukA09dTwq2DoON7+tpXolj4tZnQ3o3GjlGV?=
 =?us-ascii?Q?QsHm6qGJUdqe7SO6JvEuo0A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2196bebc-2ddb-404a-3ca5-08dc6e4ed410
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 04:33:22.5304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 og7fFRVmzzH201DyYsWNaJEjHj31PjGlkKva235VGunE3vkYE7eiZMFgAwnXlJi5wcX4bLdMEO6XafnEfHHED5bDqmYnCSMEA2a88xR6nznPVLTlLJv0QyjWTKGxClTr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5421
Message-ID-Hash: 2S2HPRTY3XYYK3Y2KNLADCEABTVJONCS
X-Message-ID-Hash: 2S2HPRTY3XYYK3Y2KNLADCEABTVJONCS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2S2HPRTY3XYYK3Y2KNLADCEABTVJONCS/>
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FA88BDA36
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 06:37:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22427822;
	Tue,  7 May 2024 06:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22427822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715056642;
	bh=/E/V6iqWldQvNewwoCG/uQI+67ab0DotQYknFeOiXGo=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RF6iTF45MQBA/DVOkKII3kqRFtZ2p/GZpySkfRtjlJ1wXMJr8Yx613aAvT/XNiGDM
	 DvnRySbUakpWAFpAEz031EyqAvEKyaJVME4/ZpCLesLl+uDEQeHeUw0+pZwGUmruYs
	 l6lOq+wk2K3h4Q2jsw/d3Y16wehApueh5IN4Kf6U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06095F8057C; Tue,  7 May 2024 06:36:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2884F8057C;
	Tue,  7 May 2024 06:36:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03A8CF804FB; Tue,  7 May 2024 06:34:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D098F804F2
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 06:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D098F804F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Wahkq3y2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pc2Pz27QAb99Sv6jLBHIveEYQ5fPB2WgFIPCKzkLjdJI/DHFClcI8uLkjzMMV/MxTsKSw0Z+6jOM9cElJJwK7T92fWfGGLholup4FSc4nZy7T0w5Pidp7nDXp133QAFGbLAPtFNgUVn3Vj3n3/FAv1rXBIKs377CbRbpie6WvDWCbj18KWFiyPmk++lrnciEikUh5R5+Vhmzrp/8r0scxw70XAwvvsUJwm6OyoFb9r+ggwd+3bJlP/fzZl95z7280sN68GUXuaqsigFUQVJtZWgxpzpVQ8IzBupNDh1i1OSE4dKXaHXpWdGTsUsVk4y1jLctVNv/mV37qM8GdsTKLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heqPtfEv9Cw6mac72AGiZGpcQsh0zBQKwszcoJ9YY5E=;
 b=MXrfn13nFOGLXZi0BUM24F+0LZhgbf2odoasVeXcQ565jkvDOMMNiy0Mj/MrdTz7T4SupMqMSSGqftXbBzSGKsm/ft3Klieqsh9GsnAXOa5DUr+rbJCbDZ5GoEUvphBqPtIfcX54IowKOiMTxzYXrdE+veXCUzeeaJGm0g9/5qWue53gKL/IugfhuFtRMNnhvIzmQrfIYU0RnJ2qP1lV89xCbn2dhxEnxrWWlPN9qEAxrr8ny+jPWe2wJ9AUULjpcnVkhk+IJDhZY3FVmrXyXkBKhPsXVXeubnYm2FewCB8BwSHBkEmDMmcb7VEf60smU5QLsfvdxuhdICwmtzLd+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heqPtfEv9Cw6mac72AGiZGpcQsh0zBQKwszcoJ9YY5E=;
 b=Wahkq3y2WpvutRDzoa4jIuEawfkFLfQGmrOxFayHGp5YSf0ongeIVRoMFen21Jrnr//M40mj1RGyc0uozc0pc5rTq3N/Gj/OyWp/XJfzEewTUEJJmQDN9MkbnQ8UT7QlHb/b4TSoTGWwrTq5KrhmB1YitwdCOxxtRlxZ/cSw8oA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYBPR01MB5421.jpnprd01.prod.outlook.com
 (2603:1096:404:802e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 04:33:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 04:33:34 +0000
Message-ID: <87ttjadyw3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/3] ASoC: soc-pcm: Indicate warning if CPU / Codec
 availability mismatch
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
	linux-sound@vger.kernel.org
In-Reply-To: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 7 May 2024 04:33:33 +0000
X-ClientProxiedBy: TYCP301CA0042.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYBPR01MB5421:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8aa712-8622-4e25-9dbd-08dc6e4edb6b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|376005|7416005|1800799015|52116005|38350700005|921011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wndNTtvonKlw2egRJ7EHILVYPsFt+fZUXbyKANkzCksnClr2rbNKaaiUUPs2?=
 =?us-ascii?Q?68Fk7ZaCAATEHtRrI+4BvwCkXobVr8yIi5vPICN0G8piIJUN2rUpKD6ljXKC?=
 =?us-ascii?Q?aYgz7/Bo3aEuwAL6RUwA6jbWd8M301qYzqX45GUm+wtjOGn2IfzXUP7Cl1zu?=
 =?us-ascii?Q?LNdJbk2Gbs+xzyfzwSqUG8ldxklX6NUrPBXUFlNUnu2eBTxoINtoNNu42aci?=
 =?us-ascii?Q?bcmRc2cU84pFWsE/cvrnXDVcxDiJpjyIL3N0Xn/hP2CvuqsEMvQik/uwPaxy?=
 =?us-ascii?Q?36OxDw+nkOYz6qwK/JretNuKsn0HduZdJxq98ofSE/06z1+oROjXWPREbumG?=
 =?us-ascii?Q?ORaUSJKFjnzdjCQptmcZA6R6AET35QF8UMTYOnEt8CFNgVMJ9Jeioy64h0di?=
 =?us-ascii?Q?H3wqq8USM+yPSEZ6N8kfZMNU++VV1iQ9SVq/+nQsHnxmGa2wt4rMb4rifRhZ?=
 =?us-ascii?Q?UEL1B/2jW8iDkGj3zPk4ncCh6ibrv5My6kQC0zkOjMhatdhybgdp8PK5pjuk?=
 =?us-ascii?Q?nG5YresbOPa5sWpcevXWvqngDNMqGhsnE/mtIs+1hJFrbV86q6YyllrPw1yW?=
 =?us-ascii?Q?up+1jXyghDjznAIr2C4KP144k1mE6MWrYSCNfZakY2jLDkGovZWitXByqW5y?=
 =?us-ascii?Q?zZJQo5bJoJ6+aG1ZM4QLc4upXtTVAwGtBXe4KGzh5TEScskRVH75yxe5z1NH?=
 =?us-ascii?Q?xGOgvap4w1YhTtwwpYUW/Sv3qa9x6xVIUkz0qSjizgJ0MgIz8cR08ot7y8mX?=
 =?us-ascii?Q?PG2EtDr0s8xrJnp1K69o2lQJmgJ9KMAMhehp2bRjL5qR5azfiGm7QYllBjoS?=
 =?us-ascii?Q?RXZw8u26EmoOItMgaKGTLYCYaCwWvb1J9vU/wflY2mht+CX9ugUYBfg6t/Ex?=
 =?us-ascii?Q?LuVySuGdTWW/mEO/9hAZzyDyppiyq4M5ngd8cIxPaLervU+dD2N4vGvp9OcW?=
 =?us-ascii?Q?s6PbB7jzdNXje0Hsw4qdPDXw82X/Gtoa+SuKe0c9+T07ZcGv74m5bQ90+Vxy?=
 =?us-ascii?Q?t6bjkWOAVUPHOECC5r+b3Vb8i0cjZKLrqfNwqtnub3JoP8sWuewsaq/50kRK?=
 =?us-ascii?Q?ShlysoERgXi6yTyjmgNk0waPpYBBnq22GvNIHrXKGjXXzt2+1m5qkn6P09HZ?=
 =?us-ascii?Q?mfi2+OITFt7h/j8byRkDh0owZvtUYbxwCaLwXq7AkwaLWgQXU5hCzC3WPBdr?=
 =?us-ascii?Q?FcFkRgZ6epItKexfp5hOlZMb1z+gM78L7jCG1ek2XmchXAxr2PmchYHyoOOp?=
 =?us-ascii?Q?gqfeOhUb/Ey5tRHxCOy5Ja6mddSvPJ4bCalFqvLGQxqG+/gegQlghuNLuVTz?=
 =?us-ascii?Q?9OML5uY9vmbMmUOO9fv7Jn44MOWADzsD5cKqobpgt4wIJw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015)(52116005)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KgGrO0qtELVAANZ1/s0lBStvz8g9hZhGpa7TP8HjkU4MGxsYy3Q3mwUWQqdr?=
 =?us-ascii?Q?UbZXiNuqd3DoCdsqviEqr6FMOX1h40qA9/MeLKXkDJD7fwPcez6K+WbLzoUG?=
 =?us-ascii?Q?yofRnPB5+a1DMgb3NfQV9SeLjT+NdGz0n1WNoxjK0vOYvktd9Lyebk/X+g5J?=
 =?us-ascii?Q?pLi55BsQdKOWR3ETGFE1pynrD+RHzTFMcbl/gHKb9qhRc/tVvr69op/uO+N9?=
 =?us-ascii?Q?pS0KNWeDCBawxitWbQQVruwhWEjtDqjzBxe+IdbiBAFtSEGdALS/etVoTlFw?=
 =?us-ascii?Q?IZuPvu5T4BO9SjINU13pX7botAAcphJGC3HuTPs0gbiq+gpnxCCs6VPHGVm/?=
 =?us-ascii?Q?fi2eLwyGxIBCTVitqhsIcjjn+XV397XAzcEa72RCsC9wKb0of9jku29E9uAY?=
 =?us-ascii?Q?ZOdtgBs60Yea8UoJkqZK/nXYAtnu+7ni6sXNvWCbJS5ngHAHUzf6+6D8dF/K?=
 =?us-ascii?Q?Kyykww3QrOPFYJZ64MwXJ69ZuRGvobma8QhgUjpZ0ivJZRCZAFDDuyrhEh3y?=
 =?us-ascii?Q?FyOLMJROIJwmJdvgzy7u4Y/jgQuSOKDy562jUTHV5hLNJ2etpiHn34BmKwos?=
 =?us-ascii?Q?/F2J1g/KqljGPxBRraFHd8boPf9bIFBeAuk01aVaF5ViNRAJNvQkC9u7EmHR?=
 =?us-ascii?Q?s5YJ1bMqVB2TTbj5xBkAFyq/pXnxPdXQm+PVNDUAFHV682Fpbh7/IakfmUcW?=
 =?us-ascii?Q?mtNrTPpNU5/sfjkHSb4vGnsmtPjN4pCxvwtCb8/1CHw+58cQ2llexLZzIlPj?=
 =?us-ascii?Q?nYnZo6lCbaft+qG13vp0DvkU/dmfYd5OJiPULvWLtglKmcFNwa776UbZ78jF?=
 =?us-ascii?Q?/cL8tR/YbzOwwCABVjcZA2mVe9UArLCsNEAHwrlzqWWfW66ykBJyRPTyZp5T?=
 =?us-ascii?Q?2Dd2hGxbQ1+Jw+DU9exoEMKFa4b0vDDJ6fIGKqYytH+jEiDCUzMihBq3pEyf?=
 =?us-ascii?Q?CTemtGNpndKOJL3HZpdkyLLdNKobMnoTTGrNF7CBOqRiMo306ro+1eZ+gzeV?=
 =?us-ascii?Q?I9TTg/W+SEhdD/YJ2F3+D+xZyk3+ottNnVzcD73NDzuOtzdRoNfJPipdSpeH?=
 =?us-ascii?Q?L2iBSP1TwHiqgUuBs/WgoFZRf44g6lixTeRZZCEM3cBFG/d+rpramDSPvc/F?=
 =?us-ascii?Q?gC8lJGvrFjuu4WKXyNmW3IcCnAc9ipu1FInWilLSDLRjoNF52Oi3BomiSKu+?=
 =?us-ascii?Q?P7v0zSxfnSE8j7xl4QHdyRSBV3PNU0iN69NtimhwZUYAa8jE8mO/5By424jg?=
 =?us-ascii?Q?zMXVf9HXQkpKSilUo/VImPb6PrtiQaSH7V8szsEvG4RnUoTTOWoPzm1SKs+P?=
 =?us-ascii?Q?d4VEo4oky5YjOW5JZEVuARbJ+fW+taArFewer8/4a5mdx3o8TX4EbuycO7J1?=
 =?us-ascii?Q?qeItSRwqoPqREkzOX/YuTCRSXpjcTaCrl5u/zdVF60GkplqgXj6tbhPviGUu?=
 =?us-ascii?Q?Tarj0sU5E2INX9qvsO48jEnSvXCCQeMQbN3NVGrW7rdlhmesnCKCy3PvMEnI?=
 =?us-ascii?Q?vN5l1pIopjyARjI397BW5J3H0x20kT+W89KRVaEqu4wiTiJvPx3bw+gWdDdu?=
 =?us-ascii?Q?7l0HkVMJXFf4mY2Nb33et7bDQxUHP9X9Y1WWBi5RoCY8FF52MS81jz2D6oWv?=
 =?us-ascii?Q?Qs7kUwzB5RYDEa7L3AHc/7M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5d8aa712-8622-4e25-9dbd-08dc6e4edb6b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 04:33:34.8683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aKc4pezdxuzjmDTH4WaMseORWzNZOu/owD7lCn2xDMEDssEB8uYSJ8VW6fOEoaMjMR8FfqHCiuejbJHxVRApSf19zXpCDEbidK8v4EVj37yCUc1a8VRuScSubGZC4qkh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5421
Message-ID-Hash: YF33UECAXSOFNZEGOEOTL4QXU63HI4IK
X-Message-ID-Hash: YF33UECAXSOFNZEGOEOTL4QXU63HI4IK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YF33UECAXSOFNZEGOEOTL4QXU63HI4IK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current DCPM is checking CPU side availability only, but it should also
check Codec availability. But because of long DPCM operation history,
it is possible that the some Codec driver check have been bypassed.

It should be error, but let's add grace time to update driver.

This patch indicates warning in above case. Each applicable driver need
to update during this grace time.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index c4d80cad5982..8652057fce55 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2795,6 +2795,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai_link_ch_map *ch_maps;
 	int has_playback = 0;
 	int has_capture  = 0;
@@ -2806,15 +2807,25 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	if (dai_link->dynamic || dai_link->no_pcm) {
+		int has_playback_both = 0;
+		int has_capture_both = 0;
 
 		for_each_rtd_ch_maps(rtd, i, ch_maps) {
 			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
 
 			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK))
 				has_playback = 1;
 
 			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE))
 				has_capture = 1;
+
+			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
+				has_playback_both = 1;
+			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
+				has_capture_both = 1;
 		}
 
 		/*
@@ -2850,9 +2861,25 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				has_playback = 0;
 			}
 		}
-	} else {
-		struct snd_soc_dai *codec_dai;
 
+		/*
+		 * REMOVE ME
+		 *
+		 * Current DPCM is checking CPU side only, but both CPU and Codec should be
+		 * checked. Indicate warning if there was CPU / Codec mismatch.
+		 * To keep compatibility, warning only for now.
+		 */
+		if (has_playback && !has_playback_both)
+			dev_warn(rtd->card->dev,
+				 "CPU playback is available but Codec playback is not (%s)"
+				 " Please update Codec driver\n",
+				 dai_link->stream_name);
+		if (has_capture && !has_capture_both)
+			dev_warn(rtd->card->dev,
+				 "CPU capture is available but Codec capture is not (%s)"
+				 " Please update Codec driver\n",
+				 dai_link->stream_name);
+	} else {
 		/* Adapt stream for codec2codec links */
 		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
 		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
-- 
2.25.1


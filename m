Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4269C8CA503
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 01:28:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70035205;
	Tue, 21 May 2024 01:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70035205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716247683;
	bh=NxnlHpjOkITMxjPBxrZk52G/gHWO09IZ8u+F5fz+zAg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cmtlSv6GLTTvDuRaGvnMor0zD7aQ6xFC/n/HbcZYYbwkYTdKIZZKkvHLDiofw+43S
	 U+ZDdrvP9QBtXwfAHozJO2rzw8y95WkyKUgltClM/1O7kEKj7eS7ATFqvIJ6gOvfkF
	 PYrSw/DVU1/w/t/c4Am78NLwVL9YCBxALZM+unBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 634AEF80579; Tue, 21 May 2024 01:27:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA1B5F805A8;
	Tue, 21 May 2024 01:27:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68D69F8026A; Tue, 21 May 2024 01:27:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F9D1F800BA
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 01:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F9D1F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dPYxE3sW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2HDmCKrQszsWTXSiWtdedaCoLrsC/43BzXLojEMa0wD5XXE8dhBFPV2TaaTE4Xc6ZVynjUsnqVDTmglG0PpBjGueHDJXV0KevLZV7f2irEqG67htTiciRt+duAZkN6jqAoAbEIHXOI7zzs7ad4g8cD/CIaqjDbm+6mKcTAFKGB7T8lcUkCYtMxe1V2CT/q6sKnuCLf1Awd6+EkR9vo3lnRSHmatovw8lkeIiFQ7ukWxxo0E5AvlJB6ZAEhUr8ijDhAYzp1JOmyxuz9Kz4Fphq/Iof1SiGt+wE0EKyjfVtYBzw+Qbewom7/bdhtZ0bt0NM4ziqbtXzQEs2deXyqpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8bY05RM4GSBsxfeE4Owq4qgymUkJqywgkv667QYtHk=;
 b=KNiKzysf9DvdMisqFjkg9Lf2XJuOwtXSWTjBU9gzlMNx/IDSxlqFSkQKXN7sbDpCGje+tr95jt/PfT/hom9FaNasmnJBxNxRdrswUdXeRGZJ7JyAUovsLFq17a6hnFMNKkvOst7l9qVZxwFTq2lt8uafYYkJezFKA7ijyZ/z+6e0THw6czCtkhScoydNkqkUF3/9VipZVjK0ZXydqlQBHxvLKdioBtN4DzXVnaMPazsx0pm1QpHlCcsB35bWaXp8LCJjZXXuhFFzuWly3WkiaNDny9a+5J5lDpxRZPV6nlhKuEWklh/vQQ7en3wK3fiMoiINJeQYwMS1kHXqxz0JDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8bY05RM4GSBsxfeE4Owq4qgymUkJqywgkv667QYtHk=;
 b=dPYxE3sWR21zA/2zuFiNxgkn7dYdDxsMP2T8O1O2ZRzwNCa35poEXQ014LWLo4xXWU8CP8ecOq+yEkzNz9ThFO2y0Or77V5kvOxZGhi3zSMXV4ypXnr3o13XICosYuqhAJLaInIcsbRT2UqMHiQeWuQC6w9wScDz5RaUYCt75Fg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8116.jpnprd01.prod.outlook.com
 (2603:1096:604:172::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 23:27:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7587.035; Mon, 20 May 2024
 23:27:07 +0000
Message-ID: <87y184cbed.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
	Jerome Brunet <jbrunet@baylibre.com>,	Jiawei Wang <me@jwang.link>,	Jonathan
 Corbet <corbet@lwn.net>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 2/3] ASoC: soc-pcm: Indicate warning if CPU / Codec
 availability mismatch
In-Reply-To: <77e9221e-05d2-453f-9ce1-ff4a4b53d09d@linux.intel.com>
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
	<87jzjpe5vh.wl-kuninori.morimoto.gx@renesas.com>
	<77e9221e-05d2-453f-9ce1-ff4a4b53d09d@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 20 May 2024 23:27:06 +0000
X-ClientProxiedBy: TYCP286CA0218.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8116:EE_
X-MS-Office365-Filtering-Correlation-Id: db639e26-3299-485a-7677-08dc79245d3b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|52116005|7416005|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OpWspeqpht0y0x/SR3ZBFv5h2ynEp18ccBuAweDuPM+qZf/dSGWMmX3OeOL3?=
 =?us-ascii?Q?tWtv+AyPVJrPmSTB0g1+Hsrj1mw8y7fCktlhGS17b/OOJ5V36gsau5ZUZbKO?=
 =?us-ascii?Q?Uj1ZVPD3m06fLMwigO3Qm7GFBtRC8CvE0QIFGJdTNLUaw5luRFbDo3KQRYI2?=
 =?us-ascii?Q?xg9uiRPvf9GVOSDyo1kHWron+MKN0ZG81u+To3GGRxauz9iCxMSJ/rGa6Sw4?=
 =?us-ascii?Q?3oICLT8XZ9MF6Ar5dJA5TsOqaAW+/OMfz4CudGr7e4zvUjLTWkACglJlcQ8g?=
 =?us-ascii?Q?vZTqIA+fW4+ZujItN+uIzpZ/S7RqEiveZM06Jd/3sXRQndNsVGuTnQLw1uKo?=
 =?us-ascii?Q?4s3isf421geA+ASoAzuyDXR5gZC+Dmj4U2aamM13bYtdCrQNG6wk2hsl/Ss/?=
 =?us-ascii?Q?I3kxfXH2D7QBLtmyxJFOO1+XvNLJAl/Ou7XNQtj+kP+WtVuBe+kChvg7/aR/?=
 =?us-ascii?Q?xJM9jCQxkKINRJqDq5h+UtsKgdBnxvdzGxOk6dFEoLb/5F56LtAEk6yO3k9U?=
 =?us-ascii?Q?HGi0v6/5Jz49C/f0aOsy5Ja/rBsvLnV5Jj5szdVhar5tyMFF8YDS4srlz75e?=
 =?us-ascii?Q?m2dO6cNU3FufrnId0ksKh31d0f4NHkAyXiHfSBEDW1BW1vmPhMoEoTJzDi/N?=
 =?us-ascii?Q?+Wp9nZrft8L9i+G0ItyJqRqWAimZ/60atoIHDlp50UYm6Z79J0jg/eO9wgTS?=
 =?us-ascii?Q?BkvyUlLnHSbJkjDE89Ym0qqNfKt1oiEibADpb3i8lyMmC4YJ/Sdly3fqB8SM?=
 =?us-ascii?Q?Cq2hkRVYlfcseMUiHjGLcr9DiqjlB0TnmtGrOJvFJaGBeY9u3iK4t0R/kc1j?=
 =?us-ascii?Q?yvy16BNZuMA9LlMr06O9KPjoF3D6xKrZ0IDZOm7oSszuWf2eeRD3rSYeFp59?=
 =?us-ascii?Q?tRwl5zPa6MF95raR8CPr3yMrPcl2sqk/mzWSEA/2tVWxfVwfy1l6BrrFKw5E?=
 =?us-ascii?Q?PUZdGiSMyLT5f1nbS597UrReKTE6KtnQoSIf2f7b9iVRwXbmPjyqPc+QFZrY?=
 =?us-ascii?Q?97E0Ek9XPvPrFhGDe4YtSD9PtgoxQ1fWt4KFAFVP4qMeSVsUJht5rO0MHltn?=
 =?us-ascii?Q?bJKB+J++My9aO1urDwru06MkMlaTJSrOLFk38tD6LaA7unf8VWy9ImpUipcH?=
 =?us-ascii?Q?VK3W2hiMOisBAQ6SzIJNxXRcnlqRfWOVUoODnoVpMdbHtfr4Txgu367d7+eg?=
 =?us-ascii?Q?muLW2mDSStMMC10/RYDGHnFMeJX7L5s1Gz1rhXadMuiP9t47NuP/8LclqXMm?=
 =?us-ascii?Q?zYZ4xRgMoRoFJ9awri6AzlmdWy4LsZsSERPuCuGyiBI718LvKzajizZpfFkP?=
 =?us-ascii?Q?JV0De8qbrCvayrZ766HeaGhxZtPGTtMTUA6KqH99n/lLgg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(7416005)(376005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P+BRoXHAgo9vcbj0Bm+gZq3aEBmZASzUvk7ncRXM10p4bfj3zqFlUT/GAocT?=
 =?us-ascii?Q?vxqIRI0aPM17PWsFiu2yKgTp7k84Z35nwjHYspaqrQiR+siYIqEvt4VHzTh8?=
 =?us-ascii?Q?nOkYINlXR13wcqsQ1iVeJ0FO2/pChE8EZMziYgpXvDE6S1XE/MokR2gs5R4l?=
 =?us-ascii?Q?6RTzSBKtFb2BRcC4JBQcbTfDLDBkJVe8//S8B/wXCErC6VI8BPiw89VsNn8E?=
 =?us-ascii?Q?kwuVbuEt0bKWv5P6jcis9+D19VdjkIzbRyHczgkx4Nk+qkaq+rKzNUiSsfmq?=
 =?us-ascii?Q?8NUo7QhdX+6sxW/L1x454i+wY1k6MQ8ZVRW+a1UtEMhmreSILoqnAZ/Kwb17?=
 =?us-ascii?Q?s69/yWhWcOYyB4u7n3c/TTQ26KIYbGa8mSwEzBN6EEtiwmJE6WaysCU4qOBv?=
 =?us-ascii?Q?JEvInZGrmhwHcvlWGZ/HFVDK3CrfEJFcsrR0VbyAafHtO0gqPsedvjKYV1lT?=
 =?us-ascii?Q?yqEz7If5t19g93OHEN/TSxbT902sDDH+qxZSpuf8zHt6q6TtT/YwoWqBbBtR?=
 =?us-ascii?Q?bvjQKg8iKzPaPVK20ONR/sO86ZplY8Hpdg/38XJ6ICylHSEpb6cZ5jDljTri?=
 =?us-ascii?Q?WODkEE7axSgg8a2RG/lwV6z1VMeWs7M+F/+RS8wn2eIYt3a/tEanlr9Pu7Z+?=
 =?us-ascii?Q?SN+LGkNyyt22UW0WO2FWI5OGKNz0PntKvYp1C1xQ3UfiaH1pXqUChHZMEw1I?=
 =?us-ascii?Q?CPmVqeANAqJRqwfn8ZetW0XtjLfw0GYuD5eeeYbFKJ2lPwXKZhyHSIz5yFPn?=
 =?us-ascii?Q?Yq6CbXuoceAcwp5VtA0tUwUAQ/C44gNQd1T/pK0rBBrB5E6FPujFX6wBio/c?=
 =?us-ascii?Q?lxaQ+Va8o8TBIzH4X2eMidcQ7ksAdNkOPfWrK8b5df9kO3QjrM4TEozCEsDP?=
 =?us-ascii?Q?u04twH5fNI22Ia+eP7RX2F5r/1nj8pLQnwg2gyOpaIl7fVJrsulpunUUoZGq?=
 =?us-ascii?Q?kCwe7LElLcZG0TEKqzPLu6ka3deooPRqHn31alUNrEkJqTJvMtvskp5zQHS1?=
 =?us-ascii?Q?IXQmx3PDWE4XA048malOYyNjIHt6kOUYMeN+irolXi30asBUSUgwn+Oex1xb?=
 =?us-ascii?Q?tPja173q9+V230v2klX5FNlGeVO3/5xdLhW6GyUjfrxNc9hwS8uovTeY2C0q?=
 =?us-ascii?Q?CaME8BUbu+IEEUeyy8KrwEGXIWrRq58dh0KB94TqUniGe83C69pP9Exa/QJl?=
 =?us-ascii?Q?y59t+miEZ3PfrQlyzBwMLxu2JZFJBBmPwmast2xQDPGcUm90oGpSGoh5c8W4?=
 =?us-ascii?Q?sla6wwDMSVnN6kxPUARQLPssNhXO1s11mRGbKr4LFPiz1S3TCCFl5LX0MNLS?=
 =?us-ascii?Q?Xwnx+4ZmbgAiZLYRyHGrIOSXbQW11qsUy/UV4IMMD7zcw59DSP1raZYV7+Jk?=
 =?us-ascii?Q?Y280I86A68w5pzWsbG9CQFQR/9fcjZa5dnTFX51TcILhSNK/0xd+EFyLOWnT?=
 =?us-ascii?Q?iHtjNoRrHvRwH7zTWGFcD3G7US2FM4802JxNIPx8PMox6rEMuEBZymL+EcDA?=
 =?us-ascii?Q?5cpcIEv+te68kmbeVdcitOdgCwyADc3YDe8pRq3ic8w44xpB4yCR77kBUrvL?=
 =?us-ascii?Q?bSOz1+nnhkHgJzGuHNWwKZRQynFdG2Fs3v2pMeZvSXvMqqxbj+HdnmlonCC+?=
 =?us-ascii?Q?21QH+v4lV5E5EY/UzUKvkkU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db639e26-3299-485a-7677-08dc79245d3b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 23:27:07.0582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 B1HCFVbc0Lw7Nawm/I2hjzLjXDrBJ9vPBsIdJiXz1vM73sPNioIQAiVUaafyvZ2tYWO5ABt30wwM8Jsf1uImPM6gTSMjBtAWGxelVm13lC6fqvYJiHoKsZ2fgApGzV/a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8116
Message-ID-Hash: DZECV7GOKL5M53SJFWSMNPCU47SJGWJF
X-Message-ID-Hash: DZECV7GOKL5M53SJFWSMNPCU47SJGWJF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZECV7GOKL5M53SJFWSMNPCU47SJGWJF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis

Thank you for your feedback

> I mentioned in my previous feedback that this isn't quite right. There
> are cases where the CPU dai reports capabilities that the codec DAI does
> not support - e.g. when the AEC reference is generated in firmware on
> the host DSP.

Hmm... I thought all issue was solved...

> For those systems, trying to match CPU and codec dais is not going to
> work. Either we skip this verification or we have an escape mechanism to
> avoid triggering errors.

Sorry, but I'm not 100% understand about your situation.
Why Codec can't have channels_min ?
If the Codec can flexibly adjust to paired CPU, Codec can have full channels
support, like dummy DAI ? This means verification is based on CPU only.
Is it not enough ?  and/or Can you show me the driver ?

	static struct snd_soc_dai_driver dummy_dai = {
		...
		.playback = {
=>			.channels_min	= 1,
=>			.channels_max	= 384,
			...
		},
		.capture = {
			...
=>			.channels_min	= 1,
=>			.channels_max	= 384,
			...
		 },
		...
	};

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5419E8CCA9D
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2024 04:13:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 904B9206;
	Thu, 23 May 2024 04:12:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 904B9206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716430383;
	bh=rQnkDFswRoN5o66laHXECttno1xNd2CNVdiOGb+pCf0=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EGHrBWHYfsS0F/o0Oiyb5Hp3kT+B+F7TJItKOH6WgdrRf57nDT/3BUNONc8Se4yHD
	 qZ5S+e7O9gCpfgXGBBpA6Ubrr/l96spxFxIP9hRjkzo1JEPrf8kUT3u7F+4iTRuNWs
	 F9W8tv2Kb7mFc+c8PkVsRgwZXc3ArK8maiv4npb8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62DFAF805AB; Thu, 23 May 2024 04:12:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8606F800BA;
	Thu, 23 May 2024 04:12:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D173F800BA; Thu, 23 May 2024 04:12:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D61ACF800BA
	for <alsa-devel@alsa-project.org>; Thu, 23 May 2024 04:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D61ACF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=N5gJClLK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndXDeOVoeGM9rE++E6ski4D5xWIjdPnWEi+5tI/WEOWFPRhfZ+PzvGDPN1TyTf/AlVQugTGj3QhJNn8jmVvhngyPLEUSc9BFhn6MuStMDuC5EwRXBVFGQzmy5ttf8nuNATEft7kcVY3O96iNlyyn3FZC6E//2wLtFKKxwQBb0mgg6q38OUoX3l1WeK/RPmCzmYqdBPKhzx6L1A7JuGgJ8ZgU49+oHwqBRI7u8RNHxxh7gfG7lwh0vsgtBGNVsCrlfz8O87cZiImy0nRyIOiszX8euxZdREQ09sUxXG5EPtlEuc4KbL9yT/Yy65M/1NgtV4WNSfWN1330uI6f3lzKQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9n4OOqtWY/dOfH4XIQMvxRy9p95kdhnTeGHHR3tUhnc=;
 b=Li58Am0ApJyxKPGOhRlbO2IEYVb7E/otYL9L4/88oCMVMd772wOQTxUyyP9/mnxJp2TMU4M4elmZ1Eclz5zrnyWzFtD/GV7gpx5EcE0TUwBFDynOdrZQy0Kz175zRP2jsgbg3jXWyShMy+7/1vdAMbjW2dYFnf6nh/L90OsWacf5VQwVgDygkgvqTrvicpp+Hrw/XQC8ozSAnnehq6MKfmAPzSqfRSkv1zIodqw3atKtkAF2eLyo0wu6HZqTDJj+PSXuuQ7XKNJQOOhzs31jw8BjUtOc5TIorQIj3ligcnERBvvw6kqzxs7yU2bSypdsRO/ndUJHtTdCj0qgABVhng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9n4OOqtWY/dOfH4XIQMvxRy9p95kdhnTeGHHR3tUhnc=;
 b=N5gJClLKeO1hHEI292o6LInt9Xl6FKpnOMMmQp6Yc4b+8OyfZz0wDJjF30LTdIDDQlw0xadvuekDuoYcwr4twctdqEc53w22xhRYOfmlPhruMkwRbv/aDDG+URJ6KFKTmSRKeHZBwpPYWgmz5gM73ou0s/T2mpmjKjndhlvy5Rw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9434.jpnprd01.prod.outlook.com
 (2603:1096:400:195::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 02:12:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 02:12:25 +0000
Message-ID: <87zfshmg3a.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <871q5tnuok.wl-kuninori.morimoto.gx@renesas.com>
References: <871q5tnuok.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 1/3] ASoC: soc-pcm: Indicate warning if
 dpcm_playback/capture were used for availability limition
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 May 2024 02:12:25 +0000
X-ClientProxiedBy: TYCP286CA0147.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9434:EE_
X-MS-Office365-Filtering-Correlation-Id: 40197a57-9579-4d02-8292-08dc7acdca12
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|52116005|7416005|1800799015|376005|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FzFqd5l/pF8wSGHTXRgtgzLxLCSVooOwzNVU2FfxCs5DOpOJZuN0IHs+JltF?=
 =?us-ascii?Q?Uz1Zm9Rpgl6HXmzXs0jXinHgPZBxsYxVl8hoAPF6ht5/IW3gED8LMQ0n7pPF?=
 =?us-ascii?Q?p02mslRLXmBr1NXdKxZgcY5OwcPCrbep+yLGF7AggsxAA/yvTLQZ9jvBlETS?=
 =?us-ascii?Q?safjkJp299LafWyBj6FeT7k9GH1/IhCMS2FjNiSnyKjQTQy/JU7KvYJbaymx?=
 =?us-ascii?Q?9n9HideK0ZBXIQFctwNb842DQPoQqxxUowgyri/mstM9x5ttlZApJEa6WCbk?=
 =?us-ascii?Q?O/n2OQviB1hfigw8AJA8J90fLbdyjY9YRM/9bTEqUQPcd0fu+IrCt/XaGFyp?=
 =?us-ascii?Q?0HCg2IUj3GLIyoo0Xd7LYcNTJ5lorMDsjU2o96hr9/cQsaGwg9KeDIz9CcT/?=
 =?us-ascii?Q?cBp6cP6SHsN6sNDqQ/mAAG8QE1QMs9NrDKREF953F2F4ZCPbkKgotLOeOdnI?=
 =?us-ascii?Q?A+UEvUusnbj2ubE5feujIMwKlEE6ueU3PHYBfSSskN7Wo0vIkdHG7SyxM/Sn?=
 =?us-ascii?Q?keqaq6eCetttV/Fa7DPkrBnA3moYmRHLDI+P6VQsZr7PzRqBk7WH23SJz/HS?=
 =?us-ascii?Q?L2ZpOZURGUtxik3PGQVu4MVZ8MeLeKfcid4Wdg5nSPLyOU0Oia5H4uKLmTz5?=
 =?us-ascii?Q?LkIWb6kp4mWC93b+qDYJsTeUjRMWM3awk7F+8+JiBScanCGuY+n2OBzI7nQ/?=
 =?us-ascii?Q?UYrGCvB/LsK73G+EVl1seytkpTSGbVqpQzePVil0XFEOGhQLSFtPVCP3oTo9?=
 =?us-ascii?Q?MGQ66p5PEVcohUXe4BeLj/+evaW0nCn9HUeoObJ10txf5mvK/m4E1lj6XkRB?=
 =?us-ascii?Q?ZQN/9L7T1s0JwgPnvyAZhhgLU2sY8SpNSYU5ijsmley4nybsAKaWRzb39MhN?=
 =?us-ascii?Q?yWfPP6s5AG0yaPHzB1/d+bTR0C8sAUQevjkr1rwtXvKa3DbPJqp/fQivwkZU?=
 =?us-ascii?Q?8vVL8iD59Mz+9DMrJyboPTadDOd96IyeYwKIFa7ih8osUQrjG39sIyOdUEpE?=
 =?us-ascii?Q?ThqKgu7fkaF529Ct8qzmPG2cYuNndosiTYWGNM1AXpcMTPtZdF/RwTLwIvU2?=
 =?us-ascii?Q?gWi6U7/WpXOd1/KlGF0luHMZ7iJeMgpr4SP/URl4vvqXmLvW1KMwjbJsHDu6?=
 =?us-ascii?Q?KyaflqYeVqVsdN2gRntue0SVt4A9rQLMByaUAZJ2BdPy9UX5qZFW4LMB9tf0?=
 =?us-ascii?Q?KPH5jSR8VQ+YgU5MsWA57JPQUWBdn0h6LAS/eXdyRrL0JwqgiN3T3V/aleB0?=
 =?us-ascii?Q?kchLotgxPcX00tdH3oJzlWClNZSmntYbUfBddHZQMriPYe4OzAjsP5dHe9Er?=
 =?us-ascii?Q?l0k=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gYjGZOoRdQicZo/ueeMlUul5KneJjTSjTHXhD5wWI0MbZ1cwdbCQCbIj2wt2?=
 =?us-ascii?Q?zZ0AyoyjkV3NOc+s9KY41+e6IcEwkFqT2CUSWMvuetLQpmVjg8l7ItQQnNDp?=
 =?us-ascii?Q?4zxaudw1nTRixgm/GX5/0/QLaL6lrHW1OYzmklHYb/0w1tTFEKgNvhTMR+mU?=
 =?us-ascii?Q?YNrGKAmIhF+Z9bvg9sWVN0h/HUNj5Ha6W48XZroghgIuCqSg1jzkFqsK2g9r?=
 =?us-ascii?Q?ka0sPSktSzibDKfE1dvcEpvvsGeFZPFtHj+WCkbkCWyfOQ//aDTxfIJl+omz?=
 =?us-ascii?Q?hMOQgbmwD1gzjLtljVarOAT5LKstS3bqcu+TJK5IcE3fEcGx3taU1ewSZuNr?=
 =?us-ascii?Q?xpL5wD3vw+TQjCzI1z84m57pcDU71R7zaPxUyancXeW/73Q41W+9dwmY3fDr?=
 =?us-ascii?Q?R8hyEYCT8TWKbud2ba40WZwzyg7om4Cqa16h+HqgRE8GsqXoJdXhqhD1PGkp?=
 =?us-ascii?Q?j2mQp37G4l4CsFz7X8W2ZUxvT30fiVbz7/7R1ufFtOnklc3e6yK3QufafpId?=
 =?us-ascii?Q?BedHuJ9JirkIJYCNTlDovGITKbHViDfw6ip9xOBAyApCXwffvwq4E2pdbIoE?=
 =?us-ascii?Q?+Ze9K0uqfAlNqjbCEXHehyYArWgvCgQ3h0PH9cqSfBtw+AJ50vn64Tbjo7MM?=
 =?us-ascii?Q?jwSpZNDjtDeJ97Y2VTcJfw3q5PWlXbjMTy+RTyz55nZM8ZyzTwf0CC+DEaNq?=
 =?us-ascii?Q?p8sfxkv/l4oSYpCbE2v5iw6aLwWHNDAdb6pRvO0Dv9YyQdCPJSz4aQPsBtzE?=
 =?us-ascii?Q?GtdRoVlu42LmNdgPuEQLHMafFZ/y6s1VEZMFyk+kvg9Lt3FT/mCW9RzE5tLO?=
 =?us-ascii?Q?FNkshxOz6D89X5Nv8p5HA3THk//pOA/vwG2LQ/AkW5m5M1WNE9R6p0pD/Tm4?=
 =?us-ascii?Q?PvuKlXdxc9zVAXi3v4p9YB9eN09bnd+9b/9SLAe5HwXeacvT64JxQNiClnLL?=
 =?us-ascii?Q?aUwAR+yZC8gWNCZmnLLdFcr/P6uosowlaD/25xerm8etkVIcNZwGXkKQF8eq?=
 =?us-ascii?Q?XzHGzDmoxSD2BzpaECaC1NzSFdGF+kuvGSj0iQOmHK+B10WVlF/45KknFOqG?=
 =?us-ascii?Q?pKVaq6xe6k/AT+D/Dm6LJbnldaoCQpxQGol68Lc/lpsT0iJZ4GHLgvTeTnQF?=
 =?us-ascii?Q?9invd7RpVMlwTLepu1XZOc27qSHCH/AVFP/S3mar/iJZ+EBr8hFYF7tmzi0w?=
 =?us-ascii?Q?ZcH2aqHdrpsnV0gKO9qP4+eRnStCy1vKP5F7gxct96OOrzQM+A3U0R1vmZce?=
 =?us-ascii?Q?H6majlIoceq4UunCTVct+IKBgREOe8MlFJzXrYaRbeYlMz6sT0AS0kgjNRuJ?=
 =?us-ascii?Q?Zx2x8SZnM3Sa6UZluv9avzATcnzsyISny4nr1UwNh5lc8KTNROtUwdmtv2O0?=
 =?us-ascii?Q?glz5Iv9g0OhQxvqaspxD6WWRCLJLbSh8qcYOwLrv6hlr+dugfVyK05THAqPH?=
 =?us-ascii?Q?SeSKFTeOJpH8zEsHeOxSqy/BJN1W9vs9yOBMA+FZ7puNnLgMlKouizAbOAwL?=
 =?us-ascii?Q?3MWPP2TtpOPQTomtyzdrnU2zhaktToL6n43FRGdYpF4MarbzIrZ21q+XT0JD?=
 =?us-ascii?Q?6f39Uv2jJ+DfWG4U5urTyalSMlDuqwBb5b3nFbEm+ElTiZUR1kVfavWjeiZ5?=
 =?us-ascii?Q?4jNy+WFf9buByEyhSMx5oV4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 40197a57-9579-4d02-8292-08dc7acdca12
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 02:12:25.7942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ob50cMsaea3VLaNAZ+XEQvrKf0DwhxJe86NwtkeJwxSe9U9cO/9AtXr5HewaLFdfFnw5IfIQUJbI5qxZvFtkQQWYjVZ+5z/zkKN633MiLuXpg0GSsoFdx3YNL/O/N40o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9434
Message-ID-Hash: DQ4U65XOVSOKCNOYEXRFF62KSMLH2R3V
X-Message-ID-Hash: DQ4U65XOVSOKCNOYEXRFF62KSMLH2R3V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQ4U65XOVSOKCNOYEXRFF62KSMLH2R3V/>
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


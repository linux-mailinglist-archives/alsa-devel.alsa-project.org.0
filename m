Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 531B28CB664
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2024 01:53:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4553200;
	Wed, 22 May 2024 01:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4553200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716335614;
	bh=OZ1I10yoFAbixdaqrx1bWYLBgB5alo/uIP+8BrAzCYM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NiTsS3/Kfnkyw+vf6nyb4dbvHLXRZ7H/GJs0ppb8iRMtj/ucTjIUX/uantWYj4/1i
	 G6rjUp28UAz6wK1Jv5JUe9ulwTlNMyc7kTsRZoeJ53IfWKDpGHJMfVR/LdZDB1slMM
	 8QNR8jONkMNNo8Z5UZxAxnWkquGlJIebSyNY90yw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A59E7F80525; Wed, 22 May 2024 01:53:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AEB5F80525;
	Wed, 22 May 2024 01:53:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A834F8026A; Wed, 22 May 2024 01:52:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59132F800BA
	for <alsa-devel@alsa-project.org>; Wed, 22 May 2024 01:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59132F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=SQeCT3r7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZH66FiDT1hvUnmW2R2xhHBaGNyH/cnuRmLazWx5lqaOodiLDrZxPgU/DvGrRAIV0hwzodB1U8p44O0i/vw6tVQzMcq0px/ha3qZZ+UVNl/YtHEUGFFnrKBXAPfaeB+tmNPwfsEb91Inkq5nuA3OMDpvqWNzsytDEUhb5k8ZGOyitODXAeJbDE5xu44wS9IWSoK96yBHaL5cTreIEZ++Dr7OnvrZv8izaBaJTUpp5EkvX5DTVb5XxZ51OvdNhpsE7tbMOIcaDxyC1XGpyoyZe91GVgmgzzdxCKqeX2Cs66JPsZMTdGa4GwQ61I6wkiByQlJ51xx5PKG3DT1IHU0B3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdY9F2UjYvC+mBbfRn00w/ZuJdpaFnT0LJ+WPxM7dtM=;
 b=nh+FcSvZaMsRTMP7gaw3PoXBuvy1Zwso8TPeTyzV+rdkgOKrEzhqhzTpoSrX4kDY8JpOKsZGCxF2HhY4TvT4TOvPlFan5x92959uw4l+Lf3xl3TtT0xJxE8Quifuji2hFswVVGvnyQmzedPeXJuVv5VNd8nLnJCkOrxjyVitQd4tgCpYgh8uBOZYFYBR9/8+y2hu+x+ShjAtsFbFm/uchbv4CTQxTJ6vr8j1Wo/ejVBjBWaXneBdMgydxC9VgJ/DSfrkI8KwhLOfR7L6nGKPUA2PSc1JUujNTqqGPuhMNqQKlGHSQ68fgMKOnw0QCQOWuXNcqim7Kx7fpSe911SD4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdY9F2UjYvC+mBbfRn00w/ZuJdpaFnT0LJ+WPxM7dtM=;
 b=SQeCT3r7iFi+v5LLo5jCX/AiqMqijWdJU29TB9LjWhSi8Q49PmNiYGZxzRCIc/Q6epuKa7lzJSZlk61ciKAXvXdc5Xnzc8xSpHhT0G7NiFbn5OxrGiPjq5j2OwW5t8ivBr0v5Y04GK7nNfSagShyCCY8KpVTTWT6yK2CaLGOdWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10180.jpnprd01.prod.outlook.com
 (2603:1096:400:1ec::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 23:52:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 23:52:33 +0000
Message-ID: <878r023epy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,	Amadeusz
 =?ISO-8859-2?Q?S=B3awi=F1ski?= <amadeuszx.slawinski@linux.intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,	Alper Nebi Yasak
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
	Maso Huang <maso.huang@mediatek.com>,	Matthias Brugger
 <matthias.bgg@gmail.com>,	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 2/3] ASoC: soc-pcm: Indicate warning if CPU / Codec
 availability mismatch
In-Reply-To: <37341c4c-3a99-4f71-99b3-efda2d2008e8@sirena.org.uk>
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
	<87jzjpe5vh.wl-kuninori.morimoto.gx@renesas.com>
	<77e9221e-05d2-453f-9ce1-ff4a4b53d09d@linux.intel.com>
	<87y184cbed.wl-kuninori.morimoto.gx@renesas.com>
	<7b430ea3-3ce8-4ef9-8440-bac02993f676@linux.intel.com>
	<875xv8c6dn.wl-kuninori.morimoto.gx@renesas.com>
	<3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com>
	<1f8e6e3c-a116-48d8-991f-4184d1eebc79@sirena.org.uk>
	<ec063ea9-3d72-457a-9c73-46c5f5b1f6e4@linux.intel.com>
	<37341c4c-3a99-4f71-99b3-efda2d2008e8@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 May 2024 23:52:33 +0000
X-ClientProxiedBy: TYWPR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10180:EE_
X-MS-Office365-Filtering-Correlation-Id: 0966736f-5758-463d-1635-08dc79f115a6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|52116005|376005|1800799015|7416005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?71nqJONeIPCecxswfu9bH0e6TFc1Q3Dkxfs0wqgFZf00yo1z2xZRIIQebA6m?=
 =?us-ascii?Q?t3QHWuUtkUYl743LFlnaxsPsrOTwRANhk4qKYf0QNMh56rJjowvrxww67Nnv?=
 =?us-ascii?Q?7vIA5nU0gWo/4MnbrBa9ondd+Z8JYuSotuzwfgsh7TKpvEnOCls2FoZ2S+Uz?=
 =?us-ascii?Q?W4OUMs4vN9qJkFIBEY9RkehahCAaQ52P+40HnGYMuOCQnMzMSugXSopB/5Ij?=
 =?us-ascii?Q?YapMlsp9CtDGixqqBd64NfYc0Uor0oQhj6TDqtRRkdZYfJHezzluPK+w8MQP?=
 =?us-ascii?Q?Ie18pxbI8za3BTTUZefYW3CCimUr6Fuqe3YosSdtqw/SuSTRmM1TBwuveL1+?=
 =?us-ascii?Q?3IM9RzqUuPvuASOgKjyyIvUty1KW7uhssTR0ai1EL15FP2U5NwRX+tvSfvx9?=
 =?us-ascii?Q?wF6oS6HbWSoY5u2BCZESEebRYxl0JRkrn5T5+TB3vVwV1YQ9KS9rNXyEfXqe?=
 =?us-ascii?Q?LF33aXXL8I59+roc+PnR9Pr3uKkBagE2hyb0KGv7KTTbFwD8Rtab4OQYaTUq?=
 =?us-ascii?Q?8B2lkZNsggfoeraY5Sa64CVsbulUnAVsYtLOnAVY2paoUxhxRNfZj7mQqouU?=
 =?us-ascii?Q?3DD5TrcQqmlfdre8Dyr9emSBDzeuZX9rx6wgnaCCwDw9UzwT/6SqiEvML4aA?=
 =?us-ascii?Q?xhJOKBeFI71iSxO40cvhoYtzxzzbxfpqMvTwY9RWzOCwpCD22VK9l0Qung0a?=
 =?us-ascii?Q?DcCwJOyPh8ofdE0ewBepdFIA7Fs/8ZPCGrynTGZmGqz7+mKnjwBCaOhQpl9P?=
 =?us-ascii?Q?oeX9wns0Kis9HLCFJLhTkunIpdvYD8HeQ4nOnuQjkA2DOwU21R2h/53zIyM6?=
 =?us-ascii?Q?jDgCuhRIFDUfJgM61aky24DRd9sWVOiR7utIuro44BA8KRporfr9ut9VXR3S?=
 =?us-ascii?Q?WU9xuwbupHAKviCADnksEoPCAoIgSoTYdxTXVtrLNm7qJndSaqaR+ohOrS5X?=
 =?us-ascii?Q?fwUdWs0/a1+b4c9L7vPB188INcAlLq/VY+uMFynMPN/Z2VWd87kH3hMXqqbo?=
 =?us-ascii?Q?w9rlLsxhu8pG0+6jqYF9wmczj63El1tFS/IKIqtVWHpy2imA2aM8MrkxPN5w?=
 =?us-ascii?Q?22Ah9QqZinbJcnezUyoG44aSwnybjHIIAl55SVdI+LEPSG1E5GHHYlvujdSp?=
 =?us-ascii?Q?Itjq/KzlRXDeI/TZfFhYMtOoQjUz9nQHiylxdixKaUv62J0BJgb7Ui0uzbDy?=
 =?us-ascii?Q?H9aIDyhrd2TSKIXUH9DUt2IubwfzIMMGzSv3AOCHAujuCt7s/MBJVS9L2Zdu?=
 =?us-ascii?Q?O/Ulcl2nC7lysjO2eCdm59mjRSA10DLPMCTKZEBhbc/Z+2pxLdMppaFf6SNH?=
 =?us-ascii?Q?7+FMexvucVXk6HxUQQtKnU8DXFjU72Ud3MpZ7y75Xo7pBw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(376005)(1800799015)(7416005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?miDCNn8tbQCLnOXyQ3YXJws6p/lx63EKZT29vekfa+H7JP/EBzVHsT9xv7p2?=
 =?us-ascii?Q?pYI9qNdgMqQs5pIyY3RpQu7z54PjYp4jUwE+YS+KlHugDL2jH6gcUOef0x4F?=
 =?us-ascii?Q?Ddikt/kPJ+FqiXS+Dkdx8zco7RjaEVKoyAzlN+SWtDyr/2RqmDB/KQf69FbQ?=
 =?us-ascii?Q?4Wub8tm7jHpbGVMI1mqBuHuShM+4R5LuE8mxgYf3dsRK5jmucgnK9fGDfSDP?=
 =?us-ascii?Q?pMkPYSVVer7/ERvIDu9Qa2BppzyuZ0l3/Qn0ADXYeSByaK8CqIUvsDOlRDyO?=
 =?us-ascii?Q?1zPLiVx5aD/XF2zArGwW0BETcJ8nHDR41/DFdQomCq2B17QOzL3c299uzId0?=
 =?us-ascii?Q?+LTrv7PjKNzOJQ+ovF+6njV+WlSi0u4jgnsIUsTkMpos+xS23Rcp+QX//zvV?=
 =?us-ascii?Q?xwaWqVuJEK+E+cwu4Nlc6uMYzkwFxpFLXKBtbPakJYhnk2Mj02bagqGr5LjC?=
 =?us-ascii?Q?jVlwRvwiwEsGRStQ+rxIfMINIY/rg0yu9wAeJfRWaP8ps5tjP4YW3tJNWbuX?=
 =?us-ascii?Q?EJz7FIdJL04/B8RLzkt9vPM8b5/fLhG9BAW5EW9bUvnP52RdspyDnksgZdsn?=
 =?us-ascii?Q?96I4FIaSQZhcmLsU80m2+ZgGBXzA2RoTok9hhWoiMCzSEH701QjPLW0U6JtQ?=
 =?us-ascii?Q?Tvy9UAPTkyWYjSXbH4SLSp4VcIIKU96cOV3aNKEhWP3byUBDTj5B0pTKjIkG?=
 =?us-ascii?Q?teeXSeJTHSvXp4UQvih/rcbyGliwrdiEpOkE/TlMS5VwsDttQEjcE9oUMNmP?=
 =?us-ascii?Q?As4/U7d4EARFtpGoAaiC/W8/drfwy+q8PaHSfxVxuQ2egsR6464j9HjYXI7Q?=
 =?us-ascii?Q?NJNiZ5mfVbSz+QJiJwi+FmhEDDP6I9j2MleOPE0RFkGZAH5CZOsF9Tteo7Wj?=
 =?us-ascii?Q?o0iEHCZGmmsYnoHcW5zBFr98xeOuT1AU4/kTbFvPK17TMJz6XOxO7925OTSS?=
 =?us-ascii?Q?eJgaRddT+acbNWGBm7EopKK00YQLbl0YvjsRtnNtqLpeeIdOoaMEaQ8J/tWS?=
 =?us-ascii?Q?8dWKkVDXwnRciywT8vHujE/0DCj9YZqiLD87nfscYPzgYX6Y17TpPvUa27eu?=
 =?us-ascii?Q?WMnPrJ+isdQrC4HyCRYTIBAzz4YjTTr/Pxv6Fsvv9YUgqt0N9eisI07c3mhK?=
 =?us-ascii?Q?7Pt5chDE147hlZj9Ws3JRE8uYiypYdipqTJZuN488uqwREDVf7ZXD8m1Mmad?=
 =?us-ascii?Q?KTVlgNjAixGmPM9wWiPhweKgMZWZwXR4Vs8FKC3IqyNYePhvyRpnwUgm650b?=
 =?us-ascii?Q?YMx80sBGU8aUQsugklvxYUohwfztKTR/7AKR7/DyAMX5FlHwXuLozybi5e0t?=
 =?us-ascii?Q?xp2GFW/fjOARlQ31NfK+R6QwIdqqUsVcoznqGX3EKX4bbLOPIpZ4shqeX0Zg?=
 =?us-ascii?Q?HwHf8TqLvTbxh3nywTQ9hTm88l1G0BFF91Z+cbkOnpDj/5h7V/WGNSFmsWEB?=
 =?us-ascii?Q?BPeSMqk0wAGHtf0TShRmmhTDQScqN9BS//Fw/0vyOScpcnz4XEBQKUChgJaQ?=
 =?us-ascii?Q?KPEbabAG6t9xnkELIfwKKJVrUSYV180qJ2c6G2RGp7ZviTNspXkxxpcseeJR?=
 =?us-ascii?Q?3p8htUOc6QvzmwQG78jtk/r/QgKxgfCSJrWem70ZTbIiUYZ6vcjWlZjiiExC?=
 =?us-ascii?Q?EVB7pneDFBHwV/zBXzH3NKA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0966736f-5758-463d-1635-08dc79f115a6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 23:52:33.8502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cyC86NbTrd9eZxHZXiqfMfynZi3GeKIe+z0ThLR5DQz7Genda4yYlA61qbS89Dqg3MhD4kU/oWfldZzjLbA6yjDbZnuK/adym7J9Tz0c0JDlD1iv5Pr2n77Rz7hk0kfI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10180
Message-ID-Hash: YVHB2AZE4WBQ4ZYKY724K67MINKL46OD
X-Message-ID-Hash: YVHB2AZE4WBQ4ZYKY724K67MINKL46OD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YVHB2AZE4WBQ4ZYKY724K67MINKL46OD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis, Mark

Thank you for clarifying the issue.

> allow me to give you another counter example, beyond the AEC reference I
> mentioned earlier. It's not uncommon for CPU DAIs to have loopback
> capabilities, which are used for tests on boards where the codec has no
> capture capabilities. I think it's a feature that needs to be allowed,
> not a 'wrong setting'.

This helped me to understand the situation.

> > For now we're kind of stuck, what I would suggest is just to remove the
> > extra check that both CPU and codec dai can support a direction, and
> > move on with the other cleanups suggested by Morimoto-san.
> 
> Oh, I agree - my point is that as things stand the framework really
> can't cope with what needs expressing so we need these things that don't
> look quite right.

I think same situation can be happen not only DPCM, but normal connection,
too ? And my personally want to have validation check as much as possible,
and automatically validation without Card/rtd flags.
 
In case of ignoring Codec check on DPCM, it allows unexpected direction,
I think. For example if it is not using dummy DAI, and in case of CPU can
playback/capture, Codec can playback, and user expect playback only,
in this case unexpected "capture" will be available. He need to add
playback_only flag, but it is not good for me.

Can we avoid validation check if DAI has some kind of new flag, like
ignore_pair ?

pseudo code is like this

	if (valid(cpu, PLAYBACK))
		has_cpu_playback = 1;

	if (valid(cpu, CAPTURE))
		has_cpu_capture = 1;

	if (valid(codec, PLAYBACK))
		has_codec_playback = 1;

	if (valid(codec, CAPTURE))
		has_codec_capture = 1;

	if (cpu->ignore_pair) {
		has_codec_playback = 1;
		has_codec_capture  = 1;
	}

	if (codec->ignore_pair) {
		has_cpu_playback = 1;
		has_cpu_capture  = 1;
	}

Or more detail ignore_pair_playback, ignore_pair_capture

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F47A8CDD63
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2024 01:16:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA4B4845;
	Fri, 24 May 2024 01:16:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA4B4845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716506179;
	bh=yPAcRGLxcqe2UzwuuMti8iaOXMeOzQLwz6fL7ZVhJGM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O0r2A2lsACanTU7lRu1nLlI55LLf27YgU9w5EDhVGdegLy7l+LQooM/C/0uR4T7zK
	 mc154Nlew3q8ShUzSCNW8JPnT/U5x892bNmwTREseBW8H8f87NHiOHo0DlyUKNoBKV
	 Uj/nYwHkmleJqXXBahTfQpNaRbdlYeTbMoa2st+A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CEBAF80587; Fri, 24 May 2024 01:15:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B32B1F80580;
	Fri, 24 May 2024 01:15:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F109F8020D; Fri, 24 May 2024 01:15:42 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8968AF800BA
	for <alsa-devel@alsa-project.org>; Fri, 24 May 2024 01:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8968AF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fCAoOWow
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQnYwiD0Emognox04Mp4Jue+SIRNdGOo9Fqvr5/kYo7uPj460uhH0xjUbum8DfYV60ugGdeeKYsA2SbKU6Gokh+WWdMjEjq3f/OF7UNTCYCIDF7plUlJxVXM5ay7NHHyez03a98CjtR3JzQ5fP8anyM8jGs2D2Bb2uUSVVPguuZuha39LpnoEMZQX/4PpVLtkBazBrOuYZoFU9e2QZysox0wishlOxcCjWVPE+dsE991fkfmqxb4zlQawklGhb8kLQ8VV8CTNIu6QBKdmFo3Tw+lLbrD8xKZHlfY9QKSOU+T/Rwd+r111S9GfF7Jgv+zBlS78JPlesbueR6eEbwyVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9GZCQdPG2q/MKKvCiEK8ygCsDz6PURWBgGCcX/c2fM=;
 b=GpWSpwEwB6AiMyp+Mw/aY3MMLeX3a43LaPA/rzJGI+vzu61PYPZDHJNTe0c8mTQLlLeA5gqWVfcxR69H/bM89xMM59eKooYKqwdgtNrz3N3/LYcUmY+QIdNQY9/4T/9Rf2bo4civqsNlwBKr5dzDnedCeqU7wyv4uBUksew7gZlvjXip6iphKZ3XxlU1ZsVWpEUenX1HvZODvxk2D4oZmVal2AepvCKqSs1TCQhMyWbhcA3aR4hRKm3OD0T8k9hRAnLAEAUw7BHRaHTWlHveR8y9SJg0hDcXWFwNSCxJnpO9/3HzqilIUbMYcCBztGIuagsPqY1NLRdzY1ephISZrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9GZCQdPG2q/MKKvCiEK8ygCsDz6PURWBgGCcX/c2fM=;
 b=fCAoOWowSG3rASRdKLxxNbLmZ13B5VaIRc5aTt1sv1n4T2iyDC/cGYT4+pDsr8T7ow7DtvEL49eW1C2Hbik1JHTgViKKcCTpb1UMqaVpM1rnk6ol3h4XhbWVhtLIAvWeU4axXp1EbDbRHfxXL5BcUxEq5Ix/iUoZPHOajHPDTnc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10996.jpnprd01.prod.outlook.com
 (2603:1096:400:394::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 23:15:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 23:15:22 +0000
Message-ID: <87jzjkce7y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
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
In-Reply-To: <37615d72-762e-4ec7-b625-e275a96b2780@linux.intel.com>
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
	<878r023epy.wl-kuninori.morimoto.gx@renesas.com>
	<37615d72-762e-4ec7-b625-e275a96b2780@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 May 2024 23:15:21 +0000
X-ClientProxiedBy: TY2PR0101CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10996:EE_
X-MS-Office365-Filtering-Correlation-Id: 906a83ad-810c-4acf-cbdf-08dc7b7e3862
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|52116005|1800799015|7416005|376005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?J7H5q7mnT5y2oZm38Hn/bezXXXIVFvBXFTYj7wfGNiIiVvgqj/hYgkMFqQ0z?=
 =?us-ascii?Q?kyynpPKr+qAog0VMsvx7CiqsptSlxbcyx0aCcqyV3bJBy6+D1yIC/RlCot/w?=
 =?us-ascii?Q?ameG4uinbJQHYk3bjVagcSpFLiI/1hxjgVIrX/MW3LYyQth9Ac3tUSXAbdcq?=
 =?us-ascii?Q?yxKyTuKmrsUitX1x5Orjmgqq8qRyGmnIuyNRWmJCIkunaatR3zp+RMebXc9C?=
 =?us-ascii?Q?3USX81pva+MQ6i5IsnluODomZ45GSrORJdQ2HEZSQaBr5ljs8WLJICUE8RLx?=
 =?us-ascii?Q?nnFaAIOgU9qheOSxh4/CxIm11ivxD6+WJ3u8THyzvEPYrJOhhOR1aRR9UaFL?=
 =?us-ascii?Q?jQVRR1mSmstKhdhA5panjzzOqG+0tFBYr9oGsCAgQjLU/FMk0K3YPlBL28XL?=
 =?us-ascii?Q?vy1OaGKJYoKLr9oBN5jKUyrzG3j4QDy00V4lYtUpdiVNTEe2CVt5vJTF3QEm?=
 =?us-ascii?Q?NzOproFQZ14HUzrgXNdgmFaR8r4BpNyaHrkY00SYtFwl5IfpPHabRCr8v95U?=
 =?us-ascii?Q?VNHMG0Y+1cSj2RWLk3mOQS5XaMX00h7OZzhQW8C5zfcORCTRWV68qg3D0lMN?=
 =?us-ascii?Q?e7fwrHPcg0dpEDvr8FL7v9brbIgBVn3VkoRQ1TVRIQRd3Bk5WsWNqQpWeT2f?=
 =?us-ascii?Q?/prDBhPZiPPS6ujU7gyPBd2W6bIHZxwp8kJwCt6iOPvm/B/2wzQvsK1R32/4?=
 =?us-ascii?Q?gjuf+0IZ1ozbxIjyeQbqbb4nS406F79qie1KqaTdVQz/hkHqFt4ay1c4N658?=
 =?us-ascii?Q?XVZddaLSkheeQLB0mVx6Glgd/dsAzEp6xvBiPTE7+pdgpnxFQK1IaW7XzVni?=
 =?us-ascii?Q?i+1LVarQEvwN2SIQKGCVteAzH3z20TCFaHSnXNZ9pG3ZNl7XPtclnTOF/Dwx?=
 =?us-ascii?Q?Ots5mIUmlaHFhuvFL/BmefexYmIKscDaX1OqKGoUYRcVmkI9eREyvgNIME6l?=
 =?us-ascii?Q?gnVhS7gYfnpvJH6gHg6ZlEBPybGVpJ6tStr2cj2BHE5O804/hpOZkwGOwsZ5?=
 =?us-ascii?Q?GKlx43TgxlhBM5WK0lZnOu8b81DyVIjNGQxAdzdUzfrT6J1EdUZORNB3khcT?=
 =?us-ascii?Q?oZIBrsfz3trZPSx6m8p2cO8+uV9z6YG6wOVHxO6HUvQgjVIiGnDumU684EQ5?=
 =?us-ascii?Q?2/7KTbwFOs0voxATghKvyBXYwMWpatmC0iPKJVdmp8VNPe1GXdAfB0yN7oxv?=
 =?us-ascii?Q?LJSdUWBBvByqaLQN7dnaB6R0IWIZeGm13LoCCTAUEDjZHSbrMRXzypfEMLIM?=
 =?us-ascii?Q?xOKDwv43+ei+SiPIs8CuSuejbASQzokYPeyXsyZJIUGthZ0TexP7fxHghfCY?=
 =?us-ascii?Q?ZSjfExF8N5PQByqPIObeNlnHziV8PT5LXCixKb0HB1w9yg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(1800799015)(7416005)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GyH/9kVRWA48lrPtFa9eabXTY1oLZHwGkpE7rUX4zzRKFFIJY7AT6kAPEeyd?=
 =?us-ascii?Q?Woi8ziGtAmy+OfUz43TZ2nl+j9f/VOu5GeKNf93KGGqc4oEHXegUWlZFYZRd?=
 =?us-ascii?Q?Qm9EVs9FlzbmOzFZhHvKynXxawN2pLINgszcsnW51VeXyLnYdx0357ZLXloJ?=
 =?us-ascii?Q?1g8nOFIhdqUVFM/Z7QFmEWiM7+tTUYqUX5BHshTe+vKc2TvCm67bGSusRpfk?=
 =?us-ascii?Q?nEG8/xdoBp4MDB4bgk7xE8pVsMyiqLR34mv/Hty1FrxoEaGW2bfEKAibLa7t?=
 =?us-ascii?Q?wm/pN+X39nTzAX8jI+NZjljJhMPXVPFVG7yEmSStJZI0oOgzvR+ct/vtrEgC?=
 =?us-ascii?Q?J2ykad6RwHfEcFV6HVuHGad/dGxpEcPB/tLEqqeI1ojCNzOVN5s1fAoqF5z9?=
 =?us-ascii?Q?fjJRWuaWDDHuGQeYvZGH7PtopUQ7c1TeHFHW+G6+JZaNKR6Wc3ykW6/YyZTw?=
 =?us-ascii?Q?xKYXqqClT+OkrGJKhD/Q4wbUCExcxYtXobW6CP+yZRZ/6cxMFw1fKG/Jt83c?=
 =?us-ascii?Q?pkJ7ZEFC4TsUDnHpFw/JOP8iiDoyOG9/0rlAISqWzqVI3O4DlHJmWow4M3DS?=
 =?us-ascii?Q?jFxQWE6ey5uuh02I8wUsy3zPooBtKMnjqUra6AtX9usthgaVlfPRDX4lYp2d?=
 =?us-ascii?Q?0h+Qv/AFnv8IhJKER8xGL2LQTWVBb8F5ocyiaz7fHMaMDPqkLyvXQ4jeztvS?=
 =?us-ascii?Q?al1cDfiSvf9ltli1k6vtVUM5bwLaBKUHU/1whH7c2M8Ua3UYZEubKElrS1Bd?=
 =?us-ascii?Q?8sCEp+AzxpscBl088hLLjee00lBPI9j+tOYWD1BkWK94OIwNX2S8FzppqC1H?=
 =?us-ascii?Q?QpvRBfjyvZJVWU1wIaUyRqvXAs1S3IuVrIrpDypRFJnbGjd0AkfWyl7nMtWJ?=
 =?us-ascii?Q?e6Vi1d5Pc6U8cnPyz3vU3SHrGjtbJ+cy9yytO7qY5YyZkY9hBucIAYhLPdtw?=
 =?us-ascii?Q?rjolrLxWrZePszSAYW6Y4Vrn+R03wmdHSH9LA7oVD2WCfTVMNt/Prhd3nXLy?=
 =?us-ascii?Q?Y2Bg8vP2JsD4auxbXi4gLkDqmSU4DCG3cRgsEMleOp2jr0mbOuwJQNWX/VQG?=
 =?us-ascii?Q?Kuky431wnJg1AA55OKjQ+tt9jQvATMyxtzqCspzRbI5SCKwU3YgwflOIny9S?=
 =?us-ascii?Q?pScdNof7ja3CxVe0mcUTOQkOJZi8kYBW8gpuZ9eT94c5Suy8nJLhFW6TZM1r?=
 =?us-ascii?Q?z+L01suW5huaWyYBji84TEXEOOnuGAjQYJQeYo/Ub9iMhiZD3it014GwX7xJ?=
 =?us-ascii?Q?C1u8d9uZ2g2EW7OQgUd0/lcCNveodV5x7fho7GoSw05P82Pbh6DUrHnwynBH?=
 =?us-ascii?Q?Qo5WPYiXherj/hyjvadNfP6W9sB6iWzM5jB8jmpmlfweHnyyVeoqZuXxDbMN?=
 =?us-ascii?Q?hsNYBq720Bj8hJV0WvkN6qoiHgX2mUiTNcJhISCESCoY1ST9V7yyquoc7+Cl?=
 =?us-ascii?Q?/+nV1ff87QYbY16VpfME0rKIbgFvqaL6ebRYfZuNB/vKzMNcLiPtlytTr8vn?=
 =?us-ascii?Q?3KbOZEvQQmY4kqFTXaYezBD0nxM/BWNDAk2QixHJjhB/5ZYQqfOeWymVjBB+?=
 =?us-ascii?Q?kG6luLT7rmDk1l0OEPLdS+KVSyjOauRfGOi1z2L2Jj+JHQoGIonUxrs21h+0?=
 =?us-ascii?Q?z/PsmsrJ+tAPnQmkynk3g0w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 906a83ad-810c-4acf-cbdf-08dc7b7e3862
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 23:15:22.2853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 M9WX9d3RctCXuSuWuF6Gt7Nc2baH2qJxxXw6dGDjo2c29b8haAhMApCv0mjCCkk9vstjH8YwO2VesRGdExMaUNn9LQzpRgYgfFZ/OIOXxlK9a4CxTT1kyaMD+9QqPoo1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10996
Message-ID-Hash: KJQHZWXAHLWBPHDZT4ZJ5PJ27W73226M
X-Message-ID-Hash: KJQHZWXAHLWBPHDZT4ZJ5PJ27W73226M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KJQHZWXAHLWBPHDZT4ZJ5PJ27W73226M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis

Thank you for your feedback

> There are two options
> a) we don't even try to test the codec-cpu match in terms of
> capabilities. That means the same behavior as today.
> b) we add a chicken bit for platforms to disable the codec-cpu match if
> it breaks specific platforms.
> 
> The problem with b) is that we don't know what platforms will break. I
> reported one example that was caught by our CI, but there could be
> additional Chromebooks impacted, who knows.
> 
> My vote is a).

Yeah, it is a little big problem for us.
Let's keep current style for now.

I will mark it on source code when we remove dpcm_xxx flag
to be possible to resolve someday.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

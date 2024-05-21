Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CF28CA5A8
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 03:16:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D009D1F4;
	Tue, 21 May 2024 03:16:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D009D1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716254195;
	bh=N+YHWGEoT5+93gukTrdNllg/e0yt3IT9rBgI37TtJhs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YSWZlBjW1SiUKIRsOmBxc1Vu43mG0Bko8+1aGaAntd/nCklPTbvLd/FH3JDcBBVcm
	 snleS2pqMoW0tZVGyYHLo3QU3IZYgDdnQPogApHCQeNA+tbL215T1X2chAya26HvUp
	 m5+d/0Q/X1RCfneO8h+h63cB7SDey4dTyYDzfbgg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE8F0F804FF; Tue, 21 May 2024 03:16:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70F49F805AB;
	Tue, 21 May 2024 03:16:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8463FF8026A; Tue, 21 May 2024 03:15:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 087EDF801F5
	for <alsa-devel@alsa-project.org>; Tue, 21 May 2024 03:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 087EDF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=HmnUKTsc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5x42fvYd0S6xe5ef8nhnDKw9NcG872kdocjsJD00PCJNkDsZrwbSde2T/CJt4+lvat2LVaQ9ZhpfC2B583sjNlC4zpk5C0sLeaJ2i1v3TN/R6U8D6+dV/afz7xRBuldrTf+imxiVP5pkPeIjUNXoqydWdsBQxLFUAMU3+33Q9uuIrbyvP8PQcIDCCeba4EtH613V6znttd+d4j/x+aW/xPaRIdZvnA9ytAYjYnfsIu6qAAAfZFCUia2w/mg/2gUYUggbzlDDeXAjHi1mF67dlRGUweYk+Cd4O7Hb/mvg4meNPTRQ65uAdY/BOUf5XXTg47DSQJxoky5hZpQoqD/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+YHWGEoT5+93gukTrdNllg/e0yt3IT9rBgI37TtJhs=;
 b=oBIMz0nc9ldAYtxu6O9kqMyTKpcLrkEQWJ5XOm10SDdMi3Xt59aYyNZEJnhFaKF+1wDZIzFqAXtQFMvOwfgd4TrS0nzLq8NGrK1LvhUaJCGq7amLdKkKlxSeQhyS1B1KIxnLjWK4nUbui3crpXKArQd7TdHdRV+ic5S5PNhCUfPrjz6KR4qvmYXQTyHYDKczfmUUwarocMqa21A41/1NSdqgzW2i7GlQQxZtyIfuWqLDIDortVGXFSXdgcbo7JFuoQZ8MDFW1XykmHY27eGaVaSWEDG8AeaDEi4p4Em7bTFHe/HyC29Uw87+JGQMBRN95UDmN49wuQwv4aRkWuLsSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+YHWGEoT5+93gukTrdNllg/e0yt3IT9rBgI37TtJhs=;
 b=HmnUKTscVZg9P/q4JnJmfWZDHuJ6S5nczED00uqsrwLjl0Ut9iHYkCRKzHIYmyVTw3IxfAsl3BWs9qBwLQzW+aci3eXb3n8WNNKHxAGYNYxmlmT6Kn8qIcXeS4gSxPbaKlLsREBKJ2+8wtIbiTSQ/bQjRsJrL3+MJTuPDlVbqCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB7901.jpnprd01.prod.outlook.com
 (2603:1096:400:114::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 01:15:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 01:15:33 +0000
Message-ID: <875xv8c6dn.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <7b430ea3-3ce8-4ef9-8440-bac02993f676@linux.intel.com>
References: <87msole5wc.wl-kuninori.morimoto.gx@renesas.com>
	<87jzjpe5vh.wl-kuninori.morimoto.gx@renesas.com>
	<77e9221e-05d2-453f-9ce1-ff4a4b53d09d@linux.intel.com>
	<87y184cbed.wl-kuninori.morimoto.gx@renesas.com>
	<7b430ea3-3ce8-4ef9-8440-bac02993f676@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 May 2024 01:15:33 +0000
X-ClientProxiedBy: TYAPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB7901:EE_
X-MS-Office365-Filtering-Correlation-Id: 21bc746d-f7ca-4847-636b-08dc79338377
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|7416005|376005|52116005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K7paMHC91DXLkkEuN5TRgl6dhu9lHdWJ7ydq52B3qcyQyN9fb23cUElVyK34?=
 =?us-ascii?Q?d0x/gCrDDUO1zHsFZVQIqaO/0tfhvzRhSrT8t/EDNTASFJDRT3Kw6bCnIFkB?=
 =?us-ascii?Q?aJbPfseGp0iSMVDitxw6tAa6oybqG7xF3XYQORVLmoDdQO3OMjr/6a6TRL12?=
 =?us-ascii?Q?taMs60PEbbLP6hNWhDX5nj3har1PsahlMIpP2b07skxIaHARRQKs30CFfHxD?=
 =?us-ascii?Q?6qCqnv8k6673xsjirAthNWapNhUlFNyeU2HjEIkB6qFFG1CKHC54xMAxrf2r?=
 =?us-ascii?Q?PZDhe2rBRDj0/aex2w5TTUQewTuYGl4B7jFOLO52gbrNUx+nAh0PaZEfggRz?=
 =?us-ascii?Q?vEnT9AxO1wb8U7pGKs0jrsHQNQqDnQ43MGyGNgdHKKmtVj0yTtRdV+TvL4L2?=
 =?us-ascii?Q?UiJUBuOvawC3B6p2pLRxvXKV6nAJHHi+2rHEdV/Zd4kxBou5T1pICEl4v4sK?=
 =?us-ascii?Q?1HbCBI30R/1YN2DJVEZ6q7v055KRtPl5y+zd+nJoPGiRUCod1M29RYWrcOSU?=
 =?us-ascii?Q?cHont816+4mmRl0LxIeD0UG0EJR9FZ0qWUkadwzbQcboEU1dcttc4l/OXTaT?=
 =?us-ascii?Q?/zNtvxa5ZAh8aeFZVu3WsF9SQnM8+x+h1aIZsBL8qhTvljsuE+Gc5O9tLH8i?=
 =?us-ascii?Q?qjgQTuc3FhGZM5elSEbN+rexTFVqZYhGBqNd93oELzDTxB4iiBdGgFBptHoT?=
 =?us-ascii?Q?8+ToleYgH+SQJjRIun+5W2nLqy8axKFP1FPeF84lHRpY92M+XAxbUcf3g5Rn?=
 =?us-ascii?Q?+DzKflYhaDOzHFIjksX6rD0GrV5FiR6KrS40cOxf1n0QHVvWQNDzjRTIeO+H?=
 =?us-ascii?Q?UnHVWp+KHDCJHb4A5u+kpWPQotyFZkiepbBJA5I5BcTBSJz8Qk4+zrn0w5zk?=
 =?us-ascii?Q?r+UyXfwVF/P0yS4oieQHQ2d2AvuvrwTLnNJWfjO6+p5u5WkWvuGvVtDGQ5uz?=
 =?us-ascii?Q?G2nlIbm0D4gZSZApdUC8DRNJC9WXZHly6Zk/9rr/s7mSvP8wP+8OyYQK4OcW?=
 =?us-ascii?Q?3xwtiQtid4ljGdoO1xFBSeY+w5ufBTBJ+WQe5wzyzRQ1VS6ZyWCs1RtVEEDS?=
 =?us-ascii?Q?jQy5f4ZYhHqWQinJD4hByXz5RjbX5lpdQ6F7aZ40cDxJvxTe/HKpecBqpGRo?=
 =?us-ascii?Q?dkeObHz6U+858UpwL/DFdwuNyFGpXUHNNfg4gr8c3/CTV4oUzAXfC0coU8my?=
 =?us-ascii?Q?uJKlOrQtAT5W3Vm3sCi9/iLax6+y6LCsZS3W/eVwLbsTqUb4DQpv6S1VUnXS?=
 =?us-ascii?Q?8J4iXBy/WHoJWuZ4FzuTT5/8L68BYqtMMfV75UMIhJRztw5K49sSF6KKO+Uw?=
 =?us-ascii?Q?s179SW2hK/k9/VjNL2BlOO3CdrpTus6r/XmdPam5EwD92A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MtaaSQrkL7dr7A/YALnkKoi2fjXLW3bt3Pv9Rv2RH4ATbb4M3gTBflkk56hE?=
 =?us-ascii?Q?PswkzJ2+YAprFQnpwyT7KtPRRwMnRAhlPlL0Ig/abFg/fRV2mMDIJG5xcnG2?=
 =?us-ascii?Q?Z2y4U3ySyVMCLTea1gOcWE5lfPZIVGz7qo0WNnLyihDkAFNZEGz77c0mwdBg?=
 =?us-ascii?Q?sS7FOACHuUH+waV5D+jVOsPDsLbTyBoMx1eSn48RMxueu271BXdIQ7KPXfhu?=
 =?us-ascii?Q?gKUQC+XE/8weibk8hxjLk4lfoChnWcVK6s/6DrpVxwPkcrCvW1/J6BmaTnC6?=
 =?us-ascii?Q?qPowLFBOa6NLsG4PiGV8q9N8uPFmJ8NHK1+i3LC+Fkt8hjuN5MQy6YBv+LPy?=
 =?us-ascii?Q?Eoyj6O+a28VqBney3Caj8UpUA+iYot1ejxsNYxFDmVKgn0EM9Q0uR8ROB1+W?=
 =?us-ascii?Q?SXeZctQMJ5cIbP2LYocf3WXIRwpGEqNAScbYyD6W38ADGJgZPIqevV2Z8BAz?=
 =?us-ascii?Q?t9HTFBxht21uGuuUeiRCo9EJaYsfdPjwyTPinJpFFAtJaNDky59D/XZk44cb?=
 =?us-ascii?Q?vdPAO6oW6gST/laSjFqRcLnhClFf2z4KfJUhpz2+HZvoTvAHa65tHmtFXuhS?=
 =?us-ascii?Q?0SZfqEzvIcX7TfZuzx0E+vQRwEps/C0bPPUymEXT6AYuDN2MoxdHr7S7AKcC?=
 =?us-ascii?Q?2QqfcBMNovCdLrHDdMWHiTLVWdQEXAN+oq2zuxA2VKtOQlswvQvqRBJffecI?=
 =?us-ascii?Q?01w4VGTAnVOo/hUSQ01Qkzgu3malFKvgSHOZLKAbi5/KD2k7xfH0w5aDGBjv?=
 =?us-ascii?Q?7z+62PjzqJVUMGyZoK6TSGoxTyM+RG7R4/MdJhigzPSNFLgD8Jrfxez7bVL1?=
 =?us-ascii?Q?XPgdEKx8/DdIbgt5R1CteCjlfiiENno3cze5uFC9AvfHRoJJ9452KHPJSjsm?=
 =?us-ascii?Q?ccG4px+AXN4ZEs3hLZ4ZYuU+l+sigwp5SVtUvOBxjaqwjMCWYYB8AD4pNW1n?=
 =?us-ascii?Q?AbcLiPR5RkM92/hnJClX7+mt7wwaZTYao62cu51kerIhTG9qK0PSO1/9mXav?=
 =?us-ascii?Q?Ezc75ivTSA/RmiauSdpywkK2eqYUhYE16/vVr3oQ4M72beD6Gf6mIOBuaUT/?=
 =?us-ascii?Q?A7hfhRakQByixiYU2KxPUeQshUSdB6mUaZSa5nIQ9g6hxmNZRldSkZ5kNWYo?=
 =?us-ascii?Q?b/2uz5A3IxYkO2thpLc4SLUlpMfL8pxbmU4QJLcKRkHOI2HjWYY9KD7P19Rf?=
 =?us-ascii?Q?sIyqnyryni0O/l8pfOjWDcOKnlHcD2UmG/So6vAM2bguyfdhDFdyBfqx5KDQ?=
 =?us-ascii?Q?B26jKQJtf/tWyw3NjKXYR0ssjc6bEAquycIZ+hcFqzjJDMUgcKZ0dnUHLTgV?=
 =?us-ascii?Q?IO/ijgHLFd06zBLkGUpJ6UEKL9HbxozvciroFQnmyrvCHxruyTiWC95bHU5+?=
 =?us-ascii?Q?DWUwxCR1k9svkHXd8dgdVR8O7qdaedJTx2twOzdgPuaBwd8i+8UsaX2InN+o?=
 =?us-ascii?Q?gSV2Lws+K19Hvv+iwyh70Nj0Et+fqWZqEVYb0ZXXdWr35smYc0dKtxrZd3dS?=
 =?us-ascii?Q?5YOvXaQ4QchTOMGtVRDQqoirlaler1SqZGxvJRlZSYKtf7nzO25uXVgiiPuw?=
 =?us-ascii?Q?EKVr9dzQkv2oXnU7NUwnDZqegwZxtMxDClpnjdaTuN7S1/GOUMh/yfKcAxFd?=
 =?us-ascii?Q?1eY2vKX6G2P0wulyfuUlLIc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 21bc746d-f7ca-4847-636b-08dc79338377
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 01:15:33.6609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +xXraBfC3+KFRAW3zXCGXonZQ9XprnfcQH1acGnai2T0+i1JvIhfyiEQuVXUHxhxlYbxu2TGgCqyN/CMawMK/4xwc5ZXrK/jNqm0yYloBeddSLqufq6ktFyq9IaLjYIn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7901
Message-ID-Hash: OZZDFXV4ENTQ6BSVHN7YHU7CW656FGYV
X-Message-ID-Hash: OZZDFXV4ENTQ6BSVHN7YHU7CW656FGYV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZZDFXV4ENTQ6BSVHN7YHU7CW656FGYV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis, Mark

> We cannot change the Maxim amplifier driver, it's used in a variety of
> usages and platforms, and there's no reason to create a fake capture dai
> just to reflect the use of a capture stream on the CPU side on some
> Chromebooks.

Why cannot ??
There is no effect to user if Maxim driver has full channel setting same as
dammy DAI. It will be handled together with CPU, and system gets CPU
channels as-is.

> I don't disagree that the unconditional use of dpcm_capture isn't very
> elegant, but it is what it is. This platform has been around since 2019
> and still has about 6 or 7 years of support, so we can't break it with
> stricter criteria.

My opinion is that working without channels settings is wrong.
I can understand that it was working in long years, but it is working with
wrong settings. So justify a wrong-settings is not good idea for me.
And I don't think it is stricter criteria, it becomes *sane* criteria, IMO.

Because it was working with wrong-settings, we need to makes it sane.
This is the reason why it has grace time.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

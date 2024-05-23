Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 923508CCA14
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2024 02:22:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3B7982A;
	Thu, 23 May 2024 02:22:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3B7982A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716423746;
	bh=mlbRTnG2uJgx9ju4mn1nfonlDLG+nFmcE8c7HGEUFxM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nsa1yMBinK74YtyBQFtSNXxY+BQzV1+wksmQvkv9O/Hq/swk1+TrTKDIiycnlwJ/G
	 +I2WG/0rg+dUBBN8tbXCuO+YrW3ilxyLqfFqpzCWD9RKHDJ5NIPwYGua6D+tI35kCk
	 +anxGR23t0SNyelImGYefhtwAtxbrC/GVubvHSVc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28A8EF805A0; Thu, 23 May 2024 02:21:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87C25F804FF;
	Thu, 23 May 2024 02:21:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3499EF8026A; Thu, 23 May 2024 02:21:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D716DF8016B
	for <alsa-devel@alsa-project.org>; Thu, 23 May 2024 02:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D716DF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=V9nMKGXS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8ZS5mHjAJi3pdBtwWMExYxf6RNWx4yZxUEkHQUgAgXq4wvvtoUv2tqhoxUG6PgezpbQX78Rhr1YgMsjrQovwJR94wtiQLnMj/k1CDVaPyGYArGV6zZoxusApnf+PzC8q1iz1IeI8JQD7Ff6sABySE9hElKNAXVgsD+TCviHRvYNTxikokMh+CyoYSscTdeCE2bKkmUEPN7R/1VT/JwQdbAlO82wzRBkdnMYBmu75k4QBwZcGSh3l5Au0DtTi9/p0u7XasoBsySRbBy7SNbRyklEp49ZzbXE6CRY4P6WCWqO8/NGUr0UxD9AW75Gtf5I/EUHkWYiuc/Ok8QkijrXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4reJX7crsejyytFl1hiuKQg/f5IMIJTuXkyFmDT90K8=;
 b=IXkHZg39i6NmtSEQ/38fRMO98sD9SPogrNkbbDn1dDJcuyuHay4JusnmUh0d8o6ebHziNJaO1RTSqFTCp+f8VhgZ4sf5Y3GknSPep0pRkGloP8QIeyyjNpSZfUnwaor1gVVjyCzy3AOV8zXQXg4mOMX81NPTrIcrZzkRshQmZ+y8jjV153cWZkBiYS0lyKU/f4k41eQR7Yb2vibSe0dwsjapXkcKymtJR8re18S4PxjK1fzxqBBlbwfzrgZQSXTOrwC92NHHzsZsaKqiMf5zx+mmK/K090l8Pi2/0RT0YgH7zw6em1EeiOiBwlCJJ/JUH+E/2U1574wyjKRTFhb77Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4reJX7crsejyytFl1hiuKQg/f5IMIJTuXkyFmDT90K8=;
 b=V9nMKGXSiLlc7UW26kSBX5BPacc7UPjY1mPe52xKAJSiD4XgK0h+wK+YcLZQi1ihCoIn24ZaBjKZqQqZFCBAEtfrbt/i/A/+k0do8+FfUaiSebRei4/Neoic8JpOEUzqjYpDoF9h5CKKVcvfDoHcxn5oGHKOz9o7jk2F7QRXWKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB10599.jpnprd01.prod.outlook.com
 (2603:1096:400:319::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Thu, 23 May
 2024 00:21:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 00:21:29 +0000
Message-ID: <874japnzsn.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <878r023epy.wl-kuninori.morimoto.gx@renesas.com>
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
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 May 2024 00:21:29 +0000
X-ClientProxiedBy: TY2PR01CA0001.jpnprd01.prod.outlook.com
 (2603:1096:404:a::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB10599:EE_
X-MS-Office365-Filtering-Correlation-Id: b8237fcb-41fb-45d8-0af4-08dc7abe4a9f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vMqL/Ed7C4KRNLCwnuJcBGFORm4svE+maashFjflnzm3S/x6fWVvEeMy8QnO?=
 =?us-ascii?Q?4jDVO2k/7RAIUOf+So/ZDE+KARLfee9gQZhioze7jxyM4xwMbIHsXvwLJYlt?=
 =?us-ascii?Q?tAFUP4alWH436U7HjkblFoNWRs8mOEHN85DGZ7cAapHt9LvtfmFVgcuoCT2X?=
 =?us-ascii?Q?SZjiXLgIM6NPFwY0ttDduK1bofEFbrGMV480+QnB6v4OJis9KNykXxh1mrqI?=
 =?us-ascii?Q?54BaJXk3y/ori0mH1ga7yGOWn+ovR9kAI5ygFbcQkeVAN3wZ/viBxvtROHUr?=
 =?us-ascii?Q?s/bVfZNJcj5oZucX/HQvRoNZJ5+Hp7x7qpo9wNSlfFw/qT5V3W/UYWhxAjVp?=
 =?us-ascii?Q?wkflh2XcBTp/nZUhT+UlYWAqaTRw0feid/eLRhXmrAtdZtgwxYlypHUYedZe?=
 =?us-ascii?Q?BbNcF4Ih/VU90vYge8YJiv015H+vXL/eax+KI5bb02e4qCZPESvIfSKXlAbr?=
 =?us-ascii?Q?IRqjBShORa1vYtpyq1W9lg9gDGpJ8zjEUZQ37KzjIzGpTDvitILMV0Rs7lsN?=
 =?us-ascii?Q?wBSBUTtgvQcSKIQXOY++pMB6j+MV7qjXcIsB3Bb8L0uCGhWZSI76ScSrsheN?=
 =?us-ascii?Q?GEl/G8s9zaEMGUJrjgLyae6ZUDy9gnHHxedJzVpvtcfF+tgAmlBk7uWHtIom?=
 =?us-ascii?Q?4m9jPVOjXXoyZrc3kgw2TsU5HxJXR5zmwH3ZC3/2ZqYoGLyPfhLgwBI9ov6t?=
 =?us-ascii?Q?15IXD1QHmXD6G0Z1no2eChwn3B7R1sqg83dJkzbdcbZp3J2jUqQPB0lOT116?=
 =?us-ascii?Q?gGAa7UE3XAlv8zXcASmD6ZRWyfn+4pfXpXVEPZdiiLf215zgtJmN+MCIhdhs?=
 =?us-ascii?Q?LayPEbYC9wyBi05VjuU0e+oQ4UZ+EdFjlu64KH4lEGRL7/rQomygca8KUxBM?=
 =?us-ascii?Q?nzimPbD0Th8MfIhs2MZesNqQOYDSBmNV4ZjwEGpmDAO2WXdtD7ubA8PEwkXA?=
 =?us-ascii?Q?YXrFbnLwKchKWa2gt2D37i7DhmubQfVsHGdzrLKvGLW/P40guZwhe9urviVq?=
 =?us-ascii?Q?EjTW1dsAzFcQxZd+QjMFP5cjZQKcujGtYBhVl5U2L2MnYgIC0p7r4StHMF4o?=
 =?us-ascii?Q?YgPMFvEYNIwxD9RDDa4TkZ3bDfpVkRcDWS8rX8ijLw7rRnWq6wZnVNl3hGp5?=
 =?us-ascii?Q?cJZboAl+ycY6Lgg78MSBr1QmCtxi9EH43+oyzG3k3v6KZranT7AaWHDoo6La?=
 =?us-ascii?Q?su1FZc/0KefgIRepPxG7KawBT7HQDV96Pti073HxGWmmyUPxkTcDMMhaAH3e?=
 =?us-ascii?Q?hqJ8OgQeAjuJC5z2GbVjvX8ifBQfuBso9RRkdmuFwLn+TIkI/jOZaeoPpL5v?=
 =?us-ascii?Q?huE4r3ssbk86ZYOBbAIp2AlgL0aSfnuME1x5glVfNA6l+w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Kgbckfwbem14kYSfJ12ZNY9qUVplXDnBqLl61ySSrqBNUt/BVTk0qMIbaSL7?=
 =?us-ascii?Q?qbWSgHZrfDXLjf8WBMt6g5rUwQrYzqx9ia/glFo7oGQ2DkrxiBJkMqPGZ9Yi?=
 =?us-ascii?Q?RbNugl7IkkBJzVgmk59vKzNZK/F2u7bGyawYwbxtTXkIIoT6VP/nGIr6DryW?=
 =?us-ascii?Q?/HDK77kC6Japqayp6w/1dxkZqDZ9MMguVArR67DVVV0NH9fGdnIePAMB+RnP?=
 =?us-ascii?Q?KSv9IWFnTLU6tnYihB7jO0OomxX61Tlq+ggOayFrilQdIUrAArOhdSbtXVmx?=
 =?us-ascii?Q?S284ij1keQaqF4JFdQEuFhhLuwpKt7O+sNT4TfPT71iQb88cj99TOQ64iTeD?=
 =?us-ascii?Q?Laft6ZyTVIsHV7mMDUNBu1Yo+4ekdhiOwznX56nVhsLFPkWjZhu8A5h1imlh?=
 =?us-ascii?Q?zC/icCDa1363I5bcJ8Y1as6QVYhDmCoRPd5VB5wVgqcjoJFPL758f2t9lTfq?=
 =?us-ascii?Q?XQSMRFEKuQgmnL/71Vljqs0hlrZdNEXZvlPBH5FhByVDVglbwJ0B6M+MSRk5?=
 =?us-ascii?Q?3Oitlpa8CzOuRQV7N4enUfBw9ri8vhZbAnTEiOSr+iHzvWgxJjPmdtTbFUOx?=
 =?us-ascii?Q?91zRdKyRbDjVzaYfPOsIpQ+5ANZO4ckV/LlIgGKev4qrwRA4hhJjnberzR1A?=
 =?us-ascii?Q?Bz8G2laPRDsuWYidXmKDufmArgYrvOhUMwQiX6/EBjdAwP+mhNp0BZf9/rIz?=
 =?us-ascii?Q?VyUQ8Iwv/0TQLugrpmC/oDyggg2+K6tcgohGGIdaE0/MkbTqBRnrev/yRjX+?=
 =?us-ascii?Q?2eyz7sbz42RaJ8LjFyjb5bIeJ1pLdWKMRedUlrMp9GzHWInl2uR1ugwWoWNM?=
 =?us-ascii?Q?etMQjwbx9vil9K05lVl6IzMsMdFpRUTSlnSR3DqeHADWKj9mChFUwlhcPsv4?=
 =?us-ascii?Q?XQC/4cGpU0iTYFusrHZwzE6l4JdjCFpKyoEgsTexm7NfpBf0JXnP5gJ0pwBI?=
 =?us-ascii?Q?pXYx7YxZ/C3Fh7D5TVhrUWWLDAZprFksLAdvpxD/mFZHDd8QcG3YnLF6pUO3?=
 =?us-ascii?Q?FpgI4xF76zR8ewR/t37AxiYHg0i2PjcsufOPdTidldN1rNozYaDOrNBAWPMS?=
 =?us-ascii?Q?jNIjvg9EdUZAhBdNgZlXWHY7c1K9lvYWv65R1uwof7l/y9sguXJfKwITdH2C?=
 =?us-ascii?Q?ftKo0DpWIGhDwLyQcBuwXMX7z53oiAN55pDkoyJk9Ej4LexwQ/mYnafph/HS?=
 =?us-ascii?Q?3Fh14QMHAV6iZfsnDBnIIO2NkT2lZs1Lh93MsTsWAUXVHV11xNqrXiI4tcOD?=
 =?us-ascii?Q?fTgmOqtMgOk2q9W+JFTZ0LrcNBu29LpEeOBYyPi/avFVfkf9iUpb4QQzAdqY?=
 =?us-ascii?Q?LQfg+YJuwii3OUb8p6HOHzqSVu6OmofUnukPtBCkBQPMNX3GpJerqcvusZGD?=
 =?us-ascii?Q?3x6fELvoYd9UleKCkH6msWjBi4d0OyWg/NlT9bqtlsnNW5nGT7ZcxHWhZGu1?=
 =?us-ascii?Q?Q36AgON7//uhmJwTVL1g8baT2uaBZ7SYEeOLnPnRx5X58aH50qT6Qily2c4s?=
 =?us-ascii?Q?ihszxFgEJZV3kYTDDkfjElQWU1HvwiydpdddBgdhcvgvjTcYJ+4ilff5Ci6/?=
 =?us-ascii?Q?VHkzziT6wqMv40QPzItEJGoBIexuRy1ja0SEJc140mc7NoQH2WyxMjo0dvY5?=
 =?us-ascii?Q?B1bsBE/1+5kRlEyP8he4sX0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b8237fcb-41fb-45d8-0af4-08dc7abe4a9f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 00:21:29.5641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vfqjFcJ4zEGh3GUjdR60tHSvcboXif//E+ldEIT/MqxAxPsfL4G3KvV+vYS7VbJ10Q2cK/8Tv8B9YInID+DzmAAZcte+wvEjS9133JHDP6BvmhwxxpGhGAJ116O6VPTN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10599
Message-ID-Hash: EIIWKA6WAHNIVJU3CJPL7EUUYX7RA7O4
X-Message-ID-Hash: EIIWKA6WAHNIVJU3CJPL7EUUYX7RA7O4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EIIWKA6WAHNIVJU3CJPL7EUUYX7RA7O4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis, Mark again

> I think same situation can be happen not only DPCM, but normal connection,
> too ? And my personally want to have validation check as much as possible,
> and automatically validation without Card/rtd flags.
>  
> In case of ignoring Codec check on DPCM, it allows unexpected direction,
> I think. For example if it is not using dummy DAI, and in case of CPU can
> playback/capture, Codec can playback, and user expect playback only,
> in this case unexpected "capture" will be available. He need to add
> playback_only flag, but it is not good for me.

This patch-set has big effect to each vender, so let use step-by-step
approach for safety. I will remove Codec check from DPCM on next v4.
But it is our one of problems to be solved, IMO.
I will add mark there to indicate it when we remove dpcm_xxx flag.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

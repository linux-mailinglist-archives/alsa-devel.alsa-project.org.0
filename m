Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B87F090E27A
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 06:59:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AB05205;
	Wed, 19 Jun 2024 06:58:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AB05205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718773140;
	bh=M8uin2mS0ceTGcyqv2nJkqHVELzLMzI3NmM219/g7ww=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sxPvytdfT7zrgjoC6Y/mBFVHNhBsn3y2baWxSpV894Tm+LNKJU5MXe3J/LvYlC8zf
	 03GljGK3NiV0Ud7BK8x997Ew94DaP9pgbox1y1IFNeZTJqgbk8Dji1ZAoGv2RNhYNm
	 BMGpQ4qnibvs8LD41vCUfCdDmlroa2yO1mTeFVdY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4657DF805B6; Wed, 19 Jun 2024 06:58:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19071F805AF;
	Wed, 19 Jun 2024 06:58:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 406A1F8023A; Wed, 19 Jun 2024 06:57:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BD32F800ED
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 06:57:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BD32F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Eb8JLoxJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bN5qvVr+/Wl3/82CbJ0v5IlpZl+6dzVY9K6Zbp7UmvLnFqqxFTInLFCXyJ3vxSXE/sEkbzXHVjHvxrNwQ23FLYvCnLVAErSrdouePiHoYKJJ4wf6T/p8O5QBbzWIpbV9Tg+qclgXFA0Jju/hDNu7vUHKQvBMIXHOA6p3822+oJFMSlbmy4vNd2RgMP3bK9KGM9R/gxtdRP7Q4VmhbKWJBu60nELuFqFAQZtyr0Dr3FTrD5Zv30EO8xTgLUFZ8sOtARBW7ckr22heMrx0H7ZmSr7AjtwMjFx6dgyzQczbFRGAr1EXPNpBwGjNCbFnPrqhK7CJfhz9jsXV9hszbedXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEFK45wxCwUyg3zpaCB4gA4+EB9ikblkgSl6IaMETQ4=;
 b=b0JWQcde45IOeaIkGKVSMHC0Bz9qL1dyNhkmUITRe1vTJpPvKX3kzz7dmThqmvgiis3QXOa6oNDh34sONIUvgSTeZKWiekRrVm9TEdUeodDkRVEvHFhxksHMJGz/C3qv9OY9iBCs4FapntD8RFjKb5o1tUjFr5VCckvJHtu2t3iwH3iOk5/7DchBpzrMjLN8CmOzblt+uPW69R+KhI8+Bih+JRrunRyy5P0v+4tjuUYsOu9IhVtJjg1tPf0LiwH36GNi+la9KlpFug3CraFexHzT+8lRCPW6lNuv/4PHjU697xSsYS0NOJ9EelQ2nUo2CEUUr2+tQr8ftJR2mlMj+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEFK45wxCwUyg3zpaCB4gA4+EB9ikblkgSl6IaMETQ4=;
 b=Eb8JLoxJOL/sS91/92xKKDix0beYvCnG+NA2u5fL8uWYnkmMBqkjwj+UXEkATf8h9jiKlbLFCdeBFuKB1tnMjP8LZv41pJ8wjGEXOt5oSjbI81PtlEOr3leDj4a2TJihFHxKPNAgF3YODxW0wRGZorwRdwAzDeaC7p5BweAiKSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5895.jpnprd01.prod.outlook.com
 (2603:1096:604:c7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 04:57:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 04:57:23 +0000
Message-ID: <877celwmvh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
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
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
Subject: Re: [PATCH v5 0/4] ASoC: grace time for DPCM cleanup
In-Reply-To: <6bf6adc9-9620-4ace-97c9-7de0cedd7d07@sirena.org.uk>
References: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
	<6bf6adc9-9620-4ace-97c9-7de0cedd7d07@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Jun 2024 04:57:22 +0000
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5895:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed601b5-c79e-47be-27dd-08dc901c4e77
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|1800799021|7416011|366013|376011|52116011|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QPJm4mNdInBXSP9qEvInrAPwKg53ZDeXcvkV9wmfaAK0RsysocgnHqBUA3eL?=
 =?us-ascii?Q?AWm27K91rxMuAVVj10aos3F9SEl56GawiBEGEseXHZTca1ftyXx6mnAkzv9y?=
 =?us-ascii?Q?OLFJwgVOw+dAMEArcnAB/PnkMGSbZpJ1g0cVWRAt3bNw7GO5PewbLj/7fPd1?=
 =?us-ascii?Q?C5PIPuV584T0u4oiltxJoAGq7365bNZLmJDSV1NJY4B6+rkfKiAoN0DTKFei?=
 =?us-ascii?Q?kBASc8a/BwmlETlYLMTyK1a4GxaPxcy2hY8mTSMxc0Ql/x04hJRme2JGGGef?=
 =?us-ascii?Q?NGs/DZAhoLfoMLg8f6uVyDl6WSYF/UcnNQtdGVlXN3LDq9IpyK1BD4Go0P4a?=
 =?us-ascii?Q?Nm1nKkBjd/PtJh03DfzpU1TsHIPY5j5QL+EaahbJ0iyblX4tF2p6j1K1QWh3?=
 =?us-ascii?Q?ltgcoyVQ7/Wotcpg4D3lxjp1PSWBK/+xSxyi3ewGs2e7NxOvmoYP2/LK9l98?=
 =?us-ascii?Q?GPXTpdP/0f2GeSh04DgrsI+g4J4d00YNXM86Snx8beOkShQv17OYx2KRlbcG?=
 =?us-ascii?Q?yEMYxE90NnQiasBltaNo2iONKpqB9nNXbFCsDkR8drLT6X58Fi9zWyI4vjrd?=
 =?us-ascii?Q?ebSTVgJEuMsGYCFySSVvpgZTmOgl7HQhaPIfgCaKUEIn/Jv54APWM9JQULvK?=
 =?us-ascii?Q?QYK02m6qLfxxm5vtwu8p8swW0+DQmQeliuRiVH4bxYQZ7bf9Xv8WnlsQdlmV?=
 =?us-ascii?Q?Ej4F7cgGpoabM5kxtbWAV/Qb34vDbKq9ciT+a3+D5C6/B7jlg62v07i4cBqu?=
 =?us-ascii?Q?+tCRY7WSLvp45UY8TXG/s4gGhyZOkFLreQhksFHdwuMDi0ZFMbc9PPUQEGbB?=
 =?us-ascii?Q?PdSh3RilaHyu+cZh+DNnE7bHVYTs+1AlJFtL+aXXVyB42n8txohgS6UjpJoi?=
 =?us-ascii?Q?+RerhL5VD1WvuB8Hj44ETEFwlKJQnVe9WWNXKOlaUi5nN1KNRVymZvABbO86?=
 =?us-ascii?Q?ZGxjl8+j9KyRklOz3Qa3FHOI8nfXAkxB0gqtMde11embLRH32J8rM+CydLz9?=
 =?us-ascii?Q?TWvWPdidVhpxhwv9DwA4qvNFTcE8E910zfBbDuKzbMnHy+FcUOuBJqF0Y7aD?=
 =?us-ascii?Q?9QbnbsS717dwc5rtnCxHcWBUIjLhK+b7HBmIbE6kmrIZSf9wkr14cDn8iRqs?=
 =?us-ascii?Q?Jq1Ea8QESIVP9wEX+XfudHJJKDzp3b9pK8mQBN5PqztD2UA5hqZwXDXGAQea?=
 =?us-ascii?Q?ZlNS/TGE7tqHeqGlQ3DfgrG+IitnESzBgpC2jqk0rUBRdhu3S/NeZEVoB3JJ?=
 =?us-ascii?Q?7PdYxlmor4TKf3xjWYf4uVBnz+BBx1o83IAW8BnTN108YQqdMsdgSJzpOGXu?=
 =?us-ascii?Q?tzqQ45eQ1OmpV4Lm4gz4onpUZhG2ZojHNPeiPn+lyD2YnJdAazd5ESwAu5Gc?=
 =?us-ascii?Q?Ar078o8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(7416011)(366013)(376011)(52116011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+UTTylVRNw+xt1wPgRhbN7eDwwEgp7BTsA3JTIcK1SaMtr5j57ZxxzizWZFA?=
 =?us-ascii?Q?XQICSGotGA6jshMjYXrYOKYC5hKME84BS1J81PDJLsRtSVcUlY2OCltDPEmC?=
 =?us-ascii?Q?hVsfaSHD8yI6VGmz2AkzI89NHfho0JhzCBMSup09ifVBFBiGmJBFHaxIlaN4?=
 =?us-ascii?Q?GFSUWZDXvIILzDgxg+Gy8HlpPp8WhfR2YMJiBOtNttlXd7LZhlP6PoBCYokm?=
 =?us-ascii?Q?Ch4fuiMUFxg4rXFoTbGxYYtRhpRDwLwUP+GjRyKUFi1gKqc/tXh+0tVNc43t?=
 =?us-ascii?Q?qvmp4+wHHwP3B8Q4sssPUhxsUB4i/FAqohfbTHa/NBr7jIqgjx9In52ynHvr?=
 =?us-ascii?Q?MFwtwVGqwltQZ25sj54YeiGzJToPhhygfTB0MnnVJ8bu5SuM/qTeUBPeAZSk?=
 =?us-ascii?Q?dUGQmGpWoiwMJuVW/J+daFGxcL3oupnYGaqZ6/EW6weIK8hx5Iq5AGx/XDsP?=
 =?us-ascii?Q?jz+q+7+MVeLOqiY5ffiyuPboqpxSiUa9F/dkS/PpSkCa1UnexNEgFzW9fJ0H?=
 =?us-ascii?Q?UY/dm0Fg7QhUA1nTGR8UCWoC4zE1ckGr0F3MGdrzjd3a6Ta9Ije9PjCTy2Pm?=
 =?us-ascii?Q?C7vrAqiUdTeHlgYItyyRcdnDFj2fLA7kikm0S/Ip3JtnJ0Ox2yEjvdnTadz+?=
 =?us-ascii?Q?Gh/ERmTykAKLJPVPXzXzYW1zZ+Z6EleP3UuFOKTbVqG7qL3H9mutZHMs1Z8s?=
 =?us-ascii?Q?3NPxlvkRr/DeoRI78KCGoOW2KPTc0O3bbf0ics1M6RbTd30WPySmNy1MTzSZ?=
 =?us-ascii?Q?Z+r3HF4ZdB408bTY4XfCfRuTWCvTGopIkVZoKRmdh4ycnMYc14XK82VYt6Ah?=
 =?us-ascii?Q?eePqUqs+vdTqZox9RE+DGTQ9/vItJ1k2w5s8EFRgcFqPom/fKmgSS5V3Yhfa?=
 =?us-ascii?Q?0gQHd1u3+rL1IYRYLrfcc+dvQpILQ1kDpEDC3to/8mJKdcaOnik/rn/Gg2Yu?=
 =?us-ascii?Q?Fkp2iToEvjM9+bNRMUuYIYsSN2/vqtAiSRhQwRLmdkfaGoidEF0da6HrQS4+?=
 =?us-ascii?Q?qecMf0Sc3a9VdR5MAS27ayDSkckOW0My88h+hR6vF606IdRufmS5gRYzVMpG?=
 =?us-ascii?Q?AuXIWM1H1BaCO+MQBAnKCWqxMqoR+LnHOKdkRn4/MqQbwZEqj05NFomfRIws?=
 =?us-ascii?Q?Xuf2NzKxkVjG0bjtfByBhMVPKxsV9Z30g3Nq3+1eGmuW+uUjQG4/xgnr9b2v?=
 =?us-ascii?Q?Xnr7/AjnCpPC8kYFwJ4cdtj7qkxj5sIOubsAerP6RfBa6kj0bT5h3cp/jksn?=
 =?us-ascii?Q?KScyW8eRDVp1s6UbWGtcotVXy7Fb5i/ReHAWHD0lubJDUalpZymjb7N9gkiV?=
 =?us-ascii?Q?oBX7puPvdQcPQ6veGH2HuPgBwXNMnhjLzosl9Vz/tjPHVi2JQvtbvbQz3RST?=
 =?us-ascii?Q?vS6xEDmCrm0ayMKjJG6wMy1f160dqoSy4OAivfTeDVr0Ro021kBucP/OoEEE?=
 =?us-ascii?Q?Hqwm1RSDGVv/XvtD/qIp+m6VTm9G9lJpkv8kfibVpQxxFP1QjlaNsKDCkfGU?=
 =?us-ascii?Q?MTvRCaAHSw58pBduVycHWkindnOOjUK/3a7bNmcvvxWCfSE0algEQVysFraK?=
 =?us-ascii?Q?+0A8mpMOzH6EKaPZR2xWHqTEr/Vk6sIFFAcu3/D4cjuusknm8V5u4X2+uHuG?=
 =?us-ascii?Q?3XkFqBVTmYVQVTV+D8pVW0s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9ed601b5-c79e-47be-27dd-08dc901c4e77
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 04:57:23.1218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 176+/XsHNuzNJWBGATQb/brkf7//RSZfN3u8YmtD+EHXl+OwBxgsd2eHtIFkrfA1zTK6cNRIFb8YOO6JTWYkZ6gcmVT9Lt7zU2z+pebX+QM1MIRXUmWzn/reRAMLMuZH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5895
Message-ID-Hash: KXBCFXJY6MS4DDFO6P6OZ6GHPPEYIJ6W
X-Message-ID-Hash: KXBCFXJY6MS4DDFO6P6OZ6GHPPEYIJ6W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KXBCFXJY6MS4DDFO6P6OZ6GHPPEYIJ6W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark again

> > As we discussed in [1], we don't need to use dpcm_playback/capture flag,
> > so we remove it. But we have been using it for 10 years, some driver might
> > get damage. The most likely case is that the device/driver can use both
> > playback/capture, but have only one flag, and not using xxx_only flag.
> > [1/3] patch indicates warning in such case.
> 
> This doesn't apply against current code, please check and resend (it's
> simple-card and audio-graph-card2 that conflict).

Ah, I guess you used "v5 original" patch-set.
"v5 resend" patch-set or today's "v6" patch-set should be OK.

Thank you for your help !!
Best regards
---
Kuninori Morimoto

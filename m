Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C86C08C39A5
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 02:33:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3890A7F8;
	Mon, 13 May 2024 02:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3890A7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715560390;
	bh=JaEfXBWlGHqdYwZ2dANrrSieJSCowt5IpkWOna4hHjI=;
	h=To:In-Reply-To:References:From:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=n+aGEXp0p0qFDgR0kDWd98DgIp+XjrJ5NhpZZ4wDrS9fL0pUoY3uiIrKUhEDEWjYn
	 Z0+8MdTn92fm2HqWOEXzp1sU4A0djeYVKM62VyLEAyQTj1JFNL//Pm35qenMU1pg/P
	 uQE4oc/6dx9Zn3baaXXmNwG+1lVJCApbqvic0Vv0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4ACBAF80600; Mon, 13 May 2024 02:32:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66A49F8060D;
	Mon, 13 May 2024 02:32:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44C99F80571; Mon, 13 May 2024 02:32:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03590F805D9
	for <alsa-devel@alsa-project.org>; Mon, 13 May 2024 02:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03590F805D9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=e2anJud4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBOIX0R0wj7wlBSdc90D0S3PDXElDy8zvsCjPbvbT/25OVbluqq8hbfUYOVdsy5AQdScYBWhaS9cn0Z0LDOIr7yafgrdFGu+V9k+UoULztxkvHl48Xe/fYQhhCsb+ajFzOWR4arJoI2Kn+Y3Yx3mPi0xghjY4GdKR3uN/UvwMdndxhU62OReyAF89MNCHrgxd01T+mTYVrYJetuQ4GjKyqmHgsVKq8X58laQW3sAI+vy51YMUfpbj5lWFpjEZKwciPTMWN3tGZmjHW+ehPqcvyeH7IhFg/HLIH365BRlVkZss1hPsIDOFlEZLclvoyUrGmWEDqgrEx0uKayKhvbOfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLaTQRJ6+dc0X4MaTimYuQOcrzydhxcK4moSLomERV0=;
 b=K3wEkaGAF2lIAu3zCHsYMeFcInPGDvIo/Qk8fo2tQ0bkfEy320phrdwakc+M848wSW/xX3Uyg1ec+JRQGdvfXIwlLb+xYaHQcr1LNMEq/bUsnX0BFF5spLCl5B1YfaSGlx0abn5e3aGC+ffjDhhWrhWCIVdDON5bPZyO8zBFtnZVOYHnYHSu6SQqzF6rdgfi+X1onwbfQ+GkRHJY0To12/yS/sBUVxGhDqCMjDsTUg0V8HtIAOyQBmGfbpoJaXhk9DT9O9jvZj1GWroRkL0/VdYwEjsFtXDtpjb6Lmfe678Hf4FNYf3HLSlqH10LYRcAiw517Vlt+XGRK7kmRT5eYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLaTQRJ6+dc0X4MaTimYuQOcrzydhxcK4moSLomERV0=;
 b=e2anJud4Symb7i37ogByAP5LaoF8SpCBiE3heUXB34Vn848mojLQKqINS1XLC6YXFCXIhyKc/517fkH/K/inf1MK2BuFfNESZo739x9TsopsmieVzMo97WiPcaXoBuwdkDFqOFN8cBFnj2k9kJaLOSb4FJfSW/a5i0a92628iQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS3PR01MB7383.jpnprd01.prod.outlook.com
 (2603:1096:604:14a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 00:31:59 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 00:31:59 +0000
Message-ID: <87jzjyzh4x.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
References: <87o79azh65.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/3] ASoC: remove snd_soc_dai_link_set_capabilities()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 May 2024 00:31:58 +0000
X-ClientProxiedBy: TYCP286CA0268.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::13) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS3PR01MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: fd458956-3188-4c24-95a5-08dc72e419b4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|7416005|52116005|366007|1800799015|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?u6RqsysoMxKMHYn7tmiMwRX0L7OTJ9iRKiA+QJAKNI7VKd1iwGTwEBPztnm6?=
 =?us-ascii?Q?xByzXyR3ngHZasLtMYIGMsI3wJiumIPeYE+iSSjglkWf5TkJqQsH75jh5s9b?=
 =?us-ascii?Q?nvwW9qQ99EWEUdwoN7I2uHViBvv/6FASK001fji8hbox08E1MLaMlk1wCJUN?=
 =?us-ascii?Q?5ODy6Fde7mfdBoqRgbvxDhVCUdbwdIPD/PKmSjlkuQ407qL7I4jqZdeqhlqr?=
 =?us-ascii?Q?BLnBlvhbGx7fP37+n+wmVFe8AaoejJkYnDGiGroTJFz/M02t0P4wj9MDpSPU?=
 =?us-ascii?Q?zOUGzRvyZmsBJGmyiLX8+EMHrZfO66PL7et1nWX+wbeAz8ekOtCVHsMFlDPm?=
 =?us-ascii?Q?iZ3LedUlWORXuhqvGunwOAdspWf/UDKO6xNPANlyIa9UdvvlhT0cHfZdl31h?=
 =?us-ascii?Q?8mfT/1coE3GZxOjz8k4TsiefwcKCuCmJrH4c4j7Gix+WgbWaDkyyLgFkwF0I?=
 =?us-ascii?Q?Ip7qQ8Qqlg7RNfVwzL5iLuzq2cGmHO/nb/12KE8P6DHyOGZAbJEIsyfcUu65?=
 =?us-ascii?Q?zyRxA+1O/HpfTKMw6/eGkuOHhkw1ob0/q474dWbuVXEsdQTDgagFkkCcqadn?=
 =?us-ascii?Q?D1HOwrm8DCq2Yc7E9jgYw4ll8XVg0mlp9CivBJFYrx2Sf0fW6HbyHEN6uWi0?=
 =?us-ascii?Q?KJ32ko0cqjig//NmemTaibflT5CjYOri2hCGeTIUsuNj4lGdkkU7rzDhDrOB?=
 =?us-ascii?Q?MMPCkr7K9xepYExQtTg6GK98iZHzvMIj75GYS0/1XEeedk9TwvRqI87XD2JG?=
 =?us-ascii?Q?Byrmv5z2SVzgsFprhgBmDnGSRDpxQRwgBiBSC1GUJlfiuuj7R9m/gt3VC8bu?=
 =?us-ascii?Q?m3sbDAxPPPWmiUqIIgxh+2Z877STh/ZoaFlrQYeUugcBinWEp4Lg6tUCdrTe?=
 =?us-ascii?Q?NlyrpANnB7jr06lj5qSbnEejnIdWqNCIPprcA37364XNU2N4h+Ubwfr6SJ+r?=
 =?us-ascii?Q?CMpPIx0IQRn4iHiF1F38T46tLlgTxwvOWK8lusm6IwtJ7ZBJPXoafPzkB193?=
 =?us-ascii?Q?DaVdIBZaMzoCw8+qI9PIx5Crqix1O8SeR1x726EDmO89YNMQ8lbfYRsiOVhk?=
 =?us-ascii?Q?37w46Dyn94TBmHcEwZGiq1KAO8ape3tfGlA9M2S9CpDUMYNOdpHRLi1cNrK1?=
 =?us-ascii?Q?jLpVWYzqd7oTaSXNF/xU/5cf7oc6RSS1kbES/n3X0DXHy/iIoD8hZ2gE06fR?=
 =?us-ascii?Q?GkO9QHVP82fOj93n4YUqriTmJgGCdaxBlSU04Sn3+QeuJo8l5v99tjuHhr01?=
 =?us-ascii?Q?J5fQMWe88hPPC7Wj0oRa1E8w2W02b1uE+hGdmdWomKc+XBBXLsJDsLPNkFtX?=
 =?us-ascii?Q?eZhcNlLuuuhhplv33HnSJuMYXuJRq30iXFdmnqJunR/d3Vk+jnB5ohjFfdAf?=
 =?us-ascii?Q?FP0/040=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(52116005)(366007)(1800799015)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zyb0S1gpcAC1904wZATM2cNyeICpq5Euj92sYV36JU2bqahsMWTh7sADUrqd?=
 =?us-ascii?Q?jvllL3/gUg7dB5lGTN0gEtNbwRN4bLSdDW/8gCRfhAVx9db0oJ0f5p21Oj6l?=
 =?us-ascii?Q?bJSfoyHeFmkSO9aCjkz+yKTO1hbXhAYcc1xoWUwElDfOkVWhvoC1gORbxbkv?=
 =?us-ascii?Q?5zPIFwtrnHt4xfHEm18lPbCqQ3OwMAsN6FqLH5MafXoGmAyNAD6dX2EO6/4L?=
 =?us-ascii?Q?ujdbxGdZA7XbtjzZN9o7ubn4oGGWWkTQhgEBF7whs7kJOq5L3iSF9qHcgkSa?=
 =?us-ascii?Q?v7smeAT08n+y/NbuwX9ibA9PDvJNe7Yp+fPIMY6Z5JVCYTV7QjrCs9wI7Cc4?=
 =?us-ascii?Q?jmU8W8DQ0UAsN/ljyvAM/g+5KDoSyAalE07Lodb9nRlRBSOe+yFpyX4/BPWs?=
 =?us-ascii?Q?1Pa+5bg/E60zIJUvVZKcJ2H5WmYzylsfvY1QhwHOnm1CpE3Ersg7ToJLShw8?=
 =?us-ascii?Q?KxT1duCx7zj6AR/pk6IRzm4BCrfvrcNw55wctVyDT32VgQdrc67R9w5NPwh1?=
 =?us-ascii?Q?jbCAyx1J3WsQkrmoRtJkjT9sH5UIJIoGQaMs9t7tC+LM8553IeplpB4wEiJu?=
 =?us-ascii?Q?CBKVmT2yOA1fU6zYNt9/0wgIgwCmYvjWftfNsl0RE8sAFtQZ+7E9qzPlJ8L9?=
 =?us-ascii?Q?jciIzZHGpNFaUPE2sSFdZQync899YOq5+qTcFpw11JB0ParOrWdnVxQpcJXy?=
 =?us-ascii?Q?VTjc62m1DGG3YTUTzfj0A8el4qnC54q40BR1lUaBvDhhFwFsem3oNpCMhJ1L?=
 =?us-ascii?Q?Q2tE4E6kLwIiTla3TdRn6o3Ai16KIDw97yU+K5HSuLqUTzknoUAqQKgLz/Sm?=
 =?us-ascii?Q?TnsXhj2UOGh+liYqOEPrELkpF1GNcWCWeDkiNYBJ5innKMvRWFudGG6e7AL1?=
 =?us-ascii?Q?6X3atlPsmGa4ohsev8f1JZ0aARCQVbyYotaTlMywtxCugUdVTcYAEOgcNkLZ?=
 =?us-ascii?Q?meaa+3X4yw7s+knvk38vjdcksE+1yG9Ta7IcCdWbhBqS3X6pJpjnfiYwmWxl?=
 =?us-ascii?Q?BHGnwMZvGmHCRHVhiU9XhcdyfBgIwE1K7GtX3dvidjYjqvy3/VwJ/HZ7aI/V?=
 =?us-ascii?Q?E/4q2mU6SdrQyuK4lHTXic9IELpulVkp9+xK0UFH7OA7D21bGuQYeP9WIzpV?=
 =?us-ascii?Q?OZkNiPZYVSS+TsAVdCO4IcZFRjkVCYSGB3A5ZEQmuST93+fF4ZYXFdefO5UF?=
 =?us-ascii?Q?fcqmBgD9g35py0pOLpJHjow5Dn191JFaWazMXNFuVIdHW5I76LX31zoRj5RD?=
 =?us-ascii?Q?ldvv20K4UwCiOup6DrMmAiuxJUYknUidOVI5BqtH6T/rOdGgHhn7pW7VvA4o?=
 =?us-ascii?Q?L8Psp3z751+n77fzhA8ld2ulEA6p+kcWFawdSI1RoDWAGepmq0A2IFl96mTV?=
 =?us-ascii?Q?z7jgbcUIgrKWLlNShDnyRXo89/hRWxGxlbh82TE/p6OBO5f6kaHh2LEN4R9N?=
 =?us-ascii?Q?y+xR/oZ7Jo2Combdgpuz57kOB9EOa+w4QC8g+b3z4MrfwM8wMHMpU1BR4osZ?=
 =?us-ascii?Q?k+SC6qjsTBQGIZM0pDSU4/URRkdIcO0LN/d6e7NY2OPXyQ+CbecLSVeZQtFN?=
 =?us-ascii?Q?fSpodcdK7PJxUEM9/eHyYFMo0sZIPtVat0DJwQ+zWsu6VHjnMdpPwkQPQjvq?=
 =?us-ascii?Q?n20sXLe/ZlmOyESupHPweyI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fd458956-3188-4c24-95a5-08dc72e419b4
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 00:31:58.9850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 O+PE7Jdma49i/dqnEUD/rUrF4n2pAjMI/nBZNNdHocZ54mLlMZKIb3C6gysRuJUUsrQ/McFrU20OpKZpvE/vh8RyPTIvc7nMRIQRgDB5SGexXJr4E82CIvCL1DZA4Wkk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7383
Message-ID-Hash: 2E7O2BXBYDDMLOHJR4FMUAVMTP2S6IFA
X-Message-ID-Hash: 2E7O2BXBYDDMLOHJR4FMUAVMTP2S6IFA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2E7O2BXBYDDMLOHJR4FMUAVMTP2S6IFA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed.

We need to use xxx_only flags instead if needed, but
snd_soc_dai_link_set_capabilities() user adds dpcm_xxx if playback/catpure
were available. Thus converting dpcm_xxx to xxx_only is not needed.
Just remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h               |  1 -
 sound/soc/fsl/imx-card.c              |  3 ---
 sound/soc/generic/audio-graph-card.c  |  2 --
 sound/soc/generic/audio-graph-card2.c |  2 --
 sound/soc/generic/simple-card.c       |  2 --
 sound/soc/meson/axg-card.c            |  1 -
 sound/soc/meson/gx-card.c             |  1 -
 sound/soc/qcom/common.c               |  1 -
 sound/soc/soc-dai.c                   | 38 ---------------------------
 9 files changed, 51 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index adcd8719d343..69ba1a628eab 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -219,7 +219,6 @@ void snd_soc_dai_resume(struct snd_soc_dai *dai);
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
 			     struct snd_soc_pcm_runtime *rtd, int num);
 bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int stream);
-void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link);
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action);
 static inline void snd_soc_dai_activate(struct snd_soc_dai *dai,
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index cb8723965f2f..9c7e24cebd7b 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -650,9 +650,6 @@ static int imx_card_parse_of(struct imx_card_data *data)
 			link->ops = &imx_aif_ops;
 		}
 
-		if (link->no_pcm || link->dynamic)
-			snd_soc_dai_link_set_capabilities(link);
-
 		/* Get dai fmt */
 		ret = simple_util_parse_daifmt(dev, np, codec,
 					       NULL, &link->dai_fmt);
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 83e3ba773fbd..714ce1f4a061 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -246,8 +246,6 @@ static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	graph_parse_convert(dev, ep, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = graph_link_init(priv, cpu_ep, codec_ep, li, dai_name);
 
 	li->link++;
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 62606e20be9a..0d2ac4c9ba3d 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -925,8 +925,6 @@ int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 	graph_parse_convert(ep,  dai_props); /* at node of <dpcm> */
 	graph_parse_convert(rep, dai_props); /* at node of <CPU/Codec> */
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	graph_link_init(priv, rport, li, is_cpu);
 err:
 	of_node_put(ep);
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 9c79ff6a568f..5e66812ffadf 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -276,8 +276,6 @@ static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	simple_parse_convert(dev, np, &dai_props->adata);
 
-	snd_soc_dai_link_set_capabilities(dai_link);
-
 	ret = simple_link_init(priv, node, codec, li, prefix, dai_name);
 
 out_put_node:
diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 8c5605c1e34e..09aa36e94c85 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -339,7 +339,6 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
-		snd_soc_dai_link_set_capabilities(dai_link);
 		if (axg_card_cpu_is_tdm_iface(dai_link->cpus->of_node))
 			ret = axg_card_parse_tdm(card, np, index);
 	}
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index f1539e542638..7edca3e49c8f 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -107,7 +107,6 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
-		snd_soc_dai_link_set_capabilities(dai_link);
 		/* Check if the cpu is the i2s encoder and parse i2s data */
 		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
 			ret = gx_card_parse_i2s(card, np, index);
diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 747041fa7866..24862002e82b 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -145,7 +145,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		if (platform || !codec) {
 			/* DPCM */
-			snd_soc_dai_link_set_capabilities(link);
 			link->ignore_suspend = 1;
 			link->nonatomic = 1;
 		}
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index fefe394dce72..f8e46bec6f80 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -479,44 +479,6 @@ bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int dir)
 	return stream->channels_min;
 }
 
-/*
- * snd_soc_dai_link_set_capabilities() - set dai_link properties based on its DAIs
- */
-void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link)
-{
-	bool supported[SNDRV_PCM_STREAM_LAST + 1];
-	int direction;
-
-	for_each_pcm_streams(direction) {
-		struct snd_soc_dai_link_component *cpu;
-		struct snd_soc_dai_link_component *codec;
-		struct snd_soc_dai *dai;
-		bool supported_cpu = false;
-		bool supported_codec = false;
-		int i;
-
-		for_each_link_cpus(dai_link, i, cpu) {
-			dai = snd_soc_find_dai_with_mutex(cpu);
-			if (dai && snd_soc_dai_stream_valid(dai, direction)) {
-				supported_cpu = true;
-				break;
-			}
-		}
-		for_each_link_codecs(dai_link, i, codec) {
-			dai = snd_soc_find_dai_with_mutex(codec);
-			if (dai && snd_soc_dai_stream_valid(dai, direction)) {
-				supported_codec = true;
-				break;
-			}
-		}
-		supported[direction] = supported_cpu && supported_codec;
-	}
-
-	dai_link->dpcm_playback = supported[SNDRV_PCM_STREAM_PLAYBACK];
-	dai_link->dpcm_capture  = supported[SNDRV_PCM_STREAM_CAPTURE];
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_link_set_capabilities);
-
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action)
 {
-- 
2.25.1


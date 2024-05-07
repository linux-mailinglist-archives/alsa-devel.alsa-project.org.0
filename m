Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8028BDA35
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 06:34:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 662C8839;
	Tue,  7 May 2024 06:34:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 662C8839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715056483;
	bh=JaEfXBWlGHqdYwZ2dANrrSieJSCowt5IpkWOna4hHjI=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hYN2MnWgVVyhe9yFjq9XxNP+TWhTxz+w2Q4s1x2q7k+LeKQKi/+nWvgaV3Uj1UQwf
	 CuUpmW5YdZdmkFQFlzHvHPPbTjq+NNJ/CelUJhkoobjrMSQIIYwae2mt04S7GKUNPC
	 G9wLx2Z0JZ1UZy1T/xpJ9ZDvBuiAlsCsERP6bSeY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AB2BF805C7; Tue,  7 May 2024 06:34:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABCB9F805E8;
	Tue,  7 May 2024 06:34:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49F41F80579; Tue,  7 May 2024 06:33:59 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 90209F805B4
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 06:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90209F805B4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XoCmDYd/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSce4s1IqoIXne3vtycCFIOSBol6bPCqk24AQkXYr+RiYXQtxokyzWfqHV6dPmOoTMcsP6n3S5Tcom+K0KpCd2YlgNgri9BoM+wwVHkteFtLMLz6cj73CyznlNdNjJM9NzhUSBGN4qxy0hfeTjDVqVx3kDrEuUUgWZ7ycnftZruOS66uVqVMqUedGyKmBhAy760GRy2jmFiaCUpdhJun5rBQC8QHYuKjzwtfHB4EV3zbEgoRuhgHxs3XCVhSECg0TzNZFfshaHPCco/Jmk5uajbirPRjquj0+KSwQfu3Egq62X3ngzTlHu3cyziuM3EzJiPrxt3uP6eppkiHzHf/9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLaTQRJ6+dc0X4MaTimYuQOcrzydhxcK4moSLomERV0=;
 b=gd/RuwGBxdKkc1doDWgGbnL0DgaOjhPXyj17s8rXG816CX3UeJMBOrN5i7tvCzNLoKeTND5wQ+grdkmTTaiytysYpK53ize2icWWs2Ee3tY/0yb0cZUCMTPi628g/VtaxoMhivCWnwG/My+q8eQEjJQDGWaydmnFDg5tVRXsPCXukJ89GSe7COvyvF1FuzowmZFUcOFlhIU82HkjkkHpGn/iOzZrdUnd5xA+rOpvx87PfIza0FDpgnrdy44CFxorh+m9GLsByJl8LYZ+Dx6deZoSx2nSD6RLtsGU7bbTNnLfP2+ps9TUBq8adUg4V0GbLroferBWqJBur7iGvUKhsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLaTQRJ6+dc0X4MaTimYuQOcrzydhxcK4moSLomERV0=;
 b=XoCmDYd/ozXIk82rcVsh4bpG+pWp9TcZX+Q7k7cTXTAuZH39pmkmHpPWIC1q/Cczx8ShIcIfrVa0bb9QA27tZSZCyKLdlOfvZieNFcI/n4s13YuDqLAcLxu9035GQGhJwzjG8fhEfZZx6sqyHLy8LgYsd6NF4YYBwRQNVsMJ8yQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYBPR01MB5421.jpnprd01.prod.outlook.com
 (2603:1096:404:802e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 04:33:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 04:33:45 +0000
Message-ID: <87seyudyvr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/3] ASoC: remove snd_soc_dai_link_set_capabilities()
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
Date: Tue, 7 May 2024 04:33:45 +0000
X-ClientProxiedBy: TYCP286CA0165.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYBPR01MB5421:EE_
X-MS-Office365-Filtering-Correlation-Id: b052f01a-9e9d-48c8-85cc-08dc6e4ee1e3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|376005|7416005|1800799015|52116005|38350700005|921011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kz8Q6yIp8ZWpEfKsMymJy7YzzBspaR1TI7tBy5RT7qaRXoeGRRonIgJOXo0f?=
 =?us-ascii?Q?5q7v3oKj2A+jikS2kfOZrrYFWwbqToe2utdl6ihZ5biKOHfURutXdGUW6KZL?=
 =?us-ascii?Q?tVGpMRG/KXce0W5ZLaHQGjtoXGvLnDn7jGtXMgbSPg/pKX1wHxe69j5af0ww?=
 =?us-ascii?Q?DIVO2nxSRuutovtEEFez5PsU+cEN06BZnP+9ShZvrh0GCCGIwjdnhHkc5p7h?=
 =?us-ascii?Q?G09XClxSUCo2S/19zAE1L/1nz9xFaVshV5zEtHjvcwE17D4eHknjfeXcfHcI?=
 =?us-ascii?Q?CyNUE1WnvE7wMTtgtBw9yaxATUPNlnMOG+xpnSQ0lz2V7WHY0lhC90bi1lkm?=
 =?us-ascii?Q?KIUUKU/h3nXMoV/b+myOpcFbT9mFluiVYYDSDvdweOeoqr7UXU+akHI5Xrfq?=
 =?us-ascii?Q?cjJ1RQlcdYIDivPOt6MBgtEbgwDvNAlpijRIEUSTEs+48OYaizY2K4N4uy/A?=
 =?us-ascii?Q?X0XPf0Nfq3Hx7R/t1uN+Z268DwADrkhH2E4XxGhaEq9I+3c70aKtwY0rO48E?=
 =?us-ascii?Q?ipkt5unbQlWm7WwQpbLd2aDl6QdhNSGhRM4Zv/YaVSdOOgRviygPUKSFNWa+?=
 =?us-ascii?Q?LNYNihNLIWxjcWAbUwtR65S8qhA9jsQ7FnBt3XcrQC5hHK94H3B16sZsXAmf?=
 =?us-ascii?Q?lUbg2F4EaaxuJEFuJIA5IJyO8eQB1r91k9pC8QDzgoplnJ34sPGXQUo8nH4M?=
 =?us-ascii?Q?G99tWbnEQDf8nBfNn+/a6h1Zrgb/GZy6Q0PJXQQrjLVBnW3IpAfK9hjtyPfz?=
 =?us-ascii?Q?oJhYCalpCUCWXoF/nUcmPnIxuI9F0/xr5e8/KKCYTERIVpmYdPWW9x9C5Uyn?=
 =?us-ascii?Q?W0qfy58SaXCmgYrEGLqZJGhb1HRITMkG7jF5V40QOaH9LiAYy5PvdzeqhK96?=
 =?us-ascii?Q?+Y+TQUnbg4gHSTPpOFv/9bgkGKFtP1oRXd26FUoQDaOGkuhcvYuIFETTGW2J?=
 =?us-ascii?Q?yfOu4nKOWqUkqGKrdshW6FGfOER9XduHHc4qG4ldlGTK+ejCn2djbnUUsv1m?=
 =?us-ascii?Q?AsHtqvsxQZxJ3jXi8QKsnJT9BXhwvT9k/fyZIUQtjQoDvV7iA2QcyNuqtgVg?=
 =?us-ascii?Q?dCM4z/iJUtzvdd0+Etbv2AhCuIW20n58VxNzlZByfwIMYhzgPjFgUdVXnIa2?=
 =?us-ascii?Q?WqsmBUEXmhC0+zJjIlY3qMExG2n78wG7jUbtTfKjWD9yqU/J6G2AnH58DhEZ?=
 =?us-ascii?Q?odYHEK9nvyKyrdNP3FC1xd+g5fVVIIVsezp6acsHqX69RzzvZnwMBEoDFxsY?=
 =?us-ascii?Q?h5CDZri2Wj6Rb4chSJ7ZNO1PLV9tq0vVGqYoQXJ68e8P5d4y2SkPWVt+3yak?=
 =?us-ascii?Q?UZh+apM03c3ySGc14NRoYnSGrZ3GimbodS/OVzlTrmdTNVYm7xOAl3vFQJuJ?=
 =?us-ascii?Q?mVnwAEs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015)(52116005)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n3CwhEIWGEm2LLnYYIM2QF/R9JmQvPbCnRi76l1hdTzskesFaze5LzZz2Cbz?=
 =?us-ascii?Q?qE2xCWY2nxbYllscIufGkE5etcTOu1WcRnstJDZ0eKopPFUiZF5cpXIRS1Rq?=
 =?us-ascii?Q?0+V8+a73envqOb5LTrf732ucJhEbvcw6tJsX6w3pyRbPeADgfMZDfMaRMqm3?=
 =?us-ascii?Q?ywWa7WHK/2QQkeVOdEOAjvCSddjyM/bwBrRxKZqz2nfeE5QmRnM0N7jyI4LJ?=
 =?us-ascii?Q?CIThzJhJ6cwCupYmHaOnvcEev7UpuWX65hnZHwhDRaLc3vCDaVBvdhvaGYGF?=
 =?us-ascii?Q?1fOUofxLKONg60QBydTfFv8JbeJLqcS/GWkJ7KHAjgUQ8Yq+cuHtK4hs6NZ3?=
 =?us-ascii?Q?HWoUh74kkzSC16fJWyKENT3UYyMPWmpt8Ea+3jwi3Kr4cQuz3llVhwr10ckh?=
 =?us-ascii?Q?3b0B22cd9YoQDChoefrj870LoWfB+Mm9KN9jWTTTyBuGKjT0Yp1dOyK99zKJ?=
 =?us-ascii?Q?yMT9rZBAzisr8i5TpO3cH9cK8prU+Bx+1Xg54zquvcLyqHyBt84Meddx+2Mi?=
 =?us-ascii?Q?c4pGfdngf1cqkMGdueTnNceQfVKWIfNeWsdplLTI3K6DxKJQx9qsCnxIUwP9?=
 =?us-ascii?Q?/g25OMgeoJNktCfeLt1wGVQBrc+LlgapCbSImmcdIh+Sbt5juH3z+uGOFRx5?=
 =?us-ascii?Q?KAiq1kqrCiqAsRmgdSlobjb+yY+ZG8peQDsFmOzmZkSfLvPwPsxXdDT/a+Wk?=
 =?us-ascii?Q?R+ksacHFytYabm3pHATcnUO7dQqOctBPUMn6vn0pE5sYCILIiH3dEQc67TUJ?=
 =?us-ascii?Q?LcWGJ3TLW2+fVYP8OuAbkIKWadSK2ZfxupMefY/fW3UelhJqGyaQX4bbX8Dg?=
 =?us-ascii?Q?fs7CkuI31Zbam7ZljgikeAGyUpHqliUsEREb+sPyC2YfsDzVVkkxsq0cu+p/?=
 =?us-ascii?Q?sC60NALdSqQLZEYiisf5FtbTFjFtx/bI0BUnFkk8fGiIea5X8O3VHa4mKoIt?=
 =?us-ascii?Q?1GFAVGT2EwaCGXgmJ2TOaWf55Z1WfHn6tWgEQ4uX1UaK9OUUOGXqTNDudhXR?=
 =?us-ascii?Q?PZlA3Wrp41S6sRoMx9ANqT/SNQ34TjSfJLEAvcqFDtUmrcAU/KdMBe8dliX1?=
 =?us-ascii?Q?Tt542R16bek8qb/497GVM1hEqorfkFUgE7hRyWHFzDzOskoHX+fBh7+vQnFW?=
 =?us-ascii?Q?PHgJaL1AlheAHiuwYg8fLAug/647dQpmwgzj1P57GODrp/1CAtCPaA440r22?=
 =?us-ascii?Q?ZrvGljofSzN42Elr8hZBFHHFbC59xgCCEhboHAe96RaXcYXR0o4ytJb6bVny?=
 =?us-ascii?Q?vh9eVosLDO5eWlqUOA9bnrtHtveqLe2jMhgznEr+DVRRnjv8BcR5W9D3A02e?=
 =?us-ascii?Q?MSKLXkopKu/lrGR2CrMNT3Q9kMs7Q40F/5MaVUFcZPuFj7utbONUZaq+SQf+?=
 =?us-ascii?Q?81hooj/izZ9ONRy+BKAJoIV5GohcCxehHpbd1QEjeeyVFlC2eXrXBjUe5Du9?=
 =?us-ascii?Q?Epte0voYdyUSn27QZNkUFKJpOh4oKjPLFMnEdoOh1gZySWYuUXDgbPOr16sx?=
 =?us-ascii?Q?g+yFrZ0YRBcazTVKaLhco+B/YAZmXqDRZRVCrLadLpgxa+kOuU6JmOxWRYC/?=
 =?us-ascii?Q?ML3Gkpmf/0jfc8trXuRVJ+cfTBVgYUfNt76cV06tOisH9TPrGU3rMeaT3uFS?=
 =?us-ascii?Q?mCzm9eVSqadFii2VuLDG0b8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b052f01a-9e9d-48c8-85cc-08dc6e4ee1e3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 04:33:45.7135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ECtsaOg5Qh9qmqkgRTG45kBwG8zpXWYZbnHDhBTGQk6uYYr9HjPaqLQW3kNVZv0sJ85P9+MaI6Q4N0Hvtq3bfkDeq5GdO/TrhIs7wAzP0UlLfaWYdasS0zKeG/Q72irp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5421
Message-ID-Hash: XP7JIU6TT76JVQM7I5TODP6ISMTTASQN
X-Message-ID-Hash: XP7JIU6TT76JVQM7I5TODP6ISMTTASQN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XP7JIU6TT76JVQM7I5TODP6ISMTTASQN/>
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


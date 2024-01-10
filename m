Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27650829215
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 02:28:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 744ADE94;
	Wed, 10 Jan 2024 02:28:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 744ADE94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704850105;
	bh=2uk5XuzAYygVrwCppeXt8yytfB/3Z9pCsmaukfAkVwo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=A5xCWQsW80LVT+q/R2q7uatMLytcVikPBkrBglwmA/W0F5NYbogJ9Je3ZskX3gO+O
	 tlc3VMy+ExYU9nYyeAxOHQ9Q3pl9YKl294e8XAtDozntrjLj1AkWlwE9Mn2MmTqwSZ
	 Ru1rIS8NUqkCqkydYeqJZedyppyw+e4CpRvLZVxg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD597F80086; Wed, 10 Jan 2024 02:27:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B72DF804E7;
	Wed, 10 Jan 2024 02:27:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FD2BF80254; Wed, 10 Jan 2024 02:27:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29E9DF8014B
	for <alsa-devel@alsa-project.org>; Wed, 10 Jan 2024 02:27:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29E9DF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KjZOOFda
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVlHoJFIZz8FXSJGEvK832tL9owzRUwipNhdL/1chlKKcQ9qd2jtN9bdAMpRJylYCqSzgdpfBhLRAxVzF13VqOPksDpXb6KitHbmoprtsQLNwsehOSDmIk/n/5uSjCeyNj3KYsVOjZw3UNIbLn6LH27iMuPGKiR/eekaHFtLvqGTVJnrMAd7bisAX5CL/TTaRk/PDJ71X5/wvSjROrfZJEfyNg11mLzo2eQ/ZL69/qHIIDMIoJ9evgDCsTV7bOJCNAoGK+hpC0ZJRhXxDalCQvghBaRxXRoCBwQFt9by7i+K1co46uJAJBghfJuj/KBWNqlX/ul/43EfLlS+r+1j+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztEUN+jhXDs+6DQWdBKDnflHERGm+i1mBTn2NW661Bg=;
 b=PqS8nTx/JzBbJniJeUbCiKSOhH+SuLXz14hhtEZCRU1i/OqE2c/w5OC/9q6+rZ748SATawqX09w3Q2KwGi0AnYfD0Ek/wXqkm97N5IYJOsDzQbtz5lMVL1qZDH20vEDmsNFK7PvacTi9HOoJYIJFn4Y5GtDL/pEgz2RtTFHU4Ve2SzmyCp313vEI7eMsSqP2f/gTZVqUXYNI/TyB3YTz7AAEZ7itzoHcLCXEkHCm/wfZscYrns9+p3/0cccZqezGdVR+o2YLxSzm+e/fsEKaWkHGs+2dwpTXNaDXimko3nWxyF5RusbtpORItUkZUeMq75m9r+LTme1imsl65aky2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztEUN+jhXDs+6DQWdBKDnflHERGm+i1mBTn2NW661Bg=;
 b=KjZOOFdaO4lVhSomKB0lOQW1o0qTE4q6gCg0IR2IPwmNwZf8R8dLILy/egNdn1VmxY2Js0oSjiFaRVJIlGp7sH20QlJOgIvkVVBF7ivR3r28uuTLfGduotrx+jAVIWY0+DtJfPxmZQxZSOoSNxLJmPeZaOt6BuDXtfahczz0W50=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8341.jpnprd01.prod.outlook.com
 (2603:1096:400:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 01:27:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 01:27:40 +0000
Message-ID: <877ckigepg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Peter Rosin <peda@axentia.se>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 0/6] ASoC: use devm_snd_soc_register_card()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Jan 2024 01:27:39 +0000
X-ClientProxiedBy: TYCP286CA0308.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: cb6564a9-4db5-414a-816a-08dc117b55dc
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DwaPECpT3MluqramcqaZ5+qefw4OkXUzydFBTYB2iGG5dcJv6BgzlNuHr87Qqbo5tuROCmdjaEb/J2CxQorlao4rS+3BN/hjr3HFG6doR20PVymQYnFJZOTI8NHnJ21CytWAGH1CLSG0mwW9fNxUfYKxQ9ySS0HA/Ttq4AcdVkrx5rZ7RTHqUaQEFp29x43sSh1M9xsTFC5RlZJctpJYVRVE2SvBLbj9ByZxAoGJVDfW5WPEpDJUm9+Nj7i8YK1YuRR/bs4RFi2nQJAUnsH5+uiv8vkgfeGLMShEqOysgCr8ryd148mOGlI7z/zxsNJUJPHrckzVa8R4CWlt6GdcZ3/0hXyVlieLZWtWBLVdwoxRoPARbg+eY6dkc4hUn/QkH2O7qdgb4gJwPJsx6E7gDWiimCSYe+Z+FFoGvXHKDs7wrl+lp3oJMrmW6+VrZ02smtk2Wp4u/c6Lm9JWvR+hmyBPl3YSjlrBmU5L0OahfVy79cbgHWitQK/N7XhmWPSRKiQL5YLCbW/83tCiwPMXDT1XtgcnoEAVyMYNeIP9wJxyamVJZgtF+UQyp6h0ywMR3ZTfLEIfMWYSOOXNLjqfm9NU/7qVlBAl46hQm6oSCFHqKicvrjJZ6bzaKQGdJ4u8FYXxEsU5S+7oCmfHGjfp2Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38100700002)(38350700005)(36756003)(921011)(86362001)(83380400001)(2616005)(26005)(66946007)(110136005)(6506007)(6512007)(478600001)(52116002)(316002)(8936002)(8676002)(6486002)(66556008)(66476007)(2906002)(4744005)(41300700001)(4326008)(5660300002)(7416002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?unw6Kk62ZR9e6SC2zl9SzdKW+WrOstIdQAtn07R7BaT4kEJ7y4TypNupVDsj?=
 =?us-ascii?Q?ClbEoXrC3Pmf9QTPAbBD+toLD/6jK6XBf/KymYQIFG4jEU4qbSZoIN/S4XIf?=
 =?us-ascii?Q?A5Wc5IuJ2sEZkgPOBFmou4Qvq0C3/ThiKblNSsmw8nsZeHhMDVXr6xooa9E8?=
 =?us-ascii?Q?OAylBKvzw2R5MHNFmgEj/hxFK3iRXmLZVnsdsOhQMTgTgisTVPryfPMfEn7n?=
 =?us-ascii?Q?HWYKzCqLuBSOaedCIoA4mtK/pzftarTPdz+lMWfp40H2F9sHN1kxBLbEDsgB?=
 =?us-ascii?Q?R3vzR0612xbGzWCtmqF5+r8yzgWGoKNfQyC+X9oxn6fpKAFoUL41b01sdD77?=
 =?us-ascii?Q?IEg0kSgR1ywn8qDoBg2um/0Tnn+Mub0JYL984rHrUD5vSqXO6DSOuMxtBJTi?=
 =?us-ascii?Q?jjkrh5Y1qnqbbs6IIryJES6Ku8chg8PDGYN1Rs/8ulvRQE9fe0SxC3qMnnyO?=
 =?us-ascii?Q?foBmEdkhG133C1W4l+LJJdY9zHspmxnC7uM+7DQRC5c2WDvkNg6qM9Wkd/P5?=
 =?us-ascii?Q?cV3yCLcKYZB5rM6IpmFnjwlT3+FIAOFgqcq2oJJuMRrQRpg18xXxFWpkug01?=
 =?us-ascii?Q?pNBo+xkswjAq2y5lLopRvHETMlcGgaKjcJ5gXlrpAaw9Jy6pQiswHwwPQwaH?=
 =?us-ascii?Q?SnxqQvGJAqmQ2RqxJxdYvGFo2H1b9gOcbnZcCsdMnCiqMNCNLwU5+VZMr0lo?=
 =?us-ascii?Q?OjktMnVKJSvoHDvgTxWtfAZwDz3gIMyeZr/jKUjlMvYn3QnIT/JujYRKo4kT?=
 =?us-ascii?Q?6fq3/OGGmsrRQq2sMFCAh+BcmFY6av4+3bNumARPMZVwaAtMEd79Bl7L+EBU?=
 =?us-ascii?Q?ZxEt9ukOKU+DZnFXbA6Hdq3eH7eIMDJIAVapYMyZf0XIwuMvLXLAW3AtvrCq?=
 =?us-ascii?Q?eypH+kbTwKq8BhR5LeMDSYQqTo07gmqtk1byghosPeIdKe0nrXVqP2YjSU+P?=
 =?us-ascii?Q?UNAZrbxht35xLgtJ6aBQQaNPuwuQjbJCh5IrMntKDzYncAtf16YCDJ+dcV9V?=
 =?us-ascii?Q?THorL58q+Xa+gm5PjJX90DC150XvU+j1C5jG9GBG9mWHN9Q7542xm7Qp1350?=
 =?us-ascii?Q?yPbSvdnAp9GUUC6Wdu+knhmuquSLPopLlNjiZrkViwQaLK9j+6htZQbv9lXp?=
 =?us-ascii?Q?gIlUMa6oJBWHWxC66au3FtXlDmETxmtCCuYo5l86refEIWyovpyEcamSOSvZ?=
 =?us-ascii?Q?+1f29k6CN4lDSq7b6dutzA4a7ouN6Zz3lmh0yau4jyTV7oXMsRSROT5SPuVf?=
 =?us-ascii?Q?A8ibUXo0NuFdgltd/zQC4CKdGcdBaxrKSrKlIXam/NfBgYTDP6UUeWYb4Ymy?=
 =?us-ascii?Q?6o242zHk37zqFbP9yX6KGUKncCOIyxIzJ+UsEMz+h0dpinOJpCuMAU8aWtyx?=
 =?us-ascii?Q?bs3TjAoQVXIlan9iid5y+Qaf20EeaYjRIi5oOuRespK5IMn12iiT7d++/PT/?=
 =?us-ascii?Q?XNMB9FiexC78NszrW8MQXOaolW7vLrud+kILtur9lhNLphHABEYg1t4K5UMu?=
 =?us-ascii?Q?YKDgkVZbCZAGnAiTmn2roP8DZrSbnEmN95843FdRdA68GyrSD6hECWIkXM0C?=
 =?us-ascii?Q?A2swPUeHfobK6i3ztOF/wkZjlMnnlGD4I5NrH0vaaYXD6xCnGDmGFtUMYghu?=
 =?us-ascii?Q?e3c4xcVBC77TMn1B3r4wpd0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cb6564a9-4db5-414a-816a-08dc117b55dc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:27:39.9968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1TA8t0jQIHFqyYxKXodYBsLqCvQD9l41STvSV3yQaLx7WbJXh+RWDs/7N+3nb2r5xi+z1hGcdw0E8VJT1XM6YCCuL3FI0TBGDgniCqPASA8xZt8RpijKdP1ApAkFAW6A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8341
Message-ID-Hash: GINZUY754OAUIJR7B7P5XPLYPNQEPBOV
X-Message-ID-Hash: GINZUY754OAUIJR7B7P5XPLYPNQEPBOV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GINZUY754OAUIJR7B7P5XPLYPNQEPBOV/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

We can use devm_snd_soc_register_card()
instead of      snd_soc_register_card(),  and is possible
to ignore       snd_soc_unregister_card().

Kuninori Morimoto (6):
  ASoC: ti: use devm_snd_soc_register_card()
  ASoC: fsl: use devm_snd_soc_register_card()
  ASoC: atmel: use devm_snd_soc_register_card()
  ASoC: sunxi: use devm_snd_soc_register_card()
  ASoC: ux500: use devm_snd_soc_register_card()
  ASoC: cirrus: use devm_snd_soc_register_card()

 sound/soc/atmel/atmel_wm8904.c      |  4 +---
 sound/soc/atmel/mikroe-proto.c      |  8 +-------
 sound/soc/atmel/sam9g20_wm8731.c    |  5 +----
 sound/soc/atmel/tse850-pcm5142.c    |  3 +--
 sound/soc/cirrus/edb93xx.c          |  5 +----
 sound/soc/fsl/eukrea-tlv320.c       |  8 +-------
 sound/soc/fsl/p1022_ds.c            |  3 +--
 sound/soc/fsl/p1022_rdk.c           |  3 +--
 sound/soc/fsl/pcm030-audio-fabric.c |  3 +--
 sound/soc/sunxi/sun4i-codec.c       |  3 +--
 sound/soc/ti/ams-delta.c            |  7 +------
 sound/soc/ti/omap-hdmi.c            | 10 +---------
 sound/soc/ux500/mop500.c            |  3 +--
 13 files changed, 13 insertions(+), 52 deletions(-)

-- 
2.25.1


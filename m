Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A1498B1DC
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 03:42:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32701EA3;
	Tue,  1 Oct 2024 03:42:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32701EA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727746942;
	bh=PbwU6wHqI0RkujWOH8IiK3Q99jsa4tgfaOXE36c1fB0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tpE7nharATQLLio6A/U5NLxXpgMhmmUKhRBpFgfFnSulUkQpBVVJpW36PSlK4yzTj
	 6f+i58gxUQ3aGP/JVrV0bZswRORhjHln5OWzAxnvB4e+1DuIFhddY4KW4mWk6/8ax7
	 MMwI20Kk0IRm0OTkKTUMTRKhQ1cP1ABhJTfQs2Is=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5C69F805F7; Tue,  1 Oct 2024 03:41:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7BACF805AD;
	Tue,  1 Oct 2024 03:41:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6F92F805EF; Tue,  1 Oct 2024 03:41:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12665F805EB
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 03:41:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12665F805EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RCQipKJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1vkPyeIHRzj9Rgfx8fkfhgWqJio5lxE3zoYWWFZy0nxNkCxr4XeFb6C7smrc69HinH1A02YOoQiQZbePPddjTXiYsYa7I3iHh/1+oSedGljcMSMZnSNqC8x6FisMS3Gw1BixKw7pr5qX6wAQhDdHUjBxHRHN9DzeD+Jv5B4BcBRe65RCQmT/w5W+PvVG3pmzAMx4lNc+rnwa5PQZKjDD1sZ9/RFpiylDHpYltWGxXBzGhLToRB2HerlUZymXgFtF0R7EdKp5IpU+BjCYLyKkcGNrczIpooYmrPdqfPHBeBWj8EYhernzmNriW7iLV6ZIbSykY9EyrDVzfahi5xPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3f/OYf1H3VinkC65z2yVjJNFovoenyppLGdpNHRL08=;
 b=sqIT3B26uSqFWpqTd4rxmO7CDWNzkpoKWr/3ggJ6JjeLso2kMCS344RFPRQipAPOs1pxbWdt1Du8R4lBtNb22JlOotkcrRTvoNWoBFGOAYKyxYopSxJ9pfhdMvMBoaVsZmB43zyS1qm76KRhPGIgiRlB4Cs3u8Plk+ImlSWka+sJ2fVtUW1p3rvWk0k7SMaUpPRsVsmpVm8VNKXJNPtV0T4OLlZQJEZAc/X5PfseNO4KWNXcIMwQBH3cPGqCLqt4ay+XEBZsd1Xgiq7Poi0OVfeWK3BJc9BvOfge4gXkd4mYK99A5YzuglKlR7lYpnjnMNS49dc0Or4Ml5cWSawlJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3f/OYf1H3VinkC65z2yVjJNFovoenyppLGdpNHRL08=;
 b=RCQipKJ9Rwk3S5wd2KXPSZU1ecX4w6B2cFXayjEIPnGBkYzitHkKLaZbuuPGYrkYNWisbNrLmxTrn4BLeVG19phlfDoshQTd/ih6pIYA4VguDDf9zIBNdgk9kN4hRmQe1JYtqhk7tP77636nL50KeD0lDOGABM4M+EZkwF0sX7Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB13482.jpnprd01.prod.outlook.com
 (2603:1096:604:334::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 01:41:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 01:41:26 +0000
Message-ID: <87v7ycvbuh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 02/13] ASoC: fsl: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
References: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Oct 2024 01:41:26 +0000
X-ClientProxiedBy: TYCP301CA0053.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB13482:EE_
X-MS-Office365-Filtering-Correlation-Id: ab99412c-a3f6-4442-2475-08dce1ba2a0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OLXdL6F9f9P583d+KWNSCWof+4/iI8GZeMtG7X5+kkxf6JypD7KkXIXsKD37?=
 =?us-ascii?Q?x8Gc+p5Wzu8d4gw6kL800apvfsjIADpGu9wimA97hGRCqIzTY6UWfZtD3Pkz?=
 =?us-ascii?Q?grfPH7PEYxTGxV6kpZNFHDGTs1+QJweGEkIJkyisEDO1QMIm6ZLpJhAyud/H?=
 =?us-ascii?Q?CVYMS9DX8QFH4GirkpKxMTd4HoGb/APzfbB9+/vvjYLwAlh6l+l0/dAOGPIb?=
 =?us-ascii?Q?53d9rX2v+TL2wiazM2PaL0ENLNQyYfhqYHGKug4DZ7EAiq9vTwBSELgAwTk2?=
 =?us-ascii?Q?F4R4Rs9FWee2jbo/k5eoG15z0LUbN92yIdkpb+ypneoe8cvCsgTGoI05ud7m?=
 =?us-ascii?Q?/ZezEoShmCu6jT2dyQ9rLMxS0rXoiOA1uy89DsQqnX00x7tLAPQvWuwwRXeo?=
 =?us-ascii?Q?MiPRmEmYtPS9kbHJnkKojtrE9Fcv29I6mrbYPwloQU8d+iCF13ihffK9ggeQ?=
 =?us-ascii?Q?1b4QcFWTfL3//CvaTMz7YK43qGw2kWFf78ydmNkMAHSfQ6vzSHuyhuXsovNP?=
 =?us-ascii?Q?IZNIy6yt3fs4di533klcF0bE7gU1/TRenYNZVnSmQ2+8Wz2tsj8vR/uMlnTz?=
 =?us-ascii?Q?O2oZ/xJbU6DkU+8mWu5yfpbxfVmc2qz7fUhpLzBWUNHFY4e50xG3GrRGIjfJ?=
 =?us-ascii?Q?6tjJlTq3kDDBYBFrN/V7tTzyQpbOKYDUMoUmJ7Bo4fjtapM/8EnumH1+yagm?=
 =?us-ascii?Q?tgfRSL6WoSDVaWDqeeS7iT4ChZ5emMMdTTI7d7H6EqM4cUeno5zV1imUepM/?=
 =?us-ascii?Q?wPD2K+mhv0yY0L2uWLT9/mkrFxNNauI9XSrVkQLyLy1iaJVRkh784P61gQm5?=
 =?us-ascii?Q?7LYhCWWrduA3biIcNtKN0JQBuI0HhTtkifeyiPeUgP6tplo+cShVHmw46MaU?=
 =?us-ascii?Q?RfL4l0A/lXj7C8JyJmXv/A4EQt6pdZu/S0QmkCKILSi6rHDpEC6+uFvWCVSJ?=
 =?us-ascii?Q?t+8Q6sBZ1+BkFc/RhzPys5Ur2x/PRDVpisCNbXr9IaRX2n2XiKKN0Aq6tvxa?=
 =?us-ascii?Q?HP4rKmozeFV2dV+6ADupL0G8aIxxFvPVturDoypOgILXKZ9wQjEoZzmBW8d8?=
 =?us-ascii?Q?QkW+chExw3XWrLlxyRHLZVZjcrNyRJ143MfQjQgx6osS73Yeb4W+mMLMnM7k?=
 =?us-ascii?Q?3fD5sU9G5BO9iDKOu2P+n5HUIiD8hHplx31ZSd9/8LYo88zldPmAvFLvFd3y?=
 =?us-ascii?Q?8qc7Y8dq4TMMobJ1x59nwzJaemGzoBGWoiqOJdUDLIVOpIWMXGWo+47CwC62?=
 =?us-ascii?Q?dP4GTi2xLFHOT0fdzaR0YOhT+g/MrvBztoOp0D7VDzh1wuC/mB6zARz2QZ/m?=
 =?us-ascii?Q?j9NY3kvmkLyvJIWAFnyCzkMgSunz5RQvebhgIEPIT9gKnA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aY2oCUgAbM2Q6U1gSfIeJ4fB5ngz5O5pYOHhx34+QudD8plcAd6xprk0ws7t?=
 =?us-ascii?Q?I8swne1lWQnxVUYZkYbDTWFSuLIIjl5AibxYfmAX6stC9KhO7soi14+4EYGl?=
 =?us-ascii?Q?grapIvDr4tq4B8Ey4E2EM9ul6nY0KxIV+7lbHrjtOMJletAlC71HrLEg8SkT?=
 =?us-ascii?Q?a2p7UpckMA1wuoyfrPO9fBFwleTZXR1TV34ebYsRzXfyc5/erjRdMoYDAVKV?=
 =?us-ascii?Q?adR2eq3CITP59i2qQKfLriJ2nhGvDVNzo9PunBh4dR/CMl7zphyiHz27dQIX?=
 =?us-ascii?Q?ySy9p36gINNFaEE45a2h2NZXMg9LJGWsNqbf3S7WNemDXec8AyP0cSpru55Z?=
 =?us-ascii?Q?ydgD7LmWj6i8YubkNTl6mk9S1NoEfYmpZYOm2A2Jsu0hDK35Y1uWNPvvYyL9?=
 =?us-ascii?Q?ts0DKGVcqt+A93KQXf7cAfzi4h5ySgbfCsbaB7gaGPIPpHPD3eSIvzMJHMoq?=
 =?us-ascii?Q?r3NO8GAcysApph0vs+W7PN7xXg8Xew+NAjvSGritsRzXZlvkKmCAscXsVOrH?=
 =?us-ascii?Q?HBImVBNxTP5eSIoNEz9+6AHiyEwZu1VRrUJPoIQsfLioltaivVdWAjwo51pC?=
 =?us-ascii?Q?hw0aTsmA3inIlstHIpPRJay6Eng8jWeOKJSGVMzMT8j169G37fSSQjRUo7tA?=
 =?us-ascii?Q?sEfIIo9xX5mZVpT/y+QUyxntaBOfMIQtt4fzFPXewzJxL+Hdcj5PQ3y/r/9+?=
 =?us-ascii?Q?HSX/Up/i3JuLTEU1baOdP3Sawh07lXHmJZvtsqDR1L3IvoOyMBCsjTlZYiFR?=
 =?us-ascii?Q?23I1qDaeBygf8zQuazcHtWYEBrl1Idkp/rrf4/q2RceaJhH4GDu/yaW1zj3j?=
 =?us-ascii?Q?Nb0S55M1iy8k9hb4fagY3poB8uXCnvZHcQt280C8wuWa+SQEePAxJpXO0aC3?=
 =?us-ascii?Q?5iaM5QcNexi4pWfg8OUyXNWkdZnNsgGe9ACQRKvDA3VVkJ3jyYYvmDMBokvN?=
 =?us-ascii?Q?vMibkrot/s2jyHModiUt71ITk0TdaCyyPM0IIR3qE53JjLnH4+rXSJOt2m/N?=
 =?us-ascii?Q?Hv1rJR4tskQb4gqExXumt0DqUsoLu9vpP+t6rVYlZIYZa0yum1EdOPG27Ryb?=
 =?us-ascii?Q?ZjxyAm1cCy+ZlVhpFxpmESLfeGI4RBLbshCEZEU2Dp1XFv564AjOz/EnJ3e5?=
 =?us-ascii?Q?ItxFW6Fhdb71mfjUrMC6+hyl11fyML5L8b/47Da2bJsdOvcwGyxhJCeVR0wG?=
 =?us-ascii?Q?7CgxbifCtakrX9gMjQnPXwQlYyGKIAJJ4IQ+n6kMi2rpBewZFGedG4sJghWs?=
 =?us-ascii?Q?FPlXkoFSCNGVSbQLwixBbDsOJWviLfGSdf21iQjkm91wOdQaWVj20MhwCjh9?=
 =?us-ascii?Q?ziTtx+p8TqfzpGEk/iPIEw8QNR43MXR+VSaPJuB2hRMZdNDyKlv9mHhzt7Yy?=
 =?us-ascii?Q?ia1SyC491qO4tixVNqsv5gPpOUETW3R8Z1ULUi7fcy3Mi6q+Uhg+uNmeRsFN?=
 =?us-ascii?Q?MqTv8dslrCOg9qG2rLzGp10GNbgYN7Y+9YT0MoLFB8RZhqwD5LRFGl4xzpsr?=
 =?us-ascii?Q?prQeOjqbrnw48YROYE3Rk8eJscSuaaooNvfqqXvW8dke8IsEXfbH7jRt5Xnd?=
 =?us-ascii?Q?OdWrlueTIMPC7SB/bm/fPPW2XYUexm8cBEdzr1gzht5lKgOlXHjCkopbDdtu?=
 =?us-ascii?Q?nZ2+vheWnmKAfS3jIetKHVc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ab99412c-a3f6-4442-2475-08dce1ba2a0d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 01:41:26.6180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xQGXVh8uJqQgwuFuEGl4vW29Osda7NKy0B4o71d65o5D9fyHnGNg2cjkjAHx1MIPPT3vXPFLf6V/sGcTgOGliwC2xVL92Nnn2S73lzh6txQLgdYQgpRklLjUvcoDEds/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13482
Message-ID-Hash: N4VMHHBJRPV7VBJLBNKGVGVZGHEBDRGJ
X-Message-ID-Hash: N4VMHHBJRPV7VBJLBNKGVGVZGHEBDRGJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N4VMHHBJRPV7VBJLBNKGVGVZGHEBDRGJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 24 ++++++++++--------------
 sound/soc/fsl/imx-audmix.c    | 18 ++++++++----------
 sound/soc/fsl/imx-card.c      |  4 ++--
 3 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index f6c3aeff0d8e..82ca137621cb 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -317,8 +317,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 	{
 		.name = "HiFi-ASRC-FE",
 		.stream_name = "HiFi-ASRC-FE",
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.dynamic = 1,
 	},
 	{
@@ -326,8 +324,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 		.stream_name = "HiFi-ASRC-BE",
 		.be_hw_params_fixup = be_hw_params_fixup,
 		.ops = &fsl_asoc_card_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.no_pcm = 1,
 	},
 };
@@ -504,13 +500,13 @@ static int fsl_asoc_card_spdif_init(struct device_node *codec_np[],
 	}
 
 	if (priv->dai_link[0].playback_only) {
-		priv->dai_link[1].dpcm_capture = false;
-		priv->dai_link[2].dpcm_capture = false;
+		priv->dai_link[1].playback_only = true;
+		priv->dai_link[2].playback_only = true;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (priv->dai_link[0].capture_only) {
-		priv->dai_link[1].dpcm_playback = false;
-		priv->dai_link[2].dpcm_playback = false;
+		priv->dai_link[1].capture_only = true;
+		priv->dai_link[2].capture_only = true;
 		priv->card.dapm_routes = audio_map_rx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_rx);
 	}
@@ -764,8 +760,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic31xx")) {
 		codec_dai_name[0] = "tlv320dac31xx-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_OUT;
 		priv->cpu_priv.sysclk_dir[RX] = SND_SOC_CLOCK_OUT;
 		priv->card.dapm_routes = audio_map_tx;
@@ -791,15 +787,15 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
 				SND_SOC_DAIFMT_CBC_CFC |
 				SND_SOC_DAIFMT_NB_NF;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8524")) {
 		codec_dai_name[0] = "wm8524-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.slot_width = 32;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 6fbcf33fd0de..dcf770b55c4b 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -264,11 +264,10 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[i].cpus->dai_name = name[1][i];
 
 		priv->dai[i].dynamic = 1;
-		priv->dai[i].dpcm_playback = 1;
-		if (i == num_dai - 1) {
-			priv->dai[i].dpcm_capture = 1;
-			priv->dai[i].dpcm_playback = 0;
-		}
+		if (i == num_dai - 1)
+			priv->dai[i].capture_only  = 1;
+		else
+			priv->dai[i].playback_only = 1;
 		priv->dai[i].ignore_pmdown_time = 1;
 		priv->dai[i].ops = &imx_audmix_fe_ops;
 
@@ -285,11 +284,10 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[num_dai + i].cpus->of_node = audmix_np;
 		priv->dai[num_dai + i].cpus->dai_name = be_name;
 		priv->dai[num_dai + i].no_pcm = 1;
-		priv->dai[num_dai + i].dpcm_playback = 1;
-		if (i == num_dai - 1) {
-			priv->dai[num_dai + i].dpcm_capture  = 1;
-			priv->dai[num_dai + i].dpcm_playback  = 0;
-		}
+		if (i == num_dai - 1)
+			priv->dai[num_dai + i].capture_only  = 1;
+		else
+			priv->dai[num_dai + i].playback_only = 1;
 		priv->dai[num_dai + i].ignore_pmdown_time = 1;
 		priv->dai[num_dai + i].ops = &imx_audmix_be_ops;
 
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 98b37dd2b901..c4647ba912a6 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -814,8 +814,8 @@ static int imx_card_probe(struct platform_device *pdev)
 		}
 		for_each_card_prelinks(&data->card, i, link) {
 			if (link->dynamic == 1 && link_be) {
-				link->dpcm_playback = link_be->dpcm_playback;
-				link->dpcm_capture = link_be->dpcm_capture;
+				link->playback_only = link_be->playback_only;
+				link->capture_only  = link_be->capture_only;
 			}
 		}
 	}
-- 
2.43.0


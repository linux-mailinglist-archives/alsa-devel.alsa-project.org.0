Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 749659AD949
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2024 03:30:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FE0C209;
	Thu, 24 Oct 2024 03:30:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FE0C209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729733424;
	bh=gugHGwmqPl6ue/nPd/SxITSeG/aRAT68mCYUE8F6o6E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=dD4bCcbCC892WwQ77rM18yHf5EwRSeiXUig6FL+qpVixdRN1NIxuWeJYtFajj8jAw
	 pI3bkNIYuTtd4mDP0yHinyxWe7uj/50RSbeq+PeUUZzkEEuagwU4JOl3Smi8rorzzq
	 8dWJOYGtQNTGjximtZHZs0XGujL0nt1WZzaP8x2A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BF60F805DA; Thu, 24 Oct 2024 03:29:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F37EDF8016C;
	Thu, 24 Oct 2024 03:29:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B3BEF805C0; Thu, 24 Oct 2024 03:29:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39B56F80104
	for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2024 03:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39B56F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mtZ6nFd1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uu+J2GR0ruPkgWImzm09jXV5NYfmT3f5y1jDtBRQKpBz7Wr5NGFEhmz1PLzx4Q9pkP/Tbfoq1Ny3mYnZLlIOFYm1zfRfoF6WEdEqq2U/bqcRCekFnxn4zMJ+qkj57ilMbGNzAK8N09OOHFGaEb3lSE42JbUNNcTpLS5p8VM86ZUJ/eHvmFi4tSAQD/u1p/lOn2+sq0PsGiBpIQ7WC7Fz0qByI/T9h323gV5sFSHg0T5kLFdN4ewiTVFbvVyatyBqULxPWh+Y3fuTVbinNVuzFtLwgV2aYEht9313Axn5zV+Z88PpWzI9TAbvY5MbEEbWxB+LE5MAVT7iD/bP640t3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZO2patj9D+11jk/AZukivnim9ku9AwlSWy6u+BsM1cA=;
 b=Ju/PJAA55Odh5c8TydPgpQiaRoRUDS2Jv69VXlqUQgVDeR6jH7Jalm9cNxwE12M6j2WXzfrKZqlWOi021vC0HaoEv/2LmRrUMChqVOKoB+r37ffvDs6hZpIbkx3HOHa92c1MnNv2kLW18wJrwMIrg9jcfcQFNZxj+3ZIN+IHN8z0XSAyMGIAeX5oqxzVkqZuGes0juCcjI4dhPHlN7FkDK2UNOEy6UR2xL2UQVbVK+Czh1ofOpi2zx2PySMIk4vNGURmKA9tLrBvNGIkrqTHKPwuBJv0hXN32vCT9dve6bEWP9WWCWft/+/X7o03Cr1Cgsrfh0BiDmMmgP4qKdoHjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZO2patj9D+11jk/AZukivnim9ku9AwlSWy6u+BsM1cA=;
 b=mtZ6nFd1YDs/5VKqbeTf4qyuRM8REYwTyDyKcIbmt4iYpgKF1rNspjSiOhlJseTg+smDAKDMgEYceNw9Is+KZqh9nsVJjuNThxRfj9lMN+XBIs4KIfVhe7qFKEGmHVlx4PfXMUW/8LbQfa/AxUQGqe7NGDhSlAqLvEaXlrDgH8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB12111.jpnprd01.prod.outlook.com
 (2603:1096:400:43d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 01:29:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 01:29:13 +0000
Message-ID: <87zfmub85z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,
	imx@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com
In-Reply-To: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
References: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/8] ASoC: rename rtd->num to rtd->id
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 24 Oct 2024 01:29:13 +0000
X-ClientProxiedBy: TYCP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB12111:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba6578f-d91e-4d49-0190-08dcf3cb4496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pjSysd2Bivrz1SFwsZpkWRVIUdBhGXRwPUfgPGWQ1tHaHfSKo0tAqqGHITGp?=
 =?us-ascii?Q?99gPiR6BLxR3cv1IP1xRbLuG6acMd+u3Ti0inGNU9gDgbxGtcVzhqzNrm3yA?=
 =?us-ascii?Q?QiBrc4fiCdUOJgm7PzkAFkXC1wJdgNzL4jVMZSNA4aZ8b5ZVZkujhdcwRN6L?=
 =?us-ascii?Q?ofoKVvLia1qHaM2Q9D+Eg5YdtlwtmztAQ5465C5XY8y0m72wldfyKM2MJ9L2?=
 =?us-ascii?Q?NGjtSmyQhvaG0LVIxXFMZ2Lf9G0yCrcTwfH4MlELGMRZjtZ8ujLJZVoAiyf5?=
 =?us-ascii?Q?TdOkV/0CVeb0DqrChsgYwPdxvQsX4OD82g4ojJzEkfx/bbXjArifCK8nR5tY?=
 =?us-ascii?Q?3yKiUY0AW/QCg11Xn47hOA00FxjOj1WbXAfR5DARsgTMKCM6lgZUb1212D4m?=
 =?us-ascii?Q?eeHLiowFRy7tak2ho4NZlFozQa/2Ab4Wfwp6KRvFU3fPIeUDshKN3B719gMp?=
 =?us-ascii?Q?oeIXnKFFkBldkgpDyghI+38O4QGzrolMbjYPgaWu+uXOJnNhExFtokdG5I0o?=
 =?us-ascii?Q?gYsIE35Oe73IgrPE6UAcNX7G19VcOtB72+hZRPLp2CxJWURaG9CNmbzsqa2w?=
 =?us-ascii?Q?EWaHPSaxLV1+zssUE0COgyvM2DS3fdztlwHa6t8nS5WNs84r9M270LluqQ9m?=
 =?us-ascii?Q?T9Cjw4oEdD2+/gom/3yl+2h6TAArmOWQyTwaVACAEaWiyEKLT9IOXT3QIDJN?=
 =?us-ascii?Q?Q+vFoBrv9EULx9u1DgrMjv6YD2gutILeV0J2fUQ4pI+yVbRxzLN4wNVc/jtE?=
 =?us-ascii?Q?D4MvdtK8u30YzbdWrxIpnvcGbrXqhcfhBMzKxs44CJjcIkCubtnnyOl/bt5N?=
 =?us-ascii?Q?MlYZ2eRZ6Ox3AMa0MHG9vBcpiTCHbhFD5PkXVmwx8rNUfopwIoYfw4VY0Irj?=
 =?us-ascii?Q?wg+htCCbJEyp4ilSgOJZGhwlZhCgyvG9exVks2+WwFfsm9waGDqc/n/mE24n?=
 =?us-ascii?Q?AS9MILMuzFHV8O2eREJRk21zk0chcgndH61XMrvlpuwep6rpdN2VIUZIEt27?=
 =?us-ascii?Q?E/I6SvsVr7u4zHcJyZBTwJ94d3cmgcPlJRu3w3jb8wlWRVHNueGJ6RvrZJkl?=
 =?us-ascii?Q?ZNICNPw8+JaBc1qq8hstR7zm5aw/LXn8w5CLQ/F02KDwO7TnwCYvfPn9vuB2?=
 =?us-ascii?Q?uNNZkZzJpm7wME2xuCU+XLpqg0A8l25dyq4msU0+UJgogktjrF2TTOpReKQa?=
 =?us-ascii?Q?voPJO3VZ+Vr5n5/TCsruDaWBIUt7JWYWHlTepth99qABQybwGMnJfkz1G4bm?=
 =?us-ascii?Q?4WAYdRtxz5p3ex2ygfOwPy+2PCjwgWeww2CdbBsJ3nAL0fNY6+AzKTEQ0GN+?=
 =?us-ascii?Q?DKf3LOHTvgkGKjC0SXwxe21WPRLCodiUel4x+q8dPKKpJeahla5f0V0tVBll?=
 =?us-ascii?Q?rImjFPgagyMHTag6c935MeNPWf8v?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7EMXdx0DqimrHyZQFeBXBK03qu3FLJ+FONQy2aAi6UXENs8b+CeldLlM9Mdu?=
 =?us-ascii?Q?x2Cp9VXSf3gDsf50eOwWyC8FuoKGY20JeF18p20twu4MSoa+XUnqTEwThe2u?=
 =?us-ascii?Q?HLw5rlX9OdS7udoNNesk5o9eAyKzb6qmU4dX9e6CE/JVdu3sV39LP78WNcRx?=
 =?us-ascii?Q?D9MltiDj4pylcEEq/e2j9YmaJSviR8Fc0DIVzvOnMhustnlTLI2Fn1lOV2eE?=
 =?us-ascii?Q?ep2j5BcU9wnIlfMNiBWicgD5Y6ViM29TAQpHXUFzoyY5FuS3kdlDNEWbHCps?=
 =?us-ascii?Q?9t5B9tXL3IfcJOQQDmZY2mzEMuugRl14HuQm4HGjgj0+I8Lt2SUXP1I0/1lW?=
 =?us-ascii?Q?/IBSWyDfj1u4vqPYpifLywPiCRioJ+Vg2TS4WwSqSrJ7ELt2RoxdvYoxBevp?=
 =?us-ascii?Q?b2a1QpiOU2wrYk4S7/Eh4L2aslPsjapK7PYulE9jm2Yk74XXZTyZibJvKBRH?=
 =?us-ascii?Q?59zi1zksUg4XgL7YPEWm/x7u/kcOHUDAW/UCrgYHMl/crT2L6kdtdCw9v7YW?=
 =?us-ascii?Q?A9LIiRV44zJWEMG4Evle04Rjzyl4kt596/z1gxgdKBvNfEUrz+RPLQKP9whW?=
 =?us-ascii?Q?g1O24Ctsxsr4nagX3/ika2hFHSLYIL1WxFoFrU2pmNMYJNGR6N3YezmlSq4W?=
 =?us-ascii?Q?Tp9Mk54zYJMEp4SVZQpzHdGE7zj5M0uGUcdGFiq8V6oZ0nXFvfqXbOwgEQIl?=
 =?us-ascii?Q?CkTvZ90SRx45O0Im74Fh3xvxT4QYPnVio+bS/qi5aXHz3+ppepwONytlEpgE?=
 =?us-ascii?Q?rQaeabRThJigIPwNySSkNXVuEfNC3tvP9CPDR0kzU5TObhqtuud6WqpnDolb?=
 =?us-ascii?Q?c27lKrwquMQ/Zz6r0uTpIkCySYitER+G2xTkzutJ/W8M5IyW4uAJmFMXY+/8?=
 =?us-ascii?Q?+ErtxsQzUH+oPoYCGSz9A0lGhN1fmXc67l/qMcvopPCAPs9ISW5id/wiJsiS?=
 =?us-ascii?Q?7CaoGPjJPQWu+98Ko9ZS10C2FwdGUw5FEX9pYxTs6AOCnS9ACCiXmh5l8Jup?=
 =?us-ascii?Q?bNVPVYyiCuEN2vRX9ltje7a480HQJGVJLFPtUY0dUPVz78bPPES9RCHfyL6E?=
 =?us-ascii?Q?M2WEf+rzNgGxrvnEnKW/pqE5NiOicseAGEM+Et8DF1Mku7O5j9mzbj5rLaNQ?=
 =?us-ascii?Q?HsK1Eh7YBYeQp78+rFCRdhqbgL6Z7opg6w+JyAqWiTLH4EM7HKrnFq/9QOiJ?=
 =?us-ascii?Q?5VvOJb9vod7ZOJAtJFG5q+h5z1K6QFSufZ1UEevrcNikpIw/YPYd94yfJ1yU?=
 =?us-ascii?Q?cMPE0DTQCmFdstlpz9cTf9vy74sKk2HewhsdLyit1dPWRY0tKMpQ1JHhJ3SH?=
 =?us-ascii?Q?DSZ4GQoMAPvq8d1C8anG9AQcAN6cZCcnhPN1XWHOH1CM5lpCwuOdNOFbP3en?=
 =?us-ascii?Q?nT2d17qGGhQ6EbE4UD07GSY+C86n2jrqIl8L/F6XSDf2Ic1JqF1y2gXNrG+4?=
 =?us-ascii?Q?2ISgRFxe0L4jwWOh9SJY/9JS8kLs2POl9Z+Q+M8wdvZ/6KLiKkxQkpw8Mqsv?=
 =?us-ascii?Q?mdxMNlp4wQLM+XtTmSeoT6lQAmDwXPQQg1KEPOhctPZ6egeihr3BLrVoN7q9?=
 =?us-ascii?Q?9vVD/Pfn5qzEQ2gETjS/o0NKGm7yh4KINVJQAR9SXVsRsDIvgJuKs3NO4a/q?=
 =?us-ascii?Q?ieWPvLoyWL4C4S9WpGfPVgM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7ba6578f-d91e-4d49-0190-08dcf3cb4496
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 01:29:13.5627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ydVoeSgrSy8k5ECKj1+oL/AnjvP3m75tnKIrYv6IIuhBN8oD2XPttJ5UFDc0+OQqko/nSWYFs8xr2K6wIMmFyIHxHrcqdzEd4/87GlHBB9iNtgXnzCa+Gphe/cbUbV3V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12111
Message-ID-Hash: 4Y4VAU4EIVK3REUJTZI7OJU2CHYIUHJR
X-Message-ID-Hash: 4Y4VAU4EIVK3REUJTZI7OJU2CHYIUHJR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4Y4VAU4EIVK3REUJTZI7OJU2CHYIUHJR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current rtd has "num". It sounds/looks like size of rtd or something,
but it will be mainly used at snd_pcm_new() as "device index".
This naming is confusable. Let's rename it to "id"

Some drivers are using rtd->num, so let's keep it so far, and remove
it if all user was switched.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h  |  4 ++--
 include/sound/soc.h      |  9 +++++----
 sound/soc/soc-compress.c | 10 +++++-----
 sound/soc/soc-core.c     | 15 ++++++++-------
 sound/soc/soc-dai.c      |  4 ++--
 sound/soc/soc-pcm.c      | 16 ++++++++--------
 6 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 0d1b215f24f4f..9dbeedf6da13b 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -217,7 +217,7 @@ void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
 void snd_soc_dai_suspend(struct snd_soc_dai *dai);
 void snd_soc_dai_resume(struct snd_soc_dai *dai);
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
-			     struct snd_soc_pcm_runtime *rtd, int num);
+			     struct snd_soc_pcm_runtime *rtd, int id);
 bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int stream);
 void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action);
@@ -275,7 +275,7 @@ struct snd_soc_dai_ops {
 	int (*probe)(struct snd_soc_dai *dai);
 	int (*remove)(struct snd_soc_dai *dai);
 	/* compress dai */
-	int (*compress_new)(struct snd_soc_pcm_runtime *rtd, int num);
+	int (*compress_new)(struct snd_soc_pcm_runtime *rtd, int id);
 	/* Optional Callback used at pcm creation*/
 	int (*pcm_new)(struct snd_soc_pcm_runtime *rtd,
 		       struct snd_soc_dai *dai);
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 3e72317e2c20f..9acd3fbf7c7e1 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -486,11 +486,11 @@ struct snd_soc_component *snd_soc_lookup_component_nolocked(struct device *dev,
 struct snd_soc_component *snd_soc_lookup_component(struct device *dev,
 						   const char *driver_name);
 
-int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num);
+int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int id);
 #ifdef CONFIG_SND_SOC_COMPRESS
-int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num);
+int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int id);
 #else
-static inline int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
+static inline int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int id)
 {
 	return 0;
 }
@@ -1195,7 +1195,8 @@ struct snd_soc_pcm_runtime {
 	struct dentry *debugfs_dpcm_root;
 #endif
 
-	unsigned int num; /* 0-based and monotonic increasing */
+	unsigned int num; /* REMOVE ME */
+	unsigned int id; /* 0-based and monotonic increasing */
 	struct list_head list; /* rtd list of the soc card */
 
 	/* function mark */
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index a0c55246f424b..fb664c775dda5 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -537,11 +537,11 @@ static struct snd_compr_ops soc_compr_dyn_ops = {
  * snd_soc_new_compress - create a new compress.
  *
  * @rtd: The runtime for which we will create compress
- * @num: the device index number (zero based - shared with normal PCMs)
+ * @id: the device index number (zero based - shared with normal PCMs)
  *
  * Return: 0 for success, else error.
  */
-int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
+int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int id)
 {
 	struct snd_soc_component *component;
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
@@ -617,7 +617,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 		snprintf(new_name, sizeof(new_name), "(%s)",
 			rtd->dai_link->stream_name);
 
-		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, num,
+		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, id,
 				playback, capture, &be_pcm);
 		if (ret < 0) {
 			dev_err(rtd->card->dev,
@@ -638,7 +638,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 		memcpy(compr->ops, &soc_compr_dyn_ops, sizeof(soc_compr_dyn_ops));
 	} else {
 		snprintf(new_name, sizeof(new_name), "%s %s-%d",
-			rtd->dai_link->stream_name, codec_dai->name, num);
+			rtd->dai_link->stream_name, codec_dai->name, id);
 
 		memcpy(compr->ops, &soc_compr_ops, sizeof(soc_compr_ops));
 	}
@@ -652,7 +652,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 		break;
 	}
 
-	ret = snd_compress_new(rtd->card->snd_card, num, direction,
+	ret = snd_compress_new(rtd->card->snd_card, id, direction,
 				new_name, compr);
 	if (ret < 0) {
 		component = snd_soc_rtd_to_codec(rtd, 0)->component;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f04b671ce33ea..3cb7482791669 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -558,7 +558,8 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	 */
 	rtd->card	= card;
 	rtd->dai_link	= dai_link;
-	rtd->num	= card->num_rtd++;
+	rtd->id		= card->num_rtd++;
+	rtd->num	= rtd->id;			/* REMOVE ME */
 	rtd->pmdown_time = pmdown_time;			/* default power off timeout */
 
 	/* see for_each_card_rtds */
@@ -1458,7 +1459,7 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_component *component;
-	int ret, num, i;
+	int ret, id, i;
 
 	/* do machine specific initialization */
 	ret = snd_soc_link_init(rtd);
@@ -1473,7 +1474,7 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 	/* add DPCM sysfs entries */
 	soc_dpcm_debugfs_add(rtd);
 
-	num = rtd->num;
+	id = rtd->id;
 
 	/*
 	 * most drivers will register their PCMs using DAI link ordering but
@@ -1485,18 +1486,18 @@ static int soc_init_pcm_runtime(struct snd_soc_card *card,
 			continue;
 
 		if (rtd->dai_link->no_pcm)
-			num += component->driver->be_pcm_base;
+			id += component->driver->be_pcm_base;
 		else
-			num = rtd->dai_link->id;
+			id = rtd->dai_link->id;
 	}
 
 	/* create compress_device if possible */
-	ret = snd_soc_dai_compress_new(cpu_dai, rtd, num);
+	ret = snd_soc_dai_compress_new(cpu_dai, rtd, id);
 	if (ret != -ENOTSUPP)
 		goto err;
 
 	/* create the pcm */
-	ret = soc_new_pcm(rtd, num);
+	ret = soc_new_pcm(rtd, id);
 	if (ret < 0) {
 		dev_err(card->dev, "ASoC: can't create pcm %s :%d\n",
 			dai_link->stream_name, ret);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 4a1c85ad5a8d6..2feb76bf57bb7 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -457,12 +457,12 @@ void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
 }
 
 int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
-			     struct snd_soc_pcm_runtime *rtd, int num)
+			     struct snd_soc_pcm_runtime *rtd, int id)
 {
 	int ret = -ENOTSUPP;
 	if (dai->driver->ops &&
 	    dai->driver->ops->compress_new)
-		ret = dai->driver->ops->compress_new(rtd, num);
+		ret = dai->driver->ops->compress_new(rtd, id);
 	return soc_dai_ret(dai, ret);
 }
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 678400e76e53b..81b63e547a099 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2891,7 +2891,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 
 static int soc_create_pcm(struct snd_pcm **pcm,
 			  struct snd_soc_pcm_runtime *rtd,
-			  int playback, int capture, int num)
+			  int playback, int capture, int id)
 {
 	char new_name[64];
 	int ret;
@@ -2901,13 +2901,13 @@ static int soc_create_pcm(struct snd_pcm **pcm,
 		snprintf(new_name, sizeof(new_name), "codec2codec(%s)",
 			 rtd->dai_link->stream_name);
 
-		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, num,
+		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, id,
 					   playback, capture, pcm);
 	} else if (rtd->dai_link->no_pcm) {
 		snprintf(new_name, sizeof(new_name), "(%s)",
 			rtd->dai_link->stream_name);
 
-		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, num,
+		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, id,
 				playback, capture, pcm);
 	} else {
 		if (rtd->dai_link->dynamic)
@@ -2916,9 +2916,9 @@ static int soc_create_pcm(struct snd_pcm **pcm,
 		else
 			snprintf(new_name, sizeof(new_name), "%s %s-%d",
 				rtd->dai_link->stream_name,
-				soc_codec_dai_name(rtd), num);
+				soc_codec_dai_name(rtd), id);
 
-		ret = snd_pcm_new(rtd->card->snd_card, new_name, num, playback,
+		ret = snd_pcm_new(rtd->card->snd_card, new_name, id, playback,
 			capture, pcm);
 	}
 	if (ret < 0) {
@@ -2926,13 +2926,13 @@ static int soc_create_pcm(struct snd_pcm **pcm,
 			new_name, rtd->dai_link->name, ret);
 		return ret;
 	}
-	dev_dbg(rtd->card->dev, "ASoC: registered pcm #%d %s\n",num, new_name);
+	dev_dbg(rtd->card->dev, "ASoC: registered pcm #%d %s\n", id, new_name);
 
 	return 0;
 }
 
 /* create a new pcm */
-int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
+int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int id)
 {
 	struct snd_soc_component *component;
 	struct snd_pcm *pcm;
@@ -2943,7 +2943,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	if (ret < 0)
 		return ret;
 
-	ret = soc_create_pcm(&pcm, rtd, playback, capture, num);
+	ret = soc_create_pcm(&pcm, rtd, playback, capture, id);
 	if (ret < 0)
 		return ret;
 
-- 
2.43.0


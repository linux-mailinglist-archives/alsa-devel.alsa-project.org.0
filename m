Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2299E8C7A
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2024 08:43:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42A9914DE;
	Mon,  9 Dec 2024 08:43:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42A9914DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733730208;
	bh=3VSL5LZqOSP17aVl/woDFDsIDZMHGL3bZB0FwU0A7qM=;
	h=To:From:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JK5zQdMCT/Mu728EE1LyqieEXyVdwB8TdzEnTMe9PI7CjEtsSMBJvBmmo3+Mx/gdd
	 nJxu9NvJfTWyqwCgIuVbKK5F3fR4y8o8OIJHG9RDND15lAU2wE/4IPDpHaob+pNeOY
	 gjb6i9HECNMCe11z5FnVoVXWH+PUQMPXNLsLFydc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96195F8061F; Mon,  9 Dec 2024 08:41:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EB6DF805BB;
	Mon,  9 Dec 2024 08:41:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C17D4F8063D; Mon,  9 Dec 2024 08:40:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010049.outbound.protection.outlook.com [52.101.229.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A5F5F80624
	for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2024 08:40:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A5F5F80624
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=m7wF2+DD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhlbLERguAdZb4ijYSxzES7n4JvydxQ25YFKMwIM40ivPEFTEM/gDrhGEgkX3tRMvsX3hBZn5IS1z1Rd+R15YWFH9Ujx1EJ2G+2DZUfaFeuvFKjoAOLtzrUpiBT5Z9dVCCKUYfvJQKcwj0kDPZtJweccghd9YdHxSYDdBFKOkid9pBUsd4IS9rjn1uiKqs8An2usucBdLwa+hFxvVlGDkAbvhQHv9dFa+4LrQlW95UM9zhyPerBxzw8h+eVCWiAxv0U0c9+NNoVhBj7wjHUZxc5D+/MdzouBfpLCOZQTZX5KOPNep8EkdYHnUzMCR3TrofF9qkiLq5vtb9+0taU6bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1v3YIawXfoT/0g9OYwreHf5nPqkslv8vQL1QrNXrjI=;
 b=DU63nfcWEdAmRw9uME3pcBFsp5BZwf6tCN8NVNa1zX2ejyWeduRTJtBcBXS2zuk5hteqso4szveXYg8Q60/wyQJq9c982gegG80l1ivuDX06qOQV41AT+v1EWOoX+IKpbLksMxG/UQJO7qVDtZshnu/ZBTi6xO6y15YvcFtlfchDpuLCoYezG9RsaX4tMgQjl+/hjSid73zkZbPq67x0NjpWVroj0X/8kbOdYXOLetWg2zASDKcvvHxFBrEgUvunnqSb5KeYGPoZlTJ8Xxdy5164SfezO8XybYrFo8hRQ9HhqIZUDd1eZazTKDvppJVn+O868b/q1YJfqJvoYnFGbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1v3YIawXfoT/0g9OYwreHf5nPqkslv8vQL1QrNXrjI=;
 b=m7wF2+DDD0Hy6eDYstMHKPWW/fwrqA+UOQOlWaTY5rVB5Usmrqs9yBCtkXU9aBYwPfUxT9RSDeCJWV4EM5Tp563rVmkPP/Qxy6CiBsoyK/bK/dQUqrDW1jtXjE/tkXWuYmefnPSzkM+3uFmgbNCBInPFF+S8sQksw+QBl8ndXD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12968.jpnprd01.prod.outlook.com
 (2603:1096:604:32e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:40:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:40:30 +0000
Message-ID: <87frmxmhhu.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?= <u.kleine-koenig@baylibre.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Daniel Mack
 <daniel@zonque.org>, David Rhodes <david.rhodes@cirrus.com>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Lars-Peter
 Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/17] ASoC: codecs: adau1977: remove
 snd_soc_dai_set_tristate()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Dec 2024 07:40:29 +0000
X-ClientProxiedBy: TYCPR01CA0185.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12968:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cb49b0d-516f-4edf-35c9-08dd1824c162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XtGM05cEa+ibX0W0R6ImHXHdUtmzi4ZLIFhXltOyrA1pZ3iRcJJPiER87z/l?=
 =?us-ascii?Q?8buJAxuruFkh5fYLjyd33g+oLQOkW2ucXRYkFc0DLzlZWPKQTRoWCythK0Fk?=
 =?us-ascii?Q?PWf2GjDa1FX4pI2kAIMN+u0G3nSJyZBwGpRtQRU1iaTDbEJklMlw+NU2CuK6?=
 =?us-ascii?Q?v32GrCoamglJuCdMTyB3R4q9VbeAZ+cx/sYIUnRn/iDaY1AZbOD2xrMQxmwJ?=
 =?us-ascii?Q?l+j12ws4JrW75WdbUsJbHj+H0fH51fEuXI1pNREdipWGzgBM4BdHA7QCudxd?=
 =?us-ascii?Q?FwxL00V65KhqfxkOvRau++206bD2n6qXAofa0mfsDn6wylpyxQAEQ2sM+HY6?=
 =?us-ascii?Q?2yrKfFKCBY3hC9HpwliTWl+w8BIxg1vu+lkSoeh99uwSrEYAb7JrL5B5cDXo?=
 =?us-ascii?Q?2d8GSrmYSvvpeXAaIIDvNhPG/m2AdATCALgfzfH/7E9XBhgxXGndQYVOvlRQ?=
 =?us-ascii?Q?MUaCmd8POMDJ+VJ+/aTMtoKeZ885NwHebCMDhQSincfbX9gkh6pNFCgAo9N7?=
 =?us-ascii?Q?SIZMHZtLx0axM/L5c5V7HiKwV+/MfLZ+zOTvmbnDPz4+gPTSsa68J/9aRAEE?=
 =?us-ascii?Q?CVNq64QnOHiZQgMJ3oIS9l2ECgRUGZFi5qZEq4Wo2Z5CmIIS26QsQv7qALDf?=
 =?us-ascii?Q?xWfqvg2GZE073rLL5ncMnjN487ZHLevGeF2XMID9eKRjfPvgjuZ859C2mGSo?=
 =?us-ascii?Q?nGPPsbP777L1mihzEtY/gmnA5OcmqIy9JGJfbhXk4B9GFi4fX0G1x+xVKHTP?=
 =?us-ascii?Q?G9eW8EU7fNV919fT3G7JsX3csaEOcndA6pOP2Zcwf4IVYPDRA/+AjT4CZeEm?=
 =?us-ascii?Q?KE3BJGw2e/krKKZ1DvLdn1yVEcgnwfOrrW3v+i75GO/GZRXa9q2411w80Fbw?=
 =?us-ascii?Q?cgwW/9uAutkMJUstTBULKpBzGdzfQrNpWTp+IEiANu/g72pfvDYCwyAzAedG?=
 =?us-ascii?Q?1PXVRntXSaJMoWT9Tn2d+CqUjB6UpUPi76eR3u0Q4nipTL2CSYDV+5A1B412?=
 =?us-ascii?Q?zuxtSnw/jD9kvslXzTElyK/Bayne7upmMBb/GT6Y4i8aqC/q4bD68saYdnsy?=
 =?us-ascii?Q?lEnYoS7zzf/m9gwLI1LGDeRqlAAEQRaD8BGftQ2DqNriktUBVPzpYcfxALJW?=
 =?us-ascii?Q?mnQOEN6kYYM2wfOjnzmV/fIR2ISsOpTsnVdj4vWdyxIBXqQYPOf/In9aOY2P?=
 =?us-ascii?Q?w/cuaRNhvVYBh2tL0ighEAN7Mo7XZp+Xtgg9qbdfyinyXXdRTIO8Xxzo7Ob+?=
 =?us-ascii?Q?lmmXHtCbkrP1Ppia9fJ7UYECBhbdUKsvdqi+1zPY7Ae61Nfn0ArdHr2SxJut?=
 =?us-ascii?Q?i1zGUFxeI5VnaMyWX4CQ69EQ5ijVRcB6EpqUJ1z6c8LKG++7Kxl8YEBbNMKs?=
 =?us-ascii?Q?uaT3wbYwx2Vlit6sXHugh23ECQ5DMoQ9vxS1l6RToOMRzi2fZWxIEsLlsPUj?=
 =?us-ascii?Q?qoVIW289s5LDHYIGN/rbCJxYwpco0HVG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fB/6yFnjmMK96A6faPiOImFJEiP3aNj0dLD+JQE1S1PEarpMIBUP83HIvU7N?=
 =?us-ascii?Q?m2Fg7Y6+iQ1bMywQMu9MMdRDgPxaGXslIxhPfJotD5Qoc1gSDc/OPdnes1d5?=
 =?us-ascii?Q?WTXz4p00JgDLnsNczD9gN/lZnQEyfUU+HUvAi8kIJ5f2AAuiPl/kSZqfD/Im?=
 =?us-ascii?Q?IrJxRldhGwQWdjSFNLeKan4v9UqKDkGuOXyzwiyXRKNtW/wtzV1yB82W3Owl?=
 =?us-ascii?Q?8ZeBZsJoJJZ6VobThS43stbX2MPXxrvNh8MfY25lb9+8fLQvkwhW912oYOEk?=
 =?us-ascii?Q?y5saeWOYXqyHEzHMAzGqx7TRh6X/EgyKoWSdIETgbHDUToOIkAXu1l2oV+es?=
 =?us-ascii?Q?4Wcda46u6iHSPKiSjnYRNiTy6AnkU8SlDMOpEtOrgCSdP+bpRo3POqLs5GU+?=
 =?us-ascii?Q?Erxyx2qAu3z+Nf8YOdiU47uITWbPEHrX/zbHDwg0BaYSqqrbf7tv7MGQ3rMs?=
 =?us-ascii?Q?9tMJ74ICdz1MypNHzWXqRqwhnNWca9J0lvPPmFpdu8c2ucBbh4r/Ygid4Cod?=
 =?us-ascii?Q?EcDOo7XtXLgLvNN5qpzUjvJe87RdOTaop3ZVoo/aSsdGrPYLX0YtcQO6S3nZ?=
 =?us-ascii?Q?4fXfKao4t/q4RUe50gDks84ohvyIBD1bwVIVaJZd30x2w7pIOGMyp9HBFeR/?=
 =?us-ascii?Q?GDPCu3bYRwHyWyh9Brh2GIVPJYjnXpGMOGz1++m0wugSy783y/MY2+jIz7Ng?=
 =?us-ascii?Q?cJsW350s2rJFu3eNKOCqo3vR9KS8aHDfoLqMaulWbG2pFnErcQKMJ5xlfXi7?=
 =?us-ascii?Q?Ta+BsTaQ7lWd9yTHWT2f9Pa/6Rx0uMSeXMITZSFGjjBG1YnogY2Y9cgwi+Wj?=
 =?us-ascii?Q?qJFTSQkPdKeVI65y/z6EiEE3XpWhVI+BicDf3fuhCa9LoYdLJZ1Y8/YJF158?=
 =?us-ascii?Q?t7AgDA63Da8qTs3ua50faBpJLhkpx3h3nGncunOVIcW9lduHUmZzmPoNJ4hn?=
 =?us-ascii?Q?35jVmpqTsDCaNoX6Kv/1afwwDBsW6jBM6Gq8W8GWegZnkEUTMhBndOLUJVhr?=
 =?us-ascii?Q?pWRGlR/TnA9i/KswZDfnY4iTbIc+PEu48WN74WpxMZnmo7tMZpmD+72Q259v?=
 =?us-ascii?Q?f2GUb4Lqzq0PB3Yab81mINkIGLR+YP/nZThlgFVTZFMkciMdo4TcDdn/ciT1?=
 =?us-ascii?Q?K+EIE50pJmi4ko46XOHy1R1BJxOAFTVuo35YPsF0Q6kjcgonQcTZHL55W4jL?=
 =?us-ascii?Q?oj65ShcmpUGblr20HoYHmwhEvyyfj5O77p1aaKlPAgQ9EPxlITsbcVY19Nn5?=
 =?us-ascii?Q?ltqMbvd2PjnsOnisHYA3sTsiejcRpOz4mJsGVzBBpF4rvPP8Aii4TnycJv+N?=
 =?us-ascii?Q?Wlgi5dSe0kdVy0wC31m0kGjHo4poMJTYhqy78qevvsUsFe+st7ISljCpw2Dj?=
 =?us-ascii?Q?dPGi9udPGVK0FAwucbETCTEo+fQi9xWgLbTqWKfNDP+rBuXR4cd9a+2G531L?=
 =?us-ascii?Q?JzG4MHTqIdbwVYhIXFn27Ig7lnVhuGPFed4jjDV0mpohq7aprBtwk/SaQVrV?=
 =?us-ascii?Q?O7fjJPfqA8DxwYSt4vewteQ5pW/+zVglLa3ao8j0x8O5u0XSxbAtjF50S9NI?=
 =?us-ascii?Q?hE4l2wlZ09v81PtH7W+Uiu1DV6l6vnn/whK431DwQYX0XVw3ob0tkuTI3X1X?=
 =?us-ascii?Q?Je+mqtoyZ0FDKyKEW/TQjsQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9cb49b0d-516f-4edf-35c9-08dd1824c162
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:40:29.9859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fSR5n6UUOIF9p76wfjMRTrf/i7Ebdmd2OMfD2FyeU3Uoz1Orz8ukl61njx98RWlv+F8jBFEAcO87MyeFMfOHw8dTaIO8c+qCZAIXiSjaKxtl5lVLE356WYbTmT+gQOXf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12968
Message-ID-Hash: BBVCKNVKR553KRZNOVYGJS4DTU3Y7RLQ
X-Message-ID-Hash: BBVCKNVKR553KRZNOVYGJS4DTU3Y7RLQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BBVCKNVKR553KRZNOVYGJS4DTU3Y7RLQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_soc_dai_set_tristate() has never been used before.
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/adau1977.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/sound/soc/codecs/adau1977.c b/sound/soc/codecs/adau1977.c
index ae59efb38f265..9e57fdc0f7ec6 100644
--- a/sound/soc/codecs/adau1977.c
+++ b/sound/soc/codecs/adau1977.c
@@ -726,27 +726,12 @@ static int adau1977_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int adau1977_set_tristate(struct snd_soc_dai *dai, int tristate)
-{
-	struct adau1977 *adau1977 = snd_soc_component_get_drvdata(dai->component);
-	unsigned int val;
-
-	if (tristate)
-		val = ADAU1977_SAI_OVERTEMP_DRV_HIZ;
-	else
-		val = 0;
-
-	return regmap_update_bits(adau1977->regmap, ADAU1977_REG_SAI_OVERTEMP,
-		ADAU1977_SAI_OVERTEMP_DRV_HIZ, val);
-}
-
 static const struct snd_soc_dai_ops adau1977_dai_ops = {
 	.startup	= adau1977_startup,
 	.hw_params	= adau1977_hw_params,
 	.mute_stream	= adau1977_mute,
 	.set_fmt	= adau1977_set_dai_fmt,
 	.set_tdm_slot	= adau1977_set_tdm_slot,
-	.set_tristate	= adau1977_set_tristate,
 };
 
 static struct snd_soc_dai_driver adau1977_dai = {
-- 
2.43.0


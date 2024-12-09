Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F7C9E8C45
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2024 08:40:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59D6F83E;
	Mon,  9 Dec 2024 08:39:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59D6F83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733730000;
	bh=8Z3scmyUHLig35NG9LkQx3fAQlO6NNH3Pq8m3jxk+uY=;
	h=To:From:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BOoKuM/tEVvy7sv7CHP5C1m+baXK1FNwvFklGGvxhFoO8xXn5Xeyqsr/lQ5opi9cp
	 7EPVjnAdFqIFRTLrElwVHMddgsvFRnavXjpFV2qS4pbT6D9jBOElxRRvlohMyiyG4u
	 PJNxw3k+sdTWIQWPUr5/Ml5qjDNMx60pIGw4X1tw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B746F805BF; Mon,  9 Dec 2024 08:39:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC99FF80448;
	Mon,  9 Dec 2024 08:39:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7328EF80482; Mon,  9 Dec 2024 08:39:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67DC8F80087
	for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2024 08:39:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67DC8F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=DzANj0AM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/VpLFPVWUvyOWyuBmt1NjElBHPVLo61MSsc9doO8V4vOin3yJF6k3q51zlcY8SXy9LL9CDP4pBuOF4xZxUGy33RQB1boaSjhy81sJa/m+AYtPx133lQS4XvgZSMNtvhRQHoy+GgKDEQoxQ8QsgckxGbQFPWp4p/QJiqZGwEGPF905aljDQnSgXsa4s3JuoyLJglGEaHjoMkDTESLBw37r0OVa7+3C5s5vgbBERgX+SDH0uimHAbpV7AoEDhEYsPfYmsP2sg/seibKcGKIe6mRZkUYjjW0ttjn3ujWitegrtIMRUzsFF1TJx6mH0CozdJtItuMnengr6gcfFIenGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Eql2/iF0mRFTXb+LAr/NG/fqvbwc/Ehp2048ShWWKM=;
 b=aTmU3Zt3R2DEWh7GmJTB1ipzAqq+1nSfUmwy/MLplZkXZmBIIeIvZ9+RmhanPZRtzRo14lybwn8UuFK6gr5DUoFT+WfHNqIRZxyHIJTGl4zROGAzeAqIxoQCnKXqICGzEZue7QAHdBNOkiEwjNZtWI0fn37zURyLg7BQt76uHAIT+zrNUZcN3iI+1C/P1y5VKj3VLB4NO5bQBlUdLpPVMs5I9bJAbNGlUysEoe1NO5CMrr6Jugnonc7wHw3Ivy5+gHNfkHwQOeQJ7knlmyCzTNSfinAGbtJMAwsFL9e1GuFWe0uqx+vfvQD+1Pj3X0/OBc1tkOU+xfezF/XvI2T86w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Eql2/iF0mRFTXb+LAr/NG/fqvbwc/Ehp2048ShWWKM=;
 b=DzANj0AM4GCW5+IuaTn/UtY9fYiykca1rAqtKiwIiydFF0hooz+CUhOBIg3f7LW7kCbearBPq4MdV8cV4m0/h28590WJiF9+93M7jfGY9180I2ONhKC/yEEDzpchDmatIki0qKUMi4hPf2EBw9kJt4002XKrKbKTRCRS8nvOOCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12968.jpnprd01.prod.outlook.com
 (2603:1096:604:32e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:38:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:38:52 +0000
Message-ID: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 00/17] ASoC: remove snd_soc_dai_set_tristate()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Dec 2024 07:38:52 +0000
X-ClientProxiedBy: TYCP286CA0236.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12968:EE_
X-MS-Office365-Filtering-Correlation-Id: eed37c17-8fc2-4e9e-6e0b-08dd18248729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XfWQq20IF3N7XiJdLqrVriX5pLCRafSaRWcVDz0F8hIii0BnUoqTwY7giM46?=
 =?us-ascii?Q?T6HnoGUBMqPTCmEZNxJCkn85RGktNE09ABknRpLIEhU/QlQV8yrZ/rR9KLt+?=
 =?us-ascii?Q?cG6WfeGAq6Mas1F7uO6efrnwjPGzGDSfsDkJUhPQv1Nogkw3vZueWDApfzKH?=
 =?us-ascii?Q?J7TT2AIbn7k2WDfIXKTYReuOa3cowmf/KfeYnejvT5LSJFjKr2ZJs32L7jB3?=
 =?us-ascii?Q?0Y302yKl0T/Fczc2/VnlA2HhVoZvYkXAOupMzEs3taI4pmi4iOAPvzXE6Gqe?=
 =?us-ascii?Q?gIesbqqINRaRUxZskmPyfutYDoaeyfZTn9ny9FpeI3/OttZIBjRoy07qDia+?=
 =?us-ascii?Q?wJvcCez6Qm3bJblSV4GwuVpCmVRldYsejtAQ6LdSCYEAvCOI1jmG2MSujA+y?=
 =?us-ascii?Q?LYdn1ddNINnX/VCVHqboH5jNzBAY4ItpZStRJ57Sifg2uUd95dATGRSLLhHZ?=
 =?us-ascii?Q?LD9rqwkQzEkXPQsThmyNkcpoYnS45e5CDgzhMmwv5R7zWl94hiuQkDNL5pxQ?=
 =?us-ascii?Q?rlPfDa+uiO1t86idYZqRlZORoI6r1lvCVSmKAX79tUCNDNiixAFoPe/O0QKD?=
 =?us-ascii?Q?WLFFHmSUjI4ZlAzVgYGlq6CoXiAt/34UVolnV0AP92O3q7Ce+ndHcGz8IbBc?=
 =?us-ascii?Q?g4ioPqpv+EIxFxRivl93o+a0fxboZQHsMwKKZlmf1bF3krhah0N8a7zcPSok?=
 =?us-ascii?Q?6fArGT89UPARPLCMpslZfH8VUpBVcwZtjMS/S+Jq05DKfl78ET0jVltbmV1N?=
 =?us-ascii?Q?mimV0DDun7lU83M1zM0hNDGknl1H+0xW4A6ZqcSu9C5ouELVPj15rdIhqwqN?=
 =?us-ascii?Q?VZwI1hw3hGk6OMpA4CvGMECaTxjqjQPf9VqolhTdxJSlO6BkN2Sam1Io8LCu?=
 =?us-ascii?Q?JSQaTVRwp6ZG1PSK70pEMjd5RSjTB0ZpnZl24ZvdgLnE0b2uuRDUJLzDTZYc?=
 =?us-ascii?Q?LXq8y8C+lL92Vc62ucA8b9++i+Tx4VdqU7Y/DR9MKLIDl2euJQr3T1cwA4lc?=
 =?us-ascii?Q?qc76Tn4bFrkQ1TiFPHleTLXPx6U5LbnNKPsyFYDBmwpSNrYoJ80g69MnYLYQ?=
 =?us-ascii?Q?Pb5KV2tKHXPRUgbvd0eLuEU1gDe2m/bTHNXWQP6oD41h0BcRBLMH4WM47OH0?=
 =?us-ascii?Q?7ks8pPtKY7Z3R/Vj9lU1e7RXUH3ENIticnbg/sD+NbypIviUNmAxfdUiyZXt?=
 =?us-ascii?Q?rax6q9wnMNqyHbtfRmvKNeAMzwArLS1mXO01qUW2oEWYt9xropBXXzzx0VDB?=
 =?us-ascii?Q?xPQBKQBBgwrmT6dP95prnc7auOPYGeQrVK3oD44UZ7+Y3gE8MA2JeO4lhc7a?=
 =?us-ascii?Q?vhtZ0kM1lwu5w5pLjVGKaWEptpJkYRMU1Mi7KHc/DFubLp2XYmTv51JoeYFx?=
 =?us-ascii?Q?BsuYKfKwgQcO4QsKAd8D6oCFlfjm4rqIr1Ye6H3qiVxYOapupWb/gmFtCKL1?=
 =?us-ascii?Q?Q/HnP/m4WdnXGs1PxBYDeDxeuGW10fkDGzPM0rybL06mV1rj2wZTuw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2MkscxYi/SVp2b4xhgFK0wXh0FBRrOjVLb9pCbXpX0k9Nz7aKs1bf/UE7PCt?=
 =?us-ascii?Q?f11XgB0dWDdx9sozPuHtHuj6OUDATNxc+AM8sZaBpp5/cuDxwnGSYfPqMT2K?=
 =?us-ascii?Q?5hyC1TOSRUQzraFREA7J9ak4UDSrgnaR6i0ET4/G3SrqnRZc0f1ygsFHw7aL?=
 =?us-ascii?Q?4WHmueBCdmaHLuZnVaq05uGDybtQNhHcerOpnUc4tf6c7ymMr5h1Gy7gou7r?=
 =?us-ascii?Q?Q/k4SDXCZkhYMlcOfs+KNRB/UXHV8bRSpMo9ed5phTAado5MPZI6YZTlr4NQ?=
 =?us-ascii?Q?sff033UKWyuHaPGiADcCCn7NmyWndGIWwFUyH2HVov4h1W7qYznCYYP149cJ?=
 =?us-ascii?Q?2tbHy3fjlZQ0uDgQ6HvMtL/Amt+b2TVViKUYDI144a7sNg4d1DNFouqodXj9?=
 =?us-ascii?Q?MynOzPWRMu9BylErCxRBVpANKTTGHD4C6TwBRMtWWeh4wAs/sZQW4Q9f+6dF?=
 =?us-ascii?Q?ix94RCH+QX7vnHnUwYX44jTWl056W+ys4sEHFhRnMMmha8TMtqLVlf8KAl74?=
 =?us-ascii?Q?qH/cvDQ8QiNNzjotTZ2ZyG3DTsSFY/6B1higB+0n1bhyrYhG05IRbjkHdHPe?=
 =?us-ascii?Q?IMwPnzSPuodO9mGFh9n5rrbB0+JdsE+FYnCH4lnyXn+4eMyGPi6EIwaf0gOY?=
 =?us-ascii?Q?O6jAVdGCsuYYdvZZHhyqRO4+h3UIZgoGDDK1v4aJiGxKRjbsHKPjsEjB1IqU?=
 =?us-ascii?Q?/BagWbdmtaJoHic0Rs7EZE1W/Lx5jypX0K9MywHnoZ3C7KI1d0k6R8mN5x69?=
 =?us-ascii?Q?6+qhE5hMuSN7UIKiHW2md2veaOodxgb4Uszt9CE8A3dgj3Bz99qaBh3a3iAq?=
 =?us-ascii?Q?3JDoKe4Z0hizOVkJfb0SomIBSGHJSkUp7aHU4gNH171uvfVC7FZfkHBkY37O?=
 =?us-ascii?Q?gD0P0cN4Y8nUuaf823Aq/UxLqF18Y9IzYOzdAcMJ8eFfg8UH0wLsEQR7Hdhl?=
 =?us-ascii?Q?MJpk6emQ6RtDQp5mbTaOJN56fU7WmKufCqXtbj3z+6PKFYeQXrPIcDghuiP0?=
 =?us-ascii?Q?KdhkUKmDsF4icZDiidsqMeSTI0zvY37vE0J95T7O+JqiVthvcHzTpWSZKkkS?=
 =?us-ascii?Q?LyjH7l4FuJkR08wbDlQDvsoWvpB1ndxHSW/JursOVXPek1zT2JARAJkWZNVx?=
 =?us-ascii?Q?vWVWHNg0a/u0JKZiWmzTd9OZB08dnvluFi9UZ4nHJWRpFtkJg3Ee0f/RTrR0?=
 =?us-ascii?Q?PDyUiKBDMWnk1q8b38SZXuNYWmhnIohID/eD6mDQX5Q7T5qy7lvhWEQyqqS9?=
 =?us-ascii?Q?0oxdi0IaE+eXef8ypIoqs3v769fufqyXt4GeLDbBj0mKvBy1XFOaMpkgGVmN?=
 =?us-ascii?Q?Ju6HCb5sJmcFGpJ51Uf4oW1lcPOxWXgK14dbUUmChwCVkcRU/dWnc6TgZ6Yc?=
 =?us-ascii?Q?jaC+UOm8YVR3uaIEgmOPs60T7wNxguje1sle63bxJOuvfuSiUA/pvcr0q54J?=
 =?us-ascii?Q?PxoJ+Hnnn2Njl1HTRI+Hw2A9Vitz1EsDiY3QFy550O8FeItvguQz2vEz+pu2?=
 =?us-ascii?Q?SVZTgVOtCdA0IbhFK8hxnTTdODdc6WusFk8W8dlG/rfDLyRUCqGEj0SOIlYR?=
 =?us-ascii?Q?ptQTcih4LoKsJEUtJwhU1sttCX13uNRV7l51hGrH2k9uHJbexzKHXoERrTgg?=
 =?us-ascii?Q?aRoF6/0O8doCeJREyDfcLog=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eed37c17-8fc2-4e9e-6e0b-08dd18248729
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:38:52.3492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xSgVqbf2a51sSUJ9/JoM1Vh18MWZYh5L64FH6EqtXT2updkAc7Zz/P/hzYTXdcP7StXkTGhZ2zoOBQfwAhwr89jDwDGGPQ5iJeT7R7FfUEStsHpn3yNoaRfQ+IGFmCr9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12968
Message-ID-Hash: CW34LUNVRGQCGRL2XBEMQYEUUUCMEVBJ
X-Message-ID-Hash: CW34LUNVRGQCGRL2XBEMQYEUUUCMEVBJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CW34LUNVRGQCGRL2XBEMQYEUUUCMEVBJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark

snd_soc_dai_set_tristate() has added in v2.6.27 (2008/Oct) by this commit

	8c6529dbf881303920a415c2d14a500218661949
	("ALSA: asoc: core - add Digital Audio Interface (DAI) control functions.")

But it has never been used during this 16 years.
Let's remove it.

Kuninori Morimoto (17):
  ASoC: pxa: remove snd_soc_dai_set_tristate()
  ASoC: codecs: cs35l32: remove snd_soc_dai_set_tristate()
  ASoC: codecs: cs35l33: remove snd_soc_dai_set_tristate()
  ASoC: codecs: cs35l34: remove snd_soc_dai_set_tristate()
  ASoC: codecs: cs42l73: remove snd_soc_dai_set_tristate()
  ASoC: codecs: cs53l30: remove snd_soc_dai_set_tristate()
  ASoC: codecs: wm8961: remove snd_soc_dai_set_tristate()
  ASoC: codecs: wm8994: remove snd_soc_dai_set_tristate()
  ASoC: codecs: wm8995: remove snd_soc_dai_set_tristate()
  ASoC: codecs: wm9713: remove snd_soc_dai_set_tristate()
  ASoC: codecs: adau1372: remove snd_soc_dai_set_tristate()
  ASoC: codecs: adau1977: remove snd_soc_dai_set_tristate()
  ASoC: codecs: adau7118: remove snd_soc_dai_set_tristate()
  ASoC: codecs: madera: remove snd_soc_dai_set_tristate()
  ASoC: codecs: arizona: remove snd_soc_dai_set_tristate()
  ASoC: codecs: twl4030: remove snd_soc_dai_set_tristate()
  ASoC: remove snd_soc_dai_set_tristate()

 include/sound/soc-dai.h     |  3 ---
 sound/soc/codecs/adau1372.c | 14 --------------
 sound/soc/codecs/adau1977.c | 15 ---------------
 sound/soc/codecs/adau7118.c | 19 -------------------
 sound/soc/codecs/arizona.c  | 17 -----------------
 sound/soc/codecs/cs35l32.c  |  9 ---------
 sound/soc/codecs/cs35l33.c  | 21 ---------------------
 sound/soc/codecs/cs35l34.c  | 15 ---------------
 sound/soc/codecs/cs42l73.c  | 10 ----------
 sound/soc/codecs/cs53l30.c  | 10 ----------
 sound/soc/codecs/madera.c   | 22 ----------------------
 sound/soc/codecs/twl4030.c  | 28 ----------------------------
 sound/soc/codecs/wm8961.c   | 14 --------------
 sound/soc/codecs/wm8994.c   | 28 ----------------------------
 sound/soc/codecs/wm8995.c   | 33 ---------------------------------
 sound/soc/codecs/wm9713.c   | 17 -----------------
 sound/soc/pxa/pxa-ssp.c     | 21 ---------------------
 sound/soc/soc-dai.c         | 19 -------------------
 18 files changed, 315 deletions(-)

-- 
2.43.0


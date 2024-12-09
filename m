Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF929E8C7D
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2024 08:44:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4387620C5;
	Mon,  9 Dec 2024 08:44:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4387620C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733730255;
	bh=r7ZVpGTUhMu/3jy1Yjd3Y2y9Zgm3tos2UL8bE0XoSBY=;
	h=To:From:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RMpq8Fee+W49QoALUEc931/R9ESxPlddwHmYh/ZNNLGMRLCFsvblfxf5+MA0DNb1E
	 xOUcxLsLL5dEZjXKFh7L35gKElcGpVPChsBIPCAcCMWhTrAW29GnigFAhDLdH46h0g
	 oR+8J0H7wk6ju4CwA9Xi6T6NFJD+1lSST9ubX258=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 562A1F805C3; Mon,  9 Dec 2024 08:41:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6C54F8075A;
	Mon,  9 Dec 2024 08:41:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BB4AF806BA; Mon,  9 Dec 2024 08:41:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0A1BF806B4
	for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2024 08:41:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0A1BF806B4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mT1y2bTV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EnETUMf8+jjRFVSNLqEcY8BdrL5BjJP7vqoKN5HboZIeLXVtut2KOP/2jXGej3mUuI1QO4498FLXqQhyzLKjwxrgLMSgc34RSMlRIP2lMgjm/3jReVwa4Fj3xLtUXpx2RToGQR6PVaYlj059S7GpktrAhVt9iwtX4EB9iZ8xJyIRaVuvAu/kXhVi5M5FLdG4tgDCSxUoxb0MA2Cp6xkVy0q8PWkRwGxpOOjWQBGskmTxgmtjjiyC2Sl5/D/s8ZQyNX6T+GXNzP06AWJeLpR7XLWxD3PqMzEmBPgojIJqML27BKVN49ZGT3qIjmYhX2mHILeOAxP9SYB1PO6wnnFniw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2Nq3E7jHUmBvXhRAgotyqnVqTlm0zR2boywoNpH5ow=;
 b=fCnEWnCZGVVS8xZBp1YJ9iomvPL/1zay6QJcRiuKJJC4cuKQUBDqXh4QcvzB4VJNiqFpLTW3PWVMLEvPga9+tN8MxbbgzZv9BvuvwIq82wcE75vyPC5OsnVZutF05BQ3Rs90o9MxhQ3Gu8dyQHsIipdbtWsLBFeMhjDQ3Dxr5mouu9hTBV/U96v5iujfBil/QAlufeEgaUszhBNFsPN9M9cuFXWldFsyDKOJGGwx8ViLpShSYHHt4gJOIPIUz3WOu22uVhMK2Nu/JcVYMjW2xy0mjG9MNv60isnQYO/kDqAF54DgjQms28OFN4+bTFmXC3nC/c/VnIsMj78dKGPp5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2Nq3E7jHUmBvXhRAgotyqnVqTlm0zR2boywoNpH5ow=;
 b=mT1y2bTVhoDiOaIp9IWq+KwJ1YN+BJACKkv+JTFh1qPyBG63pAYPfjyoK7McgHgNSmnrEhPlC9bqRkz3H20JfLcVG3E6mK0bFBTtG7zl0Cb1hCqAjHoyBsyyNxi2ZHGUz+uC4Ii3n/bqVHxJ8ajdCoHOAREBuys1lUnW8FRA4pM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5479.jpnprd01.prod.outlook.com
 (2603:1096:604:87::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:40:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:40:43 +0000
Message-ID: <87bjxlmhhh.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 15/17] ASoC: codecs: arizona: remove
 snd_soc_dai_set_tristate()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Dec 2024 07:40:42 +0000
X-ClientProxiedBy: TYCP286CA0225.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5479:EE_
X-MS-Office365-Filtering-Correlation-Id: ea3d4dab-9fd4-4eab-dd89-08dd1824c91b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Kd8RFlzgyUAESXeBiyxEMVgYhI7yllnHd7WnrJiPcFj5vdDoUbFxYWcTVRyU?=
 =?us-ascii?Q?ozF0m7iPvqfuNZ9bBo4XKEMMwbjIN/yhrCQ9MR3U30y9znsii3CcBmgGzP/u?=
 =?us-ascii?Q?09XoV2Ev60cZqlRdbIRQJ/6jUuxhbXRuk4x12SJs1fsYJGVyZAxRsV+vBjf2?=
 =?us-ascii?Q?ZVHqB/TAGXRJuh+mjcpN0G8x/hLTl95q8EwCIJxN2wrcIXCE/sc08cj3RHoc?=
 =?us-ascii?Q?nLiyzc/qUdgYVY7YZaeKWjdk+vafOByqrQ8vGoEfSZfKF0fVftdYO6Owh1Iw?=
 =?us-ascii?Q?Sq0suZZ98eDtQ1ZDC9gdbd9c4L++7GQJJvgRNExpcDgienE91mzxpSW0X2EQ?=
 =?us-ascii?Q?dWDztHjjsxiPyWE0qQJ/jwkMxj1AimzOmFm6Tsr1SmeQ0ZcegvMwFrbe33cF?=
 =?us-ascii?Q?iWPkOmh/CjD/jhf2Eshjh5mq0MRhEE54v8RkmuFrPRMwz3hmziwSsKwWq8Aw?=
 =?us-ascii?Q?axWBXw2rjql4G7usCqJyzKPpZ+W96RvUnJy6n4tS6YhfKbVRdrIz+Aov7d0n?=
 =?us-ascii?Q?pZ8+Jm8y/RrOYevmj0U+1oCAefS80DLE68LMkbF1TIR+HhGZsIRTmeNT10qf?=
 =?us-ascii?Q?OlQUAizefIxZ30McDsVQ5WI0r/jrU9xnyQzg8VeFFusiuG87h8QzZK4fLWTG?=
 =?us-ascii?Q?3LSvZh4eAeVEzE5uvkFcO31FKJssza7bJqklUNRpi1smvbK9/oE6BBJR0VFo?=
 =?us-ascii?Q?HXoSWq9OP4D5kHzbKLoUEWanZgZrWJukY8IlAzZ8ZUeq1/n1MTx2+j+L3RfT?=
 =?us-ascii?Q?Tj8ITjso1TYcBOgZXU9jRvI0nJMJK3GYyAnd3vel10BzXKfBVvRD5C+XXr2j?=
 =?us-ascii?Q?vhSpmbu1Ym0Yb8SCvdcdBlQ9pSs1x0aavJv6tC/wOWVlNWBnVoRvxJWx3Gwz?=
 =?us-ascii?Q?kCule+Nh5FHiXLf2Qnb7wNrHWs/FVeIlDGppzjFPA/C+FjHktq0+hgvIrMSP?=
 =?us-ascii?Q?Oa9PEbnW3cU7FIgIk3zoH+Nixvkk2MfKVVR2tOv85u+UyfUaR0M5Ray3dl7w?=
 =?us-ascii?Q?s1+FJ6zW/bFuEtMBxX/wGQIXW5qVARfS+cahzvmEb3jJqwgTxSlJGzn/1gVR?=
 =?us-ascii?Q?25N8YyjQYIKhogke5c+U7ISp4ECkp8Uk2vogSB33Lb7PfNj9mPZ6oxPNObkL?=
 =?us-ascii?Q?Byme9wXYMwziWUamNkjgTj9IfFIfVRWCLo9ErdKODVDiCSPGCzwN5ZPgdVYH?=
 =?us-ascii?Q?apUnNxHwSbG/ARSvW9voBYOxZyyVbd88870wmbKrpnsev85wEkEthFyMfmEz?=
 =?us-ascii?Q?q+T9hYtQG0PKsH1Q+cwdqKHRXWsvfmvD+b29zkswbBZcs8qw+K7fwZdeD0m+?=
 =?us-ascii?Q?ZiFO6GASFUeQOILsEBjZ+sxRdwFn50noS6fJY3/8Jw5ltRaQgPWcx6EwyD43?=
 =?us-ascii?Q?LOwYdFXKCpiRpemJ2+pyaebupXUzVEre37gBTGBx15Ww9ooC05WoqxdOYH9I?=
 =?us-ascii?Q?zQBwCXVDu7alDaCOU8Q1e9kx1PjoqjUx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OGBUUxfN0jy044NIMrertdBJ1OGKFe5sLcV4OBQTYTuM0FSHrY23fLLbCr6i?=
 =?us-ascii?Q?z28xEViaWyvbKojOj3bjfLeVJP1i+4mRQCLFFDcLi0hzyRaYeStvoqmNImjg?=
 =?us-ascii?Q?pH4A8QnKbMtTrqjMlwXE1DbHfkODoDCEWLOLHSF6AL06/US/xkYj3kiSBVGY?=
 =?us-ascii?Q?CT9NxHNgEEHnJUClZOR9WV2YH5NagtmOrnupmSnqofJ8/ue60cBVYcQjG7FJ?=
 =?us-ascii?Q?N6ySaOw8vx3g2xNwlgf8aGQSOXra4Xu5PXXgbvgHezLHDjrMmv5TLl+H/5QG?=
 =?us-ascii?Q?J7qFwaDLV4DDGIF2P/ALAXi/OtOs0JUqO4gcihpU0tdOfRReUo23OAmFnEob?=
 =?us-ascii?Q?zRTqfv4yrTS5Rzp4M+wwuTrjdu4hFUvfUzZvzfkQQpUd2mwfnfdWmgGDrAqu?=
 =?us-ascii?Q?0HSt3i6E3jpseAutztcEJc66ySdiFAApoTBbUsTk0fIyme7kn+7f2giaL7NW?=
 =?us-ascii?Q?fMAq34NW+RxGqkWp/j6/kcuUcvsPRn90bjMjUxgLaaEZ3/CLDLdZVNvzcXpd?=
 =?us-ascii?Q?riMNE6Vo8B5BR5IGTrNTCuAGewNAVgGD5wqVWwycBdJV6haeTzi4JnBmIFd+?=
 =?us-ascii?Q?HsVnkncTcA+X3YbwonDikmkZT0mFat40YMwa9B0v/8jpxfpoUCGKZUrjbUjp?=
 =?us-ascii?Q?/1w4qNf6L+WVYfinm8Zkib2Z/eZMHKZl2oQIRQPdrhPtyP0GsWgcEGr0zV3f?=
 =?us-ascii?Q?HQhwoCyE85uMTWKC2iWRKP6+fZnu8mTNnBUzJSL3hEaRzzf7lx6T5/BUxdTq?=
 =?us-ascii?Q?ZtAThUZeqY4SE5p/KNqlwDEyHrhed9gDpZPoON18SPWuf6DzYo9iNCFIG+s9?=
 =?us-ascii?Q?vMHylZ+hdetXj83JAs7LafoPxf9HyLc4Z/ewDgY9YD97xCoCgy/mnhyIjwzE?=
 =?us-ascii?Q?m3kp8rdnRG2FvX/dMbP6mwiIEutNRqR9qqxF2K0rIXynZWVRwe4T6v2pI6Gl?=
 =?us-ascii?Q?lBhB+mGoWwkgP2Jl7gP4yRw5VLNZSgWxbeYQSKgSUNsFPWK3rIk4bDKT3M7M?=
 =?us-ascii?Q?YQrR1+QLzQR7TiXe6It9//1B57daW9zPOt4mFSTpcsS/RuHCYd/HwxvgEyIP?=
 =?us-ascii?Q?eJNTekNKn2MKY4hSHXZlvj5s1EwAGXd2QNSCCKe0LdB+M0hGyYB/RhNk971U?=
 =?us-ascii?Q?UshZHwO710N6vbE5QrYzerr++3C0kcYMxq7BJ+Bbw/yTwqJCgMP6PeBj2YrB?=
 =?us-ascii?Q?Kpm7LO1HswbWTkTYpF33TtxnWpXLW7eoBPFp0S/BzJHiXH0EWIuehyPFnQWt?=
 =?us-ascii?Q?DVnxBukhOtO/ScOpainKiKL4ImE9SPy5I94AgRDGKzK09wPHiuirCxGMulLN?=
 =?us-ascii?Q?b3mOSAzBRbNpc3Vf2PXjD9t6Va8vIHW/28Yd5HeKbT7tmsePIQ2E8pgPAmyp?=
 =?us-ascii?Q?JMLeT7qyYe3LqypTwPO5myQHPfUPqC3fpcJ00MjyA1zegvGewJiJ5MrwLdeK?=
 =?us-ascii?Q?Veyh0/9cYjOhAL9JulfiuD1wW4fOW8sG7la+fkWbxJePCJJxHojE8ty25pU+?=
 =?us-ascii?Q?Lk/E+a1eKas/Ayc6VeL9K5amvkLGKo3iqybEIgMad5lEXdQBjmVUylJlj+pD?=
 =?us-ascii?Q?wJLF8QFIWv1XFwK9jvM3HmsqtwktZ2nxe/v18Fp0RsbleeE0sGsYh1UU5S2A?=
 =?us-ascii?Q?TZdk6mCniLz6FS1f0yHNHDM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ea3d4dab-9fd4-4eab-dd89-08dd1824c91b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:40:42.9660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RbMohRPFElTPcNBO34lsFh+KzbG3bY4L/I0hXti9qSD6vwgxLDyzG39RUJF6j6jjI5jptkwFzs8tQePZC5Kq0lkI+ONFac8EH5GMVU1loAchXDWtb3TGZ6x1DQbOsoik
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5479
Message-ID-Hash: 2U6MBSZXNRVLM5A2EYILJFVLRPSD5KQD
X-Message-ID-Hash: 2U6MBSZXNRVLM5A2EYILJFVLRPSD5KQD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2U6MBSZXNRVLM5A2EYILJFVLRPSD5KQD/>
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
 sound/soc/codecs/arizona.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 402b9a2ff0240..4aa31bc5de504 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -1953,22 +1953,6 @@ static int arizona_dai_set_sysclk(struct snd_soc_dai *dai,
 	return snd_soc_dapm_sync(dapm);
 }
 
-static int arizona_set_tristate(struct snd_soc_dai *dai, int tristate)
-{
-	struct snd_soc_component *component = dai->component;
-	int base = dai->driver->base;
-	unsigned int reg;
-
-	if (tristate)
-		reg = ARIZONA_AIF1_TRI;
-	else
-		reg = 0;
-
-	return snd_soc_component_update_bits(component,
-					     base + ARIZONA_AIF_RATE_CTRL,
-					     ARIZONA_AIF1_TRI, reg);
-}
-
 static void arizona_set_channels_to_mask(struct snd_soc_dai *dai,
 					 unsigned int base,
 					 int channels, unsigned int mask)
@@ -2028,7 +2012,6 @@ const struct snd_soc_dai_ops arizona_dai_ops = {
 	.set_tdm_slot = arizona_set_tdm_slot,
 	.hw_params = arizona_hw_params,
 	.set_sysclk = arizona_dai_set_sysclk,
-	.set_tristate = arizona_set_tristate,
 };
 EXPORT_SYMBOL_GPL(arizona_dai_ops);
 
-- 
2.43.0


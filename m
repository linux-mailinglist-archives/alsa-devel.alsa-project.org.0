Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 815E09869B6
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2024 01:40:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2505E14C;
	Thu, 26 Sep 2024 01:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2505E14C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727307621;
	bh=+3iOY++1gWaDouYT9bhhdLFKqUAA/eCCpStrVxpCZ78=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qftbkfcsMV9YZ4OYw2rjsWZzZ4/BOyL3igInaEAYpCdt6obN1oOgl++hKlQp181Ux
	 qqLwkpnYb34yqu/breuZqRiwWQxIcn519NmBMbqaEyqEmPOE6/bXZnJ4GzApcAxyZa
	 1T/iyHpQb2fFpBwrRd3sP/XK/JfQPR0/Gm6/wNhA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30CFEF8067E; Thu, 26 Sep 2024 01:38:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 814C7F805B5;
	Thu, 26 Sep 2024 01:38:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D00ABF805A1; Thu, 26 Sep 2024 01:38:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A32DEF80527
	for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2024 01:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A32DEF80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=CJBZl1zc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kESRaMRK33nIODyH4XVCP9MvDyelxCQxEvT6m2U0SAoSi2heqpkNGkUMY5rraAbsxDrUOLd9YXDiYq/Ww6BzN3FfCYy5UdDOWhfG3Yrqb8vbQEfv3rfvzjIEq+6J+/N4jB0CGhiQ0GCHzvsDTRbZCYT41DwGBPTW9RsoWCTaktHkYaCocco+x/RX/q08Ez9qv4YmwqC6LAbmXt8jA+L2PDbOBTrBH58uoJVLMApkKGPvFT87vp/K4gza0ddccdAEh4cOj8tVm7gPbdH3MRrQJ3yXDusFZJVKFKY3IxNqqKu1tHbB+P8vfwYhab/Dp9mauUGUfmW6A7G6IoiiHuO/FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMde+Gsewkg5yaN7cIsJHBgQ3crEs406DnvzH+HMtbk=;
 b=g8IYrgY9xh78y2T4eCk8GzBBZNoigkoAW2Bwpep5bUK9gSEto1p84YzoDDHMTQMkPpH4Ri6BTKRpmrEZr7nWsElvuZXM1/7JTPxe2FXjnQzxD+8UPlnaHhoocP0QX41CKrM7VNh6Un0IGzgtQxzJRUokjQ574Alhirwu26W0HdeCk+0xpEAeEWCKuxCYqT8DJQtVyKH1LG58ZtOY1LX9VLy5lmIwkYxwbtc4QMWEtsEiig9cOFlRAmoHO80ZoVtcj4TXY5I8WoE1qlPrBe7geF82kLK1WncnZ9cYcuZN2FRzfOLjEvuwEv1PO2qNUTZAzPywDFHSzzg+vB5D8pJG1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMde+Gsewkg5yaN7cIsJHBgQ3crEs406DnvzH+HMtbk=;
 b=CJBZl1zczZHcjW60KPDZ+oYBZPZiwHU2Jfxb67dLfxmcCUJpllHJb+AEYg5dV11RvXVQtA2OzvFxn3lAJ0X8LuxPvMfmdc95wiQdDWvnvTIwVJzxGdVcEeCeuj3UCUpEIdCv4Pf8+NPhfY9zqtNq887hC8a/B6XIdjA6UwIumvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10634.jpnprd01.prod.outlook.com
 (2603:1096:400:292::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 23:38:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Wed, 25 Sep 2024
 23:38:07 +0000
Message-ID: <87jzez9ue9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/13] ASoC: samsung: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Sep 2024 23:38:06 +0000
X-ClientProxiedBy: TY2PR0101CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10634:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ee95f9-0124-4b0d-1929-08dcddbb1b8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?M3C0lbg/ZATTWLnuofuo5CUPlcBXy7nK2WcElp/uirQqnFUnSO1MZcPop/mI?=
 =?us-ascii?Q?+plj/1uqRJvlg+8rU3A5RvSeBJH5OHSfmGz0/8/4EswJBbR1Qry7zzitcMBW?=
 =?us-ascii?Q?84msa5T33bii3DOmi/V1SAr2E/REexFG1rLFBkQ+835sq0A1QYKnXKHC4Pza?=
 =?us-ascii?Q?4Uknt99f9Ylo4LqP4oLy5HPV2+GBrZmnq4dstGTQonHxIP1T2zqjuSc267Cd?=
 =?us-ascii?Q?p/DIrEf0hy5nzDcGBGnLFA+CNK3FYIWGvbAaGIFPQaZYYYbA7TqPkX2jWJp0?=
 =?us-ascii?Q?COBuxASFjmBHojc3vHooQxkDpzHgvEc90O54KMxpFTGtRtt/IzH1rFNEb1vW?=
 =?us-ascii?Q?xgfJo0DH5yxei972RzdE1UmQ4RbVkf9QYTu3VMwCPFFaExo8AJnDVEpR1MaD?=
 =?us-ascii?Q?KZx2ypWh+eoMBqhsaAIE37f8BRY59bKRzQasEA4vSq1MyWdeOmWbZCdKW2Md?=
 =?us-ascii?Q?pUnELDoVUJxEAK8+9cZArxkp+4qMXTznRvKWLlncm60XUgVMeQbR/uzPJ+TW?=
 =?us-ascii?Q?g1U8o00503eapaZoIqz2/DQ7QtX5u80Lyfi8/7FTJbe5ODSm92ndoIJU+p4F?=
 =?us-ascii?Q?Xb3K5k8dEDEi21jZmcxiOLkFPfXC9dJEDDePFA1QwPAceacv0HZHUqANlwm1?=
 =?us-ascii?Q?uWACwmErcQv5ffhjGlv00xpZBd8VOCTzqEIqjmFRdyy4Y8MbwfqdavqgcGZj?=
 =?us-ascii?Q?LHY94hQuZ+8zZbFgPxHY3CZ88hX1weIcZAC8Qfik0zAyEnWk3UrQ9xesfPzI?=
 =?us-ascii?Q?o+/vmp8CPt8dCFYhm4Od4fRRzguiIv1DKovM6TOI/07fBoDKzhDm2TM4vsCK?=
 =?us-ascii?Q?SIo6Z5BoXIMkaOO3VWDpkQSHM3FNJkP2+cL6YBAeWEeOrgk8WKlV+vurHRTi?=
 =?us-ascii?Q?X43BX2WB09LT46yFcr0PebqQyXXjTF5b/3LBQRZ3fUOVdAfqJB8tnWLrpEjJ?=
 =?us-ascii?Q?/4PRYaD4kYnX40/p64By0LJu7ZRxCDWy1ysnHrWHBGBcriQBcSa1NbKZZyqg?=
 =?us-ascii?Q?1e6EOMcbOV6YQR6Kfd8OIIFZOFNBIQ3npeglapNsuch+VW7QkUFDC2RVUQ8K?=
 =?us-ascii?Q?2jFg3OjbhqEkeqGRBfpc2KMZ3LO8ItDvODTvZk6Touy7BvNFu3Exl25fcikf?=
 =?us-ascii?Q?uT4LC6L8ldJTK8g6LCnujRU7A0Wq0svXvfaGxXkbOWHkv4PXLCblaOsFaq4E?=
 =?us-ascii?Q?eJpdcYfxVsIsvH6TxzId/wb2i++hwIEG8iDIF3I//GPR0HgJGfsFcghC+PS3?=
 =?us-ascii?Q?Dcqtw4yYA6N//3ary6hQ4xsDK7eCtI+/38m3WMykjMCQL7nGSQqRoPUQ29X4?=
 =?us-ascii?Q?KPvDOB7CX5I1O9dq8Jv7DxKKFw3xxwa9YVJ/P3x0V9DkDw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6vRTDn52baayCujtr+L9VzQwWswq2CVqy0BJ1+Uga1znyqI54HBTxmdy+qWj?=
 =?us-ascii?Q?4Ier0/ldCyEmIKIu/q98n69yoX8SjSR7kndr3vtyFKkaecxrgojZOJyjdaUq?=
 =?us-ascii?Q?C9bks2Vz75HQa7gK1gWhjYcRZDfxTK87fhNKFAqunaCI3vpSF26bALzSBgJr?=
 =?us-ascii?Q?3DHYzRmoUDGVBnDUr7vra10tzO4AUuGjK4LBU/I8trEr1kcHBmBLvkGJcktd?=
 =?us-ascii?Q?0ElbqMdcdiq1qwtJqAe4wEAKzIUKEHzTtiw0Nk0Qu2o4IfZxllTh5S92YATA?=
 =?us-ascii?Q?JAEKjxi3+DBMzBc48QB9K6d6yXczQIfcAl+a9g00glFt+Ngk3uMIe5d25j4D?=
 =?us-ascii?Q?eYDFtGi6xCTA2flLOCtzJonC6k/TpqtaT60t7a8Wdx93rO5HljSjd6XJ97mF?=
 =?us-ascii?Q?JIaAjqDqPqn6GO1S2Zq4W4tsu9LCwV6wWTCjL+nYxKj1AHvXW1b1vfa8WGRr?=
 =?us-ascii?Q?DYSezq5IWOwjS+pgLsHwMIzRsNAcb+r0ENJ4wrRgv8PbfMEjcISs6KJoTo45?=
 =?us-ascii?Q?GxjdavB1BsZk2cYRZl8lQGI9hxb3nUSUkd6w8jgbEWFJ+Nyuzc3dxVUDyKXp?=
 =?us-ascii?Q?U2fL5u86hEu3J7LQeFljxlfqqm4EpIoOTWv3iD+dctXAxCbG50SaH0yYJcqH?=
 =?us-ascii?Q?shEXxOhHpNbr7zfX123dA4eUZpoTbYLnwMmO5hjxgXdP9VlAcjNDFEM+1E+G?=
 =?us-ascii?Q?bm/Qf5DXMvSH7PLJ4n1zoJTD14WrVs7Lyfoqv6u5M4ClbXdZd8Renq2wyEQT?=
 =?us-ascii?Q?mKw+Rtw/7mXD/9KH88LA80qlxVvxQgsNehZ/rZK9zBYk4+BohtIz7yxcx86u?=
 =?us-ascii?Q?6BsFjIs3MPQuytuch7tJhLqhEP6ydT2uUNm8B/Y5NoZR0ySFcegcuDc4wI+5?=
 =?us-ascii?Q?a/D2c5cP5lIqbPcV6b56hyPVFIxR+MWiy6ZPkc02umENZykvvPnpflj2xAZv?=
 =?us-ascii?Q?R++cdekxPi4fiImyUK3V8QxlrYFqxvuFtbqT6EVsbZ/tkEqI2Rl3I78/tnVs?=
 =?us-ascii?Q?MrpVckhntuqSYdApKmc0tSkX14gQ54x7yuhg+eo8tPSwWURe6Cf3SF1gPv4E?=
 =?us-ascii?Q?K01MhyMHsPAESYDIdHyvUCbjYUVzl1qejJEZF/qNdmhEM1rivsR5qIVbY5E7?=
 =?us-ascii?Q?/8vgYpN0bhwTWRI93DaorTsLFjKzNcuzx9XsgFcRRxO85JPaSuBiH95jDpFS?=
 =?us-ascii?Q?oInfqC3PthOKG0ULndO8jrAXMO9cE1mv15UE+1SHcGTDuFkA0ftIIzFsZmHJ?=
 =?us-ascii?Q?pPNue19b4yljcP9RH10vtQlGhLpnj9WwFKWMTnK6lIOe0Bmh3cYRDIGJRAAf?=
 =?us-ascii?Q?eMXaHjDF9q40Zb6irbm1SWEJQagZE1rxO7T/s0b8+38ivTx4SRb0eCanWwhp?=
 =?us-ascii?Q?Zlenzz8mUr2zldKre0m2ijJvS2Vex9Hu+hrbsHC0hnOkT3cATR9FHO1EYibC?=
 =?us-ascii?Q?fipEJesgji2GPpkJE61j8ykNm9dz31EEpyrLvVYH+NVA9ShQfU2o/hfLRJx0?=
 =?us-ascii?Q?EiGpZOIb3uHiWsrxDr43GKUvPR5foQpbip8SEfAKrFCEEUd8kzGuVDlMdgKw?=
 =?us-ascii?Q?xbP82GN5m52ZQIC2FT2lKNGpl7AOo90QqV3VzI7no8/16lsoleaoPoCHRERJ?=
 =?us-ascii?Q?HaEkJSwAzZLgGFsIyRR8PmY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8ee95f9-0124-4b0d-1929-08dcddbb1b8b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 23:38:07.4631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ojWPBvekseMhPXU5bw/g5nQSL1uc6UeQF7+kLvoox+087ZcR9jj6PxAsWznbT/fLmOA1mNBUKnnvm3G+JoKwdb6sQE31bQrQPXU3yF48myjEwbACdUeKVNdftw5yAjJ3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10634
Message-ID-Hash: 7ZNRSHC6ODV43AXY4TUZ73ZBG6DHOUOD
X-Message-ID-Hash: 7ZNRSHC6ODV43AXY4TUZ73ZBG6DHOUOD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ZNRSHC6ODV43AXY4TUZ73ZBG6DHOUOD/>
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
 sound/soc/samsung/odroid.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index ed865cc07e2ef..20e17d0610301 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -171,14 +171,14 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.name = "Primary",
 		.stream_name = "Primary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(primary),
 	}, {
 		/* BE <-> CODECs link */
 		.name = "I2S Mixer",
 		.ops = &odroid_card_be_ops,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				SND_SOC_DAIFMT_CBS_CFS,
 		SND_SOC_DAILINK_REG(mixer),
@@ -189,7 +189,7 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.name = "Secondary",
 		.stream_name = "Secondary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(secondary),
 	}
 };
@@ -278,8 +278,8 @@ static int odroid_audio_probe(struct platform_device *pdev)
 
 	/* Set capture capability only for boards with the MAX98090 CODEC */
 	if (codec_link->num_codecs > 1) {
-		card->dai_link[0].dpcm_capture = 1;
-		card->dai_link[1].dpcm_capture = 1;
+		card->dai_link[0].playback_only = 0;
+		card->dai_link[1].playback_only = 0;
 	}
 
 	priv->sclk_i2s = of_clk_get_by_name(cpu_dai, "i2s_opclk1");
-- 
2.43.0


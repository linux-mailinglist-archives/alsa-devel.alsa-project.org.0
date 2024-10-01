Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE6098B1DF
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 03:43:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E880EC0;
	Tue,  1 Oct 2024 03:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E880EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727747003;
	bh=+KIvJZbiuxT+XDabxO78gQfFLnNNuo6vxDr85Oka1/c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U8PkefbSfq452iTAHIReaHcyDNNnYCjQtEqS7BLgLaMcl6Jj36c0z2CCnsSCY4rLu
	 J2uLo7wsOAZVhDEz8LCQoYFLba+dIc4xtxja9SRzz0cqiZV1xRWuSWhbDnZVIWEQjY
	 eaK+OHpoKB46mQTFUNq4t7CHTDaLUYsDC/UXaJEU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B85FDF80682; Tue,  1 Oct 2024 03:41:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCE90F805C1;
	Tue,  1 Oct 2024 03:41:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFF65F805C8; Tue,  1 Oct 2024 03:41:48 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EF80F805AA
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 03:41:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EF80F805AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Nlufazzp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzzkKF6HuSMhUUOmHYKNmUnTRN2YvqDTIAfvtg8cdPVJlo3Bk+5bJNbKEM6cr8tHXq2Br8yc0ZuKJpI/aatpuC6xYtaM2b/8P6ecmLrj9I7y+pgrh+hUlZLwmOWFPcl/Qb03iOBtOmAWTn6G9Sjlp4/GnDef0dJDLGTeaMcnPxwRA+W5RUUW6vluvmHuXWDrUAphlgZQhIdPBFe/38pC2A/sqQGFBSvHFamuFexN7jCdJ6JzaA06uciny4mEkZVttxrwIHLWDtQC/Ycm8LDPqckmTY9v7ZBlAXx/3nxKiAjEmaw3chOStQ58x2BVm/B3YFfgODlyx8ZwA1GSZ3db2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CL3dhQsYj1QBU5i58qDzMRz7pQ0VE208LyD6uWHe3l0=;
 b=ctLuV1sJdHIRpfFfI58MzpqaEMN8iLt/elKwctmZHNkuR7D0vAWacryd53RCzrylLUL+jh3CtMqSToQLHkXy1+XzuMP1xBaoSYkEeJio/lTvmZL00k9Lx9LY+Cf6xmnEz5xMLbwRvps9PHQ888yW7pA3JQ34q6V9nhEHW0jAeGStnUgc7FCvAbMkUV+zTNoY/CG/PBG+g/LnVpibeMXFXEjR43K7Qr+Qvz403RDuhxwnstsq3RP68Mpgu3LFBnPFE/IXs+FR/Xl3vA2SbMa5edzX2D10BVysj0cjF7NstUoSgYoZn1i4IGhUDrZHjVhYN6P0/orMPncPsPYanET+Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CL3dhQsYj1QBU5i58qDzMRz7pQ0VE208LyD6uWHe3l0=;
 b=Nlufazzphh+iFwmfgXqgr/C/DEwzyc1OQm6Adt7LjMrdhUHxY3p+E5jJjUP5dBh5Oj6qQHu/D1yp38R25mGQYghwSS5tjSi2ucgwJLepltcodcohG07NSaK9+7r6nd12OfKM92xEQ02U4r9oiuIfkQguTQDEFEOB2RucWpeWaoE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB13482.jpnprd01.prod.outlook.com
 (2603:1096:604:334::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 01:41:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 01:41:44 +0000
Message-ID: <87r090vbu0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 05/13] ASoC: samsung: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
References: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Oct 2024 01:41:43 +0000
X-ClientProxiedBy: TYCP286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB13482:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d8879d1-10bf-4019-e7d1-08dce1ba3473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZyZ+6TtYzP3ylfgevb9RqajfhziaGRLQsTU0UpjM0yREFUclhWoXAFFiLgsw?=
 =?us-ascii?Q?TTeFiSi2NL0lgoZdlT7X+EPy0XjzZOfaZ6Hq8qNvPfXG4QnIyCgEe3f5YDu4?=
 =?us-ascii?Q?2a5hubZBCi0jixB0EHqaR8PbyDGvZhhEgq/1Sp7hBF4ohcDC2Ewv/WokGfoO?=
 =?us-ascii?Q?ZPaTj/HgsIERmm9rU0LuAv0dWdUd3PKvQU4SEzWNvD66BHECYibGysxYKIRs?=
 =?us-ascii?Q?b1G3s7uNBqoD/yHrepn6XHBBlTpX65t5uxZh7/YjgayyqhZd/HG/gr6Z6AIH?=
 =?us-ascii?Q?DKoLMzV1TXzpUiVyVuFDyf2+rVyuPqSJO/dz6B+71jjfh/A2/Vfqg57nwuzu?=
 =?us-ascii?Q?bl3XLh6jSO+egMN3mLQgRDbBkliaK5Pir3H6nPGZcPdCDW6sQvHJYEdYVjb2?=
 =?us-ascii?Q?nLiJDSmO8Cq5ewTPKWn5WW6y/73ueabmmMPx4wD3whwkjx6UEiPvQJk3xWV+?=
 =?us-ascii?Q?jiEvGNHifga1UhlP3PN6te9H844F+GWXoK8VzN1QOAecLJvJkCfsSdqfeWM8?=
 =?us-ascii?Q?+cXy/oJOxgc6g8zZD8hDt90vdMSjpacezZfyBaH59wI1GDiowo8y1D3fT2gS?=
 =?us-ascii?Q?ctF3Ujcw8T+V2sxuEnRZ+YdOniZMyfCY8BHWqcmYLpJqM6VKvEr6oRVQe6y4?=
 =?us-ascii?Q?Rcy5xC61KRO06pgAsg8D67E3B/4agKJqSoIo+s03QjskhGEKAHHMe0PdQp9M?=
 =?us-ascii?Q?ZwusGmTQbx2vG+imk9uqwJV7DC8vzhv1wLF2No0+Si5qwPwQcfvbKBAtjud2?=
 =?us-ascii?Q?BsY6qpF1HES+pzC2JTCr5569BtHd4/Lx1JF0iaX1vg1tZUgZ/Xxt65clYdYO?=
 =?us-ascii?Q?C4+DH3aNe+CPe7Gh46LREffaNcRyjMtJoo2QZ48Ny8B9Ju6wfAwU06Nx3Q/4?=
 =?us-ascii?Q?u3RmnqtB6a6mT/WqWh6UIhIVPvAc+3VsmbKfHcoj+/AdQCnPsXTFi2C3HQmB?=
 =?us-ascii?Q?cU69KdoddzXEksJqpAo+zxVgX/jfsG7noGdkNnANtJL+9oQvns2g/wioynFB?=
 =?us-ascii?Q?rLdVmF28/wJDZ5vxn20S/r+elzQq4+WkfLRHaqn6LdxIJjQr+rSqPjDwaiIb?=
 =?us-ascii?Q?45U+3m5vJPMEl5prYJ2akLXax7G0GbUKkuP+9n2QCFnJwiVGmHHz9ws28q8l?=
 =?us-ascii?Q?l3Vb/ig7kCwfCEFCxBrIVoFOnKIMl13u91UDopeygdCuoCBkR/7qSPLKuV3L?=
 =?us-ascii?Q?1JvSEHVwPKgYAFWiXPfYNPdaCoeNophNDUIozAnO3r17/kRvK7dle++EVsiM?=
 =?us-ascii?Q?3r8dte/eDIvaoJtNDzh6mwKERV6eGEC8CcE1EgI7P1F0jy4p395Hy6jN2Cck?=
 =?us-ascii?Q?eYvg932QxWF47U8CPY91zOsAQlzfhQojxfvAyCRHXf7Eig=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8nH+bWY+mCmhtqtW7g+kLKZsF9GQ7rCZVfYOBQ3NIPhzMTAJRPe13y6cpojP?=
 =?us-ascii?Q?giUrCenkG3wAXZO3y4+Su3kSRQGwYGoVtTLBqBwpPNWJBhrMNt/nb/JDSY5n?=
 =?us-ascii?Q?3QqFiXl5BHtE38Qv0zseWLBr1z45kdjEbI//5Q6rKviXMhTy7CMKevo38tgo?=
 =?us-ascii?Q?hng3wxv7tjBt/Nj2j6Ew5X8HPiwAYBwtv7iS6bvsj8XViOmaQB9x5tJ+oYjP?=
 =?us-ascii?Q?F0XXDCo5l/FAqo9m1BjHW4aEo6BB1RCnEfZ9IvlIPwSvtOp3oiy8rpiMLgiF?=
 =?us-ascii?Q?p6G96YYAtBwv5N/OReAz3F3lgQhpfNLH/Y3doE9MlkEQI6JJwHS10YgBLzB0?=
 =?us-ascii?Q?SKmpOUOAW1l+ikbiUB9ppaa8BJt443dDjZ3Zex2WS+Qb8MIcJ51ClPjvTtZf?=
 =?us-ascii?Q?1WmpAXPIF39Mx5w6cd+SPoZO5hOPla7MHh3myCmCubg+369fArTjmsWyWhh5?=
 =?us-ascii?Q?GxE1chaTGgkTubblVy14QvE1XvI69CBKNJ6QJf9WX1ByFf8u2Ju+foEv7iS7?=
 =?us-ascii?Q?1tSv5uwcUr6/aET1C4wyVrYy5FftsCfRNpfkR3l9R2/bNbAIy+fgRXx2oUxc?=
 =?us-ascii?Q?KWjo2bgYKXJJHnX4f/k48hl04qOUVNpM1pcVgQneUBvMqoIMB4xxMUHMwn9r?=
 =?us-ascii?Q?u1zfa7g9SAy0nGHGW9zR0O/SouqHjFohL3cTqeK75vMe6X/UyDprJYWNpwr1?=
 =?us-ascii?Q?pLVolWAVpEwAQ5cHIVqNfgakEUdGIpxOF24qm+wyfHP6M9MOIJYGSFZDb/qX?=
 =?us-ascii?Q?X7vDl2WjW3UoZ3Vgz8H6BbQgBNsayTsyMk0mvEqAkwS6AJKowr3AOt3bAg5A?=
 =?us-ascii?Q?cLjUwtdj7eyPUmXO/Tn1sSkn3SRJd6NKNejVxSpi3YLPfT5IGmPbgqbq1aEl?=
 =?us-ascii?Q?NcIrT5m6qR8XUhk3clhaxxCDsvHZxpbIprJZX9sH0/thdZnnzU0pC+wyNNTG?=
 =?us-ascii?Q?q/2DAQi6nPQG/ieAsYrsLJwDmeabhBxsg5vjAm/B2uRlYOdXC9cYn5nWzMJX?=
 =?us-ascii?Q?M8Sb16AjzQoiGKeVRM4F1uPc+qSnSxxOKVeLsqrvkOXbnIbigEBCyRI4t+S1?=
 =?us-ascii?Q?24/cjSPn0lj99sS8dYGFTzHtiKgdvAFthfDu63/sImQ1FTJZq5CROdCI6YHA?=
 =?us-ascii?Q?9qr3RZg6MzC0tQWaWLWNnpaHB/9APMcmfcQEMSq1Bsp4gl49nLQW/sV0vhnd?=
 =?us-ascii?Q?6l2n2bE6lQMH4Iz0c7i6PTRQArWMWwAJpmZX8IfySMOqqeIIkHmpQNR0ragQ?=
 =?us-ascii?Q?vkHqo7S+OpulnCb7fLtWTlK6zW5U8trwxfCuhlTcnCqgNzVAug4/mT4fgINa?=
 =?us-ascii?Q?CNxrvssXlwKpLVYsZ7G0JbT6QsDtwg3nUOFpsT5PNdIKi7c+ZPDHFK1grHca?=
 =?us-ascii?Q?bN+4spYkbUp//okn1rz3KDF7ZRsIAXhA1JmhCq+3/p13YwnBZpULC/1aBbvw?=
 =?us-ascii?Q?dxdRIn+J1hzAKSaQtjsTprSbtobUaw2/VEUOoWCp2plEyL1UpgiUHi3xKVqL?=
 =?us-ascii?Q?Vo2qxd8JNtAtRJfaX77roiR/GBvLihWFuEVvmS3OB4GIqJI+1fHjOsATaCWF?=
 =?us-ascii?Q?REwc5dWEjQ5rJHmoI3TByxFEp4+rGqZoBfcq49qgKevW0OCDoo7ps4o7JyyW?=
 =?us-ascii?Q?hPi6qY6sbY4SUGQZ1m5BYok=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8d8879d1-10bf-4019-e7d1-08dce1ba3473
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 01:41:44.0693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SdX2CBW8YpAGnJgr+3CMGa1UEFWTILp4noR70pzgbcjsK10AQiMvcTSK7nHnk8uiZZvhUN+QcNgD5SxAaHiIceHgKtJi2VeGs+5kr0NDHiirjwYpwqVxWgKmIzj3peov
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13482
Message-ID-Hash: 2Y74DRL4NBMDYPCYHKGEYHJNUA3NZ3MI
X-Message-ID-Hash: 2Y74DRL4NBMDYPCYHKGEYHJNUA3NZ3MI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2Y74DRL4NBMDYPCYHKGEYHJNUA3NZ3MI/>
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
index ed865cc07e2e..20e17d061030 100644
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


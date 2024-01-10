Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 777488296D1
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 11:01:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BC3A14DC;
	Wed, 10 Jan 2024 11:01:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BC3A14DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704880887;
	bh=Bx43/OXadWqXsefIVhRmizHmsWZq57c+QSdf2hl5H5o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IRQJnn0PkQUGtBNRt6FUFvmoVg95QgGMjZDJ2cRyJ67ewI8gubyY52kcx5ork2iG6
	 APZfW/IepLhDqs3zQNFLxGxj9zxomDhw8ClkpN1Q2omW9gvWWcQ67dWRrh82Y65FVy
	 yAK4p6hpQOxhA6wM/fsNVEnYFJVn+2MqzejS+8Ks=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9A1CF806CB; Wed, 10 Jan 2024 10:59:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2354F806C6;
	Wed, 10 Jan 2024 10:59:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EA73F80254; Wed, 10 Jan 2024 10:55:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2608::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EDF9F8014B
	for <alsa-devel@alsa-project.org>; Wed, 10 Jan 2024 10:55:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EDF9F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=axentia.se header.i=@axentia.se header.a=rsa-sha256
 header.s=selector2 header.b=i+Zr9szN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dMB2LaTxeGcwkRcwDzgTYvREtFLNvC8vtsJEA2b3c4jB5IPcCTFKdlWJkGCTQ8um/oKRv5rYq0zxBYmWtM4QcfRRzXkmp+bHI2IR2ksBdhY9mRXiJKGLdrKHxfa0YRkbpYmetJKngvuqGVAUTPDhAcWkNG57s9DxAVvh4t+d+MQvR8ASEO3Yd57Slpum/65KSXg5Cm+8zf0hKPUFATcEfC3Z8rN6OLtAqiw02Ov1GbdituDPSHBhXkjzIPKLkFgnZ6mzNvIZAouEG0dWs0E9KY76Nazt8eJpEmJU4X04DIT/u+KHfk2CZ1hy7XcD1HkylWPG1W40dTWlDYkEO58CQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYUP8kINmxipYb5kchXrG7//RqQ1xESMVwIM6YtiIM4=;
 b=USZhdFimk11Zl9OK0xyolPnZpA4BTFQ0koJdxyIw52ZIHxdYuL38BR54A47wfE/TXhiWL6J77Wm23PWr+6zS43kuYQ+NuLOb0Hr8pMQEM2cIxk5Er8+/X+pDQRfN4LR4JhFm28/z3vNJZz7Jy6mcwlXctaoMHU+3azBeozTEhYnzDeymgTPRoFBm0TNQSLZKeG2BL5MvaOk9oeuhvHeHFbTAkTIUK/Fe+tMMQ18zuW/JuYHretxp1mlp3V7bHwK7dPhAYyYAtTjrzSKtED5Q1Y66eZdGMAHN974zGPAwEIRXONZ7X1iAr5nCk2qW7dQty+j8AUcq4EO0ouFS+pJy0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYUP8kINmxipYb5kchXrG7//RqQ1xESMVwIM6YtiIM4=;
 b=i+Zr9szNdYNHKKyXc0p2XQJwVQhcbWMypf48rsmI7VBLNWPquCwcOn8e7JloXc+mhXFQOIEBafvDrP/I6VLS4Id4rObWkbNYTETLYmbLl3s/DrrT5IxQl+R7a9LId61yZdC3MK1/xxdZz0wFUwn+JicOXVTQid750WhKWE6NmFk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by DU0PR02MB9049.eurprd02.prod.outlook.com (2603:10a6:10:478::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 09:55:20 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::4c56:a71b:d42d:11ba]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::4c56:a71b:d42d:11ba%3]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 09:55:20 +0000
Message-ID: <aacc9880-c0f9-92b8-fc17-87535ba4519f@axentia.se>
Date: Wed, 10 Jan 2024 10:55:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/6] ASoC: atmel: use devm_snd_soc_register_card()
Content-Language: sv-SE, en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <877ckigepg.wl-kuninori.morimoto.gx@renesas.com>
 <8734v6geok.wl-kuninori.morimoto.gx@renesas.com>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <8734v6geok.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVX0EPF000013EE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1::1b) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|DU0PR02MB9049:EE_
X-MS-Office365-Filtering-Correlation-Id: cba5263a-5cc9-437e-ccb8-08dc11c24188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kqoXGP+1D79URHMwadsSGUyifdhW2gCa89MPWh9tSRni6Q+LlKqONigMoV5gtp1kYrNIq9WADUEzxRtx9BQjOvaimV5y3AElJPpiKS6cb9DLiXZ94pNniGwGOtmr4VTJ1pKDdXt9iurOArpipxFV+WldrYuRJ7GAodoGiSEIisDpb06LsQgTZwxYd2+St65ZjcAccApIbCMcYsQ4GQe7M75Qw6Uix41haoI7h9L6i/fqLy3mPtObB2DEXfpSnbeEEBnBbJ0aGaxxP2muu9ioHXwI4o/rbpxftdurCJC4npSjJbGI3F0wZQSGhDn6go9xPVBqtBeKLw7LIiBkp10ofu24Kaue0GAFHbUmDCqX0sanidS2hDMLxHaCsuinmJ9vBj1XYFOz6lY1R7kk31qjjQmVc2hCrNlf0cMYp2HR0xb8ojJH6s3vQDptiU3Bp88mkS27Iqtsf3bi4FNFgHu2RsYSJ2mKMMd+vLs80OXVqxJucQayIl4Eix06igxE6lqkrvA5jAueZ3FBHP7XQgCPVb2PkRD3SC5m9a1rrGqQgZKLkjqM3QJSnKoIvGOJSivbgFg3hYVjTlwF4hdyP0R0XCmeyBdnzqf1xHLOEA5G+5odpKfhB1AhJee0EeOHKIzanV1cK9uWKlaredkHu0ITsw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39840400004)(346002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(478600001)(66476007)(66946007)(4326008)(6506007)(6486002)(66556008)(110136005)(316002)(8676002)(8936002)(2616005)(6512007)(26005)(41300700001)(2906002)(7416002)(5660300002)(36756003)(38100700002)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d0JZOTJuN3NyTjRRMGZ2YnFibHc2Qnh1S0dCWlNvWXlLSkszNWt3Umt1QnBE?=
 =?utf-8?B?QVNKWk1LbTFCQmxKQ1lXT3JiYTI1anNLSWZ6aU50anRSaXUva2UyVHpmQitG?=
 =?utf-8?B?UTBCejZsVGZHeTdDelBHcDVmTWlneHBwRTliWmR4eExzQi9IRTdRZ3NxcStO?=
 =?utf-8?B?V0sxY1JEZnZBc0NoU2VOaWtmSDlZL0pGR0pzK1FuanB2Z2xna2NydDB2U2R2?=
 =?utf-8?B?U0pIdFllcGQvT3hFelpFNUh6Z21XWWtzQzJiak5SeDRERm9pL2N1VGMyR1Z3?=
 =?utf-8?B?YmU5OUs3bEwyU2FQWWtBcVRUenJrRGFCL2VCOHU2Q3Y0bm1OYTlzVDF2Z1N1?=
 =?utf-8?B?QnV6aUhWWTRlcExVc2h1SVNnUTAyNmMwTVhZeUUySlJzbEdMc3JLaWFEdGZ5?=
 =?utf-8?B?MlBka2Q2M0hudCtuUU1mWERLM0JiWUxnZXVqSEw5TXVWa2tid3V1RFFDOVU0?=
 =?utf-8?B?bjBWeW9VcjdGdGlnM2Y2eWJkeWU3dFVtZnphcUd6ZEdsODErRWZ4ZU1XV1NT?=
 =?utf-8?B?VC9oQzFpWlN1SVVQeEpHcmFTcjNXS0tvMGtXUEFPVDhTdkVxbkQ3WXlSdzNK?=
 =?utf-8?B?RVR1elcxc1RZTUlJbExMVWoyUkpMbmEwUVVqbXBLQVduSm43bE5PSlpnRElj?=
 =?utf-8?B?U0sxWmh4SVB1cUN4Q1ZQVFM4TzNnLytYdE1PYm5VcEJ2TWxOdzU4OGsyNjJp?=
 =?utf-8?B?N3o0WUxCLytPZ3piOTBmUFpyMENPL0FtcGJGbWhMZnpFcE9TbHFiWFdQdlN2?=
 =?utf-8?B?RG44NHAyak8zckNaQklzemc1cCtnWWJXT0RkU0pmRitzK3AyWWJUNm5KVmk2?=
 =?utf-8?B?OVpLSGh3NDdWS2FRejRyb0ozaWMyUE5JQVFKV3hrZUwwZC81eHQvQlFEblZS?=
 =?utf-8?B?c3VhWnZBTGM4Rzd5REo0Y3JCaTJwUWpWSDVtQ3VPaTZZS1FGWGRwVVBMUUs5?=
 =?utf-8?B?dUxGR2xsdGozSmFMS245L2ZFTklhanY5NDd3b0IvNEtneWdyRSsvWE1ELzI0?=
 =?utf-8?B?T1ZyUTdWT2pvOFBTWlYrWjNBKzduNG9Vdmx5UGdwQWhrTk4xK2RFUWViR250?=
 =?utf-8?B?N0Z1ZUVyZ05mdUp1TjAzcnRmRnVUR1lTWjhxRjJEeCt5eUwrQlQ0MjRiUWcy?=
 =?utf-8?B?TTBtc1dLdzMySnhjQkd4WVhhQ0s0NzQwZ2ZBaUZONTBYQ29tTVdUV3U0Vmpp?=
 =?utf-8?B?SVVMVElJVlBlWDlDNnl6MG5iaS9RaHZkUnJSYnR1VjlLSEp2czlONSs2V0l2?=
 =?utf-8?B?N3N1eWVJcnd3bUVqYXFqdzRkS3VnLzhudENHZUJpdVNvR1BCZHgxTUV4UUpo?=
 =?utf-8?B?YU9DbXFHanAvcFBLUkV3eDY5dzBYMG9UNE1GM0dSWTJ3NnA0VjI5ajNidGlm?=
 =?utf-8?B?aTZmRmR4MjgrY3kzTmRlQ2ZSNHFoOHZaZFRqc1ZPNmlsR1I4dXZRaGUrZlRm?=
 =?utf-8?B?cHpxU3llRmllS3FqaVh4Y1RmMjVTcFYyNmNaVmd6ZVd6eWQ1Uk11NHF2aGha?=
 =?utf-8?B?anVER1JIV2tlTHFYcERzbDcySWJlZXE5dW1iU3FQMGRTNDlPZ25UMURWWFBT?=
 =?utf-8?B?eWNsR1I2aTk1T1lyYkRJMGZ0WDhSVWpYRFp3eXZGZ0gyMGFuQnorenk2a1Bj?=
 =?utf-8?B?aEZrdWNJak5zc0pMU0Qvd0Vtd0ZLQUwvd09kdmtNNGs0RHZQOW1BNHdENHN6?=
 =?utf-8?B?U3VsV2N4anEzeUM2TzhLOURMK1YrR3RvemE4U1BTT24vSUdIMEpSb0xZYUtr?=
 =?utf-8?B?UTBwZU1FemtiTWs3c2dwVTI3cUoyVTE3aEFXNG5LWER1alFRWjk0dEtwNi9C?=
 =?utf-8?B?UlVTTVZFemEyaDRTajVaZEFTZk5UUXN0eEtBR0s5WnpvZHhEOTE3NFdDTTFj?=
 =?utf-8?B?NFJLME44QTdseUVCV1NHTGtMMnQzeStYRzI3NnRSNk9tQnorMngxYkhTRlRD?=
 =?utf-8?B?ZXM2eEd1Ni9TOG5JODhMNFB5NUtNSjdMNG4zbWZYMlhpb1NQUllNZU5MYkE3?=
 =?utf-8?B?ajlzWks0L29ESjZxdUhLMnlyUHZmRXQzVC9jOGtkRis4VVpOVXc4SlNBTEhq?=
 =?utf-8?B?dXVMcmo0SGc4NllCcUFhRHd5eWQvOFVwUWJzek4xVlhPcGlveGExdlZIaXhW?=
 =?utf-8?Q?zNo/88WxzYv7fuvChCa1ukI8F?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cba5263a-5cc9-437e-ccb8-08dc11c24188
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 09:55:20.2372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8M34SeGBzpJWutggZkiuxpeRU9nLKtTWiQaHAz5Dw5aEBa76xpasY8BEPAmra9+P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9049
Message-ID-Hash: 2BH7QVZZYON6BYJDOWHEWP7PP5JAER4P
X-Message-ID-Hash: 2BH7QVZZYON6BYJDOWHEWP7PP5JAER4P
X-MailFrom: peda@axentia.se
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2BH7QVZZYON6BYJDOWHEWP7PP5JAER4P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi!

2024-01-10 at 02:28, Kuninori Morimoto wrote:
*snip*
> diff --git a/sound/soc/atmel/tse850-pcm5142.c b/sound/soc/atmel/tse850-pcm5142.c
> index 611da23325d3..f280ec597a08 100644
> --- a/sound/soc/atmel/tse850-pcm5142.c
> +++ b/sound/soc/atmel/tse850-pcm5142.c
> @@ -398,7 +398,7 @@ static int tse850_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = snd_soc_register_card(card);
> +	ret = devm_snd_soc_register_card(dev, card);
>  	if (ret) {
>  		dev_err(dev, "snd_soc_register_card failed\n");
>  		goto err_disable_ana;
> @@ -416,7 +416,6 @@ static void tse850_remove(struct platform_device *pdev)
>  	struct snd_soc_card *card = platform_get_drvdata(pdev);
>  	struct tse850_priv *tse850 = snd_soc_card_get_drvdata(card);
>  
> -	snd_soc_unregister_card(card);
>  	regulator_disable(tse850->ana);

Along the lines of what Takashi hinted at, I'm not comfortable with
disabling the ana regulator early. If you want to proceed with these
changes, then please also change from

	tse850->ana = devm_regulator_get(dev, "axentia,ana");
	if (IS_ERR(tse850->ana)) {
		if (PTR_ERR(tse850->ana) != -EPROBE_DEFER)
			dev_err(dev, "failed to get 'ana' regulator\n");
		return PTR_ERR(tse850->ana);
	}

	ret = regulator_enable(tse850->ana);
	if (ret < 0) {
		dev_err(dev, "failed to enable the 'ana' regulator\n");
		return ret;
	}

to

	tse850->ana = devm_regulator_get_enable(dev, "axentia,ana");
	if (IS_ERR(tse850->ana)) {
		if (PTR_ERR(tse850->ana) != -EPROBE_DEFER)
			dev_err(dev, "failed to get 'ana' regulator\n");
		return PTR_ERR(tse850->ana);
	}

and zap the explicit regulator_disable() from tse850_remove(), which
of course makes tse850_remove() empty and removable too when combined
with the removal of snd_soc_unregister_card().

Cheers,
Peter

>  }
>  

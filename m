Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C534869154F
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 01:23:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 290AD843;
	Fri, 10 Feb 2023 01:23:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 290AD843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675988635;
	bh=3KhzouuVl+bXYZDo/pt7VZhtHbIHZwrEbSNoEoHqOiE=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HKYK5xlh/U3naNV4v2a8AbFOIghuQrRvbPijoEcSEEGDeKl7f1MpvqcyB1dd8gCWE
	 Rd1AM5Jy9Gx8JAo0ljgToKaYyiUiSTwufKL7xrQ5YwUwQ5SHN/mI2qrWxDg718V51h
	 UcU82YTH9Uy/c3Igb9fmSOgTsbpiw43rdcXNtgl0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EB48F800B8;
	Fri, 10 Feb 2023 01:23:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26321F800E4; Fri, 10 Feb 2023 01:23:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20721.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::721])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9AC2EF80094
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 01:22:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AC2EF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jeL0/2G9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IS2If1Yl92XIqE+iPEVKVQOxCvd2hU2r/4tMGlAWP07d79TunUSw4WbZHto/oAKebbR7reB+d9oUeqJCV44OEpapmxPxxB08i+MALQXbILQdBYLmKklKarl+YqGDgzKrexMD5FgIlIHYVRAhe4rUMctLB3MW6XQQj1q/H6H1ArHWkuG0xavwIu4T3lOj/GrN1Cm+KPx3/tw5A2t+BnSEDEjp/4eS12xLIrigcfKYeoHrhpk6i0RIQH05yHpEyTJAcwntlUVlWXZPPtVfNtgIkDqaiHnxMR0cYY+ZQCG+/Rym6HDvG8scXyjDu9Az4L15qD8uXZQr0sn+gw/972TtaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzDgPIvX8xgAC608dGMnSNKWX0ldgVR1mt6ABDj+0xI=;
 b=AOQYHSrRjTzczCk+yFhloTkNQ2f3jTXDuq9cp/T/qIM9tRnkXY93WMihR6VUS3O5Fxorx7due+a3Co+3NN+w7BXFpvPnuHRwA4f7oajbHCSAoTnAqcZ6ii6bh51zKOKZ+UBNoATOG+trsvgTHsI7VzbxuBkW3GL0qp7QKrJl4ZCaXL+mKUeVYvQOvZk5eGiw1344ugUeiQsbh/6bBNm7c1Tu1rkaOaALniy9Sv/0U56SFUqJj6RYHEaaZpvMWOT4ADzvsKafXQT88XqmVC6boz56M1hWkuzsp97pYj57L6KmIUqTfygK6Bwwi7eOvaCmUdE4ZCNeZbM2Xd4gdM2ANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzDgPIvX8xgAC608dGMnSNKWX0ldgVR1mt6ABDj+0xI=;
 b=jeL0/2G9XyUtUqaWBn33msxEhbmpdoz0nc4T8jBvVnID/mEw/66tlFMFfPv2Y2DH1iIQzKfJtVwMbwj4weqGnX2cexUVsnZpkU6jI8V0sjD0U6Di1uVxE+7DvC3G/Ggya11eQ85xoYBLQ2woN4xzhW819i9cirrA/Zk6wQPPLR8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10280.jpnprd01.prod.outlook.com (2603:1096:604:1e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 00:22:38 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%9]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 00:22:37 +0000
Message-ID: <87fsbe1i9e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: renesas,rsnd.yaml: add R-Car
 Gen4 support
In-Reply-To: <072724aa-2bf3-32a6-dee8-e74c74b01019@linaro.org>
References: <87y1p7bpma.wl-kuninori.morimoto.gx@renesas.com>
	<87v8kbbpl4.wl-kuninori.morimoto.gx@renesas.com>
	<072724aa-2bf3-32a6-dee8-e74c74b01019@linaro.org>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 10 Feb 2023 00:22:37 +0000
X-ClientProxiedBy: TYCP286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10280:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c221d79-5f44-49e8-ecd7-08db0afcea09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	57xAQtKwH0WNCN59E2a6BglCfw2noL+FuuuFN9XkMWRBWULG0+ljWF344MXNAW/VlY/Y0pSaHfstfRem9VEPpZQce17m0vPCzW+IRZDyJy+Q3cXXU+lZWVoeNwK/8H+1yhuHA/sf2vkpxtdrNDBfQxrRIkyCELg4ZRtvZkAUzdz1AKGSkv06NqzYjOc02/5TB9uY+77SJMw3giATBzMlC48RSVN8lor22KwsRkwhW6j/jRyhUKCfm8CM7YBDDqhUszZtopE9sDU5jbU5HO/c9TC4Z/+EGoxv13kDFb5ifbld+KpCwOAV9TE7r6wlkxydnmGWkpuug+5KhndNplkkwa08DsiahlOVABPMB9LLGpKNmjmvzp3HPn6F9+ETihyT7SRjjGTWwvldCnm/1/XFsFbnTSngO2326wYI1toC9ngiL7Zt1S2SZoaiCbwVKF/izPqoarhOk6qm13ChYDLlL0u8HBrY7Atiuc3f1wDnZRdeW3wl4MOIeroT/uxUgikVH6sD/pBoDy1MXYHFP/HWrSd0zpyu2TU/XdDasCP1SFIJQ7n8LcsSJ+e/JcCIYKdLygSFO3kh6tOqAd5S2KumBYMSrTVbYyy10orXIlrdcrtc1yOczm2ltbgrVkTzh8cl/AhNltLch1vxbjJAWwD2G1DiiZIH8robAHj2M1oPabxeqJYBz8ztBB3RNnEnWFtvXxM/M8TICUwcSuSePHE4LA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199018)(38100700002)(38350700002)(5660300002)(8936002)(41300700001)(6916009)(8676002)(66946007)(66556008)(66476007)(4326008)(86362001)(4744005)(2616005)(316002)(478600001)(54906003)(6506007)(6512007)(186003)(26005)(52116002)(6486002)(2906002)(36756003)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LgIz1iK26pzPfMe0WZFACQq7CSf+ALR3AVv9omMySbFo9FXUlQ1f5v7ZsTe+?=
 =?us-ascii?Q?Xy6vokxhaO6Hn0k4vXIEEoF7EKmAzW+pA9vooAZ6t/hCLQIF9W11ZCOMV2AC?=
 =?us-ascii?Q?Kbpbw4CMuh0o/iQiuosaX1Y8n6x9JAr+a+IcTcc/vj6a48E//Opo8UqoZCsD?=
 =?us-ascii?Q?bX3gwJ1REfIxAR3ZL80DRznF52DGWYrFYu6VFJT/57praUpTYJpFqJj2JiAV?=
 =?us-ascii?Q?gwnyM3gSU1aAk+AOnbdanVw79B63nsN6kV48Pi8EuHSeUMqAISlxAfzbWBDz?=
 =?us-ascii?Q?1nLcXEhtl/ebtkDtxjYa6TBgzMz9shCMVJng60Gx88SAK/DUNSgSWHEWMCpr?=
 =?us-ascii?Q?QekzD2JQ9Qd8lVNstIsuk8Q4GuQCWheDOqGsKBKGhoDtIsKy7xKq6qenBpR8?=
 =?us-ascii?Q?OVtFquWjvZhrIVKyNEMF20xShiE0npAtj6QL2iZgI//T1CuzKjvtIWBZQRpg?=
 =?us-ascii?Q?QKbMrb2XjKXaSVKODOlPW2Ft2435ErA+iKbvfUvkxJKg5Jkf9H3U/TmRlKp7?=
 =?us-ascii?Q?k6LgQYoMWosgdTjDn0xcEkFt0dOUxpRAkE8wcvwcv97ljZbYIkNlG6mruPQJ?=
 =?us-ascii?Q?Atw63k2YipaT+2K9tbLvn1JBiJ6FMlTCC+maK93cSUS70lzbAWhNuzlQ6bFr?=
 =?us-ascii?Q?iV2ObfJ49JDJIH51u6oFq8jdlTtSkWUs/8iGdH70I4G7R04U5DSIjNFf8a9g?=
 =?us-ascii?Q?bCx4PyTxSCVpHh6+EZu6gWxhaKRqREEDRmF7DQZzp5bwvrfcwAalwXpJVkE4?=
 =?us-ascii?Q?VJieluTCr12DC+W3/+ftIaRZHxF+m93O5zDmwF1xQbxSREDofIuAf7yiT3CO?=
 =?us-ascii?Q?77w9w7oDLLTEnP29vY/BGycEH3ZcsotUPv0z8jqK7s4Lg9YAUxnA9aNEZucO?=
 =?us-ascii?Q?CBzaRdbbqXdbNkWAdY2y/0vwYIII1j/GsZa+Lru0Ty1Hu2y7F/reD1it5fEL?=
 =?us-ascii?Q?Lrbiyp9y5SP8VqVhCynCxR1the6oQhFD45OWAMQYiX24ECF+Z9t5CEoVWBcS?=
 =?us-ascii?Q?z1INSXZfqxoO0NQYlF8FPNLFo7i9bVK44I1YGnf4PYlMTA13enxKG1ILp1pi?=
 =?us-ascii?Q?n/0Y5jPTNopIXCZp9lEJWYvR63f9rh+kxt0VwNkO+Hvl+Zl0Fl65JF+3Cun1?=
 =?us-ascii?Q?xLGxZ2SaQQupuLMwL/q7e10SqWdBHJpsNq8xsLTwko3otZBGqk00fBUJ1ISU?=
 =?us-ascii?Q?Tx/yXDx04/ndsk858j/q/3AQ1cmKERShu2Z9squj/OyYK5VB5XzRy5DVrIfS?=
 =?us-ascii?Q?I+k2qwDcKrv//6u0wlXWRJPu4gLskbZzf+3LS4g1heOmxWiV/1gPXRr3RzpF?=
 =?us-ascii?Q?oTuf+BGxvaXDEj8/bndl0t5+0IPmGGOh9uSx1kbnkeaBVQ58R5lAKgGGf7Gs?=
 =?us-ascii?Q?SsmJd4NKgTzrKVF4XIhvFZwseVz5rSq42SwPa6dtnACOvMc++UrkT2J1rXhy?=
 =?us-ascii?Q?fIp2liqUFOZBARcWTm3PdJISnZKxJGkZqwejtmqeGBPhCR8myesdReZAHX4X?=
 =?us-ascii?Q?0PN6JiO/5CVUMPPSOe3Wjc+9ISnoi1nibvxvyYyi60H30lys3Mc0wmT+q4mh?=
 =?us-ascii?Q?hlRmkPPzqRguEe88icjt+V6u6eGlkuikGuMAabiyuESI4HBcUC+YRFK+fGjb?=
 =?us-ascii?Q?fiTN/uFXmb0ABAat+cNm9dk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9c221d79-5f44-49e8-ecd7-08db0afcea09
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 00:22:37.8549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gfgC/Xjf5CepabvqFEJAaE87/xV1U25o8mWeKzp9jFYQrfxRFv6ivSEDDZv7YbVqzcJGNQ8wU+l05oiQPSgAZxc2eaRH75Wv8SjuwrzzoRTVqEqLUVhXBxdhfaIUMmEz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10280
Message-ID-Hash: QUATWQFZVUVZ3GHBKBPW6OIXNRMYKSCY
X-Message-ID-Hash: QUATWQFZVUVZ3GHBKBPW6OIXNRMYKSCY
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUATWQFZVUVZ3GHBKBPW6OIXNRMYKSCY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Krzysztof

> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > 
> > There are no compatible for "reg/reg-names" and "clock-name"
> > between previous R-Car series and R-Car Gen4.
> > 
> > "reg/reg-names" needs 3 categorize (for Gen1, for Gen2/Gen3, for Gen4),
> > therefore, use 3 if-then to avoid nested if-then-else.
> > 
> > Move "clock-name" property to under allOf to use if-then-else.
(snip)
> > -  clock-names:
> > -    description: List of necessary clock names.
> > -    minItems: 1
> > -    maxItems: 31
> 
> No improvements here. Your argument that you need to remove it to
> customize is not correct.

???

	Move "clock-name" property to under allOf to use if-then-else.
	^^^^

"move", not "remove".

Thank you for your help !!

Best regards
---
Kuninori Morimoto

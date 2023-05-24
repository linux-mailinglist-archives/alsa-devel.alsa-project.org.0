Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FE470EA15
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 02:10:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0906204;
	Wed, 24 May 2023 02:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0906204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684887028;
	bh=v8Sb8UQW70dTN9q+vDg3PjrcL/sXwOYd2TZQqsxGLJc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tpIPxz7l8GingCNzS/hQw+Dwo58eWpEmHVTs08g69Czfk5l+5NnR/S0NbgfWLiwo5
	 qJ4/1nydfDKBinCJD5wxCfpTdXCX0mziP+p7TmbwORN36Wa2Dz8AvGI7jEgsIp/02f
	 gD5WMH4PkEH6F+YkTWCy7cz6a966d6trSc6T/+3k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A615F80086; Wed, 24 May 2023 02:09:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92CB8F8016A;
	Wed, 24 May 2023 02:09:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5F57F8024E; Wed, 24 May 2023 02:09:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A655DF8016A
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 02:08:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A655DF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=W8DrO472
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEW4e1XJdvH6T9DVfBmXhJV93fEyJmP8omLgX6DUjk5+sf5bv8Tw65qz198RBFV00amxGTRlE3jTSZ+CIgx31zDVep4dp8NnFXstK9FEY9FHImfY/MHyOtpYag6k/xI/pFNqYwoNx4ZlKoGUvkMd5V9FMdN4RFiKSxP/AYpnDnyxWH6fdQoasVKwDF9y5ZqJt+I+Ptz9g3stfceInN7ATSboEHK1yLLWO4bPIR+jSiDDEFANxAL3Q+HA3fEHrJ8UI//0FCDBNbmGr3So/ZFL+fTuTVtm6qDC6NtL19kQAP2bTKOM3G8TdNQGoa6ok/WmyLRFveeedkKUS1I2OKZJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+a1fXH/jM+Re5JmujYU2n2F7xJ54XXaHswvz9ean8Q=;
 b=i0O+F1+SBQl4oUMocRmv0vAPb06Q8aPS5srx1KPjvYQwVfvOj51jr10FEbedDXBywfOuoUB+icHlwozPXrpJAtTX3RHZKnv43TR7K+wKPxNJzVYY2pGJb+3TYshSnPZAaB6t1HEH2JHj5mPSCI9AUlu92o9zDwdTW8MCqr5AeW19KjO0DGmImCDcElH0pA4sIi49E710nbq/pakxTPjSy0rYBxnMufPUGMP6/4EO/oWgJubxTzlDtQlbL9KlBWRBUh/TpTwRMJJKOr5GMYqR9phlK1sbDed8DuxsgPQbOn/Mx9G9YUasYeOHDum0p/YxzHedq+iNDW2YSXRZFPx3OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+a1fXH/jM+Re5JmujYU2n2F7xJ54XXaHswvz9ean8Q=;
 b=W8DrO472UyzDwNI+0bSKUSWz5bwUKZ8iPQwpLDrpMqEtbulPg0TcOv9cE+zXK/Q2hEYO8R72aoh5XqORC2b9jmpnZOTnV9jhozO/YvQsjh3kThf7d/dAmg4m+BWS83d+AKEAJt4M/w0z3PxxtSwHqFYUvcfUDGrvMjc7+/G6DyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9662.jpnprd01.prod.outlook.com (2603:1096:400:230::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.14; Wed, 24 May
 2023 00:08:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 00:08:50 +0000
Message-ID: <87mt1u7fql.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 9/9] ASoC: simple-card: Handle additional devices
In-Reply-To: <20230523151223.109551-10-herve.codina@bootlin.com>
References: <20230523151223.109551-1-herve.codina@bootlin.com>
	<20230523151223.109551-10-herve.codina@bootlin.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 May 2023 00:08:50 +0000
X-ClientProxiedBy: TYAPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9662:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dc2cd7b-2052-4e69-293d-08db5beb0da3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tNI+sB0Iim8rRqr+WTtVWYFtZvGsOLN43j9aswC8X8+UI/cqUOlbx/iBoBqGC52d0Z3Cfyt9UNjjtLn0+IaR0PjdDOyOKXlsNBzEH4Hkq0ljLwLjmLYsXFb0z+wVEnlFu8judAxI0ZBM488edGwGpbpovmUqw0gvfJeCxufDb0xa8Wv5yEy6fBF8jvTVcRZrHntwM+5Iwx3pWvqnkeUolUHCmKzchtKb2Z8AJpPTdcB2HeLCVSl7zjr0zFwQDDwni9CxzM402GJ7NWDmPji9jn0hyCx9D4mVxw1XB7j13YznURajJtslBloLVcEtOSaA+4ESn7rBgbK3H2o4+zjYNXEjMQCSf2o3DbzH5t0xqyE4LSWvPnHlDI6WRC//geSJ3IdjblxrmCYz9+U5saxR3Ak9/PzvzFVQXLLeKxNCjLiBus2mrmtGQ8DI1PYxTFIRAXMtvMV4j9SeDyixEm7lKtDJw49yZE9bciH8Sr7V10mvqddiwmePM0Qc9Ex3V8vUBEpt+7gxX1PFLQhbj+BowZFvKQN66NC7l1Rkv4vxqCA9/wQ5hlFZMtuxQyfy/9RfR2TT/m1ixEyUrcUH6123pqe+OSk5uR+Wza5KjzLBTgI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199021)(7416002)(8936002)(8676002)(5660300002)(83380400001)(186003)(6512007)(26005)(2616005)(6506007)(86362001)(38350700002)(38100700002)(6486002)(478600001)(66476007)(52116002)(6916009)(966005)(4326008)(66556008)(66946007)(36756003)(54906003)(41300700001)(316002)(2906002)(66899021);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XnSTsSsIYS1Vy1mxjgx1D7+1muwRLljFdqYY9c51C5Cdn/TCHTLWL0R7yydO?=
 =?us-ascii?Q?MjIGyj73TcQD1wTDxvuuqcOqy/x3FLesUK07AZLzQuD+yFFOQaHaWxBPGhgG?=
 =?us-ascii?Q?MmpbBm1Nz5r6eO71UMORzzMa92eTWGdAazP0kvc0ZbqIobGrdPK/3NFQswXZ?=
 =?us-ascii?Q?zx1JQd8uTK7H1O+Xsm8Z10l79qpWvwmcSfDtCMrfVrSqVYpyOv2ocVi98DYc?=
 =?us-ascii?Q?t6YOiRhJ4ffx2z4HzTDqx1Dj9uQBJVfPO0VPpiPEqE9pArz53vFGRJtcYWsi?=
 =?us-ascii?Q?FUAUqQItS1MNFAZE4lhvaGMhzTqSF6wiTWK9ZtmYDr5VoVoLPGh95kMkzSOY?=
 =?us-ascii?Q?HX6Kxwx9+gyzlJ5B6Jb56GcW++SoWnJ/d4tfY1+di+Vjwa2mZP6OL5f+TARD?=
 =?us-ascii?Q?7s4ZYUSxkKO+3hoR83r4c05S6ErH9tsagbEysxbDrJHTQhT0o+t2vNZjIXzI?=
 =?us-ascii?Q?XcvW0ObuCdTjv7DVmugCEvXqVlRJGWMd82Kzd6A4NtqOzbQVddN/Jf+694Cf?=
 =?us-ascii?Q?sr72dKEt/pllsON4dAHTicX8/tVmQI2Kej/3kR0ICCp5zJzAWN9m9elMrWKz?=
 =?us-ascii?Q?sAKqC0OJDCXHCbT7WpmxABAizf2dD+F9S5UxWaCvREBW08+EEToACp7/2BcJ?=
 =?us-ascii?Q?HeI3q1lN64ipL16CcufIY7nsR0nOwxcpy9nMXf3SFXhzNzo4SqywYIntwkXl?=
 =?us-ascii?Q?2WbQEmDAaAhRbD1HZNt51fFzvSiPrv5X0nB/oL1BDQLHbDzFzyA1Xy1N0Tbe?=
 =?us-ascii?Q?zo3O9ZQ8yUv+AWEbQa2vgKbiSWfHiXkbGx8+Gomqcnu0o0eTkPfvE5wHB42t?=
 =?us-ascii?Q?czYdEuow6GhUm7P6sAlzY3+B3lL3kfQt6x9pwGcuQK8tHgCkOQphSW6cQC/5?=
 =?us-ascii?Q?3YM8wes5Sz1+QasNQHj9XC1r3HDFHVnQOmpljsnvC6gshGZGBGMI0GToJ9rD?=
 =?us-ascii?Q?QZcRTd322LEYR/L1aQK9a/Sf8cfyFNUVEvjA0MwsdVS7oZqVGWepmNHWE0QX?=
 =?us-ascii?Q?YYpiSEqSjl7v1QXn27QpmrXYPyTNxT+tvIZjsWf5rK+oRiQ368QYJoNcFl0A?=
 =?us-ascii?Q?Ohk4TT4uMcwW9CVzdvOcvO3jevuOm7YtaLNwqxtiqjnj9yetD9+tnh9zisSP?=
 =?us-ascii?Q?meDxtAi0LIa1Pd+W7P9y7Id8glHZsjLcUgVgWYL4E7Qa4Y8nYV+ChTv0QK4j?=
 =?us-ascii?Q?yrqBDFQ+03fylHhdzhVTpyAxQIkg+vT+hLdmaSioGOdjwpB9NPxjlFXY6VHA?=
 =?us-ascii?Q?T+el1cqk+D4JY7FNVjQCEyB6l68gNWOMyO5NjdwtL75o00DrRUMsCVTXOUOL?=
 =?us-ascii?Q?NryyvjRRDTS6W4JrFgMpKBz36/Pk4yqJ/smtW4PqJ/fCVMgYytT5bkO80okZ?=
 =?us-ascii?Q?/XRoeuT+bkWAXxXhjfU786WMhhaCs+XLThV+cpFaEgPCzwvqF6PEHHSAuhkc?=
 =?us-ascii?Q?ZagQx6GkqWJssWpsCAAtkJfkJRhGDVIPMm68eVOftqKy//9bphecs2VCfzYv?=
 =?us-ascii?Q?1D4bkm1SZovI6nrkQQwW1ZuYPiDkiXWgQwi4DRzna1rQviW4lmovBtjU5P8E?=
 =?us-ascii?Q?A5DwHvyn6EU9IHa2eWtzZfOOoODzqSLzFOl2eoh6lTR+t7v4q2yqD5MUW/1A?=
 =?us-ascii?Q?eDp+5dxmtAR8GgwiuEv5pRc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5dc2cd7b-2052-4e69-293d-08db5beb0da3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 00:08:50.8285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dTjhNs5BjB7ttYIzNXRFDc/p/0AZ1euRrC+MJTkVRvOT17t4uS5nSqzIGeXgikttcsMQ1EqUgnBxAleLX22Hk9bSDBrriHR1weduwg3x6Q9zu5jWnNWivXstWlgMi7Z+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9662
Message-ID-Hash: G5RXF5QPLIKVAVJB73DBB46U7P4YSLB4
X-Message-ID-Hash: G5RXF5QPLIKVAVJB73DBB46U7P4YSLB4
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G5RXF5QPLIKVAVJB73DBB46U7P4YSLB4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi

> An additional-devs subnode can be present in the simple-card top node.
> This subnode is used to declared some "virtual" additional devices.
> 
> Create related devices from this subnode and avoid this subnode presence
> to interfere with the already supported subnodes analysis.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---

simple-card is used in many boards, but is old.
Adding new feature on audio-graph-card/audio-graph-card2 instead of simple-card
is my ideal, but it is OK.

simple-card is possible to handle multiple DAI links by using
"dai-link" node on 1 Sound Card. see

	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/sound/simple-card.yaml?h=v6.4-rc3#n294

Is this "additional-devs" available only one per 1 Card ?
If it is possible to use 1 additional-devs per 1 DAI link, I think this patch want to
care "dai-link".
Or adding temporally NOTE or FIXME message like /* NOTE: it doesn't support dai-link so far */
is good idea.

>  static int asoc_simple_probe(struct platform_device *pdev)
>  {
>  	struct asoc_simple_priv *priv;
> @@ -688,6 +731,11 @@ static int asoc_simple_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	if (np && of_device_is_available(np)) {
> +		ret = simple_populate_aux(priv);
> +		if (ret < 0) {
> +			dev_err_probe(dev, ret, "populate aux error\n");
> +			goto err;
> +		}
>  
>  		ret = simple_parse_of(priv, li);
>  		if (ret < 0) {
> -- 
> 2.40.1
> 

Calling simple_populate_aux() before calling simple_parse_of() is possible,
but looks strange for me.
see below

> diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
> index 5a5e4ecd0f61..4992ab433d6a 100644
> --- a/sound/soc/generic/simple-card.c
> +++ b/sound/soc/generic/simple-card.c
(snip)
> @@ -359,6 +360,8 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
>  		is_top = 1;
>  	}
>  
> +	add_devs = of_get_child_by_name(top, PREFIX "additional-devs");

I think better position to call simple_populate_aux() is here.
But __simple_for_each_link() will be called multiple times for CPU and for Codec.
So maybe you want to calling it under CPU turn.

	 /* NOTE: it doesn't support dai-link so far */
	add_devs = of_get_child_by_name(top, PREFIX "additional-devs");
	if (add_devs && li->cpu) {
		ret = simple_populate_aux(priv);
		...
	}

Thank you for your help !!

Best regards
---
Kuninori Morimoto

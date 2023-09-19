Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6167A56F1
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 03:20:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A65BB886;
	Tue, 19 Sep 2023 03:20:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A65BB886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695086454;
	bh=0vjJkC4zdwr6BLrxY6yuq/lQ5xEVgm1J8HsX+OYML2Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tl9UdC3LI8MWqbrhZi7vedgt1q+SDH6i+GM6fBT5RhMiajHyosbgWSijTlkP0u1Dm
	 /m05YsNbs7B9srknkNd05VxxhH3p8Ex5PPUrS6zHhftv4n5ZP2fMkdEMAhWHZeItGE
	 NjYdswyMfXqkNWx6O4OZuC2vFpmAHySZL3b8BDQY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 384D5F80125; Tue, 19 Sep 2023 03:20:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD5F2F800F4;
	Tue, 19 Sep 2023 03:20:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19ECAF8025A; Tue, 19 Sep 2023 03:18:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20725.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::725])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88185F800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 03:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88185F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fe8sw9oT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9/oo3TtmAK7oOKtbLdT36e1GpqYHPLgc+HhwhQzx01j3iYk5jX7o/bZvm7Pa/ZocWIO9thx9lKQ/WtztlOvVo4gcAC7A1ibA8iZj1/e4EIUoMW5zov3H49wAWtQX9MKxNV0vpvx+I8ZS48JDhQJ0dCf6J/eBcGh84ec5fK4hinR5MSQjoLnF+ycII8WjIE5G/MkIsSFI5uX/UhXXNXkkkhpJHlXLynCDxt8QV/LLaB2CTdhydjo2F9okbdKIUTqbOSg/T9WquwsrIYaKBd5DjnWidz6awXE+uwxdwleCEFxV1JWATW0025d2+cgjQKuAc786LieVp3UyMeVnoAvzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovqrI5HBLN1P60lvXEIjl8G1EeYbLSWHTEq7f87Vc/8=;
 b=M0xNSevfEuV7luEgIUtYIbhoP+m0fqwXyjVx9QUJAAsWbJBVpScx1L6XbgEzXV6vfN0xXSvfRT7XRYcgKOIYTPyhKhMsrFaEYZ77jDV66azzxX05DWaLTOBcxrW3ps0HCODz+511auL4JqWRr9k6kzIPjew0TWYn/gQzP00X36/V8A8l68SL7zOh52N0b29X+f3vXaqMawn87xWHf2LZSvgv1x3RDtxd2ZFGqHY1KUfOfH1DNbayRfKMsDVtjjO2D8af69MQns4WN+5yGfgXPkzEp7ndFklYbEfYI/EocGAKOURVh0ijejcMP+CzGAKVL6UIFc1sfFG3uoSuMa/j3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovqrI5HBLN1P60lvXEIjl8G1EeYbLSWHTEq7f87Vc/8=;
 b=fe8sw9oTKFV7ySwhczvFZPIgS6B4TpE95K6GfcdYGND3LAqGyEDnae2FiL+mEv80qO9xdiR3YNqvvVvHvknCsfo7GWaxhfgIm2khhlnaCGKC6Pts9ozFEZ06uSR0NfuVcT+t5/J8hGOYuuiBJtGWkg29TWAUsyyCiPPyH3MUrsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9896.jpnprd01.prod.outlook.com (2603:1096:604:1f1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 01:17:45 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 01:17:45 +0000
Message-ID: <87wmwn6jwn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Robert Hancock <robert.hancock@calian.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: fixup simple_util_startup()
 error handling
In-Reply-To: <6dcf84d9-aff9-406e-95b6-2ab217d3003e@kadam.mountain>
References: <87zg1opcwt.wl-kuninori.morimoto.gx@renesas.com>
	<6dcf84d9-aff9-406e-95b6-2ab217d3003e@kadam.mountain>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 19 Sep 2023 01:17:44 +0000
X-ClientProxiedBy: TY2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:404:f6::23) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9896:EE_
X-MS-Office365-Filtering-Correlation-Id: 8718dcc9-890f-40aa-9105-08dbb8ae3a95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4Z1+4KlRQOk+QosMsvpDfAZzCkiATUYZ/xEsTefMoOsoQ63IST10NE0WwfetxNH+qbTlex1MZz6JC6AbGkZcEbe1p8Cp8KGDT5KOuHZXj3exZFXV/6zkZeRYxCy+snigkPwxiq+dMQBHrSkKJi3xeWpyCPwnvoA7hjob0dPLnQvwmv0m1IrQ+Daow32vupr6G+t+bCYBgopAF0CUglG1zX7EKybdj2KXNJV1Jc3JqjdHYdvd4f028uYZsHUyg6g467rQRnEl3Cjc7Iy0zZ09Bw93wtyHOm5uRVPWLuvwkqQqlkuBUb6n9PiRR5EIDfjIZsJ+U9awBI/B1x1UzP8cmGp0oKUlWDzpEIb3edJUlIqNm160e6V4j92+wxy5PAqpbmEnqnajYdp9yDwA+xlhX4X6MB50tEcfdjA0HTG5oGDs4gAOf5Cnv6zJgz8lHkHIirvegYogBh/eIDvswOai18zXDHEPE8Dw3pGdbN2vLQ6RyHs5L6ttLtElAtr+bBMRXCjxFyfD8BimXMr09xrEbK7Cbca2XQJNN3tyLNsklO0k0ItSXuM53nt/+Mq61WnA8gcxt+dIn4b366Vo5pAjFM6r6shksm7w64MjOWFKqM489UHh+0oIFT46bJr9NY8+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199024)(186009)(1800799009)(36756003)(6486002)(6506007)(478600001)(4744005)(26005)(316002)(2906002)(5660300002)(2616005)(86362001)(66476007)(41300700001)(66946007)(52116002)(54906003)(66556008)(6916009)(6512007)(8936002)(8676002)(4326008)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y6Wf5XShsZyV9fa871WbWdBTTQV/rveh4GKjzcAniMsV/IRDlZP6LnbiCLvE?=
 =?us-ascii?Q?neB8hZYOU4ZCeMN0UtlRORLD4xCh545TpDYb1q04C3ncCKGXyYBLurQuppGq?=
 =?us-ascii?Q?/bkAbegDk/A5ctwWGT19W63GQpBjs8+2rDzdXfy8XHvfkoBMczIeOGlTcMdb?=
 =?us-ascii?Q?x7ZDOsYBnwgfG2nx43XtVKrdFonjliGmgIo5LRFpdGVrxaYy1fmTNZVG0h61?=
 =?us-ascii?Q?agdFpjMHJ/ysHvlSmPzXFn1sfn/SP57dmzg86to6/I+dzBoE9wBB07AuG1Od?=
 =?us-ascii?Q?IQflt5LH5IilPkbvTEJ66DQ8PrWDOECuxhI92NoZp2oA/zAaFYuQcmZsfOQu?=
 =?us-ascii?Q?J8YzSpNLEyflViOnh6py7e9XdLaImwWOz8sF6uQH4ZdWkDrLO4pmSc2EuU/e?=
 =?us-ascii?Q?rc7TNb0k4xImGNYeDJgGhkBsUmYDza8Ierhy9Wkl9U4CfBU4Wa5VkKG67xhG?=
 =?us-ascii?Q?yn9RLqpJQ/N69++ioABRSO2RfSGRL5EyUdhUdHut7e6kxdujag4ZC4zw2LKT?=
 =?us-ascii?Q?/yg+jj0bgQIUx4Md+tjAwRaY/klTT3Iakev5v1eaOwFq0aOYpHlAhOYP1HwD?=
 =?us-ascii?Q?SPBBFnkueIRDQ8/yKkVf8lXom3gObsK5UlExdinXzPKc+Zm4NvIWLi+oRNp4?=
 =?us-ascii?Q?xoffJNOmW+Bt6LpJRiAPWvtS0pmfQ3kQrM3vQ25UrrQPy5L2Zz7+cfw0utWC?=
 =?us-ascii?Q?hQ8+v9HsEHFRVxWOVacitf96TpREnIvgzJw2mNIAqHDuDQB2LBkWhuc9VuHk?=
 =?us-ascii?Q?0+uxFui7zs7CDJFMVn0eL5G7l9JI9OQSC8ihnycI2v0i7RpDZql/elsJ+2Fy?=
 =?us-ascii?Q?8trv+l5Q6uIlWcL+TLuq7kx4nJcBOw1Atdjz8EFqNDxTEmlxVNig6P8b4Kuk?=
 =?us-ascii?Q?j8LMq+VHPTEmxMvHq0ppcGD9jwciHHQC1GYAOBsNlqcWXDM39tBZQ4L+8rR1?=
 =?us-ascii?Q?kq2wQ41k7ukMm440mmyTfxv72F9asNvjVHPgHPPK1yHanqXtJ7BKpcrd6U94?=
 =?us-ascii?Q?o54csOPrRvNMvLwobzNH9Ql3Xb2YbYM7YsURD8BQOYeoO3tOVIxFso+OAy/z?=
 =?us-ascii?Q?ko2Ehul4ezW8OYw3u52hmEdnfR915qApm6Ohq1oYlgGBXachz/72FdZC0D1R?=
 =?us-ascii?Q?rTzm6CamtsbG9hdhu8Q8JkAFJScOeNSnQxCF+a2gos5xHBDqY+hgbAStFHEN?=
 =?us-ascii?Q?/MuXfYkgCqP00ic3Z0Qrw3+Hi60P971PVNggoP4k+Prwoh+5n62gWQLKPPKP?=
 =?us-ascii?Q?+5C18zKvsr9xLIaCHK8ID+GWVD9YIGGou/n/pInx6LUWpRGuWUZ5+4r0ElYp?=
 =?us-ascii?Q?9Jrpmk/PJeidaPd0EHluYAKUq4J2SbfgJMKl5QtsvAIl2VfnNQ/4ZF9vghcV?=
 =?us-ascii?Q?hLSHrKE+2Qcanp39ZXH+gIdwxkKoWLThiHEFzUy0BbHmy96vQZfI/EFdg0II?=
 =?us-ascii?Q?70BO4+CemFqRJVnXlDGbYpKHxoTS2hU0zKQl4Qhbfb9B/UB/hicqKfC5GcOe?=
 =?us-ascii?Q?hrt7gngTahOe4bVLieeDO5920r6HbukMsuvL5+P8eIvC4G2DGWt2fGcpIm7w?=
 =?us-ascii?Q?Qq11oHzpM+Ul/FJg4XO/EEQ4fJ9c/n9/6mdBwhaTeC9NKLBklR+G5E+AhtdM?=
 =?us-ascii?Q?ZaupsC7OwdZsLfpt/pA19Z8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8718dcc9-890f-40aa-9105-08dbb8ae3a95
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 01:17:45.1217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GhRvxsaOoBAgK2WcPkfUf7NBY6AO2fdAckG5upGA6NJGlkYIiRA8ncvLinaqoXCcU5ilqUrKKkNx8jF8q52RpBYKuXs0ugD6QsIXdsiTuAWzYJ6zTeH/GrVZPQa6bnA9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9896
Message-ID-Hash: EPENENKPJVCODDD3H2QKDJ22AJAFV2ZI
X-Message-ID-Hash: EPENENKPJVCODDD3H2QKDJ22AJAFV2ZI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPENENKPJVCODDD3H2QKDJ22AJAFV2ZI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Dan

> 5ca2ab4598179a Robert Hancock    2022-01-20  307  	if (fixed_sysclk && props->mclk_fs) {
> 5ca2ab4598179a Robert Hancock    2022-01-20  308  		unsigned int fixed_rate = fixed_sysclk / props->mclk_fs;
> 5ca2ab4598179a Robert Hancock    2022-01-20  309  
> 5ca2ab4598179a Robert Hancock    2022-01-20  310  		if (fixed_sysclk % props->mclk_fs) {
> 5ca2ab4598179a Robert Hancock    2022-01-20  311  			dev_err(rtd->dev, "fixed sysclk %u not divisible by mclk_fs %u\n",
> 5ca2ab4598179a Robert Hancock    2022-01-20  312  				fixed_sysclk, props->mclk_fs);
> 2f7ac863515034 Kuninori Morimoto 2023-09-14 @313  			goto codec_err;
> 
> error code?

Thank you for pointing it.
Will fix and post v2 patch.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

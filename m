Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 330E04D0DED
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 03:17:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C45D417B2;
	Tue,  8 Mar 2022 03:17:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C45D417B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646705872;
	bh=v+fdUnA85kAtZhs5uEESWAi9UPC2opGLsVnia+cm3qQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E+e6kKsnkcPXmO8VUXudjp09ffwDeL2s/l2lpjIFf0VaH6esNHKeHI8//nyGAlBzs
	 RCDfIS+R1u+oqWIyoLAajVkPQjyPl4Eue36SBBct1JhS3z8JKjCEz68MhQSHkDoLLC
	 Cd354g6WISrL3gHBnRN4tdCrJrACnqR6XekkaA1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 196C1F80159;
	Tue,  8 Mar 2022 03:16:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67BC6F8013F; Tue,  8 Mar 2022 03:16:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08olkn20829.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::829])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89FB2F800D1
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 03:16:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89FB2F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="loASiGpT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AddB4UjTcNuSjZ4mGGn6PoVh6IoCQabnm+euPw9NSE1q/ZsMHv8YUMspMomCyw5ZaZtmeH+eSdWYiqhK+ycDuw9zVpLrihqpHXPkqTnhcZYSt8V7B0ideP2zJWbpYvDSHPXHCm+nMTX00ppD8B1L3aZL7rnjk4u5IXRypCKBmzu/AH0/c2IbVljSmSLqgpymXxdhmtEVsZGatnj4TC7g4jb71mmOO46xTOyWTbxeQ3BE56g3jkvvSnShJiFhaMcm3xR2lC7hq9qYOpZ8c+RrC88GleWV9FVozCiuZsCRBWFNbx4BXYJ/hJ2Kl6zASRELkZD/8gtvI/kK1wFF/nEaTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isPLKMbH83etW7m5OzR1NUKJs1DdyfJCOmORHCkUpks=;
 b=Lt5Pb5o7OTyDa3Rj/Zo09PXxS8dxEGgkaaaWOh6ykMlCkEH1bbPw9fKmmA3freNx6jsigsDGQUuEzOsvhDASEqur5VDWsmqHJlKFNw/7znytUBVc3YuBJDFnHfzHZlMRxP/xsiTfqNMEOacMAqWT7wy0JZOl1davwrtinHo2Od9MqiMYvSWNBraF+Yn0Ko0+SRm4dCOsRiG8yJBfn+XLb1ionEsUsIeOqEd11t+A5q9DkDSjK7gWdiPuV9wuB2EqxwGhNzPNUzCxt1H4kU53CU0+EOKLPmNOJlQ662RDqReBI1Xy0UwCKLI87HX+flt3JgnKwGNvl2E/9b0fx/K7Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isPLKMbH83etW7m5OzR1NUKJs1DdyfJCOmORHCkUpks=;
 b=loASiGpT99EG3/vnBoJuJgP33/3pzxSLFGOE2SzMNmYuGN8JYwOxNrYQFRpCFUeQXC1YIzzxI59OHU5STklicVfWlrSO/lCn68Pj3ofZXHsbDGQ9XefNTKxcrZAUl3HFDGVEeKyCGyazeDS3ZM377OL36SV1Aqjx+gPK75LrPYjZvbTphMQyfi8ILnMd9575kDeLPhLhTOj0eoJXpjOS5Jqhx3ko2Ap8xJhOiDwx/AbzJYTNGaWiFCqiaEWPc2iyj0o/CcTGS3mw6TUukUmeQvA/SbSRfYzeMWRsi/iJwET/yKc1LnUs67vI1y/4pt97XePx9+PvaZb1VzdG4mRhJg==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by DM6PR06MB6089.namprd06.prod.outlook.com (2603:10b6:5:1b0::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Tue, 8 Mar
 2022 02:16:36 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc4d:1caf:5746:df98]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::fc4d:1caf:5746:df98%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 02:16:36 +0000
Date: Mon, 7 Mar 2022 20:16:33 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: rk817: Fix missing clk_disable_unprepare() in
 rk817_platform_probe
Message-ID: <SN6PR06MB534299BEE805BE9B6AFE7C3CA5099@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220307090146.4104-1-linmq006@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307090146.4104-1-linmq006@gmail.com>
X-TMN: [9SHRbwt7EwygkexeGrwMaFupqkVTcfBn]
X-ClientProxiedBy: SN7PR04CA0067.namprd04.prod.outlook.com
 (2603:10b6:806:121::12) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220308021633.GA13462@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5ef12b8-9e3f-4e36-b1d3-08da00a9ab7c
X-MS-TrafficTypeDiagnostic: DM6PR06MB6089:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rOJZHZPzespSmELf/anBpwp7y1U39J/beej7/xTjiTnP6HwCDVxPx/mUhENuWL3Fb4yN58bkahWcgpPTIivjq0i2xSZIWAApikTxWxEFP1BbJ6XQg/3dOgShEcv0rWpMRq6Cp2RpexaXxxdqmboNcJ7zrhThWssMxXyoefY+C+5MLgso5zozSAqSF6D72sA00D0AV1gBdrTDs5qevWKJV4DESA8jnGyHqAyJ98CEffqvKYYYHP0qARKp40cDDkktoWtqg314iV/1MvphLucgR6BlRoE9cb7iGcNXTHdLu0s7+L8K47af0woNsomOKVnNqjFR252+g6HDwVoONfNhxX/lvdcDxUzCIdp9x+YK5fPcE9b76lYJHkVXO9c4w/14eRuTKwiXICp8IBUTSdr+PR84PLMCtNU4jlJHDLU4+fxp/HuAXqLlvgtpL5gzYAg5PR/V20ZQvaHOUJ9IzS/BX9qCZab9D82/ShS0cpx6KS5FtGrxfUgqNzCapS4T7in+RSyBIJhOnbQx91DBT1JDMg6lqH2ZSexyqz3aEMLGTfd4znqhrCWuoRNNjXqhPr4OVTTWGKI0iOXk+MhlUlwfNA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wj1TImxKsxSONpu5gwKdEjB+OVGPGBGakzRRN3yu0sUKgJprWnnod0vxKCXF?=
 =?us-ascii?Q?CwI2aoE95Y1Eryc72qOdC0gJexckbY2NuDBO+LQBwV4+l8pgkbraysBHaSmW?=
 =?us-ascii?Q?dhpKORv0oZu4zJ+jt0PTmlZSeVRJxhYJ6LUG84CiH2obJPVOAp9QrVSgSmW8?=
 =?us-ascii?Q?T4KG+wnMjjT73nXYHG2WOUdwmDxh/MNpy/mAy7tVs9tDaQYXBqLbsCRkRtxQ?=
 =?us-ascii?Q?ML3c1rAHrN+tECdzds52BrRK55ZIPbqRuklRdUrCd427PVScoKI5N9iCa6it?=
 =?us-ascii?Q?L/8cAwtcQd6eBnCCIjI4/ve3gwCrR/0W1QTFqIYl26IkTBTde9QsZT8xPpVp?=
 =?us-ascii?Q?QvpynuqDvrBEuF5E9xG5R9xgDr+WKZ7vIOQjUPJg+wYWBhat3cb5cg8vHPTm?=
 =?us-ascii?Q?1UVNRBJEKfOAL3G94Z0yKumecLkTwwRGTnH+n5NjxmyHZZcE/7yeLLQeLAjS?=
 =?us-ascii?Q?gJim/8HpMRRn18R/5baA0EmVFmCQ9NFJMCyjAFLOau/EzshrTqzeEdoGgNll?=
 =?us-ascii?Q?g6G68A9ZFnUvPTDckeCu8pIG62/6I8C4JP1y7Rv3zvQR82Qc87LBw4TqC3DO?=
 =?us-ascii?Q?7eO4sOTLvzDzdzR+4YE/L/zAOa/vxdzShU5XYYb2Y90yTxwlQX5tO+Iw9mZp?=
 =?us-ascii?Q?7B/TGFevPqorvq5y7XdZkXZNah5Zf0gsjrupPKlHzW4d+cPRLQgX4KpfX91A?=
 =?us-ascii?Q?BFyOdhzFrQR0XOCxQB0O15udfxcDkGQhXGUC3Q7wiTlMeJ/CobaNK+PswoZy?=
 =?us-ascii?Q?3BWi/pdmFDDHLj8tOZ/pi2XcQiRAIRr0pdJG7PEQv4EUSAhwA0vXC26ETqmj?=
 =?us-ascii?Q?SnLELMs/fxIjDK6szVJwndLRh3bCrxsQxsCFJ4x4z6lBT89CXUdnbM2nfubw?=
 =?us-ascii?Q?Jocb77QDWXdVHfysiFO6uTbuI3cW0WtFkcPg9WM3KcDz1mI/SMBNNKQ+aOhe?=
 =?us-ascii?Q?zCSBmuX0NX7vYhcWQiDJpg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c5ef12b8-9e3f-4e36-b1d3-08da00a9ab7c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 02:16:36.0082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR06MB6089
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org, Colin Ian King <colin.king@intel.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Mark Brown <broonie@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>,
 Lee Jones <lee.jones@linaro.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Mar 07, 2022 at 09:01:30AM +0000, Miaoqian Lin wrote:
> Fix the missing clk_disable_unprepare() before return
> from rk817_platform_probe() in the error handling case.
> 
> Fixes: 0d6a04da9b25 ("ASoC: Add Rockchip rk817 audio CODEC support")

Tested-by: Chris Morgan <macromorgan@hotmail.com>

> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  sound/soc/codecs/rk817_codec.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
> index 03f24edfe4f6..8fffe378618d 100644
> --- a/sound/soc/codecs/rk817_codec.c
> +++ b/sound/soc/codecs/rk817_codec.c
> @@ -508,12 +508,14 @@ static int rk817_platform_probe(struct platform_device *pdev)
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "%s() register codec error %d\n",
>  			__func__, ret);
> -		goto err_;
> +		goto err_clk;
>  	}
>  
>  	return 0;
> -err_:
>  
> +err_clk:
> +	clk_disable_unprepare(rk817_codec_data->mclk);
> +err_:
>  	return ret;
>  }
>  
> -- 
> 2.17.1
> 

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8AB39BAC8
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 16:16:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 789F01730;
	Fri,  4 Jun 2021 16:16:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 789F01730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622816212;
	bh=ylNEvQFyDztoKmGc67hPDr7QUzaw7rFa1EHmbT9bgW4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZRZi6Ek/jKQskJLDtSzGEXwPtpHOq3NZYR7nP+MdUTcZH8dOiYdDIU33XuR0TSfeE
	 UEx/hTZQuczarLVczHAECTS3lthr9h8mlGV2FZOBNDYg71xNzFYeEmEehF2gDGhhtO
	 ISeXrxt2mN2uWE/vbxxEOClGwwMYrZdtUgSCy0zM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2DCAF80103;
	Fri,  4 Jun 2021 16:15:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E03FF80103; Fri,  4 Jun 2021 16:15:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2053.outbound.protection.outlook.com [40.92.22.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B980AF80103
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 16:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B980AF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="b3P1TUCj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S4+dF+ChV4HprEUojtS2ZqI72/geVT8cMU0hIBHV9IdaRvjrMjTr2WfdsK793ksla7gxoUwsKdplRaGGhZze1XI6hhdyeW95Nu4q670Us46iwhzfYsdryBd1cUHRPDUi3I09/67PPV3RLIfZ7XbuZuY4X36Tou5FIDGCZbtDEMCpmERlTRy21HICBUOdvIl5NiqEREfyGbHMTeW6vWr9coR6iKfuo6pMw+iVN75x+WjapDhJPgAEv1RpriN39x4+karLhIPZIjBKCf4XdRSJSlD76Xk4B1r/LeQMdu/YzKtEQzMDZcOrb+dOVEcphkD9fcDhM1l/xn9tMsN9yfofpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzinrFDnw4mHMRp7/TW7gEnmwMmsqqb7EL0fSWRO0GA=;
 b=NMHiRISHoMsISIouxwCWQatBIOrliNPwzgOKyIzKMqlC2/VbQwuQntiGDj3dKWaUfFEMj70pzbhsDT5OrVxkauGp/hQJwwORWM5sEk5s+9Kox/q9/Yan7ILKH2YIHBKtKh0x+KZ9RW7z9YTOxhvtYxrTiSGmTGxB5CVap9U+9MXksrf8SM9BBVW9RPnROSOqndydFvrBa7p1fGncR+CipdVDaH+ih7kjD+lXxANGZxLSAPWvnoxdKFNnfplL1ieCcvlGwgVC+dcjunfiZr1ExDWJVZkGbm5qZmEDG65+G6X24IxbNrN6IkHzNsnbUtlki6I9auCwr1OQnooiXxlSjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzinrFDnw4mHMRp7/TW7gEnmwMmsqqb7EL0fSWRO0GA=;
 b=b3P1TUCjH8su0gX+9MGSNDutrJBXml5STc0gEDklfN2IlEw7549qO1uDhWpcCQT05LVwkAOR9SZeYYmCI9VqYSIYXVMitoynLSjuR2Vy4r8THAlL7FxNIYpOXiRXH4Y2V1vdjfZYjrLWYjXaVMAAj/i6Q2vdVRX7xOjHL50qEf7nDSH5YQy4ZuTsW/CNcA4CIpVFC2EtkJJGpl9jAOOXVjKnHlNkpLxEuwxiQKfNhcRjyN0OCkehk8UKY5Oh5es+y4VKAdbsLr5xlZFlyZOJ1EOAbTi6y58LcDi4ALP4qGF559qBIKVPwiIaV8AoTwFmgU8297m5JxfVIebZctNqWw==
Received: from BN8NAM12FT056.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc66::4e) by
 BN8NAM12HT177.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc66::67)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.9; Fri, 4 Jun
 2021 14:15:15 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc66::4c) by BN8NAM12FT056.mail.protection.outlook.com
 (2a01:111:e400:fc66::176) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.9 via Frontend
 Transport; Fri, 4 Jun 2021 14:15:15 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:1C06A6507DEB0274F6BD000A9C39DADEF8A910D4728F508AACB3198D71B29E98;
 UpperCasedChecksum:15986BDDEAEF687737211DC94339C5D70071708A80D9415613C0720070969D15;
 SizeAsReceived:8638; Count:47
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::91a7:5b3:8e7c:621d]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::91a7:5b3:8e7c:621d%5]) with mapi id 15.20.4195.021; Fri, 4 Jun 2021
 14:15:15 +0000
Date: Fri, 4 Jun 2021 09:15:10 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: rk817: fix compile warning in rk817_probe()
Message-ID: <SN6PR06MB5342D1B4F0B578F20FAEE8A4A53B9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210603013605.387582-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210603013605.387582-1-yangyingliang@huawei.com>
X-TMN: [D9HWSZdI59CKru+WD/+Jf1WTTzkUdNcm]
X-ClientProxiedBy: SA9PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:806:21::33) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210604141510.GA27295@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SA9PR13CA0028.namprd13.prod.outlook.com (2603:10b6:806:21::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.9 via Frontend Transport; Fri, 4 Jun 2021 14:15:13 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 16490908-8462-45bf-52e9-08d927632be0
X-MS-TrafficTypeDiagnostic: BN8NAM12HT177:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fvZ12CJEqGPGKbbLcFR5/4kKMCCYGozoWH0vFJxH49uYesAZP2Kr+lcBnPwe6NQ4EHAKbro7owtJ+v6V5y0uTnNJ7Px79cJMUFrUH8bk6DPInjf01+CzHxH3bCTsm27e5MpLTQ6HVU+TgIEjfqcwN9E75mwjqlXshEqoXb+psscMG3MtWHU8ZHISM/LbNRUVeVL+0Orixeb+yf7ZIfgJn56aJDOYygwPgTHAd1DWWecuJJM+IgcaAdA9PPH8H8WX1TSbxaamHBSpgFrMVRsN2u7mZWQ7L4epQy2vAAOM1BqLchq2uQaO+uPKy1wJwXrabAzj3d5FP7wQbP9fkSrMCyVsBEabLTpjATkRiI4CKJOtqGANRUpSZLNtRcIOPj8KERyKippTNhDXuh6RNVf19spmNkrYeXT43esQSOCmTGNKpPHCKMa8i85CHFlti2VW4krqp59TLSSsn3bD8tEUzA==
X-MS-Exchange-AntiSpam-MessageData: cJxXSGj5hI1L7wtuJRPN8J7xctvHTGW+jMyoDipm+TsxJb2jbbQ/5WyoV5TB6LuhGtxwkbt5zrVRLsV0d0mXRMPk2Ws5xxAy5Db49inRsJFf0gHkrX4uaPA/cr3EfXYl5WQRljWQLfhnXcPEjNBitg==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16490908-8462-45bf-52e9-08d927632be0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 14:15:15.0007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM12FT056.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM12HT177
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lee.jones@linaro.org,
 linux-kernel@vger.kernel.org
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

On Thu, Jun 03, 2021 at 09:36:05AM +0800, Yang Yingliang wrote:
> Fix the compile warning by return ret:
> 
>   sound/soc/codecs/rk817_codec.c:418:6: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
>     418 |  int ret;
>         |      ^~~
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  sound/soc/codecs/rk817_codec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
> index 17e672b85ee5..56de5ec5f03b 100644
> --- a/sound/soc/codecs/rk817_codec.c
> +++ b/sound/soc/codecs/rk817_codec.c
> @@ -430,7 +430,7 @@ static int rk817_probe(struct snd_soc_component *component)
>  
>  	snd_soc_component_set_pll(component, 0, 0, 0, 0);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static void rk817_remove(struct snd_soc_component *component)
> -- 
> 2.25.1
> 

This should be fixed by 
ef7570b67541 ASoC: rk817: fix a warning in rk817_probe()

https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/commit/?h=tb-mfd-asoc-5.14-1&id=ef7570b67541d8b938df1e45f56e54be70bf1360

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDFD40BDFF
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 05:08:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6342017EE;
	Wed, 15 Sep 2021 05:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6342017EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631675325;
	bh=rbmOq3ZEkVC/iLfNsIpmqwy9djn5eHIWcvPV6G9Sf1I=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nwhwG5n8YnkEXEb3BU4lBHJK303anCuDlFC42AGcN6ls75/+6QJhxVsz7P1wwNic3
	 OKy+5GVh0x7kLE8Vr5mLxnpkOm8Zor1aXWFOUKpdkPSex/lwrBfRHngJojKOFjhi5B
	 cdy2utdstIdCe/eMJeLCFUvgIIWBBEQDu70AfVGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C519BF800EF;
	Wed, 15 Sep 2021 05:07:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 669ACF8027C; Wed, 15 Sep 2021 05:07:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53A70F800EF
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 05:07:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53A70F800EF
X-UUID: b270f9c4b47d466ab45eaf3a6575f242-20210915
X-UUID: b270f9c4b47d466ab45eaf3a6575f242-20210915
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 578152907; Wed, 15 Sep 2021 11:07:04 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 15 Sep 2021 11:07:02 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 15 Sep 2021 11:07:02 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 15 Sep 2021 11:07:02 +0800
Message-ID: <7a1af556bf3b7dda9f1be848d2631448a1155ec6.camel@mediatek.com>
Subject: Re: [PATCH -next] ASoC: mediatek: mt8195: Add missing of_node_put()
From: Trevor Wu <trevor.wu@mediatek.com>
To: Bixuan Cui <cuibixuan@huawei.com>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 15 Sep 2021 11:07:02 +0800
In-Reply-To: <20210911081246.33867-1-cuibixuan@huawei.com>
References: <20210911081246.33867-1-cuibixuan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, matthias.bgg@gmail.com
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

Hi Bixuan,

Thanks for catching that.
I found there are other usages of of_parse_phandle() in the file.
Will you handle them together?
If not, I will prepare a patch to fix them after this patch is merged.

Thanks,
Trevor

On Sat, 2021-09-11 at 16:12 +0800, Bixuan Cui wrote:
> The platform_node is returned by of_parse_phandle() should have
> of_node_put() before return.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
> ---
>  sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
> b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
> index c97ace7387b4..8cd8450409e8 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
> @@ -1041,8 +1041,10 @@ static int
> mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
>  	}
>  
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> +	if (!priv) {
> +		of_node_put(platform_node);
>  		return -ENOMEM;
> +	}
>  
>  	snd_soc_card_set_drvdata(card, priv);
>  
> @@ -1050,6 +1052,8 @@ static int
> mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
>  	if (ret)
>  		dev_err(&pdev->dev, "%s snd_soc_register_card fail
> %d\n",
>  			__func__, ret);
> +
> +	of_node_put(platform_node);
>  	return ret;
>  }
>  


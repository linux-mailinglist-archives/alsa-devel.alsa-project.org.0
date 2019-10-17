Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 711A5DA685
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 09:34:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1A501612;
	Thu, 17 Oct 2019 09:33:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1A501612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571297644;
	bh=/9sZ8AyoS3RZnSUnn8REdOxAkCBQkobGk2PuHJZHyNY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XyQ/VaHuybjcR8lv8dzV7pXzxr2n3PbxLTulHpJeS35AAVapo2aLnn6NaDbvdu1r6
	 aRenipsnDP9u6zmFGDmGqDjzNUW+te3N8Eqp8C/0WVvz4aQq7tFu8C2bNJi52gU3X4
	 hVSvW7FibPZw3ws8c02Y0Kfvg5cHj2U/SG9f7E2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 163D4F80276;
	Thu, 17 Oct 2019 09:32:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDE41F804AA; Thu, 17 Oct 2019 09:32:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03D9BF80276
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 09:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03D9BF80276
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 38170F1E5786B6648918;
 Thu, 17 Oct 2019 15:32:07 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 17 Oct 2019 15:32:03 +0800
To: <codrin.ciubotariu@microchip.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <mirq-linux@rere.qmqm.pl>
References: <20190928081641.44232-1-yuehaibing@huawei.com>
From: Yuehaibing <yuehaibing@huawei.com>
Message-ID: <c0a0ddc9-5ae4-8b5e-1d77-b322970651bd@huawei.com>
Date: Thu, 17 Oct 2019 15:32:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190928081641.44232-1-yuehaibing@huawei.com>
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH -next] ASoC: atmel: Fix build error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

ping..., this issue still in linux-next 20191017

On 2019/9/28 16:16, YueHaibing wrote:
> when do randbuilding, I got this error:
> 
> sound/soc/atmel/atmel_ssc_dai.o: In function `atmel_ssc_set_audio':
> (.text+0x12f6): undefined reference to `atmel_pcm_pdc_platform_register'
> 
> This is because SND_ATMEL_SOC_SSC_DMA=y, SND_ATMEL_SOC_SSC=y,
> but SND_ATMEL_SOC_SSC_PDC=m. Fix it bt reintroducing the default Kconfig.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 18291410557f ("ASoC: atmel: enable SOC_SSC_PDC and SOC_SSC_DMA in Kconfig")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  sound/soc/atmel/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
> index f118c22..79e45f2 100644
> --- a/sound/soc/atmel/Kconfig
> +++ b/sound/soc/atmel/Kconfig
> @@ -12,10 +12,14 @@ if SND_ATMEL_SOC
>  config SND_ATMEL_SOC_PDC
>  	tristate
>  	depends on HAS_DMA
> +	default m if SND_ATMEL_SOC_SSC_PDC=m && SND_ATMEL_SOC_SSC=m
> +	default y if SND_ATMEL_SOC_SSC_PDC=y || (SND_ATMEL_SOC_SSC_PDC=m && SND_ATMEL_SOC_SSC=y)
>  
>  config SND_ATMEL_SOC_DMA
>  	tristate
>  	select SND_SOC_GENERIC_DMAENGINE_PCM
> +	default m if SND_ATMEL_SOC_SSC_DMA=m && SND_ATMEL_SOC_SSC=m
> +	default y if SND_ATMEL_SOC_SSC_DMA=y || (SND_ATMEL_SOC_SSC_DMA=m && SND_ATMEL_SOC_SSC=y)
>  
>  config SND_ATMEL_SOC_SSC
>  	tristate
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD7976FDB7
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:46:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5242FBC0;
	Fri,  4 Aug 2023 11:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5242FBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691142388;
	bh=olN4dxI1FgVffux81b8zn3MJNrXq8USsOO0KoBkTCFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jdFuCBEcmh2hNuvL9Rii22Uz3OGw6+zJSakvCujTsWBjUnJsxc72EIdjJCtoqZZkL
	 7vELfOlk40fGQzmOFoKR5nZvhYhPKCe8dH6gWvVsaix8FKaYxmhDOzsgyETyxuVPzz
	 J3HxDrCOW/kqJWMqVnUyILqmLG44mfeYLsvfVkTQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9FFDF805E5; Fri,  4 Aug 2023 11:43:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DE77F8015B;
	Fri,  4 Aug 2023 11:43:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6776FF8025A; Thu,  3 Aug 2023 10:04:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C07D4F80087;
	Thu,  3 Aug 2023 10:04:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C07D4F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=BlL9QbPl
Received: from [192.168.0.125] (unknown [82.76.24.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A811266003AE;
	Thu,  3 Aug 2023 09:04:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691049848;
	bh=olN4dxI1FgVffux81b8zn3MJNrXq8USsOO0KoBkTCFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BlL9QbPlioYXC2hNIEVJBMKioa2AcQ6EjQ7NiyDIMcDgMbcM/28l7xVhptnPgiX4x
	 92SmPsToRA7yGqjMei6q88tORCKN0bEKHyN0UwD6Mw8nukOiWRYezCCOfWJ4CW0esr
	 5Zo6Uy3CCoPDfQca0SERrw925gqaoXGqNdrGKK9of7wqomSgQ1WZcALHdfrlB9MtJ/
	 3uijb4BuTs/jL92gGud8/ERb/EdZnwVq2pF+Vu3B+SK07cdVpibd/rTXi8zodRXPW1
	 9w+tjnnrpBK2H/C54IdNiwBf8JT8mH3z6wrlOaKUHvZWPAn6SGLllBYBONzasNHpF5
	 4j21QxdJPrj0w==
Message-ID: <e88a1074-ca86-709f-8c26-f875320e728a@collabora.com>
Date: Thu, 3 Aug 2023 11:04:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: SOF: mediatek: mt8186 modify dram type as non-cache
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: yc.hung@mediatek.com, allen-kh.cheng@mediatek.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230803075028.32170-1-trevor.wu@mediatek.com>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230803075028.32170-1-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: eugen.hristev@collabora.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BKVRKT247KOOXJSHU4RQ7I5FOXGPATTJ
X-Message-ID-Hash: BKVRKT247KOOXJSHU4RQ7I5FOXGPATTJ
X-Mailman-Approved-At: Fri, 04 Aug 2023 09:42:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BKVRKT247KOOXJSHU4RQ7I5FOXGPATTJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Trevor,

On 8/3/23 10:50, Trevor Wu wrote:
> To prevent incorrect access between the host and DSP sides, we need to
> modify DRAM as a non-cache memory type. Additionally, we can retrieve
> the size of shared DMA from the device tree.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
> Reviewed-by: Kuan-Hsun Cheng <Allen-KH.Cheng@mediatek.com>
> ---
>   sound/soc/sof/mediatek/mt8186/mt8186.c | 40 +++++++++++++++-----------
>   1 file changed, 23 insertions(+), 17 deletions(-)
> 
> diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
> index 3e0ea0e109e2..f587edf9e0a7 100644
> --- a/sound/soc/sof/mediatek/mt8186/mt8186.c
> +++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
> @@ -111,6 +111,14 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
>   
>   	dev_dbg(dev, "DMA %pR\n", &res);
>   
> +	adsp->pa_shared_dram = (phys_addr_t)res.start;
> +	adsp->shared_size = resource_size(&res);
> +	if (adsp->pa_shared_dram & DRAM_REMAP_MASK) {
> +		dev_err(dev, "adsp shared dma memory(%#x) is not 4K-aligned\n",
> +			(u32)adsp->pa_shared_dram);
> +		return -EINVAL;
> +	}
> +

Would it be better to just realign to the next 4k boundary ?
Or, isn't it more usual to use dma_coerce_mask_and_coherent ?

>   	ret = of_reserved_mem_device_init(dev);
>   	if (ret) {
>   		dev_err(dev, "of_reserved_mem_device_init failed\n");
> @@ -244,23 +252,18 @@ static int adsp_shared_base_ioremap(struct platform_device *pdev, void *data)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct mtk_adsp_chip_info *adsp = data;
> -	u32 shared_size;
>   
>   	/* remap shared-dram base to be non-cachable */
> -	shared_size = TOTAL_SIZE_SHARED_DRAM_FROM_TAIL;
> -	adsp->pa_shared_dram = adsp->pa_dram + adsp->dramsize - shared_size;
> -	if (adsp->va_dram) {
> -		adsp->shared_dram = adsp->va_dram + DSP_DRAM_SIZE - shared_size;
> -	} else {
> -		adsp->shared_dram = devm_ioremap(dev, adsp->pa_shared_dram,
> -						 shared_size);
> -		if (!adsp->shared_dram) {
> -			dev_err(dev, "ioremap failed for shared DRAM\n");
> -			return -ENOMEM;
> -		}
> +	adsp->shared_dram = devm_ioremap(dev, adsp->pa_shared_dram,
> +					 adsp->shared_size);

You cannot use dma_alloc_coherent ? This should take care of all the 
cache maintainance for you.

> +	if (!adsp->shared_dram) {
> +		dev_err(dev, "failed to ioremap base %pa size %#x\n",
> +			adsp->shared_dram, adsp->shared_size);
> +		return -ENOMEM;
>   	}
> -	dev_dbg(dev, "shared-dram vbase=%p, phy addr :%pa, size=%#x\n",
> -		adsp->shared_dram, &adsp->pa_shared_dram, shared_size);
> +
> +	dev_dbg(dev, "shared-dram vbase=%p, phy addr :%pa,  size=%#x\n",
> +		adsp->shared_dram, &adsp->pa_shared_dram, adsp->shared_size);
>   
>   	return 0;
>   }
> @@ -307,9 +310,12 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
>   		return -ENOMEM;
>   	}
>   
> -	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev,
> -							  priv->adsp->pa_dram,
> -							  priv->adsp->dramsize);
> +	priv->adsp->va_sram = sdev->bar[SOF_FW_BLK_TYPE_IRAM];
> +
> +	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap(sdev->dev,
> +						       priv->adsp->pa_dram,
> +						       priv->adsp->dramsize);
> +
Same here

>   	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
>   		dev_err(sdev->dev, "failed to ioremap base %pa size %#x\n",
>   			&priv->adsp->pa_dram, priv->adsp->dramsize);


Regards,
Eugen

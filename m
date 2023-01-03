Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFD665C060
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 14:02:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCD3FDBF9;
	Tue,  3 Jan 2023 14:01:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCD3FDBF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672750931;
	bh=NuosO/prXr2xQGkChWRAzT79ixrbSzxM4h9TTXCjPFI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VMdjhN1zU5p2AZt379N8WIabvRdsuXo5bNLnuZDdACosjCstjQO1cA7cZlmY74Wnc
	 14ajIO6/eXX+0KbD815lgpEMQR3Vf1P0KYGD7FP/sIvOJZTQ/rh5uu/v5qaH6eNo8d
	 dnBFdMHjaFDGj1m3CeN7XaETAD2Uf/vrVaCYRiFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2E96F800C0;
	Tue,  3 Jan 2023 14:01:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFF2FF800C0; Tue,  3 Jan 2023 14:01:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=5.0 tests=NICE_REPLY_A, RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 672D7F800C0
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 14:01:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 672D7F800C0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C8471516;
 Tue,  3 Jan 2023 05:01:55 -0800 (PST)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E6EC3F587;
 Tue,  3 Jan 2023 05:01:11 -0800 (PST)
Message-ID: <7897d4a6-bf43-becd-3437-7a254f38f6be@arm.com>
Date: Tue, 3 Jan 2023 13:01:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/3] iommu/sound: Use component_match_add_of helper
To: Sean Anderson <sean.anderson@seco.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
References: <20221222233759.1934852-1-sean.anderson@seco.com>
 <20221222233759.1934852-3-sean.anderson@seco.com>
Content-Language: en-GB
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20221222233759.1934852-3-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Joerg Roedel <joro@8bytes.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Yong Wu <yong.wu@mediatek.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Sean,

On 22/12/2022 11:37 pm, Sean Anderson wrote:
> Convert users of component_match_add_release with component_release_of
> and component_compare_of to component_match_add_of.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
> 
> Changes in v2:
> - Split off from helper addition
> 
>   drivers/iommu/mtk_iommu.c    | 3 +--
>   drivers/iommu/mtk_iommu_v1.c | 3 +--
>   sound/soc/codecs/wcd938x.c   | 6 ++----
>   3 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 2ab2ecfe01f8..483b7a9e4410 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1079,8 +1079,7 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>   		}
>   		data->larb_imu[id].dev = &plarbdev->dev;
>   
> -		component_match_add_release(dev, match, component_release_of,
> -					    component_compare_of, larbnode);
> +		component_match_add_of(dev, match, larbnode);

I've long since given up trying to make sense of how the DRM tree works, 
but the conflicting change is definitely already in mainline:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=b5765a1b44bea9dfcae69c53ffeb4c689d0922a7

Thanks,
Robin.

>   	}
>   
>   	/* Get smi-(sub)-common dev from the last larb. */
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index 6e0e65831eb7..fb09ed6bf550 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -672,8 +672,7 @@ static int mtk_iommu_v1_probe(struct platform_device *pdev)
>   		}
>   		data->larb_imu[i].dev = &plarbdev->dev;
>   
> -		component_match_add_release(dev, &match, component_release_of,
> -					    component_compare_of, larbnode);
> +		component_match_add_of(dev, &match, larbnode);
>   	}
>   
>   	platform_set_drvdata(pdev, data);
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index aca06a4026f3..2f8444e54083 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -4474,8 +4474,7 @@ static int wcd938x_add_slave_components(struct wcd938x_priv *wcd938x,
>   	}
>   
>   	of_node_get(wcd938x->rxnode);
> -	component_match_add_release(dev, matchptr, component_release_of,
> -				    component_compare_of, wcd938x->rxnode);
> +	component_match_add_of(dev, matchptr, wcd938x->rxnode);
>   
>   	wcd938x->txnode = of_parse_phandle(np, "qcom,tx-device", 0);
>   	if (!wcd938x->txnode) {
> @@ -4483,8 +4482,7 @@ static int wcd938x_add_slave_components(struct wcd938x_priv *wcd938x,
>   		return -ENODEV;
>   	}
>   	of_node_get(wcd938x->txnode);
> -	component_match_add_release(dev, matchptr, component_release_of,
> -				    component_compare_of, wcd938x->txnode);
> +	component_match_add_of(dev, matchptr, wcd938x->txnode);
>   	return 0;
>   }
>   

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C8A51C1C6
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 15:59:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9479817EE;
	Thu,  5 May 2022 15:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9479817EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651759197;
	bh=GMVMpKDn0PDDw4iO5jpTyKJm/l58XPckDe3I2ZWI29o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FDD9VsrzN71LkXv43qvA7EDCH/pgArTnvIppGH6IEYz76x94mnKIS/r8kEruzwMQi
	 3CoCAxH6MDhrGBriUd6dzRs5y/dbwZ5ArE48kAkNa63T/dxasU+5bF+VdemZtCsuP2
	 LYrJyMai+R/72Z7duYEF1HXsSEgrlOtrvPTrLdgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04E2DF800D3;
	Thu,  5 May 2022 15:58:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99B1FF8016B; Thu,  5 May 2022 15:58:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0A7CF800F0
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 15:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0A7CF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="IzR9xlKS"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651759129; x=1683295129;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GMVMpKDn0PDDw4iO5jpTyKJm/l58XPckDe3I2ZWI29o=;
 b=IzR9xlKSvsWpCVSBocnyalpnEScGiP/CFqHF7odapiGdY4M6MlkTUvSd
 hLcHQrWOe+nKw+PkvhKx5SqQCIk07GxVdHEaROXF4DpXtZN1IuNkFbnKK
 YcjM2s3k0z88ASaR7ConBaI5p+EpsyubzU6erdf8oxA2MRIl4GDZVOhZU
 f9z4wQ/imOtME5bhM2qXzafaWy13HcOelYfxHyvvG58Oc+mA02dgfHo8G
 cfrd7foM3L/V5LKMfPX5I5LQg9s494MHKvgBwJkKW/Esd9KiMRk4on1lZ
 F0eRA9ijFGdnaUYnWIbHAd8Vlgzdbrwu63V4ju0rW2ghc701DvwYOHRfa A==;
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="94666318"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 May 2022 06:58:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 5 May 2022 06:58:44 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 5 May 2022 06:58:41 -0700
Message-ID: <d84e0e48-cf35-ae1a-e384-067d361457ba@microchip.com>
Date: Thu, 5 May 2022 15:58:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 6/6] ARM: configs: at91: sama7_defconfig: add MCHP PDMC
 and DMIC drivers
Content-Language: en-US
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20220307122202.2251639-1-codrin.ciubotariu@microchip.com>
 <20220307122202.2251639-7-codrin.ciubotariu@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20220307122202.2251639-7-codrin.ciubotariu@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: broonie@kernel.org, lars@metafoo.de, tiwai@suse.com, robh+dt@kernel.org
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

On 07/03/2022 at 13:22, Codrin Ciubotariu wrote:
> Enable drivers needed for Microchip's PDMC and PDM microphones.
> 
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
> 
> Changes in v2,v3:
>   - none;
> 
>   arch/arm/configs/sama7_defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
> index 0368068e04d9..bc29badab890 100644
> --- a/arch/arm/configs/sama7_defconfig
> +++ b/arch/arm/configs/sama7_defconfig
> @@ -138,6 +138,8 @@ CONFIG_SND_SOC_MIKROE_PROTO=m
>   CONFIG_SND_MCHP_SOC_I2S_MCC=y
>   CONFIG_SND_MCHP_SOC_SPDIFTX=y
>   CONFIG_SND_MCHP_SOC_SPDIFRX=y
> +CONFIG_SND_MCHP_SOC_PDMC=y
> +CONFIG_SND_SOC_DMIC=y

I'm fine with that, but I see that some Kconfig entries "select" this 
SND_SOC_DMIC directly (amd, intel, mediatek, stm).
If it's absolutely needed for PDMC to work, what about doing the same as 
it would prevent some broken configurations?

Regards,
   Nicolas

>   CONFIG_SND_SOC_PCM5102A=y
>   CONFIG_SND_SOC_SPDIF=y
>   CONFIG_SND_SIMPLE_CARD=y


-- 
Nicolas Ferre

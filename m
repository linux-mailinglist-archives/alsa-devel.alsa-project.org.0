Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E97EB568F1D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 18:27:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D0F11657;
	Wed,  6 Jul 2022 18:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D0F11657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657124878;
	bh=EQWotVkpmU3qx2QXpAetjRuhu8AIHk9LVBDD7s/q2r4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Og1hGGjnmhXNDsqEUCuV27f+694bRkikQdpvFDx3NgbRZ4FmUbbyN9MdEDeModJim
	 mXEI+YeGRtRFFC60NJeCXgKfgE8fGzPmT0fb+DIavHypgG5fqLnEWPxXWxH1etOyIg
	 0xgyy8qDDbaH+AcwS1GufqGndHMiJja1EOltD4Gk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8AD3F8032B;
	Wed,  6 Jul 2022 18:26:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87370F8023A; Wed,  6 Jul 2022 18:26:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6861F8012A
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 18:26:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6861F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="CF7S+NkA"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1657124810; x=1688660810;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EQWotVkpmU3qx2QXpAetjRuhu8AIHk9LVBDD7s/q2r4=;
 b=CF7S+NkAaqsFr3w9QxZJIviwZThb8OJbRUau4xjy69djjYtSKnbD+BIq
 u/ULW8yV9zVogOYESs8YlmZcGzyL+7gJ8WKSDHFWrtU9gO9PXTWlknU9B
 8c2MlrTNNJPhEMZ20muKSHKkJKLajnlF6uh5gms/sVVomD4AkevlH+QWm
 2D4P4oAFEuWonaB7eTr3q8tyJCgjF56B7RORkjp1sHbmVb7NJS8F1rmZk
 /wuI9WXaNmEe8JjwVk8bKX0f4pFrz5RFho0W7cdJXFkY9gYw2YF7z3TYY
 7kZLIOo5xv//GpOOMHqLeo5Nyu+sZy6fjW8z3Xb70rLRCAGbIOR6trgML Q==;
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; d="scan'208";a="171303288"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Jul 2022 09:26:47 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 6 Jul 2022 09:26:43 -0700
Received: from [10.171.246.77] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 6 Jul 2022 09:26:40 -0700
Message-ID: <e43147cc-1f22-87cc-eae4-ee887fe58eac@microchip.com>
Date: Wed, 6 Jul 2022 18:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] Fixes: 1ca81883c557 ("ARM: dts: at91: sama5d2: add
 nodes for I2S controllers")
Content-Language: en-US
To: <Ryan.Wanner@microchip.com>, <Claudiu.Beznea@microchip.com>
References: <20220706162144.66831-1-Ryan.Wanner@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20220706162144.66831-1-Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
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

Hi Ryan,

On 06/07/2022 at 18:21, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Fixed typo in i2s1 node
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

The "Fixes" tag should go there in this section of the email, and not 
replace the subject.

One example of the subject could be:
"[PATCH v2] ARM: dts: at91: sama5d2: fix typo in i2s1 node"

> ---
> Changes since v1:
> 1. Corrected commit

You can place this content about changes...

> ---

Just here, below the "---", so that you don't need to add another "---".

Regards,
   Nicolas

>   arch/arm/boot/dts/sama5d2.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
> index 89c71d419f82..659a17fc755c 100644
> --- a/arch/arm/boot/dts/sama5d2.dtsi
> +++ b/arch/arm/boot/dts/sama5d2.dtsi
> @@ -1124,7 +1124,7 @@ AT91_XDMAC_DT_PERID(33))>,
>   				clocks = <&pmc PMC_TYPE_PERIPHERAL 55>, <&pmc PMC_TYPE_GCK 55>;
>   				clock-names = "pclk", "gclk";
>   				assigned-clocks = <&pmc PMC_TYPE_CORE PMC_I2S1_MUX>;
> -				assigned-parrents = <&pmc PMC_TYPE_GCK 55>;
> +				assigned-clock-parents = <&pmc PMC_TYPE_GCK 55>;
>   				status = "disabled";
>   			};
>   


-- 
Nicolas Ferre

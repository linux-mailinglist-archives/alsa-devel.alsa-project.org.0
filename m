Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1752B642CF9
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 17:36:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 697351841;
	Mon,  5 Dec 2022 17:35:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 697351841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670258162;
	bh=IPXdVPdO3Yu3scdAN0DF1fdGg2QUbK740E4iM4sxCII=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j6AbYrJS/mkgsOC+Byqn/hXyzgYuvQf+wQH8vP4fRoPAXR93Y3rJbjD19EowbAXkG
	 1CjjMFxf+qr+CiD3Diht8+dhBEZBSDctzRWZv0kkGXk9p2Sn+/d6Var+Y0K4NW7JjJ
	 ZC5YFGUCamtCM8RxROCLSgoA6qsrXysaKarw9lSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0FFFF800BD;
	Mon,  5 Dec 2022 17:35:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1A7BF8047C; Mon,  5 Dec 2022 17:35:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E171F8014C
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 17:34:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E171F8014C
Received: by mail-oi1-f174.google.com with SMTP id m204so13648699oib.6
 for <alsa-devel@alsa-project.org>; Mon, 05 Dec 2022 08:34:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3LmueXUXyGNVa79/vNF3eg0gla6XRQeVcGtQ/SX2HD4=;
 b=DhoIVWh94MXM36CaY4cmKAdzHGATJilfoTAqc7MKOSHW61eT6AqLy64o1HhzWbrwBv
 sTOyE4/4XTUSibVgjwQc+rxw+T6tcXli8aZfTzBhiJNfju773NygEbAHTaNlQ1tg9FzZ
 IT6M7DwGdLslWzeI16tBZif6ck7C1V3sV43aLKwar7BegfJQ9yrZNZcUhF9QvIKf6a8U
 5Gvkc/k2dz2zYqqUZKgplWgXl3Akz3HHi5UklkPzsu/kq9xKts7KJu8ZKP9Htlp3RHPF
 MSGNBsuwwrcruIz9daAxRY/Trz5GVLDRx0q+kdZubvqbvuS17W7ZQE3tjQ9jdLCVw1wO
 x7IQ==
X-Gm-Message-State: ANoB5pnsbU7bYTkU2hMoInZdPY9g/3Zvv2ezhkF06ADiUH9pmhLpDYsi
 kUsHDlEyCJf+mpoxHzPsTA==
X-Google-Smtp-Source: AA0mqf6CoNtePO5bj+mi2MYlTeJfbtyVVhhECDsbwer0VjrJUMrf9hVTNLDwy5cYNa3POnSH40rVuA==
X-Received: by 2002:a54:4407:0:b0:34f:9f93:1f17 with SMTP id
 k7-20020a544407000000b0034f9f931f17mr38439368oiw.203.1670258094210; 
 Mon, 05 Dec 2022 08:34:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 18-20020aca1112000000b00354d9b9f6b4sm4152761oir.27.2022.12.05.08.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 08:34:53 -0800 (PST)
Received: (nullmailer pid 2036863 invoked by uid 1000);
 Mon, 05 Dec 2022 16:34:53 -0000
Date: Mon, 5 Dec 2022 10:34:53 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: Drop Jee Heng Sia
Message-ID: <20221205163453.GA2034441-robh@kernel.org>
References: <20221203162144.99225-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221203162144.99225-1-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dmaengine@vger.kernel.org, "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>
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

On Sat, Dec 03, 2022 at 05:21:43PM +0100, Krzysztof Kozlowski wrote:
> Emails to Jee Heng Sia bounce ("550 #5.1.0 Address rejected.").  Add
> Keembay platform maintainers as Keembay I2S maintainers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml    | 1 -
>  Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml | 3 ++-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index 67aa7bb6d36a..ad107a4d3b33 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -8,7 +8,6 @@ title: Synopsys DesignWare AXI DMA Controller
>  
>  maintainers:
>    - Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> -  - Jee Heng Sia <jee.heng.sia@intel.com>
>  
>  description:
>    Synopsys DesignWare AXI DMA Controller DT Binding
> diff --git a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
> index 2ac0a4b3cd18..33ab0be036a1 100644
> --- a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
> +++ b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
> @@ -8,7 +8,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Intel KeemBay I2S
>  
>  maintainers:
> -  - Sia, Jee Heng <jee.heng.sia@intel.com>
> +  - Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> +  - Paul J. Murphy <paul.j.murphy@intel.com

Missing '>'

>  
>  description: |
>   Intel KeemBay I2S
> -- 
> 2.34.1
> 
> 

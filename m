Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B681554F76
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:37:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F36BC1F43;
	Wed, 22 Jun 2022 17:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F36BC1F43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912235;
	bh=zrRPHYjk9cvBUWSR7Cx32aeISznn3m3+i5e5zkWagHM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZZn3tfDyprMnogO13Lxy88BeEC+emSEzL0rV33/ghcCiXrB2FxT6TQ8E0cVSTb+Oa
	 /jMfEPsdZwf/odG1AUHzwaDaWIEDoM3z9aaG7C4UpI1zyDNwG/78pElkzlMmqKNFhl
	 8/9Giom5FWAi4mek8cHU3kFsmYZ3ueni24LG+Hcw=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98CB2F8053A;
	Wed, 22 Jun 2022 17:23:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B631EF804E5; Mon, 20 Jun 2022 22:57:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2103F804D2
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2103F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XqDUXO3E"
Received: by mail-lj1-x22e.google.com with SMTP id e4so13242125ljl.1
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=I1q6whSBjY67mrzgmnGkRh2MNzKa13E3jo+SVBhTEQg=;
 b=XqDUXO3E0jN9GQ9iGhmoxij0PahkYfXP61nSCTKCx/fvSoFpRgDWoLiqAgCUJw1PnX
 GdUgZ6dYoT0Uit7ykMaMR28omMbZ7gDLoi3NlWPpOtwarIrAKYFsFwlDEOerY9w8oIh9
 rbNjhalyLNI+e+pBOTtZlMUNIOGbQPKrYkgGGE49HLjM86guD1yX+eIVXs28qYEpQbEL
 6u9TJxb58aw5NaSuOkvrVJyyneGqycdZCp/nKqOuDGx84SLdx3Jj79iGAZlYRrBgW6bm
 FIeQBMEkq8FhjglPxtSJNnSUrVC7AertpkEpoopILkV/YW/Fu3kY37aS2zC50BoszzoE
 3eOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I1q6whSBjY67mrzgmnGkRh2MNzKa13E3jo+SVBhTEQg=;
 b=lklPK2TtJY6OKooLsj46mDrwukxkJr/mtxf1zPHtmXwPpshmscV3/yy4PUqB/A8c1e
 pL7k6bh+sFL+hLTdgLstcL5YujpBf+O5HkjV2mDK7je3JWcGA+HR1wCwLiHhu+wxfSGD
 I1u/1wBKIgvit1Pc6F12r+HMtXPS1xVtDlQF2QbvDfzKJ4ju2Txwp7q3TCOgdafPXhFq
 Pcki2UBbQpnpBeNu/JePmEbsmlAIK4EEQgdkmIhGD3tgEu/G9YYHf0H68SzzWr+n3Rk4
 FwDXhHdmv/VXLvtsy/WAiFw5ZQCx5HAEaHuEdXTPDsMspkSRCRxmgPrmyJ9ad1ZzdDLJ
 FAKQ==
X-Gm-Message-State: AJIora85dKpevzfRWcRlF5V+Jqb/Gpc4fkwJGgLuqUuwkdmu5VKO0R9B
 imRp918yrPhSccxCmhcBCrY=
X-Google-Smtp-Source: AGRyM1to9l7DPfbxuwJzqkPzvrt6m3YRq/lqE+tbkd+LRqyrjxLhnrSzMA6Azd9ZVxOZ5l1LL1DhCQ==
X-Received: by 2002:a05:651c:2107:b0:255:beb0:9969 with SMTP id
 a7-20020a05651c210700b00255beb09969mr12785405ljq.157.1655758617786; 
 Mon, 20 Jun 2022 13:56:57 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
 by smtp.gmail.com with ESMTPSA id
 i17-20020ac25b51000000b004778632bff6sm1893799lfp.59.2022.06.20.13.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:56:57 -0700 (PDT)
Date: Mon, 20 Jun 2022 23:56:54 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Message-ID: <20220620205654.g7fyipwytbww5757@mobilestation>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220618123035.563070-7-mail@conchuod.ie>
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:18 +0200
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Heng Sia <jee.heng.sia@intel.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Vetter <daniel@ffwll.ch>, dmaengine@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>
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

On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
> this.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
>  1 file changed, 35 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index e25d44c218f2..f2b9e3f062cd 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -135,19 +135,41 @@ properties:
>        of the designware controller, and the upper limit is also subject to
>        controller configuration.
>  
> -patternProperties:
> -  "^.*@[0-9a-f]+$":
> -    type: object
> -    properties:
> -      reg:
> -        minimum: 0
> -        maximum: 3
> -
> -      spi-rx-bus-width:
> -        const: 1
> -
> -      spi-tx-bus-width:
> -        const: 1
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: snps,dwc-ssi-1.01a
> +
> +then:
> +  patternProperties:
> +    "^.*@[0-9a-f]+$":
> +      type: object
> +      properties:
> +        reg:
> +          minimum: 0
> +          maximum: 3
> +
> +        spi-rx-bus-width:
> +          const: 4
> +
> +        spi-tx-bus-width:
> +          const: 4
> +
> +else:
> +  patternProperties:
> +    "^.*@[0-9a-f]+$":
> +      type: object
> +      properties:
> +        reg:
> +          minimum: 0
> +          maximum: 3
> +
> +        spi-rx-bus-width:
> +          const: 1
> +
> +        spi-tx-bus-width:
> +          const: 1

You can just use a more relaxed constraint "enum: [1 2 4 8]" here
irrespective from the compatible string. The modern DW APB SSI
controllers of v.4.* and newer also support the enhanced SPI Modes too
(Dual, Quad and Octal). Since the IP-core version is auto-detected at
run-time there is no way to create a DT-schema correctly constraining
the Rx/Tx SPI bus widths. So let's keep the
compatible-string-independent "patternProperties" here but just extend
the set of acceptable "spi-rx-bus-width" and "spi-tx-bus-width"
properties values.

Note the DW APB SSI/AHB SSI driver currently doesn't support the
enhanced SPI modes. So I am not sure whether the multi-lines Rx/Tx SPI
bus indeed works for Canaan K210 AHB SSI controller. AFAICS from the
DW APB SSI v4.01a manual the Enhanced SPI mode needs to be properly
activated by means of the corresponding CSR. So most likely the DW AHB
SSI controllers need some specific setups too.

-Sergey

>  
>  unevaluatedProperties: false
>  
> -- 
> 2.36.1
> 

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CC422B8A2
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 23:28:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE3E51661;
	Thu, 23 Jul 2020 23:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE3E51661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595539696;
	bh=9A7uW5r74LJMN1cCC6kBYK4KHejBrBzZXNWDnA/woPE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=no8+vhI3O3JhXhjD6QPZOl4sYE190AuiRzE+kGs4nR2IbV4LTxt4JsXCGCAIfSdQt
	 lPiKvloXjwjcFvklkFy7DV81pc542d2IulYQfjrnm3rbWcrl7Vtgd0fnR7clWq+JGE
	 IHjbPwzQnpcdhsozzUKk4iAVEUkDQo7ej/t60ITQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10ADFF80090;
	Thu, 23 Jul 2020 23:26:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D5B9F80212; Thu, 23 Jul 2020 23:26:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAD66F80090
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 23:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAD66F80090
Received: by mail-io1-f65.google.com with SMTP id c16so7812412ioi.9
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 14:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Aio0O56TMdFYqw2UCtuk3QI7N/E8ozfzhWYeOVwX0x4=;
 b=dVSmqt48F19sM2qbBwBYoAhbeb6rHWlG0BXjKfY5Hm2Cmfx/KqK/bSHLKbp9dj+Ebz
 wgV4LTNF16kcHOP+zXMR9iqodonmf2JymN0fUYAJ3YkeWUED4wIN7vAFsLNVkzBGkOJa
 4757CiTqDTkanIu5gSjOFcBWavlDQZpX8GOufvfkLxa3HnTuO93Az8HDh4WRinPwv/y9
 JVOksKz5XmNPxeZyQHTMOfwd5oZsq861QhdBj2BuAHvXA/o16AOCc/jaMHfK3xwInpPG
 4Dgfua22Bj3Z7eo8Sv2/vko7RGvQ9wmQi4DiQH5oU+ruZFuKJgL0o+QE2OWQZIKufgmJ
 eoHA==
X-Gm-Message-State: AOAM532+ah0zRX73bFEgVNaCPSgmKYnJt34beRnOlILzbdr47ft7ggTn
 PO9LUHPnfG8KgOyAmXm8zg==
X-Google-Smtp-Source: ABdhPJxz8jFmwfXBj5nmYZ+34dKaTVlZ/aHCHdHoiAgKX5+W1LlWTBhTOwsE6vqBfYqNJfIO6Ymhcg==
X-Received: by 2002:a05:6602:1587:: with SMTP id
 e7mr3179560iow.203.1595539585372; 
 Thu, 23 Jul 2020 14:26:25 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id k3sm2034542ils.8.2020.07.23.14.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 14:26:24 -0700 (PDT)
Received: (nullmailer pid 886747 invoked by uid 1000);
 Thu, 23 Jul 2020 21:26:23 -0000
Date: Thu, 23 Jul 2020 15:26:23 -0600
From: Rob Herring <robh@kernel.org>
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Subject: Re: [PATCH] dt-bindings: sound: convert Everest ES8316 binding to yaml
Message-ID: <20200723212623.GA882284@bogus>
References: <20200722180728.993812-1-katsuhiro@katsuster.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722180728.993812-1-katsuhiro@katsuster.net>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Thu, Jul 23, 2020 at 03:07:28AM +0900, Katsuhiro Suzuki wrote:
> This patch converts Everest Semiconductor ES8316 low power audio
> CODEC binding to DT schema.
> 
> Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
> ---
>  .../bindings/sound/everest,es8316.txt         | 23 ---------
>  .../bindings/sound/everest,es8316.yaml        | 49 +++++++++++++++++++
>  2 files changed, 49 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/everest,es8316.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/everest,es8316.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.txt b/Documentation/devicetree/bindings/sound/everest,es8316.txt
> deleted file mode 100644
> index 1bf03c5f2af4..000000000000
> --- a/Documentation/devicetree/bindings/sound/everest,es8316.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Everest ES8316 audio CODEC
> -
> -This device supports both I2C and SPI.
> -
> -Required properties:
> -
> -  - compatible  : should be "everest,es8316"
> -  - reg : the I2C address of the device for I2C
> -
> -Optional properties:
> -
> -  - clocks : a list of phandle, should contain entries for clock-names
> -  - clock-names : should include as follows:
> -         "mclk" : master clock (MCLK) of the device
> -
> -Example:
> -
> -es8316: codec@11 {
> -	compatible = "everest,es8316";
> -	reg = <0x11>;
> -	clocks = <&clks 10>;
> -	clock-names = "mclk";
> -};
> diff --git a/Documentation/devicetree/bindings/sound/everest,es8316.yaml b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
> new file mode 100644
> index 000000000000..b713404dac4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/everest,es8316.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/everest,es8316.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Everest ES8316 audio CODEC
> +
> +maintainers:
> +  - Mark Brown <broonie@kernel.org>

Should be someone who knows and cares about the h/w which is not Mark.

> +
> +properties:
> +  compatible:
> +    const: everest,es8316
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock for master clock (MCLK)
> +
> +  clock-names:
> +    items:
> +      - const: mclk
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c0 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      es8316: codec@11 {
> +        compatible = "everest,es8316";
> +        reg = <0x11>;
> +        clocks = <&clks 10>;
> +        clock-names = "mclk";
> +        #sound-dai-cells = <0>;
> +      };
> +    };
> -- 
> 2.27.0
> 

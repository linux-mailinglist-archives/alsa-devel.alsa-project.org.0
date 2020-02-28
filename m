Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3CA173E3F
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 18:20:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 432A516E7;
	Fri, 28 Feb 2020 18:19:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 432A516E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582910429;
	bh=k1hRL5DeZtkyFL/eURkkMrJR8KB4iCX+iuuPzyAjih4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y5Xw/rmftEdsJo86fGilZGmyfe02g70b9u6nspJx7W8z4tv4wed8fdYOp5rcpPEVy
	 y03R71/RPbG4UIkatCCVoRiJ3gaWPuk+cbTXWBKVzbUV7qbkK8BWltNpaDklg1Onu3
	 puO0MVBQJ6k+v7FG2BUFVczgKJOYGNHqcs+fAS+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1039F8016F;
	Fri, 28 Feb 2020 18:18:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D76B1F8014D; Fri, 28 Feb 2020 18:18:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF046F80089
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 18:18:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF046F80089
Received: by mail-ot1-f68.google.com with SMTP id 66so3245123otd.9
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 09:18:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pb+PJoJtW2sA5x/kLQp2vnmzDsqGqr65TnSBcPMbR7g=;
 b=Va5zUHBi1zX+4jyeogpX9tojyuGy97uPvSmUQ9I1aYDCZjNZDN0eH12aHmReRjZc4+
 +FgD+YVR/6mgXhIQLAZ7SkS0gzfCUbnDg3Y5QuYyCdAai5rywagYIE+dedyI+3A4ddl7
 rFgE0RMDgiH/d+BbAC457kw7q1Coyoy262h/PJ5mal2eaLgDRFhYU7I7DipNW1Jx63mR
 fWQLYraBo3e7RVDPvnmVnLJWLbm33r8/cma6dj8zotD7U2rYb/wMM1ro8pgOCZXqB6q/
 H3nXQZRMRegzP3HygLY0fj1YBUMcFmBe8proq+3Vxqwj4zWTu6K1waanqGkvnOhU0A77
 fbuQ==
X-Gm-Message-State: APjAAAUq6+mxOD0IOv0eH0VScZe+TT5DgptDaWwBCdwbUT7BL10kft1M
 5p7NKre7L23XXBelQJxZ6Q==
X-Google-Smtp-Source: APXvYqzab5ENBUX7/Dqgb0kBzOfn28/rFZnWr1rJG7CNXgNlbWqOdHwOkN1Yv4PRdvFnNLEteaDSbQ==
X-Received: by 2002:a05:6830:160c:: with SMTP id
 g12mr4121358otr.82.1582910320121; 
 Fri, 28 Feb 2020 09:18:40 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z17sm3296727oic.15.2020.02.28.09.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 09:18:39 -0800 (PST)
Received: (nullmailer pid 26488 invoked by uid 1000);
 Fri, 28 Feb 2020 17:18:38 -0000
Date: Fri, 28 Feb 2020 11:18:38 -0600
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 3/9] ASoC: meson: convert axg tdm formatters to schema
Message-ID: <20200228171838.GA27450@bogus>
References: <20200224145821.262873-1-jbrunet@baylibre.com>
 <20200224145821.262873-4-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224145821.262873-4-jbrunet@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
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

On Mon, Feb 24, 2020 at 03:58:15PM +0100, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic tdm formatters to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../sound/amlogic,axg-tdm-formatters.txt      | 36 --------
>  .../sound/amlogic,axg-tdm-formatters.yaml     | 92 +++++++++++++++++++
>  2 files changed, 92 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
> deleted file mode 100644
> index 5996c0cd89c2..000000000000
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -* Amlogic Audio TDM formatters
> -
> -Required properties:
> -- compatible: 'amlogic,axg-tdmin' or
> -	      'amlogic,axg-tdmout' or
> -	      'amlogic,g12a-tdmin' or
> -	      'amlogic,g12a-tdmout' or
> -	      'amlogic,sm1-tdmin' or
> -	      'amlogic,sm1-tdmout
> -- reg: physical base address of the controller and length of memory
> -       mapped region.
> -- clocks: list of clock phandle, one for each entry clock-names.
> -- clock-names: should contain the following:
> -  * "pclk"     : peripheral clock.
> -  * "sclk"     : bit clock.
> -  * "sclk_sel" : bit clock input multiplexer.
> -  * "lrclk"    : sample clock
> -  * "lrclk_sel": sample clock input multiplexer
> -
> -Optional property:
> -- resets: phandle to the dedicated reset line of the tdm formatter.
> -
> -Example of TDMOUT_A on the S905X2 SoC:
> -
> -tdmout_a: audio-controller@500 {
> -	compatible = "amlogic,axg-tdmout";
> -	reg = <0x0 0x500 0x0 0x40>;
> -	resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
> -	clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
> -		 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
> -		 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
> -		 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
> -		 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
> -	clock-names = "pclk", "sclk", "sclk_sel",
> -		      "lrclk", "lrclk_sel";
> -};
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
> new file mode 100644
> index 000000000000..f6f3bfb546f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license please as you're the only author of the .txt file.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Audio AXG TDM formatters
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller@.*"
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +        - enum:
> +          - amlogic,g12a-tdmout
> +          - amlogic,sm1-tdmout
> +          - amlogic,axg-tdmout
> +      - items:
> +        - enum:
> +          - amlogic,g12a-tdmin
> +          - amlogic,sm1-tdmin
> +        - const:
> +            amlogic,axg-tdmin
> +      - items:
> +        - const:
> +            amlogic,axg-tdmin
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock
> +      - description: Bit clock
> +      - description: Bit clock input multiplexer
> +      - description: Sample clock
> +      - description: Sample clock input multiplexer
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: sclk
> +      - const: sclk_sel
> +      - const: lrclk
> +      - const: lrclk_sel
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - amlogic,g12a-tdmin
> +          - amlogic,sm1-tdmin
> +          - amlogic,g12a-tdmout
> +          - amlogic,sm1-tdmout
> +then:
> +  required:
> +    - resets
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/axg-audio-clkc.h>
> +    #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
> +
> +    tdmout_a: audio-controller@500 {
> +        compatible = "amlogic,g12a-tdmout",
> +                     "amlogic,axg-tdmout";

This fails validation.

> +        reg = <0x0 0x500 0x0 0x40>;
> +        resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
> +        clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
> +                 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
> +                 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
> +                 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
> +                 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
> +        clock-names = "pclk", "sclk", "sclk_sel",
> +                      "lrclk", "lrclk_sel";
> +    };
> +
> -- 
> 2.24.1
> 

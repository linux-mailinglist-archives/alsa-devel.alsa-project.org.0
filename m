Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14413173F08
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 19:03:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D8C616EB;
	Fri, 28 Feb 2020 19:02:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D8C616EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582912985;
	bh=QegyQo/HR+2pngYHKRkCTtN3MwRY9QFxvC/oTtQwhIo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NwB5JrZtMgalG+u1TGusniozQcRUooJLRClJOuHp+UxA+fEM5+MqLufUpYAXHABpx
	 Od2jd/3pCub5F8uphiUtGcZLHHObA5Ne1Xi1nYOAJqIJOoTb5xCsgqFQbHKNCiK/qx
	 Sz72fxK0uQhkwKNaYDsjL68dj2K0l8f/SztE1Dq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6479F8016F;
	Fri, 28 Feb 2020 19:01:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12AEDF8014E; Fri, 28 Feb 2020 19:01:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09B19F80089
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 19:01:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09B19F80089
Received: by mail-ot1-f66.google.com with SMTP id r16so3418949otd.2
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 10:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6pAsECt7PiBK62q88D+kfvQxUuJNH4AnYnLku6Y2cN8=;
 b=pNX+KppcTckgbogxzsx72wceqwkYM49MtDQp64PF0iLpCidqsHK5pRvrFySko/79oz
 QmgyYIGATlT4h2dz3BaXYWP6O6yWEx95b19Pw7JIKBl8UkNCWR+yGYwnj21E4CzbWFkn
 h6p5iOxJdtMLh9fiB1HjCCKXAikHSAINaboybvYwbhVOFsSWx8QHzRitLE3y7RfbkFOs
 5LdFHMk89ggs4iCCTOovgSJ+zFt4qVasKcJoCXsckwX0XWkCM9LzSp4Xmw4N9LyoPZo/
 x/36w6wo8W7YfWGNppSsw0lzMEgTu9sp7jAXzskmW9JVaGZadCBTkqcP29mwMFxQy0ln
 bAVw==
X-Gm-Message-State: APjAAAVS7pVg9nXv6uakVVc4IvuTXQqdCV1pQaoAbWpBOWqpc/V5TJLG
 M4E8VdszsEZ2QLw++/yrnw==
X-Google-Smtp-Source: APXvYqyc028jTANUn0xgkw/a9kxcmZKUdVZYKQUcXfDjL8GahTISwR9AkN8XD+xx3EePlmjq7gsFvg==
X-Received: by 2002:a9d:518b:: with SMTP id y11mr4099645otg.349.1582912877111; 
 Fri, 28 Feb 2020 10:01:17 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m185sm3318360oia.26.2020.02.28.10.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 10:01:16 -0800 (PST)
Received: (nullmailer pid 21022 invoked by uid 1000);
 Fri, 28 Feb 2020 18:01:15 -0000
Date: Fri, 28 Feb 2020 12:01:15 -0600
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 5/9] ASoC: meson: convert axg fifo to schema
Message-ID: <20200228180115.GA14079@bogus>
References: <20200224145821.262873-1-jbrunet@baylibre.com>
 <20200224145821.262873-6-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224145821.262873-6-jbrunet@baylibre.com>
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

On Mon, Feb 24, 2020 at 03:58:17PM +0100, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic axg audio FIFOs to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-fifo.txt       |  34 ------
>  .../bindings/sound/amlogic,axg-fifo.yaml      | 111 ++++++++++++++++++
>  2 files changed, 111 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
> deleted file mode 100644
> index fa4545ed81ca..000000000000
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -* Amlogic Audio FIFO controllers
> -
> -Required properties:
> -- compatible: 'amlogic,axg-toddr' or
> -	      'amlogic,axg-toddr' or
> -	      'amlogic,g12a-frddr' or
> -	      'amlogic,g12a-toddr' or
> -	      'amlogic,sm1-frddr' or
> -	      'amlogic,sm1-toddr'
> -- reg: physical base address of the controller and length of memory
> -       mapped region.
> -- interrupts: interrupt specifier for the fifo.
> -- clocks: phandle to the fifo peripheral clock provided by the audio
> -	  clock controller.
> -- resets: list of reset phandle, one for each entry reset-names.
> -- reset-names: should contain the following:
> -  * "arb" : memory ARB line (required)
> -  * "rst" : dedicated device reset line (optional)
> -- #sound-dai-cells: must be 0.
> -- amlogic,fifo-depth: The size of the controller's fifo in bytes. This
> -  		      is useful for determining certain configuration such
> -		      as the flush threshold of the fifo
> -
> -Example of FRDDR A on the A113 SoC:
> -
> -frddr_a: audio-controller@1c0 {
> -	compatible = "amlogic,axg-frddr";
> -	reg = <0x0 0x1c0 0x0 0x1c>;
> -	#sound-dai-cells = <0>;
> -	interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
> -	clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
> -	resets = <&arb AXG_ARB_FRDDR_A>;
> -	fifo-depth = <512>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
> new file mode 100644
> index 000000000000..d9fe4f624784
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,axg-fifo.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic AXG Audio FIFO controllers
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller@.*"
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +        - const:
> +            amlogic,axg-toddr
> +      - items:
> +        - const:
> +            amlogic,axg-frddr
> +      - items:
> +        - enum:
> +          - amlogic,g12a-toddr
> +          - amlogic,sm1-toddr
> +        - const:
> +            amlogic,axg-toddr
> +      - items:
> +        - enum:
> +          - amlogic,g12a-frddr
> +          - amlogic,sm1-frddr
> +        - const:
> +            amlogic,axg-frddr
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    minItems: 1
> +    items:
> +      - description: Memory ARB line
> +      - description: Dedicated device reset line
> +
> +  reset-names:
> +    minItems: 1
> +    items:
> +      - const: arb
> +      - const: rst
> +
> +  amlogic,fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Size of the controller's fifo in bytes

Aren't there some constraints on possible values? I'm sure it's more 
than 0 and less than 2^32.

> +
> +required:
> +  - "#sound-dai-cells"
> +  - compatible
> +  - interrupts
> +  - reg
> +  - clocks
> +  - resets
> +  - amlogic,fifo-depth
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - amlogic,g12a-toddr
> +          - amlogic,sm1-toddr
> +          - amlogic,g12a-frddr
> +          - amlogic,sm1-frddr
> +then:
> +  properties:
> +    resets:
> +      minItems: 2
> +    reset-names:
> +      minItems: 2
> +  required:
> +    - reset-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/axg-audio-clkc.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
> +    #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
> +
> +    frddr_a: audio-controller@1c0 {
> +        compatible = "amlogic,g12a-frddr", "amlogic,axg-frddr";
> +        reg = <0x0 0x1c0 0x0 0x1c>;
> +        #sound-dai-cells = <0>;
> +        interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
> +        clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
> +        resets = <&arb AXG_ARB_FRDDR_A>, <&clkc_audio AUD_RESET_FRDDR_A>;
> +        reset-names = "arb", "rst";
> +        amlogic,fifo-depth = <512>;
> +    };
> +
> -- 
> 2.24.1
> 

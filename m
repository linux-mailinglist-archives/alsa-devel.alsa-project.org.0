Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABE7413817
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 19:10:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC42082E;
	Tue, 21 Sep 2021 19:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC42082E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632244208;
	bh=lModSVCjMMGuQK2vwdgo9ei5Tj2cnGcEIQFtw4CM8YY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZUAULNupilJFwSL9YM583YiDRt9df0k1UbrHeT3OsR/FH+pWRRMYfASRlGiVUw3sn
	 XNvMMi5IYxfslIQlxSd0d02a/Q7CXpQHESt81EEZfZjKuAIdod8TR8CACu2Y6rfodm
	 ApI2bWl7xNAkIzIWtqZdgLNQL6PQZoD6cmoMqZwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D373F8011F;
	Tue, 21 Sep 2021 19:08:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25822F80268; Tue, 21 Sep 2021 19:08:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC8B2F8016E
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 19:08:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC8B2F8016E
Received: by mail-ot1-f50.google.com with SMTP id
 c6-20020a9d2786000000b005471981d559so7783601otb.5
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 10:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O9JEWZDMt2jcZLyP/IIVUSlCL8PUIazRPHBsmaclHCw=;
 b=KuXG77vm4RQV2sz828MyaF6velo3grGNba6lf0cuOMJ7aQ5u5fyakSSS5TQj8JFdwW
 BScoQhyonHavS+GigfkZW15Jmn0qZr7Qks2D/DzcxgzTnHjileCDAxUZVOzB+CP+BTYV
 lHvZCFqV5jiWaPr948l0O6DVzSLsU6ExMGwy8YTX5KHr5y/5dc1kuDqRp2+OM7HK7XDm
 T0b68rhibCoHZrN0UHgl2854Liiu7Bd9QQZwWBuL2ck5nkg1rP9+k3ZCnYfmL0rEyaSC
 olSLjJ0B6jmsY9g7Eup56kmvr0xwNhouN3OZHFlTAU1BTt2m+z1pD4CB4zpIG4CVzP6N
 TJ4w==
X-Gm-Message-State: AOAM530JhjhUSQ2gQJXcDd7UP3afM+NwcHgbSpxb9KfhEr0nJ0w+kAaG
 q/JDVbHdAaYMDx4cF8tyYw==
X-Google-Smtp-Source: ABdhPJyAoYtMFkASDt0IJc86gZEcglM6twQLZXsVUyPadtNltehV5spM1KvUGzi/ZewiYeR0LXPzOA==
X-Received: by 2002:a9d:5a89:: with SMTP id w9mr26610982oth.91.1632244116250; 
 Tue, 21 Sep 2021 10:08:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f17sm3024717ook.9.2021.09.21.10.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:08:34 -0700 (PDT)
Received: (nullmailer pid 2964447 invoked by uid 1000);
 Tue, 21 Sep 2021 17:08:33 -0000
Date: Tue, 21 Sep 2021 12:08:33 -0500
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Subject: Re: [PATCH 1/7] dt-bindings: iio: adc: add generic channel binding
Message-ID: <YUoRkepuJXRghzih@robh.at.kernel.org>
References: <20210908155452.25458-1-olivier.moysan@foss.st.com>
 <20210908155452.25458-2-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908155452.25458-2-olivier.moysan@foss.st.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
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

On Wed, Sep 08, 2021 at 05:54:46PM +0200, Olivier Moysan wrote:
> Add ADC generic channel binding. This binding should
> be used as an alternate to legacy channel properties
> whenever possible.
> ADC generic channel binding allows to identify supported
> internal channels through the following reserved label names:
> "vddcore", "vrefint" and "vbat".
> This binding also allows to set a different sampling time
> for each channel.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
> Note: The schema here is too permissive as either legacy or generic
> channels properties are required. These properties are mutually
> exclusive, however all attempts to describe this constraint are
> failing. In particular the following schemas and their variants have
> shown unsucessful.
> 
> oneOf:
>   - anyOf:
> 	- required:
> 		- st,adc-channels
> 	- required:
> 		- st,adc-diff-channels
>   - anyOf:
> 	- required:
> 		- $nodename
> 
> - if:
>   patternProperties:
>     "^channel@([0-9]|1[0-9])$":
>       type: object

This is considered true when you don't match this property. You would 
need 'required', but that doesn't work for patterns. That's a 
json-schema limitation that's on their radar to address.

My advice is just mark the legacy nodes 'deprecated'. That doesn't do 
anything yet, but I plan to add a 'disallow deprecated properties/nodes'
mode.

> then:
>   properties:
>     st,adc-channels: false
>     st,adc-diff-channels: false
> else:
>   - anyOf:
>       - required:
>           - st,adc-channels
>       - required:
>           - st,adc-diff-channels
> ---
>  .../bindings/iio/adc/st,stm32-adc.yaml        | 100 ++++++++++++++++--
>  1 file changed, 93 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> index a58334c3bb76..a1f6cbe144ba 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> @@ -222,6 +222,12 @@ patternProperties:
>        '#io-channel-cells':
>          const: 1
>  
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
>        interrupts:
>          description: |
>            IRQ Line for the ADC instance. Valid values are:
> @@ -265,7 +271,9 @@ patternProperties:
>            <vinp vinn>, <vinp vinn>,... vinp and vinn are numbered from 0 to 19.
>  
>            Note: At least one of "st,adc-channels" or "st,adc-diff-channels" is
> -          required. Both properties can be used together. Some channels can be
> +          required if no adc generic channel is defined. These legacy channel
> +          properties are exclusive with adc generic channel bindings.
> +          Both properties can be used together. Some channels can be
>            used as single-ended and some other ones as differential (mixed). But
>            channels can't be configured both as single-ended and differential.
>          $ref: /schemas/types.yaml#/definitions/uint32-matrix
> @@ -290,6 +298,44 @@ patternProperties:
>            each channel.
>          $ref: /schemas/types.yaml#/definitions/uint32-array
>  
> +    patternProperties:
> +      "^channel@([0-9]|1[0-9])$":
> +        type: object
> +        $ref: "adc.yaml"
> +        description: |
> +          Represents the external channels which are connected to the ADC.
> +
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 19
> +
> +          label:
> +            description: |
> +              Unique name to identify which channel this is.
> +              Reserved label names "vddcore", "vrefint" and "vbat"
> +              are used to identify internal channels with matching names.
> +
> +          diff-channels:
> +            $ref: /schemas/types.yaml#/definitions/uint32-array
> +            items:
> +              minimum: 0
> +              maximum: 19
> +
> +          st,min-sample-time-nsecs:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: |
> +              Minimum sampling time in nanoseconds. Depending on hardware (board)
> +              e.g. high/low analog input source impedance, fine tune of ADC
> +              sampling time may be recommended.
> +
> +        required:
> +          - reg
> +
> +    dependencies:
> +      $nodename: [ '#address-cells', '#size-cells' ]

Drop this. $nodename is not a real property.

> +
>      allOf:
>        - if:
>            properties:
> @@ -369,12 +415,6 @@ patternProperties:
>  
>      additionalProperties: false
>  
> -    anyOf:
> -      - required:
> -          - st,adc-channels
> -      - required:
> -          - st,adc-diff-channels
> -
>      required:
>        - compatible
>        - reg
> @@ -451,4 +491,50 @@ examples:
>          // other adc child node follow...
>        };
>  
> +  - |
> +    // Example 3: with stm32mp157c to setup ADC2 with:
> +    // - internal channels 13, 14, 15.
> +      #include <dt-bindings/interrupt-controller/arm-gic.h>
> +      #include <dt-bindings/clock/stm32mp1-clks.h>
> +      adc122: adc@48003000 {
> +        compatible = "st,stm32mp1-adc-core";
> +        reg = <0x48003000 0x400>;
> +        interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&rcc ADC12>, <&rcc ADC12_K>;
> +        clock-names = "bus", "adc";
> +        booster-supply = <&booster>;
> +        vdd-supply = <&vdd>;
> +        vdda-supply = <&vdda>;
> +        vref-supply = <&vref>;
> +        st,syscfg = <&syscfg>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        adc@100 {
> +          compatible = "st,stm32mp1-adc";
> +          #io-channel-cells = <1>;
> +          reg = <0x100>;
> +          interrupts = <1>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          channel@13 {
> +            reg = <13>;
> +            label = "vrefint";
> +            st,min-sample-time-nsecs = <9000>;
> +          };
> +          channel@14 {
> +            reg = <14>;
> +            label = "vddcore";
> +            st,min-sample-time-nsecs = <9000>;
> +          };
> +          channel@15 {
> +            reg = <15>;
> +            label = "vbat";
> +            st,min-sample-time-nsecs = <9000>;
> +          };
> +        };
> +      };
> +
>  ...
> -- 
> 2.17.1
> 
> 

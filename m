Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F535276257
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 22:43:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E06B179B;
	Wed, 23 Sep 2020 22:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E06B179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600893830;
	bh=zSdSXomTkt9IjD/fU3MeFBG3a2G3skjOyABD0YFRF4E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C5WqTdyrerJIGI3PWTIZLOybGkI/AlKrKIbW2pUYTO6B96q/6JljaervlUVKz+A2B
	 93UBcfnrGgTBQjA9CiuX+KyYsCnfxl7M2dLHW2rN0+zXL7tw9xOEce5Mqfi1EGotJo
	 9klyfX2jHJojT7v5N8Xg8BGMD61sw4rgGkU87oQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 342CFF8015F;
	Wed, 23 Sep 2020 22:42:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A3AFF80171; Wed, 23 Sep 2020 22:42:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04BB7F8015F
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 22:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04BB7F8015F
Received: by mail-io1-f67.google.com with SMTP id d190so977178iof.3
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 13:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RlUZjMU4duw214AYO6t6QWSC1dLgrNo875Jdwc3bxEc=;
 b=Z9ZvF7L2FvHFQ7dC2cfYc+Guvh14VxOJYBpwcd6TEUt2RIWRTtVZNa0cwipM81kJEC
 XCAwSN1zJanOjsc9n68/qOemft7Zl0oL5ek10JwXDcCMEg/Uz5iShg9aKBy4+ho12Ot0
 0QERTiWrUpSjCTjxdB8Rl5tbK8iRV5a5/gAJwlnkXr6Y6W9GSc8egPE+yaGFuCWSj6gy
 Ddm1hzyEMmJxGkSjQmMmjS1MvCE/bzzyRdjAYOqrXxKYxj2RI9wDd9sgSjAz3gCKeg3C
 zjzMVfcEYwPKgkzX4oZspfKQvqQdtUwGF26Uq/3ZlSJgbtt3zoh8u/2ywDPCiy0t+W+S
 2Jmg==
X-Gm-Message-State: AOAM5324tQXsCyw6khqOUFmw/EZKLVCiRe+NEhVjNpLRdK7mskNl1LCi
 7Z5qqcVIp84NTHP4Gq3j1Q==
X-Google-Smtp-Source: ABdhPJzMbLLYzgaphJVeHdGZ0Hi9G2/IgrFv27w4wrBHlwuEdliGpnuCLuOMx4lZHWCobKET72hNtg==
X-Received: by 2002:a02:11c2:: with SMTP id 185mr974444jaf.35.1600893718143;
 Wed, 23 Sep 2020 13:41:58 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id s17sm425424ilb.24.2020.09.23.13.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 13:41:57 -0700 (PDT)
Received: (nullmailer pid 1269697 invoked by uid 1000);
 Wed, 23 Sep 2020 20:41:54 -0000
Date: Wed, 23 Sep 2020 14:41:54 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH v6 2/5] ASoC: dt-bindings: Add dt binding for lpass hdmi
Message-ID: <20200923204154.GA1263348@bogus>
References: <1600409084-29093-1-git-send-email-srivasam@codeaurora.org>
 <1600409084-29093-3-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600409084-29093-3-git-send-email-srivasam@codeaurora.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 agross@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org
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

On Fri, Sep 18, 2020 at 11:34:41AM +0530, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Adds bindings for lpass hdmi interface
> which can support audio path over dp.
> 
> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 74 +++++++++++++++-------
>  1 file changed, 52 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> index 09c9bd2..f95ef70 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -24,9 +24,10 @@ properties:
>        - qcom,sc7180-lpass-cpu
>  
>    reg:
> -    maxItems: 1
> +    maxItems: 2
>      description: LPAIF core registers
> -
> +  reg-names:
> +     maxItems: 2
>    clocks:
>      minItems: 3
>      maxItems: 6
> @@ -36,15 +37,16 @@ properties:
>      maxItems: 6
>  
>    interrupts:
> -    maxItems: 1
> +    maxItems: 2
>      description: LPAIF DMA buffer interrupt
> -
> +  interrupt-names:
> +    maxItems: 2
>    qcom,adsp:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: Phandle for the audio DSP node
>  
>    iommus:
> -    maxItems: 1
> +    maxItems: 2
>      description: Phandle to apps_smmu node with sid mask
>  
>    power-domains:
> @@ -60,10 +62,12 @@ properties:
>      const: 0
>  
>  patternProperties:
> -  "(^mi2s-[0-9a-f]$|mi2s)":
> +  "^dai-link@[0-9a-f]$":
>      type: object
> -    description: Required properties for each DAI
> -
> +    description: |
> +      LPASS CPU dai node for each I2S device. Bindings of each node
> +      depends on the specific driver providing the functionality and
> +      properties.
>      properties:
>        reg:
>          maxItems: 1
> @@ -85,9 +89,11 @@ patternProperties:
>  required:
>    - compatible
>    - reg
> +  - reg-names
>    - clocks
>    - clock-names
>    - interrupts
> +  - interrupt-names
>    - '#sound-dai-cells'
>  
>  additionalProperties: false
> @@ -134,13 +140,32 @@ allOf:
>      then:
>        properties:
>          clock-names:
> -          items:
> -            - const: pcnoc-sway-clk
> -            - const: audio-core
> -            - const: mclk0
> -            - const: pcnoc-mport-clk
> -            - const: mi2s-bit-clk0
> -            - const: mi2s-bit-clk1
> +          oneOf:
> +           - items:   #for I2S
> +              - const: pcnoc-sway-clk
> +              - const: audio-core
> +              - const: mclk0
> +              - const: pcnoc-mport-clk
> +              - const: mi2s-bit-clk0
> +              - const: mi2s-bit-clk1
> +           - items:   #for HDMI
> +              - const: pcnoc-sway-clk
> +              - const: audio-core
> +              - const: pcnoc-mport-clk
> +        reg-names:
> +          anyOf:
> +            - items:   #for I2S and HDMI
> +              - const: lpass-hdmiif
> +              - const: lpass-lpaif

It would be a bit cleaner if you switch the order. Then you are just 
adding on to the end.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +            - items:   #for I2S
> +              - const: lpass-lpaif
> +        interrupt-names:
> +          anyOf:
> +            - items:   #for I2S and HDMI
> +              - const: lpass-irq-lpaif
> +              - const: lpass-irq-hdmi
> +            - items:   #for I2S
> +              - const: lpass-irq-lpaif
>        required:
>          - iommus
>          - power-domains
> @@ -152,12 +177,15 @@ examples:
>      soc {
>          #address-cells = <2>;
>          #size-cells = <2>;
> -        lpass@62f00000 {
> +        lpass@62d80000 {
>              compatible = "qcom,sc7180-lpass-cpu";
>  
> -            reg = <0 0x62f00000  0 0x29000>;
> -
> -            iommus = <&apps_smmu 0x1020 0>;
> +            reg = <0 0x62d87000 0 0x68000>,
> +                  <0 0x62f00000 0 0x29000>;
> +            reg-names = "lpass-hdmiif",
> +                        "lpass-lpaif";
> +            iommus = <&apps_smmu 0x1020 0>,
> +                     <&apps_smmu 0x1032 0>;
>              power-domains = <&lpass_hm 0>;
>  
>              clocks = <&gcc 131>,
> @@ -171,14 +199,16 @@ examples:
>                            "mclk0", "pcnoc-mport-clk",
>                            "mi2s-bit-clk0", "mi2s-bit-clk1";
>  
> -            interrupts = <0 160 1>;
> -
> +            interrupts = <0 160 1>,
> +                         <0 268 1>;
> +            interrupt-names = "lpass-irq-lpaif",
> +                              "lpass-irq-hdmi";
>              #sound-dai-cells = <1>;
>  
>              #address-cells = <1>;
>              #size-cells = <0>;
>              /* Optional to set different MI2S SD lines */
> -            mi2s-primary@0 {
> +            dai-link@0 {
>                  reg = <MI2S_PRIMARY>;
>                  qcom,playback-sd-lines = <1>;
>                  qcom,capture-sd-lines = <0>;
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 

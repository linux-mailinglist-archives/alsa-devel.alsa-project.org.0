Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C126D4607B9
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Nov 2021 17:55:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C96FE174D;
	Sun, 28 Nov 2021 17:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C96FE174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638118512;
	bh=gLIh2+fpFx3OuqE2Y7rFPy1u0rXNEuEUIIsaTQqXlHM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wf1mZ815u7e4AUt9ZKXNiCYaKzBkJ843yKT8ef5Fj0jxTr4der6YKHUh4rQh00PUs
	 6XHkR5rlOBhdqCU8x9QpoAdRiNJ1ncB3Fu/hviG6A0rqhJdCGOL6cLer4kwgMxphNi
	 JbW6wsntb36ae1muewzKUqI+Vg79oBdWEoRd27gE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 305F5F80149;
	Sun, 28 Nov 2021 17:53:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FA03F8028D; Sun, 28 Nov 2021 17:53:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE94AF80217
 for <alsa-devel@alsa-project.org>; Sun, 28 Nov 2021 17:53:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE94AF80217
Received: by mail-oi1-f179.google.com with SMTP id u74so29773737oie.8
 for <alsa-devel@alsa-project.org>; Sun, 28 Nov 2021 08:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=45c1gacm72RX4cF7zNnpU51xQn+kJSWSAn4Mo9Q7trc=;
 b=QIFEpZTxSk0luI7MlCj7gTg148jueAk9H6L+RGxkxvaEr7/2HATZBf1crookw3bTgs
 x3DleB6chiVEcjwQGQXYEvvibmjFqudw5xkixGVllrJ9SFz4QnFMt48SmKlEPNDSuZ4e
 B26OT9bfqAxqyeCgBHsleCHNhUXVDjOgXZO3c2MU0UazclUg7eJNymeR0tlzurSHvVWa
 YSxcNhauRrHKX9IH6cVpKtJp3fuoIofM7hJvqv1POQZVsiHFcuO/b942uola3u5U1c1w
 eLlu0SHLk6y+fKQQktiQAoQrDmgMpEUKgKCU7urdrSWSaCG2opv+g/0kt0bHj4XS9l3G
 xJtw==
X-Gm-Message-State: AOAM5305I3/8rerJeRR17HcqDQbgqRglgqKsEAmag8+uQi+UVIT4T9EN
 ULtrkw32PauIHkvh52nbIw==
X-Google-Smtp-Source: ABdhPJy7pyUbgpVnYnG9saZFi8PYobUToY1xZuAG64h436uSkvorpWBdVmBhJPtgTE5wStLGhyx8Cw==
X-Received: by 2002:a05:6808:120b:: with SMTP id
 a11mr36930823oil.128.1638118422790; 
 Sun, 28 Nov 2021 08:53:42 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d6:afc8:f6e9:d57a:3e26:ee41])
 by smtp.gmail.com with ESMTPSA id
 a17sm2437469oiw.43.2021.11.28.08.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 08:53:42 -0800 (PST)
Received: (nullmailer pid 2708024 invoked by uid 1000);
 Sun, 28 Nov 2021 16:53:37 -0000
Date: Sun, 28 Nov 2021 10:53:37 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH v6 08/10] ASoC: dt-bindings: Add SC7280 lpass cpu bindings
Message-ID: <YaO0ER2pNIQrvlxM@robh.at.kernel.org>
References: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
 <1637928282-2819-9-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1637928282-2819-9-git-send-email-srivasam@codeaurora.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <potturu@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 agross@kernel.org, swboyd@chromium.org, lgirdwood@gmail.com,
 broonie@kernel.org, rohitkr@codeaurora.org, bjorn.andersson@linaro.org,
 judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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

On Fri, Nov 26, 2021 at 05:34:40PM +0530, Srinivasa Rao Mandadapu wrote:
> Add bindings for sc7280 lpass cpu driver which supports
> audio over i2s based speaker, soundwire based headset, msm dmics
> and HDMI Port.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 69 +++++++++++++++++++---
>  1 file changed, 61 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> index 1e23c0e..0f5a57c 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -22,35 +22,36 @@ properties:
>        - qcom,lpass-cpu
>        - qcom,apq8016-lpass-cpu
>        - qcom,sc7180-lpass-cpu
> +      - qcom,sc7280-lpass-cpu
>  
>    reg:
> -    maxItems: 2
> +    maxItems: 5
>      description: LPAIF core registers
>  
>    reg-names:
> -    maxItems: 2
> +    maxItems: 5
>  
>    clocks:
>      minItems: 3
> -    maxItems: 6
> +    maxItems: 7
>  
>    clock-names:
>      minItems: 3
> -    maxItems: 6
> +    maxItems: 7
>  
>    interrupts:
> -    maxItems: 2
> +    maxItems: 4
>      description: LPAIF DMA buffer interrupt
>  
>    interrupt-names:
> -    maxItems: 2
> +    maxItems: 4
>  
>    qcom,adsp:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: Phandle for the audio DSP node
>  
>    iommus:
> -    maxItems: 2
> +    maxItems: 3
>      description: Phandle to apps_smmu node with sid mask
>  
>    power-domains:
> @@ -69,7 +70,7 @@ patternProperties:
>    "^dai-link@[0-9a-f]$":
>      type: object
>      description: |
> -      LPASS CPU dai node for each I2S device. Bindings of each node
> +      LPASS CPU dai node for each I2S device or Soundwire device. Bindings of each node
>        depends on the specific driver providing the functionality and
>        properties.
>      properties:
> @@ -174,6 +175,58 @@ allOf:
>          - iommus
>          - power-domains
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sc7280-lpass-cpu
> +
> +    then:
> +      properties:
> +        clock-names:
> +          oneOf:
> +            - items:   #for I2S
> +                - const: lpass_aon_cc_audio_hm_h_clk
> +                - const: lpass_core_cc_sysnoc_mport_core_clk
> +                - const: lpass_core_cc_ext_if1_ibit_clk
> +            - items:   #for Soundwire
> +                - const: lpass_aon_cc_audio_hm_h_clk
> +                - const: lpass_audio_cc_codec_mem0_clk
> +                - const: lpass_audio_cc_codec_mem1_clk
> +                - const: lpass_audio_cc_codec_mem2_clk
> +            - items:   #for HDMI
> +                - const: lpass_aon_cc_audio_hm_h_clk

'lpass_' and '_clk' are redundant.

> +
> +        reg-names:
> +          anyOf:
> +            - items:   #for I2S
> +                - const: lpass-lpaif
> +            - items:   #for I2S and HDMI
> +                - const: lpass-hdmiif
> +                - const: lpass-lpaif

Doesn't this apply to other SoCs?

> +            - items:   #for I2S, soundwire and HDMI
> +                - const: lpass-cdc-lpm
> +                - const: lpass-rxtx-lpaif
> +                - const: lpass-va-lpaif
> +                - const: lpass-hdmiif
> +                - const: lpass-lpaif

'lpass-' is redundant too, but consistency across SoCs is better.

hdmiif and lpaif should be first. (Add new resources on the end.)

> +        interrupt-names:
> +          anyOf:
> +            - items:   #for I2S
> +                - const: lpass-irq-lpaif
> +            - items:   #for I2S and HDMI
> +                - const: lpass-irq-lpaif
> +                - const: lpass-irq-hdmi
> +            - items:   #for I2S, soundwire and HDMI
> +                - const: lpass-irq-lpaif
> +                - const: lpass-irq-vaif
> +                - const: lpass-irq-rxtxif
> +                - const: lpass-irq-hdmi

Again, add new entries to the end.

> +
> +      required:
> +        - iommus
> +        - power-domains
> +
>  examples:
>    - |
>      #include <dt-bindings/sound/sc7180-lpass.h>
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
> 

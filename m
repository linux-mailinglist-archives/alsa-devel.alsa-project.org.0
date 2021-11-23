Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5750D45A2A7
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 13:31:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D961A166D;
	Tue, 23 Nov 2021 13:30:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D961A166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637670688;
	bh=5U9Bwu44/6wIqeHWhAUBrUIye27LsdA7QXGxUHTl6tE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BZF/uk1ddbauzHWfXKhWCQvLJaQOr5mGgrqsqKTI6tQ1iPujy+2kKUZxAQYu3j607
	 m75N97+2qVKEVLuCEAv805hWZegrLB6cXYm7jL401fsTE1GOViRNWQD6lh3huoM5f8
	 ExCwEgA3sHUsyWnMWeyOKh8fl6/Kuz7HQBCWKuV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5910F80515;
	Tue, 23 Nov 2021 13:29:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F667F80511; Tue, 23 Nov 2021 13:28:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C256F804F1
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 13:28:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C256F804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OD+6KF5Y"
Received: by mail-wr1-x42f.google.com with SMTP id r8so38593013wra.7
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 04:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rVG2OvFNtwuvGocTJEIePQliGx/5pyumNMpZCeSGnRQ=;
 b=OD+6KF5Y5qceY/zxVgxxPcEVQMUX0pZeUD8ypVQ/WNqhPJX2wPyMbs3SJkvoc6mfty
 SJkZN2I4aTJ8+U3u1savTJ5kq9IVnPtogvFYMUfbpL3gbyWsSw6Df7y7+xDAf0ic626g
 HSLaxA5Sssu9e1GkKsgrhbpyRW2JiBLBMzh7Vaq7zZbvNEqpLi5EUyAk0IHyEYExkNkP
 CA8hJr4OrxFH3ZwQ2LKRJ8VCJ/0caM3tx5hIybVYeiPjHR9joeypipiq0LOudwNotdOI
 z76xvyMRizrFa5Ksn+ckgm2GrQw8H+dkJ6Ng+UJiP3bjGLi71SYksK7e3IkJtnr4pmST
 oUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rVG2OvFNtwuvGocTJEIePQliGx/5pyumNMpZCeSGnRQ=;
 b=7wb04BYmVkjIWHf0KDI2E9Fc2bhIZtUEk1qr2nzO08teaXFVGfyy8LfoCgOY2gkeRw
 eiPxXiwzACmXdB9rkaNGWBD+R74mCyUrKZeZ/00jNbvg9XkxMWcXbx+Mg1vVUhKnn3D5
 MS5F1U90wkDr8WMT+ST3VK35wftaG7f4rXskC9tcgkKLoq6Xsp0ENFIkM4BI/zDJyINv
 R7kZHLz6N+EQ8lO0ZF5WQh0HRuvZWeG+y1QuAZNMF/jkdL6jw4bgCWSpVgNAzwj75ItC
 7QDR7ZgFB4IWCb3wmsR5xgf6xPkuIz0EVgeML0JLrUHYRAxrHb6lEXkpsi6Jo1eGb1zH
 eaSQ==
X-Gm-Message-State: AOAM531wmTlk4gacjQgLTMl+NTOSlA5lDPh47cJV7p/G6tLL+Y0Hl2Mp
 wQ55f9ddBaT7L3zYI7smVOLh/w==
X-Google-Smtp-Source: ABdhPJw2G3xBF8JO9ULiAtM6rn77suLuvt/9/yYIPGC1AaRp7/soYwduibi0SyYdmFhXiTVcCegtww==
X-Received: by 2002:a5d:624f:: with SMTP id m15mr6905140wrv.13.1637670528084; 
 Tue, 23 Nov 2021 04:28:48 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id z18sm12160056wrq.11.2021.11.23.04.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 04:28:47 -0800 (PST)
Subject: Re: [PATCH v5 08/10] ASoC: dt-bindings: Add SC7280 sound card bindings
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1637581599-24120-1-git-send-email-srivasam@codeaurora.org>
 <1637581599-24120-4-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6bc587a0-fa8a-4509-99d9-f76aa2418c0b@linaro.org>
Date: Tue, 23 Nov 2021 12:28:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637581599-24120-4-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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



On 22/11/2021 11:46, Srinivasa Rao Mandadapu wrote:
> Add bindings for lpass sc7280 based soundcards which supports
> audio over i2s based speaker, soundwire based headset, msm dmics
> and HDMI Port.
> 


Subject line is totally missleading,

This is not a soundcard bindings but its lpass cpu bindings.

--srini
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 69 +++++++++++++++++++---
>   1 file changed, 61 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> index 1e23c0e..0f5a57c 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -22,35 +22,36 @@ properties:
>         - qcom,lpass-cpu
>         - qcom,apq8016-lpass-cpu
>         - qcom,sc7180-lpass-cpu
> +      - qcom,sc7280-lpass-cpu
>   
>     reg:
> -    maxItems: 2
> +    maxItems: 5
>       description: LPAIF core registers
>   
>     reg-names:
> -    maxItems: 2
> +    maxItems: 5
>   
>     clocks:
>       minItems: 3
> -    maxItems: 6
> +    maxItems: 7
>   
>     clock-names:
>       minItems: 3
> -    maxItems: 6
> +    maxItems: 7
>   
>     interrupts:
> -    maxItems: 2
> +    maxItems: 4
>       description: LPAIF DMA buffer interrupt
>   
>     interrupt-names:
> -    maxItems: 2
> +    maxItems: 4
>   
>     qcom,adsp:
>       $ref: /schemas/types.yaml#/definitions/phandle
>       description: Phandle for the audio DSP node
>   
>     iommus:
> -    maxItems: 2
> +    maxItems: 3
>       description: Phandle to apps_smmu node with sid mask
>   
>     power-domains:
> @@ -69,7 +70,7 @@ patternProperties:
>     "^dai-link@[0-9a-f]$":
>       type: object
>       description: |
> -      LPASS CPU dai node for each I2S device. Bindings of each node
> +      LPASS CPU dai node for each I2S device or Soundwire device. Bindings of each node
>         depends on the specific driver providing the functionality and
>         properties.
>       properties:
> @@ -174,6 +175,58 @@ allOf:
>           - iommus
>           - power-domains
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
> +
> +        reg-names:
> +          anyOf:
> +            - items:   #for I2S
> +                - const: lpass-lpaif
> +            - items:   #for I2S and HDMI
> +                - const: lpass-hdmiif
> +                - const: lpass-lpaif
> +            - items:   #for I2S, soundwire and HDMI
> +                - const: lpass-cdc-lpm
> +                - const: lpass-rxtx-lpaif
> +                - const: lpass-va-lpaif
> +                - const: lpass-hdmiif
> +                - const: lpass-lpaif
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
> +
> +      required:
> +        - iommus
> +        - power-domains
> +
>   examples:
>     - |
>       #include <dt-bindings/sound/sc7180-lpass.h>
> 

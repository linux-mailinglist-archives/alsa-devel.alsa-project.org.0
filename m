Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B36A667CA72
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 13:02:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECEBD1DB;
	Thu, 26 Jan 2023 13:02:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECEBD1DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674734577;
	bh=dQId4p7nxTR8eFZubKzKPubj+/XIr6DRlFpWy4UBq6U=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dcbxwIoNnVntKiRHuEpt4UxfBx5kXW54CLB/D8AfMQmC9+LdXlgSeD8MY3VL1dZ6K
	 ftyHPZ7rVx9gtL+9ryVR+EM4BbA/w7+CoeD+kctJ36+G8MCAIeg0T0cbGJ7twwFz96
	 KnKAg0WNs3Eyr57D/Sw2ZlHkw3bYnfLlijBdN+bc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A773F8016E;
	Thu, 26 Jan 2023 13:01:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21C56F8027D; Thu, 26 Jan 2023 13:01:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C444F8016E
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 13:01:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C444F8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Rswj04CG
Received: by mail-wr1-x42d.google.com with SMTP id h12so1513749wrv.10
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 04:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jxZC6LLZuJ2Wkp1f5+/EfRQ8da/gCgTKGWvHnHflOhU=;
 b=Rswj04CGt0Ro3ujr1S3ZR7Y4N7ASGIziExdcXQQ1t0tAHoOBAp+Rv5Ajen5TTCq6Uz
 V+gbLHslr8DIqj/sRgvvvf8NUzKPPd6cmc9xvD1L7rcVbwPmzDsw3cAt+hTyMsnIl2PM
 rgekxtRTULXWNdJGG/boM6Zhy9E4nKwbd+2Nja0PJkbK/LewLdXrLTCKK7crMd27onpI
 n8C54T/Wl9738vrpLNe2zjqr1R6cr0NVVjTzmHzTSL6zGTDH6BsMb/kPsihpsNZP6JV2
 4KMrSIN3h6M0XEtV1Vs7I6kkZoOtFnpJKm+11aqUHNkqsMd0Fezu0O+W/aj2Dutu8cc/
 TFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jxZC6LLZuJ2Wkp1f5+/EfRQ8da/gCgTKGWvHnHflOhU=;
 b=ieQ1b+st/xlnbGyhLOniD5JuIoAoAqO7zuYp84kKGfiPNuH/BcvEGtWiK5jVFVBfOG
 HyPa/Zx7nGlUcnJSNS1XIXFCRXegs7aDS2RNyenmC5C3piho1WBwsR44pDG0DO/rO9x5
 H7T5OzleCk8xB/nP61snNzOvMGD0LKh/AGywXjHOEhCFQUaOTaaXPgQhtWRmYYEdMPqp
 fX4j6A79aZTFKtAQDPd/sKUbBLPiDu/EfNd5bgBusv7IJ8nAuvBo/6VUJOgr3ilr+OWY
 0Vxps4f/yQLZCVWyjHzIPG/ZcXKGut+K83pFud+h7+lh+SyjWI+eFdUSmsS5tr3cvhr3
 5/VQ==
X-Gm-Message-State: AFqh2koWAZK9OWvG9zIgVGGukjPKRkifXb5SnCjAwfed60D6i3b4/II/
 jLsx6UTGobE5AkS1rEbXqQFfZA==
X-Google-Smtp-Source: AMrXdXvJKL26MJpG47M527MVT8QsOcuIjm1qzs/c5EZqKeKst2KGGu2u0oX9JCS35u+WUqsyvQMexQ==
X-Received: by 2002:a5d:67d2:0:b0:2be:50a7:cfa9 with SMTP id
 n18-20020a5d67d2000000b002be50a7cfa9mr20937182wrw.63.1674734506461; 
 Thu, 26 Jan 2023 04:01:46 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a5d6542000000b00267bcb1bbe5sm1153739wrv.56.2023.01.26.04.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 04:01:46 -0800 (PST)
Message-ID: <05e55db1-5181-8025-8aee-e398200b047c@linaro.org>
Date: Thu, 26 Jan 2023 13:01:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 14/22] dt-bindings: usb: dwc3: Add
 snps,num-hc-interrupters definition
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, lgirdwood@gmail.com,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-15-quic_wcheng@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126031424.14582-15-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 26/01/2023 04:14, Wesley Cheng wrote:
> Add a new definition for specifying how many XHCI secondary interrupters
> can be allocated.  XHCI in general can potentially support up to 1024
> interrupters, which some uses may want to limit depending on how many
> users utilize the interrupters.

I cannot find in the code any user of this. Your next patch stores it,
but which other patch uses stored value?

What I still don't get how is this exactly hardware property, not policy
or driver choice.

> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> index 6d78048c4613..4faaec9655e0 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -349,6 +349,18 @@ properties:
>      items:
>        enum: [1, 4, 8, 16, 32, 64, 128, 256]
>  
> +  snps,num-hc-interrupters:
> +    description:
> +      Defines the maximum number of XHCI host controller interrupters that can
> +      be supported.  The XHCI host controller has support to allocate multiple
> +      event rings, which can be assigned to different clients/users.  The DWC3
> +      controller has a maximum of 8 interrupters.  If this is not defined then
> +      the value will be defaulted to 1.  This parameter is used only when
> +      operating in host mode.
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    minimum: 1
> +    maximum: 8

default: 1

> +
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>      description:

Best regards,
Krzysztof


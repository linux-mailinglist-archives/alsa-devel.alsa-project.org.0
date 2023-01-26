Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2408267CA7C
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 13:05:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 238211DB;
	Thu, 26 Jan 2023 13:04:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 238211DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674734710;
	bh=3f+OrD7oGgyoD2DdQ7L/2VXDzxJ5Uf8cr7/JaBPuPA8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Pgm/DZMmd/O9eBZDkcm05LA8TNeRPW0CG6KjtEGE/AX9F7ODcId4/BfpsW+1t6KJm
	 rGeK/MVJ/yFlu8SbPb3XQg3y5beuKW6Z09W38S2AwoYVDxuPSW9uLh/ikvLqS9oWYc
	 8BJ2nlxQk1kwZABf+R/byi1UZEYPJmV0DGpaDEeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C735F8016E;
	Thu, 26 Jan 2023 13:04:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17710F8027D; Thu, 26 Jan 2023 13:04:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D3BFF8016E
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 13:04:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D3BFF8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=L84Uy1hw
Received: by mail-wm1-x329.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso3096596wmn.5
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 04:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GVvADtVeyYptFWF0MydblAJtxtKctGx6MpVLSGR2LlE=;
 b=L84Uy1hwTkVHRhQ3dVQI6CQdYNLEwmKIHOfwhOdxyvMcy4OUH4bylSASxR/tqpX8p5
 NLXY5VCrscWlUqc1bLDhnR/DbAFgomJ3iU+D9Kcwtr4UZLZve+oAzu8OFTcU66e31+hL
 fATs8XFrDz5IRN/5eL6slYS4c7Iehsnko3Kz6f7w71LzCtrtJfKf8DTk/Xc/5Y7FuK/F
 CmMxZ/cddW8JIVKNfk3da+Yzo29zfJvoT0qNZqLRxDCMxEK0i7EBXbkirjP+n8OnKdcI
 PH/6dQOIT53Kr0zJKrRl/RwhZxLkAinC3dOqOwqBqZXiD+FOiVGMtL+y6kR3yUNKjBdn
 a5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GVvADtVeyYptFWF0MydblAJtxtKctGx6MpVLSGR2LlE=;
 b=PITZilxFpDC+Af7b6siackq87JQzi/A08tAh4LkEptosHTrOiwl1gJ8TFZqIa0rNlL
 21RYJt4WPgWMhKZ3xQ261XhE3TlrytAuIUR/BKOg6zsCXmAOXKeyh6vkm5yo4DAF3vR5
 BADm4wmF1W0eAY+EY4yRzCF0YD6O8oG9/qMkI9VvK1/h9z36FSsS8K9+O0SoSWX2wonR
 XLVix0T3AlRUO9obC68MU1c6/XsnABlCOxnfmWPdJe+yGheSTgJ1DpMy3a6G4u2L1cgB
 +ozIO90gMnD1BrNc0PI6yvI9to1pC5MPtmOn/j8kxmPVNaQLr1Bk4EbCFscFF/UDwhw0
 W3uw==
X-Gm-Message-State: AFqh2kouVBxD8QunZnq1Vo9RNhd5Eu4qWWdGFb0Cbpj9CYSrMPC5YuK2
 D6bAqxHefkF0N2tk2SCMyWW22hP4Bt2EI8oB
X-Google-Smtp-Source: AMrXdXvswf6o+FLrL8oSK0T/z89VYOCOqxTXsD7xa1Luv/CMKcJo5ayhihdj+Fv0ZyQgV3x979I4ww==
X-Received: by 2002:a05:600c:214f:b0:3cf:7197:e67c with SMTP id
 v15-20020a05600c214f00b003cf7197e67cmr35714366wml.25.1674734640378; 
 Thu, 26 Jan 2023 04:04:00 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 l38-20020a05600c08a600b003d358beab9dsm1200363wmp.47.2023.01.26.04.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 04:03:59 -0800 (PST)
Message-ID: <3d076b05-6953-abe4-44de-3badacd55887@linaro.org>
Date: Thu, 26 Jan 2023 13:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RFC PATCH v2 21/22] ASoC: dt-bindings: Add Q6USB backend bindings
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, lgirdwood@gmail.com,
 andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, broonie@kernel.org,
 bgoswami@quicinc.com, tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-22-quic_wcheng@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126031424.14582-22-quic_wcheng@quicinc.com>
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
> Add a dt-binding to describe the definition of enabling the Q6 USB backend
> device for audio offloading.  The node carries information, which is passed
> along to the QC USB SND class driver counterpart.  These parameters will be
> utilized during QMI stream enable requests.

Subject: drop second/last, redundant "bindings". The "dt-bindings"
prefix is already stating that these are bindings.

> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../bindings/sound/qcom,q6usb-dais.yaml       | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> new file mode 100644
> index 000000000000..e24b4d52fa7e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,q6usb-dais.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm ASoC USB backend DAI
> +
> +maintainers:
> +  - Wesley Cheng <quic_wcheng@quicinc.com>
> +
> +description:
> +  The Q6USB backend is a supported AFE port on the Q6DSP. This backend
> +  driver will communicate the required settings to the QC USB SND class
> +  driver for properly enabling the audio stream.  Parameters defined
> +  under this node will carry settings, which will be passed along during
> +  the QMI stream enable request.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,q6usb-dais
> +
> +  iommus:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 1
> +
> +  qcom,usb-audio-stream-id:
> +    description:
> +      SID for the Q6DSP processor for IOMMU mapping.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  qcom,usb-audio-intr-num:
> +    description:
> +      Desired XHCI interrupter number to use.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +required:
> +  - compatible
> +  - '#sound-dai-cells'

Use consistent quotes - either " or '

> +  - qcom,usb-audio-intr-num
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    usbdai: usbd {

Generic node name, so: dais

Drop also label, not needed/used in example.

> +      compatible = "qcom,q6usb-dais";
> +      #sound-dai-cells = <1>;
> +      iommus = <&apps_smmu 0x180f 0x0>;
> +      qcom,usb-audio-stream-id = <0xf>;
> +      qcom,usb-audio-intr-num = <2>;
> +    };

Best regards,
Krzysztof


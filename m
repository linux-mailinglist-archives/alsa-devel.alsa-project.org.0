Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEADF67D0DA
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 17:03:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D36EBE74;
	Thu, 26 Jan 2023 17:02:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D36EBE74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674748985;
	bh=o5fw/D/+2f2WvkIcThjS/M3rGLZVBwzKkJMCEpU/TBw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WemdjKV2l67MBEt5WOor5dEkW/rz+fv92Le0Bw3Hprm4KIZ2Brt0YEYzyj7RJS7OL
	 mQ3kFya5+ogj8Rw9UvjmRKZ/yMEon3wfva1DNugLvNchzpesZR/VaDhFn6kY4T4hyT
	 t8pOLb7SS9sB9XMdIBHtfJQI3DQB6/Dz8jfRVc60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19F4FF800AE;
	Thu, 26 Jan 2023 17:02:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35949F8027D; Thu, 26 Jan 2023 17:02:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA9D1F800AE
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 17:01:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA9D1F800AE
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=BUsa7nCQ
Received: by mail-lf1-x136.google.com with SMTP id x40so3651154lfu.12
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 08:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z5Ms9/N7/h+Q3K/7Kcf2QDN/nKdDnsv1ksmJeqEJ4s8=;
 b=BUsa7nCQKL2wwrfAC+d6ATNxemzFJRPIToCfIKKNH3Aybg3LBuGXZcTveogBaeJwfZ
 v9BWLB1Gc3ulWTpl/CbcHBpBShbk/dBoswFnuh8nWEM861BYi/muql6nwbqp3NUU9BnM
 m99w7WloEb405olLaX4bQVlGkhyU5b62ZBA4LMtHawwWICGnzl2zXA1f21EhYjpYhAr8
 UW29g5fMyhmHY76FpEcUWelG+/f8A7mTPhs7soOwgUJNx2z18wDHGBf7F1vschF6VFnY
 OKITevXq83JgiEseptkms9J23mFehGp9VKNu3GiSeVlzWwWHN6b0jHiYNCqo7IGcCv2N
 s38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z5Ms9/N7/h+Q3K/7Kcf2QDN/nKdDnsv1ksmJeqEJ4s8=;
 b=I+s5CZMl91pX6BGufwPj5e93/rZKApeYqUbWBoaufDCfK5KFMOUs1EmSZ5SXhv5Cy0
 sWgKy+EGzLrP8r2DfOFkkSXQuZHuMzNiR6dqF6Nf81a5AHUfdA4PwEwgCtcFpG7GQSNe
 xDtnpqAkObgomzJLXecBySe+hN7MkZ7Cg7smpruqplSLS4ssWyI2nVaGSL+IlJ7sophO
 q2B0E9xWOTD6Hyd9WUQdWjkxaB+x5oRde2hXy4rJjVU5ziMgSmpF5eA5r9/5pIeCoQBo
 kWtSKuM8g/IQH6CD8tO3A+qyzmpglTDM2p1USOXRAAvlDTnBaOOugHlidgemXRjT7+Q0
 6aJg==
X-Gm-Message-State: AFqh2kpKGraOTWXTE3QSQ/hFxwHQsu/6ZsDHGN9jPN0egGbbJHM6CNrk
 5YZcsKHlL0odwbYuD2n6qZ4l9A==
X-Google-Smtp-Source: AMrXdXvkVKfZdcsjY2sUxC828zVsk7+QQCWicTlakTGR1QBfrqe0HQ31k4Fm+iuXbse2OEbGopoRVA==
X-Received: by 2002:ac2:4f0c:0:b0:4cc:6ffd:9fe6 with SMTP id
 k12-20020ac24f0c000000b004cc6ffd9fe6mr9574037lfr.50.1674748909319; 
 Thu, 26 Jan 2023 08:01:49 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 y8-20020adfdf08000000b002bfb31bda06sm1700126wrl.76.2023.01.26.08.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 08:01:48 -0800 (PST)
Message-ID: <d6af0436-6c73-8fe0-0627-af18120adca8@linaro.org>
Date: Thu, 26 Jan 2023 16:01:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 21/22] ASoC: dt-bindings: Add Q6USB backend bindings
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 perex@perex.cz, lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
 tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-22-quic_wcheng@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230126031424.14582-22-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 26/01/2023 03:14, Wesley Cheng wrote:
> Add a dt-binding to describe the definition of enabling the Q6 USB backend
> device for audio offloading.  The node carries information, which is passed
> along to the QC USB SND class driver counterpart.  These parameters will be
> utilized during QMI stream enable requests.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>   .../bindings/sound/qcom,q6usb-dais.yaml       | 55 +++++++++++++++++++
>   1 file changed, 55 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6usb-dais.yaml
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

We could derive this directly from iommus property as we do it like 
q6asm-dai.c


--srini
> +
> +  qcom,usb-audio-intr-num:
> +    description:
> +      Desired XHCI interrupter number to use.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +required:
> +  - compatible
> +  - '#sound-dai-cells'
> +  - qcom,usb-audio-intr-num
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    usbdai: usbd {
> +      compatible = "qcom,q6usb-dais";
> +      #sound-dai-cells = <1>;
> +      iommus = <&apps_smmu 0x180f 0x0>;
> +      qcom,usb-audio-stream-id = <0xf>;
> +      qcom,usb-audio-intr-num = <2>;
> +    };

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B13CE656288
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Dec 2022 13:26:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B21C3603D;
	Mon, 26 Dec 2022 13:25:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B21C3603D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672057592;
	bh=nooJaX6+1vOxDEgtmDrRxguy9HGycBVdtgGBNvtiMBs=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WLTGpye37j3O7FGue8Vu6gb4IBqlrGZf4q/8JEWT0uyafBJ5jxcIYlrD0yxs/uys/
	 r4Sxm6VeRH8EFgGQzxP1tTH8Ql0Dds5vox2W0cjkwPc+GzzMMQmcB3aA/kRVOVkIz9
	 mqCFH9LiqGIVFll8yOLrSRigWBfcu2l7YjUUibEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADB29F800F0;
	Mon, 26 Dec 2022 13:25:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A46A2F80310; Mon, 26 Dec 2022 13:25:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E366DF8027B
 for <alsa-devel@alsa-project.org>; Mon, 26 Dec 2022 13:25:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E366DF8027B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DLOhe33X
Received: by mail-lf1-x133.google.com with SMTP id j17so6258559lfr.3
 for <alsa-devel@alsa-project.org>; Mon, 26 Dec 2022 04:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NRqJFN65mXrfiQ1epZASIoX5WyuOxWca2c7oRHRoZjM=;
 b=DLOhe33XdER4swyGLgfV7GbL6eNqemhX/aqMfZnZ1OEOz1xgr7mBNixNL2f326fs/4
 CnyK46s63Rd8noz46H5FSU/xk4pfE85mO7KXURaIkeqDvFawW7C3HtkiA2UZGWoDik6R
 /NwNomtQMunHbNPrK2UZSYFm6EHAaTsZSaXZXbpBRNacIimKZvh90fd3X1t9UX8KRldO
 lwputwilz7Mfc8puKoOUFl419uLDxRk1pZKVN/6t23LL3tD5s/oNJbzoAk7qpWY7Am6U
 e7k67mOFp4A3oc+RH46XQdW99EpeBbLah3xRuPIW5Gfni3QjiE8kaDvwrxYgZEmLC9gJ
 O9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NRqJFN65mXrfiQ1epZASIoX5WyuOxWca2c7oRHRoZjM=;
 b=OsX3UIh9+i6Q08UoVAD3+NDssQ92oMYmM7J0w9DsIb7emdD7+QFWE0b7PzMODo8uBV
 MnfJTBA37rWcE0txskDqrESdJzP0uoGNgytWrP5yqLJcPCqORnKZ9GW+7hmSvXS/viMN
 IsNYpFmpz46Sc8sYCvuENm3eih+I+sj8mhN7FBTVm97Pq6vKUphLl7aw+/vbQs9ENI1d
 uFpScSDXn3MryCD079os466zgQ8HAASWk7+43bdL9HqRJi1KpDba3QqTnGXZGhkbgB1a
 DI+mBfeDNMqRN7OJ1CE0Oo/vtdryBOJNRZ//KGbNFv3/x4HMspE25xVlXADiP69xLXUp
 abnA==
X-Gm-Message-State: AFqh2ko47Heq/pYkeHDAhnfIqwzm/WUUEfqgLVixmM6HzTTHQaAE9Y1N
 kx4Opn4NWM441X/e1DifGQBBag==
X-Google-Smtp-Source: AMrXdXtSdYzIsTPbhF0aulD8Cu0NnVleFHmKjqs8pLgkPeEupjmhRtJetW1s2qWA73/Tgv8rl39lUQ==
X-Received: by 2002:a05:6512:15a3:b0:4b1:3970:43da with SMTP id
 bp35-20020a05651215a300b004b1397043damr7669959lfb.51.1672057526622; 
 Mon, 26 Dec 2022 04:25:26 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 c3-20020ac25f63000000b004b55075f813sm1786829lfc.227.2022.12.26.04.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Dec 2022 04:25:26 -0800 (PST)
Message-ID: <40efb96f-fa0c-c366-bab8-ac6488265759@linaro.org>
Date: Mon, 26 Dec 2022 13:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 13/14] ASoC: dt-bindings: Add Q6USB backend bindings
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh+dt@kernel.org, agross@kernel.org
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-14-quic_wcheng@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221223233200.26089-14-quic_wcheng@quicinc.com>
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

On 24/12/2022 00:31, Wesley Cheng wrote:
> Add a dt-binding to describe the definition of enabling the Q6 USB backend
> device for audio offloading.  The node carries information, which is passed
> along to the QC USB SND class driver counterpart.  These parameters will be
> utilized during QMI stream enable requests.
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

What is "ASoC"? Does not look like Qualcomm name for hardware, but
rather Linux, so should be dropped or changed to SoC or ADSP etc.

> +
> +maintainers:
> +  - Wesley Cheng <quic_wcheng@quicinc.com>
> +
> +description:
> +  The Q6USB backend is a supported AFE port on the Q6DSP. This backend

What does "supported AFE port" mean? Can an AFE port be unsupported?

> +  driver will communicate the required settings to the QC USB SND class

If you mean Linux driver, then please drop entirely all references to
drivers. In other case, please explain more.

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

Why this is not part of regular iommus property? It's the first time
something like this appears in Qualcomm hardware, so I wonder why this
DAI is special?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  qcom,usb-audio-intr-num:
> +    description:
> +      Desired XHCI interrupter number to use.

What does it mean? Interrupts are defined with "interrupts" property, so
you need to explain more.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +required:
> +  - compatible
> +  - '#sound-dai-cells'

Keep consistent quotes - either ' or "

> +  - qcom,usb-audio-intr-num
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    usbdai: usbd {

Generic node names, so dai or dais


> +      compatible = "qcom,q6usb-dais";
> +      #sound-dai-cells = <1>;
> +      iommus = <&apps_smmu 0x180f 0x0>;
> +      qcom,usb-audio-stream-id = <0xf>;
> +      qcom,usb-audio-intr-num = <2>;
> +    };

Best regards,
Krzysztof


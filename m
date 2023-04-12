Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 520C26DFA08
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 17:29:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 359861087;
	Wed, 12 Apr 2023 17:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 359861087
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681313355;
	bh=TOlpyBBEk3HGG8k0OB1qm7t1z9ZSx9z71R1L3qgB9TA=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vm8J1NjzDr2oMIl4Kl0w2jVYy/qUTbeCIM3p/ed3JqysXQVBl+42wQvmCw5LDtDRg
	 /mBZpugtbr36Fa/gq4UvhKX5Nb3pA7/8znmfOOH3gQy02uNVG8rZLixEo51ch7PJr6
	 x3h3UpoDulcMmWhcKmOxYm6OBqNEs+lNk8ZGIFS4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEF76F8032B;
	Wed, 12 Apr 2023 17:28:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A646F8049C; Wed, 12 Apr 2023 17:28:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9079FF8025E
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 17:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9079FF8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vwS4hlPb
Received: by mail-ej1-x631.google.com with SMTP id xi5so29846046ejb.13
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Apr 2023 08:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681313293; x=1683905293;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w/f8fWx95RPy53FPFSPsxhx2yeOjkbYiJk0FpqalEok=;
        b=vwS4hlPbleuafP0JkJ+DqcRIjQtLA+RHSlatsgZN0E376IXiO3XOWyduiOswxM5yrG
         EOYE7gyWI4GRdYBJe2ZGle0t8VTVfYdZr5a4EcY1+d0+NWJEhhbljBOfUFU/j5hs194W
         yIMPj/UVYbEyoIZZq1p63Zi8hmR5O3+TBYrPQoYhafZu4FQ3Hl02NXQHHOYSImfMDHIU
         qujYUuPaY6WTqd7i0LMv41bkm4I5GjqJrFoGmjk4aMBBnTenWTLbUCqIjA/1rboQbFoV
         UaIuhCa1UCxP8/3X7G3EeknkU3uofDWuG9a4/eA0rPrSAeCaoi9t+sGtcEW7GSe6oVf6
         eKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681313293; x=1683905293;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w/f8fWx95RPy53FPFSPsxhx2yeOjkbYiJk0FpqalEok=;
        b=GAlkv4GIsgC1CvMWAEtcjrhMBVvgAEgDmIVfbxp6mGXNXyPeWgOPNpgZONNwsAA93W
         wmaINtbRFxqAGH/qhZlJwE2ZwQsK2CSFXCf8L9lmnj93+N0z+H2tuQybUJCHPOB9rUF5
         3szzkg/ZM0RXlRrvaG6efgpuCB9/UpeKzRKts37r6FoD/b0MGQiRVwPR73M/bSXJJ6i4
         7SDW3hgi/XJNn7VNF8QIunSjLDpm+Y+Rj5wNSUrKlnJS1v9xdm9nXLhvlkg2yeGak9CL
         6C4BsY20pOzJsRIAS6V3Qy9oaQR2oAMWapUiqTse4OBHr/bCBL+CR72MRdAHiBSpInIf
         G+Vw==
X-Gm-Message-State: AAQBX9cAqUphuxUt9GtNcyXOUN8t4ADY6YO7ZStAMJDNaBEx1t667Pud
	Hsru9/dkPYC+OLeEx7+A1y2GoA==
X-Google-Smtp-Source: 
 AKy350YX5t8yue2OQEKwTNFVa2OOh6bs2nxsXA+6DD5d1N6SAjVTtGtqlOTDFST8C47ZXLf29jFHnw==
X-Received: by 2002:a17:906:aac8:b0:94a:6f0d:389d with SMTP id
 kt8-20020a170906aac800b0094a6f0d389dmr7392883ejb.5.1681313293472;
        Wed, 12 Apr 2023 08:28:13 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 e14-20020a50d4ce000000b00502b0b0d75csm7027802edj.46.2023.04.12.08.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 08:28:12 -0700 (PDT)
Message-ID: <94590a79-cae3-7b88-8f02-0c356adf06b7@linaro.org>
Date: Wed, 12 Apr 2023 16:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/7] dt-bindings: soundwire: qcom: add 16-bit sample
 interval
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Rao Mandadapu <quic_srivasam@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
 <20230403132503.62090-3-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230403132503.62090-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZHE6UUUKOXAPL7QSKPAMLTGGUBEQORCZ
X-Message-ID-Hash: ZHE6UUUKOXAPL7QSKPAMLTGGUBEQORCZ
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZHE6UUUKOXAPL7QSKPAMLTGGUBEQORCZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 03/04/2023 14:24, Krzysztof Kozlowski wrote:
> The port sample interval was always 16-bit, split into low and high
> bytes.  This split was unnecessary, although harmless for older devices
> because all of them used only lower byte (so values < 0xff).  With
> support for Soundwire controller on Qualcomm SM8550 and its devices,
> both bytes will be used, thus add a new 'qcom,ports-sinterval' property
> to allow 16-bit sample intervals.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/soundwire/qcom,soundwire.yaml    | 22 +++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> index c283c594fb5c..883b8be9be1b 100644
> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> @@ -86,7 +86,7 @@ properties:
>     qcom,ports-sinterval-low:
>       $ref: /schemas/types.yaml#/definitions/uint8-array
>       description:
> -      Sample interval low of each data port.
> +      Sample interval (only lowest byte) of each data port.
>         Out ports followed by In ports. Used for Sample Interval calculation.
>         Value of 0xff indicates that this option is not implemented
>         or applicable for the respective data port.
> @@ -94,6 +94,19 @@ properties:
>       minItems: 3
>       maxItems: 16
>   
> +  qcom,ports-sinterval:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

Should this not be ref: /schemas/types.yaml#/definitions/uint16-array ?


--srini
> +    description:
> +      Sample interval of each data port.
> +      Out ports followed by In ports. Used for Sample Interval calculation.
> +      Value of 0xffff indicates that this option is not implemented
> +      or applicable for the respective data port.
> +      More info in MIPI Alliance SoundWire 1.0 Specifications.
> +    minItems: 3
> +    maxItems: 16
> +    items:
> +      maximum: 0xffff
> +
>     qcom,ports-offset1:
>       $ref: /schemas/types.yaml#/definitions/uint8-array
>       description:
> @@ -219,10 +232,15 @@ required:
>     - '#size-cells'
>     - qcom,dout-ports
>     - qcom,din-ports
> -  - qcom,ports-sinterval-low
>     - qcom,ports-offset1
>     - qcom,ports-offset2
>   
> +oneOf:
> +  - required:
> +      - qcom,ports-sinterval-low
> +  - required:
> +      - qcom,ports-sinterval
> +
>   additionalProperties: false
>   
>   examples:

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D626E5E49
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 12:10:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E156E7A;
	Tue, 18 Apr 2023 12:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E156E7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681812616;
	bh=UD1hQ5NrknFrtBChaYv/JGLpxLRi7Z9DzQz77oRNL3A=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U+eiJYgL7fJmhm6bLioqAS4tuUPDlPOGJSsNL8q5oTtP95yzq2Zn+LelWyCxfqE34
	 ghLeFrhqW6HY/7/OHcTWXo3lQMCN2H1mhb3EcEdz9UiqBCUFscSKNlYwJJoBusLJAh
	 Y2Z3/c2p3HpY+EkEcKdq+GC6VMCrnWAEPThsZ3Rc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E858CF8052E;
	Tue, 18 Apr 2023 12:08:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47E32F80533; Tue, 18 Apr 2023 12:08:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE58BF8052D
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 12:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE58BF8052D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IL9QQcBR
Received: by mail-ej1-x634.google.com with SMTP id dm2so71833110ejc.8
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 03:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681812530; x=1684404530;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CHTRuDZizZmh3JLZCo5lprJ34wrb3qJisxHDlzonFVQ=;
        b=IL9QQcBRXReGXfHqy0crh2FxCNKO1auiDipds27slpKbXHVXazCM6KG8qIo1FvRcxt
         iq9WJU9MycEAR+w87PKddU8wGGtQ3anbOKLaRUO5Uj77vcpjST+eNxWyoFKtpxwBNTn6
         G1ntWN0oiQjJnSREdUT7A/iCLtwacqzVXVbFzhVHDjS7r7M0vZ0dtMTHSwxhEnK3OSdy
         7or+H0TxJbxiZ+08cu+obndPVE/glYUYnb9oZlhzjyRdVmsQZjqtLd1O9T0MhpfJCHs0
         Z5Bc3nY0iDEq6teRKfyraaYCkBi7VT8B8GOAShTPUpUSi7ajgy1E1yX5wuVT5Fx3nj9F
         wNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681812530; x=1684404530;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CHTRuDZizZmh3JLZCo5lprJ34wrb3qJisxHDlzonFVQ=;
        b=UIckrbYMARjlownEJiPav4Xpnw3vl6AICg9qI94+0TKn1efCxb/nf+PAQkDlhtTvLa
         ti985kkwyfZQMtx1j2QsL94FPSpqlA6YiBqu4uudCOEVTcpn9aPyaTptP71Ooz6TxRl5
         9ObjhTCdof8I+PCl3F+6NKyxRySqowe4Hm2i7PcjcLiF5m3G/E1I/0hNPVAdWGzAn5GL
         D1B0KpxYU31UaRHStE0ENkHElvXGtkhN9d4pMHp8+eoa+uWQstHDTJsor3/JYfYbGknK
         sbVOl7Z6TFhIH5pxIpweKs0UO6AWmdxUWSR6OsepoHuvM2XD44Nff/rPVkVKzqVVVROz
         a+gA==
X-Gm-Message-State: AAQBX9f43UM44WIHesEZOIJk9XOLyurONhmzGmrZM+3s5TG8a+BaPQv2
	YXcv5uT+oGRfVWHxoeZGpE6bmQ==
X-Google-Smtp-Source: 
 AKy350Y6QKNYyStk/yeNY7V9U+pJgUn1EghZMLBG2sV9zSfpYxNv6bvXFckJUhC1XhExS9B0xAO02g==
X-Received: by 2002:a17:906:82c5:b0:94a:8e19:6aba with SMTP id
 a5-20020a17090682c500b0094a8e196abamr10589810ejy.21.1681812529724;
        Tue, 18 Apr 2023 03:08:49 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 kt2-20020a170906aac200b0094f6458157csm3300672ejb.223.2023.04.18.03.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 03:08:49 -0700 (PDT)
Message-ID: <4a250d8f-5771-4933-be99-5721c163fe8a@linaro.org>
Date: Tue, 18 Apr 2023 11:08:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/7] dt-bindings: soundwire: qcom: add 16-bit sample
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
References: <20230418095447.577001-1-krzysztof.kozlowski@linaro.org>
 <20230418095447.577001-3-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230418095447.577001-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: H6B3P6WEHLPJX3MJ52M5VHC7BKHP6CIA
X-Message-ID-Hash: H6B3P6WEHLPJX3MJ52M5VHC7BKHP6CIA
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H6B3P6WEHLPJX3MJ52M5VHC7BKHP6CIA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 18/04/2023 10:54, Krzysztof Kozlowski wrote:
> The port sample interval was always 16-bit, split into low and high
> bytes.  This split was unnecessary, although harmless for older devices
> because all of them used only lower byte (so values < 0xff).  With
> support for Soundwire controller on Qualcomm SM8550 and its devices,
> both bytes will be used, thus add a new 'qcom,ports-sinterval' property
> to allow 16-bit sample intervals.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
> 
> Changes since v2:
> 1. Use uint16 for qcom,ports-sinterval.
>     DTS will be fixed in separate patchset.
> 2. Add tags.
> ---
>   .../bindings/soundwire/qcom,soundwire.yaml    | 20 +++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> index 98c7fc7e1189..fb44b89a754e 100644
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
> @@ -94,6 +94,17 @@ properties:
>       minItems: 3
>       maxItems: 16
>   
> +  qcom,ports-sinterval:
> +    $ref: /schemas/types.yaml#/definitions/uint16-array
> +    description:
> +      Sample interval of each data port.
> +      Out ports followed by In ports. Used for Sample Interval calculation.
> +      Value of 0xffff indicates that this option is not implemented
> +      or applicable for the respective data port.
> +      More info in MIPI Alliance SoundWire 1.0 Specifications.
> +    minItems: 3
> +    maxItems: 16
> +
>     qcom,ports-offset1:
>       $ref: /schemas/types.yaml#/definitions/uint8-array
>       description:
> @@ -220,10 +231,15 @@ required:
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

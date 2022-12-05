Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D964E642D4C
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 17:42:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69C9F183B;
	Mon,  5 Dec 2022 17:41:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69C9F183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670258533;
	bh=ej2QCk+st6jnUs1uO5jF92pjB/nM+vz6j07Qv9Uqq3Y=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VzJNOq3F7/Ioioqyl0pRFt0cApbhR5/MLKL9Ke7YKYf9orqM+x0qxfZhTXoK0pZKo
	 BwzkUpNPy5iB+G4I70Y70bqt0m96pqwQhbWeS6B6GRchArdoBMrocMeQyP5tOP34Wn
	 YG8QWo8kdt3S3sdRBYq3xcgxvjY8a8INkGPmYoyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4C3DF8049E;
	Mon,  5 Dec 2022 17:41:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 551E8F8047C; Mon,  5 Dec 2022 17:41:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D375F800BD
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 17:41:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D375F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="c54vrVFV"
Received: by mail-lf1-x12c.google.com with SMTP id bp15so19426261lfb.13
 for <alsa-devel@alsa-project.org>; Mon, 05 Dec 2022 08:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bvMgHr6nPNPCQ6s9XZ/way5jh4b4axpnbYsUz+kyGTI=;
 b=c54vrVFVS2uXGLTFnEdpGMoa6TedWKj6PV3FlSbNDaEIvY5QCcVq7Ei34BsCnzZdYU
 jbAuEgwMF9keo5PtqzvAYljnGM/ZZZlHVK8n0jBWhzhRxn3P0s3yngmpatWEK5N+MgGu
 vOyrHe165cLrGPj0CZvm/MRCeKqionRWeDNlDvkdC/dNsqs7X7+Z9Vz6MhXAlMZnKfTv
 7hlq0fAexRMvCIniSIm3g7/8C58alE9SK46Lyfm+97kP+9ZWpBkH/4AHlsfayIBpq+Bu
 VB8h+F8vvqHydSbXkzdOm9RHDzqP5A9WZgpeU8OZUu4JJAOAtmVq9E4Z5tXkFVlSjEtj
 OFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bvMgHr6nPNPCQ6s9XZ/way5jh4b4axpnbYsUz+kyGTI=;
 b=53bfrb8jfMOFj9y4pjATFloYflYdA8lW59BGlNndiiB6dakZwLvHiqt0BOZPNO6yLb
 sCLTXtFhHhEJ/e9hjfsdm11J3krMaJrr9/nL/fvptzwn5an5GXzbtg8Ra/RYWTaKaaKR
 hoFrsNk+mhHKRykifJelmvd2NjjHz9NmAMLyZJz5N0MkwIRxU7QjnY5M475Ep5urHeUd
 grFnCvWjBV7U/2fnC4qY9G4nvXssa2n+33oidYEbcnQcSr3QlnY7Szcu5i/G7Sv8K1pL
 EXrPViQyVVyQJxXO9Qly0Jm+3rUYv3PCfssQg4az3FjGh5qeqrkbIiXyYHzGDSDiMC2x
 wWjg==
X-Gm-Message-State: ANoB5pnYBPx+TkwHt4GPDHQu5TBs/fsz1ajgm9gcm18ciTwEpLBRy1wi
 Jegx6id7EyEgEhjftQTXL9b6eQ==
X-Google-Smtp-Source: AA0mqf7T45b55x2OCvNz9d9cyoRsQVns6gCdondv79dZmrOp7q6DCFfydDulpPNlkgsSJS5Lrxiqxg==
X-Received: by 2002:a19:6903:0:b0:499:8e29:2763 with SMTP id
 e3-20020a196903000000b004998e292763mr30993354lfc.137.1670258465111; 
 Mon, 05 Dec 2022 08:41:05 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 bk37-20020a05651c23a500b002770eafaafbsm1430093ljb.99.2022.12.05.08.41.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 08:41:04 -0800 (PST)
Message-ID: <bd0dad44-05b2-39fa-aac8-da322b33a535@linaro.org>
Date: Mon, 5 Dec 2022 17:41:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: Drop Jee Heng Sia
To: Rob Herring <robh@kernel.org>
References: <20221203162144.99225-1-krzysztof.kozlowski@linaro.org>
 <20221205163453.GA2034441-robh@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221205163453.GA2034441-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dmaengine@vger.kernel.org, "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>
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

On 05/12/2022 17:34, Rob Herring wrote:
> On Sat, Dec 03, 2022 at 05:21:43PM +0100, Krzysztof Kozlowski wrote:
>> Emails to Jee Heng Sia bounce ("550 #5.1.0 Address rejected.").  Add
>> Keembay platform maintainers as Keembay I2S maintainers.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml    | 1 -
>>  Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml | 3 ++-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> index 67aa7bb6d36a..ad107a4d3b33 100644
>> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>> @@ -8,7 +8,6 @@ title: Synopsys DesignWare AXI DMA Controller
>>  
>>  maintainers:
>>    - Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
>> -  - Jee Heng Sia <jee.heng.sia@intel.com>
>>  
>>  description:
>>    Synopsys DesignWare AXI DMA Controller DT Binding
>> diff --git a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
>> index 2ac0a4b3cd18..33ab0be036a1 100644
>> --- a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
>> +++ b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
>> @@ -8,7 +8,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  title: Intel KeemBay I2S
>>  
>>  maintainers:
>> -  - Sia, Jee Heng <jee.heng.sia@intel.com>
>> +  - Daniele Alessandrelli <daniele.alessandrelli@intel.com>
>> +  - Paul J. Murphy <paul.j.murphy@intel.com
> 
> Missing '>'

Indeed, thanks.

Best regards,
Krzysztof


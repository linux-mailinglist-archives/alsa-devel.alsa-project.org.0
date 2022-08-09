Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C28658D53C
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 10:17:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B04C1100;
	Tue,  9 Aug 2022 10:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B04C1100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660033025;
	bh=aMqtd9kJs1gFAcBOCA3COEXSyZ4fRZf1HB58/VGe/6Q=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rVjznHBLE3laoX+LszEcnAC/acN97XL5KrmtzQj9avi5kIyawnyKIu9tFIWdsaiHw
	 DAnkgpKrR0NATr37qGJeZqG8MtZ1OK/Vt+td3Tlb/ZrunVD8qRc8X7FQjMcbU/aOXI
	 SBJ4HkBgs0kTqzGckt20XAGXniXdYD9N+/azjuI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A082F800E8;
	Tue,  9 Aug 2022 10:16:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 685E6F8016C; Tue,  9 Aug 2022 10:16:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35444F800E8
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 10:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35444F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="WcPB8C9W"
Received: by mail-lj1-x236.google.com with SMTP id l21so762514ljj.2
 for <alsa-devel@alsa-project.org>; Tue, 09 Aug 2022 01:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=i4iQuVbI+9d0zd0b0jhQFCRBZoVGPueKM3RZjVMejCI=;
 b=WcPB8C9Wpy4JKS+wa3ogqDTCTitNjB5xjbl3GVmJmBFnwN57erFosPTxu4Bghu9Gvd
 hWhwv0ojAxwP6jOEiri1EAKImG5N+yBtIHLuRUkZsWEn/Kvf9pBA09AehAP7swtTHk+v
 ryY8ZsTY+cFpzv51ckXN9xnCOKSC/oGHjvNmxHuVN+viA7vudsmpY2fHuPLz7u4RDKRE
 cUC96d/urQdJGb+GvEkBG4k+GLTjVjZTrdI6N2UpgpMXTXulCXiOBuvcWVuzGogD+9fD
 2vMoj/aE7Ony9MFMdKoVLyg5tsiVL8deafhCdTSszOFZkw5gnwqIsek0OyJonNc5F7kG
 OSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i4iQuVbI+9d0zd0b0jhQFCRBZoVGPueKM3RZjVMejCI=;
 b=66hacQ1H/7dfYnTuqlr6A3EI8B3k2oVb+n9G77ngQLjsl5kxxxJGJZdtNC9HXGhFeN
 7UkzB258siimksp00FQhs4YL+YN5iVBk/mQ0YzkRwpdAzAGHcUHrQ+0+C9KxKRkE0TnP
 eDZZWXMTn5GhPoGVm8idmFX3wmGGhkHO++AwR/h+O8wt5nmyDnqg1Ezfvu74ysj63PST
 n/mXKxfb/ThzlIPReb+RyvM1UgLPOCLBHk2YHMFTb2Ggq165t9U7J98ro/ccHHZfRwkz
 r2V/sNd6ViKVqO5ZWL6MPAVHzs9/uAOT0iQs8E/8Lz/iJE0XakGvzQMOrNAPn1Ohp1+F
 vG4A==
X-Gm-Message-State: ACgBeo1X8tmdn1761Os7eFfHwpBZ51fSzMO5tWmWj9K2A7iRkQJ//pH7
 NquhWXkVe7BroVq+UFfdpxGxcQ==
X-Google-Smtp-Source: AA6agR6d09fbMfwW14RfB+trmeqi+0SytmqBmON06AUpmV6tqXMlZsMQJgE6vxkA86T2hfetncSzNA==
X-Received: by 2002:a05:651c:92:b0:25f:f326:f2c1 with SMTP id
 18-20020a05651c009200b0025ff326f2c1mr633512ljq.273.1660032952859; 
 Tue, 09 Aug 2022 01:15:52 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 k21-20020ac24f15000000b0048ae66976ffsm1672088lfr.47.2022.08.09.01.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 01:15:51 -0700 (PDT)
Message-ID: <8ce59940-f559-35cb-5f86-37399da166a1@linaro.org>
Date: Tue, 9 Aug 2022 11:15:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] dt-bindings: sound: Add Apple MCA I2S transceiver
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220808224153.3634-1-povik+lin@cutebit.org>
 <20220808224153.3634-2-povik+lin@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220808224153.3634-2-povik+lin@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org
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

On 09/08/2022 01:41, Martin Povišer wrote:
> Add binding schema for MCA I2S transceiver found on Apple M1 and other
> chips.


Thank you for your patch. There is something to discuss/improve.

> +title: Apple MCA I2S transceiver
> +
> +description: |
> +  MCA is an I2S transceiver peripheral found on M1 and other Apple chips. It is
> +  composed of a number of identical clusters which can operate independently
> +  or in an interlinked fashion. Up to 6 clusters have been seen on an MCA.
> +
> +maintainers:
> +  - Martin Povišer <povik+lin@cutebit.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t8103-mca
> +          - apple,t6000-mca

How about alphabetical order?

> +      - const: apple,mca
> +
> +  reg:
> +    items:
> +      - description: Register region of the MCA clusters proper
> +      - description: Register region of the DMA glue and its FIFOs
> +
> +  interrupts:
> +    minItems: 4
> +    maxItems: 6
> +    description:
> +      One interrupt per each cluster
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  dmas:
> +    minItems: 16
> +    maxItems: 24
> +    description:
> +      DMA channels corresponding to the SERDES units in the peripheral. They are
> +      listed in groups of four per cluster, and within the group they are given
> +      as associated to the TXA, RXA, TXB, RXB units.
> +
> +  dma-names:
> +    minItems: 16
> +    maxItems: 24
> +    items:
> +      pattern: '^(tx|rx)[0-5][ab]$'

Use consistent quotes (everywhere " or ').

Describe the items because otherwise you allow any order. The list will
be unfortunately quite long, but still readable enough.


> +    description: |
> +      Names for the DMA channels: 'tx'/'rx', then cluster number, then 'a'/'b'
> +      based on the associated SERDES unit.
> +
> +  clocks:
> +    minItems: 4
> +    maxItems: 6
> +    description:
> +      Clusters' input reference clock.
> +
> +  resets:
> +    maxItems: 1
> +
> +  power-domains:
> +    minItems: 5
> +    maxItems: 7
> +    description:
> +      First a general power domain for register access, then the power
> +      domains of individual clusters for their operation.
> +
> +  "#sound-dai-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - dmas
> +  - dma-names
> +  - clocks
> +  - power-domains
> +  - '#sound-dai-cells'

Use consistent quotes (everywhere " or ').

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mca: mca@9b600000 {

You called it I2S transceiver but isn't it also actually I2S controller?
If yes, then the node name should be probably "i2s".

> +      compatible = "apple,t6000-mca", "apple,mca";
> +      reg = <0x9b600000 0x10000>,
> +            <0x9b200000 0x20000>;
> +


Best regards,
Krzysztof

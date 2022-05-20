Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAD152E55E
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 08:52:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20C0B172B;
	Fri, 20 May 2022 08:51:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20C0B172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653029563;
	bh=mn0lLJGXjyDPcC2FCBVLlbwbaPUhgL53Zvc0ZBoUKBY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vFGYKUmAabo3+P38auWSXi8FZb8APJcqjfs4zzJfX9o6Go5B+K46+BWcBw9VjoZJ3
	 GQNbYxjsIcdYxpLCU170XF3VFgWt7Fgf15UVEhgH/ctdzc8SgDNj4rwYugHeE/sd0J
	 Phnmq2TByTZWN6w4gvTW37g8Q8gGqKEgfxWiZc8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A9F8F801F5;
	Fri, 20 May 2022 08:51:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D98FF8019D; Fri, 20 May 2022 08:51:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C79B4F80109
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 08:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C79B4F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mOoGc9M7"
Received: by mail-lf1-x132.google.com with SMTP id v8so10787877lfd.8
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 23:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2sD0n6yJXGuDhEewc3lorHaqBnUR099vPCJ5WEpCDzU=;
 b=mOoGc9M7MZgxeaun4PGlBRo4C1JXBlLpYBpB0L6MScXAzAz4CQjEupqeEEiqIWVtoS
 yzsod5WBURL9tjzxFjdaKzclp79TQIts7pzJufezPjonrPmOg2kLST6Yz5yk0poAdEkv
 1FokQMf2YtyUEt6qDRhGfKp0jAmlbIhEPE0Y9yp1BlWPZddAsy6avCDFyvojQByppw3U
 YZdF+69jR6WSNT6qja7BKlhcm6UOQBYfk6GgCQMdG/v+I34ZPzvjSe2msGn5TGD8lKrK
 CkEzOdKtdYsHqPbRhaDRxiJDH5hUlWVIVsUbCi9Mslb5JOHLhOU32ArxKxPNHc/7iUZR
 xWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2sD0n6yJXGuDhEewc3lorHaqBnUR099vPCJ5WEpCDzU=;
 b=SKA6njpA8vP232PGTxiReuF+neWqxCRpkKqjQZyBwmurYszJGm5/dw9tIFGJbKQrBE
 tji7q8OY+79GcbYfUJU7JMdfb7XOqjOR624ZqqUEHx5C8rvtBBKdcbMDdJonZIXUfrim
 E7+iWsyz4PlZncOzaU+xh46KZzGDQpxCm4UOUoDw3Ft9nGds4FEVl6YaJ1lxXHi0/0UE
 wipcje+QYtrroBNra6LjL8mAKUsxKqLciDXeiATYZnoquHw+hn6ESuiqjAQn+u1Yhp/A
 pAttlowhs9FSpEkNRd8sVg6ZwqDyxdL2n3UBQyGDGRXa25sF8iNRbJIWtjA83kb0D68I
 C9/A==
X-Gm-Message-State: AOAM5304fPOwyJPvPjFDEcZvtQkCINFFbZOZQ8pMdBNSSud4O+nyeYDM
 G1UMw/kkjgSca7VqZXfFxNt0IA==
X-Google-Smtp-Source: ABdhPJzaGbv04buuDHGp4NLG8WTmLEncJfxtJuLSgfyJWSMt4wxUrF1jnVPHvL9DO/40kuanoOGM6w==
X-Received: by 2002:a05:6512:398c:b0:473:ab45:1f7c with SMTP id
 j12-20020a056512398c00b00473ab451f7cmr5937130lfu.341.1653029492370; 
 Thu, 19 May 2022 23:51:32 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 g23-20020a2e9e57000000b0024f3d1daebbsm192250ljk.67.2022.05.19.23.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 23:51:31 -0700 (PDT)
Message-ID: <a0eed04a-1380-d96a-a406-217f053354b9@linaro.org>
Date: Fri, 20 May 2022 08:51:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/6] ASoC: tegra: Add binding doc for OPE module
Content-Language: en-US
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, perex@perex.cz, tiwai@suse.com
References: <1652895372-29885-1-git-send-email-spujar@nvidia.com>
 <1652895372-29885-2-git-send-email-spujar@nvidia.com>
 <049173a1-0fa6-510b-9169-ebe869b8a3b3@linaro.org>
 <90680cfb-c611-63cd-ab5f-5afb86c91cec@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <90680cfb-c611-63cd-ab5f-5afb86c91cec@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On 20/05/2022 06:19, Sameer Pujar wrote:
> Thanks Krzysztof for review.
> 
> 
> On 19-05-2022 17:10, Krzysztof Kozlowski wrote:
>> On 18/05/2022 19:36, Sameer Pujar wrote:
>>> +description: |
>>> +  The Multi Band Dynamic Range Compressor (MBDRC) is part of Output
>>> +  Processing Engine (OPE) which interfaces with Audio Hub (AHUB) via
>>> +  Audio Client Interface (ACIF). MBDRC can be used as a traditional
>>> +  single full band or a dual band or a multi band dynamic processor.
>>> +
>>> +maintainers:
>>> +  - Jon Hunter <jonathanh@nvidia.com>
>>> +  - Mohan Kumar <mkumard@nvidia.com>
>>> +  - Sameer Pujar <spujar@nvidia.com>
>>> +
>>> +properties:
>>> +  $nodename:
>>> +    pattern: "^mbdrc@[0-9a-f]*$"
>> Why? We enforce only generic names in shared schemas and this is neither
>> shared schema nor is it generic name.
> 
> Idea was to keep these node names consistent across DT files and parent 
> node can allow a given list of child nodes with strict checks. Does name 
> like "dynamic-range-compressor@xxx"

The checks are not coming from device node name, but from matching
schema to compatible. Why do you need consistent names across DTS files?
They should be anyway generic but what happens if they differ?

Additionally, the parent schema enforces nodes of children, so if this
is included in other schema, then the change is pointless.

I propose to drop it, unless it is a shared schema for many different
vendors.

>>
>>> +
>>> +  compatible:
>>> +    oneOf:
>>> +      - const: nvidia,tegra210-mbdrc
>>> +      - items:
>>> +          - enum:
>>> +              - nvidia,tegra234-mbdrc
>>> +              - nvidia,tegra194-mbdrc
>>> +              - nvidia,tegra186-mbdrc
>>> +          - const: nvidia,tegra210-mbdrc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +
>> No need for space
> 
> will remove
> 
> 
>>> +
>>> +  compatible:
>>> +    oneOf:
>>> +      - const: nvidia,tegra210-ope
>>> +      - items:
>>> +          - enum:
>>> +              - nvidia,tegra234-ope
>>> +              - nvidia,tegra194-ope
>>> +              - nvidia,tegra186-ope
>>> +          - const: nvidia,tegra210-ope
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 1
>>> +
>>> +  ranges: true
>>> +
>>> +  sound-name-prefix:
>>> +    pattern: "^OPE[1-9]$"
>>> +
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +    properties:
>>> +      port@0:
>>> +        $ref: audio-graph-port.yaml#
>>> +        unevaluatedProperties: false
>>> +        description: |
>> No need for |
> 
> will remove.
> 
> 
>>
>>> +    ope@702d8000 {
>> I would suggest generic node name, if it is possible.
> 
> May be "processing-engine@xxx" ?

Sure.


Best regards,
Krzysztof

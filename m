Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B48689139
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 08:49:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5E9E83A;
	Fri,  3 Feb 2023 08:49:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5E9E83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675410593;
	bh=6Vmfr2CaFLpUnIXZ77a3+dssrpcik0bi9JX/GeVGZn4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=e9obxf7re0DKIOLdRUpefPxqDXpRMTT2hoUG6Qmx1GpH+QvdH2x5nd/TrefnRxEFk
	 mEDP6WOPNF25vZ314mGkVHJP706lAARws/OrTF7TZ3e06vc2QYM6MQLwBc9gS+8r5t
	 goG3QbQ3G28iXlHtoCDisBwyWECymBjEnFkvslCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83F24F80423;
	Fri,  3 Feb 2023 08:49:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6416F8032B; Fri,  3 Feb 2023 08:49:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FDBBF800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 08:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FDBBF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HAO2CNOD
Received: by mail-wm1-x333.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so3200035wms.1
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 23:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v5gfpczBzl62sAvBqjyZghlCn5Q/6Yh+maXELEJGN6Y=;
 b=HAO2CNODWncVDUlMlFhIV6G/1KE+6/Sw6jH7FCGny1is7RMq7DDZWism/cSfO1QPmY
 YWpE7obG92rNxg0WDwlz+/itQXkq4uMNl05IuIg+/pAkBmLGzxSGwi5gdT98lReGF6c2
 OCy8iXA3/12Ozd8KXYIQDIF/TTUXgLnq+3AJzeZhb/6wHRa7CKIo/ZS5MtOTt/uU055F
 NRHplid1x2R11lA+5CO3Jpjo9z04B70XPxxXHQSs/6Et8FsOkIK3SUEPRvFlBNjnwzst
 OWF32m2lvF3SPrp18G/+YqmIQFNAgipHr3RGG5TK6SizVkqhhVw0i8U2LJfShkhBH1Hc
 E70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v5gfpczBzl62sAvBqjyZghlCn5Q/6Yh+maXELEJGN6Y=;
 b=hBpsS41T0ZCb6YDTLRzR4U3Ndga9KA/4/hBSM/b2L9CLfMH46YMkwAoB9oQpvTyXOb
 wwwezbaG7aG+hp2SQe+I7E3Ko5KEMNdpXalAccF7Ax+QfmqdCp9TwaXGb/SntElvInEP
 EpMN5nHWetvX8JUXSpD5xVLg/H3fUxHoYTBodoOz8cntNtcluKw/mPTmjJIN+SPKSZYC
 YqjKsy6bgTfDvB8WotxgyM/vMX2yB9akhtIL2EZVxIed4i9tQazyF9LSbSJAQhVchTJv
 5JSR1kmYBNwMC8B3EJz9z9UgMaEbzxEY1bbj6K1krPRqxGQS+MO+5J4ZmxFFB7yqR/vk
 95Xg==
X-Gm-Message-State: AO0yUKV0n6l16BaX2YrVPVJwp6yMlEww2opMEVXkmWLO0i1TEZuVLbiS
 DjAhePLRCaD9PWCstMEXF1dwrQ==
X-Google-Smtp-Source: AK7set+oqhPulJShRtcIKzg8mOnQKZu7gCG1/8sG+jlfV7LfKIvKHyV6ok09Mw27P/viyjbWaw/7mQ==
X-Received: by 2002:a05:600c:1c22:b0:3dc:37d0:e9df with SMTP id
 j34-20020a05600c1c2200b003dc37d0e9dfmr8634479wms.14.1675410535780; 
 Thu, 02 Feb 2023 23:48:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a7bcd86000000b003dc4480df80sm7001220wmj.34.2023.02.02.23.48.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 23:48:55 -0800 (PST)
Message-ID: <e2d4c841-b3f9-a23e-6977-4015f8f9de5f@linaro.org>
Date: Fri, 3 Feb 2023 08:48:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/9] ASoC: dt-bindings: create component common schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-2-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202183653.486216-2-jbrunet@baylibre.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 02/02/2023 19:36, Jerome Brunet wrote:
> All DAIs are component but not all components are DAI.
> Move the component properties (sound-name-prefix ATM) to a separate schema
> file so it can be used by non-DAI components, such as auxiliary devices.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>


> -properties:
> -  sound-name-prefix:
> -    $ref: /schemas/types.yaml#/definitions/string
> -    description: |
> -      Card implementing the routing property define the connection between
> -      audio components as list of string pair. Component using the same
> -      sink/source names may use this property to prepend the name of their
> -      sinks/sources with the provided string.
> +allOf:
> +  - $ref: component-common.yaml#
>  
> +properties:
>    '#sound-dai-cells': true
>  

Probably we should require sound-dai-cells at some point, but anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


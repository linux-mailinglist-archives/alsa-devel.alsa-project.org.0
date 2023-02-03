Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7D7689122
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 08:44:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A55361E7;
	Fri,  3 Feb 2023 08:43:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A55361E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675410247;
	bh=2xCg7+KNTCXr6kybzwckSDb4IIpYSktGWKIOomgmJe0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PHciou+kfSKOdhlWi9I9iVL+geb/Gx+llNoXW5t+JIATxhjsui+TZ1TTalcrTTbuR
	 +HbgA5hP50jsBVYl2E467BO73j1ZN/wWif4af2EObYNsnQUP+APYdH+WPoj/xFlDdf
	 GrhYo46yEQXyKX11BRGkfFh4WO5C7VM0msuzVSJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D457F800E3;
	Fri,  3 Feb 2023 08:43:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0DF6F8032B; Fri,  3 Feb 2023 08:43:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7368AF800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 08:43:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7368AF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=OVW5q3e2
Received: by mail-wr1-x431.google.com with SMTP id o18so3852780wrj.3
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 23:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5b+vj5d7mAcnPJNRiH9TynU/xKQ/CpSAEs4T/HSo6WM=;
 b=OVW5q3e2AWBaEpv9pU1V5tHYMvWGjFz38LsAYxF3RZ1R1cJM/8rvHD2DO7yNCseQRC
 ACuGazwu75CVNmUtL7LI0ziZK7bxVPotpYyjs47CeDSWxymaNaO14TNmsnPqRga/mS1+
 srh64uY8bCmkVt5YxIsaaAFHtjbSMUq23s5n1EJras2wUyYp3tL7IyuvskGPFHwLLWkK
 z0TI1/jBvPvYJeIczmEZJwUx6nYFxQzO7wHbmZYfPewuJqTd8PzBljQrxdH8uO+Yfm1w
 WSwgQ2Ed5aOSGvXe1jsMpnOElovWta7yUvuNnFnrCsf2Uba6APuU3jAGHfpCBcRVt6Iv
 2dXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5b+vj5d7mAcnPJNRiH9TynU/xKQ/CpSAEs4T/HSo6WM=;
 b=rTzL2f5Ee7wyNTuIvKXNYUbbFAWJTvgsYQa+e4YxQ0SeBz8/8Rn0n/qS5RTpUDw+Wi
 /xkvVLvOAorfvI4LgyDJz2h/Ns5cvIoxBOC48yzIvgsUF1V2lv1oBJlEzb4lqMfPBM/r
 A3xI1xvzKx9dxRPcDlsPqGZIZevrNWyq+SRmAkYN7d1zKmaYIU/mFH0Cw+lg0G68ddRT
 gGVAVPylGS4F4ZQ1YfqRl58K47or3Ga8i6PFt1O1SgtqyfHYFeQH246fLl+9NgJVod/i
 tMdaNezu0iegTckddekJNHKYefaWGeX06vrl2/slMClybnKLwbY2QENWJwlZLrIC8VF2
 QYYA==
X-Gm-Message-State: AO0yUKUlelEy1EZecmxOH7Fwpi8E3je+uN5wodti8/sprN53BoiyxP/I
 4y5Xm9gSIIBK/wqc8UutsUSaMg==
X-Google-Smtp-Source: AK7set/Nnmyc06o1/eWZDo8c5sq7iLgNIWGrOpe8J8PK7wCX78+RHVK3sEOmbgp+Qq0mXKw22iV1SA==
X-Received: by 2002:a5d:6707:0:b0:2bd:e1fd:2536 with SMTP id
 o7-20020a5d6707000000b002bde1fd2536mr7402011wru.9.1675410179537; 
 Thu, 02 Feb 2023 23:42:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 ba9-20020a0560001c0900b002c3c725bdb5sm1275864wrb.117.2023.02.02.23.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 23:42:59 -0800 (PST)
Message-ID: <cb02ef03-b3b9-2169-1df6-b82221128909@linaro.org>
Date: Fri, 3 Feb 2023 08:42:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/9] ASoC: dt-bindings: meson: convert axg tdm interface
 to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-4-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202183653.486216-4-jbrunet@baylibre.com>
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
> Convert the DT binding documentation for the Amlogic tdm interface to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>


> +title: Amlogic Audio TDM Interfaces
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller-.*"

Such pattern is also not correct (see your patch #2), but so far we do
not require node naming from individual schemas, so I propose just to
drop it.

> +
> +  compatible:
> +    items:

Drop items

> +      - const: 'amlogic,axg-tdm-iface'

Drop quotes

> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  clocks:
> +    minItems: 2
> +    items:
> +      - description: Bit clock
> +      - description: Sample clock
> +      - description: Master clock #optional
> +
> +  clock-names:
> +    minItems: 2
> +    items:
> +      - const: sclk
> +      - const: lrclk
> +      - const: mclk
> +
> +required:
> +  - compatible
> +  - "#sound-dai-cells"
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/axg-audio-clkc.h>
> +
> +    tdmif_a: audio-controller-0 {

audio-controller (and drop the label)

> +        compatible = "amlogic,axg-tdm-iface";
> +        #sound-dai-cells = <0>;
> +        clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
> +                 <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
> +                 <&clkc_audio AUD_CLKID_MST_A_MCLK>;
> +        clock-names = "sclk", "lrclk", "mclk";
> +    };

Best regards,
Krzysztof


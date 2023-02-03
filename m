Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2E168910F
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 08:41:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 667BC820;
	Fri,  3 Feb 2023 08:40:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 667BC820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675410070;
	bh=LCjWytqJfvi5DlS+qrG49oyruibxcUMInFrNhvuB9Nk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AtD8FEXSK9ns1ntIHfSunHB3DXulKCPFyxnhDKfvM9HO82F6m8oYVMu0xlel9g0SF
	 ymeC58P2n6rN2bLP8KDFFhTfMbZ7MLUx9Yz3I7LWCKtwzxdamKHIox63RUl+oFacNB
	 dTdjMCozqk6ncOah34NGolLd/BpbK8eggB5AwpPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F8F2F800E3;
	Fri,  3 Feb 2023 08:40:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A38CF8032B; Fri,  3 Feb 2023 08:40:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE8DAF80169
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 08:39:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE8DAF80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yptLRVcq
Received: by mail-wm1-x32f.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso3168959wms.4
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 23:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eDG+Tq9iDGbHsf5EgNu0sPH0oktHNFK56axN09nipps=;
 b=yptLRVcqgMEv8JFQdUEfePL7JJZ5m6e8TTX6WXgdibOU5Xgo43x2mz1dEM1ustKfPV
 TojcrLeEU06LWS9QaEqyVsJF9DvFP/uM5FBnYICrJmklLai385IRWMYCye7Q8e00aqko
 5cNF/XAhVJ44XEB0TIFQm0lLj0SxLQyVPuCQRyMu/oEwnY34X+gboWZOJV0hb/Xg+tV0
 Ozv3lTqxqQHZcGKMU/7E/dA8YKdioh1tx23nD6Ndr+nbIwXcq30e1/RxsWZ3KZXh0f/1
 7rxeAf/947EThE7vujkmhADU7gxp3YmZDFASuX6fP54AQWqdq7oYBCIu9TWzd+GjBTDc
 9mBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eDG+Tq9iDGbHsf5EgNu0sPH0oktHNFK56axN09nipps=;
 b=bJm+RqEARbcdg7rkN8s9PBcRSYQmxANo5ibRxwZj5vPpXZHfJYjUbazosfa+wECRlr
 pXcZPD9edEuIuJghxRFWfFA6ABgelrinGa8pC6KDarrlTn0NmMxrwtajwB23w/Iw4Rgq
 sv92SExaFkuM/faEZvwIae7fjICIIehAOteJsj8Z3EchZHc8g2s5IKeJIc9QgVhs6b9l
 oPd4M574W67MTK7s2FTO0HEA3t3sCbaPSW+j/MNT8UwdnD0wTcDpMGL1Gn6Ehji/bqKZ
 vUa0JzYM/0vXP9KMV7dKzTVMe3fHXzLBEWKoWu28B+9os8uIO/AlgbithLaqmGFm3uOS
 M1PQ==
X-Gm-Message-State: AO0yUKVpWSKH4BcuK/+USoaktgq0J3hjU3Dy/n95X7Yo+Mf3u2hSihLP
 CdsSbNFvev0vA2VqXcD9Xs1PcA==
X-Google-Smtp-Source: AK7set+WVSL5lEE03IKAtRDn0G9GQ2gh7h7Cg2Buma4kwR1Id2znaqCke5/4PO5RGEDw3TtaU0/xNw==
X-Received: by 2002:a05:600c:5389:b0:3dc:557f:6126 with SMTP id
 hg9-20020a05600c538900b003dc557f6126mr10773527wmb.4.1675409998149; 
 Thu, 02 Feb 2023 23:39:58 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a7bce8e000000b003dc49e0132asm6747405wmj.1.2023.02.02.23.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 23:39:57 -0800 (PST)
Message-ID: <0012a2d8-ef4c-400d-7236-a2afbcdddf47@linaro.org>
Date: Fri, 3 Feb 2023 08:39:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/9] ASoC: dt-bindings: meson: fix gx-card codec node regex
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-3-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202183653.486216-3-jbrunet@baylibre.com>
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
> 'codec' is a valid node name when there is a single codec
> in the link. Fix the node regular expression to apply this.
> 
> Fixes: fd00366b8e41 ("ASoC: meson: gx: add sound card dt-binding documentation")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


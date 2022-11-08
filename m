Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5BC6210E4
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 13:37:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC819836;
	Tue,  8 Nov 2022 13:36:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC819836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667911023;
	bh=FMdr+s9UybcSRmx8cVeVdZBfoMVynW6RNelxJXgs0tQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JSSwFnbKMeMtAVd/+9TSIE0ERW/ucuVhvmxaUSVMUomR55+95/aVdpykdC6e2PwMO
	 Iq+o3mj+eyXbPq1f1UdDNM5eJSUOYUymn0VrgWXerLf+JMKIR8yQCFbmjNu5IqcInx
	 hD5+cFRfh9EbhGd8RNhJoZklRtVK6uZjaynbVQkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 549C6F800F4;
	Tue,  8 Nov 2022 13:36:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FABCF801D8; Tue,  8 Nov 2022 13:36:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81F65F8016A
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 13:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81F65F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cH8HGGi5"
Received: by mail-lf1-x133.google.com with SMTP id l12so9910258lfp.6
 for <alsa-devel@alsa-project.org>; Tue, 08 Nov 2022 04:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iNRUdsuvY7c1Nj94/oTEANQHqS8U5hc27GeoZ4o3mrE=;
 b=cH8HGGi55LA8q/7nwAdlY78765ZvpMnrMIgLscnN+m62FjT2EHsCspSdyTLHui5Lz5
 EImbQhjXh7RdhLM/FG7yXuwk8iU9A8Hs4EfMy0xNUBEJOS+kFEGjUENW28+4vawqZbG0
 EYTbzRls4KfpMfuBjJ7e20pQ+rWQnZE4/ofeAy1yFqpi5u1UXizMOlHQxcXvGZP/SiLZ
 Y+YUFVT8yCK5Xfbm7JlAVGrkU2f56E2IwKYQPskZNtUfAtgvYZvHRMBJgmegFEHRU8J+
 DMixdfTjMG+GmLIXnZcNkPgQoIqteT1SgRxJBadmbZnzkY3VRRW7gfijBQToUwO0K17e
 Oxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iNRUdsuvY7c1Nj94/oTEANQHqS8U5hc27GeoZ4o3mrE=;
 b=sD3evJL6Z4YwyPProEYpL+jwg4DJ/2y4cF1MU4mb/dA8bQC31B2Y221IVU7YvwX8B8
 P7h3FOtuuRxDDhMIV7/UVqLyr0uaJfceEecLVL/eyW8brJK+5NElw95rCIvHPHuIDFXJ
 6AL6wyaHs9nr2cychQgEEkBXMoA732/qVQ3HBtKKpdYuYMsaUPp23nJjWMQ07+rjAhKc
 9roPGl3Gpyk/esUGLbz0ha0vBj3oZ8RdwzicGi4E9sA5vuY9nI9eHJOpGPwZJKEWlyFv
 V7vjczLtjTC/n0MNtZkexwqviCuCuu5hptUgrRT5FhJA8m/Yc3xiAY3cL1hLPDqh8mSG
 fdfA==
X-Gm-Message-State: ACrzQf2lMywxxDGqI4g804najBwcKs865yqdNP5uJHV5ekBAtUuDTYop
 TEzlr4Z+qKr7zO0+2bWSbjxbNQ==
X-Google-Smtp-Source: AMsMyM5TDQ+lKG+eFrm5U8acDAnlb/ZJeqAb+4hY75v7A/a2remZhRkhBz/z0zrYmuBWxDgKGkbU7g==
X-Received: by 2002:ac2:5cba:0:b0:4aa:5b6d:fb33 with SMTP id
 e26-20020ac25cba000000b004aa5b6dfb33mr19618866lfq.491.1667910957432; 
 Tue, 08 Nov 2022 04:35:57 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a05651231cf00b004946b549a19sm1763483lfe.45.2022.11.08.04.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 04:35:56 -0800 (PST)
Message-ID: <d5d6b2ca-ce4d-4492-a33e-08448974e6b2@linaro.org>
Date: Tue, 8 Nov 2022 13:35:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/3] dt-bindings: slimbus: convert bus description to
 DT schema
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20221026164315.39038-1-krzysztof.kozlowski@linaro.org>
 <20221026164315.39038-2-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221026164315.39038-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Andy Gross <agross@kernel.org>
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

On 26/10/2022 18:43, Krzysztof Kozlowski wrote:
> Convert the SLIMbus bus description bindings to DT Schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Srini, ping.

These wait for some time now... v2 was waiting and this is just a rebase.

Best regards,
Krzysztof


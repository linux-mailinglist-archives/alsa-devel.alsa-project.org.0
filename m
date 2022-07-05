Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFCD567660
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 20:26:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DFDA1671;
	Tue,  5 Jul 2022 20:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DFDA1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657045587;
	bh=M7gD8hssRVRF/FoQSmBzrN8+PoDgvE68vEBHrVbodvQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LhHtM9zLYw4OnsSOS7pwLo86mvEPoUgzYVbF+aDV1WNp3rTw7rjcEMF54NMvr6h1v
	 Stzo0fb2LldoyqBeYbMmfH96AtCzmmpffEgveGWvbXiywzpdmRwyGodpU/7cK3pgcK
	 G2YCVxCebf0tkwaq0TZE4lQVwcOLzsZnvlml6vzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACAA1F80212;
	Tue,  5 Jul 2022 20:25:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B161F8012A; Tue,  5 Jul 2022 20:25:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 857CEF8012A
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 20:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 857CEF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vjU+We/Y"
Received: by mail-lf1-x12c.google.com with SMTP id i18so21964274lfu.8
 for <alsa-devel@alsa-project.org>; Tue, 05 Jul 2022 11:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WC7DHh08NOM7Xz+nZkjbiyv/DEw8liELUQbZaa8HLjE=;
 b=vjU+We/YTlDF63Nrshk2+b5uc+KMGxK0LoEiIoz0UYfxzYbQPdkc2I1KNm1DW+9UpO
 LwJmagFXBi8HAXdWxklSqAUSB8s3sg2wW4gecyywKeoBSvVwN6xZb0wD/AgRgZ//RjPS
 fveApMmPsQ6BlNdOgjCNCEV58CpilE0sxIUAcIyWVzPbyKbeheZvsAYfJjsCB10m9jNI
 7GBAC+dQu2e6ZP7SbCulrsX73hNUwzHgj7LQIWibFKnnBPkExKMN49XOhDogyUfOVaJE
 e/lWrKejlyENdivxOFqNBjtOoFAxg5ZKX8eJlKhfoLVtX8O64ns7UZXdkWsF0KO8YyR1
 fvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WC7DHh08NOM7Xz+nZkjbiyv/DEw8liELUQbZaa8HLjE=;
 b=ZywblAIuRDHRp59JiHtcWwcJhw4wC7HdgINwKhCgP6eNN6rTX5C2HKXt5geSdKpeFo
 g9tpdxkU5ibopaaLtsOvx5Ro5W2r+Gk0wi7+hoGcAFNVole7j3K4ESTiPY5anUxUoQ1u
 7TsdoOGtMkoZKR3fn7c4rQ5jPTUkqJV7xhetv/4BYk3j+131jBG9mLPc2ugcOJb0WlDo
 mlIpmOXUx1/hPf8qtANGRy48bKkcdMq7kNopU2PqD/kCVy+4T53MJmFbuIsVGjLkKiD0
 Ipoh7LiPqccahnV+ew0TMuE36m9Ab/vvmWt/kDbzGQ+kJc2HSXDdCUV8W1f/Qj5Wk6F2
 v29g==
X-Gm-Message-State: AJIora/Oyi8PlXuYCQjOtw1Fs/HVFrnCOiXW2YqOOFDzSERUKdqwafiZ
 qYEJwQTAaCVkd3xUa9PpxU7VyA==
X-Google-Smtp-Source: AGRyM1vP9s82lHwnRo9zWX+lPinh7vzvThh+FhjFI99M+KzoTKgmZKLFd6MsDpjAkMTUuX2rGTD8xA==
X-Received: by 2002:ac2:4e03:0:b0:485:74c4:97ce with SMTP id
 e3-20020ac24e03000000b0048574c497cemr310361lfr.13.1657045515094; 
 Tue, 05 Jul 2022 11:25:15 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a056512308300b0047255d210d6sm5814972lfd.5.2022.07.05.11.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 11:25:14 -0700 (PDT)
Message-ID: <f856824a-111c-6cb2-19e5-683f419322ac@linaro.org>
Date: Tue, 5 Jul 2022 20:25:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: dt-bindings: qcom,sm8250: add SDM845 sound
Content-Language: en-US
To: Stephan Gerhold <stephan@gerhold.net>
References: <20220705174702.763247-1-krzysztof.kozlowski@linaro.org>
 <YsSBFjW6riKOZZcz@gerhold.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YsSBFjW6riKOZZcz@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
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

On 05/07/2022 20:21, Stephan Gerhold wrote:

> [...]
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> index 4ecd4080bb96..7cdf9e9f4dd3 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> @@ -18,6 +18,7 @@ properties:
>>      enum:
>>        - qcom,apq8016-sbc-sndcard
>>        - qcom,msm8916-qdsp6-sndcard
>> +      - qcom,sdm845-sndcard
>>        - qcom,sm8250-sndcard
>>        - qcom,qrb5165-rb5-sndcard
>>  
> 
> Looks like you forgot the db845c and lenovo compatible? :)
> 
> If you add them feel free to add my:
> Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

Argh, of course. Thanks.


Best regards,
Krzysztof

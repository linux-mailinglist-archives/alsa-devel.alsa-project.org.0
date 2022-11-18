Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0D2630D80
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Nov 2022 09:48:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB919170F;
	Sat, 19 Nov 2022 09:48:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB919170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668847730;
	bh=zQ1uALt8DWOiNINPyK/LB4Kx0D4A2U39TNacFc0m2Os=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ja9PyiyH1e9GaLZ69QUkX2psI2Wf2KJYBwqRWcrZD0KQm5894wBrYhIfKSjVZhWlV
	 irhB61plDr04H5Bd2YBCc9AoaLvONRpQewSBkDpx3g/vEGFL3bh1Zs0hgA65K2Scrn
	 VZA5xsr4WvJT5RiMZt4nPqy3BurQ3sRXFWpCVCBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65842F80600;
	Sat, 19 Nov 2022 09:40:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85A09F801D8; Fri, 18 Nov 2022 09:28:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83098F800B5
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 09:27:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83098F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yIT6wd8T"
Received: by mail-lj1-x235.google.com with SMTP id s24so5858676ljs.11
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 00:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MrA5CDs46lQZm6VaAVmPmV1Nyk9XIySNq9lvhXdo7k8=;
 b=yIT6wd8Tn/4EigMdSev3RTx1dShvONUZ1o2LJic5y3UzW8LgMuG7uFp80Y8Mw7p+2i
 u+Hx+MWiciMmXSYnrFx98cxa4sbmSAURAUt99p8E3r2tMmF0ygoLGxcFQPJrif3jPMLj
 y0DxRVohO6j383Jju+uqZkJFVPAKCT7G1d+SNz0aRrDl59ec+iH3SvLunNJnRAN3fFHp
 uj/yuz8SV/cGRRKi6lGP5BHU+Y9YeVlbn5zwGo+B4clkg1nQfYqsfFdJXz60NiVE7C5x
 xoWYk/DHjlYtipany3Ms311spap+ZgR86DO9tnSirVslPkUYj7drcMZpd/Ds56w7qUSX
 eO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MrA5CDs46lQZm6VaAVmPmV1Nyk9XIySNq9lvhXdo7k8=;
 b=ZavRaaMX/9YgH44+Fl0moqXQ14PpG+vyR7zRPsZoAmQ2+UtTH3nTkZpC8IfkxiMjbd
 q7i6z7NLrKeRtCBz9BeDU2qy9ldDpaY79JLNmBoHz6z9IGJCrl8XXjl2MRsji+lzDGYW
 nokzq+3J9yd10R7ATOyDpPArz2Zcd8Q4OYm+L2gva0LwV3kx9T64Kv4WxeV2fbh5ekN4
 xSx1aetBEuQIZ87sMpRsOec8ZLr/jq8DNrnpPnNgpMBBmErqHbmJ2drKpgCWu8HqdW9z
 wf+9wGpHltIEdAMB2g4Qc067mbLhMidoodLV5mQfy2d4X2RYevRptoHZTyfszccnMOHL
 LdzQ==
X-Gm-Message-State: ANoB5plkolFM433jKRJP7WFLYFy88JcutnIFQ4R6PaBRfIO0AgKuqaoE
 X4xPX0/StrDO2LF9pcr9DrzWzA==
X-Google-Smtp-Source: AA0mqf4FSTsj7jWLGFDuUM1KolU0pAAAlYx7n+VRF6tfHUnjgf3Tz4kJo9qfndGCbN01BGn3foVCSQ==
X-Received: by 2002:a2e:9052:0:b0:26e:eeb:f9cf with SMTP id
 n18-20020a2e9052000000b0026e0eebf9cfmr2211769ljg.480.1668760070041; 
 Fri, 18 Nov 2022 00:27:50 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 g27-20020a2eb0db000000b0026bf0d71b1esm573326ljl.93.2022.11.18.00.27.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 00:27:49 -0800 (PST)
Message-ID: <06ac1c86-22f7-97ff-bf59-6fb0994dfcc5@linaro.org>
Date: Fri, 18 Nov 2022 09:27:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 1/9] dt-bindings: drop redundant part of title of
 shared bindings
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
References: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
 <20221117123850.368213-2-krzysztof.kozlowski@linaro.org>
 <Y3Z0w6JH1f5zgwvW@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3Z0w6JH1f5zgwvW@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 19 Nov 2022 09:40:30 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
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

On 17/11/2022 18:52, Conor Dooley wrote:
> On Thu, Nov 17, 2022 at 01:38:42PM +0100, Krzysztof Kozlowski wrote:
>> The Devicetree bindings document does not have to say in the title that
>> it is a "binding", but instead just describe the hardware.  For shared
>> (re-usable) schemas, name them all as "common properties".
> 
> 
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>> index 1ab416c83c8d..d2de3d128b73 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>> @@ -4,7 +4,7 @@
>>  $id: http://devicetree.org/schemas/clock/qcom,gcc.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>> -title: Qualcomm Global Clock & Reset Controller Common Bindings
>> +title: Qualcomm Global Clock & Reset Controller common parts
>>  
>>  maintainers:
>>    - Stephen Boyd <sboyd@kernel.org>
> 
> 
>> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
>> index cf9c2f7bddc2..20ac432dc683 100644
>> --- a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
>> +++ b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
>> @@ -4,7 +4,7 @@
>>  $id: http://devicetree.org/schemas/opp/opp-v2-base.yaml#
>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  
>> -title: Generic OPP (Operating Performance Points) Common Binding
>> +title: Generic OPP (Operating Performance Points) common parts
>>  
>>  maintainers:
>>    - Viresh Kumar <viresh.kumar@linaro.org>
> 
> Hey Krzysztof,
> 
> Hopefully I've not overlooked something obvious, but it wasnt noted in
> the commit message - how come these two are "parts" rather than
> "properties"? The opp one at least don't seem to have much more than
> properties and patterProperties in it.

They should be properties, will fix in v2.


Best regards,
Krzysztof


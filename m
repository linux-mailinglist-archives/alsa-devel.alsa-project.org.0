Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C11A5A904D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 09:30:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E8431632;
	Thu,  1 Sep 2022 09:29:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E8431632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662017404;
	bh=pQFmcHpkTRii+QYEP0PmUaeAXWptxxzHeSlrBNgT6+c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A+DYFItPaCY4ESUJAyI8V7zvOTIr+7PFIGcAmylfrzENlnoZYAT7re2CaHhYSva3W
	 ogOmfXzTuztXULj/ThClurHBaPTS/9iBtb9p093F3sHOKTP8Xx8sIgJSf2zQUZt2Nb
	 w5Q9QD4UlMZawpfDNN0K8BYwnI4RtilcEcleK7t8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9E2EF804A9;
	Thu,  1 Sep 2022 09:29:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5610EF8026D; Thu,  1 Sep 2022 09:29:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70B43F800EB
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 09:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70B43F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="U08bGpTC"
Received: by mail-lj1-x233.google.com with SMTP id s15so11823895ljp.5
 for <alsa-devel@alsa-project.org>; Thu, 01 Sep 2022 00:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=JWfT+qeNC2CT3Ipogz2ktqK+tonEIf45b3bHsAFEBxU=;
 b=U08bGpTCBUkzRa9qDDUxPPJY9H5aZwby0Ihz6i9A2pZh+4DEQGs9qvCtLelKwDAkJh
 +Lvd7yeUF1/UlLZXezQt/VGyoOMfkFThGnImM9qBIH6ab9nQlyYjfsJYZHWAjwaSND4D
 0XiaNAfBOH0dsSrY7GM1HH/73SD/yJ457vDE8fuKTUTxOJO+2YQOQAtWJGrT/1WbSv6S
 Tr0xjz1ARJ7rfR20YM/+gHw4+JyP2ilQbZKgjl0JzZBNR14Hktv1+8da4PLdUcrWliFL
 R5X+W4U3EWNIATK+AtdiUo/DA1m5yvfr/crc6QQAm/bGEEKl0498ApyTAiZsFcTvvCpk
 bT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=JWfT+qeNC2CT3Ipogz2ktqK+tonEIf45b3bHsAFEBxU=;
 b=A6JcjTZDJs9u5RGIeeG9XCgQr3DN/HSLnnTzPbhmYGo2B6ptrxIOZDGS7ZQXIIEz74
 8meJNaakMEy2JsOoRfjM1ZQoauSX3uSGh05po1h3WwZIE+DBanDHxd/cheO/hNboXrv9
 xrqVxPU1tzDHRr2NR9jpsFbH94Gn36Ax/Ut7XKBcUgqE8FrZU9EZFFfgkdwqhxg4VLY3
 b2o5nNPmOhGQc+zco4crwX4yYChHmhOHzkgQOOvCFfH3MyL0pSley8kZVKtU2IB8KQ48
 if1OEKh5ZCCS+oYAs9DTlK94VV0Kvv3Dogge8b/+EPNBxS+Qe2Zgw7jhMvbN8QbKK55F
 hnqA==
X-Gm-Message-State: ACgBeo2duHesiEakJomjsz/JEWxMWYhfu2ySNIg/HI226NqEuQN98gnH
 ejFzVearqPiSAMS5MqKGknc+zw==
X-Google-Smtp-Source: AA6agR7wyn4mb8cX3p67uFfHPU+JkbXoaTyVz81XLi4YVfOhv+6H5UDNEufviysPXbybIUB/Zcy+2w==
X-Received: by 2002:a05:651c:204d:b0:25e:3111:419f with SMTP id
 t13-20020a05651c204d00b0025e3111419fmr5492973ljo.320.1662017330935; 
 Thu, 01 Sep 2022 00:28:50 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv.
 [109.73.99.134]) by smtp.gmail.com with ESMTPSA id
 m9-20020ac24249000000b00492f37e428asm2251246lfl.172.2022.09.01.00.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 00:28:50 -0700 (PDT)
Message-ID: <fea60b71-4623-43f5-d81c-a0250a63c697@linaro.org>
Date: Thu, 1 Sep 2022 10:28:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/6] ASoC: codecs: wsa-macro: add support for sm8450 and
 sc8280xp
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh@kernel.org>
References: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
 <20220818134619.3432-3-srinivas.kandagatla@linaro.org>
 <20220818171222.GG1978870-robh@kernel.org>
 <9c9226d9-8470-6672-d8ce-3fb1e4df3fda@linaro.org>
 <5da6171a-4949-9cc7-2967-6cc39a7955c8@linaro.org>
 <a4562481-780b-585f-01a5-d447040fbd0a@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a4562481-780b-585f-01a5-d447040fbd0a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org
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

On 31/08/2022 13:37, Srinivas Kandagatla wrote:
> 
> 
> On 31/08/2022 10:19, Krzysztof Kozlowski wrote:
>> On 31/08/2022 12:17, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 18/08/2022 18:12, Rob Herring wrote:
>>>> On Thu, Aug 18, 2022 at 02:46:15PM +0100, Srinivas Kandagatla wrote:
>>>>> Add compatible for sm8450 and sc8280xp.
>>>>>
>>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>>> ---
>>>>>    sound/soc/codecs/lpass-wsa-macro.c | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
>>>>> index 27da6c6c3c5a..f82c297ea3ab 100644
>>>>> --- a/sound/soc/codecs/lpass-wsa-macro.c
>>>>> +++ b/sound/soc/codecs/lpass-wsa-macro.c
>>>>> @@ -2561,6 +2561,8 @@ static const struct dev_pm_ops wsa_macro_pm_ops = {
>>>>>    static const struct of_device_id wsa_macro_dt_match[] = {
>>>>>    	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
>>>>>    	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
>>>>> +	{.compatible = "qcom,sm8450-lpass-wsa-macro"},
>>>>> +	{.compatible = "qcom,sc8280xp-lpass-wsa-macro" },
>>>>
>>>> Looks like these are backwards compatible with the existing versions,
>>>> why not reflect that in the binding?
>>> Backward compatibility is not always true, some of the registers and
>>> there defaults tend to change across SoCs. Having SoC specific
>>> compatible could help us deal with this and also make code more inline
>>> with other codec macros in LPASS IP.
>>
>> I am not saying that there should be no SoC specific compatible. This
>> one is a must, but the question why duplicating the entries and not
>> using fallback?
> 
> You mean using fallback compatible "qcom,sc7280-lpass-wsa-macro" in 
> sc8280xp devicetree and not add new compatibles in the driver?
> 
> The reason for adding this new compatible strings is that macros in this 
> lpass codec that differ form each SoC.
> ex: [PATCH 6/6] ASoC: codecs: tx-macro: add support for sm8450 and 
> sc8280xp and there is a pending patch on va-macro that has soundwire 
> controller frame sync and reset control which is moved from tx-macro to 
> va-macro.
> 
> so DT might endup with mix of compatibles for same LPASS Codec like this:
> 
> "qcom,sc7280-lpass-wsa-macro"
> "qcom,sc8280xp-lpass-va-macro"
> "qcom,sc8280xp-lpass-tx-macro"
> "qcom,sc8280xp-lpass-rx-macro"
> 
> AFAIU, the fallback thing will work for things that are identical but in 
> this case they differ across SoCs, and having SoC specific compatibles 
> in now would help handle this.

Ahh, I see now. The true problem is that driver encodes compatibles in
several places. That's very confusing design - variants should be rather
customized via driver data, not via multiple of_device_is_compatible()
inside the code.

Best regards,
Krzysztof

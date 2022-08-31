Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C88245A7B76
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Aug 2022 12:38:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FD1716BD;
	Wed, 31 Aug 2022 12:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FD1716BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661942308;
	bh=AyGIJtuv7xSMsJfwvkAtNQmhv8arWeVL3on2S8q9+oY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gLVHkAMVuI9/2sOAF//7B9TCzdk8HsT/fyPcGv8sYcZCD+8FPQQV7qUHUlmeg9Gl/
	 K6KdAGfS2bIJTI7H+Zi7UqHjhgAoeQY0n0Pfp25Ygh8gXFtqOq6hyx4ap66Bt78E0C
	 N27XBOngAXt+MYMOoXCEJKnnNFrJw4w8tproto8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A823F80448;
	Wed, 31 Aug 2022 12:37:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56D58F8042F; Wed, 31 Aug 2022 12:37:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89E72F800AA
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 12:37:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89E72F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="sjv1ud0N"
Received: by mail-wr1-x42f.google.com with SMTP id e20so17644479wri.13
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 03:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=qmSDVvWPmXjsEoLB/yy4dBeFNE6LDECdPTKFlVF1PoE=;
 b=sjv1ud0NJToWCCz5mpoI1XXv7VRN42nSodi+vU6HqC3fe4/RDdH9q78MztUStUg3tz
 Xc2VH//pGT74lRB34bGeve8JkG1qnn0+IqPnock9NFdhh6qZlnaCkIyowzKTRT7FJxji
 z/GR4fNB9q+235VImiHhUj3qtbmxYAGPA6OWg32iyZY+RWa1WOllcMXAW5Ypa+UHJ8jW
 8xs5JdrK3PiKkOFMlLV0DL+qhh48j42QQnv6mKDYipwbJKuU6YxKUw7q3wlwpZcq+q8X
 TT/+nZgkSnsztlClPhtaZpJBrpVs5ezXDDOxx5Tro2hYIsNMiKVkIvoSrdqaMCZkKMyS
 wVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=qmSDVvWPmXjsEoLB/yy4dBeFNE6LDECdPTKFlVF1PoE=;
 b=zLVZF/9tc4do30FDzvtkCioU5TcJ6gPUGmGg0CBvi90l7QMXLHQCPvkK3WhSyFTtzt
 bUdz/2RH5/NV83R545uuABK8GSJOW7M1fr7WkM8EroMMlELyCtTI3FLX1Egt32kRi3pD
 91UY6a+PPr/iYdYwb6HeGpAYo0NrJaIe88Gq2QCXRLdLwaA2Y/6XSobPpQyWtmNEIwEZ
 FVZ29i383KZb3MzJFqA6+VgNS8YsfhubVSzThgDYHwpaaNgPYhh4tisKnIMGAZ3cZQUN
 idw7oMXNch6SWkb+HqJNl5EAaInUsVC7PZByD9vGDKqB1jXt4WUNS0IIREXrL1Wp4JfO
 7AYw==
X-Gm-Message-State: ACgBeo3Zi+IEOBa2z92H14Udof96bdso4IV4NqljSO7Z2SxKOVPUHwOb
 FqIrDG24+H234DgWC0YUzMUapg==
X-Google-Smtp-Source: AA6agR7zq/2i3kOzfh+ND3aVSosKcimESlsCtfJ9TPLHCMLrzMvYwqw/Dz65I9sh80Ti/NbGaa+m0w==
X-Received: by 2002:a05:6000:144a:b0:220:7181:9283 with SMTP id
 v10-20020a056000144a00b0022071819283mr10935127wrx.158.1661942237422; 
 Wed, 31 Aug 2022 03:37:17 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 e3-20020adfe383000000b0021ef34124ebsm12377427wrm.11.2022.08.31.03.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 03:37:16 -0700 (PDT)
Message-ID: <a4562481-780b-585f-01a5-d447040fbd0a@linaro.org>
Date: Wed, 31 Aug 2022 11:37:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/6] ASoC: codecs: wsa-macro: add support for sm8450 and
 sc8280xp
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
References: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
 <20220818134619.3432-3-srinivas.kandagatla@linaro.org>
 <20220818171222.GG1978870-robh@kernel.org>
 <9c9226d9-8470-6672-d8ce-3fb1e4df3fda@linaro.org>
 <5da6171a-4949-9cc7-2967-6cc39a7955c8@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <5da6171a-4949-9cc7-2967-6cc39a7955c8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 31/08/2022 10:19, Krzysztof Kozlowski wrote:
> On 31/08/2022 12:17, Srinivas Kandagatla wrote:
>>
>>
>> On 18/08/2022 18:12, Rob Herring wrote:
>>> On Thu, Aug 18, 2022 at 02:46:15PM +0100, Srinivas Kandagatla wrote:
>>>> Add compatible for sm8450 and sc8280xp.
>>>>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>> ---
>>>>    sound/soc/codecs/lpass-wsa-macro.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
>>>> index 27da6c6c3c5a..f82c297ea3ab 100644
>>>> --- a/sound/soc/codecs/lpass-wsa-macro.c
>>>> +++ b/sound/soc/codecs/lpass-wsa-macro.c
>>>> @@ -2561,6 +2561,8 @@ static const struct dev_pm_ops wsa_macro_pm_ops = {
>>>>    static const struct of_device_id wsa_macro_dt_match[] = {
>>>>    	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
>>>>    	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
>>>> +	{.compatible = "qcom,sm8450-lpass-wsa-macro"},
>>>> +	{.compatible = "qcom,sc8280xp-lpass-wsa-macro" },
>>>
>>> Looks like these are backwards compatible with the existing versions,
>>> why not reflect that in the binding?
>> Backward compatibility is not always true, some of the registers and
>> there defaults tend to change across SoCs. Having SoC specific
>> compatible could help us deal with this and also make code more inline
>> with other codec macros in LPASS IP.
> 
> I am not saying that there should be no SoC specific compatible. This
> one is a must, but the question why duplicating the entries and not
> using fallback?

You mean using fallback compatible "qcom,sc7280-lpass-wsa-macro" in 
sc8280xp devicetree and not add new compatibles in the driver?

The reason for adding this new compatible strings is that macros in this 
lpass codec that differ form each SoC.
ex: [PATCH 6/6] ASoC: codecs: tx-macro: add support for sm8450 and 
sc8280xp and there is a pending patch on va-macro that has soundwire 
controller frame sync and reset control which is moved from tx-macro to 
va-macro.

so DT might endup with mix of compatibles for same LPASS Codec like this:

"qcom,sc7280-lpass-wsa-macro"
"qcom,sc8280xp-lpass-va-macro"
"qcom,sc8280xp-lpass-tx-macro"
"qcom,sc8280xp-lpass-rx-macro"

AFAIU, the fallback thing will work for things that are identical but in 
this case they differ across SoCs, and having SoC specific compatibles 
in now would help handle this.


thanks,
srini

> 
> Best regards,
> Krzysztof

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AC55A7A0E
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Aug 2022 11:21:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8035C16C2;
	Wed, 31 Aug 2022 11:20:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8035C16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661937694;
	bh=c41Ic7GYK9mfBRhy70eW3MM2nlafHKuc2NfK9D0mdpg=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RjrCaJKTBns7yNo3db6nYJGdau3B2atjBbewwqwO3o5dGF9NO37bAZ4BUaHGaipTC
	 5+ZrsLdnHywwGNyOAj0sLc05gf/z8SBbjrfUNp0nxTe3IN+B9AbcG9uzuG43DH8RmT
	 1M/1NgKaBBDIi4cla+KiNQUZheIiNDq9HEZQxjjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0517EF8042F;
	Wed, 31 Aug 2022 11:20:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3C79F80236; Wed, 31 Aug 2022 11:20:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89A9EF800AA
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 11:20:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89A9EF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qCcg3POQ"
Received: by mail-lf1-x134.google.com with SMTP id br21so13306894lfb.0
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 02:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=12RSIGhRtr9b6edhSOV22TS2WqSvQe+u6liWCFLrqB8=;
 b=qCcg3POQ4tieRM9QtfwABLWGqpnyEEaniTbHu1ugJvp9sKy34auvnTs0lEqBSN/Z0K
 fD5UWIgOsYGFoKST0bwvUA7y41KcLsUHwKIn2X3USm1SlqUXVAsBcScaCkeuYuqK/ezS
 iJG9+udA0KscuWNVSE5rwJgx1d2qY+n5IyVu5nG9V9OP5arQBohFctnbKXH+CtS56hJF
 2U4UEhxVrvQhFrc3IiKOtxf2R2CkopRklw6tO/MdgHHMlBFoHTDdh4qDNLuk77V+iPcr
 Bxh+gokElxLaJlNPnsAE08ytcNb5z5uc3djnzdeZ5v+pp/ll60Ds0sLkEs3KRr5uyCm7
 piAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=12RSIGhRtr9b6edhSOV22TS2WqSvQe+u6liWCFLrqB8=;
 b=2lHoF7QooHBWXDDROeQpxPYlGo0ZFeGLWqScS1nVtVoAO6T87fCM5nY91QYTGY1ZbI
 DP9VmUDNExtOTkMdXbZQuzxmWv3ki0ghdJC8YB4vip2aujoGBEBJH+NvjQpcJPU4dBMM
 PlXOh0Nz36gB7fcXELVPNbDwv1nZ89dAum/fkBlMEgNUU+zQzChPaeK6gaItEqB89gLv
 P3bCCZ5KZcX+Y/g8DkeZhA6o2WO33a6WOsO83QwmkJy3icyUM+cKAXc6N3SNR5O3CAp9
 BxUe0mDgQubp55S4IblYOYsfX9TR+/HcwOdQN8VuauXt6r30b3c6zJ45x3ucKs64EjPd
 TDrQ==
X-Gm-Message-State: ACgBeo0mLFyM8WtaTX3Z0cNlT1UhIWwzjManPkQpOuYhi/AOElveEYcU
 S/gqeUxRjgO550/xEXuLunQw8w==
X-Google-Smtp-Source: AA6agR7ifW8MY/9QxhMLiGwfPS/TPCoSLZpYTgLp1IaXRvqBoxDCCGiXCLstB8TPs0RtAsIfWIxIVQ==
X-Received: by 2002:a05:6512:6c8:b0:494:796e:93b6 with SMTP id
 u8-20020a05651206c800b00494796e93b6mr2297183lff.213.1661937624340; 
 Wed, 31 Aug 2022 02:20:24 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv.
 [109.73.99.134]) by smtp.gmail.com with ESMTPSA id
 t5-20020a2e5345000000b0025ddad51e48sm1921317ljd.140.2022.08.31.02.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 02:20:23 -0700 (PDT)
Message-ID: <08916db2-65f3-5e0b-7b98-7cbaff5b7059@linaro.org>
Date: Wed, 31 Aug 2022 12:20:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/6] ASoC: codecs: wsa-macro: add support for sm8450 and
 sc8280xp
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh@kernel.org>
References: <20220818134619.3432-1-srinivas.kandagatla@linaro.org>
 <20220818134619.3432-3-srinivas.kandagatla@linaro.org>
 <20220818171222.GG1978870-robh@kernel.org>
 <9c9226d9-8470-6672-d8ce-3fb1e4df3fda@linaro.org>
 <5da6171a-4949-9cc7-2967-6cc39a7955c8@linaro.org>
In-Reply-To: <5da6171a-4949-9cc7-2967-6cc39a7955c8@linaro.org>
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

On 31/08/2022 12:19, Krzysztof Kozlowski wrote:
> On 31/08/2022 12:17, Srinivas Kandagatla wrote:
>>
>>
>> On 18/08/2022 18:12, Rob Herring wrote:
>>> On Thu, Aug 18, 2022 at 02:46:15PM +0100, Srinivas Kandagatla wrote:
>>>> Add compatible for sm8450 and sc8280xp.
>>>>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>> ---
>>>>   sound/soc/codecs/lpass-wsa-macro.c | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
>>>> index 27da6c6c3c5a..f82c297ea3ab 100644
>>>> --- a/sound/soc/codecs/lpass-wsa-macro.c
>>>> +++ b/sound/soc/codecs/lpass-wsa-macro.c
>>>> @@ -2561,6 +2561,8 @@ static const struct dev_pm_ops wsa_macro_pm_ops = {
>>>>   static const struct of_device_id wsa_macro_dt_match[] = {
>>>>   	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
>>>>   	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
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

s/I am/We are/
I really thought that it was my comment. :)

> one is a must, but the question why duplicating the entries and not
> using fallback?

Best regards,
Krzysztof

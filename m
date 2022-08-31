Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FC95A7A03
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Aug 2022 11:20:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B924416CA;
	Wed, 31 Aug 2022 11:19:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B924416CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661937623;
	bh=40TJUbd/LIbC4uJ3UO3rgWT/FK8hXrgj0nhi6gaCxmA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p8j/JQoizMRCMnRru5oOttYVk7MWVLLc9lP5IrGUi+QW4RZ1wMlW1ds8ZDj4ntdvn
	 0LXtSnfhhbISxwbLmNNb4TjkZZS8Zsn/74vjpVokpadvFoRUNwtW96wOy7k9B1pvhO
	 1UhAZAcc3XjaVtEv/+8tIEpKhS6PdSL+Nt/4MCKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75BA8F800AA;
	Wed, 31 Aug 2022 11:19:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1538DF80448; Wed, 31 Aug 2022 11:19:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 869FAF800AA
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 11:19:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 869FAF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="l/XeKVh2"
Received: by mail-lf1-x136.google.com with SMTP id w8so10009554lft.12
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 02:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=+pwFDg0e0j+yXSWZO1QdYOdmfRiXIedB2SifAAmn8XI=;
 b=l/XeKVh2yJtrLsYPx4G5AdOSXv4Uyh0J3MSLro6syYpwPvq4Bw46hy3wZ1Ilkv5dIF
 LSrnQ8tjtKNc3SxxPH9lKvuWdhPfJWFUJecLJDYORyahIXTErnRyW3KvzdLT6dWyTS22
 LfHjdoH9FWpyguDshL/AnL4NhAZInG/YKh7uk/OgCF2cFCbslvKn/CpTS4jApAS0SctR
 6yWLpZClaTeXOwjlUxJcMexUH/xsdqd5XvWOl54wSjlSJBxPYUlWq/5f0EEPMoZxQaht
 Pl9RzmQ4ZrU9r4j58FNmeP0pK1WLGmry0jC2QaO+4hG6HChazS+CDQ5ATVb4RSAJ4Mzc
 sw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=+pwFDg0e0j+yXSWZO1QdYOdmfRiXIedB2SifAAmn8XI=;
 b=OlGXjlC0X4uFIEbQIG+acvxS51SXoZoO+Oo+usrrte3rzfhYZvc/fLt0XBvlZ7vlrg
 ztGha/qsj6Nh3FzMnyVdxCm9x2mQjQjR0CzcNgTVgzZxsKUgvhIL8IRc7kqDs9W/lqRF
 rMKxNFXUlfp4TEGq9DwYlqsW098JC4atowiG6JVlX4biU07LQTK5GqxobanbNjS/FKDi
 YKs5rPqMXwoOClEmBFgDY/zDyMiXPSHvwousicJr78ZeZHfSLd0rXcCnUmjOJ3D4t9yX
 dQLOgvL3gDF8NEJTdJ6btW7XtvWp/Vx2M6p+rQSrCLCC4j0C5BpFiulta5/VwczXGKzT
 6wBQ==
X-Gm-Message-State: ACgBeo0zP5PpX0vT/Zv5q1CqurI49WfKW3oH3Kc6RLZYWAwiz5cit8Yh
 mpQCaPAGGv3aqnm6r14d+9w45w==
X-Google-Smtp-Source: AA6agR4uihFpaG8nK8poPhUm9j3r98rElE4l/J0Vn5UOIDcFiGql16aEPEIcKVvDvdd4p7q8DsLUng==
X-Received: by 2002:ac2:5b50:0:b0:494:5ec2:1ea5 with SMTP id
 i16-20020ac25b50000000b004945ec21ea5mr6367241lfp.276.1661937552410; 
 Wed, 31 Aug 2022 02:19:12 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv.
 [109.73.99.134]) by smtp.gmail.com with ESMTPSA id
 r7-20020a2e8e27000000b0025dd8b42c64sm1108430ljk.79.2022.08.31.02.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Aug 2022 02:19:11 -0700 (PDT)
Message-ID: <5da6171a-4949-9cc7-2967-6cc39a7955c8@linaro.org>
Date: Wed, 31 Aug 2022 12:19:10 +0300
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9c9226d9-8470-6672-d8ce-3fb1e4df3fda@linaro.org>
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

On 31/08/2022 12:17, Srinivas Kandagatla wrote:
> 
> 
> On 18/08/2022 18:12, Rob Herring wrote:
>> On Thu, Aug 18, 2022 at 02:46:15PM +0100, Srinivas Kandagatla wrote:
>>> Add compatible for sm8450 and sc8280xp.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> ---
>>>   sound/soc/codecs/lpass-wsa-macro.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
>>> index 27da6c6c3c5a..f82c297ea3ab 100644
>>> --- a/sound/soc/codecs/lpass-wsa-macro.c
>>> +++ b/sound/soc/codecs/lpass-wsa-macro.c
>>> @@ -2561,6 +2561,8 @@ static const struct dev_pm_ops wsa_macro_pm_ops = {
>>>   static const struct of_device_id wsa_macro_dt_match[] = {
>>>   	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
>>>   	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
>>> +	{.compatible = "qcom,sm8450-lpass-wsa-macro"},
>>> +	{.compatible = "qcom,sc8280xp-lpass-wsa-macro" },
>>
>> Looks like these are backwards compatible with the existing versions,
>> why not reflect that in the binding?
> Backward compatibility is not always true, some of the registers and 
> there defaults tend to change across SoCs. Having SoC specific 
> compatible could help us deal with this and also make code more inline 
> with other codec macros in LPASS IP.

I am not saying that there should be no SoC specific compatible. This
one is a must, but the question why duplicating the entries and not
using fallback?

Best regards,
Krzysztof

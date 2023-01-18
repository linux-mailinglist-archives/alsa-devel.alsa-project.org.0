Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C54671E4B
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 14:43:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C174B3B44;
	Wed, 18 Jan 2023 14:42:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C174B3B44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674049415;
	bh=m2z8ZT/JeUv/duakXczjmQ1AtLtfp1unkt7+G0GCiKs=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qiuJYGFZak/X2biqGkBYztTAmc+PBJRb4ffPJqk+9BVN79i3p5Sep0vQWhd6dkAHy
	 hQ67OMDkBaA8SgS1jWQdKvkMN7moqOJD+HSOSs8HOqkK/ekhvxKARHv8X4M3ZvuojJ
	 X7LNs90nwHiMAfzGT6XXTM3DwQRawYBXmTRT9SOQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D8D7F805BD;
	Wed, 18 Jan 2023 14:26:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 505B1F805BB; Wed, 18 Jan 2023 14:26:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E703EF805B6
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 14:26:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E703EF805B6
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZqJeDahI
Received: by mail-wm1-x32e.google.com with SMTP id k16so4028407wms.2
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 05:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S3k8frPalWO3Z3os+kNp0jp8dx/XM1Dyquz57dFW8EA=;
 b=ZqJeDahIqkSzoQJifZAZvvOn5FPWyWN/dKqKzr+D0yILoa1Yhq+84XSUD+kB31zN5+
 4DEJAL49lbIKnZqgHs08GIRJ5CfNDgSNm0f4qNyHdcD+WXOJxLBBZQV8gKFXJ5QtDtuY
 0c1/E/SGQ9ZoM2awPSnLJVq5vsjYoeE4n98Wd9EsDpkix3xSQi/c675ZV7KYCjcm9Rcj
 vX0BjIWYtdECxW6zSsHNVpFyLAHMyCCtjBztU9tw9Sge7b0K1bRL2FRRTwxlPfNlaktS
 DnXRAsbly8J06BHP/jjWft47IImkOeS5IsCIpTEri0ZlRuW3+/g6NVDdqLteoI5ZNPUJ
 9TVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S3k8frPalWO3Z3os+kNp0jp8dx/XM1Dyquz57dFW8EA=;
 b=svmtP1HgaWHbRm2fqhzfDjnyNR4FfEhT8fCQY4d0hMAQU/RmbQt1dcVEZoeIyq3HnE
 PrEkeIAPRRb7OXOzrGUG908JvMVQz51qsR2aLQwOZ2cUG3leZGP3/VI4LCNm6XmxpmyD
 QXf6QilPvP8vkr+Nos3xD8qYak7eQ8lsnLvj6xMSfM1E+/F7Bv++dCaozHhsF8jXmna1
 gdyLId9YWpGqgZUv1vQL/t0XOkMKXwEOnAwRY8+SUJEYWdyssTcCthUK3A6ZPRjwHRoF
 sESdu6B6S5wd+jaLvzAM0/sCUWu0vq0AkBHpnvvt1Zj4I8KLMdQWQ8wN0H9Cm/hGWFUt
 qMuQ==
X-Gm-Message-State: AFqh2kpLjGzLhj2J6L6js+1JMrl6i+F8F+OA9JOx7SieJIAruudj4wOG
 KEzogWH9RtRF4qo2yG6QpvPwTg==
X-Google-Smtp-Source: AMrXdXs37wvLroZfU7gxPexS9gisJjQH9LTOdnfUkpefHwuHlTbMrugwkgRc/efeLQZknOBY6HRD0g==
X-Received: by 2002:a05:600c:281:b0:3da:1132:4b63 with SMTP id
 1-20020a05600c028100b003da11324b63mr6726498wmk.5.1674048370192; 
 Wed, 18 Jan 2023 05:26:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a05600c384400b003d9862ec435sm1998066wmr.20.2023.01.18.05.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 05:26:09 -0800 (PST)
Message-ID: <b4ae25ea-bccd-d845-c133-488d23d92e47@linaro.org>
Date: Wed, 18 Jan 2023 14:26:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: qcom,wcd934x: Describe slim-ifc-dev
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
 <20230113162214.117261-2-krzysztof.kozlowski@linaro.org>
 <20230117192724.GA3489389-robh@kernel.org>
 <331eed95-eaf7-5c5a-86c1-0ee7b5591b9a@linaro.org>
 <CAL_JsqJUTFa24iZ2fovE_yJdBVcbkcUX8rBoPB12ptdAyxHW6g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAL_JsqJUTFa24iZ2fovE_yJdBVcbkcUX8rBoPB12ptdAyxHW6g@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 18/01/2023 14:19, Rob Herring wrote:
> On Wed, Jan 18, 2023 at 5:25 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 17/01/2023 20:27, Rob Herring wrote:
>>> On Fri, Jan 13, 2023 at 05:22:13PM +0100, Krzysztof Kozlowski wrote:
>>>> The "slim-ifc-dev" property should not be just "true", because it allows
>>>> any type.
>>>
>>> Yes, but it is common, so it should be in a common schema. Though
>>> there's only one other binding using it (wcd9335.txt).
>>
>> This is still wcd9335 and wcd934x specific, not really common. Maybe
>> next Qualcomm codec would also bring it so then we can define common
>> schema for the codecs. But so far I think it is not really a common
>> property.
> 
> By common, I only mean used by more than 1 binding. That's already the
> case, there's just not a schema for the 2nd one. In any case, can
> address that later.
> 
> Acked-by: Rob Herring <robh@kernel.org>

Sure!

Best regards,
Krzysztof


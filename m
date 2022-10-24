Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D080E60B192
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:28:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6345C7018;
	Mon, 24 Oct 2022 18:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6345C7018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666628881;
	bh=7cy451XeIdAuGLo+FOX6eRNTQ/9508HKImMsdnVKrQQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tKFtndrveCb3XU4AboUWXGL1io7cNsB5nM42twiNnMFgerFRYReYnKn0sH+LkLR4t
	 RtFuMUDar57/oDW+N3lx+yMWoULkNnYRz5LUHXAFUClHOTET/xLqgmMB1RwFzRROxh
	 cINvbxlixDltX6Rt+3FGeO8ir35UTOX5yQk7iSn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3B26F8053D;
	Mon, 24 Oct 2022 18:27:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07158F80533; Mon, 24 Oct 2022 18:27:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDD7FF80506
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDD7FF80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JVw98DRL"
Received: by mail-qk1-x731.google.com with SMTP id 8so6391755qka.1
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tf6X2JwY5gzQNXIY/4lYcGsz+j+jvZppJXPsvhE0i5M=;
 b=JVw98DRLXqdkcB9ycE2so6CJUYQSy3rvAi9T2R5hCemkufl620ez1/I3QAsm17Ua42
 Mul2/usszZMWq7lqGw1nwS3wk0/u6fEFEiddRwYJFlVwlmifIouzDajTvCVlJUqC+2wa
 Yt9Y5xYBqYqzlRUnjlqnaCGhKlBSccwRhcqmXxihthexKFqlK6LST551kS27F/nXecWk
 Y0X6yGaF/o4D7nmP389aIQiqBuZUwjV+ObzXNXTocVHTMer893fk7EZC/bCm/W+LZ35L
 Zr0BNs6Pbac3p4aiiyLBqf7rE4b34S0vsUMYp5ct+XFvSiXmDmNfPdefVfMpCORBXyek
 cYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tf6X2JwY5gzQNXIY/4lYcGsz+j+jvZppJXPsvhE0i5M=;
 b=0d8c6X9p7dkrJuicq0TanKZTN7NkXXR42UzPOeFsKy2/V/haBqzdhEA8LuZk7ejxC8
 9pO7XBPa5bB9F47bUXjw7Uxc2DaeoyqWnDct8vwkSzaoDU4fldyMaQ2FwXw4pXFx9nAu
 vOmjqgy3zemol+flXTnU3K+KTjGa2fE6+uBazz2v7nmpBmnoPBqx5fao3aGGmvxGCaHF
 ZDi9kNalWbl3ePNjtXsm7FX0TdWzNgE7t28Y9YS9NV6eiSJxYdb/bUmdvcgjOV4EizRa
 SXDB7x/klDn4xUiJlJDy3KfGs54ujnE2sDHgyKaacZ+ua7KfClzO/ALLup5avHm8lgI3
 Jzhw==
X-Gm-Message-State: ACrzQf32twaEDh/mO1yP8YWQQC5ByZMBnFcu2JEr83yFkpZicu6DpItn
 yfB5RSpFZgaC84C4kZYZZImjgQ==
X-Google-Smtp-Source: AMsMyM5tZQKlsTeqTkEEjEORICLwKgvKCNbuQWAHDqQNfz6hdI9JY+sGKw6NghJJJYfqo63E16h5qg==
X-Received: by 2002:a05:620a:8016:b0:6ee:9481:9298 with SMTP id
 ee22-20020a05620a801600b006ee94819298mr23468257qkb.251.1666628815999; 
 Mon, 24 Oct 2022 09:26:55 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93]) by smtp.gmail.com with ESMTPSA id
 k124-20020a37ba82000000b006ec09d7d357sm230978qkf.47.2022.10.24.09.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 09:26:55 -0700 (PDT)
Message-ID: <9e51d4fd-ef55-c516-e878-87167f2a8fee@linaro.org>
Date: Mon, 24 Oct 2022 12:26:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: realtek,rt5682s: Add AVDD and
 MICVDD supplies
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20221021190908.1502026-1-nfraprado@collabora.com>
 <20221021190908.1502026-3-nfraprado@collabora.com>
 <ae460461-5c20-9180-456c-8c01a4b1a7f1@linaro.org>
 <20221024150649.wbd54lcvgrj4kxgu@notapiano>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024150649.wbd54lcvgrj4kxgu@notapiano>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On 24/10/2022 11:06, Nícolas F. R. A. Prado wrote:
> On Sat, Oct 22, 2022 at 12:39:56PM -0400, Krzysztof Kozlowski wrote:
>> On 21/10/2022 15:09, Nícolas F. R. A. Prado wrote:
>>> The rt5682s codec can have two supplies: AVDD and MICVDD. Add properties
>>> for them.
>>>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>> ---
>>>
>>>  Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
>>> index ea53a55015c4..ca1037e76f96 100644
>>> --- a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
>>> @@ -90,6 +90,10 @@ properties:
>>>    "#sound-dai-cells":
>>>      const: 0
>>>  
>>> +  AVDD-supply: true
>>> +
>>> +  MICVDD-supply: true
>>> +
>>
>> How about keeping some order in the list of properties?
> 
> The current properties don't seem to follow any particular order and keeping the
> supplies grouped together seemed reasonable. What ordering do you suggest?

That's true...  :/

Best regards,
Krzysztof


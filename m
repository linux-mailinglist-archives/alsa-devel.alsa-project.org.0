Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E364537041
	for <lists+alsa-devel@lfdr.de>; Sun, 29 May 2022 10:03:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 352E718CC;
	Sun, 29 May 2022 10:02:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 352E718CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653811397;
	bh=WcqxtOKZOK9aSphwmki5lO7jU7MeXJv2u1LICXeegh4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SoLbfhKlESM4MeDGfH1IysQgEQ2VRIl7V+yb9sa62Or6Mfb1N2gPUtX7uEjJJnWZB
	 L6PttTh8cFofchkUri+hY1AllkWOq026wbCueohJi1HBISFQZXbbn4pg81xecknvHq
	 XDgngLAIa95hZuq1N+KInWA3kmzSx/LD4HK3shIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B61FFF8026A;
	Sun, 29 May 2022 10:02:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8309F8024C; Sun, 29 May 2022 10:02:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCC44F800DE
 for <alsa-devel@alsa-project.org>; Sun, 29 May 2022 10:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCC44F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="gZn7NUJQ"
Received: by mail-ed1-x532.google.com with SMTP id j28so9971163eda.13
 for <alsa-devel@alsa-project.org>; Sun, 29 May 2022 01:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UDbcZey2Qic72q7wZpZ3xzumGPDOPPDFso1OJL9a9QE=;
 b=gZn7NUJQBDiX30l4ps8Ty1Jgo+c9DBxt8rxmCX47qGVZlsNvF3/ziY8kLhwnEQmke1
 FuGjDvyAuI1I7ZLtiPhaNNolc16dzWLu2fMYwX63sYWWIGIHfBCRbVivSyQxnkefo/Bq
 SlP+PfB6EVS/SC4ABworMcY7cisT8Gfmb/7EGRN+GtJIhxMDW4aTvxPsvCHGjXv8W395
 UXVjwXk+hstu3nL6UPtGCNox5pUw9l9HaboW5JUpVxA2E5JyJTX/4O7ua02U6vA5XHcl
 qjQrRrXiDWeQJvuNLlVOn1w2R0SsJCD/Hrt8Gb2LeU9DtgXJbpjSm3xmWFM4sZBD5nib
 BLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UDbcZey2Qic72q7wZpZ3xzumGPDOPPDFso1OJL9a9QE=;
 b=Va86nofaUOe8Tt65h0cDQ8thwILScEBjJAnNIH8wOfDaf65Ig/cYb8UJYw/cgMJdwy
 QA2ghh8P7BpUFkdEw/dQ1uDKGfp1679jrFHFTp3q7KPQrOkPrXs9VnDKfJDo0foHyceB
 PoVYq0uDr8Gh/9K3m67yDpdn/9ITnk+3rFjOP+YlzJ8+6u2jw8odP+3TvJ522ARdxP5Z
 nx3ODqsnvPXcLxvGgQF0B/S6H5hLDJ7Lfxqgr7KLWPo48+vPJDSaIdiIsMpS2RtZwM/c
 9QV1d6hiT/MXkFeVQlTqpbG0s981jrRUBFkUT//fJwTwTceO9ckvqnSX2+HgTSP0uWTN
 7wfw==
X-Gm-Message-State: AOAM530tWOvbQvqw1wVrVKf6tf2+PTQtqWHgvDH8CS4nYIiv/O0wvFBG
 UqxuDU1X8W1jsMyvG9U4V9yHHw==
X-Google-Smtp-Source: ABdhPJyehAc2r10hf/j2xJPy6edB19h6IE3t7+EDA/JJ+7Ogyn8k+xE2wE4zBRqodu+Al+nqDgwOSg==
X-Received: by 2002:a05:6402:6cc:b0:42d:bd2d:9f82 with SMTP id
 n12-20020a05640206cc00b0042dbd2d9f82mr5188023edy.59.1653811328959; 
 Sun, 29 May 2022 01:02:08 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 pg7-20020a170907204700b006f3ef214dfdsm2950671ejb.99.2022.05.29.01.02.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 May 2022 01:02:08 -0700 (PDT)
Message-ID: <21351474-56d5-6e11-314b-1599b34e3f42@linaro.org>
Date: Sun, 29 May 2022 10:02:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] ASoC: dt-bindings: mediatek: mt8192: Add i2s-share
 properties
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220509205847.607076-1-nfraprado@collabora.com>
 <e8d854c0-e2a5-2382-4b54-c5e879170324@linaro.org>
 <20220527190542.4jckyflvtkq4n7ie@notapiano>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220527190542.4jckyflvtkq4n7ie@notapiano>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Shane Chien <shane.chien@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
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

On 27/05/2022 21:05, Nícolas F. R. A. Prado wrote:
> On Thu, May 26, 2022 at 08:49:39AM +0200, Krzysztof Kozlowski wrote:
>> On 09/05/2022 22:58, Nícolas F. R. A. Prado wrote:
>>> The Mediatek AFE PCM controller for MT8192 allows two I2S interfaces to
>>> share the same clock and act as a single interface with both input and
>>> output. Add patterns for these properties in the dt-binding. The
>>> property is split into two patterns in order to allow all valid
>>> interface pairings.
>>>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>>
>>> ---
>>> The series from v1 of this patch was merged although some changes were
>>> still needed in this patch, so the v1 of this patch was reverted [1] and
>>> this standalone commit addresses the feedback from v1 and readds the
>>> property.
>>>
>>> [1] https://lore.kernel.org/all/20220509185625.580811-1-nfraprado@collabora.com
>>>
>>> v1: https://lore.kernel.org/all/20220429203039.2207848-2-nfraprado@collabora.com/
>>>
>>> Changes in v2:
>>> - Added "mediatek," prefix to property
>>> - Rewrote and added more information to property description
>>> - Split into two patterns to validate that output-input pairings are
>>>   done
>>>
>>>  .../bindings/sound/mt8192-afe-pcm.yaml           | 16 ++++++++++++++++
>>>  1 file changed, 16 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
>>> index 7a25bc9b8060..2abf43c6c2c3 100644
>>> --- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
>>> @@ -54,6 +54,22 @@ properties:
>>>        - const: aud_infra_clk
>>>        - const: aud_infra_26m_clk
>>>  
>>> +patternProperties:
>>> +  "^mediatek,i2s[13579]-share$":
>>> +    description:
>>> +      Each I2S interface has a single data line, input if its index is even or
>>> +      output if the index is odd. An input and an output I2S interface can be
>>> +      used together as if they were a single I2S interface with both input and
>>> +      output data lines by sharing the same clock. This property represents this
>>> +      pairing. The value should be the name of the interface whose clock is
>>> +      used, and the property name the other interface that depends on this
>>> +      clock.
>>> +    pattern: "^I2S[0268]$"
>>> +
>>> +  "^mediatek,i2s[0268]-share$":
>>> +    description: Same as above.
>>> +    pattern: "^I2S[13579]$"
>>
>> Rob's question is still valid - why these are not phandles?
> 
> So, instead of having
> 
> 	i2s9-share = "I2S8";
> 
> on the DT, you want us to have something like this:
> 
>         afe_i2s8: mediatek,i2s8 { };
> 
>         mediatek,i2s9 {
>           mediatek,share-clock = <&afe_i2s8>;
>         };
> 
> Or do you mean something else?

Not entirely. This is a binding for mediatek,mt8192-audio, not for I2S9,
so the property should be in this binding referencing your existing I2S
devices.

> 
> It seems like a lot more syntax to express the same thing (and the empty node
> seems awkward), but if that's the DT way, I can change it no problem.

Hm, then the follow up question: why you do not have i2s8 defined in DTS?


Best regards,
Krzysztof

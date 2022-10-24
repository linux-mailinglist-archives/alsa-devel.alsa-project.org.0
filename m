Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6E460B1A3
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:30:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B558701E;
	Mon, 24 Oct 2022 18:29:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B558701E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666629020;
	bh=ByOZC4qBJeHfc9utU1Z8745utsArHJZfrCd+BIQikYs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SkUMio1FR4zZlGs5+iWWjOPCFgagDA0Du5r281LuOvKAv5xcxoMILzeKFttIm/fYW
	 RFTxZ6fcvbnAv6U3U7VYczFVdkx59LbjWrdVAshf2wOwb0wS7BClAyXZlhcho8Ve7X
	 NpYtbl2rVOCiaxJYmBXGv4StxLuJr5W/eiZT3N78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAB71F8053D;
	Mon, 24 Oct 2022 18:29:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A169F80506; Mon, 24 Oct 2022 18:29:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEB25F80506
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:29:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEB25F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mN9JEcfA"
Received: by mail-qk1-x732.google.com with SMTP id s17so6355662qkj.12
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 09:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lGJrVQPc2u8BmXJHhbTLdghe4GhptaKKpCGXInaxYBc=;
 b=mN9JEcfA/k4mMvL/hZaY6pEx5NHRiDoUSSXyXc+7ktUksysoXmwb7A6j3c0J4sBPi4
 royZIXe/7FbOVh+Zgynooe8CQ6KGcnTMryluWGp/CC7+Jo2d71hU3E9h0GVnOqB/73pM
 01WzsLuqJqxdiWhX4TwvucbzFKYn/XKnzc1zj5xd5yNc+6bfcutHdo/ecPMD3+lnY9kE
 ntJp9Unx/qmeWLKaVGGdjj5fqj21OBcVJTOmLNpHZbzvmC+++I2G8TVFA6fA8YOhKjHO
 vJHvmuMw/P/QZeMQ9cwuHJlk4u26ZZ03c0wwxvS4tI5T6mauuDgA2sEB+KXEOybpwQ3r
 71Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lGJrVQPc2u8BmXJHhbTLdghe4GhptaKKpCGXInaxYBc=;
 b=vfN+rOxbJrY8Ojy2BdtdLZ/cZ24mwCynBiY3a19Mq6qPtlkhibd618qgvFE4Z2wydu
 xd/e+0dq3crkVdDZ9s64uneVpQMbtJQke0iCi9ufwVuRHlq7iPbsL/Q17QE/PULWqKDB
 6/DLROi1s2LHOoPpK8YrpI+BuY7vj//indSqLOCVyaYTaCRZVPKbFgeG1ehgiD73JNgd
 jytwSlV/4GiZ5HXXtTATHVyZc2HK9xTob1pXDXkrdAn/neuFOJ4fxYQNNdq/mJsedb6D
 NCYt41My8E7d50vY9fPHbxq23QVXoXncc9Jbl7+stegDDEPoxQegbUZSGpyoiwbH2OHm
 TYiA==
X-Gm-Message-State: ACrzQf2IZlro9dKTJfP0S/FX2X0gObt/srC8HEbKe/KktcqihGjIxYM0
 PRWoEOS4luF1WeRjw7cSloxiGJgN6OfL+A==
X-Google-Smtp-Source: AMsMyM6nNKEGA5WXpAqyAoIBFJfkWQ0wIqWX2Rnnj9/gvhCBUBxmQ8Wb0wGieNxJDAU17FPd6rMxeQ==
X-Received: by 2002:a05:620a:858:b0:6ea:8a17:19fd with SMTP id
 u24-20020a05620a085800b006ea8a1719fdmr23874112qku.397.1666628955532; 
 Mon, 24 Oct 2022 09:29:15 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93]) by smtp.gmail.com with ESMTPSA id
 h7-20020a05620a284700b006ea7f9d8644sm201040qkp.96.2022.10.24.09.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 09:29:14 -0700 (PDT)
Message-ID: <1f56ff1d-4b59-97f9-60d0-12197100ae4a@linaro.org>
Date: Mon, 24 Oct 2022 12:29:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: rt5682: Add AVDD, MICVDD and VBAT
 supplies
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20221021190908.1502026-1-nfraprado@collabora.com>
 <20221021190908.1502026-4-nfraprado@collabora.com>
 <f7007c75-9c99-902d-170f-383b7347922c@linaro.org>
 <20221024160029.cfpyp2cptwig27jd@notapiano>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024160029.cfpyp2cptwig27jd@notapiano>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
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

On 24/10/2022 12:00, Nícolas F. R. A. Prado wrote:
> On Sat, Oct 22, 2022 at 12:41:01PM -0400, Krzysztof Kozlowski wrote:
>> On 21/10/2022 15:09, Nícolas F. R. A. Prado wrote:
>>> The rt5682 codec can have three supplies: AVDD, MICVDD and VBAT. Add
>>> properties for them.
>>>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>> ---
>>>
>>>  Documentation/devicetree/bindings/sound/rt5682.txt | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/rt5682.txt b/Documentation/devicetree/bindings/sound/rt5682.txt
>>> index c5f2b8febcee..5ccf4eaf12a9 100644
>>> --- a/Documentation/devicetree/bindings/sound/rt5682.txt
>>> +++ b/Documentation/devicetree/bindings/sound/rt5682.txt
>>> @@ -48,6 +48,12 @@ Optional properties:
>>>  
>>>  - #sound-dai-cells: Should be set to '<0>'.
>>>  
>>> +- AVDD-supply: phandle to the regulator supplying AVDD
>>> +
>>> +- MICVDD-supply: phandle to the regulator supplying MICVDD
>>> +
>>> +- VBAT-supply: phandle to the regulator supplying VBAT
>>
>> Lowercase.
> 
> Actually looks like there's already a DT using these properties before the
> binding was added:
> 
> arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> 
> In this case should we keep them uppercase for compatibility or carry on with
> the name changes and also update the DT? (the driver also uses uppercase names)

Driver seems to use them as well, then uppercase is fine. But you need
to describe it in commit msg, that you document existing usage, not
adding new properties.

Best regards,
Krzysztof


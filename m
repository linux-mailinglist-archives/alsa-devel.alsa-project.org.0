Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B242219D17
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 12:09:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 005D115E5;
	Thu,  9 Jul 2020 12:08:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 005D115E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594289388;
	bh=zA21wIKrfXcYnZwppvAJTR7CtRciDmU045IerMU6Q+U=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CFJITTJyKqM1uiS8WolnW5y74pyKTNmNmfdsOeV1xg+40rUG9KoHOH5dSLBrH+vze
	 8wTiE/iY0JSLosefNykwdeNmgn1Yy96uH+P5bti/himJWxDB+6gc0O82rC6ofe/Uht
	 gSDEAQcrdrSfGjFrcUr29cNa2m/8tSA9Vaz+g5Ao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CB90F802A0;
	Thu,  9 Jul 2020 12:08:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3365F80117; Thu,  9 Jul 2020 12:08:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 417B8F80117
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 12:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 417B8F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Qn/Yqd4s"
Received: by mail-wr1-x444.google.com with SMTP id f2so1696271wrp.7
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 03:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JjKVHO1k5x52mPl9MQPkeK0c6PmSLam18blFZkKOw/o=;
 b=Qn/Yqd4sMNB1Dt3OO0i55SPIfFAoJlwYB8ZQBscEDiY6iVKMZLcUhWVYnovxjTSkOi
 MVe6Ix2mUDb3Sxfgt+fL+u/h8xnSpfc7WjdzTz/YaImys+o8IOxRIcalTZCMonT9JiNU
 d4EkZ48hD0Srbjk62AUGu/4atgEaJjCLQPQ08nM5bWHGnVh7z8b87aVmhfFgXHJidVJa
 R8/ke1nR45bLvZf7o0A+Qq8RK3/dpCJDHNUD7+19cIRKx5OkW3mln8yAf//JVais7LtZ
 ziGYMXsSjPuXi9ERpNeDO6yEwtldJlV4P2LVn2czFZ2HWwKlzF2yC64Ly0XbOF4sw5Zw
 NEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JjKVHO1k5x52mPl9MQPkeK0c6PmSLam18blFZkKOw/o=;
 b=AhiDDoSy5s64doIXK/98v072D4qGWHawYHxO2FC4yHKF810i2TaEkhDClQCCkdZiZ2
 HiDShVx55PCWkq4NLKKCtFk9u1hkKFLQFO773uZvUeFWgrRF31aSTS/8rCEhICh76rhX
 Oul8URxXLp66hH5n4Giv5LPaKzxgZfCeHmJWtLlR0QiEE7F2ZbPbozYyihMmRPl2MyTP
 FtStSTKTQfU+R/NqIFW8y1W+BI4tuNGec67UFRhNTC7BcvcVTG9H+FzApyTNsWMqZS2B
 /9u4M9OuMfUlwyD4puiVJT5iuS4qsZD0DfnT7gkaOP+gVJf8B0McJUGQRHSAEjCQx74G
 vEHQ==
X-Gm-Message-State: AOAM5316jac9dcjBMbO6uSwb6aoch5VDr7WMA2fNtTQZDUsCtbqWeJMx
 UsVBFh9Vs/xtDhHoo6QceBDXJA==
X-Google-Smtp-Source: ABdhPJzsyr80M22TsA9o73abnx9q/28mo6g8jAZPiIIkKycC86esPT4I01tjiaBvuW/qUrs/Pt+xmg==
X-Received: by 2002:adf:9524:: with SMTP id 33mr61596613wrs.156.1594289285409; 
 Thu, 09 Jul 2020 03:08:05 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id p14sm5216290wrj.14.2020.07.09.03.08.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jul 2020 03:08:04 -0700 (PDT)
Subject: Re: [PATCH v3 6/8] dt-bindings: sound: lpass-cpu: Add sc7180 lpass
 cpu node
To: Rohit Kumar <rohitkr@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-7-git-send-email-rohitkr@codeaurora.org>
 <6b6b0e38-9c04-e065-8a43-ccfec260d60c@linaro.org>
 <430e0d24-c5c2-84ec-fe7b-b6b27192666d@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <de07f84b-40bc-d9ae-932d-623a5e8341e2@linaro.org>
Date: Thu, 9 Jul 2020 11:08:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <430e0d24-c5c2-84ec-fe7b-b6b27192666d@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 09/07/2020 11:01, Rohit Kumar wrote:
> 
> On 7/9/2020 2:57 PM, Srinivas Kandagatla wrote:
>>
>>
>> On 08/07/2020 06:08, Rohit kumar wrote:
>>> Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.
>>>
>>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>>> ---
>>>   Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt 
>>> b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>> index 32c2cdb..04e34cc 100644
>>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>> @@ -4,7 +4,8 @@ This node models the Qualcomm Technologies Low-Power 
>>> Audio SubSystem (LPASS).
>>>     Required properties:
>>>   -- compatible        : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu"
>>> +- compatible        : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
>>> +              "qcom,lpass-cpu-sc7180"
>>>   - clocks        : Must contain an entry for each entry in clock-names.
>>>   - clock-names        : A list which must include the following 
>>> entries:
>>>                   * "ahbix-clk"
>>
>> Can you also list the clocks that are mandatory for this SoC.
>>
>> --srini
>>
> Will it be fine if I update it in patch 8 only where we have moved to 
> yaml format?
> 
May be reverse the order, Convert to Yaml first and then add sc7180!

--srini
> Thanks,
> 
> Rohit
> 
>>
>>>

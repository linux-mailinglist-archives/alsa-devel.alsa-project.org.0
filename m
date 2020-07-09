Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFA9219D5D
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 12:15:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5EA742;
	Thu,  9 Jul 2020 12:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5EA742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594289757;
	bh=iAQRt+wZ5BNcF77L0PrJS7J7W2y72H1LdqWB5UGKBcg=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pr3TEWsZNj/kv+jlaYHOb5U7qLeNQcUIwWBTx7uWDZf09e8vCQx9LtEDgvnDDpUum
	 OV3VOAkgB4Yw0hKtz8s/DKeI7E8lZ3wMBoipBeLJ9X1VbC5E75nvScUDN/ZTq/oYkV
	 s9JSlJDo/5wPv+yfS13b9XEjvyUzIRkkOMvOeE8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 910AAF80264;
	Thu,  9 Jul 2020 12:14:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CFBBF8025A; Thu,  9 Jul 2020 12:14:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FD82F80216
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 12:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FD82F80216
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UJZ3Pq2l"
Received: by mail-wm1-x342.google.com with SMTP id a6so5922202wmm.0
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 03:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=EdJcMELcthlDuY9xHxoVencJsrBLCFGF9m0johet/ww=;
 b=UJZ3Pq2lQvZrHoPFy83st7M+51QEIC/LQ8bp4CFNl2fiPjmceby6B6CHhX7QamJY2B
 SiYp/zULqND+soVhhncku29XgNcrRjS+mYHjV1F/fK2ijnFpTPN/AhCpqHRfKaWDVnQ0
 f591hcJu6xxqPGzIXIrZSP7WGg0Cr3j9sYhXCqOwyRJAoPfgXKUdTAeApXqQedAjEiLb
 tuUdsOA/KZ0qzgVw5aC96BMI6xhxiwIoWB23tHrYBPx8rJ1pBXytYApVTWEYJX+vIUSV
 Cv6LMrdoMX4TMj35h84hKB/jRN+H9zZzqWAnl/94YEshyidC4BxPXHDqbaNrdT6UICTC
 2jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EdJcMELcthlDuY9xHxoVencJsrBLCFGF9m0johet/ww=;
 b=qwKy5m+clUpyAEW2R6t/4dyNanEN/LiOrED0HSVFrjER3w0p39KcdlAE8HKqldUEPU
 Ms7w68WlBekd4ugQSjLNyAowhuCqVfCk0sco2u0Flbs08WsHbOXvJW5Iei9YhTHncW+U
 iizOVgQWxaJkVnreg+Tcm2qO085iRqMvOrHcwFMN1DbyUe/6q6UO0mQY6k8LT23SWGnP
 iQ/y9xHLrto+kv58mWVOLFL69DY0BIKtppRNOIbFkcxPv3T+1zo+E0vWmETc/1yX4mOG
 p8EM7M12EjTtTgJ1VFrdOHeLncuaYwGtpAQd7n5CJ5DnJsrrMR5wOEzQb2UkqwKcmWmf
 g8Ew==
X-Gm-Message-State: AOAM531lCPBrcP+sWGJt+a8I2NvcQKJvVPCcUW044C/+hRLYZvVqXoYh
 812cfna/Kw/igIrGerySaQoYxQ==
X-Google-Smtp-Source: ABdhPJw3r/2yonhG+vBITS/6ocpyqi7TtjJdFCT1TGe0KMLudE/GdnjQXeNN8r3mG71V18tFHSeGWA==
X-Received: by 2002:a1c:1d93:: with SMTP id d141mr12930034wmd.14.1594289662140; 
 Thu, 09 Jul 2020 03:14:22 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id h84sm4367967wme.22.2020.07.09.03.14.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jul 2020 03:14:21 -0700 (PDT)
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
 <de07f84b-40bc-d9ae-932d-623a5e8341e2@linaro.org>
 <40ca93fe-5bf0-ace3-4f95-90624d29a409@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <78a55ead-d6c1-578c-0fb6-78dd0ef117b6@linaro.org>
Date: Thu, 9 Jul 2020 11:14:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <40ca93fe-5bf0-ace3-4f95-90624d29a409@codeaurora.org>
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



On 09/07/2020 11:12, Rohit Kumar wrote:
> 
> On 7/9/2020 3:38 PM, Srinivas Kandagatla wrote:
>>
>>
>> On 09/07/2020 11:01, Rohit Kumar wrote:
>>>
>>> On 7/9/2020 2:57 PM, Srinivas Kandagatla wrote:
>>>>
>>>>
>>>> On 08/07/2020 06:08, Rohit kumar wrote:
>>>>> Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.
>>>>>
>>>>> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
>>>>> ---
>>>>>   Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt | 3 ++-
>>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git 
>>>>> a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt 
>>>>> b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>>>> index 32c2cdb..04e34cc 100644
>>>>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>>>>> @@ -4,7 +4,8 @@ This node models the Qualcomm Technologies 
>>>>> Low-Power Audio SubSystem (LPASS).
>>>>>     Required properties:
>>>>>   -- compatible        : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu"
>>>>> +- compatible        : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
>>>>> +              "qcom,lpass-cpu-sc7180"
>>>>>   - clocks        : Must contain an entry for each entry in 
>>>>> clock-names.
>>>>>   - clock-names        : A list which must include the following 
>>>>> entries:
>>>>>                   * "ahbix-clk"
>>>>
>>>> Can you also list the clocks that are mandatory for this SoC.
>>>>
>>>> --srini
>>>>
>>> Will it be fine if I update it in patch 8 only where we have moved to 
>>> yaml format?
>>>
>> May be reverse the order, Convert to Yaml first and then add sc7180!
> 
> Actually Mark suggested to keep yaml change at the end of patch series 
> as there
> 
> are pending yaml patch reviews and it might take time. If we keep yaml 
> change before sc7180
> 
> change, then it will get blocked until yaml review. For now, I can 
> update in exisiting
> 
> documentation. Please suggest.
Then these clocks need to be documented in this patch itself!

--srini
> 
> Thanks
> 
>>
>> --srini
>>> Thanks,
>>>
>>> Rohit
>>>
>>>>
>>>>>

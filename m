Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B49F627D69
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 13:10:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8ECD15DC;
	Mon, 14 Nov 2022 13:10:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8ECD15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668427854;
	bh=KFg8huWjzIM0YJ198bVcAH/+Qvz2Ea2vxxAUaoXJalA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oefqebUkpF70NU5VE3D5shynuBnlJVg25p/B1nLpFwtz8Z1zjj4v2KWjQQfR6+1Jt
	 3S2V7osiwkKFNvPreMwGaqzZKehzN16DPjxwfqyDmz9cet99JQoiaUa6fzd5FfRege
	 3ATy3zMsTe4x6wMtcUGqy4J9SMkxvyE4FCR02A9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66CA1F8047D;
	Mon, 14 Nov 2022 13:09:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 773D7F800AA; Mon, 14 Nov 2022 13:09:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B986F800AA
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 13:09:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B986F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ucvmXj6N"
Received: by mail-lf1-x136.google.com with SMTP id p8so18899530lfu.11
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 04:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FNxCofBcbIeVXQpJg4d6J4pQ3z4dOkx5gsNXPSK+q14=;
 b=ucvmXj6N6tou5HBUfuCOxKebeYi8+OMPzqC9PPPdYkO0Ok5z9h2wvWqDkMHcTX+poz
 3cZNMArXG+vL67Ao8IV6Xd/ZtaL6m2Ip0bWv41vfItDRmZw/AwHIqcUaHPdEAzXhoTTm
 BzHlS7Pq4cM2jcPGW5SpRQWvWUy8FIfyEJZTUy7BNBK7rJX9L3Vse2KttoQCM4Yc2NCb
 X3BzOGRe2qWQpzUj0mTOFliat4qlybTkrk8/Qd7WPGMoWuB7OgTItwHKX4w4fC4DcJcV
 HVaiB1obEicfYCUegeVjwRyj+B8OF3nK87v+Ml0CU3P/htUTD/DPBbFCvE0v9Y+hH7Wl
 LIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FNxCofBcbIeVXQpJg4d6J4pQ3z4dOkx5gsNXPSK+q14=;
 b=UhnewL72Tt1oDefMBDFXavQ/G8ap0GIh5hDYfUVm6kipDjZOE1i4HSWX1wKd+0DmTz
 jrEdCr9f/vAOnI3JNm7/udPLv9BT9Jny04uc3Jg+voivlqOM+eov3WDEOkLACNXqNXkm
 Tu/M+SdFVZhvRhUO69L1HsdJrpDyfx5ensoh1I+s2Na57cil6hNodiZX6rSi5rEdN3yo
 LPh/+umryKSlZEkNsE+cprGoK7x+jHUydWwMRlrO+4CeGw+exc4jgdvQK/F71WI9Dh10
 BAQIPQE6ckQtEy6LoWaomi9LSyM5ASqVmsyJirxWRa+5xMcPloQvhFe5QIdRHwEMhwKl
 C25Q==
X-Gm-Message-State: ANoB5pk1bQLf8lH0EVUVMxL0/E7N6CaCfqdtl1XVw+VlRmsBwdr/3u2g
 MYAObMaLI6aSNSHQA9doUyyi/A==
X-Google-Smtp-Source: AA0mqf5g+dqZa5LypIi6W9GnNoqEZM1/7LsEFGd3SxBYWf8DwN7+1IHCwTh9GQWqAFq/oIL8J4UTXw==
X-Received: by 2002:ac2:4945:0:b0:4a2:5897:2b44 with SMTP id
 o5-20020ac24945000000b004a258972b44mr4446724lfi.431.1668427791293; 
 Mon, 14 Nov 2022 04:09:51 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 bi36-20020a05651c232400b002771057e0e5sm1999559ljb.76.2022.11.14.04.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 04:09:50 -0800 (PST)
Message-ID: <8179b5f5-5292-692b-15c4-5d83dee85789@linaro.org>
Date: Mon, 14 Nov 2022 13:09:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 00/10] ASoC: dt-bindings: Rework Qualcomm APR/GPR Sound
 nodes for SM8450
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
 <06da072c-8cf0-8181-3c32-4592fe41f9c2@linaro.org>
 <0ee5db9e-d80c-947d-73d6-6214e9299b23@linaro.org>
 <48883bd6-217d-f513-316c-2b5caf486e5e@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <48883bd6-217d-f513-316c-2b5caf486e5e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Patrick Lai <plai@qti.qualcomm.com>,
 Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
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

On 14/11/2022 12:50, Srinivas Kandagatla wrote:
> 
> 
> On 14/11/2022 07:48, Krzysztof Kozlowski wrote:
>> On 11/11/2022 17:15, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 11/11/2022 11:35, Krzysztof Kozlowski wrote:
>>>> Adding sound support for Qualcomm SM8450 SoC (and later for SC8280XP) brought
>>>> some changes to APR/GPR services bindings.  These bindings are part of
>>>> qcom,apr.yaml:
>>>>
>>>>     apr-or-gpr-device-node <- qcom,apr.yaml
>>>>       apr-gpr-service@[0-9] <- qcom,apr.yaml
>>>>         service-specific-components <- /schemas/sound/qcom,q6*.yaml
>>>>
>>>> The schema for services (apr-gpr-service@[0-9]) already grows considerably and
>>>> is still quite not specific.  It allows several incorrect combinations, like
>>>> adding a clock-controller to a APM device.  Restricting it would complicate the
>>>> schema even more.  Bringing new support for sound on Qualcomm SM8450 and
>>>> SC8280XP SoC would grow it as well.
>>>
>>> Why would this grow? All the dsp services are static and they will not
>>> change per SoC unless there is a total firmware change in DSP.
>>
>> They grow now with SM8450 which requires changes there. Otherwise DTS
>> does not pass with current bindings. The bindings before my fixing in
>> 2022 were really incomplete. Now they are complete, but:
>> 1. Not for SM8450 - this will bring new things,
>> 2. Very unspecific as they allow multiple invalid configurations.
>>
> Okay, I looked at all the patches, they are fine as it is, the confusion 
> part is the subject and comments which are misleading and trying to say 
> that these are specific to SM8450 or SC8280XP. Infact this is not true, 
> none of these changes are specific to any SoC, they are part of AudioReach.

They are part of bringing audio on SM8450, at the end we all are SoC
centric... we do not bring support for AudioReach just for itself,
right? We bring it because we want to have something working on SM8450
and further...

Best regards,
Krzysztof


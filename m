Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2314B41306F
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 10:49:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0161166E;
	Tue, 21 Sep 2021 10:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0161166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632214198;
	bh=pNSR2iky7zYWJt4W/OZPwkEyo8RZLjMXBjkroFMlhlw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uD/N5dJdfclwizxwDZ8vD2DTMQ23tQKqAOBihDrLJAnDWa1AAjuhuRzEhUJCOw1tj
	 5DVvTYVizvPccs+z9pD/o0MgcdRxdKHbGRTXRN7fUji6CBUMdcq6mqsrXrRVCKN9QN
	 xpgZhVcRAV74GDUEWjZpgQsMkrUhf5F7i0GcXnL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52258F80124;
	Tue, 21 Sep 2021 10:48:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8566FF804A9; Tue, 21 Sep 2021 10:48:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B449F80268
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 10:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B449F80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JidHcdbT"
Received: by mail-ed1-x529.google.com with SMTP id v22so66815436edd.11
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 01:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pUh98EEgZG2+uO+vlZkUsJ82k9SQPEJS3egqtCoQfL4=;
 b=JidHcdbTA56g9QDi5/rHubK3yUC4vaq0Q1uH2W1sMozCl7XKea40FpA5+GO7W1pE27
 uo/UXYDxhtRzZrcBFQN6HIjpA9kdWR6CeUE+KBvO5ut2PCb1R8bbqlY89qitsK1OLzeG
 w2bFos4aXABG4zXHt6QDag0bPaCuZyUoRczIViiHIt/oqVWE9HM8q2YmdoRg7z2FyPLQ
 qpjdvgNnQnLlc19nqORxpUDlRBDuE2S8L9DmrZbn5FkZOdaaSNPx/TMMmIG+Baph5OsF
 h6k5gftIt1TCjCu66WfbKVtnd+BLzsBTunxdU5zsRKa/FSj1+nzkBqiA/oIKe0YZFAVs
 n+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pUh98EEgZG2+uO+vlZkUsJ82k9SQPEJS3egqtCoQfL4=;
 b=FURFnDJCEW65njgbzXb7+M4a2P4Bjtlf70zxfK7+HOAMg1NdkS4gWL8XaW194/Sn+9
 AbbxzqPAi5qLhifsVUdVNKe7L4T+TsrKVuTW0v252FZXPHvgQxrHMwDYpYoANDmvc5aB
 PiSfE223tYIAbj36bAfv4SJYdAl9Gj6bVNOQA3KpHDA2G10hJFD30PDctXtG4KO07Ukb
 Vv/XBpxHblcFRXnmZFPIwqjF5w6e2PJGFuLAsu28URYuXAi+7AK6BEBxDTxeqdFqPjmG
 bhHa0myphFfaqRCovZ3ScwJPI0Pb9lJNci+vMwCQ8eOPmQ5WDumeFzMjGq3V4M+B41BY
 s7xA==
X-Gm-Message-State: AOAM532VvMu6yMioD491v9a95KCT7CVzPvWGrjMeGXUiij2xCVjH1PIi
 1oAzuR+dkfLnEt2QUzCvntuZQQ==
X-Google-Smtp-Source: ABdhPJxrQxE9ACVMOX6Sh5MbXYcHLRld4KwTJA0+3Vfku8/s36x38h1VCVUeBEctj8vgBsGMB9oXdA==
X-Received: by 2002:a17:906:1945:: with SMTP id
 b5mr32587263eje.347.1632214115300; 
 Tue, 21 Sep 2021 01:48:35 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id o23sm8153195eds.75.2021.09.21.01.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 01:48:34 -0700 (PDT)
Subject: Re: [PATCH 3/7] ASoC: codecs: tx-macro: Change mic control registers
 to volatile
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
 <1632123331-2425-4-git-send-email-srivasam@codeaurora.org>
 <c1c7b1e8-98f5-99a3-1374-11d1d61535b4@linaro.org>
 <b442ee2b-622c-674d-3abe-b1fbbfa5aeb9@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e87ef6e1-0c10-beaa-81ad-2c0ceae6bbcc@linaro.org>
Date: Tue, 21 Sep 2021 09:48:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b442ee2b-622c-674d-3abe-b1fbbfa5aeb9@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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



On 21/09/2021 08:30, Srinivasa Rao Mandadapu wrote:
> 
> On 9/20/2021 6:54 PM, Srinivas Kandagatla wrote:
> Thanks for your time Srini!!
>>
>> On 20/09/2021 08:35, Srinivasa Rao Mandadapu wrote:
>>> Update amic and dmic related tx macro control registers to volatile
>>>
>>> Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for 
>>> lpass tx macro)
>>>
>>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>>> ---
>>>   sound/soc/codecs/lpass-tx-macro.c | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/sound/soc/codecs/lpass-tx-macro.c 
>>> b/sound/soc/codecs/lpass-tx-macro.c
>>> index 9273724..e65b592 100644
>>> --- a/sound/soc/codecs/lpass-tx-macro.c
>>> +++ b/sound/soc/codecs/lpass-tx-macro.c
>>> @@ -423,6 +423,13 @@ static bool tx_is_volatile_register(struct 
>>> device *dev, unsigned int reg)
>>>       case CDC_TX_TOP_CSR_SWR_DMIC1_CTL:
>>>       case CDC_TX_TOP_CSR_SWR_DMIC2_CTL:
>>>       case CDC_TX_TOP_CSR_SWR_DMIC3_CTL:
>>> +    case CDC_TX_TOP_CSR_SWR_AMIC0_CTL:
>>> +    case CDC_TX_TOP_CSR_SWR_AMIC1_CTL:
>>> +    case CDC_TX_CLK_RST_CTRL_MCLK_CONTROL:
>>> +    case CDC_TX_CLK_RST_CTRL_FS_CNT_CONTROL:
>>> +    case CDC_TX_CLK_RST_CTRL_SWR_CONTROL:
>>> +    case CDC_TX_TOP_CSR_SWR_CTRL:
>>> +    case CDC_TX0_TX_PATH_SEC7:
>>
>> Why are these marked as Volatile?
>> Can you provide some details on the issue that you are seeing?
>>
>> --srini
> 
> Without volatile these registers are not reflecting in Hardware and 
> playback and capture is not working.
> 
> Will do recheck and keep only required registers as volatile.

This sounds like a total hack to me,

this might be happening in your case:

The default values for this register are different to actual defaults.
Ex: CDC_TX_TOP_CSR_SWR_AMIC0_CTL default is 0x00
so writing 0x0 to this register will be no-op as there is no change in 
the register value as compared to default value as per regmap.

In you case make sure the hardware default values are correctly 
reflected in tx_defaults array.

Then setting the desired value should work.


--srini



> 
>>
>>
>>>           return true;
>>>       }
>>>       return false;
>>> @@ -1674,6 +1681,12 @@ static int tx_macro_component_probe(struct 
>>> snd_soc_component *comp)
>>>         snd_soc_component_update_bits(comp, CDC_TX0_TX_PATH_SEC7, 0x3F,
>>>                         0x0A);
>>> +    snd_soc_component_update_bits(comp, 
>>> CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0xFF, 0x00);
>>> +    snd_soc_component_update_bits(comp, 
>>> CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0xFF, 0x00);
>>> +    snd_soc_component_update_bits(comp, 
>>> CDC_TX_TOP_CSR_SWR_DMIC0_CTL, 0xFF, 0x00);
>>> +    snd_soc_component_update_bits(comp, 
>>> CDC_TX_TOP_CSR_SWR_DMIC1_CTL, 0xFF, 0x00);
>>> +    snd_soc_component_update_bits(comp, 
>>> CDC_TX_TOP_CSR_SWR_DMIC2_CTL, 0xFF, 0x00);
>>> +    snd_soc_component_update_bits(comp, 
>>> CDC_TX_TOP_CSR_SWR_DMIC3_CTL, 0xFF, 0x00);
>>>         return 0;
>>>   }
>>>

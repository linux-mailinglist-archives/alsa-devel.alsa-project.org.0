Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DA84133B6
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 15:04:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D47C11607;
	Tue, 21 Sep 2021 15:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D47C11607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632229489;
	bh=DG2bRjE/tSBtFVQ355xQnJO/s+yGvp80bZ4Um2iJYqU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ti9jZzl8iUqBC478tT4e5ydvUA6YFZmQ3OD/PV1+pvGIgZaGaOoh1Kl9ISP/k9uit
	 s+pDlb3Yd/26aa04g3ipp4Fbna8z8CC+JOO3XSdtl2J0WYJSs38iaK/AFZojLy7oVE
	 vmOc6OgZ4ZNe6s1/yCl4Ay28TLVgblzoi8Wyn2ms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 251D2F8016E;
	Tue, 21 Sep 2021 15:03:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 774C4F80268; Tue, 21 Sep 2021 15:03:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF651F8016E
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 15:03:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF651F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="hR5mnfx9"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632229404; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=qH2l5wCnZnelf0eU2pGiDEZnMruL9bfu6QZc4HulXxE=;
 b=hR5mnfx9dB9LyfZ9z5mxKCKMqypRfC5OfCRzH6Syud0ez7SfyC/R8NI0EG4BB6E8q7b17EF6
 pbvG9lavT57cHSEgUbHMd16nIH/THmB9VtTbNGC+ynr/2Vio3cLVmvMFBOJi80Jw7M8D/hB3
 GeWXUWqcI1F23J4RbRhv0QaWIk0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6149d7dbb585cc7d24a19bbf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 13:02:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8D59BC43460; Tue, 21 Sep 2021 13:02:19 +0000 (UTC)
Received: from [192.168.1.105] (unknown [157.48.153.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D3A5CC4338F;
 Tue, 21 Sep 2021 13:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D3A5CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 3/7] ASoC: codecs: tx-macro: Change mic control registers
 to volatile
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
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
 <e87ef6e1-0c10-beaa-81ad-2c0ceae6bbcc@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <62c85130-df75-5aa6-8954-d1a55167827f@codeaurora.org>
Date: Tue, 21 Sep 2021 18:32:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e87ef6e1-0c10-beaa-81ad-2c0ceae6bbcc@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 9/21/2021 2:18 PM, Srinivas Kandagatla wrote:
>
>
> On 21/09/2021 08:30, Srinivasa Rao Mandadapu wrote:
>>
>> On 9/20/2021 6:54 PM, Srinivas Kandagatla wrote:
>> Thanks for your time Srini!!
>>>
>>> On 20/09/2021 08:35, Srinivasa Rao Mandadapu wrote:
>>>> Update amic and dmic related tx macro control registers to volatile
>>>>
>>>> Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for 
>>>> lpass tx macro)
>>>>
>>>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>>>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>>>> ---
>>>>   sound/soc/codecs/lpass-tx-macro.c | 13 +++++++++++++
>>>>   1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/sound/soc/codecs/lpass-tx-macro.c 
>>>> b/sound/soc/codecs/lpass-tx-macro.c
>>>> index 9273724..e65b592 100644
>>>> --- a/sound/soc/codecs/lpass-tx-macro.c
>>>> +++ b/sound/soc/codecs/lpass-tx-macro.c
>>>> @@ -423,6 +423,13 @@ static bool tx_is_volatile_register(struct 
>>>> device *dev, unsigned int reg)
>>>>       case CDC_TX_TOP_CSR_SWR_DMIC1_CTL:
>>>>       case CDC_TX_TOP_CSR_SWR_DMIC2_CTL:
>>>>       case CDC_TX_TOP_CSR_SWR_DMIC3_CTL:
>>>> +    case CDC_TX_TOP_CSR_SWR_AMIC0_CTL:
>>>> +    case CDC_TX_TOP_CSR_SWR_AMIC1_CTL:
>>>> +    case CDC_TX_CLK_RST_CTRL_MCLK_CONTROL:
>>>> +    case CDC_TX_CLK_RST_CTRL_FS_CNT_CONTROL:
>>>> +    case CDC_TX_CLK_RST_CTRL_SWR_CONTROL:
>>>> +    case CDC_TX_TOP_CSR_SWR_CTRL:
>>>> +    case CDC_TX0_TX_PATH_SEC7:
>>>
>>> Why are these marked as Volatile?
>>> Can you provide some details on the issue that you are seeing?
>>>
>>> --srini
>>
>> Without volatile these registers are not reflecting in Hardware and 
>> playback and capture is not working.
>>
>> Will do recheck and keep only required registers as volatile.
>
> This sounds like a total hack to me,
>
> this might be happening in your case:
>
> The default values for this register are different to actual defaults.
> Ex: CDC_TX_TOP_CSR_SWR_AMIC0_CTL default is 0x00
> so writing 0x0 to this register will be no-op as there is no change in 
> the register value as compared to default value as per regmap.
>
> In you case make sure the hardware default values are correctly 
> reflected in tx_defaults array.

The default values in tx_defaults are proper. But same value is not 
reflecting in Hardware, but In Cache it's reflecting set value.

>
> Then setting the desired value should work.
>
>
> --srini
>
>
>
>>
>>>
>>>
>>>>           return true;
>>>>       }
>>>>       return false;
>>>> @@ -1674,6 +1681,12 @@ static int tx_macro_component_probe(struct 
>>>> snd_soc_component *comp)
>>>>         snd_soc_component_update_bits(comp, CDC_TX0_TX_PATH_SEC7, 
>>>> 0x3F,
>>>>                         0x0A);
>>>> +    snd_soc_component_update_bits(comp, 
>>>> CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0xFF, 0x00);
>>>> +    snd_soc_component_update_bits(comp, 
>>>> CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0xFF, 0x00);
>>>> +    snd_soc_component_update_bits(comp, 
>>>> CDC_TX_TOP_CSR_SWR_DMIC0_CTL, 0xFF, 0x00);
>>>> +    snd_soc_component_update_bits(comp, 
>>>> CDC_TX_TOP_CSR_SWR_DMIC1_CTL, 0xFF, 0x00);
>>>> +    snd_soc_component_update_bits(comp, 
>>>> CDC_TX_TOP_CSR_SWR_DMIC2_CTL, 0xFF, 0x00);
>>>> +    snd_soc_component_update_bits(comp, 
>>>> CDC_TX_TOP_CSR_SWR_DMIC3_CTL, 0xFF, 0x00);
>>>>         return 0;
>>>>   }
>>>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


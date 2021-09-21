Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB98412F81
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 09:32:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 306711669;
	Tue, 21 Sep 2021 09:31:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 306711669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632209535;
	bh=E73U9kNdUXnAG2plw5tgWKCZR/OrSnJt4yDcg+J1Dm0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PMMaYEbU8m9Va5fVN40gEzil8tRWHnvilUXzWbYMmKnEs5OerudbU8RbCNvPmOTAm
	 uAZbN2agPH9YbbugG4mRxfym8tGxLoe2x4cMmxZYEGJzjZ21YDESAw9XlfeOx0/WS+
	 VFpJTRvKD/O620NgCJS1PoQrgb1dchn0u+t+pTtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D5DFF8026A;
	Tue, 21 Sep 2021 09:30:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 898F4F80268; Tue, 21 Sep 2021 09:30:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1809F8016E
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 09:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1809F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="NJ0zdOnp"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632209453; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=aqjmP31SDqTSrOPTYMKFyi6cjdtEi8k8K9EsQv1g7o0=;
 b=NJ0zdOnpEs1ALA4pmC6uKMZwwbPWjZ0qFxz5w4mAQ8tVY3Erh1Cv1/N/Fbc5hZGUMsUTnbyp
 25s9D9n9NCe8wY/TNudQs7nLJRPfDWP02chwHiXmtjk0Dfo9UgYJPOlA0B6UL0TBT+t/5ZtV
 siC+gl/dsHV0l5xHwRTwVB52R9Y=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 61498a088b04ef8589161177 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 07:30:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F225AC4360D; Tue, 21 Sep 2021 07:30:15 +0000 (UTC)
Received: from [192.168.204.90] (unknown [157.48.173.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E164CC43460;
 Tue, 21 Sep 2021 07:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E164CC43460
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
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <b442ee2b-622c-674d-3abe-b1fbbfa5aeb9@codeaurora.org>
Date: Tue, 21 Sep 2021 13:00:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c1c7b1e8-98f5-99a3-1374-11d1d61535b4@linaro.org>
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


On 9/20/2021 6:54 PM, Srinivas Kandagatla wrote:
Thanks for your time Srini!!
>
> On 20/09/2021 08:35, Srinivasa Rao Mandadapu wrote:
>> Update amic and dmic related tx macro control registers to volatile
>>
>> Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for 
>> lpass tx macro)
>>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   sound/soc/codecs/lpass-tx-macro.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/sound/soc/codecs/lpass-tx-macro.c 
>> b/sound/soc/codecs/lpass-tx-macro.c
>> index 9273724..e65b592 100644
>> --- a/sound/soc/codecs/lpass-tx-macro.c
>> +++ b/sound/soc/codecs/lpass-tx-macro.c
>> @@ -423,6 +423,13 @@ static bool tx_is_volatile_register(struct 
>> device *dev, unsigned int reg)
>>       case CDC_TX_TOP_CSR_SWR_DMIC1_CTL:
>>       case CDC_TX_TOP_CSR_SWR_DMIC2_CTL:
>>       case CDC_TX_TOP_CSR_SWR_DMIC3_CTL:
>> +    case CDC_TX_TOP_CSR_SWR_AMIC0_CTL:
>> +    case CDC_TX_TOP_CSR_SWR_AMIC1_CTL:
>> +    case CDC_TX_CLK_RST_CTRL_MCLK_CONTROL:
>> +    case CDC_TX_CLK_RST_CTRL_FS_CNT_CONTROL:
>> +    case CDC_TX_CLK_RST_CTRL_SWR_CONTROL:
>> +    case CDC_TX_TOP_CSR_SWR_CTRL:
>> +    case CDC_TX0_TX_PATH_SEC7:
>
> Why are these marked as Volatile?
> Can you provide some details on the issue that you are seeing?
>
> --srini

Without volatile these registers are not reflecting in Hardware and 
playback and capture is not working.

Will do recheck and keep only required registers as volatile.

>
>
>>           return true;
>>       }
>>       return false;
>> @@ -1674,6 +1681,12 @@ static int tx_macro_component_probe(struct 
>> snd_soc_component *comp)
>>         snd_soc_component_update_bits(comp, CDC_TX0_TX_PATH_SEC7, 0x3F,
>>                         0x0A);
>> +    snd_soc_component_update_bits(comp, 
>> CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0xFF, 0x00);
>> +    snd_soc_component_update_bits(comp, 
>> CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0xFF, 0x00);
>> +    snd_soc_component_update_bits(comp, 
>> CDC_TX_TOP_CSR_SWR_DMIC0_CTL, 0xFF, 0x00);
>> +    snd_soc_component_update_bits(comp, 
>> CDC_TX_TOP_CSR_SWR_DMIC1_CTL, 0xFF, 0x00);
>> +    snd_soc_component_update_bits(comp, 
>> CDC_TX_TOP_CSR_SWR_DMIC2_CTL, 0xFF, 0x00);
>> +    snd_soc_component_update_bits(comp, 
>> CDC_TX_TOP_CSR_SWR_DMIC3_CTL, 0xFF, 0x00);
>>         return 0;
>>   }
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


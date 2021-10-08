Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D28B5426400
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 07:15:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 551F8166A;
	Fri,  8 Oct 2021 07:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 551F8166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633670110;
	bh=c8VXQosLw5iHVwtPG4c2PdO1V+8nQrxFDgGnduhZYeE=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XjLqP/LhldFcjquHviTa4kTi77RGNXvNxyQEMir0qC9GXXXc00xYQ6S8Rdn5KT13X
	 DyIds/XZnIe51L6f5LMCRgLHa3jrQjlJM3Z40BBvkyOrT4570cgQpcKPB9Q1WPSxO1
	 U6kmTf42+s9GlrBlGgV0p7foUFcU3y0gTt21pdFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D14A7F800F0;
	Fri,  8 Oct 2021 07:13:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC326F80246; Fri,  8 Oct 2021 07:13:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3300EF800F0
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 07:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3300EF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="p8HOWEbT"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633670024; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=M3oSCWJ7aQEJa+w9EA0EHaehA9KHiO9jYl3HRs7dc/I=;
 b=p8HOWEbTFwDP0hxkl6cUbRuL+X7qfbNbH+tzAqCJb5IY7YaHQAo/QvpUaKueZ+nxUhDf6qr2
 MkD+pep//IDValWEtLSiOtW++lAM1JvNu8D2HYNSGdKvUu/TEzAsMPKZXHBMojfDoHeou7KR
 81oXQrwIWwNBSANSK6Y7WGq15P0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 615fd370a45ca75307ca743a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Oct 2021 05:13:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 54FD0C4360D; Fri,  8 Oct 2021 05:13:19 +0000 (UTC)
Received: from [192.168.1.100] (unknown [157.48.163.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 871DCC4338F;
 Fri,  8 Oct 2021 05:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 871DCC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: lpass: add binding headers for
 digital codecs
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1631109831-1360-1-git-send-email-srivasam@codeaurora.org>
 <04210158-e999-a3a3-ee53-ac9024ab9120@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <155b8dbf-8b2a-0484-ac38-1ec6e0a68537@codeaurora.org>
Date: Fri, 8 Oct 2021 10:43:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <04210158-e999-a3a3-ee53-ac9024ab9120@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Thanks for notification Srini!!!

On 10/7/2021 4:14 PM, Srinivas Kandagatla wrote:
> Hi Srinivasa,
>
>
> On 08/09/2021 15:03, Srinivasa Rao Mandadapu wrote:
>> Add header defining for lpass internal digital codecs rx,tx and va
>> dai node id's.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>> Changes since v1:
>>      -- Add missing dai node ID's
>>
>>   include/dt-bindings/sound/qcom,lpass.h | 31 
>> +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>
>
> Mark has already applied v1, 
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/include/dt-bindings/sound/qcom,lpass.h?id=bfad37c53ae6168d03ab06868ea44e77995c43d5
>
> Can you please rebase on top of sound-next so that we endup with 
> correct defines.
Sure. will post v3 patch after rebase.
>
> --srini
>
>> diff --git a/include/dt-bindings/sound/qcom,lpass.h 
>> b/include/dt-bindings/sound/qcom,lpass.h
>> index 7b0b80b..a9404c3 100644
>> --- a/include/dt-bindings/sound/qcom,lpass.h
>> +++ b/include/dt-bindings/sound/qcom,lpass.h
>> @@ -10,6 +10,37 @@
>>     #define LPASS_DP_RX    5
>>   +#define LPASS_CDC_DMA_RX0 6
>> +#define LPASS_CDC_DMA_RX1 7
>> +#define LPASS_CDC_DMA_RX2 8
>> +#define LPASS_CDC_DMA_RX3 9
>> +#define LPASS_CDC_DMA_RX4 10
>> +#define LPASS_CDC_DMA_RX5 11
>> +#define LPASS_CDC_DMA_RX6 12
>> +#define LPASS_CDC_DMA_RX7 13
>> +#define LPASS_CDC_DMA_RX8 14
>> +#define LPASS_CDC_DMA_RX9 15
>> +
>> +#define LPASS_CDC_DMA_TX0 16
>> +#define LPASS_CDC_DMA_TX1 17
>> +#define LPASS_CDC_DMA_TX2 18
>> +#define LPASS_CDC_DMA_TX3 19
>> +#define LPASS_CDC_DMA_TX4 20
>> +#define LPASS_CDC_DMA_TX5 21
>> +#define LPASS_CDC_DMA_TX6 22
>> +#define LPASS_CDC_DMA_TX7 23
>> +#define LPASS_CDC_DMA_TX8 24
>> +
>> +#define LPASS_CDC_DMA_VA_TX0 25
>> +#define LPASS_CDC_DMA_VA_TX1 26
>> +#define LPASS_CDC_DMA_VA_TX2 27
>> +#define LPASS_CDC_DMA_VA_TX3 28
>> +#define LPASS_CDC_DMA_VA_TX4 29
>> +#define LPASS_CDC_DMA_VA_TX5 30
>> +#define LPASS_CDC_DMA_VA_TX6 31
>> +#define LPASS_CDC_DMA_VA_TX7 32
>> +#define LPASS_CDC_DMA_VA_TX8 33
>> +
>>   #define LPASS_MCLK0    0
>>     #endif /* __DT_QCOM_LPASS_H */
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


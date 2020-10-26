Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBB42991D9
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 17:06:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCAFB16BB;
	Mon, 26 Oct 2020 17:05:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCAFB16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603728399;
	bh=eH1e9kcC+KTM9ZZv9RPmO1L6FyoocU1OZoyS6zLxFKs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RTv8qZ0T3UlxSTQqZhs6VshdwV/7UXzAPhghA1JjL1YVevYcuQwsNO+bgjqhAeWtE
	 slOocfvUvaufOb+aDgAZw4gpmWsnvb5yBcgyaNKphO11IsePodoE+ThQcKGXSypxYs
	 5Fe50iCoikVxOi/8w88pRzboKAgP0ThM8bdx+hcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28298F80249;
	Mon, 26 Oct 2020 17:05:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1E4BF80212; Mon, 26 Oct 2020 17:05:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F164AF800CC
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 17:04:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F164AF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="tsJ1S11u"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603728301; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=gENqlM/pPw1+/3BMakG5icMgcmU6s9phV5kM80xNKFU=;
 b=tsJ1S11uUmwbm2KgyyKsByjqN9e2CYEY/+88Ihq22/BRZ4uJie4I/6uHfawQJdQYd4aJVlz6
 RO2g7286dJ22RHFGQ3adSqM/8XlDIcKu0PP30FJfLcnxknfQwZpzbzZZ+86Xi35dBi7oXSYh
 +orPnNnsPntkCZ2YB2arwWok3n8=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f96f398d20d12d202eff34f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 26 Oct 2020 16:04:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E7DD6C433A0; Mon, 26 Oct 2020 16:04:39 +0000 (UTC)
Received: from [192.168.29.24] (unknown [49.37.139.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E802BC433FF;
 Mon, 26 Oct 2020 16:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E802BC433FF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH] Asoc: qcom: lpass-sc7180: Fix MI2S bitwidth field bit
 positions
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1603373219-19374-1-git-send-email-srivasam@codeaurora.org>
 <335f1d55-8a85-8501-fd69-0397f44e21af@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <242284b2-ca3f-fbe0-af97-c0e8e5fe640d@codeaurora.org>
Date: Mon, 26 Oct 2020 21:34:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <335f1d55-8a85-8501-fd69-0397f44e21af@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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

Thanks for your time srinivas!!!

On 10/26/2020 8:31 PM, Srinivas Kandagatla wrote:
>
>
> On 22/10/2020 14:26, Srinivasa Rao Mandadapu wrote:
>> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>>
>> Update SC7180 lpass_variant structure with proper I2S bitwidth
>> field bit positions, as bitwidth denotes 0 to 1 bits,
>> but previously used only 0 bit.
>>
>> Fixes: commit cba62c8b49bead ("Merge series "ASoC: qcom: Add support 
>> for SC7180 lpass variant" from Rohit kumar <rohitkr@codeaurora.org>:")
> this should be 12 chars long, for this particular fix it should be!
>
> Fixes: 24caf8d9eb108 ("ASoC: qcom: lpass-sc7180: Add platform driver 
> for lpass audio")
>>
>
> No empty line after Fixes tag!
>
> Will coorect it in next patch.

>> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   sound/soc/qcom/lpass-sc7180.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/qcom/lpass-sc7180.c 
>> b/sound/soc/qcom/lpass-sc7180.c
>> index c6292f9e..bc998d5 100644
>> --- a/sound/soc/qcom/lpass-sc7180.c
>> +++ b/sound/soc/qcom/lpass-sc7180.c
>> @@ -188,7 +188,7 @@ static struct lpass_variant sc7180_data = {
>>       .micmode        = REG_FIELD_ID(0x1000, 4, 8, 3, 0x1000),
>>       .micmono        = REG_FIELD_ID(0x1000, 3, 3, 3, 0x1000),
>>       .wssrc            = REG_FIELD_ID(0x1000, 2, 2, 3, 0x1000),
>> -    .bitwidth        = REG_FIELD_ID(0x1000, 0, 0, 3, 0x1000),
>> +    .bitwidth        = REG_FIELD_ID(0x1000, 0, 1, 3, 0x1000),
>>         .rdma_dyncclk        = REG_FIELD_ID(0xC000, 21, 21, 5, 0x1000),
>>       .rdma_bursten        = REG_FIELD_ID(0xC000, 20, 20, 5, 0x1000),
>>
> --srini

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


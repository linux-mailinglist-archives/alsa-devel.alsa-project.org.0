Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A186D39C775
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Jun 2021 12:33:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08BF51707;
	Sat,  5 Jun 2021 12:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08BF51707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622889206;
	bh=4YOXcu3EUYb88MCsiuMHziuRXBz+ezQyI6B9VNfzNWw=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ftcQfMOfGyou9bXjYgq5J3x4RnrX5lpFTwYv8R29U3RGWXjlDp7/nhI2R1lf9qe5T
	 30+n1RkmaH49CmlNKMD/sSBEq9TT/+XJoNhvl4H74VfV8ALYmIhZUxLzimKvx2stCN
	 8YeNkbipG0vzWe7AWt9mOWfbYEKunEyoxeikGRBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6563FF8016D;
	Sat,  5 Jun 2021 12:31:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C270F80253; Sat,  5 Jun 2021 12:31:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 936FFF80103
 for <alsa-devel@alsa-project.org>; Sat,  5 Jun 2021 12:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 936FFF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="GFWBq7aC"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622889110; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=ibQev18T9V9fkVqRTgCod7cdmgA96I6rIWCsroTRfWI=;
 b=GFWBq7aCAWmcMh/lYsQhY9d9W2vpjRS/t/eo+We2iDz6bLB33d5W0EfGl5kki3GyPY0nHect
 mb5DQhqZ6/4+aE1z4TVm8uA1+f2eofJbsrZCiK5R0Y1Rj7OQNOr8SnU3dD3t7r8Q8C6y2436
 P2esZgssDl/f6adtRqSHKfDYob4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60bb527ce27c0cc77f08fbfc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 05 Jun 2021 10:31:24
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1E3C9C4338A; Sat,  5 Jun 2021 10:31:22 +0000 (UTC)
Received: from [192.168.212.90] (unknown [157.48.166.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AE40FC433F1;
 Sat,  5 Jun 2021 10:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AE40FC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
Subject: Re: [PATCH] ASoC: qcom: Fix for DMA interrupt clear reg overwriting
To: Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org,
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
 tiwai@suse.com
References: <20210603050530.15898-1-srivasam@codeaurora.org>
 <CAE-0n52CyZkRDForR7LumXL7Tcr=48UV7T-wxirMsxk7AJJsmg@mail.gmail.com>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <bea7d3f4-057a-7070-f493-3e625273212c@codeaurora.org>
Date: Sat, 5 Jun 2021 16:01:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAE-0n52CyZkRDForR7LumXL7Tcr=48UV7T-wxirMsxk7AJJsmg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Stephen,

Thanks for Your Time for review comments!!!

On 6/3/2021 11:47 AM, Stephen Boyd wrote:
> Quoting Srinivasa Rao Mandadapu (2021-06-02 22:05:30)
>> This patch fixes the DMA interrupt registers overwriting
>   $ git grep "This patch" -- Documentation/process
Okay will change description.
>
>> issue in lpass platform interrupt handler.
> Can you describe the issue more?
Sure. will elaborate more.
>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
> Any Fixes tag?
>
>>   sound/soc/qcom/lpass-platform.c | 17 +++++++++++------
>>   1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
>> index 0df9481ea4c6..e02caa121fa4 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
>> @@ -650,7 +650,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>          struct lpass_variant *v = drvdata->variant;
>>          irqreturn_t ret = IRQ_NONE;
>>          int rv;
>> -       unsigned int reg = 0, val = 0;
>> +       unsigned int reg = 0, val = 0, val_clr = 0, val_mask = 0;
> Why assign to 0 and then overwrite it?
Okay. Will remove initialization.
>
>>          struct regmap *map;
>>          unsigned int dai_id = cpu_dai->driver->id;
>>
>> @@ -676,8 +676,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
>>          return -EINVAL;
>>          }
>>          if (interrupts & LPAIF_IRQ_PER(chan)) {
>> -
>> -               rv = regmap_write(map, reg, LPAIF_IRQ_PER(chan) | val);
>> +               val_clr = (LPAIF_IRQ_PER(chan) | val);
> Is the extra parenthesis useful?
Not exactly. Will remove it.
>
>> +               val_mask = LPAIF_IRQ_ALL(chan);
>> +               rv = regmap_update_bits(map, reg, val_mask, val_clr);
>>                  if (rv) {
>>                          dev_err(soc_runtime->dev,
>>                                  "error writing to irqclear reg: %d\n", rv);

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


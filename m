Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3D0404DCA
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 14:13:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE7361747;
	Thu,  9 Sep 2021 14:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE7361747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631189605;
	bh=ORO4bVSxzwS4lNMTbvTR3qgJSaToGrnT8w2lM1DXZj8=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sh57GcJOAA1YkR+rZslVTuBXGNjytEYGZBIS7o7M2o57pmWM/3E4RGQ/zGyEEUXEU
	 3StdUEOmBqJJbyR9ZmMLX9X4Elcm307+eGBbSOcU8QZAci2qxgaDmvoZzJaeurVFQn
	 ilQR1Qcdz1bKZVlDxlhaF/+8q87w79iWfGATClP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BBC1F80253;
	Thu,  9 Sep 2021 14:12:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39484F80224; Thu,  9 Sep 2021 14:12:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,HTTPS_HTTP_MISMATCH,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF972F80166
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 14:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF972F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="CqeT3rwx"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631189523; h=Content-Type: In-Reply-To: MIME-Version: Date:
 Message-ID: From: References: To: Subject: Sender;
 bh=JrPiFQ0Lu/q/e1KmJ4BcrwDz3zgx+Iis+TUjPaND4l8=;
 b=CqeT3rwxtn6YUzQP/FNcB4LqGdqrvjrP+/64lIYIM/nxs/RrQvrVtfpqW4ll7iLrJOYIj5QW
 Pruw0GWb7QzxEIO/LE46lqEGB4nxWcLkbIYcBWfPKJUAFp8tvIa5wERgbnDAr2QNHxIuObtB
 YWReZ9P7eQBygPvmiB4PfpbeccA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6139f9f4de7dfad22f505958 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 12:11:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8335DC008F0; Thu,  9 Sep 2021 12:11:31 +0000 (UTC)
Received: from [10.242.137.170] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 282D0C0044B;
 Thu,  9 Sep 2021 12:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 282D0C0044B
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2] ASoC: qcom: lpass-platform: Reset irq clear reg post
 handling interrupts
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <20210908142535.31106-1-srivasam@codeaurora.org>
 <c29802c9-4577-87bd-b843-8540588c6d06@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <49c8a61c-a0e3-3068-0f33-40eb18b56f79@codeaurora.org>
Date: Thu, 9 Sep 2021 17:41:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c29802c9-4577-87bd-b843-8540588c6d06@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Thanks for Your time Srini!!

On 9/8/2021 9:37 PM, Srinivas Kandagatla wrote:
>
>
> On 08/09/2021 15:25, Srinivasa Rao Mandadapu wrote:
>> Update interrupt clear register with reset value after addressing
>> all interrupts. This is to fix playback or capture hanging issue in
>> simultaneous playback and capture usecase.
>
> Could explain bit more about the issue.
> Specifically which interrupt and which ports is this issue seen.

The test case is repeated test of simultaneous playback and capture on 
audio jack. i.e. 10 sec playback and 10 secs Capture.

i.e. sequence is Capture --> Playback, Capture -> Playback

In interrupt handler reading IRQ status reg and processing all the bits 
in loop. By the time loop ends in handler,

another capture interrupt is raised and it's never getting cleared and 
whole test case is getting hanged.

>
>>
>> Fixes: 4f629e4b8705f ("ASoC: qcom: Add ability to handle interrupts 
>> per dma channel")
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>> Changes since v1:
>>      -- Update comments Header information with fixes tag
>>
>>   sound/soc/qcom/lpass-platform.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/sound/soc/qcom/lpass-platform.c 
>> b/sound/soc/qcom/lpass-platform.c
>> index f9df76d37858..1a0a4b0b1a03 100644
>> --- a/sound/soc/qcom/lpass-platform.c
>> +++ b/sound/soc/qcom/lpass-platform.c
>> @@ -749,6 +749,12 @@ static irqreturn_t lpass_platform_lpaif_irq(int 
>> irq, void *data)
>>           }
>>       }
>>   +    rv = regmap_write(drvdata->lpaif_map, LPAIF_IRQCLEAR_REG(v, 
>> LPAIF_IRQ_PORT_HOST), 0x0);
>
> Writing 1 to a bit of this register will clear the corresponding 
> latched interrupt. So I don't really understand how writing 0 is 
> really helping here?

Yes. Your point is valid. But use-case passed with below patch and this 
change. will revert this change and check again with only below patch .

https://patchwork.kernel.org/project/alsa-devel/patch/20210524142114.18676-1-srivasam@codeaurora.org/ 
<https://www.google.com/url?q=https://patchwork.kernel.org/project/alsa-devel/patch/20210524142114.18676-1-srivasam@codeaurora.org/&sa=D&usg=AOvVaw3VEq8XuEI8cJkNpAxTm3d2>

>
> Do you have this patch in your tree?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/sound/soc/qcom/lpass-cpu.c?h=v5.14&id=6a7f5bd6185e1c86256d5e52c3bb7a4d390d6e19 
>
yes. This patch is available.

> --srini
>
>> +    if (rv) {
>> +        pr_err("error writing to irqstat reg: %d\n", rv);
>> +        return IRQ_NONE;
>> +    }
>> +
>>       return IRQ_HANDLED;
>>   }
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


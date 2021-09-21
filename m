Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9D641300D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 10:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B36FE166B;
	Tue, 21 Sep 2021 10:15:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B36FE166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632212160;
	bh=hQ0H9BYCoRa9IeQgWJaALbKKwdiRdYiiIzEuAg7jtYw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PPnwDx+a1JLPJYohRljcHAP2zKAlZOsB4Xr/j30LtLjq5PbyCpYYP5FLykz4TYQA7
	 QBQyDVR+tSAzKZpDpgrt6EJzXmMDc4b20FWrgFB28CgmSypiHJBS7yyCYVM4r+sQkm
	 t/rohFdM9BnWM2UO9am2DD3PK1KrATAPiYl1sQ4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26AD7F80124;
	Tue, 21 Sep 2021 10:14:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F10BF80268; Tue, 21 Sep 2021 10:14:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2C79F80124
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 10:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2C79F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="Y5bHjWaO"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632212077; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=VYuQcjJgBCV5YB1/ZkmdBfsOPsqJ+sm51i8VCCVd5I8=;
 b=Y5bHjWaOJ+POBI6AzaDSrWJtAzoi7V19kmkfTEszNZlfmVCrJLdxDQoJ4oLN8ujgpK1IdLGO
 Z0bXnWCZofGwzlHHZsK/yuarbB0qSTifq0BE+B2bhIXL2qFAtJ5kQx2mvdVrFxy2ZHKYklwO
 WwMjkxCaUbCBqymIedB+KEHxFt0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 61499464b585cc7d24d63ce6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 08:14:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 71880C4360D; Tue, 21 Sep 2021 08:14:28 +0000 (UTC)
Received: from [192.168.204.90] (unknown [157.48.173.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 540C4C4338F;
 Tue, 21 Sep 2021 08:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 540C4C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 4/7] ASoC: codecs: lpass-va-macro: Change bulk voting to
 individual clock voting
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
 <1632123331-2425-5-git-send-email-srivasam@codeaurora.org>
 <5f915592-0ca6-2839-43fc-6d9aef1484b7@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <2378b5b1-fe45-171d-f8f9-373f8cece37f@codeaurora.org>
Date: Tue, 21 Sep 2021 13:44:19 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <5f915592-0ca6-2839-43fc-6d9aef1484b7@linaro.org>
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


On 9/20/2021 6:55 PM, Srinivas Kandagatla wrote:
>
>
Thanks for Your time Srini!!!
> On 20/09/2021 08:35, Srinivasa Rao Mandadapu wrote:
>> Change bulk clock frequency voting to individual voting.
>>
> Can you please explain why do we need to move out using clk bulk apis?
>
> Am not seeing any thing obvious behavior changing as part of this 
> patch, more details please..

In ADSP bypass use case, few clocks like macro and decode, are optional. 
So is the main reason for move out.

And sometimes we are seeing bulk voting failed in Kodiak setup.

>> Fixes: 908e6b1df26e (ASoC: codecs: lpass-va-macro: Add support to VA 
>> Macro)
>
> Why this has Fixes tag? Are we fixing any bug with this patch?
Okay. As such we are not fixing any bug. Will remove this fixes tag on 
your suggestion.
>
>>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>>   sound/soc/codecs/lpass-va-macro.c | 46 
>> ++++++++++++++++++++++++---------------
>>   1 file changed, 28 insertions(+), 18 deletions(-)
>>
>> diff --git a/sound/soc/codecs/lpass-va-macro.c 
>> b/sound/soc/codecs/lpass-va-macro.c
>> index d312a14..0ea39ae 100644
>> --- a/sound/soc/codecs/lpass-va-macro.c
>> +++ b/sound/soc/codecs/lpass-va-macro.c
>> @@ -193,7 +193,10 @@ struct va_macro {
>>         int dec_mode[VA_MACRO_NUM_DECIMATORS];
>>       struct regmap *regmap;
>> -    struct clk_bulk_data clks[VA_NUM_CLKS_MAX];
>> +    struct clk *mclk;
>> +    struct clk *macro;
>> +    struct clk *dcodec;
>> +
>>       struct clk_hw hw;
>>         s32 dmic_0_1_clk_cnt;
>> @@ -1321,7 +1324,7 @@ static const struct clk_ops fsgen_gate_ops = {
>>     static int va_macro_register_fsgen_output(struct va_macro *va)
>>   {
>> -    struct clk *parent = va->clks[2].clk;
>> +    struct clk *parent = va->mclk;
>>       struct device *dev = va->dev;
>>       struct device_node *np = dev->of_node;
>>       const char *parent_clk_name;
>> @@ -1404,15 +1407,18 @@ static int va_macro_probe(struct 
>> platform_device *pdev)
>>           return -ENOMEM;
>>         va->dev = dev;
>> -    va->clks[0].id = "macro";
>> -    va->clks[1].id = "dcodec";
>> -    va->clks[2].id = "mclk";
>>   -    ret = devm_clk_bulk_get(dev, VA_NUM_CLKS_MAX, va->clks);
>> -    if (ret) {
>> -        dev_err(dev, "Error getting VA Clocks (%d)\n", ret);
>> -        return ret;
>> -    }
>> +    va->macro = devm_clk_get_optional(dev, "macro");
>> +    if (IS_ERR(va->macro))
>> +        return PTR_ERR(va->macro);
>> +
>> +    va->dcodec = devm_clk_get_optional(dev, "dcodec");
>> +    if (IS_ERR(va->dcodec))
>> +        return PTR_ERR(va->dcodec);
>> +
>> +    va->mclk = devm_clk_get(dev, "mclk");
>> +    if (IS_ERR(va->mclk))
>> +        return PTR_ERR(va->mclk);
>>         ret = of_property_read_u32(dev->of_node, 
>> "qcom,dmic-sample-rate",
>>                      &sample_rate);
>> @@ -1426,10 +1432,11 @@ static int va_macro_probe(struct 
>> platform_device *pdev)
>>       }
>>         /* mclk rate */
>> -    clk_set_rate(va->clks[1].clk, VA_MACRO_MCLK_FREQ);
>> -    ret = clk_bulk_prepare_enable(VA_NUM_CLKS_MAX, va->clks);
>> -    if (ret)
>> -        return ret;
>> +    clk_set_rate(va->mclk, VA_MACRO_MCLK_FREQ);
>> +
>> +    clk_prepare_enable(va->mclk);
>> +    clk_prepare_enable(va->macro);
>> +    clk_prepare_enable(va->dcodec);
>>         base = devm_platform_ioremap_resource(pdev, 0);
>>       if (IS_ERR(base)) {
>> @@ -1457,8 +1464,9 @@ static int va_macro_probe(struct 
>> platform_device *pdev)
>>       return ret;
>>     err:
>> -    clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
>> -
>> +    clk_disable_unprepare(va->mclk);
>> +    clk_disable_unprepare(va->macro);
>> +    clk_disable_unprepare(va->dcodec);
>>       return ret;
>>   }
>>   @@ -1466,8 +1474,10 @@ static int va_macro_remove(struct 
>> platform_device *pdev)
>>   {
>>       struct va_macro *va = dev_get_drvdata(&pdev->dev);
>>   -    clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
>> -
>> +    of_clk_del_provider(pdev->dev.of_node);
>
> fsgen clk is registered using devm_* variant of clk apis, so why do we 
> need this here?
>
Okay. Will remove it and post new patch.
>
> --srini
>> +    clk_disable_unprepare(va->mclk);
>> +    clk_disable_unprepare(va->macro);
>> +    clk_disable_unprepare(va->dcodec);
>>       return 0;
>>   }
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


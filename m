Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E8456A56
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 07:38:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D63DC17BE;
	Fri, 19 Nov 2021 07:37:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D63DC17BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637303904;
	bh=1DTtGw62gxAkpTFtf5OKy6BJFtGEafBiQdnE78vcg8E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JjaIKLIGU/Q3IPnGMk6m00ZSp8N4H6J0Adhfsa8tJWIFpJsAUmMXM3Me2pgPQH62B
	 TKUIBqHfT+fgMy6Zl+Y4A+RCL7dE8HqW/QnkTqIpckbTjdgNOtGnDZbQ50VXesxtHf
	 6K+BOUMLTsAM5UWrU7jCv5iTSlJw3B4/TYAR/vzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C904F8026D;
	Fri, 19 Nov 2021 07:37:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 835E2F80217; Fri, 19 Nov 2021 07:37:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2C99F8010B
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 07:36:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2C99F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="LnZkpNHn"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637303814; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Ixwhfp9T0vaQlNYEIAG5gcw2ca2tRPTRKqoBDmGf6pw=;
 b=LnZkpNHn+B7UdaMeKfg5AFA0FzP9Y1WxJZBjZ0mynTao04RUL+UPRm1zfoejyTg+f81k6ZNG
 rUZ/Fujvj3rafnT6K17u/CKhGN9Y8uQ2VR80uBgLs7fWtqq79KDZmLMO35SM2vq6rQ2uGp9T
 aynXwbcq9Ymd9LRywKFTf345rrI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 619746041e1d2f52336b8a00 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Nov 2021 06:36:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7F2BAC4360D; Fri, 19 Nov 2021 06:36:52 +0000 (UTC)
Received: from [10.242.143.72] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id ED379C4338F;
 Fri, 19 Nov 2021 06:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org ED379C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v2 1/3] pinctrl: qcom: Update lpass variant independent
 functions as generic
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1635342097-2726-1-git-send-email-srivasam@codeaurora.org>
 <1635342097-2726-2-git-send-email-srivasam@codeaurora.org>
 <01c32c7f-9639-b3c8-045b-35469a3e54aa@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <19df295b-a3f1-9c31-27a3-7ebb59254694@codeaurora.org>
Date: Fri, 19 Nov 2021 12:06:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <01c32c7f-9639-b3c8-045b-35469a3e54aa@linaro.org>
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


On 11/3/2021 4:52 PM, Srinivas Kandagatla wrote:
Thanks for your time Srini!!!
> Hi Srinivasa,
> Thanks for the patches, I think you forgot to add correct mailing list 
> for this drivers.
>
> Please consider using scripts/get_maintainer.pl to help you with this 
> list.
>
> On 27/10/2021 14:41, Srinivasa Rao Mandadapu wrote:
>> Update pin control variable names to make common for all lpass varients.
>> Update bulk clock voting to optional voting as ADSP bypass platform 
>> doesn't
>> need macro and decodec clocks, these are maintained as power domains and
>> operated from lpass audio core cc.
>
> How are you going to ensure that the powerdomains are switched on when 
> setting up the pinctrl configuration.
>
> Should we not take a reference to the power-domain in this driver?

The required power domains are getting enabled in core-boot level. So no 
need of reference in this driver.

And still if power domain need to referenced, we can do it from device 
tree itself.

>
>
> --srini
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> ---
>>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 16 ++++++++--------
>>   1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c 
>> b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 2f19ab4..0bd0c16 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -107,7 +107,7 @@ struct lpi_pinctrl {
>>   };
>>     /* sm8250 variant specific data */
>> -static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
>> +static const struct pinctrl_pin_desc lpass_lpi_pins[] = {
>>       PINCTRL_PIN(0, "gpio0"),
>>       PINCTRL_PIN(1, "gpio1"),
>>       PINCTRL_PIN(2, "gpio2"),
>> @@ -124,7 +124,7 @@ static const struct pinctrl_pin_desc 
>> sm8250_lpi_pins[] = {
>>       PINCTRL_PIN(13, "gpio13"),
>>   };
>>   -enum sm8250_lpi_functions {
>> +enum lpass_lpi_functions {
>>       LPI_MUX_dmic1_clk,
>>       LPI_MUX_dmic1_data,
>>       LPI_MUX_dmic2_clk,
>> @@ -203,7 +203,7 @@ static const struct lpi_pingroup sm8250_groups[] = {
>>       LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
>>   };
>>   -static const struct lpi_function sm8250_functions[] = {
>> +static const struct lpi_function lpass_functions[] = {
>>       LPI_FUNCTION(dmic1_clk),
>>       LPI_FUNCTION(dmic1_data),
>>       LPI_FUNCTION(dmic2_clk),
>> @@ -228,12 +228,12 @@ static const struct lpi_function 
>> sm8250_functions[] = {
>>   };
>>     static struct lpi_pinctrl_variant_data sm8250_lpi_data = {
>> -    .pins = sm8250_lpi_pins,
>> -    .npins = ARRAY_SIZE(sm8250_lpi_pins),
>> +    .pins = lpass_lpi_pins,
>> +    .npins = ARRAY_SIZE(lpass_lpi_pins),
>>       .groups = sm8250_groups,
>>       .ngroups = ARRAY_SIZE(sm8250_groups),
>> -    .functions = sm8250_functions,
>> -    .nfunctions = ARRAY_SIZE(sm8250_functions),
>> +    .functions = lpass_functions,
>> +    .nfunctions = ARRAY_SIZE(lpass_functions),
>>   };
>>     static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int 
>> pin,
>> @@ -615,7 +615,7 @@ static int lpi_pinctrl_probe(struct 
>> platform_device *pdev)
>>           return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
>>                        "Slew resource not provided\n");
>>   -    ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
>> +    ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, 
>> pctrl->clks);
>>       if (ret)
>>           return dev_err_probe(dev, ret, "Can't get clocks\n");
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


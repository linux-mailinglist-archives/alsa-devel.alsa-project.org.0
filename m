Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE5543C439
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 09:43:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B603216D0;
	Wed, 27 Oct 2021 09:42:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B603216D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635320629;
	bh=SZlx5ppO87xseqlY0nElfpfK/awzEz3zN/HwIW0ewMw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UwqaHIwjFQXUJdpZy5hURnh/PCYoW/l+ZAjNifELZLwi6AN7VkoKsMFLQFrP91kES
	 MaVlryHzp7OsrvLkzAhpe1kG7Ku8oyWkUFUxtbPXDHQ0zE/If+klhLZmnMZ7Yoy/g5
	 hCQnwb6CgW5vQXs2Dgde39QJc9ktqd65DXT1+xEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C8EDF800D1;
	Wed, 27 Oct 2021 09:42:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE3F6F8025A; Wed, 27 Oct 2021 09:42:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A720F8010A
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 09:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A720F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="m9wUtaTU"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635320546; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3ipj9C9Z+CcARpvtwqbGA4rPC5dN+YNxfZHwxGPY7Qc=;
 b=m9wUtaTUizT5fhnqmi4LNUYznIETlyJqKveyQ8CXTAH2GLovFRNJ/NFqYGAvuIoD34cnK6p+
 +0+kUCesYrrVniOQgb+WtwDmF88ArOucg3kqH5MWbzazT2IIH6oAZcPdDTRNvOKU+Uv7y++O
 ui778nKeSLVc9WqXD6XdLgKtTEk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 617902dec75c436a30c725fe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Oct 2021 07:42:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8DF3DC43619; Wed, 27 Oct 2021 07:42:21 +0000 (UTC)
Received: from [10.242.143.72] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E47BC43460;
 Wed, 27 Oct 2021 07:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1E47BC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 1/3] pinctrl: qcom: Update lpass variant independent
 functions as generic
To: Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 bjorn.andersson@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org,
 judyhsiao@chromium.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, perex@perex.cz, plai@codeaurora.org,
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
 tiwai@suse.com
References: <1633614519-26680-1-git-send-email-srivasam@codeaurora.org>
 <1633614519-26680-2-git-send-email-srivasam@codeaurora.org>
 <CAE-0n52Ge_XZr914Ksmq5Myk3FRp7+Sc5P-9jj8wuspKkjXnYw@mail.gmail.com>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <d00db826-5834-be00-d75b-e226e6f751b5@codeaurora.org>
Date: Wed, 27 Oct 2021 13:12:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n52Ge_XZr914Ksmq5Myk3FRp7+Sc5P-9jj8wuspKkjXnYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 10/7/2021 11:27 PM, Stephen Boyd wrote:
Thanks for Your Time Stephen!!!
> Quoting Srinivasa Rao Mandadapu (2021-10-07 06:48:37)
>> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> index 2f19ab4..c0117c5 100644
>> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
>> @@ -124,7 +124,8 @@ static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
>>          PINCTRL_PIN(13, "gpio13"),
>>   };
>>
>> -enum sm8250_lpi_functions {
>> +
> Please drop this extra newline so the diff makes sense.
Okay.
>> +enum lpass_lpi_functions {
>>          LPI_MUX_dmic1_clk,
>>          LPI_MUX_dmic1_data,
>>          LPI_MUX_dmic2_clk,
>> @@ -203,7 +204,7 @@ static const struct lpi_pingroup sm8250_groups[] = {
>>          LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
>>   };
>>
>> -static const struct lpi_function sm8250_functions[] = {
>> +static const struct lpi_function lpass_functions[] = {
> Why not follow the approach of other qcom pinctrl drivers and make a
> core driver that each SoC uses as a library?

Actually this driver is for lpass LPI pin control purpose. For this only 
14 pins are there and mostly fixed for all platforms.

So I feel for now this approach is fine.

>>          LPI_FUNCTION(dmic1_clk),
>>          LPI_FUNCTION(dmic1_data),
>>          LPI_FUNCTION(dmic2_clk),
>> @@ -615,7 +616,7 @@ static int lpi_pinctrl_probe(struct platform_device *pdev)
>>                  return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
>>                                       "Slew resource not provided\n");
>>
>> -       ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
>> +       ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> Please mention in the commit text why this is now optional.
Okay. will update commit message accordingly.
>
>>          if (ret)
>>                  return dev_err_probe(dev, ret, "Can't get clocks\n");
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


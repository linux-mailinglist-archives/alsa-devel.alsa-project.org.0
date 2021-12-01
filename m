Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DC0465112
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 16:12:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F15625D7;
	Wed,  1 Dec 2021 16:12:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F15625D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638371571;
	bh=so9YfV6CqMSuBx8vroHOFWZL1pnMPMy7F4BS2s1uWWU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KmyWCpNBxMR73dZEdEAh58oY5yHU2jPtZSFdz/YXQX0L/wOmik6ZXmbzrBtG5hOmH
	 jw106t+2yN4ikhSg/VKapeKbZWlLJ/2IwlSdoBLCJy7nPIug8BOdQdLPzaS1UvLI2R
	 o8vYdor6278hWI9CNF39OstLj2+6u6EEz8j5V/oI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4689F80217;
	Wed,  1 Dec 2021 16:11:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4450F80246; Wed,  1 Dec 2021 16:11:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FC0DF80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 16:11:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FC0DF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="RIF8UZNj"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638371488; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=hzfR5Iy/ZH4JZgmh+ej8VUvwQgSQ07CnUGKU2GOo0f0=;
 b=RIF8UZNjv3k0Cll0pTR4D33HF2tqmm4H3VooNgK9GysXLzKbrVqgpeeuVbQtF1mj1IWszqzK
 /4WI33wbNS2QRYpi9jadwPASgYxU3vVuJlb0R7yiRZaz+NpdbuR4EhBVjKk7MA+M3LlpN0sn
 DVPyZ5cy7fo4cvo6jwD7PlAzIcQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61a7909d6bacc185a57c64bf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 01 Dec 2021 15:11:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5F4BAC4360C; Wed,  1 Dec 2021 15:11:23 +0000 (UTC)
Received: from [10.242.143.72] (unknown [202.46.23.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 44557C4338F;
 Wed,  1 Dec 2021 15:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 44557C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v3 3/5] pinctrl: qcom: Move chip specific functions to
 right files
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
References: <1638179932-3353-1-git-send-email-srivasam@codeaurora.org>
 <1638179932-3353-4-git-send-email-srivasam@codeaurora.org>
 <bb08af7e-3b90-2d64-3bb1-f82cc6686184@linaro.org>
 <342898d1-59ef-9104-658d-d992c0126361@codeaurora.org>
 <a9e561cc-67f7-450b-fc08-61ece48e9070@linaro.org>
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <c05aee0c-9cd7-38e0-61cf-eaf138185b00@codeaurora.org>
Date: Wed, 1 Dec 2021 20:41:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a9e561cc-67f7-450b-fc08-61ece48e9070@linaro.org>
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


On 12/1/2021 8:37 PM, Srinivas Kandagatla wrote:
Thanks for clarification Srini!!
>
> On 01/12/2021 14:33, Srinivasa Rao Mandadapu wrote:
>>>
>>>
>>>> +enum lpass_lpi_functions {
>>>> +    LPI_MUX_dmic1_clk,
>>>> +    LPI_MUX_dmic1_data,
>>>> +    LPI_MUX_dmic2_clk,
>>>> +    LPI_MUX_dmic2_data,
>>>> +    LPI_MUX_dmic3_clk,
>>>> +    LPI_MUX_dmic3_data,
>>>> +    LPI_MUX_i2s1_clk,
>>>> +    LPI_MUX_i2s1_data,
>>>> +    LPI_MUX_i2s1_ws,
>>>> +    LPI_MUX_i2s2_clk,
>>>> +    LPI_MUX_i2s2_data,
>>>> +    LPI_MUX_i2s2_ws,
>>>> +    LPI_MUX_qua_mi2s_data,
>>>> +    LPI_MUX_qua_mi2s_sclk,
>>>> +    LPI_MUX_qua_mi2s_ws,
>>>> +    LPI_MUX_swr_rx_clk,
>>>> +    LPI_MUX_swr_rx_data,
>>>> +    LPI_MUX_swr_tx_clk,
>>>> +    LPI_MUX_swr_tx_data,
>>>> +    LPI_MUX_wsa_swr_clk,
>>>> +    LPI_MUX_wsa_swr_data,
>>>> +    LPI_MUX_gpio,
>>>> +    LPI_MUX__,
>>>> +};
>>>> +
>>>> +static const unsigned int gpio0_pins[] = { 0 };
>>>> +static const unsigned int gpio1_pins[] = { 1 };
>>>> +static const unsigned int gpio2_pins[] = { 2 };
>>>> +static const unsigned int gpio3_pins[] = { 3 };
>>>> +static const unsigned int gpio4_pins[] = { 4 };
>>>> +static const unsigned int gpio5_pins[] = { 5 };
>>>> +static const unsigned int gpio6_pins[] = { 6 };
>>>> +static const unsigned int gpio7_pins[] = { 7 };
>>>> +static const unsigned int gpio8_pins[] = { 8 };
>>>> +static const unsigned int gpio9_pins[] = { 9 };
>>>> +static const unsigned int gpio10_pins[] = { 10 };
>>>> +static const unsigned int gpio11_pins[] = { 11 };
>>>> +static const unsigned int gpio12_pins[] = { 12 };
>>>> +static const unsigned int gpio13_pins[] = { 13 };
>>> >>>
>>> to here are specific to sm8250, so it should not be in header file 
>>> to start with.
>>
>> As these are common to all lpass variants.. I feel it's better to 
>> keep in Header file.
>
> You realize that every include of this file will add these static 
> variables to file, in this case to pinctrl-lpass-lpi.c, 
> pinctrl-sm8250-lpass-lpi.c and pinctrl-sc7280-lpass-lpi.c
> so in first file(pinctrl-lpass-lpi.c) you never use those variables in 
> second file (pinctrl-sm8250-lpass-lpi.c)you only use up to gpio13 and 
> in third file pinctrl-sc7280-lpass-lpi.c you could use them.
>
> so its really bad idea to add static variables in header files.
>
Okay. Understood. will move it SoC specific files.
> --srini
>
>>
>> And if new pins comes in later variants, we can add them 
>> incrementally, and they will not impact existing pin numbers.
>>
>> I think in upcoming variants number of pins will not decrease.
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


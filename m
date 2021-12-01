Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DAC4650F6
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 16:08:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D17F525A6;
	Wed,  1 Dec 2021 16:07:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D17F525A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638371326;
	bh=8ALXMW8rz9JIcsQ9/eoBLodlEhhOcRk/FaYb5nyfRfg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KDRF0KIYZeavuPuikF6IhrSxBCbV3EBG8qVeI6GLL3hzOZQznnZxSChD6O89FcPR4
	 5ODfDqEA8hcxnO07fwr6Vvk9pd2MgqiYjqahSPHIh6H2JDJWK++PBwdpu1htZo1yVJ
	 xhxFXBRdX7GEaeSSiC8K5TtL6FaCFrZu+is8CvFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E7E7F80249;
	Wed,  1 Dec 2021 16:07:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 836FFF80246; Wed,  1 Dec 2021 16:07:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9D69F80121
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 16:07:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9D69F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jzA4kko/"
Received: by mail-wm1-x334.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso22538060wms.2
 for <alsa-devel@alsa-project.org>; Wed, 01 Dec 2021 07:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qTmietPPTH/OEWz3+GN173yo9RKau03sCp5APng7zRc=;
 b=jzA4kko/2OjjeaobiNKn612JAkABJ27wZLaAMOy6eKCrhon866eDrxxG5nmZ/pRRq2
 NE4zTNZUiSvjcGJnqr9jMhKnIZbPDhYN1GaWw4oZ94U+BAFGZl7jgNf5GNCtyAa/IsNQ
 EqGL+Nfy7ZbYzWlFeKH4LkKnkcjq+YOO8ToWS+Fq9ampksyPKnVye2nICbuZSLTaZWRb
 RyXjpO1L/uC+Wvu0ROkT4uIRvFJUNQ00AR87Gaz4pSTiSg8x+3KFgIIWbfNOYYbVRh0j
 sKLAyrhMOKy3vcG8EgSt2jZmHeqQobEtCv7bY6R0wX+GFvwlckNBPNTZMgFneXXxFPJa
 Z3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qTmietPPTH/OEWz3+GN173yo9RKau03sCp5APng7zRc=;
 b=lLGQK4swCkQlVh0BJLeh5gfRR1gLbxmvnrCyjEJ5GcrkXiRsEtlB4nj25HRmkIlq0H
 8S/I5Ykj6va7jvk68CBZE9QxsWyUOAwelgdNI6r0iPFZokPFE+fjU39xknC6h+UTt17M
 Q7Ovzmw64vWQ3/8oqmN7JS2MECtb50jNPA7gqt4cow7Q9dweyoXVJyVPx3xinDC6Bl4u
 Law94qA7S8lpl+QWX0QvdRFIkxWNcRWGgzkXVcL1TVIOMGQqQYR+h6MfzsGgNF+39DIT
 Z0CCyVGlnDgqNXsmbsd43bUCdR/zBvQ6gTV05BAaYhQ4WC4cQhj8uKANlHztSkX3DOV2
 eUYQ==
X-Gm-Message-State: AOAM533n+dc1FjFcTWwyp8aY7AZe77fRvOLBzRfsKK1cwlXkUsEznovk
 Wdl3YHQlEaXwng9BVOpS7Eh0pw==
X-Google-Smtp-Source: ABdhPJw7rj6qis9EWXaZFE/0EATQh6xhhQa51TzS6S/onkXNA+4TsiXKIUSFBX+s/THVcjWw3y8IVA==
X-Received: by 2002:a05:600c:501f:: with SMTP id
 n31mr7688078wmr.101.1638371244569; 
 Wed, 01 Dec 2021 07:07:24 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id n15sm1360511wmq.38.2021.12.01.07.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 07:07:23 -0800 (PST)
Subject: Re: [PATCH v3 3/5] pinctrl: qcom: Move chip specific functions to
 right files
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
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
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a9e561cc-67f7-450b-fc08-61ece48e9070@linaro.org>
Date: Wed, 1 Dec 2021 15:07:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <342898d1-59ef-9104-658d-d992c0126361@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 01/12/2021 14:33, Srinivasa Rao Mandadapu wrote:
>>
>>
>>> +enum lpass_lpi_functions {
>>> +    LPI_MUX_dmic1_clk,
>>> +    LPI_MUX_dmic1_data,
>>> +    LPI_MUX_dmic2_clk,
>>> +    LPI_MUX_dmic2_data,
>>> +    LPI_MUX_dmic3_clk,
>>> +    LPI_MUX_dmic3_data,
>>> +    LPI_MUX_i2s1_clk,
>>> +    LPI_MUX_i2s1_data,
>>> +    LPI_MUX_i2s1_ws,
>>> +    LPI_MUX_i2s2_clk,
>>> +    LPI_MUX_i2s2_data,
>>> +    LPI_MUX_i2s2_ws,
>>> +    LPI_MUX_qua_mi2s_data,
>>> +    LPI_MUX_qua_mi2s_sclk,
>>> +    LPI_MUX_qua_mi2s_ws,
>>> +    LPI_MUX_swr_rx_clk,
>>> +    LPI_MUX_swr_rx_data,
>>> +    LPI_MUX_swr_tx_clk,
>>> +    LPI_MUX_swr_tx_data,
>>> +    LPI_MUX_wsa_swr_clk,
>>> +    LPI_MUX_wsa_swr_data,
>>> +    LPI_MUX_gpio,
>>> +    LPI_MUX__,
>>> +};
>>> +
>>> +static const unsigned int gpio0_pins[] = { 0 };
>>> +static const unsigned int gpio1_pins[] = { 1 };
>>> +static const unsigned int gpio2_pins[] = { 2 };
>>> +static const unsigned int gpio3_pins[] = { 3 };
>>> +static const unsigned int gpio4_pins[] = { 4 };
>>> +static const unsigned int gpio5_pins[] = { 5 };
>>> +static const unsigned int gpio6_pins[] = { 6 };
>>> +static const unsigned int gpio7_pins[] = { 7 };
>>> +static const unsigned int gpio8_pins[] = { 8 };
>>> +static const unsigned int gpio9_pins[] = { 9 };
>>> +static const unsigned int gpio10_pins[] = { 10 };
>>> +static const unsigned int gpio11_pins[] = { 11 };
>>> +static const unsigned int gpio12_pins[] = { 12 };
>>> +static const unsigned int gpio13_pins[] = { 13 };
>> >>>
>> to here are specific to sm8250, so it should not be in header file to 
>> start with.
> 
> As these are common to all lpass variants.. I feel it's better to keep 
> in Header file.

You realize that every include of this file will add these static 
variables to file, in this case to pinctrl-lpass-lpi.c, 
pinctrl-sm8250-lpass-lpi.c and pinctrl-sc7280-lpass-lpi.c
so in first file(pinctrl-lpass-lpi.c) you never use those variables in 
second file (pinctrl-sm8250-lpass-lpi.c)you only use up to gpio13 and in 
third file pinctrl-sc7280-lpass-lpi.c you could use them.

so its really bad idea to add static variables in header files.

--srini

> 
> And if new pins comes in later variants, we can add them incrementally, 
> and they will not impact existing pin numbers.
> 
> I think in upcoming variants number of pins will not decrease.
> 

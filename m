Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 903A662EE12
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 08:03:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15B5815E2;
	Fri, 18 Nov 2022 08:02:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15B5815E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668755022;
	bh=hV4dl0bmNvRVzaNN3AVoJSTRS5rs6bcMxsucxBOx2v0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=trjruhhHAAZaUOXsD/rHrt5hKL/9y9PJyrmExIYr+hmoBzwP7e3+mQ9Xa+5BeCMEj
	 NQxgZbvEW4L4N0yZC1Q9ABNDLFii1hWJD0+i+VbTsJpfgZF0nD49lfooe2BPcFaJxe
	 1YHZzt3ivit3db0YVbtuLRbltuwAWv+RPNz5s2RM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9BEEF800B8;
	Fri, 18 Nov 2022 08:02:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F5A4F801D8; Fri, 18 Nov 2022 08:02:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D70ECF800B8
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 08:02:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D70ECF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Xx/l90we"
Received: by mail-wm1-x32f.google.com with SMTP id 5so3006795wmo.1
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 23:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=26hKBvJcF5CUHTUmsCq+huARsjmkGqI9lzieMyn9DLo=;
 b=Xx/l90wegiIP7sy0/amq6ND08TImtpP9P536H71U90mq3TLZE5AmTi9VOGqDgZxvts
 1eNEHWg6ietLCLW7LvNIxNSONbpnDptTiqxUPKuglJdy17HyrJI8cYBvMa/FoX+5Yz/S
 jTpKmJxPqtV1OUN0vFM25rF8WLwWv48nCfMON5JVq0bo+NXy8g/5S/M9FjRW8RXVV1S8
 4SQ0lTow3/1mAjE2PiJze24naqvDVHfc0KAQGbJJcdj+JTlngk39tjRnQm6alFUmVBwk
 PYdVyg/V+ouGAXQ9GnrfvySAceDsASAcJMBnfbBTqahaMBcfPGutfF6vw38R8ZJWkD5j
 hm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=26hKBvJcF5CUHTUmsCq+huARsjmkGqI9lzieMyn9DLo=;
 b=C7Y+NLIeDx2AWBsSoXBoodonrD0EeRbKyF69sgDXvlo+TGgsi6Xf6vrnGhPzAnjz7h
 YbG7hyDyU6tAPOFZbc+AEDMXY/GLHaj+TaBrmSrpEMn2mIL6Ban37lraybm2n7557kSR
 yFOFSQ9hyWqdMIw3AfPojFf5aaschVhhYkiqyvgWoVop+0J+wHn11FbXhKjhvnBRDEi2
 cTSqCUsrCo7v162xhiMFdz8lCaQRouacDNhBNqZ5tJlGcXihuYap0XVCUX5YlKBZqCc1
 9S3hQr7mRz/dE4ZplPEyBYVYRxZ70gM0q55T2bXN0VlBlMXd0EUhPJ2YvEyXiIahQqW1
 DfTg==
X-Gm-Message-State: ANoB5pnCajyqAeEVG/bCrQ0m0SZLZFVPhcbh1sWmmjH+eI7Km9uAXLuv
 XsDfxzYwecnbhFL/P7wJb6bxOA==
X-Google-Smtp-Source: AA0mqf58dgLUTsUC3FiqOzuNY3YY+BxeXPdO4wMVdVHin/vyF2Yj9CWK+59hwF/UbVGf48fiC3xyeQ==
X-Received: by 2002:a05:600c:500f:b0:3c7:135a:2e4f with SMTP id
 n15-20020a05600c500f00b003c7135a2e4fmr7639463wmr.30.1668754956393; 
 Thu, 17 Nov 2022 23:02:36 -0800 (PST)
Received: from [192.168.22.132] ([167.98.215.174])
 by smtp.googlemail.com with ESMTPSA id
 w11-20020a1cf60b000000b003cfbe1da539sm3653646wmc.36.2022.11.17.23.02.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 23:02:35 -0800 (PST)
Message-ID: <8cf7f7ae-f2d3-56ad-021e-7cb478032291@linaro.org>
Date: Fri, 18 Nov 2022 07:02:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] ASoC: codecs: va-macro: add npl clk
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org
References: <20221115105541.16322-1-srinivas.kandagatla@linaro.org>
 <20221115105541.16322-3-srinivas.kandagatla@linaro.org>
 <090831eb-2c7a-56c2-601e-e910431a9403@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <090831eb-2c7a-56c2-601e-e910431a9403@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
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

Thanks Krzysztof,

On 15/11/2022 14:23, Krzysztof Kozlowski wrote:
> On 15/11/2022 11:55, Srinivas Kandagatla wrote:
>> New versions of VA Macro has soundwire integrated, so handle the soundwire npl
>> clock correctly in the codec driver.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/codecs/lpass-va-macro.c | 41 +++++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
>> index b0b6cf29cba3..d59af6d69c34 100644
>> --- a/sound/soc/codecs/lpass-va-macro.c
>> +++ b/sound/soc/codecs/lpass-va-macro.c
>> @@ -205,6 +205,7 @@ struct va_macro {
>>   	int dec_mode[VA_MACRO_NUM_DECIMATORS];
>>   	struct regmap *regmap;
>>   	struct clk *mclk;
>> +	struct clk *npl;
>>   	struct clk *macro;
>>   	struct clk *dcodec;
>>   	struct clk *fsgen;
>> @@ -1332,6 +1333,9 @@ static int fsgen_gate_enable(struct clk_hw *hw)
>>   	struct regmap *regmap = va->regmap;
>>   	int ret;
>>   
>> +	if (va->has_swr_master)
>> +		clk_prepare_enable(va->mclk);
> 
> No error path?
that is true, i missed this indeed, sending v2 with this and other ret = 
PTR_ERR(va->npl) change.

--srini
> 
>> +
>>   	ret = va_macro_mclk_enable(va, true);
>>   	if (!va->has_swr_master)
>>   		return ret;
>> @@ -1358,6 +1362,8 @@ static void fsgen_gate_disable(struct clk_hw *hw)
>>   			   CDC_VA_SWR_CLK_EN_MASK, 0x0);
>>   
>>   	va_macro_mclk_enable(va, false);
>> +	if (va->has_swr_master)
>> +		clk_disable_unprepare(va->mclk);
>>   }
>>   
>>   static int fsgen_gate_is_enabled(struct clk_hw *hw)
>> @@ -1386,6 +1392,9 @@ static int va_macro_register_fsgen_output(struct va_macro *va)
>>   	struct clk_init_data init;
>>   	int ret;
>>   
>> +	if (va->has_swr_master)
>> +		parent = va->npl;
>> +
>>   	parent_clk_name = __clk_get_name(parent);
>>   
>>   	of_property_read_string(np, "clock-output-names", &clk_name);
>> @@ -1512,6 +1521,14 @@ static int va_macro_probe(struct platform_device *pdev)
>>   	/* mclk rate */
>>   	clk_set_rate(va->mclk, 2 * VA_MACRO_MCLK_FREQ);
>>   
>> +	if (va->has_swr_master) {
>> +		va->npl = devm_clk_get(dev, "npl");
> 
> I think you miss:
> ret = PTR_ERR(va->npl);
> 
>> +		if (IS_ERR(va->npl))
>> +			goto err;
>> +
>> +		clk_set_rate(va->npl, 2 * VA_MACRO_MCLK_FREQ);
>> +	}
>> +
>>   	ret = clk_prepare_enable(va->macro);
>>   	if (ret)
>>   		goto err;
> 
> Best regards,
> Krzysztof
> 

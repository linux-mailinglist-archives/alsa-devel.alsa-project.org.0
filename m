Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CC2F7456
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 13:50:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AA5F1670;
	Mon, 11 Nov 2019 13:49:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AA5F1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573476622;
	bh=vVS3W1w0cII88tOFzgzHSDZ0YfEXwHXCplDzqka6yTA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hCtPF/DxZ1sli0H+t/MZfPojkndMHFhjqFArYQ99hA9D1HmSUM+TSA4fLeRXPmf41
	 bgu4Q0h2n7uvrcqZVeGbTT0tk7zUPeqS0uZ+vRL5skqiBJGEZAlpgtgqgd9OqZMehB
	 DoiDcB3ejgsD9sK66S486lP7Dv6pBKTev9gEYGOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A00C7F80518;
	Mon, 11 Nov 2019 13:48:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E95F9F804FF; Mon, 11 Nov 2019 13:48:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2824BF8015C
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 13:48:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2824BF8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hlskkMzH"
Received: by mail-wm1-x342.google.com with SMTP id z26so13168096wmi.4
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 04:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LueFggV2mFZxu+VUXQPu24NK+wGUjIR5etrw8L3OYL8=;
 b=hlskkMzHuS9VjPDw7su1MuaSy4UKB/cuCbdV3y3X9IZv5WR6cpIayQK4ozvCLeGzMP
 ihs4CctijXAgpFBbqCCCN88t8nbiXnFeeeAvBYOQ11PHTVFGxHhmyuBJFe+3+xfA77RR
 FHMtHBCbAWQFWWYSsk13lR3NUuyoPmXwtuRCK+ThfsfC7YAkwPLKAGbU7yaUFEuFBLKU
 5SMWdckdwHtRdm3Vuam+QOjQ0Zdwico2zXB8uGOz5bPZpVAXME3tFReUi4L9NiGZZJ/V
 iaiEBAg21L0Ve1eJXYo645eZ32j/nTElMcxPkX0QUSbaihWx7grcK4EG7PX3WJEXbsoj
 Yo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LueFggV2mFZxu+VUXQPu24NK+wGUjIR5etrw8L3OYL8=;
 b=QccPsPsIlJT/Dtd8dddMXXkxArlcA2G2YBdvb2dNK5pzq/mHOL10/Dnr+VSoYBHhiE
 U5TWJ4bpaAndjrcZIi7pfk3kghYPPI/mZPr4D0IgSj8iD9OUMSzCb2v068X5sunt+900
 5QKMsLCW+0Vkm8jBCNWzftoqFbUxdbPFjcSHi/5m2Jt0DQPVFJPaPfIpq1qV6uZ3dmmi
 FnTsQseG55hg9ZHODv53WLAVQuqApwLyghxJdWUlvAB9XWg2l7oVWnsZW30we1qu+wHo
 /RdxZL3amOhnQa08nB/iaQMrUWHUyYT+zrfNXP4mlU48s4eQIF22AHf3cpfiDKVUoTCZ
 yg/g==
X-Gm-Message-State: APjAAAV8NyOT3Jyfl7Mj6yhaYwA5qCxJY905cGa3QsTl8eU6SeSv0AKF
 AG/s+q8daUjfUegWu4TCmE6WYA==
X-Google-Smtp-Source: APXvYqzR0+iSF3vPdqISM3JWy3ouLqoSAfFd0Vk+1PYXQknCvCZY112q3J7ZdtQDU3yTPdYF3TEp1A==
X-Received: by 2002:a7b:c858:: with SMTP id c24mr21422418wml.174.1573476508859; 
 Mon, 11 Nov 2019 04:48:28 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id w81sm23284941wmg.5.2019.11.11.04.48.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Nov 2019 04:48:28 -0800 (PST)
To: Lee Jones <lee.jones@linaro.org>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-3-srinivas.kandagatla@linaro.org>
 <20191111111836.GH3218@dell>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ce2244ac-2219-3cc0-8ad6-7491295fbbef@linaro.org>
Date: Mon, 11 Nov 2019 12:48:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191111111836.GH3218@dell>
Content-Language: en-US
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vinod.koul@linaro.org, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v3 02/11] mfd: wcd934x: add support to
 wcd9340/wcd9341 codec
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 11/11/2019 11:18, Lee Jones wrote:
> On Tue, 29 Oct 2019, Srinivas Kandagatla wrote:
> 
>> Qualcomm WCD9340/WCD9341 Codec is a standalone Hi-Fi audio codec IC.
>>
>> This codec has integrated SoundWire controller, pin controller and
>> interrupt controller.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
> 
> No changelog?

I have done that in cover letter.
If you prefer it here, I can add that in next version.

> 
>>   drivers/mfd/Kconfig                   |  12 +
>>   drivers/mfd/Makefile                  |   1 +
>>   drivers/mfd/wcd934x.c                 | 306 +++++++++++++++
>>   include/linux/mfd/wcd934x/registers.h | 529 ++++++++++++++++++++++++++
>>   include/linux/mfd/wcd934x/wcd934x.h   |  31 ++
>>   5 files changed, 879 insertions(+)
>>   create mode 100644 drivers/mfd/wcd934x.c
>>   create mode 100644 include/linux/mfd/wcd934x/registers.h
>>   create mode 100644 include/linux/mfd/wcd934x/wcd934x.h
> 
> This driver reads much better now. Thanks for making the changes.
> 
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index ae24d3ea68ea..9fe7e54b13bf 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1967,6 +1967,18 @@ config MFD_STMFX
>>   	  additional drivers must be enabled in order to use the functionality
>>   	  of the device.
>>   
>> +config MFD_WCD934X
>> +	tristate "Support for WCD9340/WCD9341 Codec"
>> +	depends on SLIMBUS
>> +	select REGMAP
>> +	select REGMAP_SLIMBUS
>> +	select REGMAP_IRQ
>> +	select MFD_CORE
>> +	help
>> +	  Support for the Qualcomm WCD9340/WCD9341 Codec.
>> +	  This driver provides common support wcd934x audio codec and its
>> +	  associated Pin Controller, Soundwire Controller and Audio codec.
> 
> Your capitalisation of devices is all over the place in both your help
> section and in the commit message. Either capitalise them all or none
> of them. Personally I would prefer all, rather than none. What ever
> you choose, please be consistent.
> 
> Same for "wcd934x", this should read "WCD934x" in all comments and the
> help.

I agree, will fix it along with other Nits you suggested.


[...]
>> +static void wcd934x_slim_remove(struct slim_device *sdev)
>> +{
>> +	struct wcd934x_ddata *ddata = dev_get_drvdata(&sdev->dev);
>> +
>> +	regulator_bulk_disable(WCD934X_MAX_SUPPLY, ddata->supplies);
>> +	mfd_remove_devices(&sdev->dev);
>> +	kfree(ddata);
>> +}
>> +
>> +static const struct slim_device_id wcd934x_slim_id[] = {
>> +	{ SLIM_MANF_ID_QCOM, SLIM_PROD_CODE_WCD9340, 0x1, 0x0 },
> 
> What do the last parameters mean? Might be better to define them.

This is Instance ID and Device ID of SLIMBus enumeration address.


> 
>> +	{}
>> +};
> 
> [...]
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

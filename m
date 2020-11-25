Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9854C2C3F41
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 12:43:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DF1D171D;
	Wed, 25 Nov 2020 12:42:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DF1D171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606304603;
	bh=UPDV8E+FcI176PLeU6ecsejc/CsPbLmK91KIjigB7TQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GPKWaageP5UKgTN0+usMgn0OgcPBPgCkCP3pfXrJSRRfjWqHSRpwIJVdOXInta73+
	 wVEFt9hSrrse+Ddr/nft5FZRV0Gd9OtaWGy2tFhxcCwP9PPrnGfkJb6OeTkbtDnNA1
	 FXx/JKLS8aKioGKGyqHEhqhNe+l/gd1qon3yKOw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE91AF8015F;
	Wed, 25 Nov 2020 12:41:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E016F8019D; Wed, 25 Nov 2020 12:41:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54946F80128
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 12:41:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54946F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="IB5nW+14"
Received: by mail-wm1-x343.google.com with SMTP id w24so1862691wmi.0
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 03:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nVuOJb86RZnub8WbfD5mttdsK/algndOavgLCFXuCFE=;
 b=IB5nW+14riZtbKeB2ho1hmjZSLlS5UWP6ld07DKzgKjkyjiJFvMqpw/Xua9U3/i8zT
 w7Rltfm0A0JmWNWXXR0a2oxK3qsd0UhiXFQYeJaNiELo4iJvJevE0LRy2PcGqkceBuru
 OIu9gh5XsPWSKnP1bMaNU2Ky5fbqUpZTWerq3Eq80JYkfjvzUCCnI95iWh56H+EDCrkf
 QVUW7kbcdiDYoktSHWmsXWqLdd1KvZd6k5HkgPKggsVh5qojGzvomp5H6by/KOTln7N5
 bybwv7LNfYhdh75I0OSoAHezAdhNtWw1qk449I9VxHO49Wshq8/5ysew5fzKy9Cj5IAi
 iQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nVuOJb86RZnub8WbfD5mttdsK/algndOavgLCFXuCFE=;
 b=IuaWBTcgBiaKpDm+uM0jsCuYBqTIAvnjmkCLEj5ufCUkEc4dHcpt0yY6WvXuB826R5
 KpbNObynWKIFEAyolCTAdxjNUpWo59tRbXhJl5fkXupsOEsUWRQxfiaTj1Z/ZbRpGWF0
 mi4nCi0JtbN5C1Gts9fKW98N1KP+SyMy4eDWuAA9m06DI0T1l9KA1pXoaNbl1j5QqEnv
 gVFyQ7xeVDvvSDRFGKtq1PgwvR5g82oedWSNriKUcEm0rMH8eOku1hCYvM0tmr1Hfxsi
 95ISolVSpybEJvYh2Wid0BBVVrZWTV0cwilbrGmXVsny4t5i1io4sTHVOOcsGJjermaP
 bQFg==
X-Gm-Message-State: AOAM533d2/c/lLzsFoSfAWuf6WO0K3++i6MpFvuXiWv/yJlCNvNfWrf5
 pYYLhOjGmuRQoAtdz0BMgj1Euw==
X-Google-Smtp-Source: ABdhPJxriUDnleNU9MZcmnzjjrOm3PoiDDlX6f3m8a9tRoYYm4aIv0fWu7awhi65a6onyI/A3229GQ==
X-Received: by 2002:a05:600c:294c:: with SMTP id
 n12mr3463963wmd.66.1606304490874; 
 Wed, 25 Nov 2020 03:41:30 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id u7sm4357558wmb.20.2020.11.25.03.41.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Nov 2020 03:41:30 -0800 (PST)
Subject: Re: drivers/soundwire/qcom.c:767: undefined reference to `slimbus_bus'
To: Vinod Koul <vkoul@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
References: <202011030351.iq9CBMO3-lkp@intel.com>
 <e0d74391-18ae-0493-b8a1-cbeb6f00bde8@infradead.org>
 <20201125055155.GD8403@vkoul-mobl>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c0d24710-b2c6-aff0-c28a-fe276dd7eb46@linaro.org>
Date: Wed, 25 Nov 2020 11:41:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201125055155.GD8403@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 moderated for non-subscribers <alsa-devel@alsa-project.org>,
 kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 Jonathan Marek <jonathan@marek.ca>, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 25/11/2020 05:51, Vinod Koul wrote:
> Hi Randy,
> 
> On 04-11-20, 19:32, Randy Dunlap wrote:
>> On 11/2/20 11:47 AM, kernel test robot wrote:
>>> All errors (new ones prefixed by >>):
>>>
>>>     or1k-linux-ld: drivers/soundwire/qcom.o: in function `qcom_swrm_probe':
>>>>> drivers/soundwire/qcom.c:767: undefined reference to `slimbus_bus'
>>>>> or1k-linux-ld: drivers/soundwire/qcom.c:771: undefined reference to `slimbus_bus'
>>>
>>> 09309093d5e8f87 Jonathan Marek       2020-09-08  770  #if IS_ENABLED(CONFIG_SLIMBUS)
>>> 02efb49aa805cee Srinivas Kandagatla  2020-01-13 @771  	if (dev->parent->bus == &slimbus_bus) {
>>> 5bd773242f75da3 Jonathan Marek       2020-09-05  772  #else
>>> 5bd773242f75da3 Jonathan Marek       2020-09-05  773  	if (false) {
>>> 5bd773242f75da3 Jonathan Marek       2020-09-05  774  #endif
>>
>> config SOUNDWIRE_QCOM
>> 	tristate "Qualcomm SoundWire Master driver"
>> 	imply SLIMBUS
>> 	depends on SND_SOC
>>
>> The kernel config that was attached has:
>> CONFIG_SOUNDWIRE_QCOM=y
>> CONFIG_SLIMBUS=m
>>
>> I expected that "imply" would make SLIMBUS=y since SOUNDWIRE_QCOM=y,
>> but I guess that's not the case. :(
>>
>> Any ideas about what to do here?
> 
> Sorry to have missed this earlier. I did some digging and found the
> Kconfig code to be correct, but not the driver code. Per the
> Documentation if we are using imply we should use IS_REACHABLE() rather
> than IS_ENABLED.
> 
> This seems to take care of build failure for me on arm64 and x64 builds.
> 
> Can you confirm with below patch:
> 
> ---><8---
> 
> From: Vinod Koul <vkoul@kernel.org>
> Date: Wed, 25 Nov 2020 11:15:22 +0530
> Subject: [PATCH] soundwire: qcom: Fix build failure when slimbus is module
> 
> Commit 5bd773242f75 ("soundwire: qcom: avoid dependency on
> CONFIG_SLIMBUS") removed hard dependency on Slimbus for qcom driver but
> it results in build failure when:
> CONFIG_SOUNDWIRE_QCOM=y
> CONFIG_SLIMBUS=m
> 
> drivers/soundwire/qcom.o: In function `qcom_swrm_probe':
> qcom.c:(.text+0xf44): undefined reference to `slimbus_bus'
> 
> Fix this by using IS_REACHABLE() in driver which is recommended to be
> sued with imply.
> 
> Fixes: 5bd773242f75 ("soundwire: qcom: avoid dependency on CONFIG_SLIMBUS")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Thanks Vinod,

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
>   drivers/soundwire/qcom.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index fbca4ebf63e9..6d22df01f354 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -799,7 +799,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	data = of_device_get_match_data(dev);
>   	ctrl->rows_index = sdw_find_row_index(data->default_rows);
>   	ctrl->cols_index = sdw_find_col_index(data->default_cols);
> -#if IS_ENABLED(CONFIG_SLIMBUS)
> +#if IS_REACHABLE(CONFIG_SLIMBUS)
>   	if (dev->parent->bus == &slimbus_bus) {
>   #else
>   	if (false) {
> 

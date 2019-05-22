Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1404C2688F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 18:44:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96DCB1681;
	Wed, 22 May 2019 18:43:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96DCB1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558543450;
	bh=+rQcmis2r4fDnQvShDCpezNMfmrbAwO50xoQGtBKWUA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YoMm+0mCdnNIarl5jCWVeOyyj9RLRTpqeAZtg+wl0IWsLzFKbLAfF5gRUrik6LvhT
	 /ZYjKVdzWFXz4zrQevf0o9dQ1b5RPzMKfexBifS3Ki9c8EmntAtt/BkVjKximLrde2
	 8U7tdt9m+eN3/9i4rpGcfDRgbyVqQafb8VB21VDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DD8CF8963E;
	Wed, 22 May 2019 18:41:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15F12F8963E; Wed, 22 May 2019 18:41:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8944F8962C
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 18:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8944F8962C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XcyY4WXX"
Received: by mail-wr1-x442.google.com with SMTP id l2so3053894wrb.9
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sbhOGAbtcKTzipHe+6ukR9cpuuf9VG40HYXxIntAhB0=;
 b=XcyY4WXXFw70B9fdO+rkpFJ0hwLYh0XJOkRtNcSIfeld6DIqXrNxovSmn8Q9tnmkF3
 RNiHDgSrUlvgyI9ZSGm+eLQWlKCGbfA8WC3cVFXmwJ76xqua3sWViYTJcQYR1dKJEkXe
 XCxtkSwMcGm9sWtCqMYbtaHnl+0dosnu9DNTl3QAKAe70N4vUq6uyHLog76qvyHWo4Yx
 7Gi917ue1ON4dIctHcyvcnQTrxjgl8tHLALSm0d6pQeec/kv41D2cnzNOtJvGPZAaxdv
 z4D3Cn1BwzaMohN88kEQx01Pl/82Bn4O+FDnS9oKLtxrV472EkHZzq6J75DcjsAGi8Kw
 FlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sbhOGAbtcKTzipHe+6ukR9cpuuf9VG40HYXxIntAhB0=;
 b=cqSpeM2yR77AGMX8PBUuduUmmfL+GzxuDNjTxK00pxgkBGljoXYt2kB4EsIkN7BASk
 Jr7LITsCOHsIFluNolqSPSLuLRYa+J4KPWldnxIBn+CORkl1U/E3H4ab8rJi5FCONEIc
 qxJXXZmmzzajSwe2xG81IBvv+LK+bmzcQYBt6HgvcyFO7ahpBOBgMK0bFnZyneX4WFwQ
 sZtP4IJ9jM8MVgW/BEY8Lw7isjlvDjvnN6vfz05RmMuZcRHijHnsmQcqE4dtK2qXcTAf
 mLuXXatCEN7eXjBxWC1H66rMm8EziidWbUT9IWzeKH7EGdAVub73cbFbqM3Bqb0S+kAQ
 LfXQ==
X-Gm-Message-State: APjAAAXE0lvJA6BKLOAEVjeAeHIzOrUsSVmQy/8ZxfWSqVfHqIyMNMBj
 0d4r4m15ZbmstZoaCF2EPKmLEg==
X-Google-Smtp-Source: APXvYqyabt9t6mvb2Rbgd5JPZXUcoQm3HtZAru2XT9jUT1pGAQfCl/23vVC7beDnUJgJQcEXJy0ucA==
X-Received: by 2002:adf:8307:: with SMTP id 7mr44588183wrd.86.1558543305870;
 Wed, 22 May 2019 09:41:45 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id z4sm26594740wru.69.2019.05.22.09.41.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 09:41:45 -0700 (PDT)
To: vkoul@kernel.org
References: <20190522162528.5892-1-srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <dd34d1ba-b8b6-7882-3e71-d036a97f41df@linaro.org>
Date: Wed, 22 May 2019 17:41:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522162528.5892-1-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] soundwire: stream: fix bad unlock balance
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



On 22/05/2019 17:25, Srinivas Kandagatla wrote:
> This patch fixes below warning due to unlocking without locking.
> 
>   =====================================
>   WARNING: bad unlock balance detected!
>   5.1.0-16506-gc1c383a6f0a2-dirty #1523 Tainted: G        W
>   -------------------------------------
>   aplay/2954 is trying to release lock (&bus->msg_lock) at:
>   do_bank_switch+0x21c/0x480
>   but there are no more locks to release!
> 
> Signed-off-by: Srinivas Kandagatla<srinivas.kandagatla@linaro.org>
> ---
>   drivers/soundwire/stream.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 544925ff0b40..d16268f30e4f 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -814,7 +814,8 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
>   			goto error;
>   		}
>   
> -		mutex_unlock(&bus->msg_lock);
> +		if (mutex_is_locked(&bus->msg_lock))
> +			utex_unlock(&bus->msg_lock);
Looks like I messed this up!

I will resend this one!

--srini
>   	}
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

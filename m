Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FDD13AACF
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:24:35 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AF3D182F;
	Mon, 13 Jan 2020 14:56:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AF3D182F
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B960EF8014B;
	Mon, 13 Jan 2020 14:55:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C13EF801EB; Mon, 13 Jan 2020 14:55:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C8E3F80149
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 14:55:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C8E3F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Yjenwt8S"
Received: by mail-wm1-x342.google.com with SMTP id t14so9727736wmi.5
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 05:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DAexp0d6B1bggExrbLo8mbWnNme1hkuMZzELpad3p0s=;
 b=Yjenwt8SkaxPzUogrVO5FY29DaaLnVj+Con+sfXWA52iiu3jYFRvhk23/oOQAbjM5A
 mS6n25FCQm/q3b87RdpqhYdpSMCPQwyEwZkQ2D1EBADRk+S0tpUPWXu4fufcMS5PU5UY
 FUofKRfDOhP23u19DU8URhLdVfgBPnV6CHHE09jZoQ6UNO4+MzpT8Xqmjn9DA+wgGZQg
 oABFeKPJmW7RvOqNWrUc1I6XWj9nEPa/7UcaMZZdhbdYXq1M0nRm8rUzywWyXRV+Fg5m
 JOZPS8AqLXxXSdGVM9YTgYnAF9eJhVpRArsaDBZi1K+1YH6vQDtP2JSiKvNpDIXtGF1n
 1vyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DAexp0d6B1bggExrbLo8mbWnNme1hkuMZzELpad3p0s=;
 b=I1Rc/NJwvssEGUyiiAWyK8CtB+UEcodMHTyXq/Jh4QTHYaMb454kUd6Vn0UEXnWikm
 Fmhmv894G1LBN/rScnMb8cQKo9ZDAv0ln6GS0+UqYoA2AUTLYxWdeRXIDPBMJMiNaezx
 lzFFnhHhHiUwMQjx5dlCFUJ3HdbGgpIBszAmkjaxiakhy2hSvIKLDcNKV8oeMGAY1oXT
 9tbkU0En40FnG7v8JtJHoINWST57eiBmIm0PjJRQ0OuHI7Zrf5idjCUplxijgb/tiZJE
 R5hNo+vQQv8c1mkjAQydUEQztIfRcnTQ4DGDe+UPs/fx6B9gfkVxfxYPnjsVC0mRuz53
 I00Q==
X-Gm-Message-State: APjAAAXeBICCW/fQmmsPJdzZo8OYL3tayWrCTcADhSXx/H+JRpCzO82Q
 5p7E9RclY+meocZybRyF2USb0Q==
X-Google-Smtp-Source: APXvYqyssYiZoXQMR1s5H4JSjLQn/oQDa+GNGF1ugu2JIwep93zO18DDwRwzcWkQ3uNWr6kefCHUNQ==
X-Received: by 2002:a05:600c:290f:: with SMTP id
 i15mr20798577wmd.115.1578923722519; 
 Mon, 13 Jan 2020 05:55:22 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id 18sm13785230wmf.1.2020.01.13.05.55.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jan 2020 05:55:21 -0800 (PST)
To: Stephan Gerhold <stephan@gerhold.net>
References: <20200105102753.83108-1-stephan@gerhold.net>
 <33e68247-ff11-6c0c-b91c-9b406f9607cd@linaro.org>
 <20200113131034.GA12166@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c977d98a-23be-983e-3d5a-c97ee53ce330@linaro.org>
Date: Mon, 13 Jan 2020 13:55:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200113131034.GA12166@gerhold.net>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [alsa-devel] [PATCH] ASoC: msm8916-wcd-digital: Reset RX
 interpolation path after use
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



On 13/01/2020 13:10, Stephan Gerhold wrote:
> On Mon, Jan 13, 2020 at 11:30:48AM +0000, Srinivas Kandagatla wrote:
>>
>>
>> On 05/01/2020 10:27, Stephan Gerhold wrote:
>>> For some reason, attempting to route audio through QDSP6 on MSM8916
>>> causes the RX interpolation path to get "stuck" after playing audio
>>> a few times. In this situation, the analog codec part is still working,
>>> but the RX path in the digital codec stops working, so you only hear
>>> the analog parts powering up. After a reboot everything works again.
>>>
>>> So far I was not able to reproduce the problem when using lpass-cpu.
>>>
>>> The downstream kernel driver avoids this by resetting the RX
>>> interpolation path after use. In mainline we do something similar
>>> for the TX decimator (LPASS_CDC_CLK_TX_RESET_B1_CTL), but the
>>> interpolator reset (LPASS_CDC_CLK_RX_RESET_CTL) got lost when the
>>> msm8916-wcd driver was split into analog and digital.
>>>
>>> Fix this problem by adding the reset to
>>> msm8916_wcd_digital_enable_interpolator().
>>>
>>> Fixes: 150db8c5afa1 ("ASoC: codecs: Add msm8916-wcd digital codec")
>>> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>>
>> Thanks for the patch and testing it with QDSP6.
>>
>>> ---
>>> Tested on msm8916-samsung-a5u:
>>>     - qdsp6 does no longer stop working after playing audio a few times
>>>     - lpass-cpu is still working fine (no difference)
>>> ---
>>>    sound/soc/codecs/msm8916-wcd-digital.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/sound/soc/codecs/msm8916-wcd-digital.c b/sound/soc/codecs/msm8916-wcd-digital.c
>>> index 58b2468fb2a7..09fccacadd6b 100644
>>> --- a/sound/soc/codecs/msm8916-wcd-digital.c
>>> +++ b/sound/soc/codecs/msm8916-wcd-digital.c
>>> @@ -586,6 +586,12 @@ static int msm8916_wcd_digital_enable_interpolator(
>>>    		snd_soc_component_write(component, rx_gain_reg[w->shift],
>>>    			      snd_soc_component_read32(component, rx_gain_reg[w->shift]));
>>>    		break;
>>> +	case SND_SOC_DAPM_POST_PMD:
>>
>> We should do this in SND_SOC_DAPM_PRE_PMU rather than in power down
>> sequence.
>>
> 
> Thanks for the suggestion! Any particular reason for this?
> 
> I used earlier versions of your msm8916-wcd patch series and the
> downstream driver as a base, and it does this in POST_PMD:

Normally I would have expected that we reset as part of up sequence and 
continue rather than during down.
Both of them will work!
For consistency reasons as we did this in down path for TX.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Thanks,
srini
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

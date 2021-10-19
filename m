Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B464337B9
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 15:48:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A364F169A;
	Tue, 19 Oct 2021 15:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A364F169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634651326;
	bh=LkZ0y2hMgPd3W380GZwsVw1aL9jTFKXU9eiwZJ9RkT0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jo30cDBejoMXEi8m/DhEXpx8atfkeouAaiYKUW4CMS8G2Lh1FGarxHDuN7cqkiPSX
	 OCn7n7hquXih8ra3OYdXNIrEK6zDw/nD0Yu0GMr7pIbnf7O0p76Z3US97e2xsHtppt
	 evHJloZXLogHFe9DLqs89KfJKQRTh67Jt8n27NB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28065F8019B;
	Tue, 19 Oct 2021 15:47:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2759BF80240; Tue, 19 Oct 2021 15:47:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F8AFF80082
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 15:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F8AFF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VYJ9XI/x"
Received: by mail-wr1-x432.google.com with SMTP id i12so47767836wrb.7
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 06:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zOpjjqWh4RKFubSe9AsWzWR8dfmnNsfnQYnDdU7OniM=;
 b=VYJ9XI/xaWN9Yy6GOYJPd+BPtK62ZpNoVNKMH84MqJcJouT4goFsTy6DF278DFJ4+Q
 6pTqNTzVrzQZ3/12/mW3uwTIKNBjpbPCsc5qaQz1r8rt/6SwWTUQz5jeeXXPStgmLZUn
 yFwCja5WjwC7asT5yhnUroAsqG9hG/M21KmTbbkH5QsBVV5cMX1OMbkrfWqW477Y35Df
 D6Gc01MBQ9I5ldgZfUkMxCtZ3ns6kXY+o3QFxX3lCuVk2+nU9xHaDUpgY210qnojBJtK
 lWarIct7wDN/7FjphaBgFmC+qS6UfFjTiSMGn7gqQJFRe/3rVjZZ8sB3kneeD46pfbIr
 6i2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zOpjjqWh4RKFubSe9AsWzWR8dfmnNsfnQYnDdU7OniM=;
 b=FAd9b5/edxjkL6p+fD3hJ+x0AtqVSeg+JTj8Aq8ZLiSlJDZZ2SXrmFi68ikPpW7w+J
 HP/toRqmynKkA+PpHpnAvNaAMtH5vjWOL/kwtR3x6rIsZ4DLaBws5j7rxnPoNPeIpWZ9
 mL2sZvr6oKWtuOXwYheeLmEJ+3vwjiIDVC9YQA2XqnZVoBQozoVxvCVPfiqr0exmsHzI
 3lbzSmeqAFUUyoD3Ie08E3Bk+h3yTGT4z7kVZB+T7rmKJ1GQqEHnuQuZHpqS7i3Gt8oQ
 R/+07QJDF0iFetXQ9E4SPUuGav3kl8zuoStGLaRHg9XddGFwf11MQ4gc8PuzcKrNlVxR
 MAFw==
X-Gm-Message-State: AOAM531HbCMuyMlaqt1e4aHzJj3Lg/1onw4J6VzaJpxwVkm8srEhnIzD
 5D7eeSMmPB0S2s+wZEb/3L2tnw==
X-Google-Smtp-Source: ABdhPJyKgSgSNsH0UdkObuwMPYZqgDLXJM5BiXzacKvhMe97dMMcbs9Ekgb0Mv2xOMRvvcUVzCnChQ==
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr42935319wry.273.1634651235814; 
 Tue, 19 Oct 2021 06:47:15 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id i188sm2360130wmi.5.2021.10.19.06.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 06:47:15 -0700 (PDT)
Subject: Re: [PATCH] ASoC: codecs: Fix WCD_MBHC_HPH_PA_EN usage
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 yang.lee@linux.alibaba.com
References: <988948f7f266aa00698704687537335b7e6a67b2.1634455711.git.christophe.jaillet@wanadoo.fr>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3ff34912-19e6-4d52-e9da-0e78ceb1d2ff@linaro.org>
Date: Tue, 19 Oct 2021 14:47:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <988948f7f266aa00698704687537335b7e6a67b2.1634455711.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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



On 17/10/2021 08:31, Christophe JAILLET wrote:
> 'hphpa_on' is known to be false, so the if block at the end of the function
> is dead code.

Yes, this is a dead code we should remove it.

This code was part of moisture detection logic which is not enabled in 
upstream code yet.

During Moisture detection if the PA is on then we switch it off and do 
moisture measurements and at the end of the function we restore the 
state of PA.

> 
> Turn it into a meaningful code by having 'hphpa_on' be static. Use is as a
> flip-flop variable.

No, It does not.

Have you even tested this patch in anyway?

> 
> Fixes: 0e5c9e7ff899 ("ASoC: codecs: wcd: add multi button Headset detection support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> The purpose of this patch is not to be correct (!) but to draw attention
> on several points:
>     - in 'wcd_mbhc_adc_hs_rem_irq()', the "if (hphpa_on)" path is dead code
>       because 'hphpa_on' is known to be false
>     - What is this magic number '3'?
>       All 'wcd_mbhc_read_field()' look for 0 or non-0
>     - a 'mutex_[un]lock()' in an IRQ handler looks spurious to me
> 
> Instead of this (likely broken) patch, it is likely that something is
> missing elsewhere. Maybe in 'wcd_mbhc_adc_hs_ins_irq()'.
> I also guess that 'hphpa_on' should be read for somewhere else.
> ---
>   sound/soc/codecs/wcd-mbhc-v2.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
> index 405128ccb4b0..783d8c35bc1b 100644
> --- a/sound/soc/codecs/wcd-mbhc-v2.c
> +++ b/sound/soc/codecs/wcd-mbhc-v2.c
> @@ -1176,7 +1176,7 @@ static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
>   	struct wcd_mbhc *mbhc = data;
>   	unsigned long timeout;
>   	int adc_threshold, output_mv, retry = 0;
> -	bool hphpa_on = false;
> +	static bool hphpa_on = false;
>   
>   	mutex_lock(&mbhc->lock);
>   	timeout = jiffies + msecs_to_jiffies(WCD_FAKE_REMOVAL_MIN_PERIOD_MS);
> @@ -1212,6 +1212,9 @@ static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
>   
>   	if (hphpa_on) {
>   		hphpa_on = false;
> +		wcd_mbhc_write_field(mbhc, WCD_MBHC_HPH_PA_EN, 0);
> +	} else {
> +		hphpa_on = true;
>   		wcd_mbhc_write_field(mbhc, WCD_MBHC_HPH_PA_EN, 3);

Just remove this dead code.

--srini
>   	}
>   exit:
> 

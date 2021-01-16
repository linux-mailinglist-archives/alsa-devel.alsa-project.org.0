Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D912F8DB3
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Jan 2021 17:51:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B33D17F3;
	Sat, 16 Jan 2021 17:50:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B33D17F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610815868;
	bh=41tmtEkrpERxetlnp1P1AH3OO8qHRYkrv10W1ReCXow=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QQQbkqsSlbAsqaXGl0xz1Ruw4xLV/FCehTeFs2HYiHrKDpHxDILuvbm2F0cY7DuKI
	 78zd/09UN/yvrmZtUdZooSjuSGBfIO5ryVFCyhscL+3Y0h8jLj4sS25rGgMr0ywIpR
	 MPgMXEhdJYTYIzJ6gACSIYisv6+KpCRw4wO0YJFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 164DCF8026F;
	Sat, 16 Jan 2021 17:49:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2B04F8025E; Sat, 16 Jan 2021 17:49:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F008F80132
 for <alsa-devel@alsa-project.org>; Sat, 16 Jan 2021 17:49:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F008F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="SZ9BDX5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610815759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qupr++fTHbnNIAJqQF6SX3UmT2+7rap26aUJDYVRflA=;
 b=SZ9BDX5BedB3/DAK/jwZitQjSU1udA0iICxGyqExznELRuHNP/3IQ6Vby4V1+uVkj4t1oM
 EJPBB1IjEMjjZyUnQvPr9ph0wQjdyIlbi91lAytUTpRctNVGhoBbuD4IPFQqIfV6QPABNV
 QvJCvxV+ozy/wl9Dw/cOrVEGzZDLbyA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-kN0VQdZCPDifh7MY6GgMIg-1; Sat, 16 Jan 2021 11:49:16 -0500
X-MC-Unique: kN0VQdZCPDifh7MY6GgMIg-1
Received: by mail-ed1-f71.google.com with SMTP id dh21so5497686edb.6
 for <alsa-devel@alsa-project.org>; Sat, 16 Jan 2021 08:49:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qupr++fTHbnNIAJqQF6SX3UmT2+7rap26aUJDYVRflA=;
 b=iLL6ZbR6mmXCJmHqg0Qim6CnAH+wboNN55mBrTfgcxVlqYAaBmxYlm5/z4TGiKWw21
 95E8Uxpso0t6lH+sShlQ4Z1sxKR+8QOjdprxYBF5x3bJt37wdWt7dCqQlkOW56v+m68F
 bZUE1pgvDjqZ6ljAf8CvwDiWl/sSjRkoxopgQ1f44mfVkjWfYOoLNIkWQUsvRvNUcJch
 Al6ergopAwGjQr5/jmaNLG3Zgsoat4ADAdGu9LbmTToqQPeG+gbc84pRLtZZAp6/oVAH
 1op4FZoSjnqQkmTDZsWMiGMSo13CZ7ECkEjfPPPEnNSSfWAJxK8gw2ix+79AtllN5de+
 lTfQ==
X-Gm-Message-State: AOAM531aUZYQuP0LVleonj/BEaOhwlrFvb05FsCLjF86SwrqHju2ArZa
 0AqoKDC87XSHx/n/MQR4IZPMHqzh/2Ruv+OnQItqGCbdmwQ/FrpmfU46mkSJFM7ONU39OTJf8HO
 OZztI3cifBPHWNCcegZHHWyPP/y2weo64SP+Xvb205N/Q1vpsrllS+HCRXz/X6wIhHmrZTRr0vJ
 0=
X-Received: by 2002:a50:eb44:: with SMTP id z4mr13379032edp.167.1610815755043; 
 Sat, 16 Jan 2021 08:49:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzi8DmB+mYK6lnksxQD6SeOrVQ+fX6wIJSvoCcFLD8Pen7ag/50Err0kNpfKGsWZEtuts3rbg==
X-Received: by 2002:a50:eb44:: with SMTP id z4mr13379012edp.167.1610815754745; 
 Sat, 16 Jan 2021 08:49:14 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id i13sm7727343edu.22.2021.01.16.08.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 08:49:14 -0800 (PST)
Subject: Re: [PATCH 13/14] ASoC: Intel: bytcr_wm5102: Add machine driver for
 BYT/WM5102
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-14-hdegoede@redhat.com>
 <20201229135836.GO9673@ediswmail.ad.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6d881b08-2511-5dcf-0f88-4f54b937c967@redhat.com>
Date: Sat, 16 Jan 2021 17:49:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201229135836.GO9673@ediswmail.ad.cirrus.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Mark Brown <broonie@kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Lee Jones <lee.jones@linaro.org>
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

Hi,

Thank you for the review.

On 12/29/20 2:58 PM, Charles Keepax wrote:
> On Sun, Dec 27, 2020 at 10:12:31PM +0100, Hans de Goede wrote:
>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>
>> Add a new ASoc Machine driver for Intel Baytrail platforms with a
>> Wolfson Microelectronics WM5102 codec.
>>
>> This is based on a past contributions [1] from Paulo Sergio Travaglia
>> <pstglia@gmail.com> based on the Levono kernel [2] combined with
>> insights in things like the speaker GPIO from the android-x86 android
>> port for the Lenovo Yoga Tablet 2 1051F/L [3].
>>
>> [1] https://patchwork.kernel.org/project/alsa-devel/patch/593313f5.3636c80a.50e05.47e9@mx.google.com/
>> [2] https://github.com/lenovo-yt2-dev/android_kernel_lenovo_baytrail/blob/cm-12.1/sound/soc/intel/board/byt_bl_wm5102.c
>> [3] https://github.com/Kitsune2222/Android_Yoga_Tablet_2-1051F_Kernel
>>
>> The original machine driver from the Android ports was a crude modified
>> copy of bytcr_rt5640.c adjusted to work with the WM5102 codec.
>> This version has been extensively reworked to:
>>
>> 1. Remove all rt5640 related quirk handling. to the best of my knowledge
>> this setup is only used on the Lenovo Yoga Tablet 2 series (8, 10 and 13
>> inch models) which all use the same setup. So there is no need to deal
>> with all the variations with which we need to deal on rt5640 boards.
>>
>> 2. Rework clock handling, properly turn off the FLL and the platform-clock
>> when they are no longer necessary and don't reconfigure the FLL
>> unnecessarily when it is already running. This fixes a number of:
>> "Timed out waiting for lock" warnings being logged.
>>
>> 3. Add the GPIO controlled Speaker-VDD regulator as a DAPM_SUPPLY
>>
>> This only adds the machine driver and ACPI hooks, the BYT-CR detection
>> quirk which these devices need will be added in a separate patch.
>>
>> Co-authored-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
> 
> Just a couple really minor comments.
> 
>> +static int byt_wm5102_prepare_and_enable_pll1(struct snd_soc_dai *codec_dai, int rate)
>> +{
>> +	struct snd_soc_component *codec_component = codec_dai->component;
>> +	int sr_mult = ((rate % 4000) == 0) ?
>> +		(WM5102_MAX_SYSCLK_4K / rate) :
>> +		(WM5102_MAX_SYSCLK_11025 / rate);
>> +	int ret;
>> +
>> +	/* Reset FLL1 */
>> +	snd_soc_dai_set_pll(codec_dai, WM5102_FLL1_REFCLK, ARIZONA_FLL_SRC_NONE, 0, 0);
>> +	snd_soc_dai_set_pll(codec_dai, WM5102_FLL1, ARIZONA_FLL_SRC_NONE, 0, 0);
>> +
>> +	/* Configure the FLL1 PLL before selecting it */
>> +	ret = snd_soc_dai_set_pll(codec_dai, WM5102_FLL1, ARIZONA_CLK_SRC_MCLK1,
>> +				  MCLK_FREQ, rate * sr_mult);
>> +	if (ret) {
>> +		dev_err(codec_component->dev, "Error setting PLL: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	ret = snd_soc_component_set_sysclk(codec_component, ARIZONA_CLK_SYSCLK,
>> +					   ARIZONA_CLK_SRC_FLL1, rate * sr_mult,
>> +					   SND_SOC_CLOCK_IN);
>> +	if (ret) {
>> +		dev_err(codec_component->dev, "Error setting ASYNCCLK: %d\n", ret);
> 
> Error message should say SYSCLK not ASYNCCLK.

Fixed for v2.

> 
>> +		return ret;
>> +	}
>> +
>> +	ret = snd_soc_component_set_sysclk(codec_component, ARIZONA_CLK_OPCLK, 0,
>> +					   rate * sr_mult, SND_SOC_CLOCK_OUT);
>> +	if (ret) {
>> +		dev_err(codec_component->dev, "Error setting OPCLK: %d\n", ret);
>> +		return ret;
>> +	}
> 
> OPCLK is a clock that can be outputted on the CODECs GPIOs. Is
> that being used to clock some external component? If so it should
> be added to the DAPM graph, if not you might as well remove this
> call.

I copy pasted this from the work done for Android X86 to get sound to
work on the Lenovo Tablet 2 series:
https://github.com/Kitsune2222/Android_Yoga_Tablet_2-1051F_Kernel

I believe when you say it is unnecessary, so I will remove it for v2
(and test without this present to make sure it is really unnecessary).

> 
>> +
>> +	ret = snd_soc_dai_set_sysclk(codec_dai, ARIZONA_CLK_SYSCLK,
>> +				     rate * 512, SND_SOC_CLOCK_IN);
>> +	if (ret) {
>> +		dev_err(codec_component->dev, "Error setting clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
> 
> The rate you set here doesn't actually matter, on wm5102 this
> just links the DAI to a specific clock domain and as they all
> default to SYSCLK you can omit this call if you want. Although no
> harm is caused by leaving it in.

I'm going to leave this in as I prefer to be explicit about things like
this, rather then relying on defaults.

Regards,

Hans


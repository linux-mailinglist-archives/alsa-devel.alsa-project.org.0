Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 751052F20D4
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 21:31:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CA661751;
	Mon, 11 Jan 2021 21:30:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CA661751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610397084;
	bh=9Pm4rCC+sqUb4lyvDSk8VEmesWovQ/lZhQLOo9ano0A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e+/FS9anQ/JypjpDHS+8ZPSxzjTtjFvlQ7YB1DeS4YpA6GqXvV/jszAo68NMXxwmH
	 B3+rp5sMsCfC+kc5rWR5gQAjHI4Bj/CPiDiyM+WNqzMGVX3LouAg/USHwM4T1M/ZLC
	 ErMvmIQCBa4yArc98LMBX997UQgB/jIDFo56b4SU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91797F804CA;
	Mon, 11 Jan 2021 21:29:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD6C1F8026D; Mon, 11 Jan 2021 21:28:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D880F800BE
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 21:28:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D880F800BE
IronPort-SDR: JIXwqjwvH+IcNBpSOe3Tq2zi2TgKfC2Z9A08Lg/3OLdiEcOqbBFueToq9AHbOirIEcRSAZ5PjY
 Ycx3pTofSdnA==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="262712514"
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="262712514"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 12:28:39 -0800
IronPort-SDR: v9xqixeOBz2f8oC/DhiwiKLZhaoneHTa9DPlR/LcDCVlgenEO/nzD/c1u5c6muexJAQwe9xvY9
 fGYHtIf781LQ==
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="344995381"
Received: from gkbech1x-mobl.amr.corp.intel.com (HELO [10.212.87.85])
 ([10.212.87.85])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 12:28:37 -0800
Subject: Re: [PATCH v2 2/2] ASoC: rt715:add Mic Mute LED control support
To: Perry Yuan <Perry.Yuan@dell.com>, oder_chiou@realtek.com, perex@perex.cz, 
 tiwai@suse.com
References: <20201228133831.17464-1-Perry_Yuan@Dell.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a12075b1-09f3-a993-eace-008224ca5f52@linux.intel.com>
Date: Mon, 11 Jan 2021 12:07:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201228133831.17464-1-Perry_Yuan@Dell.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 broonie@kernel.org, lgirdwood@gmail.com,
 Limonciello Mario <Mario.Limonciello@dell.com>
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




> @@ -268,6 +269,7 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
>   	unsigned int reg2 = mc->rreg;
>   	unsigned int reg = mc->reg;
>   	unsigned int max = mc->max;
> +	unsigned int val0, val1;
>   	int err;
>   
>   	val = ucontrol->value.integer.value[0];
> @@ -286,7 +288,22 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
>   		if (err < 0)
>   			return err;
>   	}
> -
> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
> +	/* Privacy LED Trigger State Changed by muted/unmute switch */
> +	if (mc->invert) {
> +		val0 = ucontrol->value.integer.value[0];
> +		val1 = ucontrol->value.integer.value[1];
> +		if (val0 == 1 && val1 == 1) {
> +			rt715->micmute_led = LED_OFF;
> +			ledtrig_audio_set(LED_AUDIO_MICMUTE,
> +					rt715->micmute_led ? LED_ON : LED_OFF);
> +		} else if (val0 == 0 && val1 == 0) {
> +			rt715->micmute_led = LED_ON;
> +			ledtrig_audio_set(LED_AUDIO_MICMUTE,
> +					rt715->micmute_led ? LED_ON : LED_OFF);
> +		}
> +	}
> +#endif

Should this be activated for specific DMI quirks? This driver is used in 
non-Dell platforms (I am thinking of Intel RVPs or Realtek 
daughterboards), I am not sure if a build-time behavior change makes sense.

Or conversely could we just set the LEDs unconditionally if doing so is 
harmless?

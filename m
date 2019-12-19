Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0EF1265E9
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 16:40:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACFDA15F9;
	Thu, 19 Dec 2019 16:39:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACFDA15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576770049;
	bh=p36TlPWzzdn0w4fJX0ny47rkQhxrF2tRlFGk6V7B3EI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NcFuY9aX11pK8cWzUKZ2xeYsfBYVxnGu99kAR5DprXQxR8xgZfRBnkydJrIB4fQIL
	 opnEAMHKhhdtisJNheZGiNpxrLiigqKZdKtwbcXY+AU+3qfFgy8s3D7JVnZi3+gIcm
	 L8R+qecxeB+WbXwV2NCCJjplcYHqH66MK/eU/nzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2829F80253;
	Thu, 19 Dec 2019 16:39:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5311FF80234; Thu, 19 Dec 2019 16:39:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A33FF8014F
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 16:38:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A33FF8014F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SZV0wu1S"
Received: by mail-wm1-x344.google.com with SMTP id q9so5896119wmj.5
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 07:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gfJLH13aeAcyvQ7Kx5511L28MaewV9aIWDTXh+jO5j8=;
 b=SZV0wu1SD2kvosvTdJoSfNWwM+s0VWXzEhU9NBNmv/L+G14tDW1jVtJ72tIGvdFoMd
 F5o3xjHuAFzn0E3fGLikI42TyyAjfecqLLSgcbWIFGVWugE/PfVkRWGync2i0hOD2wYc
 /E7d8K4YPqfAGWDCYq8pjQZhiBzo1nR4lnkNctzo2dkhWx4/1OtsWhimseG9ZLkHV8xM
 UEXfW9zBbzeO3ZDeWE89lhYJNpBYDnmBwKCgN0wL399p+X9bPVmRp9pxexIMs9q/HtbO
 8VlycbH63EWUSS3aRocAnsDzZay5dcY3Lzl/4KY9apO6e0BVkFWdw9f22v9y1g2eMHSs
 kcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gfJLH13aeAcyvQ7Kx5511L28MaewV9aIWDTXh+jO5j8=;
 b=Y1a0wSmJYZPBsi5bEoZnK2coP8XuPchh5FkT/rGcv99c0qbhs9kyDiQuri01ELhkd6
 0ZSXaMuW8lA5tFl7Dy3RpnXrKjGUuRfUrzE42L1VhFZbs9qO19YCYal3vN4k3eJEpEX8
 S5iqlrmIdSYY0ffAjqYXsacVUl0AD+RauIYuTQX+lQdZbvYuq0+v61Xlv7z786DWOspY
 QvDQXCpH5MA6cTOPdp4aa6dPPvVkeLMw92KEkll4rx2VLu2+5KDmEKvU37gNTZ21GCby
 HECl1sFk9ob34MCzxmrG0g8QWLCV1TEmPth7IlhZfIAX7gggdqRF8woE9OWJYxUed2bs
 VcAA==
X-Gm-Message-State: APjAAAWq2PVRTka1LjaBf2VqW6Avlauj1iPq5lUmdjG1MJ4Pd39rPUtC
 0jaex0X0jyy8UnlULUXuWxrd9g==
X-Google-Smtp-Source: APXvYqwa2SP0/8kz9WwitH/ZG+ABo+DY/CIgmwFIM1DnR2yBWrn8hIsylEu1TIg3GIctPgBBENMTBQ==
X-Received: by 2002:a1c:9602:: with SMTP id y2mr10673283wmd.23.1576769937958; 
 Thu, 19 Dec 2019 07:38:57 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id g17sm6328719wmc.37.2019.12.19.07.38.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Dec 2019 07:38:57 -0800 (PST)
To: Mark Brown <broonie@kernel.org>
References: <20191219100328.14850-1-srinivas.kandagatla@linaro.org>
 <20191219100328.14850-3-srinivas.kandagatla@linaro.org>
 <20191219130421.GD5047@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <707ba0cf-fd8d-3442-5742-149d8a7ee4ac@linaro.org>
Date: Thu, 19 Dec 2019 15:38:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191219130421.GD5047@sirena.org.uk>
Content-Language: en-US
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org
Subject: Re: [alsa-devel] [PATCH v9 2/2] ASoC: codecs: add wsa881x amplifier
	support
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

Thanks for the review,

On 19/12/2019 13:04, Mark Brown wrote:
> On Thu, Dec 19, 2019 at 10:03:28AM +0000, Srinivas Kandagatla wrote:
> 
>> +#define WSA881X_PA_GAIN_TLV(xname, reg, shift, max, invert, tlv_array) \
>> +{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
>> +	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
>> +		 SNDRV_CTL_ELEM_ACCESS_READWRITE,\
>> +	.tlv.p = (tlv_array), \
>> +	.info = snd_soc_info_volsw, .get = snd_soc_get_volsw,\
>> +	.put = wsa881x_put_pa_gain, \
>> +	.private_value = SOC_SINGLE_VALUE(reg, shift, max, invert, 0) }
> 
> The get operation isn't going to work here...
> 
I agree, I will add some error reporting if it fails to set the 
requested volume.
>> +
>> +static struct reg_default wsa881x_defaults[] = {
>> +	{WSA881X_CHIP_ID0, 0x00},
> 
> Spaces around the { } please.
> 
Also will fix such instances.

>> +	unsigned int val = 0;
>> +
>> +	regmap_read(rm, WSA881X_CHIP_ID1, &wsa881x->version);
>> +	regmap_register_patch(wsa881x->regmap, wsa881x_rev_2_0,
>> +			      ARRAY_SIZE(wsa881x_rev_2_0));
>> +	/* Enable software reset output from soundwire slave */
>> +	regmap_update_bits(rm, WSA881X_SWR_RESET_EN, 0x07, 0x07);
>> +	/* Bring out of analog reset */
>> +	regmap_update_bits(rm, WSA881X_CDC_RST_CTL, 0x02, 0x02);
>> +	/* Bring out of digital reset */
>> +	regmap_update_bits(rm, WSA881X_CDC_RST_CTL, 0x01, 0x01);
> 
> Please add some blank lines before the comments for legiblity.
Sure will fix all such instances in the code.

> 
>> +static int wsa881x_put_pa_gain(struct snd_kcontrol *kc,
>> +			       struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *comp = snd_soc_kcontrol_component(kc);
>> +	struct wsa881x_priv *wsa881x = snd_soc_component_get_drvdata(comp);
>> +	struct soc_mixer_control *mc =
>> +			(struct soc_mixer_control *)kc->private_value;
>> +	int max = mc->max;
>> +	unsigned int mask = (1 << fls(max)) - 1;
>> +
>> +	/*
>> +	 * program actual register just before compander enable and ensure hw
>> +	 * sequence is followed
>> +	 */
>> +	wsa881x->pa_gain = (max - ucontrol->value.integer.value[0]) & mask;
>> +
>> +	return 0;
>> +}
> 
> ...this doesn't actually write the value to the register map but we're
> using the standard get operation to read the value so the readback will
> not show the new value until it happens to get written out to the chip.
> This will also silently ignore volume updates until whatever event
> triggers the write, I'd expect at least an error if we can't do a write
> while the relevant part of the chip is active.

I will add some error prints in case it fails to program the requested 
volume.

> 
>> +			usleep_range(1000, 1010);
>> +			wsa881x_ramp_pa_gain(comp, min_gain, max_gain);
> 
> The ramp function has exactly one user, may as well just inline it.
makes sense!

--srini

> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

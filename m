Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0FF2F9AF8
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 09:06:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19B7617EA;
	Mon, 18 Jan 2021 09:05:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19B7617EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610957160;
	bh=rk77lSxH9rnwujiBFo8G3SLcAUg+ENu1+sd1TKwGCE8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kFPOd1E+1ucMujFIHKiqZFgw2cP4Y+fYg9198ynu3Lpn19vPfb8qZwmhYi62K/cYt
	 8d7yjN9BDFmbTPAsDbFu9Jwpk4i3jT5n3K0xmMbtfAkuNKWqJAR1hORTqxAV+nsAgh
	 UOcVxIcg3TC9xZECaYhpIaY0sP/taC4fQZoH4Pp8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2932F804E0;
	Mon, 18 Jan 2021 09:02:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59179F8025E; Sat, 16 Jan 2021 16:50:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FE47F80132
 for <alsa-devel@alsa-project.org>; Sat, 16 Jan 2021 16:50:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FE47F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="plFPi22y"
Received: by mail-wm1-x330.google.com with SMTP id r4so10143893wmh.5
 for <alsa-devel@alsa-project.org>; Sat, 16 Jan 2021 07:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=x+00tIBf/QefUex9fblzjYl8TVeelPB225Pi420+hDY=;
 b=plFPi22y1+imtJRfUHti77svL+kZBuzp5qyZDcOiHMP2+n+0/Acj/PDpFpa7hrrOYR
 1SN5YXQUzXOr5+MEU2ZlVgYY9Ef03M66UNUpYv6+lkWybj7r/p4j/skU+gNomxyeZMrL
 ldAbJCAvC+fI9P7XIFu4aaDwyqNwZ9Q5JJ875Hrv+Xl6ZWN/trptb0ecxQ42yiO+ePTc
 u8gstUBtd89iHDiy+yqrr5mWK1MiSgq/UTjFZzsX75wm0AOGRuGnPd9KQcEbSzZidck5
 p3urffKVECdgsB0dvUbthXqOFTYsivgcDFddD6Ak9/NszbRcQWQRs3Pyn8nrMU9JvTkJ
 iUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=x+00tIBf/QefUex9fblzjYl8TVeelPB225Pi420+hDY=;
 b=ksewMQnh1o01qbUWUXi9EsoEUawGBxhwt/iXewAuABGSRPeUM2RQdnGJgMQT9oAeX5
 eCmsobvYHVdHi2VwDpKQ5CyFPdOQfgpVw+gfP1VoFFRY6pRdh8YoY0VjEjg3CyuIfKux
 +qxvG7lhCgtDePDldQkRqsE2WkK1POAdOklkjEl4ZQ8AzNOe6P0EqUhrDJhusU7Ftmiw
 rQ7hMDssdwLImns2wU3JXkPwSP/CmOqAI7psAsCDArPC+YKZYjXgqSInRVRwG9qWR2cj
 R5pTM8+S8VFRPhujwPn1g99O5hSQlPzZoouEYJINpBTxJ/TuwcAa4LIv7VxP+mq1BoWe
 1b9Q==
X-Gm-Message-State: AOAM533pYVQ/ZGTAkBaZMym+cvZTJ6gHigazASjhWpUQYHzYgxn5QWvC
 qeuPxS/gfVvbhEFNqQ6yj/I=
X-Google-Smtp-Source: ABdhPJwV1ftSvgQ9GSkbR7qmb2GHxkGVLRGKlny5KKMHQ3z0eLqDXCdkKL4jT9t79JwW8nifC8z4eA==
X-Received: by 2002:a7b:c115:: with SMTP id w21mr2300075wmi.114.1610812248994; 
 Sat, 16 Jan 2021 07:50:48 -0800 (PST)
Received: from [0.0.0.0] ([2a01:4f8:c17:e10a::1])
 by smtp.gmail.com with ESMTPSA id o8sm18256383wrm.17.2021.01.16.07.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 07:50:47 -0800 (PST)
Subject: Re: [PATCH v3 3/3] ASoC: rt715:add micmute led state control supports
To: Mark Brown <broonie@kernel.org>, Perry Yuan <Perry.Yuan@dell.com>
References: <20210112171814.5404-1-Perry_Yuan@Dell.com>
 <20210112175406.GF4646@sirena.org.uk>
From: Perry Yuan <perry979106@gmail.com>
Message-ID: <bd2aea87-2f91-2748-424b-50b3b6feb22b@gmail.com>
Date: Sat, 16 Jan 2021 23:50:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210112175406.GF4646@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 18 Jan 2021 09:02:51 +0100
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, mgross@linux.intel.com,
 Mario.Limonciello@dell.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, platform-driver-x86@vger.kernel.org, hdegoede@redhat.com
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

Hi Mark,
  Thanks for your review feedback.

On 2021/1/13 1:54, Mark Brown wrote:
> On Wed, Jan 13, 2021 at 01:18:14AM +0800, Perry Yuan wrote:
> 
>> Some new Dell system is going to support audio internal micphone
>> privacy setting from hardware level with micmute led state changing
>> When micmute hotkey pressed by user, soft mute will need to be enabled
>> firstly in case of pop noise, and codec driver need to react to mic
>> mute event to EC(embedded controller) notifying that SW mute is completed
>> Then EC will do the hardware mute physically within the timeout reached
> 
>> This patch allow codec rt715 driver to ack EC when micmute key pressed
>> through this micphone led control interface like hda_generic provided
>> ACPI method defined in dell-privacy micmute led trigger will be called
>> for notifying the EC that software mute has been completed
> 
> It feels like there's an abstraction problem here with this being hard
> coded in a specific CODEC driver.
> 

I will remove the CONFIG_DELL_PRIVACY ,because other vendors and other 
platforms maybe need to set their Mic mute led state when they enable 
soundwire and sof driver for audio function.
We can avoid hardcode in codec driver, indeed it is need for this new
soundwire & sof architecture of alsa.

>>   #include <linux/soundwire/sdw.h>
>> @@ -244,6 +245,7 @@ static int rt715_sdca_get_volsw(struct snd_kcontrol *kcontrol,
>>   	unsigned int max = mc->max;
>>   	int val;
>>   
>> +	pr_err("++++++rt715_sdca_get_volsw++\n");
>>   	val = snd_soc_component_read(component, mc->reg);
>>   	if (val < 0)
>>   		return -EINVAL;
> 
> This shouldn't be in the patch.
It is my mistake to leave the debug line here.
will be removed in next V4 .
> 
>> @@ -287,6 +291,18 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
>>   			return err;
>>   	}
>>   
>> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
>> +	/* dell privacy LED trigger state changed by muted/unmute switch */
>> +	if (mc->invert) {
>> +		if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1]) {
>> +			rt715->micmute_led = LED_OFF;
>> +		} else {
>> +			rt715->micmute_led = LED_ON;
>> +		}
>> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led);
>> +	}
>> +#endif
>> +
> 
> This doesn't look good.  There's nothing Dell specific here, and nothing
> about this is conditional on any sort of runtime detection of Dell
> systems, it's not obvious why this is conditional on DELL_PRIVACY or why
> we only report the state if the control is inverted.

I will remove the CONFIG_DELL_PRIVACY for the mic mute led operation is 
not only needed for dell platforms but also other Vendors all need to 
set micmute led necessaryily.
> 
> I'm also not convinced that it's a good idea to set the mute LED if only
> one channel in a stereo microphone is muted, that seems likely to lead
> to surprising behaviour for users.
> 
At first, i just want to handle val0 == 1 && val1 == 1 and val0 == 0 && 
val1 == 0 only. Intel suggested i need to cover all about other cases, 
the mute led should be off if any channel of mic is on.
So i change the led state when any one channel is muted or unmuted.

> TBH I don't understand why this isn't being done in generic code.
> 
>> +	bool micmute_led;
> 
> What is this for, it never seems to be read except for in the function
> where it's set?
> 

Do you mean i can use a local micmute_led var in the function?


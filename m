Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B41231AF7E
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Feb 2021 07:44:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37A8616A9;
	Sun, 14 Feb 2021 07:44:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37A8616A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613285097;
	bh=+ray0VqT4sTjatzI2a/mNQLcXRRFiHsp/U/vSMV39gE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WkbazsIP+fMgmet0yyhlsZiluzYXt8dEJUpYkb74hFXuqSnPsLhAYCkLNOFn6fgLl
	 qFuAidwOeTVLBAOlrpc/xSXQVkwZyeZoVfqTlRXFSXiD+byBfVZ7SPBVd6kMmaIHWY
	 sHRK9+TGr4kLZvjiDxACaK++YtkETjqTATzj0CeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AE35F8020C;
	Sun, 14 Feb 2021 07:43:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 366F0F801DB; Sun, 14 Feb 2021 07:43:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 561C3F8015A
 for <alsa-devel@alsa-project.org>; Sun, 14 Feb 2021 07:43:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 561C3F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="h/mDIbri"
Received: by mail-wr1-x42b.google.com with SMTP id l12so4843859wry.2
 for <alsa-devel@alsa-project.org>; Sat, 13 Feb 2021 22:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=aUQN0SZkwCC+2sHkMRBo4eVveaM2m59ClyPi/TCSgJI=;
 b=h/mDIbriPlQZGWb9Eb+iLQ2zUlvMmcy9awHJpqDHlnzTnWOsQH0vqNZO0tg7gvYlh3
 h1HoSIjmKogwHw8RFpjBJ7uocWEfbdZjB1koiQq6K76Qh8VztTJUIE0XDc3dVr3bDXvB
 Qvr8BMnXtxJCREViPxKu4XP4vecJXZaj9I0dv1Nn/mzvM8XGc91//KKyg9RTyvDAYjgj
 iqDAUkXf4jncjNS8Pqr9fGbDuFGrAssQYNlIR/K8zW7W+rL9+EEmKdg0yCPavKc30FCK
 GPt3DR3382ijOTCvAEqAyCDomOVT6W889vWolxIP2H+Saoq5w9y1TvNITlaZ/TnqXhPK
 mJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=aUQN0SZkwCC+2sHkMRBo4eVveaM2m59ClyPi/TCSgJI=;
 b=Awa72lwgeiYEQV6Z5yi2+tMxYQmuSsSNQ8o/61gzy7GltqdX9w+w44vqfZVnWSjFam
 +0N24UhUqqFxfoCnTwtleK8O0rHgE5UOi8eV16kkxNg5NyYGZfL2we7bnVmTxcq004UN
 EXOHdF305YOX0yGIKkENyRZo8eA64X3rk4J4dr+SrtxiQoFjYhno9qC7RFj+f8E2+fWa
 6FzJqmGzxmzMjYVJuw6mrTw0PQxNjn2pfjzPLrJWjBQ2byBO64HIFhEZ3goH1NeHNzE/
 YbGMX6WPPkERdtrS60T4rwK/EGwnqeYDrf2Tfg/b3i3DjTp1CK4EoQBimwoU6qVivuX+
 /98g==
X-Gm-Message-State: AOAM530IheYGf0A2z4z/VdK1eiWn10fBVQpo50UNPaswRzKsW5XVPXBJ
 n/bISlYL87JALpzNmYfPn9M=
X-Google-Smtp-Source: ABdhPJzLImN7rJllYpBrWPP1f3SYUf5vt7xMMJv7VCxJ7SlRdTVlcugQRaTGfUIvH4oKVMuw12jVhg==
X-Received: by 2002:a5d:4849:: with SMTP id n9mr12536800wrs.159.1613285001726; 
 Sat, 13 Feb 2021 22:43:21 -0800 (PST)
Received: from [0.0.0.0] ([2a01:4f8:c17:e10a::1])
 by smtp.gmail.com with ESMTPSA id z15sm4013712wrs.72.2021.02.13.22.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Feb 2021 22:43:21 -0800 (PST)
Subject: Re: [PATCH v3 3/3] ASoC: rt715:add micmute led state control supports
To: Mark Brown <broonie@kernel.org>, Perry Yuan <Perry.Yuan@dell.com>
References: <20210112171814.5404-1-Perry_Yuan@Dell.com>
 <20210112175406.GF4646@sirena.org.uk>
From: Perry Yuan <perry979106@gmail.com>
Message-ID: <43507ba7-74b8-2d18-57ca-271f89a752de@gmail.com>
Date: Sun, 14 Feb 2021 14:43:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210112175406.GF4646@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Mark:
Thanks for your review.

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
Removed in V4, I forget to clear this debug code
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
> 
I will remove the CONFIG_DELL_PRIVACY from V4 patch and allow it to run 
if CONFIG_DELL_PRIVACY is not set, the result will be a no-op.
> I'm also not convinced that it's a good idea to set the mute LED if only
> one channel in a stereo microphone is muted, that seems likely to lead
> to surprising behaviour for users.
> 
https://github.com/thesofproject/linux/pull/2660#discussion_r555480210
There is a discussion for the channel mute changing behavior.
If the anyone of value[0] or value[1] is 1, it means mic is NOT muted
The muted state will be LED_ON state need to set.

> TBH I don't understand why this isn't being done in generic code.
> 
>> +	bool micmute_led;
> 
> What is this for, it never seems to be read except for in the function
> where it's set?
> 

I have moved this part code to the local definition of 
rt715_set_amp_gain_put and removed from rt715_priv.
new code will be like this in V4.

@@ -88,6 +89,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol 
*kcontrol,
                 RT715_SET_GAIN_MIX_ADC2_L};
         unsigned int addr_h, addr_l, val_h, val_ll, val_lr;
         unsigned int read_ll, read_rl, i, j, loop_cnt;
+       bool micmute_led;


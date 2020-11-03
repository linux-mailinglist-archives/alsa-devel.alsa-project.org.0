Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FB42A4AFD
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 17:17:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 925151681;
	Tue,  3 Nov 2020 17:16:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 925151681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604420250;
	bh=gZ8/V5Qj5NkpmaTPTbbdZc9gGyiRTD3a4i2Qt103ELs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uJji9nEoUo/MYLU+dOQzt11KBfudhSGU2thnI8ahOm3JF+oquukjLOkCRN0qwMCwZ
	 JbOwPxKKJrhYIX0rA2tf7hdmP0aeRQo1fcd1g+d+RXf2keULzEIMz24yLyyTZIqsBM
	 42O/m5pL9GyZva+ZQ+2lTCYnzu+g/QVIoKxFW6hc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2501F80171;
	Tue,  3 Nov 2020 17:15:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6433CF804B4; Tue,  3 Nov 2020 17:15:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E2D5F80171
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 17:15:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E2D5F80171
IronPort-SDR: 3Kbq/vyQxtWqsItCiP0/VaRMPXKnKwkV8K6/Os0NMC7KUam6r9xFKRXtCc5wz/W8aabMitZx/p
 3tM/IBZuyhgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="169185048"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="169185048"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 08:15:00 -0800
IronPort-SDR: 8HuAY75XhSfQhszJ2sDcMZ9CbaSCwurL5LJKgivLZjKrgD6ljdv/XwWm/aQZkL1D2Zuint6U/9
 z0mrBYehc4Nw==
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="528532333"
Received: from ctanriov-mobl1.amr.corp.intel.com (HELO [10.212.114.78])
 ([10.212.114.78])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 08:14:59 -0800
Subject: Re: [PATCH] ASoC: rt715:add Mic Mute LED control support
To: Mark Brown <broonie@kernel.org>, Perry Yuan <Perry.Yuan@dell.com>
References: <20201103125859.8759-1-Perry_Yuan@Dell.com>
 <20201103131253.GA5545@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5f2c1282-4401-276a-8dad-127fa1f449fd@linux.intel.com>
Date: Tue, 3 Nov 2020 10:13:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201103131253.GA5545@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Limonciello Mario <Mario.Limonciello@dell.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com
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

Somehow this patch was filtered by alsa-devel servers?

On 11/3/20 7:12 AM, Mark Brown wrote:
> On Tue, Nov 03, 2020 at 04:58:59AM -0800, Perry Yuan wrote:
>> From: perry_yuan <perry_yuan@dell.com>
>>
>> Some new Dell system is going to support audio internal micphone
>> privacy setting from hardware level with micmute led state changing
>>
>> This patch allow to change micmute led state through this micphone
>> led control interface like hda_generic provided.
> 
> If this is useful it should be done at the subsystem level rather than
> open coded in a specific CODEC driver, however I don't undersand why it
> is.
> 
>> +static int rt715_micmute_led_mode_put(struct snd_kcontrol *kcontrol,
>> +      struct snd_ctl_elem_value *ucontrol)
>> +{
>> +    struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>> +    struct rt715_priv *rt715 = snd_soc_component_get_drvdata(component);
>> +    int led_mode = ucontrol->value.integer.value[0];
>> +
>> +    rt715->micmute_led = led_mode;
>> +#if IS_ENABLED(CONFIG_LEDS_TRIGGER_AUDIO)
>> +    ledtrig_audio_set(LED_AUDIO_MICMUTE,
>> +               rt715->micmute_led ? LED_ON : LED_OFF);
>> +#endif
>> +  return 0;
>> +}
> 
> This is just adding a userspace API to set a LED via the standard LED
> APIs.  Since the LED subsystem already has a perfectly good userspace
> API why not use that?  There is no visible value in this being in the
> sound subsystem.

I also don't quite follow. This looks as inspired from HDaudio code, but 
with a lot of simplifications.

If the intent was that when userspace decides to mute the LED is turned 
on, wouldn't it be enough to just track the state of a 'capture switch' 
responsible for mute, i.e. when the capture Switch is 'off' the LED is 
on. I don't see the point of having a new control, you would be adding 
more work for PulseAudio/UCM whereas connecting the capture switch to a 
led comes with zero work in userspace. See e.g. how the mute mic LED was 
handled in the SOF code handling DMICs, we didn't add a new control but 
turned the LED in the switch .put callback, see

https://elixir.bootlin.com/linux/latest/source/sound/soc/sof/control.c#L18

https://elixir.bootlin.com/linux/latest/source/sound/soc/sof/control.c#L153

Actually thinking more about it, having two controls for 'mute LED' and 
'capture switch' could lead to inconsistent states where the LED is on 
without mute being activated. we should really bolt the LED activation 
to the capture switch, that way the mute and LED states are aligned.



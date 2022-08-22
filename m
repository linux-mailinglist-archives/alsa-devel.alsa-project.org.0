Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8557A59C1F6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 16:56:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BB3D1620;
	Mon, 22 Aug 2022 16:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BB3D1620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661180197;
	bh=jp07TlypUxlyl1goj8H3yNz8FZQcolvoVw0g67erES0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HfRcdHE75aD0ChoClv9KlHO0t17svFnTsFJMGc55A73hiodSkHsU1YhPN80GaAp0r
	 5JKPcBWyHB+knmm/jfLVVBUbE2jQfpftOHpqeL3YrNVkyVL7k5RUA1iFXKu6kNFlmL
	 JzPgu7sVoKzv8h88lEDFi4S/4cTRD8GiwiNBw3SA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 106AFF800A7;
	Mon, 22 Aug 2022 16:55:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99582F8026A; Mon, 22 Aug 2022 16:55:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_138,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D756DF80152
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 16:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D756DF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VwFYGZVL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661180133; x=1692716133;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jp07TlypUxlyl1goj8H3yNz8FZQcolvoVw0g67erES0=;
 b=VwFYGZVLKbDBe+cTxsd05QNmsNS8NnnrtGv6ofoRUqoiIrMMipDw7T4p
 wdbRACwMRLRW3iXJ+KKOIJ1x4ng3sHA4k7YEGqJ80Yc8LTI5xgYrCgH/u
 1ei4QERXMOVXeNcEI5ksndwY0NcZMg2JnkkVizwymQuuJhLp9NfI+jdXR
 pOmEZZu0Twi32wwdx3XMY2y0OTudAP4NL+kM3pTYS1q70+UzZWkQkEBJ2
 t2QgErY48mtQrlk8itWWFVcU5z7Wkpc8OGUetMVoEi8oJUcMUdxh8MFZS
 gITmfyLInPryBv+TSMXQSJAibBHpmd/ijSf/izGdt6wdsGgmPhG/JJ77X Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="290987354"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="290987354"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 07:55:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="612072086"
Received: from vjuntune-mobl1.ger.corp.intel.com (HELO [10.249.43.87])
 ([10.249.43.87])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 07:55:26 -0700
Message-ID: <18ee9831-eca1-ab84-61dc-bfef21f87515@linux.intel.com>
Date: Mon, 22 Aug 2022 16:55:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 11/12] ASoC: cs42l42: Add Soundwire support
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org
References: <20220819125230.42731-1-rf@opensource.cirrus.com>
 <20220819125230.42731-12-rf@opensource.cirrus.com>
 <44359e9c-4891-17e7-5e0d-392d4751ccf5@linux.intel.com>
 <8a280ad7-ee62-75e0-6bd0-d6396fa27db2@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <8a280ad7-ee62-75e0-6bd0-d6396fa27db2@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

Thanks Richard for your answers, good discussion. There are several
topics I could use more details to understand your line of thought and
requirements, see below.

>>> - Intel Soundwire host controllers have a low-power clock-stop mode that
>>>    requires resetting all peripherals when resuming. This is not
>>> compatible
>>>    with the plug-detect and button-detect because it will clear the
>>>    condition that caused the wakeup before the driver can handle it. So
>>>    clock-stop must be blocked when a snd_soc_jack handler is registered.
>>
>> What do you mean by 'clock-stop must be blocked'? The peripheral cannot
>> prevent the host from stopping the clock.
> 
> Are you sure about that? We're going to have serious problems if the
> Intel manager driver can clock-stop even though there are peripheral
> drivers still using the clock.
> 
> Currently the Intel code will only clock-stop when it goes into
> runtime suspend, which only happens if all peripheral drivers are also
> in runtime suspend. Or on system suspend, which is handled specially by
> the cs42l42 driver. If you are saying this isn't guaranteed behavior
> then we'll need to add something to the core Soundwire core code to tell
> it when it's allowed to clock-stop.

If the peripheral remains pm_runtime active, the manager will never
suspend, but power-wise that's a non-starter.

The premise is that the audio subsystem goes to a low-power state with
only a detector running. The functionality will resume on *any* in-band
wake coming from the peripheral.

> I tried returning an error from the codec driver clk_stop() callback but
> the core code and cadence code treat that as unexpected and dev_err()
> it, then the intel.c code ignores the error and carries on suspending.

Yes, we ignore those errors on purpose, because when the system restarts
the device will have gone through a reset sequence. I don't see a good
reason to prevent a pm_runtime or system suspend, this would have very
large impacts on standby power.

>  Maybe this is explained
>> further down in this patch, but that statement is a bit odd.
>>
>> Even if the condition that caused the wakeup was cleared, presumably
>> when resetting the device the same condition will be raised again, no?
>>
>>> +static int cs42l42_sdw_dai_hw_params(struct snd_pcm_substream
>>> *substream,
>>> +                     struct snd_pcm_hw_params *params,
>>> +                     struct snd_soc_dai *dai)
>>> +{
>>> +    struct cs42l42_private *cs42l42 =
>>> snd_soc_component_get_drvdata(dai->component);
>>> +    struct sdw_stream_runtime *sdw_stream =
>>> snd_soc_dai_get_dma_data(dai, substream);
>>> +    struct sdw_stream_config sconfig;
>>> +    struct sdw_port_config pconfig;
>>> +    unsigned int pdn_mask;
>>> +    int ret;
>>> +
>>> +    if (!sdw_stream)
>>> +        return -EINVAL;
>>> +
>>> +    /* Needed for PLL configuration when we are notified of new bus
>>> config */
>>> +    cs42l42->sample_rate = params_rate(params);
>>> +
>>> +    memset(&sconfig, 0, sizeof(sconfig));
>>> +    memset(&pconfig, 0, sizeof(pconfig));
>>> +
>>> +    sconfig.frame_rate = params_rate(params);
>>> +    sconfig.ch_count = params_channels(params);
>>> +    sconfig.bps = snd_pcm_format_width(params_format(params));
>>> +    pconfig.ch_mask = GENMASK(sconfig.ch_count - 1, 0);
>>> +
>>> +    if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>>> +        sconfig.direction = SDW_DATA_DIR_RX;
>>> +        pconfig.num = CS42L42_SDW_PLAYBACK_PORT;
>>> +        pdn_mask = CS42L42_HP_PDN_MASK;
>>> +    } else {
>>> +        sconfig.direction = SDW_DATA_DIR_TX;
>>> +        pconfig.num = CS42L42_SDW_CAPTURE_PORT;
>>> +        pdn_mask = CS42L42_ADC_PDN_MASK;
>>> +    }
>>> +
>>> +    /*
>>> +     * The DAI-link prepare() will trigger Soundwire DP prepare. But
>>> CS42L42
>>> +     * DP will only prepare if the HP/ADC is already powered-up. The
>>> +     * DAI prepare() and DAPM sequence run after DAI-link prepare()
>>> so the
>>> +     * PDN bit must be written here.
>>> +     */
>>
>> Why not make use of the callbacks that were added precisely to let the
>> codec driver perform device-specific operations? You can add your own
>> code in pre and post operation for both prepare and bank switch. It's
>> not clear why you would do this in a hw_params (which can be called
>> multiple times per ALSA conventions).
>>
> 
> Ah, I'd not noticed the port_prep callback. Maybe it didn't exist when
> this code was first written.

it's been upstream since 4.17 in 2018, and earlier in internal releases.

>>> +    regmap_clear_bits(cs42l42->regmap, CS42L42_PWR_CTL1, pdn_mask);
>>> +    usleep_range(CS42L42_HP_ADC_EN_TIME_US,
>>> CS42L42_HP_ADC_EN_TIME_US + 1000);
>>> +
>>> +    ret = sdw_stream_add_slave(cs42l42->sdw_peripheral, &sconfig,
>>> &pconfig, 1, sdw_stream);
>>> +    if (ret) {
>>> +        dev_err(dai->dev, "Failed to add sdw stream: %d\n", ret);
>>> +        goto err;
>>> +    }
>>> +
>>> +    cs42l42_src_config(dai->component, params_rate(params));
>>> +
>>> +    return 0;
>>> +
>>> +err:
>>> +    regmap_set_bits(cs42l42->regmap, CS42L42_PWR_CTL1, pdn_mask);
>>> +
>>> +    return ret;
>>> +}
>>> +

>>> +static void cs42l42_sdw_init(struct sdw_slave *peripheral)
>>> +{
>>> +    struct cs42l42_private *cs42l42 =
>>> dev_get_drvdata(&peripheral->dev);
>>> +    int ret = 0;
>>> +
>>> +    regcache_cache_only(cs42l42->regmap, false);
>>> +
>>> +    ret = cs42l42_init(cs42l42);
>>> +    if (ret < 0) {
>>> +        regcache_cache_only(cs42l42->regmap, true);
>>> +        return;
>>> +    }
>>> +
>>> +    /* Write out any cached changes that happened between probe and
>>> attach */
>>> +    ret = regcache_sync(cs42l42->regmap);
>>> +    if (ret < 0)
>>> +        dev_warn(cs42l42->dev, "Failed to sync cache: %d\n", ret);
>>> +
>>> +    /* Disable internal logic that makes clock-stop conditional */
>>> +    regmap_clear_bits(cs42l42->regmap, CS42L42_PWR_CTL3,
>>> CS42L42_SW_CLK_STP_STAT_SEL_MASK);
>>> +
>>> +    /*
>>> +     * pm_runtime is needed to control bus manager suspend, and to
>>
>> I don't think the intent is that the codec can control the manager
>> suspend, but that the manager cannot be suspended by the framework
>> unless the codec suspends first?
>>
> 
> That sounds the same to me. But I can re-word the comment.

the initial wording makes it sound like you want to actively control the
manager state, that's different to letting the framework deal with the
parent-child relationship.

> 
>>> +     * recover from an unattach_request when the manager suspends.
>>> +     * Autosuspend delay must be long enough to enumerate.
>>
>> No, this last sentence is not correct. The enumeration can be done no
>> matter what pm_runtime state the Linux codec device is in. And it's
>> really the other way around, it's when the codec reports as ATTACHED
>> that the codec driver will be resumed.
>>
> 
> It can't if the device has powered off. So there has to be some way to
> ensure the codec driver won't suspend before the core has completed
> enumeration and notified an ATTACH to the codec driver.

Powered-off? We don't have any mechanisms in SoundWire to deal with
power. Can you describe what the sequence should be?

All existing codecs will look for the sync pattern as soon as the bus
reset is complete. The functionality behind the interface might be off,
but that's a separate topic.

if it's required to resume the child device when the manager resumes, so
as to deal with sideband power management then indeed this would be a
SoundWire core change. It's not hard to do, we've already implemented a
loop to force codec devices to pm_runtime resume in a .prepare callback,
we could tag the device with the flag.

>>> +     */
>>> +    pm_runtime_set_autosuspend_delay(cs42l42->dev, 3000);
>>> +    pm_runtime_use_autosuspend(cs42l42->dev);
>>> +    pm_runtime_set_active(cs42l42->dev);
>>> +    pm_runtime_enable(cs42l42->dev);
>>> +    pm_runtime_mark_last_busy(cs42l42->dev);
>>> +    pm_runtime_idle(cs42l42->dev);
>>> +}

>>>   static const struct snd_soc_dapm_route cs42l42_audio_map[] = {
>>> @@ -559,6 +564,20 @@ static int cs42l42_set_jack(struct
>>> snd_soc_component *component, struct snd_soc_
>>>   {
>>>       struct cs42l42_private *cs42l42 =
>>> snd_soc_component_get_drvdata(component);
>>>   +    /*
>>> +     * If the Soundwire controller issues bus reset when coming out of
>>> +     * clock-stop it will erase the jack state. This can lose button
>>> press
>>> +     * events, and plug/unplug interrupt bits take between 125ms and
>>> 1500ms
>>> +     * before they are valid again.
>>> +     * Prevent this by holding our pm_runtime to block clock-stop.
>>> +     */
>>> +    if (cs42l42->sdw_peripheral) {
>>> +        if (jk)
>>> +            pm_runtime_get_sync(cs42l42->dev);
>>> +        else
>>> +            pm_runtime_put_autosuspend(cs42l42->dev);
>>> +    }
>>> +
>>
>> I *really* don't understand this sequence.
>>
>> The bus will be suspended when ALL devices have been idle for some time.
>> If the user presses a button AFTER the bus is suspended, the device can
>> still use the in-band wake and resume.
> 
> Only if it has that capability. The cs42l42 has very limited wake
> capability and cannot wake on interrupt, and it certainly can't accept
> the Intel code resetting it before it has a chance to find out what
> condition caused the wake.
> 
>> Granted the button press will be lost but the plug/unplug status will
>> still be handled with a delay.
>>
> 
> I'm finding it difficult to believe it's acceptable to end users for
> button events to be lost.

I don't understand what 'limited wake functionality' means. It can
either generate a wake or it cannot.

In the event that it can, then the Intel manager will detect an in-band
wake and restart the system. When the headset device enumerates and
initializes, it should initiate a check for the jack status. Button
press will be handled once plug-in status is confirmed.

I don't think there is a requirement to keep track of every button press
why the system is suspended. The user-experience is that the system
restarts and plug-in or button-press are handled at some point. It would
be counter-productive to prevent the Intel manager from suspending to
save even 500ms on restart.

>>>       /* Prevent race with interrupt handler */
>>>       mutex_lock(&cs42l42->irq_lock);
>>>       cs42l42->jack = jk;
>>> @@ -1645,9 +1664,11 @@ irqreturn_t cs42l42_irq_thread(int irq, void
>>> *data)
>>>       unsigned int current_button_status;
>>>       unsigned int i;
>>>   +    pm_runtime_get_sync(cs42l42->dev);
>>>       mutex_lock(&cs42l42->irq_lock);
>>>       if (cs42l42->suspended || !cs42l42->init_done) {
>>>           mutex_unlock(&cs42l42->irq_lock);
>>> +        pm_runtime_put_autosuspend(cs42l42->dev);
>>>           return IRQ_NONE;
>>>       }
>>>   @@ -1750,6 +1771,8 @@ irqreturn_t cs42l42_irq_thread(int irq, void
>>> *data)
>>>       }
>>>         mutex_unlock(&cs42l42->irq_lock);
>>> +    pm_runtime_mark_last_busy(cs42l42->dev);
>>> +    pm_runtime_put_autosuspend(cs42l42->dev);
>>>         return IRQ_HANDLED;
>>
>> Again in SoundWire more you should not use a dedicated interrupt.
>> There's something missing in the explanations on why this thread is
>> required.
>>
> 
> Do you have a situation where it will actually cause a problem or are
> you just saying that in an ideal world where all the hardware was
> perfect it wouldn't need one?
> Bear in mind that cs42l42 is roughly 7 years old so its Soundwire
> implementation may not be all that you'd expect from a device designed
> today to SW1.2 with Soundwire as its primary interface.

Nothing is ideal in a standard, there's always different
interpretations, that's ok.

We've never seen a device with a dedicated interrupt line and I think
it's only fair to ask why it was necessary. It's extra complexity for
BIOS integration, possibly machine driver, and more validation work.

If the message was that a dedicated interrupt line is required, let's
enable it. If the in-band wake is good-enough, then let's avoid more
options.

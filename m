Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 950EF59C4DA
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 19:16:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DBFC9F6;
	Mon, 22 Aug 2022 19:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DBFC9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661188592;
	bh=nI6F55ARchWHh2b2WuSyUbWQXMR6iaGfOX+gsR8AsRE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MpS1fFz9TgHGScA8qIFekvHJmSmbe9i16CTkt8FSfmU2OzC0RDxvp5oNIsoX2+6bX
	 Hu+/GWfUhfRj//yC9nqoC6c3t6s14QRMgWXsN4uTQdm+BMa0iVexOHEnQhRsLhBXkm
	 xStIZqJ/eTMJrbnMKwSIxl/8qJGplkYkKj5q/r/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 007F8F8026D;
	Mon, 22 Aug 2022 19:15:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD0E0F8026A; Mon, 22 Aug 2022 19:15:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47B1BF800ED
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 19:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47B1BF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VZL3yzFc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661188528; x=1692724528;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nI6F55ARchWHh2b2WuSyUbWQXMR6iaGfOX+gsR8AsRE=;
 b=VZL3yzFcD7q+EbssfYw44siBqR/msjCXokZft1CQFhPinnJQxObQdRq7
 JrsHnndoQc/RQcWzfBPwmQQ6qKaFauwgAyHCbaBsr50GxhsFAO1RDGrF5
 DbHa6EwzCSWHD7JsXRtTDGRvpYaNLEKalzzMOrGFHkEFDNZk0KI8UzkpX
 Rdb8acOgsdQv4bkxvkNgTyBDaR299baEslM33MEf+0xAju4ILromECu37
 ZSHFByYvuai2dOMJW5v4pFinwHmXwbVd0Z+3hh+Ds86SsxeJrtzHgzw4v
 wV4/z64Bo11an1r9M0GzmLf5nfJVbbQieig0/l0xUA0o/75NdxVulR6Zb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="276501765"
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="276501765"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 10:15:23 -0700
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; d="scan'208";a="854556797"
Received: from apascali-mobl2.ger.corp.intel.com (HELO [10.252.42.21])
 ([10.252.42.21])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 10:15:21 -0700
Message-ID: <32984b68-01b0-286c-fe19-3084bd52a7c4@linux.intel.com>
Date: Mon, 22 Aug 2022 19:15:19 +0200
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
 <18ee9831-eca1-ab84-61dc-bfef21f87515@linux.intel.com>
 <f5c8b8df-0ffa-733b-71be-80b5db167c44@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <f5c8b8df-0ffa-733b-71be-80b5db167c44@opensource.cirrus.com>
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



On 8/22/22 18:31, Richard Fitzgerald wrote:
> On 22/08/2022 15:55, Pierre-Louis Bossart wrote:
>> Thanks Richard for your answers, good discussion. There are several
>> topics I could use more details to understand your line of thought and
>> requirements, see below.
>>
>>>>> - Intel Soundwire host controllers have a low-power clock-stop mode
>>>>> that
>>>>>     requires resetting all peripherals when resuming. This is not
>>>>> compatible
>>>>>     with the plug-detect and button-detect because it will clear the
>>>>>     condition that caused the wakeup before the driver can handle
>>>>> it. So
>>>>>     clock-stop must be blocked when a snd_soc_jack handler is
>>>>> registered.
>>>>
>>>> What do you mean by 'clock-stop must be blocked'? The peripheral cannot
>>>> prevent the host from stopping the clock.
>>>
>>> Are you sure about that? We're going to have serious problems if the
>>> Intel manager driver can clock-stop even though there are peripheral
>>> drivers still using the clock.
>>>
>>> Currently the Intel code will only clock-stop when it goes into
>>> runtime suspend, which only happens if all peripheral drivers are also
>>> in runtime suspend. Or on system suspend, which is handled specially by
>>> the cs42l42 driver. If you are saying this isn't guaranteed behavior
>>> then we'll need to add something to the core Soundwire core code to tell
>>> it when it's allowed to clock-stop.
>>
>> If the peripheral remains pm_runtime active, the manager will never
>> suspend, but power-wise that's a non-starter.
>>
> 
> I agree it's not ideal but ultimately you get what the hardware can
> support, The cs42l42 driver doesn't support runtime suspend in I2C mode.

It's a completely different mode. In I2C mode, the Intel DSP is
suspended until there's something audio-related to do. In SoundWire
mode, the DSP needs to remain partly powered and that's a real issue if
the DSP cannot suspend.

> It's not a critical blocker to delay submitting any CS42L42 Soundwire
> support to the kernel.

I wasn't trying to push back, more to understand what needs to happen to
support this device.

We could also add the 'normal' clock stop mode and see how things go
first. IIRC we have a quirk already in the SOF driver.


>>>>> +     * recover from an unattach_request when the manager suspends.
>>>>> +     * Autosuspend delay must be long enough to enumerate.
>>>>
>>>> No, this last sentence is not correct. The enumeration can be done no
>>>> matter what pm_runtime state the Linux codec device is in. And it's
>>>> really the other way around, it's when the codec reports as ATTACHED
>>>> that the codec driver will be resumed.
>>>>
>>>
>>> It can't if the device has powered off. So there has to be some way to
>>> ensure the codec driver won't suspend before the core has completed
>>> enumeration and notified an ATTACH to the codec driver.
>>
>> Powered-off? We don't have any mechanisms in SoundWire to deal with
>> power. Can you describe what the sequence should be?
>>
>> All existing codecs will look for the sync pattern as soon as the bus
>> reset is complete. The functionality behind the interface might be off,
>> but that's a separate topic.
>>
> 
> What I'm thinking of is what to do if the driver probe()s but the
> peripheral never enumerates. Should we take some action to maybe
> turn it off (like asserting RESET?). Or is it ok to leave it on
> forever?
> 
> Though in the case of cs42l42.c the runtime_suspend doesn't power-off or
> reset so it doesn't really matter. The comment about autosuspend is
> now redundant and can be deleted.

It's really common for us to see a driver probe and the device never
enumerates - that's typical of 'ghost' devices exposed in the ACPI DSDT
but not populated in hardware. It's fine, nothing will happen.

I am not sure what you mean by asserting RESET because until the device
is enumerated, you cannot talk to it with the SoundWire command
protocol. You could always have some sort of sideband power link, but
that would require a bit more work at the core level to switch that
sideband on when the manager resumes.

> 
>> if it's required to resume the child device when the manager resumes, so
>> as to deal with sideband power management then indeed this would be a
>> SoundWire core change. It's not hard to do, we've already implemented a
>> loop to force codec devices to pm_runtime resume in a .prepare callback,
>> we could tag the device with the flag.
>>
>>>>> +     */
>>>>> +    pm_runtime_set_autosuspend_delay(cs42l42->dev, 3000);
>>>>> +    pm_runtime_use_autosuspend(cs42l42->dev);
>>>>> +    pm_runtime_set_active(cs42l42->dev);
>>>>> +    pm_runtime_enable(cs42l42->dev);
>>>>> +    pm_runtime_mark_last_busy(cs42l42->dev);
>>>>> +    pm_runtime_idle(cs42l42->dev);
>>>>> +}
>>
>>>>>    static const struct snd_soc_dapm_route cs42l42_audio_map[] = {
>>>>> @@ -559,6 +564,20 @@ static int cs42l42_set_jack(struct
>>>>> snd_soc_component *component, struct snd_soc_
>>>>>    {
>>>>>        struct cs42l42_private *cs42l42 =
>>>>> snd_soc_component_get_drvdata(component);
>>>>>    +    /*
>>>>> +     * If the Soundwire controller issues bus reset when coming
>>>>> out of
>>>>> +     * clock-stop it will erase the jack state. This can lose button
>>>>> press
>>>>> +     * events, and plug/unplug interrupt bits take between 125ms and
>>>>> 1500ms
>>>>> +     * before they are valid again.
>>>>> +     * Prevent this by holding our pm_runtime to block clock-stop.
>>>>> +     */
>>>>> +    if (cs42l42->sdw_peripheral) {
>>>>> +        if (jk)
>>>>> +            pm_runtime_get_sync(cs42l42->dev);
>>>>> +        else
>>>>> +            pm_runtime_put_autosuspend(cs42l42->dev);
>>>>> +    }
>>>>> +
>>>>
>>>> I *really* don't understand this sequence.
>>>>
>>>> The bus will be suspended when ALL devices have been idle for some
>>>> time.
>>>> If the user presses a button AFTER the bus is suspended, the device can
>>>> still use the in-band wake and resume.
>>>
>>> Only if it has that capability. The cs42l42 has very limited wake
>>> capability and cannot wake on interrupt, and it certainly can't accept
>>> the Intel code resetting it before it has a chance to find out what
>>> condition caused the wake.
>>>
>>>> Granted the button press will be lost but the plug/unplug status will
>>>> still be handled with a delay.
>>>>
>>>
>>> I'm finding it difficult to believe it's acceptable to end users for
>>> button events to be lost.
>>
>> I don't understand what 'limited wake functionality' means. It can
>> either generate a wake or it cannot.
> 
> It can generate wakes. Whether it can generate one when you want one
> is another question entirely...

You're losing me here. the in-band wake is only relevant in the context
of clock-stop. The manager has zero expectations as to when those wakes
are asserted.

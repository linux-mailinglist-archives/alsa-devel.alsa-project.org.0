Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E6A675E75
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 20:56:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89D7734D1;
	Fri, 20 Jan 2023 20:55:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89D7734D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674244579;
	bh=BBdBbDkOeQZTC5ebPeDBvlm+1/6DpUsVVDUC9OEfcSM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GtNALglWtH/Fd1zgX0K9AZami//i9+wZjvePydnjHMT2o9LdIhAYd/QsXWCxejDUT
	 wp8f1YoW+nGZ95IqPatBk7DFvn3aTTgDfqV0BjmP7KUqnnGUfI16xs90O4CUab+MNt
	 HqDPvIxsIERJdpqRyM3Ab5qWJZtbvpF9lwEHaxDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C106F800F0;
	Fri, 20 Jan 2023 20:55:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39D6EF8026D; Fri, 20 Jan 2023 20:55:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 501C3F800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 20:55:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 501C3F800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RYwZcl6i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674244512; x=1705780512;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BBdBbDkOeQZTC5ebPeDBvlm+1/6DpUsVVDUC9OEfcSM=;
 b=RYwZcl6i6uAKbhiGBm4dPRtZwE2/M5B2H2qNvhus4YkVld4DA7bj3ArW
 3Uh93Pdi9ZdfNIvN5SluHTBZreGnZlfwGaHSzLKdwi2grfIfA8Dz7cxYc
 0gfC9FM7/c/bRTbYB8mytE7Mb9HWUDfYi/EZr+kOaVhjSWY7mzEHXUIpV
 tSBc2gNbOcGSJrtvTAyFlaULSXMqzpKlu5dBNK69k9IwGRJgLuG47iqK9
 2KuGJS3Mx4Eg9mCfddPpH0z2eqqpMkEQUImeUduWGPcq9J0bhN7okADsO
 HNJEWH7LtGNxApRvDZodyCnp4ryMJNcz4tOW7B48/of+qcRMzLPhlmvgT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="352933743"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="352933743"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:55:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="768800209"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="768800209"
Received: from gallegos-mobl1.amr.corp.intel.com (HELO [10.212.24.2])
 ([10.212.24.2])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 11:55:01 -0800
Message-ID: <c8a9ff9b-d1d0-1cef-bf51-e7fa247d24f4@linux.intel.com>
Date: Fri, 20 Jan 2023 13:55:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v2 6/8] ASoC: cs42l42: Add Soundwire support
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
References: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
 <20230118160452.2385494-7-sbinding@opensource.cirrus.com>
 <33130336-b2ce-330e-fdec-166eee977e13@linux.intel.com>
 <418f6b73-b5ac-8d87-a856-3413ec103f91@opensource.cirrus.com>
 <6ea1b85f-22e2-8744-9638-6321a5a21acf@linux.intel.com>
 <32fd1755-0128-8f32-9a88-a92f1647f903@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <32fd1755-0128-8f32-9a88-a92f1647f903@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/19/23 09:35, Richard Fitzgerald wrote:
> On 19/1/23 14:48, Pierre-Louis Bossart wrote:
>>
>>>>> +static int cs42l42_sdw_dai_startup(struct snd_pcm_substream
>>>>> *substream,
>>>>> +                   struct snd_soc_dai *dai)
>>>>> +{
>>>>> +    struct cs42l42_private *cs42l42 =
>>>>> snd_soc_component_get_drvdata(dai->component);
>>>>> +
>>>>> +    if (!cs42l42->init_done)
>>>>> +        return -ENODEV;
>>>>
>>>> Can this happen? IIRC the ASoC framework would use
>>>> pm_runtime_resume_and_get() before .startup, which would guarantee that
>>>> the device is initialized, no?
>>>>
>>>
>>> Yes, this can happen. Because of the way that the SoundWire enumeration
>>> was implemented in the core code, it isn't a probe event so we cannot
>>> call snd_soc_register_component() on enumeration because -EPROBE_DEFER
>>> wouldn't be handled. So the snd_soc_register_component() must be called
>>> from probe(). This leaves a limbo situation where we've registered the
>>> driver but in fact don't yet have any hardware. ALSA/ASoC doesn't know
>>> that we've registered before we are functional so they are happy to
>>> go ahead and try to use the soundcard. If for some reason the hardware
>>> failed to enumerate we can get here without having enumerated.
>>
>> Humm, yes, but you've also made the regmap cache-only, so is there
>> really a problem?
>>
> 
> It's true that normally we go past these stages in cache-only, but that
> is because normally (non-Soundwire) we already initialized the hardware
> to good state during probe().
> If we just carry on when it hasn't enumerated and we haven't initialized
> it yet, who knows what will happen if it enumerates some time later.
> 
> We could just ignore it and see if anyone has a problem but for the sake
> of a couple of lines of code I feel like I'd rather check for it.
> 
>> FWIW I don't see a startup callback in any other codec driver. It may be
>> wrong but it's also a sign that this isn't a problem we've seen so far
>> on existing Intel-based platforms.
>>
> 
> It's nicer to do the check in startup() because then the application
> open() will fail cleanly. We could delay until prepare - which is the
> point we really need the hardware to be accessible - and hope the
> hardware enumerated and initialized by that time. But that's not so
> nice from the app point of view.

Another way to avoid problems is to rely on the codec component .probe
to check if the SoundWire device is initialized before registering a card.

I just tried with a system where the ACPI info exposes a codec which is
not connected, it fails nicely. That avoids the pitfalls of creating a
card which isn't functional since all dependencies are not met.

[   64.616530] snd_soc_sof_sdw:mc_probe: sof_sdw sof_sdw: Entry
[   64.616549] snd_soc_sof_sdw:log_quirks: sof_sdw sof_sdw: quirk
SOF_SDW_PCH_DMIC enabled
[   64.616559] snd_soc_sof_sdw:sof_card_dai_links_create: sof_sdw
sof_sdw: sdw 2, ssp 0, dmic 2, hdmi 0
[   64.616587] snd_soc_sof_sdw:init_dai_link: sof_sdw sof_sdw: create
dai link SDW0-Playback, id 0
[   64.616600] snd_soc_sof_sdw:init_dai_link: sof_sdw sof_sdw: create
dai link SDW0-Capture, id 1
[   64.616607] snd_soc_sof_sdw:init_dai_link: sof_sdw sof_sdw: create
dai link dmic01, id 2
[   64.616614] snd_soc_sof_sdw:init_dai_link: sof_sdw sof_sdw: create
dai link dmic16k, id 3
[   69.757115] rt5682 sdw:0:025d:5682:00: Initialization not complete,
timed out
[   69.757128] rt5682 sdw:0:025d:5682:00: ASoC: error at
snd_soc_component_probe on sdw:0:025d:5682:00: -110
[   69.757224] sof_sdw sof_sdw: ASoC: failed to instantiate card -110
[   69.757734] sof_sdw sof_sdw: snd_soc_register_card failed -110

see
https://elixir.bootlin.com/linux/latest/source/sound/soc/codecs/rt5682.c#L2927

I think this is compatible with the device model and bind/unbind, but it
could be improved with the removal of the wait if we had a way to return
-EPROBEDEFER, and have a mechanism to force the deferred probe work to
be triggered when a device actually shows up. It's a generic problem
that the probe cannot always be a synchronous function but may complete
'later'.

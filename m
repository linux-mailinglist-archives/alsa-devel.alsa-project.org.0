Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 166FB673CC2
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 15:49:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D78416B3;
	Thu, 19 Jan 2023 15:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D78416B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674139765;
	bh=j1RdAoD/wGl8iHKdRlcOQs9OkVUn7Q4Q+LreHOO1Lu0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hiaQp7HGvofAzgi1jDrpnGk+SEHqlgHv7Ilg8r9g392KgvxRNd3BICXkx1YJSs/QZ
	 2O+8fR1yq7EqJ02WamwRPWw2BHLd/i8IX0o3pcyDdypF0IDIa0DomzuHAIlJuZxG6g
	 pD6e5VJMlrHI55neZlHWlnbstA8SBCGS/87jq4pE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E642F80083;
	Thu, 19 Jan 2023 15:48:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 311BEF8047B; Thu, 19 Jan 2023 15:48:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29D3FF8024D
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 15:48:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29D3FF8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=U/4oU6Bb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674139703; x=1705675703;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=j1RdAoD/wGl8iHKdRlcOQs9OkVUn7Q4Q+LreHOO1Lu0=;
 b=U/4oU6BbhK0SjLsW9T9mAZFlTtFdiH8OqNhNisCRud/aRfN/cqo16RjO
 wmQa/JcSLMwnlKWFR1WIebsMXMk7wSq6e/sGBZEWz3Qk9lWBHxyH1xKgK
 YhgUoda1i57VzbGibLOV64NApdVMhlPanhc7DiUGnkwIgoUm1uo50boV6
 Wmjqrt1jdiHJL1/2xvcEyRAgFLMn0HJeiwRiqzN1uIIJAMOWWREr4hF9W
 2WTQWLCGddN01BL+gkK3PjUPo5apFYtLUiLHWHk0x2bTMJwapwRYHayuj
 4h+QTohb5jDi459IbUbgUK5864f1Mnr2mU5uOyARpi6VgqVRhs+d4/sU7 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="305670166"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="305670166"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 06:48:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="784082510"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="784082510"
Received: from sahamad-mobl1.amr.corp.intel.com (HELO [10.213.187.97])
 ([10.213.187.97])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 06:48:15 -0800
Message-ID: <6ea1b85f-22e2-8744-9638-6321a5a21acf@linux.intel.com>
Date: Thu, 19 Jan 2023 08:48:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v2 6/8] ASoC: cs42l42: Add Soundwire support
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
References: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
 <20230118160452.2385494-7-sbinding@opensource.cirrus.com>
 <33130336-b2ce-330e-fdec-166eee977e13@linux.intel.com>
 <418f6b73-b5ac-8d87-a856-3413ec103f91@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <418f6b73-b5ac-8d87-a856-3413ec103f91@opensource.cirrus.com>
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


>>> +static int cs42l42_sdw_dai_startup(struct snd_pcm_substream *substream,
>>> +                   struct snd_soc_dai *dai)
>>> +{
>>> +    struct cs42l42_private *cs42l42 =
>>> snd_soc_component_get_drvdata(dai->component);
>>> +
>>> +    if (!cs42l42->init_done)
>>> +        return -ENODEV;
>>
>> Can this happen? IIRC the ASoC framework would use
>> pm_runtime_resume_and_get() before .startup, which would guarantee that
>> the device is initialized, no?
>>
> 
> Yes, this can happen. Because of the way that the SoundWire enumeration
> was implemented in the core code, it isn't a probe event so we cannot
> call snd_soc_register_component() on enumeration because -EPROBE_DEFER
> wouldn't be handled. So the snd_soc_register_component() must be called
> from probe(). This leaves a limbo situation where we've registered the
> driver but in fact don't yet have any hardware. ALSA/ASoC doesn't know
> that we've registered before we are functional so they are happy to
> go ahead and try to use the soundcard. If for some reason the hardware
> failed to enumerate we can get here without having enumerated.

Humm, yes, but you've also made the regmap cache-only, so is there
really a problem?

FWIW I don't see a startup callback in any other codec driver. It may be
wrong but it's also a sign that this isn't a problem we've seen so far
on existing Intel-based platforms.

> 
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int cs42l42_sdw_dai_hw_params(struct snd_pcm_substream
>>> *substream,
>>> +                     struct snd_pcm_hw_params *params,
>>> +                     struct snd_soc_dai *dai)
>>> +{
>>> +    struct cs42l42_private *cs42l42 =
>>> snd_soc_component_get_drvdata(dai->component);
>>> +    struct sdw_stream_runtime *sdw_stream =
>>> snd_soc_dai_get_dma_data(dai, substream);
>>> +    struct sdw_stream_config stream_config = {0};
>>> +    struct sdw_port_config port_config = {0};
>>> +    int ret;
>>> +
>>> +    if (!sdw_stream)
>>> +        return -EINVAL;
>>> +
>>> +    /* Needed for PLL configuration when we are notified of new bus
>>> config */
>>> +    cs42l42->sample_rate = params_rate(params);
>>
>> wouldn't it be better to check if the sample_rate is supported by the
>> PLL here, instead of in the .prepare step ...
>>
> It depends on the soundwire bus clock. We need to know both to determine
> whether they are valid. IFF we can assume that the call to
> sdw_stream_add_slave() will always invoke the bus_config() callback we
> can call cs42l42_pll_config() from cs42l42_sdw_bus_config() and return
> an error from cs42l42_sdw_bus_config() if the {swire_clk, sample_rate}
> pair isn't valid.

You lost me here. Are you saying the soundwire bus clock is only known
in the prepare stage?


>>> +static int cs42l42_sdw_dai_set_sdw_stream(struct snd_soc_dai *dai,
>>> void *sdw_stream,
>>> +                      int direction)
>>> +{
>>> +    if (!sdw_stream)
>>> +        return 0;
>>> +
>>> +    if (direction == SNDRV_PCM_STREAM_PLAYBACK)
>>> +        dai->playback_dma_data = sdw_stream;
>>> +    else
>>> +        dai->capture_dma_data = sdw_stream;
>>> +
>>> +    return 0;
>>
>> Humm, this is interesting, you are not using the sdw_stream_data that
>> all other codecs use, but in hindsight I have no idea why we allocate
>> something to only store a pointer.
>>
> 
> Indeed. I can see no reason to wrap this pointer in another struct when
> we can store the pointer direct so I dropped the wrapper struct.

I'll see if we can simplify the other codec drivers.

>>> +static int cs42l42_sdw_update_status(struct sdw_slave *peripheral,
>>> +                     enum sdw_slave_status status);s
>>> +{
>>> +    struct cs42l42_private *cs42l42 =
>>> dev_get_drvdata(&peripheral->dev);
>>> +
>>> +    switch (status) {
>>> +    case SDW_SLAVE_ATTACHED:
>>> +        dev_dbg(cs42l42->dev, "ATTACHED\n");
>>> +        if (!cs42l42->init_done)
>>> +            cs42l42_sdw_init(peripheral);
>>
>> unclear to me what happens is the bus suspends, how would you redo the
>> init?
>>
> 
> We don't need to re-run the init(). A regcache_sync() will restore
> settings.

ah, interesting. Other codec drivers play with specific registers that
aren't in regmap. There's also headset calibration that's done
differently in the first init or later.

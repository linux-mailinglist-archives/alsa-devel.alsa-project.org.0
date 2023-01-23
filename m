Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4068B6780F1
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 17:07:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B677C12C0;
	Mon, 23 Jan 2023 17:07:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B677C12C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674490073;
	bh=tZaw3zsdtxxYGbmV/cEBHlWxxBcj5qE7158PLJuVKqk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=As8x/OcrSzS0pX8h/VtHHy+T1YC5UIsIiQNiCbagS3Aq+zgVvG9edfbaEf1+BIpi+
	 25I8RMByiff1h/GC0I8W+C147QD0aTdvpaXoAFmmBQwL0qeeKYn2nWIi26GODqAH+k
	 GefXQ62y8epPo5Ydz1SSzOV/Z5Pudsp+eCT7YeI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D179F804FC;
	Mon, 23 Jan 2023 17:06:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5318BF804C2; Mon, 23 Jan 2023 17:06:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D494BF80132
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 17:06:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D494BF80132
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mo4Wg5nC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674490012; x=1706026012;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tZaw3zsdtxxYGbmV/cEBHlWxxBcj5qE7158PLJuVKqk=;
 b=mo4Wg5nCsIDB0H0EtPZTwfwW9DhnQD5feJIEZh3c11Y3iG/nUE21U7nf
 1HnTkhWP4n5Gdl/GBc9bqr68R2H2BDPpMxJ/8Q0vCXaR7u/NBY7IiKx1C
 zNio+opPS+aXC0O4KZrWWsVOVwa4v/U0x508rQIucHpnDpMa3ehiuTAzZ
 ucW8izq2ObETiTngiJ0n4ck3cPlWpZIukR5PWkgiYzemx3DPdofAWuRf1
 m8IxxjJ0vozCxoHnjsqN9NhVQmHupQUIBdoDE9LsMuLqybwoD1djKTm0T
 N4QuOtAP1ZluIiJytrrt/Pu8w10q+AuHaWsv+qGa3bTf88B1O6ozpNA6V A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="388426465"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="388426465"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 08:05:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="693962003"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="693962003"
Received: from rgrachek-mobl.amr.corp.intel.com (HELO [10.212.113.123])
 ([10.212.113.123])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 08:05:51 -0800
Message-ID: <a54bf135-70ba-4c8f-b373-690a9ad8e7ef@linux.intel.com>
Date: Mon, 23 Jan 2023 10:05:50 -0600
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
 <6ea1b85f-22e2-8744-9638-6321a5a21acf@linux.intel.com>
 <32fd1755-0128-8f32-9a88-a92f1647f903@opensource.cirrus.com>
 <c8a9ff9b-d1d0-1cef-bf51-e7fa247d24f4@linux.intel.com>
 <3bac8055-2e6e-dc53-d143-f493e18a1e43@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <3bac8055-2e6e-dc53-d143-f493e18a1e43@opensource.cirrus.com>
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


>>> It's nicer to do the check in startup() because then the application
>>> open() will fail cleanly. We could delay until prepare - which is the
>>> point we really need the hardware to be accessible - and hope the
>>> hardware enumerated and initialized by that time. But that's not so
>>> nice from the app point of view.
>>
>> Another way to avoid problems is to rely on the codec component .probe
>> to check if the SoundWire device is initialized before registering a
>> card.
>>
>> I just tried with a system where the ACPI info exposes a codec which is
>> not connected, it fails nicely. That avoids the pitfalls of creating a
>> card which isn't functional since all dependencies are not met.
>>
>> [   64.616530] snd_soc_sof_sdw:mc_probe: sof_sdw sof_sdw: Entry
>> [   64.616549] snd_soc_sof_sdw:log_quirks: sof_sdw sof_sdw: quirk
>> SOF_SDW_PCH_DMIC enabled
>> [   64.616559] snd_soc_sof_sdw:sof_card_dai_links_create: sof_sdw
>> sof_sdw: sdw 2, ssp 0, dmic 2, hdmi 0
>> [   64.616587] snd_soc_sof_sdw:init_dai_link: sof_sdw sof_sdw: create
>> dai link SDW0-Playback, id 0
>> [   64.616600] snd_soc_sof_sdw:init_dai_link: sof_sdw sof_sdw: create
>> dai link SDW0-Capture, id 1
>> [   64.616607] snd_soc_sof_sdw:init_dai_link: sof_sdw sof_sdw: create
>> dai link dmic01, id 2
>> [   64.616614] snd_soc_sof_sdw:init_dai_link: sof_sdw sof_sdw: create
>> dai link dmic16k, id 3
>> [   69.757115] rt5682 sdw:0:025d:5682:00: Initialization not complete,
>> timed out
>> [   69.757128] rt5682 sdw:0:025d:5682:00: ASoC: error at
>> snd_soc_component_probe on sdw:0:025d:5682:00: -110
>> [   69.757224] sof_sdw sof_sdw: ASoC: failed to instantiate card -110
>> [   69.757734] sof_sdw sof_sdw: snd_soc_register_card failed -110
>>
>> see
>> https://elixir.bootlin.com/linux/latest/source/sound/soc/codecs/rt5682.c#L2927
>>
>> I think this is compatible with the device model and bind/unbind, but it
>> could be improved with the removal of the wait if we had a way to return
>> -EPROBEDEFER, and have a mechanism to force the deferred probe work to
>> be triggered when a device actually shows up. It's a generic problem
>> that the probe cannot always be a synchronous function but may complete
>> 'later'.
> 
> I see what you've done in your patch, but I had already experimented
> with this idea and found that the wait_for_completion() can deadlock the
> Soundwire core.

That's not good. Do you have any logs or explanation on what the
root-cause of this deadlock might be? If something's broken, we might as
well fix it.

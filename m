Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED39566A2F2
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 20:29:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B39D6AFB4;
	Fri, 13 Jan 2023 20:28:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B39D6AFB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673638177;
	bh=XsVxTpswxKpJq81rhcwlfxUKgUo1hWPn8GrChGU2LnQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=piNiAToULvXukqhMS8bIbMij+IY85BrVdsssHkZIa3I/hTEqu0R5ObCxaSXkmizdk
	 3jpcEZW8nW67ed4xmw5PXGPqbwlrf0pu7btKymtZZPDmatuFvqPwIBAwy4Wt/CGQWZ
	 jMKPFT8Po6JUvhotvzUHIgly3V2WAdqR1VAxDsb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7912F8053A;
	Fri, 13 Jan 2023 20:27:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E554F804BC; Fri, 13 Jan 2023 20:27:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 679D6F8019B
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 20:27:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 679D6F8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=axb0l2zm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673638074; x=1705174074;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XsVxTpswxKpJq81rhcwlfxUKgUo1hWPn8GrChGU2LnQ=;
 b=axb0l2zmB9UbJOrgsmgcHa+vuUv8bYKnhkmDD9swnUE1VpHSE1ehoEnd
 PyNlhv5Uy4T4KB31JgfOGi4BECjZGAWSu2r69Pbj5kFddcEVA5WMTVOFy
 wCfRVhGhaG2MvsOFBFLUvC7ZPz7fpous4HV9rA5V7Mrcg6PD2BJVrgDXO
 Qhnln3wStu/CERfDhR+W3H9dNjFFyoGch9lXmb5mqnRtcx2qfF7FxptSK
 d3vDWisBE2H3x1mtbNzLMBv7P3s4LzuPIf6lYMCVHSeUMJy7mnEvVdPX8
 vJG8ZTXXfHekodMkZ92yXMxPgsTDZiB2QDwqvF+tVq5uwFeUyPPGhbbl1 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="322777253"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="322777253"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 11:27:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="608257467"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="608257467"
Received: from rerayess-mobl.amr.corp.intel.com (HELO [10.212.13.223])
 ([10.212.13.223])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 11:27:51 -0800
Message-ID: <e73032b1-ac5b-4a3a-e2a0-8ac121853dee@linux.intel.com>
Date: Fri, 13 Jan 2023 11:33:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 19/19] ASoC: amd: ps: increase runtime suspend delay
Content-Language: en-US
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-20-Vijendar.Mukunda@amd.com>
 <c7f018e3-c8be-6819-0ece-244bfb943c62@linux.intel.com>
 <0aaf3fa5-bcf1-ec06-8f78-c61e8809398e@amd.com>
 <5a34e6f7-eaf1-8128-81e4-81f65541d9a8@linux.intel.com>
 <1a14e117-4216-b98d-f972-c9a02cf79d1e@amd.com>
 <eb12ed5d-a9f9-cb8d-28f5-ac84c75cf441@linux.intel.com>
 <90782037-109b-b197-ca17-b7d199931f7d@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <90782037-109b-b197-ca17-b7d199931f7d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, arungopal.kondaveeti@amd.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>>>>>>> increase the runtime suspend delay to 3 seconds.
>>>>>> You have a parent PCI device and a set of child devices for each
>>>>>> manager. The parent PCI device cannot suspend before all its children
>>>>>> are also suspended, so shouldn't the delay be modified at the
>>>>>> manager level?
>>>>>>
>>>>>> Not getting what this delay is and how this would deal with a lengthy
>>>>>> enumeration/initialization process.
>>>>> Yes agreed. Until Child devices are suspended, parent device will
>>>>> be in D0 state. We will rephrase the commit message.
>>>>>
>>>>> Machine driver node will be created by ACP PCI driver.
>>>>> We have added delay in machine driver to make sure
>>>>> two manager instances completes codec enumeration and
>>>>> peripheral initialization before registering the sound card.
>>>>> Without adding delay in machine driver will result early card
>>>>> registration before codec initialization is completed. Manager
>>>>> will enter in to bad state due to codec read/write failures.
>>>>> We are intended to keep the ACP in D0 state, till sound card
>>>>> is created and jack controls are initialized. To handle, at manager
>>>>> level increased runtime suspend delay.
>>>> This doesn't look too good. You should not assume any timing
>>>> dependencies in the machine driver probe. I made that mistake in earlier
>>>> versions and we had to revisit all this to make sure drivers could be
>>>> bound/unbound at any time.
>>> Rather than a timing dependency, could you perhaps prohibit runtime PM
>>> and have a codec make a callback to indicate it's fully initialized and
>>> then allow runtime PM again?
>> We already have enumeration and initialization 'struct completion' that
>> are used by codec drivers to know if the hardware is usable. We also
>> have pm_runtime_get_sync() is the bus layer to make sure the codec is
>> resumed before being accessed.
> Instead of walking through codec list and checking completion status
> for every codec over the link, can we have some solution where once
> all codecs gets enumerated and initialized, a variable in bus instance
> will be updated to know all peripherals initialized. So that we can
> check this variable in machine driver.

No, because the bus cannot know for sure what codecs to expect on the
platform.

This comes from the design, we first create a bunch of devices based on
ACPI information, which causes the drivers to probe. Then when the bus
starts, codecs that are physically present on the bus will attach and be
initialized in the update_status callback.

It's perfectly acceptable for devices to be exposed in ACPI and not be
present on a board. The bus wouldn't know what is needed.

I am still not clear on what the "early card registration" issue might be.

Can you clarify which codec registers are accessed in that case, are
those supposed to be managed with regmap? one possibility is that we
need to make sure the codec drivers are in regmap cache_only probe at
the probe time, that may prevent this sort of uncontrolled register
access. I had a PR on this that I haven't touched in a while, see [1]

I do recall some issues with the codec jacks, where if the card
registration happens too late the codec might have suspended. But we
added pm_runtime_resume_and_get in the set_jack_detect callbacks, so
that was solved.

[1] https://github.com/thesofproject/linux/pull/3941

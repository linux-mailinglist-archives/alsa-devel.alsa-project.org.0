Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79617188282
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 12:49:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF7991876;
	Tue, 17 Mar 2020 12:48:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF7991876
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584445789;
	bh=376n0G/hUq2W2UMj+xgT4FoH2GQDkz9hCdBaxXLV5fU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EOWaiEme94oRyCgeOW2o1Yz2+iM4vlsPTQYb4jeUpGlEA8RYdcKfbP17SXCWzclPe
	 JvKNwWPcfAI4Q+VtEbGnY/Mw4jEJZbXw8itCoYGky3smcTO5CaHr8v8M/omZbH1IHA
	 HRW+GELndO/D8bxMVTvgl16y/EGF2/jf16tE2IfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 593EDF80256;
	Tue, 17 Mar 2020 12:47:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F946F80232; Tue, 17 Mar 2020 12:46:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EACEF80058
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 12:46:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EACEF80058
IronPort-SDR: K50TogvVVhwL0JgVpvipBHd1guU0vVZQgdAEXntZE6aNphRRLwrsHihoJCknWMo5x+xwTMCHUH
 us4lPjpMBSEg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 04:46:03 -0700
IronPort-SDR: 3xBIbw4HL+3Ka+aa9aOOL7v1BynGHTPQpVXXDqq07GIrzY7sfJ9+OeIhHlLOg3ns12ZLvO5FTt
 gtr9SFMpYaUg==
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; d="scan'208";a="417517010"
Received: from mgorski-mobl.ger.corp.intel.com (HELO [10.251.3.203])
 ([10.251.3.203])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 04:46:02 -0700
Subject: Re: [PATCH] ucm2: hdadsp: add basic ucm config
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20200306113031.713-1-mateusz.gorski@linux.intel.com>
 <4e2e3345-81d0-c698-d589-d4db5faff288@perex.cz>
 <8cd9195d-6104-88ed-22ed-c3151334ee76@linux.intel.com>
 <1bd9d86c-e19f-183c-5355-5b7359c6e4c0@perex.cz>
From: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Message-ID: <7a44ec22-ed38-5ddd-0f04-097b2befd796@linux.intel.com>
Date: Tue, 17 Mar 2020 12:45:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1bd9d86c-e19f-183c-5355-5b7359c6e4c0@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: pl
Cc: cezary.rojewski@intel.com, tiwai@suse.com
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


>>>> Basic UCM configuration for HDA DSP generic enabling codec playback 
>>>> and
>>>> capture on both HDA codec and DMIC ports.
>>>
>>> Could you describe for what Linux driver (source code) is this
>>> configuration?
>>
>>
>> This file is for Intel Skylake SST driver. Information added in v2.
>
> Ok, do we have this code in the vanilla linux kernel? Which .c file? 
> The driver name 'hdadsp' looks suspicious. We usually have a delimiter 
> in the driver name (like sof-hda-dsp).


Yes, it is a part of Skylake driver, "hdadsp" is the name of sound card 
created on machine when using HDA generic machine driver. This machine 
driver is made of 2 .c files:

     - skl_hda_dsp_common.c
     - skl_hda_dsp_generic.c

both are located in: sound/soc/intel/boards/

Example on production laptop:

test@test-Swift-SF515-51T:/proc/asound$ cat cards
  0 [hdadsp         ]: hda-dsp - hda-dsp
                       WL-SwiftSF515_51T-V1.02-Guinness_WL

>
>>>> +ValueDefaults {
>>>> +    PlaybackChannels "2"
>>>> +    PlaybackPriority "1"
>>>> +    CaptureChannels "2"
>>>> +    CapturePriority "2"
>>>> +}
>>>
>>> Remove PlaybackChannel and Priority defaults. The priorities should be
>>> defined in the device section.
>
> I will check...
>
>>
>>
>> Thanks, moved to device section in v2.
>>
>>
>>>> +
>>>> +SectionDefaults [
>>>> +    cdev "hw:hdadsp"
>>>
>>> It should be "hw:${CardId}" for ucm2.
>>
>>
>> Thanks, applied in v2.
>>
>>
>>>> +    cset "name='codec0_out mo media0_in mi Switch' 1"
>>>> +    cset "name='media0_out mo codec0_in mi Switch' 1"
>>>> +    cset "name='mch_cap_out mo mch_cap_in mi Switch' 1"
>>>> +]
>>>
>>> This file does not define any devices. Does pulseaudio work with this
>>> configuration?
>>
>>
>> Devices added in v2. Regarding pulseaudio - are there any guidelines on
>> how to test UCM files with it? These UCM files were writted mainly based
>> on existing ones for other cards. Of course basic tests were made.
>
> I wrote an ucm validator:
>
> https://github.com/alsa-project/alsa-tests/tree/master/python/ucm-validator 
>
>
> Just type 'make' in the ucm-validator directory, the alsa-info.sh 
> output should be added to the configs subtree.
>
> The PA should be used latest from gitlab with the volume control and 
> HDMI support.
>
>                     Jaroslav


Thanks, used the validator on PATCH v2, it pointed out one more thing to 
be corrected. One thing that I've noticed - there are some problems when 
validating "included" files, for example:

<skylake-rt286/Hdmi1.conf>
<skylake-rt286/Hdmi2.conf>

raise "aconfig.AlsaConfigError: unable to load config" error

Mateusz


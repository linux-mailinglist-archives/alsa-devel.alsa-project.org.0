Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5602F41F0
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 03:43:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 766B416BD;
	Wed, 13 Jan 2021 03:42:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 766B416BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610505808;
	bh=dhU7I9HyAsxaz7FP97BDyV/MkKB+wO+rimTqxwk4KCk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PQHLrPf6l1LyUFvAwUoiiJe1gY/4aQ6yZ5AFs0TtcDyfTdOghWiDW3lkUclOiPd7Y
	 NYkNrzq2+4yDcPmrIahXEXaRtYqQ8pEEdbuofBR5dox4kccyTDMVIa+9TPcAuSeBRg
	 1mgINDYeoj3jzvIAPL1hz3iH+sueT73/i9VUftFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3A2BF80254;
	Wed, 13 Jan 2021 03:41:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06E05F801ED; Wed, 13 Jan 2021 03:41:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DBEFF80085
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 03:41:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DBEFF80085
IronPort-SDR: immKiRPRpMVHvf116Rj4LwO3dbz11yW6sEaSk/U2tGzMYsl12LakuBqGkd9qQSL7M/P+2ubmlI
 bpojm6n6kS6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="165226869"
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; d="scan'208";a="165226869"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 18:41:39 -0800
IronPort-SDR: AREd7oQnznsddHzTa3z54QGeZQx6RInVrOUVE9nAlPLf0TiToBCTCICK14AlmuhoVNUVQvaqh9
 TAdjZQmTT4cQ==
X-IronPort-AV: E=Sophos;i="5.79,343,1602572400"; d="scan'208";a="353280739"
Received: from ncorral-mobl2.amr.corp.intel.com (HELO [10.212.67.147])
 ([10.212.67.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2021 18:41:38 -0800
Subject: Re: [PATCH v2 2/2] ASoC: rt715:add Mic Mute LED control support
To: "Yuan, Perry" <Perry.Yuan@dell.com>,
 "Limonciello, Mario" <Mario.Limonciello@dell.com>,
 "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
References: <20201228133831.17464-1-Perry_Yuan@Dell.com>
 <a12075b1-09f3-a993-eace-008224ca5f52@linux.intel.com>
 <SJ0PR19MB4528225B226C4F9AA7F7ECBE84AA0@SJ0PR19MB4528.namprd19.prod.outlook.com>
 <BY3PR19MB49130372226D65A235757BA1FAAA0@BY3PR19MB4913.namprd19.prod.outlook.com>
 <SJ0PR19MB4528FA846E29C0BB197725CA84A90@SJ0PR19MB4528.namprd19.prod.outlook.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d133c0fe-c9c6-fc55-8c08-5e9a3cf0d6e7@linux.intel.com>
Date: Tue, 12 Jan 2021 20:41:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <SJ0PR19MB4528FA846E29C0BB197725CA84A90@SJ0PR19MB4528.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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


>>>>> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
>>>>> +	/* Privacy LED Trigger State Changed by muted/unmute switch */
>>>>> +	if (mc->invert) {
>>>>> +		val0 = ucontrol->value.integer.value[0];
>>>>> +		val1 = ucontrol->value.integer.value[1];
>>>>> +		if (val0 == 1 && val1 == 1) {
>>>>> +			rt715->micmute_led = LED_OFF;
>>>>> +			ledtrig_audio_set(LED_AUDIO_MICMUTE,
>>>>> +					rt715->micmute_led ? LED_ON :
>>>> LED_OFF);
>>>>> +		} else if (val0 == 0 && val1 == 0) {
>>>>> +			rt715->micmute_led = LED_ON;
>>>>> +			ledtrig_audio_set(LED_AUDIO_MICMUTE,
>>>>> +					rt715->micmute_led ? LED_ON :
>>>> LED_OFF);
>>>>> +		}
>>>>> +	}
>>>>> +#endif
>>>>
>>>> Should this be activated for specific DMI quirks? This driver is
>>>> used in
>>> non-Dell
>>>> platforms (I am thinking of Intel RVPs or Realtek daughterboards), I
>>>> am not sure if a build-time behavior change makes sense.
>>>>
>>>> Or conversely could we just set the LEDs unconditionally if doing so
>>>> is harmless?
>>>
>>> The current mic mute led setting path is not common used for other
>>> vendors, just Dell platform support this mic mute led set operation.
>>>
>>> Do you think that I need to add one DMI quirk in the next version ?
>>> If so, I can add that.
>>>
>>>
>>
>>
>> In the HDA audio case this is modeled off of, the code runs whether or not a
>> vendor has support for a mic mute LED.  The calls to ledtrig_audio_set should
>> be a no-op.  I agree with @Pierre-Louis Bossart in this case, we should just be
>> running it whether or not dell-privacy is compiled in.  If another vendor
>> chooses to add LED support they'll just need to set up their ledtrig supported
>> backend and not change codec code.
> 
> Hi @Pierre-Louis Bossart
> Seems like that we have two way to go.
> * DMI quirks,seems like that it needs to maintain the quirk list when vendors have new system to support.
> * We just set the mic mute led state unconditionally .
> 
> Which way would you prefer for next patch review?

Maintaining quirks is a hassle, it's much simpler and consistent with 
HDaudio if the leds are set unconditionally. Thanks!

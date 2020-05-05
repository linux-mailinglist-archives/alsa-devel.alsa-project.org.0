Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1854D1C63A2
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 00:06:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A81161760;
	Wed,  6 May 2020 00:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A81161760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588716375;
	bh=PxfTSojCmWJMyZ1e+oYPK9YFM16RGgXsOgXo18mMnK0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e2hV8jtmfrM9GpFgHoYb3eSm4BKGabBBG2eN6zUtT7lFJ00JlPkcQ/VpfYf3XZvMU
	 Z25Oa33DMYPYddZ2vWFoj9pcTivkoAOkYfrGfDNpyD1mQ2BeMG+lL9pMNrWwgCrNrV
	 rXlSCv+ofdSyZy6wNsZ65foDL+GpfrXTKjrlLRRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC771F8025E;
	Wed,  6 May 2020 00:04:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97B21F8023E; Wed,  6 May 2020 00:04:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79511F800AD
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 00:04:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79511F800AD
IronPort-SDR: jC34H8c+QVXgiFdKWZ6Nd+B8qPcyAOGibJaJP6VXFJUXPxxIA/O7DS41CdPoRiF7MQTYzoy8rh
 7Cflu9frYZ0Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2020 15:04:20 -0700
IronPort-SDR: y6UqgH1vxBwoaEF3R9aoJcRP4PwHDFLbYrd6lJw4h/SkEGEpO/usT3X8LjWcUD0ncc8j/uixfi
 DIxqFLnT0P7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,356,1583222400"; d="scan'208";a="278022605"
Received: from krogers-mobl1.amr.corp.intel.com (HELO [10.255.229.42])
 ([10.255.229.42])
 by orsmga002.jf.intel.com with ESMTP; 05 May 2020 15:04:16 -0700
Subject: Re: [PATCH V2] ASoC: Intel: boards: Use FS as nau8825 sysclk in
 nau88125_* machine
To: =?UTF-8?Q?Rados=c5=82aw_Biernacki?= <rad@semihalf.com>
References: <20200501193141.30293-1-rad@semihalf.com>
 <3ad44b75-387f-da75-d7b2-3a16ed00550c@linux.intel.com>
 <CAOs-w0LPeKgooa_98x_Jkzus-Y5Kad7pDby0CriDGb6nTp_6sA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8b97bf43-ddd8-df81-90e7-9e87c19af1ab@linux.intel.com>
Date: Tue, 5 May 2020 10:00:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAOs-w0LPeKgooa_98x_Jkzus-Y5Kad7pDby0CriDGb6nTp_6sA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Lech Betlej <Lech.Betlej@intel.com>, alsa-devel@alsa-project.org,
 Todd Broch <tbroch@google.com>, Harshapriya <harshapriya.n@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, John Hsu <KCHSU0@nuvoton.com>,
 Takashi Iwai <tiwai@suse.com>, "Sienkiewicz,
 Michal" <michal.sienkiewicz@intel.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Marcin Wojtas <mw@semihalf.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 Alex Levin <levinale@google.com>
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


>>> This single fix address two issues on machines with nau88125:
>>> 1) Audio distortion, due to lack of required clock rate on MCLK line
>>> 2) Loud audible "pops" on headphones if there is no sysclk during nau8825
>>>      playback power up sequence
>>>
>>> Explanation for:
>>> 1) Due to Skylake HW limitation, MCLK pin can only output 24MHz clk
>>>      rate (it can be only connected to XTAL parent clk). The BCLK pin
>>>      can be driven by dividers and therefore FW is able to set it to rate
>>>      required by chosen audio format. According to nau8825 datasheet, 256*FS
>>>      sysclk gives the best audio quality and the only way to achieve this
>>>      (taking into account the above limitations) its to regenerate the MCLK
>>>      from BCLK on nau8825 side by FFL. Without required clk rate, audio is
>>>      distorted by added harmonics.
>>
>> The BCLK is going to be a multiple of 50 * Fs due to clocking
>> restrictions. Can the codec regenerate a good-enough sysclk from this?
> 
> According to Intel, silicon has a limitation, on SKL/KBL only clk_id =
> SKL_XTAL, .name = "xtal" is available for IO domain.
> As mentioned in the commit:
> MCLK is generated by using 24MHz Xtal directly or applying a divider
> (so no way of achieving the rate required by audio format).
> BCLK/FS is generated from 24MHz and uses dividers and additional
> padding bits are used to match the clock source.
> Next gen silicon has the possibility of using additional clock sources.
> 
> Summing up, using MCLK from SKL to NAU88L25 is not an option.
> The only option we found is to use BCLK and regen the required clock
> rate by FLL on the NAU88l25 side.

Right, this 24 MHz is a recurring problem.
But what I was asking was if the NAU8825 is fine working with e.g. a 
2.4MHz bit clock. i.e. with 25 bit slots or padding at the end of the frame?

> 
>>>
>>> 2) Currently Skylake does not output MCLK/FS when the back-end DAI op
>>>      hw_param is called, so we cannot switch to MCLK/FS in hw_param.  This
>>>      patch reduces pop by letting nau8825 keep using its internal VCO clock
>>>      during widget power up sequence, until SNDRV_PCM_TRIGGER_START when
>>>      MCLK/FS is available. Once device resumes, the system will only enable
>>>      power sequence for playback without doing hardware parameter, audio
>>>      format, and PLL configure. In the mean time, the jack detecion sequence
>>>      has changed PLL parameters and switched to internal clock. Thus, the
>>>      playback signal distorted without correct PLL parameters.  That is why
>>>      we need to configure the PLL again in SNDRV_PCM_TRIGGER_RESUME case.
>>
>> IIRC the FS can be controlled with the clk_ api with the Skylake driver,
>> as done for some KBL platforms. Or is this not supported by the firmware
>> used by this machine?
> 
> According to Ben, SKL had limitations in FW for managing the clk's
> back in the days.
> Can you point to the other driver you mention so we can cross check?

There are two KBL drivers that control the SSP clocks from the machine 
driver, but indeed I don't know if this would work on Firmware, it'd be 
a question for Lech/Cezary.

kbl_rt5663_max98927.c:          ret = clk_prepare_enable(priv->mclk);
kbl_rt5663_max98927.c:          ret = clk_prepare_enable(priv->sclk);
kbl_rt5663_rt5514_max98927.c:           ret = 
clk_prepare_enable(priv->mclk);
kbl_rt5663_rt5514_max98927.c:           ret = 
clk_prepare_enable(priv->sclk);
kbl_rt5663_rt5514_max98927.c:                   ret = 
clk_prepare_enable(priv->mclk);



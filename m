Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DAD261932
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 20:08:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 332DC170D;
	Tue,  8 Sep 2020 20:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 332DC170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599588536;
	bh=aWAisT3RrWhYpaKSdJHJ/JiZbkmEI3GaxCf21x8opoE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p/xvOcAnA0oMDwWqVRUdpCNnEum/ov0aJu/Iq35vDlSEjagUkKQTPwJKXlsy+i92r
	 WLwfcM2oO6y2fOxfDqwmdEz9dLr9HkYaezlwZwfys/RNb4F33BBaIossvkw4iybhfm
	 JUr5Ol05AsAPvDe5mqqUo2nZIHDqYJ7vL3nj4x7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49899F8026F;
	Tue,  8 Sep 2020 20:07:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9437F80264; Tue,  8 Sep 2020 20:07:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2FBEF800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 20:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2FBEF800FD
IronPort-SDR: nTyhESXMqTiwZpV/oDRAR42i9+r1Y8qFEbX3ZlVUifh+R4CPVEejb8prMdSD0ITb2JFR+7aQ7Q
 kx+Ff/+aot8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="157473920"
X-IronPort-AV: E=Sophos;i="5.76,406,1592895600"; d="scan'208";a="157473920"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 11:06:54 -0700
IronPort-SDR: D7lRjq0KnUeXpg79c/qKhFkGQnu4BR8K3/rz8BD9r9u56NUWaK9fhKhKDjKq1GB86GOcKRfwTs
 XPwilyYLhDsQ==
X-IronPort-AV: E=Sophos;i="5.76,406,1592895600"; d="scan'208";a="328583674"
Received: from mschen-mobl2.amr.corp.intel.com (HELO [10.213.174.122])
 ([10.213.174.122])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 11:06:50 -0700
Subject: Re: [PATCH V2] ASoC: Intel: boards: Use FS as nau8825 sysclk in
 nau88125_* machine
To: =?UTF-8?Q?Rados=c5=82aw_Biernacki?= <rad@semihalf.com>
References: <20200501193141.30293-1-rad@semihalf.com>
 <3ad44b75-387f-da75-d7b2-3a16ed00550c@linux.intel.com>
 <CAOs-w0LPeKgooa_98x_Jkzus-Y5Kad7pDby0CriDGb6nTp_6sA@mail.gmail.com>
 <8b97bf43-ddd8-df81-90e7-9e87c19af1ab@linux.intel.com>
 <CAOs-w0KvKcRnDkMtdAV2n_3XLfwk9KgM65QEO=6+qNshobJx3g@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2a88f81f-c7a3-f9fc-06a3-c39496b57d0c@linux.intel.com>
Date: Tue, 8 Sep 2020 13:06:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOs-w0KvKcRnDkMtdAV2n_3XLfwk9KgM65QEO=6+qNshobJx3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Lech Betlej <Lech.Betlej@intel.com>, alsa-devel@alsa-project.org,
 Todd Broch <tbroch@google.com>, Harshapriya <harshapriya.n@intel.com>,
 John Hsu <KCHSU0@nuvoton.com>, Alex Levin <levinale@google.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "Sienkiewicz, Michal" <michal.sienkiewicz@intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Marcin Wojtas <mw@semihalf.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>, Yong Zhi <yong.zhi@intel.com>
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



On 9/8/20 12:42 PM, Radosław Biernacki wrote:
> Sorry for missing the response for so long.
> Somehow lost this thread in my mailbox.

That happens to all of us!

> śr., 6 maj 2020 o 00:04 Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> napisał(a):
>>
>>
>>>>> This single fix address two issues on machines with nau88125:
>>>>> 1) Audio distortion, due to lack of required clock rate on MCLK line
>>>>> 2) Loud audible "pops" on headphones if there is no sysclk during nau8825
>>>>>       playback power up sequence
>>>>>
>>>>> Explanation for:
>>>>> 1) Due to Skylake HW limitation, MCLK pin can only output 24MHz clk
>>>>>       rate (it can be only connected to XTAL parent clk). The BCLK pin
>>>>>       can be driven by dividers and therefore FW is able to set it to rate
>>>>>       required by chosen audio format. According to nau8825 datasheet, 256*FS
>>>>>       sysclk gives the best audio quality and the only way to achieve this
>>>>>       (taking into account the above limitations) its to regenerate the MCLK
>>>>>       from BCLK on nau8825 side by FFL. Without required clk rate, audio is
>>>>>       distorted by added harmonics.
>>>>
>>>> The BCLK is going to be a multiple of 50 * Fs due to clocking
>>>> restrictions. Can the codec regenerate a good-enough sysclk from this?
>>>
>>> According to Intel, silicon has a limitation, on SKL/KBL only clk_id =
>>> SKL_XTAL, .name = "xtal" is available for IO domain.
>>> As mentioned in the commit:
>>> MCLK is generated by using 24MHz Xtal directly or applying a divider
>>> (so no way of achieving the rate required by audio format).
>>> BCLK/FS is generated from 24MHz and uses dividers and additional
>>> padding bits are used to match the clock source.
>>> Next gen silicon has the possibility of using additional clock sources.
>>>
>>> Summing up, using MCLK from SKL to NAU88L25 is not an option.
>>> The only option we found is to use BCLK and regen the required clock
>>> rate by FLL on the NAU88l25 side.
>>
>> Right, this 24 MHz is a recurring problem.
>> But what I was asking was if the NAU8825 is fine working with e.g. a
>> 2.4MHz bit clock. i.e. with 25 bit slots or padding at the end of the frame?
> 
>  From our tests NAU8825 is working fine with these parameters.
> Also the output audio signal looks fine on the scope and FFT and there
> are no audible glitches.
> 
>>
>>>
>>>>>
>>>>> 2) Currently Skylake does not output MCLK/FS when the back-end DAI op
>>>>>       hw_param is called, so we cannot switch to MCLK/FS in hw_param.  This
>>>>>       patch reduces pop by letting nau8825 keep using its internal VCO clock
>>>>>       during widget power up sequence, until SNDRV_PCM_TRIGGER_START when
>>>>>       MCLK/FS is available. Once device resumes, the system will only enable
>>>>>       power sequence for playback without doing hardware parameter, audio
>>>>>       format, and PLL configure. In the mean time, the jack detecion sequence
>>>>>       has changed PLL parameters and switched to internal clock. Thus, the
>>>>>       playback signal distorted without correct PLL parameters.  That is why
>>>>>       we need to configure the PLL again in SNDRV_PCM_TRIGGER_RESUME case.
>>>>
>>>> IIRC the FS can be controlled with the clk_ api with the Skylake driver,
>>>> as done for some KBL platforms. Or is this not supported by the firmware
>>>> used by this machine?
>>>
>>> According to Ben, SKL had limitations in FW for managing the clk's
>>> back in the days.
>>> Can you point to the other driver you mention so we can cross check?
>>
>> There are two KBL drivers that control the SSP clocks from the machine
>> driver, but indeed I don't know if this would work on Firmware, it'd be
>> a question for Lech/Cezary.
>>
>> kbl_rt5663_max98927.c:          ret = clk_prepare_enable(priv->mclk);
>> kbl_rt5663_max98927.c:          ret = clk_prepare_enable(priv->sclk);
>> kbl_rt5663_rt5514_max98927.c:           ret =
>> clk_prepare_enable(priv->mclk);
>> kbl_rt5663_rt5514_max98927.c:           ret =
>> clk_prepare_enable(priv->sclk);
>> kbl_rt5663_rt5514_max98927.c:                   ret =
>> clk_prepare_enable(priv->mclk);
>>
> 
> Czarek answered this and we got the same response from other Intel
> devs while consulting this change:
> FW cannot request a chosen rate (48k) for MCLK pin as it does not
> "align with what's present on SKL hw".
> 
> The only way we found out for NAU8825 to cooperate at chosen rate with
> SKL HW is to regen the MCLK from BCLK by FLL as mentioned above.
> NHTL is used to set SSP0 (48k, 24/25 bit on 24MHz crystal).
> If I get all of this right, use of NHTL and HW "abilities" would
> explain why there is no call to change SSP from a machine driver.
> 
> 
> If all of this is ok I will send V3 with msleep() removed.

Sounds good.

You may want to simplify your commit message and just state what you 
described, e.g.

"Since 64xfs clocks cannot be generated, the NAU8825 is configured to 
re-generate its system clock from the BCLK using the FLL. The link is 
configured to use a 48kHz frame rate, and 24 bits in 25-bit slot. The 
SSP configuration is extracted from NHLT settings and not dynamically 
changed. Listening tests and measurements do not show any distortion or 
issues".




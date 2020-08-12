Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D89E3242C69
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Aug 2020 17:56:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58D59166A;
	Wed, 12 Aug 2020 17:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58D59166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597247791;
	bh=Le5Nfb5PUj5X/uBADCdRYKcYjZ8ZsFrm6yPslphSMaA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BeeMr+ZSmzcXnN+q+bfRYE0UifcYVdF6RCq2oNL66NuUqhO+cV3C3dZlVmRtCNE4q
	 k5HCIFrmRtep6UgWEE0olyIuKCor5vQ/fChbYDaI4NL8fkRtPEZJFgkiGysna9aKE1
	 CESLX3CI7RH6FwXSEzCu9xeeMiyn3Q4/fUgurSAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8769AF80147;
	Wed, 12 Aug 2020 17:54:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA5FAF8022B; Wed, 12 Aug 2020 17:54:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41569F800D3
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 17:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41569F800D3
IronPort-SDR: Ya5clZ4LWAJmWJaXX4TYSdyrJDv7/BVxRmcBR98Tq3EAhBzm+WXiQdLhwsesJ0Ktm+KPfZD5ha
 41vpzFlhRHkA==
X-IronPort-AV: E=McAfee;i="6000,8403,9711"; a="155111182"
X-IronPort-AV: E=Sophos;i="5.76,304,1592895600"; d="scan'208";a="155111182"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 08:54:34 -0700
IronPort-SDR: D+QUvdwEtf6cbV7gegrOvx5tQQPff11Wy+K1Y4rvg6YYj12jUsZTn8OHPKa04ZNRcXPIwXXcD7
 qT6i8sXoF05g==
X-IronPort-AV: E=Sophos;i="5.76,304,1592895600"; d="scan'208";a="495553516"
Received: from mbharapa-mobl.amr.corp.intel.com (HELO [10.212.31.62])
 ([10.212.31.62])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2020 08:54:31 -0700
Subject: Re: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
To: Takashi Iwai <tiwai@suse.de>
References: <3f3baf5e-f73d-9cd6-cbfb-36746071e126@linux.intel.com>
 <DM6PR11MB3642AC7F8EC47EB48B384D4797450@DM6PR11MB3642.namprd11.prod.outlook.com>
 <CAGvk5PogmqfEnFRA8hzby+AGgbOSvbELamh_1=eA9KTpyBMPYQ@mail.gmail.com>
 <s5htux939x1.wl-tiwai@suse.de>
 <CAGvk5PpcmkZ2HarqeCDaXm4id=84wYs-u4vWxJunHaf09gj66g@mail.gmail.com>
 <s5ho8nh37br.wl-tiwai@suse.de>
 <CAGvk5PphzkdiNfW8hiDuqX+2eQO2FvrpzA0qR3=3VvqM3GBhAA@mail.gmail.com>
 <20200811145353.GG6967@sirena.org.uk>
 <d78f9adc-d583-f0f2-ce38-3c9175c939b8@linux.intel.com>
 <20200811172209.GM6967@sirena.org.uk>
 <CAGvk5PqGi7cXthLHFi4NyypxFiGnoHvD9vp+5nJdH-_VkVvcKw@mail.gmail.com>
 <s5hr1scz908.wl-tiwai@suse.de>
 <CAGvk5Pp+Gk5Uk-iLdhVPWuCL0FiL9OhsaAtwkotay5JAYUNxdQ@mail.gmail.com>
 <s5hlfikz6y8.wl-tiwai@suse.de>
 <CAGvk5Pq3rEGJX=WjriPfWg_sEAVWHGZ9S=4iySNfYaHX7Xcw0g@mail.gmail.com>
 <s5h8sekz4ox.wl-tiwai@suse.de>
 <e4cc6231-8b19-c145-1b18-91d3a00131d3@linux.intel.com>
 <s5hv9hnx6am.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <be45d821-57c6-6ca5-0864-ac3aa521d82e@linux.intel.com>
Date: Wed, 12 Aug 2020 10:54:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hv9hnx6am.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 "yuhsuan@google.com" <yuhsuan@google.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Lu,
 Brent" <brent.lu@intel.com>, Damian van Soelen <dj.vsoelen@gmail.com>
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



On 8/12/20 9:55 AM, Takashi Iwai wrote:
> On Wed, 12 Aug 2020 16:46:40 +0200,
> Pierre-Louis Bossart wrote:
>>
>>
>>>>>>>> After doing some experiments, I think I can identify the problem more precisely.
>>>>>>>> 1. aplay can not reproduce this issue because it writes samples
>>>>>>>> immediately when there are some space in the buffer. However, you can
>>>>>>>> add --test-position to see how the delay grows with period size 256.
>>>>>>>>> aplay -Dhw:1,0 --period-size=256 --buffer-size=480 /dev/zero -d 1 -f dat --test-position
>>>>>>>> Playing raw data '/dev/zero' : Signed 16 bit Little Endian, Rate 48000
>>>>>>>> Hz, Stereo
>>>>>>>> Suspicious buffer position (1 total): avail = 0, delay = 2064, buffer = 512
>>>>>>>> Suspicious buffer position (2 total): avail = 0, delay = 2064, buffer = 512
>>>>>>>> Suspicious buffer position (3 total): avail = 0, delay = 2096, buffer = 512
>>>>>>>> ...
>>>>>>>
>>>>>>> Isn't this about the alignment of the buffer size against the period
>>>>>>> size, not the period size itself?  i.e. in the example above, the
>>>>>>> buffer size isn't a multiple of period size, and DSP can't handle if
>>>>>>> the position overlaps the buffer size in a half way.
>>>>>>>
>>>>>>> If that's the problem (and it's an oft-seen restriction), the right
>>>>>>> constraint is
>>>>>>>     snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
>>>>>>>
>>>>>>>
>>>>>>> Takashi
>>>>>> Oh sorry for my typo. The issue happens no matter what buffer size is
>>>>>> set. Actually, even if I want to set 480, it will change to 512
>>>>>> automatically.
>>>>>> Suspicious buffer position (1 total): avail = 0, delay = 2064, buffer
>>>>>> = 512 <-this one is the buffer size
>>>>>
>>>>> OK, then it means that the buffer size alignment is already in place.
>>>>>
>>>>> And this large delay won't happen if you use period size 240?
>>>>>
>>>>>
>>>>> Takashi
>>>> Yes! If I set the period size to 240, it will not print "Suspicious
>>>> buffer position ..."
>>>
>>> So it sounds like DSP handles the delay report incorrectly.
>>> Then it comes to another question: the driver supports both SOF and
>>> SST.  Is there the behavior difference between both DSPs wrt this
>>> delay issue?
>>
>> I still don't get what the issue is. The two following cases work fine
>> with the SST/Atom driver:
>>
>> root@chrx:~# aplay -Dhw:0,0 --period-size=240 --buffer-size=480
>> /dev/zero -d 2 -f dat --test-position
>> Playing raw data '/dev/zero' : Signed 16 bit Little Endian, Rate 48000
>> Hz, Stereo
>> root@chrx:~# aplay -Dhw:0,0 --period-size=960 --buffer-size=4800
>> /dev/zero -d 2 -f dat --test-position
>> Playing raw data '/dev/zero' : Signed 16 bit Little Endian, Rate 48000
>> Hz, Stereo
> 
> What if with --period-size=256 --buffer-size=512 and --test-position?
> Can you reproduce the problem in your side?

Yes indeed with the existing driver:

root@chrx:~# aplay -Dhw:0,0 --period-size=256 --buffer-size=512 
/dev/zero -d 2 -f dat --test-position
Playing raw data '/dev/zero' : Signed 16 bit Little Endian, Rate 48000 
Hz, Stereo
underrun!!! (at least 0.312 ms long)
underrun!!! (at least 0.326 ms long)
Suspicious buffer position (1 total): avail = 0, delay = 2064, buffer = 512
Suspicious buffer position (2 total): avail = 0, delay = 2064, buffer = 512
Suspicious buffer position (3 total): avail = 0, delay = 2080, buffer = 512
Suspicious buffer position (4 total): avail = 0, delay = 2080, buffer = 512
Suspicious buffer position (5 total): avail = 0, delay = 2096, buffer = 512
Suspicious buffer position (6 total): avail = 0, delay = 2096, buffer = 512

but the new constraint to force a 1ms step added in the patch1 should 
preclude this from happening.

>> The existing code has this:
>>
>> 	/* Make sure, that the period size is always even */
>> 	snd_pcm_hw_constraint_step(substream->runtime, 0,
>> 			   SNDRV_PCM_HW_PARAM_PERIODS, 2);
>>
>> 	return snd_pcm_hw_constraint_integer(runtime,
>> 			 SNDRV_PCM_HW_PARAM_PERIODS);
>>
>> and with the addition of period size being a multiple of 1ms all
>> requirements should be met?
> 
> I also wonder what's really missing, too :)
> 
> BTW, I took a look back at the thread, and CRAS seems using a very
> large buffer, namely:
> [   52.434791] sound pcmC1D0p:   PERIOD_SIZE [240:240]
> [   52.434802] sound pcmC1D0p:   BUFFER_SIZE [204480:204480]

yes, that's 852 periods and 4.260 seconds. Never seen such values :-)


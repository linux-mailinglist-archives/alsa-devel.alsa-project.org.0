Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F36F18A191
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 18:31:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A822D172F;
	Wed, 18 Mar 2020 18:30:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A822D172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584552687;
	bh=/kp/C7LqUJOR6O2uDMr2gwAw3OFaZT1URwyeIKK1wWU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gm6qvrizbKi9T8DXU2sh/C0PKZQBPQUY4dNoFJGHqNPcfc61ap15sXDkfE5VuPY2y
	 cdV19ui5m5vvWjEpZmwXUY5Xb4Vn5A0WvrcW4YIk28UqpqTWC8T2lO6I1G4DiZiQ6W
	 1l6Sr/269uB8VQroOlkXy8i84hbKLe3ilBHgzP04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94F7AF80132;
	Wed, 18 Mar 2020 18:29:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAED4F80139; Wed, 18 Mar 2020 18:29:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10AA1F800C0
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 18:29:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10AA1F800C0
IronPort-SDR: cKjtTWCB1HOoSMsCq4ZBE34baIlXINdY4hhBeqCmDTK+os1YWFzoWCqG9lCx1ENH8o3zcDvmtk
 5OatZ3Qnjwiw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 10:29:32 -0700
IronPort-SDR: 8wjTKwEGjtOqK84tOMlzANuDJyel22KWeBhiweWj8uGXFRt612yrbs31gBHCbTRjoygKPMcdg3
 t+rUMhfSR2wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; d="scan'208";a="418024231"
Received: from nali1-mobl3.amr.corp.intel.com (HELO [10.255.33.194])
 ([10.255.33.194])
 by orsmga005.jf.intel.com with ESMTP; 18 Mar 2020 10:29:30 -0700
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
To: Dominik Brodowski <linux@dominikbrodowski.net>
References: <20200318063022.GA116342@light.dominikbrodowski.net>
 <41d0b2b5-6014-6fab-b6a2-7a7dbc4fe020@linux.intel.com>
 <20200318123930.GA2433@light.dominikbrodowski.net>
 <d7a357c5-54af-3e69-771c-d7ea83c6fbb7@linux.intel.com>
 <20200318162029.GA3999@light.dominikbrodowski.net>
 <d974b46b-2899-03c2-0e98-88237f23f1e2@linux.intel.com>
 <20200318171912.GA6203@light.dominikbrodowski.net>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ea09e20f-d7d3-fde2-2c52-07c554d78e5e@linux.intel.com>
Date: Wed, 18 Mar 2020 12:29:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200318171912.GA6203@light.dominikbrodowski.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, alsa-devel@alsa-project.org, curtis@malainey.com,
 Keyon Jie <yang.jie@linux.intel.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com, liam.r.girdwood@linux.intel.com, broonie@kernel.org
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



On 3/18/20 12:19 PM, Dominik Brodowski wrote:
> On Wed, Mar 18, 2020 at 12:08:24PM -0500, Pierre-Louis Bossart wrote:
>> On 3/18/20 11:20 AM, Dominik Brodowski wrote:
>>> On Wed, Mar 18, 2020 at 10:13:54AM -0500, Pierre-Louis Bossart wrote:
>>>>
>>>>
>>>>>>> While 5.5.x works fine, mainline as of ac309e7744be (v5.6-rc6+) causes me
>>>>>>> some sound-related trouble: after boot, the sound works fine -- but once I
>>>>>>> suspend and resume my broadwell-based XPS13, I need to switch to headphone
>>>>>>> and back to speaker to hear something. But what I hear isn't music but
>>>>>>> garbled output.
>>>>
>>>> It's my understanding that the use of the haswell driver is opt-in for Dell
>>>> XPS13 9343. When we run the SOF driver on this device, we have to explicitly
>>>> bypass an ACPI quirk that forces HDAudio to be used:
>>>>
>>>> https://github.com/thesofproject/linux/commit/944b6a2d620a556424ed4195c8428485fcb6c2bd
>>>>
>>>> Have you tried to run in plain vanilla HDAudio mode?
>>>
>>> I had (see 18d78b64fddc), but not any more in years (and I'd like to keep
>>> using I2S, which has worked flawlessly in these years).
>>
>> ok. I don't think Intel folks have this device available, or it's used for
>> other things, but if you want to bisect on you may want to use [1] to solve
>> DRM issues. I used it to make Broadwell/Samus work again with SOF.
>>
>> [1] https://gitlab.freedesktop.org/drm/intel/uploads/ef10c6c27fdc53d114f827bb72b078aa/0001-drm-i915-psr-Force-PSR-probe-only-after-full-initial.patch.txt
>>
>> An alternate path would be to switch to SOF. It's still viewed as a
>> developer option but Broadwell/Samus work reliably for me and we have a
>> Broadwell-rt286 platform used for CI.
> 
> What do you mean with SOF? And no other ideas on the root cause than a
> tedious bisect?

Sound Open Firmware (SOF) [1]. You can build your own audio firmware for 
Broadwell and the driver is supported in the mainline (you'd need to 
disable the legacy driver [2]).

I can't think of any changes to that haswell/broadwell legacy driver, 
apart from Takashi's buffer management changes 3f93b1ed4ac1e2.

But there were multiple changes to the ASoC core, so it's possible that 
they impact suspend/resume. Just a blind guess.

[1] https://thesofproject.github.io/latest/index.html
[2] 
https://github.com/thesofproject/kconfig/blob/023cc25cd0b26a9757592d0bbbbe719825dd728d/sof-dev-defconfig#L20


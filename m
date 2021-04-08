Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 275813587BA
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 17:03:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A21E31669;
	Thu,  8 Apr 2021 17:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A21E31669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617894186;
	bh=Khs4MyLtYHZ0Cnzb+rFPaRll9hjUZJ5Yb0UxuyjFyK8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jJhmEFJhLCGgH978eM/JxjHvOnrpgmp9emsHlzuV9StwCyuqMiLAskzaPp0HRZAPY
	 RUmQ985i2gWFoAI4tpKQORB0g/KjnelMewJ9FSwOh75uQMo71XgvtfusPQsgrITwcc
	 FRFnClob6L9VKqaBslWKAxlOfF2dOz1pqCGt7oNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9A58F80246;
	Thu,  8 Apr 2021 17:01:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEE5DF8020B; Thu,  8 Apr 2021 17:01:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34213F80162
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 17:01:20 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E64AEA0040;
 Thu,  8 Apr 2021 17:01:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E64AEA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1617894079; bh=vb0uGxIUsNx2PFIWEM7tt31+uuf1mQ15phplCODCJJY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=o7mOHq2/syZ8jj7qiqWODy1+YgHPu82yRCPVnyPEbOtJRCa2ksPqj7W/Xc3emDGim
 ehYPz+3lyeIvm1y/52eWvzsF0685LXws52R7+IVxGw3PHnuw/PhhWPdWzO4swx8/iC
 ErLPTP2L7YCTTmfXUUKI9am8IwTnoEYf8E6I/4sI=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu,  8 Apr 2021 17:01:14 +0200 (CEST)
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk> <s5hpmz47w3i.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
Date: Thu, 8 Apr 2021 17:01:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <s5hpmz47w3i.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Dne 08. 04. 21 v 15:18 Takashi Iwai napsal(a):
> On Thu, 08 Apr 2021 14:05:02 +0200,
> Mark Brown wrote:
>>
>> On Thu, Apr 08, 2021 at 01:21:52PM +0200, Jaroslav Kysela wrote:
>>
>>> Yes, it's for UCM, but even if we don't consider this purpose, the kernel API
>>> should return some reasonable information rather than very generic (or empty)
>>> strings which are used in the native ALSA utilities for example. So, I think
>>> that we should allow to "fix" this info also from the user space rather than
>>> to extend the existing API.
>>
>> Half the point with UCM was supposed to be to rewrite the control names
>> we get from the devices into standard things that are useful for
>> userspace, having to remap things for UCM doesn't sound right.
> 
> I guess the question here is how to identify the proper profile for a
> certain platform and how to get it passed over the whole system.
> Theoretically, the rename of the card name or mixer name strings could
> be done in user-space side, too (e.g. mapping in alsa-lib or
> whatever), so I don't think it mandatory to make them variable via
> sysfs, if it's meant only for the consistency reason.

There are two things to consider (please, don't concentrate to UCM here):

1) the card identification
2) the user experience

Actually, the generic ASoC drivers are too much generic and they didn't
provide a solid information about the hardware.

Two examples:

rpi with PCM5100A DAC (not hifiberry):

# cat /proc/asound/cards
 0 [sndrpihifiberry]: RPi-simple - snd_rpi_hifiberry_dac
                      snd_rpi_hifiberry_dac

SOF SoundWire driver:

# cat /proc/asound/cards
 0 [sofsoundwire   ]: sof-soundwire - sof-soundwire
                      Intel Soundwire SOF
# amixer -c 0 info
Card hw:0 'sofsoundwire'/'Intel Soundwire SOF'
  Mixer name	: 'Intel Kabylake HDMI'
  Components	: 'HDA:8086280b,80860101,00100000 cfg-spk:4 cfg-amp:2 hs:rt711
spk:rt1308 mic:rt715'


As you can see, the information for both drivers is quite inaccurate and users
(including me) may want some flexibility to change those strings to something
else. It may resolve some UCM problems, but it's just one small piece of the
issue.

Another issue is when the udev driver loader can change some parameters which
modifies the driver behaviour and sound device structure for the given card
(as discussed in another thread).

When we have a common standard layer for the plug-and-play handling (udev), we
should concentrate to allow changing / refining of this information there.
Those strings are not used for anything else than the user space. So from my
view, there's no reason to create another mechanism to handle the overrides.
It should be a safe, fast, flexible and _optional_ solution. The udev can
alter the sysfs attributes directly without any hassle with the file
modifications or looking for another way to pass / store this information
somewhere.

I evaluated the other possibilities like store the overwrites to a file, udev
environment (per device) and they are not so easy or create extra dependencies
(alsa-lib -> libudev).

> Didn't we discuss in the past about the possibility to store the
> profile name in the card component string?

It's already possible to extract any information from the components string.
The current UCM is very flexible, but it does not allow to use a missing
information.

The main questions is: Can we make those strings writable or not? What
prevents us to not allow that?

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

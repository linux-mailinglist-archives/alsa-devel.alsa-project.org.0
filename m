Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6862079E1
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 19:07:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60D231888;
	Wed, 24 Jun 2020 19:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60D231888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593018429;
	bh=QDPrnH8l88uDMkI3oS+0NsDOQ/qiQ7euwcGmyNceXOs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H1i0ra6T9fDCutcImzlhkbSSoVSIk2R9h+NrOqrs9aQ6e0JpA1y//qTzHktElTqcX
	 CJwG852k+qWyRwEqMm3a9J7bKzaE8i/PZfbHqdiOMbe9cDJ74uW9Ip/ejQsj4IZ+r8
	 o9KlzZnan/D7smhySQIyIvbPDWuQbxYMDUyx4/G8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77579F800B2;
	Wed, 24 Jun 2020 19:05:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8650CF8015B; Wed, 24 Jun 2020 19:05:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27AACF800B2
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 19:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27AACF800B2
IronPort-SDR: r+2EQIdDInFSheFgwTi1LQ0ShhgvueLTifP85sJmglZKSwT5IsEM8mOMSa7c5F9Ng/X5T5SBaX
 kJfpq7IFl2SQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9662"; a="143656348"
X-IronPort-AV: E=Sophos;i="5.75,276,1589266800"; d="scan'208";a="143656348"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2020 10:05:15 -0700
IronPort-SDR: tYuK4cdW41eFgoFh703besg/JH3hDpmcZuGfkZdq3YPURvQc5Z8Th71TmGqI4KnzbHik44eCp7
 K0olsgLYlPNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,276,1589266800"; d="scan'208";a="279537113"
Received: from bkorrapa-mobl1.amr.corp.intel.com (HELO [10.254.109.185])
 ([10.254.109.185])
 by orsmga006.jf.intel.com with ESMTP; 24 Jun 2020 10:05:15 -0700
Subject: Re: [PATCH] ALSA: hda/hdmi: Add Intel silent stream support
To: Takashi Iwai <tiwai@suse.de>
References: <1592954796-12449-1-git-send-email-harshapriya.n@intel.com>
 <s5hr1u4lxee.wl-tiwai@suse.de>
 <f2da25c0-c740-4d44-ab66-6017622f7dde@perex.cz>
 <7dd38f98-e74a-94c0-6888-523e6189c00b@linux.intel.com>
 <s5ho8p8ifcn.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2404f45d-832d-69a0-fb3b-1981ae455f50@linux.intel.com>
Date: Wed, 24 Jun 2020 12:05:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <s5ho8p8ifcn.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Harsha Priya <harshapriya.n@intel.com>, kai.vehmanen@intel.com,
 alsa-devel@alsa-project.org, Emmanuel Jillela <emmanuel.jillela@intel.com>
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



On 6/24/20 11:43 AM, Takashi Iwai wrote:
> On Wed, 24 Jun 2020 17:33:45 +0200,
> Pierre-Louis Bossart wrote:
>>
>>
>>>>> The silent stream is enabled with a Kconfig option, as well as a kernel
>>>>> parameter should there be a need to override the build time default.
>>>>
>>>> I'm not sure whether the module option is the best interface.
>>>> An alternative is a mixer element that controls dynamically.  Then
>>>> it'll be per card unlike the module option.
>>>
>>> +1, kcontrol seems the appropriate way to control this.
>>
>> It was my suggestion to use Kconfig+kernel parameter for
>> simplicity/overrides.
>>
>> The kcontrol is a nice idea, but in practice we typically only have
>> one card dealing with HDMI.
> 
> Not really.  There are systems with two HDMI outputs from both
> integrated and discrete GPUs.  Most modern systems are only with
> hybrid graphics, though.

Ok, maybe I am mistaken, in most of the HDMI issues we've seen only one 
HDMI source.

But it's a good point that this is only supposed to be used for Intel 
whether it's a kernel parameter or a kcontrol shouldn't this be 
dependent on a PCI ID being detected and a SKYLAKE flag being set? it's 
my understanding that this applies from Skylake to TigerLake, not before.

>> It also doesn't have a UCM representation
>> so would force the use of amixer and manual configs, or the UCM file
>> would always set the mode.
> 
> But people usually use the distro kernels, so the situation is more or
> less equivalent; you'd have to adjust a module option manually if you
> want a different one from the default, and you'd have to be root to
> change it.
> 
> So, rather the question is how we should provide the setup of such
> parameter.  It's supposed to be a part of power management stuff that
> should be touched by either a smart PM tool or a manual override such
> as runtime PM setup?  Or can it be seen as a more casual tuning?

I am not aware of such tools. The only thing I know is that some of the 
HDaudio power settings are already controlled by kernel parameters, e.g.

/etc/modprobe.d/audio_powersave.conf
options snd_hda_intel power_save=1

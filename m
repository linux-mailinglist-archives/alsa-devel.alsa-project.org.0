Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6271C03FC
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 19:38:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 836581694;
	Thu, 30 Apr 2020 19:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 836581694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588268311;
	bh=InKqdf/ARqb7VWzDB73gsFYCt4pK2jGu+WWT98g2Fco=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q/BgiLpjv8qXdlK4CsrVXasP1HFzLs3Qd2UU1tgKepizxGmEzu4fae6l9olG4eM1J
	 0ULBIoBBLvaprFIVFjIAEcfH26di2fKYoDkfISKR0yvBTwQVweZJqCdHnC6cbOCQIx
	 M5RBbxo/1kUY2pQ021tOzpEbKNdhROJzvQaIB9b0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6040CF800B6;
	Thu, 30 Apr 2020 19:36:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5710CF8021C; Thu, 30 Apr 2020 19:36:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A610F800B6
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 19:36:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A610F800B6
IronPort-SDR: wmE+nEysuuqWsn/td5MEZF3O32hmj2L4g0xlFd2ApdcWuUdmscO8ome3E4OtrosmVxLlKvlrQ+
 GLysoNFGqKNQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 10:36:16 -0700
IronPort-SDR: 65eA570H9+w1LpO3KKfNNMqa+mFcHqGDBIBUkkXA+xfqjQZtHReuqD/8CRqhZfUFlXwwdzc8VK
 JPp+lw89Uc1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,336,1583222400"; d="scan'208";a="248340120"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga007.fm.intel.com with ESMTP; 30 Apr 2020 10:36:15 -0700
Date: Thu, 30 Apr 2020 20:36:14 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Functionality of pcm_notify in snd-aloop?
In-Reply-To: <f6fa39ec-9675-ce3c-c77e-3a438433ea6b@perex.cz>
Message-ID: <alpine.DEB.2.21.2004301949490.2957@eliteleevi.tm.intel.com>
References: <b4af9071-f8d7-5b47-4d7a-c5743bd67394@ivitera.com>
 <61d837f1-de1a-7aa6-ca8f-d0cfaa36ea69@perex.cz>
 <28a05a44-55bf-1831-aa3c-875e0499caea@ivitera.com>
 <28063dd1-71ab-a313-04b8-f4d97312b1b5@ivitera.com>
 <a325c165-5ced-618b-0b71-c0c4381473a1@perex.cz>
 <s5hmu6vlin9.wl-tiwai@suse.de>
 <alpine.DEB.2.21.2004281910520.2957@eliteleevi.tm.intel.com>
 <f6fa39ec-9675-ce3c-c77e-3a438433ea6b@perex.cz>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Takashi Iwai <tiwai@suse.de>, Pavel Hofman <pavel.hofman@ivitera.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Hey,

On Thu, 30 Apr 2020, Jaroslav Kysela wrote:

> Dne 28. 04. 20 v 18:19 Kai Vehmanen napsal(a):
>> ack on that. I've been preparing this patch to add -ENODATA to alsa-lib
>> documentation:
>> "[RFC] pcm: add documentation for -ENODATA error code handling"
>> https://github.com/kv2019i/alsa-lib/commit/87b298106e04054489ee93b26a610e37f99a3171
[...]
>> To test the above, I've used a small hack to aplay/arecord that keeps
>> trying to restart the PCM after a delay, in case -ENODATA is returned:
>> https://github.com/kv2019i/alsa-utils/commit/a2ba541ea0b3e86a65687de88a41f10cf0a8ddc2
>
> This code calls wrongly snd_pcm_resume() here. Also, we should really think
> about the whole mechanism when the stream cannot be activated (also for
> playback - Intel HDMI LPE driver [2]). I mean that the poll multiplexer should
> handle this state, too. If we don't find a way to notify the user space that
> the stream can be started using the poll(), we can use another interface like
> control API for the notifications.

yes, the above patch for alsa-utils is just a hack for testing 
(I used snd_pcm_resume() as that has retry-after-delay logic already 
so does what I need to restart after -ENODATA).

That's a good question whether ALSA should provide a mechanism to 
wait and/or signal when the stream can be started.

This is not clear in the generic case. There can be scenarios where the 
-ENODATA state is not transient (e.g. a monitor is not connected). So the 
application has to have some out-of-band information on how the device 
behaves -- i.e. when it makes sense to wait. For the DSP echo reference 
case, we are now proposing to describe this in UCM, so applications (like 
Pulseaudio and CRAS) can get this information from there.

For many related scenarios, we are already successfully using controls 
to inform user-space that a given PCM is ready for use (newer drivers use
this for HDMI monitor hotplug).

But it's true, even if application knows in which order to trigger the 
PCMs and how they are dependent, some retry logic needs to be used 
(especially around xrun/suspend handling). In my test code, I just simply 
used a delay-and-retry in the slave arecord instance, but a real-life 
application would use something more deterministic.

> We may also instroduce a new PCM state "WAIT" to wait on the hardware / link
> availability (SETUP -> -ENODATA -> WAIT -> use poll() for the link status ->
> success -> SETUP -> PREPARE) - talking about SNDRV_PCM_STATE states here.

This could be cleaner, but a much bigger change (for applications, 
alsa-lib and drivers as well). Considering this is quite niche and 
majority of apps won't care, having applications handle -ENODATA with 
out-of-band means might still be the right-sized solution. At least the 
CRAS developer feedback so far has been that -ENODATA is sufficient.

But yeah, if there are other users/scenarios that need to wait on 
link-availability, maybe adding it to ALSA API directly, might make sense.

Br, Kai

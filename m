Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3417B76B915
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 17:51:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A14CE82A;
	Tue,  1 Aug 2023 17:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A14CE82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690905108;
	bh=LXqZ/EC5O1gsfpYX2dvFM8tynC3rltg8zfATt1o7LNc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q5//EDfhUzy0ueunB40I15ufIa0kGJ7S5/41jAcpLBKdAjhfRCBPIMN8y30muMj4N
	 FIq1mHQHC8SJIwe94mZDK7Evsq1AGn5qdab5RiPw2pG/2KOcwIhWc9zlsmPiQHqTth
	 t5pcspXJQ7B6qdX8HWoC9I/E2BnOgAXrF04UPeHg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0CABF80548; Tue,  1 Aug 2023 17:49:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B565F8057A;
	Tue,  1 Aug 2023 17:49:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F561F801D5; Tue,  1 Aug 2023 09:28:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30152F80087;
	Tue,  1 Aug 2023 09:27:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30152F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=V9ctZ7fA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690874883; x=1722410883;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LXqZ/EC5O1gsfpYX2dvFM8tynC3rltg8zfATt1o7LNc=;
  b=V9ctZ7fA0auG2UJFtaGzfpKP6xo7Xk7n3z0gxGlEs+4h/vKxBaGkUU4G
   20EKxYikl0LVZXuc8TU5uJP0R+hJPUoGlEVqq/skIcfdGSoodVcMoj2dC
   cothYlW+wHjfB+uxWZX3H++yPIWuZ8MjODtDQmkUpvg/vEB809VaDziA2
   DAYBJ/s5uNqaGf29jIuCjSLyDry1efUQ0y3W8yKl8exlsu9jf2p2VDrnd
   und33GHpbYC3xWmuRRiFD+LKCbKOkKgIb/fwSuEMKwdl0NmhvtlsGp5P3
   obSZmguR7ghRFISAPnWBTg7uZOBXSGRVVvR2KiCDOtFb8mGrVOkGNBMl6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="354152701"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200";
   d="scan'208";a="354152701"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 00:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="975166354"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200";
   d="scan'208";a="975166354"
Received: from vmastnak-mobl.ger.corp.intel.com (HELO [10.249.38.190])
 ([10.249.38.190])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 00:27:50 -0700
Message-ID: <be7eadd1-a447-aeb8-b5e3-ea0a17a2a906@linux.intel.com>
Date: Tue, 1 Aug 2023 09:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/9] sound: Use -EPROBE_DEFER instead of i915 module
 loading.
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
 <87r0oohyea.wl-tiwai@suse.de>
 <ec653abc-f2f8-8a9d-4b8a-ea9d985d32fe@linux.intel.com>
 <87fs53j2qm.wl-tiwai@suse.de>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <87fs53j2qm.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ULMSGPQN4N7GQSXN5HDAUFBXHPYULVCH
X-Message-ID-Hash: ULMSGPQN4N7GQSXN5HDAUFBXHPYULVCH
X-Mailman-Approved-At: Tue, 01 Aug 2023 15:47:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ULMSGPQN4N7GQSXN5HDAUFBXHPYULVCH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey,

Den 2023-07-31 kl. 21:32, skrev Takashi Iwai:
> On Mon, 31 Jul 2023 18:37:36 +0200,
> Maarten Lankhorst wrote:
>> Hey,
>>
>> Den 2023-07-31 kl. 17:51, skrev Takashi Iwai:
>>> On Wed, 19 Jul 2023 18:41:32 +0200,
>>> Maarten Lankhorst wrote:
>>>> Explicitly loading i915 becomes a problem when upstreaming the new intel driver
>>>> for Tiger Lake and higher graphics (xe). By loading i915, it doesn't wait for
>>>> driver load of xe, and will fail completely before it loads.
>>>>
>>>> -EPROBE_DEFER has to be returned before any device is created in probe(),
>>>> otherwise the removal of the device will cause EPROBE_DEFER to try again
>>>> in an infinite loop.
>>>>
>>>> The conversion is done in gradual steps. First I add an argument to
>>>> snd_hdac_i915_init to allow for -EPROBE_DEFER so I can convert each driver
>>>> separately. Then I convert each driver to move snd_hdac_i915_init out of the
>>>> workqueue. Finally I drop the ability to choose modprobe behavior after the
>>>> last user is converted.
>>>>
>>>> I suspect the avs and skylake drivers used snd_hdac_i915_init purely for the
>>>> modprobe, but I don't have the hardware to test if it can be safely removed.
>>>> It can still be done easily in a followup patch to simplify probing.
>>>>
>>>> ---
>>>> New since first version:
>>>>
>>>> - snd_hda_core.gpu_bind is added as a mechanism to force gpu binding,
>>>>     for testing. snd_hda_core.gpu_bind=0 forces waiting for GPU bind to
>>>>     off, snd_hda_core.gpu_bind=1 forces waiting for gpu bind. Default
>>>>     setting depends on whether kernel booted with nomodeset.
>>>> - Incorporated all feedback review.
>>> Maarten, are you working on v3 patch set?
>>> Or, for moving forward, should we merge v2 now and fix the rest based
>>> on that later?
>> I've been working on a small change to keep the workqueue in SOF and
>> only move the binding to the probe function to match what
>> snd-hda-intel is doing, but I don't know if that is needed?
>>
>> It was a bit unclear to me based on feedback if I should try to kill
>> the workqueue on all drivers (but with no way to test), or keep it
>> around.
> I guess it's still safer to keep the workqueue in many drivers.  There
> can be modprobe or firmware loading at any later stage.
> We can get rid of the workqueue once after confirming that it's really
> safe, too.
>
> So, if you can work on the patch set in that regard, it's fine, I can
> wait for it.

I've finished that patch, but it caused regressions (oops) while 
rebooting. I think it's safer to kill the workqueue for SOC, and then 
convert all other drivers later.

Cheers,

~Maarten


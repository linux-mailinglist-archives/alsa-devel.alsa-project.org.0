Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFDC7EB46D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 17:06:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C266850;
	Tue, 14 Nov 2023 17:05:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C266850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699978003;
	bh=vwx3xvYGbHUkwtN7ZYKT932p6wwa9UKztjxYNr4OIhg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FrSH1m4MHQTeMV1cnW9/n3sJi7dHw0UlyZMUMeIHcg+chrYaa6HyL61tVGPebmbh9
	 OrpcshpMMRG27C6nXTuD6pBXvjWME+SRmU6ltDp3VdLTduW1AdZG32h5YbnN8yFlsr
	 admsJK3vn0eVpgMk92zscJ/2R89wHWI37lsDoSd8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DE3EF802E8; Tue, 14 Nov 2023 17:05:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90FDDF80551;
	Tue, 14 Nov 2023 17:05:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7F51F801D5; Tue, 14 Nov 2023 14:29:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54C3AF80093
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 14:29:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54C3AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=n3zbCQT8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699968587; x=1731504587;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vwx3xvYGbHUkwtN7ZYKT932p6wwa9UKztjxYNr4OIhg=;
  b=n3zbCQT8UVSaGdj2R8JAJWy+FaXfwSRoGKSo1CFOPE0SGCHuEIAJhinH
   5HsqIbpVXM9V9Kqa7/ExFWIS5bjDd4CJ2+6oteASs55WUwqI20715JvLl
   qby2zoP2u1fCLrqfQzw1Iov1uH0mdqe1GqB5E1PNXwp3mdu7YnAinW+hb
   bWUkyj8WA3wysODwQmgpCBLtfREKF5jl/IMZCnBMqdXJVG5qPh4Dn96wm
   /lv8gFN6o7Qcbc3TAfF9AKi3S8UgQZcc5tJXfgooeUDGy+MrTw1ADfkhT
   UmHOja26FjW9MFec/93CcBvvTnHVDGVA8x2bNd6sKcUuYxP+AzjEOYMES
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="390446758"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="390446758"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:29:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="855276369"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="855276369"
Received: from mehlinma-mobl.ger.corp.intel.com (HELO [10.249.44.16])
 ([10.249.44.16])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:29:33 -0800
Message-ID: <569f8832-25f1-45be-bb60-50f5a76d8e44@linux.intel.com>
Date: Tue, 14 Nov 2023 14:29:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [PATCH 11/14] ALSA: hda/intel: Move snd_hdac_i915_init
 to before probe_work.
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, alsa-devel@alsa-project.org,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>
References: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
 <20231002193847.7134-11-maarten.lankhorst@linux.intel.com>
 <ZVNUxZzCGcxQzqJX@intel.com> <87bkbwsebl.fsf@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <87bkbwsebl.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: G3B4JQOFBCZWVQFTUQFFDRUPIZZGEI5Y
X-Message-ID-Hash: G3B4JQOFBCZWVQFTUQFFDRUPIZZGEI5Y
X-Mailman-Approved-At: Tue, 14 Nov 2023 16:05:02 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G3B4JQOFBCZWVQFTUQFFDRUPIZZGEI5Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey,

Den 2023-11-14 kl. 13:35, skrev Jani Nikula:
> On Tue, 14 Nov 2023, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
>> On Mon, Oct 02, 2023 at 09:38:44PM +0200, maarten.lankhorst@linux.intel.com wrote:
>>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>
>>> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
>>> the snd_hdac_i915_init into a workqueue.
>>>
>>> Use the -EPROBE_DEFER mechanism instead, which must be returned in the
>>> probe function.
>> This completely broke i915 audio!
>>
>> I also can't see any trace of this stuff ever being posted to
>> intel-gfx so it never went through the CI.
>>
>> Please fix or revert ASAP.
> Cc: Jani, Suresh
>
> Ville, please file a bug at gitlab so we can track this, thanks.

I've originally tested this on TGL and DG2, so can you be more specific 
on what broke?

Cheers,

~Maarten

>>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>>> ---
>>>   sound/pci/hda/hda_intel.c | 54 +++++++++++++++++++--------------------
>>>   1 file changed, 27 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>>> index e42ad0e816e1..9dad3607596a 100644
>>> --- a/sound/pci/hda/hda_intel.c
>>> +++ b/sound/pci/hda/hda_intel.c
>>> @@ -2135,6 +2135,33 @@ static int azx_probe(struct pci_dev *pci,
>>>   
>>>   	pci_set_drvdata(pci, card);
>>>   
>>> +#ifdef CONFIG_SND_HDA_I915
>>> +	/* bind with i915 if needed */
>>> +	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
>>> +		err = snd_hdac_i915_init(azx_bus(chip), false);
>>> +		if (err < 0) {
>>> +			/* if the controller is bound only with HDMI/DP
>>> +			 * (for HSW and BDW), we need to abort the probe;
>>> +			 * for other chips, still continue probing as other
>>> +			 * codecs can be on the same link.
>>> +			 */
>>> +			if (HDA_CONTROLLER_IN_GPU(pci)) {
>>> +				goto out_free;
>>> +			} else {
>>> +				/* don't bother any longer */
>>> +				chip->driver_caps &= ~AZX_DCAPS_I915_COMPONENT;
>>> +			}
>>> +		}
>>> +
>>> +		/* HSW/BDW controllers need this power */
>>> +		if (HDA_CONTROLLER_IN_GPU(pci))
>>> +			hda->need_i915_power = true;
>>> +	}
>>> +#else
>>> +	if (HDA_CONTROLLER_IN_GPU(pci))
>>> +		dev_err(card->dev, "Haswell/Broadwell HDMI/DP must build in CONFIG_SND_HDA_I915\n");
>>> +#endif
>>> +
>>>   	err = register_vga_switcheroo(chip);
>>>   	if (err < 0) {
>>>   		dev_err(card->dev, "Error registering vga_switcheroo client\n");
>>> @@ -2162,11 +2189,6 @@ static int azx_probe(struct pci_dev *pci,
>>>   	}
>>>   #endif /* CONFIG_SND_HDA_PATCH_LOADER */
>>>   
>>> -#ifndef CONFIG_SND_HDA_I915
>>> -	if (HDA_CONTROLLER_IN_GPU(pci))
>>> -		dev_err(card->dev, "Haswell/Broadwell HDMI/DP must build in CONFIG_SND_HDA_I915\n");
>>> -#endif
>>> -
>>>   	if (schedule_probe)
>>>   		schedule_delayed_work(&hda->probe_work, 0);
>>>   
>>> @@ -2264,28 +2286,6 @@ static int azx_probe_continue(struct azx *chip)
>>>   	to_hda_bus(bus)->bus_probing = 1;
>>>   	hda->probe_continued = 1;
>>>   
>>> -	/* bind with i915 if needed */
>>> -	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
>>> -		err = snd_hdac_i915_init(bus, true);
>>> -		if (err < 0) {
>>> -			/* if the controller is bound only with HDMI/DP
>>> -			 * (for HSW and BDW), we need to abort the probe;
>>> -			 * for other chips, still continue probing as other
>>> -			 * codecs can be on the same link.
>>> -			 */
>>> -			if (HDA_CONTROLLER_IN_GPU(pci)) {
>>> -				goto out_free;
>>> -			} else {
>>> -				/* don't bother any longer */
>>> -				chip->driver_caps &= ~AZX_DCAPS_I915_COMPONENT;
>>> -			}
>>> -		}
>>> -
>>> -		/* HSW/BDW controllers need this power */
>>> -		if (HDA_CONTROLLER_IN_GPU(pci))
>>> -			hda->need_i915_power = true;
>>> -	}
>>> -
>>>   	/* Request display power well for the HDA controller or codec. For
>>>   	 * Haswell/Broadwell, both the display HDA controller and codec need
>>>   	 * this power. For other platforms, like Baytrail/Braswell, only the
>>> -- 
>>> 2.40.1

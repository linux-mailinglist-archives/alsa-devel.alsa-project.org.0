Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDE576B912
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Aug 2023 17:51:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B8A8828;
	Tue,  1 Aug 2023 17:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B8A8828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690905067;
	bh=NgqvfxSJUC2JHt7NcWNd2gM99VuVW9MfNgvGVYKkFho=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ycvgcd8YUp5zCiP2hhqyIaBPfFAdEGr7HO3VjybRNq0RQxqgI4RwbEWT4FyfV8v2i
	 UngkdDdCvjNpmgxrFCrF5nJivpsgj7B4AvviLA6odgkkHD2u+bL4HrNlm/7nabLsHz
	 dQw28soAAsi7miNnTIGP7dNuM3m6kLgG28LLBX/w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1233EF8055B; Tue,  1 Aug 2023 17:49:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 727D7F80544;
	Tue,  1 Aug 2023 17:49:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 202FEF8016D; Mon, 31 Jul 2023 18:37:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15BE7F80149;
	Mon, 31 Jul 2023 18:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15BE7F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Qe4raeoX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690821471; x=1722357471;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NgqvfxSJUC2JHt7NcWNd2gM99VuVW9MfNgvGVYKkFho=;
  b=Qe4raeoXdyvClc1G2dwq7UEsMJc/Gh3/Cih+lb6MDD9Ab4YwH/Gjj7YT
   0dX+7vwIxeehf++yvlOi93MoYF0h3C86YSYMW1wonuguBvcqkQzVO3Su/
   QyaNv4Xojj1+90FnNJDSZwOHIrynfLMRKC3KFRY3EoSDf9xvNNKXP/dcG
   MudnPuOovV4LX+5vHdHegqDjfT6bppi/qnzqIw4Q00lvczT9iCHTQAQrK
   m/auJc8bRVyTIhCPoFnRyURcbJe9zdz9Fx6O5P4iB2jx0u6xDGFFtXjGm
   yJ9u/rfnatc4bHUXNdBNJ0O65+q4/HV3FRAP6JoUFhywogcWflqe9d6eD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="371781657"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200";
   d="scan'208";a="371781657"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 09:37:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="705491790"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200";
   d="scan'208";a="705491790"
Received: from awolfson-mobl3.ger.corp.intel.com (HELO [10.249.39.2])
 ([10.249.39.2])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 09:37:40 -0700
Message-ID: <ec653abc-f2f8-8a9d-4b8a-ea9d985d32fe@linux.intel.com>
Date: Mon, 31 Jul 2023 18:37:36 +0200
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
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <87r0oohyea.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4VMGGQ7KRI7HHXHCQ5IDQIZ463QIRGWI
X-Message-ID-Hash: 4VMGGQ7KRI7HHXHCQ5IDQIZ463QIRGWI
X-Mailman-Approved-At: Tue, 01 Aug 2023 15:47:40 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4VMGGQ7KRI7HHXHCQ5IDQIZ463QIRGWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey,

Den 2023-07-31 kl. 17:51, skrev Takashi Iwai:
> On Wed, 19 Jul 2023 18:41:32 +0200,
> Maarten Lankhorst wrote:
>> Explicitly loading i915 becomes a problem when upstreaming the new intel driver
>> for Tiger Lake and higher graphics (xe). By loading i915, it doesn't wait for
>> driver load of xe, and will fail completely before it loads.
>>
>> -EPROBE_DEFER has to be returned before any device is created in probe(),
>> otherwise the removal of the device will cause EPROBE_DEFER to try again
>> in an infinite loop.
>>
>> The conversion is done in gradual steps. First I add an argument to
>> snd_hdac_i915_init to allow for -EPROBE_DEFER so I can convert each driver
>> separately. Then I convert each driver to move snd_hdac_i915_init out of the
>> workqueue. Finally I drop the ability to choose modprobe behavior after the
>> last user is converted.
>>
>> I suspect the avs and skylake drivers used snd_hdac_i915_init purely for the
>> modprobe, but I don't have the hardware to test if it can be safely removed.
>> It can still be done easily in a followup patch to simplify probing.
>>
>> ---
>> New since first version:
>>
>> - snd_hda_core.gpu_bind is added as a mechanism to force gpu binding,
>>    for testing. snd_hda_core.gpu_bind=0 forces waiting for GPU bind to
>>    off, snd_hda_core.gpu_bind=1 forces waiting for gpu bind. Default
>>    setting depends on whether kernel booted with nomodeset.
>> - Incorporated all feedback review.
> Maarten, are you working on v3 patch set?
> Or, for moving forward, should we merge v2 now and fix the rest based
> on that later?

I've been working on a small change to keep the workqueue in SOF and 
only move the binding to the probe function to match what snd-hda-intel 
is doing, but I don't know if that is needed?

It was a bit unclear to me based on feedback if I should try to kill the 
workqueue on all drivers (but with no way to test), or keep it around.

Cheers,

~Maarten


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56888246878
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 16:34:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 040FB16C8;
	Mon, 17 Aug 2020 16:34:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 040FB16C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597674894;
	bh=a/llFhYecR59mg8RVe4S3rIMio+cVvDk91yd3Zfj/+o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SyiA2YjHur+5akSHwKzhoiXqoLV4990IxS9rwuKVXaBvqdtm2RR+aVssz/i1WnDRJ
	 VeKcL+lwZJcVgFXPsRMkd8j/q6QoI4ZCrKCHqYJrVPF3btNmlOEDzxwJvJtPLElhyQ
	 150qQFrlpasyotdoK1N1G1/S7QMN6yuv7NMGPnPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BDB1F800EF;
	Mon, 17 Aug 2020 16:33:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BDBFF80218; Mon, 17 Aug 2020 16:33:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B0F8F800F0
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 16:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B0F8F800F0
IronPort-SDR: hC8spxiLORXvVJlQnhJ91bJFltLdeede9rV/eLifH0aUSx8fLK5M0m62OnvAb/cAquRD5IjrVM
 wscOR0+d5hGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="142341058"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; d="scan'208";a="142341058"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 07:33:05 -0700
IronPort-SDR: 6TRoDZ6h+TyEqCleyTeS4KJ+i1+ZdANc3ulabwohtVGDQcU5lddWBWEEKksR/4ODjNDwltz+TJ
 m3bZlJs+BFEQ==
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; d="scan'208";a="440883848"
Received: from mgorski-mobl.ger.corp.intel.com (HELO [10.213.233.172])
 ([10.213.233.172])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 07:33:03 -0700
Subject: Re: [PATCH] ASoC: Intel: skl_hda_dsp_generic: Fix NULLptr dereference
 in autosuspend delay
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200722173524.30161-1-mateusz.gorski@linux.intel.com>
 <2674621e-1546-3048-3ba2-f8fe1265d6e1@linux.intel.com>
 <014d8a2f-1ba7-1872-73b2-2384d908de79@intel.com>
 <edc0c832-c92b-ab95-c5e5-6bea2cf12973@linux.intel.com>
 <alpine.DEB.2.22.394.2008121627040.3186@eliteleevi.tm.intel.com>
From: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Message-ID: <5b3f05e6-873d-70b2-1ca7-d473a1a21210@linux.intel.com>
Date: Mon, 17 Aug 2020 16:32:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2008121627040.3186@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: pl
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org, tiwai@suse.com
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


W dniu 8/12/2020 o 3:48 PM, Kai Vehmanen pisze:
> Hi,
>
> On Wed, 22 Jul 2020, Pierre-Louis Bossart wrote:
>
>>>>> Change the string in conditional statement to "ehdaudio0D0" to ensure
>>>>> that only the HDAudio codec is handled by this function.
>>>> I am not sure this is correct.
>>>>
>>>> I may be wrong, but my understanding is the following:
>>>>
>>>> Before 5bf73b1b1dec, the driver would use the first dailink of the card,
>>>> and in the case of devices without an HDaudio codec (e.g. Up2 board) it
>>>> would set the auto suspend delay using that first dailink. See the code in
>>>> skl_hda_fill_card_info(), it reorders the dailinks when HDaudio codecs are
>>>> not present so if you test for 'edhaudio00' you no longer allow for this
>>>> HDMI-only case to be handled with autosuspend.
>>>>
>>>> Kai would need to review this, so this will have to wait I am afraid.
>>>>
>>> So, for_each_card_rtds needs to be context aware (hdmi type). Right now,
>>> introduced _autosuspend_delay is causing kernel panics.
>> The code before 5bf73b1b1dec would use an HDMI dailink when HDaudio codecs are
>> not present, so I don't really see the point on being context aware. Either
>> this never worked or there's a side effect. In both cases, I would kindly ask
>> that this does not get merged before Kai is back.
> the patch from Mateusz might be most pragmatic way to solve this.
>
> The original problem was not setting autosuspend for external HDA codecs
> which cause jack detection issues with some codecs. So we added the call
> to set autosuspend timeout for all HDA codecs (patch "ASoC: intel/skl/hda
> - set autosuspend timeout for hda codecs"). This is not strictly needed
> for HDMI, but as it (seemed) cleaner to just call autosuspend for all HDA
> codecs, the patch did that. Later we have hit issues with special cases
> for HDMI, first with the case of disabled HDMI codec (my patch "ASoC:
> intel/skl/hda - fix oops on systems without i915 audio codec") and now
> issues with systems using hdac_hdmi.
>
> So what we really want to do is to confirm the codec driver is hdac_hda
> (and not hdac_hdmi or any other drivers), and if yes, then call the
> autosuspend function. I did spend some time trying to find a clean(er) way
> to do this, but codec name seemed the best option. I'll test the hdmi-only
> case, but I believe Mateusz patch will work in that case as well.
>
> Br, Kai


Thanks for the review,


is there anything else I can do with this patch?


Also, Mark, please let me know if I should resend this change.


Thanks,
Mateusz


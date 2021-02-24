Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB70F3235BC
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 03:33:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39F75167A;
	Wed, 24 Feb 2021 03:33:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39F75167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614134031;
	bh=zjvslhGmlW2V7066YQiwNh+l8ipIkPA79ShXQ79bMs0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KZayOr74wZ5jBXxZJzADIJaNNxCxUbg0macVn1v/BQ/jDlMboutpOoWnjXPArUEIx
	 Y3RJJBU95LPZp0Lx4D8BKSLmcYsSai00Bvhnc9GYW64N03T4vmsyLceCmjqU7ilHT3
	 VPFC4O3N77mFfg3jsD/y5smduoL9L13RS0v0BmYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8080BF8016D;
	Wed, 24 Feb 2021 03:32:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DECAEF8016A; Wed, 24 Feb 2021 03:32:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=NICE_REPLY_A,PRX_BODYSUB_1,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FD1EF800B4
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 03:32:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FD1EF800B4
Received: from [123.112.65.229] (helo=[192.168.0.106])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1lEjyH-0003XE-Nr; Wed, 24 Feb 2021 02:32:14 +0000
Subject: Re: [PATCH] ALSA: hda/hdmi: let new platforms assign the pcm slot
 dynamically
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20210223122205.233701-1-hui.wang@canonical.com>
 <alpine.DEB.2.22.394.2102231545050.864696@eliteleevi.tm.intel.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <3e125642-e94d-fb46-01d3-5b4f7e3cc8b7@canonical.com>
Date: Wed, 24 Feb 2021 10:32:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2102231545050.864696@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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


On 2/23/21 10:14 PM, Kai Vehmanen wrote:
> Hi,
>
> thanks for the patch!
>
> On Tue, 23 Feb 2021, Hui Wang wrote:
>
>> If the platform set the dyn_pcm_assign to true, it will call
>> hdmi_find_pcm_slot() to find a pcm slot when hdmi/dp monitor is
>> connected and need to create a pcm.
> [...]
>> This change comes from the discussion between Takashi and
>> Kai Vehmanen. Please refer to:
>> https://github.com/alsa-project/alsa-lib/pull/118
> I did propose to merge the alsa-lib change to give us a bit more time to
> think about how this should be handled in kernel.
That is not merged yet, and my PM was pushing me to find a solution, 
then I wrote this patch.
>
> While this patch certainly solves the problem of kernel picking ALSA PCMs,
> which current alsa-lib cannot handle, it leaves us a bit halfway. We'd
> create many PCMs that will never be used. And this change is a bit more
> involved.
>
>> So far only intel_hsw_common_init() and patch_nvhdmi() set the
>> dyn_pcm_assign to true, here we let tgl platforms assign the pcm slot
>> dynamically first, if the driver runs for a period of time and there
>> is no regression reported, we could set no_fixed_assgin to true in
>> the intel_hsw_common_init(), and then set it to true in the
>> patch_nvhdmi().
> Staged plan sounds good here, although I'd be fairly cautious with this.
> People using Pulseaudio/Pipewire+UCM won't notice a thing, but I'm sure
> there are people out there assuming a fixed "physical connector -> ALSA
> PCM" mapping and not using UCM. Probably at least some way to opt-out
> would be needed for older platforms.
>
>> +	if (port_num > 6)
>> +		spec->no_fixed_assign = true;
> I think this is magic enough of a number to be defined separately along
> with some documentation. So basicly user-space has a max limit of 8 now
> and two PCMs are reserved for DP-MST, so that brings us to six, right?
Yes, and also before the TGL, the max number of physical pins is 6 (icl).
>
> This is somewhat arbitrary still. If we simply want to enable the mode for
> TGL only, easier and cleaned would be to set this flag in
> patch_i915_tgl_hdmi() directly.

OK, will consider it.

Thanks,

Hui.

> Br, Kai

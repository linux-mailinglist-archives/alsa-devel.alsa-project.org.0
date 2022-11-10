Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8C8624726
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 17:37:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320341677;
	Thu, 10 Nov 2022 17:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320341677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668098270;
	bh=aFhD3qJO4lPjE8XyhAyJhgK7gl4+zvWnrMAgjLDvafo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UU+9jUyKjTRVkp3rKRZScONvHLSyp/SeIObwE8DHy1w9yPmGqShl7RKiT7w/lm+Oa
	 NGertfM0beRTUwnIQrgTaK/7sR96RyPMAT7rmotwUp5AkQFdmTCav/SUCAE27oSMIJ
	 90OwR9Va3wkJyv/fpMTlgtg4ZgcjRr6yluWZkXR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C89EFF80104;
	Thu, 10 Nov 2022 17:36:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86FFAF80163; Thu, 10 Nov 2022 17:36:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC674F80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 17:36:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC674F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BuyFFU5p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668098208; x=1699634208;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aFhD3qJO4lPjE8XyhAyJhgK7gl4+zvWnrMAgjLDvafo=;
 b=BuyFFU5pnvrB4wixfx6ikOUTo1SEB1EDAlYEn5xEuCkZ4sEztNh0AKHY
 NibVewBgPk4YA/1Jj7shm3dfMJLU4bMizlpyJ+Wr6WeJz1SY+Hu70hJNo
 wPdgn4OniKWzi1EfNPRHszQKiVabYmjGDHFlubFelTVVcdjsbi5YKUh8l
 4D9Q4WmYukitscQwM+wIDANGGI782q+g1XwsDyGcSDmQovCCpQdQAxoMR
 OI6Hlrz3BHSMxdLDNgRbRmDgDLim5ZeoHZlqIHH2N/750uACjRk7CYBLM
 JQKN2xWxL44uWtDcOf+JuRjdoUZPFYyv8TeiA+ClR+iKpfbS8UW3PkR+L A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="308982413"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="308982413"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 08:36:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="762342220"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="762342220"
Received: from byrons1x-mobl.amr.corp.intel.com (HELO [10.212.85.58])
 ([10.212.85.58])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 08:36:20 -0800
Message-ID: <65f24445-11ed-cd36-4fd2-e326bf877f54@linux.intel.com>
Date: Thu, 10 Nov 2022 10:36:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] ASoC: Intel: avs: Disconnect substream if suspend or
 resume fails
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20221110141330.740916-1-cezary.rojewski@intel.com>
 <20221110141330.740916-3-cezary.rojewski@intel.com>
 <6f86718b-5d96-3e73-bfc0-321288e2232c@linux.intel.com>
 <8cc5ecbe-8112-2359-aa90-1d5d1b50d89c@intel.com>
 <d471658b-1c93-ad84-55fd-7c68257bf01e@linux.intel.com>
 <e4aabd6c-ac79-5e72-9012-2abfbc7515e8@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <e4aabd6c-ac79-5e72-9012-2abfbc7515e8@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: hdegoede@redhat.com, tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
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



On 11/10/22 10:29, Cezary Rojewski wrote:
> On 2022-11-10 5:18 PM, Pierre-Louis Bossart wrote:
>> On 11/10/22 10:06, Cezary Rojewski wrote:
> 
>>> Unless something new has been added/updated, there is no runtime->state
>>> field available. All the PCM code works with runtime->status->state.
>>
>> cd sound/
>>
>> git grep -c 'runtime->state'
>> core/compress_offload.c:27
> 
> ...
> 
>> git grep -c 'status->state'
>> core/pcm_compat.c:2
>> core/pcm_native.c:4
> 
> I see now, thanks. Commit from late September "ALSA: pcm: Avoid
> reference to status->state" add a new field. Will update the code to use
> __snd_pcm_set_state() instead.
> 
> My base did not have it yet.

Right, it's relatively recent, and my point is that the helper does use
stream locking when testing the same state you modify. Maybe that's a
red herring but I thought I'd ask.

static void snd_pcm_set_state(struct snd_pcm_substream *substream,
			      snd_pcm_state_t state)
{
	snd_pcm_stream_lock_irq(substream);
	if (substream->runtime->state != SNDRV_PCM_STATE_DISCONNECTED)
		__snd_pcm_set_state(substream->runtime, state);
	snd_pcm_stream_unlock_irq(substream);
}


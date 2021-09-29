Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9A541CDB3
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 23:02:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CA2A16EA;
	Wed, 29 Sep 2021 23:01:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CA2A16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632949363;
	bh=aIlXGBfZUMD/bJOG19MSE1cLo0NQ0nKHb8fLJJgsIEQ=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iw/j7/Uk7bJVO/nBZkkyrwsxS8reBeICmvQ9mX6UB2gSJoopp4h5Tlv628zRJVEB4
	 T5h+DmlYjwTJ5C6bVqlLyLfXVnVsKbmgPwZq2Err2400EgPwOdA0h8tDcngMnyIqR5
	 4huin65nF4AanFvwdc4I2oyKK8+474/4zNWGI+Nk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A18D1F80105;
	Wed, 29 Sep 2021 23:01:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21D08F80105; Wed, 29 Sep 2021 23:01:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E502F80113
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 23:01:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E502F80113
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="225081590"
X-IronPort-AV: E=Sophos;i="5.85,334,1624345200"; d="scan'208";a="225081590"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 14:01:16 -0700
X-IronPort-AV: E=Sophos;i="5.85,334,1624345200"; d="scan'208";a="588232164"
Received: from ibarchen-mobl.amr.corp.intel.com (HELO [10.209.150.234])
 ([10.209.150.234])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 14:01:15 -0700
Subject: Re: [PATCH] ASoC: dpcm: fix race condition to dpcm links in
 dpcm_be_dai_trigger
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Gyeongtaek Lee <gt82.lee@samsung.com>, 'Takashi Iwai' <tiwai@suse.de>
References: <CGME20210929054921epcas2p2fbe35a6262405e064aac3bd92b22b1aa@epcas2p2.samsung.com>
 <002f01d7b4f5$c030f4a0$4092dde0$@samsung.com>
 <27786697-1309-8336-6f53-abff32e0b6c2@linux.intel.com>
Message-ID: <d9e09d88-d3f8-2eab-ebe1-1ac8e64e5093@linux.intel.com>
Date: Wed, 29 Sep 2021 16:01:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <27786697-1309-8336-6f53-abff32e0b6c2@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kimty@samsung.com, lgirdwood@gmail.com,
 senius.park@samsung.com, donggyun.ko@samsung.com, hmseo@samsung.com,
 seungbin.lee@samsung.com, s47.kang@samsung.com, pilsun.jang@samsung.com
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


>> If routing change and underrun stop is run at the same time,
>> data abort can be occurred by the following sequence.
>>
>> CPU0: Processing underrun 	CPU1: Processing routing change
>> dpcm_be_dai_trigger():		dpcm_be_disconnect():
>>
>> for_each_dpcm_be(fe, stream, dpcm) {
>>
>> 				spin_lock_irqsave(&fe->card->dpcm_lock, flags);
>> 				list_del(&dpcm->list_be);
>> 				list_del(&dpcm->list_fe);
>> 				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
>> 				kfree(dpcm);
>>
>> struct snd_soc_pcm_runtime *be = dpcm->be; <-- Accessing freed memory
>>
>> To prevent this situation, dpcm_lock is needed during accessing
>> the lists for dpcm links.
> 
> Isn't there still a possible inconsistency here introduced by the
> duplication of the BE list?
> 
> You protect the list creation, but before you use it in
> dpcm_be_dai_trigger(), there's a time window where the function could be
> pre-empted and a disconnect event might have happened. As a result you
> could trigger a BE that's no longer connected.
> 
> What you identified as a race is likely valid, but how to fix it isn't
> clear to me - the DPCM code isn't self-explanatory at all with its use
> in various places of the dpcm_lock spinlock, the pcm mutex, the card mutex.
> 
> Ideally we would need to find a way to prevent changes in connections
> while we are doing the triggers, but triggers can take a bit of time if
> they involve any sort of communication over a bus. I really wonder if
> this dpcm_lock should be a mutex and if the model for DPCM really
> involves interrupt contexts as the irqsave/irqrestore mentions hint at.

To follow-up on this, I started experimenting with a replacement of the
'dpcm_lock' spinlock with a 'dpcm_mutex', see
https://github.com/thesofproject/linux/pull/3186

If we combine both of our results, the 'right' solution might be to take
this mutex before every use of for_each_dpcm_be(), and unlock it at the
end of the loop, which additional changes to avoid re-taking the same
mutex in helper functions.

there's still a part in DPCM that I can't figure out, there is an
elaborate trick with an explicit comment

	/* if FE's runtime_update is already set, we're in race;
	 * process this trigger later at exit
	 */

Which looks like a missing mutex somewhere, or an overkill solution that
might never be needed.

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B809C42EF99
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 13:24:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36B0816AF;
	Fri, 15 Oct 2021 13:23:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36B0816AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634297060;
	bh=CPgyD8MFAn+Fu13X++GN6fThprOtqkvDa0Ba+AprFbk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=myJ+8qFH7ZsgVkGfGnBa0Ob2FdGmdP4t308zV88HYS48nwBDd0oIk7ABHoWQqaEiF
	 DOHzT/29mG8nDWCJujaYcZuel07synEekaxhguXJsxdLAFoVJRjO6nJU2gRKOiE+BL
	 0I5uD5/11JH8OLf1/8cnG47uU3a5ugzTMyn1OPIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC5BBF8028D;
	Fri, 15 Oct 2021 13:23:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DD25F80269; Fri, 15 Oct 2021 13:23:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B44ADF80167
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 13:22:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B44ADF80167
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="288761412"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="288761412"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 04:22:54 -0700
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="492467004"
Received: from liminghu-mobl.ccr.corp.intel.com (HELO [10.212.23.213])
 ([10.212.23.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 04:22:53 -0700
Subject: Re: [RFC PATCH v3 05/13] ASoC: soc-pcm: align BE 'atomicity' with
 that of the FE
To: Takashi Iwai <tiwai@suse.de>, Sameer Pujar <spujar@nvidia.com>
References: <20211013143050.244444-1-pierre-louis.bossart@linux.intel.com>
 <20211013143050.244444-6-pierre-louis.bossart@linux.intel.com>
 <2847a6d1-d97f-4161-c8b6-03672cf6645c@nvidia.com>
 <s5hmtnavisi.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e2a79095-b8ce-9dd4-3e6d-00f8dda99f30@linux.intel.com>
Date: Fri, 15 Oct 2021 06:22:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <s5hmtnavisi.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, vkoul@kernel.org, broonie@kernel.org,
 Gyeongtaek Lee <gt82.lee@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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




>> In normal PCM, atomicity seems to apply only for trigger(). Other
>> callbacks like prepare, hw_params are executed in non-atomic
>> context. So when 'nonatomic' flag is false, still it is possible to
>> sleep in a prepare or hw_param callback and this is true for FE as
>> well. So I am not sure if atomicity is applicable as a whole even for
>> FE.

The typical path is snd_pcm_elapsed() on the FE, which will trigger the
BE. When we add the BE lock in patch7, things break: what matters is the
FE context, the locks used for the BE have to be aligned with the FE
atomicity.

My test results show the problem:
https://github.com/thesofproject/linux/pull/3209#issuecomment-941229502
and this patch fixes the issue.

I am all ears if someone has a better solution, but the problem is real.

I chose to add this patch first, before the BE lock is added in
dpcm_be_dai_trigger(), and if this causes problems already there are
even more issues in DPCM :-(

If this patch causes issues outside of the trigger phase, then maybe we
could just change the BE nonatomic flag temporarily and restore it after
taking the lock, but IMHO something else is broken in other drivers.

>> At this point it does not cause serious problems, but with subsequent
>> patches (especially when patch 7/13 is picked) I see failures. Please
>> refer to patch 7/13 thread for more details.
>>
>>
>> I am wondering if it is possible to only use locks internally for DPCM
>> state management and decouple BE callbacks from this, like normal PCMs
>> do?
> 
> Actually the patch looks like an overkill by adding the FE stream lock
> at every loop, and this caused the problem, AFAIU.
> 
> Basically we need to protect the link addition / deletion while the
> list traversal (there is a need for protection of BE vs BE access
> race, but that's a different code path).  For the normal cases, it
> seems already protected by card->pcm_mutex, but the problem is the FE
> trigger case.  It was attempted by dpcm_lock, but that failed because
> it couldn't be applied properly there.
> 
> That said, what we'd need is only:
> - Drop dpcm_lock codes once

I am not able to follow this sentence, what did you mean here?

> - Put FE stream lock around dpcm_be_connect() and dpcm_be_disconnect()
> 
> That should suffice for the race at trigger.  The FE stream lock is
> already taken at trigger callback, and the rest list addition /
> deletion are called from different code paths without stream locks, so
> the explicit FE stream lock is needed there.

I am not able to follow what you meant after "the rest". This sentence
mentions the FE stream lock in two places, but the second is not clear
to me.

> In addition, a lock around dpcm_show_state() might be needed to be
> replaced with card->pcm_mutex, and we may need to revisit whether all
> other paths take card->pcm_mutex.

What happens if we show the state while a trigger happens? That's my
main concern with using two separate locks (pcm_mutex and FE stream
lock) to protect the same list, there are still windows of time where
the list is not protected.

same with the use of for_each_dpcm_be() in soc-compress, SH and FSL
drivers, there's no other mutex there.

My approach might have been overkill in some places, but it's comprehensive.


> Also, BE-vs-BE race can be protected by taking a BE lock inside
> dpcm_be_dai_trigger().

that's what I did, no?

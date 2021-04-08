Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C15358121
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 12:50:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBD031679;
	Thu,  8 Apr 2021 12:50:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBD031679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617879054;
	bh=XLotnKnM12hP7LXa0lM27Y5YNVbdFQ/0Q54Ic17temQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kca26lqGd/mm7+tElzraWIhxBjAENdTwdKox5f+qUfEFX2vMFjU0I/AfQ3gO1vxv1
	 b+KgeoNRR9cPrNZ7S73TzbDsWutjNjn6e1YwzqHWu2JO6ecdEaOtEVhbngi3w7BWEJ
	 jsU/m32jYuH++OAYD5b/s+TENN6VXSEVpKAb8IUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26B3FF80246;
	Thu,  8 Apr 2021 12:49:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B399F8020B; Thu,  8 Apr 2021 12:49:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from webmail.tpnet.fi (webmail.tpnet.fi [62.106.63.33])
 by alsa1.perex.cz (Postfix) with ESMTP id CA983F800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 12:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA983F800BD
Received: from 87-95-165-136.bb.dnainternet.fi
 (87-95-165-136.bb.dnainternet.fi [87.95.165.136])
 by webmail.tpnet.fi (Postfix) with ESMTPS id A93D8242FA;
 Thu,  8 Apr 2021 13:49:15 +0300 (EEST)
Date: Thu, 8 Apr 2021 13:49:15 +0300 (EEST)
From: Kai Vehmanen <kvehmanen@nosignal.fi>
X-X-Sender: kaiv@ecabase.localdomain
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [RFC PATCH] ALSA: hda/hdmi: fix race in handling acomp ELD
 notification at resume
In-Reply-To: <s5hft0189bi.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.2104081341410.1629@ecabase.localdomain>
References: <20210407154727.589017-1-kai.vehmanen@linux.intel.com>
 <s5hr1jm8494.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2104071925200.864696@eliteleevi.tm.intel.com>
 <s5hft0189bi.wl-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
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

Hi,

On Thu, 8 Apr 2021, Takashi Iwai wrote:
> OK, that's a messy problem, indeed.  It's partly because of ASoC
> referred resume that is completely independent from the rest resume
> via HD-audio bus.  More badly, this can't be managed via the device
> link because the resume callback itself has been processed.
>
> And, IIUC, another part of the problem is that i915 notifies the HPD
> *after* the resume completion, right?  Then indeed it can be racy.

yes, exactly.

>> Seems quite odd indeed, but I've now got reports of systems where this is
>> hit, and unfortunately it's very systematic on these systems. By adding
>> some arbitrary delay to soc_resume_deferred(), I could easily hit this
>> myself as well on the systems I have at hand.
>
> Another possible fix would be to check dev->power.power_state instead
> of the global card state.  This is set in each PM callback in
> hda_codec.c to indicate the current PM state of the codec.  Something
> like below.  Let me know if this works, too.

Thanks, this works in my setup and is much cleaner. I think this is also 
more robust. I realized that with snd_power_get_state() check, there is a 
theoretical race still possible if notify comes before 
soc_resume_deferred() gets scheduled (i.e. delay is not within 
soc_resume_deferred() but in getting it scheduled to begin with). This 
would seem really unlikely, but it's a possible race nevertheless.

I'll update the patch to use dev->power.power_state, ask people with 
affected systems to double check, and I'll send a V2.

Br, Kai

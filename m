Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4216C27FD52
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 12:31:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F15A41817;
	Thu,  1 Oct 2020 12:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F15A41817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601548300;
	bh=wshWGqaiqX88c/HEsMw/nUKQPigEuotjJNjjNz7MH04=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MYGxaouNCswiu5jvAMiYqTsdDyPS34jXL+yy0pK7Bn1Z1HUULGONOggdPqgP8rkUn
	 rYFPmK8c8khXUDGNNJ+NSwxD7Ul1IDkIghi8iEDSlnd/e+/UXnyz6cd0V85REzIFbQ
	 XqKRHJWvxB+gzdkiNtoGsyVw5Q8oXMTI47J3hO2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27795F8020C;
	Thu,  1 Oct 2020 12:29:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9742AF801F5; Thu,  1 Oct 2020 12:29:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 597CDF801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 12:29:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 597CDF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f700ps1U"
Received: from localhost (unknown [122.167.37.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F88B2085B;
 Thu,  1 Oct 2020 10:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601548183;
 bh=wshWGqaiqX88c/HEsMw/nUKQPigEuotjJNjjNz7MH04=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f700ps1UcRhQ3qDyg69tAro+wyQTf5I01MNvRx4zNTCCN/r+nybkRbuNXJ54DdBOR
 c38cJTP+Vwc+XkdEouItEhrb42k1b6jTaZbtX66+DrjNmmHyJJltCk6GVUwl8mOK/4
 sFT3RDTqB+B88wiYZpeFFc1s7V+MC9PpNU85wTPs=
Date: Thu, 1 Oct 2020 15:59:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: compress: allow pause and resume during draining
Message-ID: <20201001102938.GU2968@vkoul-mobl>
References: <CGME20200929084051epcas2p35fb2228ed1bdfce6a7ddf5b37c944823@epcas2p3.samsung.com>
 <000001d6963c$3cc53690$b64fa3b0$@samsung.com>
 <s5heemlklo0.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5heemlklo0.wl-tiwai@suse.de>
Cc: 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 s47.kang@samsung.com, lgirdwood@gmail.com, tiwai@suse.com, hmseo@samsung.com,
 Gyeongtaek Lee <gt82.lee@samsung.com>, pilsun.jang@samsung.com,
 tkjung@samsung.com
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

On 29-09-20, 10:54, Takashi Iwai wrote:
> On Tue, 29 Sep 2020 10:40:51 +0200,
> Gyeongtaek Lee wrote:
> > 
> > On 9/29/20 04:13 PM, Takashi Iwai wrote:
> > >On Tue, 29 Sep 2020 03:51:35 +0200,
> > >Gyeongtaek Lee wrote:
> > >> 
> > >> On 9/28/20 11:35 PM, Pierre-Louis Bossart wrote:
> > >> >On 9/28/20 6:13 AM, Jaroslav Kysela wrote:
> > >> >> Dne 28. 09. 20 v 12:50 Gyeongtaek Lee napsal(a):
> > >> >>> With a stream with low bitrate, user can't pause or resume the stream
> > >> >>> near the end of the stream because current ALSA doesn't allow it.
> > >> >>> If the stream has very low bitrate enough to store whole stream into
> > >> >>> the buffer, user can't do anything except stop the stream and then
> > >> >>> restart it from the first.
> > >> >>> If pause and resume is allowed during draining, user experience can be
> > >> >>> enhanced.
> > >> >> 
> > >> >> It seems that we need a new state to handle the pause + drain condition for
> > >> >> this case.
> > >> >> 
> > >> >> With this proposed change, the pause state in drain is invisible.
> > >> >
> > >> >Indeed it's be much nicer to have a new state, e..g 
> > >> >SNDRV_PCM_STATE_DRAINING_PAUSED.
> > >> Ok. I will add the new state.
> > >> >
> > >> >One concern is that states are defined in uapi/sound/asoc.h, so wouldn't 
> > >> >this have impacts on userspace as well? We'd change the value of 
> > >> >SNDRV_PCM_STATE_LAST.
> > >> >
> > >> I also agree that adding new state and increase LAST value in the header of uapi
> > >> could be dangerous. So, I added it to comress_offload.h for now.
> > >> It could be merged into snd_pcm_state_t in someday with big changes.
> > >> Could you review the fixed patch below?
> > >
> > >Hrm, this resulted in rather more complex changes than the original
> > >patch.  It shows that introducing yet another state is no good idea
> > >for this particular case.
> > >
> > >Since the possible application's behavior after this pause is as same
> > >as the normal pause (i.e. either resuming pause or dropping), I find
> > >it OK to take the original approach.
> > Thank you for the review.
> > I think that I should resend the original patch.
> 
> Let's wait a bit for other opinions.  We may add rather a new flag
> instead of introducing a new state, too, for example.

I was out for a week, back now ;-)

So bigger question is if kernel should handle this change or we ask
userspace to handle this. Userland knows that bit rate is less so small
buffer can be for longer duration so instead of sending dumb X bytes,
should it not scale the buffer based on bit rate?

From that premise the partial_drain should be invoked only for last
write().

Also, I am bit skeptical for adding changes to states while we are
draining (that too partial one)... is this change driving complex
changes and should we push back to have this implemented better in
userland..?

> 
> Also, I'm not sure about any side-effect to drivers that expect the
> pause only during the running state.  We might need some check for a
> capability flag?
> 
> In anyway, the timing is bad; it's too late for 5.10 to apply such a
> core change.  Can we postpone this for 5.11?

Yes this needs more thinking, I am still not convinced kernel should
handle it!

Regards
-- 
~Vinod

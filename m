Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2B528AD99
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 07:27:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51027166E;
	Mon, 12 Oct 2020 07:26:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51027166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602480443;
	bh=+pf1qlxCrOfn4IZkQ8J8d+sCC57zAKPrBdhuKSqsjIM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XkjFyUy+Mem/hL0FLOnmbskRCsgWWlH2YXBvJkoL2tno1S2x8meKGmYtxYqyi4sy6
	 /FmDN19G7HdpBXCjUGK23tKC3/KeVUkEtMfeIqJzWg833Aakk4BJJUHjwTuR5G4GL+
	 bZO5GIcfu5QuCxUKmlLexjSvN1F5HPAlb2jlyCXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D28EAF80141;
	Mon, 12 Oct 2020 07:25:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0C26F80217; Mon, 12 Oct 2020 07:25:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84B97F800F6
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 07:25:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84B97F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M7+dMnpG"
Received: from localhost (unknown [122.182.245.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E33202076E;
 Mon, 12 Oct 2020 05:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602480329;
 bh=+pf1qlxCrOfn4IZkQ8J8d+sCC57zAKPrBdhuKSqsjIM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M7+dMnpGnwTqFrIQAm4Q91BrC9vV7T4jX5DJ2sgti7UqxUyjnH1Y6Ofa71qFu1oex
 vGWg/li0QFo5FuaxReHPOc6UN9Jodr40Mm0Ia98hReRH2C/Ul6R599yObPtyMqn15s
 LbSbZvxu+zqtykiX0T+173F4ZpGG/Dl2nPJDKcOI=
Date: Mon, 12 Oct 2020 10:55:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: compress: allow pause and resume during draining
Message-ID: <20201012052525.GH2968@vkoul-mobl>
References: <000001d6963c$3cc53690$b64fa3b0$@samsung.com>
 <s5heemlklo0.wl-tiwai@suse.de> <20201001102938.GU2968@vkoul-mobl>
 <2bf52360-bd11-b4cd-b255-8a5610b4aa5f@linux.intel.com>
 <20201006062105.GQ2968@vkoul-mobl>
 <4bbc385b-d35a-8766-7981-034455287225@linux.intel.com>
 <000d01d69d58$4e2db6f0$ea8924d0$@samsung.com>
 <s5hr1q7sa9f.wl-tiwai@suse.de>
 <831bbfcf-9720-9100-8633-65932b415cab@perex.cz>
 <s5ha6wusb2l.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5ha6wusb2l.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, pilsun.jang@samsung.com,
 khw0178.kim@samsung.com, lgirdwood@gmail.com, kimty@samsung.com,
 s47.kang@samsung.com, tiwai@suse.com,
 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 hmseo@samsung.com, Gyeongtaek Lee <gt82.lee@samsung.com>, tkjung@samsung.com
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

Hi Takashi, Jaroslav,

On 10-10-20, 11:08, Takashi Iwai wrote:
> On Fri, 09 Oct 2020 19:43:40 +0200,
> Jaroslav Kysela wrote:
> > 
> > Dne 09. 10. 20 v 17:13 Takashi Iwai napsal(a):
> > > On Thu, 08 Oct 2020 11:49:24 +0200,
> > > Gyeongtaek Lee wrote:
> > >>
> > >> On 10/06/20 11:57 PM, Pierre-Louis Bossart wrote:
> > >>>> The SM in kernel might be bit more convoluted so was wondering if we can
> > >>>> handle this in userland. The changelog for this patch says that for
> > >>>> test case was sending whole file, surely that is not an optimal approach.
> > >>>
> > >>> It's rather common to have to deal with very small files, even with PCM, 
> > >>> e.g. for notifications. It's actually a classic test case that exposes 
> > >>> design issues in drivers, where e.g. the last part of the notification 
> > >>> is not played.
> > >>>
> > >>>> Should we allow folks to send whole file to kernel and then issue
> > >>>> partial drain?
> > >>>
> > >>> I don't think there should be a conceptual limitation here. If the 
> > >>> userspace knows that the last part of the file is smaller than a 
> > >>> fragment it should be able to issue a drain (or partial drain if it's a 
> > >>> gapless solution).
> > >>>
> > >>> However now that I think of it, I am not sure what happens if the file 
> > >>> is smaller than a fragment. That may very well be a limitation in the 
> > >>> design.
> > >>>
> > >> Thanks for the comments.
> > >>
> > >> Actually, problem can be occurred with big file also.
> > >> Application usually requests draining after sending last frame.
> > >> If user clicks pause button after draining, pause will be failed
> > >> and the file just be played until end.
> > >> If application stop and start playback for this case, 
> > >> start of last frame will be heard again because stop sets state to SETUP,
> > >> and write is needed to set the state to PREPARED for start.
> > >> If bitrate of the file is low, time stamp will be reversed and be heard weird.
> > >> I also hope this problem can be handled in userspace easily but I couldn't find a way for now.
> > >>
> > >> I think that this is the time that I should share fixed patch following the comments to help the discussion.
> > >> Following opinions are added to the patch.
> > >> 1. it's be much nicer to have a new state - Takashi
> > > 
> > > Well, it wasn't me; I'm not against the new state *iff* it would end
> > > up with cleaner code.  Admittedly, the new state can be more
> > > "consistent" regarding the state transition.  If we allow the PAUSE
> > > state during DRAINING, it'll lead to multiple states after resuming
> > > the pause.
> > > 
> > >> 2. We can add this state to asound.h so the user space can be updated. - Jaroslav
> > >> 3. don't forget to increase the SNDRV_COMPRESS_VERSION - Jaroslav
> > >>
> > >> I'm bit wondering whether it is good to increase SNDRV_COMPRESS_VERSION
> > >> with a change in asound.h not in compress_offload.h.
> > >> Should I increase SNDRV_PCM_VERSION also?
> > > 
> > > Yes, if we really add the PCM state, it's definitely needed.
> > > 
> > >> And what happened if I request back-porting a patch which changes VERSION to stables?
> > > 
> > > If we introduce the new change, it must be safe to the old kernels,
> > > too.  The problem is only about the compatibility of the user-space
> > > program, not about the kernel.
> > > 
> > > 
> > > HOWEVER: I'm still concerned by the addition of a new PCM state.
> > > Jaroslav suggested two steps approach, (1) first add the state only in
> > > the uapi header, then use (2) the new state actually.  But, this
> > > doesn't help much, simply because the step 1 won't catch real bugs.
> > > 
> > > Even if we add a new state and change the SNDRV_PCM_STATE_LAST, I
> > > guess most of code can be compiled fine.  So, at the step 1, no one
> > > notices it and bothered, either.  But, at the step 2, you'll hit a
> > > problem.
> > > 
> > > Adding a new state is something like to add a new color to the traffic
> > > signal.  In some countries, the car turning right at a crossing
> > > doesn't have to stop at a red signal.  Suppose that we want to control
> > > it, and change the international rule by introducing a new color (say
> > > magenta) signal to stop the car turning right.  That'll be a big
> > > confusion because most drivers are trained for only red, green and
> > > yellow signals.
> > > 
> > > Similarly, if we add a new PCM state, every program code that deals
> > > with the PCM state may be confused by the new state.  It has to be
> > > reviewed and corrected manually, because it's no syntax problem the
> > > compiler may catch.
> > 
> > If there is a handshake between both side, this problem is gone. We can just
> > add another flag / ioctl / whatever to activate the new behaviour.
> 
> That's another tricky part.  We do have already some handshake in
> alsa-lib to determine the supported protocol.  However, if a code in
> question is outside that influence, we can't ensure that all belonging
> components understand the new one.  e.g. if a program uses an
> intermediate library, it's free from alsa-lib changes.  Or, imagine
> some plugin.
> 
> If this were a change of the API function, we may have a better
> control.  We may provide different versioned symbols in the worst
> case, too.  But, an enum is essentially hard-coded, so we have no
> direct influence once after it's compiled.

So what if we add another state but keep it in kernel (hidden from
userspace)...?

Right now tinycompress does not make use of PCM streams, kernel handles
these. I am not aware of any other implementation.

So if the scope if within compress then it might work...

Thanks
-- 
~Vinod

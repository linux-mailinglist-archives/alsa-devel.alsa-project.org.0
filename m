Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E37CC1150
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Sep 2019 18:44:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF5A71664;
	Sat, 28 Sep 2019 18:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF5A71664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569689055;
	bh=yVHom1vkxHGbLqyf02mLpIaq28eHoZDHjnyeVDlzONs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OP5q2lwgu+DRenZBNLF3G09tzF6bT/Z6TGrc7Obmo7FL8HU7YFg7Z231AcXCPVjCw
	 0IARVjGTP5lHMQn5sMKGI4yVb2jwQ8VEFcnX4m0WGKUdvOVu6sLAha1QyLm0K7LF/w
	 d2z1ARR1mhzRQX0kSFqzdTFf7HZfBtdIzGXDNrGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E727EF803F4;
	Sat, 28 Sep 2019 18:42:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1254F803F4; Sat, 28 Sep 2019 18:42:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0EF3F800E2
 for <alsa-devel@alsa-project.org>; Sat, 28 Sep 2019 18:42:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0EF3F800E2
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Sep 2019 09:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,559,1559545200"; d="scan'208";a="342144357"
Received: from kekkonen.fi.intel.com ([10.237.72.156])
 by orsmga004.jf.intel.com with ESMTP; 28 Sep 2019 09:42:18 -0700
Date: Sat, 28 Sep 2019 19:33:02 +0300
From: Jaska Uimonen <jaska.uimonen@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20190928163301.GA19175@kekkonen.fi.intel.com>
References: <20190919142329.35bsdnh5skuj7jl3@toy.home.lxtec.de>
 <853b3859-8c8e-1c52-becb-3807d351b8f1@linux.intel.com>
 <f11c5347d8504148a47fdbc48d920f59@lenovo.com>
 <98b99cea-9be1-f232-f62c-1f0b7a10e295@linux.intel.com>
 <38abcb71-3041-7015-e56a-43f628b2faf1@perex.cz>
 <1569578841.43188.16.camel@linux.intel.com>
 <71636f27-3dd6-6236-f025-13dc465d06ae@perex.cz>
 <1569592832.43188.21.camel@linux.intel.com>
 <86f0f63d-16b5-55ff-2aba-775f1f5c4351@perex.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86f0f63d-16b5-55ff-2aba-775f1f5c4351@perex.cz>
User-Agent: Mutt/1.9.1 (2017-09-22)
Cc: Elimar Riesebieter <riesebie@lxtec.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Pearson <mpearson@lenovo.com>
Subject: Re: [alsa-devel] [External] Re: alsa-lib: Add ucm support for
 whiskeylake sof-skl_hda_card audio
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Sep 27, 2019 at 04:49:29PM +0200, Jaroslav Kysela wrote:
> Dne 27. 09. 19 v 16:00 Jaska Uimonen napsal(a):
> > On Fri, 2019-09-27 at 12:57 +0200, Jaroslav Kysela wrote:
> >> Dne 27. 09. 19 v 12:07 Jaska Uimonen napsal(a):
> >>> On Tue, 2019-09-24 at 13:53 +0200, Jaroslav Kysela wrote:
> >>>> Dne 19. 09. 19 v 17:15 Pierre-Louis Bossart napsal(a):
> >>>>> On 9/19/19 9:54 AM, Mark Pearson wrote:
> >>>>>>>
> >>>>>>> Indeed UCM is required for all cases where SOF and
> >>>>>>> PulseAudio
> >>>>>>> are used.
> >>>>>>>
> >>>>>>> Our thinking was however to add this UCM file to the new
> >>>>>>> repository outside
> >>>>>>> of alsa-lib [1]. There is an on-going thread started by
> >>>>>>> Jaroslav to move those
> >>>>>>> files and relicense them as BSD-3-Clause [2]
> >>>>>>>
> >>>>>>> [1]
> >>>>>>> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-
> >>>>>>> July/153257.html
> >>>>>>> [2]
> >>>>>>> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-
> >>>>>>> September/155246.html
> >>>>>>
> >>>>>> Thanks Pierre.
> >>>>>>
> >>>>>> Do we have any approximate timelines on when and how this
> >>>>>> will
> >>>>>> happen? (I'm new to this)
> >>>>>>
> >>>>>> One of my main aims is that we have a customer using Debian
> >>>>>> and
> >>>>>> one of our platforms that require this change - I need to
> >>>>>> make
> >>>>>> sure I understand how this would roll out and what actions
> >>>>>> they
> >>>>>> need to take in the meantime if it's not going to be
> >>>>>> available in
> >>>>>> Debian.
> >>>>>
> >>>>> I think the first order would be to have the file cleaned-up,
> >>>>> with
> >>>>> its 
> >>>>> Intel origin clearly stated with a signed-off-by tag.
> >>>>>
> >>>>> Then once this is done, the Debian package creation needs to be
> >>>>> handled 
> >>>>> (using either the ALSA repo or the cloned version on SOF
> >>>>> GitHub).
> >>>>> I 
> >>>>> don't have any experience with Debian packages so can't really
> >>>>> comment 
> >>>>> on the effort it would take.
> >>>>
> >>>> I did some cleanups here:
> >>>>
> >>>> https://github.com/alsa-project/alsa-ucm-conf/commit/f796f0852a09
> >>>> 7e23
> >>>> 8fa9f5efb174e95b5ee6c8b7
> >>>>
> >>>> Pierre, could you confirm the original source and are you ok with
> >>>> that?
> >>>
> >>> Cleanup looks fine to me, we should add still UCM "PlaybackVolume"
> >>> and
> >>> "CaptureVolume" settings, because otherwise Pulseaudio will use SW
> >>> volume only. This will make for example HDA led quirks useless...
> >>> (and actually CaptureVolume and PlaybackVolume in pulseaudio ucm
> >>> support is still not integrated, hopefully soon). Defining Capture
> >>> and
> >>> PlaybackVolume should not do any harm currently for user space.
> >>>
> >>> I can do that, Jaroslav you want PR against github or patches here 
> >>> to mailing list?
> >>
> >> As you wish. Both ways are acceptable for me. Note that I did another
> >> cleanup
> >> for 'Bass Speaker' for Carbon X1 7th and merged 'import' branch to
> >> 'master'
> >> branch on github (so do the PR against master, if you like).
> >>
> >> 				Thanks,
> >> 					Jaroslav
> >>
> > 
> > I made now:
> > https://github.com/alsa-project/alsa-ucm-conf/pull/1
> > and
> > https://github.com/alsa-project/alsa-ucm-conf/pull/2
> 
> Thanks. Why switches (PlaybackSwitch/CaptureSwitch) are not defined, too?

Currently the pulseaudio patch I'm testing uses only PlaybackVolume and
CaptureVolume. However Pulseaudio searches also for related switch
control. So if you have combined alsa volume element with switch, both
are set in hardware. With PlaybackSwitch we could define switch in
separate element to volume, which actually could be useful in some use
cases. Most cases however I see the mute switch combined with the
volume.

So maybe incremental addition when this gets implemented by Pulseaudio?
OTH should not do harm either, so in that sense I could add it.. 

> 
> > It would be good if Lenovo and Canonical folks also check these.
> > 
> > I'm testing this in Dell device with Ubuntu and twiddling outputs 
> > and volumes/mutes from UI. PR 2 is assuming Pulseaudio HW control, 
> > so not sure if the changes bad without it. 
> 
> BTW: Could you, Intel guys, review other UCM profiles for the SST drivers,
> too? It seems that PlaybackVolume is only in few other profiles and no one is
> using switches and capture CTL ID definitions. It basically means, that all
> UCM profiles are broken and only software volume is used in PA :-(
> 

I will surely go through all SOF related UCM's and fix/add them to repo.
AFAIK most legacy drivers are used without UCM by Pulseaudio in major
distros. So not sure how useful this is? To be honest, I think most
older UCM's are not really well tested with full audio stack (including
Pulseaudio), probably with command line ucm tools only.

br,
Jaska

> 				Jaroslav
> 
> -- 
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

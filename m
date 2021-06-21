Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A96C3AF3BF
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:02:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECEBD168D;
	Mon, 21 Jun 2021 20:01:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECEBD168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624298530;
	bh=UC54o7V1NAA6wo7/aVBJZo0ISS94uRTb4rGQjke5A1U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VO0Cpmua+/oq7X74hO6piwTgLNLD5L/jIDd/XJoWRm+XXAuxXWD6/Br4tr3E4v0mu
	 OFAlVMlRne8hG27JEj6e6ividtuTg4vves2Yfd48LPjZUJ4P7yTo/acGnZVFCwrnYb
	 XQcgb4Fdfn0L4Gi0Q2POwLj9uvT2oOeTUgwP5/lc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85403F80111;
	Mon, 21 Jun 2021 20:00:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 586C1F8016B; Mon, 21 Jun 2021 20:00:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91E82F80137
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:00:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91E82F80137
Received: by m.b4.vu (Postfix, from userid 1000)
 id 1182561E286F; Tue, 22 Jun 2021 03:30:20 +0930 (ACST)
Date: Tue, 22 Jun 2021 03:30:20 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH V2 00/14] Cleanup before adding Scarlett Gen 3 support
Message-ID: <20210621180020.GA11686@m.b4.vu>
References: <20210620164615.GA9148@m.b4.vu>
 <s5hmtrjvhso.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hmtrjvhso.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hin-Tak Leung <htl10@users.sourceforge.net>, alsa-devel@alsa-project.org,
 Vladimir Sadovnikov <sadko4u@gmail.com>
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

On Mon, Jun 21, 2021 at 08:43:51AM +0200, Takashi Iwai wrote:
> On Sun, 20 Jun 2021 18:46:15 +0200,
> Geoffrey D. Bennett wrote:
> > 
> > Hi Takashi,
> > 
> > Here is version 2 of a set of patches which is some cleanup of the
> > Scarlett Gen 2 mixer driver in preparation for adding Scarlett Gen 3
> > support.
> > 
> > One review comment I got (from Hin-Tak) was:
> > 
> > > 40+ patches is a lot, for modifying just one file. I would collapse
> > > it all into one and break it up again to under 10, maybe, broadly
> > > into "functionally-equivalent re-org", "small isolated bug fixes",
> > > "additional functions, not yet used", "hooking up those new
> > > functions", etc?
> > 
> > I'm not sure that I agree with that comment -- I tried to follow the
> > Documentation/process/submitting-patches.rst advice of "Separate each
> > logical change into a separate patch" for easy review of the
> > individual pieces, but perhaps I went too far in that direction?
> > 
> > Please let me know if I should combine some of these patches together.
> 
> The split is fine as long as it's done logically, so I took as is.
> 
> But, one thing that can be improved at the next time is to sort out
> fix patches.  e.g. you had patches for fixing the mixer field type
> (int vs enum) and a patch to correct the locking; those are rather
> independent from the cleanup series and should be applied for the
> stable backports, too.  I didn't add stable at this time because I
> wasn't sure whether applicable and that's no severe issue, but the
> process can be better.

I did not notice any actual bug from using the wrong field type, and
nobody reported the locking problem with Gen 2, so I think those are
low priority.

The two patches I submitted before for "Read all configuration at init
time" are a higher priority for stable as they fix an actual problem
that users are encountering: since our last discussion I had another
report from a user; they were wondering why their headphones stopped
working after changing an unrelated control.

> Note that the merge window may be closed in this week, so if you want
> the stuff to be merged, please submit now.

Thanks, I will submit very soon.

> Oh, one more thing: please use the mail thread for a patch set at the
> next time!

Sorry about that. Right after I sent I noticed that I forgot
--thread=shallow.

Thanks,
Geoffrey.

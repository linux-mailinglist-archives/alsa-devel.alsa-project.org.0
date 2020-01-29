Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5693414D199
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 20:58:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05478167E;
	Wed, 29 Jan 2020 20:57:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05478167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580327897;
	bh=CTI2iQ/DuZsm1g56357s3s35tegmmJYXizkONAd6ZSg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lm1PAhaZYQ4TdgZ7z9CXUbXatOpCO+Ay9Lta4lJr0gaKWaoADBH3+55rsr4X4ozM9
	 jrFNRLkoyzVHgo6L7cNZI/3H+FlFW78XqtILHZTYRsLe9MjNvM9fBMgLOO5I+YmK1a
	 jGffGWNTsm9KaqqhwhwuCbK81XQ4Nygx4cVH1eb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B6F9F8021E;
	Wed, 29 Jan 2020 20:56:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 671B5F80123; Wed, 29 Jan 2020 20:56:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC49FF80123
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 20:56:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC49FF80123
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VqnIza4d"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C54B32067C;
 Wed, 29 Jan 2020 19:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580327784;
 bh=q1z4cMceE9Ua/rLT8Dn67z+U6ZHbOuti30wvKj8qUQM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VqnIza4dIQNSF83zDwgdHCsuYxQ4cfRyJAGXlM1sOSA5jFLFcVZFXbR6nG3TwtGB4
 VG4D7NF3bzetsbLuXB+L2JO/3/Dt4xqIR6bfojyE3rgcE+Lwt9sMqoOY89AcVlBvGO
 sq1w0fXFnrgAgHIlYER06Yf7FEXg5iUIIVwF1izs=
Date: Wed, 29 Jan 2020 20:56:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200129195622.GA582499@kroah.com>
References: <CAFQqKeUnT=QHkBWp3ZDeuBtYCS=f7FLa0+eS9sRo8reK0N6YWg@mail.gmail.com>
 <20200129185947.GA478824@kroah.com>
 <CAFQqKeXOGOHpqWCmUskw4r5z1kKQG-_1zuKpaXb6gBozWWG+0g@mail.gmail.com>
 <95481116-cb3e-8025-87b8-554b1a8bc37e@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <95481116-cb3e-8025-87b8-554b1a8bc37e@linux.intel.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 Pierre-louis Bossart <pierre-louis.bossart@intel.com>
Subject: Re: [alsa-devel] Question about the correct license to use with
 debugfs in SOF
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

On Wed, Jan 29, 2020 at 01:41:34PM -0600, Pierre-Louis Bossart wrote:
> 
> > > > Currently, it is dual licensed with GPLv2.0 and BSD. But Pierre brought
> > > up
> > > > a concern about this conflicting with all the exports in the file being
> > > > GPLv2.0. Should this be fixed to change the license to GPLv2.0 only?
> > > > Appreciate your help in this regard.
> > > 
> > > Why ask a developer a legal question, don't you all have a whole huge
> > > legal department who knows all of this type of thing really really well?
> > > 
> > > Would you ask a programmer a medical question?
> > > 
> > > That being said, think about trying to justify the existance of a BSD
> > > licensed file trying to access gpl-only symbols, why in the world would
> > > this even be a question?  Why have it dual licensed at all when I was
> > > told that Intel was NOT going to do this anymore for any kernel code?
> > > 
> > Thanks for your patience and clarification.
> > We discovered the discrepancy while vetting the licenses in the files
> > again. Something we should be a bit more careful about moving forward.
> > Sorry for the trouble!
> 
> Indeed it's not our intention to use dual-licensing for debugfs at all.
> 
> Please treat this thread as a desire to be transparent with maintainers
> about a miss rather than an evil scheme to work around GPL.
> 
> Ranjani and I discovered the issue only a couple of hours ago while moving
> code around. I don't have any explanation for this other than a review
> oversight where we saw the EXPORT_SYMBOL_GPL and not the SPDX line. It's a
> mistake, not a feature.
> 
> I just checked the history and all the changes were made by Intel, except
> for your change "ASoC: SOF: no need to check return value of debugfs_create
> functions", and 2 minor other fixes for memory leaks.
> 
> We'll immediately change the license to GPLv2 only, move the code in a
> dedicated module that's GPLv2 only, and scan the rest of the
> Intel-contributed parts to make sure we don't have this mistake in other
> places.

Don't create a new module, unless your lawyers say you have to do so.
That way lies madness...

Why is this code dual-licensed in the first place anyway?  It only will
work on Linux, right?

Anyway, I thought Intel had stopped doing this, just changing the
license on the one file should be sufficient for now.  But again, I am
not your lawyer, go talk to yours before doing anything.

thanks,

greg k-h
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 344E3585449
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 19:16:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7E6E163B;
	Fri, 29 Jul 2022 19:15:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7E6E163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659114997;
	bh=VAkEGQMytpddlsQ64xfJjyOEeyWtSq4kkkEs8HNbh64=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TNTLA9GY98Yjg1/MhTCanmussnD4BhE9zc+bERxzWoTkxtT4hKCKHFHsx43jd3A7J
	 0StXJoLVPj7TEp8iSi0robY65ZjoedI2WCrOgWqqQrVDQz7YxPt2JY9o+KLDV/Tle5
	 mgzrNT3heRgzHkef19fMN4jQ+mrxeZ3CMKXlzuss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 490B4F800BD;
	Fri, 29 Jul 2022 19:15:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97250F8049C; Fri, 29 Jul 2022 19:15:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,PRX_BODY_21,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AC67F800BD
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 19:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AC67F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="t+jw/oEv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D905CB825FB;
 Fri, 29 Jul 2022 17:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DB0C433D6;
 Fri, 29 Jul 2022 17:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1659114927;
 bh=VAkEGQMytpddlsQ64xfJjyOEeyWtSq4kkkEs8HNbh64=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t+jw/oEvzQ0ZS7d4yPWHfkE5ZHKpFe7S0xEGGznHHgssCeJ3xgB9KSWWVWJCujN9A
 2sHRVGnfsZfr2yJhE9BOdyuSbzIfoC+ZhfYLmlqM1P26pF6lbzIwFizPma1tNUsrmL
 ijDjWmXEXDkDJSiQpIJMzYGqoTLujQ3bDBW4PGMI=
Date: Fri, 29 Jul 2022 19:15:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/5] soundwire: sysfs: cleanup the logic for creating the
 dp0 sysfs attributes
Message-ID: <YuQVrLEqPMu1V0zJ@kroah.com>
References: <20220729135041.2285908-1-gregkh@linuxfoundation.org>
 <20220729135041.2285908-2-gregkh@linuxfoundation.org>
 <9365e038-2146-98f8-f989-02827f221c34@linux.intel.com>
 <YuP0Ffs3G7ZBR0AC@kroah.com>
 <cfacb124-a9ff-0a93-8f92-93d164b15966@linux.intel.com>
 <YuP2pjhyKTTfpXQq@kroah.com>
 <5caffe2a-f5a6-e312-a564-5fe29c4e2323@linux.intel.com>
 <YuQMYRYFo9gTk1yL@kroah.com>
 <701aa1ba-9b25-51eb-8bd7-2389b501d79c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <701aa1ba-9b25-51eb-8bd7-2389b501d79c@linux.intel.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Fri, Jul 29, 2022 at 11:46:32AM -0500, Pierre-Louis Bossart wrote:
> 
> >>>>> That should be fine, tools should just be looking for the attributes,
> >>>>> not the existance of a directory, right?
> >>>>
> >>>> The idea what that we would only expose ports that actually exist.
> >>>> That's helpful information anyone with a basic knowledge of the
> >>>> SoundWire specification would understand.
> >>>
> >>> Is "dp0" a port?  If so, why isn't it a real device?
> >>
> >> The SoundWire spec defines the concept of 'data port'. The valid ranges
> >> are 1..14, but in all existing devices the number of data ports is way
> >> smaller, typically 2 to 4. Data ports (DPn) are source or sink, and
> >> there's no firm rule that data ports needs to be contiguous.
> >>
> >> DP0 is a 'special case' where the data transport is used for control
> >> information, e.g. programming large set of registers or firmware
> >> download. DP0 is completely optional in hardware, and not handled in
> >> Linux for now.
> >>
> >> DP0 and DPn expose low-level transport registers, which define how the
> >> contents of a FIFO will be written or read from the bus. Think of it as
> >> a generalization of the concept of TDM slots, where instead of having a
> >> fixed slot per frame the slot position/repetition/runlength can be
> >> programmed.
> >>
> >> The data ports could be as simple as 1-bit PDM, or support 8ch PCM
> >> 24-bits. That's the sort of information reported in attributes.
> > 
> > Why not make them a real device like we do for USB endpoints?
> 
> I don't see what adding another layer of hierarchy would bring. In their
> simplest configuration, there are 6 registers 8-bit exposed. And the
> port registers, when present, are accessed with a plain vanilla offset.

Who uses these registers?

> > What uses these sysfs files today that would be confused about an empty
> > directory?
> 
> That's a good question. I am not aware of any tools making use of those
> attributes. To a large degree, they are helpful only for debug and
> support, all these read-only attributes could be moved to debugfs. That
> could be a way to simplify everyone's life....

That would be much nicer, put it all in a single debugfs file and it
would be so simple.

What attributes could we do that for?

thanks,

greg k-h

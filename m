Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B512822EF
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Oct 2020 11:12:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD11C1676;
	Sat,  3 Oct 2020 11:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD11C1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601716341;
	bh=+H3coAR6Fioal9+7MVfehikn7d42BcFW9CVSVF57YNA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lo7CLC0eZnFQ+8Jk61bQ3+B2KnSCkq+Zdrf7dZ52s3mXTrTLliDesJAMKyVcKdNxy
	 UeyrGiMz9LXJ5jp9qRnBOcPNozGy8iiqx6fKVpw5JgUgPdDcyjvHvG+2oodNj2VEi+
	 8rX5xBCugv6KJujv4BlRiGkvypmVaCR/swy7Xdgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A227EF8022B;
	Sat,  3 Oct 2020 11:09:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C935F8020C; Sat,  3 Oct 2020 11:09:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFBC8F801D8
 for <alsa-devel@alsa-project.org>; Sat,  3 Oct 2020 11:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFBC8F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ep+U3ZYX"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E7A9206CA;
 Sat,  3 Oct 2020 09:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601716139;
 bh=+H3coAR6Fioal9+7MVfehikn7d42BcFW9CVSVF57YNA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ep+U3ZYXpUWinPA5Hc+8RKPJnfJxodtCp5s4optfYPNL71RbeiHZhHgoKLeZngHH2
 BUF3Y9hCKiUYuZ344WcYNoS3Q33zSA9VdtEFmriCZl9LWAvNJIzGB51NXwGxPtjzns
 mu44JlAo4REfkKOd651zOpcHIntVhTr/Ns0BdYvE=
Date: Sat, 3 Oct 2020 11:08:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Ertman, David M" <david.m.ertman@intel.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201003090855.GD114893@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001071403.GC31191@kroah.com>
 <DM6PR11MB2841742651F535F0826326CDDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB2841742651F535F0826326CDDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "parav@nvidia.com" <parav@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>
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

On Fri, Oct 02, 2020 at 08:23:49PM +0000, Ertman, David M wrote:
> > -----Original Message-----
> > From: Greg KH <gregkh@linuxfoundation.org>
> > Sent: Thursday, October 1, 2020 12:14 AM
> > To: Ertman, David M <david.m.ertman@intel.com>
> > Cc: alsa-devel@alsa-project.org; tiwai@suse.de; broonie@kernel.org; pierre-
> > louis.bossart@linux.intel.com; Sridharan, Ranjani
> > <ranjani.sridharan@intel.com>; jgg@nvidia.com; parav@nvidia.com
> > Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
> > support
> > 
> > On Wed, Sep 30, 2020 at 03:50:45PM -0700, Dave Ertman wrote:
> > > The ancillary bus (then known as virtual bus) was originally submitted
> > > along with implementation code for the ice driver and irdma drive,
> > > causing the complication of also having dependencies in the rdma tree.
> > > This new submission is utilizing an ancillary bus consumer in only the
> > > sound driver tree to create the initial implementation and a single
> > > user.
> > 
> > So this will not work for the ice driver and/or irdma drivers?  It would
> > be great to see how they work for this as well as getting those
> > maintainers to review and sign off on this implementation as well.
> > Don't ignore those developers, that's a bit "odd", don't you think?
> > 
> > To drop them from the review process is actually kind of rude, what
> > happens if this gets merged without their input?
> > 
> > And the name, why was it changed and what does it mean?  For non-native
> > english speakers this is going to be rough, given that I as a native
> > english speaker had to go look up the word in a dictionary to fully
> > understand what you are trying to do with that name.
> 
> Through our internal review process, objections were raised on naming the
> new bus virtual bus. The main objection was that virtual bus was too close to virtio,
> virtchnl, etc., that /sys/bus/virtual would be confused with /sys/bus/virtio, and
> there is just a lot of 'virt' stuff in the kernel already.

We already have a virtual bus/location in the driver model today, has
that confused anyone?  I see this as an extension of that logic and
ideally, those users will be moved over to this interface over time as
well.

> Several names were suggested (like peer bus, which was shot down because in
> parts on the English speaking world the peerage means nobility), finally
> "ancillary bus" was arrived at by consensus of not hating it.

"not hating it", while sometimes is a good thing, for something that I
am going to have to tell everyone to go use, I would like to at least
"like it".  And right now I don't like it...

I think we should go back to "virtual" for now, or, if the people who
didn't like it on your "internal" reviews wish to participate here and
defend their choice, I would be glad to listen to that reasoning.

thanks,

greg k-h

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B741C2CF218
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 17:43:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43CC9850;
	Fri,  4 Dec 2020 17:42:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43CC9850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607100182;
	bh=gkJXbFGeAWtANVS3GH6Dwn1W1jbDk1HH/j8LIHhEd8U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ab6rAezYlRquyfMvipkcw+ZLjJ8uX1khCYI7AmMiXYTG5DoEJEtBA7khrbnpNidbi
	 Z57si7eh6xIxwSgikMIM3EutUKTPgasztSmzxE3i1FIBVNeWARdWhAxvCfgUPSPF8p
	 w/exU7/EYykFnUoc97Sva7xGGRL6MHbmHcJBUroE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68F0BF800E2;
	Fri,  4 Dec 2020 17:41:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00D88F80278; Fri,  4 Dec 2020 17:41:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88C05F800E8
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 17:41:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88C05F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="0yetlJbY"
Received: by mail-ed1-x541.google.com with SMTP id c7so6475525edv.6
 for <alsa-devel@alsa-project.org>; Fri, 04 Dec 2020 08:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0DSnVIqhCjfQRKv2sQg9Q6JdfEOfBg7tXO7oAxFOt6Q=;
 b=0yetlJbYMnmdPmLRUZn7RS3bh0tzdzDGM+9PDleeD2iqRFXkNd6mRf3f03rSWgmQd5
 qOdHp/kup+NAYxh/CJU9LLba4DAwBUgERhl0M4qXHOiXVt1fco+LP77vh1cyZ6qq4c/8
 foxoZxB5HbKBzb5iEeajTCsLfYovy0DkhPTg2Vx19iICqqPRG/USmccONRumHiexn6TT
 emAV80gchfWJPgkMYOcf5EbJkWMDGA1M8o5UgQZIurDf8zmRVSOw/6i4VpmZ4L3VjJY1
 Lb0/f/PdqHE31Hd1g7ro/aT6mcyIWyq6RwBrvqipCdwmt+1rH+sEiJAwqvHPxCuIWtFs
 z3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0DSnVIqhCjfQRKv2sQg9Q6JdfEOfBg7tXO7oAxFOt6Q=;
 b=RG83w6eZlNHYMXQ2dZ/9sV6sKZsG+7rgF3xb8NZ4TyvfBrQrRcr5xY0kNWEVFGIElu
 c9bGhZ94i67BWgkZAz3OO72sPTFIuCZWsI6mF3Tyx2CPVbLH2HIjXYa64dVV1cm8Izj4
 kxjAw8Sv3LXBNkO47GEhqk2qa1SWZaYSt7p+N/28zXpHKV4vT3dWXTLD07ugb20yOEEi
 yNsEHMHNc3phZ/+cKWUQimlEaE6ZxnEDnssQyzE8ppsfT55dXjpph1j+xpvzv8cJpkY5
 8i5SgslvDBIg4gniIipNfN/zhckpWT9+/1mwa4XPQIp5k7PDWLtuRDR+h0UTw8iANyex
 l0NA==
X-Gm-Message-State: AOAM5301Ra/ESyMTTpNobFXjw2unjdcrbEbmE/cf4Yu+ltXK6hUhnBcm
 iyNQa5g8QWY4mJyU0ZWlhEBIix63QDvZqh/1uCzxWw==
X-Google-Smtp-Source: ABdhPJwaZ4haRtuDzBD84WdDW7otHcrepP4bW/OgCJDuVGkx8fNTTRTGsYJMeW0OBOxCy0odLqO+2rTLHMU2+xmnxS8=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr2165444edw.52.1607100074435;
 Fri, 04 Dec 2020 08:41:14 -0800 (PST)
MIME-Version: 1.0
References: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
 <X8ogtmrm7tOzZo+N@kroah.com>
In-Reply-To: <X8ogtmrm7tOzZo+N@kroah.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 4 Dec 2020 08:41:09 -0800
Message-ID: <CAPcyv4iLG7V9JT34La5PYfyM9378acbLnkShx=6pOmpPK7yg3A@mail.gmail.com>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kiran Patil <kiran.patil@intel.com>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Shiraz Saleem <shiraz.saleem@intel.com>,
 Martin Habets <mhabets@solarflare.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Dave Ertman <david.m.ertman@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Netdev <netdev@vger.kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>, David Miller <davem@davemloft.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Parav Pandit <parav@mellanox.com>
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

On Fri, Dec 4, 2020 at 3:41 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Dec 02, 2020 at 04:54:24PM -0800, Dan Williams wrote:
> > From: Dave Ertman <david.m.ertman@intel.com>
> >
> > Add support for the Auxiliary Bus, auxiliary_device and auxiliary_driver.
> > It enables drivers to create an auxiliary_device and bind an
> > auxiliary_driver to it.
> >
> > The bus supports probe/remove shutdown and suspend/resume callbacks.
> > Each auxiliary_device has a unique string based id; driver binds to
> > an auxiliary_device based on this id through the bus.
> >
> > Co-developed-by: Kiran Patil <kiran.patil@intel.com>
> > Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > Co-developed-by: Fred Oh <fred.oh@linux.intel.com>
> > Co-developed-by: Leon Romanovsky <leonro@nvidia.com>
> > Signed-off-by: Kiran Patil <kiran.patil@intel.com>
> > Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
> > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Reviewed-by: Shiraz Saleem <shiraz.saleem@intel.com>
> > Reviewed-by: Parav Pandit <parav@mellanox.com>
> > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > Reviewed-by: Martin Habets <mhabets@solarflare.com>
> > Link: https://lore.kernel.org/r/20201113161859.1775473-2-david.m.ertman@intel.com
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > ---
> > This patch is "To:" the maintainers that have a pending backlog of
> > driver updates dependent on this facility, and "Cc:" Greg. Greg, I
> > understand you have asked for more time to fully review this and apply
> > it to driver-core.git, likely for v5.12, but please consider Acking it
> > for v5.11 instead. It looks good to me and several other stakeholders.
> > Namely, stakeholders that have pressure building up behind this facility
> > in particular Mellanox RDMA, but also SOF, Intel Ethernet, and later on
> > Compute Express Link.
> >
> > I will take the blame for the 2 months of silence that made this awkward
> > to take through driver-core.git, but at the same time I do not want to
> > see that communication mistake inconvenience other parties that
> > reasonably thought this was shaping up to land in v5.11.
> >
> > I am willing to host this version at:
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/djbw/linux tags/auxiliary-bus-for-5.11
> >
> > ...for all the independent drivers to have a common commit baseline. It
> > is not there yet pending Greg's Ack.
> >
> > For example implementations incorporating this patch, see Dave Ertman's
> > SOF series:
> >
> > https://lore.kernel.org/r/20201113161859.1775473-2-david.m.ertman@intel.com
> >
> > ...and Leon's mlx5 series:
> >
> > http://lore.kernel.org/r/20201026111849.1035786-1-leon@kernel.org
> >
> > PS: Greg I know I promised some review on newcomer patches to help with
> > your queue, unfortunately Intel-internal review is keeping my plate
> > full. Again, I do not want other stakeholder to be waiting on me to
> > resolve that backlog.
>
> Ok, I spent some hours today playing around with this.  I wrote up a
> small test-patch for this (how did anyone test this thing???) and while
> it feels awkward in places, and it feels like there is still way too
> much "boilerplate" code that a user has to write and manage, I don't
> have the time myself to fix it up right now.
>
> So I'll go apply this to my tree, and provide a tag for everyone else to
> be able to pull from for their different development trees so they can
> work on.
>
> I do have 3 follow-on patches that I will send to the list in response
> to this message that I will be applying on top of this patch.  They do
> some minor code formatting changes, as well as change the return type of
> the remove function to make it more future-proof.  That last change will
> require users of this code to change their implementations, but it will
> be obvious what to do as you will get a build warning.
>
> Note, I'm still not comfortable with a few things here.  The
> documentation feels odd, and didn't really help me out in writing any
> test code, which doesn't seem right.  Also the use of strings and '.' as
> part of the api feels awkward, and messy, and of course, totally
> undocumented.
>
> But, as the use of '.' is undocumented, that means we can change it in
> the future!  Because no driver or device name should ever be a user api
> reliant thing, if we come up with a better way to do all of this in the
> future, that shouldn't be a problem to change existing users over to
> this.  So this is a warning to everyone, you CAN NOT depend on the sysfs
> name of a device or bus name for any tool.  If so, your userspace tool
> is broken.
>
> Thanks for everyone in sticking with this, I know it's been a long slog,
> hopefully this will help some driver authors move forward with their
> crazy complex devices :)

To me, the documentation was written, and reviewed, more from the
perspective of "why not open code a custom bus instead". So I can see
after the fact how that is a bit too much theory and justification and
not enough practical application. Before the fact though this was a
bold mechanism to propose and it was not clear that everyone was
grokking the "why" and the tradeoffs.

I also think it was a bit early to identify consistent design patterns
across the implementations and codify those. I expect this to evolve
convenience macros just like other parts of the driver-core gained
over time. Now that it is in though, another pass through the
documentation to pull in more examples seems warranted.

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A71B72CED51
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 12:43:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5838186B;
	Fri,  4 Dec 2020 12:42:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5838186B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607082199;
	bh=U+D8jQyF2x7hxn+mgXKApvlrbJWVFjxv8aEqAKyetO4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uy0hnJZUfcwqdFrEeELBGBxzwN5+3BxQbl+AoRdu1mFyuTDABJpeZmNHDj1bzzWOb
	 fJx4HG7LNHq5vbiRL892CdPxUk7ps+nfvQsxPnVPdib/o9fRt4d1g0LxaeuvG708mQ
	 qttMkCZc7ygm9uQOKWRRHfJUHGQ7iVsuBnOUTPJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29EA5F800E8;
	Fri,  4 Dec 2020 12:41:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13178F800E8; Fri,  4 Dec 2020 12:41:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83966F8012A
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 12:41:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83966F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="pgzHwqQI"
Date: Fri, 4 Dec 2020 12:42:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607082090;
 bh=U+D8jQyF2x7hxn+mgXKApvlrbJWVFjxv8aEqAKyetO4=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=pgzHwqQII3NRBJIRuBKi8KUHFpoykh2NAC8oAmuATii8kf7GxzUu5WwCliXD1+7KD
 SLwaG5RKj8YEjSZFdnw97/idOqD3UmftByYTQE+u1gB6pQ6RRVQK/is2uWeoAyR3nd
 lB+8Q9xv9WeKHfmSB1weOGsoHXMTlFdTgFgW5VJ0=
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
Message-ID: <X8ogtmrm7tOzZo+N@kroah.com>
References: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kiran Patil <kiran.patil@intel.com>,
 linux-rdma@vger.kernel.org, Shiraz Saleem <shiraz.saleem@intel.com>,
 Martin Habets <mhabets@solarflare.com>, lgirdwood@gmail.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org, jgg@nvidia.com,
 Dave Ertman <david.m.ertman@intel.com>, kuba@kernel.org,
 netdev@vger.kernel.org, Leon Romanovsky <leonro@nvidia.com>,
 davem@davemloft.net, linux-kernel@vger.kernel.org,
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

On Wed, Dec 02, 2020 at 04:54:24PM -0800, Dan Williams wrote:
> From: Dave Ertman <david.m.ertman@intel.com>
> 
> Add support for the Auxiliary Bus, auxiliary_device and auxiliary_driver.
> It enables drivers to create an auxiliary_device and bind an
> auxiliary_driver to it.
> 
> The bus supports probe/remove shutdown and suspend/resume callbacks.
> Each auxiliary_device has a unique string based id; driver binds to
> an auxiliary_device based on this id through the bus.
> 
> Co-developed-by: Kiran Patil <kiran.patil@intel.com>
> Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Co-developed-by: Fred Oh <fred.oh@linux.intel.com>
> Co-developed-by: Leon Romanovsky <leonro@nvidia.com>
> Signed-off-by: Kiran Patil <kiran.patil@intel.com>
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Shiraz Saleem <shiraz.saleem@intel.com>
> Reviewed-by: Parav Pandit <parav@mellanox.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Martin Habets <mhabets@solarflare.com>
> Link: https://lore.kernel.org/r/20201113161859.1775473-2-david.m.ertman@intel.com
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
> This patch is "To:" the maintainers that have a pending backlog of
> driver updates dependent on this facility, and "Cc:" Greg. Greg, I
> understand you have asked for more time to fully review this and apply
> it to driver-core.git, likely for v5.12, but please consider Acking it
> for v5.11 instead. It looks good to me and several other stakeholders.
> Namely, stakeholders that have pressure building up behind this facility
> in particular Mellanox RDMA, but also SOF, Intel Ethernet, and later on
> Compute Express Link.
> 
> I will take the blame for the 2 months of silence that made this awkward
> to take through driver-core.git, but at the same time I do not want to
> see that communication mistake inconvenience other parties that
> reasonably thought this was shaping up to land in v5.11.
> 
> I am willing to host this version at:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/djbw/linux tags/auxiliary-bus-for-5.11
> 
> ...for all the independent drivers to have a common commit baseline. It
> is not there yet pending Greg's Ack.
> 
> For example implementations incorporating this patch, see Dave Ertman's
> SOF series:
> 
> https://lore.kernel.org/r/20201113161859.1775473-2-david.m.ertman@intel.com
> 
> ...and Leon's mlx5 series:
> 
> http://lore.kernel.org/r/20201026111849.1035786-1-leon@kernel.org
> 
> PS: Greg I know I promised some review on newcomer patches to help with
> your queue, unfortunately Intel-internal review is keeping my plate
> full. Again, I do not want other stakeholder to be waiting on me to
> resolve that backlog.

Ok, I spent some hours today playing around with this.  I wrote up a
small test-patch for this (how did anyone test this thing???) and while
it feels awkward in places, and it feels like there is still way too
much "boilerplate" code that a user has to write and manage, I don't
have the time myself to fix it up right now.

So I'll go apply this to my tree, and provide a tag for everyone else to
be able to pull from for their different development trees so they can
work on.

I do have 3 follow-on patches that I will send to the list in response
to this message that I will be applying on top of this patch.  They do
some minor code formatting changes, as well as change the return type of
the remove function to make it more future-proof.  That last change will
require users of this code to change their implementations, but it will
be obvious what to do as you will get a build warning.

Note, I'm still not comfortable with a few things here.  The
documentation feels odd, and didn't really help me out in writing any
test code, which doesn't seem right.  Also the use of strings and '.' as
part of the api feels awkward, and messy, and of course, totally
undocumented.

But, as the use of '.' is undocumented, that means we can change it in
the future!  Because no driver or device name should ever be a user api
reliant thing, if we come up with a better way to do all of this in the
future, that shouldn't be a problem to change existing users over to
this.  So this is a warning to everyone, you CAN NOT depend on the sysfs
name of a device or bus name for any tool.  If so, your userspace tool
is broken.

Thanks for everyone in sticking with this, I know it's been a long slog,
hopefully this will help some driver authors move forward with their
crazy complex devices :)

thanks,

greg k-h

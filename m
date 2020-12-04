Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7B42CF2C3
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 18:12:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AFE81893;
	Fri,  4 Dec 2020 18:11:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AFE81893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607101943;
	bh=AoWSZ9rATBPrh2CgyRV3pM6GNUWkdHM213tiPQeGUys=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D/2Mv0wnWhMx7Vgj2DMFQctw+clEEHOZrXdCeOkrKmNHqdW8+LLvg0Gu0t1uQNngh
	 h8O3K1U7YjTkv4Xgoy0rVn452BhMK32g7W9LKNjDhAgVzPzdBXB4+CcIp3eYvS85bW
	 4Jpc7Cc0Pxq/xRt9UXuXFNcozShnb9pZfQdy849Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F981F8049C;
	Fri,  4 Dec 2020 18:10:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77504F80278; Fri,  4 Dec 2020 18:10:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE288F800E8
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 18:10:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE288F800E8
IronPort-SDR: iaB0kxvQSIQ2E76UWMpeYQQYQYvwZHq2X1s0x9WwQNuyhbNFirDe9e1X6haAJ3yIRU+W0TPbPi
 BJrAhK6OygtA==
X-IronPort-AV: E=McAfee;i="6000,8403,9825"; a="160463220"
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="160463220"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 09:10:35 -0800
IronPort-SDR: Q+kE0BgnPU7r7p9k4wspq1KsSVeTDsFrzsFNtygkwpTILxTTJpT1uFQm7NdtGN+n3JtkEsQNsh
 z4MleMyQy3BQ==
X-IronPort-AV: E=Sophos;i="5.78,393,1599548400"; d="scan'208";a="551015315"
Received: from mwalsh7-mobl1.amr.corp.intel.com ([10.212.248.252])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 09:10:34 -0800
Message-ID: <f8371c36608084144fe6e8ca089901d330a7191f.camel@linux.intel.com>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>, Leon Romanovsky <leonro@nvidia.com>
Date: Fri, 04 Dec 2020 09:10:34 -0800
In-Reply-To: <X8oyqpxDQ4JV31tj@kroah.com>
References: <160695681289.505290.8978295443574440604.stgit@dwillia2-desk3.amr.corp.intel.com>
 <X8ogtmrm7tOzZo+N@kroah.com> <20201204123207.GH16543@unreal>
 <X8oyqpxDQ4JV31tj@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kiran Patil <kiran.patil@intel.com>,
 linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 Martin Habets <mhabets@solarflare.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, Fred Oh <fred.oh@linux.intel.com>, broonie@kernel.org,
 jgg@nvidia.com, kuba@kernel.org, Dave Ertman <david.m.ertman@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>, davem@davemloft.net,
 linux-kernel@vger.kernel.org, Parav Pandit <parav@mellanox.com>
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

On Fri, 2020-12-04 at 13:59 +0100, Greg KH wrote:
> On Fri, Dec 04, 2020 at 02:32:07PM +0200, Leon Romanovsky wrote:
> > On Fri, Dec 04, 2020 at 12:42:46PM +0100, Greg KH wrote:
> > > On Wed, Dec 02, 2020 at 04:54:24PM -0800, Dan Williams wrote:
> > > > From: Dave Ertman <david.m.ertman@intel.com>
> > > > 
> > > > Add support for the Auxiliary Bus, auxiliary_device and
> > > > auxiliary_driver.
> > > > It enables drivers to create an auxiliary_device and bind an
> > > > auxiliary_driver to it.
> > > > 
> > > > The bus supports probe/remove shutdown and suspend/resume
> > > > callbacks.
> > > > Each auxiliary_device has a unique string based id; driver
> > > > binds to
> > > > an auxiliary_device based on this id through the bus.
> > > > 
> > > > Co-developed-by: Kiran Patil <kiran.patil@intel.com>
> > > > Co-developed-by: Ranjani Sridharan <
> > > > ranjani.sridharan@linux.intel.com>
> > > > Co-developed-by: Fred Oh <fred.oh@linux.intel.com>
> > > > Co-developed-by: Leon Romanovsky <leonro@nvidia.com>
> > > > Signed-off-by: Kiran Patil <kiran.patil@intel.com>
> > > > Signed-off-by: Ranjani Sridharan <
> > > > ranjani.sridharan@linux.intel.com>
> > > > Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
> > > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > > Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
> > > > Reviewed-by: Pierre-Louis Bossart <
> > > > pierre-louis.bossart@linux.intel.com>
> > > > Reviewed-by: Shiraz Saleem <shiraz.saleem@intel.com>
> > > > Reviewed-by: Parav Pandit <parav@mellanox.com>
> > > > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > > > Reviewed-by: Martin Habets <mhabets@solarflare.com>
> > > > Link: 
> > > > https://lore.kernel.org/r/20201113161859.1775473-2-david.m.ertman@intel.com
> > > > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> > > > ---
> > > > This patch is "To:" the maintainers that have a pending backlog
> > > > of
> > > > driver updates dependent on this facility, and "Cc:" Greg.
> > > > Greg, I
> > > > understand you have asked for more time to fully review this
> > > > and apply
> > > > it to driver-core.git, likely for v5.12, but please consider
> > > > Acking it
> > > > for v5.11 instead. It looks good to me and several other
> > > > stakeholders.
> > > > Namely, stakeholders that have pressure building up behind this
> > > > facility
> > > > in particular Mellanox RDMA, but also SOF, Intel Ethernet, and
> > > > later on
> > > > Compute Express Link.
> > > > 
> > > > I will take the blame for the 2 months of silence that made
> > > > this awkward
> > > > to take through driver-core.git, but at the same time I do not
> > > > want to
> > > > see that communication mistake inconvenience other parties that
> > > > reasonably thought this was shaping up to land in v5.11.
> > > > 
> > > > I am willing to host this version at:
> > > > 
> > > > git://git.kernel.org/pub/scm/linux/kernel/git/djbw/linux
> > > > tags/auxiliary-bus-for-5.11
> > > > 
> > > > ...for all the independent drivers to have a common commit
> > > > baseline. It
> > > > is not there yet pending Greg's Ack.
> > > > 
> > > > For example implementations incorporating this patch, see Dave
> > > > Ertman's
> > > > SOF series:
> > > > 
> > > > https://lore.kernel.org/r/20201113161859.1775473-2-david.m.ertman@intel.com
> > > > 
> > > > ...and Leon's mlx5 series:
> > > > 
> > > > http://lore.kernel.org/r/20201026111849.1035786-1-leon@kernel.org
> > > > 
> > > > PS: Greg I know I promised some review on newcomer patches to
> > > > help with
> > > > your queue, unfortunately Intel-internal review is keeping my
> > > > plate
> > > > full. Again, I do not want other stakeholder to be waiting on
> > > > me to
> > > > resolve that backlog.
> > > 
> > > Ok, I spent some hours today playing around with this.  I wrote
> > > up a
> > > small test-patch for this (how did anyone test this thing???).
> > 
> > We are running all verifications tests that we have over our
> > mlx5 driver. It includes devices reloads, power failures, FW
> > reconfiguration to emulate different devices with and without error
> > injections and many more. Up till now, no new bugs that are not
> > known
> > to us were found.
> 
> Yes, sorry, I was implying that the authors here had to create _some_
> code to test this with, it would have been nice to include that as
> well
> here.  We are collecting more and more in-kernel tests, having one
> for
> this code would be nice to also have so we make sure not to break any
> functionality in the future.

Hi Greg,

Thanks for your patience with this series. The v4 version submitted by
Dave included the SOF usage code to demonstrate the usage. We have run
all tests for device registration, module reload, PM etc and have not
observed any regressions in the SOF audio driver.

Thanks,
Ranjani


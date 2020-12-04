Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 383802CEE19
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 13:34:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A4F51879;
	Fri,  4 Dec 2020 13:34:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A4F51879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607085290;
	bh=zmxko2CBQcTrRimzgblGXja5H1EAFSbtho5hMRphqPo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eg6NBh65susLNofm1Qd2aWTCJoc3i3PXEnvyW1Q0W5kDTmjlCoCM2iB/8rQdVca51
	 lekgPx0BbJgy30cqNU20FTAHm51bN/bgtBhZ6SCf7udaKQOqdozSY+X+lexigkCljO
	 lMIIZsb52Bx7sBnM4CDUYhS03lSnLtvForhepdKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CE25F800E2;
	Fri,  4 Dec 2020 13:33:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3B3BF8049C; Fri,  4 Dec 2020 13:33:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2DF1F8012A
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 13:33:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2DF1F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="EAiA0/sN"
Date: Fri, 4 Dec 2020 13:35:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607085228;
 bh=zmxko2CBQcTrRimzgblGXja5H1EAFSbtho5hMRphqPo=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=EAiA0/sN4gEYu8wNjWKaEjoBeLgLcEJvii/TTk5yXELcQpVmaMRZ3jjzJj+Fa394+
 4PQIHgB4q/CIwQLwNEnsVjn1OYMpq0QbndnuBw4uxM9E2NjGJC6v8XEo94sNO9N+5p
 bI5n+GCr5KOe1ypzoIF6T4f6BaOqnFts+L/3lVtU=
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
Message-ID: <X8os+X515fxeqefg@kroah.com>
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

Here is now a signed tag for everyone else to pull from and build on top
of, for 5.11-rc1, that includes this patch, and the 3 others I sent in
this series.

Please let me know if anyone has any problems with this tag.  I'll keep
it around until 5.11-rc1 is released, after which it doesn't make any
sense to be there.

thanks,

greg k-h

---------------

The following changes since commit f8394f232b1eab649ce2df5c5f15b0e528c92091:

  Linux 5.10-rc3 (2020-11-08 16:10:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/auxbus-5.11-rc1

for you to fetch changes up to 0d2bf11a6b3e275a526b8d42d8d4a3a6067cf953:

  driver core: auxiliary bus: minor coding style tweaks (2020-12-04 13:30:59 +0100)

----------------------------------------------------------------
Auxiliary Bus support tag for 5.11-rc1

This is a signed tag for other subsystems to be able to pull in the
auxiliary bus support into their trees for the 5.11-rc1 merge.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Dave Ertman (1):
      Add auxiliary bus support

Greg Kroah-Hartman (3):
      driver core: auxiliary bus: move slab.h from include file
      driver core: auxiliary bus: make remove function return void
      driver core: auxiliary bus: minor coding style tweaks

 Documentation/driver-api/auxiliary_bus.rst | 234 ++++++++++++++++++++++++
 Documentation/driver-api/index.rst         |   1 +
 drivers/base/Kconfig                       |   3 +
 drivers/base/Makefile                      |   1 +
 drivers/base/auxiliary.c                   | 274 +++++++++++++++++++++++++++++
 include/linux/auxiliary_bus.h              |  77 ++++++++
 include/linux/mod_devicetable.h            |   8 +
 scripts/mod/devicetable-offsets.c          |   3 +
 scripts/mod/file2alias.c                   |   8 +
 9 files changed, 609 insertions(+)
 create mode 100644 Documentation/driver-api/auxiliary_bus.rst
 create mode 100644 drivers/base/auxiliary.c
 create mode 100644 include/linux/auxiliary_bus.h

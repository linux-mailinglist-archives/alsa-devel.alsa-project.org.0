Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E277467EE9
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 21:43:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A3F22514;
	Fri,  3 Dec 2021 21:42:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A3F22514
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638564210;
	bh=Hx7tkxXvcmlGNWzEOIKTZ9mk9bOqHrKlJdPKn98a4F8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hUnYdH7BbxrseOOc2pvPSGIrVjGnZj3S6lAsPyuAkWOLT90pvh7LbhLau+Ckg9tdb
	 p+gf/OynmB8Lww7F8neRx6iuJMDJ3qKohbDpFcmXuJTRhRVIvv1wV4SbBSmSBrS457
	 QmAOLosmKKYi2AbhK2u12VBxwks3xYISYgqNNzGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0EA3F8028D;
	Fri,  3 Dec 2021 21:42:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C003AF8025C; Fri,  3 Dec 2021 21:42:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B28A3F800D3
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 21:42:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B28A3F800D3
X-IronPort-AV: E=McAfee;i="6200,9189,10187"; a="297851471"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="297851471"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 12:42:08 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="478450293"
Received: from smile.fi.intel.com ([10.237.72.184])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 12:42:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mtFMd-001uBT-AL; Fri, 03 Dec 2021 22:41:03 +0200
Date: Fri, 3 Dec 2021 22:41:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 fntoth@gmail.com
Subject: Re: [bug report] ASoC: Intel: mrfld - create separate module for pci
 part
Message-ID: <YaqA30mx4nUVdJoZ@smile.fi.intel.com>
References: <20211202151322.GA21325@kili>
 <19647b98-83fd-b493-0fed-3c4e43cbeba8@linux.intel.com>
 <Yap/80NxtU0QLqo0@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yap/80NxtU0QLqo0@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Hans de Goede <hdegoede@redhat.com>, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
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

On Fri, Dec 03, 2021 at 10:37:07PM +0200, Andy Shevchenko wrote:
> On Fri, Dec 03, 2021 at 07:46:04AM -0600, Pierre-Louis Bossart wrote:
> > On 12/3/21 4:13 AM, Dan Carpenter wrote:
> > > Hello Vinod Koul,
> > > 
> > > The patch f533a035e4da: "ASoC: Intel: mrfld - create separate module
> > > for pci part" from Nov 4, 2014, leads to the following Smatch static
> > > checker warning:

...

> > > Surely there should be a "return 0;" before the do_release_regions:
> > > label?  How does this code work?
> > 
> > Thanks for reporting this Dan. Yes this doesn't look good at all.
> > 
> > This PCI part is only used on Merrifield/Tangier, and I am not sure if
> > anyone ever managed to make audio work with the upstream version of this
> > driver. It's my understanding that this platform is no longer maintained
> > by Intel, and the Edison Yocto code uses the SOF driver.
> > 
> > The Kconfig updated in 2018 hints at those limitations:
> > 
> > config SND_SST_ATOM_HIFI2_PLATFORM_PCI
> > 	tristate "PCI HiFi2 (Merrifield) Platforms"
> > 	depends on X86 && PCI
> > 	select SND_SST_ATOM_HIFI2_PLATFORM
> > 	help
> > 	  If you have a Intel Merrifield/Edison platform, then
> > 	  enable this option by saying Y or m. Distros will typically not
> > 	  enable this option: while Merrifield/Edison can run a mainline
> > 	  kernel with limited functionality it will require a firmware file
> > 	  which is not in the standard firmware tree
> > 
> > I would guess that indeed a return 0; is missing, but maybe it's time to
> > remove this PCI code completely. I can't think of any user of the PCI
> > parts of this driver.
> > 
> > Andy, Hans, Mark, Takashi, what do you think?
> 
> The Edison platform and actually some more based on Intel Merrifield are still
> alive and on the (second hand) market. But yes, I would rather focus on making
> SOF working there, but via PCI bus (or with ACPI, ASL code for which one should
> actually write down, currently it's a device with PCI interface only).

That said, Pierre, have you been able to setup your Edison to see anything on
I2S with SOF?

-- 
With Best Regards,
Andy Shevchenko



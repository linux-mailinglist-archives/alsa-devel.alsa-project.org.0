Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1C92822D7
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Oct 2020 11:04:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A8C218FB;
	Sat,  3 Oct 2020 11:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A8C218FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601715841;
	bh=hqrEZaBVdP1bFOYZhSCJD7NnGqnDpmk80ug4DMaHxk8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rrj9yoHmTxsrcOdhuitg4+x0lxW5pZiyVNOzPiu4nVz0u/xAXbeGSvqPAoWYzbbwg
	 O0ihetQXZqpsx9e1ujSt6qxVDDRl71yAiBWfJYtSDamwMFBiFK42Be6zp/4WQN9tH2
	 +SAWFYzryo10B5/rwxChBthL9bZCT5jLf42iC4lY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A761F8020C;
	Sat,  3 Oct 2020 11:02:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A136EF801F5; Sat,  3 Oct 2020 11:02:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21629F801D8
 for <alsa-devel@alsa-project.org>; Sat,  3 Oct 2020 11:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21629F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="shyrkCgg"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C6A5206F8;
 Sat,  3 Oct 2020 09:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601715725;
 bh=hqrEZaBVdP1bFOYZhSCJD7NnGqnDpmk80ug4DMaHxk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=shyrkCggzPHV+MuJ+qh2IXhnAC19LCZtzVj5dXtzgmK8u7XHaZN/tP+6jPMmFMJkN
 J2w6P0A2YaodSD/1UHoZoeh+bSD/H37GYgwfQse8TiER8a2sfodTRrVKAJcJuwLu6v
 +dsGbRoitq+shp1WKW1bXnH1SNgpfmmR8jik8Oes=
Date: Sat, 3 Oct 2020 11:02:01 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Subject: Re: [PATCH 2/6] ASoC: SOF: Introduce descriptors for SOF client
Message-ID: <20201003090201.GC114893@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-3-david.m.ertman@intel.com>
 <20201001130245.GB2378679@kroah.com>
 <f3fa8df9fc8bcd789167f61b6c9d4df66b9b85c1.camel@intel.com>
 <20201002045357.GA34005@kroah.com>
 <ad38db14921dc5afb424db1ecac53053f15bb753.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad38db14921dc5afb424db1ecac53053f15bb753.camel@intel.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "fred.oh@linux.intel.com" <fred.oh@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "parav@nvidia.com" <parav@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Ertman, David M" <david.m.ertman@intel.com>
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

On Fri, Oct 02, 2020 at 05:07:13PM +0000, Sridharan, Ranjani wrote:
> On Fri, 2020-10-02 at 06:53 +0200, gregkh@linuxfoundation.org wrote:
> > On Thu, Oct 01, 2020 at 10:16:00PM +0000, Sridharan, Ranjani wrote:
> > > On Thu, 2020-10-01 at 15:02 +0200, Greg KH wrote:
> > > > On Wed, Sep 30, 2020 at 03:50:47PM -0700, Dave Ertman wrote:
> > > > > From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > > > > 
> > > > > A client in the SOF (Sound Open Firmware) context is a
> > > > > device that needs to communicate with the DSP via IPC
> > > > > messages. The SOF core is responsible for serializing the
> > > > > IPC messages to the DSP from the different clients. One
> > > > > example of an SOF client would be an IPC test client that
> > > > > floods the DSP with test IPC messages to validate if the
> > > > > serialization works as expected. Multi-client support will
> > > > > also add the ability to split the existing audio cards
> > > > > into multiple ones, so as to e.g. to deal with HDMI with a
> > > > > dedicated client instead of adding HDMI to all cards.
> > > > > 
> > > > > This patch introduces descriptors for SOF client driver
> > > > > and SOF client device along with APIs for registering
> > > > > and unregistering a SOF client driver, sending IPCs from
> > > > > a client device and accessing the SOF core debugfs root entry.
> > > > > 
> > > > > Along with this, add a couple of new members to struct
> > > > > snd_sof_dev that will be used for maintaining the list of
> > > > > clients.
> > > > > 
> > > > > Reviewed-by: Pierre-Louis Bossart <
> > > > > pierre-louis.bossart@linux.intel.com>
> > > > > Signed-off-by: Ranjani Sridharan <
> > > > > ranjani.sridharan@linux.intel.com
> > > > > Co-developed-by: Fred Oh <fred.oh@linux.intel.com>
> > > > > Signed-off-by: Fred Oh <fred.oh@linux.intel.com>
> > > > > Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
> > > > > ---
> > > > >  sound/soc/sof/Kconfig      |  19 ++++++
> > > > >  sound/soc/sof/Makefile     |   3 +
> > > > >  sound/soc/sof/core.c       |   2 +
> > > > >  sound/soc/sof/sof-client.c | 117
> > > > > +++++++++++++++++++++++++++++++++++++
> > > > >  sound/soc/sof/sof-client.h |  65 +++++++++++++++++++++
> > > > >  sound/soc/sof/sof-priv.h   |   6 ++
> > > > >  6 files changed, 212 insertions(+)
> > > > >  create mode 100644 sound/soc/sof/sof-client.c
> > > > >  create mode 100644 sound/soc/sof/sof-client.h
> > > > 
> > > > As you are creating new sysfs directories, you should have some
> > > > documentation for them :(
> > > Hi Greg,
> > > 
> > > We are not adding any sysfs entries in this series. 
> > 
> > You added directories in sysfs, right?
> Hi Greg,
> 
> We are not adding any sysfs directories.

Really?  Then what does creating these new devices do in sysfs?  If
nothing, then why are they being used at all?  :)

> The only change in the /sys directory will be the new ancillary
> devices created in the /sys/bus/ancillary/devices directory ie
> snd_sof_client.ipc_test.0 and snd_sof_client.ipc_test.1.

That is what I was referring to.

> In the following patches, we're adding debugfs entries for the ipc
> test clients but no other sysfs changes.
> 
> Is it required to add documentation for these as well?

Why would you not document them?  If you don't do anything with these
devices, then why even use them?  debugfs does not require sysfs
entries, so I fail to see the need for using this api at all here...

thanks,

greg k-h

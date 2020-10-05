Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F5A283AB3
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 17:36:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 067A917A3;
	Mon,  5 Oct 2020 17:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 067A917A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601912195;
	bh=oz1iqalx3gyPbBtGl2AtGGTDb6hLeXHSf6FxZstxxbI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i35uN1qhTCoLJMp1F2M0kl0f4a44/nkQv+69an+XYSiuTHtwlzqbkgzXHrJQ0szQ6
	 haE9PWeHbPPndoIMQg/fR7VLCtKO9Ttw0lcpFte+DWlZR9IVuIYpCIzNf7hPPn4er4
	 4s/0kBIXbcdy39lTr43/nHkFB6owf+98Crke3qOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35CCDF800C9;
	Mon,  5 Oct 2020 17:34:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42568F8025A; Mon,  5 Oct 2020 17:34:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91514F800EF
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 17:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91514F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IwYynOti"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 44C7C2100A;
 Mon,  5 Oct 2020 15:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601912086;
 bh=oz1iqalx3gyPbBtGl2AtGGTDb6hLeXHSf6FxZstxxbI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IwYynOtiK6MoDO3ZGStdELuDUcfBjOlxIi1HzjYkM9Hz8YdxttrAdM5xxoWprx1t0
 QcHo0KfBNxcpInpFVps/E3rcbvUE/P/oCdn01hRttY3KGcE30zGoy/GVzmfCpw96Yi
 5sFeEDgeABQ/lZvPP4SIVXL0dT183CsCIcHs6rE4=
Date: Mon, 5 Oct 2020 17:32:55 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/6] ASoC: SOF: Introduce descriptors for SOF client
Message-ID: <20201005153255.GC2372768@kroah.com>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20200930225051.889607-3-david.m.ertman@intel.com>
 <20201001130245.GB2378679@kroah.com>
 <f3fa8df9fc8bcd789167f61b6c9d4df66b9b85c1.camel@intel.com>
 <20201002045357.GA34005@kroah.com>
 <ad38db14921dc5afb424db1ecac53053f15bb753.camel@intel.com>
 <20201003090201.GC114893@kroah.com>
 <8e0bb7b90d689f98fc2dd861b4444fda9b36bab8.camel@intel.com>
 <20201005112711.GB401816@kroah.com>
 <074b20bf-ecce-82a9-574a-758da31cef06@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <074b20bf-ecce-82a9-574a-758da31cef06@linux.intel.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
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

On Mon, Oct 05, 2020 at 10:18:21AM -0500, Pierre-Louis Bossart wrote:
> 
> > > > > > > > As you are creating new sysfs directories, you should have
> > > > > > > > some
> > > > > > > > documentation for them :(
> > > > > > > Hi Greg,
> > > > > > > 
> > > > > > > We are not adding any sysfs entries in this series.
> > > > > > 
> > > > > > You added directories in sysfs, right?
> > > > > Hi Greg,
> > > > > 
> > > > > We are not adding any sysfs directories.
> > > > 
> > > > Really?  Then what does creating these new devices do in sysfs?  If
> > > > nothing, then why are they being used at all?  :)
> > > > 
> > > > > The only change in the /sys directory will be the new ancillary
> > > > > devices created in the /sys/bus/ancillary/devices directory ie
> > > > > snd_sof_client.ipc_test.0 and snd_sof_client.ipc_test.1.
> > > > 
> > > > That is what I was referring to.
> > > > 
> > > > > In the following patches, we're adding debugfs entries for the ipc
> > > > > test clients but no other sysfs changes.
> > > > > 
> > > > > Is it required to add documentation for these as well?
> > > > 
> > > > Why would you not document them?  If you don't do anything with these
> > > > devices, then why even use them?  debugfs does not require sysfs
> > > > entries, so I fail to see the need for using this api at all here...
> > > Hi Greg,
> > > 
> > > Pardon my ignorance here a bit. Typically, when registering platform
> > > devices, we've not added any documentation to highlight how they are
> > > used. Of course thats no excuse for not doing this right.
> > > 
> > > But just to clarify so that we can fix this properly in the next
> > > version, are we expected to add documentation for the directories added
> > > in the /sys/bus (ie /sys/bus/ancillary, /sys/bus/ancillary/devices,
> > > /sys/bus/ancillary/drivers etc) and also for the devices and drivers
> > > added by the SOF driver?
> > 
> > You are using a brand-new interface, which is designed to represent
> > things in the driver model and sysfs properly, and yet your usage
> > doesn't actually take advantage of the driver model or sysfs at all?
> > 
> > That implies to me that you are using this incorrectly.
> 
> We are taking advantage of 'standard' sysfs capabilities, e.g. we get a
> power/ directory and can disable pm_runtime if we chose to do so.
> 
> But the point is that for now we haven't added domain specific properties
> with attributes.
> 
> For example, I noodled with this code last week to replace the platform
> devices with ancillary devices in the Intel SoundWire code, and I get this
> in sysfs:
> 
> root@plb:/sys/bus/ancillary/devices/soundwire_intel.link.0# ls -l
> total 0
> lrwxrwxrwx 1 root root    0 Oct  2 15:48 driver ->
> ../../../../bus/ancillary/drivers/intel-sdw
> lrwxrwxrwx 1 root root    0 Oct  5 10:12 firmware_node ->
> ../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:63/PRP00001:00
> drwxr-xr-x 2 root root    0 Oct  5 10:12 power
> drwxr-xr-x 5 root root    0 Oct  2 15:48 sdw-master-0
> lrwxrwxrwx 1 root root    0 Oct  2 15:48 subsystem ->
> ../../../../bus/ancillary
> -rw-r--r-- 1 root root 4096 Oct  2 15:48 uevent
> 
> What would you want us to document here?

What you think should be in the documentation to help people out with
these devices...

Anyway, this thread is long-dead due to it being only on alsa-devel, I'm
not going to respond anymore here, thanks.

greg k-h

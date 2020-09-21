Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46703271E0B
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 10:36:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D232017BA;
	Mon, 21 Sep 2020 10:35:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D232017BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600677407;
	bh=IzMfEfQ3C97I2E4IaGn/FZ0dSP5/7eyWG/aljy+Sexs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dEjjl5ow/7VAuZkpSiYaEC3oD0qAMtE9RdYCSvMuA15a0gO84DlNMJ6Q+nXsFYhMI
	 R0hBt8uAe/mvYhNQXSV1sHS24BbSefLxMLHWFulBg4JrsmspyQLHsxhdifF2At/C9T
	 rjsprCe0QS+/6szmH2hncH4sX/1yT6+rsRBsrZn8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E55FDF80171;
	Mon, 21 Sep 2020 10:35:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8F7EF80162; Mon, 21 Sep 2020 10:35:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12C8AF8010A
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 10:34:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12C8AF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZL0kyv96"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0732420773;
 Mon, 21 Sep 2020 08:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600677290;
 bh=IzMfEfQ3C97I2E4IaGn/FZ0dSP5/7eyWG/aljy+Sexs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZL0kyv962X1GN5A+vO1VR/6BlBbjtIF2lR7FrdkT/1kPM9L4mJ6rXs7PdGlAtAmyC
 MGWB+r7wBonsjzm1ACpx9HPR8TuALav4hUtXviTTjmLB63V8JZOtx7wOH8lkze2gMu
 SUa4dd/aDscARvy+WGOF+YxmWxmwypp4Uj/uP1bI=
Date: Mon, 21 Sep 2020 10:35:14 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH v6 09/14] ASoC: Intel: catpt: Simple sysfs attributes
Message-ID: <20200921083514.GA3151537@kroah.com>
References: <20200917141242.9081-1-cezary.rojewski@intel.com>
 <20200917141242.9081-10-cezary.rojewski@intel.com>
 <8edff9bc51ea441dac454cbb6869317f@intel.com>
 <20200919144204.GD2712238@kroah.com>
 <dfdb29d1c5f04d88970757e1ec9596d9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfdb29d1c5f04d88970757e1ec9596d9@intel.com>
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "Kaczmarski, Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "Proborszcz, Filip" <filip.proborszcz@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Hejmowski,
 Krzysztof" <krzysztof.hejmowski@intel.com>, "Papierkowski,
 Piotr \(Habana\)" <ppapierkowski@habana.ai>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

On Sun, Sep 20, 2020 at 05:03:00PM +0000, Rojewski, Cezary wrote:
> On 2020-09-19 4:42 PM, gregkh@linuxfoundation.org wrote:
> > On Fri, Sep 18, 2020 at 03:22:13PM +0000, Rojewski, Cezary wrote:
> >> On 2020-09-17 4:12 PM, Cezary Rojewski wrote:
> >>> Add sysfs entries for displaying version of FW currently in use as well
> >>> as binary dump of entire version info, including build and log providers
> >>> hashes.
> >>>
> >>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> >>> ---
> >>>
> >>> Changes in v6:
> >>> - functions declaration and usage now part of this patch instead of
> >>>     being separated from it
> >>>
> >>> Changes in v2:
> >>> - fixed size provided to memcpy() in fw_build_read() as reported by Mark
> >>>
> >>
> >> +Greg KH
> >>
> >> Greg, would you mind taking a look at these sysfs entries added for new
> >> catpt driver (Audio DSP driver for Haswell and Broadwell machines)?
> > 
> > Why me?
> > 
> 
> Andy (CC'ed) suggested that it's best if sysfs code is routed through you.
> Given your input, I believe he was right.
> 
> >> Link to opening post for the series:
> >> [PATCH v6 00/14] ASoC: Intel: Catpt - Lynx and Wildcat point
> >> https://www.spinics.net/lists/alsa-devel/msg115765.html
> > 
> > Does lore.kernel.org handle alsa-devel yet?
> > 
> 
> Believe it does as alsa-devel archive can be found on lore.kernel.org.
> Not really the guy to answer integration questions, though.
> 
> >>
> >> Let me give you a quick introduction to the catpt's fs code:
> >> During power-up sequence a handshake is made between host (kernel device
> >> driver) and DSP (firmware) side. Two sysfs entries are generated which
> >> expose running DSP firmware version and its build info - information
> >> obtained during said handshake.
> >>
> >> Much like devices (such as those of PCI-type) expose sysfs entries for
> >> their easy identification, catpt provides entries to identify DSP FW it
> >> is dealing with.
> > 
> > No Documentation/ABI/ entry for these new devices explaining what they
> > do and are for?  That would be a good first step, and has always been a
> > requirement for sysfs files.  Do that and resend the series and cc: me
> > and ask for my review and I will be glad to give it.
> > 
> > Oh, a few notes below:
> > 
> 
> Well, that's just one device driver targeting basically single device
> available in two flavors. Lack of Documentation/ABI/<sysfs-doc> for
> solution has been noted though. Will add in v7. As this device is
> available on /sys/bus/pci0000:00/<dev> is the name for upcoming file:
> sysfs-bus-pci-devices-catpt ok? Or, would you prevent a different, more
> explicit one?

Why are you putting random driver-specific attributes on a device owned
by a different bus?  That can cause problems if you are not careful.

Does the SoC core not provide you with a sound device to do this for
instead?

> 
> >>>    sound/soc/intel/catpt/core.h   |  3 ++
> >>>    sound/soc/intel/catpt/device.c |  6 +++
> >>>    sound/soc/intel/catpt/fs.c     | 79 ++++++++++++++++++++++++++++++++++
> >>>    3 files changed, 88 insertions(+)
> >>>    create mode 100644 sound/soc/intel/catpt/fs.c
> >>>
> >>> diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
> >>> index a29b4c0232cb..1f0f1ac92341 100644
> >>> --- a/sound/soc/intel/catpt/core.h
> >>> +++ b/sound/soc/intel/catpt/core.h
> >>> @@ -155,6 +155,9 @@ int catpt_store_module_states(struct catpt_dev *cdev, struct dma_chan *chan);
> >>>    int catpt_store_memdumps(struct catpt_dev *cdev, struct dma_chan *chan);
> >>>    int catpt_coredump(struct catpt_dev *cdev);
> >>>    
> >>> +int catpt_sysfs_create(struct catpt_dev *cdev);
> >>> +void catpt_sysfs_remove(struct catpt_dev *cdev);
> >>> +
> >>>    #include <sound/memalloc.h>
> >>>    #include <uapi/sound/asound.h>
> >>>    
> >>> diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
> >>> index 7c7ddbabaf55..e9b7c1f474e0 100644
> >>> --- a/sound/soc/intel/catpt/device.c
> >>> +++ b/sound/soc/intel/catpt/device.c
> >>> @@ -184,6 +184,10 @@ static int catpt_probe_components(struct catpt_dev *cdev)
> >>>    		goto board_err;
> >>>    	}
> >>>    
> >>> +	ret = catpt_sysfs_create(cdev);
> >>> +	if (ret)
> >>> +		goto board_err;
> > 
> > Why are you calling a specific function to do all of this?  Why not
> > provide a default_groups pointer which allows the driver core to
> > automatically create/destroy the sysfs files for you in a race-free
> > manner with userspace?
> > 
> > That's the recommended way, you should never have to manually create
> > files.
> > 
> > 
> 
> Thanks, that's something new. As this is simple device-driver, I believe
> you meant usage of sysfs_(add|remove)_group() or their "device"
> equivalents: device_(add|remove)_group(), is that correct? Haven't found
> any usage of default_group within /sound/ subsystem what cannot be said
> about the functions I've just mentioned.
> 
> Feel free to correct me if I'm wrong about this.

The bus should provide you with the ability to do this, so look into
that for your driver.

But why are you creating a binary sysfs file?  That's only for passing
data raw through the kernel to/from the hardware, with no
parsing/massaging possible.  Is that what is happening here?

I guess if there was documentation, it would be easier to review :)

thanks,

greg k-h

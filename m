Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 782E7270E9B
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Sep 2020 16:43:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9CCA823;
	Sat, 19 Sep 2020 16:42:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9CCA823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600526606;
	bh=zUmTxSU1o9QuPb0oboCbqDI3SDWuMhZKEj0+IFDaekM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OmCAzHBpExGZjPTOhWozYwqq9sd4Q0pF8i7rwcGFU3xVdygdgVNTBccaxnoasV+QY
	 xSQUyggbHVWXgwzsXDfwIbnTsXjCx65CNsHOQbnMRnYvYh+/s1tcMmd8l2aExL3hPq
	 jNfQSw7mZam8flrfbp3I03iRsLcYrCqOYCjknIlU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2F04F8025E;
	Sat, 19 Sep 2020 16:41:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0977F80212; Sat, 19 Sep 2020 16:41:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EB25F800EA
 for <alsa-devel@alsa-project.org>; Sat, 19 Sep 2020 16:41:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EB25F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CfoXYvGk"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5A6320672;
 Sat, 19 Sep 2020 14:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600526496;
 bh=zUmTxSU1o9QuPb0oboCbqDI3SDWuMhZKEj0+IFDaekM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CfoXYvGkKppV3zmINccMNU9gYwGwGvPr2EDp/xOlYwB39D21fl+DOpMoHpBM/6qvm
 GPYAicACkSmrReTYaYCZepScYoVZT+kvfdgX1f4Bp/UbdW9SmpOlegjnbLCJdxTtOT
 LETL5YbwAeqrYgFR1yVITk4gl4YBAQoW0KtFVJMs=
Date: Sat, 19 Sep 2020 16:42:04 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH v6 09/14] ASoC: Intel: catpt: Simple sysfs attributes
Message-ID: <20200919144204.GD2712238@kroah.com>
References: <20200917141242.9081-1-cezary.rojewski@intel.com>
 <20200917141242.9081-10-cezary.rojewski@intel.com>
 <8edff9bc51ea441dac454cbb6869317f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8edff9bc51ea441dac454cbb6869317f@intel.com>
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

On Fri, Sep 18, 2020 at 03:22:13PM +0000, Rojewski, Cezary wrote:
> On 2020-09-17 4:12 PM, Cezary Rojewski wrote:
> > Add sysfs entries for displaying version of FW currently in use as well
> > as binary dump of entire version info, including build and log providers
> > hashes.
> > 
> > Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> > ---
> > 
> > Changes in v6:
> > - functions declaration and usage now part of this patch instead of
> >    being separated from it
> > 
> > Changes in v2:
> > - fixed size provided to memcpy() in fw_build_read() as reported by Mark
> > 
> 
> +Greg KH
> 
> Greg, would you mind taking a look at these sysfs entries added for new
> catpt driver (Audio DSP driver for Haswell and Broadwell machines)?

Why me?

> Link to opening post for the series:
> [PATCH v6 00/14] ASoC: Intel: Catpt - Lynx and Wildcat point
> https://www.spinics.net/lists/alsa-devel/msg115765.html

Does lore.kernel.org handle alsa-devel yet?

> 
> Let me give you a quick introduction to the catpt's fs code:
> During power-up sequence a handshake is made between host (kernel device
> driver) and DSP (firmware) side. Two sysfs entries are generated which
> expose running DSP firmware version and its build info - information
> obtained during said handshake.
> 
> Much like devices (such as those of PCI-type) expose sysfs entries for
> their easy identification, catpt provides entries to identify DSP FW it
> is dealing with.

No Documentation/ABI/ entry for these new devices explaining what they
do and are for?  That would be a good first step, and has always been a
requirement for sysfs files.  Do that and resend the series and cc: me
and ask for my review and I will be glad to give it.

Oh, a few notes below:

> >   sound/soc/intel/catpt/core.h   |  3 ++
> >   sound/soc/intel/catpt/device.c |  6 +++
> >   sound/soc/intel/catpt/fs.c     | 79 ++++++++++++++++++++++++++++++++++
> >   3 files changed, 88 insertions(+)
> >   create mode 100644 sound/soc/intel/catpt/fs.c
> > 
> > diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
> > index a29b4c0232cb..1f0f1ac92341 100644
> > --- a/sound/soc/intel/catpt/core.h
> > +++ b/sound/soc/intel/catpt/core.h
> > @@ -155,6 +155,9 @@ int catpt_store_module_states(struct catpt_dev *cdev, struct dma_chan *chan);
> >   int catpt_store_memdumps(struct catpt_dev *cdev, struct dma_chan *chan);
> >   int catpt_coredump(struct catpt_dev *cdev);
> >   
> > +int catpt_sysfs_create(struct catpt_dev *cdev);
> > +void catpt_sysfs_remove(struct catpt_dev *cdev);
> > +
> >   #include <sound/memalloc.h>
> >   #include <uapi/sound/asound.h>
> >   
> > diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
> > index 7c7ddbabaf55..e9b7c1f474e0 100644
> > --- a/sound/soc/intel/catpt/device.c
> > +++ b/sound/soc/intel/catpt/device.c
> > @@ -184,6 +184,10 @@ static int catpt_probe_components(struct catpt_dev *cdev)
> >   		goto board_err;
> >   	}
> >   
> > +	ret = catpt_sysfs_create(cdev);
> > +	if (ret)
> > +		goto board_err;

Why are you calling a specific function to do all of this?  Why not
provide a default_groups pointer which allows the driver core to
automatically create/destroy the sysfs files for you in a race-free
manner with userspace?

That's the recommended way, you should never have to manually create
files.


> > +
> >   	/* reflect actual ADSP state in pm_runtime */
> >   	pm_runtime_set_active(cdev->dev);
> >   
> > @@ -292,6 +296,8 @@ static int catpt_acpi_remove(struct platform_device *pdev)
> >   	catpt_sram_free(&cdev->iram);
> >   	catpt_sram_free(&cdev->dram);
> >   
> > +	catpt_sysfs_remove(cdev);
> > +
> >   	return 0;
> >   }
> >   
> > diff --git a/sound/soc/intel/catpt/fs.c b/sound/soc/intel/catpt/fs.c
> > new file mode 100644
> > index 000000000000..d73493687f4a
> > --- /dev/null
> > +++ b/sound/soc/intel/catpt/fs.c
> > @@ -0,0 +1,79 @@
> > +// SPDX-License-Identifier: GPL-2.0-pcm

What is "GPL-2.0-pcm" for a SPDX identifier?  We don't have that listed
in LICENSES, do we?

Did this pass the spdxcheck tool in scripts?

thanks,

greg k-h

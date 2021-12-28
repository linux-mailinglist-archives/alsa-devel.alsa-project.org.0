Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB5448140E
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 15:24:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E97017C5;
	Wed, 29 Dec 2021 15:23:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E97017C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640787855;
	bh=Gap0GwZ7QhskHCBuxCWJ0ehIbXdcDMw/3DRBfuFroAo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kfjItnZVe5Mg3cjyO9779HYDc5O+mkDcplabsdw8sQw4JVO/aObTz2v+n7ZOxHyBM
	 4zQHunZth9txiUf5Fpb1nfPlqJo3egvzOTQ/M2o8QzcGZAuzE1pnoqP3JbPybk0ROc
	 5EeVm+hxM/CyXyTHvS0mBMIM+tGXCKDCxfJio3+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53F30F80527;
	Wed, 29 Dec 2021 15:20:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D861F800E9; Tue, 28 Dec 2021 13:54:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DDA9F800E9
 for <alsa-devel@alsa-project.org>; Tue, 28 Dec 2021 13:54:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DDA9F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uT1Bi526"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A35C4611D2;
 Tue, 28 Dec 2021 12:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4546BC36AE8;
 Tue, 28 Dec 2021 12:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640696083;
 bh=Gap0GwZ7QhskHCBuxCWJ0ehIbXdcDMw/3DRBfuFroAo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uT1Bi526RdiqCovjK+BsZ0LQ21O6eAGdLfperJgxt/T4KZXCQHLowjI+U/BnL+30l
 HJRegFW6ceEx7gRTUzAnY/lOi8+345syFMoVZJg23IyMTVv8lxOmatGJsejunnysTY
 b7cgtAhK1rV1ciaHNDicksS8OtcQVVqsJ8fTaLs35K3JpOGyDL1M7tu/pQlaK0TC5o
 847l3oZwcFMOo4LfbX6OTisn674FFeznktD1n6AMeVW9VoFWIsJndv9O02I/tcIR5D
 xfPFEZmvAPeSdi4V+6+pSCDV5v0lZDnuzytqnQmuAjGw0iIL513WDap3bYMORE0U6k
 6wPKV3GCt3SBA==
Date: Tue, 28 Dec 2021 13:54:25 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
Message-ID: <20211228135425.0a69168c@coco.lan>
In-Reply-To: <b1475f6aecb752a858941f44a957b2183cd68405.camel@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-2-schnelle@linux.ibm.com>
 <YcrJAwsKIxxX18pW@kroah.com> <20211228101435.3a55b983@coco.lan>
 <b1475f6aecb752a858941f44a957b2183cd68405.camel@linux.ibm.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 29 Dec 2021 15:20:41 +0100
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Guo Ren <guoren@kernel.org>, linux-i2c@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Hannes Reinecke <hare@suse.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, linux-scsi@vger.kernel.org,
 Sumit Saxena <sumit.saxena@broadcom.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>, linux-csky@vger.kernel.org,
 Kashyap Desai <kashyap.desai@broadcom.com>,
 Nilesh Javali <njavali@marvell.com>, intel-wired-lan@lists.osuosl.org,
 linux-serial@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com,
 Jakub Kicinski <kuba@kernel.org>, MPT-FusionLinux.pdl@broadcom.com,
 "James E.J.
 Bottomley" <jejb@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, linux-input@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, linux-watchdog@vger.kernel.org,
 Jouni Malinen <j@w1.fi>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Kalle Valo <kvalo@kernel.org>, John Garry <john.garry@huawei.com>,
 linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
 Ian Abbott <abbotti@mev.co.uk>, Mark Brown <broonie@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 megaraidlinux.pdl@broadcom.com, Teddy Wang <teddy.wang@siliconmotion.com>,
 linux-hwmon@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 Karsten Keil <isdn@linux-pingi.de>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nick Hu <nickhu@andestech.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-wireless@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, "David S. Miller" <davem@davemloft.net>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Forest Bond <forest@alittletooquiet.net>,
 netdev@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>
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

Em Tue, 28 Dec 2021 11:58:55 +0100
Niklas Schnelle <schnelle@linux.ibm.com> escreveu:

> On Tue, 2021-12-28 at 10:15 +0100, Mauro Carvalho Chehab wrote:
> > Em Tue, 28 Dec 2021 09:21:23 +0100
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:
> >   
> > > On Mon, Dec 27, 2021 at 05:42:46PM +0100, Niklas Schnelle wrote:  
> > > > --- a/drivers/pci/Kconfig
> > > > +++ b/drivers/pci/Kconfig
> > > > @@ -23,6 +23,17 @@ menuconfig PCI
> > > >  
> > > >  if PCI
> > > >  
> > > > +config LEGACY_PCI
> > > > +	bool "Enable support for legacy PCI devices"
> > > > +	depends on HAVE_PCI
> > > > +	help
> > > > +	   This option enables support for legacy PCI devices. This includes
> > > > +	   PCI devices attached directly or via a bridge on a PCI Express bus.
> > > > +	   It also includes compatibility features on PCI Express devices which
> > > > +	   make use of legacy I/O spaces.    
> > 
> > This Kconfig doesn't seem what it is needed there, as this should be an 
> > arch-dependent feature, and not something that the poor user should be
> > aware if a given architecture supports it or not. Also, the above will keep
> > causing warnings or errors with randconfigs.
> > 
> > Also, the "depends on HAVE_CPI" is bogus, as PCI already depends on 
> > HAVE_PCI:  
> 
> Ah yes you're right.
> 
> > 
> > 	menuconfig PCI
> > 	bool "PCI support"
> > 	depends on HAVE_PCI
> > 	help
> > 	  This option enables support for the PCI local bus, including
> > 	  support for PCI-X and the foundations for PCI Express support.
> > 	  Say 'Y' here unless you know what you are doing.
> > 
> > So, instead, I would expect that a new HAVE_xxx option would be
> > added at arch/*/Kconfig, like:
> > 
> > 	config X86
> > 		...
> > 		select HAVE_PCI_DIRECT_IO
> > 
> > It would also make sense to document it at Documentation/features/.  
> 
> I'll look into that, thanks.
> 
> >   
> > > All you really care about is the "legacy" I/O spaces here, this isn't
> > > tied to PCI specifically at all, right?
> > > 
> > > So why not just have a OLD_STYLE_IO config option or something like
> > > that, to show that it's the i/o functions we care about here, not PCI at
> > > all?
> > > 
> > > And maybe not call it "old" or "legacy" as time constantly goes forward,
> > > just describe it as it is, "DIRECT_IO"?  
> > 
> > Agreed. HAVE_PCI_DIRECT_IO (or something similar) seems a more appropriate
> > name for it.
> > 
> > Thanks,
> > Mauro  
> 
> Hmm, I might be missing something here but that sounds a lot like the
> HAS_IOPORT option added in patch 02.
> 
> We add both LEGACY_PCI and HAS_IOPORT to differentiate between two
> cases. HAS_IOPORT is for PC-style devices that are not on a PCI card
> while LEGACY_PCI is for PCI drivers that require port I/O. 

I didn't look at the other patches on this series, but why it is needed
to deal with them on a separate way? Won't "PCI" and "HAS_IOPORT" be enough? 

I mean, are there any architecture where HAVE_PCI=y and HAS_IOPORT=y
where LEGACY_PCI shall be "n"?

> This
> includes pre-PCIe devices as well as PCIe devices which require
> features like I/O spaces. The "legacy" naming is comes from the PCIe
> spec which in section 2.1.1.2 says "PCI Express supports I/O Space for
> compatibility with legacy devices which require their use. Future
> revisions of this specification may deprecate the use of I/O Space."

I would still avoid calling it LEGACY_PCI, as this sounds too generic.

I didn't read the PCI/PCIe specs, but I suspect that are a lot more
features that were/will be deprecated on PCI specs as time goes by.

So, I would, instead, use something like PCI_LEGACY_IO_SPACE or 
HAVE_PCI_LEGACY_IO_SPACE, in order to let it clear what "legacy"
means.

> These two separate config options allow us to compile without support
> for these legacy PCI devices even on a system where inb()/outb() and
> friends are required for some PC style devices and for example ACPI.

Hmm... why this patch make SND_BT87X dependent on LEGACY_PCI?

> @@ -172,6 +177,7 @@ config SND_AZT3328
>  
>  config SND_BT87X
>  	tristate "Bt87x Audio Capture"
> +	depends on LEGACY_PCI
>  	select SND_PCM
>  	help
>  	  If you want to record audio from TV cards based on

I couldn't find any usage of inb/outb & friends on it:

	$ grep -E '(inb|outb|inw|outw|inl|outl)\b' ./sound/pci/bt87x.c

It uses, instead, readl/writel:

	static inline u32 snd_bt87x_readl(struct snd_bt87x *chip, u32 reg)
	{
	        return readl(chip->mmio + reg);
	}

	static inline void snd_bt87x_writel(struct snd_bt87x *chip, u32 reg, u32 value)
	{
	        writel(value, chip->mmio + reg);
	}

I failed to see what makes it different from VIDEO_BT848 and
DVB_BT8XX drivers. They all support exactly the same chipset:
Brooktree/Conexant BT8xx. On those devices, depending on the exact
model, up to three separate interfaces are provided, each one with
its own Kconfig var:

	- audio I/O (SND_BT87X);
	- video I/O (VIDEO_BT848);
	- MPEG-TS I/O (DVB_BT8XX).

Thanks,
Mauro

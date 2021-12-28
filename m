Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD303481406
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 15:23:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B58417A5;
	Wed, 29 Dec 2021 15:22:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B58417A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640787789;
	bh=AyTvVvui2qlcHtQrKzueO2aVJtq3B/0n6NTMMAVaPv0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O+ID/ORUBLzmO1RWCaElamq0lemsJ3XTvtL8Lg8OAtoAorVJgSfluCC+tu77Yju6h
	 lRoZT4XyAqkZDLpRUFMXHH789q/bSTz1TL75sa4QojzbB3I05Kisli4ywuII1D4gbi
	 //q5yZthWn+OyH8OnSy1G1dvUpbCrXK/eBLyTM8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0B7EF80511;
	Wed, 29 Dec 2021 15:20:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4666F80224; Tue, 28 Dec 2021 09:21:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5147BF800E9
 for <alsa-devel@alsa-project.org>; Tue, 28 Dec 2021 09:21:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5147BF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="kH6mvQE+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A1E95B80D97;
 Tue, 28 Dec 2021 08:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB991C36AE8;
 Tue, 28 Dec 2021 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1640679691;
 bh=AyTvVvui2qlcHtQrKzueO2aVJtq3B/0n6NTMMAVaPv0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kH6mvQE+CbYxtdqKfYIrcnXRRkMOKzNgkkDI4Qj231PIqAVKah1gnHZGbf7pyzYif
 5Fy29Whi1PzPFIz42NBP1CwIg6Czpkv7Hvsk4tV4vJc5VHnlaMIkb+39JrPmPYspb6
 8Fb7cSFih5JdAhKULSvypMAJ71q6QDfYXW2GEFIA=
Date: Tue, 28 Dec 2021 09:21:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
Message-ID: <YcrJAwsKIxxX18pW@kroah.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-2-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211227164317.4146918-2-schnelle@linux.ibm.com>
X-Mailman-Approved-At: Wed, 29 Dec 2021 15:20:41 +0100
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 alsa-devel@alsa-project.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
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
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 linux-input@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 linux-watchdog@vger.kernel.org, Jouni Malinen <j@w1.fi>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Kalle Valo <kvalo@kernel.org>, John Garry <john.garry@huawei.com>,
 linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
 Ian Abbott <abbotti@mev.co.uk>, Mark Brown <broonie@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, megaraidlinux.pdl@broadcom.com,
 Teddy Wang <teddy.wang@siliconmotion.com>, linux-hwmon@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>, Karsten Keil <isdn@linux-pingi.de>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nick Hu <nickhu@andestech.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-wireless@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, "David S. Miller" <davem@davemloft.net>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Forest Bond <forest@alittletooquiet.net>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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

On Mon, Dec 27, 2021 at 05:42:46PM +0100, Niklas Schnelle wrote:
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -23,6 +23,17 @@ menuconfig PCI
>  
>  if PCI
>  
> +config LEGACY_PCI
> +	bool "Enable support for legacy PCI devices"
> +	depends on HAVE_PCI
> +	help
> +	   This option enables support for legacy PCI devices. This includes
> +	   PCI devices attached directly or via a bridge on a PCI Express bus.
> +	   It also includes compatibility features on PCI Express devices which
> +	   make use of legacy I/O spaces.

All you really care about is the "legacy" I/O spaces here, this isn't
tied to PCI specifically at all, right?

So why not just have a OLD_STYLE_IO config option or something like
that, to show that it's the i/o functions we care about here, not PCI at
all?

And maybe not call it "old" or "legacy" as time constantly goes forward,
just describe it as it is, "DIRECT_IO"?

thanks,

greg k-h

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A584D77E8
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Mar 2022 20:09:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09B4916C2;
	Sun, 13 Mar 2022 20:08:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09B4916C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647198561;
	bh=S85F7ZrTXTrFfys0rJRseAMPLnZqh6VsxjYx3rCW0qE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k3Vv0TVYf5+rv/IpuzngaCPD6fPnR2ztZe0xp8+jvZMiGglNIxK9FowrtZiGO6FEC
	 U4qSBXoYywEPPCXcbhPVCk1UGoT9MpPYSTuAyTgZouV4pv6N+0yUoO8Bp2PCIDCRbs
	 1D2ZB0MAzSoe3U2rIYAZrOFqV6HdpJ1xmE77whrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CAC4F8047C;
	Sun, 13 Mar 2022 20:08:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79C44F80310; Sun, 13 Mar 2022 20:08:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 371A7F8011C
 for <alsa-devel@alsa-project.org>; Sun, 13 Mar 2022 20:08:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 371A7F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dmNaUYla"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 28C47604F5;
 Sun, 13 Mar 2022 19:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AA7C340E8;
 Sun, 13 Mar 2022 19:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647198481;
 bh=S85F7ZrTXTrFfys0rJRseAMPLnZqh6VsxjYx3rCW0qE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dmNaUYlaZzqRi5HFPSpsaDKlblQ3p5MVwueWdtZ27nwr8sXgDKGi2zeY/AjXhia3r
 t3niMVPVw7ZMGjht2uPQpdIjDG4Xhh9RGBhkGpYYOvaUeyV1uyl7/Ooe5SRkYIpGeX
 nPRzgYBl7I9TulXE9lJimj0/y8WedW4Wi+roZ8v+CzAwespYPgVioTi8rInofHYnIy
 491oP//dd5FdrR2OaOwIhThTPNfNsfaRZeZ3HQhK2GC9Kcx+ke0YN8MaSRvnFceHGK
 pt91NFQbpkfyZg/QEihqmYtQ09K3FaejAvhCvgIlhJQH+gCJk9QSEoxFWap65S3vAZ
 MpeygeZQ1qMyA==
Date: Sun, 13 Mar 2022 20:07:55 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] media: Kconfig: cleanup VIDEO_DEV dependencies
Message-ID: <20220313200755.0873537c@coco.lan>
In-Reply-To: <Yi3ciCTbHrxYUatX@pendragon.ideasonboard.com>
References: <42ae3d28d4d822f3e14db76b99f2f4c41688ae3e.1647155467.git.mchehab@kernel.org>
 <Yi3ciCTbHrxYUatX@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

Em Sun, 13 Mar 2022 13:59:04 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> Thank you for the patch.
> 
> Trimming the CC list to keep a few mailing lists only.
> 
> On Sun, Mar 13, 2022 at 08:12:05AM +0100, Mauro Carvalho Chehab wrote:
> > media Kconfig has two entries associated to V4L API:
> > VIDEO_DEV and VIDEO_V4L2.
> > 
> > On Kernel 2.6.x, there were two V4L APIs, each one with its own flag.
> > VIDEO_DEV were meant to:
> > 	1) enable Video4Linux and make its Kconfig options to appear;
> > 	2) it makes the Kernel build the V4L core.
> > 
> > while VIDEO_V4L2 where used to distinguish between drivers that
> > implement the newer API and drivers that implemented the former one.
> > 
> > With time, such meaning changed, specially after the removal of
> > all V4L version 1 drivers.
> > 
> > At the current implementation, VIDEO_DEV only does (1): it enables
> > the media options related to V4L, that now has:
> > 
> > 	menu "Video4Linux options"
> > 		visible if VIDEO_DEV
> > 
> > 	source "drivers/media/v4l2-core/Kconfig"
> > 	endmenu
> > 
> > but it doesn't affect anymore the V4L core drivers.
> > 
> > The rationale is that the V4L2 core has a "soft" dependency
> > at the I2C bus, and now requires to select a number of other
> > Kconfig options:
> > 
> > 	config VIDEO_V4L2
> > 		tristate
> > 		depends on (I2C || I2C=n) && VIDEO_DEV
> > 		select RATIONAL
> > 		select VIDEOBUF2_V4L2 if VIDEOBUF2_CORE
> > 		default (I2C || I2C=n) && VIDEO_DEV
> > 
> > In the past, merging them would be tricky, but it seems that it is now
> > possible to merge those symbols, in order to simplify V4L dependencies.
> > 
> > Let's keep VIDEO_DEV, as this one is used on some make *defconfig
> > configurations.  
> 
> I would have gone for VIDEO_V4L2, but if it makes configuration changes
> easier to handle, VIDEO_DEV is fine with me too.

That was actually my first option ;-) VIDEO_V4L2 (or VIDEO_V4L) is a much
better name. From my side, I'm fine either way.

As a plus, using VIDEO_V4L2 would produce a much smaller patch that won't be
rejected by some ML servers, but maybe it would require distros and people 
who have their own .config files stored somewhere to re-configure their
Kernels.

> [snip]
> 
> > diff --git a/drivers/media/pci/tw5864/Kconfig b/drivers/media/pci/tw5864/Kconfig
> > index d376d4ed65b9..0a0f3191f238 100644
> > --- a/drivers/media/pci/tw5864/Kconfig
> > +++ b/drivers/media/pci/tw5864/Kconfig
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  config VIDEO_TW5864
> >  	tristate "Techwell TW5864 video/audio grabber and encoder"
> > -	depends on VIDEO_DEV && PCI && VIDEO_V4L2
> > +	depends on VIDEO_DEV && PCI && VIDEO_DEV  
> 
> You can drop the second VIDEO_DEV.
> 
> >  	select VIDEOBUF2_DMA_CONTIG
> >  	help
> >  	  Support for boards based on Techwell TW5864 chip which provides
> > diff --git a/drivers/media/pci/tw68/Kconfig b/drivers/media/pci/tw68/Kconfig
> > index af0cb60337bb..ef29be7db493 100644
> > --- a/drivers/media/pci/tw68/Kconfig
> > +++ b/drivers/media/pci/tw68/Kconfig
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  config VIDEO_TW68
> >  	tristate "Techwell tw68x Video For Linux"
> > -	depends on VIDEO_DEV && PCI && VIDEO_V4L2
> > +	depends on VIDEO_DEV && PCI && VIDEO_DEV  
> 
> Here too.
> 
> Apart from that, the patch looks good to me.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

Mauro

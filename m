Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7528D25BBBE
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 09:33:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1916018DA;
	Thu,  3 Sep 2020 09:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1916018DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599118421;
	bh=a6NQokr4jM352XqY6vw/Xjc9tnmlUORQvxTKs8y3VmQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aevHMZ1NjNioL75Gb0mosaBEqWb+IK1+lDhG6GKH7QBYXWYWneEN+LOYq4or/qqo0
	 msqsq9iHkmm/o086vOwLaQge3U3BnnuaaQKwpxeG1gVM4Jk5aMgh9oXYmm1njljOpn
	 SYybQQzy3X/hHsV1RM/5nOp3ZukKKcQaH5k2DSpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE96FF8020D;
	Thu,  3 Sep 2020 09:32:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 127E0F8025F; Thu,  3 Sep 2020 09:32:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFF22F800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 09:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFF22F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lY2nENn4"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B389420775;
 Thu,  3 Sep 2020 07:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599118353;
 bh=a6NQokr4jM352XqY6vw/Xjc9tnmlUORQvxTKs8y3VmQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lY2nENn4PyQnLe86tGBsy7BegX4EZ7tvxXVlNM7BZv6S3N+PmLZ0sqWiCET8GGqTk
 o68zMMnRNYD7BkFKDl2ntBWB2Sy6A0ODNnz4eHdZJOHHBJgh+vXLe7u5kUJqQS+zhd
 95RgxEBPX+1UU5R2KEx32QhMc60fTKCtZT9/LTMc=
Date: Thu, 3 Sep 2020 09:32:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 01/10] USB: move snd_usb_pipe_sanity_check into the USB
 core
Message-ID: <20200903073230.GA162335@kroah.com>
References: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
 <20200902110115.1994491-2-gregkh@linuxfoundation.org>
 <20200903004553.GA642955@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903004553.GA642955@rowland.harvard.edu>
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jesus Ramos <jesus-ramos@live.com>, johan.hedberg@gmail.com,
 Chris Wulff <crwulff@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>,
 marcel@holtmann.org, linux-usb@vger.kernel.org,
 Dmitry Panchenko <dmitry@d-systems.ee>, linux-kernel@vger.kernel.org,
 Jussi Laako <jussi@sonarnerd.net>, linux-bluetooth@vger.kernel.org,
 Eli Billauer <eli.billauer@gmail.com>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Alexander Tsoy <alexander@tsoy.me>, tiwai@suse.com,
 "Geoffrey D. Bennett" <g@b4.vu>, dvyukov@google.com, himadrispandya@gmail.com
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

On Wed, Sep 02, 2020 at 08:45:53PM -0400, Alan Stern wrote:
> On Wed, Sep 02, 2020 at 01:01:03PM +0200, Greg Kroah-Hartman wrote:
> > snd_usb_pipe_sanity_check() is a great function, so let's move it into
> > the USB core so that other parts of the kernel, including the USB core,
> > can call it.
> > 
> > Name it usb_pipe_type_check() to match the existing
> > usb_urb_ep_type_check() call, which now uses this function.
> > 
> > Cc: Jaroslav Kysela <perex@perex.cz>
> > Cc: Takashi Iwai <tiwai@suse.com>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: Eli Billauer <eli.billauer@gmail.com>
> > Cc: Emiliano Ingrassia <ingrassia@epigenesys.com>
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Cc: Alexander Tsoy <alexander@tsoy.me>
> > Cc: "Geoffrey D. Bennett" <g@b4.vu>
> > Cc: Jussi Laako <jussi@sonarnerd.net>
> > Cc: Nick Kossifidis <mickflemm@gmail.com>
> > Cc: Dmitry Panchenko <dmitry@d-systems.ee>
> > Cc: Chris Wulff <crwulff@gmail.com>
> > Cc: Jesus Ramos <jesus-ramos@live.com>
> > Cc: linux-usb@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: alsa-devel@alsa-project.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> 
> > diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> > index 27e83e55a590..45bc2914c1ba 100644
> > --- a/drivers/usb/core/urb.c
> > +++ b/drivers/usb/core/urb.c
> > @@ -192,24 +192,39 @@ static const int pipetypes[4] = {
> >  };
> >  
> >  /**
> > - * usb_urb_ep_type_check - sanity check of endpoint in the given urb
> > - * @urb: urb to be checked
> > + * usb_pipe_type_check - sanity check of a specific pipe for a usb device
> > + * @dev: struct usb_device to be checked
> > + * @pipe: pipe to check
> >   *
> >   * This performs a light-weight sanity check for the endpoint in the
> > - * given urb.  It returns 0 if the urb contains a valid endpoint, otherwise
> > - * a negative error code.
> > + * given usb device.  It returns 0 if the pipe is a valid for the specific usb
> -----------------------------------------------------^
> Typo.

Oops, will fix, thanks.


> 
> > + * device, otherwise a negative error code.
> >   */
> > -int usb_urb_ep_type_check(const struct urb *urb)
> > +int usb_pipe_type_check(struct usb_device *dev, unsigned int pipe)
> >  {
> >  	const struct usb_host_endpoint *ep;
> >  
> > -	ep = usb_pipe_endpoint(urb->dev, urb->pipe);
> > +	ep = usb_pipe_endpoint(dev, pipe);
> >  	if (!ep)
> >  		return -EINVAL;
> > -	if (usb_pipetype(urb->pipe) != pipetypes[usb_endpoint_type(&ep->desc)])
> > +	if (usb_pipetype(pipe) != pipetypes[usb_endpoint_type(&ep->desc)])
> >  		return -EINVAL;
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(usb_pipe_type_check);
> > +
> > +/**
> > + * usb_urb_ep_type_check - sanity check of endpoint in the given urb
> > + * @urb: urb to be checked
> > + *
> > + * This performs a light-weight sanity check for the endpoint in the
> > + * given urb.  It returns 0 if the urb contains a valid endpoint, otherwise
> > + * a negative error code.
> > + */
> > +int usb_urb_ep_type_check(const struct urb *urb)
> > +{
> > +	return usb_pipe_type_check(urb->dev, urb->pipe);
> > +}
> >  EXPORT_SYMBOL_GPL(usb_urb_ep_type_check);
> 
> Since this routine is used in only one place in the entire kernel, you 
> might as well inline the code there and get rid of the function 
> entirely.

Good idea, will do.

> > diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> > index abf99b814a0f..fc3aab04a0bc 100644
> > --- a/sound/usb/quirks.c
> > +++ b/sound/usb/quirks.c
> > @@ -846,7 +846,7 @@ static int snd_usb_accessmusic_boot_quirk(struct usb_device *dev)
> >  	static const u8 seq[] = { 0x4e, 0x73, 0x52, 0x01 };
> >  	void *buf;
> >  
> > -	if (snd_usb_pipe_sanity_check(dev, usb_sndintpipe(dev, 0x05)))
> > +	if (usb_pipe_type_check(dev, usb_sndintpipe(dev, 0x05)))
> >  		return -EINVAL;
> >  	buf = kmemdup(seq, ARRAY_SIZE(seq), GFP_KERNEL);
> >  	if (!buf)
> > @@ -875,7 +875,7 @@ static int snd_usb_nativeinstruments_boot_quirk(struct usb_device *dev)
> >  {
> >  	int ret;
> >  
> > -	if (snd_usb_pipe_sanity_check(dev, usb_sndctrlpipe(dev, 0)))
> > +	if (usb_pipe_type_check(dev, usb_sndctrlpipe(dev, 0)))
> >  		return -EINVAL;
> 
> In a few places here this check is completely unnecessary.  All it does 
> is verify that the device does have an endpoint 0 and the the type of 
> the endpoint matches the type of the pipe.  Well, every USB device 
> always has an endpoint 0, and it is always a bidirectional control 
> endpoint.

I think this was probably added to handle syzbot issues.  As long as the
USB core does ensure that a USB device has endpoint 0, I agree, these
can be removed.  I'll go check that and add a follow-on patch to the
series to do this, thanks.

thanks,

greg k-h

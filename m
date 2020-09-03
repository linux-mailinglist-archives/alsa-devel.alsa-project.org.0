Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 771E125B7B6
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 02:47:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E51BE15F2;
	Thu,  3 Sep 2020 02:46:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E51BE15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599094067;
	bh=t+IXxuXYE1nsOXyYnvH5D8lGQHMjq83OqCSRXWTnt2Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xv4KqeKsKlbCQmowp3BJto1PQG3i+fgX6PVKolj0gwn4WTJ7foX6Z7t0clq8inssp
	 0wVlAYehfw3cl8W1Et+x7EaccxsYy0QwZUOLLLk4DIc4bdP5bL11pyp/nFeggPe2kn
	 MWjlC2F5uV4/tUTGxZALfBOI5vt5jG0bD12n2LJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22F9BF8024A;
	Thu,  3 Sep 2020 02:46:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CEAEF8024A; Thu,  3 Sep 2020 02:46:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_PASS, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by alsa1.perex.cz (Postfix) with SMTP id 4559BF801DA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 02:45:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4559BF801DA
Received: (qmail 643241 invoked by uid 1000); 2 Sep 2020 20:45:53 -0400
Date: Wed, 2 Sep 2020 20:45:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 01/10] USB: move snd_usb_pipe_sanity_check into the USB
 core
Message-ID: <20200903004553.GA642955@rowland.harvard.edu>
References: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
 <20200902110115.1994491-2-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902110115.1994491-2-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Wed, Sep 02, 2020 at 01:01:03PM +0200, Greg Kroah-Hartman wrote:
> snd_usb_pipe_sanity_check() is a great function, so let's move it into
> the USB core so that other parts of the kernel, including the USB core,
> can call it.
> 
> Name it usb_pipe_type_check() to match the existing
> usb_urb_ep_type_check() call, which now uses this function.
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Eli Billauer <eli.billauer@gmail.com>
> Cc: Emiliano Ingrassia <ingrassia@epigenesys.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Alexander Tsoy <alexander@tsoy.me>
> Cc: "Geoffrey D. Bennett" <g@b4.vu>
> Cc: Jussi Laako <jussi@sonarnerd.net>
> Cc: Nick Kossifidis <mickflemm@gmail.com>
> Cc: Dmitry Panchenko <dmitry@d-systems.ee>
> Cc: Chris Wulff <crwulff@gmail.com>
> Cc: Jesus Ramos <jesus-ramos@live.com>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---

> diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
> index 27e83e55a590..45bc2914c1ba 100644
> --- a/drivers/usb/core/urb.c
> +++ b/drivers/usb/core/urb.c
> @@ -192,24 +192,39 @@ static const int pipetypes[4] = {
>  };
>  
>  /**
> - * usb_urb_ep_type_check - sanity check of endpoint in the given urb
> - * @urb: urb to be checked
> + * usb_pipe_type_check - sanity check of a specific pipe for a usb device
> + * @dev: struct usb_device to be checked
> + * @pipe: pipe to check
>   *
>   * This performs a light-weight sanity check for the endpoint in the
> - * given urb.  It returns 0 if the urb contains a valid endpoint, otherwise
> - * a negative error code.
> + * given usb device.  It returns 0 if the pipe is a valid for the specific usb
-----------------------------------------------------^
Typo.

> + * device, otherwise a negative error code.
>   */
> -int usb_urb_ep_type_check(const struct urb *urb)
> +int usb_pipe_type_check(struct usb_device *dev, unsigned int pipe)
>  {
>  	const struct usb_host_endpoint *ep;
>  
> -	ep = usb_pipe_endpoint(urb->dev, urb->pipe);
> +	ep = usb_pipe_endpoint(dev, pipe);
>  	if (!ep)
>  		return -EINVAL;
> -	if (usb_pipetype(urb->pipe) != pipetypes[usb_endpoint_type(&ep->desc)])
> +	if (usb_pipetype(pipe) != pipetypes[usb_endpoint_type(&ep->desc)])
>  		return -EINVAL;
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(usb_pipe_type_check);
> +
> +/**
> + * usb_urb_ep_type_check - sanity check of endpoint in the given urb
> + * @urb: urb to be checked
> + *
> + * This performs a light-weight sanity check for the endpoint in the
> + * given urb.  It returns 0 if the urb contains a valid endpoint, otherwise
> + * a negative error code.
> + */
> +int usb_urb_ep_type_check(const struct urb *urb)
> +{
> +	return usb_pipe_type_check(urb->dev, urb->pipe);
> +}
>  EXPORT_SYMBOL_GPL(usb_urb_ep_type_check);

Since this routine is used in only one place in the entire kernel, you 
might as well inline the code there and get rid of the function 
entirely.

> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index abf99b814a0f..fc3aab04a0bc 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -846,7 +846,7 @@ static int snd_usb_accessmusic_boot_quirk(struct usb_device *dev)
>  	static const u8 seq[] = { 0x4e, 0x73, 0x52, 0x01 };
>  	void *buf;
>  
> -	if (snd_usb_pipe_sanity_check(dev, usb_sndintpipe(dev, 0x05)))
> +	if (usb_pipe_type_check(dev, usb_sndintpipe(dev, 0x05)))
>  		return -EINVAL;
>  	buf = kmemdup(seq, ARRAY_SIZE(seq), GFP_KERNEL);
>  	if (!buf)
> @@ -875,7 +875,7 @@ static int snd_usb_nativeinstruments_boot_quirk(struct usb_device *dev)
>  {
>  	int ret;
>  
> -	if (snd_usb_pipe_sanity_check(dev, usb_sndctrlpipe(dev, 0)))
> +	if (usb_pipe_type_check(dev, usb_sndctrlpipe(dev, 0)))
>  		return -EINVAL;

In a few places here this check is completely unnecessary.  All it does 
is verify that the device does have an endpoint 0 and the the type of 
the endpoint matches the type of the pipe.  Well, every USB device 
always has an endpoint 0, and it is always a bidirectional control 
endpoint.  Therefore a simple static check is all you need: There's no 
point calling usb_pipe_type_check() when the pipe is of the form 
usb_{snd|rcv}ctrlpipe(dev, 0).

In short, this check should be removed completely; it does nothing.

>  	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
>  				  0xaf, USB_TYPE_VENDOR | USB_RECIP_DEVICE,
> @@ -984,7 +984,7 @@ static int snd_usb_axefx3_boot_quirk(struct usb_device *dev)
>  
>  	dev_dbg(&dev->dev, "Waiting for Axe-Fx III to boot up...\n");
>  
> -	if (snd_usb_pipe_sanity_check(dev, usb_sndctrlpipe(dev, 0)))
> +	if (usb_pipe_type_check(dev, usb_sndctrlpipe(dev, 0)))

Same for this check.

>  		return -EINVAL;
>  	/* If the Axe-Fx III has not fully booted, it will timeout when trying
>  	 * to enable the audio streaming interface. A more generous timeout is
> @@ -1018,7 +1018,7 @@ static int snd_usb_motu_microbookii_communicate(struct usb_device *dev, u8 *buf,
>  {
>  	int err, actual_length;
>  
> -	if (snd_usb_pipe_sanity_check(dev, usb_sndintpipe(dev, 0x01)))
> +	if (usb_pipe_type_check(dev, usb_sndintpipe(dev, 0x01)))
>  		return -EINVAL;
>  	err = usb_interrupt_msg(dev, usb_sndintpipe(dev, 0x01), buf, *length,
>  				&actual_length, 1000);
> @@ -1030,7 +1030,7 @@ static int snd_usb_motu_microbookii_communicate(struct usb_device *dev, u8 *buf,
>  
>  	memset(buf, 0, buf_size);
>  
> -	if (snd_usb_pipe_sanity_check(dev, usb_rcvintpipe(dev, 0x82)))
> +	if (usb_pipe_type_check(dev, usb_rcvintpipe(dev, 0x82)))
>  		return -EINVAL;
>  	err = usb_interrupt_msg(dev, usb_rcvintpipe(dev, 0x82), buf, buf_size,
>  				&actual_length, 1000);
> @@ -1117,7 +1117,7 @@ static int snd_usb_motu_m_series_boot_quirk(struct usb_device *dev)
>  {
>  	int ret;
>  
> -	if (snd_usb_pipe_sanity_check(dev, usb_sndctrlpipe(dev, 0)))
> +	if (usb_pipe_type_check(dev, usb_sndctrlpipe(dev, 0)))

And this one.

>  		return -EINVAL;
>  	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
>  			      1, USB_TYPE_VENDOR | USB_RECIP_DEVICE,

Alan Stern

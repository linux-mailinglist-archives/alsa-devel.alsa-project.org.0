Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6759225AEB3
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 17:23:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDDA41862;
	Wed,  2 Sep 2020 17:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDDA41862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599060202;
	bh=x3POqbn4b/hj4C4s0Hk+zf9rTRiYWs7wlVg18R4VMcU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m4KWGubNK7e7EbViMepHFVxtdxfLWv4/hmgfE6k4hBDKvW+lkFiAqjVaUHXZjeltP
	 ZXEmpwSXjl0UyHGUUFzr1UdVuAw+lz28XlOD3MfBkmLB6pXPjqen32NlrwGTfiM9su
	 qdaKHsLlb6PnjidOUlesBJM4jUKhVsjUq+IQqd/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04900F80257;
	Wed,  2 Sep 2020 17:21:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B474F8024A; Wed,  2 Sep 2020 17:21:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68AB0F801DA
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 17:21:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68AB0F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q+zfeqOR"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EADBB20767;
 Wed,  2 Sep 2020 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599060086;
 bh=x3POqbn4b/hj4C4s0Hk+zf9rTRiYWs7wlVg18R4VMcU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q+zfeqOR+6hdjoTVnVBLGhd8rHUGFE0NW2iqszVvebJ6RN7fOjeJ9cbCJm8RJFvFj
 xLJfjWXjni//s3sYQxALkrMTfpdpKnCC6TVeC0gPIy18dZyCtjQEVUFnOAp8OIj8Bt
 nL0PMy9kYEOiLpMAwsIIX0r/wXP85mGZBdf6ZENw=
Date: Wed, 2 Sep 2020 17:21:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 04/10] USB: core: hub.c: use usb_control_msg_send() in a
 few places
Message-ID: <20200902152151.GA2032878@kroah.com>
References: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
 <20200902110115.1994491-5-gregkh@linuxfoundation.org>
 <20200902145701.GA624583@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902145701.GA624583@rowland.harvard.edu>
Cc: alsa-devel@alsa-project.org, johan.hedberg@gmail.com,
 linux-kernel@vger.kernel.org, marcel@holtmann.org, linux-usb@vger.kernel.org,
 tiwai@suse.com, stern@rowland.harvard.ed, linux-bluetooth@vger.kernel.org,
 dvyukov@google.com, himadrispandya@gmail.com
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

On Wed, Sep 02, 2020 at 10:57:01AM -0400, Alan Stern wrote:
> On Wed, Sep 02, 2020 at 01:01:06PM +0200, Greg Kroah-Hartman wrote:
> > There are a few calls to usb_control_msg() that can be converted to use
> > usb_control_msg_send() instead, so do that in order to make the error
> > checking a bit simpler and the code smaller.
> > 
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> One problem in this patch...
> 
> > @@ -3896,27 +3875,14 @@ static int usb_req_set_sel(struct usb_device *udev, enum usb3_link_state state)
> >  	if (u2_pel > USB3_LPM_MAX_U2_SEL_PEL)
> >  		u2_pel = USB3_LPM_MAX_U2_SEL_PEL;
> >  
> > -	/*
> > -	 * usb_enable_lpm() can be called as part of a failed device reset,
> > -	 * which may be initiated by an error path of a mass storage driver.
> > -	 * Therefore, use GFP_NOIO.
> > -	 */
> > -	sel_values = kmalloc(sizeof *(sel_values), GFP_NOIO);
> > -	if (!sel_values)
> > -		return -ENOMEM;
> > -
> > -	sel_values->u1_sel = u1_sel;
> > -	sel_values->u1_pel = u1_pel;
> > -	sel_values->u2_sel = cpu_to_le16(u2_sel);
> > -	sel_values->u2_pel = cpu_to_le16(u2_pel);
> > +	sel_values.u1_sel = u1_sel;
> > +	sel_values.u1_pel = u1_pel;
> > +	sel_values.u2_sel = cpu_to_le16(u2_sel);
> > +	sel_values.u2_pel = cpu_to_le16(u2_pel);
> >  
> > -	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> > -			USB_REQ_SET_SEL,
> > -			USB_RECIP_DEVICE,
> > -			0, 0,
> > -			sel_values, sizeof *(sel_values),
> > -			USB_CTRL_SET_TIMEOUT);
> > -	kfree(sel_values);
> > +	ret = usb_control_msg_send(udev, 0, USB_REQ_SET_SEL, USB_RECIP_DEVICE,
> > +				   0, 0, &sel_values, sizeof(sel_values),
> > +				   USB_CTRL_SET_TIMEOUT);
> 
> This effectively changes GFP_NOIO to GFP_KERNEL.  Probably you should
> leave this particular call alone.

I thought about that, but for some reason thought that usb_control_msg()
would eventually call for an allocation with GFP_KERNEL, but I was
wrong, usb_internal_control_msg() calls usb_alloc_urb() with GFP_NOIO,
my fault.  I'll go fix this up, thanks for the review.

greg k-h

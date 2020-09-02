Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D84325AE13
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 16:58:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACA0C16D3;
	Wed,  2 Sep 2020 16:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACA0C16D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599058737;
	bh=wNFK28vNYbbzczCB/1Z7Oh6Ry7U+gSV6JxRvaFd399Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hu80fNhq4Nh8sRC72s+M0D1wY322/q7Ety6aEmOGoIHYRMqUqRhdZWqer/pH8ki0z
	 XnnfOC4rGh/p1rpsBI0jhOsDtsut+9Qb+kAhgwZIDC7CDlvmovN/HEcFivF35cZghr
	 5EYqf8mVP3xaSR863Wxc4QtcMsZabDBgwERSMR0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1D9CF800BA;
	Wed,  2 Sep 2020 16:57:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79A70F8024A; Wed,  2 Sep 2020 16:57:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_PASS, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by alsa1.perex.cz (Postfix) with SMTP id C687FF800BA
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 16:57:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C687FF800BA
Received: (qmail 624961 invoked by uid 1000); 2 Sep 2020 10:57:01 -0400
Date: Wed, 2 Sep 2020 10:57:01 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 04/10] USB: core: hub.c: use usb_control_msg_send() in a
 few places
Message-ID: <20200902145701.GA624583@rowland.harvard.edu>
References: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
 <20200902110115.1994491-5-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902110115.1994491-5-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Wed, Sep 02, 2020 at 01:01:06PM +0200, Greg Kroah-Hartman wrote:
> There are a few calls to usb_control_msg() that can be converted to use
> usb_control_msg_send() instead, so do that in order to make the error
> checking a bit simpler and the code smaller.
> 
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

One problem in this patch...

> @@ -3896,27 +3875,14 @@ static int usb_req_set_sel(struct usb_device *udev, enum usb3_link_state state)
>  	if (u2_pel > USB3_LPM_MAX_U2_SEL_PEL)
>  		u2_pel = USB3_LPM_MAX_U2_SEL_PEL;
>  
> -	/*
> -	 * usb_enable_lpm() can be called as part of a failed device reset,
> -	 * which may be initiated by an error path of a mass storage driver.
> -	 * Therefore, use GFP_NOIO.
> -	 */
> -	sel_values = kmalloc(sizeof *(sel_values), GFP_NOIO);
> -	if (!sel_values)
> -		return -ENOMEM;
> -
> -	sel_values->u1_sel = u1_sel;
> -	sel_values->u1_pel = u1_pel;
> -	sel_values->u2_sel = cpu_to_le16(u2_sel);
> -	sel_values->u2_pel = cpu_to_le16(u2_pel);
> +	sel_values.u1_sel = u1_sel;
> +	sel_values.u1_pel = u1_pel;
> +	sel_values.u2_sel = cpu_to_le16(u2_sel);
> +	sel_values.u2_pel = cpu_to_le16(u2_pel);
>  
> -	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
> -			USB_REQ_SET_SEL,
> -			USB_RECIP_DEVICE,
> -			0, 0,
> -			sel_values, sizeof *(sel_values),
> -			USB_CTRL_SET_TIMEOUT);
> -	kfree(sel_values);
> +	ret = usb_control_msg_send(udev, 0, USB_REQ_SET_SEL, USB_RECIP_DEVICE,
> +				   0, 0, &sel_values, sizeof(sel_values),
> +				   USB_CTRL_SET_TIMEOUT);

This effectively changes GFP_NOIO to GFP_KERNEL.  Probably you should
leave this particular call alone.

Alan Stern

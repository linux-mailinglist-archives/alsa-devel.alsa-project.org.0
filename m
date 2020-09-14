Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7121F268FB9
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 17:25:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BA9B169C;
	Mon, 14 Sep 2020 17:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BA9B169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600097111;
	bh=EBqqQRsDxhvM1nw92/w69eMe9mZazFwm//Ofb5xCjvc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XjHAi4hQnPvi2dRGOkuK3IoW9okq3o6kQzuEiBsa3iVt5JLMu0arAFw3zZEcYJGkh
	 Rlc8+vyqaOQPt974nU8hvitEsrGKdAHNwqD3FLUVF2gxex17kgKQGaa1jxkYQhAha5
	 VzDJFjAbzTVDKDPU2t0SYB5yc3cJKNxdwS/KDTOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3226CF80150;
	Mon, 14 Sep 2020 17:23:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05C59F8015C; Mon, 14 Sep 2020 17:23:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB0BEF800AA
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 17:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB0BEF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NhxFEZ5h"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2BE5B20639;
 Mon, 14 Sep 2020 15:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600096990;
 bh=EBqqQRsDxhvM1nw92/w69eMe9mZazFwm//Ofb5xCjvc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NhxFEZ5hFRzKcHM5UdRESvNf5RWMR93f2OaogAsqv4akh7DGDkhvKhkLXVh3XCM0k
 bsyO24n6WDGAe+S0tayv+05GZAfma4r1iry3NA2mq4riIC66xgJYRRiAOYGhZ3L7Wk
 KZNptsHILBCJ9AFv6G0mXT/Pfdx9wAbjVpWcRzH4=
Date: Mon, 14 Sep 2020 17:23:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v2 04/11] USB: core: hub.c: use usb_control_msg_send() in
 a few places
Message-ID: <20200914152309.GA3394411@kroah.com>
References: <20200907145108.3766613-1-gregkh@linuxfoundation.org>
 <20200907145108.3766613-5-gregkh@linuxfoundation.org>
 <20200907150858.GD762136@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907150858.GD762136@rowland.harvard.edu>
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

On Mon, Sep 07, 2020 at 11:08:58AM -0400, Alan Stern wrote:
> On Mon, Sep 07, 2020 at 04:51:01PM +0200, Greg Kroah-Hartman wrote:
> > There are a few calls to usb_control_msg() that can be converted to use
> > usb_control_msg_send() instead, so do that in order to make the error
> > checking a bit simpler and the code smaller.
> > 
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > v2:
> >  - dropped changes to usb_req_set_sel() thanks to review from Alan
> 
> > @@ -4056,7 +4035,7 @@ static void usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
> >  	 * associated with the link state we're about to enable.
> >  	 */
> >  	ret = usb_req_set_sel(udev, state);
> > -	if (ret < 0) {
> > +	if (ret) {
> >  		dev_warn(&udev->dev, "Set SEL for device-initiated %s failed.\n",
> >  				usb3_lpm_names[state]);
> >  		return;
> 
> Did this change survive by mistake?
> 
> Actually, it looks like usb_req_set_sel needs to check the value 
> returned by usb_control_msg -- a perfect example of the sort of thing 
> you were trying to fix in the first place!

Ugh, good catch, and yes, the original code is buggy :)

thanks,

greg k-h

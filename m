Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF7738B5DB
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 20:16:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22A33169F;
	Thu, 20 May 2021 20:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22A33169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621534564;
	bh=xUF2reLMch0OWaTTmkSyWX2CPg/VOKxyR7J40IlPdX4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nwG1dy+If7BeJ7qH/a4z4Z/IyjsnOukUP5r4jTI2oRKCEr/LKTB8tVKRwIp23xu1t
	 zjxuo0ErTe1Az43Y39rEUGT67yDD8CuQ5FB5BXKc4+wX98uWMtIEBm5/Rc4hvdugnn
	 zCl7DPF112EGNr9qUauVVVHeNQjTIkm8BSN1i2VY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ED4EF800C1;
	Thu, 20 May 2021 20:14:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 884B4F80217; Thu, 20 May 2021 20:14:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEC8CF80127
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 20:14:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEC8CF80127
Received: by m.b4.vu (Postfix, from userid 1000)
 id 0BDC4606DC8A; Fri, 21 May 2021 03:44:22 +0930 (ACST)
Date: Fri, 21 May 2021 03:44:22 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Subject: Re: [BUG] ALSA: usb-audio: Scarlett 2 mixer driver fails on ehci-pci
Message-ID: <20210520181422.GB95348@m.b4.vu>
References: <20210517172553.GA85102@m.b4.vu>
 <CAEsQvcuMK5n4F++bXCD4ML5FoRQ+KCp5soXAY8mjUpf6yqYXBQ@mail.gmail.com>
 <20210518183420.GA89090@m.b4.vu>
 <CAEsQvcs13mJF2+hDdSPhg_-VBpqFCZhjHb6xDScDD7u3LEfmog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEsQvcs13mJF2+hDdSPhg_-VBpqFCZhjHb6xDScDD7u3LEfmog@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
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

On Tue, May 18, 2021 at 06:41:45PM -0300, Geraldo Nascimento wrote:
[...]
> Myself I'd hook printk()'s to both ehci_hcd and xhci_hcd to print
> every possible variable involved and see if there's any relevant
> mismatches. Oh and watch with the printk()'s what libusb seems to be
> doing, too.
> 
> When you subscribe to linux-usb you *may* want to Cc: Greg
> Kroah-Hartman with your discoveries so far, he's the USB Subsystem
> Maintainer and the best one to help you track this down.

Thanks for the pointers!

It turns out that usb_sndctrlpipe() is not short for "USB sound
control pipe".

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 560c2ade829d..dcff3e3a49f3 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -635,7 +635,7 @@ static int scarlett2_usb(
 	/* send a second message to get the response */
 
 	err = snd_usb_ctl_msg(mixer->chip->dev,
-			usb_sndctrlpipe(mixer->chip->dev, 0),
+			usb_rcvctrlpipe(mixer->chip->dev, 0),
 			SCARLETT2_USB_VENDOR_SPECIFIC_CMD_RESP,
 			USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
 			0,

I'll properly submit the patch once I've got confirmation from someone
else that this fixes the issue.

Thanks again,
Geoffrey.

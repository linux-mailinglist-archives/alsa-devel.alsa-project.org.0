Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE004E65F0
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 16:23:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D242171F;
	Thu, 24 Mar 2022 16:22:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D242171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648135388;
	bh=SIeqYRGuYtU1WcW/IFXWBgr+dy+NN4LiBis2pbui6gI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eeXsLH2o+rlexBaJQzOAJcnRsgZbAEyoTrScKpgnWPxSbMFoVztYWOcISFN0L8Co+
	 NXXSYxjfWuefqmJ6mtfHSV2Vq4VLl6NjUhGY3UfaMudKKh2yhkpLJBiodX1b4HAiL3
	 kU8OZtQMqt+VT5kQf/kFWvRSxOE6Dp3BWFvuiE0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E67A1F801EC;
	Thu, 24 Mar 2022 16:22:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E640CF80165; Thu, 24 Mar 2022 16:22:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by alsa1.perex.cz (Postfix) with SMTP id CF473F80139
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 16:21:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF473F80139
Received: (qmail 210380 invoked by uid 1000); 24 Mar 2022 11:21:54 -0400
Date: Thu, 24 Mar 2022 11:21:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Petr Janecek <janecek@ucw.cz>
Subject: Re: Apogee ONEv2 keeps resetting
Message-ID: <YjyMkqk4zZWPJ6T0@rowland.harvard.edu>
References: <3f4d1bce-7459-9ea4-be73-9b51f569e526@ucw.cz>
 <YjoPVAxeKtY6aV1s@rowland.harvard.edu>
 <63b772ff-ef03-5f0a-c42c-ad9ec9770f16@ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63b772ff-ef03-5f0a-c42c-ad9ec9770f16@ucw.cz>
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org
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

On Thu, Mar 24, 2022 at 03:44:41AM +0100, Petr Janecek wrote:
> Hi Alan,
> 
> On 3/22/22 19:03, Alan Stern wrote:
> > On Sun, Mar 20, 2022 at 02:15:40AM +0100, Petr Janecek wrote:
> > > Hi,
> > >     I'm trying to use Apogee ONEv2.  From usb dumps under
> > > macos or windows it seems like a usb Class Audio 2.0
> > > device, but in linux, it keeps resetting every two seconds
> > > or so.  It keeps resetting even when the snd-usb-audio
> > > driver is disabled, so the problem is probably at a lower
> > > level.
> > 
> > Can you post the log output on a system where snd-usb-audio is disabled?
> 
> [ 3412.279063] usb 3-8: new high-speed USB device number 6 using xhci_hcd
> [ 3412.470003] usb 3-8: New USB device found, idVendor=0c60, idProduct=0017,
> bcdDevice= 1.05
> [ 3412.470017] usb 3-8: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [ 3412.470023] usb 3-8: Product: ONEv2
> [ 3412.470028] usb 3-8: Manufacturer: Apogee
> [ 3412.470033] usb 3-8: SerialNumber: 0C12FF2020204652334D513A7A2A9B
> [ 3413.217053] usb 3-8: USB disconnect, device number 6
> [ 3413.629046] usb 3-8: new high-speed USB device number 7 using xhci_hcd
> [ 3413.829760] usb 3-8: New USB device found, idVendor=0c60, idProduct=0017,
> bcdDevice= 1.05
> [ 3413.829766] usb 3-8: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [ 3413.829768] usb 3-8: Product: ONEv2
> [ 3413.829770] usb 3-8: Manufacturer: Apogee
> [ 3413.829772] usb 3-8: SerialNumber: 0C12FF2020204652334D513A7A2A9B
> [ 3414.421964] usb 3-8: USB disconnect, device number 7
> [ 3414.838981] usb 3-8: new high-speed USB device number 8 using xhci_hcd
> [ 3415.029947] usb 3-8: New USB device found, idVendor=0c60, idProduct=0017,
> bcdDevice= 1.05
> [ 3415.029961] usb 3-8: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [ 3415.029968] usb 3-8: Product: ONEv2
> [ 3415.029973] usb 3-8: Manufacturer: Apogee
> [ 3415.029978] usb 3-8: SerialNumber: 0C12FF2020204652334D513A7A2A9B
> [ 3415.627052] usb 3-8: USB disconnect, device number 8

Nothing particularly suspicious there.

> 
> > >    The messages below are from v5.16.16, but it behaves
> > > the same no matter what I plug it into.
> > > 
> > > [  253.708616] usb 3-8: new high-speed USB device number 6 using xhci_hcd
> > > [  253.899363] usb 3-8: New USB device found, idVendor=0c60, idProduct=0017,
> > > bcdDevice= 1.05
> > > [  253.899370] usb 3-8: New USB device strings: Mfr=1, Product=2,
> > > SerialNumber=3
> > > [  253.899373] usb 3-8: Product: ONEv2
> > > [  253.899375] usb 3-8: Manufacturer: Apogee
> > > [  253.899377] usb 3-8: SerialNumber: 0C12FF2020204652334D513A7A2A9B
> > > [  253.960901] mc: Linux media interface: v0.10
> > 
> > Any idea where that line came from?
> 
>   That's from CONFIG_MEDIA_CONTROLLER, which is selected for usb
> webcam.  It also selects CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER.
> Compiled it out, rebooted.  Now the line is missing, but no other
> change.
> 
> > You should try capturing a usbmon trace showing what happens when the
> > device is plugged in and then resets.  Preferably on a system where
> > snd-usb-audio is disabled.
> 
>   Trace from wireshark is attached.

The trace doesn't help much, unfortunately.  It shows normal device 
initialization, plus a couple of extra string descriptor reads.  About 
1/2 second afterward, the device disconnects itself electronically from 
the USB bus and reconnects 20 ms later.

I get the feeling that the device expects to receive some specific 
messages from the host within that one-half second, and disconnects if 
it doesn't see them.  And presumably it doesn't get what it's looking 
for even when the USB sound drivers are enabled.

Although I doubt it will show anything helpful, you might try collecting 
a usbmon trace with the sound drivers enabled.  Perhaps it will suggest 
something to the USB audio developers.

> > One other thing you might try: Disable runtime PM for USB ("echo -1
> > > /sys/module/usbcore/parameters/autosuspend" before plugging in the
> > device).
> 
>   Makes no difference -- almost: after few resets it once took much
> longer (>10x) to reconnect.

Oh well, it was worth a try.  Some devices don't like runtime suspend.  
But obviously that isn't the problem here.

Alan Stern

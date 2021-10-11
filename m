Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D4B429595
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 19:24:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA47416BF;
	Mon, 11 Oct 2021 19:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA47416BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633973079;
	bh=Dcah+wiObB2g/yEpi4xb6Ag+IL87PMhakQ1CDFA5VqE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z0WpYrQAPv7xNoSTcDY0P7tAZ6qkwoy6gwccgvw60hBFDVrPdvkJywrW+RSfOvOSN
	 yoG6rbOTQRpw9zgFR2TnrD167vXIMlOFxdNzZXYGhT8QLt3X+l/FMKnZVdDJhwtpqz
	 pTWnUEsf7T3LV6JmA1s2diHQkKqAWvq8sDDR/6Fg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CACBF8028D;
	Mon, 11 Oct 2021 19:23:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AD21F80269; Mon, 11 Oct 2021 19:23:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1492CF8016D
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 19:23:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1492CF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="VDUcTDi2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DEF160EB6;
 Mon, 11 Oct 2021 17:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633972988;
 bh=Dcah+wiObB2g/yEpi4xb6Ag+IL87PMhakQ1CDFA5VqE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VDUcTDi2YBOX8W+5x7VR1GG9Y8LION2KXj8pcsBuJ9inuvDZDZ7wIexb+tD4fkl64
 Y+Qt8Q74CDbWFcCFYiU8M8wIPaqaKTN2pXFCtNsjz8jEgoZtFVZyQGpQc6gPt6EsPN
 qxBrZFOxrHiB+JaXOuXfztYrXfEYK4XKdZSrnJb8=
Date: Mon, 11 Oct 2021 19:23:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: allow -EPIPE errors for some v2 messages
Message-ID: <YWRy+UoG1YHcQ7UM@kroah.com>
References: <YWLbEdHUE3k/i0fe@kroah.com> <s5hily46316.wl-tiwai@suse.de>
 <YWRYD7fphcaWKEOG@kroah.com> <s5h7dej4kbe.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h7dej4kbe.wl-tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
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

On Mon, Oct 11, 2021 at 06:07:01PM +0200, Takashi Iwai wrote:
> On Mon, 11 Oct 2021 17:28:15 +0200,
> Greg Kroah-Hartman wrote:
> > 
> > On Sun, Oct 10, 2021 at 10:25:09PM +0200, Takashi Iwai wrote:
> > > On Sun, 10 Oct 2021 14:22:41 +0200,
> > > Greg Kroah-Hartman wrote:
> > > > 
> > > > The Schiit Hel device does not like to respond to all get_ctl_value_v2()
> > > > requests for some reason.  This used to work in older kernels, but now
> > > > with more strict checking, this failure causes the device to fail to
> > > > work.
> > > > 
> > > > Cc: Jaroslav Kysela <perex@perex.cz>
> > > > Cc: Takashi Iwai <tiwai@suse.com>
> > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > ---
> > > > 
> > > > This fixes the Shiit Hel device that I have.  It used to work on older
> > > > kernels (a year ago?), but stopped working for some reason and I didn't
> > > > take the time to track it down.  This change fixes the issue for me, but
> > > > feels wrong for some reason.  At least now I can use the device as a
> > > > headphone driver, much better than the built-in one for my current
> > > > machine...
> > > > 
> > > > If needed, I can take the time to do bisection to track down the real
> > > > issue here, it might be due to stricter endpoint checking in the USB
> > > > core, but that feels wrong somehow.
> > > > 
> > > > Here's the debugfs USB output for this device, showing the endpoints:
> > > > 
> > > > T:  Bus=07 Lev=02 Prnt=02 Port=01 Cnt=01 Dev#=  5 Spd=480 MxCh= 0
> > > > D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> > > > P:  Vendor=30be ProdID=0101 Rev=01.02
> > > > S:  Manufacturer=Schiit Audio
> > > > S:  Product=Schiit Hel
> > > > C:  #Ifs= 4 Cfg#= 1 Atr=c0 MxPwr=0mA
> > > > I:  If#= 0 Alt= 0 #EPs= 1 Cls=01(audio) Sub=01 Prot=20 Driver=snd-usb-audio
> > > > E:  Ad=8f(I) Atr=03(Int.) MxPS=   6 Ivl=1ms
> > > > I:  If#= 1 Alt= 1 #EPs= 2 Cls=01(audio) Sub=02 Prot=20 Driver=snd-usb-audio
> > > > E:  Ad=05(O) Atr=05(Isoc) MxPS= 104 Ivl=125us
> > > > E:  Ad=85(I) Atr=11(Isoc) MxPS=   4 Ivl=1ms
> > > > I:  If#= 2 Alt= 1 #EPs= 1 Cls=01(audio) Sub=02 Prot=20 Driver=snd-usb-audio
> > > > E:  Ad=88(I) Atr=05(Isoc) MxPS= 156 Ivl=125us
> > > > I:  If#= 3 Alt= 0 #EPs= 1 Cls=03(HID  ) Sub=00 Prot=00 Driver=usbhid
> > > > E:  Ad=84(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
> > > > 
> > > > Any other suggestions to fix this are welcome.
> > > 
> > > Could you show the exact error messages and lsusb -v output?
> > > We may paper over only the problematic node instead.
> > 
> > Sure, here's the dmesg output on 5.15-rc5 when it is turned on:
> > 
> > [Oct11 17:25] usb 7-2.2: new high-speed USB device number 9 using xhci_hcd
> > [  +0.122422] usb 7-2.2: New USB device found, idVendor=30be, idProduct=0101, bcdDevice= 1.02
> > [  +0.000009] usb 7-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > [  +0.000002] usb 7-2.2: Product: Schiit Hel
> > [  +0.000002] usb 7-2.2: Manufacturer: Schiit Audio
> > [  +0.327172] input: Schiit Audio Schiit Hel as /devices/pci0000:40/0000:40:01.1/0000:41:00.0/0000:42:08.0/0000:47:00.1/usb7/7-2/7-2.2/7-2.2:1.3/0003:30BE:0101.0009/input/input21
> > [  +0.055134] hid-generic 0003:30BE:0101.0009: input,hidraw8: USB HID v1.00 Device [Schiit Audio Schiit Hel] on usb-0000:47:00.1-2.2/input3
> > [  +0.135988] usb 7-2.2: cannot get ctl value: req = 0x81, wValue = 0x100, wIndex = 0x1100, type = 1
> > [  +0.060647] usb 7-2.2: cannot get ctl value: req = 0x81, wValue = 0x100, wIndex = 0x1100, type = 1
> > [  +0.065362] usb 7-2.2: cannot get ctl value: req = 0x81, wValue = 0x100, wIndex = 0x1100, type = 1
> > [  +0.192121] usb 7-2.2: cannot get ctl value: req = 0x81, wValue = 0x100, wIndex = 0x1100, type = 1
> 
> Thanks.  So this happens at the unit 17, and ...
> 
> 
> > And here is the 'lsusb -v' output of the device.
> > 
> > 
> > Bus 007 Device 009: ID 30be:0101 Schiit Audio Schiit Hel
> (snip)
> >       AudioControl Interface Descriptor:
> >         bLength                18
> >         bDescriptorType        36
> >         bDescriptorSubtype      6 (FEATURE_UNIT)
> >         bUnitID                17
> >         bSourceID               5
> >         bmaControls(0)     0x00000003
> >           Mute Control (read/write)
> >         bmaControls(1)     0x00000000
> >         bmaControls(2)     0x00000000
> >         iFeature                0 
> 
> ... this is the entry.
> 
> Could you also post the contents of /proc/asound/card*/usbmixer (only
> for the corresponding device), too?

Sure, here it is:

USB Mixer: usb_id=0x30be0101, ctrlif=0, ctlerr=0
Card: Schiit Audio Schiit Hel at usb-0000:47:00.1-2.2, high speed
  Unit: 5
    Control: name="Mic - Input Jack", index=0
    Info: id=5, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 7
    Control: name="Speaker - Output Jack", index=0
    Info: id=7, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 13
    Control: name="PCM Playback Switch", index=0
    Info: id=13, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 17
    Control: name="Mic Capture Switch", index=0
    Info: id=17, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 18
    Control: name="Clock Source 18 Validity", index=0
    Info: id=18, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 22
    Control: name="Clock Source 22 Validity", index=0
    Info: id=22, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0

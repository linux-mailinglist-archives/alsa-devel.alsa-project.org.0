Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4D442D951
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 14:30:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 246ED166B;
	Thu, 14 Oct 2021 14:29:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 246ED166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634214616;
	bh=dMTtDspikLri2cSDeLKE6FS5BgPrS3787GmcSTZUZTs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EKibSd/ETbRF7G4Ov9seKgnsd5FzOl8owKcBW4VF8PwF2ygMhmANFwgsUwoQYfEiH
	 NKHcFPeGfP/ml05dQqPOuNsXZngTTsOcP0v2egh0V5cL8M0TRhRcjpG79zeZBDT9a9
	 0+VzQ0Wg7ouRSZqAOJndiKqG0T4M5Go+1ijLbVPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F597F80245;
	Thu, 14 Oct 2021 14:28:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FF8CF80212; Thu, 14 Oct 2021 14:28:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5861F801D5
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 14:28:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5861F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="vhIC3B2X"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C22C3610CB;
 Thu, 14 Oct 2021 12:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634214501;
 bh=dMTtDspikLri2cSDeLKE6FS5BgPrS3787GmcSTZUZTs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vhIC3B2XK6EP+qvzVcLYD84j8L90k0m3su6twVYURfo3xNKxQ+FCk3o4eNV/mDAd0
 xemiZGVOXR0t1qEkPxpkcFe189vL9KwOOsHNRtAtdQ/M9rU2f7o3IHTTX4qRvbg9vo
 DMDAAnUZtxejGqKUOUeWR/SE0BBETpnrTvDeghqI=
Date: Thu, 14 Oct 2021 14:28:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: allow -EPIPE errors for some v2 messages
Message-ID: <YWgiYvF8fiqJw1b6@kroah.com>
References: <YWLbEdHUE3k/i0fe@kroah.com> <s5hily46316.wl-tiwai@suse.de>
 <YWRYD7fphcaWKEOG@kroah.com> <s5h7dej4kbe.wl-tiwai@suse.de>
 <YWRy+UoG1YHcQ7UM@kroah.com> <s5ho87u3dcb.wl-tiwai@suse.de>
 <YWWCiLE6id43uJjp@kroah.com> <s5hsfx61imj.wl-tiwai@suse.de>
 <YWgM2jI94fZLfP09@kroah.com> <s5hr1cnx2dj.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hr1cnx2dj.wl-tiwai@suse.de>
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

On Thu, Oct 14, 2021 at 01:38:32PM +0200, Takashi Iwai wrote:
> On Thu, 14 Oct 2021 12:56:26 +0200,
> Greg Kroah-Hartman wrote:
> > 
> > On Tue, Oct 12, 2021 at 03:24:04PM +0200, Takashi Iwai wrote:
> > > On Tue, 12 Oct 2021 14:41:44 +0200,
> > > Greg Kroah-Hartman wrote:
> > > > 
> > > > On Tue, Oct 12, 2021 at 09:35:16AM +0200, Takashi Iwai wrote:
> > > > > On Mon, 11 Oct 2021 19:23:05 +0200,
> > > > > Greg Kroah-Hartman wrote:
> > > > > > 
> > > > > > On Mon, Oct 11, 2021 at 06:07:01PM +0200, Takashi Iwai wrote:
> > > > > > > Could you also post the contents of /proc/asound/card*/usbmixer (only
> > > > > > > for the corresponding device), too?
> > > > > > 
> > > > > > Sure, here it is:
> > > > > > 
> > > > > > USB Mixer: usb_id=0x30be0101, ctrlif=0, ctlerr=0
> > > > > > Card: Schiit Audio Schiit Hel at usb-0000:47:00.1-2.2, high speed
> > > > > >   Unit: 5
> > > > > >     Control: name="Mic - Input Jack", index=0
> > > > > >     Info: id=5, control=2, cmask=0x0, channels=1, type="BOOLEAN"
> > > > > >     Volume: min=0, max=1, dBmin=0, dBmax=0
> > > > > >   Unit: 7
> > > > > >     Control: name="Speaker - Output Jack", index=0
> > > > > >     Info: id=7, control=2, cmask=0x0, channels=1, type="BOOLEAN"
> > > > > >     Volume: min=0, max=1, dBmin=0, dBmax=0
> > > > > >   Unit: 13
> > > > > >     Control: name="PCM Playback Switch", index=0
> > > > > >     Info: id=13, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
> > > > > >     Volume: min=0, max=1, dBmin=0, dBmax=0
> > > > > >   Unit: 17
> > > > > >     Control: name="Mic Capture Switch", index=0
> > > > > >     Info: id=17, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
> > > > > >     Volume: min=0, max=1, dBmin=0, dBmax=0
> > > > > >   Unit: 18
> > > > > >     Control: name="Clock Source 18 Validity", index=0
> > > > > >     Info: id=18, control=2, cmask=0x0, channels=1, type="BOOLEAN"
> > > > > >     Volume: min=0, max=1, dBmin=0, dBmax=0
> > > > > >   Unit: 22
> > > > > >     Control: name="Clock Source 22 Validity", index=0
> > > > > >     Info: id=22, control=2, cmask=0x0, channels=1, type="BOOLEAN"
> > > > > >     Volume: min=0, max=1, dBmin=0, dBmax=0
> > > > > 
> > > > > Hm, I expected more exotic control that failed, but it was Mic Capture
> > > > > Switch, which should be treated normally.
> > > > > 
> > > > > Could you try the patch below?  This will still show other warning
> > > > > messages, but it'll forcibly initialize the mixer elements at probe
> > > > > time, and the rest should work.
> > > > > 
> > > > > Once after it's confirmed to work, we may shut up the device warnings
> > > > > with a quirk.
> > > > 
> > > > Only one warning message shows up, here's the dmesg with this patch
> > > > applied:
> > > > 
> > > > 
> > > > [Oct12 14:39] usb 7-2.2: new high-speed USB device number 10 using xhci_hcd
> > > > [  +0.123157] usb 7-2.2: New USB device found, idVendor=30be, idProduct=0101, bcdDevice= 1.02
> > > > [  +0.000009] usb 7-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > > > [  +0.000003] usb 7-2.2: Product: Schiit Hel
> > > > [  +0.000002] usb 7-2.2: Manufacturer: Schiit Audio
> > > > [  +0.339785] usb 7-2.2: 17:0: failed to get current value for ch 0 (-32)
> > > > [  +0.020373] input: Schiit Audio Schiit Hel as /devices/pci0000:40/0000:40:01.1/0000:41:00.0/0000:42:08.0/0000:47:00.1/usb7/7-2/7-2.2/7-2.2:1.3/0003:30BE:0101.000B/input/input24
> > > > [  +0.056868] hid-generic 0003:30BE:0101.000B: input,hidraw6: USB HID v1.00 Device [Schiit Audio Schiit Hel] on usb-0000:47:00.1-2.2/input3
> > > 
> > > OK, then the problem is only about this unit and about the master
> > > channel.
> > > 
> > > > I don't see a "mic capture switch" on this device, but maybe it triggers
> > > > when I plug a mic into the microphone port, which is currently empty?
> > > 
> > > This should be persistent and visible; try to run "amixer -c1" (or the
> > > different card index for the device).
> > > 
> > > So far, so good.  The only remaining piece is how this -EPIPE error
> > > comes up.  Is this a protocol stall error or such?  Would it be
> > > avoided by adding the delay like done for some devices?
> > > 
> > > With the 5.15-rc kernel, you can pass quirk_flags option to
> > > snd-usb-audio module for applying known quirks.
> > > e.g. quirk_flags=0x100 will set the 1msec delay at each control
> > > message.  Please check whether it makes any difference.
> > > The option is an integer array for multiple devices, so if you have
> > > multiple USB-audio devices, put at the appropriate position in the
> > > array (e.g. quirk_flags=,,0x100 for the 3rd slot).
> > 
> > This quirk did not work.  Well, it caused the error to show up after a
> > delay, but the error is still there.
> > 
> > > The quirk bit 0x4000 will shut up the control errors.  If the above
> > > doesn't fix the warning and the device is working more or less, set
> > > this quirk to shut up the warning.  It can be set statically in the
> > > table at the end in sound/usb/quirks.c.
> > 
> > This quirk did work in that the error messages are still in the kernel
> > log, but the device seems to work properly now.
> > 
> > Let me send a patch that adds this device to the quirk table.
> 
> OK, thanks!  The remaining error message should be suppressed with the
> patch in my previous mail.  Or maybe we can add a patch to downgrade
> the error message to dev_dbg() at first for 5.15, then another one
> (initializing all controls at first) to 5.16.

Either works for me.  If you want me to test anything out with this
device, just let me know!

thanks,

greg k-h

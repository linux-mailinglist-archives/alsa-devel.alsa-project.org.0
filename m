Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B466542A4C7
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 14:43:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 264811687;
	Tue, 12 Oct 2021 14:42:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 264811687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634042594;
	bh=sGn6oX7A/cABQ/SZVLhoSRBwTYLT5p/BpAYt7PeiP3Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LBMmuAB5KpKin5py+Ss8KuoRg90dmlkySmK8eARUCStBqf7Ocxsd+W0yGZxyqziKV
	 0416bHqDD9nOUZfTtDgraum6EA8/wNMrqx3xt/+zrYQisCrqpJPFx86Dm0/XK6IQ5N
	 OF1bIce61iEw8vdGqmKBiHt0vsQ5c81Co/XIVfhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90BC7F80245;
	Tue, 12 Oct 2021 14:41:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20BAAF80212; Tue, 12 Oct 2021 14:41:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47239F800C0
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 14:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47239F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="bQ9HfOz7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D517060E97;
 Tue, 12 Oct 2021 12:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1634042507;
 bh=sGn6oX7A/cABQ/SZVLhoSRBwTYLT5p/BpAYt7PeiP3Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bQ9HfOz7uy2lfWuiJiFxP6Pa5lGDOIqx3P9OAeW6hIh7NySdnIte7vFU7m8COMvRa
 Vy1ZlE/Zu2ipSuyfqcfWa6CVChucrz7z4o/MSDLogUWHP+rV+nNtPa6DGA0EvuFpIr
 CFaw1BtOzugdUiSitKs7+EFJcKQDchr2CtwVXjO8=
Date: Tue, 12 Oct 2021 14:41:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: allow -EPIPE errors for some v2 messages
Message-ID: <YWWCiLE6id43uJjp@kroah.com>
References: <YWLbEdHUE3k/i0fe@kroah.com> <s5hily46316.wl-tiwai@suse.de>
 <YWRYD7fphcaWKEOG@kroah.com> <s5h7dej4kbe.wl-tiwai@suse.de>
 <YWRy+UoG1YHcQ7UM@kroah.com> <s5ho87u3dcb.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5ho87u3dcb.wl-tiwai@suse.de>
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

On Tue, Oct 12, 2021 at 09:35:16AM +0200, Takashi Iwai wrote:
> On Mon, 11 Oct 2021 19:23:05 +0200,
> Greg Kroah-Hartman wrote:
> > 
> > On Mon, Oct 11, 2021 at 06:07:01PM +0200, Takashi Iwai wrote:
> > > Could you also post the contents of /proc/asound/card*/usbmixer (only
> > > for the corresponding device), too?
> > 
> > Sure, here it is:
> > 
> > USB Mixer: usb_id=0x30be0101, ctrlif=0, ctlerr=0
> > Card: Schiit Audio Schiit Hel at usb-0000:47:00.1-2.2, high speed
> >   Unit: 5
> >     Control: name="Mic - Input Jack", index=0
> >     Info: id=5, control=2, cmask=0x0, channels=1, type="BOOLEAN"
> >     Volume: min=0, max=1, dBmin=0, dBmax=0
> >   Unit: 7
> >     Control: name="Speaker - Output Jack", index=0
> >     Info: id=7, control=2, cmask=0x0, channels=1, type="BOOLEAN"
> >     Volume: min=0, max=1, dBmin=0, dBmax=0
> >   Unit: 13
> >     Control: name="PCM Playback Switch", index=0
> >     Info: id=13, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
> >     Volume: min=0, max=1, dBmin=0, dBmax=0
> >   Unit: 17
> >     Control: name="Mic Capture Switch", index=0
> >     Info: id=17, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
> >     Volume: min=0, max=1, dBmin=0, dBmax=0
> >   Unit: 18
> >     Control: name="Clock Source 18 Validity", index=0
> >     Info: id=18, control=2, cmask=0x0, channels=1, type="BOOLEAN"
> >     Volume: min=0, max=1, dBmin=0, dBmax=0
> >   Unit: 22
> >     Control: name="Clock Source 22 Validity", index=0
> >     Info: id=22, control=2, cmask=0x0, channels=1, type="BOOLEAN"
> >     Volume: min=0, max=1, dBmin=0, dBmax=0
> 
> Hm, I expected more exotic control that failed, but it was Mic Capture
> Switch, which should be treated normally.
> 
> Could you try the patch below?  This will still show other warning
> messages, but it'll forcibly initialize the mixer elements at probe
> time, and the rest should work.
> 
> Once after it's confirmed to work, we may shut up the device warnings
> with a quirk.

Only one warning message shows up, here's the dmesg with this patch
applied:


[Oct12 14:39] usb 7-2.2: new high-speed USB device number 10 using xhci_hcd
[  +0.123157] usb 7-2.2: New USB device found, idVendor=30be, idProduct=0101, bcdDevice= 1.02
[  +0.000009] usb 7-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[  +0.000003] usb 7-2.2: Product: Schiit Hel
[  +0.000002] usb 7-2.2: Manufacturer: Schiit Audio
[  +0.339785] usb 7-2.2: 17:0: failed to get current value for ch 0 (-32)
[  +0.020373] input: Schiit Audio Schiit Hel as /devices/pci0000:40/0000:40:01.1/0000:41:00.0/0000:42:08.0/0000:47:00.1/usb7/7-2/7-2.2/7-2.2:1.3/0003:30BE:0101.000B/input/input24
[  +0.056868] hid-generic 0003:30BE:0101.000B: input,hidraw6: USB HID v1.00 Device [Schiit Audio Schiit Hel] on usb-0000:47:00.1-2.2/input3


I don't see a "mic capture switch" on this device, but maybe it triggers
when I plug a mic into the microphone port, which is currently empty?

thanks,

greg k-h

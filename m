Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAA739F713
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 14:47:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8171416DF;
	Tue,  8 Jun 2021 14:46:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8171416DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623156467;
	bh=vpe+yHviUyPixkSlaq6RrXSzYuX5hpM2fYwU2h1Pue4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IKN0D9T5WxFabxbXFNaRxl5r4XTbGEwsmqhdlHS3LGAJ0NOJ46gVJi1nJcorT8vJf
	 7yuySFWo+D9kGYZA8XOCiCXi2CzpbfweoCvf6aj9bS7N0nVlfs2BhLB0p5HpS3rYLr
	 kl24GJJArsGy1Hs7RG+++sAX0arSsm0G3cIU8v58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEB46F80227;
	Tue,  8 Jun 2021 14:46:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64118F801EC; Tue,  8 Jun 2021 14:46:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F13C9F800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F13C9F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oGS5p4Ah"
Received: by mail-lf1-x12f.google.com with SMTP id j20so2555092lfe.8
 for <alsa-devel@alsa-project.org>; Tue, 08 Jun 2021 05:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ea4fwkzCscgRVxwz+ttDu0ZWlCRxPg3hpkrwHQuS35Y=;
 b=oGS5p4AhGFi3SZLx3vt78ncDuACNxm8OyLHgrU6DrUOTANdpgtp2hx2Kej0+Sp2kxa
 pM7B7hedjYLvsmJfRiuueK1zu+PpTaKRzw/Gwa4SCHyzgLhFfvm5p/rRSZXvW/MXfI7J
 MaCeHq8n3g4Ur7aFszdvh3ziLwRNlXlCNJsmUbqqSyY4r1amOFH0xuaDC4fnBnytGHTt
 LYMJXxONmTVK/Ko6baeWz2QVkkz8qKU4XDc80t5Bf9+sThlqfu97AR5lW9bnPZDSmar2
 gOEZHg7UA1lisMT16F4DL7uPXqA/0IwNcMGoEQilHKwPuw1dw6oDDsdDRww+8L4KDgI/
 v7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ea4fwkzCscgRVxwz+ttDu0ZWlCRxPg3hpkrwHQuS35Y=;
 b=b2kgMC7d/reMyu5ov+x1Z1n9a71RYPHpFglKeGLVDHrjW1LSqsvnYsOq2Skod6aNAL
 /BB16pyLNvUi3HQLzAFJNtkRluuQbEwjYefKrseKIVhNnJFeirF2s0aIm4pslzQc67s1
 pJTHauqIY0H6fKgDw6Dyoqlv+f5gZl/T9StRZyfQssr5xds8OYekBHgmJwDdeGnTUKVH
 v6yYhJvPQ2tGPjjh8oRlJAO0TDwQoHiX/31Q4+hRQd1nmY8Jixxu+xSOpO1GSkBjRqZe
 ix2omC2/Z5H8FLq8//FUsJTDg61LpRN2qTYEKzfeU8IPj4tG8C5pw61PlIZUeJX01KY0
 E9xw==
X-Gm-Message-State: AOAM53265wpgJQVFZNo7L29J7mCzq9VdJp4OQUpRyQOfFUXOxjWLFpiR
 ZvPeCEIwEQrA9Ypx1zr8FlIISHPorkbTiRL80krE6ZC2ds3dCA==
X-Google-Smtp-Source: ABdhPJwaqX487JFDktM8Tf0hj/g/mTVe1LSbL0yr8Sr00IirfZo569XmptY2K2GsDwJKJxSJxT795XHblpojf+XlkLI=
X-Received: by 2002:a19:7604:: with SMTP id c4mr10970752lff.398.1623156369353; 
 Tue, 08 Jun 2021 05:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
 <YL9RDBUsk23LvHV9@kroah.com>
 <CAHhAz+gkm3EHE71PM4xzekC7Vsv3gksBd-M9_5iFe5AcNZbLOQ@mail.gmail.com>
 <YL9jKqLtWUgJL9ys@kroah.com>
In-Reply-To: <YL9jKqLtWUgJL9ys@kroah.com>
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Tue, 8 Jun 2021 18:15:57 +0530
Message-ID: <CAHhAz+gPjcnL9-RV7gzTi1iFHK1pj6moySwOHVE3q_wVtmkyFg@mail.gmail.com>
Subject: Re: USB sound card issues
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-usb@vger.kernel.org,
 linux-sound@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
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

On Tue, Jun 8, 2021 at 6:02 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jun 08, 2021 at 05:44:42PM +0530, Muni Sekhar wrote:
> > On Tue, Jun 8, 2021 at 4:44 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Jun 08, 2021 at 04:20:07PM +0530, Muni Sekhar wrote:
> > > > Hi all,
> > > >
> > > > I am using a USB sound card(snd-usb-audio), and it fails while doing
> > > > the audio recording "arecord: pcm_read:2032: read error: Input/output
> > > > error".
> > > >
> > > > What could be the problem? and is there a workaround for this?
> > > >
> > > > $ arecord -l
> > > > **** List of CAPTURE Hardware Devices ****
> > > > card 1: BT_AG [BT_002], device 0: USB Audio [USB Audio]
> > > >   Subdevices: 1/1
> > > >   Subdevice #0: subdevice #0
> > > >
> > > >
> > > > $ arecord --device hw:1,0 --channels 1 --format S16_LE --rate 32000_Hz
> > x.wav
> > > > Recording WAVE 'x.wav' : Signed 16 bit Little Endian, Rate 32000 Hz,
> > Mono
> > > > arecord: pcm_read:2032: read error: Input/output error
> > >
> > > What kernel version is this, and what other kernel messages are printed
> > > when you plug your device in?
>
>
> What kernel version is this?
4.15.0-54-generic

>
> > [12932.016672] usb 2-1: USB disconnect, device number 5
> > [12932.016683] usb 2-1.1: USB disconnect, device number 6
> > [12962.085766] usb 2-1: new full-speed USB device number 7 using xhci_hcd
> > [12962.275849] usb 2-1: New USB device found, idVendor=0a12, idProduct=4010
> > [12962.275861] usb 2-1: New USB device strings: Mfr=0, Product=0,
> > SerialNumber=0
> > [12962.276538] usb 2-1: ep 0x81 - rounding interval to 1024 microframes, ep
> > desc says 2040 microframes
> > [12962.279699] hub 2-1:1.0: USB hub found
> > [12962.280663] hub 2-1:1.0: 4 ports detected
> > [12962.875024] usb 2-1.1: new full-speed USB device number 8 using xhci_hcd
> > [12962.980977] usb 2-1.1: New USB device found, idVendor=0a12,
> > idProduct=4007
> > [12962.980991] usb 2-1.1: New USB device strings: Mfr=1, Product=2,
> > SerialNumber=5
> > [12962.981000] usb 2-1.1: Product: BT_002
> > [12962.981008] usb 2-1.1: Manufacturer: Qualcomm
> > [12962.981015] usb 2-1.1: SerialNumber: ABC4C25B
> > [12962.992667] input: Qualcomm BT_002 as
> > /devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.1/2-1.1:1.0/0003:0A12:4007.0003/input/input6
> > [12963.048083] hid-generic 0003:0A12:4007.0003: input,hiddev0,hidraw0: USB
> > HID v1.11 Device [Qualcomm BT_002] on usb-0000:00:14.0-1.1/input0
> > [12963.066910] hid-generic 0003:0A12:4007.0004: hiddev0,hidraw1: USB HID
> > v1.11 Device [Qualcomm BT_002] on usb-0000:00:14.0-1.1/input1
> >
> > Same error (arecord: pcm_read:2032: read error: Input/output error)
> > observed on 4.4, 4.15 and 5.4 kernel version.
>
> What exact versions of these are you using?
4.4.0-66-generic
4.15.0-54-generic
Ubuntu 20.04

>
> And what about the latest 5.12.y release?
I don't have this test setup.



>
> thanks,
>
> greg k-h



-- 
Thanks,
Sekhar

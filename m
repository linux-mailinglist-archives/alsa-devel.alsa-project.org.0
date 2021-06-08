Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6FE39F748
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 15:05:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 037C216E3;
	Tue,  8 Jun 2021 15:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 037C216E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623157508;
	bh=a+I8k5Ryy+bGJ7DPqkKK/fVMrT++/jh8IqN0xY/EZYc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Il2AfLXzw7SeyvbOhxq1RcKnkCoHGI7pmDENhAAcC9DS2d/98ZXmCMJR1RhIUljkT
	 W7wv3ncDu4CQlFMk0Uk8OgjoioF2uk3c4kBbUojUs2LlW+romxQhMnkjcg/uSDunQN
	 WBpNFvIr4nxYpVD+HWZ+z7pEi3wtp6TbYWEuhSDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 311F5F800FD;
	Tue,  8 Jun 2021 15:03:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3531EF801EC; Tue,  8 Jun 2021 15:03:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E34EF80116
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 15:03:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E34EF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="vLB/k5DH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C40061249;
 Tue,  8 Jun 2021 13:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1623157406;
 bh=a+I8k5Ryy+bGJ7DPqkKK/fVMrT++/jh8IqN0xY/EZYc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vLB/k5DH2WlpVPlb6Q7eUtlqXarvvNDGNdCO68k3q//c+6PH29T4/IUpTtZIy+b4m
 MR2Fmszz9SRAZv6ETTpCPXoQdAkRqK3A9Xn+55pGgJgoO1uX0Mj905bpOj5nAv5fKz
 VoFyl0wfOW8L9aEp5z9yGcX7h9BJ2KepKRIIFCLk=
Date: Tue, 8 Jun 2021 15:03:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Muni Sekhar <munisekharrms@gmail.com>
Subject: Re: USB sound card issues
Message-ID: <YL9qmwNyarmOXHFU@kroah.com>
References: <CAHhAz+haTa8FJep+mokae4O7Gy9zzq2dbPk28fuEH5FO24uTzw@mail.gmail.com>
 <YL9RDBUsk23LvHV9@kroah.com>
 <CAHhAz+gkm3EHE71PM4xzekC7Vsv3gksBd-M9_5iFe5AcNZbLOQ@mail.gmail.com>
 <YL9jKqLtWUgJL9ys@kroah.com>
 <CAHhAz+gPjcnL9-RV7gzTi1iFHK1pj6moySwOHVE3q_wVtmkyFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHhAz+gPjcnL9-RV7gzTi1iFHK1pj6moySwOHVE3q_wVtmkyFg@mail.gmail.com>
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

On Tue, Jun 08, 2021 at 06:15:57PM +0530, Muni Sekhar wrote:
> On Tue, Jun 8, 2021 at 6:02 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Jun 08, 2021 at 05:44:42PM +0530, Muni Sekhar wrote:
> > > On Tue, Jun 8, 2021 at 4:44 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Tue, Jun 08, 2021 at 04:20:07PM +0530, Muni Sekhar wrote:
> > > > > Hi all,
> > > > >
> > > > > I am using a USB sound card(snd-usb-audio), and it fails while doing
> > > > > the audio recording "arecord: pcm_read:2032: read error: Input/output
> > > > > error".
> > > > >
> > > > > What could be the problem? and is there a workaround for this?
> > > > >
> > > > > $ arecord -l
> > > > > **** List of CAPTURE Hardware Devices ****
> > > > > card 1: BT_AG [BT_002], device 0: USB Audio [USB Audio]
> > > > >   Subdevices: 1/1
> > > > >   Subdevice #0: subdevice #0
> > > > >
> > > > >
> > > > > $ arecord --device hw:1,0 --channels 1 --format S16_LE --rate 32000_Hz
> > > x.wav
> > > > > Recording WAVE 'x.wav' : Signed 16 bit Little Endian, Rate 32000 Hz,
> > > Mono
> > > > > arecord: pcm_read:2032: read error: Input/output error
> > > >
> > > > What kernel version is this, and what other kernel messages are printed
> > > > when you plug your device in?
> >
> >
> > What kernel version is this?
> 4.15.0-54-generic
> 
> >
> > > [12932.016672] usb 2-1: USB disconnect, device number 5
> > > [12932.016683] usb 2-1.1: USB disconnect, device number 6
> > > [12962.085766] usb 2-1: new full-speed USB device number 7 using xhci_hcd
> > > [12962.275849] usb 2-1: New USB device found, idVendor=0a12, idProduct=4010
> > > [12962.275861] usb 2-1: New USB device strings: Mfr=0, Product=0,
> > > SerialNumber=0
> > > [12962.276538] usb 2-1: ep 0x81 - rounding interval to 1024 microframes, ep
> > > desc says 2040 microframes
> > > [12962.279699] hub 2-1:1.0: USB hub found
> > > [12962.280663] hub 2-1:1.0: 4 ports detected
> > > [12962.875024] usb 2-1.1: new full-speed USB device number 8 using xhci_hcd
> > > [12962.980977] usb 2-1.1: New USB device found, idVendor=0a12,
> > > idProduct=4007
> > > [12962.980991] usb 2-1.1: New USB device strings: Mfr=1, Product=2,
> > > SerialNumber=5
> > > [12962.981000] usb 2-1.1: Product: BT_002
> > > [12962.981008] usb 2-1.1: Manufacturer: Qualcomm
> > > [12962.981015] usb 2-1.1: SerialNumber: ABC4C25B
> > > [12962.992667] input: Qualcomm BT_002 as
> > > /devices/pci0000:00/0000:00:14.0/usb2/2-1/2-1.1/2-1.1:1.0/0003:0A12:4007.0003/input/input6
> > > [12963.048083] hid-generic 0003:0A12:4007.0003: input,hiddev0,hidraw0: USB
> > > HID v1.11 Device [Qualcomm BT_002] on usb-0000:00:14.0-1.1/input0
> > > [12963.066910] hid-generic 0003:0A12:4007.0004: hiddev0,hidraw1: USB HID
> > > v1.11 Device [Qualcomm BT_002] on usb-0000:00:14.0-1.1/input1
> > >
> > > Same error (arecord: pcm_read:2032: read error: Input/output error)
> > > observed on 4.4, 4.15 and 5.4 kernel version.
> >
> > What exact versions of these are you using?
> 4.4.0-66-generic
> 4.15.0-54-generic

These are all Ubuntu-provided kernels, we have no idea what is really in
them, sorry.

I would ask for support from that distro please.

good luck!

greg k-h

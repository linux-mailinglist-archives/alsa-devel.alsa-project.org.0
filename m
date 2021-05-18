Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54403388268
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 23:49:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F127F170A;
	Tue, 18 May 2021 23:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F127F170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621374540;
	bh=2EBaJaXpcT6LvUNXy7Ct+13z2jrQswSvKWXYB4/n2bk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B/6c/sHHsRoByeN6tYRf04JBuEiwjOPpp3TZ/N9By3QUJjMel4FHFpCGEZ6faqe41
	 Pjv14X1ceI03j9MEZVgh/xbDHCZ/WfxiaRWXbVAALf6mlJn1aiaPBOlNvqHDeBY1jc
	 reVYg12rAqOloZixpCmam2Sxqk09JxTV+oRnqPgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AC41F80217;
	Tue, 18 May 2021 23:47:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 056FAF80257; Tue, 18 May 2021 23:47:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D1D0F80139
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 23:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D1D0F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TGdTRojh"
Received: by mail-qt1-x82e.google.com with SMTP id g8so1193892qtp.4
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 14:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6xLeJk+UVQtV0WtME4/l4uqyc3OFYAUamtiA1yA/ZP4=;
 b=TGdTRojhF0CckjwjmUew1fGuASEU38gRUJXQw/Wu7CJqoRekkTnB7gTAsLBpp7jVFE
 WQfAjJrlP1ot3bi+cBlUTwavGQsUvBpPoFe/q0kh62z86JyAivo+NXl80ddnx83YZ5Ze
 wt6PUx5tO2j/dZikYwQUPJL8CE/6r694gD3OqJUtjmI9vexYouXXiuC8DDCAOv3tRUFH
 8ugcgIBx/8Oy3c/ISWHGH8D7lu6nm62bBNKHlJiPcORo7yuvFsWyRGfS9qXuk1THyzok
 fafa3HJqPHWdNB1kbpbk5YNPRPn4QetAFvHfY64a+Bf2u6pvHSZcR6h4xbpbgGGYPl2G
 iJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6xLeJk+UVQtV0WtME4/l4uqyc3OFYAUamtiA1yA/ZP4=;
 b=VJxKrh24goKNrlxDE4ZSBmKWCkgb/GUgwJJ1SawBFreh/wcJrgl9zjTVfs+QLlgQhN
 jvuJzqi2YtaXoq09A9y6qXeonXxahgazGs6NB9ddTwFNDTyOQyv2mWszya+hp/x5rDQJ
 +fHcfD9pdnoXJ7RLopsFCTF/yEiH5N33/AzZDjt5AzO5YMvRefnfxl+BTu5A3DA5aOpy
 2uoHh0vvBD8XswQc7X/qxylK2nWRpMBMHZPMYovr6TdV3a+xgtqSJ1ZSmGVVVKmCUbun
 aEU01hzCsL8Lc/M4c3GGuABjPxSWeT+tQGhHWitDF8C81DRenk2TBTy4LPVu78dzi+3t
 14Bg==
X-Gm-Message-State: AOAM531pwaLDJvuxOK12qdpP8nTU6sglP2BwWMBwJuFNTpnE0oWscY+k
 /UFzZO9YLFcj9fx1+ZneXJnjfwlbKvYYQ0O/ZLVOSd9xPzE=
X-Google-Smtp-Source: ABdhPJzLo+8NgBh0EvQf/Ags5ccYpzSKitrG3n+VHumI6tF2bJ4tpM0vxrhDF+rjm/JuIT0Q5GzxRSDdF/FcRUJHkDM=
X-Received: by 2002:ac8:502:: with SMTP id u2mr7191128qtg.218.1621374435943;
 Tue, 18 May 2021 14:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210517172553.GA85102@m.b4.vu>
 <CAEsQvcuMK5n4F++bXCD4ML5FoRQ+KCp5soXAY8mjUpf6yqYXBQ@mail.gmail.com>
 <20210518183420.GA89090@m.b4.vu>
In-Reply-To: <20210518183420.GA89090@m.b4.vu>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Tue, 18 May 2021 18:41:45 -0300
Message-ID: <CAEsQvcs13mJF2+hDdSPhg_-VBpqFCZhjHb6xDScDD7u3LEfmog@mail.gmail.com>
Subject: Re: [BUG] ALSA: usb-audio: Scarlett 2 mixer driver fails on ehci-pci
To: "Geoffrey D. Bennett" <g@b4.vu>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, May 18, 2021 at 3:34 PM Geoffrey D. Bennett <g@b4.vu> wrote:
>
> Hi Geraldo,
>
> Thanks for your suggestion. I found:
>
> echo module ehci_hcd +p > /sys/kernel/debug/dynamic_debug/control
>
> which I guess is the same thing.

Cool, if you always connect the hardware after issuing that sysfs
change I guess you won't run into any problems with missing debugging
info.

>
> I can't see any difference between the sent USB packet working and not
> working with the additional debug:
>
> kernel: ehci-pci 0000:00:1d.0: submit_async 1.2 urb 000000004f9d8dbb ep0out len 24, qtd 0000000055a1f6c8 [qh 00000000312c985a]
> kernel: ehci-pci 0000:00:1d.0: ehci_urb_done 1.2 urb 000000004f9d8dbb ep0out status -115 len 0/24
>
> kernel: ehci-pci 0000:00:1d.0: submit_async 1.2 urb 00000000de165beb ep0out len 24, qtd 0000000056de0c60 [qh 00000000d43a72d3]
> kernel: ehci-pci 0000:00:1d.0: ehci_urb_done 1.2 urb 00000000de165beb ep0in status 0 len 24/24
>
> I agree that the issue seems more related to USB kernel development; I
> will subscribe to linux-usb and ask there.

Myself I'd hook printk()'s to both ehci_hcd and xhci_hcd to print
every possible variable involved and see if there's any relevant
mismatches. Oh and watch with the printk()'s what libusb seems to be
doing, too.

When you subscribe to linux-usb you *may* want to Cc: Greg
Kroah-Hartman with your discoveries so far, he's the USB Subsystem
Maintainer and the best one to help you track this down.

Regards,
Geraldo Nascimento

>
> Thanks,
> Geoffrey.
>
> On Mon, May 17, 2021 at 07:13:27PM -0300, Geraldo Nascimento wrote:
> > Hi, Geoffrey, have you tried adding "ehci_hcd.dyndbg=+p" to your
> > kernel boot options?
> >
> > It will give you additional debugging information, and if you need
> > more debugging information you can always use printk() and recompile
> > your modules.
> >
> > Note that your issue seems more related to USB kernel development than
> > ALSA development, still, impossible to say where the fix will land
> > without tracing the problem first.
> >
> > Best of luck,
> > Geraldo Nascimento
> >
> > On Mon, May 17, 2021 at 2:27 PM Geoffrey D. Bennett <g@b4.vu> wrote:
> > >
> > > Hi there,
> > >
> > > I'm trying to track down an issue with my Scarlett Gen 2 mixer driver
> > > that has been reported by a few people, and I can now reliably
> > > reproduce the issue, but I need some help in figuring out where
> > > exactly the issue is and how to fix it please.
> > >
> > > The issue only occurs when attempting to use the interface on a USB
> > > port using ehci-pci. xhci_hcd USB ports work fine.
> > >
> > > The issue occurs when sending the first vendor-specific USB command,
> > > but only when sending from the kernel driver. Sending the same USB
> > > packets from user-space works fine(!).
> > >
> > > I did initially think that the fault could have been due to earlier
> > > USB messages putting the device into a state where it would reject the
> > > vendor-specific USB commands, but I have carefully ruled that out &
> > > have gotten identical usbmon traces from device power-on up until the
> > > device responds differently, the only difference beforehand being
> > > whether the USB packet was sent from the kernel driver or user-space.
> > >
> > > The messages look like this in "usbmon -s 10000 -fu" when sent from
> > > user-space (or when sent from the kernel driver when the interface is
> > > plugged in to an xhci_hcd port):
> > >
> > > ffff888125855200 1006026497 S Ci:2:040:0 s a1 00 0000 0005 0018 24 <
> > > ffff888125855200 1006026680 C Ci:2:040:0 0 24 = 66191018 73190604 01000000 01000000 00040000 00000000
> > >
> > > And like this when sent from the kernel driver when the interface is
> > > plugged in to an ehci-pci port:
> > >
> > > ffff88810487a300 3686673995 S Ci:2:036:0 s a1 00 0000 0005 0018 24 <
> > > ffff88810487a300 3692178724 C Ci:2:036:0 -2 0
> > >
> > > Identical messages sent according to usbmon, but they must be
> > > different somehow!
> > >
> > > The kernel code to send that message looks like this:
> > >
> > >   return snd_usb_ctl_msg(
> > >     dev, usb_sndctrlpipe(dev, 0),
> > >     usb_req,
> > >     USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
> > >     0, interface, buf, size);
> > >
> > > and helper.c snd_usb_ctl_msg() then calls usb_control_msg().
> > >
> > > For sending arbitrary USB packets from user-space for testing, I'm
> > > using libusb and:
> > >
> > >   int ret = usb_control_msg(
> > >     devh, reqtype, request, value, index, buf, size, 1000
> > >   );
> > >
> > > So, I presume usbmon isn't giving me the full story? How can I
> > > determine the difference between the kernel and the user-space
> > > usb_control_msg() functions? I see that I can #define EHCI_URB_TRACE
> > > in ehci-hcd.c. Can anyone with more experience than me let me know if
> > > I'm going in the right direction to track this down?
> > >
> > > Thanks,
> > > Geoffrey.

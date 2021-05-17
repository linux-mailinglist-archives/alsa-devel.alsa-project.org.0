Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F34B3386CDB
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 00:20:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 370D41664;
	Tue, 18 May 2021 00:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 370D41664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621290039;
	bh=S8MTZBvJR7aHm1uy7+VyTMylhaxdUoILkMBLesqxlEM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h+Rq+zgssSn8sB8HzBKBWffDUm/SyWy6Hq6LbwO3/RYXuzEmVWYEE7zpoFZH/Ycyg
	 GTul4glIFPfZ40Ok3I+cAIu4mi8EZFSZ8jIcRt8V55Z6023/0KG7FXrpMUFqd9Mrpq
	 sYPYF/rJyX4G7IuZwqc3OchPnvuYC0c0Jt9sBmUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF710F80246;
	Tue, 18 May 2021 00:19:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A5F8F8020B; Tue, 18 May 2021 00:19:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5625F8012C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 00:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5625F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bdjEJrTM"
Received: by mail-qk1-x72b.google.com with SMTP id f18so7440729qko.7
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 15:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m6afxvKF7ooMMyFCr8BmsCZ6IAAqZ7KB2EArA9ETsmE=;
 b=bdjEJrTM0vRzjodaiN31sZFz0fiAHpO+pcjNy2h0Kttcg05IykS36EXJN1cQ7EPB0G
 7RtcRXLQJ9UiYHuhIAOSnJGITio3r/WLY1+1ajGmzABg5Ua4JNBer5EoirAe1YkdsCa0
 DE5bn/A3bGmk4aErqBa/TUK7ETyLm/m3e+EGgcpg31iYswVPf+5G6WLFRNFFay3okOTO
 I7IxZQdFrzrMPbNEAo4RRf/tyfhzUjTOOAj3VTSSh910KXnicmCBZ7Bs+9hQrpvCIQ4l
 w7/NVHCU+qE4E9dqUjeK2RrwZ+HxK0/Lq+ct+oMwPT9hHftzc/XgowspUyNuvnFhIE5l
 /OjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m6afxvKF7ooMMyFCr8BmsCZ6IAAqZ7KB2EArA9ETsmE=;
 b=OIutsoSyz3OZP86jqQ+g9Cl/e5mkzj25pEDaNRRLNG2XpbcR8UFbAwcj1rzAL/4+nb
 Sx4XRAoSnvz/5ENArrPIkFn0gRfS9lMNT6eJW+F+Ad4EbIEZ0D3ACpbJTEd9iSI7oaw2
 bh1bJbmjziPQES4lmed7936XnN9VYtzeUJWGWo8o7M7FbtqW9Tr8TsbHg5rMp+nuXx0O
 fpj5FDiCbABztS8xA8EVhPhACDnY6/KbjyasarOfZR4rXzgJBqL8czQyH/60CDejjBsQ
 PvZtZB6ayXQONnUtZjHs70jFjqdQxktF6z3R7WIy4iHO4FCM1bpJeM7ABOIVa3rFU2jM
 jOlA==
X-Gm-Message-State: AOAM531QJyQGURExBA4aZIknkkgpzjstYbTSg/Upzx32JvvjLYDTwkaO
 tWy8GXB3zEHUJH3quJPDvZoLbxICs62TlWWIr3W1ghPbNBM=
X-Google-Smtp-Source: ABdhPJx58lvgKD0uiCtqVnwqQIlEU/6HkfvOWVQM+0tZJvBDYccVgi+LNL8ddWR2q1idH/ltSvJkhdKH3Dcda6zSDYg=
X-Received: by 2002:a37:a54f:: with SMTP id o76mr2109632qke.193.1621289936737; 
 Mon, 17 May 2021 15:18:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210517172553.GA85102@m.b4.vu>
In-Reply-To: <20210517172553.GA85102@m.b4.vu>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Mon, 17 May 2021 19:13:27 -0300
Message-ID: <CAEsQvcuMK5n4F++bXCD4ML5FoRQ+KCp5soXAY8mjUpf6yqYXBQ@mail.gmail.com>
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

Hi, Geoffrey, have you tried adding "ehci_hcd.dyndbg=+p" to your
kernel boot options?

It will give you additional debugging information, and if you need
more debugging information you can always use printk() and recompile
your modules.

Note that your issue seems more related to USB kernel development than
ALSA development, still, impossible to say where the fix will land
without tracing the problem first.

Best of luck,
Geraldo Nascimento

On Mon, May 17, 2021 at 2:27 PM Geoffrey D. Bennett <g@b4.vu> wrote:
>
> Hi there,
>
> I'm trying to track down an issue with my Scarlett Gen 2 mixer driver
> that has been reported by a few people, and I can now reliably
> reproduce the issue, but I need some help in figuring out where
> exactly the issue is and how to fix it please.
>
> The issue only occurs when attempting to use the interface on a USB
> port using ehci-pci. xhci_hcd USB ports work fine.
>
> The issue occurs when sending the first vendor-specific USB command,
> but only when sending from the kernel driver. Sending the same USB
> packets from user-space works fine(!).
>
> I did initially think that the fault could have been due to earlier
> USB messages putting the device into a state where it would reject the
> vendor-specific USB commands, but I have carefully ruled that out &
> have gotten identical usbmon traces from device power-on up until the
> device responds differently, the only difference beforehand being
> whether the USB packet was sent from the kernel driver or user-space.
>
> The messages look like this in "usbmon -s 10000 -fu" when sent from
> user-space (or when sent from the kernel driver when the interface is
> plugged in to an xhci_hcd port):
>
> ffff888125855200 1006026497 S Ci:2:040:0 s a1 00 0000 0005 0018 24 <
> ffff888125855200 1006026680 C Ci:2:040:0 0 24 = 66191018 73190604 01000000 01000000 00040000 00000000
>
> And like this when sent from the kernel driver when the interface is
> plugged in to an ehci-pci port:
>
> ffff88810487a300 3686673995 S Ci:2:036:0 s a1 00 0000 0005 0018 24 <
> ffff88810487a300 3692178724 C Ci:2:036:0 -2 0
>
> Identical messages sent according to usbmon, but they must be
> different somehow!
>
> The kernel code to send that message looks like this:
>
>   return snd_usb_ctl_msg(
>     dev, usb_sndctrlpipe(dev, 0),
>     usb_req,
>     USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
>     0, interface, buf, size);
>
> and helper.c snd_usb_ctl_msg() then calls usb_control_msg().
>
> For sending arbitrary USB packets from user-space for testing, I'm
> using libusb and:
>
>   int ret = usb_control_msg(
>     devh, reqtype, request, value, index, buf, size, 1000
>   );
>
> So, I presume usbmon isn't giving me the full story? How can I
> determine the difference between the kernel and the user-space
> usb_control_msg() functions? I see that I can #define EHCI_URB_TRACE
> in ehci-hcd.c. Can anyone with more experience than me let me know if
> I'm going in the right direction to track this down?
>
> Thanks,
> Geoffrey.

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B816338B817
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 22:07:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6284A16A4;
	Thu, 20 May 2021 22:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6284A16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621541250;
	bh=IxCYEf7DqfjyZinhBvxqdu7pZkwJ3wq43hrVLFoE7Sc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SdsWftGxm94Nbs6g3hivRbVx6bB7dQBliEdVQfcl5H8lV0WXyVceRVXfOrD9ndDXN
	 AT7MNNzXYOvcmKJe/zHVF8uQLZ+tr5mC3gIHIIPWOKL0TKwi2gS8mgygUrHj6RAklQ
	 sgOn1x6Wk94Z/IJ+tslz6sf4ziA9d9VIK2wavSGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB1E1F80229;
	Thu, 20 May 2021 22:06:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 234D3F800C1; Thu, 20 May 2021 22:05:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B680AF800C1
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 22:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B680AF800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NLxIiH7P"
Received: by mail-qt1-x834.google.com with SMTP id 1so13775553qtb.0
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 13:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VKscKgeGzdfCJmmpHii2W7HFwTfIn9ah8X3H6/n+VTA=;
 b=NLxIiH7Pmlv89thNLcwY5EikeaI/fHWG7I4MFJu6DGtqH1ppEQ9ZVHvzs9Pw1shNJJ
 N/oYM6DvU3+vIDVQTp7teZ1IBw1wPePvahgjLTGOVfXsoRt5tvoQ53MXXl9hN0fAtjmS
 JDP/wLYotPaU25j1VddLx5xgbovYOdV+QkY99i1ER4gg1pPSmtlyYLNChvTnhQzys2MO
 dqU9pyXhsJmBth+tiR2WVj+KVCcYyetKoxn/p7YjPA3XvjPoy4o4/DN3BCRDBnCkhr2f
 oEX72P7VJEibhi0E/sVZTS7DDfn+XXw3IDTxG9VpM0pdCl4etOuoF7dR+WbgAnCxi3Pw
 MU3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VKscKgeGzdfCJmmpHii2W7HFwTfIn9ah8X3H6/n+VTA=;
 b=GL5eNZEzOPVTf+/46p7TYVhU6ykt7BCEHMPTODHmdlq9hCf+ubFvRdqYI7GrT+6eNp
 wktxU5ml8+0t0MD3zRX2DjFIgyd+Nptx++paZ7tnAgIygtaLxwkGHFP7gibaSjYK1kYE
 8yEY2IXP1UppojUcfcx79XoX+y6/i8vBiXHTe3X1E2PX0RmYip/37eFuASSwLazsXDf6
 Fm+TdQkuEPH6J8fESWBX2RPok9JcYTNc+MBSnW35t8Ks37pRpaBAfxkKwKUlRrV7ZiOQ
 X1BNE2o/HWFignY+d/BOn853vgb3tSI+ijpzjLdHF953NIgQF9AFFvnhviawIElKYT9D
 Q52w==
X-Gm-Message-State: AOAM533BiEXBnjY4E7GzGAHTfy6MdbL3ZvwbFBiPT9snFXYPMn2DUBb8
 lz1riiyV1nFmL6BRriPfIFrDhME5BqpgTDlUQ7mIbGyXFgg=
X-Google-Smtp-Source: ABdhPJxGzdwyz/O5RvHYW1VKw/cjaBpi/dekJKPGTpl+wtpOOWOrHvqTc8PNkKlN3ugxJ8i7uBi9QfypwUeyr05bbps=
X-Received: by 2002:ac8:1483:: with SMTP id l3mr7141267qtj.142.1621541149824; 
 Thu, 20 May 2021 13:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210517172553.GA85102@m.b4.vu>
 <CAEsQvcuMK5n4F++bXCD4ML5FoRQ+KCp5soXAY8mjUpf6yqYXBQ@mail.gmail.com>
 <20210518183420.GA89090@m.b4.vu>
 <CAEsQvcs13mJF2+hDdSPhg_-VBpqFCZhjHb6xDScDD7u3LEfmog@mail.gmail.com>
 <20210520181422.GB95348@m.b4.vu>
In-Reply-To: <20210520181422.GB95348@m.b4.vu>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Thu, 20 May 2021 17:00:15 -0300
Message-ID: <CAEsQvctwnntdhq7kq+vHtwgwuJROXSwCk0iCjCrozQfLkRS3qQ@mail.gmail.com>
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

On Thu, May 20, 2021 at 3:14 PM Geoffrey D. Bennett <g@b4.vu> wrote:
>
> On Tue, May 18, 2021 at 06:41:45PM -0300, Geraldo Nascimento wrote:
> [...]
> > Myself I'd hook printk()'s to both ehci_hcd and xhci_hcd to print
> > every possible variable involved and see if there's any relevant
> > mismatches. Oh and watch with the printk()'s what libusb seems to be
> > doing, too.
> >
> > When you subscribe to linux-usb you *may* want to Cc: Greg
> > Kroah-Hartman with your discoveries so far, he's the USB Subsystem
> > Maintainer and the best one to help you track this down.
>
> Thanks for the pointers!
>
> It turns out that usb_sndctrlpipe() is not short for "USB sound
> control pipe".
>
> diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
> index 560c2ade829d..dcff3e3a49f3 100644
> --- a/sound/usb/mixer_scarlett_gen2.c
> +++ b/sound/usb/mixer_scarlett_gen2.c
> @@ -635,7 +635,7 @@ static int scarlett2_usb(
>         /* send a second message to get the response */
>
>         err = snd_usb_ctl_msg(mixer->chip->dev,
> -                       usb_sndctrlpipe(mixer->chip->dev, 0),
> +                       usb_rcvctrlpipe(mixer->chip->dev, 0),
>                         SCARLETT2_USB_VENDOR_SPECIFIC_CMD_RESP,
>                         USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
>                         0,
>
> I'll properly submit the patch once I've got confirmation from someone
> else that this fixes the issue.

Good, I also think the correct pipe to use together with USB_DIR_IN is
indeed usb_rcvctrlpipe().

>
> Thanks again,
> Geoffrey.

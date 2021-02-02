Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F1530CA90
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 19:54:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F7361784;
	Tue,  2 Feb 2021 19:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F7361784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612292089;
	bh=z/YyBCq0e2kDsDXpBOFhJGDuWaBZZwTiC8gSrzgHDiE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bADcgn59S7A/Vbq3FaRlBCr74kHnFsYRtVPXeykDeATut12VK2JQGYz4HxhBpt9hx
	 Dc/dnVU2uK1/0K2bUoup20oHTTwkxpQgZKiGqE9VJKhvHqxleKRZPkAuDMb0F3PD5o
	 o6q1uBiyp5fkOKd7B9RBM3SHUkWUqDgmieV9hlLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75620F801F7;
	Tue,  2 Feb 2021 19:53:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7890F80171; Tue,  2 Feb 2021 19:53:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8116AF80109
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 19:53:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8116AF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="opr2vSM3"
Received: by mail-ej1-x62d.google.com with SMTP id a9so13226795ejr.2
 for <alsa-devel@alsa-project.org>; Tue, 02 Feb 2021 10:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gW2e8LrQG1XdHpwoM6/+VrfHZtPR2TKMkCT6OJZsK+c=;
 b=opr2vSM3HxxxIt1iE/RTpMeue7UDYOU1DAGAsy/P5WplBLJzqpwWK+RG0gsyqzoprg
 1hhS+18/mbAmo0BXZUAXXGp/KDxW2i+zYYR6VjHqjKzlS3hhgtKuqNs+1Br2k/AG8k2k
 7bYmITCYcLK0EOOMeoCrObzQ789+iiMX81LaR3wNGs4eNsONSHrgqXbF0JnQEF+Pw1Ko
 T6GDU5SrFHF4IBejxkqMXNhizNO4NtjjyOavtYUuVijiWI4K49fmPbx6uPXS+4knjrO3
 +/N54kYNUZnWlDC72Lgh/xnufxOUtXV1VGtevHStivOy4t478rbjbOVFIEmu+t29w6oy
 QnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gW2e8LrQG1XdHpwoM6/+VrfHZtPR2TKMkCT6OJZsK+c=;
 b=Hy6ok7pvgtXHURZT6/mz6ianQnCumY4+9V7S4BsplBNdzoiDR8SApFyuOGMXumOFT1
 jjugpugi1C2Medm9nuQ5gQ3nAkJPGltX0nyNuL+OeFwN4nJ2PCIwjgdP19JK5D8qEXa3
 rVuAkI0vYXfnOEx6hZ18nTFl9tZysoPt7O4/ICI+4cXeNcCA4Bg44ZT4b+gQchAGdCC/
 U4i8sHw469zlmhjm+10vTPetAXJ8uL1Ipfw8FDE+qJHvYOezzjUN9m9uYYQn8RX6A95G
 67JU2mje4H+od9H7mhx/yzWdteGxu1QvLHrJHFsRe2Ejrpt5TW9sYUIDf/Gyrk7/pnGl
 lw2Q==
X-Gm-Message-State: AOAM530XswueosdDZ+ANZKpjP9NPaOVhVQuYHhMOlnKJBqqleYwKWCIV
 PtxAwIeX6JYiGHRBr7EUWYFK8aJafAHYaj2mmWc=
X-Google-Smtp-Source: ABdhPJylD7JTWEb4hWaCl7UMvHWCjhhHCnLQw0zHAlNmIogFvkYwqvJZ+Rf2YvgTYtJUw9ETz3r+nKSO5JYgu/tzfuw=
X-Received: by 2002:a17:907:7785:: with SMTP id
 ky5mr24338275ejc.176.1612291986439; 
 Tue, 02 Feb 2021 10:53:06 -0800 (PST)
MIME-Version: 1.0
References: <CAHa6N62-YS++jM3O8E1dSY9eCcg6P0uW-X9xOusX96_DGVhS-A@mail.gmail.com>
 <s5h4kivj26x.wl-tiwai@suse.de>
In-Reply-To: <s5h4kivj26x.wl-tiwai@suse.de>
From: Peter Allen <peter.allenm@gmail.com>
Date: Tue, 2 Feb 2021 18:52:57 +0000
Message-ID: <CAHa6N62V2PiZZFNpxELwPgJrxoDOa-6Byw6Oj8xwBrmFRjDzuw@mail.gmail.com>
Subject: Re: Nux Mighty Plug USB - no clock source
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Thank you for taking the time to look at this.
I've tried your latest 5.12 branch, and sure enough it works perfectly
without any problems.
So I'm really happy. Thank you!

Pete

On Mon, 1 Feb 2021, 14:24 Takashi Iwai, <tiwai@suse.de> wrote:

> On Sat, 30 Jan 2021 09:30:50 +0100,
> Peter Allen wrote:
> >
> > I have a NUX Mighty Plug guitar effects which has a USB Audio interface.
> > Unfortunately it doesn't work in Linux, and I'd love to fix it.
> > It gets registered with Alsa, except it ends up without any valid sample
> > rates (by the look of it due to a buggy clock source descriptor).
> >
> > This is on Ubuntu-Studio 20.04 LTS _Focal Fossa with kernel
> > 5.4.0-62-lowlatency
> > on a HP Omen 15 with i5-7300HQ
> >
> > I don't know what I'm doing (but did a little module development rather a
> > long time ago in the 2.2 days :-)) Help is  greatly appreciated.
> >
> > When plugged in I get:
> > [12476.413792] usb 1-1: New USB device found, idVendor=1fc9,
> > idProduct=8260, bcdDevice= 1.00
> > [12476.413797] usb 1-1: New USB device strings: Mfr=1, Product=2,
> > SerialNumber=3
> > [12476.413800] usb 1-1: Product: MIGHTY PLUG USB
> > [12476.413804] usb 1-1: Manufacturer: NUX
> > [12476.413807] usb 1-1: SerialNumber: 2007151403
> > [12476.444988] usb 1-1: __uac_clock_find_source(): selector reported
> > illegal value, id 40, ret 0
> > [12476.444992] usb 1-1: parse_audio_format_rates_v2v3(): unable to find
> > clock source (clock -22)
> > [12476.445413] usb 1-1: __uac_clock_find_source(): selector reported
> > illegal value, id 40, ret 0
> > [12476.445479] usb 1-1: __uac_clock_find_source(): selector reported
> > illegal value, id 40, ret 0
> > [12476.447095] usb 1-1: __uac_clock_find_source(): selector reported
> > illegal value, id 40, ret 0
> > [12476.447098] usb 1-1: parse_audio_format_rates_v2v3(): unable to find
> > clock source (clock -22)
> > [12476.447459] usb 1-1: __uac_clock_find_source(): selector reported
> > illegal value, id 40, ret 0
> > [12476.447684] usb 1-1: __uac_clock_find_source(): selector reported
> > illegal value, id 40, ret 0
> > [12476.450397] usbcore: registered new interface driver snd-usb-audio
>
> This might be covered by the recent fixes for 5.12 kernel, found in
> for-next branch of my sound git tree.
>   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
>
> Also, as both playback and capture streams are ASYNC, those might be
> supposed to be running in the implicit feedback.  With the very latest
> kernel, this can be enabled via implicit_fb=1 module option.  If this
> works better, we can set up a static quirk table entry for the device,
> too.
>
>
> Takashi
>

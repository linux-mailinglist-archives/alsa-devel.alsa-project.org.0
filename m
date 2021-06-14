Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7C03A724F
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 01:05:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15516168C;
	Tue, 15 Jun 2021 01:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15516168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623711959;
	bh=JmsSuDlieADbo+QDhQbqCbM+PNPDveRbyB9Hao4XtpM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yw4GFwVOE54ZSWyVbJOqKdggBJbj90trqK+oIPw3UAsyzG7VSdRRrBt0BJZFMVdQ/
	 qg0g/gqbE6LQCoOlLsLWNUBfaIDh2sNiDAj29EA3ZrCDwWah77nMC/RpCzUokxRA3/
	 iOCvgFhlDG5Ds4QRKLG9+9DrUalxNeGbmZTWOGik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 825AEF8025E;
	Tue, 15 Jun 2021 01:04:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53734F80424; Tue, 15 Jun 2021 01:04:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_29,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4443BF8025E
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 01:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4443BF8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="czG+z7x7"
Received: by mail-qt1-x82c.google.com with SMTP id 93so9844380qtc.10
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 16:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JmsSuDlieADbo+QDhQbqCbM+PNPDveRbyB9Hao4XtpM=;
 b=czG+z7x7kg09lfjHklXE7ygIBearwJ/wTjc8LMUOQpQsXSbV5zkr55NKnRsZ6AyrtQ
 Fahk4VSxr2gGVsJ0N4ACAV7VXE1gbfczJ/j937VbZ60Aa9nNyPmqPwlDYVjalGvVSp1C
 UxJjICgqdG0CM1Vk6juWNmpJn8VrTOJKrEOKVkJqTsNa1igbxznNJ8AKi2eT/b3MDGMK
 2jzJV5tYtAkf0B6iD22t0swtaWVw4f2qHqMUn6wi0pWj+vLwsyN57c91i3OzMuyEAzHi
 su4h7ui1RQ+fGayuP+zGahxcgDCjxhDPqquDjuVNrsinno3fb/9YLWog/5Ns/6+PWYJJ
 AzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JmsSuDlieADbo+QDhQbqCbM+PNPDveRbyB9Hao4XtpM=;
 b=VudSSM9bw0CkkjlqfQc+gsZu8/Wi1tFe4Xznkb4fOSY14z2DZn0cZP3r6Or262Xt7l
 npivZ1q1siFm6tW6+ngByRT9xNJbMB46GYUrM7kgY6+mN4zfV6vIj7Xp8Mk7uI4BjXGx
 5A+q1FtRA6U7d/k75dw7nyTckr9sgQhFv/JIkNf6JIqMAE4myrAJLFuECzW2KZ+sxHYX
 S0BKyjkGiQiW3SDm9Ac7k32De4c4ZZI8u8B9DprlFq+b4E+nEs175V09XvTa29x+axxT
 cF1ZqtEs6BNymKf/aIBRZmkMSqT9dMBwB0VfkvxMnt3sNlg+JCcUYlG1K20eYzTrREU8
 MjKQ==
X-Gm-Message-State: AOAM531tAoVnINbEfE85OBKpIzgEACbYWgMeVFuE2QPLc0M80aLBL/pc
 VClhC5kfXvFcJG7qNvHERrVAdgN+FaLJAVKLNX0=
X-Google-Smtp-Source: ABdhPJyjICcCQd1xiqStNRf3+2mdPRpIMOquY3IVQU2HuVshXYgA4LRtyT1RAmO1PoNh2n8zgzGH9y1qVQGJ/WuUgoQ=
X-Received: by 2002:ac8:1188:: with SMTP id d8mr18492913qtj.218.1623711856226; 
 Mon, 14 Jun 2021 16:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <trinity-60583881-3802-43ab-8ebb-6172dc0508fe-1623648773558@3c-app-gmx-bs57>
In-Reply-To: <trinity-60583881-3802-43ab-8ebb-6172dc0508fe-1623648773558@3c-app-gmx-bs57>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Mon, 14 Jun 2021 19:58:00 -0300
Message-ID: <CAEsQvcvYEoP6=AYOqg2wdA1EchBw83zLSUejnd+YmNwV=Qp8Cg@mail.gmail.com>
Subject: Re: Xone43C: USB communication
To: Roman Muller <klangrausch@wolke7.net>
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

On Mon, Jun 14, 2021 at 2:32 AM Roman Muller <klangrausch@wolke7.net> wrote:
>
> Hello Gerardo, hello all of you,
>
> > Is your capture complete from a software standpoint? i.e. are you
> > starting Serato or Traktor on the VM while doing the usbmon capture?
>
> Not tested yet, I need to get a few items for that and investigate the
> matter! It is complete up to loading the Win10 driver (which has been
> supplied by the manufacturer). Maybe I am lucky and
> this is already sufficient.

I hope you are lucky and there isn't any more magic than what you have
already captured.

So, the process at least theoretically is to put the URB CONTROLs
inside sound/usb/quirks.c and remember that it may be necessary to put
your vendor specs EPs with altsetting etc. inside
sound/usb/quirks-table.h too.

Good luck, Roman!

>
> Have a nice day,
> Roman

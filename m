Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE25DDEBE
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Oct 2019 15:53:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 877681612;
	Sun, 20 Oct 2019 15:52:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 877681612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571579596;
	bh=AgmeEMuw2/W0egIs8gOjUu7SGHeoVdJ6tdwfe+krEPc=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TL6589bKQA8GaHi/RLftFiU76PQxSWiMOPHWdpuFOnjqfrMl7t/z31lUTGuU4a+cd
	 feRDDcgpf7tR/LgdlyM7hXMB0kZMIoOqAUzT0Mx0iYPM4XmgRTtVmdASyETs0isPgu
	 Quo98MK56eZi6Dbe3MXfgSwirNtLH+z1pwJokMAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91869F80367;
	Sun, 20 Oct 2019 15:51:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37710F802FB; Sun, 20 Oct 2019 15:51:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91ED2F80112
 for <alsa-devel@alsa-project.org>; Sun, 20 Oct 2019 15:51:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91ED2F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d8iiUw2F"
Received: by mail-lf1-x141.google.com with SMTP id u16so8008080lfq.3
 for <alsa-devel@alsa-project.org>; Sun, 20 Oct 2019 06:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Y25JSuiA8UMfkm253fDLjiG2SdXjj+kr4PCelU18Qxg=;
 b=d8iiUw2FHn7vqWY29NHPvmL2nCTnx9Q31li61N8kCpiUi0S/hzoKwRqD2EYQDk9T7L
 YbYyl00DNP9MB8/g7pkKr/HcoRG0SkxFKGIPaU5h7/hf3LjIDYTebg4z3pDzQEuD3GmV
 XjtwEppg8DK+2MlY6DlngBghGakZHvkeaAVRHVB22tue3otktp91R9C1DWhKrrApPTgQ
 dPwAD2WtgtYctQjgxdmkhUnA6bjUfiUYjtOOsevJL/As41YeRiQsRw2HnyQdl6HvDgbb
 HTgTWCMKy4smdCJpXbS9nTwdiSm7s77ElaFWOzfIsRuaIKNT6p5oam17hI9aKqLI+qdI
 VL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=Y25JSuiA8UMfkm253fDLjiG2SdXjj+kr4PCelU18Qxg=;
 b=mo7JPL+vVHNEbjidxifPw0BEoBIUu+1iBkB1iy7Llk/4XaHpOOJh6SSJPzyZp8XhjU
 /Bx2dcHMcm9osZ6ICBF4BtzymD4engOkytt2tpsfA4tn6QO2l5+WWcRM0jl83UZuKrSc
 AFE3qwxrejtolAa05QiFJkd7LqkSbMNXcb/vVuK9XP06PGtDHsTYYh1A8J9oh9GedMta
 Y8UocMj7L3AT0HnqFjqzvm6Otbo8RrAj4UEjK8CAUed4DCC1lKuvTt9uHecowYjMRGWa
 3YOt81gtrukkcWA2PPEhETDoHUn6w2vazZOJNjcO9hRamLRt2H6W42ioJ5476uvWMdt8
 P1jA==
X-Gm-Message-State: APjAAAUk8hGgmjxslmCt9ofqIY4aNqAo+JI6CRjnhPKjkTzK+IVDNvW3
 J4sXb+1cEyXA4zQqQqKpFI/z9tLrtH/P3ej3QBQ=
X-Google-Smtp-Source: APXvYqyINv7ThJC7x1L7Q34EZPtKuyR5KyxkL28b1ueCFO8/Xq3eYeXIG7BEj6JX6Ilfz+FcnkbtuFfsdWi3BCeRTdU=
X-Received: by 2002:a19:c207:: with SMTP id l7mr11857982lfc.33.1571579469356; 
 Sun, 20 Oct 2019 06:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAGnrtESNwneRXqKOnp-_gfkPDu11g+-M4s5dOs+pOMD30Wp8uw@mail.gmail.com>
In-Reply-To: <CAGnrtESNwneRXqKOnp-_gfkPDu11g+-M4s5dOs+pOMD30Wp8uw@mail.gmail.com>
From: nick83ola <nick83ola@gmail.com>
Date: Sun, 20 Oct 2019 14:50:58 +0100
Message-ID: <CABPh3UOig4HS5=sKB0bk+wtWJoshTbMGA6L18w14i1QNF6TsxA@mail.gmail.com>
To: Carlo Calica <carlo@calica.com>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Line 6 Helix quirks
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi
I verified on my hx_stomp with the latest driver and I can confirm tha
the quirks works here
Sadly I don't have an helix to verify it

What model it is?
you can try to recompile the kernel adding the line with you usb device to the

see my patch

https://lkml.org/lkml/2019/7/1/850

+ case USB_ID(0x0E41, 0x4244): /* HELIX */
+ case USB_ID(0x0E41, 0x4246): /* HX STOMP */
+ case USB_ID(0x0E41, 0x4248): /* what kind of HELIX ???????? */

Cheers
Nicola Lunghi


On Sat, 19 Oct 2019 at 06:34, Carlo Calica <carlo@calica.com> wrote:
>
> Hi,
>
> I'm attempting to use my Helix with the newish 5.3.x kernel.  It isn't working.  Looks like the quirk isn't enabled for the idProduct (4248) of my Helix.  My Helix's firmware is 2.81.0.  I have yet to compile the kernel to see if adding the id is enough.  Thanks.  If you need any more info, please let me know.
>
> dmesg gives:
>
> [89014.296954] usb 3-2: new high-speed USB device number 2 using xhci_hcd
> [89014.521720] usb 3-2: New USB device found, idVendor=0e41, idProduct=4248, bcdDevice= 2.00
> [89014.521723] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [89014.521724] usb 3-2: Product: HELIX
> [89014.521726] usb 3-2: Manufacturer: LINE 6
> [89014.521727] usb 3-2: SerialNumber:    2796112
> [89014.555715] usb 3-2: parse_audio_format_rates_v2v3(): unable to retrieve number of sample rates (clock 16)
> [89014.559724] usb 3-2: parse_audio_format_rates_v2v3(): unable to retrieve number of sample rates (clock 16)
> [89014.575990] input: LINE 6 HELIX    as /devices/pci0000:00/0000:00:01.3/0000:03:00.2/0000:16:08.0/0000:1c:00.0/usb3/3-2/3-2:1.5/0003:0E41:4248.000C/input/input50
> [89014.628069] hid-generic 0003:0E41:4248.000C: input,hidraw8: USB HID v1.11 Keyboard [LINE 6 HELIX   ] on usb-0000:1c:00.0-2/input5
>
>
> --
> Carlo J. Calica
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

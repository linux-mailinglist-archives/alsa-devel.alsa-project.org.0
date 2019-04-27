Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F02C4B3D1
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 17:09:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5956C862;
	Sat, 27 Apr 2019 17:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5956C862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556377796;
	bh=Px+/CKSN3e58LkPTUNR37Ag8XE+l2tOtUYtWgQqNHtQ=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mX5DvcI0aKhAKs8WN+jKhWqp1zzxow5A1rctxnTo1YcsMhMw234ogi87DByuzIb6r
	 VR/TahZiOlBzUmNntoK9di7xkZg4AOCh/abzto8VbXn4g05cP5okgMcUfAyoka4MU7
	 6Lt5wAPmsT40jVjZPe9+0Mnd9egikmei7W2sHA7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEB17F896DE;
	Sat, 27 Apr 2019 17:08:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6B17F896DB; Sat, 27 Apr 2019 17:08:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B95E8F80CAB
 for <alsa-devel@alsa-project.org>; Sat, 27 Apr 2019 17:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B95E8F80CAB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uQbCvJvd"
Received: by mail-wr1-x441.google.com with SMTP id v16so6310535wrp.1
 for <alsa-devel@alsa-project.org>; Sat, 27 Apr 2019 08:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=LlCxWXbvPdBWiAAFnO6QVL2md/rUBc2G7RnaolnZ3t0=;
 b=uQbCvJvd1HLOX2EGxvx0llhyAZdpNnySYArExraAIN5/qxL213myrbAoxUAPT8raBs
 c1AGRrkbmatxpDN0hu+SwXkublPAjt/c8aP/GfGcYtdcqp27pT5h+AXxnhkKAfnvels/
 U2rHTrcSiHBbcAZR8C5xOifL5lTMhLgo/4ekfwO0gM7pawb+pymWxAe9rRdBlZg2KdBf
 35qFbHKvwFlFeacrVNhZm51NzE6rJWAd/tDs7kPhnYqwvYeRZNUdbsYqM0hOzLPDPypx
 2sk4zQ+AB9tpcZxku/P6a7GT6KWehe3kD6G+JtnAThKVnSFRd5II0a5Leks+3bwL+/W2
 Sdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=LlCxWXbvPdBWiAAFnO6QVL2md/rUBc2G7RnaolnZ3t0=;
 b=N0ijLOECgrXLmRxippsayW9ZFDt2LYQgHFcPdnTSZX5+SZA5Vii4k0dXGMsiVoTrrI
 NOiZ2tEx4rT8s3qWbFlpFWRwr2yvl912rlafDYnctVhadrvlDi2tC5QmiZ06NCNzD3LH
 6r67ekDKAoFBqQqDAiBOf063iLA1mUf/GRLczzpOy1GzabKtgNNqmGJ5nYvXvDuhg++K
 n5nNUfSGIcgdMqa10SZe3joJIOOOy8uXcU4HOmzSGz65aV8ScVuj5SkPN1L8rVqjSrAm
 KzwcvmaH9ZZ2ECb8icEtwc6gdTzaUivs7XAepdBTJZtHoM2YjW6nQJcs9l5B3nQ0SLSr
 SLdA==
X-Gm-Message-State: APjAAAX8HhSopYLAEZTHV5/sXgkpcEdnQZagHOEa9QwvObrQTTYwcdG3
 5KmtHzw58KvxvrecbyyRdGFPBMrsuprlCIhPHHWpcSw65YJl7w==
X-Google-Smtp-Source: APXvYqy/9vTdK6rGxKWWhQqEizGBXHQwkOSJYtA97m5m0NyO3LGn1xDDdo3t5+yJFuMkFoX1qkV/vGNtxWMZFxItE04=
X-Received: by 2002:a5d:62c8:: with SMTP id o8mr8996686wrv.210.1556377683464; 
 Sat, 27 Apr 2019 08:08:03 -0700 (PDT)
MIME-Version: 1.0
From: Petr Nosek <petr.nosek@gmail.com>
Date: Sat, 27 Apr 2019 16:07:51 +0100
Message-ID: <CAAqJ6B_FQK=nPHsxwOq4c0YsoBrxaX7gD0QC0L1T0cUVwcAmTw@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] no sound in laptop ASUS UX362FA - repair
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

Hi,

  I bought laptop ASUS UX362FA:
https://www.asus.com/2-in-1-PCs/ASUS-ZenBook-Flip-13-UX362FA/

  The sound didn't work. I was looking for solution and I found this
article:
https://forum.manjaro.org/t/alc294-analog-audio-card-detected-but-no-sound-internaly-or-headphones/54089/29

  So I added this line into (
https://github.com/torvalds/linux/blob/master/sound/pci/hda/patch_realtek.c
):

  SND_PCI_QUIRK(0x1043, 0x13e1, "ASUS UX362FA", ALC294_FIXUP_ASUS_SPK),

  behind this line: SND_PCI_QUIRK(0x1043, 0x10a1, "ASUS UX391UA",
ALC294_FIXUP_ASUS_SPK)

   And recompile kernel and it works. I'm sending this report for others,
who have the same problem with this laptop version. Please add this repair
to kernel for the others.

  Thank you.

   my hwinfo:

root@zenbook:~$ hwinfo --sound
15: PCI 1f.3: 0403 Audio device
  [Created at pci.378]
  Unique ID: nS1_.jsQALdVXpeB
  SysFS ID: /devices/pci0000:00/0000:00:1f.3
  SysFS BusID: 0000:00:1f.3
  Hardware Class: sound
  Model: "Intel Audio device"
  Vendor: pci 0x8086 "Intel Corporation"
  Device: pci 0x9dc8
  SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
  SubDevice: pci 0x13e1
  Revision: 0x30
  Driver: "snd_hda_intel"
  Driver Modules: "snd_hda_intel"
  Memory Range: 0xb1218000-0xb121bfff (rw,non-prefetchable)
  Memory Range: 0xb1000000-0xb10fffff (rw,non-prefetchable)
  IRQ: 127 (100 events)
  Module Alias: "pci:v00008086d00009DC8sv00001043sd000013E1bc04sc03i80"
  Driver Info #0:
    Driver Status: snd_hda_intel is active
    Driver Activation Cmd: "modprobe snd_hda_intel"
  Driver Info #1:
    Driver Status: snd_soc_skl is active
    Driver Activation Cmd: "modprobe snd_soc_skl"
  Config Status: cfg=new, avail=yes, need=no, active=unknown


For repairing it is neccessary to compile kernel. I'm sending solution for
other and if is it possible, please add it in ubuntu kernel.

I reported bug (and solution) also there:
https://bugzilla.kernel.org/show_bug.cgi?id=203443



additional information:

root@zenbook:~$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description: Ubuntu 18.10
Release: 18.10
Codename: cosmic

root@zenbook:~$ uname -a
Linux zenbook 4.20.10-custom #1 SMP Sat Apr 6 21:21:30 CEST 2019 x86_64
x86_64 x86_64 GNU/Linux

kernel compiled and patched from this source:
https://kernel.ubuntu.com/~kernel-ppa/mainline/v4.20/

and added line:

  SND_PCI_QUIRK(0x1043, 0x13e1, "ASUS UX362FA", ALC294_FIXUP_ASUS_SPK),

into /sound/pci/hda/patch_realtek.c file


Petr
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8402A1CFB30
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 18:45:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC34816CD;
	Tue, 12 May 2020 18:44:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC34816CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589301918;
	bh=aM5qmxgzabgWYNZwKOX5Fo63lOOg5hV66Ppxhqm2ozs=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HpQVO1zcdRAymsCNfFJqGpAyagjovpN8cb5VzRyEyq+3r7L4cUcmxwQWHtrMLCmHV
	 t+qZK6Vz3DxNavfsO10H2f7/dKgwCTVGFrINeDss0UXkCnW3TZpiGHwgNTSOZiv7NR
	 IN5LWeRzAXxFl8489l3E8oujvZdoWEKRS/qzg8f4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0816FF800E3;
	Tue, 12 May 2020 18:43:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46F93F8014C; Tue, 12 May 2020 18:43:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3620EF800AA
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 18:43:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3620EF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ueizuCk9"
Received: by mail-oi1-x236.google.com with SMTP id c124so18571972oib.13
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 09:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=E/GITzgNQWPv3AeU6m1DJUdktJ6XPw1zlBPGKlEVQL8=;
 b=ueizuCk9m2qYVWHMdsAsKopkEKMfyeMrbuoCw2CpR5sMexeqyyA/YNgXOVpivTJnHa
 kjheqKoL5UUAt0h2HcSEstSD2exJmwzHmHcpevAlDgpDrmnmy1EyVC+tSH6SAEk3BXGF
 zbGVPGqOGV1BKvOA7xrCeqbD5M/V27CRC32yFfCiPm+F6f0+Ya+RLa9V8h+IUU1sp35a
 plYJmrQRBndnuN6616+JAOnPrdqb+EGGE0ktqLHFTR7JzggGCgAhGuv8TH4jvxsbjbBC
 BaUDCBdWzmJf7mh7Ri1oYbx+tiptG/VzcIkBMiC/aXo3UeUYfxuUZWY+UE4JtgyrwjBZ
 LONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=E/GITzgNQWPv3AeU6m1DJUdktJ6XPw1zlBPGKlEVQL8=;
 b=j1+Q3EvRGzEfzZ/OGGboStuSCpWyHGhvh1aRSdZnmsBQJYYAPNgmtr5kQ6w7DR0ulJ
 k2fRuncNBzoTVhPQ8Zri7YSR6229bJ3dtDtjaHLOEJr1agGBdiTqFZf3gwUS1cnIAJEs
 28poqNJHjkci0eSQYM/9Wz/7GBbqLXIGbWfXXXqF5s/5qF9zUQq1yZG8yquIW+CmxF7X
 H7+GVOw6K4mM84ENJqFMTGrJw47Ln2qQq6WOCYhniXgKdt+ZV95fTfeDKh52zpp+tw7X
 hsOxwK0xWJRDIrm7eimhi3g0s5j5AyRnjj4zEJJmzI6AIx6sP4+P37rYoBQ6m+T+LXU0
 cuEg==
X-Gm-Message-State: AGi0Pua/5PxvfC9KJPAaw3QkGNqLZeLy3Ps1l4a3R7bF8hEPUNjW811C
 YP+A0nM20OIkZFGfKbI2QHVuBXSgVzqeRG45hIM=
X-Google-Smtp-Source: APiQypLfQLwKNasT5yCOj9dheqgH/S3JlBfwbjJtzQSbgTj650gMD5tsw6B4MZaa/zlC76qnyi8Raj5npPX6cDHTUoA=
X-Received: by 2002:aca:efc5:: with SMTP id n188mr5768724oih.64.1589301802525; 
 Tue, 12 May 2020 09:43:22 -0700 (PDT)
MIME-Version: 1.0
From: Subhashini Rao Beerisetty <subhashbeerisetty@gmail.com>
Date: Tue, 12 May 2020 22:13:10 +0530
Message-ID: <CAPY=qRRFV4SpNO5pb9vF=U95dbA_gN2ngP+vm34884NMk5q8gQ@mail.gmail.com>
Subject: sound over USB
To: kernelnewbies <kernelnewbies@kernelnewbies.org>,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

 Hi all,

In my Linux machine, I connected the plantronics usb headset with mic
and I see(with the help of dmesg) that this device detected.



[116676.507868] usb 2-2: new full-speed USB device number 5 using xhci_hcd
[116676.923445] usb 2-2: New USB device found, idVendor=047f, idProduct=c012
 [116676.927091] usb 2-2: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
 [116676.934252] usb 2-2: Product: Plantronics .Audio 628 USB
 [116676.941445] usb 2-2: Manufacturer: Plantronics
 [116676.945731] usb 2-2: ep 0x84 - rounding interval to 64
microframes, ep desc says 80 microframes
 [116677.078071] hidraw: raw HID events driver (C) Jiri Kosina
 [116677.159669] usbcore: registered new interface driver usbhid
 [116677.161686] usbhid: USB HID core driver
 [116677.175458] input: Plantronics Plantronics .Audio 628 USB as
/devices/pci0000:00/0000:00:14.0/usb2/2-2/2-2:1.3/0003:047F:C012.0001/input/input4
 [116677.234588] plantronics 0003:047F:C012.0001:
input,hiddev0,hidraw0: USB HID v1.00 Device [Plantronics Plantronics
.Audio 628 USB] on usb-0000:00:14.0-2/input3
 [116677.281756] usbcore: registered new interface driver snd-usb-audio

 The following nodes are present in the /dev/snd

$ ls -l /dev/snd/

total 0

drwxr-xr-x 2 root root       60 May 12 11:32 by-id

drwxr-xr-x 2 root root       60 May 12 11:32 by-path

crw-rw---- 1 root audio 116,  2 May 12 11:32 controlC1

crw-rw---- 1 root audio 116,  4 May 12 11:32 pcmC1D0c

crw-rw---- 1 root audio 116,  3 May 12 11:32 pcmC1D0p

crw-rw---- 1 root audio 116,  1 May 12 11:32 seq

crw-rw---- 1 root audio 116, 33 May 12 11:32 timer



What are all these devices present in /dev/snd

How do I use it for playing and recording an audio?

Basically first I want to gain knowledge on set of test cases I can
run on ALSA and then learn ALSA kernel modules stuff including
snd_usb_audio mdule.

So please guide me by providing related documentation/Steps.



Thanks,

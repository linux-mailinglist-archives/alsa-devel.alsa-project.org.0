Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 567014831E8
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jan 2022 15:24:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E9A117E6;
	Mon,  3 Jan 2022 15:23:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E9A117E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641219848;
	bh=rv8LQoIg+fr0DaLCwJIvHkvMmmFMf6ofMbMNMFroOaQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SFoVZFgWCNk6VWT7AQ79a7zkjpkCYZSdtRwkTUsFtq0ITlI4DMoxZd4IypnTk8tDQ
	 eZLfR9COhqwAJqPqYk6hrucQ08QKEN+EnZSYBKxzcQ29Fz+Std0QgZTpDO2SQ59G54
	 vEyj1QBct5/8l3RId+al2EyCYYsKjtpE5xZ31ePo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ACE1F80162;
	Mon,  3 Jan 2022 15:22:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6BEBF80272; Sun,  2 Jan 2022 11:18:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,MIME_HTML_ONLY,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90C5AF8019B
 for <alsa-devel@alsa-project.org>; Sun,  2 Jan 2022 11:18:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90C5AF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="jXM3/Bz3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641118719;
 bh=RX5mjkPTlTNvnM+D+SmL7zKQpbgpq2CjFkiMgv228dE=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=jXM3/Bz3TVe/w7rIYGq+ebyM9toPEqH4B/IKG94wJQQT+IR/zBs92ot61r9kGl9py
 tpyEzwnYY03BRX6r8lXmgjRwmJfOuOhA+S4bjYqTiONk5RUmr0bgF4pxsTMBUKRQCE
 Q9FxjcLcIvpi0fWZksrjAVjXxydod2MdE1V6mcL8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [95.91.248.70] ([95.91.248.70]) by web-mail.gmx.net
 (3c-app-gmx-bap12.server.lan [172.19.172.82]) (via HTTP); Sun, 2 Jan 2022
 11:18:39 +0100
Message-ID: <trinity-3a9517be-3e4a-40ba-aa68-c690f14cac64-1641118719217@3c-app-gmx-bap12>
From: Stefan Sauer <st_kost@gmx.net>
To: alsa-devel@alsa-project.org
Subject: slow snd_rawmidi_drain() for VirMidi devcies
Date: Sun, 2 Jan 2022 11:18:39 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:PHd/3n5lnarOs6xakkhAbrY18deyVm72rJmiezF3/ohLurcdiS3UAD1rtXNQ1+bdrx72p
 2ndarSNeqZlt1JEm/BmNZNWIfyL+nVk5MHArAeMMVfzBBBwHV8HVXbjjEdK2nvw0RLz+aQBicCrP
 Cn8wzaK55E99gOmx4YkVx3WuP1/ZB2hG3AwvpSnuXhS0tOWJ97ViVMH7g4eY/RazGbNl49WPxFnc
 bQ51roIRcDV9N9sjkCTsqR3d1znVIfHI41IF+OynhMoaoSGibDucJN/VM4gpQjSbUH2UQoJ9vWjs
 cA=
X-UI-Out-Filterresults: notjunk:1;V03:K0:GJxR7lgtSNE=:TkQV/dVibPgz+M+41+pZ5U
 r/RsB5hr6HyKB+5R2OfareNAQDZZEZSiaDhT9hcrDszDvNfRBeb6lE2/hsKmLwv9UJsX5UpTx
 na+s5fmMxfNckcgXJu0fMRXxZ7l7E0AjKUOZHdz/Ze7xCTIs2ISWP0qoaSL940l1v5XJ4Fs4y
 x/ukJco1Gr6oHGCbPOHAMbNZ5zQwFZlVtMxCemJtOOu5aDnxfQV7s2FFT9pcrK5zOnqEAviEs
 GDD3IiMqiLMNlaFUfaK16W3oii8198i2bqx2C2694Oc8njslaxOlDVfdfH52lDutSQmidMETZ
 fWAs/xguMSvkaDcV+MhQkEOjWmTa7pjd57wvUMDrdW0tumJb9g+VIyN4hSpgOFKhmH8VACjmg
 bgqZ97eRrkEG1vQPlpAezM7m50L4jyHKFm+C9i4RZnj7sMFHIaV5zpKq66Yxo2H3fFY2DuT0+
 oL78IBBynwf4BRmxu3yEJcx9x9pQwJ2pUX9Hhm1H5GbrxBI7CbJaBHVzZdHc+A2zd2XgVL99c
 IhbPKd8CaYLWSlvRYCu3Z3oftV8TMnNQu2FuImhlhA8OcaORqxWSjFZKY91O+3MrZ9OrMI5aS
 djIhzD0yDPwy7jmdrN9uxH1Q96fZg7PGoIwbAkUmFI3WRe6TYU8ZuTaLz1J8SAh/4ovpnpCU8
 JEfhvnWJd8NUofk3G1QELsBq/6sr1DHF5nD7MBKx8x5XE9gSbfVoqOtpq+jGxv1uNCsx8MdAr
 PNsAsBbi4/+sIwPGcZn25gFhehf+e4t5nnuq15StrR6cAXam8jOwXDt61PkBxqTIoWUXG4D9E
 yj6sjRa
X-Mailman-Approved-At: Mon, 03 Jan 2022 15:22:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

   hi,

   happy new year every one. During the free days I've tried to link
   BitwigStudio to the webapp [1]cables.gl over virmidi. Unfortunately
   Bitwig Studio only supports rawmidi. What I discovered is that there is
   a strange slowness when sending data to virmidi caused
   by snd_rawmidi_drain().

   I've posted two tiny, self-contained c apps
   to: [2]https://gist.github.com/ensonic/c7588b87fa6c1fa94a8f753b1e0aa394
   See some examples below. 2 observations:
   * snd_rawmidi_type() is *not* reporting virmidi as VIRTUAL
   * snd_rawmidi_drain() takes about 60ms! on virtual vs. less that 0.1 ms
   on usb midi (I checked all my hw midi and the worst was avg=1ms on
   physical midi image unitor8)

   When comparing the implementations:
   [3]https://github.com/alsa-project/alsa-lib/blob/master/
   src/rawmidi/rawmidi_virt.c#L173
   [4]https://github.com/alsa-project/alsa-lib/blob/master/
   src/rawmidi/rawmidi_hw.c#L164
   I see that the hw one results in an IOCTL (SNDRV_RAWMIDI_IOCTL_DRAIN)
   which I can see when strac'ing app and I wonder if this is the root
   cause? Why is rawmidi_virt.c not used for virmidi?
   From poking at snd_rawmidi_open_conf() I have not yet figured where
   this is decided ....

   If the IOCTl is the right code path, any idea why it is slow? Is the
   virmidi driver not reporting buffer fill status or something like that?

   Stefan

   > amidi -l
   Dir Device    Name
   IO  hw:0,0,0  Scarlett 18i20 USB MIDI 1
   IO  hw:3,0,0  nanoKEY2 nanoKEY2 _ KEYBOARD
   IO  hw:5,0,0  nanoKONTROL nanoKONTROL _ SLIDE
   IO  hw:10,0    Virtual Raw MIDI (16 subdevices)
   IO  hw:11,0    Virtual Raw MIDI (16 subdevices)

   # using direct i/o to virmidi - all good
   > ./rawmidi_oss /dev/midi11 0
   Using device '/dev/midi11' without draining
   write took min=  0.0015 ms, avg=  0.0016 ms, max=  0.0110 ms
   > ./rawmidi_oss /dev/midi11 1
   Using device '/dev/midi11' with draining
   write took min=  0.0015 ms, avg=  0.0017 ms, max=  0.0101 ms
   drain took min=  0.0001 ms, avg=  0.0001 ms, max=  0.0008 ms

   # using snd_rawmidi to virmidi - slow drain operations
   > ./rawmidi_alsa hw:11,0 0
   Using device 'hw:11,0' without draining
   SND_RAWMIDI_TYPE_HW
   write took min=  0.0010 ms, avg=  0.0011 ms, max=  0.0056 ms
   > ./rawmidi_alsa hw:11,0 1
   Using device 'hw:11,0' with draining
   SND_RAWMIDI_TYPE_HW
   write took min=  0.0016 ms, avg=  0.0040 ms, max=  0.0077 ms
   drain took min= 55.9951 ms, avg= 60.4330 ms, max= 64.0653 ms

   # using snd_rawmidi to usb hw - all good
   > ./rawmidi_alsa hw:3,0 0
   Using device 'hw:3,0' without draining
   SND_RAWMIDI_TYPE_HW
   write took min=  0.0012 ms, avg=  0.0015 ms, max=  0.0121 ms
   > ./rawmidi_alsa hw:3,0 1
   Using device 'hw:3,0' with draining
   SND_RAWMIDI_TYPE_HW
   write took min=  0.0024 ms, avg=  0.0032 ms, max=  0.0110 ms
   drain took min=  0.0293 ms, avg=  0.0636 ms, max=  0.2277 ms

References

   1. http://cables.gl/
   2. https://gist.github.com/ensonic/c7588b87fa6c1fa94a8f753b1e0aa394
   3. https://github.com/alsa-project/alsa-lib/blob/master/src/rawmidi/rawmidi_virt.c#L173
   4. https://github.com/alsa-project/alsa-lib/blob/master/src/rawmidi/rawmidi_hw.c#L164

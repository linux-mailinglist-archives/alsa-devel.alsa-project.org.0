Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 218BB2FA19A
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 14:31:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC222182D;
	Mon, 18 Jan 2021 14:30:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC222182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610976707;
	bh=ZkxygADRUngb/boknWq/sIAMiADm+lQrxmWOmLaIDj8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=itA7TR07OKee0P31fo044tp768Dx81VG0bZifOCitNaQGBOlhpa4POgfCdC7mEVRN
	 Ce4LluG+k87Vs02CkXTzl2DL51NfA2Baoxs+Lppt+XRMI/g/Tykywkk4sfGFw3zqfI
	 l1E6wveNpRwL/rUD6zXTO27oJ0N+qB44I9Ruayqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 429DDF800C0;
	Mon, 18 Jan 2021 14:30:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC2EEF8016E; Mon, 18 Jan 2021 14:30:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from posta.frantovo.cz (czf.frantovo.cz [91.219.244.97])
 (using TLSv1.1 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B188F80137
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 14:30:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B188F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=frantovo.cz header.i=@frantovo.cz
 header.b="oBfyhXYw"
Received: from [192.168.1.4] (osma.doma.frantovo.cz [192.168.1.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: fiki@frantovo.cz)
 by posta.frantovo.cz (Postfix) with ESMTPSA id 1268F1AA384;
 Mon, 18 Jan 2021 14:28:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=frantovo.cz;
 s=default; t=1610976514;
 bh=ZkxygADRUngb/boknWq/sIAMiADm+lQrxmWOmLaIDj8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=oBfyhXYwZ65QsjFa9m39IM2dkpG1RJVHnfJJAIxvg3676TGu7kCjbC2rXk6NEygE1
 UN2H2FIUyZ1zOWUeKYjKHHS9ZnQGMDrlryCgji/wzGNWVwsRUrlm+0TsN2GZen9CeC
 SjY2wTLxiA/f24Gc3njAzufv1uRd+1cK2NQGOABs=
Subject: Re: [PATCH 0/3] ALSA: usb-audio: Yet more fixes for Pioneer devices
To: alsa-devel@alsa-project.org
References: <20210118075816.25068-1-tiwai@suse.de>
From: =?UTF-8?B?RnJhbnRpxaFlayBLdcSNZXJh?= <konference@frantovo.cz>
Autocrypt: addr=konference@frantovo.cz; prefer-encrypt=mutual; keydata=
 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
 hW6mcblB0mov13r3UFNF1TB7
Message-ID: <fd4467c9-0df4-2362-bebb-c1eaede62586@frantovo.cz>
Date: Mon, 18 Jan 2021 14:29:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210118075816.25068-1-tiwai@suse.de>
Content-Type: multipart/mixed; boundary="------------01166718F99A901023E32D72"
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.98.1 at posta
X-Virus-Status: Clean
Cc: Takashi Iwai <tiwai@suse.de>, Geraldo <geraldogabriel@gmail.com>
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

This is a multi-part message in MIME format.
--------------01166718F99A901023E32D72
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dne 18. 01. 21 v 8:58 Takashi Iwai napsal(a):
> the Pioneer UAC1 devices still didn't work with the recent changes,
> and after debugging sessions, a few issues were discovered.  Below are
> the patches to cover those errors.

I have compiled and tested version 532a208ad610 (Avoid implicit feedback =
on Pioneer devices)

and can confirm that Pioneer DJ DJM-250MK2 works again (playback, recordi=
ng =E2=80=93 tested through JACK in duplex mode).

Thanks,

Franta


--------------01166718F99A901023E32D72
Content-Type: text/x-log; charset=UTF-8;
 name="kern_532a208ad610_jack_duplex.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="kern_532a208ad610_jack_duplex.log"

Jan 18 14:11:49 antracit kernel: [ 3168.116208] usb 1-3: new high-speed U=
SB device number 2 using ehci-pci
Jan 18 14:11:49 antracit kernel: [ 3168.272980] usb 1-3: New USB device f=
ound, idVendor=3D2b73, idProduct=3D0017, bcdDevice=3D 1.06
Jan 18 14:11:49 antracit kernel: [ 3168.272991] usb 1-3: New USB device s=
trings: Mfr=3D1, Product=3D2, SerialNumber=3D0
Jan 18 14:11:49 antracit kernel: [ 3168.272997] usb 1-3: Product: DJM-250=
MK2
Jan 18 14:11:49 antracit kernel: [ 3168.273001] usb 1-3: Manufacturer: Pi=
oneer DJ Corporation
Jan 18 14:11:49 antracit kernel: [ 3168.276464] hid-generic 0003:2B73:001=
7.0004: hiddev0,hidraw3: USB HID v1.11 Device [Pioneer DJ Corporation DJM=
-250MK2] on usb-0000:00:12.2-3/input3
Jan 18 14:11:49 antracit kernel: [ 3168.296965] mc: Linux media interface=
: v0.10
Jan 18 14:11:49 antracit kernel: [ 3168.305100] usb 1-3: Creating new dat=
a endpoint #1
Jan 18 14:11:49 antracit kernel: [ 3168.305216] usb 1-3: 0:1 Set sample r=
ate 48000, clock 0
Jan 18 14:11:49 antracit kernel: [ 3168.305219] usb 1-3: 0:1: found sync_=
ep=3D0x82, iface=3D0, alt=3D1, implicit_fb=3D0
Jan 18 14:11:49 antracit kernel: [ 3168.305224] usb 1-3: Creating new dat=
a endpoint #82
Jan 18 14:11:49 antracit kernel: [ 3168.305340] usb 1-3: 0:1 Set sample r=
ate 48000, clock 0
Jan 18 14:11:49 antracit kernel: [ 3168.306796] usbcore: registered new i=
nterface driver snd-usb-audio
Jan 18 14:11:49 antracit kernel: [ 3168.358262] usb 1-3: Open EP 0x1, ifa=
ce=3D0:1, idx=3D0
Jan 18 14:11:49 antracit kernel: [ 3168.358268] usb 1-3:   channels=3D8, =
rate=3D48000, format=3DS24_3LE, period_bytes=3D28776, periods=3D4, implic=
it_fb=3D0
Jan 18 14:11:49 antracit kernel: [ 3168.358272] usb 1-3: Setting usb inte=
rface 0:0 for EP 0x1
Jan 18 14:11:49 antracit kernel: [ 3168.358660] usb 1-3: Setting usb inte=
rface 0:1 for EP 0x1
Jan 18 14:11:49 antracit kernel: [ 3168.358872] usb 1-3: 0:1 Set sample r=
ate 48000, clock 0
Jan 18 14:11:49 antracit kernel: [ 3168.358876] usb 1-3: Setting params f=
or data EP 0x1, pipe 0x8200
Jan 18 14:11:49 antracit kernel: [ 3168.358886] usb 1-3: Set up 3 URBS, r=
et=3D0
Jan 18 14:11:49 antracit kernel: [ 3168.358939] usb 1-3: Starting data EP=
 0x1 (running 0)
Jan 18 14:11:49 antracit kernel: [ 3168.358973] usb 1-3: 3 URBs submitted=
 for EP 0x1
Jan 18 14:11:49 antracit kernel: [ 3168.359576] usb 1-3: Stopping data EP=
 0x1 (running 1)
Jan 18 14:11:49 antracit kernel: [ 3168.362140] usb 1-3: Open EP 0x82, if=
ace=3D0:1, idx=3D1
Jan 18 14:11:49 antracit kernel: [ 3168.362144] usb 1-3:   channels=3D8, =
rate=3D48000, format=3DS24_3LE, period_bytes=3D28776, periods=3D4, implic=
it_fb=3D0
Jan 18 14:11:49 antracit kernel: [ 3168.362147] usb 1-3: Reopened EP 0x82=
 (count 1)
Jan 18 14:11:49 antracit kernel: [ 3168.362149] usb 1-3: 0:1 Set sample r=
ate 48000, clock 0
Jan 18 14:11:49 antracit kernel: [ 3168.362152] usb 1-3: Setting params f=
or data EP 0x82, pipe 0x10280
Jan 18 14:11:49 antracit kernel: [ 3168.362171] usb 1-3: Set up 12 URBS, =
ret=3D0
Jan 18 14:11:49 antracit kernel: [ 3168.362292] usb 1-3: Closing EP 0x82 =
(count 2)
Jan 18 14:11:49 antracit kernel: [ 3168.362295] usb 1-3: Closing EP 0x82 =
(count 1)
Jan 18 14:11:49 antracit kernel: [ 3168.362296] usb 1-3: EP 0x82 closed
Jan 18 14:11:49 antracit kernel: [ 3168.363756] usb 1-3: Open EP 0x82, if=
ace=3D0:1, idx=3D1
Jan 18 14:11:49 antracit kernel: [ 3168.363760] usb 1-3:   channels=3D8, =
rate=3D48000, format=3DS24_3LE, period_bytes=3D524280, periods=3D2, impli=
cit_fb=3D0
Jan 18 14:11:49 antracit kernel: [ 3168.363763] usb 1-3: Reopened EP 0x82=
 (count 1)
Jan 18 14:11:49 antracit kernel: [ 3168.363765] usb 1-3: 0:1 Set sample r=
ate 48000, clock 0
Jan 18 14:11:49 antracit kernel: [ 3168.363769] usb 1-3: Setting params f=
or data EP 0x82, pipe 0x10280
Jan 18 14:11:49 antracit kernel: [ 3168.363773] usb 1-3: Set up 12 URBS, =
ret=3D0
Jan 18 14:11:49 antracit kernel: [ 3168.369529] usb 1-3: Starting data EP=
 0x82 (running 0)
Jan 18 14:11:49 antracit kernel: [ 3168.369585] usb 1-3: 12 URBs submitte=
d for EP 0x82
Jan 18 14:11:49 antracit kernel: [ 3168.369591] usb 1-3: Starting data EP=
 0x82 (running 1)
Jan 18 14:11:49 antracit kernel: [ 3168.369597] usb 1-3: 0:1 Start Captur=
e PCM
Jan 18 14:11:49 antracit kernel: [ 3168.380281] usb 1-3: Closing EP 0x1 (=
count 1)
Jan 18 14:11:49 antracit kernel: [ 3168.380297] usb 1-3: EP 0x1 closed
Jan 18 14:11:54 antracit kernel: [ 3173.375555] usb 1-3: Stopping data EP=
 0x82 (running 2)
Jan 18 14:11:54 antracit kernel: [ 3173.375567] usb 1-3: Stopping data EP=
 0x82 (running 1)
Jan 18 14:11:54 antracit kernel: [ 3173.375582] usb 1-3: 0:1 Stop Capture=
 PCM
Jan 18 14:11:54 antracit kernel: [ 3173.388009] usb 1-3: Closing EP 0x82 =
(count 2)
Jan 18 14:11:54 antracit kernel: [ 3173.388019] usb 1-3: Closing EP 0x82 =
(count 1)
Jan 18 14:11:54 antracit kernel: [ 3173.388025] usb 1-3: Setting usb inte=
rface 0:0 for EP 0x82
Jan 18 14:11:54 antracit kernel: [ 3173.388273] usb 1-3: EP 0x82 closed
Jan 18 14:12:03 antracit kernel: [ 3181.925328] usb 1-3: Open EP 0x82, if=
ace=3D0:1, idx=3D1
Jan 18 14:12:03 antracit kernel: [ 3181.925335] usb 1-3:   channels=3D8, =
rate=3D48000, format=3DS24_3LE, period_bytes=3D24576, periods=3D2, implic=
it_fb=3D0
Jan 18 14:12:03 antracit kernel: [ 3181.925339] usb 1-3: Reopened EP 0x82=
 (count 1)
Jan 18 14:12:03 antracit kernel: [ 3181.925341] usb 1-3: Setting usb inte=
rface 0:0 for EP 0x82
Jan 18 14:12:03 antracit kernel: [ 3181.925435] usb 1-3: Setting usb inte=
rface 0:1 for EP 0x82
Jan 18 14:12:03 antracit kernel: [ 3181.925578] usb 1-3: 0:1 Set sample r=
ate 48000, clock 0
Jan 18 14:12:03 antracit kernel: [ 3181.925587] usb 1-3: Setting params f=
or data EP 0x82, pipe 0x10280
Jan 18 14:12:03 antracit kernel: [ 3181.925592] usb 1-3: Set up 12 URBS, =
ret=3D0
Jan 18 14:12:03 antracit kernel: [ 3181.925665] usb 1-3: Open EP 0x1, ifa=
ce=3D0:1, idx=3D0
Jan 18 14:12:03 antracit kernel: [ 3181.925668] usb 1-3:   channels=3D8, =
rate=3D48000, format=3DS24_3LE, period_bytes=3D24576, periods=3D2, implic=
it_fb=3D0
Jan 18 14:12:03 antracit kernel: [ 3181.925670] usb 1-3: 0:1 Set sample r=
ate 48000, clock 0
Jan 18 14:12:03 antracit kernel: [ 3181.925676] usb 1-3: Setting params f=
or data EP 0x1, pipe 0x8200
Jan 18 14:12:03 antracit kernel: [ 3181.925686] usb 1-3: Set up 3 URBS, r=
et=3D0
Jan 18 14:12:03 antracit kernel: [ 3181.925706] usb 1-3: Starting data EP=
 0x1 (running 0)
Jan 18 14:12:03 antracit kernel: [ 3181.925740] usb 1-3: 3 URBs submitted=
 for EP 0x1
Jan 18 14:12:03 antracit kernel: [ 3181.926306] usb 1-3: Starting data EP=
 0x82 (running 0)
Jan 18 14:12:03 antracit kernel: [ 3181.926326] usb 1-3: 12 URBs submitte=
d for EP 0x82
Jan 18 14:12:03 antracit kernel: [ 3181.926328] usb 1-3: Starting data EP=
 0x82 (running 1)
Jan 18 14:12:03 antracit kernel: [ 3181.926331] usb 1-3: 0:1 Start Captur=
e PCM
Jan 18 14:12:03 antracit kernel: [ 3181.926333] usb 1-3: 0:1 Start Playba=
ck PCM
Jan 18 14:15:02 antracit kernel: [ 3361.231486] usb 1-3: Stopping data EP=
 0x82 (running 2)
Jan 18 14:15:02 antracit kernel: [ 3361.231495] usb 1-3: Stopping data EP=
 0x82 (running 1)
Jan 18 14:15:02 antracit kernel: [ 3361.231502] usb 1-3: 0:1 Stop Capture=
 PCM
Jan 18 14:15:02 antracit kernel: [ 3361.231505] usb 1-3: Stopping data EP=
 0x1 (running 1)
Jan 18 14:15:02 antracit kernel: [ 3361.231509] usb 1-3: 0:1 Stop Playbac=
k PCM
Jan 18 14:15:02 antracit kernel: [ 3361.244756] usb 1-3: Starting data EP=
 0x1 (running 0)
Jan 18 14:15:02 antracit kernel: [ 3361.244819] usb 1-3: 3 URBs submitted=
 for EP 0x1
Jan 18 14:15:02 antracit kernel: [ 3361.245080] usb 1-3: Starting data EP=
 0x82 (running 0)
Jan 18 14:15:02 antracit kernel: [ 3361.245118] usb 1-3: 12 URBs submitte=
d for EP 0x82
Jan 18 14:15:02 antracit kernel: [ 3361.245123] usb 1-3: Starting data EP=
 0x82 (running 1)
Jan 18 14:15:02 antracit kernel: [ 3361.245128] usb 1-3: 0:1 Start Captur=
e PCM
Jan 18 14:15:02 antracit kernel: [ 3361.245133] usb 1-3: 0:1 Start Playba=
ck PCM
Jan 18 14:16:38 antracit kernel: [ 3457.437255] radeon_dp_aux_transfer_na=
tive: 74 callbacks suppressed
Jan 18 14:17:03 antracit kernel: [ 3481.969901] usb 1-3: Stopping data EP=
 0x82 (running 2)
Jan 18 14:17:03 antracit kernel: [ 3481.969913] usb 1-3: Stopping data EP=
 0x82 (running 1)
Jan 18 14:17:03 antracit kernel: [ 3481.969925] usb 1-3: 0:1 Stop Capture=
 PCM
Jan 18 14:17:03 antracit kernel: [ 3481.969930] usb 1-3: Stopping data EP=
 0x1 (running 1)
Jan 18 14:17:03 antracit kernel: [ 3481.969937] usb 1-3: 0:1 Stop Playbac=
k PCM
Jan 18 14:17:03 antracit kernel: [ 3481.980063] usb 1-3: Closing EP 0x82 =
(count 2)
Jan 18 14:17:03 antracit kernel: [ 3481.980075] usb 1-3: Closing EP 0x82 =
(count 1)
Jan 18 14:17:03 antracit kernel: [ 3481.980080] usb 1-3: EP 0x82 closed
Jan 18 14:17:03 antracit kernel: [ 3481.988076] usb 1-3: Closing EP 0x1 (=
count 1)
Jan 18 14:17:03 antracit kernel: [ 3481.988087] usb 1-3: Setting usb inte=
rface 0:0 for EP 0x1
Jan 18 14:17:03 antracit kernel: [ 3481.988295] usb 1-3: EP 0x1 closed

--------------01166718F99A901023E32D72--

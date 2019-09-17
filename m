Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 769CAB4BDB
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 12:21:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3045166F;
	Tue, 17 Sep 2019 12:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3045166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568715670;
	bh=IOGOztodXCUrwbrCdkjo7czGRosGkW2Q42S5k84swKQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m50gOqdP5U0Y5A+xVkzsZ7dP1JVpV/R9pVzC5GoCoso1Rkl82f9ee0JGzejND8Mi7
	 BZ1o5KTdPfvub6yiUtGc/L6nqDZc+KxUjvTsDnS+YslNTqvbhQQrZ4nYKTxcvI5KVo
	 Mmd8FB1u3mPzhGxKu82iYF57gEyhAmV6dsMDmXko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44919F8048E;
	Tue, 17 Sep 2019 12:19:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E576F80361; Tue, 17 Sep 2019 12:19:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ironboyv.h-da.de (ironboyv.h-da.de [141.100.10.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 566ACF801DA
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 12:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 566ACF801DA
IronPort-SDR: N4AQGPOW49wI4A8ODo6l/vLWY58q99bGNETWSTiHjD7dtgeY3iWo82WnlNLwUJgPjtSAfU45n+
 tMLGkqCKfk9uJg/EXQkJt7uuHaaAXmeYFnKYP8ljNp14np7Kxn34rxz1A9GAfBbns/QkO0Yw8F
 bMFFRUAylkANEzsnptNdNYBZjxIs36tFXuVHMqJpx58RrhWM9+vA9UalfeLYndolniKFGEeS/j
 bb2Mn2fOSjDq8l/mMKM62afmwuclf+HTEqC+iKssiwur/F3jsz67CZ+Xaz7f/d74Eay6oKe68g
 aL8=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2GcCgDrsoBd/2soZI1lGgEBAQEBAgE?=
 =?us-ascii?q?BAQEHAgEBAQGBZwKBZy9tA1AgEiqEIYNKiz9QAQEBBoE2g2yXLwkBAQEtEAE?=
 =?us-ascii?q?BAoECgzsCgnMjOBMCAwkBAQUBAQEBAQUEAgJphGtDDEIWAYJsagEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBAQEBFgINJj0BAQEBAgEaAQgEUhALDQEEBgICJgICSQ4GDQg?=
 =?us-ascii?q?BAReDBwGBdgUTrTh/MxoCg16GVIEMKAGLdxh4gQeBESeCPS4+hAMlHCyCX4J?=
 =?us-ascii?q?YBIxgChYch3obQ4EylUmBRWeHBY12IYI1i0AFFAMQinmWFo0AhgkigVhNJBQ?=
 =?us-ascii?q?7gmwJgkIDF4hjgT2EBD4zjSeDTwEB?=
X-IPAS-Result: =?us-ascii?q?A2GcCgDrsoBd/2soZI1lGgEBAQEBAgEBAQEHAgEBAQGBZ?=
 =?us-ascii?q?wKBZy9tA1AgEiqEIYNKiz9QAQEBBoE2g2yXLwkBAQEtEAEBAoECgzsCgnMjO?=
 =?us-ascii?q?BMCAwkBAQUBAQEBAQUEAgJphGtDDEIWAYJsagEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBFgINJj0BAQEBAgEaAQgEUhALDQEEBgICJgICSQ4GDQgBAReDBwGBdgUTr?=
 =?us-ascii?q?Th/MxoCg16GVIEMKAGLdxh4gQeBESeCPS4+hAMlHCyCX4JYBIxgChYch3obQ?=
 =?us-ascii?q?4EylUmBRWeHBY12IYI1i0AFFAMQinmWFo0AhgkigVhNJBQ7gmwJgkIDF4hjg?=
 =?us-ascii?q?T2EBD4zjSeDTwEB?=
Received: from unknown (HELO mail.fbihome.de) ([141.100.40.107])
 by ironboyv.h-da.de with ESMTP; 17 Sep 2019 12:19:03 +0200
Received: from [192.168.2.102] (p5B157B5B.dip0.t-ipconnect.de [91.21.123.91])
 by mail.fbihome.de (Postfix) with ESMTPSA id F35C742201;
 Tue, 17 Sep 2019 12:19:01 +0200 (CEST)
To: Takashi Iwai <tiwai@suse.de>
References: <8f4f9b20-0aeb-f8f1-c02f-fd53c09679f1@fbihome.de>
 <s5hd0fzykgp.wl-tiwai@suse.de>
From: Jan-Marek Glogowski <glogow@fbihome.de>
Openpgp: preference=signencrypt
Autocrypt: addr=glogow@fbihome.de; prefer-encrypt=mutual; keydata=
 mQGiBEDrcVsRBACdQcj/8k2CSP+5frReJ2y7AAs4+3nBKPg08yOAsdcyQJAPbRGO8r1wJ6lb
 fnJI8+y8uvmsdQ83P4262EqpShHCpI7ioPUopkAKW5dWp/NM+YjYK0m3kMI03HlHeHKAMjyc
 pUmFu0sHktbDwrDUxTksgkcRHU1bbcyVuR7yaPbpdwCgoUn/Fthp7RItKuCLktKop6BcQbsE
 AIXM5gjo5C6l7I2tXFuO1+4boEwmL2WnGFEawFB4gBaBBJ6zUHzikdZW/5WHCUalSKRd38Bi
 PW2buoftYwIjuoRj30+YEVZ/2/oZsREcIazUeZzXaP2Emr/2rRNugj5KDPfgh6v6F9+Ravkw
 z6Bixv1lti7DoP32c7oDwggJEH6LA/0UVRt4RL3gO5Dcz+KIwOVrviZCKYB6/XSMfoAUDwne
 KhnYeQCB2ylV4O/bMrHz3dkNKHfgZ6SbMFJdAmCD1Vey0819jsh/CLCz9vp2wr5IzpTanL7y
 XYjj9R/qpDaW00LZF3+Maqavi3JKAi7K0CjnbcVfV65Rm/Qs1cfrsKQTf7QnSmFuLU1hcmVr
 IEdsb2dvd3NraSA8Z2xvZ293QGZiaWhvbWUuZGU+iFsEExECABsFAkDrcVsGCwkIBwMCAxUC
 AwMWAgECHgECF4AACgkQj6MK58wZA3cK/gCfb8IUFtgcxPSuAH1w8hn4C5WuSsUAn1P1Amys
 nLextO0t3xDDrFWO3PFhuQENBEDrcV0QBADpsD+yR9/1FEKKDGq7Q+jyz7or/SEwuCG/kHk3
 G+ynZYQzFEQ0cWBw0QFzNUNnwVAvG22M0UDjBn8v7BBH0ZtlrqVRUx++6uVv5dlj1uuBp1gp
 cpAHSQgmcXxN4xYSwdJ7fPbMeAkf+8IZc99xG2geF3uZNwzPxVFBHhP7zIZqIwADBQP8D5PU
 ZfoGLr3lDFqhoj6Z6sz9wrqWBC0+zjFcCBaoK4C9x7wxIyBJVRe+yhucLlxQt+LrrU9uQjlT
 YeHqkIL96Xp3KN4y2pr98bzMEF6uIifTEpZs+D+Jq1VvUiJiVUnw0EuCTzmds7tm9CMkOXcH
 hs7GRsJSHXRSWqsXZUec3muIRgQYEQIABgUCQOtxXQAKCRCPowrnzBkDd02+AJ0caVX6EEut
 2yzgPx9/lndIHGYlhgCfXy/f9ENFxfAxMlLXjTvDUe9qye8=
Message-ID: <ce259b27-3fe7-c97a-0b7a-1d2a782e63c2@fbihome.de>
Date: Tue, 17 Sep 2019 12:18:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <s5hd0fzykgp.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Hui Wang <hui.wang@canonical.com>, Jian-Hong Pan <jian-hong@endlessm.com>,
 alsa-devel@alsa-project.org, Chris Chiu <chiu@endlessm.com>,
 Daniel Drake <drake@endlessm.com>
Subject: Re: [alsa-devel] RfC / [PATCH] Jack sense support for Medion E4254
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



Am 16.09.19 um 23:55 schrieb Takashi Iwai:
> On Mon, 16 Sep 2019 10:38:07 +0200,
> Jan-Marek Glogowski wrote:
>>
>> I recently bought the laptop. It has one jack for attaching a headset. Jack
>> sense is announced by the HDA config but not working. Except for some
>> positioning, and color information, the PIN config seemed to be sensible, and
>> everything I tried to override, didn't result in a working jack.
>>
>> Manually unmuting the jack using hda-analyser resulted in working output, so
>> generally the config seemed to work.
>>
>> Reading the patch-realtek code, if found ALC256_FIXUP_ASUS_HEADSET_MODE, which
>> somehow changed the pin 0x19 to be associated with the 0x21 headset out pin,
>> resulting in this dmesg change:
>>
>> -snd_hda_codec_realtek hdaudioC0D0:      Mic=0x19
>> +snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=0x19
> 
> What are the initial pin config values for these?

$ cat /sys/class/sound/hwC0D0/init_pin_configs
0x12 0x90a60130
0x13 0x40000000
0x14 0x90170110
0x18 0x411111f0
0x19 0x02a19040
0x1a 0x411111f0
0x1b 0x411111f0
0x1d 0x4067b945
0x1e 0x411111f0
0x21 0x02214020

>> And for whatever reason jack sense is now working, at least for some normal
>> output-only headset (currently I don't have one included a mic with me, so
>> actually can't test that mic volume works correctly).
>>
>> I was just wondering, if my pin values are actually correct, because they still
>> define different association, as I understand it, but the ASUS fix even works
>> with these wrong channels /associations 2 and 4.
>>
>> So the attached patch works for me, but I'm still wondering, if this is the
>> correct solution. FWIW, jack sense works fine in Windows.
>>
>> Anything I might be missing here?
> 
> I don't think anything wrong here, as long as your quirk actually
> works.  I can double-check if I get alsa-info.sh output (run with
> --no-upload option) with hda-emu, too.

I've tested this just with the 4.19 kernel used by Debian buster with the
patched realtek module build as a DKMS package. That kernel code is 4.19.67.
Then I just moved the code to the right position in the current master kernel.
It works for me.

I tried to compile hda-emu, but already the first file in the kernel dir fails
hard with some missing functions. I used alsa-info.sh with --no-upload, but the
output starts with upload=true?! I attached the log.

HTH

Jan-Marek

--------

upload=true&script=true&cardinfo=
!!################################
!!ALSA Information Script v 0.4.64
!!################################

!!Script ran on: Tue Sep 17 10:15:15 UTC 2019


!!Linux Distribution
!!------------------

Debian GNU/Linux 10 \n \l PRETTY_NAME="Debian GNU/Linux 10 (buster)"
NAME="Debian GNU/Linux" ID=debian HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"


!!DMI Information
!!---------------

Manufacturer:      MEDION
Product Name:      E4254 MD62100
Product Version:   Default string
Firmware Version:  GeminiLake_NS14G_V1.0.28
Board Vendor:      MEDION
Board Name:        NS14G


!!ACPI Device Status Information
!!---------------

/sys/bus/acpi/devices/ACPI0003:00/status 	 15
/sys/bus/acpi/devices/ELAN8D02:00/status 	 15
/sys/bus/acpi/devices/HTIX5288:00/status 	 15
/sys/bus/acpi/devices/INT33A1:00/status 	 15
/sys/bus/acpi/devices/INT33D5:00/status 	 15
/sys/bus/acpi/devices/INT3400:00/status 	 15
/sys/bus/acpi/devices/INT3403:04/status 	 15
/sys/bus/acpi/devices/INT3453:00/status 	 15
/sys/bus/acpi/devices/INT3453:01/status 	 15
/sys/bus/acpi/devices/INT3453:02/status 	 15
/sys/bus/acpi/devices/INT3453:03/status 	 15
/sys/bus/acpi/devices/LNXPOWER:02/status 	 1
/sys/bus/acpi/devices/LNXPOWER:03/status 	 1
/sys/bus/acpi/devices/LNXPOWER:04/status 	 1
/sys/bus/acpi/devices/LNXPOWER:05/status 	 1
/sys/bus/acpi/devices/LNXPOWER:06/status 	 1
/sys/bus/acpi/devices/LNXPOWER:07/status 	 1
/sys/bus/acpi/devices/LNXPOWER:08/status 	 1
/sys/bus/acpi/devices/LNXPOWER:09/status 	 1
/sys/bus/acpi/devices/LNXPOWER:0a/status 	 1
/sys/bus/acpi/devices/LNXPOWER:0b/status 	 1
/sys/bus/acpi/devices/LNXPOWER:0c/status 	 1
/sys/bus/acpi/devices/LNXPOWER:0d/status 	 1
/sys/bus/acpi/devices/LNXPOWER:0e/status 	 1
/sys/bus/acpi/devices/LNXPOWER:0f/status 	 1
/sys/bus/acpi/devices/LNXPOWER:10/status 	 1
/sys/bus/acpi/devices/LNXPOWER:11/status 	 1
/sys/bus/acpi/devices/LNXPOWER:13/status 	 1
/sys/bus/acpi/devices/LNXPOWER:15/status 	 1
/sys/bus/acpi/devices/LNXPOWER:17/status 	 1
/sys/bus/acpi/devices/LNXPOWER:18/status 	 1
/sys/bus/acpi/devices/LNXPOWER:1a/status 	 15
/sys/bus/acpi/devices/MSFT0001:00/status 	 15
/sys/bus/acpi/devices/MSFT0101:00/status 	 15
/sys/bus/acpi/devices/PNP0103:00/status 	 15
/sys/bus/acpi/devices/PNP0C09:00/status 	 15
/sys/bus/acpi/devices/PNP0C0A:00/status 	 31
/sys/bus/acpi/devices/PNP0C0C:00/status 	 15
/sys/bus/acpi/devices/PNP0C0D:00/status 	 15
/sys/bus/acpi/devices/PNP0C0F:00/status 	 11
/sys/bus/acpi/devices/PNP0C0F:01/status 	 11
/sys/bus/acpi/devices/PNP0C0F:02/status 	 11
/sys/bus/acpi/devices/PNP0C0F:03/status 	 11
/sys/bus/acpi/devices/PNP0C0F:04/status 	 11
/sys/bus/acpi/devices/PNP0C0F:05/status 	 11
/sys/bus/acpi/devices/PNP0C0F:06/status 	 11
/sys/bus/acpi/devices/PNP0C0F:07/status 	 11
/sys/bus/acpi/devices/device:01/status 	 15
/sys/bus/acpi/devices/device:09/status 	 15
/sys/bus/acpi/devices/device:0a/status 	 15
/sys/bus/acpi/devices/device:0d/status 	 15
/sys/bus/acpi/devices/device:1b/status 	 15
/sys/bus/acpi/devices/device:46/status 	 15


!!Kernel Information
!!------------------

Kernel release:    4.19.0-6-amd64
Operating System:  GNU/Linux
Architecture:      x86_64
Processor:         unknown
SMP Enabled:       Yes


!!ALSA Version
!!------------

Driver version:     k4.19.0-6-amd64
Library version:    1.1.8
Utilities version:  1.1.8


!!Loaded ALSA modules
!!-------------------

snd_hda_intel


!!Sound Servers on this system
!!----------------------------

Pulseaudio:
      Installed - Yes (/usr/bin/pulseaudio)
      Running - Yes


!!Soundcards recognised by ALSA
!!-----------------------------

 0 [PCH            ]: HDA-Intel - HDA Intel PCH
                      HDA Intel PCH at 0xa1110000 irq 133


!!PCI Soundcards installed in the system
!!--------------------------------------

00:0e.0 Audio device: Intel Corporation Device 3198 (rev 03)


!!Advanced information - PCI Vendor/Device/Subsystem ID's
!!-------------------------------------------------------

00:0e.0 0403: 8086:3198 (rev 03) (prog-if 80)
	Subsystem: 10ec:118c


!!Modprobe options (Sound related)
!!--------------------------------

snd_pcsp: index=-2
snd_usb_audio: index=-2
snd_atiixp_modem: index=-2
snd_intel8x0m: index=-2
snd_via82xx_modem: index=-2


!!HDA-Intel Codec information
!!---------------------------
--startcollapse--

Codec: Realtek ALC256
Address: 0
AFG Function Id: 0x1 (unsol 1)
Vendor Id: 0x10ec0256
Subsystem Id: 0x10ec118c
Revision Id: 0x100002
No Modem Function Group found
Default PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
Default Amp-In caps: N/A
Default Amp-Out caps: N/A
State of AFG node 0x01:
  Power states:  D0 D1 D2 D3 D3cold CLKSTOP EPSS
  Power: setting=D0, actual=D0
GPIO: io=3, o=0, i=0, unsolicited=1, wake=0
  IO[0]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
  IO[1]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
  IO[2]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
Node 0x02 [Audio Output] wcaps 0x41d: Stereo Amp-Out
  Control: name="Speaker Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
  Amp-Out vals:  [0x55 0x55]
  Converter: stream=0, channel=0
  PCM:
    rates [0x60]: 44100 48000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x03 [Audio Output] wcaps 0x41d: Stereo Amp-Out
  Control: name="Headphone Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Device: name="ALC256 Analog", type="Audio", device=0
  Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
  Amp-Out vals:  [0x00 0x00]
  Converter: stream=0, channel=0
  PCM:
    rates [0x60]: 44100 48000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x04 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x05 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x06 [Audio Output] wcaps 0x611: Stereo Digital
  Converter: stream=0, channel=0
  Digital:
  Digital category: 0x0
  IEC Coding Type: 0x0
  PCM:
    rates [0x5e0]: 44100 48000 88200 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x07 [Audio Input] wcaps 0x10051b: Stereo Amp-In
  Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
  Amp-In vals:  [0x97 0x97]
  Converter: stream=0, channel=0
  SDI-Select: 0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x24
Node 0x08 [Audio Input] wcaps 0x10051b: Stereo Amp-In
  Control: name="Capture Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Control: name="Capture Switch", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Device: name="ALC256 Analog", type="Audio", device=0
  Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
  Amp-In vals:  [0x9f 0x9f]
  Converter: stream=0, channel=0
  SDI-Select: 0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x23
Node 0x09 [Audio Input] wcaps 0x10051b: Stereo Amp-In
  Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
  Amp-In vals:  [0x97 0x97]
  Converter: stream=0, channel=0
  SDI-Select: 0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x22
Node 0x0a [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0b [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0c [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0d [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0e [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0f [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x10 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x11 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x12 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
  Control: name="Internal Mic Boost Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00000020: IN
  Pin Default 0x90a60130: [Fixed] Mic at Int N/A
    Conn = Digital, Color = Unknown
    DefAssociation = 0x3, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x20: IN
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x13 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00000020: IN
  Pin Default 0x40000000: [N/A] Line Out at Ext N/A
    Conn = Unknown, Color = Unknown
    DefAssociation = 0x0, Sequence = 0x0
  Pin-ctls: 0x00:
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x14 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
  Control: name="Speaker Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x00010014: OUT EAPD Detect
  EAPD 0x2: EAPD
  Pin Default 0x90170110: [Fixed] Speaker at Int N/A
    Conn = Analog, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x02
Node 0x15 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x16 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x17 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x18 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00003724: IN Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x20: IN VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x19 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
  Control: name="Headset Mic Boost Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00003724: IN Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x02a19040: [Jack] Mic at Ext Front
    Conn = 1/8, Color = Pink
    DefAssociation = 0x4, Sequence = 0x0
  Pin-ctls: 0x24: IN VREF_80
  Unsolicited: tag=02, enabled=1
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x1a [Pin Complex] wcaps 0x40048b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00003724: IN Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x00: VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x1b [Pin Complex] wcaps 0x40058f: Stereo Amp-In Amp-Out
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x00013734: IN OUT EAPD Detect
    Vref caps: HIZ 50 GRD 80 100
  EAPD 0x2: EAPD
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x20: IN VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 2
     0x02* 0x03
Node 0x1c [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x1d [Pin Complex] wcaps 0x400400: Mono
  Pincap 0x00000020: IN
  Pin Default 0x4067b945: [N/A] Modem Line at Ext N/A
    Conn = Analog, Color = UNKNOWN
    DefAssociation = 0x4, Sequence = 0x5
    Misc = NO_PRESENCE
  Pin-ctls: 0x20: IN
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x1e [Pin Complex] wcaps 0x400781: Stereo Digital
  Pincap 0x00000014: OUT Detect
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x06
Node 0x1f [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x20 [Vendor Defined Widget] wcaps 0xf00040: Mono
  Processing caps: benign=0, ncoeff=91
Node 0x21 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
  Control: name="Headphone Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x0001001c: OUT HP EAPD Detect
  EAPD 0x2: EAPD
  Pin Default 0x02214020: [Jack] HP Out at Ext Front
    Conn = 1/8, Color = Green
    DefAssociation = 0x2, Sequence = 0x0
  Pin-ctls: 0xc0: OUT HP
  Unsolicited: tag=01, enabled=1
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 2
     0x02 0x03*
Node 0x22 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
  Connection: 5
     0x18 0x19 0x1a 0x1b 0x1d
Node 0x23 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
[0x00 0x00]
  Connection: 6
     0x18 0x19 0x1a 0x1b 0x1d 0x12
Node 0x24 [Audio Selector] wcaps 0x300101: Stereo
  Connection: 2
     0x12* 0x13
Codec: Intel Geminilake HDMI
Address: 2
AFG Function Id: 0x1 (unsol 0)
Vendor Id: 0x8086280d
Subsystem Id: 0x80860101
Revision Id: 0x100000
No Modem Function Group found
Default PCM:
    rates [0x0]:
    bits [0x0]:
    formats [0x0]:
Default Amp-In caps: N/A
Default Amp-Out caps: N/A
State of AFG node 0x01:
  Power states:  D0 D3 CLKSTOP EPSS
  Power: setting=D0, actual=D0, Clock-stop-OK
GPIO: io=0, o=0, i=0, unsolicited=0, wake=0
Node 0x02 [Audio Output] wcaps 0x6611: 8-Channels Digital
  Converter: stream=0, channel=0
  Digital: Enabled KAE
  Digital category: 0x0
  IEC Coding Type: 0x0
  PCM:
    rates [0x7f0]: 32000 44100 48000 88200 96000 176400 192000
    bits [0x1a]: 16 24 32
    formats [0x5]: PCM AC3
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x03 [Audio Output] wcaps 0x6611: 8-Channels Digital
  Converter: stream=0, channel=0
  Digital: Enabled KAE
  Digital category: 0x0
  IEC Coding Type: 0x0
  PCM:
    rates [0x7f0]: 32000 44100 48000 88200 96000 176400 192000
    bits [0x1a]: 16 24 32
    formats [0x5]: PCM AC3
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x04 [Audio Output] wcaps 0x6611: 8-Channels Digital
  Converter: stream=0, channel=0
  Digital: Enabled KAE
  Digital category: 0x0
  IEC Coding Type: 0x0
  PCM:
    rates [0x7f0]: 32000 44100 48000 88200 96000 176400 192000
    bits [0x1a]: 16 24 32
    formats [0x5]: PCM AC3
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x05 [Pin Complex] wcaps 0x40778d: 8-Channels Digital Amp-Out CP
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x0b000094: OUT Detect HBR HDMI DP
  Pin Default 0x18560010: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
  Devices: 0
  Connection: 0
  In-driver Connection: 3
     0x02 0x03 0x04
Node 0x06 [Pin Complex] wcaps 0x40778d: 8-Channels Digital Amp-Out CP
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x0b000094: OUT Detect HBR HDMI DP
  Pin Default 0x18560010: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
  Devices: 0
  Connection: 0
  In-driver Connection: 3
     0x02 0x03 0x04
Node 0x07 [Pin Complex] wcaps 0x40778d: 8-Channels Digital Amp-Out CP
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x0b000094: OUT Detect HBR HDMI DP
  Pin Default 0x18560010: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
  Devices: 0
  Connection: 0
  In-driver Connection: 3
     0x02 0x03 0x04
--endcollapse--


!!ALSA Device nodes
!!-----------------

crw-rw----+ 1 root audio 116, 11 Sep 16 22:08 /dev/snd/controlC0
crw-rw----+ 1 root audio 116,  9 Sep 16 22:08 /dev/snd/hwC0D0
crw-rw----+ 1 root audio 116, 10 Sep 16 22:08 /dev/snd/hwC0D2
crw-rw----+ 1 root audio 116,  3 Sep 16 22:09 /dev/snd/pcmC0D0c
crw-rw----+ 1 root audio 116,  2 Sep 17 11:38 /dev/snd/pcmC0D0p
crw-rw----+ 1 root audio 116,  8 Sep 16 22:09 /dev/snd/pcmC0D10p
crw-rw----+ 1 root audio 116,  4 Sep 16 22:09 /dev/snd/pcmC0D3p
crw-rw----+ 1 root audio 116,  5 Sep 16 22:09 /dev/snd/pcmC0D7p
crw-rw----+ 1 root audio 116,  6 Sep 16 22:09 /dev/snd/pcmC0D8p
crw-rw----+ 1 root audio 116,  7 Sep 16 22:09 /dev/snd/pcmC0D9p
crw-rw----+ 1 root audio 116,  1 Sep 16 22:08 /dev/snd/seq
crw-rw----+ 1 root audio 116, 33 Sep 16 22:08 /dev/snd/timer

/dev/snd/by-path:
total 0
drwxr-xr-x 2 root root  60 Sep 16 22:08 .
drwxr-xr-x 3 root root 300 Sep 16 22:08 ..
lrwxrwxrwx 1 root root  12 Sep 16 22:08 pci-0000:00:0e.0 -> ../controlC0


!!Aplay/Arecord output
!!--------------------

APLAY

**** List of PLAYBACK Hardware Devices ****
card 0: PCH [HDA Intel PCH], device 0: ALC256 Analog [ALC256 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 3: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 7: HDMI 1 [HDMI 1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 8: HDMI 2 [HDMI 2]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 9: HDMI 3 [HDMI 3]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 10: HDMI 4 [HDMI 4]
  Subdevices: 1/1
  Subdevice #0: subdevice #0

ARECORD

**** List of CAPTURE Hardware Devices ****
card 0: PCH [HDA Intel PCH], device 0: ALC256 Analog [ALC256 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0

!!Amixer output
!!-------------

!!-------Mixer controls for card 0 [PCH]

Card hw:0 'PCH'/'HDA Intel PCH at 0xa1110000 irq 133'
  Mixer name	: 'Realtek ALC256'
  Components	: 'HDA:10ec0256,10ec118c,00100002 HDA:8086280d,80860101,00100000'
  Controls      : 53
  Simple ctrls  : 13
Simple mixer control 'Master',0
  Capabilities: pvolume pvolume-joined pswitch pswitch-joined
  Playback channels: Mono
  Limits: Playback 0 - 87
  Mono: Playback 85 [98%] [-1.50dB] [on]
Simple mixer control 'Headphone',0
  Capabilities: pvolume pswitch
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 87
  Mono:
  Front Left: Playback 0 [0%] [-65.25dB] [off]
  Front Right: Playback 0 [0%] [-65.25dB] [off]
Simple mixer control 'Speaker',0
  Capabilities: pvolume pswitch
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 87
  Mono:
  Front Left: Playback 87 [100%] [0.00dB] [on]
  Front Right: Playback 87 [100%] [0.00dB] [on]
Simple mixer control 'PCM',0
  Capabilities: pvolume
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 255
  Mono:
  Front Left: Playback 254 [100%] [-0.20dB]
  Front Right: Playback 254 [100%] [-0.20dB]
Simple mixer control 'IEC958',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [off]
Simple mixer control 'IEC958',1
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'IEC958',2
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'IEC958',3
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'IEC958',4
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'Capture',0
  Capabilities: cvolume cswitch
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 63
  Front Left: Capture 31 [49%] [6.00dB] [off]
  Front Right: Capture 31 [49%] [6.00dB] [off]
Simple mixer control 'Auto-Mute Mode',0
  Capabilities: enum
  Items: 'Disabled' 'Enabled'
  Item0: 'Enabled'
Simple mixer control 'Headset Mic Boost',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 0 [0%] [0.00dB]
  Front Right: 0 [0%] [0.00dB]
Simple mixer control 'Internal Mic Boost',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 0 [0%] [0.00dB]
  Front Right: 0 [0%] [0.00dB]


!!Alsactl output
!!--------------

--startcollapse--
state.PCH {
	control.1 {
		iface MIXER
		name 'Headphone Playback Volume'
		value.0 0
		value.1 0
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 87'
			dbmin -6525
			dbmax 0
			dbvalue.0 -6525
			dbvalue.1 -6525
		}
	}
	control.2 {
		iface MIXER
		name 'Headphone Playback Switch'
		value.0 false
		value.1 false
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.3 {
		iface MIXER
		name 'Speaker Playback Volume'
		value.0 87
		value.1 87
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 87'
			dbmin -6525
			dbmax 0
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.4 {
		iface MIXER
		name 'Speaker Playback Switch'
		value.0 true
		value.1 true
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.5 {
		iface MIXER
		name 'Auto-Mute Mode'
		value Enabled
		comment {
			access 'read write'
			type ENUMERATED
			count 1
			item.0 Disabled
			item.1 Enabled
		}
	}
	control.6 {
		iface MIXER
		name 'Capture Volume'
		value.0 31
		value.1 31
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 63'
			dbmin -1725
			dbmax 3000
			dbvalue.0 600
			dbvalue.1 600
		}
	}
	control.7 {
		iface MIXER
		name 'Capture Switch'
		value.0 false
		value.1 false
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.8 {
		iface MIXER
		name 'Headset Mic Boost Volume'
		value.0 0
		value.1 0
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 3'
			dbmin 0
			dbmax 3000
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.9 {
		iface MIXER
		name 'Internal Mic Boost Volume'
		value.0 0
		value.1 0
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 3'
			dbmin 0
			dbmax 3000
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.10 {
		iface MIXER
		name 'Master Playback Volume'
		value 85
		comment {
			access 'read write'
			type INTEGER
			count 1
			range '0 - 87'
			dbmin -6525
			dbmax 0
			dbvalue.0 -150
		}
	}
	control.11 {
		iface MIXER
		name 'Master Playback Switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.12 {
		iface CARD
		name 'Headset Mic Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.13 {
		iface CARD
		name 'Internal Mic Phantom Jack'
		value true
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.14 {
		iface CARD
		name 'Headphone Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.15 {
		iface CARD
		name 'Speaker Phantom Jack'
		value true
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.16 {
		iface PCM
		name 'Playback Channel Map'
		value.0 0
		value.1 0
		comment {
			access read
			type INTEGER
			count 2
			range '0 - 36'
		}
	}
	control.17 {
		iface PCM
		name 'Capture Channel Map'
		value.0 0
		value.1 0
		comment {
			access read
			type INTEGER
			count 2
			range '0 - 36'
		}
	}
	control.18 {
		iface CARD
		name 'HDMI/DP,pcm=3 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.19 {
		iface MIXER
		name 'IEC958 Playback Con Mask'
		value
'0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.20 {
		iface MIXER
		name 'IEC958 Playback Pro Mask'
		value
'0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.21 {
		iface MIXER
		name 'IEC958 Playback Default'
		value
'0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access 'read write'
			type IEC958
			count 1
		}
	}
	control.22 {
		iface MIXER
		name 'IEC958 Playback Switch'
		value false
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.23 {
		iface PCM
		device 3
		name ELD
		value ''
		comment {
			access 'read volatile'
			type BYTES
			count 0
		}
	}
	control.24 {
		iface CARD
		name 'HDMI/DP,pcm=7 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.25 {
		iface MIXER
		name 'IEC958 Playback Con Mask'
		index 1
		value
'0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.26 {
		iface MIXER
		name 'IEC958 Playback Pro Mask'
		index 1
		value
'0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.27 {
		iface MIXER
		name 'IEC958 Playback Default'
		index 1
		value
'0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access 'read write'
			type IEC958
			count 1
		}
	}
	control.28 {
		iface MIXER
		name 'IEC958 Playback Switch'
		index 1
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.29 {
		iface PCM
		device 7
		name ELD
		value ''
		comment {
			access 'read volatile'
			type BYTES
			count 0
		}
	}
	control.30 {
		iface CARD
		name 'HDMI/DP,pcm=8 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.31 {
		iface MIXER
		name 'IEC958 Playback Con Mask'
		index 2
		value
'0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.32 {
		iface MIXER
		name 'IEC958 Playback Pro Mask'
		index 2
		value
'0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.33 {
		iface MIXER
		name 'IEC958 Playback Default'
		index 2
		value
'0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access 'read write'
			type IEC958
			count 1
		}
	}
	control.34 {
		iface MIXER
		name 'IEC958 Playback Switch'
		index 2
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.35 {
		iface PCM
		device 8
		name ELD
		value ''
		comment {
			access 'read volatile'
			type BYTES
			count 0
		}
	}
	control.36 {
		iface CARD
		name 'HDMI/DP,pcm=9 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.37 {
		iface MIXER
		name 'IEC958 Playback Con Mask'
		index 3
		value
'0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.38 {
		iface MIXER
		name 'IEC958 Playback Pro Mask'
		index 3
		value
'0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.39 {
		iface MIXER
		name 'IEC958 Playback Default'
		index 3
		value
'0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access 'read write'
			type IEC958
			count 1
		}
	}
	control.40 {
		iface MIXER
		name 'IEC958 Playback Switch'
		index 3
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.41 {
		iface PCM
		device 9
		name ELD
		value ''
		comment {
			access 'read volatile'
			type BYTES
			count 0
		}
	}
	control.42 {
		iface CARD
		name 'HDMI/DP,pcm=10 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.43 {
		iface MIXER
		name 'IEC958 Playback Con Mask'
		index 4
		value
'0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.44 {
		iface MIXER
		name 'IEC958 Playback Pro Mask'
		index 4
		value
'0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.45 {
		iface MIXER
		name 'IEC958 Playback Default'
		index 4
		value
'0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access 'read write'
			type IEC958
			count 1
		}
	}
	control.46 {
		iface MIXER
		name 'IEC958 Playback Switch'
		index 4
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.47 {
		iface PCM
		device 10
		name ELD
		value ''
		comment {
			access 'read volatile'
			type BYTES
			count 0
		}
	}
	control.48 {
		iface PCM
		device 3
		name 'Playback Channel Map'
		value.0 0
		value.1 0
		value.2 0
		value.3 0
		value.4 0
		value.5 0
		value.6 0
		value.7 0
		comment {
			access 'read write'
			type INTEGER
			count 8
			range '0 - 36'
		}
	}
	control.49 {
		iface PCM
		device 7
		name 'Playback Channel Map'
		value.0 0
		value.1 0
		value.2 0
		value.3 0
		value.4 0
		value.5 0
		value.6 0
		value.7 0
		comment {
			access 'read write'
			type INTEGER
			count 8
			range '0 - 36'
		}
	}
	control.50 {
		iface PCM
		device 8
		name 'Playback Channel Map'
		value.0 0
		value.1 0
		value.2 0
		value.3 0
		value.4 0
		value.5 0
		value.6 0
		value.7 0
		comment {
			access 'read write'
			type INTEGER
			count 8
			range '0 - 36'
		}
	}
	control.51 {
		iface PCM
		device 9
		name 'Playback Channel Map'
		value.0 0
		value.1 0
		value.2 0
		value.3 0
		value.4 0
		value.5 0
		value.6 0
		value.7 0
		comment {
			access 'read write'
			type INTEGER
			count 8
			range '0 - 36'
		}
	}
	control.52 {
		iface PCM
		device 10
		name 'Playback Channel Map'
		value.0 0
		value.1 0
		value.2 0
		value.3 0
		value.4 0
		value.5 0
		value.6 0
		value.7 0
		comment {
			access 'read write'
			type INTEGER
			count 8
			range '0 - 36'
		}
	}
	control.53 {
		iface MIXER
		name 'PCM Playback Volume'
		value.0 254
		value.1 254
		comment {
			access 'read write user'
			type INTEGER
			count 2
			range '0 - 255'
			tlv '0000000100000008ffffec1400000014'
			dbmin -5100
			dbmax 0
			dbvalue.0 -20
			dbvalue.1 -20
		}
	}
}
--endcollapse--


!!All Loaded Modules
!!------------------

Module
ctr
ccm
rfcomm
devlink
nf_tables
nfnetlink
overlay
bnep
uas
usb_storage
btusb
btrtl
btbcm
btintel
bluetooth
drbg
ansi_cprng
ecdh_generic
rtsx_usb_ms
memstick
rtsx_usb_sdmmc
uvcvideo
videobuf2_vmalloc
videobuf2_memops
videobuf2_v4l2
rtsx_usb
videobuf2_common
videodev
media
usbhid
binfmt_misc
nls_ascii
nls_cp437
vfat
fat
joydev
hid_multitouch
hid_generic
spi_pxa2xx_platform
arc4
intel_rapl
mmc_block
x86_pkg_temp_thermal
intel_powerclamp
coretemp
iwlmvm
kvm_intel
mac80211
kvm
snd_hda_codec_hdmi
snd_soc_skl
snd_soc_skl_ipc
snd_hda_codec_realtek
snd_soc_sst_ipc
snd_soc_sst_dsp
snd_hda_ext_core
snd_hda_codec_generic
snd_soc_acpi_intel_match
snd_soc_acpi
snd_soc_core
irqbypass
snd_compress
efi_pstore
snd_hda_intel
crct10dif_pclmul
crc32_pclmul
snd_hda_codec
iwlwifi
snd_hda_core
ghash_clmulni_intel
xhci_pci
intel_cstate
snd_hwdep
intel_rapl_perf
snd_pcm
xhci_hcd
efivars
pcspkr
cfg80211
snd_timer
i2c_i801
snd
usbcore
mei_me
idma64
sdhci_pci
cqhci
intel_lpss_pci
sdhci
processor_thermal_device
sg
soundcore
rfkill
mei
intel_soc_dts_iosf
usb_common
mmc_core
intel_lpss
i2c_hid
pcc_cpufreq
hid
battery
ac
tpm_crb
tpm_tis
tpm_tis_core
tpm
intel_hid
int3400_thermal
sparse_keymap
rng_core
int3403_thermal
acpi_thermal_rel
int340x_thermal_zone
efivarfs
ip_tables
x_tables
autofs4
ext4
crc16
mbcache
jbd2
crc32c_generic
fscrypto
ecb
algif_skcipher
af_alg
dm_crypt
dm_mod
sd_mod
i915
crc32c_intel
ahci
libahci
i2c_algo_bit
libata
drm_kms_helper
evdev
aesni_intel
serio_raw
drm
aes_x86_64
crypto_simd
cryptd
scsi_mod
glue_helper
fan
thermal
button
video


!!Sysfs Files
!!-----------

/sys/class/sound/hwC0D0/init_pin_configs:
0x12 0x90a60130
0x13 0x40000000
0x14 0x90170110
0x18 0x411111f0
0x19 0x02a19040
0x1a 0x411111f0
0x1b 0x411111f0
0x1d 0x4067b945
0x1e 0x411111f0
0x21 0x02214020

/sys/class/sound/hwC0D0/driver_pin_configs:
0x19 0x04a11040
0x21 0x04211020

/sys/class/sound/hwC0D0/user_pin_configs:

/sys/class/sound/hwC0D0/init_verbs:

/sys/class/sound/hwC0D0/hints:

/sys/class/sound/hwC0D2/init_pin_configs:
0x05 0x18560010
0x06 0x18560010
0x07 0x18560010

/sys/class/sound/hwC0D2/driver_pin_configs:

/sys/class/sound/hwC0D2/user_pin_configs:

/sys/class/sound/hwC0D2/init_verbs:

/sys/class/sound/hwC0D2/hints:


!!ALSA/HDA dmesg
!!--------------

[    0.625590] ACPI: Added _OSI(Linux-Dell-Video)
[    0.625592] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.653144] ACPI: 11 ACPI AML tables successfully acquired and loaded
--
[    9.908749] pstore: Registered efi as persistent store backend
[    9.908998] snd_hda_intel 0000:00:0e.0: bound 0000:00:02.0 (ops
i915_audio_component_bind_ops [i915])
[    9.912154] idma64 idma64.3: Found Intel integrated DMA 64-bit
[    9.966721] idma64 idma64.4: Found Intel integrated DMA 64-bit
[    9.981507] snd_hda_codec_realtek: loading out-of-tree module taints kernel.
[    9.981635] snd_hda_codec_realtek: module verification failed: signature
and/or required key missing - tainting kernel
[    9.982947] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC256:
line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[    9.982949] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0
(0x0/0x0/0x0/0x0/0x0)
[    9.982951] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1
(0x21/0x0/0x0/0x0/0x0)
[    9.982952] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
[    9.982953] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[    9.982954] snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=0x19
[    9.982956] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=0x12
[   10.014690] idma64 idma64.5: Found Intel integrated DMA 64-bit
[   10.062637] idma64 idma64.6: Found Intel integrated DMA 64-bit
[   10.099604] input: HDA Intel PCH Headset Mic as
/devices/pci0000:00/0000:00:0e.0/sound/card0/input7
[   10.099670] input: HDA Intel PCH Headphone as
/devices/pci0000:00/0000:00:0e.0/sound/card0/input8
[   10.099728] input: HDA Intel PCH HDMI/DP,pcm=3 as
/devices/pci0000:00/0000:00:0e.0/sound/card0/input9
[   10.099780] input: HDA Intel PCH HDMI/DP,pcm=7 as
/devices/pci0000:00/0000:00:0e.0/sound/card0/input10
[   10.099832] input: HDA Intel PCH HDMI/DP,pcm=8 as
/devices/pci0000:00/0000:00:0e.0/sound/card0/input11
[   10.099885] input: HDA Intel PCH HDMI/DP,pcm=9 as
/devices/pci0000:00/0000:00:0e.0/sound/card0/input12
[   10.100409] input: HDA Intel PCH HDMI/DP,pcm=10 as
/devices/pci0000:00/0000:00:0e.0/sound/card0/input13
[   10.101215] iwlwifi 0000:00:0c.0: Detected Intel(R) Dual Band Wireless AC
9462, REV=0x318


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A13734132
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Jun 2023 15:25:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0094082A;
	Sat, 17 Jun 2023 15:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0094082A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687008342;
	bh=W/De26XlZCOYWoie3GUfhQKG499q1jmfDCNj/b0y+P4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bpJut49slnoLqnX2uOKZiTQudZgjzo+kx3Hu/HmY+hsybb4isP1olWtzrmQadD+Po
	 XgGtqGQ6rqu0g07LJFmNlv9Y+etbo7Zsxjo0zXz1Dja+VYaV21u8jUyzzFUbQ0M5es
	 mklZf9IXq4/NOZNPa/SosoIYSlJ6MUdFsUCWOvFo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FE7BF800ED; Sat, 17 Jun 2023 15:24:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2374F80132;
	Sat, 17 Jun 2023 15:24:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1D34F80149; Sat, 17 Jun 2023 15:24:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id CED2BF80130
	for <alsa-devel@alsa-project.org>; Sat, 17 Jun 2023 15:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CED2BF80130
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1687008258571704149-webhooks-bot@alsa-project.org>
References: <1687008258571704149-webhooks-bot@alsa-project.org>
Subject: Mixer settings faulty on M-Audio C400 (usb) after suspend until
 they're touched in alsamixer
Message-Id: <20230617132444.D1D34F80149@alsa1.perex.cz>
Date: Sat, 17 Jun 2023 15:24:44 +0200 (CEST)
Message-ID-Hash: WWXVVBLB462UPXGD3HANPH32Q372H7I3
X-Message-ID-Hash: WWXVVBLB462UPXGD3HANPH32Q372H7I3
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WWXVVBLB462UPXGD3HANPH32Q372H7I3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #331 was opened from ri0t:

I don't know if this is the right place to report it, but:

* I do a suspend and resume on my machine
* Now, my mixer settings for my M-Audio C400 usb-soundcard are set to output all signals on the first pcm out
* alsamixer doesn't reflect the true settings of the mixer, instead it shows the last used (correct, or wanted) settings
* Once i touch one of the mixer controls in alsamixer, the settings get set to the correct values (+ that change i did)
* This repeats every suspend/resume-cycle

I've observed this on Debian Bullseye and now on NixOS 23.05.

Thanks in advance, even if you point me to a better place to post this.

I can supply more debug info, once i know what you need, but the upload from alsa-info to www.alsa-project.org failed somehow without providing me a url. So, here's some basics:
```
!!Kernel Information
!!------------------

Kernel release:    #1-NixOS SMP PREEMPT_DYNAMIC Tue May 30 13:03:33 UTC 2023
Operating System:  GNU/Linux
Architecture:      x86_64
Processor:         unknown
SMP Enabled:       Yes


!!ALSA Version
!!------------

Driver version:     k6.1.31
Library version:    
Utilities version:  1.2.9


!!Loaded ALSA modules
!!-------------------

snd_hda_intel (card 0)
snd_usb_audio (card 1)
snd_hda_intel (card 2)


!!Sound Servers on this system
!!----------------------------

PipeWire:
      Installed - Yes (/run/current-system/sw/bin/pipewire)
      Running - Yes

Jack:
      Installed - Yes (/run/current-system/sw/bin/jackd)
      Running - No

Jack2:
      Installed - Yes (/run/current-system/sw/bin/jackdbus)
      Running - Yes


!!Soundcards recognised by ALSA
!!-----------------------------

 0 [NVidia         ]: HDA-Intel - HDA NVidia
                      HDA NVidia at 0xfc080000 irq 119
 1 [C400           ]: USB-Audio - Fast Track C400
                      M-Audio Fast Track C400 at usb-0000:0c:00.3-1, high speed
 2 [Generic        ]: HDA-Intel - HD-Audio Generic
                      HD-Audio Generic at 0xfcb00000 irq 125

!!USB Stream information
!!----------------------
--startcollapse--

M-Audio Fast Track C400 at usb-0000:0c:00.3-1, high speed : USB Audio

Playback:
  Status: Running
    Interface = 2
    Altset = 1
    Packet Size = 162
    Momentary freq = 48000 Hz (0x6.0000)
  Interface 2
    Altset 1
    Format: S24_3LE
    Channels: 6
    Endpoint: 0x01 (1 OUT) (ADAPTIVE)
    Rates: 44100, 48000, 88200, 96000
    Data packet interval: 125 us
    Bits: 0
    Sync Endpoint: 0x81 (1 IN)
    Sync EP Interface: 3
    Sync EP Altset: 1
    Implicit Feedback Mode: Yes

Capture:
  Status: Stop
  Interface 3
    Altset 1
    Format: S24_3LE
    Channels: 4
    Endpoint: 0x81 (1 IN) (ASYNC)
    Rates: 44100, 48000, 88200, 96000
    Data packet interval: 125 us
    Bits: 0
--endcollapse--

!!Modprobe options (Sound related)
!!--------------------------------

snd_pcsp: index=-2
snd_usb_audio: index=-2
snd_atiixp_modem: index=-2
snd_intel8x0m: index=-2
snd_via82xx_modem: index=-2


!!Loaded sound module options
!!---------------------------

!!Module: snd_usb_audio
        autoclock : Y
        delayed_register : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
        device_setup : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        enable : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
        id : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
        ignore_ctl_error : N
        implicit_fb : N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N
        index : -2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
        lowlatency : Y
        pid : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
        quirk_alias : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
        quirk_flags : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        skip_validation : N
        use_vmalloc : Y
        vid : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1



!!USB Mixer information
!!---------------------
--startcollapse--

USB Mixer: usb_id=0x07632030, ctrlif=1, ctlerr=0
Card: M-Audio Fast Track C400 at usb-0000:0c:00.3-1, high speed
  Unit: 64
    Control: name="Effect Return 6", index=0
    Info: id=64, control=1, cmask=0x400, channels=1, type="S16"
    Volume: min=46854, max=65403, dBmin=-7297, dBmax=-51
  Unit: 64
    Control: name="Effect Return 5", index=0
    Info: id=64, control=1, cmask=0x8, channels=1, type="S16"
    Volume: min=46854, max=65403, dBmin=-7297, dBmax=-51
  Unit: 64
    Control: name="Effect Return 4", index=0
    Info: id=64, control=1, cmask=0x100, channels=1, type="S16"
    Volume: min=46854, max=65403, dBmin=-7297, dBmax=-51
  Unit: 64
    Control: name="Effect Return 3", index=0
    Info: id=64, control=1, cmask=0x2, channels=1, type="S16"
    Volume: min=46854, max=65403, dBmin=-7297, dBmax=-51
  Unit: 64
    Control: name="Effect Return 2", index=0
    Info: id=64, control=1, cmask=0x40, channels=1, type="S16"
    Volume: min=46854, max=65403, dBmin=-7297, dBmax=-51
  Unit: 64
    Control: name="Effect Return 1", index=0
    Info: id=64, control=1, cmask=0x0, channels=1, type="S16"
    Volume: min=46854, max=65403, dBmin=-7297, dBmax=-51
  Unit: 64
    Control: name="In4-Out6 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x10, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In4-Out5 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x8, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In4-Out4 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x4, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In4-Out3 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x2, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In4-Out2 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x1, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In4-Out1 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x0, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In3-Out6 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x10, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In3-Out5 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x8, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In3-Out4 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x4, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In3-Out3 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x2, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In3-Out2 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x1, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In3-Out1 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x0, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In2-Out6 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x10, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In2-Out5 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x8, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In2-Out4 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x4, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In2-Out3 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x2, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In2-Out2 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x1, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In2-Out1 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x0, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In1-Out6 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x10, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In1-Out5 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x8, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In1-Out4 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x4, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In1-Out3 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x2, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In1-Out2 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x1, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="In1-Out1 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x0, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM6-Out6 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x10, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM6-Out5 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x8, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM6-Out4 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x4, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM6-Out3 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x2, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM6-Out2 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x1, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM6-Out1 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x0, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM5-Out6 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x10, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM5-Out5 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x8, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM5-Out4 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x4, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM5-Out3 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x2, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM5-Out2 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x1, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM5-Out1 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x0, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM4-Out6 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x10, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM4-Out5 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x8, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM4-Out4 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x4, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM4-Out3 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x2, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM4-Out2 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x1, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM4-Out1 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x0, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM3-Out6 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x10, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM3-Out5 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x8, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM3-Out4 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x4, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM3-Out3 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x2, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM3-Out2 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x1, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM3-Out1 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x0, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM2-Out6 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x10, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM2-Out5 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x8, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM2-Out4 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x4, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM2-Out3 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x2, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM2-Out2 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x1, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM2-Out1 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x0, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM1-Out6 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x10, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM1-Out5 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x8, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM1-Out4 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x4, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM1-Out3 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x2, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM1-Out2 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x1, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM1-Out1 Playback Volume", index=0
    Info: id=64, control=1, cmask=0x0, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 64
    Control: name="PCM Volume", index=4
    Info: id=64, control=10, cmask=0xf, channels=4, type="S16"
    Volume: min=0, max=0, dBmin=0, dBmax=0
  Unit: 64
    Control: name="PCM Volume", index=3
    Info: id=64, control=8, cmask=0xf, channels=4, type="S16"
    Volume: min=0, max=0, dBmin=0, dBmax=0
  Unit: 64
    Control: name="PCM Volume", index=2
    Info: id=64, control=7, cmask=0xf, channels=4, type="S16"
    Volume: min=0, max=0, dBmin=0, dBmax=0
  Unit: 64
    Control: name="PCM Volume", index=1
    Info: id=64, control=6, cmask=0xf, channels=4, type="S16"
    Volume: min=0, max=0, dBmin=0, dBmax=0
  Unit: 64
    Control: name="PCM Volume", index=0
    Info: id=64, control=5, cmask=0xf, channels=4, type="S16"
    Volume: min=0, max=0, dBmin=0, dBmax=0
  Unit: 64
    Control: name="Line Volume", index=3
    Info: id=64, control=4, cmask=0xf, channels=4, type="S16"
    Volume: min=0, max=0, dBmin=0, dBmax=0
  Unit: 64
    Control: name="Line Volume", index=2
    Info: id=64, control=3, cmask=0xf, channels=4, type="S16"
    Volume: min=0, max=0, dBmin=0, dBmax=0
  Unit: 64
    Control: name="Line Volume", index=1
    Info: id=64, control=2, cmask=0xf, channels=4, type="S16"
    Volume: min=0, max=0, dBmin=0, dBmax=0
  Unit: 64
    Control: name="Line Volume", index=0
    Info: id=64, control=1, cmask=0xf, channels=4, type="S16"
    Volume: min=0, max=0, dBmin=0, dBmax=0
  Unit: 66
    Control: name="Effect Send AIn4", index=0
    Info: id=66, control=1, cmask=0x100, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 66
    Control: name="Effect Send AIn3", index=0
    Info: id=66, control=1, cmask=0x80, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 66
    Control: name="Effect Send AIn2", index=0
    Info: id=66, control=1, cmask=0x40, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 66
    Control: name="Effect Send AIn1", index=0
    Info: id=66, control=1, cmask=0x20, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 66
    Control: name="Effect Send DOut6", index=0
    Info: id=66, control=1, cmask=0x10, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 66
    Control: name="Effect Send DOut5", index=0
    Info: id=66, control=1, cmask=0x8, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 66
    Control: name="Effect Send DOut4", index=0
    Info: id=66, control=1, cmask=0x4, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 66
    Control: name="Effect Send DOut3", index=0
    Info: id=66, control=1, cmask=0x2, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 66
    Control: name="Effect Send DOut2", index=0
    Info: id=66, control=1, cmask=0x1, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 66
    Control: name="Effect Send DOut1", index=0
    Info: id=66, control=1, cmask=0x0, channels=1, type="S16"
    Volume: min=46587, max=64766, dBmin=-7401, dBmax=-300
  Unit: 67
    Control: name="Effect Feedback Volume", index=0
    Info: id=67, control=5, cmask=0x0, channels=1, type="U8"
    Volume: min=0, max=255, dBmin=0, dBmax=99
  Unit: 67
    Control: name="Effect Duration", index=0
    Info: id=67, control=4, cmask=0x0, channels=1, type="S16"
    Volume: min=0, max=65535, dBmin=0, dBmax=0
  Unit: 67
    Control: name="Effect Volume", index=0
    Info: id=67, control=3, cmask=0x0, channels=1, type="U8"
    Volume: min=0, max=255, dBmin=0, dBmax=99
  Unit: 67
    Control: name="Effect Program Switch", index=0
  Unit: 128
    Control: name="PCM Clock Source", index=0
    Info: id=128, control=1, cmask=0x0, channels=1, type="U8"
    Volume: min=1, max=2, dBmin=0, dBmax=0
  Unit: 130
    Control: name="Clock Source 130 Validity", index=0
    Info: id=130, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
--endcollapse--

!!-------Mixer controls for card C400

Card sysdefault:1 'C400'/'M-Audio Fast Track C400 at usb-0000:0c:00.3-1, high speed'
  Mixer name    : 'USB Mixer'
  Components    : 'USB0763:2030'
  Controls      : 91
  Simple ctrls  : 90
Simple mixer control 'PCM',0
  Capabilities: volume
  Playback channels: Front Left - Front Right - Rear Left - Rear Right
  Capture channels: Front Left - Front Right - Rear Left - Rear Right
  Limits: 0 - 0
  Front Left: 0 [0%]
  Front Right: 0 [0%]
  Rear Left: 0 [0%]
  Rear Right: 0 [0%]
Simple mixer control 'PCM Clock Source',0
  Capabilities: enum
  Items: 'Internal' 'SPDIF'
  Item0: 'Internal'
Simple mixer control 'PCM1-Out1',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 148 [93%] [-7.92dB]
Simple mixer control 'PCM1-Out2',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM1-Out3',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM1-Out4',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM1-Out5',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM1-Out6',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM2-Out1',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM2-Out2',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 148 [93%] [-7.92dB]
Simple mixer control 'PCM2-Out3',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM2-Out4',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM2-Out5',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM2-Out6',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM3-Out1',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM3-Out2',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM3-Out3',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM3-Out4',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM3-Out5',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM3-Out6',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM4-Out1',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM4-Out2',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM4-Out3',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM4-Out4',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM4-Out5',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM4-Out6',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM5-Out1',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM5-Out2',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM5-Out3',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM5-Out4',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM5-Out5',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM5-Out6',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM6-Out1',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM6-Out2',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM6-Out3',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM6-Out4',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM6-Out5',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM6-Out6',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'PCM',1
  Capabilities: volume
  Playback channels: Front Left - Front Right - Rear Left - Rear Right
  Capture channels: Front Left - Front Right - Rear Left - Rear Right
  Limits: 0 - 0
  Front Left: 0 [0%]
  Front Right: 0 [0%]
  Rear Left: 0 [0%]
  Rear Right: 0 [0%]
Simple mixer control 'PCM',2
  Capabilities: volume
  Playback channels: Front Left - Front Right - Rear Left - Rear Right
  Capture channels: Front Left - Front Right - Rear Left - Rear Right
  Limits: 0 - 0
  Front Left: 0 [0%]
  Front Right: 0 [0%]
  Rear Left: 0 [0%]
  Rear Right: 0 [0%]
Simple mixer control 'PCM',3
  Capabilities: volume
  Playback channels: Front Left - Front Right - Rear Left - Rear Right
  Capture channels: Front Left - Front Right - Rear Left - Rear Right
  Limits: 0 - 0
  Front Left: 0 [0%]
  Front Right: 0 [0%]
  Rear Left: 0 [0%]
  Rear Right: 0 [0%]
Simple mixer control 'PCM',4
  Capabilities: volume
  Playback channels: Front Left - Front Right - Rear Left - Rear Right
  Capture channels: Front Left - Front Right - Rear Left - Rear Right
  Limits: 0 - 0
  Front Left: 0 [0%]
  Front Right: 0 [0%]
  Rear Left: 0 [0%]
  Rear Right: 0 [0%]
Simple mixer control 'Line',0
  Capabilities: volume
  Playback channels: Front Left - Front Right - Rear Left - Rear Right
  Capture channels: Front Left - Front Right - Rear Left - Rear Right
  Limits: 0 - 0
  Front Left: 0 [0%]
  Front Right: 0 [0%]
  Rear Left: 0 [0%]
  Rear Right: 0 [0%]
Simple mixer control 'Line',1
  Capabilities: volume
  Playback channels: Front Left - Front Right - Rear Left - Rear Right
  Capture channels: Front Left - Front Right - Rear Left - Rear Right
  Limits: 0 - 0
  Front Left: 0 [0%]
  Front Right: 0 [0%]
  Rear Left: 0 [0%]
  Rear Right: 0 [0%]
Simple mixer control 'Line',2
  Capabilities: volume
  Playback channels: Front Left - Front Right - Rear Left - Rear Right
  Capture channels: Front Left - Front Right - Rear Left - Rear Right
  Limits: 0 - 0
  Front Left: 0 [0%]
  Front Right: 0 [0%]
  Rear Left: 0 [0%]
  Rear Right: 0 [0%]
Simple mixer control 'Line',3
  Capabilities: volume
  Playback channels: Front Left - Front Right - Rear Left - Rear Right
  Capture channels: Front Left - Front Right - Rear Left - Rear Right
  Limits: 0 - 0
  Front Left: 0 [0%]
  Front Right: 0 [0%]
  Rear Left: 0 [0%]
  Rear Right: 0 [0%]
Simple mixer control 'Effect',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 255
  Mono: 0 [0%] [0.00dB]
Simple mixer control 'Effect Duration',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 285
  Mono: 0 [0%]
Simple mixer control 'Effect Feedback',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 255
  Mono: 0 [0%]
Simple mixer control 'Effect Program',0
  Capabilities: enum
  Items: 'Room 1' 'Room 2' 'Room 3' 'Hall 1' 'Hall 2' 'Plate' 'Delay' 'Echo'
  Item0: 'Room 1'
Simple mixer control 'Effect Return 1',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 162
  Mono: 0 [0%]
Simple mixer control 'Effect Return 2',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 162
  Mono: 0 [0%]
Simple mixer control 'Effect Return 3',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 162
  Mono: 0 [0%]
Simple mixer control 'Effect Return 4',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 162
  Mono: 0 [0%]
Simple mixer control 'Effect Return 5',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 162
  Mono: 0 [0%]
Simple mixer control 'Effect Return 6',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 162
  Mono: 0 [0%]
Simple mixer control 'Effect Send AIn1',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 159
  Mono: 0 [0%]
Simple mixer control 'Effect Send AIn2',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 159
  Mono: 0 [0%]
Simple mixer control 'Effect Send AIn3',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 159
  Mono: 0 [0%]
Simple mixer control 'Effect Send AIn4',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 159
  Mono: 0 [0%]
Simple mixer control 'Effect Send DOut1',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 159
  Mono: 0 [0%]
Simple mixer control 'Effect Send DOut2',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 159
  Mono: 0 [0%]
Simple mixer control 'Effect Send DOut3',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 159
  Mono: 0 [0%]
Simple mixer control 'Effect Send DOut4',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 159
  Mono: 0 [0%]
Simple mixer control 'Effect Send DOut5',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 159
  Mono: 0 [0%]
Simple mixer control 'Effect Send DOut6',0
  Capabilities: volume volume-joined
  Playback channels: Mono
  Capture channels: Mono
  Limits: 0 - 159
  Mono: 0 [0%]
Simple mixer control 'In1-Out1',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In1-Out2',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In1-Out3',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In1-Out4',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In1-Out5',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In1-Out6',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In2-Out1',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In2-Out2',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In2-Out3',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In2-Out4',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In2-Out5',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In2-Out6',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In3-Out1',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In3-Out2',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In3-Out3',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In3-Out4',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In3-Out5',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In3-Out6',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In4-Out1',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In4-Out2',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In4-Out3',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In4-Out4',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In4-Out5',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]
Simple mixer control 'In4-Out6',0
  Capabilities: pvolume pvolume-joined
  Playback channels: Mono
  Limits: Playback 0 - 159
  Mono: Playback 0 [0%] [-74.01dB]

!!-------Mixer controls for card Generic

Card sysdefault:2 'Generic'/'HD-Audio Generic at 0xfcb00000 irq 125'
  Mixer name    : 'Realtek ALC1220'
  Components    : 'HDA:10ec1220,1458a0c3,00100101'
  Controls      : 47
  Simple ctrls  : 21
Simple mixer control 'Master',0
  Capabilities: pvolume pvolume-joined pswitch pswitch-joined
  Playback channels: Mono
  Limits: Playback 0 - 87
  Mono: Playback 61 [70%] [-19.50dB] [on]
Simple mixer control 'Headphone',0
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
  Front Left: Playback 255 [100%] [0.00dB]
  Front Right: Playback 255 [100%] [0.00dB]
Simple mixer control 'Front',0
  Capabilities: pvolume pswitch
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 87
  Mono:
  Front Left: Playback 87 [100%] [0.00dB] [on]
  Front Right: Playback 87 [100%] [0.00dB] [on]
Simple mixer control 'Front Mic',0
  Capabilities: pvolume pswitch
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 31
  Mono:
  Front Left: Playback 0 [0%] [-34.50dB] [off]
  Front Right: Playback 0 [0%] [-34.50dB] [off]
Simple mixer control 'Front Mic Boost',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 0 [0%] [0.00dB]
  Front Right: 0 [0%] [0.00dB]
Simple mixer control 'Surround',0
  Capabilities: pvolume pswitch
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 87
  Mono:
  Front Left: Playback 87 [100%] [0.00dB] [on]
  Front Right: Playback 87 [100%] [0.00dB] [on]
Simple mixer control 'Center',0
  Capabilities: pvolume pvolume-joined pswitch pswitch-joined
  Playback channels: Mono
  Limits: Playback 0 - 87
  Mono: Playback 87 [100%] [0.00dB] [on]
Simple mixer control 'LFE',0
  Capabilities: pvolume pvolume-joined pswitch pswitch-joined
  Playback channels: Mono
  Limits: Playback 0 - 87
  Mono: Playback 87 [100%] [0.00dB] [on]
Simple mixer control 'Line',0
  Capabilities: pvolume pswitch
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 31
  Mono:
  Front Left: Playback 0 [0%] [-34.50dB] [off]
  Front Right: Playback 0 [0%] [-34.50dB] [off]
Simple mixer control 'Line Boost',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 0 [0%] [0.00dB]
  Front Right: 0 [0%] [0.00dB]
Simple mixer control 'IEC958',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'IEC958 Default PCM',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'Capture',0
  Capabilities: cvolume cswitch
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 63
  Front Left: Capture 39 [62%] [12.00dB] [on]
  Front Right: Capture 39 [62%] [12.00dB] [on]
Simple mixer control 'Capture',1
  Capabilities: cvolume cswitch
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 63
  Front Left: Capture 0 [0%] [-17.25dB] [off]
  Front Right: Capture 0 [0%] [-17.25dB] [off]
Simple mixer control 'Auto-Mute Mode',0
  Capabilities: enum
  Items: 'Disabled' 'Enabled'
  Item0: 'Enabled'
Simple mixer control 'Input Source',0
  Capabilities: cenum
  Items: 'Front Mic' 'Rear Mic' 'Line'
  Item0: 'Front Mic'
Simple mixer control 'Input Source',1
  Capabilities: cenum
  Items: 'Front Mic' 'Rear Mic' 'Line'
  Item0: 'Front Mic'
Simple mixer control 'Loopback Mixing',0
  Capabilities: enum
  Items: 'Disabled' 'Enabled'
  Item0: 'Disabled'
Simple mixer control 'Rear Mic',0
  Capabilities: pvolume pswitch
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 31
  Mono:
  Front Left: Playback 0 [0%] [-34.50dB] [off]
  Front Right: Playback 0 [0%] [-34.50dB] [off]
Simple mixer control 'Rear Mic Boost',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 0 [0%] [0.00dB]
  Front Right: 0 [0%] [0.00dB]
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/331
Repository URL: https://github.com/alsa-project/alsa-lib

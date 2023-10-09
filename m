Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1347C93BC
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 11:26:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB0E183B;
	Sat, 14 Oct 2023 11:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB0E183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697275604;
	bh=0oO4KPzbHUsXIvaBD0tQy1kwgr8VkrpJG27Qp6dyMhs=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SHrWKBcHEf9b/FAnuMht+XvXQbanHPzB048wwzfSvpv7y/L/OXacItRU/V/N3X5gU
	 ZYZgf/Bosik2I1p3k6GFn2uFiDM32branZU8QFRtBYaGEpakzEwYpIi8iy24QWEyA2
	 bwo9VircPUZkoMXdMjiwAobflSSqdww/DWDRSxck=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83EE3F80536; Sat, 14 Oct 2023 11:25:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F027F8015B;
	Sat, 14 Oct 2023 11:25:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6BEBF802BE; Mon,  9 Oct 2023 22:53:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BE85F80166
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 22:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BE85F80166
Received: from in01.mta.xmission.com ([166.70.13.51]:49338)
	by out01.mta.xmission.com with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <dominic@xmission.com>)
	id 1qpxEs-006YRh-4M
	for alsa-devel@alsa-project.org; Mon, 09 Oct 2023 14:52:30 -0600
Received: from 75-169-140-235.slkc.qwest.net ([75.169.140.235]:47904
 helo=mail.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <dominic@xmission.com>)
	id 1qpxEp-008Lmw-L8
	for alsa-devel@alsa-project.org; Mon, 09 Oct 2023 14:52:29 -0600
Date: Mon, 09 Oct 2023 20:51:31 +0000
Message-ID: <66863cc8301d05bdb5223ae8167be88b.dominic@xmission.com>
From: Dominic Jones <jonesd@xmission.com>
To: alsa-devel@alsa-project.org
Content-Type: text/plain
X-XM-SPF: 
 eid=1qpxEp-008Lmw-L8;;;mid=<66863cc8301d05bdb5223ae8167be88b.dominic@xmission.com>;;;hst=in01.mta.xmission.com;;;ip=75.169.140.235;;;frm=dominic@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1+sE730+8ydDBfUlwil4ELB
X-SA-Exim-Connect-IP: 75.169.140.235
X-SA-Exim-Mail-From: dominic@xmission.com
Subject: Segmentation faults with alsa-lib 1.2.10
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
X-MailFrom: dominic@xmission.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: V37VDTO64HEMXU34OK2I25BZSAIAH44A
X-Message-ID-Hash: V37VDTO64HEMXU34OK2I25BZSAIAH44A
X-Mailman-Approved-At: Sat, 14 Oct 2023 09:24:37 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V37VDTO64HEMXU34OK2I25BZSAIAH44A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Greetings,

After upgrading from alsa-lib 1.2.9 to 1.2.10 I am not receiving segmentation
faults; both the speaker-test program and (external) mpg123 produce faults. (I
suspect it is affecting my browser as well.)

gdb gives SIGSEGV produced by the sndl_pcm_direct_hw_refine function in
/usr/lib/libasound.so.2 for both speaker-test and mpg123.

I've reverted to 1.2.9 and have no issues. I also tested 1.2.8, again with no
issues.

Here's the output from alsa-info.sh:


upload=true&script=true&cardinfo=
!!################################
!!ALSA Information Script v 0.5.3
!!################################

!!Script ran on: Mon Oct  9 20:48:28  2023


!!Linux Distribution
!!------------------




!!DMI Information
!!---------------

Manufacturer:      None
Product Name:      None
Product Version:   None
Firmware Version:  1.0OZ 
System SKU:        
Board Vendor:      FIC
Board Name:        CW001


!!ACPI Device Status Information
!!---------------

/sys/bus/acpi/devices/ACPI0003:00/status 	 15
/sys/bus/acpi/devices/LNXPOWER:00/status 	 1
/sys/bus/acpi/devices/PNP0103:00/status 	 15
/sys/bus/acpi/devices/PNP0C0A:00/status 	 15
/sys/bus/acpi/devices/PNP0C0F:00/status 	 9
/sys/bus/acpi/devices/PNP0C0F:01/status 	 9
/sys/bus/acpi/devices/PNP0C0F:02/status 	 9
/sys/bus/acpi/devices/PNP0C0F:03/status 	 9
/sys/bus/acpi/devices/PNP0C0F:04/status 	 9
/sys/bus/acpi/devices/PNP0C0F:05/status 	 9
/sys/bus/acpi/devices/PNP0C0F:06/status 	 9
/sys/bus/acpi/devices/PNP0C0F:07/status 	 9


!!Kernel Information
!!------------------

Kernel release:    #1 SMP PREEMPT_DYNAMIC Wed Sep 27 10:38:55  2023
Operating System:  Atom(TM) CPU N270 @ 1.60GHz GNU/Linux
Architecture:      i686
Processor:         Intel(R)
SMP Enabled:       Yes


!!ALSA Version
!!------------

Driver version:     k6.5.5
Library version:    1.2.9
Utilities version:  1.2.9


!!Loaded ALSA modules
!!-------------------



!!Sound Servers on this system
!!----------------------------

No sound servers found.


!!Soundcards recognised by ALSA
!!-----------------------------

 0 [Intel          ]: HDA-Intel - HDA Intel
                      HDA Intel at 0xf8440000 irq 25


!!Loaded sound module options
!!---------------------------


!!Sysfs card info
!!---------------

!!Card: /sys/class/sound/card0
Driver: /sys/bus/pci/drivers/snd_hda_intel
Tree:


!!Sysfs ctl-led info
!!---------------

!!CTL-LED: /sys/class/sound/ctl-led/mic/card0
List: 

!!CTL-LED: /sys/class/sound/ctl-led/speaker/card0
List: 

!!HDA-Intel Codec information
!!---------------------------
--startcollapse--

Codec: Realtek ALC269
Address: 0
AFG Function Id: 0x1 (unsol 1)
Vendor Id: 0x10ec0269
Subsystem Id: 0x15095002
Revision Id: 0x100004
No Modem Function Group found
Default PCM:
    rates [0x5f0]: 32000 44100 48000 88200 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
Default Amp-In caps: N/A
Default Amp-Out caps: N/A
State of AFG node 0x01:
  Power states:  D0 D1 D2 D3 CLKSTOP EPSS
  Power: setting=D0, actual=D0
GPIO: io=2, o=0, i=0, unsolicited=1, wake=1
  IO[0]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
  IO[1]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
Node 0x02 [Audio Output] wcaps 0x1d: Stereo Amp-Out
  Control: name="Headphone Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Device: name="ALC269 Analog", type="Audio", device=0
  Amp-Out caps: ofs=0x3f, nsteps=0x40, stepsize=0x03, mute=0
  Amp-Out vals:  [0x27 0x27]
  Converter: stream=5, channel=0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
Node 0x03 [Audio Output] wcaps 0x1d: Stereo Amp-Out
  Control: name="Speaker Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x3f, nsteps=0x40, stepsize=0x03, mute=0
  Amp-Out vals:  [0x27 0x27]
  Converter: stream=5, channel=0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
Node 0x04 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x05 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x06 [Audio Output] wcaps 0x211: Stereo Digital
  Converter: stream=0, channel=0
  Digital:
  Digital category: 0x0
  IEC Coding Type: 0x0
  PCM:
    rates [0x5f0]: 32000 44100 48000 88200 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
Node 0x07 [Audio Input] wcaps 0x10011b: Stereo Amp-In
  Control: name="Capture Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Control: name="Capture Switch", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Device: name="ALC269 Analog", type="Audio", device=0
  Amp-In caps: ofs=0x11, nsteps=0x2e, stepsize=0x03, mute=1
  Amp-In vals:  [0x1d 0x1d]
  Converter: stream=1, channel=0
  SDI-Select: 0
  PCM:
    rates [0x160]: 44100 48000 96000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Connection: 1
     0x24
Node 0x08 [Audio Input] wcaps 0x10011b: Stereo Amp-In
  Amp-In caps: ofs=0x11, nsteps=0x2e, stepsize=0x03, mute=1
  Amp-In vals:  [0x90 0x90]
  Converter: stream=0, channel=0
  SDI-Select: 0
  PCM:
    rates [0x160]: 44100 48000 96000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Connection: 1
     0x23
Node 0x09 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0a [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0b [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Control: name="Internal Mic Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=1, ofs=0
  Control: name="Internal Mic Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=1, ofs=0
  Control: name="Mic Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Control: name="Mic Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Amp-In caps: ofs=0x17, nsteps=0x1f, stepsize=0x05, mute=1
  Amp-In vals:  [0x9f 0x9f] [0x9f 0x9f] [0x80 0x80] [0x80 0x80] [0x80 0x80]
  Connection: 5
     0x18 0x19 0x1a 0x1b 0x1d
Node 0x0c [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x00 0x00] [0x00 0x00]
  Connection: 2
     0x02 0x0b
Node 0x0d [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x00 0x00] [0x00 0x00]
  Connection: 2
     0x03 0x0b
Node 0x0e [Audio Mixer] wcaps 0x20010a: Mono Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x00] [0x80]
  Connection: 2
     0x0c 0x0d
Node 0x0f [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x10 [Audio Output] wcaps 0x211: Stereo Digital
  Converter: stream=0, channel=0
  Digital:
  Digital category: 0x0
  IEC Coding Type: 0x0
  PCM:
    rates [0x5f0]: 32000 44100 48000 88200 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
Node 0x11 [Pin Complex] wcaps 0x400380: Mono Digital
  Pincap 0x00000014: OUT Detect
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Connection: 1
     0x10
Node 0x12 [Pin Complex] wcaps 0x400001: Stereo
  Pincap 0x00000020: IN
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x00:
Node 0x13 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x14 [Pin Complex] wcaps 0x40010d: Stereo Amp-Out
  Control: name="Speaker Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x00010050: OUT EAPD Balanced
  EAPD 0x2: EAPD
  Pin Default 0x99130110: [Fixed] Speaker at Int ATAPI
    Conn = ATAPI, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x40: OUT
  Connection: 2
     0x0c 0x0d*
Node 0x15 [Pin Complex] wcaps 0x40018d: Stereo Amp-Out
  Control: name="Headphone Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x0001001c: OUT HP EAPD Detect
  EAPD 0x2: EAPD
  Pin Default 0x0121401f: [Jack] HP Out at Ext Rear
    Conn = 1/8, Color = Green
    DefAssociation = 0x1, Sequence = 0xf
  Pin-ctls: 0xc0: OUT HP
  Unsolicited: tag=01, enabled=1
  Connection: 2
     0x0c* 0x0d
Node 0x16 [Pin Complex] wcaps 0x40010c: Mono Amp-Out
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80]
  Pincap 0x00000010: OUT
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x00:
  Connection: 1
     0x0e
Node 0x17 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x18 [Pin Complex] wcaps 0x40018f: Stereo Amp-In Amp-Out
  Control: name="Mic Boost Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x02 0x02]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x00003734: IN OUT Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x01a19820: [Jack] Mic at Ext Rear
    Conn = 1/8, Color = Pink
    DefAssociation = 0x2, Sequence = 0x0
  Pin-ctls: 0x24: IN VREF_80
  Unsolicited: tag=02, enabled=1
  Connection: 2
     0x0c* 0x0d
Node 0x19 [Pin Complex] wcaps 0x40018f: Stereo Amp-In Amp-Out
  Control: name="Internal Mic Boost Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=0, ofs=0
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x03 0x03]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x00003734: IN OUT Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x99a3092f: [Fixed] Mic at Int ATAPI
    Conn = ATAPI, Color = Unknown
    DefAssociation = 0x2, Sequence = 0xf
    Misc = NO_PRESENCE
  Pin-ctls: 0x24: IN VREF_80
  Unsolicited: tag=00, enabled=0
  Connection: 2
     0x0c* 0x0d
Node 0x1a [Pin Complex] wcaps 0x40018f: Stereo Amp-In Amp-Out
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x0000373c: IN OUT HP Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x20: IN VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Connection: 2
     0x0c* 0x0d
Node 0x1b [Pin Complex] wcaps 0x40018f: Stereo Amp-In Amp-Out
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x00003734: IN OUT Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x20: IN VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Connection: 2
     0x0c* 0x0d
Node 0x1c [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x1d [Pin Complex] wcaps 0x400000: Mono
  Pincap 0x00000020: IN
  Pin Default 0x40038205: [N/A] Line Out at Ext N/A
    Conn = ATAPI, Color = Purple
    DefAssociation = 0x0, Sequence = 0x5
  Pin-ctls: 0x20: IN
Node 0x1e [Pin Complex] wcaps 0x400380: Mono Digital
  Pincap 0x00000014: OUT Detect
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Connection: 1
     0x06
Node 0x1f [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x20 [Vendor Defined Widget] wcaps 0xf00040: Mono
  Processing caps: benign=0, ncoeff=33
Node 0x21 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x22 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x23 [Audio Selector] wcaps 0x300101: Stereo
  Connection: 7
     0x18* 0x19 0x1a 0x1b 0x1d 0x12 0x0b
Node 0x24 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x80 0x80] [0x00 0x00] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
  Connection: 6
     0x18 0x19 0x1a 0x1b 0x1d 0x0b
--endcollapse--


!!ALSA Device nodes
!!-----------------

crw-rw---- 1 root audio 116,  5 Sep 30 21:28 /dev/snd/controlC0
crw-rw---- 1 root audio 116,  4 Sep 30 21:28 /dev/snd/hwC0D0
crw-rw---- 1 root audio 116,  3 Sep 30 21:28 /dev/snd/pcmC0D0c
crw-rw---- 1 root audio 116,  2 Sep 30 21:28 /dev/snd/pcmC0D0p
crw-rw---- 1 root audio 116,  1 Sep 30 21:28 /dev/snd/seq
crw-rw---- 1 root audio 116, 33 Sep 30 21:28 /dev/snd/timer

/dev/snd/by-path:
total 0
drwxr-xr-x 2 root root  60 Sep 30 21:28 .
drwxr-xr-x 3 root root 180 Sep 30 21:28 ..
lrwxrwxrwx 1 root root  12 Sep 30 21:28 pci-0000:00:1b.0 -> ../controlC0


!!Aplay/Arecord output
!!--------------------

APLAY

**** List of PLAYBACK Hardware Devices ****
card 0: Intel [HDA Intel], device 0: ALC269 Analog [ALC269 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0

ARECORD

**** List of CAPTURE Hardware Devices ****
card 0: Intel [HDA Intel], device 0: ALC269 Analog [ALC269 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0

!!Amixer output
!!-------------

!!-------Mixer controls for card Intel

ALSA lib conf.c:839:(get_char_skip_comments) Cannot access file /usr/share/alsa/pcm/surround21.conf
ALSA lib conf.c:2008:(_snd_config_load_with_include) _toplevel_:74:29:No such file or directory
ALSA lib conf.c:4097:(config_file_open) /usr/share/alsa/cards/HDA-Intel.conf may be old or corrupted: consider to remove or fix it
ALSA lib conf.c:4019:(snd_config_hooks_call) function snd_config_hook_load_for_all_cards returned error: No such file or directory
ALSA lib conf.c:5671:(snd_config_expand) Unknown parameters 0
ALSA lib control.c:1529:(snd_ctl_open_noupdate) Invalid CTL sysdefault:0
amixer: Control device sysdefault:0 open error: Invalid argument
ALSA lib conf.c:839:(get_char_skip_comments) Cannot access file /usr/share/alsa/pcm/surround21.conf
ALSA lib conf.c:2008:(_snd_config_load_with_include) _toplevel_:74:29:No such file or directory
ALSA lib conf.c:4097:(config_file_open) /usr/share/alsa/cards/HDA-Intel.conf may be old or corrupted: consider to remove or fix it
ALSA lib conf.c:4019:(snd_config_hooks_call) function snd_config_hook_load_for_all_cards returned error: No such file or directory
ALSA lib conf.c:5671:(snd_config_expand) Unknown parameters 0
ALSA lib control.c:1529:(snd_ctl_open_noupdate) Invalid CTL sysdefault:0
amixer: Mixer attach sysdefault:0 error: Invalid argument


!!Alsactl output
!!--------------

--startcollapse--
state.Intel {
	control.1 {
		iface MIXER
		name 'Headphone Playback Volume'
		value.0 39
		value.1 39
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 64'
			dbmin -6300
			dbmax 100
			dbvalue.0 -2400
			dbvalue.1 -2400
		}
	}
	control.2 {
		iface MIXER
		name 'Headphone Playback Switch'
		value.0 true
		value.1 true
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.3 {
		iface MIXER
		name 'Speaker Playback Volume'
		value.0 39
		value.1 39
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 64'
			dbmin -6300
			dbmax 100
			dbvalue.0 -2400
			dbvalue.1 -2400
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
		name 'Loopback Mixing'
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
		name 'Internal Mic Playback Volume'
		value.0 31
		value.1 31
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 31'
			dbmin -3450
			dbmax 1200
			dbvalue.0 1200
			dbvalue.1 1200
		}
	}
	control.7 {
		iface MIXER
		name 'Internal Mic Playback Switch'
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
		name 'Mic Playback Volume'
		value.0 31
		value.1 31
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 31'
			dbmin -3450
			dbmax 1200
			dbvalue.0 1200
			dbvalue.1 1200
		}
	}
	control.9 {
		iface MIXER
		name 'Mic Playback Switch'
		value.0 false
		value.1 false
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.10 {
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
	control.11 {
		iface MIXER
		name 'Capture Volume'
		value.0 29
		value.1 29
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 46'
			dbmin -1700
			dbmax 2900
			dbvalue.0 1200
			dbvalue.1 1200
		}
	}
	control.12 {
		iface MIXER
		name 'Capture Switch'
		value.0 true
		value.1 true
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.13 {
		iface MIXER
		name 'Internal Mic Boost Volume'
		value.0 3
		value.1 3
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 3'
			dbmin 0
			dbmax 3000
			dbvalue.0 3000
			dbvalue.1 3000
		}
	}
	control.14 {
		iface MIXER
		name 'Mic Boost Volume'
		value.0 2
		value.1 2
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 3'
			dbmin 0
			dbmax 3000
			dbvalue.0 2000
			dbvalue.1 2000
		}
	}
	control.15 {
		iface MIXER
		name 'Master Playback Volume'
		value 64
		comment {
			access 'read write'
			type INTEGER
			count 1
			range '0 - 64'
			dbmin -6400
			dbmax 0
			dbvalue.0 0
		}
	}
	control.16 {
		iface MIXER
		name 'Master Playback Switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.17 {
		iface CARD
		name 'Internal Mic Phantom Jack'
		value true
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.18 {
		iface CARD
		name 'Mic Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.19 {
		iface CARD
		name 'Headphone Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.20 {
		iface CARD
		name 'Speaker Phantom Jack'
		value true
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.21 {
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
	control.22 {
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
	control.23 {
		iface MIXER
		name 'PCM Playback Volume'
		value.0 255
		value.1 255
		comment {
			access 'read write user'
			type INTEGER
			count 2
			range '0 - 255'
			tlv '0000000100000008ffffec1400000014'
			dbmin -5100
			dbmax 0
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.24 {
		iface MIXER
		name 'Digital Capture Volume'
		value.0 60
		value.1 60
		comment {
			access 'read write user'
			type INTEGER
			count 2
			range '0 - 120'
			tlv '0000000100000008fffff44800000032'
			dbmin -3000
			dbmax 3000
			dbvalue.0 0
			dbvalue.1 0
		}
	}
}
--endcollapse--


!!All Loaded Modules
!!------------------



!!Sysfs Files
!!-----------

/sys/class/sound/hwC0D0/init_pin_configs:
0x11 0x411111f0
0x12 0x411111f0
0x14 0x99130110
0x15 0x0121401f
0x16 0x411111f0
0x18 0x01a19820
0x19 0x99a3092f
0x1a 0x411111f0
0x1b 0x411111f0
0x1d 0x40038205
0x1e 0x411111f0

/sys/class/sound/hwC0D0/driver_pin_configs:

/sys/class/sound/hwC0D0/user_pin_configs:

/sys/class/sound/hwC0D0/init_verbs:

/sys/class/sound/hwC0D0/hints:


!!ALSA/HDA dmesg
!!--------------

[    1.668743] IPI shorthand broadcast: enabled
[    1.676620] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC269: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[    1.676644] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    1.676681] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x15/0x0/0x0/0x0/0x0)
[    1.676695] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
[    1.676704] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[    1.676712] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=0x19
[    1.676723] snd_hda_codec_realtek hdaudioC0D0:      Mic=0x18
[    1.691169] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input4
--
[    1.722576] kworker/u4:6 (580) used greatest stack depth: 6828 bytes left
[    1.726213] input: HDA Intel Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input6
[    1.726847] input: HDA Intel Headphone as /devices/pci0000:00/0000:00:1b.0/sound/card0/input7
[    1.785877] registered taskstats version 1
--
[    1.807491] clk: Disabling unused clocks
[    1.807500] ALSA device list:
[    1.807505]   #0: HDA Intel at 0xf8440000 irq 25
[    1.816590] usb 2-4: new high-speed USB device number 2 using ehci-pci
--
[143878.975626] usb 2-2: new high-speed USB device number 16 using ehci-pci
[191816.310342] mpg123[9128]: segfault at 10f ip b7af5543 sp bfe86d70 error 4 in libasound.so.2.0.0[b7a76000+b4000] likely on CPU 0 (core 0, socket 0)
[191816.310476] Code: 85 ca fc ff ff 8b 4e 28 85 c9 0f 85 bf fc ff ff 83 8e 04 02 00 00 02 e9 be fc ff ff 8d 76 00 8b 4d 1c 8d 58 ff 85 c3 8d 7e 24 <8b> 89 0c 01 00 00 0f 85 e4 01 00 00 8b 5e 28 31 c0 85 db 0f 94 c0
[191820.490998] mpg123[9129]: segfault at 10f ip b7bb9543 sp bfaddbd0 error 4 in libasound.so.2.0.0[b7b3a000+b4000] likely on CPU 0 (core 0, socket 0)
[191820.491057] Code: 85 ca fc ff ff 8b 4e 28 85 c9 0f 85 bf fc ff ff 83 8e 04 02 00 00 02 e9 be fc ff ff 8d 76 00 8b 4d 1c 8d 58 ff 85 c3 8d 7e 24 <8b> 89 0c 01 00 00 0f 85 e4 01 00 00 8b 5e 28 31 c0 85 db 0f 94 c0
[191826.361500] mpg123[9130]: segfault at 10f ip b7b46543 sp bfc01a80 error 4 in libasound.so.2.0.0[b7ac7000+b4000] likely on CPU 1 (core 0, socket 0)
[191826.361560] Code: 85 ca fc ff ff 8b 4e 28 85 c9 0f 85 bf fc ff ff 83 8e 04 02 00 00 02 e9 be fc ff ff 8d 76 00 8b 4d 1c 8d 58 ff 85 c3 8d 7e 24 <8b> 89 0c 01 00 00 0f 85 e4 01 00 00 8b 5e 28 31 c0 85 db 0f 94 c0
[191865.493256] mpg123[9149]: segfault at 10f ip b7af3543 sp bfd08360 error 4 in libasound.so.2.0.0[b7a74000+b4000] likely on CPU 0 (core 0, socket 0)
[191865.493316] Code: 85 ca fc ff ff 8b 4e 28 85 c9 0f 85 bf fc ff ff 83 8e 04 02 00 00 02 e9 be fc ff ff 8d 76 00 8b 4d 1c 8d 58 ff 85 c3 8d 7e 24 <8b> 89 0c 01 00 00 0f 85 e4 01 00 00 8b 5e 28 31 c0 85 db 0f 94 c0
--
[230465.981315] usb 2-2: USB disconnect, device number 17
[253510.004991] mpg123[6875]: segfault at 10f ip b7bce543 sp bfd00b90 error 4 in libasound.so.2.0.0[b7b4f000+b4000] likely on CPU 1 (core 0, socket 0)
[253510.005065] Code: 85 ca fc ff ff 8b 4e 28 85 c9 0f 85 bf fc ff ff 83 8e 04 02 00 00 02 e9 be fc ff ff 8d 76 00 8b 4d 1c 8d 58 ff 85 c3 8d 7e 24 <8b> 89 0c 01 00 00 0f 85 e4 01 00 00 8b 5e 28 31 c0 85 db 0f 94 c0
--
[261613.578052] usb 2-2: USB disconnect, device number 21
[270748.034420] mpg123[6355]: segfault at 10f ip b7b1b543 sp bfb67510 error 4 in libasound.so.2.0.0[b7a9c000+b4000] likely on CPU 0 (core 0, socket 0)
[270748.034499] Code: 85 ca fc ff ff 8b 4e 28 85 c9 0f 85 bf fc ff ff 83 8e 04 02 00 00 02 e9 be fc ff ff 8d 76 00 8b 4d 1c 8d 58 ff 85 c3 8d 7e 24 <8b> 89 0c 01 00 00 0f 85 e4 01 00 00 8b 5e 28 31 c0 85 db 0f 94 c0
--
[316777.074493] usb 2-2: new high-speed USB device number 23 using ehci-pci
[341526.953740] mpg123[13483]: segfault at 111 ip b7b4d543 sp bfc9d5a0 error 4 in libasound.so.2.0.0[b7ace000+b4000] likely on CPU 0 (core 0, socket 0)
[341526.953802] Code: 85 ca fc ff ff 8b 4e 28 85 c9 0f 85 bf fc ff ff 83 8e 04 02 00 00 02 e9 be fc ff ff 8d 76 00 8b 4d 1c 8d 58 ff 85 c3 8d 7e 24 <8b> 89 0c 01 00 00 0f 85 e4 01 00 00 8b 5e 28 31 c0 85 db 0f 94 c0
--
[439748.188581] usb 2-2: USB disconnect, device number 41
[453714.319633] mpg123[25848]: segfault at 10f ip b7b90543 sp bff08560 error 4 in libasound.so.2.0.0[b7b11000+b4000] likely on CPU 1 (core 0, socket 0)
[453714.319693] Code: 85 ca fc ff ff 8b 4e 28 85 c9 0f 85 bf fc ff ff 83 8e 04 02 00 00 02 e9 be fc ff ff 8d 76 00 8b 4d 1c 8d 58 ff 85 c3 8d 7e 24 <8b> 89 0c 01 00 00 0f 85 e4 01 00 00 8b 5e 28 31 c0 85 db 0f 94 c0
[453719.325767] mpg123[25849]: segfault at 10f ip b7bb1543 sp bfeb5080 error 4 in libasound.so.2.0.0[b7b32000+b4000] likely on CPU 1 (core 0, socket 0)
[453719.325829] Code: 85 ca fc ff ff 8b 4e 28 85 c9 0f 85 bf fc ff ff 83 8e 04 02 00 00 02 e9 be fc ff ff 8d 76 00 8b 4d 1c 8d 58 ff 85 c3 8d 7e 24 <8b> 89 0c 01 00 00 0f 85 e4 01 00 00 8b 5e 28 31 c0 85 db 0f 94 c0
[453729.159576] mpg123[25850]: segfault at 10f ip b7b3e543 sp bfe38d10 error 4 in libasound.so.2.0.0[b7abf000+b4000] likely on CPU 0 (core 0, socket 0)
[453729.159636] Code: 85 ca fc ff ff 8b 4e 28 85 c9 0f 85 bf fc ff ff 83 8e 04 02 00 00 02 e9 be fc ff ff 8d 76 00 8b 4d 1c 8d 58 ff 85 c3 8d 7e 24 <8b> 89 0c 01 00 00 0f 85 e4 01 00 00 8b 5e 28 31 c0 85 db 0f 94 c0
[453734.975825] mpg123[25851]: segfault at 10f ip b7b50543 sp bf9f71d0 error 4 in libasound.so.2.0.0[b7ad1000+b4000] likely on CPU 0 (core 0, socket 0)
[453734.975885] Code: 85 ca fc ff ff 8b 4e 28 85 c9 0f 85 bf fc ff ff 83 8e 04 02 00 00 02 e9 be fc ff ff 8d 76 00 8b 4d 1c 8d 58 ff 85 c3 8d 7e 24 <8b> 89 0c 01 00 00 0f 85 e4 01 00 00 8b 5e 28 31 c0 85 db 0f 94 c0
[453828.087527] mpg123[25855]: segfault at 111 ip b79e4543 sp bfe12580 error 4 in libasound.so.2.0.0[b7965000+b4000] likely on CPU 1 (core 0, socket 0)
[453828.087587] Code: 85 ca fc ff ff 8b 4e 28 85 c9 0f 85 bf fc ff ff 83 8e 04 02 00 00 02 e9 be fc ff ff 8d 76 00 8b 4d 1c 8d 58 ff 85 c3 8d 7e 24 <8b> 89 0c 01 00 00 0f 85 e4 01 00 00 8b 5e 28 31 c0 85 db 0f 94 c0
[453845.216423] mpg123[25857]: segfault at 10f ip b7bac543 sp bfff89e0 error 4 in libasound.so.2.0.0[b7b2d000+b4000] likely on CPU 1 (core 0, socket 0)
[453845.216484] Code: 85 ca fc ff ff 8b 4e 28 85 c9 0f 85 bf fc ff ff 83 8e 04 02 00 00 02 e9 be fc ff ff 8d 76 00 8b 4d 1c 8d 58 ff 85 c3 8d 7e 24 <8b> 89 0c 01 00 00 0f 85 e4 01 00 00 8b 5e 28 31 c0 85 db 0f 94 c0
[454522.006832] mpg123[25916]: segfault at 10f ip b7b26543 sp bfdc1300 error 4 in libasound.so.2.0.0[b7aa7000+b4000] likely on CPU 1 (core 0, socket 0)
[454522.006894] Code: 85 ca fc ff ff 8b 4e 28 85 c9 0f 85 bf fc ff ff 83 8e 04 02 00 00 02 e9 be fc ff ff 8d 76 00 8b 4d 1c 8d 58 ff 85 c3 8d 7e 24 <8b> 89 0c 01 00 00 0f 85 e4 01 00 00 8b 5e 28 31 c0 85 db 0f 94 c0
[454544.330604] speaker-test[25918]: segfault at 10f ip b7ec5543 sp bffd26a0 error 4 in libasound.so.2.0.0[b7e46000+b4000] likely on CPU 0 (core 0, socket 0)
[454544.330689] Code: 85 ca fc ff ff 8b 4e 28 85 c9 0f 85 bf fc ff ff 83 8e 04 02 00 00 02 e9 be fc ff ff 8d 76 00 8b 4d 1c 8d 58 ff 85 c3 8d 7e 24 <8b> 89 0c 01 00 00 0f 85 e4 01 00 00 8b 5e 28 31 c0 85 db 0f 94 c0
--
[747874.405592] hid-generic 0003:0488:0280.0008: input,hidraw0: USB HID v1.11 Mouse [Cirque Corporation 9925 AG Touchpad] on usb-0000:00:1d.2-1/input0
[767734.555981] speaker-test[2524]: segfault at 10f ip b7ed1543 sp bfd8f690 error 4 in libasound.so.2.0.0[b7e52000+b4000] likely on CPU 1 (core 0, socket 0)
[767734.556042] Code: 85 ca fc ff ff 8b 4e 28 85 c9 0f 85 bf fc ff ff 83 8e 04 02 00 00 02 e9 be fc ff ff 8d 76 00 8b 4d 1c 8d 58 ff 85 c3 8d 7e 24 <8b> 89 0c 01 00 00 0f 85 e4 01 00 00 8b 5e 28 31 c0 85 db 0f 94 c0



---

Dominic Jones
jonesd@xmission.com

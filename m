Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FA0A4DEC
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 05:54:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EA291693;
	Mon,  2 Sep 2019 05:53:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EA291693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567396483;
	bh=G8lOG2mahdVaclGon6FjPSqeY9XDYgofNOYaJdTkKjA=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ow5NFkON+c9yucmBI0zSJc6C/gBWZs6Dd+rxA829+WlSXjmJ49LV5VuteMBmNWszA
	 Q8VNAAT6Mq4+fl5imNEVuAEutnmtex84v1AZ304RJJNX00BWXV74jZIpjl4DO3YYc/
	 qLi+Gbqau0NcHp6TdhX9Cx4Z1RuDi/2lGLHgheV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D946CF80394;
	Mon,  2 Sep 2019 05:52:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06242F803D0; Mon,  2 Sep 2019 05:52:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from server54-2.web-hosting.com (server54-2.web-hosting.com
 [198.54.126.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00C1EF80392
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 05:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00C1EF80392
Received: from [::1] (port=47012 helo=server54.web-hosting.com)
 by server54.web-hosting.com with esmtpa (Exim 4.92)
 (envelope-from <admin@grossmann-venter.com>) id 1i4dOR-000mD5-Rb
 for alsa-devel@alsa-project.org; Sun, 01 Sep 2019 23:52:45 -0400
MIME-Version: 1.0
Date: Sun, 01 Sep 2019 23:52:39 -0400
From: liebrecht@grossmann-venter.com
To: alsa-devel@alsa-project.org
Message-ID: <81eb4582218795fd622fa1a9f4784178@grossmann-venter.com>
X-Sender: admin@grossmann-venter.com
User-Agent: Roundcube Webmail/1.3.7
X-OutGoing-Spam-Status: No, score=0.1
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - server54.web-hosting.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - grossmann-venter.com
X-Get-Message-Sender-Via: server54.web-hosting.com: authenticated_id:
 liebrecht@grossmann-venter.com
X-Authenticated-Sender: server54.web-hosting.com: liebrecht@grossmann-venter.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: rewritten was: [admin@grossmann-venter.com],
 actual sender does not match
Subject: [alsa-devel] bug
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Clearly a problem with Alsa.
Alsa reports  "Most likely this is a bug in the ALSA driver 
'snd_usb_audio'."

Alsa used to work great.
howevere recently it takes 1/2-1hour for pulseaudio to convince alsa to 
make the 1818VSL available.
Jack is not involved at all.
Pulseaudio connects straight to alsa.
Pulseaudio is my saving grace roight now as it perpetually tries to 
initialize and get alsa to present the audio interface, which it 
eventually after an hour does "waking up"

Also sorts of decides to "wake up" and then suddenly the 1818vsl is 
found.

How do I "wake up" alsa so that I can use soundcards.
I cannot wait an hour after reboot or logout to get alsa to work again.


See below


What  happens after starting pulseaudio is that it cycles the 1818 for 
about 1/2 hour to get a link to the 181vsl soundcard. That is the first 
paragraph (1) below which is perpetually cycled by pulseaudio.
Eventually it succeeds which gives the BUG comment as below in paragraph 
(2)
-------------------------------------------------------
1)
E: [pulseaudio] udev-util.c: Failed to get card object.
E: [pulseaudio] module-alsa-card.c: Failed to find a working profile.
E: [pulseaudio] module.c: Failed to load module "module-alsa-card" 
(argument: "device_id="3" name="usb-PreSonus_AudioBox_1818_VSL_2209-00" 
card_name="alsa_card.usb-PreSonus_Audio.Box_1818_VSL_2209-00" 
namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no 
deferred_volume=yes use_ucm=yes 
card_properties="module-udev-detect.discovered=1""): initialization 
failed.
(**Note this message is cycled for an hour**)

2)
(**Then miraculously....Alsa wakes up and pulseaudio can connect to 
1818vsl **)
E: [alsa-sink-USB Audio] alsa-sink.c: ALSA woke us up to write new data 
to the device, but there was actually nothing to write.
E: [alsa-sink-USB Audio] alsa-sink.c: Most likely this is a bug in the 
ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA 
developers.
E: [alsa-sink-USB Audio] alsa-sink.c: We were woken up with POLLOUT set 
-- however a subsequent snd_pcm_avail() returned 0 or another value < 
min_avail.

------------------------------------------------------


Dont know what happened top Also to behave this way.
Maybe someone has an idea ?





upload=true&script=true&cardinfo=
!!################################
!!ALSA Information Script v 0.4.64
!!################################

!!Script ran on: Mon Sep  2 03:27:26 UTC 2019


!!Linux Distribution
!!------------------

[1;36mWelcome to [1;33mMX Linux[1;36m! Powered by 
[1;33mDebian[1;36m.[0m PRETTY_NAME="Debian GNU/Linux 9 (stretch)" 
NAME="Debian GNU/Linux" ID=debian HOME_URL="https://www.debian.org/" 
SUPPORT_URL="https://www.debian.org/support" 
BUG_REPORT_URL="https://bugs.debian.org/" MX-18.3_x64 Continuum Dec 20, 
2018 MX-18.3_x64 Continuum Dec 20, 2018


!!DMI Information
!!---------------

Manufacturer:      Supermicro
Product Name:      H8DGU
Product Version:   1234567890
Firmware Version:  3.5c
Board Vendor:      Supermicro
Board Name:        H8DGU


!!ACPI Device Status Information
!!---------------

/sys/bus/acpi/devices/PNP0103:00/status 	 15
/sys/bus/acpi/devices/PNP0501:00/status 	 15
/sys/bus/acpi/devices/PNP0501:01/status 	 15
/sys/bus/acpi/devices/PNP0C0C:00/status 	 11
/sys/bus/acpi/devices/PNP0C0F:00/status 	 9
/sys/bus/acpi/devices/PNP0C0F:01/status 	 9
/sys/bus/acpi/devices/PNP0C0F:02/status 	 9
/sys/bus/acpi/devices/PNP0C0F:03/status 	 9
/sys/bus/acpi/devices/PNP0C0F:04/status 	 9
/sys/bus/acpi/devices/PNP0C0F:05/status 	 9
/sys/bus/acpi/devices/PNP0C0F:06/status 	 9
/sys/bus/acpi/devices/PNP0C0F:07/status 	 9
/sys/bus/acpi/devices/device:1e/status 	 15
/sys/bus/acpi/devices/device:1f/status 	 15
/sys/bus/acpi/devices/device:21/status 	 15
/sys/bus/acpi/devices/device:22/status 	 15


!!Kernel Information
!!------------------

Kernel release:    4.19.0-5-amd64
Operating System:  GNU/Linux
Architecture:      x86_64
Processor:         unknown
SMP Enabled:       Yes


!!ALSA Version
!!------------

Driver version:     k4.19.0-5-amd64
Library version:    1.1.9
Utilities version:  1.1.3


!!Loaded ALSA modules
!!-------------------

snd_hda_intel
snd_usb_audio
snd_usb_audio


!!Sound Servers on this system
!!----------------------------

Pulseaudio:
       Installed - Yes (/usr/bin/pulseaudio)
       Running - Yes

Jack:
       Installed - Yes (/usr/bin/jackd)
       Running - No


!!Soundcards recognised by ALSA
!!-----------------------------

  0 [HDMI           ]: HDA-Intel - HDA ATI HDMI
                       HDA ATI HDMI at 0xfebfc000 irq 46
  1 [Interface      ]: USB-Audio - USB Uno MIDI Interface
                       M-Audio USB Uno MIDI Interface at 
usb-0000:00:12.2-1.2.3, full speed
  2 [M1x1           ]: USB-Audio - MidiSport 1x1
                       M-Audio MidiSport 1x1 at usb-0000:00:12.2-1.2.2, 
full speed


!!PCI Soundcards installed in the system
!!--------------------------------------

03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Device aae0


!!Advanced information - PCI Vendor/Device/Subsystem ID's
!!-------------------------------------------------------

03:00.1 0403: 1002:aae0
	Subsystem: 1462:aae0


!!Modprobe options (Sound related)
!!--------------------------------

snd_pcsp: index=-2
snd_usb_audio: index=-2
snd_atiixp_modem: index=-2
snd_intel8x0m: index=-2
snd_via82xx_modem: index=-2


!!Loaded sound module options
!!---------------------------

!!Module: snd_hda_intel
	align_buffer_size : -1
	bdl_pos_adj : 
-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	beep_mode : 
Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
	enable : 
Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
	enable_msi : -1
	id : 
(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	index : 
-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	jackpoll_ms : 
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	model : 
(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	patch : 
(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	pm_blacklist : Y
	position_fix : 
-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	power_save : 0
	power_save_controller : N
	probe_mask : 
-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	probe_only : 
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	single_cmd : -1
	snoop : -1

!!Module: snd_usb_audio
	autoclock : Y
	device_setup : 
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	enable : 
Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
	id : 
(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	ignore_ctl_error : N
	index : 
-2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	pid : 
-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	quirk_alias : 
(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	use_vmalloc : Y
	vid : 
-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1

!!Module: snd_usb_audio
	autoclock : Y
	device_setup : 
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	enable : 
Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
	id : 
(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	ignore_ctl_error : N
	index : 
-2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	pid : 
-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	quirk_alias : 
(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	use_vmalloc : Y
	vid : 
-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1


!!HDA-Intel Codec information
!!---------------------------
--startcollapse--

Codec: ATI R6xx HDMI
Address: 0
AFG Function Id: 0x1 (unsol 0)
Vendor Id: 0x1002aa01
Subsystem Id: 0x00aa0100
Revision Id: 0x100700
No Modem Function Group found
Default PCM:
     rates [0x70]: 32000 44100 48000
     bits [0x2]: 16
     formats [0x1]: PCM
Default Amp-In caps: N/A
Default Amp-Out caps: N/A
State of AFG node 0x01:
   Power states:  D0 D3 CLKSTOP EPSS
   Power: setting=D0, actual=D0, Clock-stop-OK
GPIO: io=0, o=0, i=0, unsolicited=0, wake=0
Node 0x02 [Audio Output] wcaps 0x221: Stereo Digital Stripe
   Converter: stream=0, channel=0
   Digital: Enabled
   Digital category: 0x0
   IEC Coding Type: 0x0
Node 0x03 [Pin Complex] wcaps 0x400381: Stereo Digital
   Control: name="IEC958 Playback Con Mask", index=0, device=0
   Control: name="IEC958 Playback Pro Mask", index=0, device=0
   Control: name="IEC958 Playback Default", index=0, device=0
   Control: name="IEC958 Playback Switch", index=0, device=0
   Pincap 0x00000094: OUT Detect HDMI
   Pin Default 0x185600f0: [Jack] Digital Out at Int HDMI
     Conn = Digital, Color = Unknown
     DefAssociation = 0xf, Sequence = 0x0
   Pin-ctls: 0x40: OUT
   Unsolicited: tag=01, enabled=1
   Connection: 1
      0x02
Node 0x04 [Audio Output] wcaps 0x221: Stereo Digital Stripe
   Converter: stream=0, channel=0
   Digital: Enabled
   Digital category: 0x0
   IEC Coding Type: 0x0
Node 0x05 [Pin Complex] wcaps 0x400381: Stereo Digital
   Control: name="IEC958 Playback Con Mask", index=1, device=0
   Control: name="IEC958 Playback Pro Mask", index=1, device=0
   Control: name="IEC958 Playback Default", index=1, device=0
   Control: name="IEC958 Playback Switch", index=1, device=0
   Pincap 0x00000094: OUT Detect HDMI
   Pin Default 0x185600f0: [Jack] Digital Out at Int HDMI
     Conn = Digital, Color = Unknown
     DefAssociation = 0xf, Sequence = 0x0
   Pin-ctls: 0x40: OUT
   Unsolicited: tag=02, enabled=1
   Connection: 1
      0x04
Node 0x06 [Audio Output] wcaps 0x221: Stereo Digital Stripe
   Converter: stream=0, channel=0
   Digital: Enabled
   Digital category: 0x0
   IEC Coding Type: 0x0
Node 0x07 [Pin Complex] wcaps 0x400381: Stereo Digital
   Control: name="IEC958 Playback Con Mask", index=2, device=0
   Control: name="IEC958 Playback Pro Mask", index=2, device=0
   Control: name="IEC958 Playback Default", index=2, device=0
   Control: name="IEC958 Playback Switch", index=2, device=0
   Pincap 0x00000094: OUT Detect HDMI
   Pin Default 0x185600f0: [Jack] Digital Out at Int HDMI
     Conn = Digital, Color = Unknown
     DefAssociation = 0xf, Sequence = 0x0
   Pin-ctls: 0x40: OUT
   Unsolicited: tag=03, enabled=1
   Connection: 1
      0x06
Node 0x08 [Audio Output] wcaps 0x221: Stereo Digital Stripe
   Converter: stream=0, channel=0
   Digital: Enabled
   Digital category: 0x0
   IEC Coding Type: 0x0
Node 0x09 [Pin Complex] wcaps 0x400381: Stereo Digital
   Control: name="IEC958 Playback Con Mask", index=3, device=0
   Control: name="IEC958 Playback Pro Mask", index=3, device=0
   Control: name="IEC958 Playback Default", index=3, device=0
   Control: name="IEC958 Playback Switch", index=3, device=0
   Pincap 0x00000094: OUT Detect HDMI
   Pin Default 0x185600f0: [Jack] Digital Out at Int HDMI
     Conn = Digital, Color = Unknown
     DefAssociation = 0xf, Sequence = 0x0
   Pin-ctls: 0x40: OUT
   Unsolicited: tag=04, enabled=1
   Connection: 1
      0x08
Node 0x0a [Audio Output] wcaps 0x221: Stereo Digital Stripe
   Converter: stream=1, channel=0
   Digital: Enabled
   Digital category: 0x0
   IEC Coding Type: 0x0
Node 0x0b [Pin Complex] wcaps 0x400381: Stereo Digital
   Control: name="IEC958 Playback Con Mask", index=4, device=0
   Control: name="IEC958 Playback Pro Mask", index=4, device=0
   Control: name="IEC958 Playback Default", index=4, device=0
   Control: name="IEC958 Playback Switch", index=4, device=0
   Pincap 0x00000094: OUT Detect HDMI
   Pin Default 0x185600f0: [Jack] Digital Out at Int HDMI
     Conn = Digital, Color = Unknown
     DefAssociation = 0xf, Sequence = 0x0
   Pin-ctls: 0x40: OUT
   Unsolicited: tag=05, enabled=1
   Connection: 1
      0x0a
Node 0x0c [Audio Output] wcaps 0x221: Stereo Digital Stripe
   Converter: stream=0, channel=0
   Digital:
   Digital category: 0x0
   IEC Coding Type: 0x0
Node 0x0d [Pin Complex] wcaps 0x400381: Stereo Digital
   Pincap 0x00000094: OUT Detect HDMI
   Pin Default 0x585600f0: [N/A] Digital Out at Int HDMI
     Conn = Digital, Color = Unknown
     DefAssociation = 0xf, Sequence = 0x0
   Pin-ctls: 0x40: OUT
   Unsolicited: tag=00, enabled=0
   Connection: 1
      0x0c
--endcollapse--


!!USB Mixer information
!!---------------------
--startcollapse--

USB Mixer: usb_id=0x07630150, ctrlif=0, ctlerr=0
Card: M-Audio USB Uno MIDI Interface at usb-0000:00:12.2-1.2.3, full 
speed
--endcollapse--


!!ALSA Device nodes
!!-----------------

crw-rw---- 1 root audio 116,  8 Sep  1 04:44 /dev/snd/controlC0
crw-rw---- 1 root audio 116, 10 Sep  1 06:36 /dev/snd/controlC1
crw-rw---- 1 root audio 116, 12 Sep  1 06:36 /dev/snd/controlC2
crw-rw---- 1 root audio 116,  7 Sep  1 04:44 /dev/snd/hwC0D0
crw-rw---- 1 root audio 116,  9 Sep  1 06:36 /dev/snd/midiC1D0
crw-rw---- 1 root audio 116, 11 Sep  1 06:36 /dev/snd/midiC2D0
crw-rw---- 1 root audio 116,  6 Sep  1 23:17 /dev/snd/pcmC0D10p
crw-rw---- 1 root audio 116,  2 Sep  1 23:17 /dev/snd/pcmC0D3p
crw-rw---- 1 root audio 116,  3 Sep  1 23:17 /dev/snd/pcmC0D7p
crw-rw---- 1 root audio 116,  4 Sep  1 23:17 /dev/snd/pcmC0D8p
crw-rw---- 1 root audio 116,  5 Sep  1 23:17 /dev/snd/pcmC0D9p
crw-rw---- 1 root audio 116,  1 Sep  1 05:13 /dev/snd/seq
crw-rw---- 1 root audio 116, 33 Sep  1 04:44 /dev/snd/timer

/dev/snd/by-id:
total 0
drwxr-xr-x 2 root root  80 Sep  1 22:40 .
drwxr-xr-x 4 root root 340 Sep  1 22:40 ..
lrwxrwxrwx 1 root root  12 Sep  1 06:36 usb-0763_1011-00 -> ../controlC2
lrwxrwxrwx 1 root root  12 Sep  1 06:36 
usb-M-Audio_USB_Uno_MIDI_Interface-00 -> ../controlC1

/dev/snd/by-path:
total 0
drwxr-xr-x 2 root root 100 Sep  1 22:40 .
drwxr-xr-x 4 root root 340 Sep  1 22:40 ..
lrwxrwxrwx 1 root root  12 Sep  1 06:36 pci-0000:00:12.2-usb-0:1.2.2:1.0 
-> ../controlC2
lrwxrwxrwx 1 root root  12 Sep  1 06:36 pci-0000:00:12.2-usb-0:1.2.3:1.0 
-> ../controlC1
lrwxrwxrwx 1 root root  12 Sep  1 04:44 pci-0000:03:00.1 -> ../controlC0


!!ALSA configuration files
!!------------------------

!!System wide config file (/etc/asound.conf)

# v4.0
# Requires alsa-utils libasound2-plugin-equal



# ***** Defaults *******************************************************

# Audio card/chip and device to use and control
# In most cases these settings should remain commented (#)
# When commented, card and device 0 are usually automatically selected
# When uncommented, the item corresponding to the number is selected
#defaults.pcm.card 0
#defaults.pcm.device 0
#defaults.ctl.card 0



# ***** Reset **********************************************************

# override the existing definition of the default device
pcm.!default
{
    type plug

    # point output to the equalizer device
    slave.pcm plugequal
}



# ***** Equalizer ******************************************************

# set up the control interface of the equalizer device
ctl.equalizer
{
    type equal
}


# set up the equalizer device
pcm.plugequal
{
    type equal

    # point output to device named preamp
    slave.pcm  "plug:preamp"
}



# ***** Pre-Amp ********************************************************

# set up the preamp device
pcm.preamp
{
    type softvol

    # name of slider control to display in alsamixer interface
    control.name Pre-Amp

    # minimum dB when slider is at 0%
    min_dB -5.0

    # maximum dB when slider is at 100%
    max_dB 40.0

    # point output to device named duplex
    slave.pcm "duplex"
}



# ***** Playback and Capture *******************************************

# set up the playback/capture device
pcm.duplex
{
    type asym

    # point playback output to use dmix
    playback.pcm "dmix"

    # point capture input record to use dsnoop
    capture.pcm "dsnoop"
}


!!Aplay/Arecord output
!!--------------------

APLAY

**** List of PLAYBACK Hardware Devices ****
card 0: HDMI [HDA ATI HDMI], device 3: HDMI 0 [HDMI 0]
   Subdevices: 1/1
   Subdevice #0: subdevice #0
card 0: HDMI [HDA ATI HDMI], device 7: HDMI 1 [HDMI 1]
   Subdevices: 1/1
   Subdevice #0: subdevice #0
card 0: HDMI [HDA ATI HDMI], device 8: HDMI 2 [HDMI 2]
   Subdevices: 1/1
   Subdevice #0: subdevice #0
card 0: HDMI [HDA ATI HDMI], device 9: HDMI 3 [HDMI 3]
   Subdevices: 1/1
   Subdevice #0: subdevice #0
card 0: HDMI [HDA ATI HDMI], device 10: HDMI 4 [HDMI 4]
   Subdevices: 1/1
   Subdevice #0: subdevice #0

ARECORD

**** List of CAPTURE Hardware Devices ****

!!Amixer output
!!-------------

!!-------Mixer controls for card 0 [HDMI]

Card hw:0 'HDMI'/'HDA ATI HDMI at 0xfebfc000 irq 46'
   Mixer name	: 'ATI R6xx HDMI'
   Components	: 'HDA:1002aa01,00aa0100,00100700'
   Controls      : 35
   Simple ctrls  : 5
Simple mixer control 'IEC958',0
   Capabilities: pswitch pswitch-joined
   Playback channels: Mono
   Mono: Playback [on]
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

!!-------Mixer controls for card 1 [Interface]

Card hw:1 'Interface'/'M-Audio USB Uno MIDI Interface at 
usb-0000:00:12.2-1.2.3, full speed'
   Mixer name	: 'USB Mixer'
   Components	: 'USB0763:0150'
   Controls      : 1
   Simple ctrls  : 0

!!-------Mixer controls for card 2 [M1x1]

Card hw:2 'M1x1'/'M-Audio MidiSport 1x1 at usb-0000:00:12.2-1.2.2, full 
speed'
   Mixer name	: ''
   Components	: 'USB0763:1011'
   Controls      : 0
   Simple ctrls  : 0


!!Alsactl output
!!--------------

--startcollapse--
state.HDMI {
	control.1 {
		iface CARD
		name 'HDMI/DP,pcm=3 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.2 {
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
	control.3 {
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
	control.4 {
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
	control.5 {
		iface MIXER
		name 'IEC958 Playback Switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.6 {
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
	control.7 {
		iface CARD
		name 'HDMI/DP,pcm=7 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.8 {
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
	control.9 {
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
	control.10 {
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
	control.11 {
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
	control.12 {
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
	control.13 {
		iface CARD
		name 'HDMI/DP,pcm=8 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.14 {
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
	control.15 {
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
	control.16 {
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
	control.17 {
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
	control.18 {
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
	control.19 {
		iface CARD
		name 'HDMI/DP,pcm=9 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.20 {
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
	control.21 {
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
	control.22 {
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
	control.23 {
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
	control.24 {
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
	control.25 {
		iface CARD
		name 'HDMI/DP,pcm=10 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.26 {
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
	control.27 {
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
	control.28 {
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
	control.29 {
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
	control.30 {
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
	control.31 {
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
	control.32 {
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
	control.33 {
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
	control.34 {
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
	control.35 {
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
}
state.Interface {
	control.1 {
		iface CARD
		name 'Keep Interface'
		value false
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
}
state.M1x1 {
	control {
	}
}
--endcollapse--


!!All Loaded Modules
!!------------------

Module
snd_seq_dummy
snd_seq_midi
snd_seq_midi_event
snd_seq
bnep
rpcsec_gss_krb5
nfsv4
dns_resolver
nfs
fscache
cpufreq_userspace
cpufreq_conservative
cpufreq_powersave
bluetooth
pci_stub
vboxpci
drbg
ansi_cprng
vboxnetadp
ecdh_generic
rfkill
vboxnetflt
vboxdrv
ftdi_sio
usbserial
binfmt_misc
snd_usb_audio
snd_usbmidi_lib
snd_rawmidi
snd_seq_device
joydev
snd_hda_codec_hdmi
snd_hda_intel
snd_hda_codec
amd64_edac_mod
edac_mce_amd
amdgpu
snd_hda_core
snd_hwdep
snd_pcm_oss
kvm_amd
ccp
mgag200
rng_core
snd_mixer_oss
kvm
irqbypass
chash
snd_pcm
gpu_sched
ipmi_si
crct10dif_pclmul
evdev
crc32_pclmul
serio_raw
ghash_clmulni_intel
ipmi_devintf
snd_timer
ttm
ipmi_msghandler
drm_kms_helper
k10temp
sg
snd
fam15h_power
sp5100_tco
drm
soundcore
button
nfsd
auth_rpcgss
nfs_acl
lockd
grace
sunrpc
loop
vhba
ecryptfs
parport_pc
ppdev
lp
parport
ip_tables
x_tables
autofs4
sr_mod
cdrom
ext4
crc16
mbcache
jbd2
fscrypto
ecb
uas
usb_storage
hid_generic
usbhid
hid
btrfs
xor
zstd_decompress
zstd_compress
xxhash
sd_mod
raid6_pq
libcrc32c
crc32c_generic
vmd
crc32c_intel
ohci_pci
ata_generic
aesni_intel
aes_x86_64
ahci
crypto_simd
ehci_pci
ohci_hcd
pata_atiixp
libahci
cryptd
glue_helper
ehci_hcd
psmouse
libata
igb
usbcore
i2c_piix4
i2c_algo_bit
scsi_mod
usb_common
dca


!!Sysfs Files
!!-----------

/sys/class/sound/hwC0D0/init_pin_configs:
0x03 0x185600f0
0x05 0x185600f0
0x07 0x185600f0
0x09 0x185600f0
0x0b 0x185600f0
0x0d 0x585600f0

/sys/class/sound/hwC0D0/driver_pin_configs:

/sys/class/sound/hwC0D0/user_pin_configs:

/sys/class/sound/hwC0D0/init_verbs:

/sys/class/sound/hwC0D0/hints:


!!ALSA/HDA dmesg
!!--------------



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

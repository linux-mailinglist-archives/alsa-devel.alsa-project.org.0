Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EE1189A37
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 12:06:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 778EB1706;
	Wed, 18 Mar 2020 12:05:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 778EB1706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584529598;
	bh=voNTYsBKIYKKRHN+Al31LKOO0soN3yG1ygfs8illW3I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C8PyRsGMbJ2g5hbGdIJdW/8BV5R1ZaxPhy4+EbNQbdKJizHhfJEKHoC5aOp2LJeJ7
	 4Go/XE7Kdc0O1QFnxXbcdudZGfbLshmX1es/vt3bUUidECoA0SWtElij3eJZ+Pn6Ki
	 SrHKoMhMAmoG0AmK8WO/DWAI/hCHJKI/UbxdmSdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 471C1F801F9;
	Wed, 18 Mar 2020 12:04:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAC5EF801DB; Wed, 18 Mar 2020 12:04:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_NONE,
 SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9997F800C0
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 12:04:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9997F800C0
IronPort-SDR: JoRXSLjiSiDgZHHbqU/Sp9kwX7p7/s580tLm2CS78KBzIYdEZF72+z/K6VIXkvHrXfBPyhqON+
 8Y1JqTNScjzA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 03:25:51 -0700
IronPort-SDR: K5Y6zBlxjMxqBeYGwCwHU/kl6k4erCdiOgY8wHbz4BWMa5sN8bY8KCkZMHheh5nieN9FyS2Q3c
 NhtpyyxHET3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,566,1574150400"; d="scan'208";a="238154163"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by fmsmga008.fm.intel.com with ESMTP; 18 Mar 2020 03:25:50 -0700
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] python: ucm-validator: configs: Add config folder for hda-dsp
 card and output of alsa-info.sh script from device using it
Date: Wed, 18 Mar 2020 11:26:13 +0100
Message-Id: <20200318102613.20192-1-mateusz.gorski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Mateusz Gorski <mateusz.gorski@linux.intel.com>
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

Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
---
 .../hda-dsp/Acer-SwiftSF515-51T-V102.txt      | 1153 +++++++++++++++++
 1 file changed, 1153 insertions(+)
 create mode 100644 python/ucm-validator/configs/hda-dsp/Acer-SwiftSF515-51T-V102.txt

diff --git a/python/ucm-validator/configs/hda-dsp/Acer-SwiftSF515-51T-V102.txt b/python/ucm-validator/configs/hda-dsp/Acer-SwiftSF515-51T-V102.txt
new file mode 100644
index 0000000..66ad82d
--- /dev/null
+++ b/python/ucm-validator/configs/hda-dsp/Acer-SwiftSF515-51T-V102.txt
@@ -0,0 +1,1153 @@
+upload=true&script=true&cardinfo=
+!!################################
+!!ALSA Information Script v 0.4.64
+!!################################
+
+!!Script ran on: Wed Mar 18 09:43:34 UTC 2020
+
+
+!!Linux Distribution
+!!------------------
+
+Ubuntu 18.04.4 LTS \n \l DISTRIB_ID=Ubuntu DISTRIB_DESCRIPTION="Ubuntu 18.04.4 LTS" NAME="Ubuntu" ID=ubuntu ID_LIKE=debian PRETTY_NAME="Ubuntu 18.04.4 LTS" HOME_URL="https://www.ubuntu.com/" SUPPORT_URL="https://help.ubuntu.com/" BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/" PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy" UBUNTU_CODENAME=bionic
+
+
+!!DMI Information
+!!---------------
+
+Manufacturer:      Acer
+Product Name:      Swift SF515-51T
+Product Version:   V1.02
+Firmware Version:  V1.02
+Board Vendor:      WL
+Board Name:        Guinness_WL
+
+
+!!ACPI Device Status Information
+!!---------------
+
+/sys/bus/acpi/devices/10250759:00/status 	 15
+/sys/bus/acpi/devices/ACPI0003:00/status 	 15
+/sys/bus/acpi/devices/ACPI000C:00/status 	 15
+/sys/bus/acpi/devices/ACPI000E:00/status 	 15
+/sys/bus/acpi/devices/INT33A1:00/status 	 15
+/sys/bus/acpi/devices/INT33D5:00/status 	 15
+/sys/bus/acpi/devices/INT3400:00/status 	 15
+/sys/bus/acpi/devices/INT3403:01/status 	 15
+/sys/bus/acpi/devices/INT3403:03/status 	 15
+/sys/bus/acpi/devices/INT340E:00/status 	 15
+/sys/bus/acpi/devices/INT34BB:00/status 	 15
+/sys/bus/acpi/devices/INT3F0D:00/status 	 15
+/sys/bus/acpi/devices/LNXPOWER:01/status 	 1
+/sys/bus/acpi/devices/LNXPOWER:02/status 	 1
+/sys/bus/acpi/devices/LNXPOWER:03/status 	 15
+/sys/bus/acpi/devices/LNXPOWER:05/status 	 1
+/sys/bus/acpi/devices/LNXPOWER:06/status 	 1
+/sys/bus/acpi/devices/LNXPOWER:07/status 	 1
+/sys/bus/acpi/devices/LNXPOWER:09/status 	 1
+/sys/bus/acpi/devices/MELF0411:00/status 	 15
+/sys/bus/acpi/devices/MSFT0101:00/status 	 15
+/sys/bus/acpi/devices/PNP0103:00/status 	 15
+/sys/bus/acpi/devices/PNP0C02:03/status 	 3
+/sys/bus/acpi/devices/PNP0C02:05/status 	 3
+/sys/bus/acpi/devices/PNP0C0A:03/status 	 31
+/sys/bus/acpi/devices/PNP0C0C:00/status 	 15
+/sys/bus/acpi/devices/PNP0C0E:00/status 	 11
+/sys/bus/acpi/devices/PNP0C0F:00/status 	 9
+/sys/bus/acpi/devices/PNP0C0F:01/status 	 9
+/sys/bus/acpi/devices/PNP0C0F:02/status 	 9
+/sys/bus/acpi/devices/PNP0C0F:03/status 	 9
+/sys/bus/acpi/devices/PNP0C0F:04/status 	 9
+/sys/bus/acpi/devices/PNP0C0F:05/status 	 9
+/sys/bus/acpi/devices/PNP0C0F:06/status 	 9
+/sys/bus/acpi/devices/PNP0C0F:07/status 	 9
+/sys/bus/acpi/devices/PRP00001:00/status 	 11
+/sys/bus/acpi/devices/SYNA7DAB:00/status 	 15
+/sys/bus/acpi/devices/USBC000:00/status 	 15
+/sys/bus/acpi/devices/device:11/status 	 15
+
+
+!!Kernel Information
+!!------------------
+
+Kernel release:    5.5.7+
+Operating System:  GNU/Linux
+Architecture:      x86_64
+Processor:         x86_64
+SMP Enabled:       Yes
+
+
+!!ALSA Version
+!!------------
+
+Driver version:     k5.5.7+
+Library version:    1.1.3
+Utilities version:  1.1.3
+
+
+!!Loaded ALSA modules
+!!-------------------
+
+snd_soc_skl_hda_dsp
+
+
+!!Sound Servers on this system
+!!----------------------------
+
+Pulseaudio:
+      Installed - Yes (/usr/bin/pulseaudio)
+      Running - Yes
+
+
+!!Soundcards recognised by ALSA
+!!-----------------------------
+
+ 0 [hdadsp         ]: hda-dsp - hda-dsp
+                      WL-SwiftSF515_51T-V1.02-Guinness_WL
+
+
+!!PCI Soundcards installed in the system
+!!--------------------------------------
+
+00:1f.3 Multimedia audio controller [0401]: Intel Corporation Device [8086:9dc8] (rev 30)
+	Subsystem: Acer Incorporated [ALI] Device [1025:1305]
+
+
+!!Modprobe options (Sound related)
+!!--------------------------------
+
+snd_pcsp: index=-2
+snd_usb_audio: index=-2
+snd_atiixp_modem: index=-2
+snd_intel8x0m: index=-2
+snd_via82xx_modem: index=-2
+snd_atiixp_modem: index=-2
+snd_intel8x0m: index=-2
+snd_via82xx_modem: index=-2
+snd_usb_audio: index=-2
+snd_usb_caiaq: index=-2
+snd_usb_ua101: index=-2
+snd_usb_us122l: index=-2
+snd_usb_usx2y: index=-2
+snd_cmipci: mpu_port=0x330 fm_port=0x388
+snd_pcsp: index=-2
+snd_usb_audio: index=-2
+
+
+!!Loaded sound module options
+!!---------------------------
+
+!!Module: snd_soc_skl_hda_dsp
+	* : 
+
+
+!!HDA-Intel Codec information
+!!---------------------------
+--startcollapse--
+
+Codec: Realtek ALC256
+Address: 0
+AFG Function Id: 0x1 (unsol 1)
+Vendor Id: 0x10ec0256
+Subsystem Id: 0x10251305
+Revision Id: 0x100002
+No Modem Function Group found
+Default PCM:
+    rates [0x560]: 44100 48000 96000 192000
+    bits [0xe]: 16 20 24
+    formats [0x1]: PCM
+Default Amp-In caps: N/A
+Default Amp-Out caps: N/A
+State of AFG node 0x01:
+  Power states:  D0 D1 D2 D3 D3cold CLKSTOP EPSS
+  Power: setting=D0, actual=D0
+GPIO: io=3, o=0, i=0, unsolicited=1, wake=0
+  IO[0]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
+  IO[1]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
+  IO[2]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
+Node 0x02 [Audio Output] wcaps 0x41d: Stereo Amp-Out
+  Control: name="Speaker Playback Volume", index=0, device=0
+    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
+  Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
+  Amp-Out vals:  [0x3c 0x3c]
+  Converter: stream=0, channel=0
+  PCM:
+    rates [0x60]: 44100 48000
+    bits [0xe]: 16 20 24
+    formats [0x1]: PCM
+  Power states:  D0 D1 D2 D3 EPSS
+  Power: setting=D0, actual=D0
+Node 0x03 [Audio Output] wcaps 0x41d: Stereo Amp-Out
+  Control: name="Headphone Playback Volume", index=0, device=0
+    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
+  Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
+  Amp-Out vals:  [0x3c 0x3c]
+  Converter: stream=0, channel=0
+  PCM:
+    rates [0x60]: 44100 48000
+    bits [0xe]: 16 20 24
+    formats [0x1]: PCM
+  Power states:  D0 D1 D2 D3 EPSS
+  Power: setting=D0, actual=D0
+Node 0x04 [Vendor Defined Widget] wcaps 0xf00000: Mono
+Node 0x05 [Vendor Defined Widget] wcaps 0xf00000: Mono
+Node 0x06 [Audio Output] wcaps 0x611: Stereo Digital
+  Converter: stream=0, channel=0
+  Digital:
+  Digital category: 0x0
+  IEC Coding Type: 0x0
+  PCM:
+    rates [0x5e0]: 44100 48000 88200 96000 192000
+    bits [0xe]: 16 20 24
+    formats [0x1]: PCM
+  Power states:  D0 D1 D2 D3 EPSS
+  Power: setting=D0, actual=D0
+Node 0x07 [Audio Input] wcaps 0x10051b: Stereo Amp-In
+  Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
+  Amp-In vals:  [0x97 0x97]
+  Converter: stream=0, channel=0
+  SDI-Select: 0
+  PCM:
+    rates [0x560]: 44100 48000 96000 192000
+    bits [0xe]: 16 20 24
+    formats [0x1]: PCM
+  Power states:  D0 D1 D2 D3 EPSS
+  Power: setting=D0, actual=D0
+  Connection: 1
+     0x24
+Node 0x08 [Audio Input] wcaps 0x10051b: Stereo Amp-In
+  Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
+  Amp-In vals:  [0x97 0x97]
+  Converter: stream=0, channel=0
+  SDI-Select: 0
+  PCM:
+    rates [0x560]: 44100 48000 96000 192000
+    bits [0xe]: 16 20 24
+    formats [0x1]: PCM
+  Power states:  D0 D1 D2 D3 EPSS
+  Power: setting=D0, actual=D0
+  Connection: 1
+     0x23
+Node 0x09 [Audio Input] wcaps 0x10051b: Stereo Amp-In
+  Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
+  Amp-In vals:  [0x97 0x97]
+  Converter: stream=0, channel=0
+  SDI-Select: 0
+  PCM:
+    rates [0x560]: 44100 48000 96000 192000
+    bits [0xe]: 16 20 24
+    formats [0x1]: PCM
+  Power states:  D0 D1 D2 D3 EPSS
+  Power: setting=D0, actual=D0
+  Connection: 1
+     0x22
+Node 0x0a [Vendor Defined Widget] wcaps 0xf00000: Mono
+Node 0x0b [Vendor Defined Widget] wcaps 0xf00000: Mono
+Node 0x0c [Vendor Defined Widget] wcaps 0xf00000: Mono
+Node 0x0d [Vendor Defined Widget] wcaps 0xf00000: Mono
+Node 0x0e [Vendor Defined Widget] wcaps 0xf00000: Mono
+Node 0x0f [Vendor Defined Widget] wcaps 0xf00000: Mono
+Node 0x10 [Vendor Defined Widget] wcaps 0xf00000: Mono
+Node 0x11 [Vendor Defined Widget] wcaps 0xf00000: Mono
+Node 0x12 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
+  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
+  Amp-In vals:  [0x00 0x00]
+  Pincap 0x00000020: IN
+  Pin Default 0x40000000: [N/A] Line Out at Ext N/A
+    Conn = Unknown, Color = Unknown
+    DefAssociation = 0x0, Sequence = 0x0
+  Pin-ctls: 0x00:
+  Power states:  D0 D1 D2 D3 EPSS
+  Power: setting=D0, actual=D0
+Node 0x13 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
+  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
+  Amp-In vals:  [0x00 0x00]
+  Pincap 0x00000020: IN
+  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
+    Conn = 1/8, Color = Black
+    DefAssociation = 0xf, Sequence = 0x0
+    Misc = NO_PRESENCE
+  Pin-ctls: 0x00:
+  Power states:  D0 D1 D2 D3 EPSS
+  Power: setting=D0, actual=D0
+Node 0x14 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
+  Control: name="Speaker Playback Switch", index=0, device=0
+    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
+  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
+  Amp-Out vals:  [0x00 0x00]
+  Pincap 0x00010014: OUT EAPD Detect
+  EAPD 0x2: EAPD
+  Pin Default 0x90172120: [Fixed] Speaker at Int N/A
+    Conn = Analog, Color = Grey
+    DefAssociation = 0x2, Sequence = 0x0
+    Misc = NO_PRESENCE
+  Pin-ctls: 0x00:
+  Unsolicited: tag=00, enabled=0
+  Power states:  D0 D1 D2 D3 EPSS
+  Power: setting=D0, actual=D0
+  Connection: 1
+     0x02
+Node 0x15 [Vendor Defined Widget] wcaps 0xf00000: Mono
+Node 0x16 [Vendor Defined Widget] wcaps 0xf00000: Mono
+Node 0x17 [Vendor Defined Widget] wcaps 0xf00000: Mono
+Node 0x18 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
+  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
+  Amp-In vals:  [0x00 0x00]
+  Pincap 0x00003724: IN Detect
+    Vref caps: HIZ 50 GRD 80 100
+  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
+    Conn = 1/8, Color = Black
+    DefAssociation = 0xf, Sequence = 0x0
+    Misc = NO_PRESENCE
+  Pin-ctls: 0x20: IN VREF_HIZ
+  Unsolicited: tag=00, enabled=0
+  Power states:  D0 D1 D2 D3 EPSS
+  Power: setting=D0, actual=D0
+Node 0x19 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
+  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
+  Amp-In vals:  [0x00 0x00]
+  Pincap 0x00003724: IN Detect
+    Vref caps: HIZ 50 GRD 80 100
+  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
+    Conn = 1/8, Color = Black
+    DefAssociation = 0xf, Sequence = 0x0
+    Misc = NO_PRESENCE
+  Pin-ctls: 0x20: IN VREF_HIZ
+  Unsolicited: tag=00, enabled=0
+  Power states:  D0 D1 D2 D3 EPSS
+  Power: setting=D0, actual=D0
+Node 0x1a [Pin Complex] wcaps 0x40048b: Stereo Amp-In
+  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
+  Amp-In vals:  [0x00 0x00]
+  Pincap 0x00003724: IN Detect
+    Vref caps: HIZ 50 GRD 80 100
+  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
+    Conn = 1/8, Color = Black
+    DefAssociation = 0xf, Sequence = 0x0
+    Misc = NO_PRESENCE
+  Pin-ctls: 0x00: VREF_HIZ
+  Unsolicited: tag=00, enabled=0
+  Power states:  D0 D1 D2 D3 EPSS
+  Power: setting=D0, actual=D0
+Node 0x1b [Pin Complex] wcaps 0x40058f: Stereo Amp-In Amp-Out
+  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
+  Amp-In vals:  [0x00 0x00]
+  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
+  Amp-Out vals:  [0x80 0x80]
+  Pincap 0x00013734: IN OUT EAPD Detect
+    Vref caps: HIZ 50 GRD 80 100
+  EAPD 0x2: EAPD
+  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
+    Conn = 1/8, Color = Black
+    DefAssociation = 0xf, Sequence = 0x0
+    Misc = NO_PRESENCE
+  Pin-ctls: 0x20: IN VREF_HIZ
+  Unsolicited: tag=00, enabled=0
+  Power states:  D0 D1 D2 D3 EPSS
+  Power: setting=D0, actual=D0
+  Connection: 2
+     0x02* 0x03
+Node 0x1c [Vendor Defined Widget] wcaps 0xf00000: Mono
+Node 0x1d [Pin Complex] wcaps 0x400400: Mono
+  Pincap 0x00000020: IN
+  Pin Default 0x4058ba2d: [N/A] Digital Out at Ext N/A
+    Conn = DIN, Color = UNKNOWN
+    DefAssociation = 0x2, Sequence = 0xd
+  Pin-ctls: 0x20: IN
+  Power states:  D0 D1 D2 D3 EPSS
+  Power: setting=D0, actual=D0
+Node 0x1e [Pin Complex] wcaps 0x400781: Stereo Digital
+  Pincap 0x00000014: OUT Detect
+  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
+    Conn = 1/8, Color = Black
+    DefAssociation = 0xf, Sequence = 0x0
+    Misc = NO_PRESENCE
+  Pin-ctls: 0x40: OUT
+  Unsolicited: tag=00, enabled=0
+  Power states:  D0 D1 D2 D3 EPSS
+  Power: setting=D0, actual=D0
+  Connection: 1
+     0x06
+Node 0x1f [Vendor Defined Widget] wcaps 0xf00000: Mono
+Node 0x20 [Vendor Defined Widget] wcaps 0xf00040: Mono
+  Processing caps: benign=0, ncoeff=91
+Node 0x21 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
+  Control: name="Headphone Playback Switch", index=0, device=0
+    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
+  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
+  Amp-Out vals:  [0x00 0x00]
+  Pincap 0x0001001c: OUT HP EAPD Detect
+  EAPD 0x2: EAPD
+  Pin Default 0x02211010: [Jack] HP Out at Ext Front
+    Conn = 1/8, Color = Black
+    DefAssociation = 0x1, Sequence = 0x0
+  Pin-ctls: 0xc0: OUT HP
+  Unsolicited: tag=01, enabled=1
+  Power states:  D0 D1 D2 D3 EPSS
+  Power: setting=D0, actual=D0
+  Connection: 2
+     0x02 0x03*
+Node 0x22 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
+  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
+  Amp-In vals:  [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
+  Connection: 5
+     0x18 0x19 0x1a 0x1b 0x1d
+Node 0x23 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
+  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
+  Amp-In vals:  [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
+  Connection: 6
+     0x18 0x19 0x1a 0x1b 0x1d 0x12
+Node 0x24 [Audio Selector] wcaps 0x300101: Stereo
+  Connection: 2
+     0x12* 0x13
+--endcollapse--
+
+
+!!ALSA Device nodes
+!!-----------------
+
+crw-rw----+ 1 root audio 116, 12 Mar 17 16:31 /dev/snd/controlC0
+crw-rw----+ 1 root audio 116,  8 Mar 17 16:31 /dev/snd/pcmC0D10p
+crw-rw----+ 1 root audio 116,  9 Mar 17 16:31 /dev/snd/pcmC0D11p
+crw-rw----+ 1 root audio 116, 10 Mar 17 16:31 /dev/snd/pcmC0D12p
+crw-rw----+ 1 root audio 116, 11 Mar 17 16:31 /dev/snd/pcmC0D13c
+crw-rw----+ 1 root audio 116,  3 Mar 17 16:31 /dev/snd/pcmC0D7c
+crw-rw----+ 1 root audio 116,  2 Mar 17 16:31 /dev/snd/pcmC0D7p
+crw-rw----+ 1 root audio 116,  5 Mar 17 16:31 /dev/snd/pcmC0D8c
+crw-rw----+ 1 root audio 116,  4 Mar 17 16:31 /dev/snd/pcmC0D8p
+crw-rw----+ 1 root audio 116,  7 Mar 17 16:31 /dev/snd/pcmC0D9c
+crw-rw----+ 1 root audio 116,  6 Mar 17 16:31 /dev/snd/pcmC0D9p
+crw-rw----+ 1 root audio 116,  1 Mar 17 16:31 /dev/snd/seq
+crw-rw----+ 1 root audio 116, 33 Mar 17 16:31 /dev/snd/timer
+
+/dev/snd/by-path:
+total 0
+drwxr-xr-x 2 root root  60 Mar 17 16:31 .
+drwxr-xr-x 3 root root 320 Mar 17 16:31 ..
+lrwxrwxrwx 1 root root  12 Mar 17 16:31 platform-skl_hda_dsp_generic -> ../controlC0
+
+
+!!Aplay/Arecord output
+!!--------------------
+
+APLAY
+
+Home directory not accessible: Permission denied
+**** List of PLAYBACK Hardware Devices ****
+card 0: hdadsp [hda-dsp], device 7: Analog HDA DSP (*) []
+  Subdevices: 1/1
+  Subdevice #0: subdevice #0
+card 0: hdadsp [hda-dsp], device 8: Digital HDA DSP (*) []
+  Subdevices: 1/1
+  Subdevice #0: subdevice #0
+card 0: hdadsp [hda-dsp], device 9: Alt Analog HDA DSP (*) []
+  Subdevices: 1/1
+  Subdevice #0: subdevice #0
+card 0: hdadsp [hda-dsp], device 10: HDMI1 (*) []
+  Subdevices: 1/1
+  Subdevice #0: subdevice #0
+card 0: hdadsp [hda-dsp], device 11: HDMI2 (*) []
+  Subdevices: 1/1
+  Subdevice #0: subdevice #0
+card 0: hdadsp [hda-dsp], device 12: HDMI3 (*) []
+  Subdevices: 1/1
+  Subdevice #0: subdevice #0
+
+ARECORD
+
+Home directory not accessible: Permission denied
+**** List of CAPTURE Hardware Devices ****
+card 0: hdadsp [hda-dsp], device 7: Analog HDA DSP (*) []
+  Subdevices: 1/1
+  Subdevice #0: subdevice #0
+card 0: hdadsp [hda-dsp], device 8: Digital HDA DSP (*) []
+  Subdevices: 1/1
+  Subdevice #0: subdevice #0
+card 0: hdadsp [hda-dsp], device 9: Alt Analog HDA DSP (*) []
+  Subdevices: 1/1
+  Subdevice #0: subdevice #0
+card 0: hdadsp [hda-dsp], device 13: DMIC1 (*) []
+  Subdevices: 1/1
+  Subdevice #0: subdevice #0
+
+!!Amixer output
+!!-------------
+
+!!-------Mixer controls for card hdadsp
+
+Card hw:0 'hdadsp'/'WL-SwiftSF515_51T-V1.02-Guinness_WL'
+  Mixer name	: 'Realtek ALC256'
+  Components	: 'HDA:10ec0256,10251305,00100002'
+  Controls      : 37
+  Simple ctrls  : 29
+Simple mixer control 'Master',0
+  Capabilities: pvolume pvolume-joined pswitch pswitch-joined
+  Playback channels: Mono
+  Limits: Playback 0 - 87
+  Mono: Playback 60 [69%] [-20.25dB] [on]
+Simple mixer control 'Headphone',0
+  Capabilities: pvolume pswitch
+  Playback channels: Front Left - Front Right
+  Limits: Playback 0 - 87
+  Mono:
+  Front Left: Playback 87 [100%] [0.00dB] [on]
+  Front Right: Playback 87 [100%] [0.00dB] [on]
+Simple mixer control 'Speaker',0
+  Capabilities: pvolume pswitch
+  Playback channels: Front Left - Front Right
+  Limits: Playback 0 - 87
+  Mono:
+  Front Left: Playback 87 [100%] [0.00dB] [on]
+  Front Right: Playback 87 [100%] [0.00dB] [on]
+Simple mixer control 'Auto-Mute Mode',0
+  Capabilities: enum
+  Items: 'Disabled' 'Enabled'
+  Item0: 'Enabled'
+Simple mixer control 'Pin5-Port0 Mux',0
+  Capabilities: enum
+  Items: 'NONE' 'cvt 2' 'cvt 3' 'cvt 4'
+  Item0: 'NONE'
+Simple mixer control 'Pin5-Port1 Mux',0
+  Capabilities: enum
+  Items: 'NONE' 'cvt 2' 'cvt 3' 'cvt 4'
+  Item0: 'NONE'
+Simple mixer control 'Pin5-Port2 Mux',0
+  Capabilities: enum
+  Items: 'NONE' 'cvt 2' 'cvt 3' 'cvt 4'
+  Item0: 'NONE'
+Simple mixer control 'Pin6-Port0 Mux',0
+  Capabilities: enum
+  Items: 'NONE' 'cvt 2' 'cvt 3' 'cvt 4'
+  Item0: 'NONE'
+Simple mixer control 'Pin6-Port1 Mux',0
+  Capabilities: enum
+  Items: 'NONE' 'cvt 2' 'cvt 3' 'cvt 4'
+  Item0: 'NONE'
+Simple mixer control 'Pin6-Port2 Mux',0
+  Capabilities: enum
+  Items: 'NONE' 'cvt 2' 'cvt 3' 'cvt 4'
+  Item0: 'NONE'
+Simple mixer control 'Pin7-Port0 Mux',0
+  Capabilities: enum
+  Items: 'NONE' 'cvt 2' 'cvt 3' 'cvt 4'
+  Item0: 'NONE'
+Simple mixer control 'Pin7-Port1 Mux',0
+  Capabilities: enum
+  Items: 'NONE' 'cvt 2' 'cvt 3' 'cvt 4'
+  Item0: 'NONE'
+Simple mixer control 'Pin7-Port2 Mux',0
+  Capabilities: enum
+  Items: 'NONE' 'cvt 2' 'cvt 3' 'cvt 4'
+  Item0: 'NONE'
+Simple mixer control 'codec0_out mo media0_in mi',0
+  Capabilities: pswitch pswitch-joined
+  Playback channels: Mono
+  Mono: Playback [on]
+Simple mixer control 'codec1_out mo media1_in mi',0
+  Capabilities: pswitch pswitch-joined
+  Playback channels: Mono
+  Mono: Playback [off]
+Simple mixer control 'codec2_out mo media2_in mi',0
+  Capabilities: pswitch pswitch-joined
+  Playback channels: Mono
+  Mono: Playback [off]
+Simple mixer control 'hif5-0 Jack',0
+  Capabilities: pswitch pswitch-joined
+  Playback channels: Mono
+  Mono: Playback [off]
+Simple mixer control 'hif5-1 Jack',0
+  Capabilities: pswitch pswitch-joined
+  Playback channels: Mono
+  Mono: Playback [off]
+Simple mixer control 'hif5-2 Jack',0
+  Capabilities: pswitch pswitch-joined
+  Playback channels: Mono
+  Mono: Playback [off]
+Simple mixer control 'hif6-0 Jack',0
+  Capabilities: pswitch pswitch-joined
+  Playback channels: Mono
+  Mono: Playback [off]
+Simple mixer control 'hif6-1 Jack',0
+  Capabilities: pswitch pswitch-joined
+  Playback channels: Mono
+  Mono: Playback [off]
+Simple mixer control 'hif6-2 Jack',0
+  Capabilities: pswitch pswitch-joined
+  Playback channels: Mono
+  Mono: Playback [off]
+Simple mixer control 'hif7-0 Jack',0
+  Capabilities: pswitch pswitch-joined
+  Playback channels: Mono
+  Mono: Playback [off]
+Simple mixer control 'hif7-1 Jack',0
+  Capabilities: pswitch pswitch-joined
+  Playback channels: Mono
+  Mono: Playback [off]
+Simple mixer control 'hif7-2 Jack',0
+  Capabilities: pswitch pswitch-joined
+  Playback channels: Mono
+  Mono: Playback [off]
+Simple mixer control 'mch_cap_out mo mch_cap_in mi',0
+  Capabilities: pswitch pswitch-joined
+  Playback channels: Mono
+  Mono: Playback [on]
+Simple mixer control 'media0_out mo codec0_in mi',0
+  Capabilities: pswitch pswitch-joined
+  Playback channels: Mono
+  Mono: Playback [on]
+Simple mixer control 'media1_out mo codec1_in mi',0
+  Capabilities: pswitch pswitch-joined
+  Playback channels: Mono
+  Mono: Playback [off]
+Simple mixer control 'media2_out mo codec2_in mi',0
+  Capabilities: pswitch pswitch-joined
+  Playback channels: Mono
+  Mono: Playback [off]
+
+
+!!Alsactl output
+!!--------------
+
+--startcollapse--
+state.hdadsp {
+	control.1 {
+		iface MIXER
+		name 'codec0_out mo media0_in mi Switch'
+		value true
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.2 {
+		iface MIXER
+		name 'codec1_out mo media1_in mi Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.3 {
+		iface MIXER
+		name 'codec2_out mo media2_in mi Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.4 {
+		iface MIXER
+		name 'media0_out mo codec0_in mi Switch'
+		value true
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.5 {
+		iface MIXER
+		name 'media1_out mo codec1_in mi Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.6 {
+		iface MIXER
+		name 'media2_out mo codec2_in mi Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.7 {
+		iface MIXER
+		name 'mch_cap_out mo mch_cap_in mi Switch'
+		value true
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.8 {
+		iface MIXER
+		name 'Pin5-Port0 Mux'
+		value NONE
+		comment {
+			access 'read write'
+			type ENUMERATED
+			count 1
+			item.0 NONE
+			item.1 'cvt 2'
+			item.2 'cvt 3'
+			item.3 'cvt 4'
+		}
+	}
+	control.9 {
+		iface MIXER
+		name 'Pin5-Port1 Mux'
+		value NONE
+		comment {
+			access 'read write'
+			type ENUMERATED
+			count 1
+			item.0 NONE
+			item.1 'cvt 2'
+			item.2 'cvt 3'
+			item.3 'cvt 4'
+		}
+	}
+	control.10 {
+		iface MIXER
+		name 'Pin5-Port2 Mux'
+		value NONE
+		comment {
+			access 'read write'
+			type ENUMERATED
+			count 1
+			item.0 NONE
+			item.1 'cvt 2'
+			item.2 'cvt 3'
+			item.3 'cvt 4'
+		}
+	}
+	control.11 {
+		iface MIXER
+		name 'Pin6-Port0 Mux'
+		value NONE
+		comment {
+			access 'read write'
+			type ENUMERATED
+			count 1
+			item.0 NONE
+			item.1 'cvt 2'
+			item.2 'cvt 3'
+			item.3 'cvt 4'
+		}
+	}
+	control.12 {
+		iface MIXER
+		name 'Pin6-Port1 Mux'
+		value NONE
+		comment {
+			access 'read write'
+			type ENUMERATED
+			count 1
+			item.0 NONE
+			item.1 'cvt 2'
+			item.2 'cvt 3'
+			item.3 'cvt 4'
+		}
+	}
+	control.13 {
+		iface MIXER
+		name 'Pin6-Port2 Mux'
+		value NONE
+		comment {
+			access 'read write'
+			type ENUMERATED
+			count 1
+			item.0 NONE
+			item.1 'cvt 2'
+			item.2 'cvt 3'
+			item.3 'cvt 4'
+		}
+	}
+	control.14 {
+		iface MIXER
+		name 'Pin7-Port0 Mux'
+		value NONE
+		comment {
+			access 'read write'
+			type ENUMERATED
+			count 1
+			item.0 NONE
+			item.1 'cvt 2'
+			item.2 'cvt 3'
+			item.3 'cvt 4'
+		}
+	}
+	control.15 {
+		iface MIXER
+		name 'Pin7-Port1 Mux'
+		value NONE
+		comment {
+			access 'read write'
+			type ENUMERATED
+			count 1
+			item.0 NONE
+			item.1 'cvt 2'
+			item.2 'cvt 3'
+			item.3 'cvt 4'
+		}
+	}
+	control.16 {
+		iface MIXER
+		name 'Pin7-Port2 Mux'
+		value NONE
+		comment {
+			access 'read write'
+			type ENUMERATED
+			count 1
+			item.0 NONE
+			item.1 'cvt 2'
+			item.2 'cvt 3'
+			item.3 'cvt 4'
+		}
+	}
+	control.17 {
+		iface MIXER
+		name 'Headphone Playback Volume'
+		value.0 87
+		value.1 87
+		comment {
+			access 'read write'
+			type INTEGER
+			count 2
+			range '0 - 87'
+			dbmin -6525
+			dbmax 0
+			dbvalue.0 0
+			dbvalue.1 0
+		}
+	}
+	control.18 {
+		iface MIXER
+		name 'Headphone Playback Switch'
+		value.0 true
+		value.1 true
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 2
+		}
+	}
+	control.19 {
+		iface MIXER
+		name 'Speaker Playback Volume'
+		value.0 87
+		value.1 87
+		comment {
+			access 'read write'
+			type INTEGER
+			count 2
+			range '0 - 87'
+			dbmin -6525
+			dbmax 0
+			dbvalue.0 0
+			dbvalue.1 0
+		}
+	}
+	control.20 {
+		iface MIXER
+		name 'Speaker Playback Switch'
+		value.0 true
+		value.1 true
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 2
+		}
+	}
+	control.21 {
+		iface MIXER
+		name 'Auto-Mute Mode'
+		value Enabled
+		comment {
+			access 'read write'
+			type ENUMERATED
+			count 1
+			item.0 Disabled
+			item.1 Enabled
+		}
+	}
+	control.22 {
+		iface MIXER
+		name 'Master Playback Volume'
+		value 60
+		comment {
+			access 'read write'
+			type INTEGER
+			count 1
+			range '0 - 87'
+			dbmin -6525
+			dbmax 0
+			dbvalue.0 -2025
+		}
+	}
+	control.23 {
+		iface MIXER
+		name 'Master Playback Switch'
+		value true
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.24 {
+		iface CARD
+		name 'Front Headphone Jack'
+		value true
+		comment {
+			access read
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.25 {
+		iface CARD
+		name 'Speaker Phantom Jack'
+		value true
+		comment {
+			access read
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.26 {
+		iface CARD
+		name 'HDMI/DP, pcm=17 Jack'
+		value false
+		comment {
+			access read
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.27 {
+		iface CARD
+		name 'HDMI/DP, pcm=18 Jack'
+		value false
+		comment {
+			access read
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.28 {
+		iface CARD
+		name 'HDMI/DP, pcm=19 Jack'
+		value false
+		comment {
+			access read
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.29 {
+		iface MIXER
+		name 'hif5-0 Jack Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.30 {
+		iface MIXER
+		name 'hif5-1 Jack Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.31 {
+		iface MIXER
+		name 'hif5-2 Jack Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.32 {
+		iface MIXER
+		name 'hif6-0 Jack Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.33 {
+		iface MIXER
+		name 'hif6-1 Jack Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.34 {
+		iface MIXER
+		name 'hif6-2 Jack Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.35 {
+		iface MIXER
+		name 'hif7-0 Jack Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.36 {
+		iface MIXER
+		name 'hif7-1 Jack Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+	control.37 {
+		iface MIXER
+		name 'hif7-2 Jack Switch'
+		value false
+		comment {
+			access 'read write'
+			type BOOLEAN
+			count 1
+		}
+	}
+}
+--endcollapse--
+
+
+!!All Loaded Modules
+!!------------------
+
+acpi_thermal_rel
+asix
+drm
+drm_kms_helper
+efivarfs
+fb_sys_fops
+i2c_algo_bit
+i915
+int3400_thermal
+int3403_thermal
+int340x_thermal_zone
+intel_lpss
+intel_lpss_pci
+intel_pch_thermal
+intel_pmc_core
+intel_powerclamp
+intel_soc_dts_iosf
+iwlmvm
+iwlwifi
+mei
+mei_me
+mfd_core
+processor_thermal_device
+snd
+snd_compress
+snd_hda_codec
+snd_hda_codec_generic
+snd_hda_codec_realtek
+snd_hda_core
+snd_hda_ext_core
+snd_intel_dspcfg
+snd_pcm
+snd_rawmidi
+snd_seq
+snd_seq_device
+snd_seq_midi
+snd_seq_midi_event
+snd_soc_acpi
+snd_soc_acpi_intel_match
+snd_soc_core
+snd_soc_dmic
+snd_soc_hdac_hda
+snd_soc_hdac_hdmi
+snd_soc_skl
+snd_soc_skl_hda_dsp
+snd_soc_sst_dsp
+snd_soc_sst_ipc
+snd_timer
+soundcore
+syscopyarea
+sysfillrect
+sysimgblt
+usbnet
+x86_pkg_temp_thermal
+xhci_hcd
+xhci_pci
+
+
+!!ALSA/HDA dmesg
+!!--------------
+
+[    1.425954] ACPI: Added _OSI(Linux-Dell-Video)
+[    1.425954] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
+[    1.425954] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
+--
+[   13.086396] asix 1-4:1.0 enx00606e431d6e: renamed from eth0
+[   13.088643] snd_soc_skl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040100
+[   13.088655] snd_soc_skl 0000:00:1f.3: enabling device (0000 -> 0002)
+[   13.204656] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
+[   13.228149] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input5
+[   13.232518] snd_soc_skl 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
+[   13.247709] fbcon: i915drmfb (fb0) is primary device
+--
+[   13.299004] i915 0000:00:02.0: fb0: i915drmfb frame buffer device
+[   13.380753] HDMI HDA Codec ehdaudio0D2: Max dais supported: 3
+[   13.387487] snd_soc_skl 0000:00:1f.3: Direct firmware load for 9dc8-ACRSYS-ACRPRDCT-2-tplg.bin failed with error -2
+[   13.387515] snd_soc_skl 0000:00:1f.3: tplg fw 9dc8-ACRSYS-ACRPRDCT-2-tplg.bin load failed with -2, falling back to dfw_sst.bin
+[   13.398166] snd_soc_skl 0000:00:1f.3: ASoC: Parent card not yet available, widget card binding deferred
+[   13.416863] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
+[   13.517378] debugfs: File 'DMIC01 Rx' in directory 'dapm' already present!
+[   13.520614] HDMI HDA Codec ehdaudio0D2: hdac_hdmi_present_sense: disconnect for pin:port 5:0
+[   13.521088] HDMI HDA Codec ehdaudio0D2: hdac_hdmi_present_sense: disconnect for pin:port 6:0
+[   13.524154] HDMI HDA Codec ehdaudio0D2: hdac_hdmi_present_sense: disconnect for pin:port 7:0
+[   13.533604] snd_hda_codec_realtek ehdaudio0D0: autoconfig for ALC256: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
+[   13.533611] snd_hda_codec_realtek ehdaudio0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
+[   13.533616] snd_hda_codec_realtek ehdaudio0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
+[   13.533620] snd_hda_codec_realtek ehdaudio0D0:    mono: mono_out=0x0
+[   13.533624] snd_hda_codec_realtek ehdaudio0D0:    inputs:
+[   13.776042] skl_hda_dsp_generic skl_hda_dsp_generic: intel-hdmi-hifi1 <-> iDisp1 Pin mapping ok
+--
+[   13.776790] skl_hda_dsp_generic skl_hda_dsp_generic: dmic-hifi <-> DMIC16k Pin mapping ok
+[   13.779057] skl_hda_dsp_generic skl_hda_dsp_generic: snd-soc-dummy-dai <-> hda-dsp-analog-dai mapping ok
+[   13.780710] skl_hda_dsp_generic skl_hda_dsp_generic: snd-soc-dummy-dai <-> hda-dsp-digital-dai mapping ok
+[   13.782562] skl_hda_dsp_generic skl_hda_dsp_generic: snd-soc-dummy-dai <-> hda-dsp-alt-analog-dai mapping ok
+[   13.783676] skl_hda_dsp_generic skl_hda_dsp_generic: snd-soc-dummy-dai <-> hdmi1 mapping ok
+[   13.784759] skl_hda_dsp_generic skl_hda_dsp_generic: snd-soc-dummy-dai <-> hdmi2 mapping ok
+[   13.785833] skl_hda_dsp_generic skl_hda_dsp_generic: snd-soc-dummy-dai <-> hdmi3 mapping ok
+[   13.787028] skl_hda_dsp_generic skl_hda_dsp_generic: snd-soc-dummy-dai <-> hda-dsp-dmic-dai mapping ok
+[   13.787942] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi3 overwritten
+--
+[   13.788343] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi1 overwritten
+[   13.805991] input: hda-dsp Front Headphone as /devices/platform/skl_hda_dsp_generic/sound/card0/input6
+[   13.808237] input: hda-dsp HDMI/DP, pcm=17 Jack as /devices/platform/skl_hda_dsp_generic/sound/card0/input7
+[   13.811958] input: hda-dsp HDMI/DP, pcm=18 Jack as /devices/platform/skl_hda_dsp_generic/sound/card0/input8
+[   13.813135] input: hda-dsp HDMI/DP, pcm=19 Jack as /devices/platform/skl_hda_dsp_generic/sound/card0/input9
+[   14.056305] iwlwifi 0000:00:14.3: Applying debug destination EXTERNAL_DRAM
+
+
-- 
2.17.1


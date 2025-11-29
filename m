Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9B5C93D28
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Nov 2025 12:47:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6DD4601F6;
	Sat, 29 Nov 2025 12:47:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6DD4601F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764416833;
	bh=s1XBvvzqnhexiROxh4IDKlxy/WHhFwpqvO0nwl+A2IY=;
	h=Date:From:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hj7P4xS8y4//touO2HF0LUepAnnAjB/f17nA9mdXtqcUaxbz9bJFfbVTkKzZg/rTT
	 gI1NEYkx06/guGOvyUD3Dx3tMwrnekvW5HiwXrqN0ga9j95TVEpCmJuXqRRWQogM2V
	 FwMAqri9KR7GIgmtua44R1ZgD2pTB8egfhaVPYek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D39DF805C8; Sat, 29 Nov 2025 12:46:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9370F805C4;
	Sat, 29 Nov 2025 12:46:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62B3DF8028B; Sat, 29 Nov 2025 12:44:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtp.outgoing.loopia.se (smtp.outgoing.loopia.se [93.188.3.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21529F80153
	for <alsa-devel@alsa-project.org>; Sat, 29 Nov 2025 12:44:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21529F80153
Received: from s807.loopia.se (localhost [127.0.0.1])
	by s807.loopia.se (Postfix) with ESMTP id 698B046AA0E
	for <alsa-devel@alsa-project.org>; Sat, 29 Nov 2025 12:44:32 +0100 (CET)
Received: from s979.loopia.se (unknown [172.22.191.6])
	by s807.loopia.se (Postfix) with ESMTP id 56564469DB9
	for <alsa-devel@alsa-project.org>; Sat, 29 Nov 2025 12:44:32 +0100 (CET)
Received: from localhost (unknown [172.22.191.5])
	by s979.loopia.se (Postfix) with ESMTP id 5541410BC365
	for <alsa-devel@alsa-project.org>; Sat, 29 Nov 2025 12:44:32 +0100 (CET)
X-Virus-Scanned: amavis at amavis.loopia.se
Authentication-Results: s472.loopia.se (amavis); dkim=neutral
 reason="invalid (public key: not available)" header.d=aldervall.se
Received: from s934.loopia.se ([172.22.191.5])
 by localhost (s472.loopia.se [172.22.190.12]) (amavis, port 10024) with LMTP
 id nKS-YWhb0U17 for <alsa-devel@alsa-project.org>;
 Sat, 29 Nov 2025 12:44:31 +0100 (CET)
X-Loopia-Auth: user
X-Loopia-User: niklas@aldervall.se
X-Loopia-Originating-IP: 176.10.254.174
Received: from [10.10.0.62] (h-176-10-254-174.A980.priv.bahnhof.se
 [176.10.254.174])
	(Authenticated sender: niklas@aldervall.se)
	by s934.loopia.se (Postfix) with ESMTPSA id 5EA6E7CEA95
	for <alsa-devel@alsa-project.org>; Sat, 29 Nov 2025 12:44:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aldervall.se;
	s=loopiadkim1714296000; t=1764416671;
	bh=435+L9Ehaoc6DHxaUJmNkDD8/Gm0BNDUa/O5aBCtjGc=;
	h=Date:From:Subject:To;
	b=Dyf+SXiHjUCJoGZUZ5NlFWFOQTnEc3oR0zao26FlTZAFSRTKu60RQKVWI7KrGYk8V
	 b8/nG3hQ6saUBKnw/DXV7Ci+Y+wkCEKoL0kW2rtafAkIeC1gsvN8GIXsgarh5gA9fB
	 l/i8LBnA+txl2O9KYJHXHnW4jA5yf4Nhxr/zqhMKmdb/6gJUD7Q7NgBxsRxPpBL3NG
	 aNiDz3hotnDKreraP6f8u/8ugCU5Yr2LUrsAncAZeXV9a2V7BwFGq+WdvIM2RbgVq1
	 ehCDeT5KYbnv/a3XFQwLzw8USiXqMSUU5j1IziKUi1jloqWseTSSZUzGwvhcP2Wkx8
	 P6BygHed7nznA==
Content-Type: multipart/mixed; boundary="------------wzHDAjRjuSIC3LLgL0IvSwP6"
Message-ID: <6b623cb6-3a9b-4fe4-a57c-9a165d261692@aldervall.se>
Date: Sat, 29 Nov 2025 12:44:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Niklas Aldervall <niklas@aldervall.se>
Subject: Roland OCTA-CAPTURE (0582:0120) - White Noise/Static on Playback
To: alsa-devel@alsa-project.org
Message-ID-Hash: KYYRDK3A4OS7JKRY2N23PZLOPW57QWPX
X-Message-ID-Hash: KYYRDK3A4OS7JKRY2N23PZLOPW57QWPX
X-MailFrom: niklas@aldervall.se
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KYYRDK3A4OS7JKRY2N23PZLOPW57QWPX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a multi-part message in MIME format.
--------------wzHDAjRjuSIC3LLgL0IvSwP6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

# ALSA Bug Report: Roland OCTA-CAPTURE (0582:0120) - White Noise/Static 
on Playback

## Summary
Roland OCTA-CAPTURE USB audio interface produces white noise/static 
instead of clean audio on Linux, despite being detected and initialized 
by snd_usb_audio driver.

## Device Information
- **Model**: Roland OCTA-CAPTURE (UA-1010)
- **USB ID**: 0582:0120
- **Manufacturer**: Roland Corporation
- **Device Class**: Vendor Specific (0xFF) - NOT USB Audio Class compliant
- **Serial**: ISRL4B236F81

## System Information
- **Kernel**: 6.17.9-2-cachyos
- **Distribution**: Arch Linux (CachyOS)
- **Audio Server**: PipeWire 1.2.7
- **ALSA Driver**: snd_usb_audio (built as module)

## Symptoms
1. Device is correctly detected and recognized by ALSA
2. ALSA shows proper capabilities: S32_LE, 10ch playback, 12ch capture, 
44100Hz
3. Audio streams can be sent to device without errors
4. **OUTPUT**: Only white noise/static is produced instead of clean audio
5. Issue occurs with both direct ALSA (speaker-test) and PipeWire
6. Issue persists across all available profiles (multichannel, pro-audio)

## Device Detection (lsusb)
```
Bus 001 Device 008: ID 0582:0120 Roland Corp. OCTA-CAPTURE
   bDeviceClass          255 Vendor Specific Class
   bDeviceSubClass         0
   bDeviceProtocol       255
   idVendor           0x0582 Roland Corp.
   idProduct          0x0120 OCTA-CAPTURE
```

## ALSA Stream Configuration
```
Roland OCTA-CAPTURE at usb-0000:00:14.0-3, high speed : USB Audio

Playback:
   Status: Stop
   Interface 0
     Altset 1
     Format: S32_LE
     Channels: 10
     Endpoint: 0x05 (5 OUT) (ASYNC)
     Rates: 44100
     Data packet interval: 125 us
     Bits: 0
     Sync Endpoint: 0x85 (5 IN)
     Sync EP Interface: 1
     Sync EP Altset: 1
     Implicit Feedback Mode: Yes

Capture:
   Status: Stop
   Interface 1
     Altset 1
     Format: S32_LE
     Channels: 12
     Endpoint: 0x85 (5 IN) (ASYNC)
     Rates: 44100
     Data packet interval: 125 us
     Bits: 0
     Sync Endpoint: 0x05 (5 OUT)
     Sync EP Interface: 0
     Sync EP Altset: 1
     Implicit Feedback Mode: Yes
```

## Hardware Configuration
- **Digital Input**: OFF (changed from AUTO - no effect)
- **Sample Rate**: 44.1kHz (hardware configured)
- **Output**: Connected to OUT 1/2 (analog)
- **Routing**: Factory reset performed - no effect

## Workarounds Attempted (All Failed)
1. **PipeWire profiles**: Tried pro-audio, multichannel-duplex
2. **Module parameters** (all individually and in combination):
    - `lowlatency=0` - Disable low-latency mode
    - `autoclock=0` - Force manual clock
    - `implicit_fb=0` - Disable implicit feedback
    - `device_setup=0,1` - Different device modes
    - `quirk_flags=0x8,0x20` - Various quirk flags
3. **Hardware configuration**:
    - DIGITAL = OFF (vs AUTO)
    - Factory reset via hardware buttons
4. **Different audio paths**:
    - Direct ALSA (hw:1,0)
    - PipeWire
    - All produce same static

## Test Command Used
```bash
speaker-test -D hw:1,0 -c 10 -t sine -f 440 -r 44100 -F S32_LE -l 3
```
**Result**: White noise/static instead of clean 440Hz tone

## Kernel Support Status
- Device added to implicit feedback skip list in kernel 5.11.9 (March 2021)
- Patch: `IMPLICIT_FB_SKIP_DEV(0x0582, 0x0120)`
- No additional patches found for kernels 6.x

## Related Devices
- Roland Quad-Capture (0582:0118) - Similar architecture, better Linux 
support
- Roland U-8 (older device) - Has third-party Linux tools (u8ctl)

## Known Issues from Community
- LinuxMusicians forum: "loud white noise sounds generated along with audio"
- Multiple users report same symptom since 2013
- No documented solution exists

## Hypothesis
The OCTA-CAPTURE uses Roland's proprietary USB protocol (vendor-specific 
class 0xFF).
The device likely requires:
1. Proprietary initialization sequence not performed by generic 
snd_usb_audio
2. SysEx MIDI configuration for internal DSP/routing/clock
3. Vendor-specific control messages for proper operation

Without Roland's cooperation or reverse engineering of Windows driver, 
proper support may be impossible.

## Request
1. Is there additional debugging we can enable to trace USB communication?
2. Could vendor-specific initialization be missing?
3. Would Roland device reverse engineering resources help?
4. Should this device be blacklisted if it cannot work properly?

## Additional Resources
- Device manual: 
https://static.roland.com/assets/media/pdf/OCTA-CAPTURE_v1.6_OM.pdf
- Kernel patch (2021): 
https://patchwork.kernel.org/project/alsa-devel/patch/CAOsVg8psuOkQRoccDs7AZzUO=4ffOm=XfXoY_G0iTqRXHtqu4A@mail.gmail.com/
- LinuxMusicians thread: https://linuxmusicians.com/viewtopic.php?t=17423

## Contact

Best Regards
Niklas Aldervall
--------------wzHDAjRjuSIC3LLgL0IvSwP6
Content-Type: application/gzip; name="octa-capture-debug-data.tar.gz"
Content-Disposition: attachment; filename="octa-capture-debug-data.tar.gz"
Content-Transfer-Encoding: base64

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

--------------wzHDAjRjuSIC3LLgL0IvSwP6--

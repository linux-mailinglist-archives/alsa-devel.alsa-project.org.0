Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDFDB18E53
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Aug 2025 13:58:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BBC960269;
	Sat,  2 Aug 2025 13:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BBC960269
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1754135922;
	bh=4WLSo5qJHvT4u8sqbEkNVA2qg5uh/JX25XfOpXwh+dw=;
	h=From:Date:Subject:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CDKaD70+zG2E8GCQWK/BD4WOwu+WlF3PjDICs4hUQwDFiXPI5bWg2j1pK+jjiqIr+
	 fqhU0Ru0y8kuy7L3XYeJNXtuZWfvcq6qS252GCb/AUGUMWRQNdBsd/bWcmh9QdK5qy
	 qj8tDu8p1bHOdQWh34/ZcMp1DcPdl0QP+WJCzEO4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD575F805B6; Sat,  2 Aug 2025 13:58:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CEF7F805C1;
	Sat,  2 Aug 2025 13:58:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C954AF8042F; Sat,  2 Aug 2025 13:57:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AB03F800EE
	for <alsa-devel@alsa-project.org>; Sat,  2 Aug 2025 13:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AB03F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FX0Wgh95
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3322e4ac195so27139931fa.0
        for <alsa-devel@alsa-project.org>;
 Sat, 02 Aug 2025 04:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754135874; x=1754740674;
 darn=alsa-project.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LWxIRNxDqG5eNfFXqzrD5SC5/+TAj2RB7XyayzT1xNI=;
        b=FX0Wgh95CFJGAIFmap+fB6sHE+thG00bb4SBm6qMyr4BV/+zPIGeefrBnPoDZGs8v5
         nbtpA5HA2B6IVdhtbOdO1aY8Of9cOLWnBC7BBp1DLf/nNvH+6EbD0oLho8lNaPGvIGeK
         yU06ctoX6tVUbhg0s8LYST1mwbtYWq9HIGt6C0ov8QbIo+dPcGnPm/od+jDG26jg8Js8
         RThJmFdhDssQr9NW6M4wl0sXf9A+b+OCwy6a+faklHiVR5Rc5azawkAFaDBuupK/RSVL
         X9O4xEilmZ47jzJP1vyc/Aa2ZWJItgvrUJ/OlBL7IBskU2lJ6az9ihYyPGVBou+klOH7
         wqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754135874; x=1754740674;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LWxIRNxDqG5eNfFXqzrD5SC5/+TAj2RB7XyayzT1xNI=;
        b=MRjm6g92lkxLib9ssUEcL96KGlU8GsPYFwI+6NEnft/fUHxis6l3mSibcvaFp/7PGb
         bF3ut9zvaSZspHrPKiWf9HfgURXKQQuw1158lQs92O8zrkHyzau1BCUZQrMTlYqp/AGN
         7c3Q1X5+gv+6PFS1+QSstF0DCZE36XC45FOe9ItSBZrHYcP9g6iS4t22elHx5sMfyNw7
         omMLmQkPKQM+nGG33x8AdJlRKdYGDA6oUAuPYO3caI1HmJt6Ppn1JXscZcnqNTDUaJaW
         89/AReacDxE9FbPTnSzQ/1oiJ0M/72ZPXSryqBACHkNeuaa21gFQrmloElA2Cbf8UGvE
         wKkw==
X-Gm-Message-State: AOJu0YzY1pg2zR8KpyTMwjDPNKBVv4rmWimNHBoI/lXrt49+bTijvdd1
	8IIw/PlerZobuhIHUNReqGv3nCas8MjEJd+O2/fZ3Ef0AxnfQVun9ZXxDa8BK1EDu95RJ2rBqDJ
	K9//mpQH2irQXLTIIFRw/Ma0GijigsNh77y8eWwM=
X-Gm-Gg: ASbGnctvPQLOMmjsd0/VEucmq0L0zSlWx+eo767aX5hY212V6O//9ws+yhu6LZV+F7D
	Mbilb4sD02DAhwgSAEtarc/LXoUKZ0aJ72pFJnTchF9yCHKsOJvNhobknUH8c3qI4ixSiJ3rk99
	3G0DivjzqACFLVqPCgGHw8N6urZbh2yyO1Zyxw6bbJw4vW/rHm//0agzVZ96u7BrPmGguZMTlm/
	CDjyHshLamBmA+kgQ==
X-Google-Smtp-Source: 
 AGHT+IGO8147uUt3XKEyVbOtBfgcX90IDNDfC/+lKhPRd90hmY/y3JxoheSKUjTUFNbf7MAfpj7GbUuB1NQTNPEFayw=
X-Received: by 2002:a05:651c:154b:b0:332:2ca3:da8f with SMTP id
 38308e7fff4ca-332567d6e4bmr8522831fa.22.1754135873356; Sat, 02 Aug 2025
 04:57:53 -0700 (PDT)
MIME-Version: 1.0
From: Ludd ite <luddite33@gmail.com>
Date: Sat, 2 Aug 2025 21:57:41 +1000
X-Gm-Features: Ac12FXy9LsZm6lvX9bhMNca2tjvyB3mqiA5pFu53FE8LQBhBSS_LJ0INZjs1ORQ
Message-ID: 
 <CAJVrcqZq34A0HjCT=Dq4xOvygS88_fxzn96BgTVwqkmwvnSvAw@mail.gmail.com>
Subject: [PATCH REQUEST] ALSA: hda/tas2781: Add support for ASUS VivoBook 16
 Flip TP3607SA
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: C2IAVSF5HSTZPIGYGHSJBRUYG2RVEOPS
X-Message-ID-Hash: C2IAVSF5HSTZPIGYGHSJBRUYG2RVEOPS
X-MailFrom: luddite33@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C2IAVSF5HSTZPIGYGHSJBRUYG2RVEOPS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Summary
=======
The ASUS VivoBook 16 Flip TP3607SA laptop contains TI TAS2781 smart
amplifiers but they are not supported by the current
snd_hda_scodec_tas2781_i2c driver. The driver fails to initialize with
"Platform not supported" error, preventing internal speakers from working.

Hardware Information
====================
Laptop Model: ASUS VivoBook 16 Flip TP3607SA_TP3607SA
BIOS Version: 1.0
PCI Audio Device: Intel Lunar Lake-M HD Audio Controller [8086:a828] (rev 10)
Subsystem Vendor: 0x1043 (ASUS)
Subsystem Device: 0x3e30
Audio Codec: Realtek ALC294 (HDA:10ec0294,10433e30,00100004)
Smart Amplifier: TI TAS2781 on I2C bus (ACPI ID: TIAS2781:00)

System Information
==================
OS: Ubuntu 25.04 (development)
Kernel: 6.14.0-1007-realtime
Audio System: PipeWire with SOF (Sound Open Firmware)
SOF Firmware: intel/sof-ipc4/lnl/sof-lnl.ri (version 2.12.0.1)
Topology: intel/sof-ipc4-tplg/sof-hda-generic-2ch.tplg

Current Behavior
================
1. Audio Detection: SOF firmware loads successfully and creates speaker
   sink in PipeWire
2. Audio Pipeline: Complete audio pipeline works (volume controls,
   routing, mixing)
3. TAS2781 Driver: Fails to bind with the following errors:

   tas2781-hda i2c-TIAS2781:00: Failed to get Speaker id.
   tas2781-hda i2c-TIAS2781:00: read acpi error, ret: -2
   tas2781-hda i2c-TIAS2781:00: error -ENOENT: Platform not supported
   tas2781-hda i2c-TIAS2781:00: probe with driver tas2781-hda failed
with error -2

4. Result: No sound from internal speakers (Bluetooth and HDMI audio
   work fine)

Technical Analysis
==================
- I2C Device Present: i2c-TIAS2781:00 device exists and is detected
- ACPI Information: Device has ACPI ID TIAS2781: but driver cannot read
  required configuration
- Volume Control: Audio shows active volume bars in pavucontrol,
  indicating software pipeline works
- Driver Status: TAS2781 driver loads but doesn't bind to the device due
  to platform whitelist

Evidence of TAS2781 Hardware
=============================
I2C device exists:
$ ls /sys/bus/i2c/devices/i2c-TIAS2781:00/
firmware_node modalias name power subsystem

Device modalias:
$ cat /sys/bus/i2c/devices/i2c-TIAS2781:00/modalias
acpi:TIAS2781:

PipeWire detects speaker sink:
$ pactl list sinks short | grep Speaker
60  alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__Speaker__sink

Expected Behavior
=================
The TAS2781 driver should recognize the ASUS VivoBook 16 Flip TP3607SA
(subsystem ID 1043:3e30) as a supported platform and successfully
initialize the smart amplifiers, enabling internal speaker audio output.

Workarounds Attempted
=====================
1. Manual I2C device creation: Created tas2781 devices at addresses
   0x38-0x3b, but they fail with communication timeouts (error -121)
2. Driver parameters: Tried various modprobe options, but the driver
   doesn't expose platform override parameters
3. GPIO manipulation: Attempted to enable GPIO pins that might control
   amplifier power, without success
4. Kernel versions: Tested multiple 6.14.x kernels including recent
   versions with November 26, 2024 ASUS TAS2781 improvements

Request
=======
Please add support for ASUS VivoBook 16 Flip TP3607SA (subsystem ID
1043:3e30) to the TAS2781 driver's supported platform list. This appears
to be a matter of adding the device ID to the driver's whitelist and
possibly providing the appropriate ACPI configuration parsing.

Additional Notes
================
- This is a recent laptop model (2024) with Intel Lunar Lake platform
- Other ASUS laptops may have similar TAS2781 configurations
- The November 26, 2024 commit "ALSA: hda/tas2781: Add speaker id check
  for ASUS projects" suggests ongoing work on ASUS TAS2781 support
- Hardware detection is working perfectly through SOF firmware

Contact Information
===================
Available for testing patches or providing additional debugging
information.

Attachments
===========
- Full dmesg output available upon request
- ACPI tables dump available if needed
- Detailed hardware information via sudo lshw available

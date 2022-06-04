Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E907F53D7BD
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jun 2022 18:25:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C35018AB;
	Sat,  4 Jun 2022 18:24:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C35018AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654359947;
	bh=liaZJ8bzGwp7khVsZ4OE1BW72BXqxTb8qUsdPWV9FM0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WmFoUByNOWWERiYYGQ8GGwToYfCda8/j9ORrGuagRS1GeNCdgtm2DA4UcqbRcbROk
	 AcZpZHQWIbbscie7QmtzM13uxt9CmXkyPpP+WINZCFVql4qtOt4ai8sWdZjYqV0o10
	 EAW+iNZUrpzdWGuqGHipqbOSJEcDjBkF2wZylGIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0981BF80224;
	Sat,  4 Jun 2022 18:24:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 952D3F804B1; Sat,  4 Jun 2022 18:24:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C4867F80124
 for <alsa-devel@alsa-project.org>; Sat,  4 Jun 2022 18:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4867F80124
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1654359875387720108-webhooks-bot@alsa-project.org>
References: <1654359875387720108-webhooks-bot@alsa-project.org>
Subject: New device naming breaks HDMI audio if ELD lookup fails
Message-Id: <20220604162438.952D3F804B1@alsa1.perex.cz>
Date: Sat,  4 Jun 2022 18:24:38 +0200 (CEST)
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

alsa-project/alsa-lib issue #233 was opened from berolinux:

The new device naming introduced by commit 859448f01033b40feebf9a0aab467ba57a655b5b breaks HDMI audio if the ELD lookup fails.

This happens e.g. with an older Sharp Aquos TV (from 2008) connected to an AMD Radeon HD 7450 graphics card with Linux kernel 5.18.1.
Adding some debug statements to control/eld.c shows it fails on the check for `l == 0`, with `l` being `0`, `cinfo.count` being `24`. A hexdump of the 24 bytes in eld is `10 00 05 00 00 10 00 01 00 00 00 00 00 00 00 00 00 00 00 00 09 07 01 00`.

The EDID info from the graphics card in sysfs makes sense though:

```
$ edid-decode /sys/class/drm/card0-HDMI-A-1/edid 
edid-decode (hex):

00 ff ff ff ff ff ff 00 4d 10 22 10 00 00 00 00
ff 12 01 03 80 52 2e 78 2a 1b be a2 55 34 b3 26
14 4a 52 af ce 00 a9 40 90 40 81 80 01 01 01 01
01 01 01 01 01 01 02 3a 80 d0 72 38 2d 40 10 2c
45 80 34 cc 31 00 00 1a 66 21 50 b0 51 00 1b 30
40 70 36 00 00 00 00 00 00 1e 00 00 00 fc 00 53
48 41 52 50 20 48 44 4d 49 0a 20 20 00 00 00 fd
00 17 4c 0f 4b 11 00 0a 20 20 20 20 20 20 01 40

02 03 2e 72 50 9f 90 20 14 05 13 04 12 03 11 02
16 07 15 06 01 23 09 07 01 83 01 00 00 e3 05 03
01 6c 03 0c 00 20 00 80 22 c0 11 11 19 19 02 3a
80 18 71 38 2d 40 58 2c 45 00 34 cc 31 00 00 1e
01 1d 80 d0 72 1c 16 20 10 2c 25 80 34 cc 31 00
00 9e 01 1d 80 18 71 1c 16 20 58 2c 25 00 34 cc
31 00 00 9e 01 1d 00 bc 52 d0 1e 20 b8 28 55 40
34 cc 31 00 00 1e 00 00 00 00 00 00 00 00 00 63

----------------

Block 0, Base EDID:
  EDID Structure Version & Revision: 1.3
  Vendor & Product Identification:
    Manufacturer: SHP
    Model: 4130
    Model year: 2008
  Basic Display Parameters & Features:
    Digital display
    Maximum image size: 82 cm x 46 cm
    Gamma: 2.20
    DPMS levels: Off
    RGB color display
    First detailed timing is the preferred timing
  Color Characteristics:
    Red  : 0.6328, 0.3330
    Green: 0.2050, 0.7021
    Blue : 0.1503, 0.0810
    White: 0.2919, 0.3222
  Established Timings I & II:
    IBM     :   720x400    70.082 Hz   9:5    31.467 kHz  28.320 MHz
    DMT 0x04:   640x480    59.940 Hz   4:3    31.469 kHz  25.175 MHz
    DMT 0x05:   640x480    72.809 Hz   4:3    37.861 kHz  31.500 MHz
    DMT 0x06:   640x480    75.000 Hz   4:3    37.500 kHz  31.500 MHz
    DMT 0x08:   800x600    56.250 Hz   4:3    35.156 kHz  36.000 MHz
    DMT 0x09:   800x600    60.317 Hz   4:3    37.879 kHz  40.000 MHz
    DMT 0x0a:   800x600    72.188 Hz   4:3    48.077 kHz  50.000 MHz
    DMT 0x0b:   800x600    75.000 Hz   4:3    46.875 kHz  49.500 MHz
    DMT 0x10:  1024x768    60.004 Hz   4:3    48.363 kHz  65.000 MHz
    DMT 0x11:  1024x768    70.069 Hz   4:3    56.476 kHz  75.000 MHz
    DMT 0x12:  1024x768    75.029 Hz   4:3    60.023 kHz  78.750 MHz
  Standard Timings:
    DMT 0x33:  1600x1200   60.000 Hz   4:3    75.000 kHz 162.000 MHz
    DMT 0x2a:  1400x1050   59.978 Hz   4:3    65.317 kHz 121.750 MHz
    DMT 0x23:  1280x1024   60.020 Hz   5:4    63.981 kHz 108.000 MHz
  Detailed Timing Descriptors:
    DTD 1:  1920x1080   50.000 Hz  16:9    56.250 kHz 148.500 MHz (820 mm x 460 mm)
                 Hfront  528 Hsync  44 Hback 148 Hpol P
                 Vfront    4 Vsync   5 Vback  36 Vpol N
    DTD 2:  1360x768    60.015 Hz  85:48   47.712 kHz  85.500 MHz
                 Hfront   64 Hsync 112 Hback 256 Hpol P
                 Vfront    3 Vsync   6 Vback  18 Vpol P
    Display Product Name: 'SHARP HDMI'
  Display Range Limits:
    Monitor ranges (GTF): 23-76 Hz V, 15-75 kHz H, max dotclock 170 MHz
  Extension blocks: 1
Checksum: 0x40

----------------

Block 1, CTA-861 Extension Block:
  Revision: 3
  Basic audio support
  Supports YCbCr 4:4:4
  Supports YCbCr 4:2:2
  Native detailed modes: 2
  Video Data Block:
    VIC  31:  1920x1080   50.000 Hz  16:9    56.250 kHz 148.500 MHz (native)
    VIC  16:  1920x1080   60.000 Hz  16:9    67.500 kHz 148.500 MHz (native)
    VIC  32:  1920x1080   24.000 Hz  16:9    27.000 kHz  74.250 MHz
    VIC  20:  1920x1080i  50.000 Hz  16:9    28.125 kHz  74.250 MHz
    VIC   5:  1920x1080i  60.000 Hz  16:9    33.750 kHz  74.250 MHz
    VIC  19:  1280x720    50.000 Hz  16:9    37.500 kHz  74.250 MHz
    VIC   4:  1280x720    60.000 Hz  16:9    45.000 kHz  74.250 MHz
    VIC  18:   720x576    50.000 Hz  16:9    31.250 kHz  27.000 MHz
    VIC   3:   720x480    59.940 Hz  16:9    31.469 kHz  27.000 MHz
    VIC  17:   720x576    50.000 Hz   4:3    31.250 kHz  27.000 MHz
    VIC   2:   720x480    59.940 Hz   4:3    31.469 kHz  27.000 MHz
    VIC  22:  1440x576i   50.000 Hz  16:9    15.625 kHz  27.000 MHz
    VIC   7:  1440x480i   59.940 Hz  16:9    15.734 kHz  27.000 MHz
    VIC  21:  1440x576i   50.000 Hz   4:3    15.625 kHz  27.000 MHz
    VIC   6:  1440x480i   59.940 Hz   4:3    15.734 kHz  27.000 MHz
    VIC   1:   640x480    59.940 Hz   4:3    31.469 kHz  25.175 MHz
  Audio Data Block:
    Linear PCM:
      Max channels: 2
      Supported sample rates (kHz): 48 44.1 32
      Supported sample sizes (bits): 16
  Speaker Allocation Data Block:
    FL/FR - Front Left/Right
  Colorimetry Data Block:
    xvYCC601
    xvYCC709
  Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
    Source physical address: 2.0.0.0
    Supports_AI
    Maximum TMDS clock: 170 MHz
    Video latency: 35 ms
    Audio latency: 35 ms
    Interlaced video latency: 51 ms
    Interlaced audio latency: 51 ms
  Detailed Timing Descriptors:
    DTD 3:  1920x1080   60.000 Hz  16:9    67.500 kHz 148.500 MHz (820 mm x 460 mm)
                 Hfront   88 Hsync  44 Hback 148 Hpol P
                 Vfront    4 Vsync   5 Vback  36 Vpol P
    DTD 4:  1920x1080i  50.000 Hz  16:9    28.125 kHz  74.250 MHz (820 mm x 460 mm)
                 Hfront  528 Hsync  44 Hback 148 Hpol P
                 Vfront    2 Vsync   5 Vback  15 Vpol P Vfront +0.5 Odd Field
                 Vfront    2 Vsync   5 Vback  15 Vpol P Vback  +0.5 Even Field
    DTD 5:  1920x1080i  60.000 Hz  16:9    33.750 kHz  74.250 MHz (820 mm x 460 mm)
                 Hfront   88 Hsync  44 Hback 148 Hpol P
                 Vfront    2 Vsync   5 Vback  15 Vpol P Vfront +0.5 Odd Field
                 Vfront    2 Vsync   5 Vback  15 Vpol P Vback  +0.5 Even Field
    DTD 6:  1280x720    50.000 Hz  16:9    37.500 kHz  74.250 MHz (820 mm x 460 mm)
                 Hfront  440 Hsync  40 Hback 220 Hpol P
                 Vfront    5 Vsync   5 Vback  20 Vpol P
Checksum: 0x63
```

Since an error code (`-EIO`) is passed on from `__snd_pcm_info_eld_fixup`, the HDMI audio output goes away altogether instead of just keeping the old name.

Will send a PR to keep the audio working, but it would be nice to actually make the new naming work as well.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/233
Repository URL: https://github.com/alsa-project/alsa-lib

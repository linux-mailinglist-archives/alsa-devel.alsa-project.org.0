Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2847A7BBE5
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Apr 2025 13:56:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3931960193;
	Fri,  4 Apr 2025 13:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3931960193
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743767795;
	bh=O4/HMpenZd27Jg93TTKog6yPgpSozs5C2T79ivkG/s0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bsmwRriczoDlt51JFA4gOtcCjgTJgJA6IrVbl9kWxyBTAklczStcoYjwxfJGuUGYg
	 FHN7Zp1iMN56sKupz/7i4343f2rnt/oW3lJNlXXxVQeYgnuRbPFacwU7CofbkGBZwk
	 z9a18x0/+gTDsJ3FpIdvTNqiJph6kLs5drzXKi0Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03B49F805C2; Fri,  4 Apr 2025 13:56:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA2E1F805BF;
	Fri,  4 Apr 2025 13:56:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DCA4F8023A; Fri,  4 Apr 2025 13:55:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EECEF80075
	for <alsa-devel@alsa-project.org>; Fri,  4 Apr 2025 13:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EECEF80075
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18331b88eb816800-webhooks-bot@alsa-project.org>
In-Reply-To: <18331b88eb7b3a00-webhooks-bot@alsa-project.org>
References: <18331b88eb7b3a00-webhooks-bot@alsa-project.org>
Subject: ALC4080 - general discussion (driver support)
Date: Fri,  4 Apr 2025 13:55:57 +0200 (CEST)
Message-ID-Hash: 2QBNR4LX36GG5RZ4CAM7XIH7XNN2IYYT
X-Message-ID-Hash: 2QBNR4LX36GG5RZ4CAM7XIH7XNN2IYYT
X-MailFrom: github@alsa-project.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2QBNR4LX36GG5RZ4CAM7XIH7XNN2IYYT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #541 was edited from perexg:

UCM cannot add basic functionalities when the driver does not expose them. I already explained situation in [kernel bugzilla](https://bugzilla.kernel.org/show_bug.cgi?id=218913).

**Note**

This issue is for the kernel driver related problems. If the driver works and something is missing in UCM configuration, please, create a new issue in this tracker. It may be difficult to distinguish the right place, but if the developers redirected you here, follow the instructions bellow.

**For issues like**

1. jack functionality assignment is unstable (jack functionality is not fixed - e.g. changes on warm reboot from windows)
2. low microphone volume (which cannot be controlled using native ALSA mixer controls)
3. sound is activated only after some magic plug/unplug sequence

**Further steps**

Try to analyze the audio driver using direct ALSA API. See [DEBUG.md](https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/DEBUG.md). Very nice report is in #528. Please, use it as a reference what to do. Developers usually do not have exact hardware, so observations describing which ALSA PCM device, which ALSA Mixer control, which ALSA Jack control can be used for given playback/capture device are essential. If the functionality cannot be handled with current ALSA audio driver, go to paragraphs bellow.

Reverse engineering of the Windows driver. Capture USB communication and save it to a file which can be replayed by [wireshark](https://www.wireshark.org). Try to write an explanation including timing (what happened in given time slots).

Driver reports should go to [kernel bugzilla](https://bugzilla.kernel.org). Add a comment with a link here.

You may also push hardware vendors to create USB device which fully follows the USB audio specification, so the ALSA driver will work out-of-box (without "quirks").

**Documentation links**

The documentation is not complete. Realtek support is generally very limited to provide full specification to their codecs / audio chips those years. They are providing details only to hardware vendors with a contract. If you know more, please, let us know.

- [ALC4080 block scheme](https://bugzilla.kernel.org/attachment.cgi?id=306370)
- [ALC4080 datasheet](https://bugzilla.kernel.org/attachment.cgi?id=307224)

**Some details**

ALC4080 is USB codec, thus it exposes functionality through the USB bus. The block scheme is nice to know internals, but look to the MCU paragraph in the datasheet:

```
2.1.2. Micro Controller Unit
  - On-chip high-performance and low-power MCU
  - Ultra-low power consumption when MCU is at idle state
  - MCU controls connection to USB bus for re-enumeration without hot-plug
  - Internal programmable memory support for customized audio function
  - Watchdog control for MCU reset and interrupt
  - Configurable VID (Vendor ID), PID (Product ID), and serial number string
```

This means, that the internal firmware for this MCU unit can change the behaviour of audio hardware. Usually, the firmware is vendor specific.

The USB audio hardware should comply with the USB Audio specification (refer https://www.usb.org/). The control units parsed by the ALSA driver can be obtained using 'cat /proc/asound/cardX/usbmixer' command (replace X with the correct ALSA card number). Those units are mapped to the standard mixer controls.

My guess is that the firmware is not complaint with the USB audio specification and some functionality is controlled using specific USB handshake (data blocks).

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/541
Repository URL: https://github.com/alsa-project/alsa-ucm-conf

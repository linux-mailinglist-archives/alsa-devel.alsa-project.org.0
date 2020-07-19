Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B55982258C6
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 09:39:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 591B4847;
	Mon, 20 Jul 2020 09:38:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 591B4847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595230755;
	bh=a5cwmf1bQCGiK8kCTFmco2ukiZFuNtsoUNEfVLhTKHI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rY0v9wmlwl+1KG/pTlJcvpqM/RFC38WGAh8/KoH8hRo57AxlNBIWg84PkmzqPckkD
	 gAQ5xO/RagXTa8xFvcR3DWQSyl7xv317VVReovrR9c/WhbJEtqqd5oXStpBrh9qRHg
	 yPrrHvcI/r8g30xmhpX7pkVMK+bMILR86Pe5NyeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 823F1F802DD;
	Mon, 20 Jul 2020 09:34:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA68CF8014C; Sun, 19 Jul 2020 17:17:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=LOTS_OF_MONEY,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp.al2klimov.de (smtp.al2klimov.de [78.46.175.9])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 018D8F800BF
 for <alsa-devel@alsa-project.org>; Sun, 19 Jul 2020 17:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 018D8F800BF
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by smtp.al2klimov.de (Postfix) with ESMTPA id 17AF3BC084;
 Sun, 19 Jul 2020 15:17:11 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: perex@perex.cz, tiwai@suse.com, corbet@lwn.net, gustavo@embeddedor.com,
 chris@boyle.name, andrew@adoakley.name, alsa-devel@alsa-project.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH for v5.9] ALSA: Replace HTTP links with HTTPS ones
Date: Sun, 19 Jul 2020 17:17:05 +0200
Message-Id: <20200719151705.59624-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
Authentication-Results: smtp.al2klimov.de;
 auth=pass smtp.auth=aklimov@al2klimov.de
 smtp.mailfrom=grandmaster@al2klimov.de
X-Mailman-Approved-At: Mon, 20 Jul 2020 09:34:10 +0200
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
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

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely
 or at least not (just) HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 Documentation/sound/alsa-configuration.rst  | 6 +++---
 Documentation/sound/cards/audigy-mixer.rst  | 2 +-
 Documentation/sound/cards/sb-live-mixer.rst | 2 +-
 Documentation/sound/hd-audio/notes.rst      | 6 +++---
 include/sound/hdmi-codec.h                  | 2 +-
 include/sound/omap-hdmi-audio.h             | 2 +-
 sound/isa/Kconfig                           | 2 +-
 sound/sparc/dbri.c                          | 2 +-
 sound/usb/mixer_maps.c                      | 2 +-
 9 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index 72f97d4b01a7..c755b1c5e16f 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -309,7 +309,7 @@ pcifix
 This module supports all ADB PCM channels, ac97 mixer, SPDIF, hardware
 EQ, mpu401, gameport. A3D and wavetable support are still in development.
 Development and reverse engineering work is being coordinated at
-http://savannah.nongnu.org/projects/openvortex/
+https://savannah.nongnu.org/projects/openvortex/
 SPDIF output has a copy of the AC97 codec output, unless you use the
 ``spdif`` pcm device, which allows raw data passthru.
 The hardware EQ hardware and SPDIF is only present in the Vortex2 and 
@@ -1575,7 +1575,7 @@ See Documentation/sound/cards/multisound.sh for important information
 about this driver.  Note that it has been discontinued, but the 
 Voyetra Turtle Beach knowledge base entry for it is still available
 at
-http://www.turtlebeach.com
+https://www.turtlebeach.com
 
 Module snd-msnd-pinnacle
 ------------------------
@@ -2703,4 +2703,4 @@ Kernel Bugzilla
 ALSA Developers ML
     mailto:alsa-devel@alsa-project.org
 alsa-info.sh script
-    http://www.alsa-project.org/alsa-info.sh
+    https://www.alsa-project.org/alsa-info.sh
diff --git a/Documentation/sound/cards/audigy-mixer.rst b/Documentation/sound/cards/audigy-mixer.rst
index 86213234435f..998f76e19cdd 100644
--- a/Documentation/sound/cards/audigy-mixer.rst
+++ b/Documentation/sound/cards/audigy-mixer.rst
@@ -331,7 +331,7 @@ WO 9901953 (A1)
         Execution and Audio Data Sequencing (Jan. 14, 1999)
 
 
-US Patents (http://www.uspto.gov/)
+US Patents (https://www.uspto.gov/)
 ----------------------------------
 
 US 5925841
diff --git a/Documentation/sound/cards/sb-live-mixer.rst b/Documentation/sound/cards/sb-live-mixer.rst
index bcb62fc99bbb..eccb0f0ffd0f 100644
--- a/Documentation/sound/cards/sb-live-mixer.rst
+++ b/Documentation/sound/cards/sb-live-mixer.rst
@@ -336,7 +336,7 @@ WO 9901953 (A1)
         Execution and Audio Data Sequencing (Jan. 14, 1999)
 
 
-US Patents (http://www.uspto.gov/)
+US Patents (https://www.uspto.gov/)
 ----------------------------------
 
 US 5925841
diff --git a/Documentation/sound/hd-audio/notes.rst b/Documentation/sound/hd-audio/notes.rst
index 0f3109d9abc8..cf4d7158af78 100644
--- a/Documentation/sound/hd-audio/notes.rst
+++ b/Documentation/sound/hd-audio/notes.rst
@@ -42,7 +42,7 @@ If you are interested in the deep debugging of HD-audio, read the
 HD-audio specification at first.  The specification is found on
 Intel's web page, for example:
 
-* http://www.intel.com/standards/hdaudio/
+* https://www.intel.com/standards/hdaudio/
 
 
 HD-Audio Controller
@@ -728,7 +728,7 @@ version can be found on git repository:
 
 The script can be fetched directly from the following URL, too:
 
-* http://www.alsa-project.org/alsa-info.sh
+* https://www.alsa-project.org/alsa-info.sh
 
 Run this script as root, and it will gather the important information
 such as the module lists, module parameters, proc file contents
@@ -818,7 +818,7 @@ proc-compatible output.
 
 The hda-analyzer:
 
-* http://git.alsa-project.org/?p=alsa.git;a=tree;f=hda-analyzer
+* https://git.alsa-project.org/?p=alsa.git;a=tree;f=hda-analyzer
 
 is a part of alsa.git repository in alsa-project.org:
 
diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 83b17682e01c..cc0b29bbcde3 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -2,7 +2,7 @@
 /*
  * hdmi-codec.h - HDMI Codec driver API
  *
- * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com
  *
  * Author: Jyri Sarha <jsarha@ti.com>
  */
diff --git a/include/sound/omap-hdmi-audio.h b/include/sound/omap-hdmi-audio.h
index 16c007b651f4..e5f82044a404 100644
--- a/include/sound/omap-hdmi-audio.h
+++ b/include/sound/omap-hdmi-audio.h
@@ -2,7 +2,7 @@
 /*
  * hdmi-audio.c -- OMAP4+ DSS HDMI audio support library
  *
- * Copyright (C) 2014 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2014 Texas Instruments Incorporated - https://www.ti.com
  *
  * Author: Jyri Sarha <jsarha@ti.com>
  */
diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
index cf7049999261..2d0144562173 100644
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -22,7 +22,7 @@
  *   - Data sheet of the T7903, a newer but very similar ISA bus equivalent
  *     available from the Lucent (formerly AT&T microelectronics) home
  *     page.
- *   - http://www.freesoft.org/Linux/DBRI/
+ *   - https://www.freesoft.org/Linux/DBRI/
  * - MMCODEC: Crystal Semiconductor CS4215 16 bit Multimedia Audio Codec
  *   Interfaces: CHI, Audio In & Out, 2 bits parallel
  *   Documentation: from the Crystal Semiconductor home page.
diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 9af7aa93f6fa..2ec484655201 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -233,7 +233,7 @@ static const struct usbmix_name_map maya44_map[] = {
 };
 
 /* Section "justlink_map" below added by James Courtier-Dutton <James@superbug.demon.co.uk>
- * sourced from Maplin Electronics (http://www.maplin.co.uk), part number A56AK
+ * sourced from Maplin Electronics (https://www.maplin.co.uk), part number A56AK
  * Part has 2 connectors that act as a single output. (TOSLINK Optical for digital out, and 3.5mm Jack for Analogue out.)
  * The USB Mixer publishes a Microphone and extra Volume controls for it, but none exist on the device,
  * so this map removes all unwanted sliders from alsamixer
-- 
2.27.0


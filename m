Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 363745097D0
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 08:42:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE2381B62;
	Thu, 21 Apr 2022 08:41:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE2381B62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650523328;
	bh=RLQB5Cemcb+aqV0Hd39Kikf1i3tTIYW7hQjXCWPlyls=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X9lnmzn4pVrIEpkU0dbCRRSuku29+UlqGvN9GPhkeSbs9PMSWTAMrCTqLmmjRjTah
	 ZPvbvsZobJ2UYHpGKHJNf62n6UIMBwO9Ye2wb0+cM6wqXS7o2MXeF59Y4rMNY4QiAH
	 PVWK/GOo2RPTZaPJloGPnwvyA9+r/niAMimAQi2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C1FDF80125;
	Thu, 21 Apr 2022 08:41:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79D86F80125; Thu, 21 Apr 2022 08:41:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B097F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 08:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B097F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="tpFoZuxD"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="tcdwVOAZ"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B568D1F752
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 06:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650523262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uNTyFleWa8HGJiKccWoy36FUVGcVEJgFvfGXoZ7Wm28=;
 b=tpFoZuxDJ9ce/2fU3Fdho7UObyR5mkBxXQdSCE7xSLkqh4W3N1gVLrNL+rk3gbXxljQAib
 f5RVk+DtP6JBMiM6z3sQUViVPONGcruiShXA/nv/tmhSWRWDE5rmmBV4Krto0WblD/njry
 FfTA0FL582lqyEMxhFnOEYFbJupaRl0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650523262;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uNTyFleWa8HGJiKccWoy36FUVGcVEJgFvfGXoZ7Wm28=;
 b=tcdwVOAZ31l30Eiw6CzCBriyo1S2Zf8plzcSlzfWPdHlzXAkeiItpv7e0yK0uS94/Wf05q
 ldu86EU1OqGm4PCA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id A54FD2C145;
 Thu, 21 Apr 2022 06:41:02 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: usb-audio: Add quirk bits for enabling/disabling
 generic implicit fb
Date: Thu, 21 Apr 2022 08:41:00 +0200
Message-Id: <20220421064101.12456-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

For making easier to test, add the new quirk_flags bits 17 and 18 to
enable and disable the generic implicit feedback mode.  The bit 17 is
equivalent with implicit_fb=1 option, applying the generic implicit
feedback sync mode.  OTOH, the bit 18 disables the implicit fb mode
forcibly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/alsa-configuration.rst | 4 +++-
 sound/usb/implicit.c                       | 5 ++++-
 sound/usb/usbaudio.h                       | 6 ++++++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index 34888d4fc4a8..21ab5e6f7062 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2246,7 +2246,7 @@ implicit_fb
     Apply the generic implicit feedback sync mode.  When this is set
     and the playback stream sync mode is ASYNC, the driver tries to
     tie an adjacent ASYNC capture stream as the implicit feedback
-    source.
+    source.  This is equivalent with quirk_flags bit 17.
 use_vmalloc
     Use vmalloc() for allocations of the PCM buffers (default: yes).
     For architectures with non-coherent memory like ARM or MIPS, the
@@ -2288,6 +2288,8 @@ quirk_flags
         * bit 14: Ignore errors for mixer access
         * bit 15: Support generic DSD raw U32_BE format
         * bit 16: Set up the interface at first like UAC1
+        * bit 17: Apply the generic implicit feedback sync mode
+        * bit 18: Don't apply implicit feedback sync mode
 
 This module supports multiple devices, autoprobe and hotplugging.
 
diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 2d444ec74202..1fd087128538 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -350,7 +350,8 @@ static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
 	}
 
 	/* Try the generic implicit fb if available */
-	if (chip->generic_implicit_fb)
+	if (chip->generic_implicit_fb ||
+	    (chip->quirk_flags & QUIRK_FLAG_GENERIC_IMPLICIT_FB))
 		return add_generic_implicit_fb(chip, fmt, alts);
 
 	/* No quirk */
@@ -387,6 +388,8 @@ int snd_usb_parse_implicit_fb_quirk(struct snd_usb_audio *chip,
 				    struct audioformat *fmt,
 				    struct usb_host_interface *alts)
 {
+	if (chip->quirk_flags & QUIRK_FLAG_SKIP_IMPLICIT_FB)
+		return 0;
 	if (fmt->endpoint & USB_DIR_IN)
 		return audioformat_capture_quirk(chip, fmt, alts);
 	else
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index b8359a0aa008..044cd7ab27cb 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -164,6 +164,10 @@ extern bool snd_usb_skip_validation;
  *  Support generic DSD raw U32_BE format
  * QUIRK_FLAG_SET_IFACE_FIRST:
  *  Set up the interface at first like UAC1
+ * QUIRK_FLAG_GENERIC_IMPLICIT_FB
+ *  Apply the generic implicit feedback sync mode (same as implicit_fb=1 option)
+ * QUIRK_FLAG_SKIP_IMPLICIT_FB
+ *  Don't apply implicit feedback sync mode
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
@@ -183,5 +187,7 @@ extern bool snd_usb_skip_validation;
 #define QUIRK_FLAG_IGNORE_CTL_ERROR	(1U << 14)
 #define QUIRK_FLAG_DSD_RAW		(1U << 15)
 #define QUIRK_FLAG_SET_IFACE_FIRST	(1U << 16)
+#define QUIRK_FLAG_GENERIC_IMPLICIT_FB	(1U << 17)
+#define QUIRK_FLAG_SKIP_IMPLICIT_FB	(1U << 18)
 
 #endif /* __USBAUDIO_H */
-- 
2.31.1


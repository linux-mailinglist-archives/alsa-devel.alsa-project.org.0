Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFE04DD601
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 09:21:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BE2317AA;
	Fri, 18 Mar 2022 09:21:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BE2317AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647591714;
	bh=qGRE+EV2Bvfprta+Pj14A7hs9vez71m0i2DFC8b31R4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GJRoJuV/23yybZFS9iXNmCaCzJf/rcX8tCjparDZ9KR0A8iVvBBpitJNqcG4WNGM1
	 90H8lWrDtw4i+R5zwXKpeZLFqs1+unNpJb6Yg8HAyMWmPT1GQOz2ss30vXRTYJ0CKF
	 /jujHjeT/l+neyK1eCZm18THdSM65MXhE7lolRqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90C94F8026D;
	Fri, 18 Mar 2022 09:20:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8005F8026A; Fri, 18 Mar 2022 09:20:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25AA0F80121
 for <alsa-devel@alsa-project.org>; Fri, 18 Mar 2022 09:20:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25AA0F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="dt0W2AN2"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="289tLx8+"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id DEAF821101
 for <alsa-devel@alsa-project.org>; Fri, 18 Mar 2022 08:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647591638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oxsS8TXyL0nzRrhbwdRzjmzrOuB5GyN1Xp5SghR3akc=;
 b=dt0W2AN2fB5aTUw5p7aFBi4cCleVD3iSJKXSbLuWZ3fp9dQWHpOUCQsxFApzEdrHDmass6
 2YJy7DfhzkCdxTTxHm0HFZnmBZRhygEjkcMkADwGDhoE/ci1g1oiAB9Vr0LVHUurz5plKD
 f3rVVjt5AH9z1LIlafMAWMJgYE7v8b0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647591638;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=oxsS8TXyL0nzRrhbwdRzjmzrOuB5GyN1Xp5SghR3akc=;
 b=289tLx8+AMwHtCDrYMiLAADQlYsaoOue3yLsh+nlq7mCbjaCKcEvw0sjUbdaTKct6YbwcY
 i1ZmyY0nWWXaIcAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id CBEC5A3B89;
 Fri, 18 Mar 2022 08:20:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: oss: Fix PCM OSS buffer allocation overflow
Date: Fri, 18 Mar 2022 09:20:36 +0100
Message-Id: <20220318082036.29699-1-tiwai@suse.de>
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

We've got syzbot reports hitting INT_MAX overflow at vmalloc()
allocation that is called from snd_pcm_plug_alloc().  Although we
apply the restrictions to input parameters, it's based only on the
hw_params of the underlying PCM device.  Since the PCM OSS layer
allocates a temporary buffer for the data conversion, the size may
become unexpectedly large when more channels or higher rates is given;
in the reported case, it went over INT_MAX, hence it hits WARN_ON().

This patch is an attempt to avoid such an overflow and an allocation
for too large buffers.  First off, it adds the limit of 1MB as the
upper bound for period bytes.  This must be large enough for all use
cases, and we really don't want to handle a larger temporary buffer
than this size.  The size check is performed at two places, where the
original period bytes is calculated and where the plugin buffer size
is calculated.

In addition, the driver uses array_size() and array3_size() for
multiplications to catch overflows for the converted period size and
buffer bytes.

Reported-by: syzbot+72732c532ac1454eeee9@syzkaller.appspotmail.com
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/00000000000085b1b305da5a66f3@google.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_oss.c    | 12 ++++++++----
 sound/core/oss/pcm_plugin.c |  5 ++++-
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 3ee9edf85815..f158f0abd25d 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -774,6 +774,11 @@ static int snd_pcm_oss_period_size(struct snd_pcm_substream *substream,
 
 	if (oss_period_size < 16)
 		return -EINVAL;
+
+	/* don't allocate too large period; 1MB period must be enough */
+	if (oss_period_size > 1024 * 1024)
+		return -ENOMEM;
+
 	runtime->oss.period_bytes = oss_period_size;
 	runtime->oss.period_frames = 1;
 	runtime->oss.periods = oss_periods;
@@ -1043,10 +1048,9 @@ static int snd_pcm_oss_change_params_locked(struct snd_pcm_substream *substream)
 			goto failure;
 	}
 #endif
-	oss_period_size *= oss_frame_size;
-
-	oss_buffer_size = oss_period_size * runtime->oss.periods;
-	if (oss_buffer_size < 0) {
+	oss_period_size = array_size(oss_period_size, oss_frame_size);
+	oss_buffer_size = array_size(oss_period_size, runtime->oss.periods);
+	if (oss_buffer_size <= 0) {
 		err = -EINVAL;
 		goto failure;
 	}
diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index 061ba06bc926..82e180c776ae 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -62,7 +62,10 @@ static int snd_pcm_plugin_alloc(struct snd_pcm_plugin *plugin, snd_pcm_uframes_t
 	width = snd_pcm_format_physical_width(format->format);
 	if (width < 0)
 		return width;
-	size = frames * format->channels * width;
+	size = array3_size(frames, format->channels, width);
+	/* check for too large period size once again */
+	if (size > 1024 * 1024)
+		return -ENOMEM;
 	if (snd_BUG_ON(size % 8))
 		return -ENXIO;
 	size /= 8;
-- 
2.34.1


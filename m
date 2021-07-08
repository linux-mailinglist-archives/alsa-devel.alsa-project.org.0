Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA453BF850
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 12:19:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1877168F;
	Thu,  8 Jul 2021 12:18:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1877168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625739551;
	bh=UJczOQ3x+yXA+LPQN1xDFI5nELqdqgkddKkRCfmmVmc=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T6Sg+VUDcUSNjmntp+sKnewtdMQZ1T2P4fhFqpefav2jAg22sMZx0tzHj1P0mycCw
	 SjwG6+bZkrAHDpDdwDS+qs/9DLdR7t6ndlJJGvptpOb8cLWhRzgl/fhDQ626rBm1cf
	 dH3bW7TxGAVksgcMk1JEMJfN+5IBffsQggg3ZYoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B907DF805E9;
	Thu,  8 Jul 2021 12:04:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFAF7F80249; Thu,  8 Jul 2021 04:08:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 012ABF80143
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 04:08:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 012ABF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="LbHRdYzx"
Received: by mail-pf1-x449.google.com with SMTP id
 h6-20020a62b4060000b02903131bc4a1acso2755666pfn.4
 for <alsa-devel@alsa-project.org>; Wed, 07 Jul 2021 19:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=sFr66KLjhv/rtOyfoenixLkVIGJVX1U7+t9+pUXGRz0=;
 b=LbHRdYzxmNi4zsGMVsNIQbfL+yS/wSqxzq2llODEQcTC0bqKVd6mTee5yKzwDzICDi
 eeI6aMOvI8B3pyDv3r+bGMn0ODCBLI5tew7HrsmS5/L9dM3IJjLDNKtz1R5uMw5lpdtx
 JW+rqjhXgNuJUjI+aW5D/aKK+jseTpm3xQbbHx3ZBnsvfIlpeL2OP2myJIHzf0BZpkiK
 zF2JRy3rQepTT78sqYyizxtBW/bJqy6Kz0pLawmQRsyJ6VhYQd6WcjCKOckDPSKn29xh
 DJy0+3i4dbIzosBg5mmqg5C7Rlytz4tq+ezpYF1IPDUPUy6HYT1AvN7fTj367U7JdnH0
 kAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=sFr66KLjhv/rtOyfoenixLkVIGJVX1U7+t9+pUXGRz0=;
 b=LtSMmqkD6fUt29dvx16TD/tDK04XKPEbuqKbL6+wRwQM6QtFgcm04XWQOEy1byD265
 9o3otw/L1mKUkRbXkd1VwqHoUOmBM9uvOQYrTDbKZQV9XHqGdeEuZPMGf7vVUCSX8mU7
 hYZsXjEyhlQb/v3+y79iFof08PvdRlbPU1RhuBhffrLg2wt0fy36ivK0ezGj/KnfVXZt
 Z3tcBUtvpI+6JgQcVAEszTIM+NveEL86F42RntgvuIPRrxcHJh94NvPgu3hwSQCSdNVa
 JJcuV9WC/Dfo9kFKDiugHTWILQsR/e+tu9kCnwiBk9WQ/HzEYewGhOs/xriMsbhV3wT3
 HYjQ==
X-Gm-Message-State: AOAM5313kBbMHq4o2l623Ujw4MYlWE4offx0uMrQTE6LHhQEzWC2tX1H
 ka/Ieih7bPLTKZ6uQsFyEtp2S2UGkxOm
X-Google-Smtp-Source: ABdhPJwCWGfLKtmRC+vmlAbMs8Msg0HcL7yuI6AzuNsH87AhMdMwY9t23Heh8N8CjIM8/JkTJXPvFhQpM+eTjg==
X-Received: from lerobert.c.googlers.com
 ([fda3:e722:ac3:cc00:12:b22d:c0a8:2e6])
 (user=lerobert job=sendgmr) by 2002:a17:903:304e:b029:11d:75ff:c304 with SMTP
 id u14-20020a170903304eb029011d75ffc304mr23576141pla.33.1625710130648; Wed,
 07 Jul 2021 19:08:50 -0700 (PDT)
Date: Thu,  8 Jul 2021 02:08:15 +0000
Message-Id: <20210708020815.3489365-1-lerobert@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [Patch v2] ALSA: compress: allow to leave draining state when pausing
 in draining
From: Robert Lee <lerobert@google.com>
To: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 08 Jul 2021 12:04:27 +0200
Cc: alsa-devel@alsa-project.org, zxinhui@google.com, carterhsu@google.com,
 linux-kernel@vger.kernel.org, bubblefang@google.com,
 Robert Lee <lerobert@google.com>
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

When compress offload pauses in draining state, not all platforms
need to keep in draining state. Some platforms may call drain or
partial drain again when resume from pause in draining, so it needs
to wake up from snd_compress_wait_for_drain() in this case.

Call API snd_compr_leave_draining_in_pause(), if the platform
doesn't need to keep in draining state when pause in draining
state.

Signed-off-by: Robert Lee <lerobert@google.com>
---
 include/sound/compress_driver.h | 14 ++++++++++++++
 sound/core/compress_offload.c   |  8 +++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index 277087f635f3..e16524a93a14 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -145,6 +145,7 @@ struct snd_compr_ops {
  * @lock: device lock
  * @device: device id
  * @use_pause_in_draining: allow pause in draining, true when set
+ * @leave_draining_in_pause: leave draining state when pausing in draining
  */
 struct snd_compr {
 	const char *name;
@@ -156,6 +157,7 @@ struct snd_compr {
 	struct mutex lock;
 	int device;
 	bool use_pause_in_draining;
+	bool leave_draining_in_pause;
 #ifdef CONFIG_SND_VERBOSE_PROCFS
 	/* private: */
 	char id[64];
@@ -182,6 +184,18 @@ static inline void snd_compr_use_pause_in_draining(struct snd_compr_stream *subs
 	substream->device->use_pause_in_draining = true;
 }
 
+/**
+ * snd_compr_leave_draining_in_pause - Leave draining state when pause in draining
+ * @substream: compress substream to set
+ *
+ * In some platform, we need to leave draining state when we use pause in draining.
+ * Add API to allow leave draining state.
+ */
+static inline void snd_compr_leave_draining_in_pause(struct snd_compr_stream *substream)
+{
+	substream->device->leave_draining_in_pause = true;
+}
+
 /* dsp driver callback apis
  * For playback: driver should call snd_compress_fragment_elapsed() to let the
  * framework know that a fragment has been consumed from the ring buffer
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 21ce4c056a92..c6e5c8f072d7 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -719,8 +719,14 @@ static int snd_compr_pause(struct snd_compr_stream *stream)
 		if (!stream->device->use_pause_in_draining)
 			return -EPERM;
 		retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_PUSH);
-		if (!retval)
+		if (!retval) {
+			if (stream->device->leave_draining_in_pause) {
+				stream->runtime->state = SNDRV_PCM_STATE_PAUSED;
+				wake_up(&stream->runtime->sleep);
+				break;
+			}
 			stream->pause_in_draining = true;
+		}
 		break;
 	default:
 		return -EPERM;
-- 
2.32.0.93.g670b81a890-goog


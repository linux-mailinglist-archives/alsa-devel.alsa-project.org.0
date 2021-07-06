Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8825C3BF82B
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 12:13:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 155CB16D3;
	Thu,  8 Jul 2021 12:12:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 155CB16D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625739197;
	bh=afIIeLKjltFvWKnnd4smfGgp/6rNgG7je5kJATXBujM=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Xp1Q65w11jL+Pg3QLM9MNXYrIjg/vnW1o8+7wRyxz4/Fx2acLL6EPc7aDosIMpGVH
	 1+EWeys7rie17gCsBo5/NRsGW4PGZJmtktMl5TlMj8lB1Z+DroRPaj74zSJTh3R9t1
	 1B/gL8h2PQDIcjL+bqJE7XEYgpdE0Ktpbqtnj9fw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECD51F80564;
	Thu,  8 Jul 2021 12:04:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C8E7F80249; Tue,  6 Jul 2021 14:44:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71E04F8014E
 for <alsa-devel@alsa-project.org>; Tue,  6 Jul 2021 14:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71E04F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="EQU42Skl"
Received: by mail-qk1-x74a.google.com with SMTP id
 d24-20020a05620a1378b02903b477b3922bso12148018qkl.11
 for <alsa-devel@alsa-project.org>; Tue, 06 Jul 2021 05:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=W5WGGuw9mY9cDhR3LIq+HgKfjZfrhsSy4zPxklG3/y4=;
 b=EQU42SklHQrQl7lnVUDrNZLaovJjv8Z7V7jBtK+lwezdrBXs7OsWVleySoh+SHope4
 FfzlmD1BqKIvBfLRcjKmIRE/OnQO2P4TWjjA/IcgTEcx2etAEcmpcz+ELTcRer3gTUjG
 4ji0EMks2knMHOiPyk0GRjNZ5IVaDcEPlHC4Czu3Qot9takA3DmcgHhfouDhSdOkz7yZ
 DOeNH1GVRq7WFfHiYlFfFIDezihAePz4FIkgrxmxqp5JFzoRQtY2xASa/5tU74+/LN2g
 rJPoCwZ//EndvQb/EfYd74lxCo4lX6GDN01CoD0Tq1efTtK+0lU02i1MDTAbBDAU4z/s
 ZHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=W5WGGuw9mY9cDhR3LIq+HgKfjZfrhsSy4zPxklG3/y4=;
 b=SJk3HLxQrLR1mwGcDxtpGDSVcaoZvTPKe4XtZqEa9ZADhR7LckbA/LprBUQXdzXWik
 GNEQL+THabbSIoLVCUbSVzoiap2EgkbtSTMOUQsWuUMtRgvXISK3yt4uWTC5xIbtWz7M
 C/87FZVircM6sgvloQXpoxHLCO5kRe3thM+xpST4CgpVVl3eXvER+HGiYps14aunnOGn
 VyVsP2H7o9upgpOU9yFCHnPdvH+gd7Q7vFisKOE+Ei4R16Xuz5qzFpkXm1LD3lWJxwII
 VXV7eQpR1BHyCKwSQ+pW8RAvPh19y2LQCLdnwYCR9Pg4JenhFf8hQ3ENNBF+D9ALF04v
 0aGQ==
X-Gm-Message-State: AOAM531hwaNfyy0l3mU+bDRTEa5+litlfNY5NNQyjOWUhkMLa/Hvn0I0
 SKyYOSYo/S8PbdovliDP2A057FPrpL9i
X-Google-Smtp-Source: ABdhPJxyBXA+rOueMg9oLrtfXHHTafUJJ35UOWa3x4KFwlyFK6zIz9RkGjzLMyfyKfBxnyw6oU6IV0QIWw8cpA==
X-Received: from lerobert.c.googlers.com
 ([fda3:e722:ac3:cc00:12:b22d:c0a8:2e6])
 (user=lerobert job=sendgmr) by 2002:ad4:59cf:: with SMTP id
 el15mr13422561qvb.55.1625575489452; Tue, 06 Jul 2021 05:44:49 -0700 (PDT)
Date: Tue,  6 Jul 2021 12:44:40 +0000
Message-Id: <20210706124440.3247283-1-lerobert@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH] ALSA: compress: allow to leave draining state when pausing in
 draining
From: Robert Lee <lerobert@google.com>
To: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 08 Jul 2021 12:04:26 +0200
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
 sound/core/compress_offload.c   |  7 ++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

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
index 21ce4c056a92..9c7bd4db6ecd 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -719,8 +719,13 @@ static int snd_compr_pause(struct snd_compr_stream *stream)
 		if (!stream->device->use_pause_in_draining)
 			return -EPERM;
 		retval = stream->ops->trigger(stream, SNDRV_PCM_TRIGGER_PAUSE_PUSH);
-		if (!retval)
+		if (!retval) {
 			stream->pause_in_draining = true;
+			if (stream->device->leave_draining_in_pause) {
+				stream->runtime->state = SNDRV_PCM_STATE_PAUSED;
+				wake_up(&stream->runtime->sleep);
+			}
+		}
 		break;
 	default:
 		return -EPERM;
-- 
2.32.0.93.g670b81a890-goog


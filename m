Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA414E44D1
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 18:14:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E78B91755;
	Tue, 22 Mar 2022 18:13:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E78B91755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647969282;
	bh=vHhJnXnFOiLDFOyEgs7Jck+BVJtmve4c432zNqeScIg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C5hUcXs9pKQjcuACD1dBZD5J3ZjbGgUcBVUMqi8LbdAFPxlHKEjW82eBbopphYazk
	 UdweMkRmu9uKSTAQbvvo6PnHWYwZ0f7T8sDmA3gk4xFjjdRHEBGb28YXtLhmkZqGxE
	 vMANO0X2vKDr2RIyYBj//9zhPSx7Z0N7xGAdZP94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DC46F8032D;
	Tue, 22 Mar 2022 18:13:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93035F80116; Tue, 22 Mar 2022 18:13:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7086EF80116
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 18:13:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7086EF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Xd9S+ZYt"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="vSOFEjcK"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 880B71F37F
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 17:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647969206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hnvftIxYx1MxerZVMcMiw5SXN3TtqipAM+nTexi6DOk=;
 b=Xd9S+ZYtnRGaCUav64/grGpBeq6g9clsam9TCOlh+0R9Ml8+0KYCfM0womnHStEq+ROI9j
 15dX6fCdlEpMRPxgWe1uEHLAemjAomBuXq5M8iMbfqvN8yaWjfpN+UwmGcJ5DuxmJA+48t
 riFKtQ3TkndLqSiTTCCnEpr96qD0Cc0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647969206;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hnvftIxYx1MxerZVMcMiw5SXN3TtqipAM+nTexi6DOk=;
 b=vSOFEjcKSMvasjnchvD0BPeXDy7/r7646+eFifQY/f6IgmufId3ihhcCrli6TdQ1Ju+rCz
 zg+/M986M8xlWeAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 80FCBA3B8A;
 Tue, 22 Mar 2022 17:13:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: Add stream lock during PCM reset ioctl operations
Date: Tue, 22 Mar 2022 18:13:25 +0100
Message-Id: <20220322171325.4355-1-tiwai@suse.de>
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

snd_pcm_reset() is a non-atomic operation, and it's allowed to run
during the PCM stream running.  It implies that the manipulation of
hw_ptr and other parameters might be racy.

This patch adds the PCM stream lock at appropriate places in
snd_pcm_*_reset() actions for covering that.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 0e4fbf5fd87b..704fdc9ebf91 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1864,11 +1864,13 @@ static int snd_pcm_do_reset(struct snd_pcm_substream *substream,
 	int err = snd_pcm_ops_ioctl(substream, SNDRV_PCM_IOCTL1_RESET, NULL);
 	if (err < 0)
 		return err;
+	snd_pcm_stream_lock_irq(substream);
 	runtime->hw_ptr_base = 0;
 	runtime->hw_ptr_interrupt = runtime->status->hw_ptr -
 		runtime->status->hw_ptr % runtime->period_size;
 	runtime->silence_start = runtime->status->hw_ptr;
 	runtime->silence_filled = 0;
+	snd_pcm_stream_unlock_irq(substream);
 	return 0;
 }
 
@@ -1876,10 +1878,12 @@ static void snd_pcm_post_reset(struct snd_pcm_substream *substream,
 			       snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	snd_pcm_stream_lock_irq(substream);
 	runtime->control->appl_ptr = runtime->status->hw_ptr;
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
 	    runtime->silence_size > 0)
 		snd_pcm_playback_silence(substream, ULONG_MAX);
+	snd_pcm_stream_unlock_irq(substream);
 }
 
 static const struct action_ops snd_pcm_action_reset = {
-- 
2.31.1


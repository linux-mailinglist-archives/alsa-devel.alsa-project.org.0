Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1884E44C0
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 18:09:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB6D6177E;
	Tue, 22 Mar 2022 18:09:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB6D6177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647968998;
	bh=8qle0TCC7KetuGvNnXKvDZIJZE065J65JBk6IwB9Es0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I6e3P94/uvCmZdZi3fxxoXZXquGFnuBe+HTZBH0ovW1A4HVv9NRLr0T8NyxywQCrg
	 lkzR5/5SKNUM5lG79b3rIqZTmBqmE8NX8A6wprbovV5t7VFW98iEdyVtbgtoEm0LYm
	 RQWM7U707SQotuFgdqawL1CsTiXaFY/efto/SzeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37113F8051B;
	Tue, 22 Mar 2022 18:07:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE14DF804C1; Tue, 22 Mar 2022 18:07:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF9E2F8032D
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 18:07:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF9E2F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Vw95QBvC"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="OU5aFBrD"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 3AB67210F0;
 Tue, 22 Mar 2022 17:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647968867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OKjFtB5KBr9W4w3NflnR7TkFxvAb0C5HMxfUzYIzr7s=;
 b=Vw95QBvC7cbTiU9SNUtLQSonYr3TkhQcan8iNTv8RiCH8N1dR+YThU56V5EDKHoqkvvrUO
 ZzvOcAW8EFpXpuZUKdhywBM/+IHGdAZM+/2uurakRCxllv4CKA5qHde1H122A1vQsT1pdO
 W0wKG48wPmQeihrQTEG9036FwahmFNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647968867;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OKjFtB5KBr9W4w3NflnR7TkFxvAb0C5HMxfUzYIzr7s=;
 b=OU5aFBrDmu/SozBe6LOmSsOl+7vDH57qPQHFE/j9z8rXUuMYXfJbFMfrYXrZUo6aRgnhzl
 wdUl6cLEyeF+L9DQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 29758A3B89;
 Tue, 22 Mar 2022 17:07:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ALSA: pcm: Fix races among concurrent prepare and
 hw_params/hw_free calls
Date: Tue, 22 Mar 2022 18:07:19 +0100
Message-Id: <20220322170720.3529-4-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220322170720.3529-1-tiwai@suse.de>
References: <20220322170720.3529-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hu Jiahui <kirin.say@gmail.com>, linux-kernel@vger.kernel.org
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

Like the previous fixes to hw_params and hw_free ioctl races, we need
to paper over the concurrent prepare ioctl calls against hw_params and
hw_free, too.

This patch implements the locking with the existing
runtime->buffer_mutex for prepare ioctls.  Unlike the previous case
for snd_pcm_hw_hw_params() and snd_pcm_hw_free(), snd_pcm_prepare() is
performed to the linked streams, hence the lock can't be applied
simply on the top.  For tracking the lock in each linked substream, we
modify snd_pcm_action_group() slightly and apply the buffer_mutex for
the case stream_lock=false (formerly there was no lock applied)
there.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 266895374b83..0e4fbf5fd87b 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1190,15 +1190,17 @@ struct action_ops {
 static int snd_pcm_action_group(const struct action_ops *ops,
 				struct snd_pcm_substream *substream,
 				snd_pcm_state_t state,
-				bool do_lock)
+				bool stream_lock)
 {
 	struct snd_pcm_substream *s = NULL;
 	struct snd_pcm_substream *s1;
 	int res = 0, depth = 1;
 
 	snd_pcm_group_for_each_entry(s, substream) {
-		if (do_lock && s != substream) {
-			if (s->pcm->nonatomic)
+		if (s != substream) {
+			if (!stream_lock)
+				mutex_lock_nested(&s->runtime->buffer_mutex, depth);
+			else if (s->pcm->nonatomic)
 				mutex_lock_nested(&s->self_group.mutex, depth);
 			else
 				spin_lock_nested(&s->self_group.lock, depth);
@@ -1226,18 +1228,18 @@ static int snd_pcm_action_group(const struct action_ops *ops,
 		ops->post_action(s, state);
 	}
  _unlock:
-	if (do_lock) {
-		/* unlock streams */
-		snd_pcm_group_for_each_entry(s1, substream) {
-			if (s1 != substream) {
-				if (s1->pcm->nonatomic)
-					mutex_unlock(&s1->self_group.mutex);
-				else
-					spin_unlock(&s1->self_group.lock);
-			}
-			if (s1 == s)	/* end */
-				break;
+	/* unlock streams */
+	snd_pcm_group_for_each_entry(s1, substream) {
+		if (s1 != substream) {
+			if (!stream_lock)
+				mutex_unlock(&s1->runtime->buffer_mutex);
+			else if (s1->pcm->nonatomic)
+				mutex_unlock(&s1->self_group.mutex);
+			else
+				spin_unlock(&s1->self_group.lock);
 		}
+		if (s1 == s)	/* end */
+			break;
 	}
 	return res;
 }
@@ -1367,10 +1369,12 @@ static int snd_pcm_action_nonatomic(const struct action_ops *ops,
 
 	/* Guarantee the group members won't change during non-atomic action */
 	down_read(&snd_pcm_link_rwsem);
+	mutex_lock(&substream->runtime->buffer_mutex);
 	if (snd_pcm_stream_linked(substream))
 		res = snd_pcm_action_group(ops, substream, state, false);
 	else
 		res = snd_pcm_action_single(ops, substream, state);
+	mutex_unlock(&substream->runtime->buffer_mutex);
 	up_read(&snd_pcm_link_rwsem);
 	return res;
 }
-- 
2.31.1


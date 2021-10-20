Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB274350B7
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 18:53:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C4FB168C;
	Wed, 20 Oct 2021 18:52:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C4FB168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634748792;
	bh=4L/MkNYJnFF2o0tyOV6tAlE1jmWkg2CrIH5vuLUYAE8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZW2rLsm6JjCWP08X3pVAVznyr1nzs8OOssqehga8OUNx++1D9bSdxm6Eom+enVpo5
	 oftTg13Plh+Hgb7rp8Wo25F0t8jK/nmvRAsqV8h4wquPnP93gyvAEi+FHEB+GPdW0p
	 bw/sdiARnpIkD7Avs/N4UTid4mb7+YVYZQPxpTB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CE08F802A9;
	Wed, 20 Oct 2021 18:49:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E65AAF802A9; Wed, 20 Oct 2021 18:49:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE7C2F802A9
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 18:48:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE7C2F802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="e8QaTmFc"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="B99bXwaN"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 298B621A9C
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 16:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634748528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SgM2Cehso5AZXJq98byCyo1MQUoOAy4doQhexhSNfnk=;
 b=e8QaTmFcCRx3ZgfW05duvsgaWmcS1deLmqKYCoB91cdT7VgT4JXhMH45B+g73g7m9iVp09
 8zikPo0u5pbWPf03QoZ3KlvZKOTzvfetb6BreEHLt+UWCaESU+XYTqKn1JhLwRohIJm1xr
 1PIsAO3nbNuUjF1D1upMPxk2cqCiAS8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634748528;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SgM2Cehso5AZXJq98byCyo1MQUoOAy4doQhexhSNfnk=;
 b=B99bXwaNGa1MQpAi2oGt4a2/iyHd0S9tVR08SOhrCVJbMjbnzyqMx5ic9wT4UW6L4IhPH/
 zsrV3yclhzDBTOCA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 23839A3B83;
 Wed, 20 Oct 2021 16:48:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: mixer: oss: Fix racy access to slots
Date: Wed, 20 Oct 2021 18:48:46 +0200
Message-Id: <20211020164846.922-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

The OSS mixer can reassign the mapping slots dynamically via proc
file.  Although the addition and deletion of those slots are protected
by mixer->reg_mutex, the access to slots aren't, hence this may cause
UAF when the slots in use are deleted concurrently.

This patch applies the mixer->reg_mutex in all appropriate code paths
(i.e. the ioctl functions) that may access slots.

Reported-by: syzbot+9988f17cf72a1045a189@syzkaller.appspotmail.com
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/00000000000036adc005ceca9175@google.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/mixer_oss.c | 44 ++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index 6a5abdd4271b..d5ddc154a735 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -130,11 +130,13 @@ static int snd_mixer_oss_devmask(struct snd_mixer_oss_file *fmixer)
 
 	if (mixer == NULL)
 		return -EIO;
+	mutex_lock(&mixer->reg_mutex);
 	for (chn = 0; chn < 31; chn++) {
 		pslot = &mixer->slots[chn];
 		if (pslot->put_volume || pslot->put_recsrc)
 			result |= 1 << chn;
 	}
+	mutex_unlock(&mixer->reg_mutex);
 	return result;
 }
 
@@ -146,11 +148,13 @@ static int snd_mixer_oss_stereodevs(struct snd_mixer_oss_file *fmixer)
 
 	if (mixer == NULL)
 		return -EIO;
+	mutex_lock(&mixer->reg_mutex);
 	for (chn = 0; chn < 31; chn++) {
 		pslot = &mixer->slots[chn];
 		if (pslot->put_volume && pslot->stereo)
 			result |= 1 << chn;
 	}
+	mutex_unlock(&mixer->reg_mutex);
 	return result;
 }
 
@@ -161,6 +165,7 @@ static int snd_mixer_oss_recmask(struct snd_mixer_oss_file *fmixer)
 
 	if (mixer == NULL)
 		return -EIO;
+	mutex_lock(&mixer->reg_mutex);
 	if (mixer->put_recsrc && mixer->get_recsrc) {	/* exclusive */
 		result = mixer->mask_recsrc;
 	} else {
@@ -172,6 +177,7 @@ static int snd_mixer_oss_recmask(struct snd_mixer_oss_file *fmixer)
 				result |= 1 << chn;
 		}
 	}
+	mutex_unlock(&mixer->reg_mutex);
 	return result;
 }
 
@@ -182,12 +188,12 @@ static int snd_mixer_oss_get_recsrc(struct snd_mixer_oss_file *fmixer)
 
 	if (mixer == NULL)
 		return -EIO;
+	mutex_lock(&mixer->reg_mutex);
 	if (mixer->put_recsrc && mixer->get_recsrc) {	/* exclusive */
-		int err;
 		unsigned int index;
-		err = mixer->get_recsrc(fmixer, &index);
-		if (err < 0)
-			return err;
+		result = mixer->get_recsrc(fmixer, &index);
+		if (result < 0)
+			goto unlock;
 		result = 1 << index;
 	} else {
 		struct snd_mixer_oss_slot *pslot;
@@ -202,7 +208,10 @@ static int snd_mixer_oss_get_recsrc(struct snd_mixer_oss_file *fmixer)
 			}
 		}
 	}
-	return mixer->oss_recsrc = result;
+	mixer->oss_recsrc = result;
+ unlock:
+	mutex_unlock(&mixer->reg_mutex);
+	return result;
 }
 
 static int snd_mixer_oss_set_recsrc(struct snd_mixer_oss_file *fmixer, int recsrc)
@@ -215,6 +224,7 @@ static int snd_mixer_oss_set_recsrc(struct snd_mixer_oss_file *fmixer, int recsr
 
 	if (mixer == NULL)
 		return -EIO;
+	mutex_lock(&mixer->reg_mutex);
 	if (mixer->get_recsrc && mixer->put_recsrc) {	/* exclusive input */
 		if (recsrc & ~mixer->oss_recsrc)
 			recsrc &= ~mixer->oss_recsrc;
@@ -240,6 +250,7 @@ static int snd_mixer_oss_set_recsrc(struct snd_mixer_oss_file *fmixer, int recsr
 			}
 		}
 	}
+	mutex_unlock(&mixer->reg_mutex);
 	return result;
 }
 
@@ -251,6 +262,7 @@ static int snd_mixer_oss_get_volume(struct snd_mixer_oss_file *fmixer, int slot)
 
 	if (mixer == NULL || slot > 30)
 		return -EIO;
+	mutex_lock(&mixer->reg_mutex);
 	pslot = &mixer->slots[slot];
 	left = pslot->volume[0];
 	right = pslot->volume[1];
@@ -258,15 +270,21 @@ static int snd_mixer_oss_get_volume(struct snd_mixer_oss_file *fmixer, int slot)
 		result = pslot->get_volume(fmixer, pslot, &left, &right);
 	if (!pslot->stereo)
 		right = left;
-	if (snd_BUG_ON(left < 0 || left > 100))
-		return -EIO;
-	if (snd_BUG_ON(right < 0 || right > 100))
-		return -EIO;
+	if (snd_BUG_ON(left < 0 || left > 100)) {
+		result = -EIO;
+		goto unlock;
+	}
+	if (snd_BUG_ON(right < 0 || right > 100)) {
+		result = -EIO;
+		goto unlock;
+	}
 	if (result >= 0) {
 		pslot->volume[0] = left;
 		pslot->volume[1] = right;
 	 	result = (left & 0xff) | ((right & 0xff) << 8);
 	}
+ unlock:
+	mutex_unlock(&mixer->reg_mutex);
 	return result;
 }
 
@@ -279,6 +297,7 @@ static int snd_mixer_oss_set_volume(struct snd_mixer_oss_file *fmixer,
 
 	if (mixer == NULL || slot > 30)
 		return -EIO;
+	mutex_lock(&mixer->reg_mutex);
 	pslot = &mixer->slots[slot];
 	if (left > 100)
 		left = 100;
@@ -289,10 +308,13 @@ static int snd_mixer_oss_set_volume(struct snd_mixer_oss_file *fmixer,
 	if (pslot->put_volume)
 		result = pslot->put_volume(fmixer, pslot, left, right);
 	if (result < 0)
-		return result;
+		goto unlock;
 	pslot->volume[0] = left;
 	pslot->volume[1] = right;
- 	return (left & 0xff) | ((right & 0xff) << 8);
+	result = (left & 0xff) | ((right & 0xff) << 8);
+ unlock:
+	mutex_lock(&mixer->reg_mutex);
+	return result;
 }
 
 static int snd_mixer_oss_ioctl1(struct snd_mixer_oss_file *fmixer, unsigned int cmd, unsigned long arg)
-- 
2.26.2


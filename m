Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F0C446129
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 10:11:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F00B6167E;
	Fri,  5 Nov 2021 10:10:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F00B6167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636103462;
	bh=NbXIBcA0PrsF09nPKuWypSn6TAp5SIWBtp11wbDZj0Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QCatgHQVdwOvwh1sgee708XMYYIZHnCVzWEHCbQWvJk5dfADmj8HBx7gU7bfYSqUT
	 FRsJf2CdO2QBp4squlFz8zQk0bJERRvtMgixBisvlRJK3rXoYQmqjW+2Wid9+XZE7f
	 vKg1QrD82cy676W9CknSefO3v6Ruv7zFynqHUNb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E841F80279;
	Fri,  5 Nov 2021 10:09:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0094BF8026A; Fri,  5 Nov 2021 10:09:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 186EEF8012A
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 10:09:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 186EEF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="v+AGb4fX"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="fKLh6e1q"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 7BACB1FD33;
 Fri,  5 Nov 2021 09:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636103368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wsWye7y7ty5nGqHLowQFB4rbh966FHgY6Lu+UExpBuA=;
 b=v+AGb4fXLHcb8xuwGNmXTsBC+quycj5vkwQ+fUEc4kATg5VXcAtBXFAEJS0Ob5fkbCWB0M
 hGwisZKZtnoVIwek0I9bm8FfK/d6AcPjLMQMApULcAGFxayEtPrfqKROC2ikwIWMOg5euZ
 XBmawUVTysAUxdXozDlKtNKtjuGMGJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636103368;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wsWye7y7ty5nGqHLowQFB4rbh966FHgY6Lu+UExpBuA=;
 b=fKLh6e1qh29ytDFoJ+p/6T5Ea8EVQemMhozygHoWut57dtHeMNzip/SYqD+YdpYyy/vzQv
 7Bf80sZ25O7+5iDQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 6B4A22C150;
 Fri,  5 Nov 2021 09:09:28 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: DAPM: Cover regression by kctl change notification fix
Date: Fri,  5 Nov 2021 10:09:25 +0100
Message-Id: <20211105090925.20575-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Yu-Hsuan Hsu <yuhsuan@chromium.org>
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

The recent fix for DAPM to correct the kctl change notification by the
commit 5af82c81b2c4 ("ASoC: DAPM: Fix missing kctl change
notifications") caused other regressions since it changed the behavior
of snd_soc_dapm_set_pin() that is called from several API functions.
Formerly it returned always 0 for success, but now it returns 0 or 1.

This patch addresses it, restoring the old behavior of
snd_soc_dapm_set_pin() while keeping the fix in
snd_soc_dapm_put_pin_switch().

Fixes: 5af82c81b2c4 ("ASoC: DAPM: Fix missing kctl change notifications")
Reported-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/soc-dapm.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 2892b0aba151..b06c5682445c 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2559,8 +2559,13 @@ static struct snd_soc_dapm_widget *dapm_find_widget(
 	return NULL;
 }
 
-static int snd_soc_dapm_set_pin(struct snd_soc_dapm_context *dapm,
-				const char *pin, int status)
+/*
+ * set the DAPM pin status:
+ * returns 1 when the value has been updated, 0 when unchanged, or a negative
+ * error code; called from kcontrol put callback
+ */
+static int __snd_soc_dapm_set_pin(struct snd_soc_dapm_context *dapm,
+				  const char *pin, int status)
 {
 	struct snd_soc_dapm_widget *w = dapm_find_widget(dapm, pin, true);
 	int ret = 0;
@@ -2586,6 +2591,18 @@ static int snd_soc_dapm_set_pin(struct snd_soc_dapm_context *dapm,
 	return ret;
 }
 
+/*
+ * similar as __snd_soc_dapm_set_pin(), but returns 0 when successful;
+ * called from several API functions below
+ */
+static int snd_soc_dapm_set_pin(struct snd_soc_dapm_context *dapm,
+				const char *pin, int status)
+{
+	int ret = __snd_soc_dapm_set_pin(dapm, pin, status);
+
+	return ret < 0 ? ret : 0;
+}
+
 /**
  * snd_soc_dapm_sync_unlocked - scan and power dapm paths
  * @dapm: DAPM context
@@ -3589,10 +3606,10 @@ int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
 	const char *pin = (const char *)kcontrol->private_value;
 	int ret;
 
-	if (ucontrol->value.integer.value[0])
-		ret = snd_soc_dapm_enable_pin(&card->dapm, pin);
-	else
-		ret = snd_soc_dapm_disable_pin(&card->dapm, pin);
+	mutex_lock_nested(&card->dapm_mutex, SND_SOC_DAPM_CLASS_RUNTIME);
+	ret = __snd_soc_dapm_set_pin(&card->dapm, pin,
+				     !!ucontrol->value.integer.value[0]);
+	mutex_unlock(&card->dapm_mutex);
 
 	snd_soc_dapm_sync(&card->dapm);
 	return ret;
-- 
2.31.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA0F2C01D0
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:00:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B945168B;
	Mon, 23 Nov 2020 09:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B945168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122019;
	bh=SEw26tcJl3GDpzbhoqaskF332gJiDSdG+ONa4OVoWV8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QGnT0hd6tQxjUTOE+AaukvPHy1gBnkQYTBmSGbS6JxboYnNGImwqS/lBCrIPpb2S5
	 sfCRyr42qjSoODnNywE8cmi0X4kKhujDz8G9+WcWGZBgF+4NUWt2KIy4et8o7nMom4
	 K8sukH4/NrdX4BZA4gxvreuyDcmu0A1vcd4qvH/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3625F804E6;
	Mon, 23 Nov 2020 09:54:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AB19F80528; Mon, 23 Nov 2020 09:54:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49A15F804C1
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49A15F804C1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7CDB6AF9C;
 Mon, 23 Nov 2020 08:53:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/41] ALSA: usb-audio: Simplify hw_params rules
Date: Mon, 23 Nov 2020 09:53:17 +0100
Message-Id: <20201123085347.19667-12-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201123085347.19667-1-tiwai@suse.de>
References: <20201123085347.19667-1-tiwai@suse.de>
Cc: Matwey Kornilov <matwey.kornilov@gmail.com>,
 Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

Several hw_params functions narrows the interval via min/max rule in
the very similar way, so factor out those into a helper function and
use commonly.

No functional changes, just minor code refactoring.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 110 ++++++++++++++++++++------------------------------------
 1 file changed, 38 insertions(+), 72 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 6d1f5277cd90..ecc6bf9b42f0 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1121,6 +1121,36 @@ static int hw_check_valid_format(struct snd_usb_substream *subs,
 	return 1;
 }
 
+static int apply_hw_params_minmax(struct snd_interval *it, unsigned int rmin,
+				  unsigned int rmax)
+{
+	int changed;
+
+	if (rmin > rmax) {
+		hwc_debug("  --> get empty\n");
+		it->empty = 1;
+		return -EINVAL;
+	}
+
+	changed = 0;
+	if (it->min < rmin) {
+		it->min = rmin;
+		it->openmin = 0;
+		changed = 1;
+	}
+	if (it->max > rmax) {
+		it->max = rmax;
+		it->openmax = 0;
+		changed = 1;
+	}
+	if (snd_interval_checkempty(it)) {
+		it->empty = 1;
+		return -EINVAL;
+	}
+	hwc_debug("  --> (%d, %d) (changed = %d)\n", it->min, it->max, changed);
+	return changed;
+}
+
 static int hw_rule_rate(struct snd_pcm_hw_params *params,
 			struct snd_pcm_hw_rule *rule)
 {
@@ -1128,7 +1158,6 @@ static int hw_rule_rate(struct snd_pcm_hw_params *params,
 	struct audioformat *fp;
 	struct snd_interval *it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 	unsigned int rmin, rmax, r;
-	int changed;
 	int i;
 
 	hwc_debug("hw_rule_rate: (%d,%d)\n", it->min, it->max);
@@ -1151,29 +1180,7 @@ static int hw_rule_rate(struct snd_pcm_hw_params *params,
 		}
 	}
 
-	if (rmin > rmax) {
-		hwc_debug("  --> get empty\n");
-		it->empty = 1;
-		return -EINVAL;
-	}
-
-	changed = 0;
-	if (it->min < rmin) {
-		it->min = rmin;
-		it->openmin = 0;
-		changed = 1;
-	}
-	if (it->max > rmax) {
-		it->max = rmax;
-		it->openmax = 0;
-		changed = 1;
-	}
-	if (snd_interval_checkempty(it)) {
-		it->empty = 1;
-		return -EINVAL;
-	}
-	hwc_debug("  --> (%d, %d) (changed = %d)\n", it->min, it->max, changed);
-	return changed;
+	return apply_hw_params_minmax(it, rmin, rmax);
 }
 
 
@@ -1184,48 +1191,18 @@ static int hw_rule_channels(struct snd_pcm_hw_params *params,
 	struct audioformat *fp;
 	struct snd_interval *it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
 	unsigned int rmin, rmax;
-	int changed;
 
 	hwc_debug("hw_rule_channels: (%d,%d)\n", it->min, it->max);
-	changed = 0;
-	rmin = rmax = 0;
+	rmin = UINT_MAX;
+	rmax = 0;
 	list_for_each_entry(fp, &subs->fmt_list, list) {
 		if (!hw_check_valid_format(subs, params, fp))
 			continue;
-		if (changed++) {
-			if (rmin > fp->channels)
-				rmin = fp->channels;
-			if (rmax < fp->channels)
-				rmax = fp->channels;
-		} else {
-			rmin = fp->channels;
-			rmax = fp->channels;
-		}
+		rmin = min(rmin, fp->channels);
+		rmax = max(rmax, fp->channels);
 	}
 
-	if (!changed) {
-		hwc_debug("  --> get empty\n");
-		it->empty = 1;
-		return -EINVAL;
-	}
-
-	changed = 0;
-	if (it->min < rmin) {
-		it->min = rmin;
-		it->openmin = 0;
-		changed = 1;
-	}
-	if (it->max > rmax) {
-		it->max = rmax;
-		it->openmax = 0;
-		changed = 1;
-	}
-	if (snd_interval_checkempty(it)) {
-		it->empty = 1;
-		return -EINVAL;
-	}
-	hwc_debug("  --> (%d, %d) (changed = %d)\n", it->min, it->max, changed);
-	return changed;
+	return apply_hw_params_minmax(it, rmin, rmax);
 }
 
 static int hw_rule_format(struct snd_pcm_hw_params *params,
@@ -1267,7 +1244,6 @@ static int hw_rule_period_time(struct snd_pcm_hw_params *params,
 	struct snd_interval *it;
 	unsigned char min_datainterval;
 	unsigned int pmin;
-	int changed;
 
 	it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_PERIOD_TIME);
 	hwc_debug("hw_rule_period_time: (%u,%u)\n", it->min, it->max);
@@ -1283,18 +1259,8 @@ static int hw_rule_period_time(struct snd_pcm_hw_params *params,
 		return -EINVAL;
 	}
 	pmin = 125 * (1 << min_datainterval);
-	changed = 0;
-	if (it->min < pmin) {
-		it->min = pmin;
-		it->openmin = 0;
-		changed = 1;
-	}
-	if (snd_interval_checkempty(it)) {
-		it->empty = 1;
-		return -EINVAL;
-	}
-	hwc_debug("  --> (%u,%u) (changed = %d)\n", it->min, it->max, changed);
-	return changed;
+
+	return apply_hw_params_minmax(it, pmin, UINT_MAX);
 }
 
 /* apply PCM hw constraints from the concurrent sync EP */
-- 
2.16.4


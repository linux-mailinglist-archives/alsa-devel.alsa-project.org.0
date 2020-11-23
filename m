Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 116462C0207
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:09:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A68A516E2;
	Mon, 23 Nov 2020 10:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A68A516E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122542;
	bh=8sCfA94mkjOS7BBakfGh/h1rueuRz+DxkxwxuCt1iBE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PAdnior6u8q6VywMmsLmYRZhBi+3Fk56domDaZa2Q9ZO191ZG4hziOiRIOTA1bbnH
	 UTgFvhJLXu8YTcNziHqU/frCc7qzHx/xzKOjNXyGEa99wj9lK+DjSC1sfWDAFZ5ljQ
	 vOum+VftgsOAwjT46hnICoUoq+CGzTNvZbZ3391E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0900CF80606;
	Mon, 23 Nov 2020 09:55:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 357D8F8055C; Mon, 23 Nov 2020 09:54:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8FE6F804F1
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8FE6F804F1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6B79AFDB;
 Mon, 23 Nov 2020 08:53:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 32/41] ALSA: usb-audio: Simplify rate_min/max and rates set up
Date: Mon, 23 Nov 2020 09:53:38 +0100
Message-Id: <20201123085347.19667-33-tiwai@suse.de>
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

There are multiple places in format.c performing the similar code for
setting the rate_min, rate_max and rates fields.  This patch unifies
those in a helper function and calls it at the end of the parser phase
so that all rate_table entries have been already determined.

No functional changes, just a minor code refactoring.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/format.c | 53 ++++++++++++++++++++++++-----------------------------
 1 file changed, 24 insertions(+), 29 deletions(-)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index 7641716f0c6c..93459ba228d3 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -164,6 +164,23 @@ static int set_fixed_rate(struct audioformat *fp, int rate, int rate_bits)
 	return 0;
 }
 
+/* set up rate_min, rate_max and rates from the rate table */
+static void set_rate_table_min_max(struct audioformat *fp)
+{
+	unsigned int rate;
+	int i;
+
+	fp->rate_min = INT_MAX;
+	fp->rate_max = 0;
+	fp->rates = 0;
+	for (i = 0; i < fp->nr_rates; i++) {
+		rate = fp->rate_table[i];
+		fp->rate_min = min(fp->rate_min, rate);
+		fp->rate_max = max(fp->rate_max, rate);
+		fp->rates |= snd_pcm_rate_to_rate_bit(rate);
+	}
+}
+
 /*
  * parse the format descriptor and stores the possible sample rates
  * on the audioformat table (audio class v1).
@@ -198,7 +215,6 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
 			return -ENOMEM;
 
 		fp->nr_rates = 0;
-		fp->rate_min = fp->rate_max = 0;
 		for (r = 0, idx = offset + 1; r < nr_rates; r++, idx += 3) {
 			unsigned int rate = combine_triple(&fmt[idx]);
 			if (!rate)
@@ -217,13 +233,7 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
 			     chip->usb_id == USB_ID(0x041e, 0x4068)))
 				rate = 8000;
 
-			fp->rate_table[fp->nr_rates] = rate;
-			if (!fp->rate_min || rate < fp->rate_min)
-				fp->rate_min = rate;
-			if (!fp->rate_max || rate > fp->rate_max)
-				fp->rate_max = rate;
-			fp->rates |= snd_pcm_rate_to_rate_bit(rate);
-			fp->nr_rates++;
+			fp->rate_table[fp->nr_rates++] = rate;
 		}
 		if (!fp->nr_rates) {
 			usb_audio_info(chip,
@@ -231,6 +241,7 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
 				       fp->iface, fp->altsetting);
 			return -EINVAL;
 		}
+		set_rate_table_min_max(fp);
 	} else {
 		/* continuous rates */
 		fp->rates = SNDRV_PCM_RATE_CONTINUOUS;
@@ -336,8 +347,6 @@ static int parse_uac2_sample_rate_range(struct snd_usb_audio *chip,
 {
 	int i, nr_rates = 0;
 
-	fp->rates = fp->rate_min = fp->rate_max = 0;
-
 	for (i = 0; i < nr_triplets; i++) {
 		int min = combine_quad(&data[2 + 12 * i]);
 		int max = combine_quad(&data[6 + 12 * i]);
@@ -373,12 +382,6 @@ static int parse_uac2_sample_rate_range(struct snd_usb_audio *chip,
 
 			if (fp->rate_table)
 				fp->rate_table[nr_rates] = rate;
-			if (!fp->rate_min || rate < fp->rate_min)
-				fp->rate_min = rate;
-			if (!fp->rate_max || rate > fp->rate_max)
-				fp->rate_max = rate;
-			fp->rates |= snd_pcm_rate_to_rate_bit(rate);
-
 			nr_rates++;
 			if (nr_rates >= MAX_NR_RATES) {
 				usb_audio_err(chip, "invalid uac2 rates\n");
@@ -459,9 +462,6 @@ static int validate_sample_rate_table_v2v3(struct snd_usb_audio *chip,
 	struct usb_device *dev = chip->dev;
 	unsigned int *table;
 	unsigned int nr_rates;
-	unsigned int rate_min = 0x7fffffff;
-	unsigned int rate_max = 0;
-	unsigned int rates = 0;
 	int i, err;
 
 	table = kcalloc(fp->nr_rates, sizeof(*table), GFP_KERNEL);
@@ -478,14 +478,8 @@ static int validate_sample_rate_table_v2v3(struct snd_usb_audio *chip,
 		if (err < 0)
 			continue;
 
-		if (check_valid_altsetting_v2v3(chip, fp->iface, fp->altsetting)) {
+		if (check_valid_altsetting_v2v3(chip, fp->iface, fp->altsetting))
 			table[nr_rates++] = fp->rate_table[i];
-			if (rate_min > fp->rate_table[i])
-				rate_min = fp->rate_table[i];
-			if (rate_max < fp->rate_table[i])
-				rate_max = fp->rate_table[i];
-			rates |= snd_pcm_rate_to_rate_bit(fp->rate_table[i]);
-		}
 	}
 
 	if (!nr_rates) {
@@ -503,9 +497,6 @@ static int validate_sample_rate_table_v2v3(struct snd_usb_audio *chip,
 	kfree(fp->rate_table);
 	fp->rate_table = table;
 	fp->nr_rates = nr_rates;
-	fp->rate_min = rate_min;
-	fp->rate_max = rate_max;
-	fp->rates = rates;
 	return 0;
 }
 
@@ -602,6 +593,10 @@ static int parse_audio_format_rates_v2v3(struct snd_usb_audio *chip,
 	parse_uac2_sample_rate_range(chip, fp, nr_triplets, data);
 
 	ret = validate_sample_rate_table_v2v3(chip, fp, clock);
+	if (ret < 0)
+		goto err_free;
+
+	set_rate_table_min_max(fp);
 
 err_free:
 	kfree(data);
-- 
2.16.4


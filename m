Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 978C62C01C9
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 09:58:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A5EC1683;
	Mon, 23 Nov 2020 09:57:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A5EC1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606121886;
	bh=Ei9PJR33WmTGRPoT9agN5vomPEHjcazjnlMJl/TIQqY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g89tVPBwdnLu/j057eBr6ra6RtADlYQn76qxPensIJ/XoZiKiTPYgd+bcO2l4RS7+
	 vDQTPc9dyQ19d2qn2QQLrzPGxgSq/AvzJaycS33f4gUD5VxfQotAuKV+wsAZVDlXdz
	 vrZvTpbhcfTRz8zLYhDnbECadPMTL4WjzwkZ6d7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7A2AF804BC;
	Mon, 23 Nov 2020 09:54:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2B3AF8051C; Mon, 23 Nov 2020 09:54:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EE52F80113
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:53:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EE52F80113
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D7255AF72;
 Mon, 23 Nov 2020 08:53:56 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/41] ALSA: usb-audio: Handle discrete rates properly in hw
 constraints
Date: Mon, 23 Nov 2020 09:53:07 +0100
Message-Id: <20201123085347.19667-2-tiwai@suse.de>
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

In the current code, when the device provides the discrete sample rate
tables with unusual sample rates, the driver tries to gather the whole
values from the audioformat entries and create a hw-constraint rule to
restrict with this single rate list.  This is rather inefficient and
may overlook the rates that are associated only with the certain
audioformat entries.

This patch improves the hw constraint setup by rewriting the existing
hw_rule_rate().  The discrete sample rates (identified by rate_table
and nr_rates of format entry) are checked in the existing
hw_rule_rate() instead of extra rules; in the case of discrete rates,
the function compares with each rate table entry and calculates the
min/max values from there.  For the contiguous rates, the behavior
doesn't change.

Along with it, snd_usb_pcm_check_knot() and snb_usb_substream
rate_list field become superfluous, thus those are dropped.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h   |  1 -
 sound/usb/pcm.c    | 73 +++++++++++-------------------------------------------
 sound/usb/stream.c |  1 -
 3 files changed, 15 insertions(+), 60 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 5351d7183b1b..3cc668f98f43 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -157,7 +157,6 @@ struct snd_usb_substream {
 	u64 formats;			/* format bitmasks (all or'ed) */
 	unsigned int num_formats;		/* number of supported audio formats (list) */
 	struct list_head fmt_list;	/* format list */
-	struct snd_pcm_hw_constraint_list rate_list;	/* limited rates */
 	spinlock_t lock;
 
 	int last_frame_number;          /* stored frame number */
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index a860303cc522..3265155df1b5 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1039,27 +1039,31 @@ static int hw_rule_rate(struct snd_pcm_hw_params *params,
 	struct snd_usb_substream *subs = rule->private;
 	struct audioformat *fp;
 	struct snd_interval *it = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
-	unsigned int rmin, rmax;
+	unsigned int rmin, rmax, r;
 	int changed;
+	int i;
 
 	hwc_debug("hw_rule_rate: (%d,%d)\n", it->min, it->max);
-	changed = 0;
-	rmin = rmax = 0;
+	rmin = UINT_MAX;
+	rmax = 0;
 	list_for_each_entry(fp, &subs->fmt_list, list) {
 		if (!hw_check_valid_format(subs, params, fp))
 			continue;
-		if (changed++) {
-			if (rmin > fp->rate_min)
-				rmin = fp->rate_min;
-			if (rmax < fp->rate_max)
-				rmax = fp->rate_max;
+		if (fp->rate_table && fp->nr_rates) {
+			for (i = 0; i < fp->nr_rates; i++) {
+				r = fp->rate_table[i];
+				if (!snd_interval_test(it, r))
+					continue;
+				rmin = min(rmin, r);
+				rmax = max(rmax, r);
+			}
 		} else {
-			rmin = fp->rate_min;
-			rmax = fp->rate_max;
+			rmin = min(rmin, fp->rate_min);
+			rmax = max(rmax, fp->rate_max);
 		}
 	}
 
-	if (!changed) {
+	if (rmin > rmax) {
 		hwc_debug("  --> get empty\n");
 		it->empty = 1;
 		return -EINVAL;
@@ -1205,50 +1209,6 @@ static int hw_rule_period_time(struct snd_pcm_hw_params *params,
 	return changed;
 }
 
-/*
- *  If the device supports unusual bit rates, does the request meet these?
- */
-static int snd_usb_pcm_check_knot(struct snd_pcm_runtime *runtime,
-				  struct snd_usb_substream *subs)
-{
-	struct audioformat *fp;
-	int *rate_list;
-	int count = 0, needs_knot = 0;
-	int err;
-
-	kfree(subs->rate_list.list);
-	subs->rate_list.list = NULL;
-
-	list_for_each_entry(fp, &subs->fmt_list, list) {
-		if (fp->rates & SNDRV_PCM_RATE_CONTINUOUS)
-			return 0;
-		count += fp->nr_rates;
-		if (fp->rates & SNDRV_PCM_RATE_KNOT)
-			needs_knot = 1;
-	}
-	if (!needs_knot)
-		return 0;
-
-	subs->rate_list.list = rate_list =
-		kmalloc_array(count, sizeof(int), GFP_KERNEL);
-	if (!subs->rate_list.list)
-		return -ENOMEM;
-	subs->rate_list.count = count;
-	subs->rate_list.mask = 0;
-	count = 0;
-	list_for_each_entry(fp, &subs->fmt_list, list) {
-		int i;
-		for (i = 0; i < fp->nr_rates; i++)
-			rate_list[count++] = fp->rate_table[i];
-	}
-	err = snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
-					 &subs->rate_list);
-	if (err < 0)
-		return err;
-
-	return 0;
-}
-
 
 /*
  * set up the runtime hardware information.
@@ -1338,9 +1298,6 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 		if (err < 0)
 			return err;
 	}
-	err = snd_usb_pcm_check_knot(runtime, subs);
-	if (err < 0)
-		return err;
 
 	return snd_usb_autoresume(subs->stream->chip);
 }
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index ca76ba5b5c0b..f17913e0b5b4 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -47,7 +47,6 @@ static void free_substream(struct snd_usb_substream *subs)
 		return; /* not initialized */
 	list_for_each_entry_safe(fp, n, &subs->fmt_list, list)
 		audioformat_free(fp);
-	kfree(subs->rate_list.list);
 	kfree(subs->str_pd);
 	snd_media_stream_delete(subs);
 }
-- 
2.16.4


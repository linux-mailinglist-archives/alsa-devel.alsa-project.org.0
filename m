Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0846F2C01E4
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 10:03:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A245D169A;
	Mon, 23 Nov 2020 10:02:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A245D169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606122181;
	bh=ujR70FJzM8byzUAFZnnbiGs+hY9QYMa1+Uyf8UjlN/E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NdXT31SlwetpiqsCsqBcQi3H1K+IC9j2dhrlU3qFtdnAzir2etjz0NTnmM/gfZ9ZW
	 DfLE3RBme63ylmkCSWU8/Sj0GgusyXBjJBH1Nf1cpfZ14MBOKPlauyMzXYLmsBXsKs
	 I0fsFhdXtgJ3EXbbG4Cdx+yYS8sfijNz27ET1g5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91F6AF80570;
	Mon, 23 Nov 2020 09:54:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65ABEF80529; Mon, 23 Nov 2020 09:54:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 725FFF804D2
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:54:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 725FFF804D2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 46117AE30;
 Mon, 23 Nov 2020 08:53:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 24/41] ALSA: usb-audio: Fix EP matching for continuous rates
Date: Mon, 23 Nov 2020 09:53:30 +0100
Message-Id: <20201123085347.19667-25-tiwai@suse.de>
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

The function to evaluate the match of the parameters with an EP
assumes only the discrete rate tables and doesn't handle the
continuous rates properly.

This patch fixes match_endpoint_audioformats() to handle the
continuous rates.  Also the almost useless debug prints there are
dropped.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 37 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index ac6385a4eb70..45a692512d27 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -695,41 +695,30 @@ static int match_endpoint_audioformats(struct snd_usb_substream *subs,
 				       struct audioformat *match, int rate,
 				       snd_pcm_format_t pcm_format)
 {
-	int i;
-	int score = 0;
+	int i, score;
 
-	if (fp->channels < 1) {
-		dev_dbg(&subs->dev->dev,
-			"%s: (fmt @%p) no channels\n", __func__, fp);
+	if (fp->channels < 1)
 		return 0;
-	}
 
-	if (!(fp->formats & pcm_format_to_bits(pcm_format))) {
-		dev_dbg(&subs->dev->dev,
-			"%s: (fmt @%p) no match for format %d\n", __func__,
-			fp, pcm_format);
+	if (!(fp->formats & pcm_format_to_bits(pcm_format)))
 		return 0;
-	}
 
-	for (i = 0; i < fp->nr_rates; i++) {
-		if (fp->rate_table[i] == rate) {
-			score++;
-			break;
+	if (fp->rates & SNDRV_PCM_RATE_CONTINUOUS) {
+		if (rate < fp->rate_min || rate > fp->rate_max)
+			return 0;
+	} else {
+		for (i = 0; i < fp->nr_rates; i++) {
+			if (fp->rate_table[i] == rate)
+				break;
 		}
-	}
-	if (!score) {
-		dev_dbg(&subs->dev->dev,
-			"%s: (fmt @%p) no match for rate %d\n", __func__,
-			fp, rate);
-		return 0;
+		if (i >= fp->nr_rates)
+			return 0;
 	}
 
+	score = 1;
 	if (fp->channels == match->channels)
 		score++;
 
-	dev_dbg(&subs->dev->dev,
-		"%s: (fmt @%p) score %d\n", __func__, fp, score);
-
 	return score;
 }
 
-- 
2.16.4


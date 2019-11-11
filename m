Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C063F72DB
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 12:13:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15D7A167C;
	Mon, 11 Nov 2019 12:13:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15D7A167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573470832;
	bh=uq1qC5PvNIq7saKCbyjF8Wkl3q+cUzcmbb29zOgAEfQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XYMFfgKvwaPsnRV/ROALuyT6aQV933x0DkSizewp6XbtVGRj0uYTzeS5vG7q5zGkn
	 JR7O+KRtDsHg74DrMXYEyHeKhqdNynXAWc01F9osoCS+6j2oMLcdfSV/a62yAU2Dic
	 qAa0HBrSkJxwx0tO1omKapr/6G7MBXv6tnC0LfLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDB1CF80637;
	Mon, 11 Nov 2019 12:09:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E24AF80610; Mon, 11 Nov 2019 12:09:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from esa3.mentor.iphmx.com (esa3.mentor.iphmx.com [68.232.137.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D7A4F805FB
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 12:09:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D7A4F805FB
IronPort-SDR: r1aGAvGQE/tH+Pcd5Y44rHItfwPizhct/j/OekRCjBdNUTigkGF9zpNQdE86hptjyyr5l7wmI0
 /e81ZFGyWT7jM+M1gFBlw6/mNrTc5/UqVxrN+x5jzxFTzJ1f4wyjT0arS3cclQDcgRbVuDHXN9
 8t2ipDFeVsjBxhMSBRvC9p3h0SXOHZ6GZV8z2HipHiTjHiuTgWiqOGG1lIgfGhUZWHos/vo0z8
 OmRcqbFY7Pqr/JjsgezqWpxcKADVKtqQfB8uVHOnUIZWiMUz0jZI35y1WyU0lDcD2kxtCA6oQk
 Apk=
X-IronPort-AV: E=Sophos;i="5.68,292,1569312000"; d="scan'208";a="43051117"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 11 Nov 2019 03:09:37 -0800
IronPort-SDR: i+TPsAImEE5GlGWViRIeQPLFaDwwF7MsQ1DLCo7Nb+szL+5GjTtIjsFc4ddON7yfahRuLTFMh1
 bufTFF15HH68e+F9e8AI4yGWl2Q6u7+OfuyN5xyjZ6OEUEE7qmwb6yIZ6GKevrVtpL473EzYNf
 MvkVhMBKjxLrUMmi4WmTsPJp+KTn6QVcWBYWHqSwnwpjTfA+4NXFBZ7QYd9pKS4hfbNtsDnvr/
 wjZ5DlHomSeKaPPVtBUyDjMI21HfKLl8dtlx6LZ6/F487vBrouI6kQGZXSowX0AFwAiQSmoeHc
 lUE=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Timo Wischer
 <twischer@de.adit-jv.com>, Andrew Gabbasov <andrew_gabbasov@mentor.com>
Date: Mon, 11 Nov 2019 05:08:43 -0600
Message-ID: <20191111110846.18223-5-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191111110846.18223-4-andrew_gabbasov@mentor.com>
References: <20191111110846.18223-1-andrew_gabbasov@mentor.com>
 <20191111110846.18223-2-andrew_gabbasov@mentor.com>
 <20191111110846.18223-3-andrew_gabbasov@mentor.com>
 <20191111110846.18223-4-andrew_gabbasov@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Subject: [alsa-devel] [PATCH v3 4/7] ALSA: aloop: Rename all jiffies timer
	specific functions
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Timo Wischer <twischer@de.adit-jv.com>

This commit does not change the behaviour. It only separates the jiffies
timer specific implementation from the generic part.

Signed-off-by: Timo Wischer <twischer@de.adit-jv.com>
Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
---
 sound/drivers/aloop.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 92134e9c6ea7..178f7260a650 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -188,7 +188,7 @@ static inline unsigned int get_rate_shift(struct loopback_pcm *dpcm)
 }
 
 /* call in cable->lock */
-static int loopback_timer_start(struct loopback_pcm *dpcm)
+static int loopback_jiffies_timer_start(struct loopback_pcm *dpcm)
 {
 	unsigned long tick;
 	unsigned int rate_shift = get_rate_shift(dpcm);
@@ -209,7 +209,7 @@ static int loopback_timer_start(struct loopback_pcm *dpcm)
 }
 
 /* call in cable->lock */
-static inline int loopback_timer_stop(struct loopback_pcm *dpcm)
+static inline int loopback_jiffies_timer_stop(struct loopback_pcm *dpcm)
 {
 	del_timer(&dpcm->timer);
 	dpcm->timer.expires = 0;
@@ -217,7 +217,7 @@ static inline int loopback_timer_stop(struct loopback_pcm *dpcm)
 	return 0;
 }
 
-static inline int loopback_timer_stop_sync(struct loopback_pcm *dpcm)
+static inline int loopback_jiffies_timer_stop_sync(struct loopback_pcm *dpcm)
 {
 	del_timer_sync(&dpcm->timer);
 
@@ -502,7 +502,8 @@ static inline void bytepos_finish(struct loopback_pcm *dpcm,
 }
 
 /* call in cable->lock */
-static unsigned int loopback_pos_update(struct loopback_cable *cable)
+static unsigned int loopback_jiffies_timer_pos_update
+		(struct loopback_cable *cable)
 {
 	struct loopback_pcm *dpcm_play =
 			cable->streams[SNDRV_PCM_STREAM_PLAYBACK];
@@ -555,14 +556,15 @@ static unsigned int loopback_pos_update(struct loopback_cable *cable)
 	return running;
 }
 
-static void loopback_timer_function(struct timer_list *t)
+static void loopback_jiffies_timer_function(struct timer_list *t)
 {
 	struct loopback_pcm *dpcm = from_timer(dpcm, t, timer);
 	unsigned long flags;
 
 	spin_lock_irqsave(&dpcm->cable->lock, flags);
-	if (loopback_pos_update(dpcm->cable) & (1 << dpcm->substream->stream)) {
-		loopback_timer_start(dpcm);
+	if (loopback_jiffies_timer_pos_update(dpcm->cable) &
+			(1 << dpcm->substream->stream)) {
+		loopback_jiffies_timer_start(dpcm);
 		if (dpcm->period_update_pending) {
 			dpcm->period_update_pending = 0;
 			spin_unlock_irqrestore(&dpcm->cable->lock, flags);
@@ -732,18 +734,18 @@ static void free_cable(struct snd_pcm_substream *substream)
 
 static int loopback_jiffies_timer_open(struct loopback_pcm *dpcm)
 {
-	timer_setup(&dpcm->timer, loopback_timer_function, 0);
+	timer_setup(&dpcm->timer, loopback_jiffies_timer_function, 0);
 
 	return 0;
 }
 
 static struct loopback_ops loopback_jiffies_timer_ops = {
 	.open = loopback_jiffies_timer_open,
-	.start = loopback_timer_start,
-	.stop = loopback_timer_stop,
-	.stop_sync = loopback_timer_stop_sync,
-	.close_substream = loopback_timer_stop_sync,
-	.pos_update = loopback_pos_update,
+	.start = loopback_jiffies_timer_start,
+	.stop = loopback_jiffies_timer_stop,
+	.stop_sync = loopback_jiffies_timer_stop_sync,
+	.close_substream = loopback_jiffies_timer_stop_sync,
+	.pos_update = loopback_jiffies_timer_pos_update,
 	.dpcm_info = loopback_jiffies_timer_dpcm_info,
 };
 
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

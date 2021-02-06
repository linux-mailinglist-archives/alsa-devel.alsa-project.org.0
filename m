Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF4F311FED
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Feb 2021 21:33:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EA1115E0;
	Sat,  6 Feb 2021 21:32:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EA1115E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612643579;
	bh=r3FCG85BpSmXiWFdR6hJk3n8pX5drRMVg1/2IRXfq80=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IJYPLDQCPs2DWWF2EAqy27bks0PVlTcMXKo/V9nQ4bkB0JWqlAKg2EYBMX2VCIclG
	 cC9PBbpVbmjj79zYIiH78V1i+qEkc8z8AoR/KrzDh1yIH0/3dFpsAg//fl9lut2tx0
	 lN+NaRtU51KtN523YJuJHpwGvF/HdYUttzjW8og0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBB24F801F7;
	Sat,  6 Feb 2021 21:31:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B743DF80254; Sat,  6 Feb 2021 21:31:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F33CF80171
 for <alsa-devel@alsa-project.org>; Sat,  6 Feb 2021 21:30:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F33CF80171
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DC90CAFF9
 for <alsa-devel@alsa-project.org>; Sat,  6 Feb 2021 20:30:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ALSA: usb-audio: Don't avoid stopping the stream at
 disconnection
Date: Sat,  6 Feb 2021 21:30:52 +0100
Message-Id: <20210206203052.15606-4-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210206203052.15606-1-tiwai@suse.de>
References: <20210206203052.15606-1-tiwai@suse.de>
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

In the later patch, we're going to issue the PCM sync_stop calls at
disconnection.  But currently the USB-audio driver can't handle it
because it has a check of shutdown flag for stopping the URBs.  This
is basically superfluous (the stopping URBs are safe at disconnection
state), so let's drop the check.

Fixes: dc5eafe7787c ("ALSA: usb-audio: Support PCM sync_stop")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 3 ---
 sound/usb/pcm.c      | 5 +----
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 4390075b2c6f..102d53515a76 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -890,9 +890,6 @@ static int stop_urbs(struct snd_usb_endpoint *ep, bool force)
 {
 	unsigned int i;
 
-	if (!force && atomic_read(&ep->chip->shutdown)) /* to be sure... */
-		return -EBADFD;
-
 	if (!force && atomic_read(&ep->running))
 		return -EBUSY;
 
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index dcadf8f164b2..bf5a0f3c1fad 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -270,10 +270,7 @@ static int snd_usb_pcm_sync_stop(struct snd_pcm_substream *substream)
 {
 	struct snd_usb_substream *subs = substream->runtime->private_data;
 
-	if (!snd_usb_lock_shutdown(subs->stream->chip)) {
-		sync_pending_stops(subs);
-		snd_usb_unlock_shutdown(subs->stream->chip);
-	}
+	sync_pending_stops(subs);
 	return 0;
 }
 
-- 
2.26.2


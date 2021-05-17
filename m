Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDF0382D3C
	for <lists+alsa-devel@lfdr.de>; Mon, 17 May 2021 15:19:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B0E31682;
	Mon, 17 May 2021 15:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B0E31682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621257557;
	bh=/Lt30tMDAtti7svpLDmEEZ6MmUF9Be/xqBVelOcKPLI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LTMlGXqXmW5Wa64tsXgpHGwB8qLJJc3mxU1OV3M/IJJmJCAQBvaZoeKXBZFZzCz2x
	 uhGNvOyMZd/TlE9LoEuMuT42KrQMhHkz8BtVELKl9FW/yX2CtYwvX0TsCUuuru4pch
	 CwPqCW7GGNfBWmaZthWD2br6J48n9ufysatQvT1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A305F804D9;
	Mon, 17 May 2021 15:16:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CBB0F804DA; Mon, 17 May 2021 15:16:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E32B2F80424
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 15:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E32B2F80424
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9CA56B1FC
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 13:15:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/11] ALSA: usxy2: Fix potential doubly allocations
Date: Mon, 17 May 2021 15:15:41 +0200
Message-Id: <20210517131545.27252-8-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210517131545.27252-1-tiwai@suse.de>
References: <20210517131545.27252-1-tiwai@suse.de>
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

The PCM shmem pages are allocated in snd_usx2y_usbpcm_prepare().
Theoretically the prepare callback may be called simultaneously for
both playback and capture, hence this allocation can be racy.

Make sure that the allocation is performed exclusively by extending
the pcm_mutex lock to cover the allocation code, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/usx2y/usx2yhwdeppcm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/usb/usx2y/usx2yhwdeppcm.c b/sound/usb/usx2y/usx2yhwdeppcm.c
index b988a4870de4..da643c2dbb12 100644
--- a/sound/usb/usx2y/usx2yhwdeppcm.c
+++ b/sound/usb/usx2y/usx2yhwdeppcm.c
@@ -503,15 +503,18 @@ static int snd_usx2y_usbpcm_prepare(struct snd_pcm_substream *substream)
 
 	snd_printdd("snd_usx2y_pcm_prepare(%p)\n", substream);
 
+	mutex_lock(&usx2y->pcm_mutex);
+
 	if (!usx2y->hwdep_pcm_shm) {
 		usx2y->hwdep_pcm_shm = alloc_pages_exact(USX2Y_HWDEP_PCM_PAGES,
 							 GFP_KERNEL);
-		if (!usx2y->hwdep_pcm_shm)
-			return -ENOMEM;
+		if (!usx2y->hwdep_pcm_shm) {
+			err = -ENOMEM;
+			goto up_prepare_mutex;
+		}
 		memset(usx2y->hwdep_pcm_shm, 0, USX2Y_HWDEP_PCM_PAGES);
 	}
 
-	mutex_lock(&usx2y->pcm_mutex);
 	usx2y_subs_prepare(subs);
 	// Start hardware streams
 	// SyncStream first....
-- 
2.26.2


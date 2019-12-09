Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D92116B5D
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:47:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 035DA16AD;
	Mon,  9 Dec 2019 11:46:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 035DA16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575888455;
	bh=X4q+90bD991tcUODxP3nu/4VPA5SpgUXx7ZWN96X8Jc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RduJ9PJtOFvgwqN/WRBaK0L16Zt3aThuGXP6Qt8a3+IwvaSR9/3vpb+FJFawZWZRK
	 HPoUAsRFAawX9c4OeEFq4YK/yyB/SzvKQFhxxvhOX7Ir+7/K3mC2Ut2oxoD9XA62BQ
	 OC2gVnI7ZIfvpkuH65SPUkWdjFlfuc1gvFCTwcus=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CAEFF8070B;
	Mon,  9 Dec 2019 10:53:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21401F802FB; Mon,  9 Dec 2019 10:51:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DFA0F80245
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DFA0F80245
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 90CFDB287
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:14 +0100
Message-Id: <20191209094943.14984-43-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 42/71] ALSA: ice1724: Use managed buffer
	allocation
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Clean up the driver with the new managed buffer allocation API.
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ice1712/ice1724.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index c80a16ee6e76..ba992ce47282 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -704,7 +704,7 @@ static int snd_vt1724_pcm_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_ice1712 *ice = snd_pcm_substream_chip(substream);
-	int i, chs, err;
+	int i, chs;
 
 	chs = params_channels(hw_params);
 	mutex_lock(&ice->open_mutex);
@@ -740,11 +740,7 @@ static int snd_vt1724_pcm_hw_params(struct snd_pcm_substream *substream,
 	}
 	mutex_unlock(&ice->open_mutex);
 
-	err = snd_vt1724_set_pro_rate(ice, params_rate(hw_params), 0);
-	if (err < 0)
-		return err;
-
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
+	return snd_vt1724_set_pro_rate(ice, params_rate(hw_params), 0);
 }
 
 static int snd_vt1724_pcm_hw_free(struct snd_pcm_substream *substream)
@@ -758,7 +754,7 @@ static int snd_vt1724_pcm_hw_free(struct snd_pcm_substream *substream)
 		if (ice->pcm_reserved[i] == substream)
 			ice->pcm_reserved[i] = NULL;
 	mutex_unlock(&ice->open_mutex);
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static int snd_vt1724_playback_pro_prepare(struct snd_pcm_substream *substream)
@@ -1142,9 +1138,8 @@ static int snd_vt1724_pcm_profi(struct snd_ice1712 *ice, int device)
 	pcm->info_flags = 0;
 	strcpy(pcm->name, "ICE1724");
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &ice->pci->dev,
-					      256*1024, 256*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &ice->pci->dev, 256*1024, 256*1024);
 
 	ice->pcm_pro = pcm;
 
@@ -1340,9 +1335,8 @@ static int snd_vt1724_pcm_spdif(struct snd_ice1712 *ice, int device)
 	pcm->info_flags = 0;
 	strcpy(pcm->name, name);
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &ice->pci->dev,
-					      256*1024, 256*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &ice->pci->dev, 256*1024, 256*1024);
 
 	ice->pcm = pcm;
 
@@ -1454,9 +1448,8 @@ static int snd_vt1724_pcm_indep(struct snd_ice1712 *ice, int device)
 	pcm->info_flags = 0;
 	strcpy(pcm->name, "ICE1724 Surround PCM");
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &ice->pci->dev,
-					      256*1024, 256*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &ice->pci->dev, 256*1024, 256*1024);
 
 	ice->pcm_ds = pcm;
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

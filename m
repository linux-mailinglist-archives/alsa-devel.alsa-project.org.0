Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D92F0140
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 16:25:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41B0916DD;
	Tue,  5 Nov 2019 16:24:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41B0916DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572967501;
	bh=AsEcg5UkTUpcGNrguk+3uXkjMKOmoDsgLE5FOO5C/aU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OZZpSQMw4o4G8M6zlG23j5uX+2i+TALPLmpFx/34WqU2AxbJdn6+ZPdjmJvYhqQRO
	 b3O1E/kygvepgCbEwKmpoO1qERkLrZfy/a8BmljJIGlLoFPW33xew7WHrm0D4vO52K
	 eedJvZ9lVZYHsHjFdiZ1RxpacMIVVVcM8v56/Ns4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12B6DF80673;
	Tue,  5 Nov 2019 16:19:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50B86F805DF; Tue,  5 Nov 2019 16:19:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17CAAF80535
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 16:18:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17CAAF80535
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F3926B26D
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:18:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 16:18:35 +0100
Message-Id: <20191105151856.10785-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191105151856.10785-1-tiwai@suse.de>
References: <20191105151856.10785-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 03/24] ALSA: rme32: Remove superfluous
	snd_dma_continuous_data()
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

The recent change (commit b8a7d422280c: "ALSA: memalloc: Allow NULL
device for SNDRV_DMA_TYPE_CONTINOUS type") made the PCM preallocation
helper accepting NULL as the device pointer for the default usage.
Drop the snd_dma_continuous_data() usage that became superfluous from
the callers.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 40cc6ca88f7b..58a4b8df25d4 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -1375,7 +1375,7 @@ static int snd_rme32_create(struct rme32 *rme32)
 		snd_pcm_set_ops(rme32->spdif_pcm, SNDRV_PCM_STREAM_CAPTURE,
 				&snd_rme32_capture_spdif_fd_ops);
 		snd_pcm_lib_preallocate_pages_for_all(rme32->spdif_pcm, SNDRV_DMA_TYPE_CONTINUOUS,
-						      snd_dma_continuous_data(GFP_KERNEL),
+						      NULL,
 						      0, RME32_MID_BUFFER_SIZE);
 		rme32->spdif_pcm->info_flags = SNDRV_PCM_INFO_JOINT_DUPLEX;
 	} else {
@@ -1407,7 +1407,7 @@ static int snd_rme32_create(struct rme32 *rme32)
 			snd_pcm_set_ops(rme32->adat_pcm, SNDRV_PCM_STREAM_CAPTURE, 
 					&snd_rme32_capture_adat_fd_ops);
 			snd_pcm_lib_preallocate_pages_for_all(rme32->adat_pcm, SNDRV_DMA_TYPE_CONTINUOUS,
-							      snd_dma_continuous_data(GFP_KERNEL),
+							      NULL,
 							      0, RME32_MID_BUFFER_SIZE);
 			rme32->adat_pcm->info_flags = SNDRV_PCM_INFO_JOINT_DUPLEX;
 		} else {
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

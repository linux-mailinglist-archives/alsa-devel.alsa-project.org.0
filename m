Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 584D723A8CC
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 16:48:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5DFE1664;
	Mon,  3 Aug 2020 16:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5DFE1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596466103;
	bh=vrUL6SNJm9bMwyWsTxm9pHDMyyuF5mgM0bMnxH5O1lg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tZpAghKpXZ1amp++g0BTn5v1Onzkf4gTeet55tOG73SKpHtH40yApN6QmMXcwX+tr
	 n116Gm9jmRfET//RWcdjsD3GYj5IdlGGn5y8yAeHVn2ZbJIwdjivVJE9v+1wBlLvak
	 wnjmeVvmheDD9iM/LcJhVhUyavn/vuQ3gcCGWNIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0640DF80234;
	Mon,  3 Aug 2020 16:46:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC7BEF80218; Mon,  3 Aug 2020 16:46:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07CE4F80148
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 16:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07CE4F80148
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 09BCEAC24;
 Mon,  3 Aug 2020 14:46:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: fsl: Fix unused variable warning
Date: Mon,  3 Aug 2020 16:46:30 +0200
Message-Id: <20200803144630.9615-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

The variable rtd was left unused in psc_dma_free(), even unnoticed
during conversion to a new style:
  sound/soc/fsl/mpc5200_dma.c:342:30: warning: unused variable 'rtd' [-Wunused-variable]

Drop the superfluous one.

Fixes: 6d1048bc1152 ("ASoC: fsl: mpc5200_dma: remove snd_pcm_ops")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/fsl/mpc5200_dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index 9e4f66b6b92b..231984882176 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -339,7 +339,6 @@ static int psc_dma_new(struct snd_soc_component *component,
 static void psc_dma_free(struct snd_soc_component *component,
 			 struct snd_pcm *pcm)
 {
-	struct snd_soc_pcm_runtime *rtd = pcm->private_data;
 	struct snd_pcm_substream *substream;
 	int stream;
 
-- 
2.16.4


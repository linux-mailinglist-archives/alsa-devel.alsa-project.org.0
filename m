Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B307E4DA04A
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 17:43:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AA7618AD;
	Tue, 15 Mar 2022 17:42:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AA7618AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647362601;
	bh=BhjBxa1RY93uccIDv2vdn2yo4d6dOtHZrQArETHbR/o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z+181vNlZmYpyI3CHfHA1qOgDd0QmRj/kX8UC5bM0F1qwO6cmpVefvtrNHjKYiIpA
	 ktlTBojiyLlI/C8wC38tOmk1QSiYtmKhEMjL7vqBEx9VG2aWOr3VTQ0mHFu1aK6pn4
	 Ows48akY1coxfxEC23EinE56rHti9BCxgyej9/Hg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95ED2F80128;
	Tue, 15 Mar 2022 17:42:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7112F80162; Tue, 15 Mar 2022 17:42:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5A97F80128
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 17:42:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5A97F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="i+J3nmlO"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="PUf3rUpi"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 508C421901;
 Tue, 15 Mar 2022 16:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647362524; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MM5mPoVqASCFHOFLTZ7SmzXUIWb36HIyTM9iSz/Del0=;
 b=i+J3nmlObW4yAUMujL83cy5u4ou4mbcGvX2U29EcIZVf/rDKgRX4iYSWFcqAk1cSAMta+7
 hj3IVcG5DyCVg1Nw+iYQSWFDamClJPcuTs4ex4igUDzx7Ytc8QSP3QY9btYb1PG2ytJdte
 wzjfd8SUvF2cYcT/OYop6PjcmHukRSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647362524;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MM5mPoVqASCFHOFLTZ7SmzXUIWb36HIyTM9iSz/Del0=;
 b=PUf3rUpiQSLEHTyjcccwC9Mv0QLzbAlLtLqrhLVKcdCjYB9AlmPbWdKD+5As/LzMNkH87X
 QCDyhWe4oBVKotAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 1644FA3B83;
 Tue, 15 Mar 2022 16:42:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: sti: Fix deadlock via snd_pcm_stop_xrun() call
Date: Tue, 15 Mar 2022 17:41:58 +0100
Message-Id: <20220315164158.19804-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Daniel Palmer <daniel@0x0f.com>, alsa-devel@alsa-project.org
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

This is essentially a revert of the commit dc865fb9e7c2 ("ASoC: sti:
Use snd_pcm_stop_xrun() helper"), which converted the manual
snd_pcm_stop() calls with snd_pcm_stop_xrun().

The commit above introduced a deadlock as snd_pcm_stop_xrun() itself
takes the PCM stream lock while the caller already holds it.  Since
the conversion was done only for consistency reason and the open-call
with snd_pcm_stop() to the XRUN state is a correct usage, let's revert
the commit back as the fix.

Fixes: dc865fb9e7c2 ("ASoC: sti: Use snd_pcm_stop_xrun() helper")
Reported-by: Daniel Palmer <daniel@0x0f.com>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/20220315091319.3351522-1-daniel@0x0f.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sti/uniperif_player.c | 6 +++---
 sound/soc/sti/uniperif_reader.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sti/uniperif_player.c b/sound/soc/sti/uniperif_player.c
index 2ed92c990b97..dd9013c47664 100644
--- a/sound/soc/sti/uniperif_player.c
+++ b/sound/soc/sti/uniperif_player.c
@@ -91,7 +91,7 @@ static irqreturn_t uni_player_irq_handler(int irq, void *dev_id)
 			SET_UNIPERIF_ITM_BCLR_FIFO_ERROR(player);
 
 			/* Stop the player */
-			snd_pcm_stop_xrun(player->substream);
+			snd_pcm_stop(player->substream, SNDRV_PCM_STATE_XRUN);
 		}
 
 		ret = IRQ_HANDLED;
@@ -105,7 +105,7 @@ static irqreturn_t uni_player_irq_handler(int irq, void *dev_id)
 		SET_UNIPERIF_ITM_BCLR_DMA_ERROR(player);
 
 		/* Stop the player */
-		snd_pcm_stop_xrun(player->substream);
+		snd_pcm_stop(player->substream, SNDRV_PCM_STATE_XRUN);
 
 		ret = IRQ_HANDLED;
 	}
@@ -138,7 +138,7 @@ static irqreturn_t uni_player_irq_handler(int irq, void *dev_id)
 		dev_err(player->dev, "Underflow recovery failed\n");
 
 		/* Stop the player */
-		snd_pcm_stop_xrun(player->substream);
+		snd_pcm_stop(player->substream, SNDRV_PCM_STATE_XRUN);
 
 		ret = IRQ_HANDLED;
 	}
diff --git a/sound/soc/sti/uniperif_reader.c b/sound/soc/sti/uniperif_reader.c
index 136059331211..065c5f0d1f5f 100644
--- a/sound/soc/sti/uniperif_reader.c
+++ b/sound/soc/sti/uniperif_reader.c
@@ -65,7 +65,7 @@ static irqreturn_t uni_reader_irq_handler(int irq, void *dev_id)
 	if (unlikely(status & UNIPERIF_ITS_FIFO_ERROR_MASK(reader))) {
 		dev_err(reader->dev, "FIFO error detected\n");
 
-		snd_pcm_stop_xrun(reader->substream);
+		snd_pcm_stop(reader->substream, SNDRV_PCM_STATE_XRUN);
 
 		ret = IRQ_HANDLED;
 	}
-- 
2.31.1


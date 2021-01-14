Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B67492F6213
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 14:35:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A64216C7;
	Thu, 14 Jan 2021 14:34:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A64216C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610631337;
	bh=MZty/B8WUsUsCev3XO3VPTVSeJL9zwl94+CqdI7YJy4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pqSxGzXNalKuR3UjQ1e0vFcwP4yFrhaakujjXc2JlWUycPe2O89hZG1W0GByRGGKV
	 vKI+rsJxkN5hvOCn1ffSiNmeLAFq9jPyYRdeJjETeihp1jw7MvmMd8yEDGw371OCWo
	 3Y41MY8QK6Hyyb+m56d1IBvz6YVEQ8zZbtJZN8EQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A13F4F804AA;
	Thu, 14 Jan 2021 14:33:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05B83F80249; Thu, 14 Jan 2021 14:33:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92892F80249
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 14:33:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92892F80249
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D2245ADCD;
 Thu, 14 Jan 2021 13:33:40 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: intel: skl: Simplify with
 dma_set_mask_and_coherent()
Date: Thu, 14 Jan 2021 14:33:35 +0100
Message-Id: <20210114133337.1039-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114133337.1039-1-tiwai@suse.de>
References: <20210114133337.1039-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

ASoC Intel Skylake driver still has explicit calls of dma_set_mask()
and dma_set_coherent_mask().

Let's simplify with dma_set_mask_and_coherent().

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/skylake/skl.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 8b993722f74e..5b1a15e39912 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -950,12 +950,8 @@ static int skl_first_init(struct hdac_bus *bus)
 	bus->num_streams = cp_streams + pb_streams;
 
 	/* allow 64bit DMA address if supported by H/W */
-	if (!dma_set_mask(bus->dev, DMA_BIT_MASK(64))) {
-		dma_set_coherent_mask(bus->dev, DMA_BIT_MASK(64));
-	} else {
-		dma_set_mask(bus->dev, DMA_BIT_MASK(32));
-		dma_set_coherent_mask(bus->dev, DMA_BIT_MASK(32));
-	}
+	if (dma_set_mask_and_coherent(bus->dev, DMA_BIT_MASK(64)))
+		dma_set_mask_and_coherent(bus->dev, DMA_BIT_MASK(32));
 
 	/* initialize streams */
 	snd_hdac_ext_stream_init_all
-- 
2.26.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCA44C8AE6
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 12:36:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4F9B1736;
	Tue,  1 Mar 2022 12:35:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4F9B1736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646134565;
	bh=8XbFCygKNS+RK/YK6HysO0vG+sdiqy+Hj94EE2b/1+0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pwNmYaPpVejZpETtGdVTIkSJU4/KmvnMooYQSNmtt7gfVihTHwhVT1WvZYp5Ld7VS
	 IHRwtRpU2uAN9DML0tGov9nweJ6mNekP4HY+rAw/pIyg9e4/4jKwmToR/h11mFoHVb
	 P5DsDV/CLpyg7/ddgMCT4ZayCNiDR1+lgthQt9ac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 322AAF802D2;
	Tue,  1 Mar 2022 12:34:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D25C1F80227; Tue,  1 Mar 2022 12:34:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE30CF80054
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 12:34:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE30CF80054
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nP0mG-0003rK-1S; Tue, 01 Mar 2022 12:34:48 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nP0mF-004PzO-18; Tue, 01 Mar 2022 12:34:47 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: soc-generic-dmaengine-pcm: set period_bytes_min based
 on maxburst
Date: Tue,  1 Mar 2022 12:34:46 +0100
Message-Id: <20220301113446.1053171-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, kernel@pengutronix.de
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

In dmaengine_pcm_set_runtime_hwparams() period_bytes_min is hardcoded to
256. For some applications that may be too big. This patch changes that
to calculate the value based on dma_data->maxburst. The correct value
would be maxburst multiplied by the address width of the hardware FIFO.
Unfortunately the address width is dynamically calculated based on the
stream parameters and is not known at open time, so the worst case
is chosen here which is 8 bytes, the maximum that is supported by
dmaengine drivers.
Not all drivers may set a maxburst value, so we fall back to the
previously used hardcoded value of 256 bytes.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 99253de29a74e..734d46b9783f7 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -122,7 +122,9 @@ dmaengine_pcm_set_runtime_hwparams(struct snd_soc_component *component,
 			SNDRV_PCM_INFO_INTERLEAVED;
 	hw.periods_min = 2;
 	hw.periods_max = UINT_MAX;
-	hw.period_bytes_min = 256;
+	hw.period_bytes_min = dma_data->maxburst * DMA_SLAVE_BUSWIDTH_8_BYTES;
+	if (!hw.period_bytes_min)
+		hw.period_bytes_min = 256;
 	hw.period_bytes_max = dma_get_max_seg_size(dma_dev);
 	hw.buffer_bytes_max = SIZE_MAX;
 	hw.fifo_size = dma_data->fifo_size;
-- 
2.30.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 967FD596F44
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 15:12:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F9C2163B;
	Wed, 17 Aug 2022 15:11:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F9C2163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660741968;
	bh=WeXg1qGK5oHjX2LzaydOvVCoa4HLF6ZfQTJlOzwHso0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zpd3ECYIb7xRS5yV2CijQXbbXp3U35z6sgB38mQ5r6hns0EvqIZVoPCltMfvWcYiL
	 f+4R4vh/IlIsJceD3xljRW5rKUj+xUd+m0sNH0rhunpfwq/bmPLlmL/itqTzDkpUn6
	 Saane+hMyFVcPDzytG+gm42IlJPlRN7CAA61kUps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ADFDF80544;
	Wed, 17 Aug 2022 15:11:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A62BEF80544; Wed, 17 Aug 2022 15:11:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0D86F800DA
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 15:11:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0D86F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bJ/xHCQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660741876; x=1692277876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WeXg1qGK5oHjX2LzaydOvVCoa4HLF6ZfQTJlOzwHso0=;
 b=bJ/xHCQMABeCk+wM5DEo5JL018HFqtIAoSvwPzLuYPa22Zayy36eCC4a
 dVccBe9JHz4jfNdk8m4+U+jQxYsNFb44s7DATI/VY4CsButCsUg7EsyGv
 1s8M5oCUrDaUe7fZP++M2lkT0WTHNBDXeyBsYmiw90FSckmMNXGvAg8np
 tINJHUr7yfvJ9xB290WJJRXnbtATMBe/8lh4TgSNEt456hKbqWNpFoqMg
 Oi+334xokuVsx5sCqLaNx25nLDbPeJNcznBkKlnxIIezNyirmK+oUUfbV
 XZEvJGaKHVu5H0usl9D1cqW3KtjLu7hs5+WtC3QkOz4WwtRDx++jueEM7 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="318496076"
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="318496076"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2022 06:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,243,1654585200"; d="scan'208";a="667609957"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2022 06:11:11 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ALSA: hda: Rework snd_hdac_stream_reset() to use macros
Date: Wed, 17 Aug 2022 15:11:35 +0200
Message-Id: <20220817131137.3978523-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817131137.3978523-1-amadeuszx.slawinski@linux.intel.com>
References: <20220817131137.3978523-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

We can use existing macros to poll and update register values instead of
open coding the functionality.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/hda/hdac_stream.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index f3582012d22f..ce6a2f270445 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -10,6 +10,7 @@
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/hdaudio.h>
+#include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
 #include "trace.h"
 
@@ -165,7 +166,6 @@ EXPORT_SYMBOL_GPL(snd_hdac_stop_streams_and_chip);
 void snd_hdac_stream_reset(struct hdac_stream *azx_dev)
 {
 	unsigned char val;
-	int timeout;
 	int dma_run_state;
 
 	snd_hdac_stream_clear(azx_dev);
@@ -173,30 +173,17 @@ void snd_hdac_stream_reset(struct hdac_stream *azx_dev)
 	dma_run_state = snd_hdac_stream_readb(azx_dev, SD_CTL) & SD_CTL_DMA_START;
 
 	snd_hdac_stream_updateb(azx_dev, SD_CTL, 0, SD_CTL_STREAM_RESET);
-	udelay(3);
-	timeout = 300;
-	do {
-		val = snd_hdac_stream_readb(azx_dev, SD_CTL) &
-			SD_CTL_STREAM_RESET;
-		if (val)
-			break;
-	} while (--timeout);
+
+	/* wait for hardware to report that the stream entered reset */
+	snd_hdac_stream_readb_poll(azx_dev, SD_CTL, val, (val & SD_CTL_STREAM_RESET), 3, 300);
 
 	if (azx_dev->bus->dma_stop_delay && dma_run_state)
 		udelay(azx_dev->bus->dma_stop_delay);
 
-	val &= ~SD_CTL_STREAM_RESET;
-	snd_hdac_stream_writeb(azx_dev, SD_CTL, val);
-	udelay(3);
+	snd_hdac_stream_updateb(azx_dev, SD_CTL, SD_CTL_STREAM_RESET, 0);
 
-	timeout = 300;
-	/* waiting for hardware to report that the stream is out of reset */
-	do {
-		val = snd_hdac_stream_readb(azx_dev, SD_CTL) &
-			SD_CTL_STREAM_RESET;
-		if (!val)
-			break;
-	} while (--timeout);
+	/* wait for hardware to report that the stream is out of reset */
+	snd_hdac_stream_readb_poll(azx_dev, SD_CTL, val, !(val & SD_CTL_STREAM_RESET), 3, 300);
 
 	/* reset first position - may not be synced with hw at this time */
 	if (azx_dev->posbuf)
-- 
2.25.1


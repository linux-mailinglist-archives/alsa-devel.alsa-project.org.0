Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B371359858E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 16:16:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56D4C1682;
	Thu, 18 Aug 2022 16:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56D4C1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660832196;
	bh=VI8XKvt0Ie6fJjujDnEOi8fu3pB8Ak2zVjbkujdfSnY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGLswoBIcUvW1B7i9sHjfIXWybmzj2X2AYnF0AAq6oaUTPrV6u35XHNRYWVoNguuH
	 l+/XI7wZK6xwrVvf+y7NtfOqVYWRAnjCqhYEC+b3vCQ0xqwLunGLbmWNvpzkfM/71f
	 GLnmmVAG8TYSgal7NrAH5xbJ7OMs8T1Inz0V6xWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 419EFF804CF;
	Thu, 18 Aug 2022 16:15:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57EF0F804DF; Thu, 18 Aug 2022 16:15:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1900F804B1
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 16:15:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1900F804B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hfVOZ3XH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660832111; x=1692368111;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VI8XKvt0Ie6fJjujDnEOi8fu3pB8Ak2zVjbkujdfSnY=;
 b=hfVOZ3XHiMGzQyLqy4DRC6hf6R5LzVz1kQkaeQjAqkd9z27kI+H2tW25
 EB6T/cbNazn5LhWDxl8kNXJYokJYA9N4M8gAjm1MYAhXFdN0GQW75yTL6
 8+stGoh5F8jnwBjh2nMBQ0p42R+WFQPLoQoJlKc/XdwGB2/qng7ydgKyi
 klAjfPPdpSux5ExzAg5kr1ihk8g9YksJYodwW2cP4OjJzjwZUbSXZ7PIj
 nxx3XvB9M0G2XW+EQ2m6sYxzWyJW9cHKvPl9hJlumwqk/7Uu7mqbEvual
 jYO8ltGwEZgOv9Vce/vGWcRQgI0ewWEmkqkfriM10oUXY6tvIVWl23bDw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="292764752"
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="292764752"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 07:14:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="584222242"
Received: from dev2.igk.intel.com ([10.237.148.94])
 by orsmga006.jf.intel.com with ESMTP; 18 Aug 2022 07:14:45 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 2/4] ALSA: hda: Rework snd_hdac_stream_reset() to use macros
Date: Thu, 18 Aug 2022 16:15:15 +0200
Message-Id: <20220818141517.109280-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818141517.109280-1-amadeuszx.slawinski@linux.intel.com>
References: <20220818141517.109280-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/hda/hdac_stream.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index f3582012d22f..bdf6d4db6769 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -165,7 +165,6 @@ EXPORT_SYMBOL_GPL(snd_hdac_stop_streams_and_chip);
 void snd_hdac_stream_reset(struct hdac_stream *azx_dev)
 {
 	unsigned char val;
-	int timeout;
 	int dma_run_state;
 
 	snd_hdac_stream_clear(azx_dev);
@@ -173,30 +172,17 @@ void snd_hdac_stream_reset(struct hdac_stream *azx_dev)
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


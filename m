Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE6A63F64B
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:41:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7261017E5;
	Thu,  1 Dec 2022 18:40:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7261017E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669916476;
	bh=z2EqIUY1/1kdVKDk3fI7WiZ2Uag2uFC5xsoh8eHvzGA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ku29fYU4iG7iOmhVw0dJEppK8K4KPapVVOM2ccRVyS3xLS6Ss/FEwNnI+gnkChFQ1
	 XJFwKV9ZsH+aJEAMElT9AyGgaR/ek2rAyBQ7/+wgM6wiV5cWwLU0RXLcTL2yJd2Sye
	 XhzhspIIEfK8oaLtOijh6UoJRMa0WbUYhMu0uFFc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 933CAF80567;
	Thu,  1 Dec 2022 18:39:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A94AF8055B; Thu,  1 Dec 2022 18:39:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 948AFF8028D
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:39:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 948AFF8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="S23eFfz6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669916364; x=1701452364;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z2EqIUY1/1kdVKDk3fI7WiZ2Uag2uFC5xsoh8eHvzGA=;
 b=S23eFfz6dapjF+ldYyxmT0uRuI49lzhbc57wCLc5wxLO6jt+H7gnUkEN
 X6ui9tvvAEvB0mns+keBwSkAuCmxCOlYrjBmE7D649KZQ95nom6imkyjf
 XN5swwx7oQU2+yKGcNdK4I6x6tlgol5nYDMcqc/2qZQa02sM/S3/SumyB
 3OzVGXuNinoZvYlNnqLxdrLKAhyICp1S35GGxqRYjneT7+ORdmSbFXLt/
 aT2LipeFltux3CxWu9ckYtf+dXGW0xnrb6t5vXp8o2bicVIKYJ2QCkrjK
 V5BsDCLc2mPnW5R7SsyPY0rII5JTZ+6Un1zqirMua49a+WBQlCpxEV3wM A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="377908307"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="377908307"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 09:39:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="889823908"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="889823908"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2022 09:39:18 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 02/16] ALSA: hda: Prepare for compress stream support
Date: Thu,  1 Dec 2022 18:56:05 +0100
Message-Id: <20221201175619.504758-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221201175619.504758-1-cezary.rojewski@intel.com>
References: <20221201175619.504758-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Before introducing compress specific changes, adjust BDL and parameters
setup functions so these are not tightly coupled with PCM streams.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/hda/hdac_stream.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 3b250ee7f6a7..8a12c6347914 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -487,11 +487,15 @@ int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
 {
 	struct hdac_bus *bus = azx_dev->bus;
 	struct snd_pcm_substream *substream = azx_dev->substream;
-	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_pcm_runtime *runtime;
+	struct snd_dma_buffer *dmab;
 	__le32 *bdl;
 	int i, ofs, periods, period_bytes;
 	int pos_adj, pos_align;
 
+	runtime = substream->runtime;
+	dmab = snd_pcm_get_dma_buf(substream);
+
 	/* reset BDL address */
 	snd_hdac_stream_writel(azx_dev, SD_BDLPL, 0);
 	snd_hdac_stream_writel(azx_dev, SD_BDLPU, 0);
@@ -505,7 +509,7 @@ int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
 	azx_dev->frags = 0;
 
 	pos_adj = bus->bdl_pos_adj;
-	if (!azx_dev->no_period_wakeup && pos_adj > 0) {
+	if (runtime && !azx_dev->no_period_wakeup && pos_adj > 0) {
 		pos_align = pos_adj;
 		pos_adj = DIV_ROUND_UP(pos_adj * runtime->rate, 48000);
 		if (!pos_adj)
@@ -518,8 +522,7 @@ int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
 				 pos_adj);
 			pos_adj = 0;
 		} else {
-			ofs = setup_bdle(bus, snd_pcm_get_dma_buf(substream),
-					 azx_dev,
+			ofs = setup_bdle(bus, dmab, azx_dev,
 					 &bdl, ofs, pos_adj, true);
 			if (ofs < 0)
 				goto error;
@@ -529,13 +532,11 @@ int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
 
 	for (i = 0; i < periods; i++) {
 		if (i == periods - 1 && pos_adj)
-			ofs = setup_bdle(bus, snd_pcm_get_dma_buf(substream),
-					 azx_dev, &bdl, ofs,
-					 period_bytes - pos_adj, 0);
+			ofs = setup_bdle(bus, dmab, azx_dev,
+					 &bdl, ofs, period_bytes - pos_adj, 0);
 		else
-			ofs = setup_bdle(bus, snd_pcm_get_dma_buf(substream),
-					 azx_dev, &bdl, ofs,
-					 period_bytes,
+			ofs = setup_bdle(bus, dmab, azx_dev,
+					 &bdl, ofs, period_bytes,
 					 !azx_dev->no_period_wakeup);
 		if (ofs < 0)
 			goto error;
@@ -560,26 +561,25 @@ EXPORT_SYMBOL_GPL(snd_hdac_stream_setup_periods);
 int snd_hdac_stream_set_params(struct hdac_stream *azx_dev,
 				 unsigned int format_val)
 {
-
-	unsigned int bufsize, period_bytes;
 	struct snd_pcm_substream *substream = azx_dev->substream;
-	struct snd_pcm_runtime *runtime;
+	unsigned int bufsize, period_bytes;
+	unsigned int no_period_wakeup;
 	int err;
 
 	if (!substream)
 		return -EINVAL;
-	runtime = substream->runtime;
 	bufsize = snd_pcm_lib_buffer_bytes(substream);
 	period_bytes = snd_pcm_lib_period_bytes(substream);
+	no_period_wakeup = substream->runtime->no_period_wakeup;
 
 	if (bufsize != azx_dev->bufsize ||
 	    period_bytes != azx_dev->period_bytes ||
 	    format_val != azx_dev->format_val ||
-	    runtime->no_period_wakeup != azx_dev->no_period_wakeup) {
+	    no_period_wakeup != azx_dev->no_period_wakeup) {
 		azx_dev->bufsize = bufsize;
 		azx_dev->period_bytes = period_bytes;
 		azx_dev->format_val = format_val;
-		azx_dev->no_period_wakeup = runtime->no_period_wakeup;
+		azx_dev->no_period_wakeup = no_period_wakeup;
 		err = snd_hdac_stream_setup_periods(azx_dev);
 		if (err < 0)
 			return err;
-- 
2.25.1


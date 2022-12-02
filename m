Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D6864090A
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 16:13:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AD8B17F8;
	Fri,  2 Dec 2022 16:12:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AD8B17F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669994005;
	bh=VYNR0ebvlQKoVTes0oq7P7WroDIiyugJKRClLbElgz8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NwU0EGp/wQ6MyYeWBUbijJh75Lx9JNkvvPzjJ6MJdwhg9V1tK6f2yWS17u7V8E5VD
	 YrSpVGWzHMNish2byb2zlfw8+nN/efQmf12k4egWk6NfvQpyQi7GrKgfyvmWT+sbkl
	 0Qw+iVWXTPrh8G2+tyPriN3DjSpJ5bWHIO+Od1v4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53DB9F80563;
	Fri,  2 Dec 2022 16:11:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B022CF80272; Fri,  2 Dec 2022 16:11:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33442F80272
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 16:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33442F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mOsa8jn9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669993900; x=1701529900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VYNR0ebvlQKoVTes0oq7P7WroDIiyugJKRClLbElgz8=;
 b=mOsa8jn991IpCIVrFSG8Nx4UYAqy0MvkxE1L4rNXcPjBt6aInog59xxF
 jXAWR/gCyuv8lunE0wEi//vz3+L/BUoB0urz4PaejPR9heu4MmtRE7x+v
 dzPydFqJf3HRUby4LNwpnbEfwJ/kkeursh0gfd+rGZhqcNDJutgFqLZfr
 S5d6Nv5M2kd2EN2nsnjJCYC/x6Ra3SDFHoshE1n2rej74817LJwNLIXlQ
 /DfAEaBBhi2Bc1E1xrWBkmNOfWPcI+D8TtcByOW3QR6CGCdaHSuknHOad
 oAxfijmpCfTz2eipv5pvddDseu+IVoIz0X6WCwYSt9r7yI/DQs3xbNdtW Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="402251713"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="402251713"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 07:11:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="708504653"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="708504653"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2022 07:11:34 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 02/16] ALSA: hda: Prepare for compress stream support
Date: Fri,  2 Dec 2022 16:28:27 +0100
Message-Id: <20221202152841.672536-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221202152841.672536-1-cezary.rojewski@intel.com>
References: <20221202152841.672536-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.de>,
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
Acked-by: Takashi Iwai <tiwai@suse.de>
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


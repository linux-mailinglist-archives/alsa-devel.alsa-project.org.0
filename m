Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DB864092A
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 16:17:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 420E0185F;
	Fri,  2 Dec 2022 16:16:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 420E0185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669994228;
	bh=aLogYpHgjXm8tOJgdZa1u6rX+HrubIg2IfkYSyD1D3E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qiGgJUTp4+j08kz0Mw54hcVf0kc/2TxpcMIEMokQtaHC31Mua4MhISdD8R1o1j1vg
	 MffK1dQIW8aCRR8iMtc1H7D041STBmQReeg2UzzSNdu1VkAwYePYOlPASRudI0/Xs1
	 0BN5xvA/KCuimqmRQnRS/EkDMb5RHD8dDCN3uWRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1C74F80566;
	Fri,  2 Dec 2022 16:13:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0C5DF80272; Fri,  2 Dec 2022 16:13:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0144F80310
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 16:11:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0144F80310
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XXgT3dPP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669993902; x=1701529902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aLogYpHgjXm8tOJgdZa1u6rX+HrubIg2IfkYSyD1D3E=;
 b=XXgT3dPPfRTJImPdev3BlMK3UvXQRWk3T7PDit86yXmd+HtHNpZekBkF
 0jJtcBDs1eZmJEYqYiTxv9o5/OnvJg0sNvsgY0/U1knrGni8OSyoUO8Rq
 yaYke/QxjSBUcNY4kfNoiQTHKABaCQbO82b0dNRnhswI7OEZL923ULsSz
 jLHdBJ1hqY9WSQAPllOTCGtAQ/q6OvmpJhZue7y/y8t+m32eNwNUpVILS
 fYAsUWY6yJKj0Pn8dxZjINMN6SB3tLsStnn7yEKYfkK3Rf8J39h3qATQN
 YPGdOoJC4mTU9gMwv5U47s4T10NcY/Z09EOvf2RCDmSLrNHIEz+1qeXPc Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="402251725"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="402251725"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 07:11:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="708504661"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="708504661"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2022 07:11:36 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 03/16] ALSA: hda: Interrupt servicing and BDL setup for
 compress streams
Date: Fri,  2 Dec 2022 16:28:28 +0100
Message-Id: <20221202152841.672536-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221202152841.672536-1-cezary.rojewski@intel.com>
References: <20221202152841.672536-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.de>,
 Divya Prakash <divya1.prakash@intel.com>, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com
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

Account for compress streams when receiving and servicing buffer
completed interrupts. In case of compress stream enlisting hdac_stream
for data transfer, setup BDL entries much like it is the case for PCM
streams.

Signed-off-by: Divya Prakash <divya1.prakash@intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Acked-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/hdac_controller.c |  4 ++--
 sound/hda/hdac_stream.c     | 27 ++++++++++++++++++++-------
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index 9a60bfdb39ba..3c7af6558249 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -578,8 +578,8 @@ int snd_hdac_bus_handle_stream_irq(struct hdac_bus *bus, unsigned int status,
 			sd_status = snd_hdac_stream_readb(azx_dev, SD_STS);
 			snd_hdac_stream_writeb(azx_dev, SD_STS, SD_INT_MASK);
 			handled |= 1 << azx_dev->index;
-			if (!azx_dev->substream || !azx_dev->running ||
-			    !(sd_status & SD_INT_COMPLETE))
+			if ((!azx_dev->substream && !azx_dev->cstream) ||
+			    !azx_dev->running || !(sd_status & SD_INT_COMPLETE))
 				continue;
 			if (ack)
 				ack(bus, azx_dev);
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index 8a12c6347914..8f625402505f 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -7,6 +7,7 @@
 #include <linux/delay.h>
 #include <linux/export.h>
 #include <linux/clocksource.h>
+#include <sound/compress_driver.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/hdaudio.h>
@@ -487,14 +488,19 @@ int snd_hdac_stream_setup_periods(struct hdac_stream *azx_dev)
 {
 	struct hdac_bus *bus = azx_dev->bus;
 	struct snd_pcm_substream *substream = azx_dev->substream;
-	struct snd_pcm_runtime *runtime;
+	struct snd_compr_stream *cstream = azx_dev->cstream;
+	struct snd_pcm_runtime *runtime = NULL;
 	struct snd_dma_buffer *dmab;
 	__le32 *bdl;
 	int i, ofs, periods, period_bytes;
 	int pos_adj, pos_align;
 
-	runtime = substream->runtime;
-	dmab = snd_pcm_get_dma_buf(substream);
+	if (substream) {
+		runtime = substream->runtime;
+		dmab = snd_pcm_get_dma_buf(substream);
+	} else if (cstream) {
+		dmab = snd_pcm_get_dma_buf(cstream);
+	}
 
 	/* reset BDL address */
 	snd_hdac_stream_writel(azx_dev, SD_BDLPL, 0);
@@ -562,15 +568,22 @@ int snd_hdac_stream_set_params(struct hdac_stream *azx_dev,
 				 unsigned int format_val)
 {
 	struct snd_pcm_substream *substream = azx_dev->substream;
+	struct snd_compr_stream *cstream = azx_dev->cstream;
 	unsigned int bufsize, period_bytes;
 	unsigned int no_period_wakeup;
 	int err;
 
-	if (!substream)
+	if (substream) {
+		bufsize = snd_pcm_lib_buffer_bytes(substream);
+		period_bytes = snd_pcm_lib_period_bytes(substream);
+		no_period_wakeup = substream->runtime->no_period_wakeup;
+	} else if (cstream) {
+		bufsize = cstream->runtime->buffer_size;
+		period_bytes = cstream->runtime->fragment_size;
+		no_period_wakeup = 0;
+	} else {
 		return -EINVAL;
-	bufsize = snd_pcm_lib_buffer_bytes(substream);
-	period_bytes = snd_pcm_lib_period_bytes(substream);
-	no_period_wakeup = substream->runtime->no_period_wakeup;
+	}
 
 	if (bufsize != azx_dev->bufsize ||
 	    period_bytes != azx_dev->period_bytes ||
-- 
2.25.1


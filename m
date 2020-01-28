Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC0B14B2F8
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 11:49:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31B2E167A;
	Tue, 28 Jan 2020 11:48:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31B2E167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580208557;
	bh=52OeLapKGTpaIJmp151N0jvXDUiVkny96An3Iy+ee5A=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M0G81UqrHBZhCi1wKSCs14583pnx83C6y6NT1eVs/QOT6CkXwwSubu4mBRTue+hZ4
	 fg2p0uv0972Y2k/frjK1Dv5XibzeNp6zD+PBA2U+3eUso2Jz3LR3yJDSf+uQ1GoAgn
	 mrirWaEYhXLyJGiL/3yu/EuwJphl78RAgpozEMsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CA6EF80299;
	Tue, 28 Jan 2020 11:44:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69A0CF80273; Tue, 28 Jan 2020 11:44:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C3ABF8014B
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 11:44:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C3ABF8014B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 02:44:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,373,1574150400"; d="scan'208";a="429292903"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 28 Jan 2020 02:44:15 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 28 Jan 2020 11:43:51 +0100
Message-Id: <20200128104356.16570-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200128104356.16570-1-cezary.rojewski@intel.com>
References: <20200128104356.16570-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v3 06/11] ASoC: SOF: Intel: Account for
	compress streams when servicing IRQs
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

Update stream irq handler definition to correctly set hdac_stream
current position when servicing stream interrupts for compress streams.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio.h          |  1 +
 sound/soc/sof/intel/hda-stream.c | 26 ++++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 9a8bf1eb7d69..9a24d57f0cf2 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -496,6 +496,7 @@ struct hdac_stream {
 	bool locked:1;
 	bool stripe:1;			/* apply stripe control */
 
+	unsigned long curr_pos;
 	/* timestamp */
 	unsigned long start_wallclk;	/* start + minimum wallclk */
 	unsigned long period_wallclk;	/* wallclk for period */
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index c0ab9bb2a797..c8920a60e346 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -571,6 +571,23 @@ bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev)
 	return ret;
 }
 
+static void hda_dsp_set_bytes_transferred(struct hdac_stream *hstream,
+					  u64 buffer_size)
+{
+	unsigned int prev_pos;
+	int pos, num_bytes;
+
+	div_u64_rem(hstream->curr_pos, buffer_size, &prev_pos);
+	pos = snd_hdac_stream_get_pos_posbuf(hstream);
+
+	if (pos < prev_pos)
+		num_bytes = (buffer_size - prev_pos) +  pos;
+	else
+		num_bytes = pos - prev_pos;
+
+	hstream->curr_pos += num_bytes;
+}
+
 static bool hda_dsp_stream_check(struct hdac_bus *bus, u32 status)
 {
 	struct sof_intel_hda_dev *sof_hda = bus_to_sof_hda(bus);
@@ -588,14 +605,19 @@ static bool hda_dsp_stream_check(struct hdac_bus *bus, u32 status)
 			snd_hdac_stream_writeb(s, SD_STS, sd_status);
 
 			active = true;
-			if (!s->substream ||
+			if ((!s->substream && !s->cstream) ||
 			    !s->running ||
 			    (sd_status & SOF_HDA_CL_DMA_SD_INT_COMPLETE) == 0)
 				continue;
 
 			/* Inform ALSA only in case not do that with IPC */
-			if (sof_hda->no_ipc_position)
+			if (s->substream && sof_hda->no_ipc_position) {
 				snd_sof_pcm_period_elapsed(s->substream);
+			} else if (s->cstream) {
+				hda_dsp_set_bytes_transferred(s,
+					s->cstream->runtime->buffer_size);
+				snd_compr_fragment_elapsed(s->cstream);
+			}
 		}
 	}
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

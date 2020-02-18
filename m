Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B301628C0
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 15:43:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC84F16A2;
	Tue, 18 Feb 2020 15:42:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC84F16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582037014;
	bh=s+9gr2CxRqnoV39fAWzMXLo1MWHtTCqcfuK/0Id5KQo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S5V/wsRXhdGgS/TX4zCr6zwQvZVUfE1cb6qg6Q1vXiSOMProeV4u2EE+48s93RiTt
	 mn8P5p9ArULk6LR1wvrLzKYzglrylOmy+9OptvRPhe9ub8aydasmQwDE60NHZMZT8j
	 OStpmeQGG0ZWFXVIW3mj8Hl+aqVKaD8IHh1MpDC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B73C7F80290;
	Tue, 18 Feb 2020 15:40:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D54FF8025F; Tue, 18 Feb 2020 15:40:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6250F80148
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 15:40:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6250F80148
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 06:40:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; d="scan'208";a="235549830"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 18 Feb 2020 06:40:03 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 3/9] ASoC: SOF: Intel: Account for compress streams when
 servicing IRQs
Date: Tue, 18 Feb 2020 15:39:18 +0100
Message-Id: <20200218143924.10565-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218143924.10565-1-cezary.rojewski@intel.com>
References: <20200218143924.10565-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, vkoul@kernel.org, broonie@kernel.org
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

Update stream irq handler definition to correctly set hdac_stream
current position when servicing stream interrupts for compress streams.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v5:
- Addressed u64/ u32 concerns from Pierre when calculating bytes
  transferred during runtime:
    div_u64_rem replaced by div64_u64_rem for
    hda_dsp_set_bytes_transferred and all local variables and
	hdac_stream::curr_pos are now of u64 type


 include/sound/hdaudio.h          |  2 ++
 sound/soc/sof/intel/hda-stream.c | 25 +++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index d4299e146d95..affedc2801c4 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -513,6 +513,7 @@ struct hdac_stream {
 	struct snd_pcm_substream *substream;	/* assigned substream,
 						 * set in PCM open
 						 */
+	struct snd_compr_stream *cstream;
 	unsigned int format_val;	/* format value to be set in the
 					 * controller and the codec
 					 */
@@ -527,6 +528,7 @@ struct hdac_stream {
 	bool locked:1;
 	bool stripe:1;			/* apply stripe control */
 
+	u64 curr_pos;
 	/* timestamp */
 	unsigned long start_wallclk;	/* start + minimum wallclk */
 	unsigned long period_wallclk;	/* wallclk for period */
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index c0ab9bb2a797..7daa913dbde0 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -571,6 +571,22 @@ bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev)
 	return ret;
 }
 
+static void
+hda_dsp_set_bytes_transferred(struct hdac_stream *hstream, u64 buffer_size)
+{
+	u64 prev_pos, pos, num_bytes;
+
+	div64_u64_rem(hstream->curr_pos, buffer_size, &prev_pos);
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
@@ -588,14 +604,19 @@ static bool hda_dsp_stream_check(struct hdac_bus *bus, u32 status)
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


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DE71F6963
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 15:51:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8042A1688;
	Thu, 11 Jun 2020 15:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8042A1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591883511;
	bh=UcH8zMnUy+r/lH3ej47zh9GQnx43pLouRJuh+HdOxzI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JFM282uOzcBjgHFL5I5dApyA1xYL0yfDKns2i6dMjnqi7KCa/nsM6l6YZh6pf4mmr
	 HYIlaUM/KTVnCit7LYUIdxwdPFPm2SSZSJC6EdHg0nRCas27psdNFeBwzKjJBQWIiw
	 dBaSTM6sBmf4odE57el+fFMqhBGMSl6BC9NPm7qU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A95C9F800CC;
	Thu, 11 Jun 2020 15:50:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF766F8028C; Thu, 11 Jun 2020 15:50:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33CB8F800CC
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 15:50:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33CB8F800CC
IronPort-SDR: IhLreRUJHKaoQkHRh4LcfqCayfS2sUrv3+hSLBiChQNaDHn5j32WiyVnztRAZQjjLVznP8pcyq
 duGXiDFS5KVw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 06:49:56 -0700
IronPort-SDR: gcrOBTDgElI0wHHn9/PQZGWwY5sl0eSYpy2paBzrhwA0AUruARTQKUFf6sNIOWkMEhFezHd+SI
 FDp1y/7HXGlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,499,1583222400"; d="scan'208";a="380389330"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by fmsmga001.fm.intel.com with ESMTP; 11 Jun 2020 06:49:52 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Intel: hda: unsolicited RIRB response
Date: Thu, 11 Jun 2020 21:44:33 +0800
Message-Id: <1591883073-17190-1-git-send-email-brent.lu@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, "added_lines:21/248=8"@,
 "commit_signer:6/16=38"@, Keyon Jie <yang.jie@linux.intel.com>,
 "Liam Girdwood DRIVERS \)" <lgirdwood@gmail.com>, "commit_signer:15/16=94"@,
 Bard Liao <yung-chuan.liao@linux.intel.com>, "authored:2/16=12"@,
 Pierre-Louis Bossart DRIVERS <pierre-louis.bossart@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>,
 Ranjani Sridharan DRIVERS <ranjani.sridharan@linux.intel.com>,
 "added_lines:123/248=50"@, sound-open-firmware@alsa-project.orgDRIVERS,
 "authored:6/16=38"@, Mark Brown <broonie@kernel.org>,
 "removed_lines:36/84=43"@, ")"@alsa-project.org,
 "Daniel Baluta DRIVERS \)" <daniel.baluta@nxp.com>,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 "Kai Vehmanen DRIVERS \)" <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 "removed_lines:5/84=6"@
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

The loop implementation could not solve the unsolicited response
issue because the RIRBSTS is cleared after leaving the
snd_hdac_bus_update_rirb() function. So the next loop will fail the
status test against the RIRB_INT_MASK and skip all the RIRB handling
stuff. On the other hand, there alwasy could be unsolicited responses
in the last loop regardless the number of loops.

Clear the RIRB interrupt before handling it so unsolicited response
could trigger another RIRB interrupt to handle it later.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 48 +++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 28 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 7f65dcc..d21ac42 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -589,11 +589,10 @@ hda_dsp_set_bytes_transferred(struct hdac_stream *hstream, u64 buffer_size)
 	hstream->curr_pos += num_bytes;
 }
 
-static bool hda_dsp_stream_check(struct hdac_bus *bus, u32 status)
+static void hda_dsp_stream_check(struct hdac_bus *bus, u32 status)
 {
 	struct sof_intel_hda_dev *sof_hda = bus_to_sof_hda(bus);
 	struct hdac_stream *s;
-	bool active = false;
 	u32 sd_status;
 
 	list_for_each_entry(s, &bus->stream_list, list) {
@@ -605,7 +604,6 @@ static bool hda_dsp_stream_check(struct hdac_bus *bus, u32 status)
 
 			snd_hdac_stream_writeb(s, SD_STS, sd_status);
 
-			active = true;
 			if ((!s->substream && !s->cstream) ||
 			    !s->running ||
 			    (sd_status & SOF_HDA_CL_DMA_SD_INT_COMPLETE) == 0)
@@ -621,8 +619,6 @@ static bool hda_dsp_stream_check(struct hdac_bus *bus, u32 status)
 			}
 		}
 	}
-
-	return active;
 }
 
 irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context)
@@ -632,37 +628,33 @@ irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context)
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	u32 rirb_status;
 #endif
-	bool active;
 	u32 status;
-	int i;
 
-	/*
-	 * Loop 10 times to handle missed interrupts caused by
-	 * unsolicited responses from the codec
-	 */
-	for (i = 0, active = true; i < 10 && active; i++) {
-		spin_lock_irq(&bus->reg_lock);
+	spin_lock_irq(&bus->reg_lock);
 
-		status = snd_hdac_chip_readl(bus, INTSTS);
+	status = snd_hdac_chip_readl(bus, INTSTS);
 
-		/* check streams */
-		active = hda_dsp_stream_check(bus, status);
+	/* check streams */
+	hda_dsp_stream_check(bus, status);
 
-		/* check and clear RIRB interrupt */
+	/* check and clear RIRB interrupt */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-		if (status & AZX_INT_CTRL_EN) {
-			rirb_status = snd_hdac_chip_readb(bus, RIRBSTS);
-			if (rirb_status & RIRB_INT_MASK) {
-				active = true;
-				if (rirb_status & RIRB_INT_RESPONSE)
-					snd_hdac_bus_update_rirb(bus);
-				snd_hdac_chip_writeb(bus, RIRBSTS,
-						     RIRB_INT_MASK);
-			}
+	if (status & AZX_INT_CTRL_EN) {
+		rirb_status = snd_hdac_chip_readb(bus, RIRBSTS);
+		if (rirb_status & RIRB_INT_MASK) {
+			/*
+			 * clear current interrupt before reading RIRBWP
+			 * so unsolicited response could trigger another
+			 * interrupt
+			 */
+			snd_hdac_chip_writeb(bus, RIRBSTS, RIRB_INT_MASK);
+
+			if (rirb_status & RIRB_INT_RESPONSE)
+				snd_hdac_bus_update_rirb(bus);
 		}
-#endif
-		spin_unlock_irq(&bus->reg_lock);
 	}
+#endif
+	spin_unlock_irq(&bus->reg_lock);
 
 	return IRQ_HANDLED;
 }
-- 
2.7.4


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FC36481F0
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 12:47:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93F3C21F8;
	Fri,  9 Dec 2022 12:46:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93F3C21F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670586442;
	bh=sB8A1veNV+LZI5M0GsUlKDd/sc+Hf1JeWCsI+5QDBHE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GjJTWV67k7foualcPRufqumJDu6iwQ9Nfwg6+GAItKXy73trbYyWenlhpHx+cRp0t
	 X4X1AbNK3FH3d0R+AjwKLLwIb7JU9eMBP7ddvpg91Up4umn6t3gZY/hgihrWrTwRNo
	 ZxQaMvEbxrjxUprgmLiOrIgRi2d5DW9Bkasfxftk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BB26F8022B;
	Fri,  9 Dec 2022 12:46:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28ED8F8025F; Fri,  9 Dec 2022 12:45:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26488F8016E
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 12:45:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26488F8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LUwxGh80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670586358; x=1702122358;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sB8A1veNV+LZI5M0GsUlKDd/sc+Hf1JeWCsI+5QDBHE=;
 b=LUwxGh80aXHgFZ7d47LkbtfQPzT0PLGaS9rBKBuSVgOuOf+r6PIQM5jX
 Xxn8+VBFquwJnCp2vgI8bjzxicpCJ6Cu1IB63FUudS5hRKRwHU/2qdq0Y
 R5VC2nay5KUHsAMilXJKv9znjNfNh+WvrM4GJx6TXuLhT4WpeS3n6bzFk
 VP2n6iiiEOoH1FoE5CS7KJL7LdTtpPQNIuGdA6YfBoBRWvrBH1YgqnGqG
 GF+5+dVATGmCUjR9vxno9QwdAmV2ii5Cdj1K6VKGN00BqNZ9dg2hpgoMe
 CAr3H4Y3DHzgqx6dVgILyeNe19HksuenumZAnKK4WHv0eW0U1LLt1Ucdk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="297122693"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="297122693"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 03:45:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="754000450"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="754000450"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2022 03:45:53 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/2] ASoC: SOF: Intel: pci-tgl: unblock S5 entry if DMA stop
 has failed"
Date: Fri,  9 Dec 2022 13:45:28 +0200
Message-Id: <20221209114529.3909192-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
References: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: kai.vehmanen@linux.intel.com, lgirdwood@gmail.com, tiwai@suse.de,
 daniel.baluta@nxp.com, Oliver Neukum <oneukum@suse.com>,
 peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, Zhen Ni <nizhen@uniontech.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Archana Patni <archana.patni@intel.com>, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

If system shutdown has not been completed cleanly, it is possible the
DMA stream shutdown has not been done, or was not clean.

If this is the case, Intel TGL/ADL HDA platforms may fail to shutdown
cleanly due to pending HDA DMA transactions. To avoid this, detect this
scenario in the shutdown callback, and perform an additional controller
reset. This has been tested to unblock S5 entry if this condition is
hit.

Co-developed-by: Archana Patni <archana.patni@intel.com>
Signed-off-by: Archana Patni <archana.patni@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 72 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.h     |  1 +
 sound/soc/sof/intel/tgl.c     |  2 +-
 3 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 5fa29df54b42..b4eacae8564c 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -878,6 +878,78 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
 }
 
+static unsigned int hda_dsp_check_for_dma_streams(struct snd_sof_dev *sdev)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	struct hdac_stream *s;
+	unsigned int active_streams = 0;
+	int sd_offset;
+	u32 val;
+
+	list_for_each_entry(s, &bus->stream_list, list) {
+		sd_offset = SOF_STREAM_SD_OFFSET(s);
+		val = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
+				       sd_offset);
+		if (val & SOF_HDA_SD_CTL_DMA_START)
+			active_streams |= BIT(s->index);
+	}
+
+	return active_streams;
+}
+
+static int hda_dsp_s5_quirk(struct snd_sof_dev *sdev)
+{
+	int ret;
+
+	/*
+	 * Do not assume a certain timing between the prior
+	 * suspend flow, and running of this quirk function.
+	 * This is needed if the controller was just put
+	 * to reset before calling this function.
+	 */
+	usleep_range(500, 1000);
+
+	/*
+	 * Take controller out of reset to flush DMA
+	 * transactions.
+	 */
+	ret = hda_dsp_ctrl_link_reset(sdev, false);
+	if (ret < 0)
+		return ret;
+
+	usleep_range(500, 1000);
+
+	/* Restore state for shutdown, back to reset */
+	ret = hda_dsp_ctrl_link_reset(sdev, true);
+	if (ret < 0)
+		return ret;
+
+	return ret;
+}
+
+int hda_dsp_shutdown_dma_flush(struct snd_sof_dev *sdev)
+{
+	unsigned int active_streams;
+	int ret, ret2;
+
+	/* check if DMA cleanup has been successful */
+	active_streams = hda_dsp_check_for_dma_streams(sdev);
+
+	sdev->system_suspend_target = SOF_SUSPEND_S3;
+	ret = snd_sof_suspend(sdev->dev);
+
+	if (active_streams) {
+		dev_warn(sdev->dev,
+			 "There were active DSP streams (%#x) at shutdown, trying to recover\n",
+			 active_streams);
+		ret2 = hda_dsp_s5_quirk(sdev);
+		if (ret2 < 0)
+			dev_err(sdev->dev, "shutdown recovery failed (%d)\n", ret2);
+	}
+
+	return ret;
+}
+
 int hda_dsp_shutdown(struct snd_sof_dev *sdev)
 {
 	sdev->system_suspend_target = SOF_SUSPEND_S3;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 022ce80968dd..caccaf8fba9c 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -592,6 +592,7 @@ int hda_dsp_resume(struct snd_sof_dev *sdev);
 int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev);
 int hda_dsp_runtime_resume(struct snd_sof_dev *sdev);
 int hda_dsp_runtime_idle(struct snd_sof_dev *sdev);
+int hda_dsp_shutdown_dma_flush(struct snd_sof_dev *sdev);
 int hda_dsp_shutdown(struct snd_sof_dev *sdev);
 int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev);
 void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags);
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 30f2f49ee149..58ac3a46e6a7 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -60,7 +60,7 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 	memcpy(&sof_tgl_ops, &sof_hda_common_ops, sizeof(struct snd_sof_dsp_ops));
 
 	/* probe/remove/shutdown */
-	sof_tgl_ops.shutdown	= hda_dsp_shutdown;
+	sof_tgl_ops.shutdown	= hda_dsp_shutdown_dma_flush;
 
 	if (sdev->pdata->ipc_type == SOF_IPC) {
 		/* doorbell */
-- 
2.38.1


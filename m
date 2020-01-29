Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A18A614D2D9
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 23:12:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4135A1663;
	Wed, 29 Jan 2020 23:11:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4135A1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580335926;
	bh=JscpO7JmbGw/f6cOjJUOjilZEYgan314aZ8xNOs1GC8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jkYSuOQ8jK4G7PQTUT4cXX1BQ2n3HMM6UhTwXZvJkAjrddCDdTlNzb6Hlmp3ZVjPK
	 geBfy7bknlZiwFFQB40qR/GTjqb6KADyY56nj/7jsyvA5K66A4n6uuqbUcDThF8QPI
	 Y+teat5HcQIK9/VkgloxFKmGX50L+b95w0NBAI1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3EE7F8028E;
	Wed, 29 Jan 2020 23:08:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4282EF80278; Wed, 29 Jan 2020 23:08:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 296FDF8023F
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 23:07:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 296FDF8023F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 14:07:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,379,1574150400"; d="scan'208";a="402122392"
Received: from kjhudson-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.70.93])
 by orsmga005.jf.intel.com with ESMTP; 29 Jan 2020 14:07:49 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 29 Jan 2020 16:07:23 -0600
Message-Id: <20200129220726.31792-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
References: <20200129220726.31792-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 6/9] ASoC: SOF: audio: Add helper to check if
	only D0i3 streams are active
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add a helper function to check if only D0i3-compatible streams
are active.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 33 +++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-audio.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index d16571ca129c..75f2ef2bd94b 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -11,6 +11,39 @@
 #include "sof-audio.h"
 #include "ops.h"
 
+/*
+ * helper to determine if there are only D0i3 compatible
+ * streams active
+ */
+bool snd_sof_dsp_only_d0i3_compatible_stream_active(struct snd_sof_dev *sdev)
+{
+	struct snd_pcm_substream *substream;
+	struct snd_sof_pcm *spcm;
+	bool d0i3_compatible_active = false;
+	int dir;
+
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		for (dir = 0; dir <= SNDRV_PCM_STREAM_CAPTURE; dir++) {
+			substream = spcm->stream[dir].substream;
+			if (!substream || !substream->runtime)
+				continue;
+
+			/*
+			 * substream->runtime being not NULL indicates that
+			 * that the stream is open. No need to check the
+			 * stream state.
+			 */
+			if (!spcm->stream[dir].d0i3_compatible)
+				return false;
+
+			d0i3_compatible_active = true;
+		}
+	}
+
+	return d0i3_compatible_active;
+}
+EXPORT_SYMBOL(snd_sof_dsp_only_d0i3_compatible_stream_active);
+
 bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pcm *spcm;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index a2702afbd9a1..eacd10e4da11 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -203,6 +203,7 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 int sof_restore_pipelines(struct device *dev);
 int sof_set_hw_params_upon_resume(struct device *dev);
 bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev);
+bool snd_sof_dsp_only_d0i3_compatible_stream_active(struct snd_sof_dev *sdev);
 
 /* Machine driver enumeration */
 int sof_machine_register(struct snd_sof_dev *sdev, void *pdata);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

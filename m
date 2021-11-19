Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9DA45795D
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Nov 2021 00:11:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A4AA1774;
	Sat, 20 Nov 2021 00:10:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A4AA1774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637363499;
	bh=grv1/F84UKx04cQofbegRsRfaY27GQTgDJbcX2reHas=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j252/nfWNCAgacYBacDo/QN+8YJJUqZWiArJ6gfjIwKwlrQwHfsjRwQXfv+y+qU6C
	 mmYtItyyIwqTJ5HkB5cotqvPQLJmd4d7tMHTr+ono4pJporXKj3etrsUxIX91c3YbL
	 bvO/HS5Lzmkw36W8CWo7Rcwgygsh3B4eBKX5b8d0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D983F804FC;
	Sat, 20 Nov 2021 00:09:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14310F802A0; Sat, 20 Nov 2021 00:09:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98D19F800FA
 for <alsa-devel@alsa-project.org>; Sat, 20 Nov 2021 00:09:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98D19F800FA
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="234456140"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="234456140"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 15:09:18 -0800
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="496075717"
Received: from mredenti-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.30.252])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 15:09:17 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 3/4] ASoC: SOF: pcm: add .ack callback support
Date: Fri, 19 Nov 2021 17:08:51 -0600
Message-Id: <20211119230852.206310-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119230852.206310-1-pierre-louis.bossart@linux.intel.com>
References: <20211119230852.206310-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add the indirections required at the core level for platform-specific
operations on ack.

Note that on errors in the .ack the ALSA core will restore the
previous appl_ptr.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ops.h      | 10 ++++++++++
 sound/soc/sof/pcm.c      |  9 +++++++++
 sound/soc/sof/sof-priv.h |  3 +++
 3 files changed, 22 insertions(+)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 09bf38fdfb8a..8c58741176a0 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -454,6 +454,16 @@ snd_sof_pcm_platform_pointer(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+/* pcm ack */
+static inline int snd_sof_pcm_platform_ack(struct snd_sof_dev *sdev,
+					   struct snd_pcm_substream *substream)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->pcm_ack)
+		return sof_ops(sdev)->pcm_ack(sdev, substream);
+
+	return 0;
+}
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
 static inline int
 snd_sof_probe_compr_assign(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 31dd79b794f1..98aa5a6579e3 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -917,6 +917,14 @@ static void sof_pcm_remove(struct snd_soc_component *component)
 	snd_soc_tplg_component_remove(component);
 }
 
+static int sof_pcm_ack(struct snd_soc_component *component,
+		       struct snd_pcm_substream *substream)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+
+	return snd_sof_pcm_platform_ack(sdev, substream);
+}
+
 void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 {
 	struct snd_soc_component_driver *pd = &sdev->plat_drv;
@@ -935,6 +943,7 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 	pd->hw_free = sof_pcm_hw_free;
 	pd->trigger = sof_pcm_trigger;
 	pd->pointer = sof_pcm_pointer;
+	pd->ack = sof_pcm_ack;
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
 	pd->compress_ops = &sof_probe_compressed_ops;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 9a8af76b2f8b..1e924d849731 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -206,6 +206,9 @@ struct snd_sof_dsp_ops {
 	snd_pcm_uframes_t (*pcm_pointer)(struct snd_sof_dev *sdev,
 					 struct snd_pcm_substream *substream); /* optional */
 
+	/* pcm ack */
+	int (*pcm_ack)(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream); /* optional */
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
 	/* Except for probe_pointer, all probe ops are mandatory */
 	int (*probe_assign)(struct snd_sof_dev *sdev,
-- 
2.25.1


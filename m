Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2541642FCB9
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 22:02:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2ED0189B;
	Fri, 15 Oct 2021 22:01:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2ED0189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634328149;
	bh=pzG+7BS+K54QEiWjZ2CH60uySn5F1kHHrisHseM+WBI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NAdR3/4nyRizHaEhQHZGBwj2k6eoFeVFCizc2uELSdOgqFUJ7dHrInB6TV79+ljDK
	 Ulnc3CK13WGDhfJRdbVas0TEQOLgQ8xtdphBUcSxGk07tqFeAbZVkXvF+lIYfVbL1h
	 Ys2WOfO8k3cXlx3mv+F/8H/UwazJtMG1oVVAT69M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD43CF804FF;
	Fri, 15 Oct 2021 22:00:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4639CF804FA; Fri, 15 Oct 2021 21:59:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39A82F8028D
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 21:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39A82F8028D
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="228257933"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="228257933"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 12:59:43 -0700
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="593081854"
Received: from ssureshc-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.190.93])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 12:59:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 3/4] ASOC: SOF: pcm: add .ack callback support
Date: Fri, 15 Oct 2021 14:59:31 -0500
Message-Id: <20211015195932.224925-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015195932.224925-1-pierre-louis.bossart@linux.intel.com>
References: <20211015195932.224925-1-pierre-louis.bossart@linux.intel.com>
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
index fa0bfcd2474e..cde3f65c4378 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -869,6 +869,14 @@ static void sof_pcm_remove(struct snd_soc_component *component)
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
@@ -887,6 +895,7 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 	pd->hw_free = sof_pcm_hw_free;
 	pd->trigger = sof_pcm_trigger;
 	pd->pointer = sof_pcm_pointer;
+	pd->ack = sof_pcm_ack;
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
 	pd->compress_ops = &sof_probe_compressed_ops;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index efaec2989a27..11f26ef6f447 100644
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


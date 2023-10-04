Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D487B9BA0
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:57:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78AF9EEB;
	Thu,  5 Oct 2023 09:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78AF9EEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492636;
	bh=WlAScS0RjrknbQaMr39UICVGhe/yH3IKqpY2stK0lZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IqV9iWi9MelpGlVKHYOijMluHLYhRi9EWv08IRSWF9mdZZz2+OV4S2hTb+nY4H6KG
	 s92LLbn5WV3wEaeE+BIOeffwVPBAVK0eEVXBJW296nnEtO+I4lAPr3pOIWZValP0UC
	 9uBqKkO658y5jXrKxIy+dzgmw7P4wrdsvCxuTCUY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23B82F8062E; Thu,  5 Oct 2023 09:52:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EB74F80621;
	Thu,  5 Oct 2023 09:52:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92291F80587; Wed,  4 Oct 2023 16:56:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1E6AF80130;
	Wed,  4 Oct 2023 16:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1E6AF80130
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v6 02/12] ASoC: SOF: core: Add probe_early and remove_late
 callbacks
Date: Wed,  4 Oct 2023 16:55:30 +0200
Message-Id: <20231004145540.32321-3-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004145540.32321-1-maarten.lankhorst@linux.intel.com>
References: <20231004145540.32321-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mlankhorst@mblankhorst.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KKCMOE3DKDKKZNCSSSLX4DNVCCWSQZJM
X-Message-ID-Hash: KKCMOE3DKDKKZNCSSSLX4DNVCCWSQZJM
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:52:37 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KKCMOE3DKDKKZNCSSSLX4DNVCCWSQZJM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The existing DSP probe may be handled in a workqueue to allow for
extra time, typically for the i915 request_module and HDAudio codec
handling.

With the upcoming changes for i915/Xe driver relying on the
-EPROBE_DEFER mechanism, we need to have a first pass of the probe
which cannot be pushed to a workqueue. Introduce 2 new optional
callbacks.

probe_early is called before the workqueue runs. remove_late may be
called from the workqueue if load is unsuccesful, but will otherwise
be called on module unload.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/core.c     | 11 +++++++++++
 sound/soc/sof/ops.h      | 16 ++++++++++++++++
 sound/soc/sof/sof-priv.h |  2 ++
 3 files changed, 29 insertions(+)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 0938b259f703..d7b090224f1b 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -327,6 +327,7 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 dsp_err:
 	snd_sof_remove(sdev);
 probe_err:
+	snd_sof_remove_late(sdev);
 	sof_ops_free(sdev);
 
 	/* all resources freed, update state to match */
@@ -436,6 +437,14 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 
 	sof_set_fw_state(sdev, SOF_FW_BOOT_NOT_STARTED);
 
+	/*
+	 * first pass of probe which isn't allowed to run in a work-queue,
+	 * typically to rely on -EPROBE_DEFER dependencies
+	 */
+	ret = snd_sof_probe_early(sdev);
+	if (ret < 0)
+		return ret;
+
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE)) {
 		INIT_WORK(&sdev->probe_work, sof_probe_work);
 		schedule_work(&sdev->probe_work);
@@ -487,9 +496,11 @@ int snd_sof_device_remove(struct device *dev)
 		snd_sof_ipc_free(sdev);
 		snd_sof_free_debug(sdev);
 		snd_sof_remove(sdev);
+		snd_sof_remove_late(sdev);
 		sof_ops_free(sdev);
 	} else if (aborted) {
 		/* probe_work never ran */
+		snd_sof_remove_late(sdev);
 		sof_ops_free(sdev);
 	}
 
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 9ab7b9be765b..3ebcfc237385 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -38,6 +38,14 @@ static inline void sof_ops_free(struct snd_sof_dev *sdev)
 /* Mandatory operations are verified during probing */
 
 /* init */
+static inline int snd_sof_probe_early(struct snd_sof_dev *sdev)
+{
+	if (sof_ops(sdev)->probe_early)
+		return sof_ops(sdev)->probe_early(sdev);
+
+	return 0;
+}
+
 static inline int snd_sof_probe(struct snd_sof_dev *sdev)
 {
 	return sof_ops(sdev)->probe(sdev);
@@ -51,6 +59,14 @@ static inline int snd_sof_remove(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static inline int snd_sof_remove_late(struct snd_sof_dev *sdev)
+{
+	if (sof_ops(sdev)->remove_late)
+		return sof_ops(sdev)->remove_late(sdev);
+
+	return 0;
+}
+
 static inline int snd_sof_shutdown(struct snd_sof_dev *sdev)
 {
 	if (sof_ops(sdev)->shutdown)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index d4f6702e93dc..e73a92189fe1 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -165,8 +165,10 @@ struct sof_firmware {
 struct snd_sof_dsp_ops {
 
 	/* probe/remove/shutdown */
+	int (*probe_early)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*probe)(struct snd_sof_dev *sof_dev); /* mandatory */
 	int (*remove)(struct snd_sof_dev *sof_dev); /* optional */
+	int (*remove_late)(struct snd_sof_dev *sof_dev); /* optional */
 	int (*shutdown)(struct snd_sof_dev *sof_dev); /* optional */
 
 	/* DSP core boot / reset */
-- 
2.40.1


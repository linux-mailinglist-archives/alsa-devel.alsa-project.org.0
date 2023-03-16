Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2246BD31A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 16:14:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D39481118;
	Thu, 16 Mar 2023 16:13:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D39481118
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678979656;
	bh=PP0JSa9r/kGSqOHvB+GpmGsMZsIrt374WpL751nEgnE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PqGmq0w8EpdDTGTupobW8DA6pxuPx/ZttgxKoTGyjlgq7z/0uGptRCTOTbI9qTiGC
	 ZPQC7ndL7wbo9cy6SMysPFLsxXV/InSc5fUSCK7W5JM9dN2486C2iHh9wp94SF6CLA
	 CcIuFx0W7pXSsB20Pi1Z1OmEdRErO7ob7ToS0Cl8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA556F8055A;
	Thu, 16 Mar 2023 16:12:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B56BFF80557; Thu, 16 Mar 2023 16:12:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 600BEF804B1
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 16:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 600BEF804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hA7Ki1Pl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678979499; x=1710515499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PP0JSa9r/kGSqOHvB+GpmGsMZsIrt374WpL751nEgnE=;
  b=hA7Ki1Plq6oS+BsKNI//ux8Y0S52RWnfw9bh3xzaU5W/h/HEf1C4sRI8
   nzxo2ZByjKVi5E0NPiXtgxfWS3N5LyvCAe+pNCpMYZdc5W4E+UZlOzF9o
   jx43xEfj/orUHuooZW8sAssR5+NIzNfPDrkgXSXdOeApuumUbJKZmOXQ+
   JwZK0dtLEdxa3Ke/PCEAbHalXMR6Hl/1jhol0Ok35zhKE6AXkcRClJkL9
   7XOgB4pGP83woUHiYLAUFChG8dMyuybi/xHYeHN/v7GLml8Iuf+BMR9Jd
   eElOy2Ed1ZRvzeL6QA1dpsj6zTafAVMeN8uLVkBPI+UGE8i9LuBrB5cux
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="335501653"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="335501653"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="823286527"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="823286527"
Received: from raberjix-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.62.186])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:11:26 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 5/6] ASoC: SOF: ipc4-topology: set copier output format for
 process module
Date: Thu, 16 Mar 2023 17:11:36 +0200
Message-Id: <20230316151137.7598-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316151137.7598-1-peter.ujfalusi@linux.intel.com>
References: <20230316151137.7598-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZIMOZVWXUZ2BBXER3B2C4X5NGDLG5PCA
X-Message-ID-Hash: ZIMOZVWXUZ2BBXER3B2C4X5NGDLG5PCA
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 libin.yang@intel.com, yung-chuan.liao@linux.intel.com,
 chao.song@linux.intel.com, jaska.uimonen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIMOZVWXUZ2BBXER3B2C4X5NGDLG5PCA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chao Song <chao.song@linux.intel.com>

The copier output pin 0 format is set with module instance
initialization, format for additional copier output pin
should be set before the pin is used.

If a process module is connected to additional copier output
pin, the copier output pin format should be set according to
the corresponding input pin format of the process module.

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Co-developed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 46 ++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index efd53e855601..962ec38b70cc 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -166,6 +166,37 @@ static void sof_ipc4_dbg_audio_format(struct device *dev, struct sof_ipc4_pin_fo
 	}
 }
 
+static const struct sof_ipc4_audio_format *
+sof_ipc4_get_input_pin_audio_fmt(struct snd_sof_widget *swidget, int pin_index)
+{
+	struct sof_ipc4_base_module_cfg_ext *base_cfg_ext;
+	struct sof_ipc4_process *process;
+	int i;
+
+	if (swidget->id != snd_soc_dapm_effect) {
+		struct sof_ipc4_base_module_cfg *base = swidget->private;
+
+		/* For non-process modules, base module config format is used for all input pins */
+		return &base->audio_fmt;
+	}
+
+	process = swidget->private;
+	base_cfg_ext = process->base_config_ext;
+
+	/*
+	 * If there are multiple input formats available for a pin, the first available format
+	 * is chosen.
+	 */
+	for (i = 0; i < base_cfg_ext->num_input_pin_fmts; i++) {
+		struct sof_ipc4_pin_format *pin_format = &base_cfg_ext->pin_formats[i];
+
+		if (pin_format->pin_index == pin_index)
+			return &pin_format->audio_fmt;
+	}
+
+	return NULL;
+}
+
 /**
  * sof_ipc4_get_audio_fmt - get available audio formats from swidget->tuples
  * @scomp: pointer to pointer to SOC component
@@ -2049,9 +2080,9 @@ static int sof_ipc4_set_copier_sink_format(struct snd_sof_dev *sdev,
 					   struct snd_sof_widget *sink_widget,
 					   int sink_id)
 {
-	struct sof_ipc4_base_module_cfg *sink_config = sink_widget->private;
-	struct sof_ipc4_base_module_cfg *src_config;
 	struct sof_ipc4_copier_config_set_sink_format format;
+	struct sof_ipc4_base_module_cfg *src_config;
+	const struct sof_ipc4_audio_format *pin_fmt;
 	struct sof_ipc4_fw_module *fw_module;
 	struct sof_ipc4_msg msg = {{ 0 }};
 	u32 header, extension;
@@ -2071,7 +2102,16 @@ static int sof_ipc4_set_copier_sink_format(struct snd_sof_dev *sdev,
 
 	format.sink_id = sink_id;
 	memcpy(&format.source_fmt, &src_config->audio_fmt, sizeof(format.source_fmt));
-	memcpy(&format.sink_fmt, &sink_config->audio_fmt, sizeof(format.sink_fmt));
+
+	pin_fmt = sof_ipc4_get_input_pin_audio_fmt(sink_widget, sink_id);
+	if (!pin_fmt) {
+		dev_err(sdev->dev, "Unable to get pin %d format for %s",
+			sink_id, sink_widget->widget->name);
+		return -EINVAL;
+	}
+
+	memcpy(&format.sink_fmt, pin_fmt, sizeof(format.sink_fmt));
+
 	msg.data_size = sizeof(format);
 	msg.data_ptr = &format;
 
-- 
2.39.2


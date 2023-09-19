Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B89D7A5DDB
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 11:27:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94CFBE7E;
	Tue, 19 Sep 2023 11:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94CFBE7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695115653;
	bh=ohbNTmLqmHIzWj+nlHAKpIKEDJekGQWr1yZcA6umW4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bRbdvFuGjGBZcPgBKO1o8dcg1uM57T8OxE1Pb364UxvDkEOfY9kjLT057+FhQspTb
	 h/cb4qY0twkJAkE/QDZ1NZMBhGbr+ChzctHwXBJvo5UOQol8dHQ9hZeWJ0wZVAIKsY
	 L8jExzAqlj4hta9pBglmMGIbE3+nKrscTm70ZFMg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42332F805DA; Tue, 19 Sep 2023 11:24:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75557F805D3;
	Tue, 19 Sep 2023 11:24:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDA7BF805AD; Tue, 19 Sep 2023 11:24:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E94ABF8055B
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 11:24:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E94ABF8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZDsnU3nL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695115472; x=1726651472;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ohbNTmLqmHIzWj+nlHAKpIKEDJekGQWr1yZcA6umW4E=;
  b=ZDsnU3nLS+HRUJJos60rZkXlsi3DOW2F74X1DoFT1gwrcLY4YTvxRjQp
   8vJF59kqiyh9aLEd3nN9ORc7ykz+n0+Si2IQ8JpKNf8q0X7iWUmVvBBxT
   wfHGh2z4T5z/qdJK/xP3GkI9r7u2+YXT6W1jOjU6tdeVrsBzE2IKxqxXs
   0Nc1eU+4mWbUjz+uYrlxYoleryRtfa8jHtwDjiYT5xqfOdtnIU8ytvydj
   y47akurWmSF/fBMtcXygLNF6hnSKzOOthw19cPGHTLCtKpz3birqM9mSp
   rBszgF35pwTigCeKHVSmrVV3UXsZwGX0doUaL99FgPUxSNFrMaSpxlgK7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377205260"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="377205260"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861460314"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="861460314"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.47.169])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:28 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rander.wang@intel.com,
	guennadi.liakhovetski@linux.intel.com
Subject: [PATCH 8/9] ASoC: SOF: Intel: hda: add ipc4 FW panic support on CAVS
 2.5+ platforms
Date: Tue, 19 Sep 2023 12:24:15 +0300
Message-ID: <20230919092416.4137-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
References: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: R77YGF3ENTJ64WOQKWHQZHJOZRE4T6PU
X-Message-ID-Hash: R77YGF3ENTJ64WOQKWHQZHJOZRE4T6PU
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R77YGF3ENTJ64WOQKWHQZHJOZRE4T6PU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Get the FW panic information from telemetry data in memory window and
dump it to kernel log. The old platforms before CAVS 2.5+ don't support
it since there is no support in FW for them.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 14 ++++++++++++++
 sound/soc/sof/intel/hda.h |  1 +
 sound/soc/sof/intel/tgl.c |  1 +
 3 files changed, 16 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 15e6779efaa3..02c82ccb9f66 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -31,6 +31,7 @@
 #include "../sof-pci-dev.h"
 #include "../ops.h"
 #include "hda.h"
+#include "telemetry.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/sof_intel.h>
@@ -731,6 +732,19 @@ void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 	}
 }
 
+void hda_ipc4_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
+{
+	char *level = (flags & SOF_DBG_DUMP_OPTIONAL) ? KERN_DEBUG : KERN_ERR;
+
+	/* print ROM/FW status */
+	hda_dsp_get_state(sdev, level);
+
+	if (flags & SOF_DBG_DUMP_REGS)
+		sof_ipc4_intel_dump_telemetry_state(sdev, flags);
+	else
+		hda_dsp_dump_ext_rom_status(sdev, level, flags);
+}
+
 static bool hda_check_ipc_irq(struct snd_sof_dev *sdev)
 {
 	const struct sof_intel_dsp_desc *chip;
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 2b228c63905b..7c575ba9462c 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -603,6 +603,7 @@ int hda_dsp_shutdown_dma_flush(struct snd_sof_dev *sdev);
 int hda_dsp_shutdown(struct snd_sof_dev *sdev);
 int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev);
 void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags);
+void hda_ipc4_dsp_dump(struct snd_sof_dev *sdev, u32 flags);
 void hda_ipc_dump(struct snd_sof_dev *sdev);
 void hda_ipc_irq_dump(struct snd_sof_dev *sdev);
 void hda_dsp_d0i3_work(struct work_struct *work);
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index bb9f20253c99..4a61f6d28ae5 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -102,6 +102,7 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 
 		/* debug */
 		sof_tgl_ops.ipc_dump	= cnl_ipc4_dump;
+		sof_tgl_ops.dbg_dump	= hda_ipc4_dsp_dump;
 
 		sof_tgl_ops.set_power_state = hda_dsp_set_power_state_ipc4;
 	}
-- 
2.42.0


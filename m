Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9606163F655
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:43:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FEF41825;
	Thu,  1 Dec 2022 18:42:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FEF41825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669916607;
	bh=HLk9yDwn4j/Hpelr3uhWhQ7+cOWLOuVHuboQiOZxO+I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WgCi0YJzeqhDlwaZXvqReBqLSdssgeJo2rxkQAUlS9Pnmom4TI2tTa4Y93FjLb4dv
	 RZEde4sqSFAtyspdJu9AIRx4qp/4NoI8qOcd59+LM+33Po+JE4DE17rgGcNQRQEqyh
	 G/XwxGJVTWcvckAUzWXH9eoKIms4Q79nDCUV40V8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E57D0F805B3;
	Thu,  1 Dec 2022 18:39:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC973F805B3; Thu,  1 Dec 2022 18:39:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C2B6F805B3
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:39:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C2B6F805B3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="D/IlQ9BY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669916384; x=1701452384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HLk9yDwn4j/Hpelr3uhWhQ7+cOWLOuVHuboQiOZxO+I=;
 b=D/IlQ9BYH24oWlh1g5hSD+RDu1BgFliRmcdVGgJg8dI2a8iwM+TfnIcI
 SE51dwNURaclLj3oJKv1/tVih7dDAtyZ2ypLzjZJcf/iu60mIUfU6lw/j
 Of3K/6Mar0QaPdinDiAdn5B/0p4nmEyso4y66dkqOqwEKnbw5kFCW0wq/
 0Pa7MYVaO48gkdhn9T1/ujajm60WEuOZWQTu32mlsvk15eU312UgEKkiP
 O7/qjLUVzVpjtXisk6nk9V0hfAYp/SdzXx29XZ8lnDpHOTTVXxq6DiFTH
 QY6cCU6z7N9zKahCiVEpSzxC6CFGqa7/KiAOqsD70PkiLV4bT2/kFH3N8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="377908445"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="377908445"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 09:39:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="889824010"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="889824010"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2022 09:39:38 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 11/16] ASoC: Intel: avs: Data probing soc-component
Date: Thu,  1 Dec 2022 18:56:14 +0100
Message-Id: <20221201175619.504758-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221201175619.504758-1-cezary.rojewski@intel.com>
References: <20221201175619.504758-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Define stub component for data probing. Stub as most operations from
standard PCM case do not apply here. Specific bits are CPU DAIs and
compress_ops. FE DAIs can link against these new CPU DAI to create new
compress devices.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h    | 10 +++++++
 sound/soc/intel/avs/pcm.c    |  6 ++---
 sound/soc/intel/avs/probes.c | 52 ++++++++++++++++++++++++++++++++++--
 3 files changed, 63 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index e5e7c72eb511..e19d8d89455d 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -322,6 +322,9 @@ struct avs_soc_component {
 
 extern const struct snd_soc_dai_ops avs_dai_fe_ops;
 
+int avs_soc_component_register(struct device *dev, const char *name,
+			       const struct snd_soc_component_driver *drv,
+			       struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais);
 int avs_dmic_platform_register(struct avs_dev *adev, const char *name);
 int avs_i2s_platform_register(struct avs_dev *adev, const char *name, unsigned long port_mask,
 			      unsigned long *tdms);
@@ -373,6 +376,8 @@ struct apl_log_buffer_layout {
 bool avs_logging_fw(struct avs_dev *adev);
 void avs_dump_fw_log(struct avs_dev *adev, const void __iomem *src, unsigned int len);
 void avs_dump_fw_log_wakeup(struct avs_dev *adev, const void __iomem *src, unsigned int len);
+
+int avs_probe_platform_register(struct avs_dev *adev, const char *name);
 #else
 #define AVS_SET_ENABLE_LOGS_OP(name)
 
@@ -389,6 +394,11 @@ static inline void
 avs_dump_fw_log_wakeup(struct avs_dev *adev, const void __iomem *src, unsigned int len)
 {
 }
+
+static inline int avs_probe_platform_register(struct avs_dev *adev, const char *name)
+{
+	return 0;
+}
 #endif
 
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 70d687fa9923..f930c5e86a84 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1126,9 +1126,9 @@ static const struct snd_soc_component_driver avs_component_driver = {
 	.topology_name_prefix	= "intel/avs",
 };
 
-static int avs_soc_component_register(struct device *dev, const char *name,
-				      const struct snd_soc_component_driver *drv,
-				      struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais)
+int avs_soc_component_register(struct device *dev, const char *name,
+			       const struct snd_soc_component_driver *drv,
+			       struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais)
 {
 	struct avs_soc_component *acomp;
 	int ret;
diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index e90284ec8500..6d6480706755 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -249,7 +249,6 @@ static int avs_probe_compr_copy(struct snd_soc_component *comp, struct snd_compr
 	return count;
 }
 
-__maybe_unused
 static const struct snd_soc_cdai_ops avs_probe_dai_ops = {
 	.startup = avs_probe_compr_open,
 	.shutdown = avs_probe_compr_free,
@@ -258,7 +257,56 @@ static const struct snd_soc_cdai_ops avs_probe_dai_ops = {
 	.pointer = avs_probe_compr_pointer,
 };
 
-__maybe_unused
 static const struct snd_compress_ops avs_probe_compress_ops = {
 	.copy = avs_probe_compr_copy,
 };
+
+static struct snd_soc_dai_driver probe_cpu_dais[] = {
+{
+	.name = "Probe Extraction CPU DAI",
+	.compress_new = snd_soc_new_compress,
+	.cops = &avs_probe_dai_ops,
+	.capture = {
+		.stream_name = "Probe Extraction",
+		.channels_min = 1,
+		.channels_max = 8,
+		.rates = SNDRV_PCM_RATE_48000,
+		.rate_min = 48000,
+		.rate_max = 48000,
+	},
+},
+};
+
+static int avs_probe_component_probe(struct snd_soc_component *component)
+{
+	struct avs_soc_component *acomp = to_avs_soc_component(component);
+	struct avs_dev *adev = to_avs_dev(component->dev);
+
+	mutex_lock(&adev->comp_list_mutex);
+	list_add_tail(&acomp->node, &adev->comp_list);
+	mutex_unlock(&adev->comp_list_mutex);
+	return 0;
+}
+
+static void avs_probe_component_remove(struct snd_soc_component *component)
+{
+	struct avs_soc_component *acomp = to_avs_soc_component(component);
+	struct avs_dev *adev = to_avs_dev(component->dev);
+
+	mutex_lock(&adev->comp_list_mutex);
+	list_del(&acomp->node);
+	mutex_unlock(&adev->comp_list_mutex);
+}
+
+static const struct snd_soc_component_driver avs_probe_component_driver = {
+	.name			= "avs-probe-pcm",
+	.probe			= avs_probe_component_probe,
+	.remove			= avs_probe_component_remove,
+	.compress_ops		= &avs_probe_compress_ops,
+};
+
+int avs_probe_platform_register(struct avs_dev *adev, const char *name)
+{
+	return avs_soc_component_register(adev->dev, name, &avs_probe_component_driver,
+					  probe_cpu_dais, ARRAY_SIZE(probe_cpu_dais));
+}
-- 
2.25.1


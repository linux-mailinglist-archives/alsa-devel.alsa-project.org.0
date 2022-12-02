Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF8A64091A
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 16:15:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71A8A1856;
	Fri,  2 Dec 2022 16:14:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71A8A1856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669994112;
	bh=h9gcwFwo0WsEgG4cCHo/H2blt9yFolIlibTnwho3juw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iBbVfvdIHvNz7VaSCWAvDk65hyZC58PBQ4C00XzMgBpjYor7GndcSe5Q74MbQRFMT
	 s2ZPjJ7lWwG8n6hpzwTw122w3A2TyF8B6k9kk3z2YtEYHf6bKcRvmMeTy9ssa+lA9T
	 MNE87W87PdySK5B+CEk6CULdf/lHWg5b1ykoO6dg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CB66F805BA;
	Fri,  2 Dec 2022 16:12:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F5C3F805BD; Fri,  2 Dec 2022 16:12:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B863F805A9
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 16:11:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B863F805A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LiHRYN8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669993920; x=1701529920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h9gcwFwo0WsEgG4cCHo/H2blt9yFolIlibTnwho3juw=;
 b=LiHRYN8B48jXQSMXSZPUQvP+ZBLYGryaZpWyDsPX5GEJt+AcVsbhOp8o
 rXWxxe9aA9cGlyqv+0v1I+VCnKPcgPi5c09eXMpt4GzxdUpJqnHzUnhjx
 R66Kw2v6DOjOUv0N6qzt3hO5G74VHc4JWgwYalVJrvhZcZToD50wIE8yp
 jEYKfdBYXMLviyUaEwAuHH21rFrbtC6/AkmKkPlPiKtVKvuP/xb/oKuQq
 LP9VcfruIawts45/WSDWz7Xt0FGehCtA8Ao/Lbi/gAWZPPEO/5gEq0qmU
 s344a2360cZlr+Fpa+coKziHVQTQUkhex0vVjv1Me9Bzx4l9tN7LsOAwq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="402251808"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="402251808"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 07:11:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="708504752"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="708504752"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2022 07:11:55 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 11/16] ASoC: Intel: avs: Data probing soc-component
Date: Fri,  2 Dec 2022 16:28:36 +0100
Message-Id: <20221202152841.672536-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221202152841.672536-1-cezary.rojewski@intel.com>
References: <20221202152841.672536-1-cezary.rojewski@intel.com>
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
 sound/soc/intel/avs/pcm.c    |  6 ++--
 sound/soc/intel/avs/probes.c | 53 ++++++++++++++++++++++++++++++++++--
 3 files changed, 64 insertions(+), 5 deletions(-)

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
index e90284ec8500..29d63f2a9616 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -249,7 +249,6 @@ static int avs_probe_compr_copy(struct snd_soc_component *comp, struct snd_compr
 	return count;
 }
 
-__maybe_unused
 static const struct snd_soc_cdai_ops avs_probe_dai_ops = {
 	.startup = avs_probe_compr_open,
 	.shutdown = avs_probe_compr_free,
@@ -258,7 +257,57 @@ static const struct snd_soc_cdai_ops avs_probe_dai_ops = {
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
+	.name			= "avs-probe-compr",
+	.probe			= avs_probe_component_probe,
+	.remove			= avs_probe_component_remove,
+	.compress_ops		= &avs_probe_compress_ops,
+	.module_get_upon_open	= 1, /* increment refcount when a stream is opened */
+};
+
+int avs_probe_platform_register(struct avs_dev *adev, const char *name)
+{
+	return avs_soc_component_register(adev->dev, name, &avs_probe_component_driver,
+					  probe_cpu_dais, ARRAY_SIZE(probe_cpu_dais));
+}
-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5A3C474C2
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:44:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E74FA601F6;
	Mon, 10 Nov 2025 15:44:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E74FA601F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762785864;
	bh=mO96RXKKaIGa3R+xce/LN6szrGQsUoDYSOciX1dP0ZY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YOfZ99BBxLKLElkhKxfABPVOfTtnquw7qRDCwZ6Tyl0L6pjDrqT0OuO5PxCbELHDY
	 Ao6JPxZtX+XJB5/DZ0BHFk7QoJzewPn7XC+hS4b4vXWcZ49JcBd3Gcs3pVGEslFXqb
	 NMopJL7pmXb/BuMXdksek69emoxXOx0MCs5hQrBo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9F1DF8087B; Mon, 10 Nov 2025 15:40:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06A92F80C06;
	Mon, 10 Nov 2025 15:40:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DD15F804CC; Fri, 12 Sep 2025 10:37:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C242F8021D
	for <alsa-devel@alsa-project.org>; Fri, 12 Sep 2025 10:37:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C242F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=okAuC+Vo
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58C8b0hV482298;
	Fri, 12 Sep 2025 03:37:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757666221;
	bh=mIaKUY+NRGmAIQ84l13Q/ZY4BBARhcY2/oVKsINSZoE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=okAuC+Vof2XLGSZUGStTCy1s6QQOSPh/eFxPs5GgPIia34RHCsC0VYq8CFrKRKocs
	 4LhKco/nS4b90m90ew2abRZmP6R+ttou+0AK/t3xO6SLoZWXoET+Nc3BDhDWC3SZbH
	 r7qSQPywfiGtkk8vARgu+lDdELpcgTjgg0UkVIwU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58C8b0TK2639493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 03:37:00 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 03:37:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 03:37:00 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58C8afmB3320658;
	Fri, 12 Sep 2025 03:36:55 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>,
        <perex@perex.cz>, <tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <pierre-louis.bossart@linux.dev>, <navada@ti.com>,
        <shenghao-ding@ti.com>, <v-hampiholi@ti.com>, <baojun.xu@ti.com>,
        Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v5 3/5] ASoc: tas2783A: machine driver amp utility for TI
 devices
Date: Fri, 12 Sep 2025 14:06:22 +0530
Message-ID: <20250912083624.804-3-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250912083624.804-1-niranjan.hy@ti.com>
References: <20250912083624.804-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IGJOTKYEJF6RSGJQ6MDO76YO73GFB257
X-Message-ID-Hash: IGJOTKYEJF6RSGJQ6MDO76YO73GFB257
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:39:36 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IGJOTKYEJF6RSGJQ6MDO76YO73GFB257/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

  Machine driver amp utility file to initialize and support
multiple tas2783a devices are added.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
--
v5:
- removed empty line in soc_sdw_ti_amp.c
---
 include/sound/soc_sdw_utils.h        |  8 +++
 sound/soc/sdw_utils/Makefile         |  3 +-
 sound/soc/sdw_utils/soc_sdw_ti_amp.c | 92 ++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sdw_utils/soc_sdw_ti_amp.c

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 6049a5d0c..3c5e9b2af 100644
--- a/include/sound/soc_sdw_utils.h
+++ b/include/sound/soc_sdw_utils.h
@@ -248,5 +248,13 @@ int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_so
 int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+/* TI */
+int asoc_sdw_ti_amp_init(struct snd_soc_card *card,
+			 struct snd_soc_dai_link *dai_links,
+			 struct asoc_sdw_codec_info *info,
+			 bool playback);
+int asoc_sdw_ti_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int asoc_sdw_ti_amp_initial_settings(struct snd_soc_card *card,
+				     const char *name_prefix);
 
 #endif
diff --git a/sound/soc/sdw_utils/Makefile b/sound/soc/sdw_utils/Makefile
index daf019113..a87c53e1a 100644
--- a/sound/soc/sdw_utils/Makefile
+++ b/sound/soc/sdw_utils/Makefile
@@ -6,5 +6,6 @@ snd-soc-sdw-utils-y := soc_sdw_utils.o soc_sdw_dmic.o soc_sdw_rt_dmic.o \
 		       soc_sdw_bridge_cs35l56.o 			\
 		       soc_sdw_cs42l42.o soc_sdw_cs42l43.o 		\
 		       soc_sdw_cs_amp.o					\
-		       soc_sdw_maxim.o
+		       soc_sdw_maxim.o \
+		       soc_sdw_ti_amp.o
 obj-$(CONFIG_SND_SOC_SDW_UTILS) += snd-soc-sdw-utils.o
diff --git a/sound/soc/sdw_utils/soc_sdw_ti_amp.c b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
new file mode 100644
index 000000000..f0011360a
--- /dev/null
+++ b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2025 Texas Instruments Inc.
+
+/*
+ *  soc_sdw_ti_amp - Helpers to handle TI's soundwire based codecs
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dai.h>
+#include <sound/soc_sdw_utils.h>
+
+#define TIAMP_SPK_VOLUME_0DB		200
+
+int asoc_sdw_ti_amp_initial_settings(struct snd_soc_card *card,
+				     const char *name_prefix)
+{
+	char *volume_ctl_name;
+	int ret;
+
+	volume_ctl_name = kasprintf(GFP_KERNEL, "%s Speaker Volume",
+				    name_prefix);
+	if (!volume_ctl_name)
+		return -ENOMEM;
+
+	ret = snd_soc_limit_volume(card, volume_ctl_name,
+				   TIAMP_SPK_VOLUME_0DB);
+	if (ret)
+		dev_err(card->dev,
+			"%s update failed %d\n",
+			volume_ctl_name, ret);
+
+	kfree(volume_ctl_name);
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_ti_amp_initial_settings, "SND_SOC_SDW_UTILS");
+
+int asoc_sdw_ti_spk_rtd_init(struct snd_soc_pcm_runtime *rtd,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = rtd->card;
+	char widget_name[16];
+	char speaker[16];
+	struct snd_soc_dapm_route route = {speaker, NULL, widget_name};
+	struct snd_soc_dai *codec_dai;
+	const char *prefix;
+	int i, ret = 0;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!strstr(codec_dai->name, "tas2783"))
+			continue;
+
+		prefix = codec_dai->component->name_prefix;
+		if (!strncmp(prefix, "tas2783-1", strlen("tas2783-1"))) {
+			strscpy(speaker, "Left Spk", sizeof(speaker));
+		} else if (!strncmp(prefix, "tas2783-2", strlen("tas2783-2"))) {
+			strscpy(speaker, "Right Spk", sizeof(speaker));
+		} else {
+			ret = -EINVAL;
+			dev_err(card->dev, "unhandled prefix %s", prefix);
+			break;
+		}
+
+		snprintf(widget_name, sizeof(widget_name), "%s SPK", prefix);
+		ret = asoc_sdw_ti_amp_initial_settings(card, prefix);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_dapm_add_routes(&card->dapm, &route, 1);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_ti_spk_rtd_init, "SND_SOC_SDW_UTILS");
+
+int asoc_sdw_ti_amp_init(struct snd_soc_card *card,
+			 struct snd_soc_dai_link *dai_links,
+			 struct asoc_sdw_codec_info *info,
+			 bool playback)
+{
+	if (!playback)
+		return 0;
+
+	info->amp_num++;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(asoc_sdw_ti_amp_init, "SND_SOC_SDW_UTILS");
-- 
2.45.2


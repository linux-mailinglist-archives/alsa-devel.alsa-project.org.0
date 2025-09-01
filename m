Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9287AB4F51E
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Sep 2025 14:11:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EA6A60222;
	Tue,  9 Sep 2025 14:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EA6A60222
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757419917;
	bh=4YC1ZMMV6Lq5kzbNv13iGfvu2KvYB5U9Arr8CARbmbQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EhbWl0k+XVQlP8H7CkiRf0a1RMEdLIlnDuHFxUYG8iPCkxwj74VAQqizITQX36KO5
	 oyLSGJcnGD2DUmYhYrh3arfbfhtOlAhrJql/m4y4ZvnzbH+L/cxIKFF7KaPj2qHMzQ
	 6HSwoqhyPBuphKB28/djFTY6zIhzXCCqrolmxGyk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7512F805C5; Tue,  9 Sep 2025 14:11:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D6FDF805CA;
	Tue,  9 Sep 2025 14:11:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4439BF80518; Mon,  1 Sep 2025 07:12:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 968BFF8042F
	for <alsa-devel@alsa-project.org>; Mon,  1 Sep 2025 07:12:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 968BFF8042F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=DEZ3mgEO
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5815C92V2730446;
	Mon, 1 Sep 2025 00:12:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756703529;
	bh=hhq9HiK4sjO7H2AJb4GLBjxm+Rc9TTTtB+hKk8MyluY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DEZ3mgEO+t/8U1FW5Txn4ePxEx90nE3CMRDOkzKBLbYNat8rH1jYPv3+Seh/3aPqE
	 D3aLq3Wjw87xocTWmfqLn/UJoODABmMyVRHWBfUBohPg0y3Ew5wNS9/ZL99Ri7PuNl
	 HVghbOHdGd1C10YmsuZ9vWdzbWbzGJmuwo83PPrw=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5815C9Xf1868670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 1 Sep 2025 00:12:09 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 1
 Sep 2025 00:12:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 1 Sep 2025 00:12:08 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5815BvJA1628562;
	Mon, 1 Sep 2025 00:12:04 -0500
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
Subject: [PATCH v2 2/4] ASoc: tas2783A: machine driver amp utility for TI
 devices
Date: Mon, 1 Sep 2025 10:41:41 +0530
Message-ID: <20250901051144.1112-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250901051144.1112-1-niranjan.hy@ti.com>
References: <20250901051144.1112-1-niranjan.hy@ti.com>
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
Message-ID-Hash: I3GA3QLIW57SQLMJDY7EO4LDFTRGO4TZ
X-Message-ID-Hash: I3GA3QLIW57SQLMJDY7EO4LDFTRGO4TZ
X-Mailman-Approved-At: Tue, 09 Sep 2025 12:11:19 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I3GA3QLIW57SQLMJDY7EO4LDFTRGO4TZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

  Machine driver amp utility file to initialize and support
multiple tas2783a devices are added.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/soc_sdw_utils.h        |  8 +++
 sound/soc/sdw_utils/Makefile         |  3 +-
 sound/soc/sdw_utils/soc_sdw_ti_amp.c | 93 ++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sdw_utils/soc_sdw_ti_amp.c

diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
index 6049a5d0cfcd..3c5e9b2af7f1 100644
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
index daf019113553..a87c53e1a2c1 100644
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
index 000000000000..daa2311c064e
--- /dev/null
+++ b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
@@ -0,0 +1,93 @@
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
+
-- 
2.25.1


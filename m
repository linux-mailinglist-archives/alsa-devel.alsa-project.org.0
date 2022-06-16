Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD31354EC3D
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 23:10:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D10C1B01;
	Thu, 16 Jun 2022 23:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D10C1B01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655413829;
	bh=MQzR3oWwGydWcSxqGWzuV6o9dVfUXjEOGhFOMn0PgtU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NHJj5Tn+qRhUuiqB/hmbkRY9nWzCjaAZV1OjRNly4nF1v3qeB0TMVzW6w95qiNkRy
	 X2wpw9+hnPTV3bIcPcSow11fA+NWoXD+FyFBMXaXaYIUnOmet58O6J6tReS8qzheFq
	 aLLwDk5l7Him+RH4gcSwYxay1JoondUS0xuX90rU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BB5FF80528;
	Thu, 16 Jun 2022 23:08:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66916F80527; Thu, 16 Jun 2022 23:08:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5CF9F800F0
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 23:08:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5CF9F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Y1WVfMZd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655413726; x=1686949726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MQzR3oWwGydWcSxqGWzuV6o9dVfUXjEOGhFOMn0PgtU=;
 b=Y1WVfMZd413PVtP8PaATjnhVsCP3R7ILqJyueVPAQEtiyrTWlkHbWGyM
 hRslMMoIdYLO+vGhlkR7Nfl5wMdQQVpw+R97qfv+Wxx9pJdqb/JamPQbR
 dm9+sOo8QkGziSXjaeuh9qkpoUSogJYeikdbY2WL7KSOt69gqvK6Krj1q
 ajLsL2e/E7zdlFEU8XwocDbkPvCNuO8qBGS2hHFKmcmiVye073VMUZJQa
 +WKV0u2NXt03Z/6NzE2f7zscEXLKPQaR6hgsaeT9w01QsB5qnIoATlsEf
 Vn2nLqW69TO36ygxFm2KV5Tpm8ifc39eoua+HaEaEO0Dvsp+MgaMLBdaf Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="276926844"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="276926844"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:08:34 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="831736157"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:08:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: codecs: soundwire: call pm_runtime_resume() in
 component probe
Date: Thu, 16 Jun 2022 16:08:25 -0500
Message-Id: <20220616210825.132093-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616210825.132093-1-pierre-louis.bossart@linux.intel.com>
References: <20220616210825.132093-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Make sure that the bus and codecs are pm_runtime active when the card
is registered/created. This avoid timeouts when accessing registers.

BugLink: https://github.com/thesofproject/linux/issues/3651
BugLink: https://github.com/thesofproject/linux/issues/3650
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/codecs/max98373.c   | 14 +++++++++++++-
 sound/soc/codecs/rt1308-sdw.c | 12 ++++++++++++
 sound/soc/codecs/rt1316-sdw.c | 12 ++++++++++++
 sound/soc/codecs/rt700.c      |  5 +++++
 sound/soc/codecs/rt711-sdca.c |  5 +++++
 sound/soc/codecs/rt711.c      |  5 +++++
 sound/soc/codecs/rt715-sdca.c | 12 ++++++++++++
 sound/soc/codecs/rt715.c      | 12 ++++++++++++
 8 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98373.c b/sound/soc/codecs/max98373.c
index e14fe98349a5e..1517c47afbf14 100644
--- a/sound/soc/codecs/max98373.c
+++ b/sound/soc/codecs/max98373.c
@@ -5,6 +5,7 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/cdev.h>
@@ -440,8 +441,19 @@ const struct snd_soc_component_driver soc_codec_dev_max98373 = {
 };
 EXPORT_SYMBOL_GPL(soc_codec_dev_max98373);
 
+static int max98373_sdw_probe(struct snd_soc_component *component)
+{
+	int ret;
+
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	return 0;
+}
+
 const struct snd_soc_component_driver soc_codec_dev_max98373_sdw = {
-	.probe			= NULL,
+	.probe			= max98373_sdw_probe,
 	.controls		= max98373_snd_controls,
 	.num_controls		= ARRAY_SIZE(max98373_snd_controls),
 	.dapm_widgets		= max98373_dapm_widgets,
diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 72f673f278eec..0be6e72ff5a9a 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -608,7 +608,19 @@ static const struct sdw_slave_ops rt1308_slave_ops = {
 	.bus_config = rt1308_bus_config,
 };
 
+static int rt1308_sdw_component_probe(struct snd_soc_component *component)
+{
+	int ret;
+
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver soc_component_sdw_rt1308 = {
+	.probe = rt1308_sdw_component_probe,
 	.controls = rt1308_snd_controls,
 	.num_controls = ARRAY_SIZE(rt1308_snd_controls),
 	.dapm_widgets = rt1308_dapm_widgets,
diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 2d6b5f9d4d770..e53396606a1c6 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -590,7 +590,19 @@ static struct sdw_slave_ops rt1316_slave_ops = {
 	.update_status = rt1316_update_status,
 };
 
+static int rt1316_sdw_component_probe(struct snd_soc_component *component)
+{
+	int ret;
+
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver soc_component_sdw_rt1316 = {
+	.probe = rt1316_sdw_component_probe,
 	.controls = rt1316_snd_controls,
 	.num_controls = ARRAY_SIZE(rt1316_snd_controls),
 	.dapm_widgets = rt1316_dapm_widgets,
diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index 9bceeeb830b15..055c3ae974d80 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -818,9 +818,14 @@ static const struct snd_soc_dapm_route rt700_audio_map[] = {
 static int rt700_probe(struct snd_soc_component *component)
 {
 	struct rt700_priv *rt700 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	rt700->component = component;
 
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index dfe3c9299ebde..9d226b1cb7e92 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -1194,10 +1194,15 @@ static int rt711_sdca_parse_dt(struct rt711_sdca_priv *rt711, struct device *dev
 static int rt711_sdca_probe(struct snd_soc_component *component)
 {
 	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	rt711_sdca_parse_dt(rt711, &rt711->slave->dev);
 	rt711->component = component;
 
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 9df800abfc2d8..1bf6180891942 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -935,10 +935,15 @@ static int rt711_parse_dt(struct rt711_priv *rt711, struct device *dev)
 static int rt711_probe(struct snd_soc_component *component)
 {
 	struct rt711_priv *rt711 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	rt711_parse_dt(rt711, &rt711->slave->dev);
 	rt711->component = component;
 
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index 5857d08663073..ce8bbc76199a8 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -758,7 +758,19 @@ static const struct snd_soc_dapm_route rt715_sdca_audio_map[] = {
 	{"ADC 25 Mux", "DMIC4", "DMIC4"},
 };
 
+static int rt715_sdca_probe(struct snd_soc_component *component)
+{
+	int ret;
+
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver soc_codec_dev_rt715_sdca = {
+	.probe = rt715_sdca_probe,
 	.controls = rt715_sdca_snd_controls,
 	.num_controls = ARRAY_SIZE(rt715_sdca_snd_controls),
 	.dapm_widgets = rt715_sdca_dapm_widgets,
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 418e006b19ef5..e93240521c74e 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -737,7 +737,19 @@ static int rt715_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static int rt715_probe(struct snd_soc_component *component)
+{
+	int ret;
+
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
+	return 0;
+}
+
 static const struct snd_soc_component_driver soc_codec_dev_rt715 = {
+	.probe = rt715_probe,
 	.set_bias_level = rt715_set_bias_level,
 	.controls = rt715_snd_controls,
 	.num_controls = ARRAY_SIZE(rt715_snd_controls),
-- 
2.34.1


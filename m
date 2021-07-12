Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABBA3C650A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 22:36:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF54016BE;
	Mon, 12 Jul 2021 22:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF54016BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626122204;
	bh=/zqf1KmiRB3gB5KII4PWv3s3J6IO8rej8CY1HM9oGnE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uH0n4Pa25AmhyUYkDZ/Tk6rIiRSNX/Klzuwfh3FhXdxO7bmGmDcf/4GHKqBbU2W12
	 sx6H+Zt8BhIKNXl1RXxbZIkAmUvHmSg+KdjXl2wdmOUBVOgHt8k68Yu9Of3Xd0pczD
	 JtVU6Npd0B2wVHOofAbo2tdqjslaaP5mxO5YvmfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC0FEF804FB;
	Mon, 12 Jul 2021 22:33:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1857FF804E4; Mon, 12 Jul 2021 22:33:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7A70F80253
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 22:32:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7A70F80253
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="190431640"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="190431640"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 13:32:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="561880765"
Received: from yangbosh-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.95.167])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 13:32:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/7] ASoC: Intel: maxim-common: support max98360a
Date: Mon, 12 Jul 2021 15:32:35 -0500
Message-Id: <20210712203240.46960-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712203240.46960-1-pierre-louis.bossart@linux.intel.com>
References: <20210712203240.46960-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Brent Lu <brent.lu@intel.com>,
 Bard Liao <bard.liao@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Brent Lu <brent.lu@intel.com>

Move max98360a code to this common module so it could be shared
between multiple SOF machine drivers. MAX98357A and MAX98360A are
sharing same codec driver so here we also share some function and
structures.

Reviewed-by: Bard Liao <bard.liao@intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 17 ++++++++++++++++-
 sound/soc/intel/boards/sof_maxim_common.h |  4 +++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index e9c52f8b6428..e66dfe666915 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -134,7 +134,7 @@ void max_98373_set_codec_conf(struct snd_soc_card *card)
 EXPORT_SYMBOL_NS(max_98373_set_codec_conf, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
 /*
- * Maxim MAX98357A
+ * Maxim MAX98357A/MAX98360A
  */
 static const struct snd_kcontrol_new max_98357a_kcontrols[] = {
 	SOC_DAPM_PIN_SWITCH("Spk"),
@@ -156,6 +156,13 @@ static struct snd_soc_dai_link_component max_98357a_components[] = {
 	}
 };
 
+static struct snd_soc_dai_link_component max_98360a_components[] = {
+	{
+		.name = MAX_98360A_DEV0_NAME,
+		.dai_name = MAX_98357A_CODEC_DAI,
+	}
+};
+
 static int max_98357a_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -193,5 +200,13 @@ void max_98357a_dai_link(struct snd_soc_dai_link *link)
 }
 EXPORT_SYMBOL_NS(max_98357a_dai_link, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
+void max_98360a_dai_link(struct snd_soc_dai_link *link)
+{
+	link->codecs = max_98360a_components;
+	link->num_codecs = ARRAY_SIZE(max_98360a_components);
+	link->init = max_98357a_init;
+}
+EXPORT_SYMBOL_NS(max_98360a_dai_link, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+
 MODULE_DESCRIPTION("ASoC Intel SOF Maxim helpers");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
index 2674f1e373ef..3ff5e8fec4de 100644
--- a/sound/soc/intel/boards/sof_maxim_common.h
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -25,11 +25,13 @@ void max_98373_set_codec_conf(struct snd_soc_card *card);
 int max_98373_trigger(struct snd_pcm_substream *substream, int cmd);
 
 /*
- * Maxim MAX98357A
+ * Maxim MAX98357A/MAX98360A
  */
 #define MAX_98357A_CODEC_DAI	"HiFi"
 #define MAX_98357A_DEV0_NAME	"MX98357A:00"
+#define MAX_98360A_DEV0_NAME	"MX98360A:00"
 
 void max_98357a_dai_link(struct snd_soc_dai_link *link);
+void max_98360a_dai_link(struct snd_soc_dai_link *link);
 
 #endif /* __SOF_MAXIM_COMMON_H */
-- 
2.25.1


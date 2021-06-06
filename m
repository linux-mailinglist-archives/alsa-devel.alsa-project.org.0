Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA08C39CC07
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 03:04:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 478DF16C7;
	Sun,  6 Jun 2021 03:03:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 478DF16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622941478;
	bh=pyxbFuGx/wkyTwJ8SI/LXxWpiFWIBqManlYFvuJy8m0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QqK0RhaWd970ZdRnOdTyeAu6lN7w+y5B/t89lT33fvrKpsd3SADQAbdNHzYCzoMTK
	 mevRnETgXZcBwcSOx7kE/BUJfoafXejAaCTn+zvM//RC/tofXSbWRDuLCtPhl7dAZM
	 C52MCbHv2MqKKBjiHn2ShjfwFyG6FsJ6gs4N/di0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E4C2F8016D;
	Sun,  6 Jun 2021 03:02:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5189F804BC; Sun,  6 Jun 2021 03:02:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 129DEF8025B
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 03:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 129DEF8025B
IronPort-SDR: ZjfocpQHavRb1XNzi9niuuP6MbRpIKPPTsQikUcojY+MCO3hfMHSjGbGZ2R1QHOXroBkBkRZWm
 17kzz+hFG7Jw==
X-IronPort-AV: E=McAfee;i="6200,9189,10006"; a="268330994"
X-IronPort-AV: E=Sophos;i="5.83,252,1616482800"; d="scan'208";a="268330994"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2021 18:01:28 -0700
IronPort-SDR: qCxbjzj00kvKamMklQ45s+KiN4Rps4R1WK9Exhuo/fMfLZ620izV+ASq4ynv9HqIFsyav+xrZD
 tA7fg5vqgztg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,252,1616482800"; d="scan'208";a="412724649"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.32])
 by fmsmga007.fm.intel.com with ESMTP; 05 Jun 2021 18:01:23 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: Intel: maxim-common: support max98360a
Date: Sun,  6 Jun 2021 08:41:00 +0800
Message-Id: <20210606004102.26190-3-brent.lu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210606004102.26190-1-brent.lu@intel.com>
References: <20210606004102.26190-1-brent.lu@intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rander Wang <rander.wang@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Dharageswari R <dharageswari.r@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Naveen Manohar <naveen.m@intel.com>, Brent Lu <brent.lu@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org
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

Move max98360a code to this common module so it could be shared
between multiple SOF machine drivers. MAX98357A and MAX98360A are
sharing same codec driver so here we also share some function and
structures.

Signed-off-by: Brent Lu <brent.lu@intel.com>
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
2.17.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE192374317
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:51:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B964179B;
	Wed,  5 May 2021 18:50:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B964179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620233471;
	bh=MBCk2VrqLvwKGbhLoiXT/Eh7oZ+Fo143Arpp4T/2+2I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pAzUcLJPzMpk7ofIy9ascm0WOcDV91YVoApTxaV84iaKOOq6FhWSkC2WobcmvXT8w
	 lwp61cYjAnRCxOJZCzgQYjVAVhnZMVxeP8RxG0j8z/4FrIycM0mYLzB7gwtZg34ulo
	 tpR50D3v5y8kuaqYrzRQuINKi2y5C13iqNgwKoWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD81DF80519;
	Wed,  5 May 2021 18:37:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86584F805C3; Wed,  5 May 2021 18:37:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25234F805AF
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25234F805AF
IronPort-SDR: j2fvkVrCpgg/bXGpaVsegPvAnGjxJ74CC2Wr4LkwbAGce14+JYC2T+WKGF0AmyDPvxNljhCJx5
 O6QwYSEby8iw==
X-IronPort-AV: E=McAfee;i="6200,9189,9975"; a="196219208"
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="196219208"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:28 -0700
IronPort-SDR: XQfvktxZTPjdoNaaAX9+rMUEZC2m72ZR7fAMLmt0y9tO+7UGYxZSWfVOIi2y/edicABupPdaVB
 F0d1IFGKT4Kg==
X-IronPort-AV: E=Sophos;i="5.82,276,1613462400"; d="scan'208";a="458800052"
Received: from rtsagpan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.51.38])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 09:37:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/13] ASoC: Intel: maxim-common: support max98357a
Date: Wed,  5 May 2021 11:37:03 -0500
Message-Id: <20210505163705.305616-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
References: <20210505163705.305616-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Brent Lu <brent.lu@intel.com>,
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

Move max98357a code to this common module so it could be shared
between multiple SOF machine drivers.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 60 +++++++++++++++++++++++
 sound/soc/intel/boards/sof_maxim_common.h |  8 +++
 2 files changed, 68 insertions(+)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 7c4af6ec58e8..e9c52f8b6428 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -133,5 +133,65 @@ void max_98373_set_codec_conf(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_NS(max_98373_set_codec_conf, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
+/*
+ * Maxim MAX98357A
+ */
+static const struct snd_kcontrol_new max_98357a_kcontrols[] = {
+	SOC_DAPM_PIN_SWITCH("Spk"),
+};
+
+static const struct snd_soc_dapm_widget max_98357a_dapm_widgets[] = {
+	SND_SOC_DAPM_SPK("Spk", NULL),
+};
+
+static const struct snd_soc_dapm_route max_98357a_dapm_routes[] = {
+	/* speaker */
+	{"Spk", NULL, "Speaker"},
+};
+
+static struct snd_soc_dai_link_component max_98357a_components[] = {
+	{
+		.name = MAX_98357A_DEV0_NAME,
+		.dai_name = MAX_98357A_CODEC_DAI,
+	}
+};
+
+static int max_98357a_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, max_98357a_dapm_widgets,
+					ARRAY_SIZE(max_98357a_dapm_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add dapm controls, ret %d\n", ret);
+		/* Don't need to add routes if widget addition failed */
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, max_98357a_kcontrols,
+					ARRAY_SIZE(max_98357a_kcontrols));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add card controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, max_98357a_dapm_routes,
+				      ARRAY_SIZE(max_98357a_dapm_routes));
+
+	if (ret)
+		dev_err(rtd->dev, "unable to add dapm routes, ret %d\n", ret);
+
+	return ret;
+}
+
+void max_98357a_dai_link(struct snd_soc_dai_link *link)
+{
+	link->codecs = max_98357a_components;
+	link->num_codecs = ARRAY_SIZE(max_98357a_components);
+	link->init = max_98357a_init;
+}
+EXPORT_SYMBOL_NS(max_98357a_dai_link, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+
 MODULE_DESCRIPTION("ASoC Intel SOF Maxim helpers");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
index 566a664d5a63..2674f1e373ef 100644
--- a/sound/soc/intel/boards/sof_maxim_common.h
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -24,4 +24,12 @@ int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
 void max_98373_set_codec_conf(struct snd_soc_card *card);
 int max_98373_trigger(struct snd_pcm_substream *substream, int cmd);
 
+/*
+ * Maxim MAX98357A
+ */
+#define MAX_98357A_CODEC_DAI	"HiFi"
+#define MAX_98357A_DEV0_NAME	"MX98357A:00"
+
+void max_98357a_dai_link(struct snd_soc_dai_link *link);
+
 #endif /* __SOF_MAXIM_COMMON_H */
-- 
2.25.1


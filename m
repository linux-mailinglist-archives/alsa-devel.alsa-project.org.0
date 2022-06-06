Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D2353F0EB
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 22:50:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2AF01B57;
	Mon,  6 Jun 2022 22:49:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2AF01B57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654548610;
	bh=RD5hEQY3nQv1IQxspyUjqI0Gz9YWdyy1/79GvuBRUkk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D6RCEnEubUEcO3Xwx21q6BcJCpk/GCcia26j8taAl9NF86EY1Vq6uXMTVSYeFNist
	 8EOvL2ewxy3ComZhOaq5hrehNdTyd+MvvByaAyokTN0TRj9p+SHrHeoaFnobFTixxw
	 gKAKJS8y3uy/gjgbT5lwlwm0go/R6GNezqrNheA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DAB6F8052D;
	Mon,  6 Jun 2022 22:48:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0B08F8051E; Mon,  6 Jun 2022 22:48:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CE6CF80089
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 22:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CE6CF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="D7v7+dl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654548505; x=1686084505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RD5hEQY3nQv1IQxspyUjqI0Gz9YWdyy1/79GvuBRUkk=;
 b=D7v7+dl6LFfFbanGJ5OQlo+R8V37RUFSSasShKs09FtRM3+RThujrUKl
 /KrairvAIYVfoDMoqgjALoOpfvnKH16gjkeTOKqgntsF2xC2D5Ts9WwNt
 +Mh70hXDA2WR/vdVJnOF0FEAWFyAyaUnp9xr5sQZbuPi0x2TI0yZmfqWj
 wLTdicdQ5k//KdFpAeT1z72w6dMLuEYztRWtB2j7NhAatX33DKH6hJEv7
 mqJoHlf8vrQ0cduasXMvVc2h6DVI3xqts6JdHoYtL+2s1HCNJQg1hmrA3
 d9yWFckDIE33CYF7C4hn0A5MJy+ODPsyzow5K6TVilbhyqQQz7MuCzeQA g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="337794627"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="337794627"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:46:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="906739467"
Received: from yantem-mobl9.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.24.154])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:46:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: Intel: boards: rename RTL1019 compatible driver to
 rt1019p
Date: Mon,  6 Jun 2022 15:46:21 -0500
Message-Id: <20220606204622.144424-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606204622.144424-1-pierre-louis.bossart@linux.intel.com>
References: <20220606204622.144424-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

From: Yong Zhi <yong.zhi@intel.com>

Use rt1019p for rt1015p.c compatible codec and reserve the name rt1019
for 10EC1019 matched driver in sof_realtek_common.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_realtek_common.c | 24 ++++++++++-----------
 sound/soc/intel/boards/sof_realtek_common.h |  6 +++---
 sound/soc/intel/boards/sof_rt5682.c         |  2 +-
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index 2ab568c1d40ba..b9643ca2e2f22 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -463,26 +463,26 @@ EXPORT_SYMBOL_NS(sof_rt1308_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
  * 2-amp Configuration for RT1019
  */
 
-static const struct snd_soc_dapm_route rt1019_dapm_routes[] = {
+static const struct snd_soc_dapm_route rt1019p_dapm_routes[] = {
 	/* speaker */
 	{ "Left Spk", NULL, "Speaker" },
 	{ "Right Spk", NULL, "Speaker" },
 };
 
-static struct snd_soc_dai_link_component rt1019_components[] = {
+static struct snd_soc_dai_link_component rt1019p_components[] = {
 	{
-		.name = RT1019_DEV0_NAME,
-		.dai_name = RT1019_CODEC_DAI,
+		.name = RT1019P_DEV0_NAME,
+		.dai_name = RT1019P_CODEC_DAI,
 	},
 };
 
-static int rt1019_init(struct snd_soc_pcm_runtime *rtd)
+static int rt1019p_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt1019_dapm_routes,
-				      ARRAY_SIZE(rt1019_dapm_routes));
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt1019p_dapm_routes,
+				      ARRAY_SIZE(rt1019p_dapm_routes));
 	if (ret) {
 		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
 		return ret;
@@ -490,13 +490,13 @@ static int rt1019_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-void sof_rt1019_dai_link(struct snd_soc_dai_link *link)
+void sof_rt1019p_dai_link(struct snd_soc_dai_link *link)
 {
-	link->codecs = rt1019_components;
-	link->num_codecs = ARRAY_SIZE(rt1019_components);
-	link->init = rt1019_init;
+	link->codecs = rt1019p_components;
+	link->num_codecs = ARRAY_SIZE(rt1019p_components);
+	link->init = rt1019p_init;
 }
-EXPORT_SYMBOL_NS(sof_rt1019_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
+EXPORT_SYMBOL_NS(sof_rt1019p_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
 MODULE_DESCRIPTION("ASoC Intel SOF Realtek helpers");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_realtek_common.h b/sound/soc/intel/boards/sof_realtek_common.h
index ec3eea633e048..7784434210900 100644
--- a/sound/soc/intel/boards/sof_realtek_common.h
+++ b/sound/soc/intel/boards/sof_realtek_common.h
@@ -39,9 +39,9 @@ void sof_rt1015_codec_conf(struct snd_soc_card *card);
 #define RT1308_DEV0_NAME	"i2c-10EC1308:00"
 void sof_rt1308_dai_link(struct snd_soc_dai_link *link);
 
-#define RT1019_CODEC_DAI	"HiFi"
-#define RT1019_DEV0_NAME	"RTL1019:00"
+#define RT1019P_CODEC_DAI	"HiFi"
+#define RT1019P_DEV0_NAME	"RTL1019:00"
 
-void sof_rt1019_dai_link(struct snd_soc_dai_link *link);
+void sof_rt1019p_dai_link(struct snd_soc_dai_link *link);
 
 #endif /* __SOF_REALTEK_COMMON_H */
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 5d67a2c87a1d4..f28dae64587e1 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -735,7 +735,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		} else if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT) {
 			sof_rt1015p_dai_link(&links[id]);
 		} else if (sof_rt5682_quirk & SOF_RT1019_SPEAKER_AMP_PRESENT) {
-			sof_rt1019_dai_link(&links[id]);
+			sof_rt1019p_dai_link(&links[id]);
 		} else if (sof_rt5682_quirk &
 				SOF_MAX98373_SPEAKER_AMP_PRESENT) {
 			links[id].codecs = max_98373_components;
-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8E388C8B7
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:13:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 309C12C18;
	Tue, 26 Mar 2024 17:13:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 309C12C18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469612;
	bh=e9MH3/bUSAe+g9D9Eu1D9KvCn3LzTW9RQuszNLP1B1c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HzpLVIQnbDLcEO7Uq6JLCMKMucWbIqVYMFXmYP1WqmMCUIseU1A8GWJudlA6SeBcj
	 VEW7tNqFTSXYK62PICf3w2ezY7AYtb87oF6WneM4lHAwQAoMiXE9Fx+vKsd7vGcxxn
	 Xq+fJqYjJEPZN4hDwpF3zljeT1Gt8GdOm3cuVp/0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C40BF89786; Tue, 26 Mar 2024 17:07:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B41A8F89786;
	Tue, 26 Mar 2024 17:07:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03687F807FC; Tue, 26 Mar 2024 17:06:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E51BEF805BE
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E51BEF805BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jZ6ZoDoh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469159; x=1743005159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e9MH3/bUSAe+g9D9Eu1D9KvCn3LzTW9RQuszNLP1B1c=;
  b=jZ6ZoDohjRwTr34c4/zpuN04juPcTWn4lpXF/IQQUakHfdwcfy7bmE6i
   wuEBimMuGk+nrcxlR5obD/v22wgDK92YZTIjZS3rg7dhWTkbGGAmzLovO
   AjxTduCsahEfnLZ3HjpLMvKk9xN2p0tpSLNzqhVkgHBML5NMMdVFoYCjv
   GVrPfmhSOs2b9XD/hjTVaTgjMaN9OcrIeHmZ16IhTOWECbnukmFaLC9Nk
   Icc0YUUJMv2FpegA98s5YlvSYbD1AjDMCjOitR/90ovAyzC2aRWM0gL37
   jMrQKAQcyysorH3SRdlVnvfzcDKliC+jeNWqdZ6AL0djztm+hqOZIKstO
   A==;
X-CSE-ConnectionGUID: pxFuXjosQ7+AxiRre4HvUA==
X-CSE-MsgGUID: Zor/sWU3S+yh8TOT9q5uNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260513"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260513"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482410"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 26/34] ASoC: Intel: sof_sdw_rt722_sdca: set rtd_init in
 codec_info_list[]
Date: Tue, 26 Mar 2024 11:04:21 -0500
Message-Id: <20240326160429.13560-27-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WPO6S2CQHMUCJPTBAHYHOIVVFI6XVFVB
X-Message-ID-Hash: WPO6S2CQHMUCJPTBAHYHOIVVFI6XVFVB
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WPO6S2CQHMUCJPTBAHYHOIVVFI6XVFVB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Add rt722 into rt_sdca_jack_rtd_init() supported list, and set
rtd_init callback directly in codec_info_list[]. No need to use a
init callback to set the rtd_init callback.
Besides, sof_sdw_rt_sdca_jack_init() doesn't set .rtd_init anymore.

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c              |  5 ++--
 sound/soc/intel/boards/sof_sdw_common.h       | 14 ++--------
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c   | 26 ++-----------------
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  2 +-
 4 files changed, 8 insertions(+), 39 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0e376cb0ce0b..bb8429a83467 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -902,6 +902,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.init = sof_sdw_rt_sdca_jack_init,
 				.exit = sof_sdw_rt_sdca_jack_exit,
+				.rtd_init = rt_sdca_jack_rtd_init,
 			},
 			{
 				.direction = {true, false},
@@ -909,14 +910,14 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
 				/* No feedback capability is provided by rt722-sdca codec driver*/
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
-				.init = sof_sdw_rt722_spk_init,
+				.rtd_init = rt722_spk_rtd_init,
 			},
 			{
 				.direction = {false, true},
 				.dai_name = "rt722-sdca-aif3",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.init = sof_sdw_rt722_sdca_dmic_init,
+				.rtd_init = rt722_sdca_dmic_rtd_init,
 			},
 		},
 		.dai_num = 3,
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 84715d9ca942..315b2a298195 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -157,18 +157,6 @@ int sof_sdw_rt_amp_init(struct snd_soc_card *card,
 			bool playback);
 int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
-/* RT722-SDCA support */
-int sof_sdw_rt722_spk_init(struct snd_soc_card *card,
-			   const struct snd_soc_acpi_link_adr *link,
-			   struct snd_soc_dai_link *dai_links,
-			   struct sof_sdw_codec_info *info,
-			   bool playback);
-int sof_sdw_rt722_sdca_dmic_init(struct snd_soc_card *card,
-				 const struct snd_soc_acpi_link_adr *link,
-				 struct snd_soc_dai_link *dai_links,
-				 struct sof_sdw_codec_info *info,
-				 bool playback);
-
 /* MAXIM codec support */
 int sof_sdw_maxim_init(struct snd_soc_card *card,
 		       const struct snd_soc_acpi_link_adr *link,
@@ -194,6 +182,8 @@ int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int rt722_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
index fe3a2bff95bc..4947d16c70db 100644
--- a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
@@ -27,7 +27,7 @@ static const struct snd_kcontrol_new rt722_spk_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 };
 
-static int rt722_spk_init(struct snd_soc_pcm_runtime *rtd)
+int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
@@ -59,18 +59,7 @@ static int rt722_spk_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-int sof_sdw_rt722_spk_init(struct snd_soc_card *card,
-			   const struct snd_soc_acpi_link_adr *link,
-			   struct snd_soc_dai_link *dai_links,
-			   struct sof_sdw_codec_info *info,
-			   bool playback)
-{
-	dai_links->init = rt722_spk_init;
-
-	return 0;
-}
-
-static int rt722_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt722_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
@@ -84,14 +73,3 @@ static int rt722_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
 
 	return 0;
 }
-
-int sof_sdw_rt722_sdca_dmic_init(struct snd_soc_card *card,
-				 const struct snd_soc_acpi_link_adr *link,
-				 struct snd_soc_dai_link *dai_links,
-				 struct sof_sdw_codec_info *info,
-				 bool playback)
-{
-	dai_links->init = rt722_sdca_dmic_rtd_init;
-
-	return 0;
-}
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index fe59a144efef..006771485486 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -85,7 +85,7 @@ static struct snd_soc_jack_pin rt_sdca_jack_pins[] = {
 };
 
 static const char * const jack_codecs[] = {
-	"rt711", "rt712", "rt713"
+	"rt711", "rt712", "rt713", "rt722"
 };
 
 int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
-- 
2.40.1


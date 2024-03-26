Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC4288C8B6
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:13:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA1822C0C;
	Tue, 26 Mar 2024 17:13:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA1822C0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469597;
	bh=7er5XS8XPkq/Yfz89dHj6ZJt2ktjzUrDT8kk64LCDYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TRhurz8Qlo+hP8OZXHmw4lvi3c9jXSLMo0LnP8+b50Zt+VHxNWNgWOL5l7DQHHZiT
	 nqpvU+eEMata0S0Eg1f/D697FkL2bP5ujPcG41TfQmERNU4ZDTeR1UPEnH8tRlM8y6
	 dKOZ/SZgvtJRWZGms1+fUqrRS98ziMwrnDccjRcw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5ED3F89779; Tue, 26 Mar 2024 17:07:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1782F8975E;
	Tue, 26 Mar 2024 17:07:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED791F8080A; Tue, 26 Mar 2024 17:06:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BC333F805F1
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC333F805F1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=U2gwX66T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469156; x=1743005156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7er5XS8XPkq/Yfz89dHj6ZJt2ktjzUrDT8kk64LCDYc=;
  b=U2gwX66T34ncJICPCAO6xttRyEBvKXCJB8N3XA809VtkSNjZKvllc7OD
   eo5ttpejVsRwhJbLqsjYxRU71t1nS3LJkEmULnQ60wPvPJaUfwPTKapml
   sC56eLtiXfjpq5VfNDNbxl6x8X+RmUWUT27QxBlAJTomXLP6MZhGzZ2L5
   EcKs8gdNP7BcfKu6HWaKAzFbbj35vIKxEZOomx7w6pcZA7Y6hwa3GHz98
   hI6ziXxdOZ434QRJnL435nYAUA6GZeM5GZb/F6jedtUr6h7KIW82DnPxv
   kYDd2sK5G+g/rxxoNzeZK8w2usGH2WxLFvLsy3iQQPrzBKyrybp/mQ33S
   w==;
X-CSE-ConnectionGUID: tShHL5k6TH68AcPry0C5vw==
X-CSE-MsgGUID: CJYEVTj9SR6zVD9OgC9cGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260521"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260521"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482425"
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
Subject: [PATCH 27/34] ASoC: Intel: sof_sdw_rt722_sdca: use rt_dmic_rtd_init
Date: Tue, 26 Mar 2024 11:04:22 -0500
Message-Id: <20240326160429.13560-28-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5WI6RLKDD4R2HD56WOCQEYD6HGE3HEIF
X-Message-ID-Hash: 5WI6RLKDD4R2HD56WOCQEYD6HGE3HEIF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5WI6RLKDD4R2HD56WOCQEYD6HGE3HEIF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

rt_dmic_rtd_init() can be used for rt722 dmic, too.

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c            |  2 +-
 sound/soc/intel/boards/sof_sdw_common.h     |  1 -
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c | 14 --------------
 sound/soc/intel/boards/sof_sdw_rt_dmic.c    |  1 +
 4 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index bb8429a83467..3874da8d7fe4 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -917,7 +917,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt722-sdca-aif3",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.rtd_init = rt722_sdca_dmic_rtd_init,
+				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 3,
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 315b2a298195..2132d3fc42f8 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -183,7 +183,6 @@ int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt722_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
index 4947d16c70db..e5c2a36e400b 100644
--- a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
@@ -59,17 +59,3 @@ int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-int rt722_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_component *component = codec_dai->component;
-
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s mic:%s",
-					  card->components, component->name_prefix);
-	if (!card->components)
-		return -ENOMEM;
-
-	return 0;
-}
diff --git a/sound/soc/intel/boards/sof_sdw_rt_dmic.c b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
index 9091f5b5c648..5aec8422656c 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_dmic.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
@@ -15,6 +15,7 @@
 static const char * const dmics[] = {
 	"rt715",
 	"rt712-sdca-dmic",
+	"rt722-sdca",
 };
 
 int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
-- 
2.40.1


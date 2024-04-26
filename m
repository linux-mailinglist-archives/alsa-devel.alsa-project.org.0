Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C414F8B3B56
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:26:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 486C8DF6;
	Fri, 26 Apr 2024 17:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 486C8DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145202;
	bh=IhNyLvipIPGmOCLb0Rr8QiP1vU62Hi86DWOTep9C5b8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rvs1nnwPVlxA0ZgQ94bTY6J/rUi2GpmeM5BwwipYB/roppvQfr90x5qzwAZNMvaSV
	 AQ6WVFbbHBas+mR57JcLG9OrveO9voxV7weuD7LD0lni1ELNMXMQUXNpUQUqIehB5V
	 K9Zb4gvw95l62g8P5gfPMiDmvkpBlJutgfaFJNmg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5632DF80548; Fri, 26 Apr 2024 17:25:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6259AF8060E;
	Fri, 26 Apr 2024 17:25:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59020F805BB; Fri, 26 Apr 2024 17:25:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6532FF8003A
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6532FF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jw7H0PhT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145144; x=1745681144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IhNyLvipIPGmOCLb0Rr8QiP1vU62Hi86DWOTep9C5b8=;
  b=jw7H0PhTwIWtY65zzT4KyZmM3ggW1QUME9rzm0dcPOWLMbNZr+IR3ENU
   x9JdxiSZcBmu7KOLbWmIht5ik91Fn9P6HWqf5dGDhifeUrz4A7LujhjqA
   5o6BXjhAYp8191YTsBttHpXf6NDHXCVZQ1C4nF1VONzfGY90fPB961ck5
   LYs6J/MrhSK4BqCM6zH6rvMvvv2vy66jDO1y+xIs+6W2XDwSAXfiaPjx4
   SQEv78FRNUPGRw2tJ4xxl6DT8gbdVlWj2zlSNTrgb+J2xkgVIijgmhXW/
   l1ohD/AMyUYuGQDuGoyKDd5aSnw0Y7N8B8w9ro77fo1JTcIOzL2OjkP9O
   Q==;
X-CSE-ConnectionGUID: 5WmPYJWsQ9S5XddjuPNqNQ==
X-CSE-MsgGUID: gINCFQQSQlGxOzAva7aqxw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291275"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291275"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:40 -0700
X-CSE-ConnectionGUID: icjGA+p+QJyV6mr5yZc9og==
X-CSE-MsgGUID: U7ifzDJoSa6NfDm65a8XYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259536"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 02/23] ASoC: Intel: sof_maxim_common: support MAX98390 on cml
 boards
Date: Fri, 26 Apr 2024 10:25:08 -0500
Message-Id: <20240426152529.38345-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MERUXNSA3PLN76N5JLFVKLJ274LPKGDM
X-Message-ID-Hash: MERUXNSA3PLN76N5JLFVKLJ274LPKGDM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MERUXNSA3PLN76N5JLFVKLJ274LPKGDM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add support for 2xMAX98390 speaker amplifier running in I2S mode for
existing cml boards.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 42 +++++++++++++++++++----
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 53c7392bf3dd..bb12aab15ad5 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -10,6 +10,7 @@
 #include <sound/soc-dai.h>
 #include <sound/soc-dapm.h>
 #include <uapi/sound/asound.h>
+#include "../common/soc-intel-quirks.h"
 #include "sof_maxim_common.h"
 
 /*
@@ -219,6 +220,17 @@ static const struct snd_soc_dapm_route max_98390_tt_dapm_routes[] = {
 	{ "TR Spk", NULL, "Tweeter Right BE_OUT" },
 };
 
+static struct snd_soc_codec_conf max_98390_cml_codec_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF(MAX_98390_DEV0_NAME),
+		.name_prefix = "Left",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(MAX_98390_DEV1_NAME),
+		.name_prefix = "Right",
+	},
+};
+
 static struct snd_soc_codec_conf max_98390_codec_conf[] = {
 	{
 		.dlc = COMP_CODEC_CONF(MAX_98390_DEV0_NAME),
@@ -271,6 +283,7 @@ static int max_98390_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *codec_dai;
 	int i, ret;
 
@@ -280,13 +293,24 @@ static int max_98390_hw_params(struct snd_pcm_substream *substream,
 			return -ENODEV;
 		}
 
-		ret = snd_soc_dai_set_tdm_slot(codec_dai, max_98390_tdm_mask[i].tx,
-					       max_98390_tdm_mask[i].rx, 4,
-					       params_width(params));
-		if (ret < 0) {
-			dev_err(codec_dai->dev, "fail to set tdm slot, ret %d\n",
-				ret);
-			return ret;
+		switch (dai_link->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+		case SND_SOC_DAIFMT_DSP_A:
+		case SND_SOC_DAIFMT_DSP_B:
+			/* 4-slot TDM */
+			ret = snd_soc_dai_set_tdm_slot(codec_dai,
+						       max_98390_tdm_mask[i].tx,
+						       max_98390_tdm_mask[i].rx,
+						       4,
+						       params_width(params));
+			if (ret < 0) {
+				dev_err(codec_dai->dev, "fail to set tdm slot, ret %d\n",
+					ret);
+				return ret;
+			}
+			break;
+		default:
+			dev_dbg(codec_dai->dev, "codec is in I2S mode\n");
+			break;
 		}
 	}
 	return 0;
@@ -395,6 +419,10 @@ void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card *card)
 
 	switch (num_codecs) {
 	case 2:
+		if (soc_intel_is_cml())
+			card->codec_conf = max_98390_cml_codec_conf;
+
+		fallthrough;
 	case 4:
 		card->num_configs = num_codecs;
 		break;
-- 
2.40.1


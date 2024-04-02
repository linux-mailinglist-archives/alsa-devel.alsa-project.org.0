Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E07D789580E
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:21:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27EF92C15;
	Tue,  2 Apr 2024 17:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27EF92C15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712071313;
	bh=V7rz5s63A9o8cJPhHkQWErgH/uueldBVlqNFBEWk8+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X1vkqUa6qesAPur44kHX0N+WVpGbmDUsiG8+DqGPuiJuiGithdXyOd7JNWASLqsLq
	 vrQcFfKrNE4iAjEGXU9hgxcRs9ro2Wv1GQvO8UyWHa6ItSDiEBrGZJieXaWezoTUfe
	 LcRSzSobvIplhh2grhZn6MlKdEdm9y5wPwZIvRxg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5733EF806FC; Tue,  2 Apr 2024 17:19:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9010F806E9;
	Tue,  2 Apr 2024 17:19:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30C9BF80606; Tue,  2 Apr 2024 17:19:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6932EF80568
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:18:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6932EF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Q7Oy08s7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071130; x=1743607130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V7rz5s63A9o8cJPhHkQWErgH/uueldBVlqNFBEWk8+I=;
  b=Q7Oy08s706XwdzzrNqlvUkdIjftaxVpCH3sChTNNTLq0fgrsc69qBp+1
   kV6SLq8+rA3PhdwXjcPKf8QVrE8MufcXUKkOCvggCmuAgSJqyCtN/UKQV
   7y8zyzds4Js1j6MuZg1aQjIt1qEKNIiqMP9k3iG1envtn6YxrgQQRr+hI
   Cooq+91/LecpoZMW63Mr6OLR9wxCTZhVdGqzF4Nf4sG07XHNpx98ZoEYA
   b7uq42QAJuKhbPvA1WLxJ0RWfdB/Tw1LAUqdASAjQfV3sudi6WGIVlbBi
   YzG9PG40LWIQH3sd77DG3yvVKXGAKen4tTDBJkRttHfaX2/NsAmd1MLss
   Q==;
X-CSE-ConnectionGUID: pwliFP+URCyxtYJuTTAIvw==
X-CSE-MsgGUID: jImjsBbGTASKvlNZu67hFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730047"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="29730047"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:42 -0700
X-CSE-ConnectionGUID: ir/0q//HQZa8KfInUCQdQA==
X-CSE-MsgGUID: kCNxZRv6RT2JRNar7bx2hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22796513"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 09/17] ASoC: SOF: Intel: hda: extend signature of
 sdw_hda_dai_hw_params()
Date: Tue,  2 Apr 2024 10:18:20 -0500
Message-Id: <20240402151828.175002-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AE6E2TWQQ6LXKNEMTDPS2URHGZOU3WJL
X-Message-ID-Hash: AE6E2TWQQ6LXKNEMTDPS2URHGZOU3WJL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AE6E2TWQQ6LXKNEMTDPS2URHGZOU3WJL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add intel_alh_id to set the expected gateway node_id in a follow-up
patch.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 3 ++-
 sound/soc/sof/intel/hda.c     | 3 ++-
 sound/soc/sof/intel/hda.h     | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 86efcbe8f0d8..5e3229c8fe13 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -470,7 +470,8 @@ static const struct snd_soc_dai_ops dmic_dai_ops = {
 int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *cpu_dai,
-			  int link_id)
+			  int link_id,
+			  int intel_alh_id)
 {
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index e26b8fd682e5..63f1cf3b915f 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -159,7 +159,8 @@ static int sdw_ace2x_params_stream(struct device *dev,
 	return sdw_hda_dai_hw_params(params_data->substream,
 				     params_data->hw_params,
 				     params_data->dai,
-				     params_data->link_id);
+				     params_data->link_id,
+				     params_data->alh_stream_id);
 }
 
 static int sdw_ace2x_free_stream(struct device *dev,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 81a1d4606d3c..eedd03020889 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -850,7 +850,8 @@ static inline bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev)
 int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *cpu_dai,
-			  int link_id);
+			  int link_id,
+			  int intel_alh_id);
 
 int sdw_hda_dai_hw_free(struct snd_pcm_substream *substream,
 			struct snd_soc_dai *cpu_dai,
-- 
2.40.1


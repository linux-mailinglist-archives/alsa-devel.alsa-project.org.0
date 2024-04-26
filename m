Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 086928B34C6
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 12:01:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57354A4A;
	Fri, 26 Apr 2024 12:01:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57354A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714125671;
	bh=p6C6SKzHWunPyU/UTVA3+lQ7OyWR4ICR+xObO73m00o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I5bhCcE3o6bXDW4vlxftuXqc7nnmorjYOWrkYAm/NkKgPhK52FyoluQSMROUWpa7t
	 4uYOkXXPEDWp/kfWyQUNW6SR98XzEQ0iLzqmco8S+RWuD+MJw9V8uagdds4XLjiuAT
	 9EPUyIXVkEdtLNtogRoHxv2mk7M3OXcIzIEo5iEs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82397F80602; Fri, 26 Apr 2024 11:59:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2552F80601;
	Fri, 26 Apr 2024 11:59:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42C57F802E8; Fri, 26 Apr 2024 11:57:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D0C9F8045D
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 11:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D0C9F8045D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aGdX4+zk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125421; x=1745661421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p6C6SKzHWunPyU/UTVA3+lQ7OyWR4ICR+xObO73m00o=;
  b=aGdX4+zkc7Z/CEjtsZMvsscbWNedlL243/IDGM5zr3Nq/p5gU58rXN1A
   2vZeYLI7p3dJuPrn18UUzQ7AYUL9GOP7a8VjqKGZPcQgFQV+RNsUdmpim
   CQgZURQmhp69Ulz2O7w2qcNAYkmcmDp0Th3z4Iu6MVFc3WiLuocLzxhYR
   D22xGwrJ84eUGjLm9hIwVeMMy6uTWPWogby8RLlCHlOlrIQcOHmKhMc30
   oquXfPT3OSJaYsVKwYyfW/ZBz45fcgz6126jsdWMm6M0JvU4hT9TAGUIf
   ZHuKGoIS7XIpfezbAp+he34sMZF7zVpLLL5lggOiFRblXgmZsbwdcJ3RW
   A==;
X-CSE-ConnectionGUID: id1wIZbZQGCb8ii9kub4yA==
X-CSE-MsgGUID: JWNb/IklQVmlGygMgazG0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409212"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="20409212"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:56:59 -0700
X-CSE-ConnectionGUID: lOAyboRJSJqCs86Mt7mWQQ==
X-CSE-MsgGUID: qgvNodMGR8yWTZe/5iWcmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="25460600"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2024 02:56:57 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 5/8] ASoC: Intel: avs: Remove redundancy around DAI startup
Date: Fri, 26 Apr 2024 11:57:30 +0200
Message-Id: <20240426095733.3946951-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426095733.3946951-1-cezary.rojewski@intel.com>
References: <20240426095733.3946951-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E3LYXMZNY4IQERZV2R7IMDKOTAAUY36A
X-Message-ID-Hash: E3LYXMZNY4IQERZV2R7IMDKOTAAUY36A
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3LYXMZNY4IQERZV2R7IMDKOTAAUY36A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Half of the arguments in avs_dai_startup() are unused and can be
dropped. With the function updated, it matches its template in
snd_soc_dai_ops and can be referenced throughout the pcm.c file without
need of any wrappers.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index a3a04115216c..0771a9716f4b 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -57,15 +57,14 @@ avs_dai_find_path_template(struct snd_soc_dai *dai, bool is_fe, int direction)
 	return dw->priv;
 }
 
-static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai, bool is_fe,
-			   const struct snd_soc_dai_ops *ops)
+static int avs_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct avs_dev *adev = to_avs_dev(dai->component->dev);
 	struct avs_tplg_path_template *template;
 	struct avs_dma_data *data;
 
-	template = avs_dai_find_path_template(dai, is_fe, substream->stream);
+	template = avs_dai_find_path_template(dai, !rtd->dai_link->no_pcm, substream->stream);
 	if (!template) {
 		dev_err(dai->dev, "no %s path for dai %s, invalid tplg?\n",
 			snd_pcm_stream_str(substream), dai->name);
@@ -174,13 +173,6 @@ static int avs_dai_prepare(struct avs_dev *adev, struct snd_pcm_substream *subst
 	return ret;
 }
 
-static const struct snd_soc_dai_ops avs_dai_nonhda_be_ops;
-
-static int avs_dai_nonhda_be_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
-{
-	return avs_dai_startup(substream, dai, false, &avs_dai_nonhda_be_ops);
-}
-
 static int avs_dai_nonhda_be_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *hw_params, struct snd_soc_dai *dai)
 {
@@ -265,7 +257,7 @@ static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cm
 }
 
 static const struct snd_soc_dai_ops avs_dai_nonhda_be_ops = {
-	.startup = avs_dai_nonhda_be_startup,
+	.startup = avs_dai_startup,
 	.shutdown = avs_dai_shutdown,
 	.hw_params = avs_dai_nonhda_be_hw_params,
 	.hw_free = avs_dai_nonhda_be_hw_free,
@@ -273,8 +265,6 @@ static const struct snd_soc_dai_ops avs_dai_nonhda_be_ops = {
 	.trigger = avs_dai_nonhda_be_trigger,
 };
 
-static const struct snd_soc_dai_ops avs_dai_hda_be_ops;
-
 static int avs_dai_hda_be_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -282,7 +272,7 @@ static int avs_dai_hda_be_startup(struct snd_pcm_substream *substream, struct sn
 	struct hda_codec *codec;
 	int ret;
 
-	ret = avs_dai_startup(substream, dai, false, &avs_dai_hda_be_ops);
+	ret = avs_dai_startup(substream, dai);
 	if (ret)
 		return ret;
 
@@ -479,8 +469,6 @@ static const struct snd_pcm_hw_constraint_list hw_rates = {
 	.mask = 0,
 };
 
-const struct snd_soc_dai_ops avs_dai_fe_ops;
-
 static int hw_rule_param_size(struct snd_pcm_hw_params *params, struct snd_pcm_hw_rule *rule)
 {
 	struct snd_interval *interval = hw_param_interval(params, rule->var);
@@ -509,7 +497,7 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 	struct hdac_ext_stream *host_stream;
 	int ret;
 
-	ret = avs_dai_startup(substream, dai, true, &avs_dai_fe_ops);
+	ret = avs_dai_startup(substream, dai);
 	if (ret)
 		return ret;
 
-- 
2.25.1


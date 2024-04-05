Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D254389991B
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 11:13:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5E9E2D14;
	Fri,  5 Apr 2024 11:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5E9E2D14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712308417;
	bh=nu1C7rngL8VEfilTEnqoMiTpOUoFjJN8vPw+PIeQe88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rbaX7iK7VK2VHl74Wr2zBWw35qlBdRiT8PqicsKB4Nlvb7gp6BLUlFWd/Ldcjc2gk
	 5WtnEcfuIkl8L4pdKgGjEdFyoVuVQ7cJhsJDac1RwjmD94gpM3RRyHsx1u1J9cNdW1
	 bM149PjlTSqekRDLOxJzm0VhWel3+HLf6oYT0r9o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ADC0F8070E; Fri,  5 Apr 2024 11:10:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CB79F80730;
	Fri,  5 Apr 2024 11:10:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 095E7F80236; Fri,  5 Apr 2024 11:08:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F901F8020D
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 11:08:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F901F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Sl8kXIYF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308115; x=1743844115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nu1C7rngL8VEfilTEnqoMiTpOUoFjJN8vPw+PIeQe88=;
  b=Sl8kXIYFy12NuD3oVhwEco0QDgiiDRe+3viouyMYZdpUkDTwJXmYdYmN
   FtD5yZnpg1hM64uDXcdPgSXZrqZ43vyIc+Tjiju2Q27q78wg97Lb+yzrd
   nh/7Wi2cuSOPl+nIFUp2jw9MWadJmDUXox7DJEXvyZNziLKOlzQ8fVaCe
   z9aEergwGXW2ur/qlp728c29A/IoQ0S6LeZ7JWD081S+40CBixKcvtxSk
   ABKukGXuMiMYXNnlkNkDocfguntEo3uNJVAuh1kETuqvqhZ+6LFHMRURA
   3qLPS4nT81aOH7+3C9YxHuWuesgiz80jrH9iWv2iXPF0rU0GaYpNIzxyb
   w==;
X-CSE-ConnectionGUID: aYkLIomdSa2SBKrbje916Q==
X-CSE-MsgGUID: NNk6gpLMRR+pI8xiZtvAEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787498"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="7787498"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:08:33 -0700
X-CSE-ConnectionGUID: wJrbcTmtSC62zFon9zUb0g==
X-CSE-MsgGUID: 0vISobsHTRuHu26OpjfAvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000";
   d="scan'208";a="19042463"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:31 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 13/13] ASoC: Intel: avs: Rule invalid buffer and period sizes
 out
Date: Fri,  5 Apr 2024 11:09:29 +0200
Message-Id: <20240405090929.1184068-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TGYGIUPEUIAVGCVOINADBZAUIOOKTVSD
X-Message-ID-Hash: TGYGIUPEUIAVGCVOINADBZAUIOOKTVSD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TGYGIUPEUIAVGCVOINADBZAUIOOKTVSD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

While HDAudio controller supports buffer packets up to 128 bytes low,
audio format shall be taken into consideration when calculating buffer
and period sizes to avoid undesired xruns.

As *_size in ALSA terms means frames (channels times bit-depth-bytes),
hw_rules can calculate minimal buffer and period sizes solely from
sample rate and the number of milliseconds commonly used on the
AudioDSP firmware side.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 405de1d58178..77a7e8f93951 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -457,6 +457,26 @@ static const struct snd_pcm_hw_constraint_list hw_rates = {
 
 const struct snd_soc_dai_ops avs_dai_fe_ops;
 
+static int hw_rule_param_size(struct snd_pcm_hw_params *params, struct snd_pcm_hw_rule *rule)
+{
+	struct snd_interval *interval = hw_param_interval(params, rule->var);
+	struct snd_interval to;
+
+	snd_interval_any(&to);
+	to.integer = interval->integer;
+	to.max = interval->max;
+	/*
+	 * Commonly 2ms buffer size is used in HDA scenarios whereas 4ms is used
+	 * when streaming through GPDMA. Align to the latter to account for both.
+	 */
+	to.min = params_rate(params) / 1000 * 4;
+
+	if (rule->var == SNDRV_PCM_HW_PARAM_PERIOD_SIZE)
+		to.min /= params_periods(params);
+
+	return snd_interval_refine(interval, &to);
+}
+
 static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -492,6 +512,14 @@ static int avs_dai_fe_startup(struct snd_pcm_substream *substream, struct snd_so
 	if (ret < 0)
 		goto err;
 
+	/* Adjust buffer and period size based on the audio format. */
+	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, hw_rule_param_size, NULL,
+			    SNDRV_PCM_HW_PARAM_FORMAT, SNDRV_PCM_HW_PARAM_CHANNELS,
+			    SNDRV_PCM_HW_PARAM_RATE, -1);
+	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, hw_rule_param_size, NULL,
+			    SNDRV_PCM_HW_PARAM_FORMAT, SNDRV_PCM_HW_PARAM_CHANNELS,
+			    SNDRV_PCM_HW_PARAM_RATE, -1);
+
 	snd_pcm_set_sync(substream);
 
 	dev_dbg(dai->dev, "%s fe STARTUP tag %d str %p",
-- 
2.25.1


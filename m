Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AA37A4AAE
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 15:42:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CEFF823;
	Mon, 18 Sep 2023 15:41:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CEFF823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695044520;
	bh=y6XlthxZenEskkkBBtcEf2S4DC08otZI1ecItMY9iPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j486UUS37mrRMtHAZC3rfHdU+2xqdYP4SDp52YCPs/q2Qv/KzxlYBtOyMgPddF1W2
	 WZd2sxBLZUsg7SsyqcTOxZ5JS6LG8DGn6he/PKbndkhepVE6cK3ew8Jj6IIFOfGW69
	 jFIPiBf9+NBlZUjeIJ4Wy6J7w9GDpeHK9w7u4d8w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD3D5F8056F; Mon, 18 Sep 2023 15:40:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32B98F8055C;
	Mon, 18 Sep 2023 15:40:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BAD3F8047D; Mon, 18 Sep 2023 15:40:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D1BDF801F5
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 15:40:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D1BDF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jscDt5Lu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695044409; x=1726580409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y6XlthxZenEskkkBBtcEf2S4DC08otZI1ecItMY9iPc=;
  b=jscDt5LuFtwdXn4sPqC7iQiTXK0/PuK551hlGzi71f+HFTtdLaLsqCaE
   0Ddmd0WZEEOb5A7RhinbhXABbj28YHAvSCrLdqO3zih/e9Giox7WwbTeQ
   6UyjK/px/AlZ+OHMv/QYtZX8h/oFCGmO3206q3czzeheYitntvWyH43Ob
   JvSkCxx5OMa8EHelwfV5QhrDMX1tO+C3wAVJvp7eo/7Ci/TZwfbPbHVV0
   LlKZmQrJQR4324oGRAcLQtczN2IhHiHU6N+3z/43Fvt5DfTBCSkOowj2D
   +aJl0kQHRRcnGN9EI1kf3FGAeDXx06sj4PXpc2s7pzoXD3nsdcp7C90vn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466003758"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="466003758"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 06:40:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="745825851"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="745825851"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga002.jf.intel.com with ESMTP; 18 Sep 2023 06:40:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 02/17] ALSA: pcm: Honor subformat when configuring
 substream
Date: Mon, 18 Sep 2023 15:39:25 +0200
Message-Id: <20230918133940.3676091-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230918133940.3676091-1-cezary.rojewski@intel.com>
References: <20230918133940.3676091-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GYXMNBOXUWO4LROKPQBLNHOMSE6NTIGO
X-Message-ID-Hash: GYXMNBOXUWO4LROKPQBLNHOMSE6NTIGO
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GYXMNBOXUWO4LROKPQBLNHOMSE6NTIGO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Substream value is currently hardcoded to SNDRV_PCM_SUBFORMAT_STD.
Update the constraint procedure so that subformat selection is not
ignored. Case STD is always supported as most PCMs do not care about
subformat.

Suggested-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/core/pcm_native.c | 67 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index bd9ddf412b46..2ea856e95fb2 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -479,6 +479,7 @@ static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
 {
 	const struct snd_interval *i;
 	const struct snd_mask *m;
+	struct snd_mask *sfmask;
 	int err;
 
 	if (!params->msbits) {
@@ -487,6 +488,23 @@ static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
 			params->msbits = snd_interval_value(i);
 	}
 
+	if (params->msbits) {
+		m = hw_param_mask_c(params, SNDRV_PCM_HW_PARAM_FORMAT);
+
+		if (snd_mask_single(m)) {
+			snd_pcm_format_t format = (__force snd_pcm_format_t)snd_mask_min(m);
+
+			if (snd_pcm_format_linear(format) &&
+			    snd_pcm_format_width(format) != params->msbits) {
+				sfmask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_SUBFORMAT);
+				snd_mask_reset(sfmask,
+					       (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
+				if (snd_mask_empty(sfmask))
+					return -EINVAL;
+			}
+		}
+	}
+
 	if (!params->rate_den) {
 		i = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_RATE);
 		if (snd_interval_single(i)) {
@@ -2483,6 +2501,52 @@ static int snd_pcm_hw_rule_buffer_bytes_max(struct snd_pcm_hw_params *params,
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
 }		
 
+static int snd_pcm_hw_rule_subformats(struct snd_pcm_hw_params *params,
+				      struct snd_pcm_hw_rule *rule)
+{
+	struct snd_mask *sfmask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_SUBFORMAT);
+	struct snd_mask *fmask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+	struct snd_pcm_hardware *hw = rule->private;
+	struct snd_pcm_subformat *sf;
+	snd_pcm_format_t f;
+	struct snd_mask m;
+	bool found;
+
+	snd_mask_none(&m);
+	/* All PCMs support at least the default STD subformat. */
+	snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_STD);
+
+	if (!hw->subformats)
+		goto exit;
+
+	pcm_for_each_format(f) {
+		if (!snd_mask_test(fmask, f))
+			continue;
+
+		found = false;
+		for (sf = hw->subformats; sf->mask && !found; sf++) {
+			if (sf->format != f)
+				continue;
+			m.bits[0] |= sf->mask;
+			found = true;
+		}
+		if (!found && snd_pcm_format_linear(f))
+			snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
+	}
+exit:
+	return snd_mask_refine(sfmask, &m);
+}
+
+static int snd_pcm_hw_constraint_subformats(struct snd_pcm_runtime *runtime,
+					   unsigned int cond,
+					   struct snd_pcm_hardware *hw)
+{
+	return snd_pcm_hw_rule_add(runtime, cond, -1,
+				   snd_pcm_hw_rule_subformats, (void *)hw,
+				   SNDRV_PCM_HW_PARAM_SUBFORMAT,
+				   SNDRV_PCM_HW_PARAM_FORMAT, -1);
+}
+
 static int snd_pcm_hw_constraints_init(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -2634,8 +2698,7 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
 	if (err < 0)
 		return err;
 
-	err = snd_pcm_hw_constraint_mask(runtime, SNDRV_PCM_HW_PARAM_SUBFORMAT,
-					 PARAM_MASK_BIT(SNDRV_PCM_SUBFORMAT_STD));
+	err = snd_pcm_hw_constraint_subformats(runtime, 0, hw);
 	if (err < 0)
 		return err;
 
-- 
2.25.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8517A5612D1
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 08:57:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A50016D9;
	Thu, 30 Jun 2022 08:56:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A50016D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656572268;
	bh=Jqj7F9aGDoXRMtaFHzJ9VPyJBrs1etIBHghlAvpMa1M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q6UGJ+I2DlfbyAcSz5LH+v0uF1BpZyZnkpGub1aQ34pH486QacHN9fMxvOeJvGsoB
	 riaoCoo9zNS+dFcdbc0hkMACvnU5s3UOaQXUKehTvgdbfyJGDPpFkqw3FbM4XjlUZc
	 l5XGtxp0VstZ1C/5jEMX9n+or8ae01Uo0cp1wO3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BECC8F80535;
	Thu, 30 Jun 2022 08:56:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF1FDF80535; Thu, 30 Jun 2022 08:56:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEDC2F804EB
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 08:56:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEDC2F804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="S/z7qs2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656572167; x=1688108167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jqj7F9aGDoXRMtaFHzJ9VPyJBrs1etIBHghlAvpMa1M=;
 b=S/z7qs2IbQLgwel7aViU3pwe2aYWhEhsTXQbS+qrlR+oQXw8dGHeSbKD
 TgmM11jJGMO9LoKLueDWmPE0qSyBoKYDeZGDE/OS4smB/5XLiM7YFwNll
 QQeCL0tN3T/tPixJgmWPbdd5Z60kUWxMw2s8mFMBOe+SsfNdwfkZmXCZ7
 fk7lugiwW/C1dVSw9DokByPEsFbUSfhu7v9yHHE/oKdT7N++kc1UwrX1W
 N8HTDvg/wO6M6t2s+567OTcImW7fvHaTUQt4luG+pucsXULF5LQ7nmwWX
 /eDSHjCLvGOHNLrZ5u2GI8thp86fXgDwfrLBu/hQaOM78uh17QqecOTAe g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="343951701"
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="343951701"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 23:56:02 -0700
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; d="scan'208";a="595575033"
Received: from askrzypc-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.39])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 23:56:00 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com
Subject: [PATCH v2 2/2] ASoC: Intel: Skylake: Correct the handling of
 fmt_config flexible array
Date: Thu, 30 Jun 2022 09:56:38 +0300
Message-Id: <20220630065638.11183-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220630065638.11183-1-peter.ujfalusi@linux.intel.com>
References: <20220630065638.11183-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 tiwai@suse.com, kai.vehmanen@linux.intel.com
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

The struct nhlt_format's fmt_config is a flexible array, it must not be
used as normal array.
When moving to the next nhlt_fmt_cfg we need to take into account the data
behind the ->config.caps (indicated by ->config.size).

The logic of the code also changed: it is no longer saves the _last_
fmt_cfg for all found rates.

Fixes: bc2bd45b1f7f3 ("ASoC: Intel: Skylake: Parse nhlt and register clock device")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/skylake/skl-nhlt.c | 37 ++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-nhlt.c b/sound/soc/intel/skylake/skl-nhlt.c
index 366f7bd9bc02..deb7b820325e 100644
--- a/sound/soc/intel/skylake/skl-nhlt.c
+++ b/sound/soc/intel/skylake/skl-nhlt.c
@@ -111,11 +111,12 @@ static void skl_get_ssp_clks(struct skl_dev *skl, struct skl_ssp_clk *ssp_clks,
 	if (fmt->fmt_count == 0)
 		return;
 
+	fmt_cfg = (struct nhlt_fmt_cfg *)fmt->fmt_config;
 	for (i = 0; i < fmt->fmt_count; i++) {
+		struct nhlt_fmt_cfg *saved_fmt_cfg = fmt_cfg;
 		bool present = false;
 
-		fmt_cfg = &fmt->fmt_config[i];
-		wav_fmt = &fmt_cfg->fmt_ext;
+		wav_fmt = &saved_fmt_cfg->fmt_ext;
 
 		channels = wav_fmt->fmt.channels;
 		bps = wav_fmt->fmt.bits_per_sample;
@@ -133,12 +134,18 @@ static void skl_get_ssp_clks(struct skl_dev *skl, struct skl_ssp_clk *ssp_clks,
 		 * derive the rate.
 		 */
 		for (j = i; j < fmt->fmt_count; j++) {
-			fmt_cfg = &fmt->fmt_config[j];
-			wav_fmt = &fmt_cfg->fmt_ext;
+			struct nhlt_fmt_cfg *tmp_fmt_cfg = fmt_cfg;
+
+			wav_fmt = &tmp_fmt_cfg->fmt_ext;
 			if ((fs == wav_fmt->fmt.samples_per_sec) &&
-			   (bps == wav_fmt->fmt.bits_per_sample))
+			   (bps == wav_fmt->fmt.bits_per_sample)) {
 				channels = max_t(u16, channels,
 						wav_fmt->fmt.channels);
+				saved_fmt_cfg = tmp_fmt_cfg;
+			}
+			/* Move to the next nhlt_fmt_cfg */
+			tmp_fmt_cfg = (struct nhlt_fmt_cfg *)(tmp_fmt_cfg->config.caps +
+							      tmp_fmt_cfg->config.size);
 		}
 
 		rate = channels * bps * fs;
@@ -154,8 +161,11 @@ static void skl_get_ssp_clks(struct skl_dev *skl, struct skl_ssp_clk *ssp_clks,
 
 		/* Fill rate and parent for sclk/sclkfs */
 		if (!present) {
+			struct nhlt_fmt_cfg *first_fmt_cfg;
+
+			first_fmt_cfg = (struct nhlt_fmt_cfg *)fmt->fmt_config;
 			i2s_config_ext = (struct skl_i2s_config_blob_ext *)
-						fmt->fmt_config[0].config.caps;
+						first_fmt_cfg->config.caps;
 
 			/* MCLK Divider Source Select */
 			if (is_legacy_blob(i2s_config_ext->hdr.sig)) {
@@ -169,6 +179,9 @@ static void skl_get_ssp_clks(struct skl_dev *skl, struct skl_ssp_clk *ssp_clks,
 
 			parent = skl_get_parent_clk(clk_src);
 
+			/* Move to the next nhlt_fmt_cfg */
+			fmt_cfg = (struct nhlt_fmt_cfg *)(fmt_cfg->config.caps +
+							  fmt_cfg->config.size);
 			/*
 			 * Do not copy the config data if there is no parent
 			 * clock available for this clock source select
@@ -177,9 +190,9 @@ static void skl_get_ssp_clks(struct skl_dev *skl, struct skl_ssp_clk *ssp_clks,
 				continue;
 
 			sclk[id].rate_cfg[rate_index].rate = rate;
-			sclk[id].rate_cfg[rate_index].config = fmt_cfg;
+			sclk[id].rate_cfg[rate_index].config = saved_fmt_cfg;
 			sclkfs[id].rate_cfg[rate_index].rate = rate;
-			sclkfs[id].rate_cfg[rate_index].config = fmt_cfg;
+			sclkfs[id].rate_cfg[rate_index].config = saved_fmt_cfg;
 			sclk[id].parent_name = parent->name;
 			sclkfs[id].parent_name = parent->name;
 
@@ -193,13 +206,13 @@ static void skl_get_mclk(struct skl_dev *skl, struct skl_ssp_clk *mclk,
 {
 	struct skl_i2s_config_blob_ext *i2s_config_ext;
 	struct skl_i2s_config_blob_legacy *i2s_config;
-	struct nhlt_specific_cfg *fmt_cfg;
+	struct nhlt_fmt_cfg *fmt_cfg;
 	struct skl_clk_parent_src *parent;
 	u32 clkdiv, div_ratio;
 	u8 clk_src;
 
-	fmt_cfg = &fmt->fmt_config[0].config;
-	i2s_config_ext = (struct skl_i2s_config_blob_ext *)fmt_cfg->caps;
+	fmt_cfg = (struct nhlt_fmt_cfg *)fmt->fmt_config;
+	i2s_config_ext = (struct skl_i2s_config_blob_ext *)fmt_cfg->config.caps;
 
 	/* MCLK Divider Source Select and divider */
 	if (is_legacy_blob(i2s_config_ext->hdr.sig)) {
@@ -228,7 +241,7 @@ static void skl_get_mclk(struct skl_dev *skl, struct skl_ssp_clk *mclk,
 		return;
 
 	mclk[id].rate_cfg[0].rate = parent->rate/div_ratio;
-	mclk[id].rate_cfg[0].config = &fmt->fmt_config[0];
+	mclk[id].rate_cfg[0].config = fmt_cfg;
 	mclk[id].parent_name = parent->name;
 }
 
-- 
2.37.0


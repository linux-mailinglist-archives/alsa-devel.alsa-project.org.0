Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C038D0E4B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:39:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D398D852;
	Mon, 27 May 2024 21:39:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D398D852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716838786;
	bh=idMrl9zK4G+zC54METxzu7CjjMB3d2KiXfv/+/cCTQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HBXjofAbYZmjTBfxF1VRKkvYigfTBxO+XtW1TvRPz0FjieAG2nG6U6cJDbyShhE0Q
	 fn5Pqqrn+CCDXrOAzBnFFkDp9W3496NYWdhUfHnSRpP2udBLiqtJY16mNabHdD5BKM
	 kdjPOnx4ijcBBLr0YJ1b9i2kQcohucIG8IzfKYGQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF843F80727; Mon, 27 May 2024 21:37:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C417F80724;
	Mon, 27 May 2024 21:37:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A196F806E7; Mon, 27 May 2024 21:36:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F794F80525
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F794F80525
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WmP0n4LN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838584; x=1748374584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=idMrl9zK4G+zC54METxzu7CjjMB3d2KiXfv/+/cCTQQ=;
  b=WmP0n4LNTWlJFk6j+HCYJNgxDpq/HGnpdQvCBnuIVc4t74vSF2zWOjcY
   I4ZAuQ3+d7efUk55xkleFYFcg+vd475NI1is4ApDzHXQm5MpI4uMGgel9
   Fi1ztaW48kNxrQ2wC+kC51KY5C8TTq3icyKUPft8JBTbd/cWWq3qXVawC
   SO+zbBPkTAGpbWd/YYZ0PLrWj/Zj5Qn3yOH3I82NiFRcr+CT9GDS6jir+
   UxIkVVzvNhEgk52MN/wXDOKB0OM6LGwwU39Oi+AeriDkzmzA/UYzvrMNN
   1jAIVlP9hxPtQlCL949pgd9SOpga0AFMmUonFLUS3Tebovfe8EIcgZeO4
   A==;
X-CSE-ConnectionGUID: fMkCwQvwTMerz5Vw1rA4Sg==
X-CSE-MsgGUID: jrYhVor/TSy1g31b+ZIIOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339381"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="13339381"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:19 -0700
X-CSE-ConnectionGUID: dgaJvZ/bTNyiyEGIQkJ3Fg==
X-CSE-MsgGUID: IH8YwbcjRkCzIfjJqEg1fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="58029781"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 13/18] ASoC: SOF: sof-audio: add sof_dai_get_tdm_slots
 function
Date: Mon, 27 May 2024 14:35:47 -0500
Message-ID: <20240527193552.165567-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QDJG7VKIVCCMWUCKJ6D2QTQWBP76WBWJ
X-Message-ID-Hash: QDJG7VKIVCCMWUCKJ6D2QTQWBP76WBWJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QDJG7VKIVCCMWUCKJ6D2QTQWBP76WBWJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

An new interface, sof_dai_get_tdm_slots(), is added for machine driver
to get tdm slot number from topology. The dai_get_param() callback
needs to support new parameter type SOF_DAI_PARAM_INTEL_SSP_TDM_SLOTS
by returning the tdm slot number of specific SSP port.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof.h       |  1 +
 sound/soc/sof/sof-audio.c | 10 ++++++++++
 sound/soc/sof/sof-audio.h |  5 +++--
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index ec6c30d54592..64fd5504cb2b 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -173,5 +173,6 @@ struct sof_dev_desc {
 
 int sof_dai_get_mclk(struct snd_soc_pcm_runtime *rtd);
 int sof_dai_get_bclk(struct snd_soc_pcm_runtime *rtd);
+int sof_dai_get_tdm_slots(struct snd_soc_pcm_runtime *rtd);
 
 #endif
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 2421a115747e..881eec38c2e2 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -1016,3 +1016,13 @@ int sof_dai_get_bclk(struct snd_soc_pcm_runtime *rtd)
 	return sof_dai_get_param(rtd, SOF_DAI_PARAM_INTEL_SSP_BCLK);
 }
 EXPORT_SYMBOL(sof_dai_get_bclk);
+
+/*
+ * Helper to get SSP TDM slot number from a pcm_runtime.
+ * Return 0 if not exist.
+ */
+int sof_dai_get_tdm_slots(struct snd_soc_pcm_runtime *rtd)
+{
+	return sof_dai_get_param(rtd, SOF_DAI_PARAM_INTEL_SSP_TDM_SLOTS);
+}
+EXPORT_SYMBOL(sof_dai_get_tdm_slots);
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index abb2a00c520d..49be02234fc3 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -44,8 +44,9 @@
 #define WIDGET_IS_AIF_OR_DAI(id) (WIDGET_IS_DAI(id) || WIDGET_IS_AIF(id))
 #define WIDGET_IS_COPIER(id) (WIDGET_IS_AIF_OR_DAI(id) || (id) == snd_soc_dapm_buffer)
 
-#define SOF_DAI_PARAM_INTEL_SSP_MCLK	0
-#define SOF_DAI_PARAM_INTEL_SSP_BCLK	1
+#define SOF_DAI_PARAM_INTEL_SSP_MCLK		0
+#define SOF_DAI_PARAM_INTEL_SSP_BCLK		1
+#define SOF_DAI_PARAM_INTEL_SSP_TDM_SLOTS	2
 
 enum sof_widget_op {
 	SOF_WIDGET_PREPARE,
-- 
2.43.0


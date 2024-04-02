Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA67895819
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:23:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0A892C11;
	Tue,  2 Apr 2024 17:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0A892C11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712071409;
	bh=W6yWPOmHO+wzOMkTn0HjzafWo7pRLHPbcwWJchK/jQ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=umcgMxF0FVUyo+3ZITkkjE4srBuVkwKEk590KoDg8MWVMj9faHEhnZNiYDhJvEF3R
	 HtB2yUgKKXwLuYNL8kSjTH2T2FKioDVIjvFexSHd16ts7ERRHLBmKCpUphJIqYzskt
	 PVhnXoGBTtIsk57ie6/CqF+ZwNW+vw8YtmZ4XNqc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6678EF80C0D; Tue,  2 Apr 2024 17:19:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A3D2F80C0B;
	Tue,  2 Apr 2024 17:19:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 494CBF8065B; Tue,  2 Apr 2024 17:19:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE581F8056F
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE581F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Kn92j0Yb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071132; x=1743607132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W6yWPOmHO+wzOMkTn0HjzafWo7pRLHPbcwWJchK/jQ4=;
  b=Kn92j0YbWvcxxjzI2pmlNXX6JMXgYOG5wsdABJnrdXgyPV79aXe9j5aH
   QtxdjryDICNGt2vyj5wZ3IKQASS4xvHdraYz1z7iw5bk4+/dOlaBj9aYg
   bwjbPAo/EYos4qUtbQIvfeJIBj1nnmIULzfET+dMjyFnb5DEC9PzCibNW
   WIi9qyPbqp5HXgopK15si2HrzXD3HMWJ2T8ksz0CZes/6iRMekWQi1KEp
   mQcAEdOdi0FyY6FY8gnEPBFO0VKeI6B5B/J0vJCnNhD2ceGhK9WeM6A80
   TE7DaGS5TnvizEBbQRN5FYrXt0j1uu7yom6nQaB+mLQIbJ/XBW/pHVDnO
   Q==;
X-CSE-ConnectionGUID: I/qqeKt9TFye5w65GnP29g==
X-CSE-MsgGUID: 3YyhSeQXSWy0k8xH+3r07A==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730110"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="29730110"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:44 -0700
X-CSE-ConnectionGUID: hOYbmliQRwiIHuHW1cjqBA==
X-CSE-MsgGUID: tzMHbD0ISwqNgUTMWsnIYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22796530"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 11/17] ASoC: SOF: Intel: hda: move helper to static inline
Date: Tue,  2 Apr 2024 10:18:22 -0500
Message-Id: <20240402151828.175002-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AW7C32CUFA7NOVHP5FMRLK4OQDUBP2HT
X-Message-ID-Hash: AW7C32CUFA7NOVHP5FMRLK4OQDUBP2HT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AW7C32CUFA7NOVHP5FMRLK4OQDUBP2HT/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To allow using widget_to_sdev() in other files, move it as static inline
in shared header file.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 8 --------
 sound/soc/sof/intel/hda.h     | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 86c2325e5949..3f2fd84907d2 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -29,14 +29,6 @@ static bool hda_use_tplg_nhlt;
 module_param_named(sof_use_tplg_nhlt, hda_use_tplg_nhlt, bool, 0444);
 MODULE_PARM_DESC(sof_use_tplg_nhlt, "SOF topology nhlt override");
 
-static struct snd_sof_dev *widget_to_sdev(struct snd_soc_dapm_widget *w)
-{
-	struct snd_sof_widget *swidget = w->dobj.private;
-	struct snd_soc_component *component = swidget->scomp;
-
-	return snd_soc_component_get_drvdata(component);
-}
-
 int hda_dai_config(struct snd_soc_dapm_widget *w, unsigned int flags,
 		   struct snd_sof_dai_config_data *data)
 {
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index eedd03020889..c939a24d770e 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -1006,4 +1006,12 @@ int hda_dai_config(struct snd_soc_dapm_widget *w, unsigned int flags,
 int hda_link_dma_cleanup(struct snd_pcm_substream *substream, struct hdac_ext_stream *hext_stream,
 			 struct snd_soc_dai *cpu_dai);
 
+static inline struct snd_sof_dev *widget_to_sdev(struct snd_soc_dapm_widget *w)
+{
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct snd_soc_component *component = swidget->scomp;
+
+	return snd_soc_component_get_drvdata(component);
+}
+
 #endif
-- 
2.40.1


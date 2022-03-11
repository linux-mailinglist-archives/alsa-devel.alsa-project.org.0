Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E04C4D6495
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Mar 2022 16:29:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CEC3185D;
	Fri, 11 Mar 2022 16:28:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CEC3185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647012572;
	bh=ynmj/SGSLNPS1Axn7evAupAXAYelD/M4rNbpGZupXHM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iyL8uy4A39b24zwP6Ad2W47xHPxIOjVYRTNGdAZPV/VSWPxWZAiBR4MdVMn/rBrrp
	 IcIvanL9hAp6GePKmDiV6UDEKyZYWmBU73mQexosnCGfr3SnE/hg2SYOAxTddwk8wv
	 QRFKbUC1FxiYBO5NbNKXLGWVebaiSdy3mmTDAbUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD60AF8051A;
	Fri, 11 Mar 2022 16:27:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09C96F800D2; Fri, 11 Mar 2022 16:27:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D81EF800D2
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 16:27:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D81EF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hHb3vDwP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647012464; x=1678548464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ynmj/SGSLNPS1Axn7evAupAXAYelD/M4rNbpGZupXHM=;
 b=hHb3vDwP5F7Dz8PFAMm7lc5yN13ak5rWH3QPxIhtKxIgAoqkH/JYh4hA
 6Cam4bjPgUaVElN6o4qgRJlSicx+v3M61jb+OdYHJuCYRp2Jg+8B0mZSJ
 DznbEii+wkNjCMMcus1U9RmlITOA3IeayLYMNRCb8zo9HwWFPsaTENMcc
 0uKwW8g8C3ze1zS2FOszU4Y5H2SzfbwXEtfMHtRAcl0OQX61nTc3PIqvY
 kC4t5ytsGT3k9Xqb5SNPsHaUcDDGXhg+IG56JpyYcs2zC95ZGSSpx4vrO
 XeNtlO+8VezXQd9yjMSxGngDK7x9R/M5g5wgKn3BIvkqhfBRyzB7Az68x w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="318813297"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="318813297"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 07:27:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="514532710"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 11 Mar 2022 07:27:39 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 02/17] ASoC: Export DAI register and widget ctor and dctor
 functions
Date: Fri, 11 Mar 2022 16:35:29 +0100
Message-Id: <20220311153544.136854-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311153544.136854-1-cezary.rojewski@intel.com>
References: <20220311153544.136854-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

To allow for more flexibility i.e. populating component DAIs dynamically
during its initialization, without being limited to topology loading
procedure, expose snd_soc_register(), snd_soc_dapm_new_dai_widgets() and
snd_soc_dapm_free_widget() functions.

Allows users to first check available resources e.g. number of PCMs
supported by HDAudio codec before allocating the number of DAPM
widgets needed. This prevents superfluous objects from being created or
allows driver to adjust to situation when resources are limited.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc-dapm.h |  1 +
 sound/soc/soc-core.c     |  1 +
 sound/soc/soc-dapm.c     | 15 +++++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index c3039e97929a..ebb8e7a7fc29 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -429,6 +429,7 @@ struct snd_soc_dapm_widget *snd_soc_dapm_new_control_unlocked(
 		const struct snd_soc_dapm_widget *widget);
 int snd_soc_dapm_new_dai_widgets(struct snd_soc_dapm_context *dapm,
 				 struct snd_soc_dai *dai);
+void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w);
 int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card);
 void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card);
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 259429526c84..1f0564ed3a75 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2465,6 +2465,7 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 	dev_dbg(dev, "ASoC: Registered DAI '%s'\n", dai->name);
 	return dai;
 }
+EXPORT_SYMBOL_GPL(snd_soc_register_dai);
 
 /**
  * snd_soc_unregister_dais - Unregister DAIs from the ASoC core
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b06c5682445c..b435b5c4cfb7 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2484,6 +2484,12 @@ static void dapm_free_path(struct snd_soc_dapm_path *path)
 	kfree(path);
 }
 
+/**
+ * snd_soc_dapm_free_widget - Free specified widget
+ * @w: widget to free
+ *
+ * Removes widget from all paths and frees memory occupied by it.
+ */
 void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
 {
 	struct snd_soc_dapm_path *p, *next_p;
@@ -2506,6 +2512,7 @@ void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
 	kfree_const(w->sname);
 	kfree(w);
 }
+EXPORT_SYMBOL_GPL(snd_soc_dapm_free_widget);
 
 void snd_soc_dapm_reset_cache(struct snd_soc_dapm_context *dapm)
 {
@@ -4208,6 +4215,13 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 	return ERR_PTR(ret);
 }
 
+/**
+ * snd_soc_dapm_new_dai_widgets - Create new DAPM widgets
+ * @dapm: DAPM context
+ * @dai: parent DAI
+ *
+ * Returns 0 on success, error code otherwise.
+ */
 int snd_soc_dapm_new_dai_widgets(struct snd_soc_dapm_context *dapm,
 				 struct snd_soc_dai *dai)
 {
@@ -4253,6 +4267,7 @@ int snd_soc_dapm_new_dai_widgets(struct snd_soc_dapm_context *dapm,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(snd_soc_dapm_new_dai_widgets);
 
 int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card)
 {
-- 
2.25.1


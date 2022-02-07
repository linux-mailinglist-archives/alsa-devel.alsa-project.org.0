Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E9A4ABE7D
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 13:21:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10D6116C1;
	Mon,  7 Feb 2022 13:20:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10D6116C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644236461;
	bh=ynmj/SGSLNPS1Axn7evAupAXAYelD/M4rNbpGZupXHM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=emoqb+2dFvxoPWruD3NAS3NfowAsXdYrTgUG37tmWIDGs252cGE6RYtdYt4k/f8bG
	 XnUAxZC9q/EadEE9mq3kGraoL2BLQ2lYIlwLha0H2bE+KSJfjAJ04mzHbq/fVRO+Z7
	 b//2gw89mRSwkhFBVM1LaEo0IEnkZN41eUVf1O7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4BC2F80511;
	Mon,  7 Feb 2022 13:19:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CCB3F8023B; Mon,  7 Feb 2022 13:19:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FE07F8023B
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 13:19:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FE07F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IRlG+F5T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644236361; x=1675772361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ynmj/SGSLNPS1Axn7evAupAXAYelD/M4rNbpGZupXHM=;
 b=IRlG+F5TTxI1VjFON2BYpw2yBbvvXle2Ibl/T9BjEpTAVWuu/ziPzJ67
 u5cw+PWMn5aTSd67sWL3Iz5aE/smHwdBmESY7FDuOGhrYyQ9aXoC8idrB
 WSTKCqR0BdGzdgJDXa6PGv6qA1k9V2Lm/vlvueouUe+gGQON7YUM4ZIKz
 H2YJI2zgjimd11FfxB4mxaFkut3ByRAO59x6a+hQRDzuVeTKpL7ICjuSz
 B74JtddEb4yYhv6LfjUJA4aWItlInPIPFws2NfYaRej5XVo/fwVuDgswp
 2eyd/WQKM023Wg3W5Uw/LKiIykPbRq4Or3mwW8/eHld2TfGuJbFO1FPuF A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="248914783"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="248914783"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 04:18:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="525112410"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 07 Feb 2022 04:18:54 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/17] ASoC: Export DAI register and widget ctor and dctor
 functions
Date: Mon,  7 Feb 2022 13:20:53 +0100
Message-Id: <20220207122108.3780926-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207122108.3780926-1-cezary.rojewski@intel.com>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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


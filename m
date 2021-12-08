Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C97CD46D1D9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:14:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61FD61B0F;
	Wed,  8 Dec 2021 12:13:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61FD61B0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962064;
	bh=gjk7B51J3tOW5L2EIKP43EXNz1ChQ6qFBeZNpRkUhXs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CtoQ6F+Lw/+UhtbOY5B4FWLJpUgZnDeKavS5IV/ZxyNUQ4ErOgGwatCvcMZ3RxiqQ
	 hsPeztJkCFQMmKmD+uugTIZ3lX16J0FAXiLvVMSqWerT+uiy9beGEpGctmtBu7MHEl
	 sRuxbmx7o/i/u4QQn/FsMm0SXp2XyTn8QHXHyQy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D04CF80526;
	Wed,  8 Dec 2021 12:11:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB872F80525; Wed,  8 Dec 2021 12:11:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11769F804F3
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:11:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11769F804F3
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="301192833"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="301192833"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:11:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600104"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:11:06 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 06/37] ASoC: Export DAI register and widget ctor and dctor
 functions
Date: Wed,  8 Dec 2021 12:12:30 +0100
Message-Id: <20211208111301.1817725-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208111301.1817725-1-cezary.rojewski@intel.com>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 peter.ujfalusi@linux.intel.com, lma@semihalf.com
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
index e701a9ef5d66..2eb7d1594a60 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2466,6 +2466,7 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 	dev_dbg(dev, "ASoC: Registered DAI '%s'\n", dai->name);
 	return dai;
 }
+EXPORT_SYMBOL(snd_soc_register_dai);
 
 /**
  * snd_soc_unregister_dais - Unregister DAIs from the ASoC core
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b06c5682445c..ffcde54faeee 100644
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
+EXPORT_SYMBOL(snd_soc_dapm_new_dai_widgets);
 
 int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card)
 {
-- 
2.25.1


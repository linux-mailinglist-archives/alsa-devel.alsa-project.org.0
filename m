Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3051F7E47
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 23:02:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29E691689;
	Fri, 12 Jun 2020 23:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29E691689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591995737;
	bh=WnyIdlFvIkcnaoI9J+G0GG4hDBAomKzMVQn6+CwNKgI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MPXemeblLwWaooxaL/lHNBXIgzYOLOVOJTiaQA5g6K6blDn0J2uVMbOoEZN/eM2zF
	 Alt0LDnrirx6AIxzidOzH8So3r8/nKEeqru7ff8x44NO2gDV3HpkIBxqjFrivtPKCC
	 qhYuN9A9i+ZkQtY2QA3u31nMW2it5Y1f01gnrzsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A15C8F80252;
	Fri, 12 Jun 2020 22:59:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D4BFF800C7; Fri, 12 Jun 2020 22:59:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B8CAF800C7
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 22:59:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B8CAF800C7
IronPort-SDR: fzi9JO+s9JBOIakmPzSCrjpsTm1c7j4vydu3sDiJ1V9cm+jqaro76ZVvMMrefjLF5BPm+uwq75
 tieeqUG6nqpw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 13:59:42 -0700
IronPort-SDR: jhGeOHm4o7flSRKytD4hu7MVr3rQZjuWdlygXylAI8XsAR0YtmJ5x0cJAvN4ORh4Fmz3hIBNgS
 FRGWDMKPVYOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,504,1583222400"; d="scan'208";a="272026625"
Received: from tcampell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.137])
 by orsmga003.jf.intel.com with ESMTP; 12 Jun 2020 13:59:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: soc-devres: add devm_snd_soc_register_dai()
Date: Fri, 12 Jun 2020 15:59:37 -0500
Message-Id: <20200612205938.26415-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200612205938.26415-1-pierre-louis.bossart@linux.intel.com>
References: <20200612205938.26415-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The registration of DAIs may be done at two distinct times, once
during a component registration and later when loading a
topology. Since devm_ managed resources are freed in the reverse order
they were allocated, when a component starts unregistering DAIs by
walking through the DAI list, the memory allocated for the
topology-registered DAIs was freed already, which leads to 100%
reproducible KASAN use-after-free reports.

This patch suggests a new devm_ function to force the DAI list to be
updated prior to freeing the memory chunks referenced by the list
pointers.

BugLink: https://github.com/thesofproject/linux/issues/2186
Suggested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/soc.h    |  4 ++++
 sound/soc/soc-devres.c | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 828baea66b76..2756f9bcac3e 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1363,6 +1363,10 @@ void snd_soc_remove_pcm_runtime(struct snd_soc_card *card,
 struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 					 struct snd_soc_dai_driver *dai_drv,
 					 bool legacy_dai_naming);
+struct snd_soc_dai *devm_snd_soc_register_dai(struct device *dev,
+					      struct snd_soc_component *component,
+					      struct snd_soc_dai_driver *dai_drv,
+					      bool legacy_dai_naming);
 void snd_soc_unregister_dai(struct snd_soc_dai *dai);
 
 struct snd_soc_dai *snd_soc_find_dai(
diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index a9ea172a66a7..11e5d7962370 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -9,6 +9,43 @@
 #include <sound/soc.h>
 #include <sound/dmaengine_pcm.h>
 
+static void devm_dai_release(struct device *dev, void *res)
+{
+	snd_soc_unregister_dai(*(struct snd_soc_dai **)res);
+}
+
+/**
+ * devm_snd_soc_register_dai - resource-managed dai registration
+ * @dev: Device used to manage component
+ * @component: The component the DAIs are registered for
+ * @dai_drv: DAI driver to use for the DAI
+ * @legacy_dai_naming: if %true, use legacy single-name format;
+ *	if %false, use multiple-name format;
+ */
+struct snd_soc_dai *devm_snd_soc_register_dai(struct device *dev,
+					      struct snd_soc_component *component,
+					      struct snd_soc_dai_driver *dai_drv,
+					      bool legacy_dai_naming)
+{
+	struct snd_soc_dai **ptr;
+	struct snd_soc_dai *dai;
+
+	ptr = devres_alloc(devm_dai_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return NULL;
+
+	dai = snd_soc_register_dai(component, dai_drv, legacy_dai_naming);
+	if (dai) {
+		*ptr = dai;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return dai;
+}
+EXPORT_SYMBOL_GPL(devm_snd_soc_register_dai);
+
 static void devm_component_release(struct device *dev, void *res)
 {
 	snd_soc_unregister_component(*(struct device **)res);
-- 
2.20.1


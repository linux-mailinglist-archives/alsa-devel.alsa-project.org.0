Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5379D2347F6
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 16:44:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E6C31666;
	Fri, 31 Jul 2020 16:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E6C31666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596206660;
	bh=v/vAgybYL67NYukCozNn5D1Wxq1BYkBlpkqbATXombw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ko/fbEnTkyy5Z5QxiazPRmcON71LA0+mj9/0zWq0H+dWpUZNgdHFf5UTncNbcZQ+j
	 dUNSuIFJ+pFIXYz6OFMhs2E0SxCwXP5ib/ZAcT4JP1BgOhLYDCJvKUyWOFZFY3P/1N
	 b9TP4sDu4SYGDSlTTvduZ1GC6LwkGcUMRu9UwBlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B326F80171;
	Fri, 31 Jul 2020 16:42:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57F73F80161; Fri, 31 Jul 2020 16:42:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5785F80161
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 16:42:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5785F80161
IronPort-SDR: ru3X72X1J1dkjzLBxZAm9taQ/dlzbOkTceVxjIHGeHbtl1GoMP1gR6MLgCDkmrvP0BudylbeqI
 ife2bxPctJAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="131352446"
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="131352446"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 07:42:28 -0700
IronPort-SDR: kQUTzL6EESwGNehCuk8W8yZbBA+1qr+262UvCY9NDbaXFYIuGMWf1Zu2zjFfGcTQUwoWPxMl87
 rvd66Mv1wLQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="491505207"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 31 Jul 2020 07:42:25 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: core: Simplify snd_soc_component_initialize
 declaration
Date: Fri, 31 Jul 2020 16:41:45 +0200
Message-Id: <20200731144146.6678-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731144146.6678-1-cezary.rojewski@intel.com>
References: <20200731144146.6678-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lars@metafoo.de,
 olivier.moysan@st.com, alexandre.torgue@st.com, tiwai@suse.com,
 arnaud.pouliquen@st.com, lgirdwood@gmail.com, broonie@kernel.org,
 mcoquelin.stm32@gmail.com
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

Move 'name' field initialization responsibility back to
snd_soc_component_initialize to prepare snd_soc_add_component function
for being called separatelly as a second registration step.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h  |  2 +-
 sound/soc/soc-core.c | 18 ++++++++----------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 77a304d36c61..787374362f83 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -416,7 +416,7 @@ static inline int snd_soc_resume(struct device *dev)
 int snd_soc_poweroff(struct device *dev);
 int snd_soc_component_initialize(struct snd_soc_component *component,
 				 const struct snd_soc_component_driver *driver,
-				 struct device *dev, const char *name);
+				 struct device *dev);
 int snd_soc_add_component(struct device *dev,
 		struct snd_soc_component *component,
 		const struct snd_soc_component_driver *component_driver,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 236755c7a79e..f528367bc3be 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2443,14 +2443,19 @@ static void snd_soc_del_component_unlocked(struct snd_soc_component *component)
 
 int snd_soc_component_initialize(struct snd_soc_component *component,
 				 const struct snd_soc_component_driver *driver,
-				 struct device *dev, const char *name)
+				 struct device *dev)
 {
 	INIT_LIST_HEAD(&component->dai_list);
 	INIT_LIST_HEAD(&component->dobj_list);
 	INIT_LIST_HEAD(&component->card_list);
 	mutex_init(&component->io_mutex);
 
-	component->name		= name;
+	component->name = fmt_single_name(dev, &component->id);
+	if (!component->name) {
+		dev_err(dev, "ASoC: Failed to allocate name\n");
+		return -ENOMEM;
+	}
+
 	component->dev		= dev;
 	component->driver	= driver;
 
@@ -2464,19 +2469,12 @@ int snd_soc_add_component(struct device *dev,
 			struct snd_soc_dai_driver *dai_drv,
 			int num_dai)
 {
-	const char *name = fmt_single_name(dev, &component->id);
 	int ret;
 	int i;
 
-	if (!name) {
-		dev_err(dev, "ASoC: Failed to allocate name\n");
-		return -ENOMEM;
-	}
-
 	mutex_lock(&client_mutex);
 
-	ret = snd_soc_component_initialize(component, component_driver,
-					   dev, name);
+	ret = snd_soc_component_initialize(component, component_driver, dev);
 	if (ret)
 		goto err_free;
 
-- 
2.17.1


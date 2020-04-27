Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 864DB1BAE13
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 21:35:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BA5D168C;
	Mon, 27 Apr 2020 21:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BA5D168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588016102;
	bh=pPmrhtogYKTtF86SWYgNIwrEpIfv9P2OMMYOgj7ATXs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UTbDa3rpl1yaFOlH92vGNBaN+5HDSyrsSEOmanOT7AdppJXRoJD8ZyiCeazEEjCm5
	 S4m7N+f4Pap82vExH2S3slyOBqlbD4gopDEaiAzFd6/aNUC49LhXyLR0ZKDP8ZQ9PK
	 EkPD0A7LOBz2F9JeOIM4xK4yws2pFo1FyKz7l2rw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35A61F80112;
	Mon, 27 Apr 2020 21:33:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 513CCF8022B; Mon, 27 Apr 2020 21:33:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3227DF80113
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 21:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3227DF80113
IronPort-SDR: qSOZfv/QzCrc1kD09NYteBbXsgZeV5wpGICDYz5i3kWZb8EzyNt/ikajNpPwaHo8CapqMdBcYD
 CEB7vqX3qVCw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 12:33:06 -0700
IronPort-SDR: myd5VbH0OJSCCzzyp5/nFpi1+dqGAx+ELC0f0IIQsxBcwh+w1As/BuCqJsBMU0i/7WgrC5MMvG
 Pqill3uP++9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,325,1583222400"; d="scan'208";a="458502178"
Received: from dbombien-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.51.189])
 by fmsmga005.fm.intel.com with ESMTP; 27 Apr 2020 12:33:06 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: core: Make sure component driver names are unique
Date: Mon, 27 Apr 2020 12:33:06 -0700
Message-Id: <20200427193306.31198-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: broonie@kernel.org, kuninori.morimoto.gx@renesas.com
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

When registering a component, make sure that the driver names
are unique. This will ensure that the snd_soc_rtdcom_lookup()
function returns the right component based on the name.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/soc-core.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 8321e75ff244..00c1f8ce46af 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -286,14 +286,6 @@ struct snd_soc_component *snd_soc_rtdcom_lookup(struct snd_soc_pcm_runtime *rtd,
 	if (!driver_name)
 		return NULL;
 
-	/*
-	 * NOTE
-	 *
-	 * snd_soc_rtdcom_lookup() will find component from rtd by using
-	 * specified driver name.
-	 * But, if many components which have same driver name are connected
-	 * to 1 rtd, this function will return 1st found component.
-	 */
 	for_each_rtd_components(rtd, i, component) {
 		const char *component_name = component->driver->name;
 
@@ -2640,6 +2632,22 @@ int snd_soc_add_component(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_component);
 
+static bool
+snd_soc_component_driver_name_is_unique(const struct snd_soc_component_driver *component_driver)
+{
+	struct snd_soc_component *component;
+
+	mutex_lock(&client_mutex);
+	for_each_component(component)
+		if (!strcmp(component->driver->name, component_driver->name)) {
+			mutex_unlock(&client_mutex);
+			return false;
+		}
+
+	mutex_unlock(&client_mutex);
+	return true;
+}
+
 int snd_soc_register_component(struct device *dev,
 			const struct snd_soc_component_driver *component_driver,
 			struct snd_soc_dai_driver *dai_drv,
@@ -2647,6 +2655,13 @@ int snd_soc_register_component(struct device *dev,
 {
 	struct snd_soc_component *component;
 
+	if (component_driver->name &&
+	    !snd_soc_component_driver_name_is_unique(component_driver)) {
+		dev_err(dev, "component driver name %s is not unique\n",
+			component_driver->name);
+		return -EINVAL;
+	}
+
 	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
 	if (!component)
 		return -ENOMEM;
-- 
2.17.1


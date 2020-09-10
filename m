Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F13C265024
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 22:05:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E044B1675;
	Thu, 10 Sep 2020 22:04:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E044B1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599768326;
	bh=Xv+saT2B6I0S85FQru/9bt6bhfGNjM5blHXJvP2ry/4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y+VKilJ4wh3DHmoWOrYkagvL9M1js7sZZkWGpYAdoLpl9l/BeDRnyWRf2eBBypZPb
	 NXQKhKPmCt2iFLnKRI+XboK9sQk9MbOqauCCpYLqm7RgTS0PE2LjXZlKzagxvFNfJP
	 jCal5usJodqjOzgVy1aH3swRe/oCNAWjWIYnbj5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFE54F8010E;
	Thu, 10 Sep 2020 22:03:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E128F80264; Thu, 10 Sep 2020 22:03:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CD49F8010E
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 22:03:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CD49F8010E
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id 426C529B6F0
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 broonie@kernel.org
Subject: [PATCH] ASoC: core: Optionaly add the component driver name to the
 component name
Date: Thu, 10 Sep 2020 22:03:08 +0200
Message-Id: <20200910200308.9125-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, lgirdwood@gmail.com,
 dafna3@gmail.com, tiwai@suse.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, ranjani.sridharan@linux.intel.com,
 enric.balletbo@collabora.com, dmitry.baryshkov@linaro.org,
 kernel@collabora.com
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

The ASoC platform driver for Mediatek MT8173 registers
several components with identical name. This cause an
error:
"Directory '11220000.audio-controller' with parent 'mtk-rt5650' already present!"
when adding debugfs directory for those components.
To fix this, the function 'fmt_single_name' can receive the name
of the component driver and concatenate it to the name of the debugfs
directory for the component.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 sound/soc/soc-core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 74df22486e30..f470e713b030 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2227,7 +2227,7 @@ EXPORT_SYMBOL_GPL(snd_soc_unregister_card);
  * Simplify DAI link configuration by removing ".-1" from device names
  * and sanitizing names.
  */
-static char *fmt_single_name(struct device *dev, int *id)
+static char *fmt_single_name(struct device *dev, int *id, const char *component_driver_name)
 {
 	const char *devname = dev_name(dev);
 	char *found, *name;
@@ -2263,6 +2263,12 @@ static char *fmt_single_name(struct device *dev, int *id)
 		*id = 0;
 	}
 
+	if (component_driver_name) {
+		char *tmp = name;
+
+		name = devm_kasprintf(dev, GFP_KERNEL, "%s-%s", name, component_driver_name);
+		devm_kfree(dev, tmp);
+	}
 	return name;
 }
 
@@ -2327,7 +2333,7 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 	 */
 	if (legacy_dai_naming &&
 	    (dai_drv->id == 0 || dai_drv->name == NULL)) {
-		dai->name = fmt_single_name(dev, &dai->id);
+		dai->name = fmt_single_name(dev, &dai->id, NULL);
 	} else {
 		dai->name = fmt_multiple_name(dev, dai_drv);
 		if (dai_drv->id)
@@ -2460,7 +2466,7 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 	INIT_LIST_HEAD(&component->card_list);
 	mutex_init(&component->io_mutex);
 
-	component->name = fmt_single_name(dev, &component->id);
+	component->name = fmt_single_name(dev, &component->id, driver->name);
 	if (!component->name) {
 		dev_err(dev, "ASoC: Failed to allocate name\n");
 		return -ENOMEM;
-- 
2.17.1


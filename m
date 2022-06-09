Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA61544DDB
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 15:38:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE38E1AF8;
	Thu,  9 Jun 2022 15:38:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE38E1AF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654781934;
	bh=ifemrvuZbS2YcJbpDgxIZ0DM/6fgabIxhHx+XsW3DzI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y9qgo/Oh+wPwUvfcK8HddfmGWWLIKmSAm9JUzh82qKfE3VtL0zzbe+xaQxjVLBZ4M
	 8vQoZ8ObxOAjwBjwPeHBQG/twGcyihNAUxN6RfAZz00ohCvqhrjMUEsl91SpOsGMo6
	 JQxN+oBgxGPTQk/T+axV3w8ap2D0PHSXwWe54LxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB228F80552;
	Thu,  9 Jun 2022 15:36:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1264FF8053D; Thu,  9 Jun 2022 15:36:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03D2DF8019D
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 15:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03D2DF8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JpTCk0qO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654781754; x=1686317754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ifemrvuZbS2YcJbpDgxIZ0DM/6fgabIxhHx+XsW3DzI=;
 b=JpTCk0qO916h8+T070XkkAIABTokmOh1UAeFrXNBgMWAqba/v4ktA6Th
 Cvb/T+0OAdXpWtmN3LxwoVoe5QFGEJlcoHl8rVJBhzp3VeotfamVzjsxD
 oRvVTgfoWDtkGn4YsjFVl2T98ovye4KkAHbe/mOP5ClmO8AVpzkt2y8pQ
 K9cSixzfSL6Zv+ol1xLH4WyjBrcZ7v24q6btHqEzRMT6rJTKa7Q0YmVtb
 MYOxlU3HHrkGxP4t37y0vwdJGacGgWkrfcA1tO9GqJdoMphrQIM8WUB70
 HFYNf5r2gOIAxdcDKzvVAU53iGDbluiE7pHdsfeST4zvj1QFeEeaL12xi A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="266061405"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="266061405"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 06:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="683966163"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2022 06:35:50 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 06/11] ASoC: codecs: rt298: Move irq registration and cleanup
Date: Thu,  9 Jun 2022 15:35:36 +0200
Message-Id: <20220609133541.3984886-7-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
References: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

Currently irq is registered when i2c driver is loaded, it is unnecessary
when component is unused. Initialize irq only when we probe ASoC
component.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt298.c | 43 +++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 1a27e5e63289..078810f2ec7b 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -1009,13 +1009,22 @@ static irqreturn_t rt298_irq(int irq, void *data)
 static int rt298_probe(struct snd_soc_component *component)
 {
 	struct rt298_priv *rt298 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	rt298->component = component;
 	INIT_DELAYED_WORK(&rt298->jack_detect_work, rt298_jack_detect_work);
 
-	if (rt298->i2c->irq)
-		schedule_delayed_work(&rt298->jack_detect_work,
-				      msecs_to_jiffies(1250));
+	if (rt298->i2c->irq) {
+		ret = request_threaded_irq(rt298->i2c->irq, NULL, rt298_irq,
+					   IRQF_TRIGGER_HIGH | IRQF_ONESHOT, "rt298", rt298);
+		if (ret) {
+			dev_err(&rt298->i2c->dev, "Failed to reguest IRQ: %d\n", ret);
+			return ret;
+		}
+
+		schedule_delayed_work(&rt298->jack_detect_work, msecs_to_jiffies(1250));
+	}
+
 	return 0;
 }
 
@@ -1023,7 +1032,12 @@ static void rt298_remove(struct snd_soc_component *component)
 {
 	struct rt298_priv *rt298 = snd_soc_component_get_drvdata(component);
 
-	cancel_delayed_work_sync(&rt298->jack_detect_work);
+	if (rt298->i2c->irq) {
+		cancel_delayed_work_sync(&rt298->jack_detect_work);
+
+		disable_irq(rt298->i2c->irq);
+		free_irq(rt298->i2c->irq, rt298);
+	}
 }
 
 #ifdef CONFIG_PM
@@ -1275,16 +1289,6 @@ static int rt298_i2c_probe(struct i2c_client *i2c)
 
 	rt298->is_hp_in = -1;
 
-	if (rt298->i2c->irq) {
-		ret = request_threaded_irq(rt298->i2c->irq, NULL, rt298_irq,
-			IRQF_TRIGGER_HIGH | IRQF_ONESHOT, "rt298", rt298);
-		if (ret != 0) {
-			dev_err(&i2c->dev,
-				"Failed to reguest IRQ: %d\n", ret);
-			return ret;
-		}
-	}
-
 	ret = devm_snd_soc_register_component(&i2c->dev,
 				     &soc_component_dev_rt298,
 				     rt298_dai, ARRAY_SIZE(rt298_dai));
@@ -1292,17 +1296,6 @@ static int rt298_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
-static int rt298_i2c_remove(struct i2c_client *i2c)
-{
-	struct rt298_priv *rt298 = i2c_get_clientdata(i2c);
-
-	if (i2c->irq)
-		free_irq(i2c->irq, rt298);
-
-	return 0;
-}
-
-
 static struct i2c_driver rt298_i2c_driver = {
 	.driver = {
 		   .name = "rt298",
-- 
2.25.1


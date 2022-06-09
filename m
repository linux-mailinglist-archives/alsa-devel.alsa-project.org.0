Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C82544DD8
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 15:38:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FE181A9F;
	Thu,  9 Jun 2022 15:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FE181A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654781903;
	bh=eArE8WoqidIymkaFaEff+cQsFtCZvNeJ0MK1qIZTf4U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W6ecacUwYlB1qu0wViWG3c6BeM9ZQOLEyObIgH7yQimYgYlYZa3mXsim8A0eNakFz
	 CGHOoBmqmNZLI1jAFnrkp+Tga6GVWmIVjbJq/00oitl9BdaEbv3xbUYqKHWtKt7NPD
	 6gRzTWCFIiqmF9BR9r6QRQ573kFmYtQjjMkv8pJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B67AF80542;
	Thu,  9 Jun 2022 15:36:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FA05F80538; Thu,  9 Jun 2022 15:35:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC212F800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 15:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC212F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HXCMMEXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654781752; x=1686317752;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eArE8WoqidIymkaFaEff+cQsFtCZvNeJ0MK1qIZTf4U=;
 b=HXCMMEXJ4lt9XHNzmm4DJf9s/jDrdVJZsNDDcCQZLJBVJLgxIVef/wME
 ghFe2TOpbGAp0sFw5k+e1ZqvBgOvRa0nX5JzXYnE01W8p1iB4XESWpycg
 6Zw97VSltdwLyO75k7316BiL0ma6kS3WdDIEK4pcVg4rJJcUCxJaCHNcv
 rcUelHCmGb6EeB02CmdYCIzR0ZbxlJ0wMgbalfIArgD6JQFKn9Wr+kf//
 v8iDchf//Kn5xAH/q/a3wTCqvVfP4gR6RSv9/AnOKgmSX4vIrHurfbNL2
 E+uFH7MoxMhgMdjbkfw/ZyBqiGFEsIrB1enk/YhH34BNmLinv6MpS5TTw g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="266061400"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="266061400"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 06:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="683966159"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2022 06:35:48 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 05/11] ASoC: codecs: rt286: Move irq registration and cleanup
Date: Thu,  9 Jun 2022 15:35:35 +0200
Message-Id: <20220609133541.3984886-6-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/codecs/rt286.c | 44 ++++++++++++++++------------------------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index 0534a073ee69..02a41c915776 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -945,13 +945,22 @@ static irqreturn_t rt286_irq(int irq, void *data)
 static int rt286_probe(struct snd_soc_component *component)
 {
 	struct rt286_priv *rt286 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	rt286->component = component;
 	INIT_DELAYED_WORK(&rt286->jack_detect_work, rt286_jack_detect_work);
 
-	if (rt286->i2c->irq)
-		schedule_delayed_work(&rt286->jack_detect_work,
-				      msecs_to_jiffies(50));
+	if (rt286->i2c->irq) {
+		ret = request_threaded_irq(rt286->i2c->irq, NULL, rt286_irq,
+					   IRQF_TRIGGER_HIGH | IRQF_ONESHOT, "rt286", rt286);
+		if (ret) {
+			dev_err(&rt286->i2c->dev, "Failed to reguest IRQ: %d\n", ret);
+			return ret;
+		}
+
+		schedule_delayed_work(&rt286->jack_detect_work, msecs_to_jiffies(50));
+	}
+
 	return 0;
 }
 
@@ -959,7 +968,12 @@ static void rt286_remove(struct snd_soc_component *component)
 {
 	struct rt286_priv *rt286 = snd_soc_component_get_drvdata(component);
 
-	cancel_delayed_work_sync(&rt286->jack_detect_work);
+	if (rt286->i2c->irq) {
+		cancel_delayed_work_sync(&rt286->jack_detect_work);
+
+		disable_irq(rt286->i2c->irq);
+		free_irq(rt286->i2c->irq, rt286);
+	}
 }
 
 #ifdef CONFIG_PM
@@ -1232,16 +1246,6 @@ static int rt286_i2c_probe(struct i2c_client *i2c)
 			RT286_GPIO_CTRL, 0xc, 0x8);
 	}
 
-	if (rt286->i2c->irq) {
-		ret = request_threaded_irq(rt286->i2c->irq, NULL, rt286_irq,
-			IRQF_TRIGGER_HIGH | IRQF_ONESHOT, "rt286", rt286);
-		if (ret != 0) {
-			dev_err(&i2c->dev,
-				"Failed to reguest IRQ: %d\n", ret);
-			return ret;
-		}
-	}
-
 	ret = devm_snd_soc_register_component(&i2c->dev,
 				     &soc_component_dev_rt286,
 				     rt286_dai, ARRAY_SIZE(rt286_dai));
@@ -1249,24 +1253,12 @@ static int rt286_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
-static int rt286_i2c_remove(struct i2c_client *i2c)
-{
-	struct rt286_priv *rt286 = i2c_get_clientdata(i2c);
-
-	if (i2c->irq)
-		free_irq(i2c->irq, rt286);
-
-	return 0;
-}
-
-
 static struct i2c_driver rt286_i2c_driver = {
 	.driver = {
 		   .name = "rt286",
 		   .acpi_match_table = ACPI_PTR(rt286_acpi_match),
 		   },
 	.probe_new = rt286_i2c_probe,
-	.remove = rt286_i2c_remove,
 	.id_table = rt286_i2c_id,
 };
 
-- 
2.25.1


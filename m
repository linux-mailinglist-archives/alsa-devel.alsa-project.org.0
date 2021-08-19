Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AF03F205E
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 21:08:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE4BC1679;
	Thu, 19 Aug 2021 21:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE4BC1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629400080;
	bh=1d0+blJ8kBwyCYKuIU0a5Te5tT2y+QAWc3DyBdiAEbU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r8e0vhvI5xc+kBNe558Fz7yPVaoKrICEVdQJYlz3yzeAn8udV65K0gRCVgDOyFW7w
	 AQ2cB+useeShPSnjqsRUgkDHacM8DJJpT557IUNzgYJXx/ZIy3wkEgv81fwa/9kCuC
	 qzzPVNIOQiqbRLFPKK5w2n8IXLj04n+c0zIj5hVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D33EF804EB;
	Thu, 19 Aug 2021 21:06:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59EA1F804E2; Thu, 19 Aug 2021 21:06:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B12AF800EC
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 21:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B12AF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="LTybvsZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629399955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n6mHveelyBZT8yfaE5lfT5+gFFO9U0+6Kcsbi23NVU8=;
 b=LTybvsZclepS1zGcTnvHRSKPuklY0AvHuqGoDKxrj9tgCL1iqRHOV+9Zf1OSD2Atzq8Tmh
 FO3QqKHMhD6/rEUT21GKcbSVoTqz13tKggCl+XDUbW6Ek34Q5asfWdENzVE1tJRZE4YVeA
 +y2H6e/zt3MwxOVoEPV5L/o4aXYbdKc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-HegazKsVO0WTymhdQzCm6A-1; Thu, 19 Aug 2021 15:05:54 -0400
X-MC-Unique: HegazKsVO0WTymhdQzCm6A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47BF8801B3C;
 Thu, 19 Aug 2021 19:05:53 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97972163C9;
 Thu, 19 Aug 2021 19:05:51 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 3/6] ASoC: rt5640: Add optional hp_det_gpio parameter to
 rt5640_detect_headset()
Date: Thu, 19 Aug 2021 21:05:40 +0200
Message-Id: <20210819190543.784415-4-hdegoede@redhat.com>
In-Reply-To: <20210819190543.784415-1-hdegoede@redhat.com>
References: <20210819190543.784415-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Bard Liao <bard.liao@intel.com>
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

Some devices don't use the builtin jack-detect but can still benefit
from the mic-bias-current over-current-detection headphones vs
headset detection done by rt5640_detect_headset().

In this case the jack-inserted check done by rt5640_detect_headset()
needs to be done through a GPIO rather then by using the codec's
builtin jack-detect. Add an optional hp_det_gpio parameter and export
rt5640_detect_headset() for use on machines where jack-detect is
handled outside of the codec.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 14 ++++++++++----
 sound/soc/codecs/rt5640.h |  2 ++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index d32e9d69231c..04820af03ae8 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2241,7 +2241,7 @@ static void rt5640_button_press_work(struct work_struct *work)
 	schedule_delayed_work(&rt5640->bp_work, msecs_to_jiffies(BP_POLL_TIME));
 }
 
-static int rt5640_detect_headset(struct snd_soc_component *component)
+int rt5640_detect_headset(struct snd_soc_component *component, struct gpio_desc *hp_det_gpio)
 {
 	int i, headset_count = 0, headphone_count = 0;
 
@@ -2259,8 +2259,13 @@ static int rt5640_detect_headset(struct snd_soc_component *component)
 		msleep(JACK_SETTLE_TIME);
 
 		/* Check the jack is still connected before checking ovcd */
-		if (!rt5640_jack_inserted(component))
-			return 0;
+		if (hp_det_gpio) {
+			if (gpiod_get_value_cansleep(hp_det_gpio))
+				return 0;
+		} else {
+			if (!rt5640_jack_inserted(component))
+				return 0;
+		}
 
 		if (rt5640_micbias1_ovcd(component)) {
 			/*
@@ -2285,6 +2290,7 @@ static int rt5640_detect_headset(struct snd_soc_component *component)
 	dev_err(component->dev, "Error detecting headset vs headphones, bad contact?, assuming headphones\n");
 	return SND_JACK_HEADPHONE;
 }
+EXPORT_SYMBOL_GPL(rt5640_detect_headset);
 
 static void rt5640_jack_work(struct work_struct *work)
 {
@@ -2309,7 +2315,7 @@ static void rt5640_jack_work(struct work_struct *work)
 		/* Jack inserted */
 		WARN_ON(rt5640->ovcd_irq_enabled);
 		rt5640_enable_micbias1_for_ovcd(component);
-		status = rt5640_detect_headset(component);
+		status = rt5640_detect_headset(component, NULL);
 		if (status == SND_JACK_HEADSET) {
 			/* Enable ovcd IRQ for button press detect. */
 			rt5640_enable_micbias1_ovcd_irq(component);
diff --git a/sound/soc/codecs/rt5640.h b/sound/soc/codecs/rt5640.h
index 4fd47f2b936b..4d19997dd684 100644
--- a/sound/soc/codecs/rt5640.h
+++ b/sound/soc/codecs/rt5640.h
@@ -10,6 +10,7 @@
 #define _RT5640_H
 
 #include <linux/clk.h>
+#include <linux/gpio/consumer.h>
 #include <linux/workqueue.h>
 #include <dt-bindings/sound/rt5640.h>
 
@@ -2156,5 +2157,6 @@ int rt5640_dmic_enable(struct snd_soc_component *component,
 		       bool dmic1_data_pin, bool dmic2_data_pin);
 int rt5640_sel_asrc_clk_src(struct snd_soc_component *component,
 		unsigned int filter_mask, unsigned int clk_src);
+int rt5640_detect_headset(struct snd_soc_component *component, struct gpio_desc *hp_det_gpio);
 
 #endif
-- 
2.31.1


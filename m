Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D53ECA18
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Aug 2021 17:53:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FB96170E;
	Sun, 15 Aug 2021 17:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FB96170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629042820;
	bh=hvga+axJWJqW9+VOFG8Gzi85sLaYYZ0kCtX/hMc8M5A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TL26n9kEI32xsMWA6v78IncfqK4DykelaIjan5U4dG2RhgOO1u9NlJX3SDklXqcQ6
	 2/TbuDiSC448bRcMx066WByHX6DtcIfxaJxzt3nP1OsD/Eo2PqEdQOJn5s32ahYKnN
	 fza+H/8FYGB3MT4ysID7IojLtZ3R99Z0t2n9NHeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA8F5F804E2;
	Sun, 15 Aug 2021 17:51:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD853F80302; Sun, 15 Aug 2021 17:51:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96BAFF8026D
 for <alsa-devel@alsa-project.org>; Sun, 15 Aug 2021 17:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96BAFF8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="fyoT1p1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629042590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9SHT6FFBsUwKLbgwGehf0AwT5WuSAIlWg7kSEwZuUP8=;
 b=fyoT1p1UzQUMjzuanauICS2CKqR92qB0+HkVHytIJn0eU5hz7WpmhYGMJYenmmSgZNcEW6
 npodP1TeBKRczwJxHvqT/McWP/UwYUqIqpYvExPcmkeR1RFw3tdILIxSi1CHMaB8vxuBwD
 An//Wtkpt9nArrIBcwx6aAyRcUcPpUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-U4DQ8zQsNtyRzF3G3mZEBw-1; Sun, 15 Aug 2021 11:49:49 -0400
X-MC-Unique: U4DQ8zQsNtyRzF3G3mZEBw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F8231F2D9;
 Sun, 15 Aug 2021 15:49:47 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7D0260871;
 Sun, 15 Aug 2021 15:49:45 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/5] ASoC: rt5640: Add rt5640_set_ovcd_params() helper
Date: Sun, 15 Aug 2021 17:49:34 +0200
Message-Id: <20210815154935.101178-5-hdegoede@redhat.com>
In-Reply-To: <20210815154935.101178-1-hdegoede@redhat.com>
References: <20210815154935.101178-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
from the mic-bias-current over-current-detection to differentiate
between headphones vs a headset.

Move the ovcd init code from rt5640_enable_jack_detect() into a new
rt5640_set_ovcd_params() helper and export this helper as well
as a couple of related ovcd functions.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 50 +++++++++++++++++++++++----------------
 sound/soc/codecs/rt5640.h |  4 ++++
 2 files changed, 34 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 04820af03ae8..cd1db5caabad 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2093,7 +2093,7 @@ int rt5640_sel_asrc_clk_src(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(rt5640_sel_asrc_clk_src);
 
-static void rt5640_enable_micbias1_for_ovcd(struct snd_soc_component *component)
+void rt5640_enable_micbias1_for_ovcd(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 
@@ -2105,8 +2105,9 @@ static void rt5640_enable_micbias1_for_ovcd(struct snd_soc_component *component)
 	snd_soc_dapm_sync_unlocked(dapm);
 	snd_soc_dapm_mutex_unlock(dapm);
 }
+EXPORT_SYMBOL_GPL(rt5640_enable_micbias1_for_ovcd);
 
-static void rt5640_disable_micbias1_for_ovcd(struct snd_soc_component *component)
+void rt5640_disable_micbias1_for_ovcd(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 
@@ -2117,6 +2118,7 @@ static void rt5640_disable_micbias1_for_ovcd(struct snd_soc_component *component
 	snd_soc_dapm_sync_unlocked(dapm);
 	snd_soc_dapm_mutex_unlock(dapm);
 }
+EXPORT_SYMBOL_GPL(rt5640_disable_micbias1_for_ovcd);
 
 static void rt5640_enable_micbias1_ovcd_irq(struct snd_soc_component *component)
 {
@@ -2368,6 +2370,31 @@ static void rt5640_cancel_work(void *data)
 	cancel_delayed_work_sync(&rt5640->bp_work);
 }
 
+void rt5640_set_ovcd_params(struct snd_soc_component *component)
+{
+	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
+
+	snd_soc_component_write(component, RT5640_PR_BASE + RT5640_BIAS_CUR4,
+		0xa800 | rt5640->ovcd_sf);
+
+	snd_soc_component_update_bits(component, RT5640_MICBIAS,
+		RT5640_MIC1_OVTH_MASK | RT5640_MIC1_OVCD_MASK,
+		rt5640->ovcd_th | RT5640_MIC1_OVCD_EN);
+
+	/*
+	 * The over-current-detect is only reliable in detecting the absence
+	 * of over-current, when the mic-contact in the jack is short-circuited,
+	 * the hardware periodically retries if it can apply the bias-current
+	 * leading to the ovcd status flip-flopping 1-0-1 with it being 0 about
+	 * 10% of the time, as we poll the ovcd status bit we might hit that
+	 * 10%, so we enable sticky mode and when checking OVCD we clear the
+	 * status, msleep() a bit and then check to get a reliable reading.
+	 */
+	snd_soc_component_update_bits(component, RT5640_IRQ_CTRL2,
+		RT5640_MB1_OC_STKY_MASK, RT5640_MB1_OC_STKY_EN);
+}
+EXPORT_SYMBOL_GPL(rt5640_set_ovcd_params);
+
 static void rt5640_disable_jack_detect(struct snd_soc_component *component)
 {
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
@@ -2415,24 +2442,7 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 	/* Enabling jd2 in general control 2 */
 	snd_soc_component_write(component, RT5640_DUMMY2, 0x4001);
 
-	snd_soc_component_write(component, RT5640_PR_BASE + RT5640_BIAS_CUR4,
-		0xa800 | rt5640->ovcd_sf);
-
-	snd_soc_component_update_bits(component, RT5640_MICBIAS,
-		RT5640_MIC1_OVTH_MASK | RT5640_MIC1_OVCD_MASK,
-		rt5640->ovcd_th | RT5640_MIC1_OVCD_EN);
-
-	/*
-	 * The over-current-detect is only reliable in detecting the absence
-	 * of over-current, when the mic-contact in the jack is short-circuited,
-	 * the hardware periodically retries if it can apply the bias-current
-	 * leading to the ovcd status flip-flopping 1-0-1 with it being 0 about
-	 * 10% of the time, as we poll the ovcd status bit we might hit that
-	 * 10%, so we enable sticky mode and when checking OVCD we clear the
-	 * status, msleep() a bit and then check to get a reliable reading.
-	 */
-	snd_soc_component_update_bits(component, RT5640_IRQ_CTRL2,
-		RT5640_MB1_OC_STKY_MASK, RT5640_MB1_OC_STKY_EN);
+	rt5640_set_ovcd_params(component);
 
 	/*
 	 * All IRQs get or-ed together, so we need the jack IRQ to report 0
diff --git a/sound/soc/codecs/rt5640.h b/sound/soc/codecs/rt5640.h
index 4d19997dd684..2c28f83e338a 100644
--- a/sound/soc/codecs/rt5640.h
+++ b/sound/soc/codecs/rt5640.h
@@ -2157,6 +2157,10 @@ int rt5640_dmic_enable(struct snd_soc_component *component,
 		       bool dmic1_data_pin, bool dmic2_data_pin);
 int rt5640_sel_asrc_clk_src(struct snd_soc_component *component,
 		unsigned int filter_mask, unsigned int clk_src);
+
+void rt5640_set_ovcd_params(struct snd_soc_component *component);
+void rt5640_enable_micbias1_for_ovcd(struct snd_soc_component *component);
+void rt5640_disable_micbias1_for_ovcd(struct snd_soc_component *component);
 int rt5640_detect_headset(struct snd_soc_component *component, struct gpio_desc *hp_det_gpio);
 
 #endif
-- 
2.31.1


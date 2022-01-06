Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 142AA486368
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 12:04:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1BB01866;
	Thu,  6 Jan 2022 12:03:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1BB01866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641467054;
	bh=ZNEyyvBuyzO593IUvbIXmqLPbL8ekFsJMJ+TwDf0bws=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qkYn3weGV+p1GEnQgIgOxGCzTyzrF4QuCuIt7ygUqVqSBZdDgL6o+El80JQIg5Ipt
	 RHbE5zsHhKdotoldIRvMyCd5eE9aS+rrDgEccyoSJGPUWtBif4NfTG2kUf0b06LLbB
	 Xt8SP8aEDXCoHRuJHgsNYHg3kbu1mpjyo13Mi4og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D062F80519;
	Thu,  6 Jan 2022 12:01:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2E84F804FE; Thu,  6 Jan 2022 12:01:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75594F8019D
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 12:01:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75594F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="iZCPO9cl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641466905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nld+KLMNEF6aXZ0nwEYKhirK7j+HHGUB0ZghppeBscw=;
 b=iZCPO9cliiS2jo0m2o8NTjJ+Vl95XhWg1QM6e8Mdnt4+83bzXyqxQbU2pstP6m/DSqIJ5x
 SGFAcQjT2CfcoP+4oD4AIUNpMuV906l3CgT3BC8GNXWi/RYxAeQvb7quyz8jOcjhJz7Mfs
 2E/LZYZsPCnWuI97+db223bID2+3RbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-KCSAqL5NNWivC9dD29dXow-1; Thu, 06 Jan 2022 06:01:42 -0500
X-MC-Unique: KCSAqL5NNWivC9dD29dXow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D52FB8042E1;
 Thu,  6 Jan 2022 11:01:40 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03D187E125;
 Thu,  6 Jan 2022 11:01:38 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 4/6] ASoC: rt5640: Add support for boards with an external
 jack-detect GPIO
Date: Thu,  6 Jan 2022 12:01:26 +0100
Message-Id: <20220106110128.66049-5-hdegoede@redhat.com>
In-Reply-To: <20220106110128.66049-1-hdegoede@redhat.com>
References: <20220106110128.66049-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, Bard Liao <bard.liao@intel.com>
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

Some boards have the codec IRQ hooked-up as normally, so the driver can
still do things like headset vs headphones and button-press detection,
but instead of using one of the JD pins of the codec, an external GPIO
is used to report the jack-presence switch status of the jack.

Add support for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 45 +++++++++++++++++++++++++++++++++++----
 sound/soc/codecs/rt5640.h |  5 +++++
 2 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index fabc6e44b4a6..e7a82565b905 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2160,7 +2160,11 @@ static bool rt5640_jack_inserted(struct snd_soc_component *component)
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
 	int val;
 
-	val = snd_soc_component_read(component, RT5640_INT_IRQ_ST);
+	if (rt5640->jd_gpio)
+		val = gpiod_get_value(rt5640->jd_gpio) ? RT5640_JD_STATUS : 0;
+	else
+		val = snd_soc_component_read(component, RT5640_INT_IRQ_ST);
+
 	dev_dbg(component->dev, "irq status %#04x\n", val);
 
 	if (rt5640->jd_inverted)
@@ -2395,6 +2399,16 @@ static irqreturn_t rt5640_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t rt5640_jd_gpio_irq(int irq, void *data)
+{
+	struct rt5640_priv *rt5640 = data;
+
+	queue_delayed_work(system_long_wq, &rt5640->jack_work,
+			   msecs_to_jiffies(JACK_SETTLE_TIME));
+
+	return IRQ_HANDLED;
+}
+
 static void rt5640_cancel_work(void *data)
 {
 	struct rt5640_priv *rt5640 = data;
@@ -2439,7 +2453,12 @@ static void rt5640_disable_jack_detect(struct snd_soc_component *component)
 	if (!rt5640->jack)
 		return;
 
-	free_irq(rt5640->irq, rt5640);
+	if (rt5640->jd_gpio_irq_requested)
+		free_irq(rt5640->jd_gpio_irq, rt5640);
+
+	if (rt5640->irq_requested)
+		free_irq(rt5640->irq, rt5640);
+
 	rt5640_cancel_work(rt5640);
 
 	if (rt5640->jack->status & SND_JACK_MICROPHONE) {
@@ -2448,6 +2467,9 @@ static void rt5640_disable_jack_detect(struct snd_soc_component *component)
 		snd_soc_jack_report(rt5640->jack, 0, SND_JACK_BTN_0);
 	}
 
+	rt5640->jd_gpio_irq_requested = false;
+	rt5640->irq_requested = false;
+	rt5640->jd_gpio = NULL;
 	rt5640->jack = NULL;
 }
 
@@ -2500,16 +2522,31 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 	if (jack_data && jack_data->codec_irq_override)
 		rt5640->irq = jack_data->codec_irq_override;
 
+	if (jack_data && jack_data->jd_gpio) {
+		rt5640->jd_gpio = jack_data->jd_gpio;
+		rt5640->jd_gpio_irq = gpiod_to_irq(rt5640->jd_gpio);
+
+		ret = request_irq(rt5640->jd_gpio_irq, rt5640_jd_gpio_irq,
+				  IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
+				  "rt5640-jd-gpio", rt5640);
+		if (ret) {
+			dev_warn(component->dev, "Failed to request jd GPIO IRQ %d: %d\n",
+				 rt5640->jd_gpio_irq, ret);
+			rt5640_disable_jack_detect(component);
+			return;
+		}
+		rt5640->jd_gpio_irq_requested = true;
+	}
+
 	ret = request_irq(rt5640->irq, rt5640_irq,
 			  IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 			  "rt5640", rt5640);
 	if (ret) {
 		dev_warn(component->dev, "Failed to reguest IRQ %d: %d\n", rt5640->irq, ret);
-		rt5640->irq = -ENXIO;
-		/* Undo above settings */
 		rt5640_disable_jack_detect(component);
 		return;
 	}
+	rt5640->irq_requested = true;
 
 	/* sync initial jack state */
 	queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
diff --git a/sound/soc/codecs/rt5640.h b/sound/soc/codecs/rt5640.h
index 2f4da5a8ecb2..9e49b9a0ccaa 100644
--- a/sound/soc/codecs/rt5640.h
+++ b/sound/soc/codecs/rt5640.h
@@ -2124,6 +2124,7 @@ struct rt5640_priv {
 
 	int ldo1_en; /* GPIO for LDO1_EN */
 	int irq;
+	int jd_gpio_irq;
 	int sysclk;
 	int sysclk_src;
 	int lrck[RT5640_AIFS];
@@ -2136,6 +2137,8 @@ struct rt5640_priv {
 
 	bool hp_mute;
 	bool asrc_en;
+	bool irq_requested;
+	bool jd_gpio_irq_requested;
 
 	/* Jack and button detect data */
 	bool ovcd_irq_enabled;
@@ -2147,6 +2150,7 @@ struct rt5640_priv {
 	struct delayed_work bp_work;
 	struct delayed_work jack_work;
 	struct snd_soc_jack *jack;
+	struct gpio_desc *jd_gpio;
 	unsigned int jd_src;
 	bool jd_inverted;
 	unsigned int ovcd_th;
@@ -2155,6 +2159,7 @@ struct rt5640_priv {
 
 struct rt5640_set_jack_data {
 	int codec_irq_override;
+	struct gpio_desc *jd_gpio;
 };
 
 int rt5640_dmic_enable(struct snd_soc_component *component,
-- 
2.33.1


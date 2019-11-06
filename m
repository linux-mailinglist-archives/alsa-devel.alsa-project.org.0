Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F03BF0B95
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 02:19:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F9E216D8;
	Wed,  6 Nov 2019 02:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F9E216D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573003191;
	bh=ytNoRGk7DttnSaqcWSr+z1AThvL+nZz4TcpfMsl1uVQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WK4h30NWrQfRUEW/vFTwA4rBGTOG8/DTMtRP/SCueyTJpN9Wu7ANg9294spnNhFnB
	 o2cc4BhrWhrdVkaaCiDXLaDreV636Eh3vaaBFHBLwSRtbbMfoCuUdCMPF4pBr8gI58
	 tIJlHt+DW+L3xeUI+iRRPHde5zCy2XlRpz7lU6Fk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E37F9F806E7;
	Wed,  6 Nov 2019 02:14:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BA94F8065C; Wed,  6 Nov 2019 02:14:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACBAAF8065C
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 02:14:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACBAAF8065C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="JoA/kwzv"
Received: by mail-pg1-x544.google.com with SMTP id k13so4613944pgh.3
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 17:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U8t4AHHalgLM0nlaA0UIygDmVULi5h0uuv/sMgFcn9E=;
 b=JoA/kwzv52MK8tl7KvEB5zAkVNwKhMixeHMRuWypJw/UddOGRx90aB1S1hpefkqS2k
 B2ICL9N//aCqwRM3pYZCthStQPikWoHIHYM7V8hVD67jK0mdeiR2lSmNi9N2/jCqaYqa
 PNlU7XxnqMXLtR5qOVo6gQWl6uggJNK1sy40w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U8t4AHHalgLM0nlaA0UIygDmVULi5h0uuv/sMgFcn9E=;
 b=elyOR5U45Hnu/H4kgTpe88eTkAfNtacN5zFnW345FS3OKlfVic8a6rKT3hdtvMGxAl
 uuaJv1Ny9nhzT7rMDKQaY2Q8h5iAMZvfdbFW8/isyMFcQNA+bY/9eTMjdkTDC6Wcekmf
 vxh/e6b3bo2LIOie4yOukb2YGYtRCOQ6PZQaNrObCj8FP5mJoUMDkkueUb6PCnWuby0q
 znAiXmx5fTZJNs6Sjz5xDpCqxWEUgSTKmTLrgYsK2uoXXzZ+57lzzgbNx4OmeALPOZdY
 4v47an6s3d+NCeXmh+/XVYnSRD3zGmJL0W9GNn3IXIzYa/xAgPYExNq021EJjlJ1cdAl
 v7nw==
X-Gm-Message-State: APjAAAWSbdbCfUS3DgjaQK0ySONfEWGSSnsN+MbBKYeh2YKa3cVOG35Y
 LQCh4NI1BqQrhZYcWAof0rB1VCoRLo6b
X-Google-Smtp-Source: APXvYqyGqKbRPo1hDvhyzTXIjH4ZW3VIOS5sqTrxgAH4DmdbLVeeb9bgLrcJqWZKf9zF7fujfJSBVg==
X-Received: by 2002:a65:60c6:: with SMTP id r6mr16744678pgv.419.1573002845225; 
 Tue, 05 Nov 2019 17:14:05 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id s24sm21978999pfm.144.2019.11.05.17.14.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2019 17:14:04 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 17:13:32 -0800
Message-Id: <20191106011335.223061-8-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191106011335.223061-1-cujomalainey@chromium.org>
References: <20191106011335.223061-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v3 07/11] ASoC: rt5677: Disable irq at suspend
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ben Zhang <benzh@chromium.org>

The irq is disabled at suspend to avoid running the threaded irq
handler after the codec has been powered off. At resume, codec irq is
re-enabled and the interrupt status register is checked to see if
headphone has been pluggnd/unplugged while the device is suspended.

There is still a chance that the headphone gets enabled or disabled
after the codec is suspended. disable_irq syncs the threaded irq
handler, but soc-jack's threaded irq handler schedules a delayed
work to poll gpios (for debounce). This is still OK. The codec won't
be powered back on again because all audio paths have been suspended,
and there are no force enabled supply widgets (MICBIAS1 is disabled).
The gpio status read after codec power off could be wrong, so the
gpio values are checked again after resume.

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 46 +++++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt5677.h |  2 ++
 2 files changed, 48 insertions(+)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index eb55d6b9d0c1..14f04db8e5e7 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4949,6 +4949,11 @@ static int rt5677_suspend(struct snd_soc_component *component)
 {
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
 
+	if (rt5677->irq) {
+		cancel_delayed_work_sync(&rt5677->resume_irq_check);
+		disable_irq(rt5677->irq);
+	}
+
 	if (!rt5677->dsp_vad_en) {
 		regcache_cache_only(rt5677->regmap, true);
 		regcache_mark_dirty(rt5677->regmap);
@@ -4977,6 +4982,11 @@ static int rt5677_resume(struct snd_soc_component *component)
 		regcache_sync(rt5677->regmap);
 	}
 
+	if (rt5677->irq) {
+		enable_irq(rt5677->irq);
+		schedule_delayed_work(&rt5677->resume_irq_check, 0);
+	}
+
 	return 0;
 }
 #else
@@ -5375,6 +5385,39 @@ static irqreturn_t rt5677_irq(int unused, void *data)
 		return IRQ_NONE;
 }
 
+static void rt5677_resume_irq_check(struct work_struct *work)
+{
+	int i, virq;
+	struct rt5677_priv *rt5677 =
+		container_of(work, struct rt5677_priv, resume_irq_check.work);
+
+	/* This is needed to check and clear the interrupt status register
+	 * at resume. If the headset is plugged/unplugged when the device is
+	 * fully suspended, there won't be a rising edge at resume to trigger
+	 * the interrupt. Without this, we miss the next unplug/plug event.
+	 */
+	rt5677_irq(0, rt5677);
+
+	/* Call all enabled jack detect irq handlers again. This is needed in
+	 * addition to the above check for a corner case caused by jack gpio
+	 * debounce. After codec irq is disabled at suspend, the delayed work
+	 * scheduled by soc-jack may run and read wrong jack gpio values, since
+	 * the regmap is in cache only mode. At resume, there is no irq because
+	 * rt5677_irq has already ran and cleared the irq status at suspend.
+	 * Without this explicit check, unplug the headset right after suspend
+	 * starts, then after resume the headset is still shown as plugged in.
+	 */
+	mutex_lock(&rt5677->irq_lock);
+	for (i = 0; i < RT5677_IRQ_NUM; i++) {
+		if (rt5677->irq_en & rt5677_irq_descs[i].enable_mask) {
+			virq = irq_find_mapping(rt5677->domain, i);
+			if (virq)
+				handle_nested_irq(virq);
+		}
+	}
+	mutex_unlock(&rt5677->irq_lock);
+}
+
 static void rt5677_irq_bus_lock(struct irq_data *data)
 {
 	struct rt5677_priv *rt5677 = irq_data_get_irq_chip_data(data);
@@ -5450,6 +5493,7 @@ static int rt5677_init_irq(struct i2c_client *i2c)
 	}
 
 	mutex_init(&rt5677->irq_lock);
+	INIT_DELAYED_WORK(&rt5677->resume_irq_check, rt5677_resume_irq_check);
 
 	/*
 	 * Select RC as the debounce clock so that GPIO works even when
@@ -5495,6 +5539,8 @@ static int rt5677_init_irq(struct i2c_client *i2c)
 	if (ret)
 		dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
 
+	rt5677->irq = i2c->irq;
+
 	return ret;
 }
 
diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index 046ed2ee8e31..f8ada967fdbc 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -1856,6 +1856,8 @@ struct rt5677_priv {
 	struct irq_domain *domain;
 	struct mutex irq_lock;
 	unsigned int irq_en;
+	struct delayed_work resume_irq_check;
+	int irq;
 
 	int (*set_dsp_vad)(struct snd_soc_component *component, bool on);
 };
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

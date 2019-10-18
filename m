Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A066DCFCD
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 22:12:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7F1E1695;
	Fri, 18 Oct 2019 22:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7F1E1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571429530;
	bh=qDK6BBz+suMmsCw0hbNZEgbu3mPfIMUmEcGDrOcQn+Q=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eBYuTiU8kNHPv3RqMi7zLFskdbjzYEyZ1VHBmuqOfXCajqYH5FPGBGllTARFl6uk2
	 FlTz06XfAU9M7x5h9sju+pbp/bz0c5WVvHz3tsNSIjPuUX59jHQa0hPwo450IlWbVP
	 qYDMOu99/6+d84IZwx+uEP8yGHwdDFag3CXejhHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F608F806F0;
	Fri, 18 Oct 2019 22:05:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B22DCF80642; Fri, 18 Oct 2019 22:05:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77448F80639
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 22:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77448F80639
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="aYYQKk57"
Received: by mail-pl1-x644.google.com with SMTP id w8so3358464plq.5
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 13:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pMXrpJdT0u5RcL+tjMUUohr+ImA/k4aez5ZPt7muGaQ=;
 b=aYYQKk57gXwFhcM/3hIjbjKrhVgpmXKRtEc/I2TuZiXWC3VlISDkyRrQVbvkFNBmuO
 yHpEXkV6D7QefnDhGW9z7U4iRivWe45TAlWak8KMOYzVJChiHzc9GE+je0SZpn+n37sJ
 77+rN0/36C160UMNiuPN0UGCzIs4eYGWRHhu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pMXrpJdT0u5RcL+tjMUUohr+ImA/k4aez5ZPt7muGaQ=;
 b=iAdffnXXLJZxoqyLz8fVScoxA63w357++DJ1Bj3OBkwAsNEVuYSTyCxqDl655t53b8
 eawa8nF37TYoojAi9CkB2anQzLPopHRDlfFU2av0WNYkZOr0iXYjO5a87Ru3OiAj4joP
 IqZM0tQLS50BHyEiETkB4RzMnllwUB8jsBTndGUSOArSNbyXA/EjbMdn+HNBP5B4V6Xb
 kCcrzj1GlTGYsFYnQidO8mWlU5JhwRh2O4UM1fnhGnxITSxhRCneVR7fYbpCPZmaiNLC
 X9rZsa8VsDdwfbdCNcyKJaa7Pp6oZowMXir6n4hHmTyraENmVPp/Op0148M4qS0DkcHT
 WrEw==
X-Gm-Message-State: APjAAAV0/7Md1vZtqx+SBpu3P7miGCcjs2DFWV+aooT5kSenCg2LAepQ
 VeK0XEnJwPJcrgjuP1A5m1dSGWaYiKtU
X-Google-Smtp-Source: APXvYqwR3QNnxfzai03+ij7kgCMtKAz7ubxsJQ1rGHFB52FvGdYmfMdGAAfFeQpqAQKMNjkp6HPEpw==
X-Received: by 2002:a17:902:820f:: with SMTP id
 x15mr11906149pln.288.1571429115068; 
 Fri, 18 Oct 2019 13:05:15 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id p189sm7584849pfp.163.2019.10.18.13.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2019 13:05:14 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri, 18 Oct 2019 13:04:45 -0700
Message-Id: <20191018200449.141123-9-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191018200449.141123-1-cujomalainey@chromium.org>
References: <20191018200449.141123-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v2 08/12] ASoC: rt5677: Disable irq at suspend
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
index 990764a76390f..712d3cbba9035 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4951,6 +4951,11 @@ static int rt5677_suspend(struct snd_soc_component *component)
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
@@ -4979,6 +4984,11 @@ static int rt5677_resume(struct snd_soc_component *component)
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
@@ -5377,6 +5387,39 @@ static irqreturn_t rt5677_irq(int unused, void *data)
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
@@ -5452,6 +5495,7 @@ static int rt5677_init_irq(struct i2c_client *i2c)
 	}
 
 	mutex_init(&rt5677->irq_lock);
+	INIT_DELAYED_WORK(&rt5677->resume_irq_check, rt5677_resume_irq_check);
 
 	/*
 	 * Select RC as the debounce clock so that GPIO works even when
@@ -5497,6 +5541,8 @@ static int rt5677_init_irq(struct i2c_client *i2c)
 	if (ret)
 		dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
 
+	rt5677->irq = i2c->irq;
+
 	return ret;
 }
 
diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index 046ed2ee8e31e..f8ada967fdbc9 100644
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
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48760486361
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 12:02:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1EA31868;
	Thu,  6 Jan 2022 12:02:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1EA31868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641466973;
	bh=VWdVnzgsLpU6Lddb1fNfFzSWyeYYAHqLTYf+giddV0I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uCXaKvRaRk/mO0lS6oUduyfmigG0PYr/LKOcHAHfn3DHzYimJj0MRVgZqAhGrsaz5
	 2EAdo3IcrQiqmuJhSyzwiWxsMacawYXYSa+OaJETmNqYR2gjL/eelP8HaHG5Ad91as
	 xGflEjcUBqS32WWnhMFbucXqTg6EImnjPILmM030=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A87AF8016D;
	Thu,  6 Jan 2022 12:01:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61EF3F80161; Thu,  6 Jan 2022 12:01:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5CF3F800AE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 12:01:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5CF3F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="A3bMkX1H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641466900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8DQ7Kfrw1JppVlEKDBQzTyS/B9DTkCjylDuvSXKlAdE=;
 b=A3bMkX1HEDQ/q/xHPGslicokWpD9W/luioqMfec8dRSJrGnknmffa25NofHmWi/4pH2pOM
 nq36FQHkgkYQfwW36lgUzIgoPRfm81c1E47maZJlnMeE5QtA47kHfZteY5nizrIjdS28n0
 lCaB+Oxrfw15cQdBFrTS40L4rdMTE2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-JcFHEMFkMpeBcDKm0WU1Vw-1; Thu, 06 Jan 2022 06:01:38 -0500
X-MC-Unique: JcFHEMFkMpeBcDKm0WU1Vw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FCCD1006AA7;
 Thu,  6 Jan 2022 11:01:36 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE2497E12C;
 Thu,  6 Jan 2022 11:01:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/6] ASoC: rt5640: Change jack_work to a delayed_work
Date: Thu,  6 Jan 2022 12:01:24 +0100
Message-Id: <20220106110128.66049-3-hdegoede@redhat.com>
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

Change jack_work from a struct work_struct to a struct delayed_work, this
is a preparation patch for adding support for boards where an external
GPIO is used for jack-detect, rather then one of the JD pins of the codec.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 16 ++++++++--------
 sound/soc/codecs/rt5640.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index ceb2d50b17aa..a1e4e3ac99f1 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2298,7 +2298,7 @@ EXPORT_SYMBOL_GPL(rt5640_detect_headset);
 static void rt5640_jack_work(struct work_struct *work)
 {
 	struct rt5640_priv *rt5640 =
-		container_of(work, struct rt5640_priv, jack_work);
+		container_of(work, struct rt5640_priv, jack_work.work);
 	struct snd_soc_component *component = rt5640->component;
 	int status;
 
@@ -2381,7 +2381,7 @@ static void rt5640_jack_work(struct work_struct *work)
 		 * disabled the OVCD IRQ, the IRQ pin will stay high and as
 		 * we react to edges, we miss the unplug event -> recheck.
 		 */
-		queue_work(system_long_wq, &rt5640->jack_work);
+		queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
 	}
 }
 
@@ -2390,7 +2390,7 @@ static irqreturn_t rt5640_irq(int irq, void *data)
 	struct rt5640_priv *rt5640 = data;
 
 	if (rt5640->jack)
-		queue_work(system_long_wq, &rt5640->jack_work);
+		queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
 
 	return IRQ_HANDLED;
 }
@@ -2399,7 +2399,7 @@ static void rt5640_cancel_work(void *data)
 {
 	struct rt5640_priv *rt5640 = data;
 
-	cancel_work_sync(&rt5640->jack_work);
+	cancel_delayed_work_sync(&rt5640->jack_work);
 	cancel_delayed_work_sync(&rt5640->bp_work);
 }
 
@@ -2508,7 +2508,7 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 	}
 
 	/* sync initial jack state */
-	queue_work(system_long_wq, &rt5640->jack_work);
+	queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
 }
 
 static void rt5640_enable_hda_jack_detect(
@@ -2546,7 +2546,7 @@ static void rt5640_enable_hda_jack_detect(
 	}
 
 	/* sync initial jack state */
-	queue_work(system_long_wq, &rt5640->jack_work);
+	queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
 }
 
 static int rt5640_set_jack(struct snd_soc_component *component,
@@ -2745,7 +2745,7 @@ static int rt5640_resume(struct snd_soc_component *component)
 			snd_soc_component_write(component, RT5640_DUMMY2,
 				0x4001);
 
-		queue_work(system_long_wq, &rt5640->jack_work);
+		queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
 	}
 
 	return 0;
@@ -2950,7 +2950,7 @@ static int rt5640_i2c_probe(struct i2c_client *i2c,
 	rt5640->hp_mute = true;
 	rt5640->irq = i2c->irq;
 	INIT_DELAYED_WORK(&rt5640->bp_work, rt5640_button_press_work);
-	INIT_WORK(&rt5640->jack_work, rt5640_jack_work);
+	INIT_DELAYED_WORK(&rt5640->jack_work, rt5640_jack_work);
 
 	/* Make sure work is stopped on probe-error / remove */
 	ret = devm_add_action_or_reset(&i2c->dev, rt5640_cancel_work, rt5640);
diff --git a/sound/soc/codecs/rt5640.h b/sound/soc/codecs/rt5640.h
index 2c28f83e338a..7ab930def8dd 100644
--- a/sound/soc/codecs/rt5640.h
+++ b/sound/soc/codecs/rt5640.h
@@ -2145,7 +2145,7 @@ struct rt5640_priv {
 	int release_count;
 	int poll_count;
 	struct delayed_work bp_work;
-	struct work_struct jack_work;
+	struct delayed_work jack_work;
 	struct snd_soc_jack *jack;
 	unsigned int jd_src;
 	bool jd_inverted;
-- 
2.33.1


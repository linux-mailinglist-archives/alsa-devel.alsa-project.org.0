Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A63247FF1F
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Dec 2021 16:35:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB711170B;
	Mon, 27 Dec 2021 16:34:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB711170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640619344;
	bh=FVol1AHgMw9lHXv6ilFu4XH6kUtX2fOU+QJ6kQmv+nw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HDn9rbo9q18iuwMVtoZUfMqe4nFev30UTgiq3t7KLQqxnUShufdT2fP4RoesutJiZ
	 ul4fq6r/UGR7RGmzm3V9LOsoh6EJ+oISxbMny5JMjDNhPjaMBUPol9caKqeqDJxHgF
	 PfzS+Jxdia1JoFBqe1Qm9n/DJkwsh5MUiuog+gbQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEFFBF804E6;
	Mon, 27 Dec 2021 16:34:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2189F80161; Mon, 27 Dec 2021 16:34:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC156F800F5
 for <alsa-devel@alsa-project.org>; Mon, 27 Dec 2021 16:33:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC156F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Fr4ZIi5U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640619233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zf2MKpJ7o+k34g0SG+yAy5Q+8Rd0wH724pyLvEHrRlg=;
 b=Fr4ZIi5UZ5TwXFRRWt91kiOz6qQhBZtSXFu53allejibXTl3JB7QgUrWURZrDmj43UJEja
 P6HhPVu4225K7z7uNmNVR6dT+E0JfncyTq7LB4UCrPanQSt3rYbf4y51F1VDEp65PrXz/q
 TtuMuDpwTesWI6R78DIY5RT8G4Nmtzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-RVJb830PMQmGgJtH8vC2UA-1; Mon, 27 Dec 2021 10:33:49 -0500
X-MC-Unique: RVJb830PMQmGgJtH8vC2UA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 938421898290;
 Mon, 27 Dec 2021 15:33:47 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 569807574C;
 Mon, 27 Dec 2021 15:33:45 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/5] ASoC: rt5640: Change jack_work to a delayed_work
Date: Mon, 27 Dec 2021 16:33:40 +0100
Message-Id: <20211227153344.155803-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Change jack_work from a struct work_struct to a struct delayed_work, this
is a preparation patch for adding support for boards where an external
GPIO is used for jack-detect, rather then one of the JD pins of the codec.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 12 ++++++------
 sound/soc/codecs/rt5640.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index d01fe73ab9c8..36c00ad17182 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2297,7 +2297,7 @@ EXPORT_SYMBOL_GPL(rt5640_detect_headset);
 static void rt5640_jack_work(struct work_struct *work)
 {
 	struct rt5640_priv *rt5640 =
-		container_of(work, struct rt5640_priv, jack_work);
+		container_of(work, struct rt5640_priv, jack_work.work);
 	struct snd_soc_component *component = rt5640->component;
 	int status;
 
@@ -2348,7 +2348,7 @@ static void rt5640_jack_work(struct work_struct *work)
 		 * disabled the OVCD IRQ, the IRQ pin will stay high and as
 		 * we react to edges, we miss the unplug event -> recheck.
 		 */
-		queue_work(system_long_wq, &rt5640->jack_work);
+		queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
 	}
 }
 
@@ -2357,7 +2357,7 @@ static irqreturn_t rt5640_irq(int irq, void *data)
 	struct rt5640_priv *rt5640 = data;
 
 	if (rt5640->jack)
-		queue_work(system_long_wq, &rt5640->jack_work);
+		queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
 
 	return IRQ_HANDLED;
 }
@@ -2366,7 +2366,7 @@ static void rt5640_cancel_work(void *data)
 {
 	struct rt5640_priv *rt5640 = data;
 
-	cancel_work_sync(&rt5640->jack_work);
+	cancel_delayed_work_sync(&rt5640->jack_work);
 	cancel_delayed_work_sync(&rt5640->bp_work);
 }
 
@@ -2475,7 +2475,7 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 	}
 
 	/* sync initial jack state */
-	queue_work(system_long_wq, &rt5640->jack_work);
+	queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
 }
 
 static int rt5640_set_jack(struct snd_soc_component *component,
@@ -2856,7 +2856,7 @@ static int rt5640_i2c_probe(struct i2c_client *i2c,
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


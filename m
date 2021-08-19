Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 337973F205F
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 21:08:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE722168B;
	Thu, 19 Aug 2021 21:07:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE722168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629400111;
	bh=l2ZQImoqimhEHwzO1LRTVwpzqnpPAzToQByOdtL+iqY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E1Fi277wok/pqUK8Ebl9ay/Fnyk5sS4yo1KMh1kn+/52kccYKDkKj0KM0vjl90Do4
	 QTOqXcoSycdXWCIWjz2ndomPVxM5aD82rq1UGP35HwRez22d3nwQM71QgkvJhHcWwr
	 jMDwIIwQVB9ciIgdqeh7mElQLBb3aW/fBfDCyNFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7FF6F804F1;
	Thu, 19 Aug 2021 21:06:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F875F804E7; Thu, 19 Aug 2021 21:06:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 453FFF80302
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 21:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 453FFF80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="jLcuQ6OG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629399956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/wFSM5HUSlNuBm24c8q+JPAYgBJqsNR6+FFGNtZnXg=;
 b=jLcuQ6OGabwTwmsirmkK8j5y9V8ocjYYzDMEmCn50LIbaGOPydw4D+5SrqyaqTj61bPprM
 LpVs/cqcjkVapSFEI7r1VQtbMn4wpvQmTj9jxKfkIBffQpCwck7Zc4dS5OjclD3KbXRiiV
 w46CJmNXAfA/kgHilwu5OyiotyP3mqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-cP3epNkXOzSrDJtFZtvAYg-1; Thu, 19 Aug 2021 15:05:52 -0400
X-MC-Unique: cP3epNkXOzSrDJtFZtvAYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5275493921;
 Thu, 19 Aug 2021 19:05:51 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3619163C9;
 Thu, 19 Aug 2021 19:05:49 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/6] ASoC: rt5640: Delay requesting IRQ until the
 machine-drv calls set_jack
Date: Thu, 19 Aug 2021 21:05:39 +0200
Message-Id: <20210819190543.784415-3-hdegoede@redhat.com>
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

Delay requesting the IRQ until the machine-drv calls set_jack.

The main reason for this is that the codec's IRQ is unused on some boards,
in which case we really should not call request_irq at all.

On some boards there is an IRQ listed at index 0 for the codec, but
this is not connected to the codec, but rather is directly connected
to the jack's jack-detect pin. These special setups will be handled
by the machine-driver, but the machine driver can only request the IRQ
if it is not first requested by the codec driver. Moving the request_irq
to the set_jack callback (which will not get called in this case) avoids
the codec-driver clobbering the IRQ.

Moving the request_irq also removes the need to disable the IRQ immediately
after requesting it, avoiding a small race (this could also have been fixed
by using the new IRQF_NO_AUTOEN flag when requesting the IRQ).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 5439f771eef5..d32e9d69231c 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2373,7 +2373,7 @@ static void rt5640_disable_jack_detect(struct snd_soc_component *component)
 	if (!rt5640->jack)
 		return;
 
-	disable_irq(rt5640->irq);
+	free_irq(rt5640->irq, rt5640);
 	rt5640_cancel_work(rt5640);
 
 	if (rt5640->jack->status & SND_JACK_MICROPHONE) {
@@ -2389,6 +2389,7 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 				      struct snd_soc_jack *jack)
 {
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	/* Select JD-source */
 	snd_soc_component_update_bits(component, RT5640_JD_CTRL,
@@ -2446,7 +2447,17 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 		rt5640_enable_micbias1_ovcd_irq(component);
 	}
 
-	enable_irq(rt5640->irq);
+	ret = request_irq(rt5640->irq, rt5640_irq,
+			  IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+			  "rt5640", rt5640);
+	if (ret) {
+		dev_warn(component->dev, "Failed to reguest IRQ %d: %d\n", rt5640->irq, ret);
+		rt5640->irq = -ENXIO;
+		/* Undo above settings */
+		rt5640_disable_jack_detect(component);
+		return;
+	}
+
 	/* sync initial jack state */
 	queue_work(system_long_wq, &rt5640->jack_work);
 }
@@ -2836,21 +2847,6 @@ static int rt5640_i2c_probe(struct i2c_client *i2c,
 	if (ret)
 		return ret;
 
-	if (rt5640->irq) {
-		/* enabled by rt5640_set_jack() */
-		ret = devm_request_irq(&i2c->dev, rt5640->irq, rt5640_irq,
-				       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN |
-				       IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-				       "rt5640", rt5640);
-		if (ret) {
-			dev_err(&i2c->dev, "Failed to request IRQ %d: %d\n",
-				rt5640->irq, ret);
-			return ret;
-		}
-	} else {
-		rt5640->irq = -ENXIO;
-	}
-
 	return devm_snd_soc_register_component(&i2c->dev,
 				      &soc_component_dev_rt5640,
 				      rt5640_dai, ARRAY_SIZE(rt5640_dai));
-- 
2.31.1


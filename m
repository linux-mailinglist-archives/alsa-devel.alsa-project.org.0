Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D2E3ECA1A
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Aug 2021 17:54:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DB65171F;
	Sun, 15 Aug 2021 17:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DB65171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629042859;
	bh=6DCPeHuMtC43QJ8fZymljJ8NScvgEyyeZFe41cFzlBk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VlJ8gRpmQ8brDBIKzIgDEJm3MNAIyhP9lLBBv9zUH6U/PohqOfl/Qo19G4n2oRngr
	 vSrp5/CNE2kY3sbDqVA97cpWbIOxOQJqeO8AHW5uLgfjI1w0bqoHgtpULZMViceTde
	 GvxlKe2lY4TZyeIKTbu2Gq2TVqShz6xh03MkuTrI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E0B9F804EC;
	Sun, 15 Aug 2021 17:51:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86F6CF8026D; Sun, 15 Aug 2021 17:51:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F3A9F80272
 for <alsa-devel@alsa-project.org>; Sun, 15 Aug 2021 17:49:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F3A9F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="KCDP/wJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629042588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FX/+lKu4bqHf/wD+R9LCFUcH5tJIzTsgj39zSFu2Rfs=;
 b=KCDP/wJbUPxEEDuvnLoAGSHIexI3RGwU16sY/2ANMtOxIMmsOSki6rgauIIdWLfkoscrCz
 5+N77eUdI+9Ew+QW9BNvzhmbKr8MFKdVNOEypD7WDJScSDb9Kslykq9WPVmtebga+qY0V0
 BBhlvHpqvUwXi6IjoQsNVid4dog3+KM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-g7icEE05Oeu_z7hkmxHcwA-1; Sun, 15 Aug 2021 11:49:45 -0400
X-MC-Unique: g7icEE05Oeu_z7hkmxHcwA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92ECA1853029;
 Sun, 15 Aug 2021 15:49:43 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDD8360871;
 Sun, 15 Aug 2021 15:49:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/5] ASoC: rt5640: Delay requesting IRQ until the machine-drv
 calls set_jack
Date: Sun, 15 Aug 2021 17:49:32 +0200
Message-Id: <20210815154935.101178-3-hdegoede@redhat.com>
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
 sound/soc/codecs/rt5640.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index a425e6b1687d..d32e9d69231c 100644
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
@@ -2836,18 +2847,6 @@ static int rt5640_i2c_probe(struct i2c_client *i2c,
 	if (ret)
 		return ret;
 
-	ret = devm_request_irq(&i2c->dev, rt5640->irq, rt5640_irq,
-			       IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
-			       | IRQF_ONESHOT, "rt5640", rt5640);
-	if (ret == 0) {
-		/* Gets re-enabled by rt5640_set_jack() */
-		disable_irq(rt5640->irq);
-	} else {
-		dev_warn(&i2c->dev, "Failed to reguest IRQ %d: %d\n",
-			 rt5640->irq, ret);
-		rt5640->irq = -ENXIO;
-	}
-
 	return devm_snd_soc_register_component(&i2c->dev,
 				      &soc_component_dev_rt5640,
 				      rt5640_dai, ARRAY_SIZE(rt5640_dai));
-- 
2.31.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B98BA79D018
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 13:35:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EF06ED2;
	Tue, 12 Sep 2023 13:35:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EF06ED2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694518555;
	bh=9n8UZzvryLuk2vZJC8M3V8alIAZcil2o5hNupvZ7T8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SEjkgUissJd38cirwTF1+hDCKKjitgR11JbuXNg6oMQ5whYzwdtSbsGsPIvOJQbSs
	 LDMXjSTpK1O8Gm/bKQ5sXC3IbX7ycdoac3dj3s7jFWLZ0Xk0nImb+1sdj2BKmGiPRR
	 EEcgPMk6HMAvkQLFpvAsmZbyu4QzMotQ1ey6YTD8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BB7BF805AA; Tue, 12 Sep 2023 13:33:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DACE8F805A9;
	Tue, 12 Sep 2023 13:33:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04DCAF80425; Tue, 12 Sep 2023 13:33:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2464CF80431
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 13:33:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2464CF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=hrpg9sUE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694518384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TaVFcExhlXRJGgXNUHcGuf/ioS9jysk1K5nXiR2tMGQ=;
	b=hrpg9sUEs2PTQMW4xpIv2VGZPSv3JcL75GN8CaUV5C7pvUFPek+zXHdqJ7CuBHCmqSOR8P
	kEflQT9O4WnhrEfBGBWT0bQYpEjxdiQH/ZMO8fkjWE2WLMKg4y7fJHMD1QKqy2Nii5KpJg
	UGsYJCe8eaO1GlJbU9iCfNnXvetYu+c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-680-uHvsWEhpPFGELt6YFKgF9A-1; Tue, 12 Sep 2023 07:33:00 -0400
X-MC-Unique: uHvsWEhpPFGELt6YFKgF9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47916101FAA0;
	Tue, 12 Sep 2023 11:33:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.220])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E9D22026D68;
	Tue, 12 Sep 2023 11:32:59 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Sameer Pujar <spujar@nvidia.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 3/6] ASoC: rt5640: Do not disable/enable IRQ twice on
 suspend/resume
Date: Tue, 12 Sep 2023 13:32:42 +0200
Message-ID: <20230912113245.320159-4-hdegoede@redhat.com>
In-Reply-To: <20230912113245.320159-1-hdegoede@redhat.com>
References: <20230912113245.320159-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 3AXI4VJPO3BZ5QIUEBBA4KXZTT3H7HCJ
X-Message-ID-Hash: 3AXI4VJPO3BZ5QIUEBBA4KXZTT3H7HCJ
X-MailFrom: hdegoede@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3AXI4VJPO3BZ5QIUEBBA4KXZTT3H7HCJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When jack-detect was originally added disabling the IRQ during suspend
was done by the sound/soc/intel/boards/bytcr_rt5640.c driver
calling snd_soc_component_set_jack(NULL) on suspend, which calls
rt5640_disable_jack_detect(), which calls free_irq() which also
disables it.

Commit 5fabcc90e79b ("ASoC: rt5640: Fix Jack work after system suspend")
added disable_irq() / enable_irq() calls on suspend/resume for machine
drivers which do not call snd_soc_component_set_jack(NULL) on suspend.

The new disable_irq() / enable_irq() are made conditional by
"if (rt5640->irq)" statements, but this is true for the machine drivers
which do call snd_soc_component_set_jack(NULL) on suspend too, causing
a disable_irq() call there on the already free-ed IRQ.

Change the "if (rt5640->irq)" condition to "if (rt5640->jack)" to fix this,
rt5640->jack is only set if the jack-detect IRQ handler is still active
when rt5640_suspend() runs.

And adjust rt5640_enable_hda_jack_detect()'s request_irq() error handling
to set rt5640->jack to NULL to match (note that the old setting of irq to
-ENOXIO still resulted in disable_irq(-ENOXIO) calls on suspend).

Fixes: 5fabcc90e79b ("ASoC: rt5640: Fix Jack work after system suspend")
Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 5c34c045d396..1bc281d42ca8 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2622,7 +2622,7 @@ static void rt5640_enable_hda_jack_detect(
 			  IRQF_TRIGGER_RISING | IRQF_ONESHOT, "rt5640", rt5640);
 	if (ret) {
 		dev_warn(component->dev, "Failed to request IRQ %d: %d\n", rt5640->irq, ret);
-		rt5640->irq = -ENXIO;
+		rt5640->jack = NULL;
 		return;
 	}
 
@@ -2797,7 +2797,7 @@ static int rt5640_suspend(struct snd_soc_component *component)
 {
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
 
-	if (rt5640->irq) {
+	if (rt5640->jack) {
 		/* disable jack interrupts during system suspend */
 		disable_irq(rt5640->irq);
 	}
@@ -2825,10 +2825,9 @@ static int rt5640_resume(struct snd_soc_component *component)
 	regcache_cache_only(rt5640->regmap, false);
 	regcache_sync(rt5640->regmap);
 
-	if (rt5640->irq)
+	if (rt5640->jack) {
 		enable_irq(rt5640->irq);
 
-	if (rt5640->jack) {
 		if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER) {
 			snd_soc_component_update_bits(component,
 				RT5640_DUMMY2, 0x1100, 0x1100);
-- 
2.41.0


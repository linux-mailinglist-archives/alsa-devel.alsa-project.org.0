Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C06AB79D012
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 13:35:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F91EEB0;
	Tue, 12 Sep 2023 13:34:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F91EEB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694518503;
	bh=yAMrwWynjfRyQdGNHoOG57VnP9b0MEIbt8EPmc/BpU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vVPRY4U55poSRf+gEiKtdjehluokv+f/o4XWqVKpOdcAhVyVtIlKKTKDrFRWoJhzR
	 s80O97wDQSNC45vk5IaPFi7CCPVs4zpK0FG7DNPRGjf84BKRGwe6DyvCT0rwBy1j1J
	 xspAws1Z4SqH82FI4uWjtmtEd8QmIi02PqP7XG3M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36E82F80570; Tue, 12 Sep 2023 13:33:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C06DF80552;
	Tue, 12 Sep 2023 13:33:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09897F80551; Tue, 12 Sep 2023 13:33:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 843AFF800AA
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 13:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 843AFF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=c/p1eZqT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694518382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QdS97yqzYLELFF8D5WQtucMikkwzHgKzlzLISdy1jwc=;
	b=c/p1eZqT3xoQ7jAjkxXW5xO8begrOb48hIdE/zomnQlHGw3/X1dOFvQawZROT1q1wc4I+J
	E0f7tVo31AXuNBlsKu9dDzV4oMM2mE9Tdr56d0KKVzILl5yMSbdIycofCC3kl8NsNLN/11
	W+58naCQCWLALatANXmxreG1QhWBmGU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-hGeQBe63O_mDIVKYArn3pQ-1; Tue, 12 Sep 2023 07:32:58 -0400
X-MC-Unique: hGeQBe63O_mDIVKYArn3pQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4ACD181A6E0;
	Tue, 12 Sep 2023 11:32:57 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.220])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8B5052026D4B;
	Tue, 12 Sep 2023 11:32:56 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Sameer Pujar <spujar@nvidia.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 1/6] ASoC: rt5640: Revert "Fix sleep in atomic context"
Date: Tue, 12 Sep 2023 13:32:40 +0200
Message-ID: <20230912113245.320159-2-hdegoede@redhat.com>
In-Reply-To: <20230912113245.320159-1-hdegoede@redhat.com>
References: <20230912113245.320159-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: T3OTJ7SCNBLX2STOQ5B2Q2OCNCKW6OCQ
X-Message-ID-Hash: T3OTJ7SCNBLX2STOQ5B2Q2OCNCKW6OCQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T3OTJ7SCNBLX2STOQ5B2Q2OCNCKW6OCQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 70a6404ff610 ("ASoC: rt5640: Fix sleep in atomic context")
not only switched from request_irq() to request_threaded_irq(),
to fix the sleep in atomic context issue, but it also added
devm management of the IRQ by actually switching to
devm_request_threaded_irq() (without any explanation in the commit
message for this change).

This is wrong since the IRQ was already explicitly managed by
the driver. On unbind the ASoC core will call rt5640_set_jack(NULL)
which in turn will call rt5640_disable_jack_detect() which
frees the IRQ already. So now we have a double free.

Besides the unexplained switch to devm being wrong, the actual fix
for the sleep in atomic context issue also is not the best solution.

The only thing which rt5640_irq() does is cancel + (re-)queue
the jack_work delayed_work. This can be done in a single non sleeping
call by replacing queue_delayed_work() with mod_delayed_work(),
which does not sleep. Using mod_delayed_work() is a much better fix
then adding a thread which does nothing other then queuing a work-item.

This patch is a straight revert of the troublesome changes, the switch
to mod_delayed_work() is done in a separate follow-up patch.

Fixes: 70a6404ff610 ("ASoC: rt5640: Fix sleep in atomic context")
Cc: Sameer Pujar <spujar@nvidia.com>
Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 15e1a62b9e57..05ff8066171b 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2565,10 +2565,9 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 	if (jack_data && jack_data->use_platform_clock)
 		rt5640->use_platform_clock = jack_data->use_platform_clock;
 
-	ret = devm_request_threaded_irq(component->dev, rt5640->irq,
-					NULL, rt5640_irq,
-					IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
-					"rt5640", rt5640);
+	ret = request_irq(rt5640->irq, rt5640_irq,
+			  IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+			  "rt5640", rt5640);
 	if (ret) {
 		dev_warn(component->dev, "Failed to request IRQ %d: %d\n", rt5640->irq, ret);
 		rt5640_disable_jack_detect(component);
@@ -2621,9 +2620,8 @@ static void rt5640_enable_hda_jack_detect(
 
 	rt5640->jack = jack;
 
-	ret = devm_request_threaded_irq(component->dev, rt5640->irq,
-					NULL, rt5640_irq, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
-					"rt5640", rt5640);
+	ret = request_irq(rt5640->irq, rt5640_irq,
+			  IRQF_TRIGGER_RISING | IRQF_ONESHOT, "rt5640", rt5640);
 	if (ret) {
 		dev_warn(component->dev, "Failed to request IRQ %d: %d\n", rt5640->irq, ret);
 		rt5640->irq = -ENXIO;
-- 
2.41.0


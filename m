Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6242579D014
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 13:35:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAD6BECC;
	Tue, 12 Sep 2023 13:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAD6BECC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694518532;
	bh=JojRkQvL3sOnfU959DH4BZUrxNIsWcTsqGHa4lHLz/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D0TN+ueIYoYjaW6u9VUVbSlyIA1PfUwd0iJeY4nhRwrGQvuaGz+GLzDelqtZ1mSM8
	 P/KspCgO4Si1etym5TWWsuJyn1TmwBwLqw0oSoEkYA2rmBGI1U9XsK57b5Dc0xlJx9
	 mi7WJV1iZHgXB9nRi6Oa/50iqoWJQ/cLUgZKoO8M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65DFEF80431; Tue, 12 Sep 2023 13:33:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FA88F80588;
	Tue, 12 Sep 2023 13:33:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA397F80246; Tue, 12 Sep 2023 13:33:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9141CF80425
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 13:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9141CF80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=TCFhfY6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694518385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FWrSVRpgYkqccnYBX+WyvN45IVRYPGYlajzOCq8cYXA=;
	b=TCFhfY6EqrYE4jxMmh2Kub1WGHGyd4sQN8Hyg2yqfPt9TeTnKNeh2UQ0esfp7pCDadu6zu
	66EFg0mJQwfo7fWJaC+jAmng684pXD7RQMqeeOmbo0ToGJ0YINS8tl9f6kwkODVJLJeKTH
	OwRW7zmccTK2ONjEFvMzKziolt4G2gk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-jloJgXNzONGu21hslitwGQ-1; Tue, 12 Sep 2023 07:32:59 -0400
X-MC-Unique: jloJgXNzONGu21hslitwGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1AA13806707;
	Tue, 12 Sep 2023 11:32:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.220])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D6F4C2026D4B;
	Tue, 12 Sep 2023 11:32:57 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Sameer Pujar <spujar@nvidia.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 2/6] ASoC: rt5640: Fix sleep in atomic context
Date: Tue, 12 Sep 2023 13:32:41 +0200
Message-ID: <20230912113245.320159-3-hdegoede@redhat.com>
In-Reply-To: <20230912113245.320159-1-hdegoede@redhat.com>
References: <20230912113245.320159-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: RFOUDE2QUXM4SRGNTZWOMAHF6HUC6GDM
X-Message-ID-Hash: RFOUDE2QUXM4SRGNTZWOMAHF6HUC6GDM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RFOUDE2QUXM4SRGNTZWOMAHF6HUC6GDM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Following prints are observed while testing audio on Jetson AGX Orin which
has onboard RT5640 audio codec:

  BUG: sleeping function called from invalid context at kernel/workqueue.c:3027
  in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: swapper/0
  preempt_count: 10001, expected: 0
  RCU nest depth: 0, expected: 0
  ------------[ cut here ]------------
  WARNING: CPU: 0 PID: 0 at kernel/irq/handle.c:159 __handle_irq_event_percpu+0x1e0/0x270
  ---[ end trace ad1c64905aac14a6 ]-

The IRQ handler rt5640_irq() runs in interrupt context and can sleep
during cancel_delayed_work_sync().

The only thing which rt5640_irq() does is cancel + (re-)queue
the jack_work delayed_work. This can be done in a single non sleeping
call by replacing queue_delayed_work() with mod_delayed_work(),
avoiding the sleep in atomic context.

Fixes: 051dade34695 ("ASoC: rt5640: Fix the wrong state of JD1 and JD2")
Reported-by: Sameer Pujar <spujar@nvidia.com>
Closes: https://lore.kernel.org/r/1688015537-31682-4-git-send-email-spujar@nvidia.com
Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 05ff8066171b..5c34c045d396 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2403,13 +2403,11 @@ static irqreturn_t rt5640_irq(int irq, void *data)
 	struct rt5640_priv *rt5640 = data;
 	int delay = 0;
 
-	if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER) {
-		cancel_delayed_work_sync(&rt5640->jack_work);
+	if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER)
 		delay = 100;
-	}
 
 	if (rt5640->jack)
-		queue_delayed_work(system_long_wq, &rt5640->jack_work, delay);
+		mod_delayed_work(system_long_wq, &rt5640->jack_work, delay);
 
 	return IRQ_HANDLED;
 }
-- 
2.41.0


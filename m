Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE0379D01E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 13:36:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 927DFEEA;
	Tue, 12 Sep 2023 13:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 927DFEEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694518585;
	bh=W+ZoDz3IVISlr8l4dEX1tQJJy20XDM5riBwBaLAy7KI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i/eitXic+ajPUozI+Ci+qp4z2pXOi0ifUPPRamt4qtV2cShl56DsRc2f+oDVyLqYm
	 HSyAILcGMcO3eY01dA6z4S23AFFN+VwLf3BeBwEH2H7g0TzZdiZ/nyWfC6XyZMGTuR
	 OpzLNRKbhx+I0jx8t51ALe1QFuZd0hybIE78Vqm8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 823D3F80578; Tue, 12 Sep 2023 13:35:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D357F80563;
	Tue, 12 Sep 2023 13:35:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41EE6F80425; Tue, 12 Sep 2023 13:35:30 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A0BAF80537
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 13:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A0BAF80537
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ZcBHjplw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694518389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wziPrUTQEZ53r7QLkQqii7GVp1XqsmQR7RJXjoCnR8I=;
	b=ZcBHjplwGhHKeEYXI7GcxoWZB3CFDQ/RqDkMC1hCx1Q+KgYNtewK5bRPd9aZy73HLKMGvS
	pRD2N/usOQ/KzK9ZjLsGzU17oR4dAmwOvqzjAtz+iqoDbVdLYrh9ZOvWVuCfaAaPFS9/9L
	h0ENm1OGwnvhfMBg+IeR43nRvWu418A=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-TB-xh3yLM16MJkfKUay23A-1; Tue, 12 Sep 2023 07:33:04 -0400
X-MC-Unique: TB-xh3yLM16MJkfKUay23A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33CB929AB3E3;
	Tue, 12 Sep 2023 11:33:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.220])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18FE82026D4B;
	Tue, 12 Sep 2023 11:33:02 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Sameer Pujar <spujar@nvidia.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 6/6] ASoC: rt5640: Only cancel jack-detect work on suspend if
 active
Date: Tue, 12 Sep 2023 13:32:45 +0200
Message-ID: <20230912113245.320159-7-hdegoede@redhat.com>
In-Reply-To: <20230912113245.320159-1-hdegoede@redhat.com>
References: <20230912113245.320159-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: CQNEOO7G2RF4W5LJ4QUTWCBX3MPHQIJS
X-Message-ID-Hash: CQNEOO7G2RF4W5LJ4QUTWCBX3MPHQIJS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CQNEOO7G2RF4W5LJ4QUTWCBX3MPHQIJS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If jack-detection is not used; or has already been disabled then
there is no need to call rt5640_cancel_work().

Move the rt5640_cancel_work() inside the "if (rt5640->jack) {}" block,
grouping it together with the disabling of the IRQ which queues the work
in the first place.

This also makes suspend() symetrical with resume() which re-queues the work
in an "if (rt5640->jack) {}" block.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index a4a11407ab10..e8cdc166bdaa 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2801,9 +2801,9 @@ static int rt5640_suspend(struct snd_soc_component *component)
 	if (rt5640->jack) {
 		/* disable jack interrupts during system suspend */
 		disable_irq(rt5640->irq);
+		rt5640_cancel_work(rt5640);
 	}
 
-	rt5640_cancel_work(rt5640);
 	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
 	rt5640_reset(component);
 	regcache_cache_only(rt5640->regmap, true);
-- 
2.41.0


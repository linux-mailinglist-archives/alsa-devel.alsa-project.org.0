Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CCA79D01D
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 13:36:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91828EBB;
	Tue, 12 Sep 2023 13:35:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91828EBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694518583;
	bh=fOzd19SFoDA6V+OtNqVNBoF5s8o2viZR0sRSugOrvoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l4aEQ0/duacjr5jWODfgvXUt6djKVLYHgAmJSseRriDG8pIz0TA4uUDT80ZB5LmQD
	 F5/fRfVDPEUIzfwqII8Sk3MUwA9hsawZDXSyNetYkawxuKNkL95anTzAzywjkcUUzd
	 YWoEsdLuafCf9IhufD6xWDl2YO4K6fIDvAHxhjlQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CAFAF80425; Tue, 12 Sep 2023 13:35:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6600F80425;
	Tue, 12 Sep 2023 13:35:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9562BF80425; Tue, 12 Sep 2023 13:35:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E616F8047D
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 13:33:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E616F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=TK7xtGH0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694518387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tuC69j0YIzIMoK9TblIhKHZnBd1HQmMce3XinY+c08g=;
	b=TK7xtGH0QFYTPT1avk9ujsoEa9r+VfjZfE9BbuEowOBQpMZP3V8Azo97F4PFGjzVoyPTcX
	fRfh7wACg7VNe/mv9mqj7aUNAOWwjLB1bMix1rgQgOjN+PtzBzO6dLiykvQ3OWAO1hHhuu
	zqFRzt2/rBKX+i4ZAnJP/3q6TqAjI0s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-b47a7doIPNinJTxORLK0Fg-1; Tue, 12 Sep 2023 07:33:03 -0400
X-MC-Unique: b47a7doIPNinJTxORLK0Fg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBDD0181A6E3;
	Tue, 12 Sep 2023 11:33:02 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.220])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C39912026D4B;
	Tue, 12 Sep 2023 11:33:01 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Sameer Pujar <spujar@nvidia.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 5/6] ASoC: rt5640: Fix IRQ not being free-ed for HDA jack
 detect mode
Date: Tue, 12 Sep 2023 13:32:44 +0200
Message-ID: <20230912113245.320159-6-hdegoede@redhat.com>
In-Reply-To: <20230912113245.320159-1-hdegoede@redhat.com>
References: <20230912113245.320159-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: LZXGQ2MYZZ6R3WNVJLUJF2LDE3VD6DD5
X-Message-ID-Hash: LZXGQ2MYZZ6R3WNVJLUJF2LDE3VD6DD5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LZXGQ2MYZZ6R3WNVJLUJF2LDE3VD6DD5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Set "rt5640->irq_requested = true" after a successful request_irq()
in rt5640_enable_hda_jack_detect(), so that rt5640_disable_jack_detect()
properly frees the IRQ.

This fixes the IRQ not being freed on rmmod / driver unbind.

Fixes: 2b9c8d2b3c89 ("ASoC: rt5640: Add the HDA header support")
Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 03c866c04c7a..a4a11407ab10 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2625,6 +2625,7 @@ static void rt5640_enable_hda_jack_detect(
 		rt5640->jack = NULL;
 		return;
 	}
+	rt5640->irq_requested = true;
 
 	/* sync initial jack state */
 	queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
-- 
2.41.0


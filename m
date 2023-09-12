Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1114F79D013
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 13:35:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62F1CEC0;
	Tue, 12 Sep 2023 13:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62F1CEC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694518511;
	bh=7yTkh3ebVYdyzO1U+EraGih6l6IEJsbp0ozt/60y+C4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bK6e6hdf2N4lHbYzOZgs3owAHQaM0gvNAni2QOjehHtvy7Rf0fo0WPmodiaMK4bta
	 CXruUBv2GT+rZuFshbfJPsfH0A7vTMqFh32LQZwAv2SfLXn6LG2x5S69jVT7KMSz51
	 pjbT/f1j3NodlUvjhXSNXXNhIxeoxkFSUYOPoHwc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76167F800AA; Tue, 12 Sep 2023 13:33:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0A4CF80425;
	Tue, 12 Sep 2023 13:33:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDD58F80549; Tue, 12 Sep 2023 13:33:15 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 58D56F80246
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 13:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58D56F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=bItbEFis
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694518383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4IHAT93166r3YKheS9ZK6jqsBVwI86DIWmMXhcuCcSI=;
	b=bItbEFis+Kr4NiHFK2FgKQJ+juMhUO9I6oNr56HAEjHiRSic6XkMtsrHrR8C7vbnxHIwpF
	cquc5l+HWsrrtbK9nppEHAkjHaHbsEOrWb5mW6IvYhvJ0NNZ+8wAeUH+MYlCzTdi4DBZZ/
	HXBa1cZN2fec3tdjsOGo66vkfgoWcJw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-683-ZDTvCL1aOZO2eQX-VjM5cw-1; Tue, 12 Sep 2023 07:33:02 -0400
X-MC-Unique: ZDTvCL1aOZO2eQX-VjM5cw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 927E780C908;
	Tue, 12 Sep 2023 11:33:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.220])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 795332026D4B;
	Tue, 12 Sep 2023 11:33:00 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Sameer Pujar <spujar@nvidia.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH 4/6] ASoC: rt5640: Enable the IRQ on resume after configuring
 jack-detect
Date: Tue, 12 Sep 2023 13:32:43 +0200
Message-ID: <20230912113245.320159-5-hdegoede@redhat.com>
In-Reply-To: <20230912113245.320159-1-hdegoede@redhat.com>
References: <20230912113245.320159-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 2UD3TSMZKZAVCZDHBY3LQEGUXPBVP5KB
X-Message-ID-Hash: 2UD3TSMZKZAVCZDHBY3LQEGUXPBVP5KB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2UD3TSMZKZAVCZDHBY3LQEGUXPBVP5KB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The jack-detect IRQ should be enabled *after* the jack-detect related
configuration registers have been programmed.

Move the enable_irq() call for this to after the register setup.

Fixes: 5fabcc90e79b ("ASoC: rt5640: Fix Jack work after system suspend")
Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 1bc281d42ca8..03c866c04c7a 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2826,8 +2826,6 @@ static int rt5640_resume(struct snd_soc_component *component)
 	regcache_sync(rt5640->regmap);
 
 	if (rt5640->jack) {
-		enable_irq(rt5640->irq);
-
 		if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER) {
 			snd_soc_component_update_bits(component,
 				RT5640_DUMMY2, 0x1100, 0x1100);
@@ -2854,6 +2852,7 @@ static int rt5640_resume(struct snd_soc_component *component)
 			}
 		}
 
+		enable_irq(rt5640->irq);
 		queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
 	}
 
-- 
2.41.0


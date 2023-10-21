Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF4A7D1FCA
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Oct 2023 23:20:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3630A4A;
	Sat, 21 Oct 2023 23:19:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3630A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697923215;
	bh=2edbmpSdse6QTiLHLppAasj437TKMZKAa3xMDMFPF7w=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SHI5X1fwv3lxF6ylTlbS7CZU8PGESgCVNEI2fK6D3EuI0RIGTSi3VY/5ekWU38Ntw
	 E+WNF8PmMQviH/PjVZCZuaM3agQaCU1TzFaWkciEv5AqZTkKYMp/u/NSZOKbqljSjY
	 O5ZeB9CwTtml04xH7cA/eUaEc57MsSGAnbSnGOyE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF506F805BD; Sat, 21 Oct 2023 23:17:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95E38F805C1;
	Sat, 21 Oct 2023 23:17:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A031BF8032D; Sat, 21 Oct 2023 23:17:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A6E7F80236
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 23:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A6E7F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=CvKHccB/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697923043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LKIpXFjJGu8ZCvqGwQ7X9xX+JXHtZVL88aOSAPD8uy4=;
	b=CvKHccB/JuiCm9u2p4KQxPwqv/I3dVkPz63Mua3j8HZiRyB9DlenvZG0F89QbPG6wliXQD
	aRwRoUHLBuvCNfPqP55RyzYenBVb6k+igBxC/jNuFCl4J7MnMquFfRUrDPkpdpaVsy5gzJ
	VSxFdK4Yz+aahGYlmn19f4ziD/ZWj2I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-G2LxyWCJPe27CvUfdF63ng-1; Sat, 21 Oct 2023 17:17:20 -0400
X-MC-Unique: G2LxyWCJPe27CvUfdF63ng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBA31857F8C;
	Sat, 21 Oct 2023 21:17:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 159732026D4C;
	Sat, 21 Oct 2023 21:17:18 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: soc-core.c: Log components string to help with UCM
 profile development
Date: Sat, 21 Oct 2023 23:17:10 +0200
Message-ID: <20231021211710.115239-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: EZYDIJI7E5VPWF2OTKXQYPVL36D4YE4L
X-Message-ID-Hash: EZYDIJI7E5VPWF2OTKXQYPVL36D4YE4L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZYDIJI7E5VPWF2OTKXQYPVL36D4YE4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Various ASoC board/card drivers use a components string to communicate
to userspace which output (speakers / headphones) and input (internal mic /
headset mic) routes have been setup by the card driver so that the UCM
profiles can dynamically adjust to this.

ATM it is sort of hard to figure out what the component string has
actually been set to by the kernel. Log the components string set on
the snd_soc_card to help with UCM profile development.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
An alternative solution would be to add this to the asoc debugfs.
---
 sound/soc/soc-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index cc442c52cdea..7d199251c6c5 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2154,6 +2154,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 				card->name, ret);
 			goto probe_end;
 		}
+		dev_info(card->dev, "components: %s\n", card->components);
 	}
 
 	ret = snd_soc_card_late_probe(card);
-- 
2.41.0


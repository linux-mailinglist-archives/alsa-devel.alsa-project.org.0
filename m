Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE6C7A5320
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 21:32:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 209B6886;
	Mon, 18 Sep 2023 21:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 209B6886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695065530;
	bh=nNVzcjidHT4+S8wavIQQJpd/aViHA64l2KQvyJZUMkY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kdrp6Yz8ZNDaOOoChV4NC2hIsfYSmTjlfIPJS2W/oFluNKpTLb1izpagdrfNw74bu
	 eU9l8AqDHc0u6TEkI01T7jiCZTYY9IqwTFwGOtaRBBQfEKexPHzTEwvo8CrhhFbaFK
	 HnzDjexkM1B2DZHTUP+KfqwoCfwC2oEx9DxZpqe0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55897F801F5; Mon, 18 Sep 2023 21:30:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 647A3F801F5;
	Mon, 18 Sep 2023 21:30:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A240F8025A; Mon, 18 Sep 2023 21:30:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E097FF800AA
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 21:30:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E097FF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UqnMbUb6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=WjAGfeimratsUjROsssvUEhysKjXohiEHjdvItodlXc=; b=UqnMbUb6aiH8ne5wsoeSYpw+iI
	7jD6XuSual3ZoBM0Hxbeq9Iw7qGSKuNr6XLbj5LqIe2PM0HX/77XJO9GdR/ZvYN2eEhFXBkZzXmkH
	7jn7y64xp6y8d5rJQDdDptd9I7YcI3ydmjWRol+xe2g/TKrO4PVn4u6ITdckqJCRJDIOE9MQ2JDgZ
	zrun5Sg5lWgMA02zwXvwlDNL+lM066/7Rb2jFTbMHIU+anlWdOVetNr14gQ4SCeDLRrf0FpBvADbd
	8ECqEMcFbDfXhOG17B4LJ5PeDo7G6Q9tJMNiWQj3vU29KbNH2v3PjUF2n+QrVi29YQeKliAcagYEm
	Dl2AVrPQ==;
Received: from [2601:1c2:980:9ec0::9fed] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJxE-00GCGq-1N;
	Mon, 18 Sep 2023 19:30:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	Lee Jones <lee@kernel.org>
Subject: [PATCH] mfd: cs42l43: add REGMAP_IRQ requirement
Date: Mon, 18 Sep 2023 12:30:42 -0700
Message-ID: <20230918193042.31524-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SGFETLZBJAYCA6M6JKO37MPIQ3IA35YO
X-Message-ID-Hash: SGFETLZBJAYCA6M6JKO37MPIQ3IA35YO
X-MailFrom: rdunlap@infradead.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SGFETLZBJAYCA6M6JKO37MPIQ3IA35YO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cs42l43 core uses devm_regmap_add_irq_chip(), so add REGMAP_IRQ
to what the core driver selects in order to provide this API.
This fixes a build error:

aarch64-linux-ld: drivers/mfd/cs42l43.o: in function `cs42l43_boot_work':
cs42l43.c:(.text+0x19d4): undefined reference to `devm_regmap_add_irq_chip'

Fixes: ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: James Schulman <james.schulman@cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org
Cc: patches@opensource.cirrus.com
Cc: Lee Jones <lee@kernel.org>
---
 drivers/mfd/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff -- a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -241,6 +241,7 @@ config MFD_CS42L43
 	tristate
 	select MFD_CORE
 	select REGMAP
+	select REGMAP_IRQ
 
 config MFD_CS42L43_I2C
 	tristate "Cirrus Logic CS42L43 (I2C)"

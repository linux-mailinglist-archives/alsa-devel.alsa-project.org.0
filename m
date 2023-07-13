Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7858175159A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:55:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDACAE0F;
	Thu, 13 Jul 2023 02:54:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDACAE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689209737;
	bh=DMcBbHIWaHTbIq9ru63qI3E9fkbN5xT//N91HNaGRtQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q5afkk62na1rNz1l3KXNpP96We7gAG1k5jHOunSL7njSOBNv+BrKScR6WSQQZw108
	 KtrRAV8nGUnAG1U4oy1mncc45iM4ip7kwSLKgMlRhKD8P7xkaNj81h6OBF/BLJ0lUM
	 2ma0BjAciqIuL2/wamQLAX6D34kWfzSlTyA+HQ1Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36533F80551; Thu, 13 Jul 2023 02:53:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72A8EF80551;
	Thu, 13 Jul 2023 02:53:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 300E6F8027B; Thu, 13 Jul 2023 02:53:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B969F80249
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B969F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ROFLvgG/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B78A619E6;
	Thu, 13 Jul 2023 00:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064B8C433CB;
	Thu, 13 Jul 2023 00:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689209625;
	bh=DMcBbHIWaHTbIq9ru63qI3E9fkbN5xT//N91HNaGRtQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ROFLvgG/95K1Vzvv61tkPhBFx4BcwLyxuWkepaw/umfwk90qjK/RU3bBFaDA4+4F5
	 bu4JpXyZRQyTJPJ7NfCE+FawMu4k3fH7UwqCdIp7lpb2o/eYQ2y9x82yQYLYxRUS/t
	 DV+aJ60eHxvP+HDB35ONWLbiYBvTLiAim07ckPI3fupKSotXs0KMc0vhC4m1wxzw8d
	 fsPVKsP611YjSlYI0jIH28cpMxswWYA1q7r2e6TGFoprIUB0qUeu579YT5/1EPegqU
	 OzcNCYjtNn8iUYFfvBXx6Y1jYf5aaPhxrcOQrKsKYaYStOCzcpvX2GFqsW//c09SHP
	 PhzZP85w58kJw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:49:20 +0100
Subject: [PATCH 02/11] mfd: cs47l24: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-mfd-cirrus-maple-v1-2-16dacae402a8@kernel.org>
References: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
In-Reply-To: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DMcBbHIWaHTbIq9ru63qI3E9fkbN5xT//N91HNaGRtQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0sLyGy1B+IlTty1iV5NhQQZdA3OWvcl8H5Wn
 G/JGK/Ynm2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9LCwAKCRAk1otyXVSH
 0I+KB/9B/QsLxA6eB1e7qKUw8kkQsEsl2XJwSzAZjaCv97Ha0jWFXW0cR5/MyGCZDA4PUkMC2LP
 ZrRSdBhQbRJcBZY0xPErt79780tKWh2jgnC/Q492I0n0cUgtsNuNVeGzDGScFgT6/ynVcJxoLlE
 fSrN3mK25sWxMmsYRmfupHVYlPoivrglgPE99BU54nc87HIgE6I9IkmIHWbHVJcewiKr5/T/Bg3
 z6AllUElH+S0C02lNq93+grbmfHYMdOeqRfaqOxTPsOl7h+LMbjDWbS78O1IN6DqDUiHV7yyXax
 V0HlXVIqsiAtX165jsk73K70XDUqPn8CyRu3gh4KaiK0Xsgw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: CGVZQIGBKRPF65PDY3IXMVN2PYC6RSMF
X-Message-ID-Hash: CGVZQIGBKRPF65PDY3IXMVN2PYC6RSMF
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CGVZQIGBKRPF65PDY3IXMVN2PYC6RSMF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the cs47l24 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/mfd/cs47l24-tables.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/cs47l24-tables.c b/drivers/mfd/cs47l24-tables.c
index c289d92a5c1d..878dfd298a17 100644
--- a/drivers/mfd/cs47l24-tables.c
+++ b/drivers/mfd/cs47l24-tables.c
@@ -1616,7 +1616,7 @@ const struct regmap_config cs47l24_spi_regmap = {
 	.readable_reg = cs47l24_readable_register,
 	.volatile_reg = cs47l24_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = cs47l24_reg_default,
 	.num_reg_defaults = ARRAY_SIZE(cs47l24_reg_default),
 };

-- 
2.39.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A0F7515A6
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:57:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 312C1E8C;
	Thu, 13 Jul 2023 02:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 312C1E8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689209843;
	bh=4xCyosK5hPNwehtDaNrTf/Y8gMcOBjAwl62LZXcJO2k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F+S1HMl/QQegSWAjazqxnEZBdCuzlrwuXuY9eUE+D1KvsczuNBhQrDRWXmpv/mTOd
	 ol3xjOtuQrSitm7lZ9D1hJJYh+TLu54oiQTtikqcaB7uHv+IiD+ytZ6iUKn7PSiTek
	 BK+GKtjRKxvRgcqy4SDZSItjGcmL4Z2iKCydAiyo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76CF8F8055C; Thu, 13 Jul 2023 02:56:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1EDEF8055B;
	Thu, 13 Jul 2023 02:55:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07C9CF8058C; Thu, 13 Jul 2023 02:54:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E6150F80580
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:54:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6150F80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pSkjhgIm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AB869619EF;
	Thu, 13 Jul 2023 00:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67001C433C8;
	Thu, 13 Jul 2023 00:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689209639;
	bh=4xCyosK5hPNwehtDaNrTf/Y8gMcOBjAwl62LZXcJO2k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pSkjhgImx+SaRhrDL82JHZ6UnXod1X3YmYRn45w9oGQgn9Extnkav5IsHqNWbSzy7
	 ScwQSFhloyQRWAlIykv073UWQQqwVF6MLtRvUA+xKdyj9jMfd4aAq+eGCBh/EohZsP
	 Dk3PksxGem3QhDZzxVXBgyNFpK1TSiOAKJADaiKhOk4q/QUr4z40RmLIlqxRJtUWe/
	 Mo51nn7fpeWlg/IxQEQYbxMVRMQrC3lpq9t9JMe+jT6ihfQus1a0RwrOj7YRiDPmEF
	 jN6wpw30eMKaL79A6s9+fk8QAieP2PGlfEzajy9UbyRzBxowQBbfpV2CsW7dw0clMT
	 HA0ILUy3wlZbg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:49:26 +0100
Subject: [PATCH 08/11] mfd: wm5110: Update to use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-mfd-cirrus-maple-v1-8-16dacae402a8@kernel.org>
References: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
In-Reply-To: <20230713-mfd-cirrus-maple-v1-0-16dacae402a8@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Lee Jones <lee@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4xCyosK5hPNwehtDaNrTf/Y8gMcOBjAwl62LZXcJO2k=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0sQ6b19gj1t3pk+IspVD63ACwUKmce+gW+3J
 fVQOh697P+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9LEAAKCRAk1otyXVSH
 0FoECACGXALSQaWFQAnJ0GizEuUj7FSKDd7D6pHsgjYAqoKb7eaoSlzGKd5EgQcCwrFup4UB2St
 MDE2EPWQfIRPszMNUzZHPqVZI52AedurNdmwu1olUyR+QMHJXKYqBgScjgMZIguDv8195eJCZnp
 Ril2f8nSFPL5sgFaDLjvIPSJhDhKRD97w/lTTOPuylJ4oVzo8BHDACN13jPFtoxGVChmWLftrBa
 NExSO5w5VkWIND6zBvpiGM18YU6pbjWOJJg+eWUmXN5QFonj+qlRgmpmSYXf/Uh38py14OZObxd
 otVyxuRLhmraYFSZrS2Mnkh/s8/ryhqsLmFiq94WRrUB6X+2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: UNSWMBP326SZHMMOZAFK6NBSY5EG424Z
X-Message-ID-Hash: UNSWMBP326SZHMMOZAFK6NBSY5EG424Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UNSWMBP326SZHMMOZAFK6NBSY5EG424Z/>
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

Update the wm5110 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/mfd/wm5110-tables.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wm5110-tables.c b/drivers/mfd/wm5110-tables.c
index 65b9b1d6daec..eba324875afd 100644
--- a/drivers/mfd/wm5110-tables.c
+++ b/drivers/mfd/wm5110-tables.c
@@ -3218,7 +3218,7 @@ const struct regmap_config wm5110_i2c_regmap = {
 	.readable_reg = wm5110_readable_register,
 	.volatile_reg = wm5110_volatile_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm5110_reg_default,
 	.num_reg_defaults = ARRAY_SIZE(wm5110_reg_default),
 };

-- 
2.39.2


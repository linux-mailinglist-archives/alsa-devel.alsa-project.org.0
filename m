Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33446751528
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:22:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 001407F4;
	Thu, 13 Jul 2023 02:21:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 001407F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207730;
	bh=vPdJg7Afn0wwLfXOBMhM4nmwJbycCVKMF0pEW1NQ59U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SH5Hd3A66KzkeUbGKvnyfI6zMQhAP9IfsDfhWTfctItmaszQhr3LUe+ka6ZAsfPjg
	 +sO0courbw0wfRqN7A74M2YRXR72f6zjrvhAStz7E1oj9YaHKvoeRHDIzByRb7Wi7F
	 I9PpXvaj+lLxs96SLbYW+SgcOtFR0iWbTVgN8gbw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5C7AF80699; Thu, 13 Jul 2023 02:15:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13C24F80694;
	Thu, 13 Jul 2023 02:15:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E153CF80630; Thu, 13 Jul 2023 02:15:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AEA00F80617
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEA00F80617
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SrV8LGP7
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91F6761987;
	Thu, 13 Jul 2023 00:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51A6C433CA;
	Thu, 13 Jul 2023 00:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207322;
	bh=vPdJg7Afn0wwLfXOBMhM4nmwJbycCVKMF0pEW1NQ59U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SrV8LGP7mns8WGmttezb4g/MpD3W6Lv7QPAKdU3ZwaRqMGUKvYKlb81G3ECS9s6zK
	 xJOImK8wC8fR4ANy3GjPRiNnvaVBJ6F/pacIuOzpQHxBw/Mzv5VBhittMeMlooiONN
	 iOiWUtWFbZhks3KGD40rdTdC7/I5klPUqhU4fAag4zc9AylSP3tRqgCQcrGd/9HgrV
	 crhf7RgQuMxbWoyLzOGv8TW0jSnB4m3hdjsYCiCuCiOcKKlXLP8lwgmZfdUsOZmYva
	 RdmQruvjYTIO8S/nRqOIuMBk3QVbtWhNw5LrN8v0JZi5LLqlycmnSJFcecYkJmHhz4
	 TjsFYlx2wv1UA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:37 +0100
Subject: [PATCH 24/48] ASoC: wm8750: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-24-a62651831735@kernel.org>
References: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
In-Reply-To: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 asahi@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vPdJg7Afn0wwLfXOBMhM4nmwJbycCVKMF0pEW1NQ59U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G+QQyJXHifqhSyTTTLDek8jgzEwhXonp3+y
 4vqNf+Trw2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BvgAKCRAk1otyXVSH
 0FXnB/956q+NOneUZ/O25iIMPDPQ/u8Cfdj1HQtOt9DkEUe75m/Uiut7qQ9gpV6yxIZ60XvpTL0
 Y9xjf3ybRf+DQ+lnctdC9h++fGYd7vnkrzFLouTs5zA5kb1unwX+wAGVQGCvXn67EwqPDoQdE/S
 2Eh7xawVNM0xU1G6se6FHiKxc24QNzDELjVuW2dhTQ6eoq7PX8+HN88W+NN+kUuFn3VMFM4+pgb
 oMS8WmQNL4C5QQGIdVVvW9WCt5wv6e9EscRwQ0vOc6ty7w0im1azPUKHUXitt7ao/dMvZo5+IEO
 eAGjNxyREHRj95qPbrDodaXeYrE5N0DdedcR8Y8msquNXqpF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: 6LKPR7MHDD6EEAJGXTY6OMC76NJ733PK
X-Message-ID-Hash: 6LKPR7MHDD6EEAJGXTY6OMC76NJ733PK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LKPR7MHDD6EEAJGXTY6OMC76NJ733PK/>
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

Update the wm8750 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8750.c b/sound/soc/codecs/wm8750.c
index 20dc9ff9fea9..2d2feaf95e49 100644
--- a/sound/soc/codecs/wm8750.c
+++ b/sound/soc/codecs/wm8750.c
@@ -735,7 +735,7 @@ static const struct regmap_config wm8750_regmap = {
 
 	.reg_defaults = wm8750_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8750_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 #if defined(CONFIG_SPI_MASTER)

-- 
2.39.2


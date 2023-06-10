Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D29A72AB1A
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 13:18:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B75D82C;
	Sat, 10 Jun 2023 13:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B75D82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686395925;
	bh=COPhYOOZ4nhSsmPkzFJZo+ZRdtq8CpI1MCJbWvu1dyA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e7KDgUznqvHNs9EnBwEIlcF00h5aNDqXKszeHNwOLMgA7KyCMRKro4OJp09oirIfI
	 C7ZkGJGAL2JCSX59HPDZoX/pQiE67m0zcU4CbZGR1vVs0XsF1pUfCl6+XFavbQ5Nkq
	 fT9oVoY3gM5Q01kMA9imPwsH7o6AwzfTnd4Fwv0Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A471F80571; Sat, 10 Jun 2023 13:17:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A8EEF80553;
	Sat, 10 Jun 2023 13:17:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0942F8016C; Sat, 10 Jun 2023 13:16:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DB48F80199
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 13:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DB48F80199
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=abj2yoj4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1D5C06147C;
	Sat, 10 Jun 2023 11:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD973C433D2;
	Sat, 10 Jun 2023 11:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686395808;
	bh=COPhYOOZ4nhSsmPkzFJZo+ZRdtq8CpI1MCJbWvu1dyA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=abj2yoj4kxd2u7QpYR/vO+3wYw2kWwx4OB6B4sd/BhMVc34JGc7dQah7qJOS1W0Id
	 HwJMsboOVerHey2VWELIQx/D5pNx+7vgjIyAe4TTPjb+u6K0L2TrgswinEp6AhV7Yg
	 Gw6IQ5OwVO4xMgV284XX/dcHtRS0KaGyYT3+a275QabUNIsZi9LxwX0fYu3//08DZs
	 WhYA7Z68oRUnnEhhnWGnnqF5N4YW8Wa+WP4g5OUFfOzKgBAUwLgXLcZ5R3x9zVegtf
	 UPgJ5um2eFACpatvvQ75AjvW9HQgMRZcruNSeivhcgMHa7+Ox9KCrdEZvz1hMU1M/C
	 gbVUU3ttV6ndg==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 12:16:38 +0100
Subject: [PATCH 2/2] ASoC: es8328: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-es-maple-v1-2-45ada77f5643@kernel.org>
References: <20230609-asoc-es-maple-v1-0-45ada77f5643@kernel.org>
In-Reply-To: <20230609-asoc-es-maple-v1-0-45ada77f5643@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=879; i=broonie@kernel.org;
 h=from:subject:message-id; bh=COPhYOOZ4nhSsmPkzFJZo+ZRdtq8CpI1MCJbWvu1dyA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhFucXNjd7pzOyCTRv5SUzbIDMxEUb4sSAX5nmytn
 OresP4yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZIRbnAAKCRAk1otyXVSH0J3vB/
 0cx8iyq4n5goDT+k4gregIrjX5A1C7KDdF4ilw7o79mEpjtDNoWPHwh9XKY9zOj2gYE7ciXLR/vxav
 BLt5CCO8ShsyGyCvTObDGWF/3UQhYUYUuCldq5eYxDM9RKr8ltyrCc33BAUL0caNy6sZQSdL0KmSuF
 Fk4WqjiMZYRGU7jvt8dz80CkljJZIwUDMab5n94HcG0Y5ieXSqJikKiU/i1u1FVneG+Vbdcz4Egihh
 NiLy2ApouLHmv4hEnGBZrhw4TcQsx7ZqkI0O1jOTur6loVSgZRIBKfQy6fXI5XBw01fUMXs4DJoe/z
 hHZO5TZWowEVRhH1+w1gnDVpEFeGed
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: VKHMCBLDZ7TJJZZF5BZZ4C47SMO56S6A
X-Message-ID-Hash: VKHMCBLDZ7TJJZZF5BZZ4C47SMO56S6A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKHMCBLDZ7TJJZZF5BZZ4C47SMO56S6A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The es8328 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/es8328.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 160adc706cc6..0bd9ba5a11b4 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -822,7 +822,7 @@ const struct regmap_config es8328_regmap_config = {
 	.reg_bits	= 8,
 	.val_bits	= 8,
 	.max_register	= ES8328_REG_MAX,
-	.cache_type	= REGCACHE_RBTREE,
+	.cache_type	= REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };

-- 
2.30.2


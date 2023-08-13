Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DD177A8F7
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 18:09:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3E3C83A;
	Sun, 13 Aug 2023 18:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3E3C83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691942944;
	bh=XG4s8C5VZWpWL16L5JALDMxX9fsiR9GQIWipIjp8CeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RqMnT/uyWb/zuAmVuMPosUGTjQIERRLcBDy8VoGpki7J7w8Qi2WCwT6d4zgG6TbYQ
	 FOGsQp2BOlv6maKD3GZM18Qct8DQwxopLxflEVXf0qrisGsbpLPOguSlO/vB0TJ3xY
	 Q1WevE7M1OAflM9sFdtfhj2q9lkv5UgnVDIiRI3I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC99FF80551; Sun, 13 Aug 2023 18:08:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41883F8025F;
	Sun, 13 Aug 2023 18:08:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 978D7F80558; Sun, 13 Aug 2023 18:08:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1772F801EB
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 18:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1772F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bZGipDn3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9147163913;
	Sun, 13 Aug 2023 16:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0507CC433C7;
	Sun, 13 Aug 2023 16:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691942882;
	bh=XG4s8C5VZWpWL16L5JALDMxX9fsiR9GQIWipIjp8CeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bZGipDn3JU3G+mWZvIRepyuausHQHv7CY8PD/qi5TGKnAzMn+EDugE/X4jrXaiMA2
	 SvnizT7ptn9yKpcB60b80/6Nh7t40DkhnyFuxFOaq61z/mI8CnZgmN7F40f0oqdc2k
	 k59mRFkbGYFYZbxIoAY32eROwClJlC1edKABhkEL6YF0oNGKAZCnNoGqIyGJsoJw44
	 ZPx/eQFuKzENTMl4rLt8rzk8HxyaK9Ta6GdZ6fdCT4X8LjIbkY4b/7Gdi2ecEBb6/A
	 Rn8ExiP+1CqtDjoWTrjYr+3ek99fgepJ4eMHw8QeW6RqrOThfdHUj6asbUJbs77k1V
	 w43cAGg1KoBnA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Edgar <ljijcj@163.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	cristian.ciocaltea@collabora.com,
	peter.ujfalusi@linux.intel.com,
	zhuning0077@gmail.com,
	yung-chuan.liao@linux.intel.com,
	u.kleine-koenig@pengutronix.de,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 5.15 17/31] ASoc: codecs: ES8316: Fix DMIC config
Date: Sun, 13 Aug 2023 12:05:50 -0400
Message-Id: <20230813160605.1080385-17-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813160605.1080385-1-sashal@kernel.org>
References: <20230813160605.1080385-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.126
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OXTHG525MVJZVZPQCFK7EM2WQV5KAH4P
X-Message-ID-Hash: OXTHG525MVJZVZPQCFK7EM2WQV5KAH4P
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OXTHG525MVJZVZPQCFK7EM2WQV5KAH4P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Edgar <ljijcj@163.com>

[ Upstream commit d20d35d1ad62c6cca36368c1e8f29335a068659e ]

According to the datasheet, the DMIC config should
be changed to { 0, 2 ,3 }

Signed-off-by: Edgar <ljijcj@163.com>
Link: https://lore.kernel.org/r/20230719054722.401954-1-ljijcj@163.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/es8316.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index b36ccfc54cd69..93549f8ee130c 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -153,7 +153,7 @@ static const char * const es8316_dmic_txt[] = {
 		"dmic data at high level",
 		"dmic data at low level",
 };
-static const unsigned int es8316_dmic_values[] = { 0, 1, 2 };
+static const unsigned int es8316_dmic_values[] = { 0, 2, 3 };
 static const struct soc_enum es8316_dmic_src_enum =
 	SOC_VALUE_ENUM_SINGLE(ES8316_ADC_DMIC, 0, 3,
 			      ARRAY_SIZE(es8316_dmic_txt),
-- 
2.40.1


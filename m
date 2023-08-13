Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7921777A7C0
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 17:51:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6221210;
	Sun, 13 Aug 2023 17:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6221210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691941868;
	bh=yatYxyQ1mx85YlfY2/Fjj51Tmtpr6wmnnctVftLRvIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WGOIYiFAAtQZhHk54HvEu40idV77p2XFewsFeNIOEz3nt1b2fSYLe7fTB2hN/A70V
	 QvsMtS7y8JRHW+8jt6m61tnhCAhfiAciW+XrX1+8PkHIJ1JD7/bCmYJZ/cx3Ryc1vD
	 fVEVzdqEmFLiFOPgNsZ+Qwm0EZWeYqhgpyG2oIFA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 962C1F801EB; Sun, 13 Aug 2023 17:50:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 292CCF8025F;
	Sun, 13 Aug 2023 17:50:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25FE3F80290; Sun, 13 Aug 2023 17:50:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67B14F80016
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 17:50:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67B14F80016
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jotEyNTC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D1A4F631F5;
	Sun, 13 Aug 2023 15:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA754C433C8;
	Sun, 13 Aug 2023 15:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691941801;
	bh=yatYxyQ1mx85YlfY2/Fjj51Tmtpr6wmnnctVftLRvIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jotEyNTCa/YKe9griP1I5x9QthpMuc/67KqZU769kbVe4NsFSHIVw/S/K0whGtwFr
	 BOthwXlus+LdCNmVyMpgsmhGuuWs+qgqzzE9D2gMtJaq1bChxlJKZk9e5Ag/Wk15nu
	 TBmhGwgn+nEuYd5/p4JZ4paKpPfMWGAt+KRV3JyBCf+SvKmNMc07J2VmtUGxLVGdZ8
	 X7IjxrZSe1QNY0oIf+xC5eYtjDT64Z8ly8T7aPy+HOoar1rzHgPnRch5/Tl3PTNFNq
	 /vZzw0dFQlGkrhMEuIM2y65Vj84snl3XuN8YYYOcpqWfoyzKO670qdx/jh9SueLznc
	 zxDR30KcLiw1Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmytro Maluka <dmy@semihalf.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	support.opensource@diasemi.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.4 16/54] ASoC: da7219: Check for failure reading AAD
 IRQ events
Date: Sun, 13 Aug 2023 11:48:55 -0400
Message-Id: <20230813154934.1067569-16-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813154934.1067569-1-sashal@kernel.org>
References: <20230813154934.1067569-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.10
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KRVUESUJKOJGISWFCR2ECV7KKAVI6DO5
X-Message-ID-Hash: KRVUESUJKOJGISWFCR2ECV7KKAVI6DO5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KRVUESUJKOJGISWFCR2ECV7KKAVI6DO5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Dmytro Maluka <dmy@semihalf.com>

[ Upstream commit f0691dc16206f21b13c464434366e2cd632b8ed7 ]

When handling an AAD interrupt, if IRQ events read failed (for example,
due to i2c "Transfer while suspended" failure, i.e. when attempting to
read it while DA7219 is suspended, which may happen due to a spurious
AAD interrupt), the events array contains garbage uninitialized values.
So instead of trying to interprete those values and doing any actions
based on them (potentially resulting in misbehavior, e.g. reporting
bogus events), refuse to handle the interrupt.

Signed-off-by: Dmytro Maluka <dmy@semihalf.com>
Link: https://lore.kernel.org/r/20230717193737.161784-3-dmy@semihalf.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/da7219-aad.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index 07c5d9d354b6d..70c175744772c 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -361,11 +361,15 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	u8 events[DA7219_AAD_IRQ_REG_MAX];
 	u8 statusa;
-	int i, report = 0, mask = 0;
+	int i, ret, report = 0, mask = 0;
 
 	/* Read current IRQ events */
-	regmap_bulk_read(da7219->regmap, DA7219_ACCDET_IRQ_EVENT_A,
-			 events, DA7219_AAD_IRQ_REG_MAX);
+	ret = regmap_bulk_read(da7219->regmap, DA7219_ACCDET_IRQ_EVENT_A,
+			       events, DA7219_AAD_IRQ_REG_MAX);
+	if (ret) {
+		dev_warn_ratelimited(component->dev, "Failed to read IRQ events: %d\n", ret);
+		return IRQ_NONE;
+	}
 
 	if (!events[DA7219_AAD_IRQ_REG_A] && !events[DA7219_AAD_IRQ_REG_B])
 		return IRQ_NONE;
-- 
2.40.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AF977A874
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 18:03:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F18B836;
	Sun, 13 Aug 2023 18:02:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F18B836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691942587;
	bh=ea0NquOVk0lzJJEA6BP+iL8fl6TidPu49sSgx0ezvtY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=manTuCGoy+duzytig0gGPBuqPMmPPydrhkLQGP3cn+hH/k2HKK6AbPaoPWdvVVIBE
	 z5R8F93VduL9Z4XU0KH9qJycayKh0h+FH3WPpL8ovxrFf9kymSp0Ab6PL2dSU70/ez
	 MBLkC5VrcbdWNjQhI/3pjy69Jpgr081B8QdFj/kw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98430F8055C; Sun, 13 Aug 2023 18:01:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01BBCF80553;
	Sun, 13 Aug 2023 18:01:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52ACDF8025F; Sun, 13 Aug 2023 18:01:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6ED9CF80254
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 18:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ED9CF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TTHvCwnz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 09A5D63512;
	Sun, 13 Aug 2023 16:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C97CC433C7;
	Sun, 13 Aug 2023 16:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691942478;
	bh=ea0NquOVk0lzJJEA6BP+iL8fl6TidPu49sSgx0ezvtY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TTHvCwnzgvvlZPMBXXfI1Ocq0LiihvJPmIXlUO9tK11MmM4/UYhwgq4i462LRicRm
	 kwvPojyhGuA+J+SkhozNolWzgaWMX5YxuKmcmjHQiJBEJDjIE/em6blVCnC128hNKO
	 vXH0A4MajaxIt80+Gp69qLPbCLqIHTrl/QARfT5Si8T5bu2yba3YCCWInkNyMJVAyc
	 S+bqELy7xggNe8atBatpvc4V7s4+1hSvgvJPflKLf/RATXrhmi4ABtuCVXn7qrFy1H
	 VnOnPvu1zFngTdi/zZn1mDHunXcEAm0hUnqss/wKTZ6aBIXbj7viJLBCDiIlHufDMb
	 /Kj1OB8mpxRbQ==
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
Subject: [PATCH AUTOSEL 6.1 14/47] ASoC: da7219: Check for failure reading AAD
 IRQ events
Date: Sun, 13 Aug 2023 11:59:09 -0400
Message-Id: <20230813160006.1073695-14-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813160006.1073695-1-sashal@kernel.org>
References: <20230813160006.1073695-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.45
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CAZTFIRLOUS7BAGMDBPOFZQRDFJUXSXB
X-Message-ID-Hash: CAZTFIRLOUS7BAGMDBPOFZQRDFJUXSXB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CAZTFIRLOUS7BAGMDBPOFZQRDFJUXSXB/>
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
index 49b1622e7bada..9251490548e8c 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -353,11 +353,15 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
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


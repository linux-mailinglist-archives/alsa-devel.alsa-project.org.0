Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA1F77A931
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 18:11:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43829DF6;
	Sun, 13 Aug 2023 18:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43829DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691943063;
	bh=xctx3t+9thWUv+SGvb+/ovZIHQsrKTgquRUBB7+SrHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Us6z6y0Lf5f9ji4T+KQSDjpTuVLdVramKqOhJ9sTmY8S3wgGeunrLIokMWLYoKCaX
	 tAc8s6xkY6ChSobZXZjXBsnmGF6pKGhKQ8vCGAkgcSiAFss9L5jztelS+0FproshOs
	 7XrivA0zZ6hKtezsREMf4lwNaYN+bYrix2w/q0kY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06C98F80272; Sun, 13 Aug 2023 18:10:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87630F80552;
	Sun, 13 Aug 2023 18:10:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E28FF8025F; Sun, 13 Aug 2023 18:10:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87E76F801EB
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 18:10:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87E76F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LMQd5bKT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7679B63AE9;
	Sun, 13 Aug 2023 16:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755BDC433C7;
	Sun, 13 Aug 2023 16:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691943007;
	bh=xctx3t+9thWUv+SGvb+/ovZIHQsrKTgquRUBB7+SrHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LMQd5bKTYuVXs8FzGGXDaDyEi/P7oL28XrRh0Edzyq3w1WFhJ8tPdsGXspOV8TWLp
	 BNRJyf9MPWCaEGB5cDopn+0aXmV9lxh9YFOYuRiIEfN0d7o1i/beT7h0aFrPl6IDfL
	 yGh8XcFXySid3g13MQWjaRPexUlS+ceJk2fREv0BCAqvp0qN6rdGxUf7XE12p8epGl
	 FztWRXtmdyDgev3EgS+Gg8n1GA1V6XIIlPZmbipJeM6FN6JaSeiaSFE7etWyaPsp9u
	 FCxZGIN8H2/OBZXqB0l/4L0sali4tWmnSEcMoLefhZk9zA1d8cJG37moLuEhgJ+K61
	 LGetxjlRhA+bw==
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
Subject: [PATCH AUTOSEL 5.10 07/25] ASoC: da7219: Check for failure reading
 AAD IRQ events
Date: Sun, 13 Aug 2023 12:09:18 -0400
Message-Id: <20230813160936.1082758-7-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230813160936.1082758-1-sashal@kernel.org>
References: <20230813160936.1082758-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.190
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DDUQFWVMECOYV2XHDOY2DBXTJYZR66FB
X-Message-ID-Hash: DDUQFWVMECOYV2XHDOY2DBXTJYZR66FB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DDUQFWVMECOYV2XHDOY2DBXTJYZR66FB/>
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
index 7fbda445be8e8..b316d613a7090 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -347,11 +347,15 @@ static irqreturn_t da7219_aad_irq_thread(int irq, void *data)
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


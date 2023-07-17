Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4755E756E5D
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 22:35:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3A0ADF6;
	Mon, 17 Jul 2023 22:35:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3A0ADF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689626155;
	bh=cdhA/uWMGFYNLiuZXNgnxDS/KR9lMC2udWWSbRYPndE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LitSL3HI6I/pjqi23Hu4kzGh7AIlhmlDqc3C6PBtGGrmBz69ZRQNepR7aLxr4Z4YI
	 d3h98SaoBrr5L3WtsOC/ZMU/vhU4sAXDx8rjcboK5VMQGGG9MBUqDJ7ZOYufRCfnej
	 G0eEyozaqJkpbBDGwpzoALLF54yXiIAjzIW2Qb9g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82246F80527; Mon, 17 Jul 2023 22:35:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7BF7F8032D;
	Mon, 17 Jul 2023 22:35:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E51EAF80494; Mon, 17 Jul 2023 22:35:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4E70F8047D
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 22:33:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4E70F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gLZUVojg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 96EA461233;
	Mon, 17 Jul 2023 20:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B94ECC433C8;
	Mon, 17 Jul 2023 20:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689625999;
	bh=cdhA/uWMGFYNLiuZXNgnxDS/KR9lMC2udWWSbRYPndE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gLZUVojg4jKy4PTMuuRaJRkPy+KTOrIc2UqPsvLIftUTjRU0kvMiaTuoTgweG9Bht
	 gDFKrXKBxBCs+bnehoD3lhqDPcmEDlSGL6Idg9YliOGb435aFLHWn5PHm8/uCb3Kpm
	 LDaOJU5IrN8F5ERCzO4kozWw4HWr+CTKw9cPrimuqScteGzPG3tEnRkSJ+YGKLXLYF
	 8oV/pREqjmFcItdEBJncwBwbGTV6R7uYNsU0Mkp+/0bZfzDp9mXJptYkw//OTqgE0E
	 RNPM3BrwctvGv3QNMKYhdq3dEbQCBp8UIOVb909e4fIhvossYCCIUNYtbLks91BjZ1
	 MGv+Am4MHzkGw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 17 Jul 2023 21:33:05 +0100
Subject: [PATCH 3/3] ALSA: hda: Use regcache_reg_cached() rather than open
 coding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-regmap-cache-check-v1-3-73ef688afae3@kernel.org>
References: <20230717-regmap-cache-check-v1-0-73ef688afae3@kernel.org>
In-Reply-To: <20230717-regmap-cache-check-v1-0-73ef688afae3@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cdhA/uWMGFYNLiuZXNgnxDS/KR9lMC2udWWSbRYPndE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBktaWHp8xs+otXp3Fz83pPngNJL1ch5h3eptyOK
 9g68ULu8WKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZLWlhwAKCRAk1otyXVSH
 0FCcB/4/yqh/MT+mdIfR75L/u63k+FCJNO88xJeft85zjt58cF6oIUCQASp6BHpO+VK0Mqo+gaj
 vG2O+pbUy5tqfb6sVSbE3smMne18FuwqkldckIQsIxAQsJmjZgroJDCXgjiFqmIpfURfXQE021y
 kBTCvDuGa4jfVy7zC5w8JYa6TabufjXiuWOZ04u9a+8ngQjVvPbJFxFEG3OMKpGdOx/mHIhyFj/
 OjMt+3AN1u3TX69YaRBa+908Tpc7x20j2RZro3hA/wiZ8Ogw2Xj1C//ABatTJx3oh57QxhcfXqC
 oMyVfCXaeM3x8HbZiNxXDtBC/mob9h9QTvXJLImqCDortOj+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: LCFWYOPFOARDWVOMP6SZLMUVGQIEWJ2P
X-Message-ID-Hash: LCFWYOPFOARDWVOMP6SZLMUVGQIEWJ2P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LCFWYOPFOARDWVOMP6SZLMUVGQIEWJ2P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The HDA driver intentionally drops repeated writes to registers in some
circumstances, beyond the suppression of noop writes that regmap does in
regmap_update_bits(). It does this by checking if the register is cached
before doing a regmap_update_bits(), now we have an API for querying this
directly use it directly rather than trying a read in cache only mode
making the code a little clearer.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/hda/hdac_regmap.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/hda/hdac_regmap.c b/sound/hda/hdac_regmap.c
index 9b1bcabd8414..97cee096a286 100644
--- a/sound/hda/hdac_regmap.c
+++ b/sound/hda/hdac_regmap.c
@@ -556,17 +556,14 @@ EXPORT_SYMBOL_GPL(snd_hdac_regmap_update_raw);
 static int reg_raw_update_once(struct hdac_device *codec, unsigned int reg,
 			       unsigned int mask, unsigned int val)
 {
-	unsigned int orig;
-	int err;
+	int err = 0;
 
 	if (!codec->regmap)
 		return reg_raw_update(codec, reg, mask, val);
 
 	mutex_lock(&codec->regmap_lock);
-	regcache_cache_only(codec->regmap, true);
-	err = regmap_read(codec->regmap, reg, &orig);
-	regcache_cache_only(codec->regmap, false);
-	if (err < 0)
+	/* Discard any updates to already initialised registers. */
+	if (!regcache_reg_cached(codec->regmap, reg))
 		err = regmap_update_bits(codec->regmap, reg, mask, val);
 	mutex_unlock(&codec->regmap_lock);
 	return err;

-- 
2.39.2


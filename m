Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C03756E58
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 22:35:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6DBADFA;
	Mon, 17 Jul 2023 22:34:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6DBADFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689626109;
	bh=asnEKCSLQS/uNfyRgYl+ksnbJzzBRAv8Ur+NiRrtqSE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LECOdFok5tzjyNLOk3Vu8621MMTtqQy3Js6Pwuu1OR10Chfn3+D2gD4z7F/D5WBZl
	 i/gP8wD5gUMK3V1vpC6W78G+i6aJEJ/1lb/iMS730MpKgFw/zDAjsz6yGtc+hZdFdR
	 bTlYqjIqjOY1oR4mJySS4fZ6NjRLScyoUSI2uNcw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13247F8056F; Mon, 17 Jul 2023 22:33:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 818C4F80520;
	Mon, 17 Jul 2023 22:33:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86F15F804DA; Mon, 17 Jul 2023 22:33:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCED6F8027B
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 22:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCED6F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dfbHZzBN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F92261233;
	Mon, 17 Jul 2023 20:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12199C433C7;
	Mon, 17 Jul 2023 20:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689625995;
	bh=asnEKCSLQS/uNfyRgYl+ksnbJzzBRAv8Ur+NiRrtqSE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dfbHZzBNjmAh2GPJQXl4+PaLzVLBTGWLswICTnQVJW216Oo8KlI66DrLdViLmyf2C
	 9rK28bfTGMx4Q0OHIrus77fko1PutrcwiMIHF41ViglSealy8zAZgcAwvU3SnTewYc
	 oynzCKz+H5BOCykQKioEVO8XQlr6ea6iOYeG8yeFCCSUtoaWHfnZYYAzMpldeu/5Fd
	 sPcKYDeBugl4TJ0gadfrRYF9R0wMV2mu822lsNUEbgr8dvQPF3RD39KWkCeriq7sU6
	 2o/nO4NJQCSZ2LUcDVwOlVZPDyzep9NAdPclZDWYNki1And5yKrvoTOUWjZHu9l683
	 g2XEA7uVOyktw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 17 Jul 2023 21:33:03 +0100
Subject: [PATCH 1/3] regmap: Let users check if a register is cached
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230717-regmap-cache-check-v1-1-73ef688afae3@kernel.org>
References: <20230717-regmap-cache-check-v1-0-73ef688afae3@kernel.org>
In-Reply-To: <20230717-regmap-cache-check-v1-0-73ef688afae3@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1894; i=broonie@kernel.org;
 h=from:subject:message-id; bh=asnEKCSLQS/uNfyRgYl+ksnbJzzBRAv8Ur+NiRrtqSE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBktaWFmLfcJep5LqvVZiSrYHrXWYcDXZnPESyRi
 cO5BUNFXQKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZLWlhQAKCRAk1otyXVSH
 0IDsCACCdkNOcaAD2yxTysnsoFA5Go65pphKHCRH16FNb9l77a994IjWeN6pqJb/HoIhCx4v8qm
 NV9os3vvsXgvzc++6x42Fe0DnYKdlF4FWccBqddxjdYtGKxQFocxz6QxfDJMApOrf8jjgBQ2Lga
 LrrOASaENXQfKC1M7W/+MBpzvLhEzXi3Zlm9rtoGNce3EFxYe4XZBCWkT6LHlF/ggLDMk+4PjUo
 b5aVLhhWfO0rLd0ZodVPjM7S3IWWjsahQC0HiTZQB7QhVowINFH3+DFd7HjAPBQvLM/aQvw9lRx
 SR2v3OItdm7tkpng4SgeDNv76HdCJQIYiaYP0T5+q2VHcx5z
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: EEDYM2UHAHB3VAEANGJNH536QL252LGW
X-Message-ID-Hash: EEDYM2UHAHB3VAEANGJNH536QL252LGW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EEDYM2UHAHB3VAEANGJNH536QL252LGW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The HDA driver has a use case for checking if a register is cached which
it bodges in awkwardly and unclearly. Provide an API which allows it to
directly do what it's trying to do.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/base/regmap/regcache.c | 23 +++++++++++++++++++++++
 include/linux/regmap.h         |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 28bc3ae9458a..4d25a906b688 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -561,6 +561,29 @@ void regcache_cache_bypass(struct regmap *map, bool enable)
 }
 EXPORT_SYMBOL_GPL(regcache_cache_bypass);
 
+/**
+ * regcache_reg_cached - Check if a register is cached
+ *
+ * @map: map to check
+ * @reg: register to check
+ *
+ * Reports if a register is cached.
+ */
+bool regcache_reg_cached(struct regmap *map, unsigned int reg)
+{
+	unsigned int val;
+	int ret;
+
+	map->lock(map->lock_arg);
+
+	ret = regcache_read(map, reg, &val);
+
+	map->unlock(map->lock_arg);
+
+	return ret == 0;
+}
+EXPORT_SYMBOL_GPL(regcache_reg_cached);
+
 void regcache_set_val(struct regmap *map, void *base, unsigned int idx,
 		      unsigned int val)
 {
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 8fc0b3ebce44..c9182a47736e 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1287,6 +1287,7 @@ int regcache_drop_region(struct regmap *map, unsigned int min,
 void regcache_cache_only(struct regmap *map, bool enable);
 void regcache_cache_bypass(struct regmap *map, bool enable);
 void regcache_mark_dirty(struct regmap *map);
+bool regcache_reg_cached(struct regmap *map, unsigned int reg);
 
 bool regmap_check_range_table(struct regmap *map, unsigned int reg,
 			      const struct regmap_access_table *table);

-- 
2.39.2


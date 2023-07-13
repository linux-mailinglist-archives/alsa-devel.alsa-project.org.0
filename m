Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C416775150A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:16:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D7301F6;
	Thu, 13 Jul 2023 02:15:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D7301F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207377;
	bh=kJFT9cEbKj5HvTZIT1qU5x1lwzXqqMv4rOf7af1iuCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZdaWfzWT9UJfKFqegBITwXB2N0qBlaKEZZmKJF6WbUqIJxhmUCaB5rfNRdU0ZMy8A
	 Y/DMZkMQNBbh3k4Wv5ZLo+dGrKuttVCSaGPZU9dJ5BJd4rKXu+8rQDbF0Hw+Mnm9DY
	 pN2PHFdazgs1nzY4UPYNMKWEJJKPmYVg9AEJOkjU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1278BF8057B; Thu, 13 Jul 2023 02:14:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C6A2F80564;
	Thu, 13 Jul 2023 02:14:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D54EFF8027B; Thu, 13 Jul 2023 02:14:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 20FADF800E4
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20FADF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lEvUaMrM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26724619B9;
	Thu, 13 Jul 2023 00:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB39C433C9;
	Thu, 13 Jul 2023 00:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207255;
	bh=kJFT9cEbKj5HvTZIT1qU5x1lwzXqqMv4rOf7af1iuCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lEvUaMrMJGJC86aMbp8sOKRjJPNRfO9bYUE9kEaLSv7ANHr8mcILnS2twuH3vM6TN
	 PNQfn+2rcApkcKOsuuupVhsIp02Q2C7jrdNJHzfDF5DmKAKH//A/wkNJJmlHqOgIbq
	 V2UJyON7dR0oGUWQxuKrgezY9VfnKxBfLaCRmEWG0Umh5Vn2xxqQWZNbn45dbvkUm4
	 yZNcASjPFEuX+Xu+YK9X8dRnx6rHGM3KBkTS5q90G5TLisqnb0u0NSEy8o4IEQmZAq
	 5wZGt2AQkti9rxyLH+KyFxSRsYiQln2ZuxGyvNFDaptDTxykCACsDYlEsGGOGVM30h
	 4L+jUWJ2ZOizg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:14 +0100
Subject: [PATCH 01/48] ASoC: cs35l36: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-1-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kJFT9cEbKj5HvTZIT1qU5x1lwzXqqMv4rOf7af1iuCQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0GsCUUYHj47ptczrEIZdar6i8xxcjvJFnY0d
 LClLoNI7YyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BrAAKCRAk1otyXVSH
 0HGNB/0XApHxFtoTudv8vcnWUrVnQYvH+WeOWVIIkLM0rWuOZ7C6jG/2MR5scjoNOB+JsOl3DAN
 HEgbm7v7mnweiDZcVh+ge2uloCRNOxktIoIYRdqB/Eo/feEuWwpftY6WckrlEU+PXEZSWks3/s2
 iCQnF5qnfiwyrlwpB5Zpw/Ds9s/HoquQIEm35lGsTOp68XA+6xjogo7q8ido/6McLQ44vC1qR+T
 YBoN5NCbCUKCYIboNoe5LzgzX993VPQ2FqYQpde5Mt5RGXg0Ftrxlv0eLyYKhSXAv4MWg7DcEY6
 ndIQ1Na8JeX4ZSkPnaKw9NanxMuP6Or0Re7YUUR3yFDR3R07
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: UYKBI6DT6IXK6YFOE5XOQGD6J3VCAPGJ
X-Message-ID-Hash: UYKBI6DT6IXK6YFOE5XOQGD6J3VCAPGJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UYKBI6DT6IXK6YFOE5XOQGD6J3VCAPGJ/>
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

Update the cs35l36 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs35l36.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index 04ba7f25012e..20084c7d3acb 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -1312,7 +1312,7 @@ static struct regmap_config cs35l36_regmap = {
 	.precious_reg = cs35l36_precious_reg,
 	.volatile_reg = cs35l36_volatile_reg,
 	.readable_reg = cs35l36_readable_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static irqreturn_t cs35l36_irq(int irq, void *data)

-- 
2.39.2


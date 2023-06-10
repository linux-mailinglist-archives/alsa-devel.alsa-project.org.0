Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B31E72AC4A
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 16:28:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DE48DEE;
	Sat, 10 Jun 2023 16:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DE48DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686407336;
	bh=p5mnm+fzJQ8nEbGbWLkz6gjT//KNsPltV6CE3RnQcV4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kE2WXjM03HNiUtX5sQy0tN/1n5zvP6iE09J5smiHjgUlxl9v4yO1nOs3OrNmFQ9Vt
	 BmxsWwEX9EslVvoIhH83Qixxa22KA9SSS6Wt/wzd1xr7VwGCk6DWrihccVZJ62Gc/I
	 h0Z0LgfSUjRdGcOfG6rYf3o71PyIE3FgQsXcuk8Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68BC2F80290; Sat, 10 Jun 2023 16:27:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CBB6F8016C;
	Sat, 10 Jun 2023 16:27:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 840D9F80548; Sat, 10 Jun 2023 16:27:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD3E6F80254
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 16:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD3E6F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Md/wjzhE
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 833A760DE8;
	Sat, 10 Jun 2023 14:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15607C433D2;
	Sat, 10 Jun 2023 14:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686407251;
	bh=p5mnm+fzJQ8nEbGbWLkz6gjT//KNsPltV6CE3RnQcV4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Md/wjzhEvrmwwsbYYdfSIF2sJGDUHOOn0orE+JoMN+Xa1Vj05W/+2xNvNG9Q4Q+0T
	 HlK/yjE98ByvzcmuCM5DecZlK+HhC6aSPvmGK3Zh0zcc55KcT6E6RffdtIs7lqPiDS
	 8TSfjZzlQPP7yLhebOPRUGoanw4PcFsBLR/GxDAMbuo6B300jz8d9B6ezuv5oTSzLl
	 npg5BA9cVaCDUEH/3Z9BZ78L96LId12Q1PP2XKA9oLNqr0ETUK7QIVm4CRDVlpf9CD
	 s3IbuhyEXYNcJt9E4k3sMwVJB5JtrYi9XK0LwPDTAVy+s0oIOnecP1B/2gqVW6jjGW
	 fJB2UsuhAsylw==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 15:27:13 +0100
Subject: [PATCH 2/8] ASoC: rt711: Use maple tree register cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-rt-sdw-maple-v1-2-85ee50c93905@kernel.org>
References: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
In-Reply-To: <20230609-asoc-rt-sdw-maple-v1-0-85ee50c93905@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1916; i=broonie@kernel.org;
 h=from:subject:message-id; bh=p5mnm+fzJQ8nEbGbWLkz6gjT//KNsPltV6CE3RnQcV4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIhKfnwyfb8CcCkYAehL7nK0wCsa4UneJ6nivwtA
 hNiAd46JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISISgAKCRAk1otyXVSH0CALB/
 9UKHeLDE44wLuizkT1UMMerTgDltbpW2GN+uJo80a3sYgB1CbIf7xHDeTALuCzjXFNHk6jmwEPNVL3
 ffAmPWRBN20shV5V0nwjham63DtWPDrghx6PG+0m1ldP0rMPeIXOupCynkAMN6T+5zQCsJFKUlqo8X
 WAWUC2gmRuvwWTbS0dKN51ok1/kC6hDF+dIaCW8ZvZ3kA4jCQUpR0yMZKHWaM1GYe7XH61W6cmJof5
 NXuPPRefptWq9YMJFLFgrhHR2yLuSPUtrz3PdDPoLoog+Xj1A0YFQGvGV97T7nTFhKtjaF2J2gDWtK
 qx4xcYN/U0DVhCSNGiSo3B0J2FaYov
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: HVWPAPDXKZNBXR5VXEWWNVCDCS35FMW5
X-Message-ID-Hash: HVWPAPDXKZNBXR5VXEWWNVCDCS35FMW5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVWPAPDXKZNBXR5VXEWWNVCDCS35FMW5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The rt711 can only support single register read and write operations so
does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 4 ++--
 sound/soc/codecs/rt711-sdw.c      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index 2c5eb28259dc..119e1f9605d7 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -119,7 +119,7 @@ static const struct regmap_config rt711_sdca_regmap = {
 	.max_register = 0x44ffffff,
 	.reg_defaults = rt711_sdca_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(rt711_sdca_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };
@@ -133,7 +133,7 @@ static const struct regmap_config rt711_sdca_mbq_regmap = {
 	.max_register = 0x40800f12,
 	.reg_defaults = rt711_sdca_mbq_defaults,
 	.num_reg_defaults = ARRAY_SIZE(rt711_sdca_mbq_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index b8ed3c6236d8..87dafcb4545d 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -296,7 +296,7 @@ static const struct regmap_config rt711_regmap = {
 	.max_register = 0x755800,
 	.reg_defaults = rt711_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(rt711_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 	.reg_read = rt711_sdw_read,

-- 
2.30.2


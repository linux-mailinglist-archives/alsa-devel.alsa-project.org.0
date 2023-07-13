Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 529C3751520
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:20:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B800A4D;
	Thu, 13 Jul 2023 02:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B800A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207611;
	bh=mEQjmqKbNvHzHuxZdpcZL/1D4KD5AVyShbqeO+7gIAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Xftg5FnOD6b7RNtJDPzOI7/2aOHzBaqiXPXKkNeLrZ414lZhbEJ5jqto9T5S0/ZHu
	 55s9A+W07+LCkomCmisp+gpEvNQEUYuMShbaxI7n7dGm+8zusCT4vHetnDriOywMBK
	 4Q/A3Ru1bQUlLpAEmWy4aOQugz6l09lFdep0JvxM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BE21F8063B; Thu, 13 Jul 2023 02:15:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E213F80635;
	Thu, 13 Jul 2023 02:15:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F225DF8060E; Thu, 13 Jul 2023 02:15:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D7D3DF80605
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7D3DF80605
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DOWw1nG9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C8ECD61986;
	Thu, 13 Jul 2023 00:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EDFC433CA;
	Thu, 13 Jul 2023 00:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207302;
	bh=mEQjmqKbNvHzHuxZdpcZL/1D4KD5AVyShbqeO+7gIAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DOWw1nG9eSYOzbkPxvXwonNuO05bqHw1tO9wmSlcQBauUETFQqKJV1Io8xnruF645
	 nor4yiZazPZE6adDj67UQzoN9VmWNDC0iNMWTnDxhc9+axGzWWwVbi+D4UcKk9pHyV
	 BGyZf0DfX80lh0V9MNfI/rwq7ZNxd7IQNqGK8nYlL7lFzZhyPvIiBjQmRyvOKoAl7i
	 m7hXF6uaRajXD0iKISxzbJedpf0yajSG/IU5De6L8Tqrem9zcOjDRCC0zWE6/d5XO9
	 q1kUZfjBc41xEhgiTMlhkwXcxS7xhnwK518GJBXfKNUGelI8jD/bhLebsbYxMJGsdq
	 Bh7knKUu2S5kQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:30 +0100
Subject: [PATCH 17/48] ASoC: wm8523: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-17-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mEQjmqKbNvHzHuxZdpcZL/1D4KD5AVyShbqeO+7gIAs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G5ZWEXEXEbebbqO/TvCvhIYDxuaxlqlpI9u
 Nizu/xX9vqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BuQAKCRAk1otyXVSH
 0IfIB/93A1uAP04BdTRJ2i+RDVzmhC7jJbMN4OQz08gQabYnhNf9sSJ+OYOJ3RHlRFmlKk8eMoM
 ftqmNXI+MaJYPhfHcsWAGTC57HqPNTaLWHwsbwwdNtoHFSuLVx3e0OSe33cbYiTI5OMrIejIERo
 WfQQ+Qo1vAmNQRHBLDhqLYu+ZeSvp2M9eW2TdVyC6O37k62s3BES13k072CxGN6Js3QX0bVr/uq
 5i+r4iyE6nfbkGMOu6s/SG11b6YQjtI+I7BU1Q8HDMg+dLpC+v1PaTNR5x7NkQ4uNIuE1dkwh9R
 VS/YZjzxIfyX8sIBTYK9uYF0xWEcxa1QTF5BQBG9FZNhRhcY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: O72PR4BTTZ432TBHLAQ6NJLRMI6MZVR2
X-Message-ID-Hash: O72PR4BTTZ432TBHLAQ6NJLRMI6MZVR2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O72PR4BTTZ432TBHLAQ6NJLRMI6MZVR2/>
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

Update the wm8523 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8523.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8523.c b/sound/soc/codecs/wm8523.c
index 55c72c5ac845..ea87cd3cc0d6 100644
--- a/sound/soc/codecs/wm8523.c
+++ b/sound/soc/codecs/wm8523.c
@@ -437,7 +437,7 @@ static const struct regmap_config wm8523_regmap = {
 
 	.reg_defaults = wm8523_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8523_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm8523_volatile_register,
 };

-- 
2.39.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BC975150F
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:17:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE94184B;
	Thu, 13 Jul 2023 02:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE94184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207427;
	bh=NUAvKg7hEMEGB3PEXKsUJF06rptBcDzXIY6bIE6/I5E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oYWBWwYbjw+eyiTHnZa7GpveuWkwp7OkRxbcV0HSewInkBw/x4usq4+H2FebnAGEW
	 ryy6g6xngfrSD/Pp2/QXTA+oChGtRGmeyJxbYpkTaJm2IK2khiJKkAZuC5fGlxhoL8
	 SYeEgpljRyd+VfWbRwKN+d3XTn3kCzwM+8PeEgiA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78673F805B3; Thu, 13 Jul 2023 02:14:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E622FF805AF;
	Thu, 13 Jul 2023 02:14:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99599F80551; Thu, 13 Jul 2023 02:14:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF16CF8047D
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF16CF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c5YvbZgm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9197B619B0;
	Thu, 13 Jul 2023 00:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96796C433C9;
	Thu, 13 Jul 2023 00:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207267;
	bh=NUAvKg7hEMEGB3PEXKsUJF06rptBcDzXIY6bIE6/I5E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c5YvbZgmsx9luu/e29oTPzilVoyq4i56WCtWCBD4a786izd/zFxs2BsKa5wiBIRGX
	 332Lb1GYu5+LliCtmVy5kbmcxYZtKJ1YDvTfdeWU/9fieiv202q6pmYdk0cp/urEeQ
	 DjD8wI/ipi+5z2Srs2QenS5INH5cebNMU1uxqFqG4jhTophUPZp00HPC4VI2IYENYX
	 58pNc34ZlRJkzqamOM7DaSbGXGXd3ucmBovsJtfzhUkmaVEBgFFEzxKKd6EorGGWuQ
	 LoARsORH0hzmXIfKghDdWftC7Vhm7nRlbvGoap7yEulWuramo76JjMEFiNaW9/1Xzi
	 3JdRkfTiJHMGw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:18 +0100
Subject: [PATCH 05/48] ASoC: cs42l51: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-5-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NUAvKg7hEMEGB3PEXKsUJF06rptBcDzXIY6bIE6/I5E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0GwFCVAM9ljNOsh7jyqUK9NyVqcpJcR7Z64Y
 9dZCx6K1p6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BsAAKCRAk1otyXVSH
 0KXyB/4y17GRx/hTY6IA495wUOTMkyyrgzZDT4pd/9phUHrXu1h9tIP1wemwVNMGWJVlgqd8trx
 +R9cVgcIZr+9Wuz/Nw1l/k5s6FlJLgxfQRYlH7ikFPUaaYjFFWM6j4tHl72cVX6hvILmZqWc9pY
 MHYtsOX+XzWrosBt8oYe3h/lfFSFi7YNC1gScQPl/DGc5YngncxszVjWaSKWAG05uDVThL/1YHv
 zilnKxLaEWOKRfaBLruVmjK2pM93EjSLRYd2DE6DvmNdgAO/nnrpsyNy2nnBPdIAmwFk7G/kKaA
 bH1bgkEZSvMZdjQCuVIkwr7qpY7NJJnwrUVNwZIuEnVChprr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: H5P6IRL67MAMICYXRP55AGRACZAY6F6A
X-Message-ID-Hash: H5P6IRL67MAMICYXRP55AGRACZAY6F6A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H5P6IRL67MAMICYXRP55AGRACZAY6F6A/>
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

Update the cs42l51 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42l51.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index a67cd3ee84e0..36066fac394f 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -703,7 +703,7 @@ const struct regmap_config cs42l51_regmap = {
 	.volatile_reg = cs42l51_volatile_reg,
 	.writeable_reg = cs42l51_writeable_reg,
 	.max_register = CS42L51_CHARGE_FREQ,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_GPL(cs42l51_regmap);
 

-- 
2.39.2


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F0275153F
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:26:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2769843;
	Thu, 13 Jul 2023 02:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2769843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207985;
	bh=AMCX6Q0zMFgbz4pwuxj5urRasCu687R+XmoAl/UoZJU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r1VjIqHhn4oxwWP0LXVNcTKxEWlli1ydSZ75KXfk8uSFOJhJ2qSLqQRYVLVLnCdDp
	 C+8RygMKtmqyNn09OBYe4UD9Cde0BK1qdJGLCfZTXmH7OibCdzJXiQESaR7D9prh3S
	 DcWQt7L2d/arI3BDjIi9WHOmdCA6Gyjwf8fAqM/Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 873B6F80750; Thu, 13 Jul 2023 02:16:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF05BF8074E;
	Thu, 13 Jul 2023 02:16:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7422AF806D7; Thu, 13 Jul 2023 02:16:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AFC6F806A6
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AFC6F806A6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YrSR0Q2H
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EB32661987;
	Thu, 13 Jul 2023 00:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476B1C433C7;
	Thu, 13 Jul 2023 00:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207368;
	bh=AMCX6Q0zMFgbz4pwuxj5urRasCu687R+XmoAl/UoZJU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YrSR0Q2HNTk86rIDHTQF8YDjN3n7fbhM07ykdWp92MAYvAhFP4MP4IZEPQtNoSCTB
	 9rVyOXGidwrseA+ZL8uxNRzBuhekJqFZ+jo7vMTYDPPEwo0169929DntnK87+fIKL9
	 +du4T8AC4uqgKHTJLvbN4kxtCcjZ1ymi92urxqQUkGZrlkCNShIq5tHIluCgPGOZ2N
	 R7SrcnMFaITFOcncmO24btxIt6kzNYm6iDyJXO9pyfXuFDFVvNpqwZm+sDrVh1CF0I
	 buIF+djq0LB907vuD481X8cg4ZT+LW9J2n6DVu5C+hJx2lpuYz1lJtHxB/4BQNZdSH
	 X8mWTAxmFY2hw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:53 +0100
Subject: [PATCH 40/48] ASoC: wm8955: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-40-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AMCX6Q0zMFgbz4pwuxj5urRasCu687R+XmoAl/UoZJU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HKVjTndiPZxl1WhqDZ3k+72qfSb0Vx2nLqL
 1zjzNEkNjyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BygAKCRAk1otyXVSH
 0JG/B/4xARkU62FfGGN9FziJaLaMgopAbTX4iLkiAHgdbZ9cJF7Ua74sAocDV9pJvlu60L2ohy4
 WnIthUKsEqNDijUvLQrJIttZlIGhGosOn0fbZQ9u/q8CdxRkzdvXE5MkNzyApSN2uk9vl0MUIy9
 9zUz/HMTDXbHbB7TWF9YHzjz91g9boiAZrMZb+/HCdkarx3YsizBMG223QxFvRQfTC2VRcDaHuO
 zNaa5ytTru6gvHUS7z4W+5805RS5cmPQWTcVfboMWB4+xb5qci5v32jGp1gKvlXmDZxGiTo10cT
 0kbdb9aHC+5grRMtQtPjc3NrMVBsaxQ8bmiLG34P/fQso+rn
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: IUWYD6JYYVDWLENEUZOP2CDLHPQBY52X
X-Message-ID-Hash: IUWYD6JYYVDWLENEUZOP2CDLHPQBY52X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IUWYD6JYYVDWLENEUZOP2CDLHPQBY52X/>
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

Update the wm8955 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8955.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
index 78044f580a67..4f4338326438 100644
--- a/sound/soc/codecs/wm8955.c
+++ b/sound/soc/codecs/wm8955.c
@@ -962,7 +962,7 @@ static const struct regmap_config wm8955_regmap = {
 	.volatile_reg = wm8955_volatile,
 	.writeable_reg = wm8955_writeable,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8955_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8955_reg_defaults),
 };

-- 
2.39.2


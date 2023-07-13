Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4277275151E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 02:19:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CB1E83A;
	Thu, 13 Jul 2023 02:18:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CB1E83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689207585;
	bh=OSzP3slIHM0RPGBQp8TAKuB/zqLcOXA79h+ZosVLquA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m1qjruYqI/gmzcfMJayBC296nqGl9BYbFC2CRlEf2SscuWqBfU0ETcrnkaGT+Q2hS
	 TeGrRwUx6kYytBXjFyUB5BiiphsCHwaJ0G9nsSmGhgW+HisQPatC4EukEHpqhdhL4m
	 XRosZGc/c/2NWhV8IvTkLBvPqk6oMTq643o3UqaY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27031F80535; Thu, 13 Jul 2023 02:15:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B5DAF8024E;
	Thu, 13 Jul 2023 02:15:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75AD6F805F7; Thu, 13 Jul 2023 02:15:00 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AC294F805F4
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 02:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC294F805F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VdnqO3ce
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91D0F619B0;
	Thu, 13 Jul 2023 00:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1E7C433CC;
	Thu, 13 Jul 2023 00:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207296;
	bh=OSzP3slIHM0RPGBQp8TAKuB/zqLcOXA79h+ZosVLquA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VdnqO3ceG39H+mEqZlKuq5SSBDrO2Qjkd4pf88fD6EShZ2x1PUYZvnsNiV8V3R6fx
	 g7wuyFYpCMwNx6AmpOxnWcUgAqJT/HGiMtg4BXCI3kdyDaHlYFEOtPU7vjVF2vb5jb
	 1tAT79Oyw45sSM67WLXDChWi/5YB6thKlwaXWnQOutjxrfiPcD9QfkSf6jM+IFc3mu
	 FuIPhV5P7+NQWBpqWEC6sxc0cp2mnVo+GqZr3iVurkq29EDuYnYHPpNM2AL+QMYp7X
	 iczW1X1xKRJpfTaSbuE4DLK/VfYilHwhtjjuTlGyDkFXagXr32WxFkWFsr6e36tAnE
	 4VEYeKfffnQFA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:28 +0100
Subject: [PATCH 15/48] ASoC: wm9090: Update to use maple tree register
 cache
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-15-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OSzP3slIHM0RPGBQp8TAKuB/zqLcOXA79h+ZosVLquA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G38ro062rGSJj55rmfFETC4IVaFk+2t9gsE
 beNjK9XGOmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BtwAKCRAk1otyXVSH
 0JnvB/41ubRHjT7KVTMpQZ2Wg2MWxqhCfpoqCTvgYZ8rBMReyta0n2d4+bnmQWiryfYtWIRbmah
 /HgXyoqH+Du7XcBxqGpzP9K4NLjf9OMUoe+RMeYCPP4Dd5o99zLS8uWuzu47rPVeU6mZEccZN4n
 7IVrmxeZe8hsNm+t7OwccL6bACkhVWP8D9YbAqhdbQBgoNsdWKUeDGNi2WFeoMsI1gYFuChH2m9
 WMbA5bRfozgElGFub732sCS2orxEKy4nI5Vc/4SuJtfSxNRGnbEmOMhxFdSrcV7y9MwvfBIPbbH
 bIMjgEOVVf2W4LV4jNSUkTTr8UbS3KCvqfyS8FI+L/EK2+Eq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: VRJ47YS2MNBBO7KXQDOEOZOVPQZ3DS7R
X-Message-ID-Hash: VRJ47YS2MNBBO7KXQDOEOZOVPQZ3DS7R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VRJ47YS2MNBBO7KXQDOEOZOVPQZ3DS7R/>
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

Update the wm9090 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm9090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm9090.c b/sound/soc/codecs/wm9090.c
index 432729c753dd..50c1cbccfdb9 100644
--- a/sound/soc/codecs/wm9090.c
+++ b/sound/soc/codecs/wm9090.c
@@ -553,7 +553,7 @@ static const struct regmap_config wm9090_regmap = {
 	.volatile_reg = wm9090_volatile,
 	.readable_reg = wm9090_readable,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm9090_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm9090_reg_defaults),
 };

-- 
2.39.2


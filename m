Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C06FF75DF54
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jul 2023 01:29:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74AD71FC;
	Sun, 23 Jul 2023 01:28:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74AD71FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690068572;
	bh=4Rzq1YvQj5lkcsTj0h4z35hXfooOcCsSwzHWSviixF4=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LnSnIWylnCXgPmn3yve4+RTgUHjGJuo2KK+hnHIrc6q7HnLQ4zKBOxLSWOpAGGsJo
	 dmYZXBGdBDcIMVn6LgMYzbsJXTb094Msz9GwMvniUyBJsPRLyRnukN/yWYJD/BlTCB
	 C+gxNMFXM7cmpY/L+PeCIKG/3pdU3nQ49bNNpub8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E382FF80520; Sun, 23 Jul 2023 01:28:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EF64F80163;
	Sun, 23 Jul 2023 01:28:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74972F8019B; Sun, 23 Jul 2023 01:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FA4FF80153
	for <alsa-devel@alsa-project.org>; Sun, 23 Jul 2023 01:28:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FA4FF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p79CDN4a
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A3BA60BBD;
	Sat, 22 Jul 2023 23:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B9EC433C8;
	Sat, 22 Jul 2023 23:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690068479;
	bh=4Rzq1YvQj5lkcsTj0h4z35hXfooOcCsSwzHWSviixF4=;
	h=From:Date:Subject:To:Cc:From;
	b=p79CDN4asme4HdUunkCbjeVgN2yWdSE7BvtdSIw4Qc5DfBUhaMlI1qFqak3pxdSSV
	 t8Kn9HbNsjVHMH4tZW/B3DL4qo6tYFS2iI3fcXYSHy/PGBQA3guAZ5FqdkOZN7Ys7D
	 l9XK7cgmm+1djMOE70ixbnTKLORdeLR069tMVMeBNjsCvgcVau7RITNPXmpvynkRbF
	 +IdNqWjGA4EcuX4VKbwO6x0r9jfMFbrcc7N0Ad2S0+De4QI8rSf8i7MK2kVxtExjB1
	 FFAIY+YMZqoZYtgGejGkT+vPNGZKJX7ohtB1/a80koMZncKpOC0KlrXfWNT4W8nU4/
	 WgRAM7VtXBhTA==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 23 Jul 2023 00:27:22 +0100
Subject: [PATCH] ASoC: wm8904: Fill the cache for WM8904_ADC_TEST_0
 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20230723-asoc-fix-wm8904-adc-test-read-v1-1-2cdf2edd83fd@kernel.org>
X-B4-Tracking: v=1; b=H4sIANllvGQC/x3MQQqDQAxA0atI1g3EVGvbq0gXcSbWLKplIiqId
 3dw+eDzd3BNpg7vYoeki7lNY0Z5KyAMMn4VLWYDE9+pYUbxKWBvG66/54sqlBhwVp8xqUSshag
 u+VEJdZAf/6S5vf7t5zhOzGEaUW8AAAA=
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4Rzq1YvQj5lkcsTj0h4z35hXfooOcCsSwzHWSviixF4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkvGX8d19gOD8PdUazKTchmkukpVXAtvkLf0uNI
 nLztc+S55qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZLxl/AAKCRAk1otyXVSH
 0JL6B/0QC1xAN2HxD8AgTG0u8FQGSQdncnxs59LRuKZqYmb16lLCT2UNR2ZCDMaFy5OA66ksR3C
 RFYZGb6fC/PDKlRMD/XLOWqNeYDtDRHGK1s6gqDGpK3bNBdHmItu7EdHvOkCrxAhWyv8jKHU0fq
 4qpZoyhZuN4iEA5G9/kz80yOmAtBcKQzkZI6gPHB8HeTMHzoJkI6P/cvOvSOngRG5ctIlZlgt8c
 jXh9WTdYkLA/lzNB15fPVhrlgiEF2cd9T9+nOR/R7C+PGGVw62T/HNxPXma9iEkHaNnY3ZFXdD6
 jo7lOjxeBB0MHHsatD/lwg//p1DmVbXiql+AiFCIir+Yv6wS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: Y2HSB7OHLCGYV6FL4GCAG3RKMOKF5NKQ
X-Message-ID-Hash: Y2HSB7OHLCGYV6FL4GCAG3RKMOKF5NKQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y2HSB7OHLCGYV6FL4GCAG3RKMOKF5NKQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The WM8904_ADC_TEST_0 register is modified as part of updating the OSR
controls but does not have a cache default, leading to errors when we try
to modify these controls in cache only mode with no prior read:

wm8904 3-001a: ASoC: error at snd_soc_component_update_bits on wm8904.3-001a for register: [0x000000c6] -16

Add a read of the register to probe() to fill the cache and avoid both the
error messages and the misconfiguration of the chip which will result.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8904.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 068e610b1b4c..f2baee7c332e 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -2308,6 +2308,9 @@ static int wm8904_i2c_probe(struct i2c_client *i2c)
 	regmap_update_bits(wm8904->regmap, WM8904_BIAS_CONTROL_0,
 			    WM8904_POBCTRL, 0);
 
+	/* Fill the cache for the ADC test register */
+	regmap_read(wm8904->regmap, WM8904_ADC_TEST_0, &val);
+
 	/* Can leave the device powered off until we need it */
 	regcache_cache_only(wm8904->regmap, true);
 	regulator_bulk_disable(ARRAY_SIZE(wm8904->supplies), wm8904->supplies);

---
base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
change-id: 20230722-asoc-fix-wm8904-adc-test-read-5a0051264a0b

Best regards,
-- 
Mark Brown <broonie@kernel.org>


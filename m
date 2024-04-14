Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E208A4393
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Apr 2024 17:49:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1C6014DD;
	Sun, 14 Apr 2024 17:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1C6014DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713109796;
	bh=eB8z2bgQUHChzHBgcHVV6ROB9s4VpTn1NLhlNm4cuwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uiG0oRIdFpemLYAIl8ljTfVWmxiMfITNoyhimu7ooiE0MsQ+RzKCYnFdRUnmnWmD4
	 PgBtvHGzpBFsGqMe1O5YNGI4YxL6TEy+RxGapZ6TAHHuTkShHHcmINvrQzAQMQf8lu
	 e46fd8Xman2rjJe1wIA+8+lYNkCPAL0HYh+VYefI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04867F805AF; Sun, 14 Apr 2024 17:49:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4281AF805CA;
	Sun, 14 Apr 2024 17:49:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9C94F805AF; Sun, 14 Apr 2024 17:49:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABDFDF805A1
	for <alsa-devel@alsa-project.org>; Sun, 14 Apr 2024 17:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABDFDF805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RBJqrmB5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E1185CE0986;
	Sun, 14 Apr 2024 15:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC2BAC072AA;
	Sun, 14 Apr 2024 15:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713109732;
	bh=eB8z2bgQUHChzHBgcHVV6ROB9s4VpTn1NLhlNm4cuwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RBJqrmB5dGqTw05pedFo0QS/y0t4URz57mSUiq8DHiu3cnl0WDIrAQSHoIXpd4bRh
	 XOLKR2E5nkwOOMIw8ftmhBX+TAcQhxe1ONGzsLfvcZvVnxBgC/FLALFk2PoXUYOIYz
	 LKTwj+9SUXkcICpVuU2v2VRnzXKfVqpFAPUy5rae5mHX8UVS1PdQe2Jakj0WdYK+Bf
	 F/7mKZGs5Ecf5icJ5v4udqen9Iz4U49vafVGQdrfC7GbA9SJShMZCkyJtEsuwf0eDj
	 qvnZcom4baTqJWB+wDhy1ri5D9TJPtdMyme+y+gyskPPGGdMwTr7SNYVxTL/bvPpDY
	 x2egQpw960/FQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] ASoC: samsung: i2s: Drop unneeded MODULE_ALIAS
Date: Sun, 14 Apr 2024 17:48:39 +0200
Message-Id: <20240414154839.126852-2-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240414154839.126852-1-krzk@kernel.org>
References: <20240414154839.126852-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 57SSWK43SZ4VNFSXBLAY6UP2L5ROTP7Q
X-Message-ID-Hash: 57SSWK43SZ4VNFSXBLAY6UP2L5ROTP7Q
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/57SSWK43SZ4VNFSXBLAY6UP2L5ROTP7Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The ID table already has respective entry and MODULE_DEVICE_TABLE and
creates proper alias for platform driver.  Having another MODULE_ALIAS
causes the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/samsung/i2s.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 9552748aea2e..1bcabb114e29 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1755,5 +1755,4 @@ module_platform_driver(samsung_i2s_driver);
 /* Module information */
 MODULE_AUTHOR("Jaswinder Singh, <jassisinghbrar@gmail.com>");
 MODULE_DESCRIPTION("Samsung I2S Interface");
-MODULE_ALIAS("platform:samsung-i2s");
 MODULE_LICENSE("GPL");
-- 
2.34.1


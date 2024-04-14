Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEDA8A4391
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Apr 2024 17:49:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DCF9F52;
	Sun, 14 Apr 2024 17:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DCF9F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713109783;
	bh=foLleOL040k6enfEJM3Q4Puao+TFmpCu2z5tF3irpuo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vEhi0CGeo8uwGGi5MCvgRZWi7cfTOSq0PE5XredJnHKQ39p4E96AO1gS++YP0MbY+
	 5/J/Pf6G7C8Gx40iVfboup4AYZ2TX/8JAc/qfbfD8OnRbBPFBJfFXaGxfR+50f0G4C
	 1EbTPTLHfzCV9lg9mPo0Mxxs+xhGV3+ln2W2vv0Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05703F805A8; Sun, 14 Apr 2024 17:49:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 363ADF8013D;
	Sun, 14 Apr 2024 17:49:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ABFDF8025A; Sun, 14 Apr 2024 17:48:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CE15F8013D
	for <alsa-devel@alsa-project.org>; Sun, 14 Apr 2024 17:48:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CE15F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Jy+cps+Q
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 783BB60B5A;
	Sun, 14 Apr 2024 15:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E80C072AA;
	Sun, 14 Apr 2024 15:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713109728;
	bh=foLleOL040k6enfEJM3Q4Puao+TFmpCu2z5tF3irpuo=;
	h=From:To:Cc:Subject:Date:From;
	b=Jy+cps+Qrr4jzYlVgqbIWgdQC6LXhJFAacAIBjeM44mjyJnu7Rtm6ZyWoBq8Xspz8
	 TJxrIE11/MGSufi1nLRtewMfuSgv5K2E/F+UO+vzosQNHBBYDl+cw/dsx483IucQnA
	 1jqNBeTj4yhE/HhKbMLV4CTKLq57KCvWAqgTzHjO3Li6npPGLL5Jq1oRMvxajC6pm0
	 7v/aEgTOrJcFq+HUw0Uqicy6U7l2EBHEJD+KnOQXZIA1CgdPyIVZxmWWjZ5I2J2t3Q
	 CHaC1Rqf/U5EzV+dKFh5+lbLixVsdnpfTJx9cghgQjWfaIp8ED9VDI4c27Nyof1o82
	 uGhe7O2Ee1zSg==
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
Subject: [PATCH 1/2] ASoC: wcd934x: Drop unneeded MODULE_ALIAS
Date: Sun, 14 Apr 2024 17:48:38 +0200
Message-Id: <20240414154839.126852-1-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RATQMGLAYPF5BQPKP2JRLZV54RFCOBGW
X-Message-ID-Hash: RATQMGLAYPF5BQPKP2JRLZV54RFCOBGW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RATQMGLAYPF5BQPKP2JRLZV54RFCOBGW/>
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
 sound/soc/codecs/wcd934x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 6813268e6a19..de870c7819ca 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -5967,7 +5967,6 @@ static struct platform_driver wcd934x_codec_driver = {
 	}
 };
 
-MODULE_ALIAS("platform:wcd934x-codec");
 module_platform_driver(wcd934x_codec_driver);
 MODULE_DESCRIPTION("WCD934x codec driver");
 MODULE_LICENSE("GPL v2");
-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D88293F6A2
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 15:25:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ED0482A;
	Mon, 29 Jul 2024 15:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ED0482A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722259540;
	bh=2/YZLHYwe6VeiM3pUFkU5Uwf+RFlzvvWMDWutDwHs1Q=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nhmEt/qEXosPQfOw5yxLlHc/B9em7f7KgzJo0MUQDdEJUm4iVOCFaeJFrTcM3Q62+
	 GOCiU4Z1v9pKASYYeJIHlGQwkZ4fYBPTlC0r4yhjqNIk4pDc1XG/MgvP2haaRbBMV5
	 Ssfgnm/A7C+Tz3PCnRZ8bG/EYxR/yU22DWRdGkD0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91205F805A1; Mon, 29 Jul 2024 15:25:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6F9CF805AF;
	Mon, 29 Jul 2024 15:25:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09B30F80269; Mon, 29 Jul 2024 15:20:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0065F80269
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 15:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0065F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bclbK1iY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8BEAE619A2;
	Mon, 29 Jul 2024 13:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A48C32786;
	Mon, 29 Jul 2024 13:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722258848;
	bh=2/YZLHYwe6VeiM3pUFkU5Uwf+RFlzvvWMDWutDwHs1Q=;
	h=From:To:Cc:Subject:Date:From;
	b=bclbK1iYJNgcrsT5kdKuydrNKIIhB9Xkxuu1vbCk/IdIchAHY6fpEbFbDii9Glg8A
	 0/Qbp/aoa7Axdt7t/0BEA4CsN1wHaj7u5GNvphqVma1VRiAhZs649aYytLB3nM0oml
	 0/6VaNQmEls7l/T0BYUAVW5rJL/5DUL7F4xgS980I3Kahyo+Nek+D/G3/hVJwdbRLx
	 YqmlZRo0FlELbCfH7iCamL0xvOhnpQX2TjiPtqu1cDrL3J6jUVl/R6TVgMkwyaPzqK
	 xV/8LfAblWT7U5DkEL/SqAvZJJrQXP4CwZdKpxwlZzofWC/fr0PMh9rJU6AO0g1N2O
	 JH9JhCwmkpcGw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sYQCa-000000007G9-1tX1;
	Mon, 29 Jul 2024 15:14:13 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	regressions@lists.linux.dev
Subject: [PATCH] ASoC: codecs: lpass-macro: fix missing codec version
Date: Mon, 29 Jul 2024 15:13:51 +0200
Message-ID: <20240729131351.27886-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CV2D6C4MIC7MGNHNLSLZUNKVXSNILSA5
X-Message-ID-Hash: CV2D6C4MIC7MGNHNLSLZUNKVXSNILSA5
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CV2D6C4MIC7MGNHNLSLZUNKVXSNILSA5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Recent changes that started checking the codec version broke audio on
the Lenovo ThinkPad X13s:

	wsa_macro 3240000.codec: Unsupported Codec version (0)
	wsa_macro 3240000.codec: probe with driver wsa_macro failed with error -22
	rx_macro 3200000.rxmacro: Unsupported Codec version (0)
	rx_macro 3200000.rxmacro: probe with driver rx_macro failed with error -22

Add the missing codec version to the lookup table so that the codec
drivers probe successfully.

Note that I'm just assuming that this is a 2.0 codec based on the fact
that this device uses the older register layout.

Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
Fixes: 727de4fbc546 ("ASoC: codecs: lpass-wsa-macro: Correct support for newer v2.5 version")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
Cc: regressions@lists.linux.dev
#regzbot introduced: 378918d59181


 sound/soc/codecs/lpass-va-macro.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index b852cc7ffad9..a62ccd09bacd 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1472,6 +1472,8 @@ static void va_macro_set_lpass_codec_version(struct va_macro *va)
 
 	if ((core_id_0 == 0x01) && (core_id_1 == 0x0F))
 		version = LPASS_CODEC_VERSION_2_0;
+	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && core_id_2 == 0x01)
+		version = LPASS_CODEC_VERSION_2_0;
 	if ((core_id_0 == 0x02) && (core_id_1 == 0x0E))
 		version = LPASS_CODEC_VERSION_2_1;
 	if ((core_id_0 == 0x02) && (core_id_1 == 0x0F) && (core_id_2 == 0x50 || core_id_2 == 0x51))
-- 
2.44.2


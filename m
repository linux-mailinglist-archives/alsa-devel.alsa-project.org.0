Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 815B584D3DB
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 22:27:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B038C852;
	Wed,  7 Feb 2024 22:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B038C852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707341232;
	bh=R1xtliolWFT+KnH5zrGkBUszATLP+e7OWupb2hxYyNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SwtSdUZ5d05VmUqqyRzUgxMn1KRb3Qz1Dz4U2Qhqg4w+ug2QH0qPbpR1nT0Bydl5I
	 3SEH+UGuG6A4qTnke7Tb13MFVAPQcLMRRdHMD+8t6J3zdB0/p0N8Af7NmrFjTjZHp3
	 rXUIjHq39TX/DI+IuFdhZvQvzp7c7TolotbPZUbg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD3D6F805A9; Wed,  7 Feb 2024 22:26:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 200C7F8057D;
	Wed,  7 Feb 2024 22:26:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B4CAF801EB; Wed,  7 Feb 2024 22:26:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19DBAF801D5
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 22:26:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19DBAF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MepEqA+r
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1870CCE1B27;
	Wed,  7 Feb 2024 21:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7C6C43390;
	Wed,  7 Feb 2024 21:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707341180;
	bh=R1xtliolWFT+KnH5zrGkBUszATLP+e7OWupb2hxYyNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MepEqA+r6ClItkvdCy8wbZtQQpKCFJHRwkiPoj1vHhxdMum/qShGF8xQmkoUBe1BP
	 9VRWhHWxDSeXfqE7iCGz6EggO3ZhoHX1sGQiWnDJ4aXLVJMmjYAnvoPSPMpw+TOEM+
	 qtWu3I8q1n0z70L3YrBL9VufiTk9Czv9axAVEYGF3wRku1x+89mGo/PB+dy7SlsfJC
	 7wJFSzynQB98Ba1ikOwTJtIZdUaaPE4I1EYbwx02M3YqZaEnBTCM7F7IfdvekIhL5v
	 AA9eiNWNuuFoz8S5kBCvjN7im0KBSzkqozoWawSFpAScqriBoY1NOUgxAmaLBEz9jp
	 JyGnM2gCsN8Ug==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 05/23] ASoC: codecs: wcd934x: drop unneeded
 regulator include
Date: Wed,  7 Feb 2024 16:25:46 -0500
Message-ID: <20240207212611.3793-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207212611.3793-1-sashal@kernel.org>
References: <20240207212611.3793-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.148
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AUIE5CPRFZHKUSZJT7DVUBZHYMCLYDQH
X-Message-ID-Hash: AUIE5CPRFZHKUSZJT7DVUBZHYMCLYDQH
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AUIE5CPRFZHKUSZJT7DVUBZHYMCLYDQH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[ Upstream commit 35314e39dabcfb256832654ad0e856a9fba744bd ]

Driver does not use any regulator code, so drop redundant include of
regulator/consumer.h header.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://msgid.link/r/20240117151208.1219755-3-krzysztof.kozlowski@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/wcd934x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 94ffd2ba29ae..a12bc454e085 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -13,7 +13,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/slimbus.h>
 #include <sound/pcm_params.h>
-- 
2.43.0


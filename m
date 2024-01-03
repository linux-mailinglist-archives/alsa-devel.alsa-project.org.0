Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B918482349B
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 19:37:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E784E88;
	Wed,  3 Jan 2024 19:37:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E784E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704307055;
	bh=dDDot4LPRcgoDYuhIQlX528kffOfH+AmewxKynD5EdI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IKOFKV4XAN4t4yb8T5lY7bVNIZ1VPOqLQVU7Fz6YlG/OP5fOpns6xb5ctoQy1bmQ7
	 96anyaf7A0Oh72R3DqYfX2yzToNWqDkpNOG03jti+chWxPfkn/bHPoM1WGnEZzdS4K
	 +c8TRAZawSA7aDi6fpsEQjY/YoLFGhAqVciidG2s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8949AF80631; Wed,  3 Jan 2024 19:36:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF7D8F8062F;
	Wed,  3 Jan 2024 19:36:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6623CF80537; Wed,  3 Jan 2024 19:34:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41446F80533
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 19:34:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41446F80533
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D3/Pk1um
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E1082CE17C7;
	Wed,  3 Jan 2024 18:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B266BC433C9;
	Wed,  3 Jan 2024 18:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704306869;
	bh=dDDot4LPRcgoDYuhIQlX528kffOfH+AmewxKynD5EdI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D3/Pk1umSny2A8IZwjZfAIKV5pHBczxBvTftsMewDZ+JzbCSb0VDHB/gvc/LTW8n4
	 Ux0Fyoxb4Stqm3xpZeW1bdtWWWjflUUKpTe3FsQ3sO05BXat6QzYnOyWh83JOv3mrH
	 uegVKZiyU0HBnJ31gbYPdjrQoc+F1trLh86eeoVGPyKUXcu+CHwPxqD9+Mt1PWBJX2
	 sEsjivyiK8bTyNYSYc9XqeTcZ6+9Qv9Q7+FXqjB9dM3VpUhmvcIIMANPG/cALnCq33
	 pt0b0pOWxVnYpdGRmch3ijPkF7xt8DnfScdRSOfN5ik2WtkyOL+2oSd5N8cfPISpR4
	 /SQV8J3hWJKOg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 03 Jan 2024 18:34:03 +0000
Subject: [PATCH 3/4] ASoC: meson: g12a-toacodec: Fix event generation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240103-meson-enum-val-v1-3-424af7a8fb91@kernel.org>
References: <20240103-meson-enum-val-v1-0-424af7a8fb91@kernel.org>
In-Reply-To: <20240103-meson-enum-val-v1-0-424af7a8fb91@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=996; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dDDot4LPRcgoDYuhIQlX528kffOfH+AmewxKynD5EdI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBllainucttS7OoBLV5md2JR3xlj2GVea5XjFl06
 dLgG8hp3R+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZZWopwAKCRAk1otyXVSH
 0P6YB/4jzW3f4QaPPP68INJXXLHuXZAFWMvx6FTQuOqj8wqVrOLFFdLieqJQcNa01wBLV0QgR+p
 0giUSm4S4Y8D7/QASlWUBaKhSiOsGRSEHQnp8vqA9QeMCvN6gtvZWzfm/4IAhHOugTh7FOUYrbE
 U+t8zCxvfXyvxARb6Jvh6mFM6XtxykTKKmaGD3gETbU1jvzTUV1igKFRZ7rg57RT4URS03zygeo
 gRzawACQtEfB3AIUaQ198HNe0cF959n2z2OjoqPfKLzVXpVEaQyzh/ZGdPo9QkNU3IQahnnDpO7
 aDdjoagBml0WpiHz044OI2k4kL49tXmDGx/Huftxb6cbG03f
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Message-ID-Hash: MFCHBRJ4U2QHD6RCNFJ4TBXBLGC3XC6Y
X-Message-ID-Hash: MFCHBRJ4U2QHD6RCNFJ4TBXBLGC3XC6Y
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MFCHBRJ4U2QHD6RCNFJ4TBXBLGC3XC6Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When a control changes value the return value from _put() should be 1 so
we get events generated to userspace notifying applications of the change.
We are checking if there has been a change and exiting early if not but we
are not providing the correct return value in the latter case, fix this.

Fixes: af2618a2eee8 ("ASoC: meson: g12a: add internal DAC glue driver")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/g12a-toacodec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index dd7f07de2685..531bb8707a3e 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -104,7 +104,7 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
 
 	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
 
-	return 0;
+	return 1;
 }
 
 static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,

-- 
2.39.2


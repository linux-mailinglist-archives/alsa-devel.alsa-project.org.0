Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BDB7687E1
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Jul 2023 22:20:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA12184B;
	Sun, 30 Jul 2023 22:19:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA12184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690748431;
	bh=7cJUJ1i8wxX+r7BXxtaoNdzn2bcpFdUA014KLcJn2nA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OG9q2luOikb7CQYa8ZFXrxscce5My3el7/ezxEVnSDCzTVLbGwceANkuRT+jotN4A
	 BVFlvAA6EXwkhxTbBs/Xd3GqeGhfglP3TrMrmee5vwipKWn7AOR3jhe7u3Xg4uVcNw
	 mGwZsPkG5yMX1XFGkFqQTHqZ/GqBSPZdJ2ZM93RI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8BD3F8057C; Sun, 30 Jul 2023 22:18:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C672F8056F;
	Sun, 30 Jul 2023 22:18:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF210F80549; Sun, 30 Jul 2023 22:18:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 552C0F80425
	for <alsa-devel@alsa-project.org>; Sun, 30 Jul 2023 22:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 552C0F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YepRCYQA
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99bccc9ec02so609393066b.2
        for <alsa-devel@alsa-project.org>;
 Sun, 30 Jul 2023 13:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690748321; x=1691353121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxhyfb9b6r+ILlCqox+06L7O4WmZ3Hats0OpcMu4s50=;
        b=YepRCYQAwQdrVTDwU7YVpyPnL7NUxDA+DobhsTWMKIIwA2gO6FYhbuDWQMJu7picnV
         gy/Q0/Rlol83kBrb9fgsavYXr05RES9yl/4dlvM3QW8i4ntQYGRqTadzMbKIdIknAjxg
         vmImxA4gCJGkc9aKab0lkOau7E0nYhj8wwx7arVtxHzjhbqHRg9KpKCjC3oFgiWgY+9k
         eLfrK2THa3I7oS47S4boREa4BsUIKLKCGnp9nroSxYjEIGpxr1WOS+2d7TM2xoA0NbyQ
         CcQ+9Yxim8xq1swBTOWQXNhHwDd/1c5WdkXISuZPm0OHYZ1vKRMzayHrWamZbqopiSdc
         avYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690748321; x=1691353121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxhyfb9b6r+ILlCqox+06L7O4WmZ3Hats0OpcMu4s50=;
        b=X2J+2ibwl2iHxFAtdGEGFjgXnEqtKh7j3TfVt8zo7CSSrd7GcnqYQZYXS4Kyp+yCsa
         B9uZt6Z+ma2IpqbMBzCjKmY+pCqRVJ5DzPuLnGFn8oufDDgg4Ix2MEXSt+2qW3L9kjco
         B4JRl2crw6TLRVW/b0XplLyIX4892Njx1XacQrdFJ/r1KgJOOloprc76uT0UQS5hA9Nu
         ttmt0PHXi+GzBjimoPpcAtbu38rjRx4M5SXfxqyWwrBlfI7nTlOmYYWOzyyXFJtyJ3d9
         K1qOHNEYl1bLpNrIqvgF/A/ZFpwfmgzRIe2qw4e7ZPAC8BP+iV3VxDYAI0EBjO9A6SB0
         v2qg==
X-Gm-Message-State: ABy/qLYnoDibjM05TJTudWOyNkdbbEVDpH8cNGXaAX8RFyr6v2MdjbGW
	14b4EaLenGnc0c3BYohXk5NJx/H3tpd2apib+Tg=
X-Google-Smtp-Source: 
 APBJJlHbOz+/n4AI/6SYfqrEB8zYSBe7Knxn3NRarnbhGtG2M1XiPE2Af2V+juzo5GvzhjS+BVrB6A==
X-Received: by 2002:a17:906:77d0:b0:99b:ef9c:e634 with SMTP id
 m16-20020a17090677d000b0099bef9ce634mr5124535ejn.65.1690748321625;
        Sun, 30 Jul 2023 13:18:41 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 va16-20020a17090711d000b0099bc0daf3d7sm5115533ejb.182.2023.07.30.13.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 13:18:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ryan Lee <ryans.lee@maximintegrated.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] ASoC: codecs: max9892x: Unify interleave mode OF
 property
Date: Sun, 30 Jul 2023 22:18:25 +0200
Message-Id: <20230730201826.70453-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230730201826.70453-1-krzysztof.kozlowski@linaro.org>
References: <20230730201826.70453-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OPBJEVULPBKHKQNMA4IOX6YQXVPOGLFP
X-Message-ID-Hash: OPBJEVULPBKHKQNMA4IOX6YQXVPOGLFP
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OPBJEVULPBKHKQNMA4IOX6YQXVPOGLFP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

MAX98926 and MAX98927 are quite similar and use the same bindings,
although drivers were not implementing them in the same way:
MAX98926 has boolean "interleave-mode" but MAX98927 has uint32
"interleave_mode".  Unify them under maxim,interleave-mode, already used
in other Maxim device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 sound/soc/codecs/max98926.c |  3 ++-
 sound/soc/codecs/max98927.c | 16 ++++++++--------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/max98926.c b/sound/soc/codecs/max98926.c
index bdc508e23e59..922ce0dc4e60 100644
--- a/sound/soc/codecs/max98926.c
+++ b/sound/soc/codecs/max98926.c
@@ -528,7 +528,8 @@ static int max98926_i2c_probe(struct i2c_client *i2c)
 				"Failed to allocate regmap: %d\n", ret);
 		goto err_out;
 	}
-	if (of_property_read_bool(i2c->dev.of_node, "interleave-mode"))
+	if (of_property_read_bool(i2c->dev.of_node, "maxim,interleave-mode") ||
+	    of_property_read_bool(i2c->dev.of_node, "interleave-mode"))
 		max98926->interleave_mode = true;
 
 	if (!of_property_read_u32(i2c->dev.of_node, "vmon-slot-no", &value)) {
diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index 0aaf2e6ae78d..e20aa5b1bce9 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -879,14 +879,14 @@ static int max98927_i2c_probe(struct i2c_client *i2c)
 	i2c_set_clientdata(i2c, max98927);
 
 	/* update interleave mode info */
-	if (!of_property_read_u32(i2c->dev.of_node,
-		"interleave_mode", &value)) {
-		if (value > 0)
-			max98927->interleave_mode = true;
-		else
-			max98927->interleave_mode = false;
-	} else
-		max98927->interleave_mode = false;
+	if (of_property_read_bool(i2c->dev.of_node, "maxim,interleave-mode")) {
+		max98927->interleave_mode = true;
+	} else {
+		if (!of_property_read_u32(i2c->dev.of_node, "interleave_mode",
+					  &value))
+			if (value > 0)
+				max98927->interleave_mode = true;
+	}
 
 	/* regmap initialization */
 	max98927->regmap
-- 
2.34.1


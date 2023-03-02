Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4A16ACAD2
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:40:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91159114D;
	Mon,  6 Mar 2023 18:40:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91159114D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124451;
	bh=luqWqC5oSH8yC4fXm8WRZe7hyqd7VZiS3FzmSlAoZgk=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VasiKVrtwDdVjTyLaR3i2CtEG2uIYu051IXwJuuc3mdUidBykVEEz7mXTw8GZcgwq
	 888hLSuTCi+GgSFxBtM77ggchU2jgaPOD/FvlWKrW7gcM7gI3QnZoIX9xoTpxRNtqa
	 nUGJBLuUCzJWDcXJ9NDoJr4EowFQHukikgnuthJE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91236F80529;
	Mon,  6 Mar 2023 18:38:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6080F8049C; Thu,  2 Mar 2023 12:57:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-32.mta1.migadu.com (out-32.mta1.migadu.com
 [IPv6:2001:41d0:203:375::20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B0CCF804B1
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 12:57:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B0CCF804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=p3i2oWfX
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1677758241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sredrf5PjZ7jQFXwhsTWfhRpimvvGAc4wV/iwzTmZq0=;
	b=p3i2oWfXX64J/GM40FQzzz9ICV3FS6E6pH4lDCCyy7YOp2GeNRWM0L6LgWvaaDUFYG8nrS
	JsC4lt9h3nfU1JJGScOJBu6/x+XrQKJnq360TuI5WChEuOL3dC/CGCuPgG3RaxCBz9v/4o
	SuxS+lrnpNYeCA30kp61Se0VWYaGU0A=
From: richard.leitner@linux.dev
Date: Thu, 02 Mar 2023 12:55:03 +0100
Subject: [PATCH 3/3] ASoC: maxim,max9867: add "mclk" support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230302-max9867-v1-3-aa9f7f25db5e@skidata.com>
References: <20230302-max9867-v1-0-aa9f7f25db5e@skidata.com>
In-Reply-To: <20230302-max9867-v1-0-aa9f7f25db5e@skidata.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Benjamin Bara <benjamin.bara@skidata.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453;
 i=richard.leitner@skidata.com; h=from:subject:message-id;
 bh=t7JeLv5Avx9AQ87GdXmgLhpXQCWm8ePC8Uj/0k4VhNI=;
 b=owGbwMvMwCX2R2KahkXN7wuMp9WSGFIY+uU7ly5v9/95II6d2/TEmpl/JRpjl/9oubQ0q6J9w9Pg
 BJ1PHaUsDGJcDLJiiiz2xlzt7rll7ysVdXJh5rAygQxh4OIUgImcimX4p+Rb7Xtxr/wJwSKfq3Jq+z
 3TBM53av9zm7Gv/Nbi8hlPpjH8lanmVk9hWxPJdoeZ6dvrUyq+6x84Fxjm/T4//3H/R2tLZgA=
X-Developer-Key: i=richard.leitner@skidata.com; a=openpgp;
 fpr=3F330A87476D76EF79212C6DFC189628387CFBD0
X-Migadu-Flow: FLOW_OUT
X-MailFrom: richard.leitner@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4V4O7GLVTJZGWKL7UF4Y6TZRXJRC6P2K
X-Message-ID-Hash: 4V4O7GLVTJZGWKL7UF4Y6TZRXJRC6P2K
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:38:44 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4V4O7GLVTJZGWKL7UF4Y6TZRXJRC6P2K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Benjamin Bara <benjamin.bara@skidata.com>

Add basic support for the codecs mclk by enabling it during probing.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 sound/soc/codecs/max9867.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index e161ab037bf7..b92dd61bb2b2 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -6,6 +6,7 @@
 // Copyright 2018 Ladislav Michl <ladis@linux-mips.org>
 //
 
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -16,6 +17,7 @@
 #include "max9867.h"
 
 struct max9867_priv {
+	struct clk *mclk;
 	struct regmap *regmap;
 	const struct snd_pcm_hw_constraint_list *constraints;
 	unsigned int sysclk, pclk;
@@ -663,8 +665,18 @@ static int max9867_i2c_probe(struct i2c_client *i2c)
 	dev_info(&i2c->dev, "device revision: %x\n", reg);
 	ret = devm_snd_soc_register_component(&i2c->dev, &max9867_component,
 			max9867_dai, ARRAY_SIZE(max9867_dai));
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(&i2c->dev, "Failed to register component: %d\n", ret);
+		return ret;
+	}
+
+	max9867->mclk = devm_clk_get(&i2c->dev, "mclk");
+	if (IS_ERR(max9867->mclk))
+		return PTR_ERR(max9867->mclk);
+	ret = clk_prepare_enable(max9867->mclk);
+	if (ret < 0)
+		dev_err(&i2c->dev, "Failed to enable MCLK: %d\n", ret);
+
 	return ret;
 }
 

-- 
2.39.2


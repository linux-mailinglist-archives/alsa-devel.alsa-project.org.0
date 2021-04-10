Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E81835ACDC
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Apr 2021 13:16:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F1411662;
	Sat, 10 Apr 2021 13:15:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F1411662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618053389;
	bh=8A1YPTSnDuKVDZ+sq1kCg0aKNP8XMXYqT+PB+5SRS2s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h7+rSSSLt0ruhl5As0SpfzcQIDkRrXpMA6pt3683YkD0pGA0/svOq8sD3Yp2s2F0n
	 EVt15T25unZty4D8BH9pPz8qupIFqanREiYGn93Aj1qEtZBCwVuoFYJj6tOwCHRfyc
	 7aMC0JlwdQmd6MVd62m9/mwJTScZUvNQKp65o17k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEE37F8032C;
	Sat, 10 Apr 2021 13:14:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7420FF80169; Sat, 10 Apr 2021 13:14:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4599BF800EE
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 13:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4599BF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="A3xrc6nv"
Received: by mail-wm1-x32d.google.com with SMTP id
 o20-20020a05600c4fd4b0290114265518afso4255057wmq.4
 for <alsa-devel@alsa-project.org>; Sat, 10 Apr 2021 04:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TP8T7u/GZFTrtgKPlRTZREBN4itlWMrED3RXVnj2Hvk=;
 b=A3xrc6nvjZqOxDDtK7Wx3wmDtTLWfx71NNoOx2Eq7lEMJwyrIsFIVSq5FFPUIcibcp
 rkSQB+P1yoi1YGs+ip7cvj3aJ3M7f8k2hlVQOPTwGQsjEQLYe7b/nDCE03dmnjDBU7c3
 waSD8DKKGazkEEHzmZo9dX22J9wwfcSztUkq1n/+1OKe6lswa3gTn4325ZxgAwWE4j+4
 K0ovXowaDT5Qb3NCmmbghjL2prSKgJbRzwDGoFMkfD64WqZ/iMIVpvQ8pqe0hx3n0M3f
 9EaQHGHdiIMARyC3N/GUrt0NuuMpS9W836Bq34pUCMcVQQOvN86EJ8mGAEoVJvLLM9L9
 Xrlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TP8T7u/GZFTrtgKPlRTZREBN4itlWMrED3RXVnj2Hvk=;
 b=f/RRs5ZGMJ05WzE9lnJD7CE76BcokdaSBxdGXgK7rw4TNimNUlAX4FBYRNdGK15098
 Zc/5p+4zr0HsCBJuAHD4H66T9RqhOHb3ECW+SorZX1xG+LurDmgDLt7eXH2YXR1fhsXC
 6y4atXbFr6XkXcPj4NzrODArvw7kdT/Iv/BQChCwZiO84LhPrx66N/dXozZu9bpnsCF+
 0kdCW7BrCZLTngW4o1kMRk2qSSoKXCkw0ds1V6zwtjxlgwz4fw4BN1YwjmMeiE+OKhyn
 sT9mGqYlSE0NdZ/Bfpd82yDo+s0lLRGvUqT0vqxLbUvd1B21AYm6/pKALi9lRxwbHShh
 08YA==
X-Gm-Message-State: AOAM530r8teU2OuQAk0jpuTNziEacxBskU9cQkkofGSgAxlL4/c51beL
 fXxwWcomHZhPG0HNsZFqMIRcpzkXdwqsvUSZ
X-Google-Smtp-Source: ABdhPJw9q7x+1VOwDxzk2hAmfo7HajBJAxPBRPLtfyVt6RgWc3TQJxduuAimU7XHHgvYNPMwoLvJMQ==
X-Received: by 2002:a1c:2704:: with SMTP id n4mr18029046wmn.143.1618053244789; 
 Sat, 10 Apr 2021 04:14:04 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id s8sm8370117wrn.97.2021.04.10.04.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Apr 2021 04:14:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 4/5] ASoC: lpass: use the clock provider API
Date: Sat, 10 Apr 2021 13:13:55 +0200
Message-Id: <20210410111356.467340-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210410111356.467340-1-jbrunet@baylibre.com>
References: <20210410111356.467340-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Clock providers should be registered using the clk_hw API.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/lpass-va-macro.c  | 2 +-
 sound/soc/codecs/lpass-wsa-macro.c | 9 +++------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 5294c57b2cd4..56b887301172 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1343,7 +1343,7 @@ static int va_macro_register_fsgen_output(struct va_macro *va)
 	if (ret)
 		return ret;
 
-	return of_clk_add_provider(np, of_clk_src_simple_get, va->hw.clk);
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &va->hw);
 }
 
 static int va_macro_validate_dmic_sample_rate(u32 dmic_sample_rate,
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index e79a70386b4b..acb95e83c788 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2337,10 +2337,9 @@ static const struct clk_ops swclk_gate_ops = {
 	.recalc_rate = swclk_recalc_rate,
 };
 
-static struct clk *wsa_macro_register_mclk_output(struct wsa_macro *wsa)
+static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 {
 	struct device *dev = wsa->dev;
-	struct device_node *np = dev->of_node;
 	const char *parent_clk_name;
 	const char *clk_name = "mclk";
 	struct clk_hw *hw;
@@ -2358,11 +2357,9 @@ static struct clk *wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	hw = &wsa->hw;
 	ret = clk_hw_register(wsa->dev, hw);
 	if (ret)
-		return ERR_PTR(ret);
-
-	of_clk_add_provider(np, of_clk_src_simple_get, hw->clk);
+		return ret;
 
-	return NULL;
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
 }
 
 static const struct snd_soc_component_driver wsa_macro_component_drv = {
-- 
2.30.2


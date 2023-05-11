Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 575856FF730
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 18:28:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E30EF15;
	Thu, 11 May 2023 18:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E30EF15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683822518;
	bh=4HepQnAekV+HY3IeTf66RThzY77MyhZbIqePJQTDXDs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KrWf8NIKVAYyiwi6BRkX+NKPjgOihfB18E+sCudYN6LgCYB5W1C4c4pKgBpCyyA21
	 Nq43pdxrsKA4lwT3SnKZUbEGZ1y/oP2zB0OptHXgC6+pElSuWwVXA3WH0aeRjoDqkp
	 +2n9WV3+KbnaBM4bEjXLLMLnzKlDAAPmKqBHxgUE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94C9FF80310; Thu, 11 May 2023 18:27:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34DCCF802E8;
	Thu, 11 May 2023 18:27:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 894C8F8052E; Thu, 11 May 2023 18:27:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C650F802E8
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 18:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C650F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=PmisfVof
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-64115e652eeso59220270b3a.0
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 09:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683822434; x=1686414434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hMQTOddVJSa22SR6zcvBJmFXpgRZVXNpCl3DB1GYgq4=;
        b=PmisfVof65a4l9eAYcp8O+qzOBcGyWPCT4YUzP5gsLa3PQizXpgoIH+Sl0L2ly0Bvk
         Da1HdA2Z4zb7UsmM3Y8bBO8MaQpBSb+bgRmbew3sn8MgzDgcuNScF5MyME+mQ0GFhtsm
         ER5LtWKgDF+zGPeqEYWm1ufwRBywXWdJoU08w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683822434; x=1686414434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMQTOddVJSa22SR6zcvBJmFXpgRZVXNpCl3DB1GYgq4=;
        b=PjiA2QM/LEQFnrCvUIruNQL9PU5MPQ+30vNnoQpHmbvwvqaWHhLtBTklAPOvBjoUuI
         JxDhG4gx0cd17B6lSXWdLha/pMkKvehrlNpN9F0/VPgFXdeX9nSTx/PVKB7C9zkC5WMd
         u3WXgGIegaW3Mvi8L4ltWhADAvt76iscY3EMlLYR/exs1gyL6sNC/83xFxxCm38eJn7h
         Qh4oKEpmP1PKjqBIoLVx84G63A2c16l30VVuq9ooKfVUVsyNDbQdRacQxAohstmenJos
         xLFMmi0AxfzeRXZMwgrgogj9IxFK47KhaQuC7iOcjZKrSWPbppS91+zrmf6LKNzkx1Hz
         TOqA==
X-Gm-Message-State: AC+VfDypSs6+aF6esUDcZlQ91rtXIpZwKpMOnw042nfpFw9tzO2HTOWj
	SwuYCu/mT4ixeJDGp41Jgv5ZUg==
X-Google-Smtp-Source: 
 ACHHUZ4Ihmqgqf0X43I7liRm06xU2X+VRF6LupG5hiM7Cu/k+aNUgx4MBE0VuGDKsTRGYo+uhIwwpw==
X-Received: by 2002:a05:6a20:4311:b0:104:2d89:8f89 with SMTP id
 h17-20020a056a20431100b001042d898f89mr1138807pzk.23.1683822434073;
        Thu, 11 May 2023 09:27:14 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:9915:1a0e:d2b7:87ef])
        by smtp.gmail.com with ESMTPSA id
 g15-20020a63f40f000000b0053031f7a367sm5217008pgi.85.2023.05.11.09.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:27:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunxu Li <chunxu.li@mediatek.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8186: Fix use-after-free in driver remove
 path
Date: Thu, 11 May 2023 09:25:12 -0700
Message-ID: 
 <20230511092437.1.I31cceffc8c45bb1af16eb613e197b3df92cdc19e@changeid>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PGMWWPOKYQAGXOECGOKZ74WRWHNWN6JP
X-Message-ID-Hash: PGMWWPOKYQAGXOECGOKZ74WRWHNWN6JP
X-MailFrom: dianders@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PGMWWPOKYQAGXOECGOKZ74WRWHNWN6JP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When devm runs function in the "remove" path for a device it runs them
in the reverse order. That means that if you have parts of your driver
that aren't using devm or are using "roll your own" devm w/
devm_add_action_or_reset() you need to keep that in mind.

The mt8186 audio driver didn't quite get this right. Specifically, in
mt8186_init_clock() it called mt8186_audsys_clk_register() and then
went on to call a bunch of other devm function. The caller of
mt8186_init_clock() used devm_add_action_or_reset() to call
mt8186_deinit_clock() but, because of the intervening devm functions,
the order was wrong.

Specifically at probe time, the order was:
1. mt8186_audsys_clk_register()
2. afe_priv->clk = devm_kcalloc(...)
3. afe_priv->clk[i] = devm_clk_get(...)

At remove time, the order (which should have been 3, 2, 1) was:
1. mt8186_audsys_clk_unregister()
3. Free all of afe_priv->clk[i]
2. Free afe_priv->clk

The above seemed to be causing a use-after-free. Luckily, it's easy to
fix this by simply using devm more correctly. Let's move the
devm_add_action_or_reset() to the right place. In addition to fixing
the use-after-free, code inspection shows that this fixes a leak
(missing call to mt8186_audsys_clk_unregister()) that would have
happened if any of the syscon_regmap_lookup_by_phandle() calls in
mt8186_init_clock() had failed.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c    |  6 ---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.h    |  1 -
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    |  4 --
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.c | 46 ++++++++++---------
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.h |  1 -
 5 files changed, 24 insertions(+), 34 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index a6b4f29049bb..539e3a023bc4 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -644,9 +644,3 @@ int mt8186_init_clock(struct mtk_base_afe *afe)
 
 	return 0;
 }
-
-void mt8186_deinit_clock(void *priv)
-{
-	struct mtk_base_afe *afe = priv;
-	mt8186_audsys_clk_unregister(afe);
-}
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.h b/sound/soc/mediatek/mt8186/mt8186-afe-clk.h
index d5988717d8f2..a9d59e506d9a 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.h
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.h
@@ -81,7 +81,6 @@ enum {
 struct mtk_base_afe;
 int mt8186_set_audio_int_bus_parent(struct mtk_base_afe *afe, int clk_id);
 int mt8186_init_clock(struct mtk_base_afe *afe);
-void mt8186_deinit_clock(void *priv);
 int mt8186_afe_enable_cgs(struct mtk_base_afe *afe);
 void mt8186_afe_disable_cgs(struct mtk_base_afe *afe);
 int mt8186_afe_enable_clock(struct mtk_base_afe *afe);
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 41172a82103e..a868a04ed4e7 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2848,10 +2848,6 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = devm_add_action_or_reset(dev, mt8186_deinit_clock, (void *)afe);
-	if (ret)
-		return ret;
-
 	/* init memif */
 	afe->memif_32bit_supported = 0;
 	afe->memif_size = MT8186_MEMIF_NUM;
diff --git a/sound/soc/mediatek/mt8186/mt8186-audsys-clk.c b/sound/soc/mediatek/mt8186/mt8186-audsys-clk.c
index 578969ca91c8..5666be6b1bd2 100644
--- a/sound/soc/mediatek/mt8186/mt8186-audsys-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-audsys-clk.c
@@ -84,6 +84,29 @@ static const struct afe_gate aud_clks[CLK_AUD_NR_CLK] = {
 	GATE_AUD2(CLK_AUD_ETDM_OUT1_BCLK, "aud_etdm_out1_bclk", "top_audio", 24),
 };
 
+static void mt8186_audsys_clk_unregister(void *data)
+{
+	struct mtk_base_afe *afe = data;
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	struct clk *clk;
+	struct clk_lookup *cl;
+	int i;
+
+	if (!afe_priv)
+		return;
+
+	for (i = 0; i < CLK_AUD_NR_CLK; i++) {
+		cl = afe_priv->lookup[i];
+		if (!cl)
+			continue;
+
+		clk = cl->clk;
+		clk_unregister_gate(clk);
+
+		clkdev_drop(cl);
+	}
+}
+
 int mt8186_audsys_clk_register(struct mtk_base_afe *afe)
 {
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
@@ -124,27 +147,6 @@ int mt8186_audsys_clk_register(struct mtk_base_afe *afe)
 		afe_priv->lookup[i] = cl;
 	}
 
-	return 0;
+	return devm_add_action_or_reset(afe->dev, mt8186_audsys_clk_unregister, afe);
 }
 
-void mt8186_audsys_clk_unregister(struct mtk_base_afe *afe)
-{
-	struct mt8186_afe_private *afe_priv = afe->platform_priv;
-	struct clk *clk;
-	struct clk_lookup *cl;
-	int i;
-
-	if (!afe_priv)
-		return;
-
-	for (i = 0; i < CLK_AUD_NR_CLK; i++) {
-		cl = afe_priv->lookup[i];
-		if (!cl)
-			continue;
-
-		clk = cl->clk;
-		clk_unregister_gate(clk);
-
-		clkdev_drop(cl);
-	}
-}
diff --git a/sound/soc/mediatek/mt8186/mt8186-audsys-clk.h b/sound/soc/mediatek/mt8186/mt8186-audsys-clk.h
index b8d6a06e11e8..897a2914dc19 100644
--- a/sound/soc/mediatek/mt8186/mt8186-audsys-clk.h
+++ b/sound/soc/mediatek/mt8186/mt8186-audsys-clk.h
@@ -10,6 +10,5 @@
 #define _MT8186_AUDSYS_CLK_H_
 
 int mt8186_audsys_clk_register(struct mtk_base_afe *afe);
-void mt8186_audsys_clk_unregister(struct mtk_base_afe *afe);
 
 #endif
-- 
2.40.1.606.ga4b1b128d6-goog


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B98826E5AC1
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 09:47:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3057E0E;
	Tue, 18 Apr 2023 09:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3057E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681804056;
	bh=5IbqXVFTGL04rbEqRhCWdRIxfFdMHfiUC06FaWY1mSw=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SebfUmvfT/dXKH51XBMyH1un5DRH2kFrhajk0j0ul5GttUIymsUuOUIU1yH9/VSLP
	 sImpc3Nf/AN83yBA1l8rY8IPU4KSmQxTG1oEZ7I9vwZeuQKJrUgFURWbjKGvJJ/8Yt
	 ZVG8ZVtExWFixFZTLwpP1rtaDL/fGUUQN8FDu4U4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 035B3F80149;
	Tue, 18 Apr 2023 09:46:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E8D6F804FC; Tue, 18 Apr 2023 09:46:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 074FBF800D0
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 09:46:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 074FBF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xeUihBhx
Received: by mail-ej1-x629.google.com with SMTP id sz19so13747416ejc.2
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 00:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681803994; x=1684395994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r75opw4l+CuhzHbMethMKplabYX6RCoTnwLJOAhIH2w=;
        b=xeUihBhxZpDw3QqpfDYWEsAjDVqperPh1t0wYprp0Xc0pDzXU2RUtVLV2Chco6lXQK
         y1zWf41LzWNQtKtfmvytgrSHu0h+8uazuqfDTa2UZ41gEwWWpIFWLsZ3G2WN57BBMsne
         nxNO0QoCslwB2reV1GDhXcC5FgpU1xblug5Q1r4ftpH+Kedkxx7XiA9mt8kjYsvT1MZT
         As7eLuhzgixF+k/fPGNbRltr52nKQzkj7hsl2ExdutdlE3tprI0kuflQ1cozOYV6cM1q
         PzG8I4ZtecLXmjLXDII8fBgK4Y7aoXGV8AYqqbmWRwv+oTqmVUo+zAJj/AbXULdhn7n6
         8HWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681803994; x=1684395994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r75opw4l+CuhzHbMethMKplabYX6RCoTnwLJOAhIH2w=;
        b=ZNJ9dwYow7NrErjMmNYRoGIA6oOO1bVBqiSBdhleysOc+fz3wC4I/I/Fs63/mxoN8T
         e0VIq48wsNAkyiOGOSmfvTHGMUTst2vCZfVQMOzbjvin9CVptLFvjyxleazA0OmHtU3k
         6zHfJT+0WcVkIT0QBkqx4UtGks+znYxxF+3lrvczs0SouxVCW6biWDnAyxxgySMS33v6
         BaTmTHAYbPvuQaMaEj38BdX4jzNksXW5nwuoImxNBtAA6QXEkl88uVlu7Dzj4vaBFUgS
         Q/KQQHFSLZiC5Y0LLcQtDBxl+nk4CzCsTAWr62LEW0PPiPg80XZLoXgcLKkIHJ8G+FI7
         XuPw==
X-Gm-Message-State: AAQBX9eCBYFOq4hUl4BmPjEWi4KTJpQdx1OwiUlTy8Cex7rbf3oS33nb
	sO+Lg3KL7j//2PKNBwMFLs7vfg==
X-Google-Smtp-Source: 
 AKy350Z/p8EIAtZAxXyH27eboA35NbIl/kTqGzUgL6dzF9dIDkVlpNY2VfIyskViVRSjKS33fHEUhw==
X-Received: by 2002:a17:907:6d24:b0:94f:395b:df1b with SMTP id
 sa36-20020a1709076d2400b0094f395bdf1bmr8173936ejc.21.1681803993713;
        Tue, 18 Apr 2023 00:46:33 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id
 sa39-20020a1709076d2700b0094f410225c7sm3731993ejc.169.2023.04.18.00.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 00:46:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] ASoC: codecs: wcd9335: Simplify with dev_err_probe
Date: Tue, 18 Apr 2023 09:46:27 +0200
Message-Id: <20230418074630.8681-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HQDSFFXKDYNPBIGVDTX3MERJROFEH352
X-Message-ID-Hash: HQDSFFXKDYNPBIGVDTX3MERJROFEH352
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQDSFFXKDYNPBIGVDTX3MERJROFEH352/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace dev_err() in probe() path with dev_err_probe() to:
1. Make code a bit simpler and easier to read,
2. Do not print messages on deferred probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Re-write commit msg.
---
 sound/soc/codecs/wcd9335.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index d2548fdf9ae5..8bf3510a3ea3 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -5138,20 +5138,17 @@ static int wcd9335_irq_init(struct wcd9335_codec *wcd)
 	 * INTR2 is a subset of first interrupt sources MAD, VBAT, and SVA
 	 */
 	wcd->intr1 = of_irq_get_byname(wcd->dev->of_node, "intr1");
-	if (wcd->intr1 < 0) {
-		if (wcd->intr1 != -EPROBE_DEFER)
-			dev_err(wcd->dev, "Unable to configure IRQ\n");
-
-		return wcd->intr1;
-	}
+	if (wcd->intr1 < 0)
+		return dev_err_probe(wcd->dev, wcd->intr1,
+				     "Unable to configure IRQ\n");
 
 	ret = devm_regmap_add_irq_chip(wcd->dev, wcd->regmap, wcd->intr1,
 				 IRQF_TRIGGER_HIGH, 0,
 				 &wcd9335_regmap_irq1_chip, &wcd->irq_data);
 	if (ret)
-		dev_err(wcd->dev, "Failed to register IRQ chip: %d\n", ret);
+		return dev_err_probe(wcd->dev, ret, "Failed to register IRQ chip\n");
 
-	return ret;
+	return 0;
 }
 
 static int wcd9335_slim_probe(struct slim_device *slim)
@@ -5207,17 +5204,15 @@ static int wcd9335_slim_status(struct slim_device *sdev,
 	slim_get_logical_addr(wcd->slim_ifc_dev);
 
 	wcd->regmap = regmap_init_slimbus(sdev, &wcd9335_regmap_config);
-	if (IS_ERR(wcd->regmap)) {
-		dev_err(dev, "Failed to allocate slim register map\n");
-		return PTR_ERR(wcd->regmap);
-	}
+	if (IS_ERR(wcd->regmap))
+		return dev_err_probe(dev, PTR_ERR(wcd->regmap),
+				     "Failed to allocate slim register map\n");
 
 	wcd->if_regmap = regmap_init_slimbus(wcd->slim_ifc_dev,
 						  &wcd9335_ifc_regmap_config);
-	if (IS_ERR(wcd->if_regmap)) {
-		dev_err(dev, "Failed to allocate ifc register map\n");
-		return PTR_ERR(wcd->if_regmap);
-	}
+	if (IS_ERR(wcd->if_regmap))
+		return dev_err_probe(dev, PTR_ERR(wcd->if_regmap),
+				     "Failed to allocate ifc register map\n");
 
 	ret = wcd9335_bring_up(wcd);
 	if (ret) {
-- 
2.34.1


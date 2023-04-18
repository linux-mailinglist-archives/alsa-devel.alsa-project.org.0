Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 666F26E5ACF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 09:48:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F299E79;
	Tue, 18 Apr 2023 09:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F299E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681804109;
	bh=elaz8ZFwFH0ba/QSKTTX6DLV5Y0Gpm6Uzg/S/p6tsaU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LBhVDBtNc7CjplF5yA9V77K9Aiot69sWBNgVuGPW6e8mqhjr9n06YBcOZKTV30/s1
	 SmWdoPp5tO4cY4oyQXkP+DOgDtApSXTJA99S6fJab3ScnVbz0aS9uvGWeQpu1DBF6X
	 bAuTEYgMBtX+9mFnZOzVwSN3uDSYmzT11ugvhlh8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E256CF8052D;
	Tue, 18 Apr 2023 09:46:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E4E5F80155; Tue, 18 Apr 2023 09:46:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50E6DF80149
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 09:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50E6DF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YZNWGQsk
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-94a34d38291so529447566b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 00:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681803994; x=1684395994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o12ebF9++JVUvhpdQh9deSW0oeUpmXNibeCUjBiWaVA=;
        b=YZNWGQskAWaR2q2RjOEHZVsl62XSVmgC9xJB4lIqLtYzbrKBJz9znlfxGyiVdkUTbD
         EdeEYATXSTBAFfnp8Of6o0p0Uf2s+9SyXuvyOyxfPgt4ElqPM2VawcxGGjm4EneE+kXt
         MFGh3VUrnCJsnlbq5X3xajzuvSiFwvpWOONF6u/LlD3QjoUItBVl2mDDU4QDy6Jf1COf
         UdYS8a/nH8SD5rlQc+EwU0y7vDaPjQopGhqdBx03jnsbrewjWqtwhOVOb9wNjo+m44ey
         OJzBONsullh0IJU0uKe574dyfz+TgD703l8I35ZXWMUAvAiTmgSxUOqOfU0rvXxsOjZ0
         Q8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681803994; x=1684395994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o12ebF9++JVUvhpdQh9deSW0oeUpmXNibeCUjBiWaVA=;
        b=WWmFJKOqce6JX1Y2TrFI4WSxW7qOAFJGADQZPxGHfI4oTlIJHfgrBEXqLmUEjw1dV8
         m4ufryx2zcnBD0QXOor1vfFQarkyySJA4Az4L2o9qPV5wT1ZvAxCGylmJtIpgKPa1YVQ
         IIfhjJRjvlPKSQI2epsIez0Z2nCyF2/23wilDb1ZSbwx/KSSGz03NeSFJj+p60XMERyl
         sMHPVWWCrtB5KxPsK4DVaQD7MB4bpVooP6K7jZNDHbW2YrqJTyyQ2o0PhE/07KoFoZRm
         IqQ8tfPV4l0aBYRuEAOatHL+eLNNGjvmpMJi3zZX/XBQPtnfZuvZz4Gh9VvtNfpQtylm
         fzCQ==
X-Gm-Message-State: AAQBX9cLkQg9XrjJCeIG+Wb5NkPmvublrEdzUt9U291yVBpnQfiCoy61
	Iz66Al3JotEvKVOcf6Av7HTQmA==
X-Google-Smtp-Source: 
 AKy350ZtFKag5MXhYcTH62ouNdlygN8c6TqlGXIZNzZsHErco0sFZK5MTskdQ6jMWuQg2eohYm3VYw==
X-Received: by 2002:a05:6402:748:b0:506:ae87:a36a with SMTP id
 p8-20020a056402074800b00506ae87a36amr1550021edy.14.1681803994735;
        Tue, 18 Apr 2023 00:46:34 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id
 sa39-20020a1709076d2700b0094f410225c7sm3731993ejc.169.2023.04.18.00.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 00:46:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] ASoC: codecs: wcd934x: Simplify with dev_err_probe
Date: Tue, 18 Apr 2023 09:46:28 +0200
Message-Id: <20230418074630.8681-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418074630.8681-1-krzysztof.kozlowski@linaro.org>
References: <20230418074630.8681-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2THKBKF4MYX7ZWTF5SCN3YNP3UYG6WPU
X-Message-ID-Hash: 2THKBKF4MYX7ZWTF5SCN3YNP3UYG6WPU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2THKBKF4MYX7ZWTF5SCN3YNP3UYG6WPU/>
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
 sound/soc/codecs/wcd934x.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 783479a4d535..56487ad2f048 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -5868,10 +5868,9 @@ static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
 	slim_get_logical_addr(wcd->sidev);
 	wcd->if_regmap = regmap_init_slimbus(wcd->sidev,
 				  &wcd934x_ifc_regmap_config);
-	if (IS_ERR(wcd->if_regmap)) {
-		dev_err(dev, "Failed to allocate ifc register map\n");
-		return PTR_ERR(wcd->if_regmap);
-	}
+	if (IS_ERR(wcd->if_regmap))
+		return dev_err_probe(dev, PTR_ERR(wcd->if_regmap),
+				     "Failed to allocate ifc register map\n");
 
 	of_property_read_u32(dev->parent->of_node, "qcom,dmic-sample-rate",
 			     &wcd->dmic_sample_rate);
@@ -5923,19 +5922,15 @@ static int wcd934x_codec_probe(struct platform_device *pdev)
 	memcpy(wcd->tx_chs, wcd934x_tx_chs, sizeof(wcd934x_tx_chs));
 
 	irq = regmap_irq_get_virq(data->irq_data, WCD934X_IRQ_SLIMBUS);
-	if (irq < 0) {
-		dev_err(wcd->dev, "Failed to get SLIM IRQ\n");
-		return irq;
-	}
+	if (irq < 0)
+		return dev_err_probe(wcd->dev, irq, "Failed to get SLIM IRQ\n");
 
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 					wcd934x_slim_irq_handler,
 					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					"slim", wcd);
-	if (ret) {
-		dev_err(dev, "Failed to request slimbus irq\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request slimbus irq\n");
 
 	wcd934x_register_mclk_output(wcd);
 	platform_set_drvdata(pdev, wcd);
-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DE7905868
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:19:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67EB51D9;
	Wed, 12 Jun 2024 18:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67EB51D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209139;
	bh=kmHrZal9uMPsgRPbVS2wX2WDN6jgfyJMmeShmB1SJBo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FwqfhQg1Ou5FUtOUpomwwUhU/C/QINyDvJ/Oe1D8th3APwo03OYK7i2HqcyvvV1E2
	 0wzk4ig7vNRpiS4etbBZpPuXK4VrWiQ75NMkESHXjWvzwCKcoZtLFgxH0zGojpkIql
	 ZARCf+8W5x5doJIZJuL4qwBQQgqLtw7L934Awk7Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E31CF80753; Wed, 12 Jun 2024 18:16:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9593F8070D;
	Wed, 12 Jun 2024 18:16:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9BBDF805AC; Wed, 12 Jun 2024 18:16:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75A9EF8010C
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:15:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75A9EF8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gHtVPwf+
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6f1c4800easo6785066b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208946; x=1718813746;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vbzfTDLIXVMqmme/hD5kLRfNrGqESO/8cdwhRwG3gw=;
        b=gHtVPwf+y1fnlZyZ5WzYGwI297T0a21MCtPQ9Wuq9esbdX4iAgbX8tcMjTsk7lMm/G
         Ei2yx5q2ZxumQG4hQ52j0uVBtv2Nucb6eluOHTrfg18p/aYHApVwdyYJq9OBryP9m+ec
         IJ6ScMM8f6j3saMaGXK1cMSVg6Nndk4YTvIYhKtSgp/t2PhiKx4Tnim3w1DidNos+js6
         H9QL+wULhuHDEaLPzX+4vX3ck47q9+IlrldL3lyZZsDirHfzwl5ay1GcoK/RGZz+KMNb
         IPr9pqyedtQJe7sN3T9To52wtyaW/RRi1RBVbAVX1e1LcDcRDJe9K2We8isYHzrfcbZf
         hyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208946; x=1718813746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vbzfTDLIXVMqmme/hD5kLRfNrGqESO/8cdwhRwG3gw=;
        b=BlS2CFIiZX3mJ+U7s/JMTN1gGfgUWakdDNZD1w7HsisEjIpfB2/hA25+8CH6upwgUw
         MDx+ifB4qjCLEJ4D7Oa0cOM0TcIIIKzzriNYjiOvz5hfj/EDa8NNBPXPG15wKbl2o54F
         xNFan7ReE3jCrrjnSZXp0qNXTEkHrgUDsjyk0l/NNECy37ZTbIBgFnd+7Rc/7pU0nHX4
         7jg3O/41oW+87MhxRISnoimZ73rdXOlJpNLIgUjRD2eiNF+oRJrAgFdShG93HhMYIUqO
         ALaOv3Z5r28OMOnKaWyjqne36C1WPV7YlLtjQkuZKMC+e+peSeJaKXBhi3StH+1/Mcd8
         lq2g==
X-Gm-Message-State: AOJu0YzwFo4QrHSfVGzKwRebgudJdpZE3I54OyyYNMWRgoiQNLsRhPk7
	/2BG/7biRVcrdIWfs0AR/meVSE6M1VN5tDLErz1uhcHUha2GO+gQgLXFEf1eSK8=
X-Google-Smtp-Source: 
 AGHT+IGHo7iEHrMc6jZ+1uvhQ5GWbZxNEiTM+xSPoQ25wNo69BzSn1Gz2bKI/JAgaTLz5pYO3KXTWg==
X-Received: by 2002:a17:906:d1d1:b0:a68:cc6f:cb5a with SMTP id
 a640c23a62f3a-a6f47ff7954mr124721866b.68.1718208946393;
        Wed, 12 Jun 2024 09:15:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:16 +0200
Subject: [PATCH 03/23] ASoC: codecs: wcd9335: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-3-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1876;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kmHrZal9uMPsgRPbVS2wX2WDN6jgfyJMmeShmB1SJBo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmZZugs/rmJyBKWN4qJvPQc9RXY0qGtUACXg
 e9KokazjtaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJmQAKCRDBN2bmhouD
 15pqD/wMYa35jKtzWSHg52wUZoc1riTh2ujENos0BMiZu0FIaRg1JHLUX9u+s5tb1WCAuJGpaOh
 aiARbNbjZ9qYYcz3BKViBe+ns4Z3KTeM23gOwUQZjpP17RhK1xE+Aq6ZBDOh78f3g8Ep6043Cdn
 Lo1bcFH9zmhz/6N90k9YPHHZfAH9cck5rEcd/f85v7YPrcwJl2fr+pgtYjA/pUl6kmCyltlAsVu
 hZpF2g6ZqDlDwHtsijkaVGuAZaylrm/Ev1FnHmvFE0GfUnNhqZeWN+FsBrByL57TNbePY+fS5oz
 8o1zf5dAJz/w97D7G74N+gViSe5x5a3Lkn//301EZJw02AOpG61fGOup9XKrQGMi3ujkAIY3xR2
 wQhuVesGfuWhKiQyQsALwEps4XlMviu8Zq2aHnAqZIfqrUjrp8hcaSL7wNavN9w3XA+/MTE7K7C
 EdnoWbbYMQ7DIcOE4bLRsT0j26y65+yqABu8wJZFqhBgQkVYWabWd+PnLClFdOUnQkXYI+IfQSX
 aWoYKP0xNNp2MnxJ6HUJFRY+yt30OxePV7UnpK+Gr7rIXQeLwHiUkZKM54dXZAJAxmJCeSDtqyJ
 Jn7yR+/oI3gH6kY1IfuGjU/0wi7BHO8W2XL//goRWEMIyg3Q1SinEM2akpRIkDxo4tVvnfcWkJ6
 mo5QlXMSHSiDF8A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: F6EPYBFYZMWEBHAVFZ2QI6MVHAL4KHNV
X-Message-ID-Hash: F6EPYBFYZMWEBHAVFZ2QI6MVHAL4KHNV
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F6EPYBFYZMWEBHAVFZ2QI6MVHAL4KHNV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver does not modify few static data (arrays with sample rates,
interrupt description, regmap config), so make them const for code
safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 60e7704e48d2..c5ac2d46e556 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -394,13 +394,13 @@ struct interp_sample_rate {
 	int rate_val;
 };
 
-static struct interp_sample_rate int_mix_rate_val[] = {
+static const struct interp_sample_rate int_mix_rate_val[] = {
 	{48000, 0x4},	/* 48K */
 	{96000, 0x5},	/* 96K */
 	{192000, 0x6},	/* 192K */
 };
 
-static struct interp_sample_rate int_prim_rate_val[] = {
+static const struct interp_sample_rate int_prim_rate_val[] = {
 	{8000, 0x0},	/* 8K */
 	{16000, 0x1},	/* 16K */
 	{24000, -EINVAL},/* 24K */
@@ -4023,7 +4023,7 @@ static irqreturn_t wcd9335_slimbus_irq(int irq, void *data)
 	return ret;
 }
 
-static struct wcd9335_irq wcd9335_irqs[] = {
+static const struct wcd9335_irq wcd9335_irqs[] = {
 	{
 		.irq = WCD9335_IRQ_SLIMBUS,
 		.handler = wcd9335_slimbus_irq,
@@ -4960,7 +4960,7 @@ static bool wcd9335_is_volatile_register(struct device *dev, unsigned int reg)
 	}
 }
 
-static struct regmap_config wcd9335_regmap_config = {
+static const struct regmap_config wcd9335_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 8,
 	.cache_type = REGCACHE_MAPLE,
@@ -4984,7 +4984,7 @@ static const struct regmap_range_cfg wcd9335_ifc_ranges[] = {
 	},
 };
 
-static struct regmap_config wcd9335_ifc_regmap_config = {
+static const struct regmap_config wcd9335_ifc_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 8,
 	.can_multi_write = true,

-- 
2.43.0


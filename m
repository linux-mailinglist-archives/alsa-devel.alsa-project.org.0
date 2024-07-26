Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BEF93D4D7
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2024 16:12:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05D65E7D;
	Fri, 26 Jul 2024 16:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05D65E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722003134;
	bh=U0iQgUf77isNWPz5wSO/QalnZ8ymeec3WHS6WdettZs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o5e63diLTr7sa12XPm6V3yA+zlN6mO54Juw2dsZZGUS2sIYzB3naXIUttmuLClD3y
	 wfvYHpiiCp4f8+kA+0Ds547F4VUKo8GAcZ6+6Z2DWGKxVizixQW8r1K5Db6nXvQzkM
	 ApFQoIQdbJkNYYAa2Ai3i2MTRGAZQYdIZJfhZP2s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A69C2F805F8; Fri, 26 Jul 2024 16:11:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D195DF805FE;
	Fri, 26 Jul 2024 16:11:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65CAAF805C4; Fri, 26 Jul 2024 16:11:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6322CF8013D
	for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2024 16:10:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6322CF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MITWT61G
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-427d2cc1c4eso15603265e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 26 Jul 2024 07:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722003057; x=1722607857;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEkK+be/9njUC3Is9y04g3ij2793OMGUHZjC8ZIJXBo=;
        b=MITWT61Gom133Q1iGu0u1dt0gMi1vzmF3iE27UD9tDlbqXjYhQ62KJGQTzwcYTc7Ai
         QNldHqAZtybJ7MfJPlyyINzb6S1QpV6wszzQaNA/7geUAMDyFyhYjfa538B4PqIIcyrZ
         mccBLoLLZDUhr8VdaFG6ZEsnqallIgveV1KRH6jO5xOSwYj4GoZW3ofwsnOX370uflRX
         Zs5/T3AdmwrX24Tvk6scm60G9AmVQeJNHlUy9tBL6+2C3iPDgbL85qcgPrw8v8G4Hndk
         8DBjii5VRnsfo0pKuU8uKaqqh8EnJmtF3pWmU1q3C2dn46ww93Vc0oNsKK7UZE36+ieG
         qSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722003057; x=1722607857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEkK+be/9njUC3Is9y04g3ij2793OMGUHZjC8ZIJXBo=;
        b=kbJD/J6w9Gytv2bqsNQQIwt1hJb1+5JNWywQWb7l8vkjIU29BJZF3XWLcDDxdyi6hl
         NGGGQShtDfQ4XwQBg2RfhGoYSfNbjlTFYo3PLdqGS/okn9cz32lpMsGkkRCQpu4hYxjE
         V6m0gufCnoF+UNp6eVxK144TbbvOPJ775Xwpx6nq1XTKsQo1sK2Id046afOeErjYERIH
         htIx2Y0M239jOzeROuZrXNBIj845+veenx4ckJNcrgUHMOWHK69EJ+piY8QPNhYYqQ0p
         hr2f2aQWJULG81p7om9iKqs/lRVMAm28BU9BvPI9krGtDruGfl0a/fpp4YbrF6mjFqQe
         WMcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLfjnYLDImWxGX719/cmBkzhVyDPx7R1rMmobCVhnxQt63aqIdg/0w2gBnS9ATmQKrMsP35Hp+T0tNLQuwX3XbnQcfaQdVUT7mzL8=
X-Gm-Message-State: AOJu0YxQeJ+H4fw1i3Hdc/56eOGlp3HuksHBiIItzgXnn12yI1N4iuRk
	nN30zTyCCHjA1ofeJHxlS583epE23BNQkh19bJ9Hd1BxwmW4VJT1FocTM7vKDn0=
X-Google-Smtp-Source: 
 AGHT+IFV/ZpujOQQuNU4y5xUkqHK9TT5v4LwDRDBL4tAqj/tx/FvrWYNs9CZlkMnnbNmp4SxPWDCKQ==
X-Received: by 2002:a05:600c:45d0:b0:426:6945:75b8 with SMTP id
 5b1f17b1804b1-4280579e92cmr43011845e9.31.1722003057369;
        Fri, 26 Jul 2024 07:10:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f941352asm120841115e9.41.2024.07.26.07.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 07:10:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 26 Jul 2024 16:10:41 +0200
Subject: [PATCH 1/6] ASoC: codecs: wcd937x-sdw: Correct Soundwire ports
 mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-1-d4d7a8b56f05@linaro.org>
References: 
 <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
In-Reply-To: 
 <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1998;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=U0iQgUf77isNWPz5wSO/QalnZ8ymeec3WHS6WdettZs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmo65oM7TrQ4WPQo4XevW2lOaGA4R95dKCpZlv6
 wW46Z1aQP+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqOuaAAKCRDBN2bmhouD
 1/fvEACZejwshy7ORBUx21bbMgVsL7J/sztl10qJqNBoJeYs/gzMUsbENWm5JgO41XERX3/pfSo
 njQhapIsqRFLzlnen+Ok8TM/VRFoJUcXy5ttXSSOeSg/VRqNXO3op1XZQVgQkthRMruMwLtpQfv
 p7Ioldc0W1i2+muv17N+dtEVTsiVqQHDeMxTLZyUehIqIh0ujJG3Epa/uY+L49uSDoDKmpDPfQN
 Kb+BGzsuOCNeSorxevLNxmXad8la64bfdRXcxA29XsM5dht0wps8ECiIa4UEJRKowxISObJp/Wi
 ssDC4gmOguXoqxa/d1b7jCpx+6CnGgAWr85xitDbo0u/eJcBtJJuabta0yinmIHEjs34mRAae6X
 IT4p8mC7im5Ci/ErNcqoSwu1P2KrF0Hj3NyhrKBQ0UKUfgl1KyBk5xVHpLXEq4lLP4hpJMM+pZI
 XXKqLLfLc9owJQYBlFp0i/E4pq8xUpQOPTUAPBDnwoPe9tG0LXpApktVOEbv1EOCkMcelM1MitR
 zx6dHe1tFQ4WrJxFcx50DYUrsg3AVxtgH0HHPNC3w3Uy3ymLQc9RMGR7eTML5ZuqbMFf1gtzMjG
 R7VzVUxbGQomk/JoXeagI4n3whtWwoR3JUgTD3Bkx6oIpEqJHsIUYcdbaKuNM9S4TuyGGxPartk
 vl9HRMjVQGz3lGw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: MCRNXUU3A3BZCFJTKVUIBXW55NGD644Q
X-Message-ID-Hash: MCRNXUU3A3BZCFJTKVUIBXW55NGD644Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MCRNXUU3A3BZCFJTKVUIBXW55NGD644Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Device has up to WCD937X_MAX_TX_SWR_PORTS (or WCD937X_MAX_SWR_PORTS
for sink) number of ports and the array assigned to prop.src_dpn_prop
and prop.sink_dpn_prop has 0..WCD937X_MAX_TX_SWR_PORTS-1 elements.  On
the other hand, GENMASK(high, low) creates an inclusive mask between
<high, low>, so we need the mask from 0 up to WCD937X_MAX_TX_SWR_PORTS-1.

Theoretically, too wide mask could cause an out of bounds read in
sdw_get_slave_dpn_prop() in stream.c, however only in the case of buggy
driver, e.g. adding incorrect number of ports via
sdw_stream_add_slave().

Fixes: c99a515ff153 ("ASoC: codecs: wcd937x-sdw: add SoundWire driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding Cc-stable because I don't think the issue can lead to real
out-of-bounds read.
---
 sound/soc/codecs/wcd937x-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
index 3abc8041406a..0c33f7f3dc25 100644
--- a/sound/soc/codecs/wcd937x-sdw.c
+++ b/sound/soc/codecs/wcd937x-sdw.c
@@ -1049,7 +1049,7 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 	pdev->prop.lane_control_support = true;
 	pdev->prop.simple_clk_stop_capable = true;
 	if (wcd->is_tx) {
-		pdev->prop.source_ports = GENMASK(WCD937X_MAX_TX_SWR_PORTS, 0);
+		pdev->prop.source_ports = GENMASK(WCD937X_MAX_TX_SWR_PORTS - 1, 0);
 		pdev->prop.src_dpn_prop = wcd937x_dpn_prop;
 		wcd->ch_info = &wcd937x_sdw_tx_ch_info[0];
 		pdev->prop.wake_capable = true;
@@ -1062,7 +1062,7 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 		/* Start in cache-only until device is enumerated */
 		regcache_cache_only(wcd->regmap, true);
 	} else {
-		pdev->prop.sink_ports = GENMASK(WCD937X_MAX_SWR_PORTS, 0);
+		pdev->prop.sink_ports = GENMASK(WCD937X_MAX_SWR_PORTS - 1, 0);
 		pdev->prop.sink_dpn_prop = wcd937x_dpn_prop;
 		wcd->ch_info = &wcd937x_sdw_rx_ch_info[0];
 	}

-- 
2.43.0


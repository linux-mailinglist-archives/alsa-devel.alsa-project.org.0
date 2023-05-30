Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BDB71651D
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 16:51:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6925E1DC;
	Tue, 30 May 2023 16:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6925E1DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685458307;
	bh=suFJKgZcruSgLxnSB7JjxSa4ENfUSumdKW5jgt00UXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JETMct1JvkV4CCryXv1M06cNt5TbC4hMKRYnxHgt/FfWKehPm03CdNm9s5izMn5oE
	 bYnsINM+slrIz2eXUA/WhbcYEalMt50FJP3fZEslk/J6iPwwHrG1vAZm0S7ogaO6rP
	 eMJoB6RAs+xcoRMhqucq1tN2QReSw/fy8xNHtQX0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62899F805B4; Tue, 30 May 2023 16:49:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E39DF805B2;
	Tue, 30 May 2023 16:49:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D168F80580; Tue, 30 May 2023 16:49:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C910F80564
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 16:49:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C910F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=au3kKg8W
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2af2451b3f1so49073621fa.2
        for <alsa-devel@alsa-project.org>;
 Tue, 30 May 2023 07:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685458150; x=1688050150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1z7LKWFPOmfXdAKBPrDZn05nG/m3OsiksUdI+BUoo8=;
        b=au3kKg8W7QqZlM184Mf3plRAjYuxNOiScsb1NkoNQrKhB+QKk+18S6EtrPRE58o5Rs
         Q1/3o2Mjj9eY0FEkE53VAKcNAbApZFdG5q9x7+IyOwzMudLNMFi+sq4W0TzNG2QkGwHO
         YnGuPKIwQhukjOLKYlXmRBvdNvqokIHxeYfj7hwnQ4hepXuizdGpVCLTdZusUyau/TGP
         3Vj4v3F4Sg6f3/X2GB+44fSqmHH9eyb+nkIEeJFVpK5Ifb5peDRxxdT/JHpLmKDfKEph
         /287kJIavDJMaiQ4wsKVKTqboEp2XQfs7llNgs/6FY4YQQ0C6Fz2iGXVoBHlZ2Iep6Ah
         ZkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685458150; x=1688050150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W1z7LKWFPOmfXdAKBPrDZn05nG/m3OsiksUdI+BUoo8=;
        b=aBPlf8X57KVqRK4DdyMTFmi+uFEtxpTnMD7YBo7Q3Lmq/l+8SnMaQNNYgJOmHtjz0e
         nkZXP27UJJoTjxtXWW7TBl8l3Y9UdAloMpTDdalLcWW3QwzLF+xv2+F1aUupvVS171XK
         oLXJEDJVSOYbuUwu6+fwC/vGyIbccRpZecyOUYwFKnukO3/JZ/6g0p3rJvGXmDo6ke7Q
         VPndECLugXn/6U8O3YZUwP7YkDTH9MnDi95gjaQ4XoqfE8B4M4OiTf1sONKmrK7SUEuy
         ihqFHYCXuz3IMjybiCSF59yHHa16bM1IlNZT6tJNB3N+GWsikif8yx+HT0ydwvomQH8E
         tfLw==
X-Gm-Message-State: AC+VfDyrqW+pI5MZpMnO8qqGpIScv7FNmExSXFmj4D8WHEWYDpoBDYxL
	57OvxKo2cvNkH6X1nxXTuhPVtA==
X-Google-Smtp-Source: 
 ACHHUZ6Q397O5W+0T36KU+LeZVZXavLXO/YPP87rL8qBwPyoOzxipjl3/WBbz3r85vX0ljLsQp0EWA==
X-Received: by 2002:a2e:8382:0:b0:2ad:a12d:e458 with SMTP id
 x2-20020a2e8382000000b002ada12de458mr1016018ljg.41.1685458150736;
        Tue, 30 May 2023 07:49:10 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id
 q21-20020aa7cc15000000b00514b2717ec6sm631283edt.28.2023.05.30.07.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:49:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Dipen Patel <dipenp@nvidia.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Dilip Kota <eswara.kota@linux.intel.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	timestamp@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH 5/7] spi: dt-bindings: restrict node name suffixes
Date: Tue, 30 May 2023 16:48:49 +0200
Message-Id: <20230530144851.92059-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y7OLY2CZX2MVEIM3UYA5YXI3KJG7E4WQ
X-Message-ID-Hash: Y7OLY2CZX2MVEIM3UYA5YXI3KJG7E4WQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y7OLY2CZX2MVEIM3UYA5YXI3KJG7E4WQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Make the pattern matching node names a bit stricter to improve DTS
consistency.  The pattern is restricted to:
1. Only one unit address or one -N suffix,
2. -N suffixes to decimal numbers.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Tony Lindgren <tony@atomide.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
---
 Documentation/devicetree/bindings/spi/spi-controller.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
index 90945f59b7e8..524f6fe8c27b 100644
--- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
@@ -17,7 +17,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^spi(@.*|-[0-9a-f])*$"
+    pattern: "^spi(@.*|-([0-9]|[1-9][0-9]+))?$"
 
   "#address-cells":
     enum: [0, 1]
-- 
2.34.1


Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0AE71650E
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 16:50:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3079B20C;
	Tue, 30 May 2023 16:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3079B20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685458248;
	bh=j/IwbDRaepMrMOQFT9B9+fFUql09Bl+xwSEhRUNGtkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ep3XV0iNEIeJO0yCnXxmkjN/oah7T9sZMyvzSAl9IKQnNUkxOhpZTschJ/d0c9bKp
	 SEWL6bF+Y/SqAVv0UIiB7RBGuVusAn0zErS64DDKUXvDsz/a532Q1C5fsSA5A/e69Z
	 AesXpEGiBtqQ53JmdPpCivdKD5drk+ksyPU0rAqE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D4BFF80149; Tue, 30 May 2023 16:49:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E3A8F80544;
	Tue, 30 May 2023 16:49:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77D8AF804FC; Tue, 30 May 2023 16:49:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0750BF8026A
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 16:49:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0750BF8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cYj/0Udv
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-96fbe7fbdd4so838603866b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 30 May 2023 07:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685458142; x=1688050142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sC1DLYYtBIULk7ShCQFp6sqNI5K0yrBz0U0PM92RpVI=;
        b=cYj/0UdvnrYRxLWE30Pag0dMjBlnkPhq9SfEVLhSh0h7wesZCsN7ZQbFx9LGd0w0o6
         p/1LFcwMRXMEa89KQvnwZokxdlcPl1Q6M5yAc7YujbUYgQ+x1MrzbImjdinSrwy2+AC2
         Odd/VANoBeApcDTBI50o53gAvId28G2cGWCrdZcual2NYoPCgjUgOD3Zi/HCVDNkJF3e
         fC4YwBfzsEOmebe+lJL+K0fUTmIILgzkJdJ+9zQAivS7vBtvmSy5iDWTeVZUT3qxMhsI
         ikFqfe7TYZpvhPUiLdoS3ycpGKRL3nP0wOHGf2c76lHh2YHavqCNPWaeAEPAv4Klr0Nb
         DG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685458142; x=1688050142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sC1DLYYtBIULk7ShCQFp6sqNI5K0yrBz0U0PM92RpVI=;
        b=I9ntq5KWbV34Bq/+Dw8mmzBf9bGSfFYTqjtnn98xo0pmQuk0bWmOmJ4nOV0rtOVGgi
         kGcLY/9FN/mVzEwLOF4z/rzwMjdmuzZVhmjE+CVn1fcebn21BayJRqZPFtmAYXS3eFlJ
         S+BBM2mtrKXF0UgX2C2vt23Iq/sKsfpjaC64tv4T5q8AFX+ljDYMCyq/tToUHi+fNs11
         PmIZxbiY1Zp4tYdkys1sLqfaC5zCsDhc4V8Q8GMABUyrzIRXXpHBMXnBfnPNzXjBCQah
         7luK+ecqlbczcwx5GTqyTcV0JLpX+RL09cKbzMtH17KMImajHpKa7dakPcbb0T96K9uO
         Saxg==
X-Gm-Message-State: AC+VfDy/9JU+87BaRx+LyrKQ0HUicPUWEwq1Cd8LWTf97SoBiqKhx9b+
	KSDckKivE7jVdYO0mXSQobUbBw==
X-Google-Smtp-Source: 
 ACHHUZ5ekV/qA/jutZ5TY0nfdJ3IfVJCe2ml8+qjE57PgMROisWg3g5xJPBlz+bFlKz96buQX6Bymg==
X-Received: by 2002:a17:906:9b88:b0:970:925:6563 with SMTP id
 dd8-20020a1709069b8800b0097009256563mr2507516ejc.8.1685458142210;
        Tue, 30 May 2023 07:49:02 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id
 q21-20020aa7cc15000000b00514b2717ec6sm631283edt.28.2023.05.30.07.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:49:01 -0700 (PDT)
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
Subject: [PATCH 2/7] dt-bindings: pwm: restrict node name suffixes
Date: Tue, 30 May 2023 16:48:46 +0200
Message-Id: <20230530144851.92059-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I2QIBAO42IJDQK53JW5IX37IGLGHK4ZK
X-Message-ID-Hash: I2QIBAO42IJDQK53JW5IX37IGLGHK4ZK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I2QIBAO42IJDQK53JW5IX37IGLGHK4ZK/>
List-Archive: <>
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
 Documentation/devicetree/bindings/pwm/pwm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm.yaml b/Documentation/devicetree/bindings/pwm/pwm.yaml
index 3c01f85029e5..abd9fa873354 100644
--- a/Documentation/devicetree/bindings/pwm/pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm.yaml
@@ -13,7 +13,7 @@ select: false
 
 properties:
   $nodename:
-    pattern: "^pwm(@.*|-[0-9a-f])*$"
+    pattern: "^pwm(@.*|-([0-9]|[1-9][0-9]+))?$"
 
   "#pwm-cells":
     description:
-- 
2.34.1


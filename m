Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A2671651E
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 16:51:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA4E8851;
	Tue, 30 May 2023 16:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA4E8851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685458313;
	bh=qjj6m+lC16duLp3hPHppC5au/qGJoHgh/gs//9VcMX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ARXzJBx4DoezKRWd9FototXwy/4IOHQ6u7qSkgccICzG0AjerW381Rmw3aKmNoqHM
	 TOTgUIFLRwcArpKq904CkfDy9wUyrwaqlPE8E35xN7C8AbtVTZ5kr0W7iqrJHMwiFz
	 tVxUkt6hL3insodXOozN+WOyUdieB8FLpNIQXSgc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05B27F805C7; Tue, 30 May 2023 16:49:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E3CAF805BE;
	Tue, 30 May 2023 16:49:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C814F805AA; Tue, 30 May 2023 16:49:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05BDDF805AA
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 16:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05BDDF805AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TwckJzmI
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51496f57e59so4008264a12.2
        for <alsa-devel@alsa-project.org>;
 Tue, 30 May 2023 07:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685458153; x=1688050153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8G0c0mpPhFQo7i+RrdSfLHYDtYE35R5vJ/b+M/gxuM=;
        b=TwckJzmIHLNkTEHE3PeH0rFIRq6IgHs6ns9hHaVT+YPvGvMq0zVOCf9i3GguI1d4gZ
         ++87FyS17cHjFpyYYP11L6B1mQU4Qo74fZSooFervsiBR+0ar8BkWpaVXwtpZJ22dllW
         F4As95G3fMbOJoMJg6N8HhzdnsqtbXz5JGTeY2R8J4hUP1ovNUrwdSrIKFEDFkBMxgWS
         VOOZWJYhhEWYhR9zQGpR4NKq5NMj69QmgmJqj/PlGAuQQv3USs+CB94ozMps71kYZ+cw
         UxnmmPyVuSIi0a0b5aN2HgHzEreZKBY9iaovEdyc1IzjG70Ypp+EX32+456crShhdma/
         B9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685458153; x=1688050153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8G0c0mpPhFQo7i+RrdSfLHYDtYE35R5vJ/b+M/gxuM=;
        b=iIoMB+cyYNU2wtJXm1MVhXng8epGZSsgAJGAGfOm47tmXQ4cq8Bv24TqEy1g3W1q+s
         PzZOG1cWuFWKwMjNvfak6aNv9WStLAP1uxNe8AccvXEhku/vIsHupeVByzppnKdweHE3
         WBB95dx76cJnSjPhwClEBKZh2bHHnLSpQAPZlp5yvdKSbBBUM6Au0bf9kmOWF1lebr5e
         RnAOvhFEPlamSNw0+NOtQLtv8NgwAIY331eG2ovd00RZ8M+Z643FCx9GzLfQ2nuViWwD
         OSL22LciLUXb2Wbv2GbIdIVjPMBJMGjbv+slrMAQKlWnayWVNim4ghm283fba+cPWkaR
         XUxw==
X-Gm-Message-State: AC+VfDwirf+7UYf3B9+PMke7cjYLTRd2zLPEZJAn80X+KuNGGzFlHwa5
	LY0gkUUgv6k6PsDK+zhJ5zAsPw==
X-Google-Smtp-Source: 
 ACHHUZ4bhaXhOGjXcCnROMILTcaXL9g90bzH/pnqZRsukzbQfT55KK4gcDyEoP7X+Mzn6P4JbZvAeA==
X-Received: by 2002:aa7:c59a:0:b0:514:9319:ebff with SMTP id
 g26-20020aa7c59a000000b005149319ebffmr1869786edq.24.1685458153812;
        Tue, 30 May 2023 07:49:13 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id
 q21-20020aa7cc15000000b00514b2717ec6sm631283edt.28.2023.05.30.07.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:49:13 -0700 (PDT)
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
Subject: [PATCH 6/7] dt-bindings: timestamp: restrict node name suffixes
Date: Tue, 30 May 2023 16:48:50 +0200
Message-Id: <20230530144851.92059-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 44VBQNLEDNWP24MPYPL72NL7HTHOZ3TL
X-Message-ID-Hash: 44VBQNLEDNWP24MPYPL72NL7HTHOZ3TL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/44VBQNLEDNWP24MPYPL72NL7HTHOZ3TL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Make the pattern matching node names a bit stricter to improve DTS
consistency.  The pattern is restricted to -N suffixes to decimal
numbers.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Tony Lindgren <tony@atomide.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../bindings/timestamp/hardware-timestamps-common.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timestamp/hardware-timestamps-common.yaml b/Documentation/devicetree/bindings/timestamp/hardware-timestamps-common.yaml
index fd6a7b51f571..95f42acd0c54 100644
--- a/Documentation/devicetree/bindings/timestamp/hardware-timestamps-common.yaml
+++ b/Documentation/devicetree/bindings/timestamp/hardware-timestamps-common.yaml
@@ -17,7 +17,7 @@ description:
 
 properties:
   $nodename:
-    pattern: "^timestamp(@.*|-[0-9a-f])?$"
+    pattern: "^timestamp(@.*|-([0-9]|[1-9][0-9]+))?$"
 
   "#timestamp-cells":
     description:
-- 
2.34.1


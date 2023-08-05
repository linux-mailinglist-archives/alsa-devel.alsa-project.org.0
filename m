Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 326627739A4
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 12:37:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BC9B1DA;
	Tue,  8 Aug 2023 12:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BC9B1DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691491059;
	bh=6HRC0XlQPnRXwRjQgG4MtK5y6OnWUwRDwCc8sYV5Mjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f9U6wO+OOhDYGZhPjzalb+Licbd4MdDxG5S1OIXOOBakQMYb0Lgx6mHG3SJvbBa0i
	 H3Ki75rMMmTgHFDJAPZdJhQSBWUx7X9459sYIA3MS8WkiNa95kJBzm8cjXYmG8stKX
	 FKsAtKR/XOf9AKA6yMrdm9gniEVv+CJCHoGWgPHQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A25BAF805A8; Tue,  8 Aug 2023 12:35:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE180F80588;
	Tue,  8 Aug 2023 12:35:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB588F80425; Sat,  5 Aug 2023 20:05:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56BCAF801D5
	for <alsa-devel@alsa-project.org>; Sat,  5 Aug 2023 20:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56BCAF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=JXaio9I8
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fe12820bffso28443445e9.3
        for <alsa-devel@alsa-project.org>;
 Sat, 05 Aug 2023 11:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691258745; x=1691863545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ui9mFi+8YpeTm0k09SoqGWMWxqwLX8g/SM0GMtVVuxo=;
        b=JXaio9I8DD4b5kA/e3J4i8BugFtaIhTeAsqI8YpbFje4l002vWoSJ8cMKU0hUZuEmx
         lJAOUXG/CbuqOiK9JDZTQ473fZqnNUUQRQZYrGhXaFfFddAtxYbXuvYdP4MUOkxQVpCG
         6k6GEhMUUMZw+XmGLr874mRvlbYTfED9V1LBPWg0EqkDvmmI9ce4MBY+N6pZa1lcQNdU
         tR4H3XCjWUe/PW7LQiz97Swp4uEEos7FS9Z7u18Zjm1kVlHGpx/tx/NPI5jN2g5bkxQz
         hbiHrAB7ihoLl3P2ybOtQlJLx4Ha62sof5/RxtfZL1sivlBqdiis7qyRd3rRo0eCwJD4
         gekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691258745; x=1691863545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ui9mFi+8YpeTm0k09SoqGWMWxqwLX8g/SM0GMtVVuxo=;
        b=P3Rp8MFl1D+gKolJ1euid0CTI4zQ1RXlOHMEa//y/KJI+U9/H4AIJJyhPWji7lqoi4
         ye7VgQq9oeoUqIBJD+Fpv74HZFff40asySy1lGSJH/Tq6JyY9aEtbFEvJnz4CvelduTJ
         bjQTG1ib1yX40sLHQ9TfsehGlZz4tLcvIXgFjwlsfKZ2k554tYGHX9MIVqL/Nz4ws9WG
         08/iqz07cHQXAXXFDcTDJWWExyknNKsLHXDE5c9vpIQeyYQb+Q2a1QQEuJnUm6a4K5Ri
         rknOMG/8B5VyKXo2kUwyo/RVgfy4yND3kJlfsI9Y5s7DzRoKhSqyRjpLZVUqyAso0HJA
         +2RA==
X-Gm-Message-State: AOJu0Yzl5wkOlyZqPdT32OyJ5mi0iDJEh+Bq8S8n8axFw2B0jMnTpF09
	hiIDNvgtbDs/zpZ6iMl5Btw=
X-Google-Smtp-Source: 
 AGHT+IH52KbShgZ7/MyYYljmA/7meZEjQcL6qqHPDeWo7emmXLPpHbnsfG22wPwvuhUIyNpA/ptA7Q==
X-Received: by 2002:a5d:4b43:0:b0:317:5d3d:d37c with SMTP id
 w3-20020a5d4b43000000b003175d3dd37cmr2878909wrs.24.1691258744489;
        Sat, 05 Aug 2023 11:05:44 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id
 v4-20020a5d6104000000b003176aa612b1sm5710402wrt.38.2023.08.05.11.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 11:05:44 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Ripard <mripard@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 2/5] ASoC: dt-bindings: Add schema for
 "allwinner,sun20i-d1-codec-analog"
Date: Sat,  5 Aug 2023 21:05:02 +0300
Message-Id: <20230805180506.718364-3-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805180506.718364-1-bigunclemax@gmail.com>
References: <20230805180506.718364-1-bigunclemax@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: bigunclemax@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WQYU4MFJWZKHDWHDFDDUPMIDZDKKP4ZZ
X-Message-ID-Hash: WQYU4MFJWZKHDWHDFDDUPMIDZDKKP4ZZ
X-Mailman-Approved-At: Tue, 08 Aug 2023 10:35:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WQYU4MFJWZKHDWHDFDDUPMIDZDKKP4ZZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a DT schema to describe the analog part of the Allwinner D1/T113s
internal audio codec.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../allwinner,sun20i-d1-codec-analog.yaml     | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml
new file mode 100644
index 000000000000..7586076b9bc5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun20i-d1-codec-analog.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/allwinner,sun20i-d1-codec-analog.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1 Analog Codec
+
+maintainers:
+  - Maksim Kiselev <bigunclemax@gmail.com>
+
+properties:
+  compatible:
+    const: allwinner,sun20i-d1-codec-analog
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    codec_analog: codec-analog@2030300 {
+        compatible = "allwinner,sun20i-d1-codec-analog";
+        reg = <0x02030300 0xd00>;
+    };
+
+...
+
-- 
2.39.2


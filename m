Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E9369E7AA
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 19:38:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB515E78;
	Tue, 21 Feb 2023 19:37:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB515E78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677004719;
	bh=kw0eJBtFflPMOZ5eXw7a7Vt+p5z/Me3U6GNpJy7edXM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X48zS1rHp+ApVc1Cibh5t48q5ZOn/7jXd0m40Yzkk+ttJycdD+dDOr2V6zKdjqlxb
	 iWsnuF2ScuUYf6l8Y8l7VmDcGbMHgYNPMcSjAZ7Ibs7TPE0Bpf8jNziDx3AJ21F+bK
	 BVrN22H/TcYVyLsNrvSTvV78ZVuwAXVvG/s0gPIw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 336C1F8052D;
	Tue, 21 Feb 2023 19:36:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65F55F8053B; Tue, 21 Feb 2023 19:32:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F305F804B0
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 19:32:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F305F804B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aY7iZeMy
Received: by mail-ed1-x535.google.com with SMTP id g1so20751769edz.7
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Feb 2023 10:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7LUck7NKntyvJrTtA9Mcdll1GuNCKTVdIZE+EmCgf0=;
        b=aY7iZeMyl0Yy8TJGNzIOWQT4yV4aIZcrA3QtuCr/sgIo+n/gxDCoTdT9Spqa1B+tu8
         /dJfWEwQ8nRKNBY8rRsKdfrHGSQzyCwfP6ZSshom4XAj+TMDHalSV1W9TTZQHMcGdGCe
         eWc0zIx+9X6n+te+u0x5OogQyDQcuHXiOWhLH1qR0H8+5rk+1J5lwTSslKQed70+2oUv
         LtxzXfOGmlkPMkzy5mR8E4tYbnF3VlfYWTUPidZu7xM8P5wSWX6ODOQ9S0z8/zB9dw8Q
         npin8zoTuVWLndrSehCYNM0jkKFHaKlOHfDeQghz1wksvpNKfl3AYwwzGfrXxUt70g8h
         5rlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7LUck7NKntyvJrTtA9Mcdll1GuNCKTVdIZE+EmCgf0=;
        b=rexrBFdWG4l3g7gfXRhm1bF5rDTQUJI3v+OIeYAuSRHz2n8emW6TfEc2zb7682Nbpq
         hXPaSXcGxsX9v3Bm4gPyadq61dqrgCi7LcutZFUdu2M9b2aDlgR8nujOagaVxrFG+dCj
         Bk6GnRnCbE/ix6z6EVYjcsbyLzoxh1en1OHe0kEOq8dX49IByRMWSTvoc1s7/5nwL2nX
         ygSRQIIKaVUkTVVqc0SVkt7zEstUBrt2vh6BA20U3vBEZeCJqJVfQEWYR7UPmNK77IyN
         hRmDsy4CXx4rn4B/u8lOdBxkspvBve6XkMHJ83m4yrx38eAtSxDqr65Fc4dyA49c9VNC
         Opew==
X-Gm-Message-State: AO0yUKXhTG1TxaKq792gNuFzxuhvb6+7A0b0h9GwArJeqzLfiGswWBzr
	PuYc+BtkFSacPZPkC79qYMQ=
X-Google-Smtp-Source: 
 AK7set9Sdi1je3qVvo0qJXZlUkQyErQ4YoQjaz7cj/on0XVdGldV/BpKlkhyI10FlvJ9jEcLz1Kylg==
X-Received: by 2002:a05:6402:31fb:b0:4ac:d2bc:32f9 with SMTP id
 dy27-20020a05640231fb00b004acd2bc32f9mr5753304edb.4.1677004352701;
        Tue, 21 Feb 2023 10:32:32 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a50c3c3000000b004af5aa16fcasm169102edf.66.2023.02.21.10.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:32:32 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 08/10] dt-bindings: dsp: add Fortemedia FM34 DSP
Date: Tue, 21 Feb 2023 20:32:09 +0200
Message-Id: <20230221183211.21964-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230221183211.21964-1-clamor95@gmail.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JZWITEEYRCNPYISB36X32NGIF46MVH3J
X-Message-ID-Hash: JZWITEEYRCNPYISB36X32NGIF46MVH3J
X-Mailman-Approved-At: Tue, 21 Feb 2023 18:36:36 +0000
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZWITEEYRCNPYISB36X32NGIF46MVH3J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add dt-binding for Fortemedia FM34NE DSP.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/dsp/fortemedia,dsp.yaml          | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dsp/fortemedia,dsp.yaml

diff --git a/Documentation/devicetree/bindings/dsp/fortemedia,dsp.yaml b/Documentation/devicetree/bindings/dsp/fortemedia,dsp.yaml
new file mode 100644
index 000000000000..78f30969d9bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/dsp/fortemedia,dsp.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dsp/fortemedia,dsp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Fortemedia DSP core
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description: |
+  Asus Transformer T20/T30 tablet family contains a DSP core
+  used for advanced noise cancellation.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - asus,tf101-dsp
+          - asus,tf201-dsp
+          - asus,tf300t-dsp
+          - asus,tf700t-dsp
+          - pegatron,chagall-dsp
+
+      - const: fortemedia,fm34
+
+  reg:
+    maxItems: 1
+
+  bypass-gpios:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-supply: true
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: mclk
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-parents:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra30-car.h>
+    #include <dt-bindings/soc/tegra-pmc.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dsp@60 {
+            compatible = "asus,tf201-dsp", "fortemedia,fm34";
+            reg = <0x60>;
+
+            bypass-gpios = <&gpio 222 0>;
+            reset-gpios = <&gpio 115 1>;
+
+            vdd-supply = <&vdd_1v8_dsp>;
+
+            clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+            clock-names = "mclk";
+
+            assigned-clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+            assigned-clock-parents = <&tegra_car TEGRA30_CLK_EXTERN1>;
+        };
+    };
+
+    vdd_1v8_dsp: regulator-dsp {
+        compatible = "regulator-fixed";
+        regulator-name = "vdd_1v8_dsp";
+        regulator-min-microvolt = <1800000>;
+        regulator-max-microvolt = <1800000>;
+        gpio = <&gpio 165 0>;
+        enable-active-high;
+    };
-- 
2.37.2


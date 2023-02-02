Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8946886C0
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 19:39:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74B47ECD;
	Thu,  2 Feb 2023 19:38:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74B47ECD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675363157;
	bh=UejLPaoKYCRvJ51W6iWmn45OlArgnITusSv92XIVh78=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UryWa7r82xDAZlv+sRw+wB2y0EA/SfVqXxGuEMgHMw2ABBxkHq4KJWmNUMTqwPaT+
	 7X/JjtwncsLggFzBiP+sGFkgzWxm+9EpFFiolTLflQEcwJI6kjyWodLOrtVj8/FvyQ
	 YBHDTkLdjBZWQwWQIXE3NDpa9tUnq6gUCYt2s11U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69290F800ED;
	Thu,  2 Feb 2023 19:37:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8F01F80553; Thu,  2 Feb 2023 19:37:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42972F800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 19:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42972F800ED
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=T35BJJth
Received: by mail-wr1-x433.google.com with SMTP id a2so2281069wrd.6
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 10:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=it81YP95JIRPJswh/FgK8dhTohEGTS21tUAjm96BPMQ=;
 b=T35BJJthNSXWGuipJ/S57/Vin4LoRONI1yOJ2iw8a6ampM/SH/alQlaM3pwJXbfIto
 rhB/lH9b1SfkOR19HeWTkVB7VSSsTJgHyiavcYsEoM/cXzmWt6zg2rxDTIV6fKG7uY6C
 R59zbQQItYpdbiiKXP3AQ7Vsyoc4Swh2MVx05ksPml3KYRaXwgZdpVxGAzQzbmS6ZsUk
 hFKqBE/i/V1NnVVjwq0cZN7FQRbfbNj0VLT9zzJo0vI2vf1zI2ghqgOOttCZZN4+N/qR
 OJNFfbUx3uQyls1lZ4AVo++FolCmlr1lg3WtFc0TRW0TSRpiuvX8jLi/jVecCpg+wtgK
 voEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=it81YP95JIRPJswh/FgK8dhTohEGTS21tUAjm96BPMQ=;
 b=3HI/zVpawhY3t6Yud/QuKmLjm85yJ4OQ/bo6O1SXgrvFLS/jhQM39hkv0FlrAcdAQC
 QO80crRUGgSOkb65mG1g0ira8qGF1xcN71y0XOL3EBpTWtYB6e92xYvt03YiFYDnC/qr
 vzSc6K1ib85xvSJ3myS1FD2RxvVbSuaq//Okveoz73hlfIQSFg4o9fTa5H2tpxpumVaa
 s8ShxiGe1RRtBzv5Xz2ErEJL5UC7rukLda2TceJxlI2pgD6dsFiYkKvCKVC96OE12aja
 lo3sRUhL34T7Irk2/QiFG9MS1PF7lTn1gfIcKDVPamf+Ei0Yo1A6f663LD9FgXv5fWwz
 htdA==
X-Gm-Message-State: AO0yUKWh+wOdt3prbmddbj5a/8vRTFVQh7PFsE7IByVZbg+zPQZtbMEk
 AFglP/uu4YsWOIx9vfuZe26dHA==
X-Google-Smtp-Source: AK7set9UbIruMnv6kKNSa19q5j5yp9TO2ovfLKQ/UNar58Gc9j9V2Mg4N6Ph1JnAFCA//MyCXwBx+Q==
X-Received: by 2002:a05:6000:1285:b0:2bf:b036:ffe3 with SMTP id
 f5-20020a056000128500b002bfb036ffe3mr6707490wrx.45.1675363047162; 
 Thu, 02 Feb 2023 10:37:27 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74]) by smtp.googlemail.com with ESMTPSA id
 p12-20020a5d48cc000000b00241fab5a296sm164664wrs.40.2023.02.02.10.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 10:37:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
Subject: [PATCH 1/9] ASoC: dt-bindings: create component common schema
Date: Thu,  2 Feb 2023 19:36:45 +0100
Message-Id: <20230202183653.486216-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230202183653.486216-1-jbrunet@baylibre.com>
References: <20230202183653.486216-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

All DAIs are component but not all components are DAI.
Move the component properties (sound-name-prefix ATM) to a separate schema
file so it can be used by non-DAI components, such as auxiliary devices.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/component-common.yaml      | 21 +++++++++++++++++++
 .../devicetree/bindings/sound/dai-common.yaml | 11 +++-------
 2 files changed, 24 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/component-common.yaml

diff --git a/Documentation/devicetree/bindings/sound/component-common.yaml b/Documentation/devicetree/bindings/sound/component-common.yaml
new file mode 100644
index 000000000000..37766c5f3974
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/component-common.yaml
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/component-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio Component Common Properties
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  sound-name-prefix:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      Card implementing the routing property define the connection between
+      audio components as list of string pair. Component using the same
+      sink/source names may use this property to prepend the name of their
+      sinks/sources with the provided string.
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/sound/dai-common.yaml b/Documentation/devicetree/bindings/sound/dai-common.yaml
index d858eea73ed7..1aed2f0f1775 100644
--- a/Documentation/devicetree/bindings/sound/dai-common.yaml
+++ b/Documentation/devicetree/bindings/sound/dai-common.yaml
@@ -9,15 +9,10 @@ title: Digital Audio Interface Common Properties
 maintainers:
   - Jerome Brunet <jbrunet@baylibre.com>
 
-properties:
-  sound-name-prefix:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: |
-      Card implementing the routing property define the connection between
-      audio components as list of string pair. Component using the same
-      sink/source names may use this property to prepend the name of their
-      sinks/sources with the provided string.
+allOf:
+  - $ref: component-common.yaml#
 
+properties:
   '#sound-dai-cells': true
 
 additionalProperties: true
-- 
2.39.0

